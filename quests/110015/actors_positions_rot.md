# Man300 actors, positions, rotations

Sources: actor-dictionary decode (`decompile_man300_cutscene_setup.py`
`EXPECTED_ACTOR_IDS`), in-game `/mypos` captures in zone 171 (authoritative
for persistent placements), `quest_marker.csv`, zone 160 population rows.

## Quest NPCs (persistent)

| NPC | Actor class | Where |
|---|---|---|
| Minfilia | 1000843 | Waking Sands (briefing) |
| Tataru | 1001046 | Waking Sands (offer `pEStart`) |
| Hedyn | 1001047 | Peasants' Ward; SEQ_010 `pE20`, SEQ_035 `pE60` + reward |
| Shanga Meshanga | 1001048 | Ward exposition `processEvent020_2` |
| Troxia | 1001049 | Ward sylph (cutscene `Sylph_Troxia`) |
| Cliaux / Cenmin / Memezofu | 1001381/1001382/1001384 | Ward exposition + post-mission reactions |
| Diluxio / Lanxio / Zexia | 1001178/1001179/1001387 | Ward exposition + reactions |
| Nananoby / Almxio / Zoxio | 1001050/1001085/1001086 | Battlefield story actors (below) |

Hedyn return point (both Hedyn scenes, after-warp fade): zone 160
`(-143.258, 1.015, -160.029)` rot `-1.599`. Peasants' Ward entry: zone 160
`(-201.795, 0.015, -159.926)` rot `1.550`.

## Battlefield (171/PrivateAreaMasterPast/1, boundary (930,-350)–(1120,-150))

Entry (runtime capture, supersedes `man30030` PC transform for persistence):
`(1001.755, 252.750, -280.197)` rot `1.010`. Party slots 2–3 offset
`(+1.5x, +1.0z)` each. Public return (Nananoby): `(1034.830, 251.660, -269.040)`
rot `-2.860`.

| Actor | Class | X | Y | Z | Rot |
|---|---|---|---|---|---|
| Nananoby | 1001050 | 1032.359 | 251.705 | -268.516 | -0.974 |
| Almxio (float 3.5) | 1001085 | 1032.456 | 251.827 | -271.512 | -1.297 |
| Zoxio (float 3.5) | 1001086 | 1032.292 | 252.210 | -273.272 | -1.387 |
| Ixali balloon (b964/e001, appearance 1080060) | 1080056 | 1037.955 | 251.258 | -231.589 | -1.968 |
| loyal Ixal (parley; display 4000505, title 5001) | 1001095 | 1025.807 | 251.071 | -238.023 | -1.907 |
| able-bodied Amalj'aa (parley; display 4000508, title 5101) | 1001098 | 1013.015 | 251.960 | -272.674 | 0.713 |
| Amalj'aa bowyer | 2106515 | 997.981 | 251.274 | -233.886 | 2.905 |
| Ixali swordfighter | 2106426 (bnpc 1392) | 995.138 | 251.290 | -238.078 | 2.332 |
| Amalj'aa drubber | 2106501 (bnpc 1341) | 1001.052 | 251.234 | -246.198 | 2.332 |
| Ixali swordfighter | 2106427 (bnpc 1392) | 1007.453 | 251.290 | -243.753 | 2.332 |

A fifth capture `(1004.777, 251.213, -252.857)` is ignored: retail group is 4.
Talk targets use neutral Populace interaction (class 1001050 shell + monster
appearance), no overhead quest markers. No battlefield actor shows a marker.

## Coordinate-guide verification (zone 171, page 1200, Thanalan scale-1 native)

`maps --zone 171` → Eastern Thanalan, base (2687,3072), 11k+ recorded nodes.
`locate --zone 171 --world <x> <z>` per placement (this pass):

| Point | Map cell | Recorded pts ≤30 | Nearest node |
|---|---|---|---|
| entry (1001.755,-280.197) | (36.89,27.92) | 9 | 9364 @17.1 (Y 250.87) |
| bowyer (997.981,-233.886) | (36.85,28.38) | 8 | 9370 (Y 250.70) |
| swordfighter (995.138,-238.078) | (36.82,28.34) | 8 | 9368 (Y 250.62) |
| drubber (1001.052,-246.198) | (36.88,28.26) | 14 | in-selection |
| swordfighter (1007.453,-243.753) | (36.94,28.28) | 16 | in-selection |
| Nananoby (1032.359,-268.516) | (37.19,28.03) | 31 | in-selection |
| loyal Ixal (1025.807,-238.023) | (37.13,28.34) | 17 | ~(1024.37,250.59) |
| able Amalj'aa (1013.015,-272.674) | (37.00,27.99) | 19 | ~(1015.13,250.65) |
| balloon (1037.955,-231.589) | (37.25,28.40) | 11 | in-selection |

Per the guide, center Y stays unresolved: recorded heights belong only to
their nodes. All X/Z fall inside recorded-ground selections with nearby
support (ΔY ~1–2 vs captures); authored Y comes from the `/mypos` captures,
not the tool. Private copy shares zone-171 ground; no cross-copy borrowing.

## Cutscene-only actors (fixtures, not spawns)

`man30030`: I_ixal01-03 (1001093/1001094/1001095), A_amarujya01-03
(1001173/1001097/1001098), ixal_04 (1001172), amarujya_04 (1000517).
`man30040`: SCALELIZARD_FIR (1001099). `man30050`: Asien (1001174), Crystal
(6500003). Exact cutscene transforms in the decoder's `EXPECTED_ANCHORS`.
