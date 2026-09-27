# Mnk0j3 — The Pursuit of Power (111223, Lv40) — HOLD

- Quest ID 111223 (VERIFIED). Prerequisite 111222. Base 2 / job 15 /
  secondary 8/15, level 40. Offer NPC 1060033 (Erik); hidden (no `offer`).
- `completionOwner = "interaction"` (kill alone must not complete).
- Decomp: `job-gc-decomp-20260907/quests/mnk0j3.json` (luac sha pinned).
  Decomp events (VERIFIED line 1574): accept `processEventStart`,
  interactionComplete `processEventClear` + `processEventAfget`.

## Sequence flow

- 0: route step — actor 1060032 (Widargelt), event
  `processEventStartAfter`, marker 11221201 (VERIFIED).
- 5: battle boundary, marker 11221202, 4-party cap. Documented target only
  (no `targets` table) → hard stop.
- Documented post-battle (INFERRED wiring): sequence 6, marker 11221203,
  item 11000553 (Outdated Aetheriometer), event `processEventPoint`;
  then `processEventClear` / `mnk0j310` / `processEventAfget`.

## Delegate events

`processEventStartAfter`, `processEventPoint`, `processEventClear`,
`processEventAfget` (documented; interaction owner unresolved).

## ENPC/BNPC IDs

- 1060033 Erik, 1060032 Widargelt (VERIFIED actor table).
- Documented enemy: 2100610 / mob 3081 / skill 6026 "Prince of
  Pestilence" x1 (exact fight identity, VERIFIED template comment).

## Markers

11221201 (Widargelt), 11221202 (battle), 11221203 (post-kill measurement:
X/Z only, ambiguous display 4000257, no actor class/Y/rotation/push
owner — VERIFIED gap). Journal: `{[0]=0,[5]=1,[6]=2}` (Wil 544-546).

## Rewards (script-owned design, inert while HOLD)

- EXP 4260, action 27109. Start item 11000553. No central rows (VERIFIED).

## Prereq chain

Requires 111222. Gates 111224.

## Mob profiles + spawn evidence

- Prince of Pestilence identity exact; post-kill measurement point has no
  exact interaction actor/transform, so a kill-only adapter would skip a
  required objective (VERIFIED `todo`). No spawn placed.

## Instance surface

- Needed: boss fight + location-bound item-use objective at 11221203 +
  `mnk0j310` lifecycle.
- Existing: none. Do NOT invent the fight or the interaction actor.
