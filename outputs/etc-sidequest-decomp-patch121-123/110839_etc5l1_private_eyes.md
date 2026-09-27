# Private Eyes — 110839 (Etc5l1, patch_1_22b)

- Script: `Data/scripts/quests/etc/etc5l1.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_22b, commented out (Lv 15, requires 110829).
- Type: dialogue/delivery/interaction with private-area cave + push-cutscene
  finish. No kill, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: same wanted-poster flow as Etc5g1 via Otopa (`Start` +
  `giveWantedItem` / `Start_2`), gated on `IsQuestCompleted(110829)`;
  Mytesyn branch sends the 51148 hint. Bed fallback MAPONLY (verified).
- SEQ_000: Bertrand (1001903) `processEvent_010` -> SEQ_010 +
  `WarpToPublicArea` (ejects to public side after the cave talk — verified);
  Mytesyn reminder `_000_1` (retail text: Gannet cave NW of Camp Bearded
  Rock, per wiki #128); Abraham (1002066) `_010_1` ambient.
  Entrance 1090087 PUSH -> `instanceAreaJoinAskInBasaClass` join prompt,
  choice 1 -> `WarpToPrivateArea(..., 5, -220.948, 16.603, -92.863, -2.090)`.
- SEQ_010: no talk handler by design; CUTSCENE_PUSH_TRIGGER 1090088 PUSH ->
  `processEvent_020` + `sqrwa(500,1,1)` + `CompleteQuest`, then `EndEvent`.
  Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventOTOPAPOTTOPAStart[_2]`, `processEvent_000_1`, `processEvent_010`,
`processEvent_010_1`, `instanceAreaJoinAskInBasaClass`, `processEvent_020`,
`sqrwa` — all recovered events bridged (verified).

## Actors (verified spawn rows)

- Public: `etc5l1_push_cave` 1090087 zone 128 (-156.619, 25.6, -92.19);
  `etc5l1_push_cutscene` 1090088 zone 128 (-400.39, 41, -311.12).
- Private area 5 (zone 128): Bertrand 1001903, Abraham 1002066, three
  bronze chests / glass drinks / rectangular boxes (1080056-58, nine prop
  rows 2191-2195, 2254-2258) + exit 1290002 (verified existing surface).

## Markers (DAT-verified)

- 11072101 (cave), 11072102 (Bertrand), 11072103 (cutscene). Production
  returns cave at SEQ_000, cutscene at SEQ_010; private-side Bertrand swap
  is an open TO-DO (recorded).

## Counters / journal

- No counters; journal empty. Journal text: xtx_quest Sea/381-383.
- Cutscene rows: `11083901,etc5l110` + `11083902,etc5l120` (verified —
  ending cutscene at the last objective marker per wiki #128).

## Rewards (SQL parity verified)

- `(110839, 1, 'Exp', 0, 500, autoGrant 1)`. `sqrwa(500,1,1)` matches.
  No manual completion grants (verified correct).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110839, ..., 110829, 15)`. Header agrees.

## Mob spawn evidence

- None — no kill objective.

## Instance surface (needed vs existing)

- NEEDED: cave interior area 5 (zone 128) + ending-cutscene trigger area.
- EXISTING: Bertrand/Abraham/props/exit staged; public cave + cutscene
  push rows staged (verified).
- GAP (unrecovered): exact retail warp arrival XYZ; `processEvent_020`
  arg payload; no live-client check. Do NOT invent.

## Inferred vs verified

- VERIFIED: delegates incl. join prompt, staged cast/props, markers,
  journal rows, two cutscene rows, reward parity.
- INFERRED: `_000_1` reminder assignment; warp arrival XYZ.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` (2 sites), `player:GetItemPackage()`,
  `local choice`. No logic change.
