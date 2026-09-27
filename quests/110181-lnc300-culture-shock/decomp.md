# 110181 Culture Shock (`lnc300`) — in-depth decomp

- Class: LNC (classId 8) | Level: 30 | Offer: J'moldva 1000599 | Reward: Willelda 1000242 | Prereq SQL: 110180
- Text bank: 459 (`lnc300`). Retail quest Lua: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/lnc/lnc300.lua` (334 lines, full body read).
- Retail director `QuestDirectorLnc30001`: empty base subclass (no retail kill/failure logic; no caravan-failure rule anywhere).
- Walkthroughs: [GamerEscape](https://ffxiv.gamerescape.com/wiki/Culture_Shock) (12 steps; 100,000-gil ask not paid;
  5 Pterocs, cutscene, 2 Does at Central Shroud 34,37; Barracks instance aftermath),
  [Fandom](https://finalfantasy.fandom.com/wiki/Lancer_Quests_(version_1.0)) (9 journal entries; ~30,000 gil / ~3,420 EXP),
  period footage `sa2Xrr3KMfo` (Culture Shock Part 7).

## Sequence / flags

ACCEPT J'moldva `processEventJMoldvaStart` (NQ `lnc30010` arg 2; accept ask lives inside the briefing; **no**
WilleldaStart scene exists for lnc300) -> seq 1 Gagaruna 1000862 @11018101 `processEvent020` (NQ `lnc30020` afterWarp) ->
seq 2 Dreues 1000402 @11018107 `processEvent030` (NQ `lnc30030` arg 2; 100,000-gil ask converges, no gate, scene-only test) ->
seq 3 J'moldva @11018102 `processEvent040` (NQ `lnc30040`) -> seq 4 rendezvous push 1000174 @11018103 `processEvent050`
(NQ `lnc30050` afterWarp; retail fires on approach, server on proximity push) -> seq 10 battle {11018103} with preEvent
`processEvent060` (NQ `lnc30060` Garlean flyover, presentation-only) -> seq 20 broker 1000403 @11018104 `processEvent065`
(NQ `lnc30065` afterWarp, injured-moogle discovery) + `processEvent068` (talk row 73 merchant thanks, same interaction) ->
seq 21 J'moldva @11018105 `processEvent070` (NQ `lnc30070` afterWarp) -> seq 30 reward `processEvent075` (talk rows 85-86).
No result gates, no work counters. Fail path -> retry seq 0.

## NPCs / actors

J'moldva 1000599/1900046; Gagaruna 1000862/1400019; Dreues 1000402/2200071; rendezvous push 1000174 (display 4000257);
Brazen-faced Broker 1000403/4000135; Willelda 1000242/1100014 (reward). Caravan chocobos/merchants/cargo/injured moogle
are set dressing + dialogue (DAT row 64); no chocobo or escort actor spawned; no follower AI.

## Dialogue / cutscene IDs (retail, verified in body)

JMoldvaStart->`lnc30010`, 005 talk 2 (Willelda row-2 redirect has no scene, unbound), 020->`lnc30020` afterWarp,
030->`lnc30030`, 040->`lnc30040`, 050->`lnc30050` afterWarp, 060->`lnc30060`, 065->`lnc30065` afterWarp, 068 talk 73,
070->`lnc30070` afterWarp, 075 talk 85/86. Unbound sub-talks: 010_2..010_10, 020_2..020_12, 030_2..030_8, 040_2..040_7,
065_2..065_9, 068_2..068_6, 070_2/070_3. Retail stages aftermath talks in a Barracks instance; driver plays them public.

## Objectives (journal, 9 entries)

Ul'dah alliance via Platinum Mirage -> Gagaruna canvass -> Dreues physical test -> J'moldva caravan order ->
south-road rendezvous -> Garlean juggernaut flyover -> beast defense (protect merchants) -> injured moogle ->
Barracks thanks -> J'moldva report -> Willelda reward.

## Instance / territory

Private quest battle, `Quest/QuestDirectorClassLnc300`. Duty site: south road between Camp Bentbranch and Camp Tranquil.
Timeout 600 s, party cap 3, re-entry disabled, boundary r=45.

## Spawn positions (mob guide, zone 150 page 2000)

- Cell (34,37) center: X=346, Z=-58; bounds X[296,396] Z[-108,-8]. 38 recorded ground points in cell.
- Nearest recorded: node 3704 (368.51, Y 9.53, -64.96), inside cell.
- Wave 1: 5x pteroc offsets (+/-8, +/-8 + center); wave 2: 2x doe offsets (+/-6, 0), spawned after wave-1 clear with the
  mid-duty cutscene beat as the wave transition (no invented scene). Positions relative to owner; no retail battlefield coords.

## Mobs / stats / abilities / AI

Wave 1: 5x Woodsent Pteroc, actor 2200108 (`WinglizardStandard`, display 3200108), mob 3131, lv 30.
Profile: speed 4, hostile, detectionRange 10, combatDelay 4200, job 8. Skill list 5047 (Puk family: 23058 Backflip, 23059 Tail Chase).
Wave 2: 2x Woodsent Doe, actor 2200304 (`SerowFemaleStandard`, display 3200304), mob 3132, lv 30.
Profile: speed 5, hostile, detectionRange 10, combatDelay 4200, job 2, resists fire/ice 0.75, wind 1.25.
Skill list 5003 (Antelope: 23078/23166 Stampede, 23079 Hoofkick).
AI: server combat core + scripted one-shot lifecycle; wave-2 spawn on wave-1 completion; require-all-kills; credit only
exact spawned actors at seq 10. No escort/protect-failure rule evidenced (retail director empty, walkthrough silent).

## Triggers

Rendezvous push -> preEvent flyover -> entry. Kill credit per wave; quest-level `onKillBNpc` inert.
Markers: live 11018101-07; 11018108-20 filler (rejected).

## Rewards

Central SQL: gil 1000001x30000, LNC marks 1000107x3000. Script: EXP 3420, no item.

## Sync / lockouts / edge handling

Class LNC + true-level >= 30 gates; mount/chocobo entry block (leader + members, pre/post preEvent); death/timeout/DC/
abandon/area-exit/entry-failed/quest-changed -> seq 0 retry with despawn + party return + content destroy; no overlevel
sync (fixed lv-30 mobs); no dup credit (exact-actor reconciliation); inv-full N/A (no item grant; EXP only).
Allowlisted: `quest_availability.lua` L155 uncommented.

## Implementation mapping

`Data/scripts/quests/lnc/lnc300.lua` -> `class_quest_template.lua` Lnc300 (L1804-1860) ->
`directors/Quest/QuestDirectorClassLnc300.lua` + `gc_sqb_runtime.lua` via `private_quest_battle.lua`.

## Open gaps

No caravan-failure rule evidenced (documented, not implemented); after-warp lifetimes play as talk callbacks pending live
verification; Barracks-instance staging of 065/068/070 simplified to public talks.
