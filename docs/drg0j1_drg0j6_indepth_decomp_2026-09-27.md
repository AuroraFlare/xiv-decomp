# DRG 111321-111326 deep decomp (JOB DRG work file)

Source: client luac `quest/scenario/drg/drg0jN.luac` via
`FF14-Decomp/outputs/job-gc-decomp-20260907` + `docs/job_blm_pld_brd_drg_decomp_2026-09-07.md`,
`xtx_quest.csv`/`xtx_journalxtx*.csv` journal rows, `quest_marker.csv` ledger,
`server_battlenpc_skill_list.sql`, wiki/journal cross-check.
Proposed home: `FF14-Decomp/docs/drg0j1_drg0j6_indepth_decomp_2026-09-27.md`.

Global: NO instance IDs recovered for any of the six. All fights are
open-world objectives served today by private SQB shells. Drg0j1 is NOT an
instance: journal Fst/455-459 + `processEventNQ/drg0j110` describe an
open-world cull near Camp Nine Ivies. Estinien is cutscene-only in j1/j4.
Scene fade contract: every NQ scene starts `startFadeOutCutSceneDefault`
then `startNQCutScene(literal,1)`; keep literal spelling (`Drg0j410/610/620`
capital D, `drg0j110` lowercase).

## 111321 Eye of the Dragon (Drg0j1, Lv30, HOLD)

Stages: Haurtefert 1000569 offer (`processEventStart`, arg1==1 intro flag
pc24/0x31E, offer EQ pc80/0x3FE, balanced 1.5s fades both exits) ->
Alberic 1002001 marker 11226001 (-179.35,-303.73,102/201)
`processEventAlberic`/`AlbericAfter` (unused R3, briefing+reminder) ->
cull at marker 11226002 (1483.930054,-895.229980,103/302, disp ???):
3x Crabfisher 2204511/disp 3204512/Lv33 + 1x Ironshell 2207612/disp
3207612/Lv35, 4 total (journal permits 3 companions) ->
auto `processEventNQ/drg0j110` (default fade; PC setup 1470.846,15.583,
-889.638 rot -2.967) -> Alberic marker 11226003 `processEventClear`
(1.5s conversational fades 0xAC1/0xADD, NOT a warp) +
`processEventKokuti(3020410)`: item 0xED8/w6, global long 51126+key
2000204 (Soul of Dragoon) 0xEFC/w8, action 27266 Jump mode1 0xF1C/w6.
EXP 2661, item 3020410 = The Keeper's Hymn (not a soul).
Gaps: no mob profiles for either enemy (family analogues only: 5044
Piranha/Orobon, 5038 Crab/Megalocrab); simultaneous-vs-phased unknown;
no entry actor/Y/rot; empty QuestDirectorDrg0j101 (no fail/retry/cleanup).

## 111322 Lance of Fury (Drg0j2, Lv35, Implemented adapter)

Alberic 1002001 offer `processEventALBERICStart` (Haldrath/Nidhogg history,
offer EQ pc105/0x589) -> `processEvent000_ALBERICS` briefing repeat (adapter
launch stage, not a journal stage) -> Bomb Baron in Cassiopeia Hollow east
of Camp Bloodshore: actor 2101610/disp 3101612/mob 3007/Lv42/fire/list 12
(Fireball 23032, Self-destruct 23033+23628, Combustion 23034, Fast Burn
23036, Burning Cyclone 23274, Firecracker Shower 23315, Hellfire
23368/23408/23409, Firedamp 23396, Fire II 23508, Burn II 23509).
Marker 11226101 (1010.590027,-913.229980,101/113 region frame); wiki map
cell (3,5) zone-132 local = world (990,-858), recorded ground Y≈-77.6
(node 272: 991.136,-77.638,-850.732, 111 pts/18 mobs nearby).
Party: 3 companions recommended = 4 total. No scene/warp.
Rewards: First (worldMaster,51126,2000204) 0x891; Second (27272
Disembowel,3) 0x92D; Third linkpearl (1000275,85) 0x99C; 3360 EXP.
Director: QuestDirectorJobDrg0j2, uniqueId drg0j2_bomb_baron, seq 0->5->10.

## 111323 Unfading Scars (Drg0j3, Lv40, Implemented adapter)

