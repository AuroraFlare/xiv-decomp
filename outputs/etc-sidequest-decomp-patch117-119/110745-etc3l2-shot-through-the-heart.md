# 110745 — Shot Through the Heart (Etc3l2)

- Patch family: patch_1_18 (Etc sidequests). SQL: level 21, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3l2)`.
- Quest giver: Mynadaeg, native 1600120 / actor 1000130.
  Actor spawn VERIFIED (`mynadaeg` @ zone 230, `-600.29, 28.48, -67.55`);
  native spawn VERIFIED (`etc3l2_malin` 1001634 @ zone 130,
  `1599.960, -0.084, -690.870` — note: the OBJECTIVE actor itself carries a
  `malin`-named static row, and native 1600120 has a zone-173 row).
- Objective: two-stage push on `OBJECTIVE` 1001634 — SEQ_000 "investigate the
  first lead" → SEQ_005 "begin the cutscene encounter" (proceed-gated) →
  SEQ_010 return. Non-standard sequence numbering (0/5/10) preserved verbatim
  from retail script structure.
- No kill counter, no objective item, no journal markers (`{}` — VERIFIED).

## Sequence flow (from `Data/scripts/quests/etc/etc3l2.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Mynadaeg variants `QFLAG_TALK`; delegate
  `processEventMynadaegStart` (arg 0); 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Mynadaeg re-talk → `processEvent000`. `onPush` on 1001634 →
  `processEvent010` + 25225 → `StartSequence(SEQ_005)`. Pushes from any other
  actor end silently.
- `SEQ_005`: `onPush` on 1001634 → `processEvent010_2` (arg 0) returns
  `proceed`; 1 → `processEvent010_3` + 25225 → SEQ_010. Declined (0) leaves
  SEQ_005 with `UpdateENPCs` + `EndEvent` — retry-safe, VERIFIED no
  dead-end. Mynadaeg has NO SEQ_005 branch (talking to her mid-encounter
  only runs `UpdateENPCs`/`EndEvent` — no softlock, no skip).
- `SEQ_010`: Mynadaeg → `processEvent015` + `sqrwa(1401, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: raw sequence number. No `getJournalMapMarkerList` content.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventMynadaegStart`, `processEvent000`, `processEvent010`,
  `processEvent010_2`, `processEvent010_3`, `processEvent015`,
  `sqrwa` (exp 1401).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

10000 gil + 1401 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk/push paths; push actor-identity gate
  on both stages; proceed-gate retry-safe.

## Instance-surface need (UNRECOVERED — do NOT stub)

- The SEQ_005 "cutscene encounter" is delegate-fronted (`processEvent010_2`
  proceed check + `processEvent010_3`) with no spawned mobs, no encounter
  script, no BCNM surface in code.
- What exists: both Mynadaeg-variant spawns, objective static row, full
  0/5/10 Lua with retry-safe gating, reward rows.
- What is missing: the encounter/scene body behind the delegates — DAT scene
  IDs, audience rules, and any combat roster are unrecovered. Live-client
  acceptance open.
