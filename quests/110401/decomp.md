# 110401 Dance the Night Away (Wvr300) — decomp

Weaver rank-30 quest. Chuchumu must attend the royal/Syndicate ball
but needs magic slippers from Gridania's "green wizard". The trail
runs Deaustie -> Chuchumu -> Soileine (Stillglade Fane) -> Theldry
(Ebony Stalls merchant): the slippers are her reserved Midnight
Slippers, and she will part with them if you advertise her shop by
winning four customer Parleys (Cicely, Nesta, Keelty, Miounne). Then
deliver to Chuchumu and report to Deaustie.

Sources: `Data/scripts/quests/wvr/wvr300.lua` (full body read),
`wvr_quest_helpers.lua`, `Data/scripts/negotiation_game.lua`
(existence verified), `hrv300.lua` Parley pattern (inspected),
gamedata/recipe/spawn rows (inspected),
[Weaver Quests 1.0](https://finalfantasy.fandom.com/wiki/Weaver_Quests_(version_1.0)).

## Sequence / flags / counters

| Seq | Name | Talk | Effect |
|-----|------|------|--------|
| accept | offer | Deaustie 1000293 | delegateEvent processEventDeaustieStart; accept -> 0 |
| 0 | assign | Chuchumu 1000905/1000906 | bare advance -> 5 |
| 5 | lead | Soileine 1000234 | processEvent012 -> 10 |
| 10 | bargain | Theldry 1000379 | processEvent015 -> 15 |
| 15 | parleys | 4 opponents + Theldry | talk stamps Parley board; onNegotiationResult sets win flags; Theldry at 4/4 grants slippers + processEvent018 -> 19 |
| 19 | slippers | Chuchumu | consume 1x Midnight Slippers 11000139 (verified); processEvent020 -> 20 |
| 20 | reward | Deaustie | processEvent030; CompleteQuest; AddExp 3420 |

Flags (newly assigned, no recovered slots): 0 Cicely, 1 Nesta,
2 Keelty, 3 Miounne, 4 parley-introduced. Counters: none. Journal:
seq 15 shows wins/4. Gates: Weaver + true level >= 30 + 110400
completed, on every guard.

## Parley wiring

Engine: `negotiation_game.lua` via command 29497 (Hrv300 pattern).
Each opponent talk idempotently stamps `negotiation.*` temp vars
(enabled, title_id, desired/required item 0, difficulty 3, max_turns
12, turn_time 20 defaults) + SetNegotiatable(true). Titles positional
2401/2501/2601/2701 in opponent order (2801/2901 unresolved spares).
onNegotiationResult self-filters (sequence, introduced flag,
opponent identity, already-won); losses retry; wins clear the board
so shared NPCs are not misrouted. 018_2/019 alternates unmapped.

## NPCs / spawns

- Deaustie 1000293: row 149, zone 209 (38.84, 195.59, 257.89).
- Chuchumu 1000905: row 3354, zone 171 (1122.500, 312.200, -1118.500).
- Soileine 1000234: row 2296, zone 206 (-330.813, 8, -1682.83).
- Theldry 1000379: row 3357, zone 206, Ebony Stalls
  (257.500, 14.000, -1261.000). Market-floor height (keelty 5.4u).
- Nesta 1000593: row 3358, zone 206 (265.000, 14.000, -1268.500).
- Cicely 1000326: row 548, zone 206 (-202.69, 20, -1461.13).
- Keelty 1000587: row 3291, zone 206 (261.380, 14, -1264.700).
- Miounne 1000230: row 587, zone 155 (55.94, 4, -1196.44).
- Cicely/Keelty/Miounne reuse public spawns away from the Parley
  markers; no instance copies (talk re-stamps the single board).

## Dialogue / cutscene IDs

processEventDeaustieStart, processEvent012, processEvent015,
processEvent018, processEvent020, processEvent030.

## Objectives / markers

11040101 assign, 11040102 lead, 11040103 bargain, 11040107-11040110
parleys, 11040104 slippers, 11040105 reward.

## Instance / territory / sync / lockout

None. Open world only (zones 209/171/206/155). No private content,
no zone changes, no party, no timer, no level sync, no lockout, no
chocobo handling. No synthesis on this quest.

## Mobs

None. Parley/delivery quest: no BNPCs, no abilities, no AI, no
enmity, no leash, no death/wipe handling.

## Rewards

Gil 30000 + Weaver marks 1000118 x3000 (central, autoGrant) + EXP
3420 script-side (stated post-1.20 maximum).

## Edge handling

- Class/level/chain gates on every guard; result handler self-filters.
- Win flags stop double-credit; slipper grant verified (inv-full
  safe); delivery consume verified (no dup turn-ins).
- onFinish consume-all on complete AND abandon.
- Shared-NPC boards cleared on win; re-stamp is idempotent, so quest
  switching and logout/DC resume cleanly. Parley losses retry.
