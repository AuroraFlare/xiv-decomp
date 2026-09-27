# Drg0j5 — Fatal Seduction (111325, Lv45) — implemented adapter

- Quest ID 111325 (VERIFIED). Prerequisite 111324. Base 8 / job 19 /
  secondary 2/15, level 45. Offer NPC 1002001 (Alberic), `offer = true`.
- Decomp: `job-gc-decomp-20260907/quests/drg0j5.json` (luac sha pinned).
  Decomp events (VERIFIED): accept `processEventALBERICStart`, complete
  First+Second, completeAfter Third.

## Sequence flow

- SEQ_ACCEPT → 0 → route step `processEvent000_ALBERICS` (marker
  11226401; the long Azure Dragoon briefing re-states the objective) →
  private battle → success sequence 10 → Alberic reward (11226401) →
  EXP 5340 (sqrwa + AddExp), action 27277 → single `CompleteQuest`.

## ENPC/BNPC IDs

- 1002001 Alberic (VERIFIED).
- 2102219 / mob 32729 "Stollenwurm" (display 3102224), uniqueId
  `drg0j5_stollenwurm`, Drake skill family (list 5020), Lancer job 8
  (VERIFIED director + `drg0j5_stollenwurm.sql` migration). 32729 is an
  explicitly migration-owned adapter ID, NOT a recovered retail BNPC
  number; main-SQL parity row added by Phase 3.

## Markers

11226401 (battle + reward). "South of Camp Riversmeet, western Coerthas"
is journal geography; the open-world trigger/placement is unresolved.

## Rewards (script-owned, no central rows — VERIFIED)

- EXP 5340, action 27277. No gil/marks rows.

## Prereq chain

Requires 111324. Gates 111326.

## Instance surface

- Needed: open-world Stollenwurm kill (8-person recommendation).
- Existing: private adapter (cap 8). Original trigger/placement and
  archive balance need live verification (labeled).
