# 110482 A Moogle Bouquet — `Hrv306` (Botanist 36)

- Class: BTN (40) | Level: 36 | Chain: 110481 completed | Offer: Opyltyl 1000236 | Status: HOLD-gated (`HRV306_OFFER_ENABLED=false`).
- Lua: bespoke `Data/scripts/quests/hrv/hrv306.lua` + `hrv_quest_helpers.lua`. Rychyld 1000508 spawn row 3353 (DAT-exact X/Z).

## Sequence flow (VERIFIED: decomp hrv306.lua 226 lines, DAT markers/text 120 cells, Gamerescape 12-step walkthrough, footage MtRv3x8Wh_M + Slerp ch 9:04-end)
- ACCEPT Opyltyl `processEventOpyltylStart` (duplicate quest-information call, nil-accept) -> [0] Rychyld `010` hrv30610 sceneArg 2 + conditional warp + cached result (name/friend gates inside client) -> [5] flower field instance entry @11048202 -> [10] harvest Pearl Clover Seeds 11000128 (over-harvest until sparkles vanish) -> Rychyld `030` hrv30630 dynamic payload (1 complaint / 0 just-enough) -> [15] Cicely `032` planting (consume-all) -> [20] question botanists, finish Opyltyl `034` + `036` empty handshake -> [25] Humblehearth instance: Yarzon Faeces 11000043 under sleep/wake hazards @11048207 -> [30] Opyltyl `038` soil work (consume-all) -> [35] Cicely report (no scene) -> [40] Echo on Cicely `040` (ask 51030 mode 2 result 1; client runs past-area entry) -> [43] Opyltyl `045` + `050_2`: Pearl Clover Seedling 11000138 x1 (grant-once) -> [45] Cicely `050` + `050_3` map-marking (DAT 119, order flag) -> peninsula `060` hrv30660 @11048211 -> [55] Cicely finale `070` hrv30670 + EXP 4720 + central gil/marks.

## Delegate events (VERIFIED: decomp scenario)
OpyltylStart/010/020/030/032/034/036/038/040/045/050/060/070; sub-talks 005_2..005_6, 010_2/010_3, 020_2, 030_2, 032_2..032_5, 034_2..034_5, 038_2, 040_2, 050_2, 050_3. Strict: offer nil-accept, 040 Echo result==1 only.

## Actors/markers (VERIFIED: DAT quest_marker.csv, spawn SQL)
Opyltyl 547, Cicely 548 (zone 206); Rychyld 3353 (zone 206, -209.52/18.1/-1480.62). Live 11048201/02/04/05/06/07/08/09/10/11/12; 11048203 replay-only contaminated unbound; 11048213-20 filler.

## Gathering/instances/hazards (VERIFIED: walkthrough + map tool this pass)
Flower field: zone 153 West Shroud cell (17,35) center (-1354,-258); 0 recorded nodes; 9 wight_warrior catalog mobs in cell, nearest `!pos 153 -1346.125 -0.561 -268.260` (12.9y). Humblehearth: zone 150 cell (29,31) center (-154,-658); 0 recorded nodes in cell. Peninsula: zone 150 cell (25,30) center (-554,-758); 69 recorded nodes, nearest node 956 `!pos 150 -554.416 0.207 -764.969` (7.0y); feral watchdogs 42y+. Counts retail-dynamic ("a handful"; faeces "believed correlated" = author belief, not formula): possession gates + consume-all, FLAG_OVERHARVEST workstream-owned. Yarzons are sleep/wake hazards, never kill targets; no sleep/wake quest primitive exists. No public pools bound (retail harvests in-instance).

## Rewards (VERIFIED: SQL)
Central: 36,000 gil + 3,600 marks (1000122). Script: EXP 4720 flat (post-1.20 max).

## Edge handling (VERIFIED: script body)
BTN36 + completed-110481 gate all paths; re-accept clears flags; seedling grant-once with full-inv hold; map-marking order flag; Echo strict gate retries; peninsula delivery possession-gated; abandon/completion consumes seeds/faeces/seedling; UpdateENPCs + EndEvent all paths; death/wipe/rez, logout/DC, re-enter, timeout, sync N/A live (no combat/timer; instance ticket owns them); dup turn-ins impossible (consume-all + once-grant); no chocobo content (non-combat; standard unsummon-on-instance-entry applies when instances land).

## Open gaps (HOLD)
G4-a both instances; G4-b sleep/wake hazards; G4-c dynamic counts; G4-d questioning-loop owners; G4-e peninsula trigger mechanism; G4-f reward owner binding; G4-g linkpearl; G4-h EXP scaling; unwired sub-talks (see script header).
