# Quest 110003 — Legends Adrift (Man1l0) [Lv.8] — Instance notes

Limsa Lominsa MSQ, prereq 110002 (Treasures of the Main), leads to 110004.
Pure Echo/talk/push quest: **no combat, no mobs, no escort, no fight phases**.
Retail client script: `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/man/man1l0.lua`
(also `decomp_more_20260617` copy used by the validator).
Server script: `FF14-Memory/Data/scripts/quests/man/man1l0.lua` (542 lines).
Spawns: `Data/sql/server_eventnpc_spawn_locations.sql` ids 2068-2108 + 2725.
Validator: `tools/validate_legends_adrift.ps1` (34 transition cases PASS).

## Instances (all static PrivateAreaMasterPast, no dynamic content area)

| Echo | Zone | PA type | Entry warp (server) | Exit |
|---|---|---|---|---|
| 1 Adventurers' Guild (Drowning Wench) | 133 | 3 | onStart/onTalk Baderon public: (-430.55, 40.2, 185.41, 1.89) | SEQ_010 Baderon talk (man1l215) -> public |
| 2 Marauders' Guild (Astalicia) | 230 | 6 | SEQ_020 Waekbyrt talk: (-754.03, 7.352, 382.872, 3.133) | SEQ_040 trigger push (man1l420) -> public |
| 3 Arcanists' Guild (Mealvaan's Gate) | 230 | 7 | SEQ_090/100/110 P'tahjha talk: default PA coords | SEQ_110 trigger push (man2l002) -> public |

