# In Plain Sight — 110829 (Etc5g1, patch_1_22b)

- Script: `Data/scripts/quests/etc/etc5g1.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_22b, commented out (Lv 15, requires 110849).
- Type: dialogue/delivery/interaction with private-area scene (Acorn Orchard).
  No kill, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Otopa Pottopa TALK if dossier-less poster flow: no wanted
  notice (10011243) -> `processEventOTOPAPOTTOPAStart` + `giveWantedItem`
  (inventory-checked add with FULL/UNIQUE/SYSTEM_ERROR messages, verified)
  + clear talk graphic + 51148 logout-hint; else `...Start_2` re-issue
  dialog. V'korolon branch sends the same 51148 hint (retail-accurate
  no-dialog per code comment). Offer gated on `IsQuestCompleted(110849)`
  in `onStateChange` (verified); bed fallback MAPONLY when poster held.
- SEQ_000 (public + private area 5): Nicoliaux (1002071)
  `processEvent_010` -> objectives-complete + `StartSequence(SEQ_010)`;
  ambient dialogs Powle/Aunillie/Gauw yn/Hildibrand/Nashu
  (`_010_5/_010_6/_010_2/_010_3/_010_4`); V'korolon reminder `_000_1`.
  Entrance 1090085 PUSH -> `WarpToPrivateArea(PrivateAreaMasterPast, 5,
  -33.709, 7.810, -1272.337, -0.810)` after `EndEvent` (verified).
- SEQ_010: V'korolon `processEvent_020` + `sqrwa(500,1,1)` + `CompleteQuest`
  + 51148 Mizzenmast logout hint. Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

All eleven recovered events bridged: `processEventOTOPAPOTTOPAStart[_2]`,
`processEvent_000_1`, `processEvent_010[_1.._6]`, `processEvent_020`, `sqrwa`.
Wiki archive (#125) confirms dialog roles.

## Actors (verified spawn rows)

- Public: entrance `etc5g1_push_Acorn` 1090086 zone 206 (-32.2, 7.9, -1273.49).
- Private area 5 (zone 206): Sansa, Ryd, Powle, Gauw yn, Nicoliaux, Elyn,
  Hildibrand, Nashu, Aunillie + `etc5g1_PrivAreaExit` 1290002
  (rows 2184-2188, 2246-2250 — verified existing surface).
- Warp destination (-33.7, 7.8, -1272.3) lands inside the staged group
  (verified adjacency, not a retail coordinate).

## Markers (DAT-verified)

- 11082101 (Acorn Orchard public side), 11082102 (Nicoliaux),
  11082103 (V'korolon). Production returns area marker at SEQ_000 and
  V'korolon at SEQ_010; private-side Nicoliaux marker swap is an open
  TO-DO in code (recorded, not implemented).

## Counters / journal

- No counters; journal callback empty. Journal text: xtx_quest Fst/522-524.
- Cutscene row: cutReplay.csv `11082901,etc5g110` (verified).

## Rewards (SQL parity verified)

- `(110829, 1, 'Exp', 0, 500, autoGrant 1)`. `sqrwa(500,1,1)` matches.
  Wanted poster is a pre-accept utility item, not a completion reward —
  no manual completion grants (verified correct).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110829, ..., 110849, 15)`. Header agrees.

## Mob spawn evidence

- None — no kill objective.

## Instance surface (needed vs existing)

- NEEDED: PrivateAreaMasterPast area 5 (zone 206) Acorn Orchard scene.
- EXISTING: full staged cast + entrance + exit rows listed above (verified).
- GAP (unrecovered): exact retail warp arrival XYZ and private-side marker
  swap rule. Do NOT invent; warp kept as staged.

## Inferred vs verified

- VERIFIED: delegates, staged cast, entrance/exit, markers, journal rows,
  cutscene row, reward parity.
- INFERRED: `_000_1`/`_010_1` reminder contents (code-marked educated
  guesses); warp arrival XYZ; no live-client scene check.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` (2 sites), `player:GetItemPackage()`,
  otherwise unchanged (gates, EndEvent-before-warp, single completion all
  verified already correct).
