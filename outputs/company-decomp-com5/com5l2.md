# Com5l2 — internal/unknown row — 111412

- SQL: `(111412, '[en]', 'Com5l2', 0, 0)` — no title, no prereq, level 0. [verified — `gamedata_quests.sql:466`]
- Availability: commented in `patch_unknown_or_internal` (`quest_availability.lua:407`), not offered. [verified]
- Wrapper `Data/scripts/quests/com/com5l2.lua` → `InitQuestScaffold("Com5l2")`, config `noOffer = true`, no actor/markers. Reference-only initText loader. [verified — `generic_quest_scaffold.lua:28`]

## Sequence flow / events / ENPC / markers / rewards

- None recovered. No owner, objective, instance, reward, or scene-route proof. [verified — absence per patch-1.16–1.23 decomp §8]
- Client `g*501–603`-class luac files exist in the decomp tree but were not promoted to evidence for these rows. [verified — decomp §8]

## Prereq chain

- None (prereq 0). Not attached to any chain. [verified]

## Mobs / spawn evidence

- None. No BNPC, no placement, no navmesh lookup applicable. [verified — absence]

## Instanced surface

- No instanced content attributable. Nothing to record; no fight invented. [verified — absence]

## Inferred vs verified

- Verified: internal-row status only. Everything else is open: do not expose, title, or attach dialogue until client title/event/actor/prereq/reward rows are recovered.
