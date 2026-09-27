# A Misty Past — 110646 (Etc2l3, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2l3.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out but labeled Implemented
  (Lv 17, any DoW/DoM).
- Type: dialogue/delivery/interaction (Shposhae object examine + choice).
  No kill, no instance, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: F'ongho (1000367) TALK. Offer `processEventFONGHOStart`;
  accept -> `AcceptQuest` (`onStart` pre-arms SEQ_000 — verified).
- SEQ_000: F'ongho reminder `processEvent_000`; objective actor 1000359
  (`ryssfloh`, the "???" in Shposhae) `processEvent_010` choice prompt;
  choice 1 -> obtain message (25246, ring 11000228) + `StartSequence(SEQ_005)`.
- SEQ_005: F'ongho `processEvent_015` -> SEQ_010.
- SEQ_010: F'ongho `processEvent_020` monster-choice; choice 1 ->
  `sqrwa(REWARD_EXP=841)` + `CompleteQuest`. Single CompleteQuest.
  Refusal branches leave state unchanged for retry (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventFONGHOStart`, `processEvent_000`, `processEvent_010`,
`processEvent_015`, `processEvent_020`, `sqrwa`. Wiki archive (#81)
confirms the set.

## Actors (verified)

- 1000367 `fongho`, zone 128 (288.24, 26.485, 342.12) — matches DAT
  marker 11064602 (288.24, 342.12) (verified).
- 1000359 `ryssfloh`, zone 128 (58.78, 46.1, -12.45), PopulaceStandard with
  talk events (actor catalog verified). DAT marker 11064601 at
  (287.24, 329.48) — area hint, NOT the actor position (recorded as
  area-marker evidence, not actor XYZ).

## Markers (DAT-verified)

- 11064601 (objective area), 11064602 (F'ongho). Returned per sequence.

## Counters / journal

- No counters. `getJournalInformation` returns 1 past SEQ_000.
- Journal text: xtx_quest Sea/325-328 (verified).

## Rewards (SQL parity verified)

- `(110646, 1, 'Item', 3020002, 5, 'dat-old', autoGrant 1)`,
  `(110646, 2, 'Exp', 0, 841, 'wiki', autoGrant 1)`.
- `sqrwa(REWARD_EXP=841)` matches SQL 841 (verified).
- quest_reward.csv row `11064801...` provenance: old reward table also
  carries 3020002 x5 for this quest line (recorded, not authoritative).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110646, ..., 0, 17)`. Header agrees.

## Mob spawn evidence

- None — no kill objective.

## Instance surface

- None needed (verified).

## Inferred vs verified

- VERIFIED: delegates, actors, markers, journal rows, reward parity.
- INFERRED: choice-prompt branch values (choice 1 = proceed); exact
  `processEvent_020` monster-choice mapping.

## Hardening (Part 2) — real bugs fixed

1. Offer gate used `not player:HasQuest(quest)` (re-offers after completion).
   Now `seq == SEQ_ACCEPT` (matches campaign convention + every sibling).
2. Completion manually granted item + EXP on top of autoGrant SQL rows
   (double-grant). Removed `AddItem`/`attentionMessage(25228)`/`AddExp`;
   `sqrwa` display + `CompleteQuest` auto-grant remain.
3. Objective actor (talk-type Populace) flagged `QFLAG_PUSH`; now
   `QFLAG_TALK` to match its `onTalk` examine handler (talk stays enabled
   either way; marker presentation fix, inferred).
