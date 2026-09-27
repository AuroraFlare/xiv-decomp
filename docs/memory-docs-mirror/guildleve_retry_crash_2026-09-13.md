# Guildleve retry crash: echoed group acknowledgment

## Finding

The 11:58 client exit after reconnecting and retrying guildleve 12425 exposes a
World Server routing fault, separate from the initial widget ordering correction.
For a Map-owned group, `PacketProcessor.InterceptProcess` both forwarded the
client's group-created acknowledgment to Map and queued the same subpacket back
to the client. Opcode `0x0133` has different meanings in the two directions:

| Direction | Body |
| --- | --- |
| Client to server | 8-byte group ID and 32-byte `/_init` selector |
| Server to client | GenericData: a serialized Lua-data stream |

The retry allocated group `0x2000000000000009`. Echoing its acknowledgment puts
`09` at the start of the native Lua-data decoder's input. Token 9 requires an
existing decoded operand/root; the raw acknowledgment has none. The native
invalid-parameter failure and surviving decoded values match that input.

This is allocation-dependent, not limited to reconnects. The earlier 10:30:32
startup exit also reports `0xC000000D` and the server log allocated the same group
ID. That earlier exit has no equivalent inspected dump here, so its cause remains
correlated rather than independently established. The 10:57 access violation
discussed in `chigoe_respawn_crash_2026-09-13.md` is a different failure.

## Local evidence

- Server log attachment: `1211c1c2-ef39-45fe-b8d9-6c8ddf6925c5/pasted-text.txt`.
  It shows orderly exit, login, leve 12425 retry and group allocation, followed by
  client disconnect. The new initial-widget publisher was already in use.
- `C:\Program Files\Forestall Launcher\Windower\Logs\packetlogger.csv`, row
  248297 in the inspected capture: `2026-09-13T15:58:37.4333276Z`, incoming,
  88 bytes, opcode `0x0133`. The 40-byte body is group ID
  `09 00 00 00 00 00 00 20`, followed by ASCII `/_init` and zero padding.
  It matches the acknowledgment in the preceding outbound batch.
- `Windower\Crashes\ffxivgame-exit-20260913-115840-840-pid-77672.txt`:
  exit `0xC000000D` at 11:58:40.840 local time. The last completed Windower
  breadcrumb (`0x017A`) alone does not identify the failing native decoder.
- Windows captured a dump even though the injected handler did not:
  `C:\Users\drime\AppData\Local\CrashDumps\ffxivgame.exe.77672.dmp`.
  Exception thread 74216, instruction pointer `0x009D22C0`.

Native addresses below refer to the installed x86 `ffxivgame.exe`, image base
`0x00400000`, PE timestamp `0x504F671F`, SHA-256
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
They were checked using `minidump`, `pefile`, and
`tools/disassemble_pe_window.py`, with receiver identities cross-referenced to
the local `meteor-decomp-0.1.4/docs/event_user_data_receiver_decomp.md` notes.

| Dump / code evidence | Interpretation |
| --- | --- |
| Stack returns `0x00759EA2`, `0x008A02D1`, `0x00790A7C`, `0x007908D9`, `0x007926A0` | LuaActorImpl UserData receive, UserDataReceiver, decode driver, token-9 callback, invalid-parameter call |
| Decoder dispatch table `0x007909E0`, index `9 + 1`, targets `0x007908A9` | Token 9 reads 16 bytes and invokes visitor slot `+0x1C` |
| Visitor at `0x001AD428` has zero fields `+0x10`, `+0x14`, `+0x18` | No decoded operand/root exists |
| `0x00792648` checks `this+0x10`; null branches to `0x0079269B`, which calls `0x009D22B4` | This is the abort path present in the dump |
| Receiver input starts `0x0F1E3644`; reader is `0x0F1E3655` with `0xAF` bytes left | Exactly 17 bytes consumed: token plus its 16-byte value |
| Decoded value at `0x001AD37C`: dwords `2F200000 00000000 74000000 5F696E69` | Matches the two big-endian values read from the group ID tail and `/_init` bytes |

The receiver constructs a `0xC0`-byte buffer, whereas the echoed request body is
only `0x28` bytes. Its source heap page is absent from the dump, so a complete
input-body comparison comes from the packet capture, not a recovered dump buffer.

## Fix and validation

Remove the client echo in World Server. The existing fallthrough forwards the
acknowledgment to Map, whose group initializer sends the proper `0x017A` work
response. Known World groups still initialize locally and consume the request.
No widget start or party-size behavior changes in this fix.

`tools/world-party-tests/GroupCreatedRoutingTests.cs` exercises the compiled
production routing through connected loopback sockets. The exact failing group
ID is tested for one and eight players, with replacement authenticated sessions
for every player. Each request reaches Map once with its original body and
queues no response to the client. A World party acknowledgment still produces
one `0x017A` response and is not forwarded. Session teardown has separate
character-session tests; these cases specifically cover routing after replacement.

Before the fix, the test fails with `client must receive no echoed acknowledgment:
expected 0, got 1`. After the fix, both the routing cases and the existing World
party retention tests pass. World Server builds with zero errors; existing
framework-reference and analyzer warnings remain.

Reproduction commands from the repository root (PowerShell):

```powershell
dotnet build 'World Server/World Server.csproj' --no-restore -m:1 -p:NuGetAudit=false -o .tmp/guildleve-retry-world-build
$routingBuild = Join-Path (Get-Location) '.tmp/guildleve-retry-world-build'
dotnet run --project tools/world-party-tests --no-restore -p:WorldAssemblyDirectory="$routingBuild" -p:CommonAssemblyDirectory="$routingBuild" -p:NuGetAudit=false
```

Deployment requires rebuilding/restarting **World Server**. A Map-only rebuild
does not change this route. A live reconnect-and-retry client test remains needed
after deployment; automated packet tests do not verify live widget rendering.
