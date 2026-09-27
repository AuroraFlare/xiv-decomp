# Instance loophole matrix — verified runtime behavior (2026-09-27)

Authoritative matrix for quest-instance edge handling. Every row below was
verified by reading the implementation (file:line cited); anything not
verified is listed under Open probes, not asserted. A staged draft that
described nonexistent APIs (`C:/tmp/ff14-edges/instance_loophole_guard.lua`)
was reviewed and REJECTED — this document replaces it.

## Scope

- Shared battle stack: `Data/scripts/private_quest_battle.lua` →
  `Data/scripts/quests/com/gc_sqb_quest.lua` (launcher) →
  `Data/scripts/directors/Quest/QuestDirectorClass*.lua` (thin CONFIG) →
  `Data/scripts/directors/Quest/gc_sqb_runtime.lua` (runtime).
- Bespoke MSQ instance: `Data/scripts/directors/Quest/QuestDirectorMan30801.lua`.
- Reference quest wiring: `Data/scripts/quests/arc/arc300.lua`.
- Mount control: `Map Server/WorldManager.cs` + `Map Server/Actors/Chara/Player/Player.cs`.
- Parley: `Data/scripts/negotiation_game.lua` + per-quest `onNegotiationResult`.

## Shared-runtime instances (all class-quest private battles)

| # | Situation | Verified handling | No-skip proof |
|---|---|---|---|
| 1 | Wipe / death | `runtime.run` death branch → `finish(false,"death")` → quest `StartSequence(retrySequence)` + `Save` (gc_sqb_runtime.lua) | Stage never advances on death; visible retry at trigger |
| 2 | Disconnect | Missing-player branch → `finish(false)` → retry seq; owner re-resolved by character ID across relogs (`refreshOwner`, never adopts assists) | No free win while offline; relog lands on retry |
| 3 | Abandon / quest changed | Quest-changed branch → cleanup (despawn, return party, `ContentFinished`/`CheckDestroy`, `EndDirector`) | Director cannot outlive the quest; mobs despawned |
| 4 | Teleport / area exit | Area-exit branch → `finish(false)` → retry seq | Leaving = forfeit to retry, never a skip |
| 5 | Timeout (30 min default) | Deadline branch → `finish(false,"timeout")` → retry seq | Terminal for the attempt, retryable at trigger |
| 6 | Entry failed / session replaced | `HasFailedQuestBattleEntry` / owner-mismatch branches → `finish(false)` → retry seq | Failed entry never strands the quest |
| 7 | Wave spawn failure | `spawnWave` false → `finish(false)` → retry (despawn partial) | Partial waves never count |
| 8 | Win | Requires connected + in area + alive + quest-current; kill credit reconciled against exact spawned actors (no duplicate/foreign credit); waves supported | No assist hijack, no double count, no dead win |
| 9 | Double start | Triggers require pre-battle seq; quest sets battle seq BEFORE `StartPrivateQuestBattle`; start failure reverts to pre-battle seq (arc300.lua) | Re-push no-ops mid-fight; failure re-arms retry |
| 10 | Duty decline | NO decline path exists in the launcher: entry auto-queues via `TryQueueQuestBattleEntry` | Worst case degrades to timeout→retry (see Open probes) |
| 11 | Party / helpers | `maxPartySize` enforced; entrant revalidation (`IsQuestBattleEntrantAllowed` per member); helper failure isolated; `CanStart` refuses while a live area exists | Helpers cannot start, hijack, or duplicate the fight |
| 12 | Staged failure | `CleanupStagedContentOnFailure` + event-ownership handoff (`cleanupOwnsEvent`) | Failed staging never leaks actors or hangs events |
| 13 | Re-entry / boundary | `DisableReentry` + `SetContentBoundaryCircle` at spawn origin | Mid-fight re-entry and wander-out are both closed |

## Bespoke MSQ instance (Man308 director, full read)

| # | Situation | Verified handling |
|---|---|---|
| 14 | Relog mid-instance | Session-change recovery rebuilds actors from saved parley flag; `defeated={}` reset (fight restarts, no free win) |
| 15 | Missing player / battlefield exit | 120 s grace each → `failBattlefield` → SEQ_005 retry warp + cleanup + `EndDirector` |
| 16 | Death | Immediate `failBattlefield` → SEQ_005 retry warp |
| 17 | Party landing timeout | `failBattlefield("party-landing-timeout")` → retry warp |
| 18 | Abandon (nil quest) | `failBattlefield` skips seq write (nil-guarded), warps party out, ends director |
| 19 | Ritual/completion notice loss | Direct fallback paths (`saved.parley=true` + spawn/combat or complete) |
| 20 | Any spawn failure | Named `failBattlefield` reason → retry warp |
| 21 | Kill detection | Authoritative poll loop (not callback-only) |
| 22 | Parley loss | Message + infinite retry (retail rule); win in wrong seq → fail (strict) |
| 23 | Cutscene failure | Spawns run regardless of scene outcome; scenes never gate progression |

## Mounts / chocobos (goal: none in instances)

| # | Situation | Verified handling |
|---|---|---|
| 24 | Riding in mounted | `IsMountRestrictedArea` treats ALL private areas as restricted; content-entry path calls `EnforceMountRestrictionForArea` (WorldManager.cs:14509) = forced dismount |
| 25 | Mounting inside | `SetMountState` / `PrepareChocoboMount` refuse in restricted areas |
| 26 | Quest-spawned chocobos | Zero spawn APIs in quest/director scripts (re-audited post-edits: `IssueChocobo`/`SpawnChocobo`/`ChocoboMount`/`MountChocobo`/`IssueMount`/`TryMountVariant` = 0 hits) |

## Parley legs (goal: full mechanic, no misroute)

| # | Situation | Verified handling |
|---|---|---|
| 27 | Board access | `GetNegotiationTarget`: same area + 5.0 ylm + `negotiation.enabled`!=0; client menu additionally gated by `SetNegotiatable` (charaWork.property[4]) |
| 28 | Win acceptance | Per-quest `onNegotiationResult` requires class/level + exact NPC + window seq + introduced flag (+ required item where recovered); result fans out to ALL scenario quests/directors, each self-filters |
| 29 | Loss / abort / timeout | Engine returns `won=false` (timeout=13, abort<=0); quests message + infinite retry; board stays stamped |
| 30 | Post-win | Winner clears `negotiation.enabled` + `SetNegotiatable(false)`; multi-opponent quests clear per winner |
| 31 | Shared NPCs | Each quest's talk re-stamps the single board (Penelope Alc300/Hrv300, Cicely/Keelty/Miounne, etc.); handlers self-filter so cross-quest results are ignored |

## Open probes (not verified — do not assert)

- Live client behavior if a player could decline auto-queued entry (no launcher path exists; worst case = timeout→retry).
- Disconnect-relog return-point coordinates (retry seq verified; exact return XYZ unverified).
- Per-fight recorded-ground mob XYZ: explicit `target.x/y/z` is supported by the spawner, but the Arc300 ambush marker has no recorded ground within 30 ylm (nearest cluster nodes 2564-2568 ~65 ylm away, zone 152) — needs `!quicknavmesh` capture or spawn anchoring before guide-based placement can ship.
- Unrecovered numeric parley params (difficulty/turns/time per quest): engine defaults 3/12/20 stand; DAT numeric columns are empty.
