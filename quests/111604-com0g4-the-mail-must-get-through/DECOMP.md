# Quest 111604 (com0g4.lua) — The Mail Must Get Through

Source: FF14-Memory/Data/scripts/quests/com/com0g4.lua (162 lines, full body read)
Battle: FF14-Memory/Data/scripts/quests/com/gc_field_battles.lua (config `com0g4`),
  placements FF14-Memory/Data/scripts/quests/com/gc_field_battle_placements.lua
  (`routes.com0g4`, zone 152), director
  FF14-Memory/Data/scripts/directors/Quest/QuestDirectorGcCom0g4.lua,
  runtime FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua (497 lines, full body read)
Registry: FF14-Memory/Data/sql/gamedata_quests.sql
  `(111604, 'The Mail Must Get Through', 'Com0g4', 111603, 22)`
Availability: FF14-Memory/Data/scripts/quests/quest_availability.lua
  (`111604, -- ... [Story] [Lv. 22] - instance (Com0g4)`)
Guides: GamerEscape `The_Mail_Must_Get_Through_(Quest)` + `/Plot_Details`
  (walkthrough + full dialogue, fetched); quest page has no YouTube embed.

## Stages (SEQ)

```
SEQ_000 = 0;   -- Accept from Syro Fulke (Adders' Nest)
SEQ_010 = 10;  -- Reinforce the conjurers: three-wave field battle (private squad instance)
SEQ_020 = 20;  -- Report the ciphered letter to Fulke
SEQ_030 = 30;  -- Take the letter to Radulf (Little Ala Mhigo)
SEQ_040 = 40;  -- Return the magitek designs to Fulke (reward/complete)
```

Journal info IDs: 277 / 278 / 279 / 280 / 281 per SEQ above.
Prereq: Com0g3 "Adder's Nest Egg" (111603), level 22. Follow-up: Com0g5 (111605).
One-time story quest (no repeatable descriptor in quest_availability.lua).

## NPCs/Actors

```
SYRO_FULKE = 1500200;  -- 'serpent_fulke', zone 234, (169, 0, -174.7) rot -1.5 (Adders' Nest)
RADULF     = 1001334;  -- 'radulf', zone 171, (1131.96, 251.29, 207.868) rot 2.269 (Little Ala Mhigo)
ENTRY      = 1099512;  -- 'com0g4_battle_entry', zone 152, (-636.609985, 18.128950, -2031.650024)
```

## Markers

```
MRKR_SYRO  = 11160301;  -- Fulke steps (SEQ_000/020/040)
MRKR_RADULF = 11160302; -- Radulf step (SEQ_030)
SEQ_010 -> fieldBattle.marker("com0g4") = 11160303 (battle entry marker)
```

All three verified native in docs/Dat Mining/quest_marker.csv (inspected):
11160301 = (169.19, -174.75) layout 1000114 = serpent_fulke (1500200);
11160302 = (1131.75, 206.34) layout 2200199 = radulf (1001334);
11160303 = (-636.61, -2031.65) = com0g4_battle_entry (1099512).
The 1116030x family belongs to this quest's three objectives (marker families do
not match quest IDs: cf. Com0l4/111404 -> 1115030x, Com0u4/111804 -> 1117030x).
Com0g3 Quest 111603 merely shares the numeric prefix and deliberately returns {}
for its Haurtelle conversation; that does not affect this quest.

## Flags/Counters

```
(none of its own; reward idempotency via gc_reward_checkpoint flags 21/22/23:
 ACCEPTED unused here; SEALS_PAID=22, EXP_PAID=23)
```

## Dialog branches / handlers

```
function onStart(player, quest)                 -- StartSequence(SEQ_000)
function onFinish(player, quest)                -- (empty)
function onStateChange(player, quest, sequence) -- ENPC flags per SEQ; SEQ_010 sets PUSH entry + Fulke TALK
function onTalk(player, quest, npc)
function getJournalInformation(player, quest)   -- 277..281
function getJournalMapMarkerList(player, quest)
function onPush(player, quest, npc)             -- delegates to fieldBattle.onPush(..., "com0g4")
```

Dialogue (client delegates; plot text from GamerEscape /Plot_Details, fetched):

