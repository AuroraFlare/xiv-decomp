# 110695 — A Call to Arms (Etc3u0)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 5, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Quest giver: Fruhybolg 1000964 (3 static rows; canonical `fruhybolg` @
  zone 209, `-186.65, 193.2, 198.78`) — VERIFIED.
- Objective: talk to 5 people — Vannes 1001464, Jeger 1000655,
  Lettice 1000788, Zoengterbin 1000784, Thimm 1001439.
  Talk-target spawn check: all five return static rows — VERIFIED.
  Flags 1–5 (note: flag 0 unused) + `COUNTER_TALKED`; message 51062
  ("passed on word of the rite", x of 5), 25225 at 5/5.
- `REWARD_EXP = 200` constant (matches Etc3l0/Etc3g0 200-exp tier).

## Sequence flow (from `Data/scripts/quests/etc/etc3u0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Fruhybolg `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventFhruybolgStart` (retail misspelling preserved verbatim);
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: per-person first-talk delegates (`processEvent005_V/J/L/Z/T`)
  set flag + `IncCounter`; re-talk plays `..._2` variants. Fruhybolg re-talk
  → `processEvent000`. All-flags → 25225 + `UpdateENPCs` band-aid + SEQ_001.
- `SEQ_001`: Fruhybolg → `processEvent010` + `sqrwa(200, 1, 1, 9)` →
  single `CompleteQuest`.
- Markers 11090001–11090006, completed persons hidden — INFERRED
  coordinates. No `getJournalInformation`.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventFhruybolgStart`, `processEvent000`, five `processEvent005_*` +
  five `..._2` re-talk variants, `processEvent010`, `sqrwa` (exp 200).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8081118 x1 + 200 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout (no dot bugs found);
  flag-gated first-talk; `seq000_checkCondition` requires all five flags;
  single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths.
- `HasQuest` offer gate retained (family pattern; see 110653 note).
