# Weather transition audit — 2026-09-06

The subsequent [September 12 server correction](weather_crossing_fix_2026-09-12.md)
implements movement/seamless duplicate suppression and preserves micro-area
timing across seamless boundaries. The findings below describe the audit-time
code and remain the native evidence for that correction.

## Result and scope

The active configuration sends **20 seconds for seamless zone crossings** and
**180 seconds for micro-area weather**. Both values fit the actual unsigned
byte that the retail client consumes. They are valid nominal durations for an
uninterrupted change to a new weather resource. Configuration and packet logs
alone do not prove that a visible transition lasted that long.

The investigation found two mechanisms that can make the result look much
quicker or inconsistent:

1. **A redundant weather message can replace the duration of a blend already
   in progress.** The server resends weather on every seamless crossing and
   on micro-area ownership changes, including when the effective weather is
   unchanged. The client changes the target duration before applying the
   weather resource; its resource registration routine returns immediately
   for a resource already in the blend queue. That path does not reset the
   elapsed counter. A 180-second blend subsequently given 20 seconds can
   jump to completion if more than 20 seconds have elapsed. A 20-second blend
   subsequently given 180 can move its interpolation fraction backwards.
2. **Client-authored local DrawEnv changes have their own approximately
   2-second blend.** That spatial lighting/fog path is separate from the
   server weather duration. Increasing the server setting cannot lengthen
   this native spatial blend. Which visible components use it depends on
   the local layout and selected DrawEnv family.

These are source/binary findings, not a claim that the user's particular
crossing was reproduced on screen. The client was closed, and the user asked
to leave live testing for later. No server/client behavior, weather config,
running process, Teleport, or Return handling was changed during this audit.

## Authoritative configuration and server paths

- `Data/local/map_config.ini:31,42-44`: micro=180, scheduled=20,
  seamless=20, hard-zone-in=7. `Data/map_config.ini` agrees.
- The running server's startup log at
  `Map Server/bin/Release/Logging/2026-09-06/map.log:3511,3514,3517`
  identifies that local config and confirms the loaded values.
- `Player.SendSeamlessZoneInPackets` and
  `SendSeamlessZoneInPacketsWithoutMusicChange` both force the seamless
  duration. They do not check whether the target weather is already active.
- `WeatherManager.RefreshPlayerWeatherArea` treats `areaChanged` as a reason
  to queue a packet even when `state.Weather == effectiveWeather`.
- `WeatherManager.QueueZoneInWeather` uses the caller's forced seamless
  duration even when the destination is a micro-area. It records that state,
  so the following movement update does not normally immediately resend 180
  unless ownership or weather changes again.
- Micro-area ownership can also choose a row's `TransitionSeconds` override.
  Scheduled updates within a micro-area use the micro-area duration too;
  180 is not exclusive to movement.
- `Player.SendTeleportZoneInWeatherPackets` uses its existing forced
  `GetZoneInWeatherTransitionSeconds()` path. It remains unchanged.

The source fallback values (scheduled=180 and seamless=35) differ from the
active INI values. They are not what the running server loaded. Existing
`Fishing Tests/Program.cs` config assertions expecting 180/35 are therefore
not evidence for the current runtime durations.

## Native proof

Installed image:
`C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV/ffxivgame.exe`