- SEQ_000 accept (`processEventStart`): Fulke briefs the Irmin Hedge rite, the
  cut-off linkpearl message from the conjurers' sentries NW of the city, and asks
  the player to reinforce them. Refuse branch stays on SEQ_000 ("You refuse? ...
  would you truly turn your back..."); accept (1) + AcceptQuest -> SEQ_010.
- SEQ_010 re-talk (`processEventStartAfter`): hint dialogue, no advance.
- SEQ_020 (`processEventFulke`): Fulke thanks the player, examines the letter sewn
  into the slain imperial's uniform; conjurers + elementals reveal the bearer was
  an Ala Mhigan, not Garlean; orders the letter carried to Little Ala Mhigo.
  Requires IMPERIAL_LETTER re-grant (see edge cases) -> SEQ_030 + Save.
- SEQ_030 (`processEventRadulf`): Radulf identifies the letter as Hagilo's,
  reveals Hagilo was a Resistance plant whose intel (Nael van Darnus moving west,
  changed invasion plans, savage soldiers, new magitek devices, forced-kill
  conditioning) he reads aloud; gives MAGITEK_DESIGNS concealed in the report.
  Saves SEQ_040 BEFORE consuming the letter -> disconnect-safe.
- SEQ_040 (`processEventClear`): Fulke reacts to the designs (shock at Imperial
  depravities, vows to send them to Garlond Ironworks) -> 500 Serpent Seals +
  1,541 EXP -> CompleteQuest, consumes MAGITEK_DESIGNS.

Item edge cases (all covered in onTalk):
- SEQ_020 re-grants IMPERIAL_LETTER via EnsureGCQuestItem (full-inventory refuse
  keeps SEQ_020 retryable; victory receipt is the saved sequence, not the item).
- SEQ_030 accepts either designs already held (partial-exchange retry) or the
  letter; refuses with EndEvent when neither is held.
- SEQ_040 accepts EXP-paid checkpoint as evidence after an interrupted close, and
  retires a leftover letter from an outlived Radulf exchange.
- Abandon/re-accept: standard journal flow; battle receipt (SEQ_020) only exists
  after a won fight; no stale items block re-accept (handoff checks are
  HasItem-based, and completion consumes evidence).

## Instance entry/exit

Entry: PUSH trigger 1099512 in zone 152 within 14u of
(-636.609985, -2031.650024), SEQ_010 only, same-area only
(gc_field_battles.onPush). Launcher: StartGrandCompanySquadBattle with
M.config("com0g4"): maxPartySize 3 (leader-only start), minimumLevel 22
(owner + every helper), partyRadius 30, boundaryRadius 45, timeout 1800s,
director `Quest/QuestDirectorGcCom0g4`, content script
SimpleContentGrandCompanySquadBattle, DisableReentry.

- Mounts: refused pre-start for owner ("Dismount your chocobo...") and every
  helper, re-checked after the source movie. No chocobo-companion/ally system
  exists server-side (no HasAlly/DismissAlly/Companion API in Map Server C# or
  lua; only mount state + path_companion quest NPC allies, which are never
  admitted to content areas), so nothing else can enter the instance.
- Private area is per-owner (`gc_sqb_com0g4_<playerId>`); kills credit only
  exact spawned uniqueIds in the owner's area (ambient same-class kills never
  count; assisting members without the quest never advance).
- Exit: ExitCurrentContentToReturnPoint to the saved public return point with
  reason grand-company-sqb-clear/fail; then ContentFinished/CheckDestroy +
  EndDirector. Failure returns to retrySequence 10 (visible retry at the same
  trigger); success advances to SEQ_020 + Save + grants IMPERIAL_LETTER.

Fail/retry/re-entry rules (gc_sqb_runtime.run loop, inspected):
death | timeout (30 min) | owner disconnect | quest abandoned/changed/reaccepted
| failed entry transition | owner leaves area -> finish(false) -> SEQ_010 retry.
 Success requires: entered + all 5 credited + owner connected, in-area, alive,
 quest still current. Wave-spawn failure also fails safe to retry.

## Instance layout/bounds

