# Quest 110012 Calamity_Cometh [Lv.13] — Man2u0 instance decomp (2026-09-27)

Prereq 110011 Golden Sacrifices. Next 110013 Fade to White (Man200, converging).
Live scripts (full bodies read): `FF14-Memory/Data/scripts/quests/man/man2u0.lua`
(672 lines), `Data/scripts/directors/Quest/QuestDirectorMan2u001.lua` (1337 lines),
`PopulaceChocoboLender.lua` Rururaji cross-script (lines 83-114), recovered client
scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man2u0.lua`.
Story text: Gamer Escape `Loremonger:Calamity_Cometh` (fetched; gold-powder
defense dialogue verified) + MSQ 01 Ul'dah video index (Calamity Cometh at 51:00).

## 1. Actors (battle instance: zone 170 / PrivateAreaMasterPast / type 5)

Static rows: `Data/sql/server_eventnpc_spawn_locations.sql` 1781-1784. Combat
allies are runtime `SpawnAlly` (director), statics despawned at duty start.

| Unique | Class | X / Y / Z / rot |
| --- | ---: | --- |
| man2u0_seq010_greinfarr | 2290014 | -118.228 / 215.676 / -764.895 / 3.030 |
| man2u0_seq010_ascilia | 1000042 | -120.801 / 216.044 / -771.527 / -0.360 |
| man2u0_seq010_flhammin | 1000038 | -121.778 / 215.847 / -770.206 / 1.192 |
| man2u0_seq010_niellefresne | 1001867 | -122.462 / 215.877 / -766.815 / -0.811 |
| man2u0_seq010_greinfarr_ally (combat) | 2290014 | same XYZ as static |
| man2u0_seq010_niellefresne_ally (combat) | 2290013 | same XYZ as static |
| man2u0_seq010_minemite_01..10 (runtime) | 2202106 / display 3202106 | templates below |

Entry: (-117.242, 215.653, -769.757) rot 1.442. Boundary: circle r=50 at entry XZ.
F'lhaminn: passive + motion pack 1001 (wounded). No exit trigger in 170/5 (leave
only via retry/return paths; completion exits through Ascilia).
Do NOT use old `MAN2u0_*` zone-170 type-1 rows (superseded).

## 2. Mob placements with coordinate evidence (guide tool, direct)

Zone 170 Central Thanalan, MapNavi page 1000 (base 2687/3072, scale 1, cell 25,22
unless noted). Recording `Data/quicknavmesh/zone_170.tsv` (8526 nodes,
sha256 d63a6e03...). "Support" = recorded pts within 30r / nearest node dist.
Heights: only spawn points at recorded nodes are exact; the rest are authored
heights with nearby support (per guide: heights belong to their positions).

| # | Spawn X / Y / Z / rot | Atk X / Y / Z / rot | Support |
| --- | --- | --- | --- |
| 01 | -84.406 / 216.835 / -771.225 / -1.598 | -114.789 / 215.831 / -768.960 / -1.474 | 35 pts, node 1575 @3.5 (cell 26,23) / atk 20 pts, node 1585 @12.0 |
| 02 | -114.321 / 217.603 / -781.038 / 0.572 | -120.190 / 216.187 / -773.298 / -0.762 | 25 pts, node 1583 @2.0 / atk 19 pts, node 1585 @7.0 |
| 03 | -142.943 / 216.175 / -779.826 / 1.194 | -116.930 / 215.647 / -769.571 / 1.248 | 12 pts, node 1590 @2.7 / atk 20 pts, node 1585 @10.8 |
| 04 | -163.370 / 214.980 / -750.995 / 2.128 | -126.266 / 216.000 / -768.399 / 2.047 | 14 pts, node 1596 @18.6 (cell 25,23) / atk 12 pts, node 1587 @13.0 |
| 05 | -114.339 / 211.644 / -747.990 / -2.680 | -120.604 / 215.728 / -767.785 / -2.864 | 0 pts in 30r, nearest node 1668 @30.1 — AUTHORED/INFERRED / atk 15 pts, node 1585 @12.5 |
| entry | -117.242 / 215.653 / -769.757 / 1.442 | — | 20 pts, node 1585 @10.6 (Y 217.23 vs 215.65, d1.6) |

Minemite profile: Lv13, HP 420, delay 12000, dmg 18, DPS AI, roam mods 23/24 off,
`ApplyAggressionSettings(true,0)`, prefer-path chase. Greinfarr ally: Lv30,
HP 5000, delay 9000, dmg 75 + `LoadQuestAllyProfile(110012,"greinfarr")`.
Niellefresne ally: Lv25, HP 3600, dmg 0, auto-attack disabled (protected, not DPS).
No retail pull log; no enrage evidence — single continuous wave flow is the design.

## 3. Triggers / ENPC per SEQ (quest onStateChange)

0: Rururaji TALK (lender cross-script owns event). 10: Ascilia TALK (none while
active/pending), Rururaji TALK (restart). 15: Phrontistery trigger PUSH,
Nogeloix. 20: sickroom PUSH, exit trigger, Phrontistery PUSH, Hahayo, sickroom
cast. 25: sickroom-exit + Phrontistery-exit PUSH, F'lhaminn. 30: Gogofu.
35: Black Brush PUSH. 40: Arrzaneth PUSH. 45: crypt PUSH + Arrzaneth PUSH,
Rorojaru. 55: Momodi REWARD. SEQ_005/SEQ_050 declared, never started (retail
numbering gaps; flow 0->10->15->20->25->30->35->40->45->55).
Markers 11001201-11001207 (+temp Momodi 11001001); BATTLE/FLHAMMIN defined,
unused by live marker fn. Counters/flags: counter 0 kills; flag 0 active, 1 pending.

## 4. Cutscenes (recovered scenario; all scenes exist in cutReplay/assets)

005: man2u000/man2u010/MAN2U020 (entry, fade-out/in-after-warp). 030: man2u030
(completion). 040: man2u040 (Phrontistery). 050: man2u050 (sickroom). 060: man2u060.
070: man2u070 (Black Brush). 080: man2u080 (Arrzaneth). 085: man2u085/MAN2U090/
man2u100/man2u110 (finale chain). Dialogue: 005_3 gold-powder brief, 005_5 active
reminder, 005_2/005_4/005_6/005_7 + 040_3 + 070_2 parked (no live owner; bind only
on prompt-flow proof). SystemMessage: worldMaster 179/180 by level>=18.
Text sheet 1367/man2u0.

## 5. Fight AI / phases / adds (director main loop, 1s tick)

Plan: 5 templates reshuffled with replacement into 10 ordered spawns
(`man2u0_seq010_minemite_%02d`). Cap: 2 active; refill when active<2 and
kills<10. Route phase: `ENABLE_MINEMITE_ROUTE_RUN=false` — mobs fight from
spawn points (route code retained but skipped; attack XYZ kept as anchors).
Engage: per-spawn-token, when all live unengaged mobs route-ready + player
`IsQuestFightAggroReady`, mobs `ForceQuestFightEngageTarget` (target:
Niellefresne if alive else player); Greinfarr `ForceQuestFightAssistTarget`.
Kill: `onKillBNpc` IncCounter + attention 50041 (n/10). Win: poll
kills>=10 -> pending flag, counter=10, death-visual wait, cleanup, claim-party
clear, `KickEventWithType(ascilia,"noticeEvent",ETYPE_NOTICE)`; quest onNotice
or Ascilia talk -> `processEvent030` + warp zone 175 (-36.571,192,19.598,-3.019)
+ msg 50012 + SEQ_015. Overkill-safe (pending guard). Leash: implicit — player
outside r=50 fails (`leftBattlefield`); no retail mob-leash/enrage evidence.
Scaling: none — solo-only retail; fixed stats; first-player director.

## 6. Escort: N/A (defense fight)

No follow/teleport/pathing. Protected-NPC rules: Niellefresne death fails duty;
Greinfarr death fails duty; F'lhaminn is a passive wounded prop (not damageable,
not a fail condition). Minemites prefer Niellefresne as target (gold-powder lure
fiction; dialogue-only, no item granted — matches recovered scenario which has
no item step).

## 7. Fail / edge handling (all verified in code)

death (player) / timeout 10 min (notice 50026) / leftBattlefield / allyDeath /
niellefresneDeath / spawnFailed / missingQuest -> failDuty: clear flags+counter,
SEQ_010, despawn minemites+allies, claim-party clear, ContentFinished, EndDirector.
Retry: in-arena Ascilia or public Rururaji (restart resets counter/flags, ends
stale director). Disconnect: login director set at entry; main loop re-resolves
live member via GetPCInWorld + HasConnectedSession, waits out offline ticks,
existing timeoutNoPlayer cleanup on expiry. Abandon: engine-owned director
cleanup (msq-entry-tests reservation/cleanup ownership suite, 2026-09-11 review;
no Lua onAbandon in any man/* quest). Chocobo: blocked — dismount/alive/connected
entry gate in `canStartMan2u0MinemiteDuty` (both entries funnel through it);
whistle not yet owned at this quest (granted 110013). Class: combat-only
(checkCombatInstanceEntry; mount gate is additional, same failure path).

## 8. SEQ/event branch matrix (no loopholes found)

ACCEPT Momodi->000; 000 Rururaji->duty/010; 010 pending+Ascilia/notice->030+175/015;
015 Phrontistery PUSH->040+181t8/020; 020 sickroom PUSH->050+181t9/025, exit->209/015,
Phrontistery re-entry replays 040; 025 sickroom-exit warps 181t10 (same SEQ),
Phrontistery-exit->060+209+LS/030, Phrontistery replays 040 + back to 020;
030 LS pack 72,73,154->035; 035 BlackBrush PUSH->070/040; 040 Arrzaneth PUSH->
080+209t7/045; 045 Arrzaneth replays 080 (stay), crypt PUSH->085+175/055;
055 Momodi: SystemMessage+sqrwa(500,1,1,2)+CompleteQuest gate, then 30000 gil
(25031) + 500 EXP. Double-finish safe (SEQ guard). Pending-wipe safe (Rururaji
unreachable from 170/5). Restart safe (stale director ended, counter reset).