Same shape: offer (EQ pc137/0x5BA, dragoon-death story) -> ALBERICS handoff
-> Spitfire near Millers' Glade, eastern Coerthas: actor 2106207/disp
3106209/mob 3101/Lv47/list 1 (Frenetic Flurry 23122, Romp 23123, Triple
Tumble 23124; eLeMeN list 6035 corroborates Flurry). Model
SpriteBrownLesserNM. Marker 11226201 (1314.180054,1409.469971,102/203).
4 total recommended. No scene/warp.
Rewards: (51126,2000204) 0x90C; (27267 Elusive Jump,1) 0x9A8; linkpearl
(1000275,86) 0xA17; 4260 EXP. Director QuestDirectorJobDrg0j3,
uniqueId drg0j3_spitfire, seq 0->5->10.

## 111324 Double Dragoon (Drg0j4, Lv45, HOLD)

Alberic offer (EQ pc28/0x436) -> REAL rendezvous SW of Skyfire Locks marker
11226301 (159.229996,477.869995,102/201) `processEvent_NQ_Drg0j410`
(default fade; PC setup Y 237.080002 rot -PI/2 corroborates marker X/Z) ->
`processEvent_ALBERIC_Guidance` armor guidance -> 4 independent coffers,
4th acquisition completes at coffer, no return: 11226302 Aurum Vale
(-368.99,1397.95,102/204)=Breeches 8051404; 11226303 U'Ghamaro
(96.96,-2692.71,101/104)=Gauntlets 8071404; 11226304 N of Brittlebark
(680.70,460.93,105/501)=Greaves 8081804; 11226305 N of Bluefog
(-228.54,-2380.83,104/404)=Armet 8013504. Each coffer:
owner scheduler 67108910 at 0x934 + `showGetJobItemWidget(player,arg1,0)`
0x948, no local state checks, no acquisition counter (server-owned).
5340 EXP, no ability in this scenario. Gaps: no rendezvous trigger
actor/transition owner; all coffer actors absent (disp 4000257 ??? maps to
many classes, not a legal actor key; no Y/rot/push owner). Ordinal
marker<->item zip is unsafe (journal order differs); DRG pairs are
walkthrough-corroborated but documentation-only.

## 111325 Fatal Seduction (Drg0j5, Lv45, Implemented adapter)

Offer (EQ pc173/0x519, Alberic relinquished-power confession) -> ALBERICS
handoff -> Stollenwurm south of Camp Riversmeet, western Coerthas:
actor 2102219/disp 3102224 EXACT, mob 32729 = migration-owned adapter
profile (NOT retail BNPC): Drake family 5020 (Smoulder 23271, Burning
Cyclone 23274, Flames of Defiance 23276, Serpentine Tail 23278), Lancer
job 8, Lv45 band. Note model path suffix says Drg0j6 (recorded mismatch).
Marker 11226401 (-1878.430054,116.629997,102/205). SEVEN companions
recommended = 8 total (maxPartySize 8). No scene/warp.
Rewards: First (worldMaster,51135,3102224,1,2000204) 0x88C; Second (27277
Ring of Talons,3) 0x93A; Third linkpearl (1000275,88) 0x9A9; 5340 EXP.
Director QuestDirectorJobDrg0j5, uniqueId drg0j5_stollenwurm.

## 111326 Into the Dragon's Maw (Drg0j6, Lv50, Implemented adapter)

Alberic `processEvent000` reminder (texts 6/24; journal Roc/33-35 needs no
2nd talk, adapter policy) -> `processEvent010/Drg0j610` default-fade entry
(PC/Alberic/Estinien shared setup 663.479,230.277,567.810) -> FIGHT:
Estinien Wyrmblood 2289038/mob 3028/list 15 (Animal Instinct 23484,
Godsbane 23490, Jump 23493, Wyvern Dive 23494; bind/stun, countdown
maneuver) + Greywine 2202208/mob 3049/list 26 (Steel Cyclone 23485,
Caudal Spine 23270, Smoulder 23271, Surge 23272, Raging Horn 23273,
Crimson Cyclone 23365/23580, Ring of Thorns 23496; purple-glow counter
window: stop attacking, move away). Both exact kills required.
Marker 11226502 (604.099976,561.960022,102/201). Up to 7 may accompany
= 8 max (kind=maximum). `processEvent015` = empty talk, no objective.
Aftermath: `processEvent020/Drg0j620` after-warp variant (content exit
owner) + `processEvent025/Drg0j620` default variant; reward
`processEvent030`: text 26, mode-2 talk, texts 27/28, long text 43
0x96B/w8, (27268 Dragonfire Dive,1) 0x98B/w6, literal item 8032704
Drachen Mail 0x9A7/w6 (no arg needed), keep `finishCliantTalkTurn(2)`
verbatim. 0 EXP. Director QuestDirectorJobDrg0j6, successEvent 020,
timeout 900s. Haldras 1001983 in 620 = scene-only, not a 3rd target.
