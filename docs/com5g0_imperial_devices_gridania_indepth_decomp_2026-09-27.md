# Com5g0 Imperial Devices (Gridania) (111610) indepth decomp - 2026-09-27 (GC TWIN ADDER)

Side Lv25 instance. Fulke (Adders' Nest, zone 234) -> Bloisirant (Toto-Rak
entrance, South Shroud zone 154) -> Thousand Maws of Toto-Rak instance (zone
159, 2-4 players Lv25+, 60 min) -> A-Ruhn-Senna -> dungeon moogle (Magitek
Recording Plate 11000260) -> Bloisirant report -> Fulke reward (2160 EXP +
1000 Serpent Seals). Status: ENABLED route; dungeon shared with Com5l0/Com5u0.

## Client scenario (com5g0.csv texts 2-76, read in full this pass)

- `processEventFULKEStart`: texts 2-11 (Kan-E-Senna divination, Maws sealed
  then breached, beast legion, woodsin sickening first expedition, 2-to-4
  party ask). Accept uses `showQuestInfomation()==1` result; decline plays 9.
- `processEvent_010` + `processEvent_010_1`: Bloisirant briefing, texts 14-27
  (expecting the adventurer, Padjal rescue orders, re-entry lockout + Timers
  tab, 60-minute forced-exit rite, walk-out/magitek-transporter exits,
  Return-to-entrance on KO, respect warning). Args: 1 slot carrying the
  duration minutes (row 22 uses its first argument).
- `processEvent_020`: A-Ruhn-Senna meeting, texts 33-47 (found via entrance,
  came to save moogles, crystal scream frenzying beasts, moogles safe and
  resting, hands over the plate pried from the magitek device, device tries
  to measure aether, "ask the moogles if you know their words").
- `processEvent_030`: moogle, texts 48-56 (recognizes adventurer, dancing in
  flower fields then abducted here, blames the device, pried off loose parts,
  A-Ruhn saved them, Raya-O will scold).
- `processEvent_050`: Bloisirant report, texts 57-61 + 76 (Nest confirms
  Padjal+moogles left, conjurers say device measures aether, plate must go
  to Fulke at once).
- `processEvent_060`: Fulke finale, texts 62-70 (A-Ruhn-Senna identity, device
  is Garlean, measures aether rather than causing woodsin, Ironworks referral,
  seals reward).
- Entry gating texts 71-72 (DoW/DoM Lv25+, 2-4 members), loot-list auto-transfer
  text 75, decline text 31. No quest-local boss cinematic: entry/return reuse
  the occupancy director (`rad0f300`-`rad0f308` lane).

## Stages / flags / markers / positions

- Sequences: 0 offer/Fulke -> 10 Bloisirant entry -> 20 A-Ruhn (owned
  instance NPC) -> 30 moogle proof -> 50 Bloisirant report -> 60 Fulke reward.
  Entry transitions 10->20 on landing (server `TotorakEntryQuestTransitions`).
- Journals (xtx): 292 offer, 293 entry, 294 inside (both 20 and 30), 295
  report, 296 reward. No zone-159 marker surface: ENPC flags are
  authoritative (recovered marker table has no Maws surface for these steps).
- SQL: `(111610,'Imperial Devices (Gridania)','Com5g0',111603,25)`; prereq
  111603 Adder's Nest Egg; offer enabled in `quest_availability.lua:321`;
  sibling city variants mutually exclusive only while a sibling is active.
- Public anchors (direct tool runs this pass): Fulke zone 234 page 60
  map (1.96,1.21) cell (1,1), `!pos 234 169.000 0.000 -174.700` (SQL row
  2810, 50 recorded pts in 30u); Bloisirant zone 154 South Shroud page 2400
  map (39.40,44.51) cell (39,44), `!pos 154 835.642 -12.682 643.485` (SQL
  row 3033 exact).
- Instance landing: zone 159 page 3600 (base -544/-224, scale 2, piece 1241)
  `!pos 159 883.064 -24.571 654.586` rot 1.186 = map (3.39,4.31) cell (3,4),
  live node 1 exact, 16 recorded pts in cell. Exit/disconnect recovery:
  zone 154 entrance above, rot 2.502. Bounds: runtime content copy of zone
  159; Session boundary enforcement; 60-min duty timer; 15-min re-entry
  lockout (`TIMER_TOTORAK`, Timers tab); Return lands at instance entrance.

## NPCs / mobs (guide coordinates from direct zone-159 page-3600 runs)

- A-Ruhn-Senna 1001571: Field I (1128.433,-45.000,890.672) map (5.84,6.67)
  cell (5,6), 34 recorded pts in 30u; Field II (1161.816,-49.000,697.667)
  map (6.18,4.74) cell (6,4), live capture only (0 recorded pts). Matches
  archive map (5,6)/(6,4). Pudgy Moogle 1000328 + Teary Moogle 1000407 share
  both trios (offsets ~2u). Owned-instance check required; public lookalikes
  cannot advance.
