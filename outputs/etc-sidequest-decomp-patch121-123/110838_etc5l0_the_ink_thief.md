# The Ink Thief — 110838 (Etc5l0, patch_1_21)

- Script: `Data/scripts/quests/etc/etc5l0.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_21, commented out (Lv 1, second MSQ done).
- Type: dialogue/delivery/interaction. No kill, no instance, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Mytesyn (1000167) TALK. Offer `processEventMYTESYNStart`;
  accept -> `AcceptQuest` (`onStart` pre-arms SEQ_000, so no manual
  `StartSequence` needed — verified consistent).
- SEQ_000: Mytesyn reminder `processEvent_000_1`; Sweetnix (1001573)
  `processEvent_010` + `attentionMessage(25246, inkwell 11000223 x1)`
  display-only (DummyItem, never added) + `attentionMessage(25225)`
  + `StartSequence(SEQ_001)`.
- SEQ_001: Mytesyn `processEvent_020` + `sqrwa(200,1,1)` + `CompleteQuest`.
  Sweetnix reminder `processEvent_010_1`. Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventMYTESYNStart`, `processEvent_000_1`, `processEvent_010`,
`processEvent_010_1`, `processEvent_020`, `sqrwa`. Wiki archive (#127)
confirms roles, including Hildibrand finish cutscene.

## Actors (verified spawn rows)

- 1000167 `mytesyn`, zone 133 (-435.2, 40, 207.07).
- 1001573 `sweetnix_rosycheeks`, zone 133 (-477.8, 32, 168.21).

## Markers (DAT-verified)

- 11072001 (Sweetnix), 11072002 (Mytesyn). Returned per sequence (verified).

## Counters / journal

- No counters. Journal returns inkwell 11000223 at SEQ_001.
- Journal text: xtx_quest Sea/341-343 (verified).
- Cutscene row: cutReplay.csv `11083801,etc5l010` (verified).

## Rewards (SQL parity verified)

- `(110838, 1, 'Exp', 0, 200, autoGrant 1)`. `sqrwa(200,1,1)` matches.
  No manual grants (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110838, ..., 110002, 1)` — second Limsa MSQ.

## Mob spawn evidence

- None — no kill objective.

## Instance surface

- None needed (verified).

## Inferred vs verified

- VERIFIED: delegates, actors, markers, journal rows, cutscene row, rewards.
- INFERRED: exact finish-cutscene framing; no live-client playback.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` (3 sites). No logic change.
