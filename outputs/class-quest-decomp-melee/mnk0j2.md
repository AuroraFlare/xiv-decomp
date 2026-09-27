# Mnk0j2 — Insulted Intelligence (111222, Lv35) — implemented adapter

- Quest ID 111222 (VERIFIED `gamedata_quests.sql`). Prerequisite 111221.
- Base class 2, job 15, secondary 8/15, level 35. Offer NPC 1060033 (Erik),
  `offer = true` (VERIFIED template lines 302-332).
- Decomp: `job-gc-decomp-20260907/quests/mnk0j2.json` (luac sha pinned).
  Decomp events (VERIFIED `JOB_QUEST_DECOMP_EVENTS` line 1573):
  accept `processEventERIKStart`,
  complete `onJobQuestCompleteFirst` + `onJobQuestCompleteSecond`,
  completeAfter `onJobQuestCompleteThird`.

## Sequence flow

- SEQ_ACCEPT → 0: Erik `processEventERIKStart` (result must be 1) →
  `AcceptQuest` → start item 11000552 (Brand-new Aetheriometer) granted
  once (HasItem-guarded).
- 0 → 5: Erik talk launches the private battle (retry actor = Erik).
- 5: `QuestDirectorJobMnk0j2` — one Gluttonous Gertrude; director returns
  `successSequence = 6` (kill alone never completes).
- 6: journal objective 2 — use item 11000552. `job_quest_item_objectives.lua`
  consumes exactly the used slot, only at sequence 6, then starts
  sequence 10 + message "The aether measurements are complete."
- 10: Erik completion hooks → EXP 3360 (sqrwa presentation + AddExp),
  action 27107, then single `CompleteQuest`.

## Delegate events

`processEventERIKStart`, `onJobQuestCompleteFirst/Second/Third`
(all wired through `callDecompEvent`).

## ENPC/BNPC IDs

- 1060033 Erik (offer/battle/reward, VERIFIED).
- 2102010 / mob 3043 "Gluttonous Gertrude", uniqueId
  `mnk0j2_gluttonous_gertrude`, skill list 6014 (exact local profile,
  VERIFIED `server_battlenpc_mob_types.sql` row 3043).

## Markers

11221101 (battle). Journal: mnk0j2 `{[0]=0,[5]=0,[6]=0}` (Wil 541 covers
kill AND measurement).

## Counters/flags

Quest-data counters unused; instrument state is inventory + sequence.

## Rewards (script-owned, no central rows — VERIFIED)

- EXP 3360, action 27107 (job 15). Start item 11000552 consumed by the
  objective. No gil/marks rows.

## Prereq chain

Requires 111221. Gates 111223.

## Mob profiles + spawn evidence

- Profile 3043: exact (actor 2102010, skill list 6014, NM). VERIFIED row.
- Private shell spawns at the caller's validated position; ambient kills
  cannot satisfy the quest (`onKillBNpc` early-returns for private
  battles; director checks owner/area/sequence). Lower La Noscea source
  placement and retail phase/timing remain unverified.

## Instance surface

- Needed: private single-target kill + instrument measurement.
- Existing: full adapter (`QuestDirectorJobMnk0j2` + item-objective
  registry). No invented mechanics.
