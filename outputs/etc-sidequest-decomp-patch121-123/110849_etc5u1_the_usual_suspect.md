# The Usual Suspect — 110849 (Etc5u1, patch_1_22b)

- Script: `Data/scripts/quests/etc/etc5u1.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_22b, commented out (Lv 15).
- Type: dialogue/delivery/interaction with private-area Coliseum scene.
  No kill, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: `hasWantedNoticePrereqs` (110828 + 110838 + 110848 completed)
  gates BOTH `onStateChange` flagging and `onTalk` (double-gated, verified);
  poster issue/re-issue via Otopa + 3071 logout hint; poster-held fallback
  to HOURGLASS_BED MAPONLY (verified).
- SEQ_000: Otopa reminder `_000_1`; Gauw yn (1002065) `processEvent_010`
  in private area -> objectives-complete + SEQ_010; Hildibrand/Nashu ambient
  (`_010_1/_010_2`). Entrance 1090085 PUSH -> `WarpToPrivateArea(...,
  5, -206.712, 195.148, 151.064, 1.821)` after `EndEvent` (verified).
- SEQ_010: Hildibrand/Nashu/Gauw yn follow-ups (`_010_1/_010_2/_010_3`);
  Otopa `processEvent_020` + `sqrwa(500,1,1)` + `CompleteQuest` + 2071
  Roost logout hint. Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

All eight recovered events bridged: `processEventOTOPAPOTTOPAStart[_2]`,
`processEvent_000_1`, `processEvent_010[_1.._3]`, `processEvent_020`, `sqrwa`.
Wiki archive (#126) confirms roles.

## Actors (verified spawn rows)

- Public: `etc5u1_push_coliseum` 1090085 zone 209 (-205.38, 195.074, 150.86).
- Private area 5 (zone 209): Gauw yn, Hildibrand (1001995 variant),
  Nashu, Ubokhn, Vannes, Xdhilogo, Dariustel, Guencen + exit
  (rows 2179-2182, 2241-2245 — verified existing surface).

## Markers (DAT-verified)

- 11092101 (Coliseum), 11092102 (Gauw yn), 11092103 (Otopa). Production
  returns Coliseum at SEQ_000, Otopa at SEQ_010; private-side Gauw yn swap
  is an open TO-DO (recorded).

## Counters / journal

- No counters; journal empty. Journal text: xtx_quest Wil/596-598.
- Cutscene row: `11084901,etc5u110` (verified).

## Rewards (SQL parity verified)

- `(110849, 1, 'Exp', 0, 500, autoGrant 1)`. `sqrwa(500,1,1)` matches.
  No manual completion grants (verified correct).

## Prereqs (verified)

- `gamedata_quests.sql`: base `(110849, ..., 0, 15)` + extra rows
  `(110849, 110828/110838/110848)` — all three Lv-1 inn quests required.
  Production `hasWantedNoticePrereqs` enforces exactly this (verified match).

## Mob spawn evidence

- None — no kill objective.

## Instance surface (needed vs existing)

- NEEDED: Coliseum private area 5 (zone 209).
- EXISTING: full staged cast + entrance + exit (verified).
- GAP (unrecovered): retail warp arrival XYZ; no live-client check.

## Inferred vs verified

- VERIFIED: delegates, staged cast, prereq triple-match, markers, journal
  rows, cutscene row, reward parity.
- INFERRED: warp arrival XYZ.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` (2 sites), `player:GetItemPackage()`.
  No logic change (double prereq gate already correct).
