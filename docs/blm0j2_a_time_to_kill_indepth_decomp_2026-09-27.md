# Blm0j2 A Time to Kill (111262) indepth decomp - 2026-09-27 (JOB BLM)

Lv35. Lalai -> Daddy Longlegs west of Nophica's Wells (Western Thanalan),
blood offering -> Lalai. Status: ENABLED (pre-existing adapter, verified +
hardened with a level floor this pass).

## Client scenario (decomp_more path absent; contract from hook table + audit)

- Offer `processEventLALAIStart` (single stored offer result).
- `processEvent000_LALAI/_KAZAGGCHAH/_DOZOLMELOC/_DAZA` are reminders/ambient
  only: no dispatch, state advance, or ordered chain. No NPC route.
- No NQ scene/fade/spawn/content callback in this chunk.
- Completion is three hooks: First opens `(worldMaster,51121,3105515,1,
  2000207)`; Second shows ability `(27319,2)`; Third runs linkpearl handoff
  `showEventBeforeNpsLS(player,1400197,78)`.

## Stages / markers / positions

- Sequences: 0 Lalai offer -> 5 battle -> 10 Lalai reward.
- Marker 11223101: Western Thanalan m00029/104/403, X/Z -1050.420044/
  405.799988, QuestArea. Source position only; public trigger unrecovered.
- Journal: three companions recommended (4 total).

## NPCs / mobs

- Lalai 1060035, spawn row 2459, zone 209 (18.188, 206.0, 283.401).
- Daddy Longlegs: actor 2105513 (HarvestmanNM/display 3105515), mob 3013
  (job 8, 42/42, HP 27489, MP 773), skill list 71 (Corrosive Spit 23139,
  Brain Spike 23140).

## Rewards

- EXP 3360; action 27319; First/Second/Third presentation widgets.

## Adapter (verified this pass)

- `QuestDirectorJobBlm0j2` + template row unchanged except added
  `minimumLevel = 35` (launcher-enforced; closes the under-level-helper
  loophole). Single exact target, cap 4, timeout 900.
- Shared lifecycle covers wipe/retry/re-entry refusal, abandon/reacquire
  (quest-changed teardown), party/solo, disconnect, death-during-event,
  timeout, and retrigger guards (HasLiveContentArea lease).
