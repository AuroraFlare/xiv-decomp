# Drg0j4 — Double Dragoon (111324, Lv45) — HOLD

- Quest ID 111324 (VERIFIED). Prerequisite 111323. Base 8 / job 19 /
  secondary 2/15, level 45. Owner 1002001 (Alberic); hidden.
- Decomp: `job-gc-decomp-20260907/quests/drg0j4.json` (luac sha pinned).
  Decomp events (VERIFIED): accept `processEvent_ALBERIC_Start`
  (registered but unreachable while HOLD).

## Sequence flow

- Documented lead-in (NOT a runnable route step — VERIFIED template
  comment): marker 11226301 (zone 143, 159.229996/477.869995, "southwest
  of Skyfire Locks"), event `processEvent_NQ_Drg0j410`, after-event
  `processEvent_ALBERIC_Guidance`, scene `Drg0j410`.
- `interactions` block (markers 11226302-05, event
  `processEvent_getAF_info`) has NO `objectives` table → sequence-6 hard
  stop by design.

## ENPC/BNPC IDs

- 1002001 Alberic (VERIFIED). Four Drachen-coffer actors: absent (no
  classes, unique IDs, Y/rotation, push owners — VERIFIED gap).

## Markers / documented bindings (walkthrough-corroborated pairs, still not executable)

- 11226302 Aurum Vale (102/204, -368.99/1397.95) ↔ 8051404
- 11226303 U'Ghamaro Mines (101/104, 96.96/-2692.71) ↔ 8071404
- 11226304 north of Camp Brittlebark (105/501, 680.70/460.93) ↔ 8081804
- 11226305 north of Camp Bluefog (104/404, -228.54/-2380.83) ↔ 8013504
- Journal: `{[0]=0,[6]=1}` (Roc 27 rendezvous, 28 independent collection).

## Rewards (design, inert)

- EXP 5340. No central rows (VERIFIED).

## Prereq chain

Requires 111323. Gates 111325.

## Instance surface

- Needed: destination trigger/transition owner + four coffer actors.
- Existing: none. Do NOT materialize route steps or objectives.
