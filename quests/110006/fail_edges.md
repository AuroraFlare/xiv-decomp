# 110006 fail edges: timeout/death/disconnect/abandon/chocobo/party/loopholes

All paths below were read in `QuestDirectorMan0g101.lua`,
`SimpleContentMan0g101.lua`, `man0g1.lua`, and `souls_gone_wild.json`
(this file closes the `fail_edges.md` reference in `README.md`).

## The single fail path (`failEncounter`)

`failed=true` → `SEQ_060` + `UpdateENPCs` → `stopEscortDirector` →
`finishContent` → `EndEvent` → `DoZoneChange` to the White Wolf Gate
`(150, -188.705, 3.601, -1014.320, rot 0)` → `EndDirector`. Every failure
is retryable from trigger 1090202 (armed at 060, plus 070/071); the retry
rebuilds the route from scratch (`ClearActiveEncounterMobs`, no respawn
timer inside the duty).

| Edge | Behavior |
| --- | --- |
| 30-min timeout | Mission notice text 50026 starts the clock; main-loop expiry → `failEncounter` |
| Powle HP ≤ 50% | Escort event 302 (dialogue rows 368+369) → route failed → `failEncounter` |
| Powle HP ≤ 75% | Warning only: event 301 (rows 370+371), duty continues |
| Owner KO mid-route | `isDead(player)` branch → `failEncounter` (no idle-to-timeout) |
| Escort deleted / route failed | `IsEscortRouteFailed() or IsDeleted()` → `failEncounter` |
| Route start failure | `startRoute` false (no loader/zone/attach) → `failEncounter` |
| Missing quest at completion | `GetQuest == nil` in `completeEncounter`/`kickCompletionCutscene` → `failEncounter` (covers abandon mid-duty) |
| Abandon mid-duty | Engine-impossible: abandon is refused inside instances (msg 25235) and MSQ can never be abandoned (msg 25233) — verified `Player.cs` `AbandonQuest` |
| Missing completion trigger / `KickEventWithType` | Player-facing `[souls]` error → `failEncounter` |
| Stale post-loop state | `not completed and not failed and isCurrentPlayer` → `failEncounter`, else escort teardown only |
| Owner walks out of leash | NOT a fail: escort waits (`OwnerFailureDistance 0`, `OwnerLeashDistance 32`, `OwnerWaitOutsideLeash`) — see divergence below |
| Completion push outside duty copy | Quest-side area guard: SEQ_065 + 1090203 refused with `EndEvent` unless the holder is in the private copy (the class also has public row 1097; same guard in Court `man0u1.lua` for 1090077) |
| Entry while mounted/dead/wrong class | Refused before state mutates (see Entry gates) |

## Entry gates (all in `man0g1.lua`, before the entry cutscene)

- Combat class: `guardCombatInstanceEntry` at all three 1090202 push sites.
- Mounted: `soulsGateEscortEntry` (push) + `soulsIsMounted` inside
  `startMan0g1ContentInternal` — "Dismount your chocobo before starting
  the escort." Nil-guarded for harness doubles.
- Dead: "You cannot enter the escort while incapacitated."
- Missing route: `hasSoulsEscortRoute()` false →
  "Route 'souls_gone_wild' is not recorded yet. Use `!questcomplete man0g1`
  capture, then `!escortb` to record it." Missing zone 150 likewise errors.
- Stale escort flag with no live route: `resetSoulsEscortToGate` back to
  SEQ_060 (two call sites in the start helper).

## Entry rollback / landing (this pass, Court parity)

- `SimpleContentMan0g101.onCreate` no longer publishes the director or
  content group under the parent zone's construction lock; publication is
  deferred until the director observes the client landing.
- `onZoneIn` kicks `noticeEvent`, which clears the loading fade and sends
  the mission notice.
- Fallbacks: route starts 2 s after group start even if the notice event
  never completes (`ENTRY_NOTICE_FALLBACK_SECONDS`), and landing counts as
  ready 3 s after the notice even if the client never moves
  (`ENTRY_LANDING_FALLBACK_SECONDS`) — a still player cannot wedge entry.

## Relog / disconnect (this pass, Court parity)

- Every main-loop tick re-resolves the owner via `GetPCInWorld(member.Id)`
  + `HasConnectedSession`; stale Lua userdata never drives logic.
- `isCurrentPlayer` (connected + same area as the director) gates route
  completion, failure, and escort dialogue. A stale owner gets the event
  queue drained (bounded 16) instead of dialogue.
- Presentation attach failure (`SetEscortPresentationDirector`) errors and
  tears down the escort director instead of running headless.

## Chocobo (three layers + engine)

1. Entry dismount gates (above). 2. `route.CanCallBackChocobo = false`
   override in `startRoute`. 3. `canCallBackChocobo: false` in
   `souls_gone_wild.json`. 4. Engine mount ban in private areas
   (`IsMountRestrictedArea` + `ChocoboRideCommand.CanMountInCurrentArea`).

## Party

Kids spawn as allies (`SpawnEscortAsAlly`, level badge hidden, Player
allegiance, non-aggressive) but are NOT registered in the party
(`RegisterEscortAllyInParty = false`). No party HP scaling; fixed Lv1
roster, solo-as-retail.

## Honest gaps / divergences

- Retail bubble-fail NOT implemented: the wiki says leaving the instance
  bubble around the children fails the duty; this build waits for the
  owner instead (Court parity, `OwnerFailureDistance 0`). Deliberate.
- Sansa's HP is NOT engine-monitored — only Powle (escort actor index 0)
  drives events 301/302.
- stop1 mob point is UNRECORDED ground (nearest navmesh node 92 y away)
  and sits +2.24 y over its stop; duty entry likewise unrecorded
  (nearest node 137 y). Stops 2-5 are grounded (≤0.16 dY). Live `!pos`
  capture at the gate would close stop1/entry.
- Ankle Biter species/counts (1× bnpc 1365 per stop) are authored, not
  retail-verified (retail exactness unverified; Court analog differs).
