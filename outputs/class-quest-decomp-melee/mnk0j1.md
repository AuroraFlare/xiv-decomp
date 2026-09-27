# Mnk0j1 — Brother from Another Mother (111221, Lv30) — HOLD

- Quest ID 111221 (VERIFIED `gamedata_quests.sql`).
- Base class 2 (PGL), job 15 (MNK), secondary class 8 at 15, level 30.
- Offer NPC 1000862 (Gagaruna). No `offer = true` → hidden; availability
  entry commented "Partially implemented - instance" (VERIFIED
  `quest_availability.lua:258`, `job_quest_template.lua:249-296`).
- Decomp: `job-gc-decomp-20260907/quests/mnk0j1.json` (luac sha pinned
  there). Decomp events (VERIFIED `JOB_QUEST_DECOMP_EVENTS`): accept
  `processEventGAGARUNAStart`, contentComplete `processEvent010` +
  `processEvent010_2_system(3020410)` + `processEvent010_3_system`.
  The template route's Erik `processEvent005` entry step is
  walkthrough-recovered.

## Sequence flow (template route states)

- SEQ_ACCEPT → 0: Gagaruna offer (offer path exists but is ungated-off).
- 0: route step — actor 1060033 (Erik), event `processEvent005`,
  marker 11221001 (VERIFIED).
- 5: battle boundary, marker 11221002, `maxPartySize = 4` (total, owner
  included). No `targets` table → `startGameplayBoundary` hard-stops;
  neither talk spam nor an ambient kill can advance (VERIFIED template
  logic).
- Documented aftermath: `processEvent010` / scene `mnk0j110`, then
  `processEvent010_2_system` (item) + `processEvent010_3_system` (action);
  completion automatic with no public reward NPC (walkthrough-recovered,
  INFERRED until the destination trigger owner is found).

## Delegate events

`processEvent005` (Erik entry), `processEvent010`, `mnk0j110`,
`processEvent010_2_system`, `processEvent010_3_system` (all documented,
none wired to a live owner).

## ENPC/BNPC IDs

- 1000862 Gagaruna (offer, VERIFIED actor table).
- 1060033 Erik (route, VERIFIED).
- Documented-only enemy: actor 2202611 / display 3202612 "Runagate Imp",
  count 3, documented level 35 (walkthrough count/level; no
  Runagate-specific server profile — VERIFIED template comment).
  Family analogue Firestarter Imp 1298 / list 5034 is evidence only and
  must not be substituted (VERIFIED).

## Markers

11221001 (Erik route), 11221002 (battle, no actor/Y/rotation — VERIFIED
gap). Journal map: `job_quest_journal.lua` mnk0j1 `{[0]=0,[5]=1}`
(Wil 537, 538; 539 is a next-quest notice).

## Counters/flags / journal hooks

No live counters. Journal hook rows as above; no decomp accept/complete
hooks registered.

## Rewards (script-owned, no central rows — VERIFIED `gamedata_quest_rewards.sql` has no 111221)

- EXP 2661, action 27108 (job 15), key item 2000202 x1, item 3020410 x1.
- No gil/marks rows: nothing to double-pay against.

## Prereq chain

Root of the Monk chain (no prerequisite). Gates Mnk0j2 (111222).

## Mob profiles + spawn evidence

- No exact Runagate Imp profile/skills (VERIFIED gap).
- Documented location (walkthrough, INFERRED placement): zone 144 /
  mapRegion 104 / mapArea 402, x 1283.359985, z -155.490005, "west of
  Mythril Pit T-8, south of Camp Drybone". NOTE: server zone 144 is
  Coerthas Eastern Highlands while mapRegion 104 is Thanalan — the
  zone/witness pairing is inconsistent, so treat the zone assignment as
  UNVERIFIED; no spawn is placed from it.

## Instance surface

- Needed: destination-triggered combat at the Mythril Pit marker with
  automatic post-combat completion (retail), plus
  `QuestDirectorMnk0j101`-equivalent lifecycle (empty client director
  exposes no waves/entry/aftermath owner).
- Existing: none. Do NOT invent the fight; the marker-only battle row
  stays a hard stop.
