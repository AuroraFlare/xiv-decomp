# 110812 — Forging the Spirit (Etc102)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 18, no prereq.
- Availability: commented out,
  `Partially implemented - dialogue/delivery/interaction (Etc102)`.
- Materia-introduction chain (2 of 4).
- Principal: Swynbroes 1001728 (spawn VERIFIED: `swynbroes` @ zone 170,
  `242.69, 247.512, -1024.59`). Single SEQ_000, single NPC.
- Objective: "Convert gear into materia using the Materia Assimilator."
  The conversion itself has NO verification in code — talking to Swynbroes
  in SEQ_000 completes the quest unconditionally. This unverified step is
  the concrete partial reason (INFERRED from code absence; do NOT invent a
  materia-system check).
- Key item: `ITEM_MATERIA_ASSIMILATOR` 2001001, granted on accept and on
  SEQ_000 talk (both HasItem-guarded) + 25117 message. Item row VERIFIED.

## Sequence flow (from `Data/scripts/quests/etc/etc102.lua`, VERIFIED)

- `SEQ_ACCEPT`: `QGRAPHIC_IMPORTANT`. `seq == SEQ_ACCEPT` gate with an
  eventName branch: `processEventSwynbroesStartYet` (deferral dialogue, no
  accept) vs `processEventSwynbroesStart` → 1 AND `AcceptQuest` → grant key
  item + `UpdateENPCs` → `EndEvent`.
- `SEQ_000`: re-grant key item (recovery) → `processEvent_000` →
  `processEvent_005` (arg 1) → `sqrwa(780, ...)` → single `CompleteQuest` +
  manual `AddExp(780)`.
- Journal: `0, 0`. Markers: `MRKR_SWYNBROES` unconditionally.

## Rewards — MIXED SQL + MANUAL (verified, see open question)

- SQL: exactly ONE row — `(110812, Item 2001001 x1)` — VERIFIED. No SQL Exp
  row, so the manual `AddExp(780)` is the sole exp path (no double).
- OPEN QUESTION (INFERRED, no change made): the manual `grantKeyItem`
  (accept + SEQ_000 talk) PLUS the SQL row (auto-granted on `CompleteQuest`)
  may deliver the assimilator twice if the engine does not dedupe key-item
  grants. The manual grants are load-bearing (the player needs the item
  DURING the quest, before completion), so neither side can simply be
  deleted without engine evidence. Recorded for engine-owner review; quest
  left disabled.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; `seq == SEQ_ACCEPT` gate;
  single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths; key-item
  grants idempotent.
