# Blood Price — 110708 (Etc2i2, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2i2.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out and labeled "instance"
  (Lv 45).
- Type: dialogue/delivery/interaction (target-site push chain with
  battle-flavored delegates). No chocobo. Kill content: NONE in production
  (see instance gap below).

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Foxe (1001839) TALK. Offer `processEventROGERStart`;
  accept -> `AcceptQuest`.
- SEQ_000: reminder `processEventdefault_1`; OBJECTIVE 1090228 PUSH plays
  `processEventdaytime` + `processEvent000` + `processEventBeloreBattle` +
  objectives-complete -> SEQ_005.
- SEQ_005: `processEvent010` + `sqrwa(REWARD_EXP=5340)` + `CompleteQuest`.
  Single CompleteQuest (verified).
- Journal returns (sequence, 0,0,0,0); marker callback returns {} — no DAT
  quest markers recovered for this quest (verified absence; 1107080x rows
  not present in quest_marker.csv).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

All six recovered events bridged: `processEventROGERStart`,
`processEventdefault_1`, `processEventdaytime`, `processEvent000`,
`processEventBeloreBattle`, `processEvent010`, plus `sqrwa` (verified).
NOTE: delegate names (`ROGER`, `default_1`, `daytime`, `BeloreBattle`) are
recovered-verified strings, but their scene/choreography meaning is
UNRECOVERED — the script plays them as opaque delegates (recorded, no
interpretation added). No wiki archive entry exists for this quest
(verified absence in quests-archive.md).

## Actors (verified)

- `etc2i2_foxe` 1001839, zone 145 (2626.51, 175, 1306.59).
- `etc2i2_gwyr_aen_objective` 1090228, zone 144 (654, 302, -1404).

## Markers

- None recovered (verified absence). Empty marker callback is consistent.

## Counters / journal

- No counters. No xtx_quest journal rows recovered for 110708
  (verified absence — journal returns sequence only).

## Rewards (SQL parity verified)

- `(110708, 1, 'Exp', 0, 5340, 'wiki', autoGrant 1)`.
- `sqrwa(REWARD_EXP=5340)` matches SQL 5340 (verified).

## Prereqs

- No SQL prereq row; header claims Level 45 (recorded as script-authored,
  unverified against DAT).

## Mob spawn evidence

- None in production. No BNPC ID documented (verified absence).

## Instance surface — OPEN GAP (unrecovered, do NOT invent)

- `quest_availability.lua` labels this quest "instance"; the decomp
  inventory references `questdirectoretc2i201` (SimpleQuestBattle director).
  Production has NO battle content; `processEventBeloreBattle` is played as
  an opaque delegate with no staged fight. No instanced-fight choreography
  recovered in scope. Recorded as an unrecovered instance gap.

## Inferred vs verified

- VERIFIED: delegate name set bridged, actors spawned, reward parity.
- UNRECOVERED: journal text, markers, delegate scene meaning, any fight.
- INFERRED: nothing beyond the staged push flow (kept minimal).

## Hardening (Part 2) — real bug fixed

- Completion manually granted EXP 5340 via `AddExp` on top of the autoGrant
  SQL row (double-EXP). Removed manual `AddExp`; `sqrwa` + `CompleteQuest`
  auto-grant remain. No other change.
