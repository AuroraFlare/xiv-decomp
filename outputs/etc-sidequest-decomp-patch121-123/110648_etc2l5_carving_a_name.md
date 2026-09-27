# Carving a Name — 110648 (Etc2l5, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2l5.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out (Lv 47, DoW/DoM).
- Type: dialogue/delivery/interaction (strongbox key + marble push chain).
  No kill, no instance, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Sizha Epocan dual-ID (`isSizhaEpocan`: 1900144 display ID /
  1001805 actor) TALK. Offer `processEventStart`; accept -> `AcceptQuest`.
- SEQ_000: reminder `processEventStartAfter`; KOBOLD_OBJECTIVE 1090216 PUSH
  grants strongbox key (11000227, guarded by HasItem) -> SEQ_005.
- SEQ_005: same push consumes key, grants yellow marble (11000206) +
  objectives-complete -> SEQ_010. (Redundant key re-grant before consume
  is harmless; retained.)
- SEQ_010: `processEventClear` + quest-item cleanup + `CompleteQuest`.
  NOTE: production has NO `sqrwa` call — matches recovered client set
  (parity row lists no `sqrwa`, no reward_widget; verified retail-accurate
  omission). Single CompleteQuest. `onFinish` also purges key/marble.
- Journal returns key/marble possession flags (verified five-field form).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventStart`, `processEventStartAfter`, `processEventClear` — full
recovered set bridged (verified).

## Actors (verified)

- 1001805 `Q_sizha_opocan`, zone 130 (627.653, 53.553, -1196.69); catalog
  displayName 1900144 (verified — 1900144 is a display ID, no separate spawn).
- `etc2l5_kobold_strongbox` 1090216, zone 135 (576.66, 52.1, -1697.24) —
  matches DAT marker 11064803 (verified) and the 2026-08-21 in-game `mypos`
  capture (`docs/etc_placeholder_objective_audit_2026-08-17.md`, verified).

## Markers (DAT-verified)

- 11064801 kobold area (591.07, -1689.83, area type), 11064802 Sizha
  (631.31, -1196.98), 11064803 strongbox (576.66, -1697.24). Returned per
  sequence (verified).

## Counters / journal

- Item-possession journal (key, marble). Journal text: xtx_quest Sea/385-387.
- quest_reward.csv: 3020002 x5 (old-table row for this quest id — recorded
  provenance only; current script grants no such item).

## Rewards (SQL parity verified)

- `(110648, 1, 'Item', 10004114 turquoise, 1, 'dat-new', autoGrant 1)`.
  quest_new_reward.csv carries the same turquoise grant (verified).
  No SQL EXP row and no `sqrwa` (verified consistent pair).
- quest_exp_gaps.csv notes only an encoded EXP tier (-13) with no concrete
  amount — correctly NOT materialized as a reward row (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110648, ..., 0, 47)`. Header agrees.

## Mob spawn evidence

- None — no kill objective (kobold camp is a push interaction, not a fight).

## Instance surface

- None needed (verified).

## Inferred vs verified

- VERIFIED: delegates, actors, markers incl. mypos capture, journal rows,
  turquoise reward row, sqrwa omission.
- INFERRED: key/marble DummyItem IDs as the retail pair (script-authored,
  DAT-plausible); no live interaction test.

## Hardening (Part 2) — real bug fixed

- Completion manually granted the turquoise on top of the autoGrant SQL row
  (double-grant) with a duplicate 25228 message. Removed manual
  `AddItem`/`attentionMessage`; `CompleteQuest` auto-grant (with its own
  message) remains. No other change (gates, push flow, cleanup verified).
