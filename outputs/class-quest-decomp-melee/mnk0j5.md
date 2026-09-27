# Mnk0j5 — Five Easy Pieces (111225, Lv45) — HOLD

- Quest ID 111225 (VERIFIED). Prerequisite 111224. Base 2 / job 15 /
  secondary 8/15, level 45. Owner NPC 1060032 (Widargelt); hidden.
- Decomp: `job-gc-decomp-20260907/quests/mnk0j5.json` (luac sha pinned).
  Decomp events (VERIFIED line 1576): accept `processEvent_WIDARGELT_Start`
  (registered but unreachable while HOLD).

## Sequence flow

- `interactions` block (markers 11221401-04, event
  `processEvent_getAF_info`) carries NO `objectives` table → template
  stays at the sequence-6 hard stop by design (VERIFIED logic).

## ENPC/BNPC IDs

- 1060032 Widargelt (VERIFIED). Four quest-owned coffer actors: absent
  (no actor classes, no unique IDs — VERIFIED gap).

## Markers / documented destinations (X/Z walkthrough-recovered, INFERRED bindings)

- 11221401 Dzemael Darkhold (102/201, -74.51/392.07)
- 11221402 U'Ghamaro Mines (101/104, 96.96/-2692.71)
- 11221403 Turning Leaf (103/304, -1528.00/280.01)
- 11221404 Cape Deadwind (104/401, 118.06/542.62)
- Documented items: 8071402, 8051402, 8013502, 8081802 (Temple
  Gloves/Gaskins/Circlet/Boots — set exact, marker↔item binding NOT
  recovered; list order must not be treated as binding). Journal:
  `{[0]=0,[6]=0}` (Wil 552: independent AF collection).

## Rewards (design, inert)

- EXP 5340. No central rows (VERIFIED).

## Prereq chain

Requires 111224. Gates 111226.

## Instance surface

- Needed: four coffer actors with Y/rotation/push owners + item bindings.
- Existing: none. Do NOT materialize an objectives table from list order.
