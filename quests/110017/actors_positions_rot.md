# Man308 actors, positions, rotations

Sources: cutscene-spatial decode (`decompile_man308_cutscene_setup.py`,
exit 0 this pass against the installed client), `quest_marker.csv`,
`gamedata_actor_class.sql`, `server_battlenpc_mob_types.sql`,
`server_eventnpc_spawn_locations.sql` (spawn ids 3072–3074), journal rows
218–222. Cutscene transforms below are the decoder's `EXPECTED_ANCHORS`;
only the listed route/content/combat/return anchors are server positions.

## Quest NPCs and triggers (persistent)

| NPC / trigger | Actor class | Where |
|---|---|---|
| Minfilia | 1000843 | Waking Sands; SEQ_020 `pE90` + reward |
| Path companion (SNPC) | per-player `getSnpcActorClassID` | Gold Court offer, content talk + combat ally |
| Ul'dah market entrance | 1090265 | SEQ_ACCEPT → Gold Court warp; SEQ_020 → Waking Sands entry |
| Gold Court offer trigger | 1090187 | Zone 209; `pES` accept |
| Paglth'an gate trigger | 1090188 | Zone 174; `pE01`/`man30800` |
| Paglth'an approach trigger | 1090189 | Zone 174; content entry / recovery |

Gold Court: zone 209 `(-147.633, 198.000, 160.064)` rot `0.000`. Gate scene
PC anchor (`man30800`): `(1240.229, 319.338, 746.182)` rot `-0.929` (marker
11001701 at `1239,746`). Approach PC anchor (`man30810`):
`(1134.053, 312.430, 830.706)` rot `-1.649` (marker 11001702 at
`1140.66,831.79`; also the fail-retry warp). Waking Sands entry zone 181
`(-205.250, 0.000, -160.000)`; return `(-126.200, 1.200, -160.000)` rot `1.600`.

## Battlefield (174/SimpleContentMan30801, boundary (970,950)–(1035,1015))

Entry (`man30830` PC): `(995.168, 309.146, 982.116)` rot `-2.519`. Helper
slot offsets `(+1.5x, +1.0z)`. Battle staging (`man30810` PC):
`(1000.714, 308.565, 985.779)` rot `1.541`. Public return (`man30890` PC):
`(1217.650, 311.707, 776.001)` rot `-0.931`.

| Actor | Class | X | Y | Z | Rot |
|---|---|---|---|---|---|
| Path companion NPC → ally | SNPC | 996.166 | 309.178 | 980.941 | -2.240 |
| Tempered Elezen | 1001336 + app 2289003 | 1001.880 | 309.100 | 982.000 | -1.600 |
| Tempered Lalafell Maid | 1001607 + app 2289001 | 1004.170 | 309.100 | 982.160 | -1.850 |
| Tempered Midlander | 1001336 + app 2289002 | 998.500 | 309.100 | 980.000 | 1.100 |
| Tempered Captive | 1001607 + app 2289001 | 1003.000 | 309.100 | 987.000 | -2.500 |
| Amalj'aa lancer | 2206508 (bnpc 32712) | 990.180 | 309.682 | 979.995 | 1.795 |
| Amalj'aa archer | 2206512 (bnpc 32713) | 992.990 | 309.931 | 976.904 | -0.001 |
| Amalj'aa augur | 2206518 (bnpc 32714) | 992.674 | 309.542 | 979.550 | 0.822 |

Captive shells are talk-capable `PopulaceStandard`; captive markers 11001706
`(1001.88,982)` and 11001707 `(1004.17,982.16)` match the first two spawns
exactly. Amalj'aa marker 11001708 `(992.24,979.31)` sits inside the combat
triangle. Ritual marker 11001705 `(991.84,962.52)` is the SEQ_010 area flag.
All three combat transforms equal the `man30830` Amalja_A/B/E anchors.

## Coordinate-guide verification (zone 174, page 1500, scale 1, base 2687/3072)

`maps --zone 174` → Southern Thanalan. `locate --zone 174 --page 1500
--world <x> <z>` per placement (this pass, live recording):

| Point | Map cell | Recorded pts ≤30 | Nearest node |
|---|---|---|---|
| entry (995.168,982.116) | (36.82,40.54) | 0 | 5248 @142.78 |
| companion (996.166,980.941) | (36.83,40.53) | 0 | 5248 area |
| captive A (1001.880,982.000) | (36.89,40.54) | 0 | 5248 area |
| captive B (1004.170,982.160) | (36.91,40.54) | 0 | 5248 area |
| lancer (990.180,979.995) | (36.77,40.52) | 0 | 5248 area |
| archer (992.990,976.904) | (36.80,40.49) | 0 | 5248 area |
| augur (992.674,979.550) | (36.80,40.52) | 0 | 5248 area |
| approach (1140.66,831.79) | (38.28,39.04) | 0 | unrecorded |
| gate (1239.000,746.000) | (39.26,38.18) | 0 | unrecorded |
| return (1217.650,776.001) | (39.05,38.48) | 0 | unrecorded |

No recorded ground covers the ritual site or the public route points in the
current `zone_174.tsv`: center Y stays unresolved per the guide, and all
authored Y comes from the cutscene anchors, not the tool. Private copy
shares zone-174 ground; no cross-copy borrowing. A `!quicknavmesh` capture
around Paglth'an (cells (38–39,38–39)) and the ritual clearing (36.8,40.5)
would ground these placements; until then heights remain authored.

## Cutscene-only actors (fixtures, not spawns)

`man30800`: Silphu_A/B (1001085/1001086). `man30830`: Amalja_A/B/E talk
shells (1000517/1000518/1000612). `man30850`/`man30880`/`man40640`: four
`etra` captives (6000116–6000119) + Ifrit `IFLEAT` (6000242). `man30860`:
Amalja_P_A (2206513) + Amalja_D/E (2206506) at
`(2535.898, 249.642, 2219.305)`. `man30890`: Silphu_A/B + Ama_A/B/C.
`man30900`: MINFILIA (1000843) + TATARU (1001046). Ifrit is never a combat
spawn: journal 222 has him question the party after the fight, then order
the Amalj'aa to deliver the party back to the gates.
