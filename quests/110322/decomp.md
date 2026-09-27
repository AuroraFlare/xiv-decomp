# 110322 The Sound of Silence (Bsm306, Lv.36 Blacksmith/Armorer)

VERIFIED: decompiled client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/bsm/bsm306.lua`
(mains + full `danceIsland_*` system, read) + DAT `bsm306.csv` (rows 1-45 + 86-132, read) + DAT
journals `xtx_journalxtxSea.csv` 108-114/142-143/145-146 (full read) + DAT `quest_marker.csv`
11032201-20 + DAT `actorclass.csv`/`xtx_displayName.csv`/`xtx_itemName.csv` bindings + SQL
quest/reward/recipe rows + walkthrough ([GamerEscape](https://ffxiv.gamerescape.com/wiki/The_Sound_of_Silence),
ARM author). YouTube lore video references 1.0 footage
([YouTube](https://www.youtube.com/watch?v=_mD_SxbTkzc)); not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + dialogue + journals + walkthrough)

ACCEPT Bodenolf (`processEventBodenolfStart`: rows 2-4 + info gate + warp; requires 110321) ->
0 Mimidoa `005` (rows 10-13): GRANTS branch source (Sound-proofing Rubber 11000052 BSM /
Admiral Alloy 11000053 ARM) + mold/casing recipe, "I'll do th' rest" (journals 108-109/142) ->
5 forge branch component (journals 109/142 state the full recipe, source INCLUDED) ->
6 component turn-in (journal 110/143): Mimidoa FORGES Brass Earplugs 11000080 FROM it
in-scene (row 19), `010` -> NQ `bsm30610`. NO player combine recipe exists or is needed ->
10 equip plugs (EARS slot 17; rows 20/36/94; journal 111) -> sail to Hope's Bourn with
Mimidoa, `020` -> NQ `bsm30620` (note: no fade-in — the instance transition) ->
15 island puzzle: 8 `danceIsland_problem` victims, one clue at a time (`picked01`/
`changeItem`), beckon souls to the boat (`solve01-08`, row 129; journal 113) ->
cave finale `030` -> NQ `bsm30630` + warp back outside the guild (walkthrough step 10) ->
20 guild reward `040` -> NQ `bsm30640` (journal 114; rows 22-24, 31-34: the "sirens" are
Ailissie + R'piqoi partying with a borrowed gramophone; Mimidoa routs them off-screen).

## SQL DEFECT 5398/5399 (proven by DAT journals; reported, not edited)

Live SQL omits the granted source from the component recipes: 5398 = 2x ingot only,
5399 = plate only. Retail journals 109 (mold = rubber + 2x ingot) and 142 (casing = alloy +
plate) prove the source is a SYNTH MATERIAL, and the walkthrough corroborates ("add a Bronze
Plate / two Bronze Ingots of your own" atop Mimidoa's granted material). Prescription:
5398 <- 11000052 + 10002011x2; 5399 <- 11000053 + 10002021 (quest-item materials are
supported: gld200 recipe 5406 precedent). COUPLING: with SQL fixed, the source is consumed
BY THE SYNTH, so live `bsm306.lua` seq-6 "consume component + source" must become
consume-component-only or it double-counts the source. HOLD-gated: no live impact today.

## Island puzzle: client system decoded (VERIFIED: scenario + dialogue + walkthrough)

Eight victims in four narration pairs: p01/p02 pain-woman (95; rows 96 head / 97 belly),
p03/p04 searching-man (98; row 99 spectacles / 100 coinpurse), p05/p06 disquieted-woman
(101; row 102 "Where is he!?" / 103 lost girl), p07/p08 sprawled-man (104; rows 105-108
hungry/thirsty). Each problem: plugs-on narration + row 94 (can't hear) + ask 109 (remove
plugs?) -> row 112 dizzy; plugs-off: the spoken line. Solves play row 129 gender-flagged
(female 01/02/05/06, male 03/04/07/08 — matches narration). Walkthrough binds 3 clues:
newt -> Pleading Petticoat, glasses -> Squinting Ser (p03!), coconut -> Sprawled Starveling
(p07/08); Maiden + companion-choice (Spirited Smithy / Stentorian Shipwright, follow-me, no
clue) covers p05/p06; p02/p04 mechanics stay residual. Clue pickups are glowing "???"
ground objects at the lighthouse (left coconut / middle newt / right glasses); removing
the plugs to talk (walkthrough step 5) is rows 109-111. Victim display names have NO
`xtx_displayName.csv` entries (unresolvable to actors); R'piqoi 1000187 / Ailissie 1000188
resolve but have no spawns. The scenario problem/solve set is clue-agnostic: the mapping
lives in unrecovered island wiring. Server `bsm306_victimTalk` scaffold (8 flags +
one-clue rule) is ready but UNWIRED, and the server never fires 020/030 (no island driver).

## NPCs/markers/instances (VERIFIED: DAT + live map tool)

Bodenolf 306 + Mimidoa 3382 (shared Bsm200 row) public; R'piqoi/Ailissie unspawned.
Markers 01/02/05 at Mimidoa (1400012); 06 reward at (-490.38, 417.81, display ??? — a guild
hall-floor point, not the balcony); 03/04 replay-collision placeholders; 07-20 filler.
Zone 139 "The Cieldalaes" verified live: world_only, 0 recorded nodes, no map binding —
Hope's Bourn is unplaceable without invention. No island markers exist in DAT.

## Rewards/sync/lockouts (VERIFIED: SQL + DAT)

Gil 36000 central + marks 3600 script-side by LOCKED branch (central autoGrant=0) + EXP 0
(post-1.20 amount UNREPORTED — never inferred; archive A4 has no EXP row). No tool (era
unresolved). Non-combat: no sync, lockouts, or timeout; one-time quest. No chocobo
involvement. NOTE: the walkthrough claims a level-38 MSQ prerequisite; no MSQ gate is
evidenced in DAT (SQL prereq = 110321 + level 36) — not adopted.

## Gaps (quest stays HOLD-gated)

Zone-139 placement; victim/clue-trigger actors; clue<->victim DAT wiring (residual
p02/p04/p06); 020/030 island driver; 5398/5399 SQL defect (above). CLOSED this pass:
source grant (row 13 + journals); combine model (row 19); full danceIsland decode (8
problems/solves + genders + one-clue swap); 3 walkthrough clue bindings; victim-pair
structure; R'piqoi/Ailissie IDs; equip-gate slot; Hope's Bourn naming (row 87 + journal
111); Mimidoa shared spawn.
