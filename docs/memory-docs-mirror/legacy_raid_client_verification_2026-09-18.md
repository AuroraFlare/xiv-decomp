# Aurum Vale and Cutter's Cry client verification

Status: pending. Offline checks do not establish live acceptance. This checklist
does not authorize restarting a server or applying database changes. Use it after
the tested changes have been deliberately deployed to a safe test server.

Record the server DLL SHA-256, start time, client version, test character, dungeon,
entry method and run timestamp with each result. Keep the corresponding server
log and a short capture showing the behavior. Report PASS, FAIL or NOT TESTED;
do not infer a pass from the absence of an exception.

## Entry, scenes and widget

The current GM helpers accept `!aurum enter` and `!cutters enter`. They do not
implement Darkhold's `cs`/`nocs` arguments. Use a fresh instance for each opening
test; `!aurum status` and `!cutters status` expose the current instance state.

| Test | Required observation |
| --- | --- |
| Fresh solo entry | Correct dungeon loads, opening scene appears once, and the native dungeon timer/widget appears with the original 60-minute deadline. |
| Skip opening | Skip returns control without replay, spawning a second instance, or restarting the deadline. |
| Reconnect during duty | Same instance and progress return; widget resumes the original deadline; opening scene does not replay. |
| First boss approach before engagement | Coincounter/Princess introduction renders once when the owned boss becomes known to the client. |
| Final boss approach before engagement | Miser/Chimera introduction renders once. No extra combat actors appear from cinematic staging. |
| Enter combat before pending introduction | Pending introduction is cancelled rather than interrupting the fight. |
| Boss clear | Death presentation completes, victory scene/widget transition occurs once, and earned coffers appear. |
| Failure and withdrawal | Widget closes and the character returns to the saved entrance; reconnect cannot resurrect the retired duty. |

Native scene associations are `rad0r400`–`rad0r403` for Aurum and
`rad0w500`–`rad0w503` for Cutter: opening, first boss, final boss, victory.
These names identify implementation bindings, not proof of recovered retail
audience rules. Boss viewing policy is reconstructed.

## Route and interaction

Use `!aurum route list` / `!cutters route list`, then `route inspect <id>` to
identify placements. `route goto <id>` is available in GM test instances and
can isolate a floor problem; a teleport-assisted test does not prove normal
physical reachability. Do not use `route save` unless intentionally capturing
new placements. Do not count manual `regular`, `coffer` or `objective` commands
as proof that the actual chest or kill condition works.

| Test | Required observation |
| --- | --- |
| Each ordinary coffer | Correct stage/dependency, one successful roll, open animation and eventual removal; repeat interaction gives no additional items. |
| Partial/full inventory | Pending items survive failed delivery; freeing space and retrying delivers only the original remaining items. |
| Completion rewards | Only earned coffers appear; unopened rewards remain usable for the configured 90-second window; consumed ones never reappear. |
| Equipment persistence | Confirm each awarded equipment item after reconnect, including its item identity and quality. |
| Aurum circles | Persistent circle appears before charging, correct participant count and continuous hold unlock the intended barrier, and one completion effect plays; stepping away interrupts charging. Reconnect/range return preserves the current circle/barrier state without replaying completion. |
| Aurum fruit/root | The native eat/decline prompt appears for the correct part. Decline gives no Veil and preserves Breathless eligibility. Acceptance gives Veil II/Veil with the expected duration and mitigation; the source remains usable by the other entrants. Moving away or reconnecting during the prompt cannot consume a stale source. |
| Gold Lung/Goldbile | Correct enter/leave feedback and actual HP/status behavior, with and without protection; no hazard pulses after the run finishes. |
| Cutter sands | Each authored route transition reaches its paired destination without repeated immediate warp; HP/MP variants change the intended resource. |

Keep placement failures separate from mechanic failures. The current layer counts
and source boundaries are in the [2026-09-26 review](legacy_raid_retail_accuracy_2026-09-26.md).
Aurum now includes exact-X/Z native-mesh support and a calibrated Stage 3 repair;
Cutter's earlier 54 fallbacks use the frozen 2026-09-18 recorded floor support.
Check both Stage 3 arrival floors, the arena transporter, Miser, consumables and
the corrected arena gas separately. Map-derived X/Z and supported Y are not client
floor acceptance.
Dynamic summon and trap positions are also authored and need their own checks.

