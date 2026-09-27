# 110180 A Wailing Welcome (`lnc200`) — in-depth decomp

- Class: LNC (classId 8) | Level: 20 | Offer+reward: Willelda 1000242 | Prereq SQL: 0
- Text bank: 455 (`lnc200`). Retail quest Lua: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/lnc/lnc200.lua` (152 lines, full body read).
- Retail director `QuestDirectorLnc20001`: empty `QuestDirectorBaseClass` subclass (no retail kill logic recovered; server runtime owns the lifecycle).
- Walkthroughs: [GamerEscape](https://ffxiv.gamerescape.com/wiki/A_Wailing_Welcome) (7 steps, 4 Orchard Chigoes at Central Shroud 24,27),
  [Fandom Lancer Quests](https://finalfantasy.fandom.com/wiki/Lancer_Quests_(version_1.0)) (journal + ~20,000 gil / ~1,760 EXP),
  period footage `S-teBSI2N4ql4` (4-chigoe sequence, per batch-B notes).

## Sequence / flags

ACCEPT Willelda `processEventWilleldaStart` (ask 61 gate + `showQuestInfomation` gate; decline row 68) -> seq 1
J'moldva 1000599 @11018001 `processEvent010` (NQ `lnc20010` arg 1, fade default) -> seq 10 battle {11018002} ->
seq 20 J'moldva @11018003 `processEvent020` (NQ `lnc20020` arg 1, **afterWarp**) ->
seq 21 Willelda @11018004 `processEvent040` (talk rows 32-34 payment speech) -> seq 30 reward `processEvent030` (NQ `lnc20030` arg 1).
No work counters, no result gates on route steps. Fail/death/timeout/DC/abandon -> retry seq 0 (offer actor re-entry).

## NPCs / actors

Willelda 1000242/1100014 (offer+reward); J'moldva 1000599/1900046 (briefing+aftermath). Moogle + hostile elemental in the
post-duty return beat are scene-only (journal), never spawned. No chocobo actor anywhere.

## Dialogue / cutscene IDs (retail, verified in body)

WilleldaStart (ask 61, info gate), 010->`lnc20010`, 020->`lnc20020` afterWarp, 030->`lnc20030`, 040 talk 32/33/34.
Unbound ambient sub-talks (no server owner; retail client conditional depth): 005_2..005_8, 010_2/010_6/010_7/010_8,
020_2..020_7, 030_3. None is on the objective path.

## Objectives (journal, GamerEscape+Fandom agree)

Join the Wailers via Willelda -> J'moldva pest-briefing (Greatloam Growery, ritual-mask exposition) ->
cull chigoes at Lifemend Stump -> hostile-elemental/moogle beat on return -> report J'moldva -> Willelda reward.

## Instance / territory

Private quest battle (`PrivateAreaMasterSimpleContent`/`SimpleContentQuestBattle`), director script
`Quest/QuestDirectorClassLnc200`. Duty trigger: Central Shroud zone 150 cell (24,27) on the Camp Emerald Moss road.
Timeout 600 s, party cap 3, re-entry disabled, boundary circle r=45.

## Spawn positions (mob guide `map_coordinates.py`, zone 150 page 2000)

- Cell (24,27) center: world X=-654, Z=-1058; bounds X[-704,-604] Z[-1108,-1008]. 130 recorded ground points in cell.
- Nearest recorded ground: node 2920 (-643.27, Y 20.22, -1061.14), inside cell — matches prior (-642.01,-1060.05).
- Private fight spawns relative to owner position: 4x offsets (+/-6, +/-6). No fixed retail battlefield coords published.

## Mobs / stats / abilities / AI

4x Orchard Chigoe, actor 2205605 (`ChigoeStandard`, display 3205605), mob 3125, lv 15, single wave, require-all-kills.
Profile: speed 4, hostile, detectionRange 10, combatDelay 4200, job 8, resists slash/pierce 0.75, h2h 1.25.
Skill list 5013 (Chigoe: 23051 Mortal Mist). AI: standard server combat core + one-shot scripted lifecycle; retail
`ElementalScenarioLncLv20` analog is an empty base subclass (no custom AI recovered). Enmity/leash: core combat +
private boundary; wave credited only for exact spawned unique IDs at expected seq 10.

## Triggers

Duty calls on reaching the site (retail proximity; server: talk at marker 11018002 -> battle launch).
Kill credit: director `onKillBNpc` reconciles exact dead spawned actors; quest-level `onKillBNpc` inert (no ambient credit).
Markers: live 11018001-04; 11018005-20 filler (rejected).

## Rewards

Central SQL: gil 1000001x20000 (wiki), LNC marks 1000107x2000 (dat-old). Script: EXP 1760 + Iron Guisarme 4080406x1
(item row verified in `gamedata_items.sql`). Linkpearl grant unbound (no evidence).

## Sync / lockouts / edge handling (all verified in bodies)

- Class gate LNC + true-level >= 20 on offer/talk/reward/journal (`class_quest_template.lua` driver).
- Mount/chocobo: entry refused with message while mounted; all entrants re-checked after preEvent (`gc_sqb_quest.lua`).
- Death/timeout/disconnect/abandon/area-exit/entry-failed/quest-changed -> `finish(false)` -> seq 0 retry, targets
  despawned, party returned, content destroyed (`gc_sqb_runtime.lua`).
- No overlevel sync in 1.0 class quests: fixed lv-15 mobs; minimum-level only. No dup turn-ins (inert quest kill
  callback + exact owner/sequence resolution). Inv-full holds reward step via `grantCheckedItems` + HasItem dup guard.
- Allowlisted: `quest_availability.lua` L154 uncommented.

## Implementation mapping

`Data/scripts/quests/lnc/lnc200.lua` (stub) -> `class_quest_template.lua` Lnc200 (L1744-1784) ->
`directors/Quest/QuestDirectorClassLnc200.lua` + `gc_sqb_runtime.lua` via `private_quest_battle.lua`.

## Open gaps

Linkpearl grant unbound; trigger Y is owner-position (no fixed retail Y); sub-talk owners unbound (off-path).
