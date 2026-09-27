# September 19 seamless peer crash: forensic findings

Status: peer arrival and duplicate-publication corrections implemented and tested
offline. Live client acceptance remains open. No SQL change is needed.

## Follow-up correction

The captured actor-12 `0x00CE` contains reference `0xFFFFFFFF` and local zoning
flag `1`, although its recipient is actor 1. `Player.GetSpawnPackets` supplied
`this` to `CreateSpawnPositonPacket` instead of `requestPlayer`. After the first
snapshot, the helper therefore emitted another player's appearance as an owned
local zoning arrival. The corrected caller supplies the actual viewer. Peer
publication also no longer consumes the owner's first-arrival flag.

The arrival visibility helper previously reconstructed an already-known peer
when either session had recently rebuilt its view, and forcibly removed then
reconstructed known peers for explicit refreshes. It now leaves a known peer
intact and sends only position/speed/state updates for explicit refreshes. The
known-ID check and publication retain the existing session/transport lock.

Production packet tests exercise the complete player spawn builder with five
arrival selectors, first-owner publication after peer publication, subsequent
owner teleport, and peers seen again after their owner has zoned (18 checks).
A connected local socket fixture exercises the production visibility helper's
recent-rebuild and forced-refresh paths (3 checks). The full seamless suite
passes 2,485 scenarios. The new regression fails against the prior installed
Release DLL; it detects the incorrect peer arrival selector on first publication.
Teleport event handoff, staged readiness, company warp callback and private-scene
retirement regressions also pass. Native rendering still requires a client retest.

The second pasted log starts during destination publication, after teleport-offer
admission. It cannot explain the screenshot's party-teleport rejection by itself.
The offer checks area/range, party identity, zoning, passive state, enmity and
destination attunement independently of visible actor bookkeeping. Rejections
now log those predicates under `PartyTeleportOffer`; eligibility is unchanged.
Do not claim that warning is proven to share the crash's cause.

## Correlated evidence

All times below are local EDT on September 19, 2026.

| Time | Evidence |
| --- | --- |
| 13:48:33.755 | Server saves Anzyr Rehmav (actor 12) crossing zone 155 to 206. |
| 13:48:34.969 | Server saves Illusive Fizz (actor 1) crossing to 206. |
| 13:48:43.1627975 | Illusive's client receives actor 12 construction, including AddActor `0x00CA`, appearance, SetActorName `0x013D` containing `Anzyr Rehmav`, script binding and initialization. |
| 13:48:43.1764547 | Further actor 12 initialization arrives. |
| 13:48:43.2110444 | Forestall records native access violation at `0x00401290`. |
| 13:48:47.383 | Server saves Illusive's cleanup in zone 206. |
| 13:48:51.422 | Anzyr crosses back to 155 and remains connected. |

The packet snapshot was parsed as a byte stream: concatenate client-delivered
socket chunks, read the base length at offset 4, then walk subpackets from
offset 16 using their lengths. All retained delivered bytes were consumed with
no partial trailing packet. Socket chunks are not individual protocol packets.
No actor-12 remove packet occurs in that retained interval, which starts at
13:48:35.860; earlier construction/removal history is outside the snapshot.
The trace therefore does not prove a duplicate construction or identify an
earlier removal. The last packet breadcrumb alone does not identify the cause.

## Native fault

The matching WER exception context gives EIP `0x00401290`, ESP `0x0362DEB0`,
exception `0xC0000005`, write address zero. The mapped executable instruction
at that address is `mov dword ptr [0], 0`: a deliberate fatal-handler fault,
rather than an arbitrary pointer dereference at the reported instruction.

The stack contains return addresses `0x009D365F`, `0x0075B569`,
`0x00744F6E`, and `0x00771E66`. Verified disassembly shows:

- `0x00744F69` calls `0x0075B540` with an actor-ID argument whose captured value
  is 12.
- `0x0075B549` looks up that actor through `0x004D9970`.
- For a non-null result, the function selects the interface at actor offset
  `+0xBA0` and calls its virtual slot `+4` at `0x0075B567`.
- The stack reaches the fatal-handler callback through `0x009D364D`.
- The passed string object points to captured text `Anzyr Rehmav`.

Together with the delivered `0x013D` payload approximately 48 milliseconds
before the fault, this localizes the failure to native peer name processing
during Anzyr's construction/restoration. An invalid or incompletely initialized
actor interface/lifetime is the leading interpretation. The trace does not
recover the exact allocation/destruction history or prove which server action
first put that interface in the wrong state. Do not call this a confirmed
weather crash, malformed-name encoding, or a proven server concurrency race.

## Server lag and source inspection

The pasted log separately records widespread zone update overruns, including
a scheduler maximum of 656.94 ms against a 50 ms budget. Transport queues are
mostly empty and drain between samples; this is not evidence of an unbounded
outgoing packet backlog. The stalls can explain lag, but do not independently
explain the fatal peer-interface call.

The seamless handoff already defers missing-actor removals for two seconds.
Session construction serializes the actor spawn train and known-ID insertion.
The peer-arrival helper also has a separate construction path, and its
recent-view-rebuild branch can resend a known actor without explicit removal.
That is an audit lead, not established causation for this capture: the retained
log has no VisibilitySync line attributing the 13:48:43 spawn to that helper.
Changing global delays or forcing peer deletion/recreation is not justified by
this evidence alone.

Next implementation work should reproduce and instrument peer membership,
visibility removal/construction and transport admission across this 155/206
handoff, including both players crossing close together. Preserve the first
construction/removal history so the earlier lifetime can be correlated with
the native fault. No fix or successful client retest is claimed here.

## Local inputs

- User server-log attachment:
  `C:/Users/drime/.codex/attachments/0bcef4fa-f598-40b0-b278-bb7d0139b1e0/Pasted text.txt`.
- Forestall report and packet snapshot:
  `C:/Program Files/Forestall Launcher/Windower/Crashes/ffxivgame-crash-20260919-134843-211-pid-74824.txt`
  and its adjacent `.packets.log`.
- WER dump:
  `C:/Users/drime/AppData/Local/CrashDumps/ffxivgame.exe.74824.dmp`.
  SHA-256 `B58B2C7DA133F35F02A3AC07C9FFC538D59C78C8000A29357557C3D18B810F41`.
- Existing mapped executable `.tmp/ffxivgame-ifrit.exe`, inspected using
  `tools/disassemble_pe_window.py`. These observations do not assert a full
  byte comparison against the live executable.

Raw dumps and packet snapshots contain process/player data and remain outside
the repository. Windows Application events 1000/1001 independently match this
process, fault offset and time.