## Fights

| Encounter | Required observation |
| --- | --- |
| Coincounter | Execute normal attack choices and the Giant Swing/recovery sequence; verify actual hit areas, facing, damage and return to ordinary AI. |
| Miser | Execute all six effect-bearing commands, verifying actual statuses, misses/resists and displacement; death completes the duty once. |
| Miser first add cohort | At 75 seconds of an active pull, the first cohort publishes once: three Giltraps, or the documented authored low-HP alternative. Healing and a second HP descent must not duplicate it. Current homes are co-located at the boss as a fallback; record floor, separation and combat behavior. This test does not cover the still-missing pool movement, regeneration or later add cycles. |
| Princess | Ten soldiers on the initial damaged-engagement wave and subsequent configured waves; guard at the configured minute boundary; no duplicate slots after a transient spawn failure. |
| Marshal | Separate runs below and at/above 80% at the first 60-second check; heal-to-full and later damage must not reopen a missed window. |
| Surviving ants | Kill Princess with adds alive; survivors remain owned and killable, including Marshal, and their intended objective credit still works. |
| Summoned ant engagement | Princess reinforcements and Chimera scavengers join an eligible existing boss opponent even when outside normal sight detection. Existing add threat is preserved; visitors, unavailable sessions and players in protected scenes do not receive the initial encounter threat. |
| Chimera parts | Actual directional damage triggers intended part breaks, move suppression and recovery; matching effects render, and healing does not duplicate earned scavenger waves. |
| Scavengers | All actors in each earned threshold wave publish and engage; partial retry adds only missing actors. |
| Sand Pillar | Fixed sites cast repeatedly; moving out avoids the impact; positioning Chimera in it reduces boss HP without making it target the hidden worm. |
| Trap killing blow | A Sand Pillar kill produces normal boss death, clear widget, earned coffers and usable rewards without a player command completing afterward. |

Sand Pillar's four cardinal sites, eight-yalm offsets, rotation order, cadence,
radius and provisional heights are authored first-pass choices. Do not interpret
a successful run as evidence that these values are exact retail data.

## Normal party acceptance

Solo GM entry does not prove normal-party admission, head-count circles, retry
timer persistence or party-continuity achievements. Test the launch-1.21 entry
rules separately with the leader and eight eligible level-45+ combat members;
Aurum also requires the relevant Into the Dark quest completion. Use the normal
entrance NPC or `!aurum start` / `!cutters start` for that path.

Verify clear/withdrawal retry of 15 minutes and failure retry of five minutes,
including reconnect. Verify party changes affect the intended achievements and
that unrelated visitors receive neither loot nor achievement credit. Achievement
delivery now has offline failure-injection coverage: all six IDs roll back failed
transactions, retry on the current Player object and avoid duplicate points.
Timer checks cover failed initial writes followed by a successful save, absolute
deadlines and preservation of later/unrelated timers. These are not client passes.
Pending achievement credit now also uses the local `pending-raid-achievements`
directory beside the server executable, scoped by database host/port/name/world.
Preserve that directory when deploying or moving the server. Offline tests cover
recovery by a replacement Player and an already-committed award whose marker
survives. A separate journal test also terminates a writer after acknowledged
flush and verifies recovery, database isolation and locked-file failures. Full
server/login recovery, power loss, disk exhaustion and timer persistence after
failure of both the initial and cleanup saves still need separate checks.

For a separate controlled persistence test, distinguish a failed initial timer
write followed by a successful cleanup save from failure of both writes. The
current player cleanup attempts the timer save again. Record the absolute timer
before disconnect and after reload; any future retry implementation must preserve
that deadline and must not overwrite a later legitimate timer change. This
failure-injection test requires a disposable test database, not a live outage.

## Result record

For each failed row record expected versus observed behavior, exact time, relevant
actor/placement key, player position, nearby floor, status output, and log/capture
paths. Record which checks used GM shortcuts. This document currently records no
live passes and does not reduce the completion goal to floor placement alone.
