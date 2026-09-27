# Com5g4 — internal/unknown row — 111614

- SQL: `(111614, '[en]', 'Com5g4', 0, 0)` — no title, no prereq, level 0. [verified — `gamedata_quests.sql:502`]
- Availability: commented in `patch_unknown_or_internal` (`quest_availability.lua:420`), not offered. [verified]
- Wrapper `Data/scripts/quests/com/com5g4.lua` → `InitQuestScaffold("Com5g4")`, config `noOffer = true`, no actor/markers. Reference-only initText loader. [verified — `generic_quest_scaffold.lua:26`]

## Sequence flow / events / ENPC / markers / rewards

- None recovered. No owner, objective, instance, reward, or scene-route proof. [verified — absence per patch-1.16–1.23 decomp §8]

## Prereq chain

- None (prereq 0). Not attached to any chain. [verified]

## Mobs / spawn evidence

- None. No BNPC, no placement, no navmesh lookup applicable. [verified — absence]

## Instanced surface

- No instanced content attributable. Nothing to record; no fight invented. [verified — absence]

## Inferred vs verified

- Verified: internal-row status only. Do not expose, title, or attach dialogue until client title/event/actor/prereq/reward rows are recovered.
