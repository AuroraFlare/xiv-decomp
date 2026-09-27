# 110727 — There Might Be Blood (Etc3u2)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 21, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3u2)`.
- Principals: Gunnulf, native 2200127 / actor 1001256 (actor spawn VERIFIED:
  `gunnulf` @ zone 175, `-173.16, 188.7, 106.58`; native 2200127 has no
  static row — variant pattern); Rycharde, native 1000221 / actor 1001718
  (1000221-class spawn rows VERIFIED present; 1001718 VERIFIED present).
- Objective: SEQ_000 speak with Rycharde and begin the encounter →
  SEQ_005 confirm the simplified handoff → SEQ_010 return to Gunnulf.
  Non-standard 0/5/10 numbering preserved verbatim.
- No kill counter, no objective item, no push actor (`onPush` is an
  immediate `EndEvent` — VERIFIED), no journal markers (`{}`).

## Sequence flow (from `Data/scripts/quests/etc/etc3u2.lua`, VERIFIED)

- `SEQ_ACCEPT`: Gunnulf pair `QFLAG_TALK`; delegate `processEventStart`;
  1 → `AcceptQuest` + bonus `processEventStartAfter` scene → `EndEvent`.
  (`onStateChange` SEQ_ACCEPT only flags Gunnulf; Rycharde unflagged until
  SEQ_000 — VERIFIED.)
- `SEQ_000`: Rycharde → `processEventRycharde` returns `proceed`; 1 →
  `processEventNqetc3u2` (the simplified encounter handoff, name preserved
  verbatim) → `StartSequence(SEQ_005)`. Declined leaves SEQ_000 retry-safe.
- `SEQ_005`: Rycharde → `processEventRychardeFree` + 25225 → SEQ_010.
- `SEQ_010`: Gunnulf → `processEventClear` + `sqrwa(1401, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: raw sequence number.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventStart`, `processEventStartAfter`, `processEventRycharde`,
  `processEventNqetc3u2`, `processEventRychardeFree`, `processEventClear`,
  `sqrwa` (exp 1401).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

10000 gil + 1401 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED (real bug): removed duplicate `player:AddExp(REWARD_EXP, ...)` after
  `CompleteQuest`. `CompleteQuest` auto-grants the SQL Exp row (1401); the
  manual `AddExp(1401)` paid a second 1401 (total 2802). Sibling instance
  quest 110736 had the identical double-grant, fixed the same way. Manual
  `AddExp` is retained ONLY in quests with no SQL Exp row (110811/110812/
  110813/110814), where it is the sole exp path — no double there.
- Verified safe, no change: colon-form calls; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths; proceed-gate retry-safe.

## Instance-surface need (UNRECOVERED — do NOT stub)

- The "encounter" is a talk delegate (`processEventNqetc3u2`) with no spawned
  mobs, no encounter script, no BCNM surface.
- What exists: both principals' spawns, full 0/5/10 Lua with retry-safe
  gating, reward rows.
- What is missing: the battle/scene body behind the handoff delegate —
  unrecovered. Live-client acceptance open.
