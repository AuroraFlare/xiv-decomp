# Mnk0j4 — Good Vibrations (111224, Lv45) — HOLD

- Quest ID 111224 (VERIFIED). Prerequisite 111223. Base 2 / job 15 /
  secondary 8/15, level 45. Offer NPC 1060033 (Erik); hidden.
- Decomp: `job-gc-decomp-20260907/quests/mnk0j4.json` (luac sha pinned).
  Decomp events (VERIFIED line 1575): accept `processEventERIKStart`,
  complete First+Second, completeAfter Third.

## Sequence flow

- Start item 11000555 (Experimental Aetheriometer) grant design (inert).
- 5: battle boundary, marker 11221401?? No — 11221301 (VERIFIED),
  8-party cap. Documented target only → hard stop.

## Delegate events

`processEventERIKStart`, completion First/Second/Third (registered but
unreachable while HOLD).

## ENPC/BNPC IDs

- 1060033 Erik (VERIFIED).
- Documented: actor 2100723 / display 3100721 "Apep", level 53 x1;
  quest-specific `BasiliskLesserMnk0j4` actor has no mob profile, stats,
  skills, loot, Y/rotation or spawn owner (VERIFIED gap). Generic
  basilisk 2100709 / list 5006 is family evidence only, not a substitute.

## Markers

11221301 (x -1670.089966, z -1212.099976, zone 172 / mapRegion 104 /
mapArea 403 — VERIFIED template values). Navmesh 2026-09-27: 21 recorded
points within 30 yalms, nearest node 3926 at 5.33 yalms
(`Data/quicknavmesh/zone_172.tsv:3931`); center height unresolved, no
existing mob in selection. Ground is walkable-adjacent but NO spawn is
placed and the retail trigger owner is unknown. Journal: `{[0]=0,[5]=0}`
(Wil 549; 550 is a next-quest notice).

## Rewards (design, inert)

- EXP 5340, action 27118 (Dragon Kick). Widargelt link-shell event 93
  (documented). No central rows (VERIFIED).

## Prereq chain

Requires 111223. Gates 111225.

## Instance surface

- Needed: 8-person Apep objective + instrument-shatter objective +
  Dragon Kick/link-shell handoff.
- Existing: none. Do NOT invent the fight or substitute a generic
  basilisk profile.