SHA-256:
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`

The executable was read, not modified. Fresh instruction excerpts and
Ghidra decompilations are in
`outputs/weather-transition-audit-20260906/`.

| Address | Verified behavior |
|---|---|
| `0x004DC71A..0x004DC749` | Opcode dispatch tables route `0x000D` to `0x004DCBF7`. |
| `0x0059CF79..0x0059CFB8` | Weather packet case reads weather as `uint16`; `MOVZX EDI, byte ptr [EDI+0x12]` reads duration as **uint8**, and stages it at `+0xB4`. |
| `0x0059EC7D..0x0059EC9F` | Converts the staged integer to a whole-seconds counter with zero fractional remainder; calls `0x0059E4D0`. |
| `0x0059E4D0` | Publishes duration first (`0x0059E1F0`), then weather ID (world message `12`). |
| `0x0059E1F0`, `0x0062D004` | Send/receive world message `114` carrying the duration counter. |
| `0x007E0370` | Stores target counter at `+0x148`; clamps elapsed counter at `+0x138` down to the new target if necessary. It does not reset elapsed to zero. |
| `0x007E2330` | Computes and clamps `(elapsedWhole*30 + elapsedFraction)/(targetWhole*30 + targetFraction)`. Zero whole-second duration completes immediately. |
| `0x007E91D0`, `0x007EA090` | Convert the engine delta to 30-frame units and accumulate the elapsed counter. Native timebase is 300,000 ticks; `0x00A20380` returns that constant. |
| `0x007E87F0` | Searches all existing 12-byte weather queue entries by resource ID; an existing entry returns without adding/reordering it. |
| `0x007E80F0`, especially `0x007E81FA` | Adding a new resource resets the elapsed counter to zero. |
| `0x007E78D0` | Blends the oldest and newest weather DrawEnv entries; retires the oldest when the weather fraction reaches 1. |
| `0x007E64C3..0x007E6536` | A **separate spatial** fraction at `+0x8C` advances by `deltaFrames * 0.0166666675` (60 native frames, about 2 seconds). It does not use the packet duration. |

The old research attribution of `0x006E5FD0` to weather was incorrect; its
downstream call is music-related. The weather packet reader uses unsigned
extension, so **180 is not a signed-byte overflow**. Only values above 255
are truncated: 256 becomes 0 and 300 becomes 44. The current 20/180/7 values
do not have that problem.

The older `probe_ffxiv_weather_drawenv.py` field named
`transition_fraction_field_0x8c` observes the spatial fraction, not the
packet-driven weather fraction. It cannot measure a 180-second weather
transition by itself.

## Deterministic counter examples

These examples apply the recovered native formulas to the same queued
resource; they are **models**, not recorded live transitions.

| Existing blend | Incoming duration | Fraction before | Fraction after |
|---|---:|---:|---:|
| 30 seconds elapsed of a 180-second blend | 20 | 16.7% | 100% |
| 10 seconds elapsed of a 20-second blend | 180 | 50% | 5.6% |

Crossing back from B to A before A has retired from the `[A,B]` queue is an
additional case to test. The existing-resource routine itself does not reverse
or reorder those entries. That native fact is verified; the complete visual
outcome for a particular weather/layout pair still needs reproduction.

## Follow-up implementation and live validation

The first server correction to consider is skipping redundant **movement and
seamless** weather messages while still recording the destination area state.
Hard zone-in must keep its existing explicit weather bootstrap. A global
deduplication in `Player.QueueTrackedWeather` would be inappropriate because
the same weather ID can still require bootstrapping after map replacement.

Removing duplicates would address timing replacement, not every rapid
A→B→A case or the independent spatial fade. A further change for those cases
needs to account for the client's resource queue instead of just changing
the INI durations or declaring a long blend finished server-side.

Prepared a read-only sampler:

```powershell
python tools/probe_ffxiv_weather_transition.py --pid <clientPid> `
  --duration 240 --interval 0.25 `
  --jsonl outputs/weather-transition-audit-20260906/live-crossing.jsonl
```

It verifies the executable hash, opens the process with `PROCESS_VM_READ`,
and records wall time, elapsed/target weather counters, calculated weather
fraction, queued resource IDs, spatial fraction, and registered DrawEnv name.
It never writes process memory. It creates the capture exclusively, so an
existing capture is not overwritten. Queue fields are sampled without
suspending the game and can change between reads.

Later test sequence: one seamless crossing, one micro-area crossing followed
by standing still for over 180 seconds, then a quick crossing back before
the first resource retires. Correlate counter/queue changes with weather
packets and the visible sky/fog. Teleport/Return are outside this test's scope.

## Checks performed

- `python tools/verify_weather_transition_audit.py`: passed executable hash,
  dispatch-table, unsigned-byte reader, timebase, and timing-constant checks;
  wrote `verified-summary.json` and `native-verified-instructions.txt`.
- `python -m py_compile tools/probe_ffxiv_weather_transition.py`: passed.
- `python tools/probe_ffxiv_weather_transition.py --help`: passed.
- Fresh Ghidra targeted decompilations completed with `-readOnly -noanalysis`.
- No live visual-duration claim or runtime fix is asserted by these checks.