Public trigger arena, North Shroud (zone 152) near Camp Emerald Moss, map square
(24,17) — matches the archived walkthrough ("instance near Camp Emerald Moss at
24,17"). Boundary: circle radius 45 around the owner's entry position; entry
PUSH radius 14. All coordinates below verified with
tools/mobspawns/map_coordinates.py locate --zone 152 (map (24.64..24.70,
17.76..17.82); recorded ground nodes within ~2u; Y from nearest eligible frozen
walking support unless noted).

## Mob roster (all Lv19 + Lv22 boss; hostile, detectionRange 12)

```
wave 1  com0g4_funditor    actor 2280018  mob 40101  ARC  Lv19  left   (-639.609985, 19.397987, -2026.650024)  rot pi
wave 1  com0g4_bestiarius  actor 2280017  mob 40102  LNC  Lv19  right  (-633.609985, 18.796751, -2026.650024)  rot pi
wave 2  com0g4_triarius    actor 2280019  mob 40103  GLA  Lv19  left   (same as left slot)
wave 2  com0g4_speculator  actor 2280021  mob 40104  job23 Lv19 right  (same as right slot)
wave 3  com0g4_veles       actor 2280022  mob 40105  PGL  Lv22  center (-636.609985, 19.036030, -2025.650024)  rot pi
```

Support nodes: left 1514 (d 1.36), right 5675 (d 2.28), center 1515 (d 1.03);
trigger standing capture (-636.61, 18.129, -2031.65), nearest node 1836
(-636.508, 18.229, -2031.121). Display names: "imperial funditor" etc.
(uniqueIds `com0g4_<name>`).

Spawn waves/triggers: wave 1 pre-spawned at staging (asserted non-empty);
wave N+1 spawns when every wave-N uniqueId is credited dead (exact-actor
reconciliation: duplicate/fanned-out kill callbacks and foreign same-class
kills do not credit). requireAllTargets=true: all 5 kills required.

Abilities (server_battlenpc_skill_list / spell_list, inspected):
- funditor (list 87, ranged): raging_strike, heavy_shot, piercing_arrow, light_shot
- bestiarius (list 88, lancer): true_thrust, heavy_thrust, impulse_drive, feint
- triarius (list 91, tank): flash, fast_blade, flat_blade, savage_blade,
  riot_blade, shield_bash, phalanx
- speculator (spell list 4, caster): Cure, Stoneskin, Aero
- veles (list 86, pugilist boss): pummel, concussive_blow, pounce, haymaker

Stats (server_battlenpc_mob_types, inspected): speed 6, hostile, notorious 0,
detectionType 0, respawn 60 (unused: one-shot lifecycle), combatDelay 4200,
hp/mp auto (0), att 40, all resists 1.0, no loot table (dropListId 0; quest
evidence comes from the victory grant, not drops).
Aggro/leash: engine BNpc aggro inside the private area; one-shot scripted
lifecycle (ConfigureScriptedOneShotLifecycle) + director membership; boundary
circle 45 + no re-entry; leaving the area fails the fight to retry.

## Items / rewards

```
11000257 'Imperial Letter' (gamedata_items; victory grant at SEQ_020)
11000258 'Magitek Designs' (gamedata_items; Radulf handoff, consumed at complete)
Reward: 500 Serpent Seals (company 2, GrantGCQuestSealsOnce) + 1,541 EXP
  (archived Elemen row; no gil). Both seal + EXP payments are checkpointed
  (flags 22/23) so an interrupted close cannot double-pay on retry.
```

SQL quest rewards table has no 111604 row (rewards are script-paid like the
sibling Com0l4/Com0u4 quests); gamedata_quests row exists (see top).

## Parley

```
none
```

## Quest registry + rewards (SQL, inspected)

```
QUEST: (111604, 'The Mail Must Get Through', 'Com0g4', 111603, 22)
REWARDS: (script-paid) 500 Serpent Seals + 1541 EXP; no gamedata_quest_rewards row
ITEMS: (11000257,'Imperial Letter'), (11000258,'Magitek Designs')
MOBS: (40101..40105, gc_funditor/gc_bestiarius/gc_triarius/gc_speculator/gc_veles)
NPCS: serpent_fulke (1500200) zone 234; radulf (1001334) zone 171;
      com0g4_battle_entry (1099512) zone 152
```

## Loophole closure checklist

death | abandon | timeout | disconnect/re-enter | failed entry | area exit |
wave-spawn failure -> SEQ_010 retry (runtime); stale/replaced session, advanced
or reaccepted journal -> quest-changed fail-safe, never rewrites the new journal
(IsQuestBattleQuestCurrent + bound quest/data rebind only at session boundary).
Level: minimum 22 owner + helpers, checked pre-start and post-movie (no sync
system exists in 1.0; over-level is allowed, under-level refused). Bounds:
boundary circle + DisableReentry + area-exit fail. Repeats: one-time story quest
(SQL prereq chain 111603 -> 111604 -> 111605). Prerequisite breaks: gamedata
prereq 111603 enforced by quest offer logic; SEQ_020/030/040 handoffs re-verify
evidence each talk. Full inventory at letter/design grants: refuse with message,
sequence unchanged, retryable. Party: max 3, leader-only start, same-area +
radius + combat-class + alive + dismounted checks per helper; non-leader gets
the solo path and cannot drag a party.
