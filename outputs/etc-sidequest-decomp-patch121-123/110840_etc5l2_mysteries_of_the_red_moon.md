# Mysteries of the Red Moon — 110840 (Etc5l2, patch_1_23a)

- Script: `Data/scripts/quests/etc/etc5l2.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23a, commented out but labeled Implemented
  (Lv 20, requires 110839).
- Type: dialogue/delivery/interaction with private-area inn-room scene.
  No kill, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Kopuru Fupuru (1002047) TALK, class-gated offer
  `processEventStart`; accept -> `AcceptQuest` (`onStart` pre-arms SEQ_000).
- SEQ_000: Kopuru `_000_KOPURU` reminder + `DoZoneChange(181,
  PrivateAreaMasterPast, 5, ...)` room entry; BOOK 1200412 `processEvent000`
  -> SEQ_005; INN_EXIT 1090089 PUSH -> `processEventExit` join prompt,
  choice 1 -> `DoZoneChange(209, ...)` public exit (verified).
- SEQ_005: book follow-up `_000_BOOK`; CUTSCENE_PUSH_TRIGGER 1090253 PUSH ->
  `processEvent005_NQ` + `sqrwa(1120)` + `CompleteQuest`, then `EndEvent`.
  Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventStart`, `processEvent000_KOPURU`, `processEvent000`,
`processEvent000_BOOK`, `processEventExit`, `processEvent005_NQ`, `sqrwa` —
full recovered set bridged (verified). Wiki archive (#129) confirms roles.

## Actors (verified spawn rows)

- 1002047 `kopuru_fupuru`, zone 209 (-112.72, 202.405, 175.37).
- Private area 5 (zone 181): `etc5l2_book` 1200412, `etc5l2_inn_push_exit`
  1090089, `etc5l2_PrivAreaExit` 1290002 (rows 2196/2197/2259 — verified).
- Public cutscene trigger 1090253, zone 209 (-250.38, 202, 202.4) (verified).

## Markers (DAT-verified)

- 11072201 (Kopuru), 11072202 (book), 11072203 (cutscene). Production
  returns Kopuru at SEQ_000, cutscene at SEQ_005; private-side book swap is
  an open TO-DO (recorded).

## Counters / journal

- No journal callback in script (verified absence — matches recovered
  systems with no item_counter). Journal text: xtx_quest Sea/397-399 + 404.
- Cutscene row: `11084001,etc5l210` (verified).

## Rewards (SQL parity verified)

- `(110840, 1, 'Item', 10011252 memorandum, 1, 'dat-new', autoGrant 1)`,
  `(110840, 2, 'Exp', 0, 1120, 'wiki', autoGrant 1)`.
- `sqrwa(1120,1,1,9)` matches SQL 1120 (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110840, ..., 110839, 20)`. Header agrees.

## Mob spawn evidence

- None — no kill objective.

## Instance surface (needed vs existing)

- NEEDED: inn room area 5 (zone 181).
- EXISTING: book + inn exit + area exit staged (verified).
- GAP (unrecovered): retail room-entry XYZ (`DoZoneChange` args are
  staged); no live-client check. Do NOT invent.

## Inferred vs verified

- VERIFIED: delegates, staged room, markers, journal rows, cutscene row,
  reward parity.
- INFERRED: room-entry XYZ; `005_NQ` suffix meaning (opaque, not interpreted).

## Hardening (Part 2) — real bug fixed

- Completion manually added the memorandum via `giveWantedItem` BEFORE
  `CompleteQuest`, whose autoGrant SQL row grants the SAME item: duplicate
  memorandum, and (if unique) `CanAddQuestRewards` fails -> `CompleteQuest`
  refuses -> cutscene replays with no completion path (soft-lock). Removed
  the manual give + its success gate (completion is now direct); the 51149
  hint, `sqrwa`, and `CompleteQuest` auto-grant remain. Removed the
  now-unused `giveWantedItem`.
- Canonical `quest:GetSequence()` (2 sites), `local choice`.
