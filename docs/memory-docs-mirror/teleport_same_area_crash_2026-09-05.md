# Same-area Return: native environment crash

## Correlated evidence

The user's 11:37:33 log is the tail of the failure. The installed Forestall
launcher's native crash report timestamps the actual fault at
**2026-09-05 11:37:30.239 -04:00**, PID 51800. Its paired packet snapshot supplies
the missing confirmation and warp. The WER dump was finalized at 11:37:33.

Inputs (read-only):

- `C:/Program Files/Forestall Launcher/Windower/Crashes/ffxivgame-crash-20260905-113730-239-pid-51800.txt`
- The adjacent `.packets.log` and `.dmp`.
- `C:/Users/drime/AppData/Local/CrashDumps/ffxivgame.exe.51800.dmp`.
- Installed `ffxivgame.exe`, checked with native disassembly and PE RTTI.

The incoming records are arbitrary socket chunks. Reassemble base-packet lengths
before walking subpackets; the snapshot's per-chunk opcode summary can mistake a
continuation for a packet header. Compare server-received and client-delivered
records: the relevant bytes were unchanged by Windower.

| Local time | Observed packet/action |
| --- | --- |
| 11:37:26.874 | Client starts TeleportCommand with Return arguments |
| 11:37:26.943 | Server confirmation animation `0x04000FFA` |
| 11:37:26.995 | Server delegates `eventConfirm` |
| 11:37:29.653 | Client returns accepted confirmation (`1`, nil) |
| 11:37:29.674 | Departure animation `0x04000FFB` |
| 11:37:30.069 | Same train: `0x00E2(0x10)`, player warp spawn 2, resources, weather 8001 with 7-second blend, EventFinish, actor deletion/replacement |
| 11:37:30.239 | Native access violation, roughly 170 ms after warp/weather delivery |
| 11:37:33.647 | The user's empty result/step `0x64` log, after the native fault |

There is no SetMap in this warp train. The previous completed zone-in was to
zone 206 at 11:36:48. This identifies the **same-public-area shortcut**, which
never entered the staged path fixed on September 4.

## Native fault

At `0x00A786AB`, `mov eax,[eax+0x5c]` reads address `0x73`: EAX contains `0x17`,
not a valid virtual-function-table address. The caller follows a retained object
pointer at `this+0x64`.

Verified RTTI/function chain:

- `RaptureSunMoonClip` / `LayRaptureSunMoonClip`: update `0x008D3990`, which calls
  `0x008D37A0` (return address `0x008D3981` appears on the crash stack).
- `LayCutCharacterListener`: vector forwarding method `0x00A72810`.
- `LaySchedulerUnitMemberActor`: method `0x00A786A0`, fault at `0x00A786AB`.

This establishes an invalid native environment-object reference during the
warp, rather than proving a bad fade duration. The precise client free/reuse
operation is not recoverable from this minidump. The tightly combined
warp/weather/event/actor train is the server-side lifetime hazard addressed here.
`outputs/teleport-crash-20260905/native-verified.txt` contains targeted Ghidra
decompilation at verified function entry points. `native-fault.txt` is exploratory;
entries created from interior return addresses are not function evidence.

## Fix and validation

`WorldManager.RequiresStagedSameAreaTravel` prevents Teleport/Return spawn types
1/2 and Teleport/party-warp command owners from using that shortcut. The existing
staged path now closes the event, begins the loading curtain, reloads the map,
settles destination weather, and then publishes actors, even for equal Area
identity. Inn Return's alternate spawn type is covered by command identity.

Position-only warps and the dedicated guildleve-completion-node protocol retain
their existing routes. Fade durations and the existing map/weather delays are
unchanged. Same-area Return now incurs the full staged loading sequence; that is
the deliberate cost of removing the observed shortcut hazard.

`--teleport-handoff-only` passes the new same-area routing cases, the 24 existing
Lua handoff cases, staged transport/post-landing readiness tests, and the rested
EXP/weather transition checks. Debug and isolated Release builds pass. Existing
NuGet vulnerability-feed warnings reflect unavailable network access.

Native verification remains necessary: repeat the same Return in zone 206,
then same-area Teleport, party Teleport, death Return, and cross-zone travel.
The updated server should log `[ZoneTravelStage]` for same-area travel, followed
by the existing ZoneEvent/ZoneReloadStage/ZoneMapStage/ZoneWeatherStage stages.
Do not infer success from compilation alone; confirm no new native dump occurs.
