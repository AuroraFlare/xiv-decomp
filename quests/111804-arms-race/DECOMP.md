# Quest 111804 (com0u4.lua) — Arms Race

Source: FF14-Memory/Data/scripts/quests/com/com0u4.lua (186 lines, full body read)
Director: FF14-Memory/Data/scripts/directors/Quest/QuestDirectorGcCom0u4.lua
Runtime: FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua (full body read)
Launcher: FF14-Memory/Data/scripts/quests/com/gc_sqb_quest.lua (full body read)
Field battle: FF14-Memory/Data/scripts/quests/com/gc_field_battles.lua (full body read)
Placements: FF14-Memory/Data/scripts/quests/com/gc_field_battle_placements.lua (com0u4 route)
Manifest: FF14-Memory/Data/quest_npcs/gc_field_encounters.json (com0u4 entry read)
Registry: Data/sql/gamedata_quests.sql `(111804, 'Arms Race', 'Com0u4', 111803, 22)`
Guides: GamerEscape [Arms Race](https://ffxiv.gamerescape.com/wiki/Arms_Race)
quest page + [plot details](https://ffxiv.gamerescape.com/wiki/Arms_Race/Plot_Details)
(full bodies fetched); repo-cited video https://www.youtube.com/watch?v=OxWLJFjNA60
(observations in manifest: 3:49 Triarius/Speculator + Funditor/Bestiarius log,
5:16 Veles defeat completes objectives).

Story Lv22 Immortal Flames GC quest. Prereq Com0u3 (111803, Burning a Hole in
One's Pocket). Unlocks Com0u5 (111805, Burning Man). Combat type, DoW/DoM only.
Patch 1.18. Rewards are script-paid (no gamedata_quest_rewards row).

## Stages (SEQ)

```
SEQ_000 = 0;   -- Talk to Aubrey (accept)
SEQ_010 = 10;  -- Defeat the Hellhounds near the Golden Bazaar (private squad battle)
SEQ_020 = 20;  -- Return to Aubrey
SEQ_030 = 30;  -- Secure three arms contracts in Limsa Lominsa
SEQ_040 = 40;  -- Return to Aubrey (turn-in)
```

Journal text IDs: SEQ_000=344, SEQ_010=345, SEQ_020=346, SEQ_030=347, SEQ_040=348.

## NPCs/Actors

```
AUBREY       = 1500198; -- First Flame Lieutenant Aubrey, zone 233 (169, 0, -174.7)
C_NDANYA     = 1001632; -- Gigas Forge, Limsa zone 230 (-828.913, 6.0, 256.318)
RAAKA_MAAKA  = 1001631; -- Straight Edge Traders, Limsa zone 230 (-842.658, 3.104, 270.510)
BAMPONCET    = 1001633; -- Woolvale Arms, Limsa zone 230 (-853.560, 4.0, 268.120)
TRIGGER      = 1099513; -- com0u4_battle_entry push trigger, zone 171 (below)
```

NPC rows: server_eventnpc_spawn_locations.sql ids 2817 (Aubrey), 3231/3232/3233
(Limsa trio), 3239 (battle entry).

## Markers

```
SEQ_000/020/040 -> 11170303 (Aubrey)
SEQ_010         -> 11170301 (battlefield, via fieldBattle.marker)
SEQ_030         -> 11170306 (Gigas, if missing), 11170305 (Straight Edge, if missing),
                   11170304 (Woolvale, if missing)
```

Native markers use 111703xx, not the server quest's ID family.

## Flags/Counters

```
CNTR_CONTRACTS = 1;  -- count of held contract items (0..3)
Reward checkpoint flags 21/22/23 (accepted / seals paid / EXP paid)
```

## Dialog branches / handlers

```
function onStart(player, quest)            -- StartSequence(SEQ_000)
function onFinish(player, quest)           -- empty
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)        -- all SEQ branches + contract counting
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
function onPush(player, quest, npc)        -- fieldBattle.onPush("com0u4")
function onKillBNpc(player, quest, bnpc)   -- intentional no-op (director owns credit)
```

Refusal branch: processEventAUBREYStart returns accepted ~= 1 -> quest stays
offered; Aubrey's decline line ("The Hellhounds are notorious...") plays.

## Cutscenes / processEvents

```
processEventAUBREYStart  -- SEQ_000 accept offer (returns accepted flag)
processEvent_000         -- SEQ_010 reminder from Aubrey
processEvent_010         -- SEQ_020 victory report -> SEQ_030
processEvent_040 / _040_1 -- C'ndanya grant / already-held lines
processEvent_030 / _030_1 -- Raaka Maaka grant / already-held lines
processEvent_020 / _020_1 -- Bamponcet grant / already-held lines
processEvent_050         -- SEQ_040 turn-in -> seals + EXP + complete
```

Every delegate call is guarded by CanContinueGrandCompanyQuestDialogue; a
stale/removed journal aborts before any state write.

## Items / rewards

```
GIGAS_FORGE_CONTRACT   = 11000256;  -- from C'ndanya
STRAIGHT_EDGE_CONTRACT = 11000255;  -- from Raaka Maaka
WOOLVALE_ARMS_CONTRACT = 11000253;  -- from Bamponcet
Reward: 500 Flame Seals (company 3) + 1,760 EXP, no gil (Elemen row).
```

Grant path uses EnsureGCQuestItem (full-inventory retry message, no advance).
Turn-in requires HasGCQuestCompletionEvidence; lost contracts after SEQ_030
reopen SEQ_030 instead of stranding the report. Seals/EXP are once-only via
flags 22/23; EXP checkpoint keeps post-crash retries usable after items burn.

## Instance entry/exit

Dynamic content area via StartGrandCompanySquadBattle, content script
SimpleContentGrandCompanySquadBattle, director QuestDirectorGcCom0u4:

```
zone 171 Eastern Thanalan (map page 1200, base 2687/3072, scale 1)
entry trigger 1099513 at (1152.500, 311.774, -952.160), map (38.395, 21.198)
push radius 14 yalms; party radius 30; boundary circle radius 45
timeout 1800s (30 min); max party 3 (leader + up to 2); minimum level 22
```

Height evidence (map_coordinates.py locate --zone 171 --world 1152.5 -952.16):
52 recorded nodes in radius; node 11094 (1152.674, 311.969, -952.156) 0.17
yalms from center; trigger Y from accepted standing capture; target Y from
nearest frozen walking support at retained authored X/Z. No chocobo: leader
and every member must be dismounted (actionable error otherwise). No level
sync: minimum-level gate only, matching 1.x GC behavior. DisableReentry: no
mid-fight rejoin; disconnect/exit/death/timeout/abandon all fail back to
SEQ_010 with the entry marker restored.

## Mob roster (guide coordinates, all 5)

"Hellhounds" are Garlean mercenary brigands (human imperial unit), NOT the
hellhound beast (mob type 1361 / actor 2109801 suggested by the old
quest_bnpc_materialization_candidate_atlas — that suggestion is wrong for
this quest; journal + plot dialogue + video all show imperial soldiers).

```
wave 1 left   funditor    actor 2280018 mob 40101 job 7  lv19 skills 87
              (1149.500, 311.642, -947.160) rot pi  support node 11124 d=2.96
wave 1 right  bestiarius  actor 2280017 mob 40102 job 8  lv19 skills 88
              (1155.500, 312.036, -947.160) rot pi  support node 11125 d=2.34
wave 2 left   triarius    actor 2280019 mob 40103 job 3  lv19 skills 91
              (1149.500, 311.642, -947.160) rot pi  support node 11124 d=2.96
wave 2 right  speculator  actor 2280021 mob 40104 job 23 lv19 spells 4
              (1155.500, 312.036, -947.160) rot pi  support node 11125 d=2.34
wave 3 center veles       actor 2280022 mob 40105 job 2  lv22 skills 86
              (1152.500, 312.036, -946.160) rot pi  support node 11125 d=2.00
```

Slots: left/right offset (+/-3, +5), center (0, +6) from trigger. Display
names "imperial funditor" etc. Mob rows: server_battlenpc_mob_types.sql
1391-1395. Video matches: lv19 wave pairs, lv22 Veles last.
`!pos 171 1152.500 311.774 -952.160` reproduces the entry in game.

## Spawn waves/triggers/abilities

Wave 1 spawns at content staging; wave N+1 spawns only after every wave-N
target is credited dead (exact spawned-actor reconciliation by uniqueId —
ambient same-class kills and duplicate callbacks never credit). requireAllTargets
means all 5 kills are required. Aggro: standard hostile detection on content
members (detectionRange per mob row); leash: boundary circle + area-exit
detection fails the run. Abilities: beast-free humanoid kits via skillListId
87/88/91/86 and speculator spellListId 4 (see mob_job_inference.md for
job->kit mapping; jobs 7/8/3/23/2).

## Fail/retry/re-entry rules

Death, timeout (30 min), disconnect, area exit, quest abandon/reaccept,
entry failure, or wave-spawn failure -> finish(false) -> retrySequence SEQ_010,
party returned to public return point, targets despawned, content destroyed.
No lockout: immediate retry at the entry trigger. Success -> onSuccess ->
SEQ_020 + save + ENPC update. Owner binding is character-fixed across relog;
helpers can never inherit ownership. Combat-class check (DoW/DoM) and mount
check run before any allocation.

## Quest registry + rewards (SQL, inspected)

```
QUEST: (111804, 'Arms Race', 'Com0u4', 111803, 22)
UNLOCKS: (111805, 'Burning Man', 'Com0u5', 111804, 25)
REWARDS: none in gamedata_quest_rewards.sql (script-paid seals+EXP)
AVAILABILITY: quest_availability.lua line 326, implemented
```
