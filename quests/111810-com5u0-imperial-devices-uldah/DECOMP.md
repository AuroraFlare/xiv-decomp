# Quest 111810 — Imperial Devices (Ul'dah) (Com5u0)

Side Grand Company quest, Lv25, instanced in the Thousand Maws of Toto-Rak
(zone 159). Ul'dah / Immortal Flames variant of the three-city Imperial
Devices family (Limsa 111410 / Gridania 111610 / Ul'dah 111810).

Sources (all bodies inspected): `FF14-Memory/Data/scripts/quests/com/com5u0.lua`,
`quests/com/totorak_gc_quest.lua` (413 lines), `Data/scripts/totorak_entry.lua`
(210 lines), `Data/scripts/directors/Occupancy/TotorakEncounter.lua` (corridor
families, 46 captured groups, 99 actors, bosses, terminals, coffers),
`Map Server/WorldManager.cs` Toto-Rak instance block, `Map Server/Utils/
SessionCleanup.cs` disconnect recovery, `docs/gc_client_commands_2026-09-18.md`,
`docs/gc_finalization_2026-09-17.md`, `docs/totorak_implementation_2026-07-18.md`,
`docs/mob_map_coordinates.md` (fully read; all positions below verified through
`tools/mobspawns/map_coordinates.py`, zone 159 page 3600, base 544/224, scale 2),
[GamerEscape wiki](https://ffxiv.gamerescape.com/wiki/Imperial_Devices_(Ul%27dah))
(fetched: journal text, party/level rules, sibling exclusivity, proof items),
YouTube strategy guides via web search (Fevir Toto-Rak boss guide
`NCWjvLEft5Y`, Toto-Rak dungeon runs `w4vPyHU97qw`), SE forum threads on
Toto-Rak entry rules, eLeMeN 1.x Toto-Rak archive (gameplay source cited in
the encounter script).

## Registration

```
QUEST: (111810, 'Imperial Devices (Ul'dah)', 'Com5u0', 111803, 25)
PREREQ: 111803 Burning a Hole in One's Pocket (Flame seal tutorial)
AVAILABILITY: quest_availability.lua — Implemented - instance (Com5u0)
REWARDS: script-paid, no gamedata_quest_rewards.sql rows (seal-once checkpoint)
```

The three Imperial Devices variants are mutually exclusive while active
(GrandCompanyOpeningQuestRules; native journals Wil 349-356 family). Accepting
Ul'dah suppresses the Limsa/Gridania offers until completion or abandonment.
Into the Dark (111811) is independent of this quest.

## Quest flow (sequences)

```
0  Aubrey (Flame Lieutenant 1500198, Hall of Flames, zone 233)
      !pos 233 169.0 0.0 -174.7 — processEventAUBREYStart, accept -> 5
5  Nuala (Wood Wailer 1000681, Wailing Barracks Gridania, zone 206)
      !pos 206 195.17 27.9 -1578.8 — processEvent_005 entry permission -> 10
10 Bloisirant (1001150, Toto-Rak entrance, zone 154)
      !pos 154 835.642 -12.682 643.485 — processEvent_010 + entry ask;
      landing in zone 159 advances 10 -> 15 (AdvanceTotorakEntryQuest)
15 Owned dungeon moogle (1000327/1000328/1000329/1000407 incl. Teary Moogle)
      — processEvent_015, CanUseTotorakQuestNpc ownership check;
      grants SHATTERED_GAUNTLET 11000261 + MAGITEK_COOLING_PLATE 11000262 -> 20
20 Bloisirant report (proof check) — processEvent_020 -> 25
25 Aubrey reward — GrantGCQuestSealsOnce BEFORE the closing yield, then
      processEvent_025 + CompleteGCQuestOnce: 2160 EXP + 1000 Flame Seals
      (sealId 1000203). Seal-cap refusal preserves proof for retry.
```

Journals (Wil): 0=349, 5=350, 10=351, 15=352, 20=353, 25=354. Every delegate
return rechecks the accepted quest/data/sequence
(CanContinueGrandCompanyQuestDialogue); stale continuations return before any
item/reward work and never close a replacement event. Declining the entry ask
(`choice ~= 1`) leaves sequence 10. Inside sequences re-expose Bloisirant for
re-entry when the player left without proof.

## Instance layout (zone 159, page 3600)

Map transform (native table binding): `mapX = (X - 544) / 100`,
`mapY = (Z - 224) / 100`. Entry landing `!pos 159 883.064 -24.571 654.586`
is map (3.39, 4.31), cell (3,4), exactly recorded node 1. Exit returns to
`!pos 154 835.642 -12.682 643.485` (Bloisirant).

Entry gates: party of 2-4, leader starts, all entrants at the zone-154
entrance, combat discipline, Lv25+ (GetTrueLevel), no active TIMER_TOTORAK
re-entry lock, 60-minute duty clock, 15-minute re-entry lock after exit.
Dismount gate (this pass): every entrant and every rejoiner must have
GetMountState() == 0 — no chocobo (or goobbue) companion inside the instance.

Field terminals (4 shared photocells each): T1 opens Field I at
`!pos 159 1103.211 -44.132 879.967` (cell (5,6)); T2 reopens for Fields II/III
at `!pos 159 1135.68 -48.132 688.103` (cell (5,4)). Boss terminals: Antares
`!pos 159 1210.318 -48.132 912.115`, Sargas `!pos 159 1456.127 -59.2 679.066`,
Shaula `!pos 159 1304.773 -63.122 559.313`. Opening/progress/intro/death
cutscenes rad0f300-rad0f308.

Quest trios (A-Ruhn-Senna 1001571 + Pudgy 1000328 + Teary 1000407 Moogles):
Field I (cell (5,6)) `!pos 159 1130.173 -45.0 890.117` (nearest group);
Field II (cell (6,4)) `!pos 159 1163.639 -49.0 697.774` — recorded node
`!pos 159 1163.765 -48.893 691.116` is 6.7 yalms away (map_coordinates locate).
Any owned moogle actor can advance the Com5u0 proof step.

Route coffers (live captures): entrance_44 Torturer's Monocle
(1008.705,-40.954,647.040); first_55 Warden's Barbut
(1104.558,-48.068,764.237); field1_66 Brigand's Acton
(1159.248,-45.002,852.239); field2_74 Brigand's Gloves
(1292.934,-56.996,648.892); field3_54 Torturer's Duckbills
(1091.531,-50.964,654.457); field3_64 Warden's Gauntlets
(1218.751,-52.0,665.180). Reward coffers fill room-survey slots 1-5 per route;
reward conditions: fixed clear, 2 Void Flames, all 3 field levels, under
25 minutes, all 6 route coffers.

## Mob roster (all live-capture XYZ in TotorakEncounter.lua)

Corridor families (classId/bnpcId/level/HP/damage):

- Prison Pteroc 2300101/3126, Lv35, 1000/24, melee
- Cell Mite 2301101/3127, Lv39, 1000/24, melee
- Mitetrap 2302702/3128, Lv32, 1200/25, melee
- Prison Pudding 2303401/3129, Lv35, 1300/27, ranged + fixed elemental aspect
- Tainted Louse 2305601/3130, Lv32, 700/22, melee
- Gaoler's Lantern 2309901/3131, Lv35, 1100/26, ranged
- Mun-Tuy Sapling 2302701/3132, Lv35, 1200/25, melee
- Void Flame 2301601/3125, Lv39, 2400/36, melee (2 tracked at
  (1231.977,-56.158,733.011) and (1237.755,-55.34,753.599))

46 corridor groups (entrance_pterocs + captured_001..045), 99 exact actors:
60 at Lv35, 31 at Lv32, 8 at Lv39. Each group owns a server MonsterParty;
enemies join the occupancy director WITHOUT the instance-wide content group,
so pulls never chain across corridors or boss chambers. Detection 10 yalms,
finite spawn leash 125 (IgnoreSpawnLeash=0), scripted one-shot lifecycle
(dead actors never respawn mid-run). Pudding aspects: lightning/Thunder 27313
(model state 3), wind/Aero 27353 (state 4), fire/Fire 27310 (state 1), with
matching-element absorb for life. No companion/ally/Trust spawns exist in the
instance (static-guarded).

Bosses (live-captured chambers; outside the 287-node movement recording):

- Antares 2301102/3001, Lv38, 14000 HP, dmg 52, cell (7,7),
  `!pos 159 1251.683 -46.946 929.946`; Horde Mite adds 2301107/3123 (Lv39,
  2800/36) on captured local offsets, replenished every 8s.
- Sargas 2301103/3093, Lv38, 14000 HP, dmg 52, cell (9,4),
  `!pos 159 1475.059 -58.909 636.072`; Horde Mite adds 2301108/3124,
  same replenishment.
- Shaula 2301104/3095, Lv40, 18000 HP, dmg 60, cell (8,3),
  `!pos 159 1348.799 -62.943 542.707`; opens with 3 Bastard Mites
  2301105/3121 (Lv39, 3400/42); each dead slot converts to an endlessly
  replenished Widow's Suitor 2301106/3122 reusing the opening anchors
  (addsReplaceInitialSlots). Boss detection 18 yalms. Adds inherit the
  boss's current target once on spawn, then use their own hate.

Any one boss kill finishes the expedition: fixed + earned reward coffers
spawn, the death scene closes the duty timer, and the chamber porter offers
voluntary exit. Com5u0 proof comes from the moogle step, not the boss kill,
so a party can clear proof without killing a boss and vice versa.

## Fail / retry / re-entry rules

- Death: KO'd members release; the instance persists for the living party.
  Re-enter through Bloisirant while the instance is live (rejoin gate:
  entrance zone, class, level, timer, dismount checks).
- Timeout (60 min) / full wipe / voluntary exit: content exit to Bloisirant;
  TIMER_TOTORAK blocks re-entry for 15 minutes.
- Disconnect: SessionCleanup recovers the player to the zone-154 entrance;
  quest sequence and proof items persist; rejoin as above.
- Abandon: journal removed; sibling offers (Limsa/Gridania) restore via
  availability recompute; proof items remain but are inert without the quest.
- Repeats: standard completion history; helpers without the quest may enter
  but only holders advance 10->15 and receive proof/rewards.
- No level sync (retail-accurate 1.x): entry floor Lv25 vs Lv32-40 dungeon.