Same-area mid-echo moves (after-warp fade, event retained, no loading owner):
- SEQ_030->040 trigger: WarpToPosition (-764.519, -3.146, 384.154, 1.575) upper->lower Astalicia deck
- SEQ_100->110 trigger: WarpToPosition (-785.938, -0.62, 189.044, 3.09) lower->upper scholarlies
PrivateArea C# passes canRideChocobo=false, so **no chocobo summon in any Echo**
(engine-level, `Map Server/Actors/Area/PrivateArea.cs:39`). Party: static Echo,
no scaling, solo-as-retail. No timer/enrage (no battle). Death/disconnect: no
combat in Echo; public legs (SEQ_060 zone 230, SEQ_070 zone 128) use the normal
death/homepoint flow, quest state persists, markers + re-entry talk branches
(Baderon/Waekbyrt/P'tahjha from public re-warp into the correct PA) recover.
Abandon: standard flow back to SEQ_ACCEPT at public Baderon. Exits: 1290002
PrivateAreaPastExit actors rows 2077/2088/2108 (+2725 SEQ_030 exit); boundary
pushback owned by `WorldManager.TryHandlePrivateAreaPastExit`.

## Actors + positions/rot (spawn id, class, unique, zone/PA, X Y Z rot anim)

Echo 1 (PA3): 2068 Baderon 1000137 (-428.06,40.2,185.96,-1.37,1060);
2069 Mytesyn 1000167 (-435.2,40,207.07,-1.9,0, small-talk via DftSea.lua);
2070 adventurer 1000101 (-431.656,40.2,185.5,1.56,1016);
2071 whispering 1000102 (-450.94,39.518,194.565,1.55,1012);
2072 unapproachable 1000103 (-447.443,39.518,194.65,-1.61,1012);
2073 fish-smelling 1000104 (-450.162,39.518,201.141,-0.868,1003);
2074 spear-wielding 1000105 (-453.766,39.518,188.287,-0.674,1002);
2075 Y'shtola 1000001 (-477.156,40,198.165,1,0);
2076 trigger 1090080 (-467.917,40,200.322,0,0); 2077 exit (-444.45,40,190,-1.17).
Echo 2 upper (PA6): 2078 hulking 'cuda 1000182 (-753.566,7.352,378.895,-0.1,1016);
2079 sophisticated 1000108 (-765.283,9.839,389.853,-2.339,1017);
2080 frightened 1000110 (-759.762,7.352,393.371,1.566,0);
2081 zealous pirate 1000112 (-757.479,7.352,393.255,-1.522,0);
2082 enraged 1000113 (-767.245,10.352,388.347,1.196,0);
2086 Waekbyrt 1000003 (-768.787,6.852,381.104,-0.987,1015);
2089 trigger 1090081 (-761.23,5.242,383.79,0,0); 2725 exit (-766.87,7.5,386.5,0).
Echo 2 lower: 2083 disgruntled 1000087 (-744.431,-3.146,385.205,1.615,0);
2084 pine-scented 1000088 (-752.454,-3.146,392.206,2.304,0);
2085 baritone 1000089 (-745.303,-3.146,379.082,-1.216,0);
2087 Bayard 1000190 (-740.105,-3.146,386.456,-1.566,1015).
Echo 3 lower (PA7): 2091 trigger 1090083 (-769.09,0.85,183.99,0,0);
2103 thewy pirate 1000117 (-784.45,-1.3,178.46,-1.27,1007);
2104 freckled 1000119 (-782.443,-1.3,180.81,-2.3,1008);
2105 assessor dead1 1000452 (-785.85,-2.37,204.5,1.61,1000);
2106 dead2 1000453 (-784.55,-2.37,206.6,-0.85,1001).
Echo 3 upper: 2092 trigger 1090084 (-786.385,12,219.6,0,0);
2093 Assessor2 1000121 (-782.897,12.9,199.012,0.052,1015);
2094 P'tahjha 1000150 (-798.19,13.53,189.18,0.58,1079);
2095 Haldberk 1000160 (-787.39,12.9,193.54,0,1020);
2096 Lilina 1000178 (-790.264,12.9,198.47,0.194,0);
2097 Dodoroba 1000196 (-789.89,16.07,186.923,0.31,0);
2098 Ivan 1000197 (-780.386,12.9,192.631,0.115,1016);
2099 Merodaulyn 1000008 (-782.576,12,223.884,-2.968,1031);
2100 coquettish 1000868 (-790.547,12.9,195.857,0.756,1015);
2101 voluptuous 1000115 (-786.406,12,224.054,-3.132,1044);
2102 peacockish 1000118 (-791.304,12,219.67,1.9,1017);
2107 Assessor1 1000120 FIXED to (-780.9,12.9,199.8,0.052,1015) beside 2093
(was 0/0/0 placeholder; see server_eventnpc_spawn_locations.sql);
2108 exit (-784.214,12.9,206.511,0).
Public: Baderon id6 (-428.06,40.2,185.96,-1.37); Waekbyrt id351
(-752.53,7.35,382.14,-1.64); FSH trigger 1090006 id445 (-624.55,4.25,359,2.59);
Nnmulika id325 (-612.9,4.55,341.42,0.69); P'tahjha id323 (-790.22,12.9,195.4,0.43);
SEAFLD trigger 1090082 id2090 zone 128 (218.58,21.025,1176.56,0,0).
Guide check (`map_coordinates.py locate --zone 128 --world 218.58 1176.56`):
map (27.47,41.85) cell (27,41), exact landmark match to row 2090, 0 recorded
nodes within 30u (nearest 123u away at y~61, different hill), 0 mobs in
selection — retail pmeteor Y kept, no invented height. No BNPC rows reference
man1l0 (`server_battlenpc_spawn_locations.sql` grep count 0): zero mob
placements by retail design, so no AI/phases/adds/enrage/leash/reset, no
escort pathing (SEQ_070 Sisipu beat is a push trigger + cutscene, not an escort).

## SEQ/Event branches (all covered, no loopholes)

SEQ_ACCEPT Baderon talk (public): man1l200 + AcceptQuest -> SEQ_000 + PA3 warp
(accept-fail path restores position via DoPlayerMoveInZone + EndEvent).
SEQ_000: 5 adventurer small-talks (200_2..200_6, no progress), Baderon private
small-talk 200_7 / public re-warp 200, Y'shtola 200_8 (added, mirrors SEQ_010),
trigger push 210 -> SEQ_010. Marker: PA? 11000301 : 11000302.
SEQ_010: Baderon private 215 -> SEQ_020 + public warp; public re-warp to PA3 +
back to SEQ_000; Y'shtola 200_8; adventurer small-talks. Marker 11000302.
SEQ_020: Waekbyrt talk 400 -> SEQ_030 + PA6 warp; Baderon public 215_2.
SEQ_030: Waekbyrt private small-talk 400_7 / public re-warp 400; 5 'cuda/pirate
small-talks 400_2..400_6; trigger 410 -> SEQ_040 + deck warp. Marker PA? 304:303.
SEQ_040: Waekbyrt talk re-warps PA6 + back to SEQ_030 (Echo restart from guild
master); 4 pirate small-talks 410_2..410_5; trigger 420 + LS msg -> SEQ_050 +
public warp. Marker PA? 305:303.
SEQ_050/080/120: NPC-linkshell wait states, no map marker (retail: LS
objective). onNpcLS packs {57,58,59}->SEQ_060, {92,93,94}->SEQ_090,
{140,141}->SEQ_122; unknown from/sequence -> EndEvent, no progress.
SEQ_060: FSH trigger push 600 -> SEQ_070; Nnmulika 600 (+gendered 600_2 in
SEQ_070), Baderon 420_2. Marker 11000306.
SEQ_070: SEAFLD trigger push 610 -> SEQ_080 + LS msg. Marker 11000307.
SEQ_090: P'tahjha talk 2000 -> SEQ_100 + PA7 warp; Baderon 610_2. Marker 308.
SEQ_100: P'tahjha public re-warp 2000; 11 small-talks 2000_2..2000_12
(Assessor1 now reachable after 2107 fix); lower trigger 2001 -> SEQ_110 +
upper warp. Marker PA? 309:308.
SEQ_110: P'tahjha talk re-warp PA7; thewy/freckled/assessors 2000_10/11;
upper trigger 2002 + LS msg -> SEQ_120 + public warp. Marker PA? 310:308.
SEQ_120: Baderon optional chatter 2002_2 only (registered without QFLAG_TALK so
the LS objective/marker is not replaced). No marker.
SEQ_122: Baderon 110003 reward: processEventComplete + sqrwa widget, 300 EXP +
15000 gil (item 1000001), game message 25031. Marker 11000302.
Cutscene replay menu (processEventTalkMenuManCutPreview) and 1000_2/3/4 are
client-side only, never server-called — correct, not a gap.
Mechanics (Loremonger + retail text): Barracuda/Sahagin ambush off Seal Rock,
Misery/Kraken's Arms landing, Emerick sold charts (witness Sisipu, Brookhaven
survivor), Merodaulyn infiltrated Seal Rock unit, Sirens vs Kraken tension;
player interviews pirates (Astalicia), Pullers (Fisherman's Bottom), sea field
witness spot, scholarlies (Mealvaan's Gate) where Y'shtola seeks Emerick and
Baderon recalls him to the offshore prison dromond -> 110004 hook.

## Fail edges

2088 echo2 exit row is 0/0/0 (unused; 2725 is the live PA6 exit). 2107 fixed
this pass. Cutscene skip: validator runs every transition skipped+watched.
Wrong-side talk (private NPC from public or vice versa) always re-warps or
small-talks, never soft-locks; trigger pushes are area-exclusive by spawn.
