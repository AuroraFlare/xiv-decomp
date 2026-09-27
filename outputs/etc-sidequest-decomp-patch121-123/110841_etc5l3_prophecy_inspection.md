# Prophecy Inspection — 110841 (Etc5l3, patch_1_23a)

- Script: `Data/scripts/quests/etc/etc5l3.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23a, commented out (Lv 20, requires 110840).
- Type: dialogue/delivery/interaction (Coffer & Coffin push + five bomb-bane
  talk flags) with private-area scene. No kill, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Kopuru/V'korolon/Mytesyn dossier re-issue
  (`processEventKOPURUStart` / `KOROLONStart` / `MYTESYNStart`) + beds
  (1200378/79/80) MAPONLY inn-login markers. POST-FIX: each branch captures
  the accept choice; choice 1 -> `AcceptQuest` + dossier re-issue +
  51149 message (previously NO AcceptQuest call existed — the quest could
  never be accepted; fixed, see below). Offer gated on
  `IsQuestCompleted(110840)` (previously also required NOT holding the
  dossier, which the previous quest auto-grants — the offer could never
  appear; fixed, see below).
- SEQ_000: no talk handler by design; COFFER_AND_COFFIN_PUSH 1090090 PUSH ->
  `processEvent_005` + bomb-bane obtain message (11000230, display-only
  DummyItem) + SEQ_005, then warp to private area 5
  (-1732.891, 56.119, -307.285, -2.785) + seat Nashu (nil-guarded post-fix).
- SEQ_005: Hildibrand/Nashu/Alret dialogs (`_005_1/_005_2/_005_3`); five
  BOMB_BANE actors (1080090-94) TALK set flags 0-4 + increment
  COUNTER_BANE with `processEvent_005_4(count, 5)`; at 5 ->
  objectives-complete + `ClearData` + SEQ_010. Re-talk of a set bane is
  ignored (flag-guarded, verified).
- SEQ_010: Alret `processEvent_020` + `sqrwa(1120)` + `WarpToPublicArea` +
  `CompleteQuest`. Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

All nine recovered events bridged: `processEventKOPURUStart`,
`processEventKOROLONStart`, `processEventMYTESYNStart`, `processEvent_005`,
`processEvent_005_1/_2/_3/_4`, `processEvent_020`, `sqrwa` (verified).
Wiki archive (#130) confirms roles incl. arg-carrying `_005_4`.

## Actors (verified spawn rows)

- Public: `etc5l3_push_coffin_coffer` 1090090 zone 172
  (-1732.31, 56.063, -305.919).
- Private area 5 (zone 172): Alret 1002114, Nashu `etc5l3_nashu` 1001996,
  Hildibrand 1001995, banes 1080090-94 (five rows 2261/2199/2262/2200/2263),
  exit 1290002 (verified existing surface).
- Inn beds 1200378/1200380/1200379 zone 244 (verified); Kopuru zone 209
  (verified, see 110840).

## Markers (DAT-verified)

- 11072204 (coffin), 11072205-209 (banes 1-5), 11072210 (Alret). Bane
  markers are individually retired as flags set (verified logic).

## Counters / journal

- Counter 0 = banes sprinkled (0-5); flags 0-4 = per-bane state.
- Journal callback returns `(0, ITEM_BOMB_BANE)` (client-bugged display per
  code comment; retained as-is, recorded).
- Journal text: xtx_quest Sea/400-403 (verified).
- Cutscene rows: `11084101,etc5l310` + `02,etc5g310` + `03,etc5u310` +
  `04,etc5l320` + `05,etc5l330` (verified — multi-scene quest).

## Rewards (SQL parity verified)

- `(110841, 1, 'Item', 9030064, 1, 'dat-new', autoGrant 1)`,
  `(110841, 2, 'Exp', 0, 1120, 'wiki', autoGrant 1)`.
- `sqrwa(1120,1,1,9)` matches SQL 1120 (verified). No manual completion
  grants (verified correct).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110841, ..., 110840, 20)`. Header agrees.

## Mob spawn evidence

- None — no kill objective.

## Instance surface (needed vs existing)

- NEEDED: Coffer & Coffin private area 5 (zone 172).
- EXISTING: Alret/Nashu/Hildibrand/banes/exit staged (verified).
- GAP (unrecovered): retail warp arrival XYZ; no live-client check.

## Inferred vs verified

- VERIFIED: delegates, staged cast, markers, journal rows, five cutscene
  rows, reward parity, flag/counter logic.
- INFERRED: warp arrival XYZ; journal display bug is a code comment claim,
  not independently verified.

## Hardening (Part 2) — real bugs fixed

1. SEQ_ACCEPT talk branches never called `AcceptQuest` (quest uncompletable).
   Now choice-gated accept per NPC + dossier re-issue on accept.
2. Offer required NOT holding the memorandum, but 110840 auto-grants it —
   offer could never appear. Now gated on `IsQuestCompleted(110840)` only.
3. `FindActorInZoneByUniqueID("etc5l3_nashu")` result used unguarded
   (nil crash if the private-area actor is absent). Now `local` + nil guard.
4. `counterAmount` leaked to global scope; now `local`.
5. Canonical `quest:GetSequence()` (3 sites), `player:GetItemPackage()`.
   `giveDossierItem` gained FULL/UNIQUE/SYSTEM_ERROR messaging matching the
   sibling `giveWantedItem` pattern.
