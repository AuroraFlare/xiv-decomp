# 110008 actors + positions/rot (all placements grounded via mob_map_coordinates)

Tool: `tools/mobspawns/map_coordinates.py` (guide `docs/mob_map_coordinates.md`).
Zone 153 = West Shroud, native page 2300 (scale 1, base 3104/3808).
Heights below are recorded node heights / static SQL — no invented ground.

## Boss: Spirit of the Wood

- Actor 2105201 / BNPC 1364, Lv 28, HP 2930, display "Spirit of the Wood".
- Profile: `Data/sql/server_battlenpc_mob_types.sql:644` + live migration
  `Data/sql/live migrations/beckon_spirit_of_the_wood.sql` (idempotent REPLACE).
- Spawn (director `spawnSpiritOfTheWood`): `153, PrivateAreaMasterPast/1`,
  X -1996.878 Y -10.907 Z -910.502 rot -2.399.
- Grounding: `locate --zone 153 --world -1996.878 -910.502` -> map (11.07, 28.97),
  44 recorded pts in radius, nearest node 97 (-1995.815, -10.792, -909.136) ~1.7u.
- Combat mods (director): MP 600, Damage 12, AutoAttack -70, PhysicalAction -45,
  SpellDamage -45; arena circle clamp center (-2015.643, -929.240) r 33.5.

## Allies (pre-spawned into target area before zone-in, static SQL twins)

| Ally | Class | Unique | X / Y / Z / rot | HP/MP/dmg |
|---|---|---|---|---|
| Grinnaux | 2290015 | man2g0_seq004_grinnaux | -2008.446 / -11.889 / -927.905 / 0.564 | 950/300/55 |
| Handeloup | 2290016 | man2g0_seq004_handeloup | -2005.962 / -11.811 / -929.211 / 0.564 | 850/300/65 |
| T'kebbe | 2290017 | man2g0_seq004_tkebbe | -2001.697 / -11.678 / -928.732 / 0.564 | 700/700/25 |
| Farrimond (reinforce) | 2290018 | man2g0_seq004_farrimond | -2008.446 / -11.889 / -927.905 / 0.564 | 850/300/60 |
| Burchard (reinforce) | 2290019 | man2g0_seq004_burchard | -2005.962 / -11.811 / -929.211 / 0.564 | 950/300/55 |

All Lv 28, AI DPS, quest-ally profiles `110008/grinnaux|handeloup|tkebbe|farrimond|burchard`,
arena-circle clamped, Grinnaux/Handeloup hold ranged position.
Static rows: `server_eventnpc_spawn_locations.sql` 1142-1144 (153/1).
Grounding: Grinnaux point -> 51 recorded pts, nearest node 116 ~2.4u.

## O-App-Pesi (ward giver, talk-enabled, NO quest marker in SEQ004 — retail)

- Arena: 1000235 `man2g0_seq004_oapppesi` 153/1 at -2013.375 / -11.986 / -926.686 rot -2.953
  (SQL row 1145). Staging: 1000033 `man2g0_seq003_oapppesi` 206/9 at
  227.901 / 10.751 / -1246.293 rot 3.110 (row 1140).
- Ward items (gamedata_items): 11000082 wind / 11000083 earth / 11000084 water, one held max.

## Fire props (burning tree, transient BG b998/e018)

- Actor class 1080056, appearance 1200136, motion pack 100, 5 layers cycled every 3s.
- Stack A `man2g0_seq004_burning_tree_fire`: -2008.467 / -11.156 / -906.646 rot 0.022.
- Stack B `..._fire_b`: -2008.374 / -11.112 / -906.369 rot -3.086.
- Grounding: stack A -> 45 recorded pts, nearest node 99 ~7.7u (prop at tree, not footpath).

## Boundary / landing / recovery

- Boundary circle: center (-2015.643, -929.240) r 35.0 (actors r 33.5), fitted from
  recorded Zone-153 perimeter lap; also `SimpleContentMan2g01` boundary line
  (-2057.796, -890.155, n=0.871033/-0.491224).
- Player landing: -2017.174 / -11.625 / -943.275 rot 0.546 = recorded node 111 EXACT
  (distance 0.0, 58 pts in selection). `!pos 153 -2017.174 -11.625 -943.275`.
- Spirit flee points (authored interior, wall-safe): (-1997.200,-10.950,-912.900),
  (-2003.610,-11.270,-921.250), (-2011.840,-11.640,-934.120), (-2018.320,-11.720,-943.260),
  (-2008.800,-11.150,-908.400).
- Win/fail recovery warp: zone 206, 220.416 / 10.750 / -1248.641 rot -0.061 —
  ~24u from public Nonolato (232.88, 12.46, -1268.94, row 699), i.e. outside
  Quiver's Hold per retail KO note. 6 recorded pts in selection.
- Echo exit prop in arena: 1290003 `man2g0_seq004_echo_privatearea_exit`
  (-2013.637, -11.957, -928.453).

## Key ENPC ids

Miounne 1000230, Nonolato 1000463, A'naidjaa 1000465, Soileine 1000234/1700030,
E-Sumi-Yan 1000011, Dunstan 1000013, Fye 1000014, Yda/Papalymo 1000009/1000010,
crowd 1000016-1001489, pushes 1090178-1090180.
