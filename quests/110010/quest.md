# 110010 Court in the Sands — `Man0u1` (Ul'dah MSQ #2, Lv 1, coliseum duel + escort)

- Quest: 110010 | Code: Man0u1 | Patch 1.x | Type: Main Scenario / Ul'dah opening
- Issuer: Momodi, the Quicksand (zone 175) | Prereq: 110009 Flowers for All (Man0u0), Lv 1, all disciplines
- Chain: Ul'dah MSQ #2; unlocks 110011 Golden Sacrifices (Man1u0)
- Implementation: `Data/scripts/quests/man/man0u1.lua`
  + `Data/scripts/content/SimpleContentMan0u102.lua` (escort content area)
  + `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua` (coliseum duel)
  + `Data/scripts/directors/Quest/QuestDirectorMan0u102.lua` (escort duty)
  + `Data/escortnavmesh/court_in_the_sands.json` (174-waypoint route, 4 ambushes)
  (all bodies read in full; loophole/hardening fixes applied this session — see File map)

ORIGINAL WORK ONLY: no client binaries were decompiled or copied. Positions come from repo
Lua/JSON/SQL, dialogue from public wikis + repo scripts, mechanics from public wikis + repo Lua.

## Sources (VERIFIED by full-body read unless noted)

- Quest script: `Data/scripts/quests/man/man0u1.lua` (~1710 lines, full body read incl. this
  session's edits: dismount gates, SEQ_057 retail emote order, 4th counter).
- Directors: `QuestDirectorMan0u101.lua` + `QuestDirectorMan0u102.lua` (full reads incl. edits:
  KO handling, relog-safe member resolution, chocobo override).
- Content: `SimpleContentMan0u102.lua` (full read: boundary, music, notice, leave-reset).
- Route: `Data/escortnavmesh/court_in_the_sands.json` (full parse: 174 waypoints, 4 stops, 8 mobs).
- Prior notes: `quests/110010/DECOMP.md` (1686-line script summary, SEQ/actor/marker tables) and
  `.codex-tmp/garlemald-server-hq-audit/.../quest_man0u1_court_in_the_sands.md` (port design doc
  with retail SEQ mapping, NpcLS packs, rewards; full read).
- Walkthrough: GamerEscape `Loremonger:Court_in_the_Sands` (fetched 2026-09-27; Coliseum Instance
  + Escort sections read: "A splendid match! ... Don't let losing get to you", F'lhaminn barks incl.
  fail line "I-I'm hurt ... let us beat the retreat. Do not despair. The camp will wait for us.").
- Wiki: Final Fantasy Wiki `F'lhaminn Qesh` (snippet: escort + defend F'lhaminn to Camp Black Brush).
- Video: YT `RuaiJWd7lEc` "MSQ 01 Ul'dah" (search snippet: Court in the Sands at 08:10; page fetch
  returned chrome only, no transcript — video contents NOT verified).
- Coordinates: `tools/mobspawns/map_coordinates.py` (`maps`/`locate` runs, this session, zones
  170/209; see tables below).

## Objectives (from SEQ flow in Lua; journal csv not re-read this session)

1. Quicksand intro instance: speak with Momodi, leave for Camp Black Brush, attune the aetheryte.
2. Report back to Momodi (twice); take the Coliseum Pass; visit Eshtaime's Lapidaries (GSM leg)
   and fight in the Coliseum (GLD leg) in either order.
3. Amajina & Sons: F'lhaminn teaches 6 emotes; calm the Maddened + Manic Miners with emotes.
4. Meet F'lhaminn at the Gate of Nald; escort her to Camp Black Brush through beast ambushes.
5. Camp Black Brush echo (Ascilia); return to the Concern stage; Frondale's Phrontistery sickrooms;
   report to Momodi. Rewards: 200 EXP + 6,000 gil (completion), 2,000 gil (flower, SEQ_015),
   3,000 gil (escort, SEQ_080), Coliseum Pass 11000126 (SEQ_012).

## Sequence flow (VERIFIED: man0u1.lua onStateChange/onTalk/onPush/onEmote/onNpcLS)

- SEQ 000: Quicksand PA (175/PrivateAreaMasterPast/4). Momodi `processEvent010` -> 005 + NpcLS.
- SEQ 005: attune Black Brush aetheryte 1280032 (AetheryteParent arm) -> 010 on Momodi talk
  (`processEvent015`). Ococo ambient `1000_1`.
- SEQ 010/012: Momodi `processEvent017` -> Coliseum Pass toast 25117 + NpcLS -> 015.
- SEQ 015: parallel legs via counters GSM(0)/GLD(1). GSM: Elecotte `processEvent020` (+2,000 gil).
  GLD: GLD_TRIG 1090283 `processEvent030` -> lobby PA (209/Past/0); Lulutsu pass check; COL_TRIG
  1090141 -> entry ask `1000_5` -> hidden fight director (see Fight); kill -> GLD=2, warp to echo
  PA (209/Past/1); COLISEUM_POST_TRIG `processEvent035` -> GLD2_TRIG followup `040`/`045` -> GLD=3.
  Both legs done -> NpcLS {301,302,303} read -> 045 (either order; re-talk recovery in
  seq015_onTalk/seq015_endSequence).
- SEQ 045: Linette `processEvent050` -> miner PA (209/Past/2) -> 050.
- SEQ 050: F'lhaminn teaches Furious/Beckon/Laugh/Deny/Upset/Soothe (051_1..6) in order; wrong
  emote replays 051_7 + current lesson. Soothe done -> 057 (inits Manic-step counter).
- SEQ 057: calm miners. Maddened = Beckon (emoteDefault2) alone; Manic = Soothe->Furious->Laugh
  (6->1->3) tracked by CNTR_SEQ57_MANIC_STEP. Every emote plays its 055_x/056_x bark; wrong
  emotes only rebuff. Both flags -> `processEvent060` -> miner PA (Past/3) -> 058.
- SEQ 058: F'lhaminn `processEvent070` -> public -> 060.
- SEQ 060: Gate of Nald trigger 1090004 -> `contentsJoinAskInBasaClass` -> escort content
  Man0u102 (see Escort). Entry requires: public zone 170, combat class, route present, dismounted.
- SEQ 065: escort duty. Arrival -> SEQ70_TRIG completion cutscene `processEvent080` -> zone 170
  PA Past/4 (51.855, 200.027, -482.399) -> 070.
- SEQ 070: Ascilia `processEvent090` -> public 170 (-32.6, 182.5, -77) -> 080.
- SEQ 080: Concern MIN_TRIGG `processEvent205` (+3,000 gil) + NpcLS -> 090.
- SEQ 090: Nogeloix `processEvent210` -> 095. SEQ 095: ALCH_TRIGG `processEvent220` -> zone 180
  (-204.9441, 0, -159.944) -> 100. SEQ 100: SEQ100_TRIGG `processEvent230` + NpcLS -> 105.
- SEQ 105: NpcLS {307,308} read -> 110. SEQ 105/110 trigger: SEQ105_TRIGG warps 209
  (-215.248, 229.5, 297.833). SEQ 110: Momodi `processEventComplete` + `sqrwa 200,1,1,2` +
  6,000 gil + 200 EXP + CompleteQuest.
- Dead declarations: SEQ_075/085 are declared but never armed or reached (070->080, 080->090
  direct). Unreachable; left as-is (see Open gaps).

## Actors / triggers / spawns with guide coordinates (VERIFIED: Lua/JSON + map tool)

Coliseum duel (zone 209, page 1900 Merchant Strip, scale 2, base 736/352):

| Who | Actor/BNPC | Position (X, Y, Z, rot) | Map (tool-measured) |
| --- | --- | --- | --- |
| Tourney Gladiator spawn | 2280157 / 1362 | -178.251, 174.891, 160.092, -1.596 | (5.58, 5.12), 19 recorded pts in 30u |
| Player fight entry | — | -192.400, 174.890, 160.119, 1.576 | arena floor (recorded Y ~195 is the upper level, other floor) |
| Post-fight landing | — | -181.758, 189.985, 219.688, 1.753 | walk-to cutscene circles nearby |
| Fail/timeout lobby | — | -187.225, 190.150, 219.730, 0.0 | pre-fight lobby PA Past/0 |

Escort ambushes (zone 170 Central Thanalan, page 1000, scale 1, base 2687/3072; all mobs
Chinchilla 2204010 / bnpc 1401, Lv 1, radius 6):

| Stop | WP idx | Mob XYZ | Map (tool-measured) | Recorded pts in 30u |
| --- | --- | --- | --- | --- |
| stop1 x1 | 16 | 0.179, 184.296, -144.468 | (26.87, 29.28) | 0 |
| stop2 x2 | 52 | 4.332, 184.424, -230.329 | (26.91, 28.42) | 3 |
| stop2 x2 | 52 | 7.555, 184.551, -230.725 | (26.95, 28.41) | 2 |
| stop3 x2 | 94 | 90.794, 184.115, -320.298 | (27.78, 27.52) | 46 |
| stop3 x2 | 94 | 95.273, 183.791, -320.531 | (27.82, 27.51) | 46 |
| stop4 x2+1 | 140 | 63.176, 199.630, -395.617 | (27.50, 26.76) | 10 |
| stop4 | 140 | 66.769, 199.957, -397.414 | (27.54, 26.75) | 9 |

Escort route: 174 waypoints, Gate of Nald (-29.931, 181.261, -87.190) -> Black Brush
(28.343, 200.011, -451.246). Content entry (-31.239, 183.087, -74.303, 2.875); content
boundary box X -80..180, Z -520..-40; completion end (58.524, 199.752, -457.087).
Heights are recorded route heights, not extrapolated (per guide: Y unresolved at map center).

## Triggers (VERIFIED: man0u1.lua + directors)

GLD_TRIG 1090283 (lobby), COL_TRIG 1090141 (fight entry), COLISEUM_POST_TRIG 1099501
(post-fight CS), GLD2_TRIG 1099502 (followup), ESCORT_TRIG 1090004 (gate offer; SEQ_060/070),
SEQ70_TRIG 1090077 (completion CS owner, spawned in-duty as
`man0u1_completion_black_brush_trigger`), MIN_TRIGG 1090044, ALCH_TRIGG 1090119,
SEQ100_TRIGG 1090121, SEQ105_TRIGG 1090120, BLACKBRUSH_AETHERYTE 1280032,
PRIVATEAREA_PAST_EXIT 1290002. ENPC arming is sequence-scoped in onStateChange; stale
fight flag self-heals via clearStaleCourtFightFlag when the director is gone.

## Dialogue flow (VERIFIED: man0u1.lua processEvent map + Loremonger quotes)

Intro instance 000_1 (instance explainer) / 000_2..10 (9 ambient NPCs); Momodi chain
010/013/015/017 (+017_2/3/4 reminders); GSM 020 (+020_2 re-talk, 025 linkshell lesson);
GLD lobby 030 (+030_2..11 ambient, 032_2/3/4, 1000_1/2); post-fight 035 "splendid match" +
040 gathering echo / 045; miner scene 050 (+050_2..14 crowd), teach 051_1..6, fail 051_7,
reminder 051_8, rebuffs 055_1..3 / 056_1..3, resolution 060 (+060_2..7); escort entry 075;
camp 080 (+080_2..12 crowd), Ascilia 090; Concern 200_2 gossip / 200 / 205; Phrontistery
210 (+210_2..8 ward), echo 220, report 230, completion. Escort barks are man0u1 sheet rows
365-376 (ready/ambush/clear/warning/fail 371-372/approach/arrived).

## Fight tuning (VERIFIED: man0u1.lua + QuestDirectorMan0u101.lua)

Tourney Gladiator: actor 2280157, bnpc 1362, unique `man0u1_tourney_gladiator`; -50
AutoAttackDamage / -50 PhysicalActionDamage; 10s aggro delay after landing-ready
(`ForceCourtEngageTarget`, player-initiated combat short-circuits); 5-minute mission
notice 50026 + timeout. Win = kill -> GLD=2, despawn, echo PA. No phases/adds/enrage by
retail design (Lv 1 scripted duel). Solo, fixed roster (no scaling). KNOWN DIVERGENCE:
retail is an unwinnable scripted LOSS ("Don't let losing get to you", Loremonger; design
doc proposes MinimumHpLock both sides with HP==1/timeout completing). Shipped code is
kill-to-win with timeout/KO -> retry; kept deliberately (active probe direction) — see gaps.

## Escort pathing (VERIFIED: route JSON + QuestDirectorMan0u102.lua + content script)

F'lhaminn actor 2290008 (ally, not in party, level badge hidden, leash map marker r=32 /
caution 30). Move 4.0, follow 6.0, recall 4.0 (1.5x speed), resume 10.0, combat hold 24.0,
owner leash 32 (wait outside leash, no fail distance). 30-minute mission notice 50026.
4 chinchilla stops (1+2+2+3 mobs, encounter events 100+n/200+n drive barks 366-370/367-369).
Music field 37 / battle 21. Completion holds escort actors, kicks SEQ70_TRIG pushDefault to
`processEvent080`, then tears down. Fail (escort fail/deleted, owner KO, 30-min timeout,
leave, missing route) -> SEQ_060 + gate warp (-31.239, 183.087, -74.303) for retry, matching
retail "beat the retreat ... camp will wait" fail line.

## Chocobo / companion disabled (VERIFIED: route JSON + director + quest Lua, full reads)

- `court_in_the_sands.json`: `canCallBackChocobo: false` (was true; fixed this session).
- `QuestDirectorMan0u102.startRoute`: `route.CanCallBackChocobo = false` override (last in the
  pcall block so a strict-loader failure cannot drop earlier fields).
- `man0u1.lua`: `courtIsMoun
...[truncated 2834 chars]