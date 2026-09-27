# 110006 actors, triggers, markers, positions

Map squares via `map_coordinates.py` (zone 150 page 2000; base 3104/3808).
Heights: recorded-ground status per the coordinate guide (a Y is only
grounded at its own recorded position).

## Duty geometry (zone 150 private copy `SimpleContentMan0g101`)

| Point | X | Y | Z | Rot | Map | Ground |
| --- | --- | --- | --- | --- | --- | --- |
| Entry (SOULS_ENTRY) | -195.221 | 3.535 | -1022.112 | 0.604 | (29.09,27.86) | unrecorded (nearest node 137y) |
| Route wp0 | -196.080 | 3.534 | -1023.357 | - | (29.08,27.85) | same gap |
| Route last = end trigger | -723.526 | 21.898 | -1083.017 | - | (23.80,27.25) | 55 pts in 30y; node 1443 @1.4y |
| Fail return (gate) | -188.705 | 3.601 | -1014.320 | 0.0 | (29.15,27.94) | trigger SQL row 1096 |
| Boundary square | X -790..-170, Z -1125..-800 | | | | | fixed box |

Total route length 1002.1y over 341 waypoints.

## Ambush stops + mobs (all bnpc 1365 `ankle_biter`, actor 2205603, Lv1)

| Stop | wp idx | Stop XYZ | Mob XYZ | Mob rot | dH | Map | Ground |
| --- | --- | --- | --- | --- | --- | --- | --- |
| stop1 ambush1 | 16 | -186.60, 4.24, -982.57 | -194.71, 6.48, -970.11 | 2.58 | 14.9 | (29.09,28.38) | UNRECORDED (nearest 92y); mob +2.24y over stop |
| stop2 ambush2 | 73 | -188.02, 4.27, -833.67 | -204.63, 4.54, -821.28 | 2.34 | 20.7 | (28.99,29.87) | 59 pts; Y 4.6 @3.4y (dY 0.06) |
| stop3 ambush3 | 151 | -378.13, 4.32, -887.44 | -386.48, 4.37, -900.60 | 0.63 | 15.6 | (27.18,29.07) | 59 pts; Y 4.21 @0.9y (dY 0.16) |
| stop4 ambush4 | 259 | -635.49, 3.96, -951.39 | -646.15, 3.56, -964.16 | 0.57 | 16.6 | (24.58,28.44) | 51 pts; Y 3.56 @0.9y (dY 0.0) |
| stop5 ambush5 | 333 | -704.01, 23.08, -1090.48 | -717.38, 22.50, -1081.39 | -1.23 | 16.2 | (23.87,27.27) | 53 pts; Y 22.34 @2.1y (dY 0.16) |

Mob spawn = uniform disc radius 6.0 around mob point, same Y. Private
content mobs come from this JSON only — never public spawn SQL (guide rule).

## SQL triggers (public-zone rows; content spawns its own copies)

- 1090202 `man0g1_s060_ESCORT_START_TRIGGER_SHROUD` zone 150
  (-188.705, 3.601, -1014.320, rot 0) row 1096
- 1090202 `man0g1_s060_ESCORT_START_TRIGGER_GRIDANIA` zone 206, same XYZ, row
  2710 (content is still created from zone 150)
- 1090203 `man0g1_s065_ESCORT_END_TRIGGER` zone 150
  (-723.526, 21.898, -1083.017, rot 0) row 1097
- Content completion copy: uniqueId `man0g1_completion_escort_end_trigger`,
  same XYZ, event `pushDefault` type 2.

## Quest actors (class IDs from man0g1.lua)

Miounne 1000230; Hereward 1000231; Soileine 1000234; Opyltyl 1000236;
Fufucha 1000237; Powle 1000238; Sansa 1000239; Willelda 1000242;
Burchard 1000243 (+instance 1002061); Yda 1000009; Papalymo 1000010;
O-App-Pesi 1000033; T'kebbe 1000015; Farrimond 1000017; Ingram 1000372;
Nicoliaux 1000409; Aunillie 1000410; Elyn 1000411; Ryd 1000412;
Vkorolon 1000458; Hetzkın 1000460; Gugula 1000513; Wisply 1000562;
Swethyna 1000680; Nuala 1000681; Mansel 1000682; Cecilia 1000683;
Turstin 1000733; Langloisiert 1000734; Helbhanth 1000735; Biddy 1000737;
Pasdevillet 1000738; Jijimaya 1000741; Challinie 1000956;
adventurers 1001057-1001062; passerby 1001648; blocker 1090372;
CNJ_TRIG 1090200; KIDS_TRIGGER 1090201; STUMP_TRIGGER 1090204;
STUMP_EXIT_TRIGGER 1090205; BTN_TRIGGER 1090046; leash marker 1090384.

## Escort pair

- Powle: actor 1000238, lead (lag 0.0, side 0.0), HP-monitored (actor 0)
- Sansa: actor 1000239 (lag 9.0, side -1.1), follows
- Ally Lv1 (escortLevel 1), level badge hidden, allegiance Player,
  non-aggressive, not in claim party. Display-name IDs: Powle 1000029,
  Sansa 1100025. Speak-anim index: Powle 0, Sansa 1.

## Markers 11000601-11000620

000 Miounne / Bentbranch / 010 Miounne / 015 Hereward, Soileine, CNJ guild,
Swethyna / 040 Opyltyl / 050 kids / 055 kids trigger / 060 escort start /
065 escort end / 070 stump / 071 stump exit / 072 BTN / 080 Willelda /
085+090 Burchard / 095 Nuala / 105 Miounne.
