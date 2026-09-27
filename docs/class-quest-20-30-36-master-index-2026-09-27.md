# Class quests Lv.20/30/36 master index — 2026-09-27

51 quests (PGL/GLA/EXC/ARC/LNC/THM/CNJ/WDK/BSM/GLD/TAN/WVR/ALC/CUL/MIN/HRV/FSH x 200/300/306).
Source of truth for IDs/names/codes/levels/prereqs: `FF14-Memory/Data/sql/gamedata_quests.sql`.
Availability: `FF14-Memory/Data/scripts/quests/quest_availability.lua` (enabled: 110102, 110160, 110161, 110162, 110440, 110500; rest disabled).
Machine list: `outputs/class-quest-20-30-36-master-index-20260927/quest_list.csv`.

## Worker packs (parallel subagents, no overlapping files)

- melee (PGL/GLA/EXC 110060–110102) → `docs/class-quest-melee-pgl-gla-exc-indepth-decomp-2026-09-27.md` + `outputs/class-quest-melee-decomp-20260927/`
- ranged (ARC/LNC/THM/CNJ 110160–110262) → `docs/class-quest-ranged-arc-lnc-thm-cnj-indepth-decomp-2026-09-27.md` + `outputs/class-quest-ranged-decomp-20260927/`
- crafting (WDK/BSM/GLD/TAN/WVR/ALC/CUL 110300–110442) → `docs/class-quest-crafting-indepth-decomp-2026-09-27.md` + `outputs/class-quest-crafting-decomp-20260927/`
- gathering (MIN/HRV/FSH 110460–110502) → `docs/class-quest-gathering-indepth-decomp-2026-09-27.md` + `outputs/class-quest-gathering-decomp-20260927/`

## Required per-quest depth (each pack)

Offer conditions, sequence numbers, processEvent names, marker IDs/coords, ENPC actorClassIds,
instance directors + entry XYZ, mob actorClass/mobType/levels/skills/waves, rewards (gil/marks/EXP/items),
branch/counter logic for craft/gather, and edge handling:
class/level gates on every handler, instance entry checks, death/timeout/disconnect/abandon/retry,
inventory-full retry, grant/consume exactly once, UpdateENPCs + EndEvent on all paths,
journal/marker functions, onFinish cleanup. No chocobo callbacks or actors anywhere.

## Implementation rule

Fix code in `FF14-Memory/Data/scripts/quests/<family>/<code>.lua` + `Data/scripts/directors/Quest/QuestDirectorClass*.lua`.
Do NOT flip `quest_availability.lua` enablement. Keep main SQL as source of truth per AGENTS.md.
