# Invisible chigoe / client crash — 2026-09-13

## Captured evidence

The supplied Map Server excerpt and Forestall Windower's local logs identify
public placement `chigoe_150_2` (BNPC profile 1005, placement 45), runtime actor
`0x44B00032` / `1152385074`, in zone 150. No placement or database change is needed.

Sources inspected:

- Supplied `pasted-text.txt` attachment `157be915-a20f-4a0b-8944-b27802303b8b`.
- `C:\Program Files\Forestall Launcher\Windower\Logs\Windower.log`.
- The same directory's `packetlogger.csv` and `npcrange.csv`.
- `Windower\Crashes\ffxivgame-crash-20260913-105736-735-pid-63392.txt`,
  `.packets.log`, and `.dmp` under the launcher directory.

The server records this chigoe dying at 10:56:00.477, entering removal grace
at 10:56:19.493, and reporting a nonpermanent removal at 10:56:20.244 with a
60-second respawn delay. It engages the player again at 10:57:37.329. There
is no second recorded death for this actor before disconnection.

Decoded incoming client subpackets show:

| Client capture time (UTC) | Actor | Event |
| --- | --- | --- |
| 14:56:00.6810244 | `0x44B00032` | `0x0134`: DEAD, substate 0 |
| Between that death and respawn | `0x44B00032` | No `0x00CB` RemoveActor or `0x00CA` AddActor |
| 14:57:19.2689998 | `0x44B00032` | `0x0134`: PASSIVE, monster substate 3 |
| 14:57:19.3066692 | `0x44B00032` | `0x0134`: ACTIVE, monster substate 3 |

Movement and battle packets continue for this ID. The native corpse opacity
fade is not reset by treating the retained object as a newly alive server mob.
The other killed chigoes `0x44B00031` and `0x44B00036` also resume passive state
without an intervening removal/construction. `0x44B00036` is later culled and
reconstructed normally. Server and packet-capture timestamps differ slightly;
the packet ordering, rather than millisecond alignment, establishes this gap.

The crash report records a native read access violation at `0x00D0531C` in
`ffxivgame.exe`, at 10:57:36.735 local time. The dump's exception context has
ESI=0; the faulting instruction is `mov eax, [esi]`, following
`mov esi, [esi+8]` in an allocation/free-list traversal. The retained packet
observations compared by Windower have matching before/after lengths and
hashes. These facts establish the native fault and unchanged retained bytes;
they do **not** identify which earlier operation damaged the allocator, nor
prove that the respawn bug caused this crash. No live client reproduction has
yet been performed after the fix.

## Repair

Previously the terminal corpse removal made a single nonblocking Session
delivery attempt and discarded failure. The nearby actor remained in the
Session's instance table, so `ForceRespawn` considered it already constructed.
The `phase=remove` log reports the lifecycle stage, not successful delivery to
each client. The exact reason delivery failed in this capture is unlogged.

Session now remembers pending BNPC removals until their packets are queued.
Terminal cleanup requests removal for every Session in the area that actually
knows that actor, including locked viewers and those beyond its current radius.
Visibility retries the removal, and respawn/battle synchronization queues the
old removal before the replacement construction. Ordinary broadcasts require
the exact constructed actor, with no pending removal. Actor-table resets clear
the pending state.

An independent related defect let an unseen dead BNPC return an empty spawn
list while Session still sent init properties and registered it as known.
Empty construction is now rejected. Already constructed corpses retain their
normal presentation window; terminally faded corpses cannot be reinstantiated.

## Second review

The follow-up review found and repaired two gaps in the initial implementation:

- Once removal succeeded, its pending flag cleared before reconstruction. An
  ordinary state broadcast could then reach a client with no actor. A new
  regression reproduced this (`expected 1, got 2` captured packets). BNPC
  broadcasts now check construction and publish within the same Session and
  transport transaction as removal/reconstruction. Per-client lifetime tokens
  also discard broadcasts that waited across removal and reconstruction of the
  same server object and ID. These tokens are invalidated on removal and reset.
- A pending-removal snapshot originally contained only actor IDs. Another
  delivery path could complete removal and reconstruction before that snapshot
  retried, allowing it to remove the new client actor. Each retry now carries
  the exact outstanding request, actor reference and actor-table generation.
  Superseded requests cannot consume a later removal or retire a replacement.

The broadcast transaction waits for the transport gate rather than dropping
one-shot death states on ordinary contention. Readiness, update locks, viewer
ownership, area and client lifetime are rechecked after acquiring that gate.
The existing transport-before-Session lock order is retained.

