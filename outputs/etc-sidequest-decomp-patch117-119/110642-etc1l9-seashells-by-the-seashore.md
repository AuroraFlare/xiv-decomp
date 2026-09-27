# 110642 — Seashells by the Seashore (Etc1l9)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 20, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Quest giver: Fupepe, native 1500121 / actor 1001301.
  Actor spawn VERIFIED (`fupepe` @ zone 129, `-1332.09, 1.68, -609`).
- Objective: collect 4 conch shells at Bloodshore via push-interact
  `SHELL_OBJECTIVE` 1090199 (`etc1l9_conch_shell_objective` @ zone 130,
  `1267.000, 1.000, -827.000`) — VERIFIED static row.
  (1090199 is the shared invisible-object class, also reused by class-quest
  valuables; this row is the quest-scoped instance of it.)
- Counter `COUNTER_CONCH_SHELLS` (target 4); item display 11000174 with
  25226 per push; 25225 at 4/4. Re-push at/over target plays the `shell`
  delegate and returns with no state change (pre-existing over-push guard).

## Sequence flow (from `Data/scripts/quests/etc/etc1l9.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Fupepe variants `QFLAG_TALK`; delegate
  `processEventStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Fupepe re-talk → `processEventFree`. `onPush` on the shell
  objective increments (guarded), advances to SEQ_001 at 4/4.
- `SEQ_001`: Fupepe → `processEventClear` + `sqrwa(1120, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: counter clamped to target for display. Markers 11064202 area /
  11064201 Fupepe — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventStart`, `processEventFree`, `processEventClear`, `shell`
  (over-push), `sqrwa` (exp 1120).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3010103 x12 + item 8010523 x1 + 1120 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout (no dot bugs found);
  over-push guard present; push gated on sequence + actor; single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths.
- No physical shell item is granted (counter-only collectible with item
  display ID). Matches the script's design; not altered.
