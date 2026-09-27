# 110736 — Disorganized Crime (Etc3g2)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 21, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3g2)`.
- Quest giver: Biddy, native 1100121 / actor 1000737.
  Actor spawn rows VERIFIED (2 rows incl. a `PrivateAreaMasterPast` echo row
  `man0g1_echo_biddy` @ zone 206; see 110735 note — engine ENPC resolution
  recorded as an observation, not a bug).
  Native 1100121 has no static row (variant pattern).
- Objective: two-stage push — SEQ_000 `LIFEMEND_STUMP_OBJECTIVE` 1090225
  (`etc3g2_lifemend_stump_objective` @ zone 150, `-789.140, 21.230, -1071.110`)
  → SEQ_005 `REDBELLY_DEN_OBJECTIVE` 1090226
  (`etc3g2_redbelly_den_objective` @ zone 154, `818.140, -11.440, 1443.450`)
  — both VERIFIED static rows → SEQ_010 return. Non-standard 0/5/10 numbering.
- No kill counter, no objective item, no journal markers (`{}`).

## Sequence flow (from `Data/scripts/quests/etc/etc3g2.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Biddy variants `QFLAG_TALK`; delegate
  `processEventBiddyStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Biddy re-talk → `processEvent_000_01`. `onPush` on 1090225
  plays FIVE delegates (`processEvent_010`, `_010_01`, `_010_02`, `_010_3`,
  `_010_4`) + 25225 → SEQ_005.
- `SEQ_005`: `onPush` on 1090226 → `processEvent_015` (forced `true` arg);
  if result ~= 1, falls back to `processEvent_015_2`; 1 →
  `processEvent_020` + 25225 → SEQ_010. Any other outcome leaves SEQ_005
  retry-safe — VERIFIED no dead-end. Wrong-actor/seq pushes end silently.
- `SEQ_010`: Biddy → `processEvent_030` + `sqrwa(1401, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: raw sequence number.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventBiddyStart`, `processEvent_000_01`, five SEQ_000 push delegates,
  `processEvent_015`, `processEvent_015_2`, `processEvent_020`,
  `processEvent_030`, `sqrwa` (exp 1401).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

10000 gil + 1401 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED (real bug): removed duplicate `player:AddExp(REWARD_EXP, ...)` after
  `CompleteQuest` — identical double-grant to 110727 (2802 instead of 1401).
- Verified safe, no change: colon-form calls; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk/push paths; push identity gates;
  fallback-delegate retry safety.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Both pushes are delegate-fronted scene/encounter handoffs with no spawned
  mobs, no encounter script, no BCNM surface in code.
- What exists: giver spawns, both objective static rows with world XYZ, full
  0/5/10 Lua with retry-safe fallback gating, reward rows.
- What is missing: the scene/encounter bodies behind the push delegates —
  DAT scene IDs, audience rules, combat roster all unrecovered. The five plus
  three delegate names are the only evidence of the intended content.
  Live-client acceptance open.