- Corridor roster: 46 live-captured packs, 99 enemies, each pack its own
  `MonsterParty` (local assist only, no cross-pack chain). Families:
  Prison Pteroc 2300101/3126 lv35 1000hp 24dmg; Cell Mite 2301101/3127 lv39;
  Mitetrap 2302702/3128 lv32 1200hp; Prison Pudding 2303401/3129 lv35 1300hp
  ranged + fixed element (Thunder 27313 / Aero 27353 / Fire 27310, matching
  absorb, model states 3/4/1); Tainted Louse 2305601/3130 lv32 700hp;
  Gaoler's Lantern 2309901/3131 lv35 1100hp ranged; Mun-Tuy Sapling
  2302701/3132 lv35 1200hp; Void Flame 2301601/3125 lv39 2400hp 36dmg.
  Sample direct runs: Louse swarm captured_002 (1024.8,874.4) map (4.81,6.50)
  cell (4,6), node 76 within 2.1u; Puddings captured_016 (1242.9,817.6) map
  (6.99,5.94) cell (6,5); conditional Void Flame (1232.0,733.0) map
  (6.88,5.09) cell (6,5). Full 99-actor XYZ in
  `Data/scripts/directors/Occupancy/TotorakEncounter.lua` CORRIDOR_GROUPS.
- Bosses (spawn only after own terminal + intro scene; separate chamber
  parties; detection 18u): Antares 2301102/3001 lv38 14khp 52dmg at
  (1251.683,-46.946,929.946) map (7.08,7.06) cell (7,7); Sargas 2301103/3093
  lv38 at (1475.059,-58.909,636.072) map (9.31,4.12) cell (9,4); Shaula
  2301104/3095 lv40 18khp 60dmg at (1348.799,-62.943,542.707) map (8.05,3.19)
  cell (8,3). Adds: Antares/Sargas 3x Horde Mite (2301107/3123, 2301108/3124)
  lv39 2800hp, 8s respawn, spawn on engage off; Shaula 3x Bastard Mite
  2301105/3121 opening, slots convert to endless Widow's Suitor 2301106/3122
  lv39 3400hp inheriting boss target. Any boss death finishes the expedition.
- Terminals/coffers: field terminals (1103.211,-44.132,879.967) and
  (1135.680,-48.132,688.103); boss terminals per route; 6 route coffers
  (live-captured anchors) + fixed + conditional reward coffers (Void Flames,
  all field levels, sub-25-min, all 6 route coffers) in 5 surveyed slots per
  chamber. Photocells: 4 per terminal, party-shared.

## Rewards / fail / retry / re-entry

- Quest: 2160 EXP + 1000 Serpent Seals, persisted receipt flags 22/23
  (seals before closing yield; no double pay on retry; seal-cap refusal
  keeps report retryable; leftover plate retired after saved exchanges).
- Dungeon loot: route coffers ~1/6 unique else Grade 3 Dark Matter/gil;
  center boss coffer 0-2 of 4 armor pieces; gil split, items random
  recipient; loot list auto-transfers on exit, overflow lost (text 75).
- Fail/retry: KO -> Return to instance entrance, continue in-timer; timeout
  -> forced exit, quest stays at inside seq, re-enter after 15 min via
  Bloisirant re-prompt (seq 20/30); disconnect -> SessionCleanup to zone-154
  entrance, directors/group cleared, quest untouched; abandon -> standard
  journal removal, re-accept restarts at 0 (sibling lock releases); no level
  sync (fixed mob levels 32-40); mounts barred in any private area
  (`IsMountRestrictedArea`); no companion actors spawn; no chocobo inside.
- Proof recovery (this pass): reaching 50/60 proves the plate was earned, so
  a discarded plate is re-issued at Bloisirant/Fulke instead of stranding
  (retail clients barred discards; this server permits them).

## Sources

com5g0.csv rows 2-76 (full dialogue/req text); `totorak_gc_quest.lua` Com5g0
config + handlers; `totorak_entry.lua` (2-4/Lv25/60min); `TotorakEncounter.lua`
roster/waves; `WorldManager.cs` entry validation + instance state + cutscene
keys; `PrivateAreaContent.cs` terminals/coffers; `SessionCleanup.cs` recovery;
`Player.cs:IsMountRestrictedArea`/`DiscardItem`; `map_coordinates.py` direct
zone 159/154/234 runs (cells above); GamerEscape Imperial Devices (Ul'dah)
journal chain (sibling route analog); Toto-Rak 1.0 video/strategy guides
(Fevir/BlueGartr list, console wiki) for staging/fight shape.
