# 110814 — Waking the Spirit (Etc104)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 18, no prereq.
- Availability: commented out,
  `Partially implemented - dialogue/delivery/interaction (Etc104)`.
- Materia-introduction chain (4 of 4).
- Principal: Fhobhas 1001730 (spawn VERIFIED: `fhobhas` @ zone 170,
  `258.654, 248, -1021.61`). Single SEQ_000, single NPC.
- Class gate (VERIFIED): `isEligibleCrafter` — true level ≥ 18 AND class
  29–35 (Disciples of the Hand; Culinarian exclusion is by class-ID range
  per the header — the range check itself is VERIFIED in code, the
  exclusion mapping is header-claim/INFERRED against class tables).
- Objective: "Meld materia to gear using the Materia Melder." The meld has
  NO verification — SEQ_000 talk completes unconditionally. Concrete partial
  reason (same standing as Etc102/Etc103; do NOT invent a meld check).
- Key item: `ITEM_MATERIA_MELDER` 2001002, granted on accept and SEQ_000
  talk (HasItem-guarded) + 25117 message. Item row VERIFIED.

## Sequence flow (from `Data/scripts/quests/etc/etc104.lua`, VERIFIED)

- `SEQ_ACCEPT` (eligible only): eventName branch `processEventHobhasYet` vs
  `processEventHobhasStart` (arg 0) → 1 AND `AcceptQuest` → grant key item +
  `UpdateENPCs` → `EndEvent`.
- `SEQ_000` (eligible): re-grant key item → `processEvent_000` →
  `processEvent_005` → `sqrwa(780, ...)` → single `CompleteQuest` + manual
  `AddExp(780)`.
- Journal: `0, 0`. Markers: `MRKR_FHOBHAS` unconditionally.

## Rewards — MIXED SQL + MANUAL (verified, see open question)

- SQL: exactly ONE row — `(110814, Item 2001002 x1)` — VERIFIED. No SQL Exp
  row, so manual `AddExp(780)` is the sole exp path (no double).
- OPEN QUESTION (same as Etc102, INFERRED, no change): manual key-item
  grants + SQL auto-grant on completion may double-deliver the melder absent
  engine dedupe. Manual grants are load-bearing (needed during the quest).
  Recorded for engine-owner review.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; eligibility gates on both
  paths; single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths;
  key-item grants idempotent.