## Mixed guildleve / ordinary-mob review

The user confirmed fighting both categories, and the supplied logs independently
record guildleve 12426 moles (`guildleve=12426`, dynamic IDs `0x44B001A4` through
`0x44B001A9`) interleaved with public chigoes (`guildleve=0`). The affected
`chigoe_150_2` remains an ordinary public mob, not a leve objective.

Reassembling incoming TCP data across CSV rows before decoding frames recovers
the complete group trains in the 14:45–14:58 UTC inspection window. Some rows
split a frame at 4,096 bytes; treating rows as complete frames loses packets.
The reassembled window has no invalid frame/subpacket lengths. It shows one
client MonsterParty (`0x8`, type 10002), occupied by the player's party
`0x8000000000000012`. The separate guildleve content group is
`0x2000000000000007` (type 30001), and is not used as the claim owner.
The largest MonsterParty roster has three members. In particular:

| Capture time (UTC) | MonsterParty `0x8` members |
| --- | --- |
| 14:55:33.1239996 | Leve mole `0x44B001A7`, public chigoe `0x44B00036` |
| 14:56:04.0586472 | Public chigoes `0x44B00031`, `0x44B00032`, leve mole `0x44B001A8` |
| 14:56:10.6369189 | Public chigoe `0x44B00032`, leve mole `0x44B001A8` |

These mixed rosters are expected, including retained corpses. There is no
evidence here of competing occupied MonsterParties or roster overflow.
The leve actors receive RemoveActor packets; public chigoe `0x44B00032`
still has no removal/construction between death and respawn after reassembly.

The focused runtime review nevertheless reproduced another cleanup window.
The guildleve teardown loop calls `npc.Despawn()` before `RemoveMember(npc)`.
A living BNPC has already retired its client lifetime at that point, but still
passes the director membership check. The initial corpse-only guard allowed
a stale visibility callback to construct it again. The new regression failed
at `terminal live actor cannot reconstruct before director membership removal`.

Session now rejects every terminally retired BNPC, including living actors
removed by scripts. `ForceRespawn` explicitly reopens the client lifetime
before building a genuine replacement. The old corpse retention and unseen
corpse exclusions remain intact. This closes a reproducible race; the capture
does not prove that this particular window occurred or caused the crash.

## Verification

`Fishing Tests/BattleNpcRespawnTests.cs` runs inside the existing
`--claim-integration-only` fixture and exercises real BNPC/Session packet
builders. It covers unavailable transport, locked updates, retry before and
after respawn, removal before reconstruction, suppression of stale state and
battle packets, duplicate construction, known corpse retention, and unseen
corpse exclusion. The second pass additionally exercises stale retries after
reconstruction and a table reset, a newer pending request with the same ID,
ordinary broadcasts after completed removal, and real loopback-socket transport
contention. It verifies both preserved one-shot states and rejected stale
states after removal/reconstruction. The existing fixture prints expected
missing database/script diagnostics for its synthetic actors; its assertions
complete successfully. The contention integration run passed twice after its
final fixture adjustment.

`Fishing Tests/MixedGuildleveCombatTests.cs` additionally uses a real
`GuildleveDirector` with ordinary mobs, owned leve mobs and an unrelated viewer.
It verifies member-only leve visibility, one shared claim roster, permanent
leve death, failed ordinary-removal retry during the leve, continuing ordinary
combat after leve completion, failed completion removal after an actor leaves
the area, and stale visibility during and after membership cleanup. Completion
uses the existing reward-free GM mode to exercise the common NPC teardown;
reward calculation and the completion warp point are outside this fixture.
The failing terminal-live regression passes after the repair, along with all
five targeted suites below.

Commands:

```powershell
dotnet build 'Fishing Tests/Fishing Tests.csproj' --no-restore -m:1 -nr:false -p:UseSharedCompilation=false
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --claim-integration-only
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --nm-respawn-only
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --claim-presentation-only
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --pudding-elements-only
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --post-landing-ready-only
```

These targeted suites and the build pass. The broader
`--client-crash-regression-only` suite stops at an existing Sirocco SQL text
assertion (`Fishing Tests/Program.cs`, `TestClientCrashRegressionContracts`).
Its regex requires the literal value `4` after `'sirocco'`, while the unchanged
main SQL has `5`. All three SQL files read by that assertion match HEAD; this
repair changes none of them. The broader suite therefore is **not** reported
as passing. Build warnings are the existing cached NuGet vulnerability-feed
lookup failure and obsolete `FormatterServices` use in other fixtures.

Restart the Map Server with the rebuilt binary before the next client test.
