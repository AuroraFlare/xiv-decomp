# 110813 — Joining the Spirit (Etc103)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 18, no prereq.
- Availability: commented out,
  `Partially implemented - dialogue/delivery/interaction (Etc103)`.
- Materia-introduction chain (3 of 4).
- Principal: Kokosamu 1001729 (spawn VERIFIED: `kokosamu` @ zone 170,
  `255.596, 248.7, -1030.06`). Single NPC, two sequences.
- Class gate (IN(script) VERIFIED): `isDiscipleOfTheLand` — true level ≥ 18
  AND class 39–42. `onStateChange` early-returns for ineligible players (no
  ENPC flags set); `onTalk` ends the event immediately for ineligible or
  non-Kokosamu actors. A non-gatherer holding the quest sees no markers —
  authored edge, recorded.
- Objective: "Learn Fingerprints of the Gods and gather a catalyst."
  Accept grants ability `ACTION_FINGERPRINTS_OF_THE_GODS` 29742 via
  `EquipAbilityInFirstOpenSlot`. The catalyst-gathering step has NO
  verification — ANY talk to Kokosamu in SEQ_000 advances to SEQ_001
  unconditionally (`processEvent_000` + 25225). This unverified step is the
  concrete partial reason (INFERRED from code absence; do NOT invent a
  gathering check).
- Two sequences: SEQ_000 (catalyst area marker 11211202) → SEQ_001 (return,
  marker 11211201).

## Sequence flow (from `Data/scripts/quests/etc/etc103.lua`, VERIFIED)

- `SEQ_ACCEPT` (eligible only): eventName branch `processEventKokosamuYet`
  vs `processEventKokosamuStart` → 1 AND `AcceptQuest` → equip ability +
  `UpdateENPCs` → `EndEvent`.
- `SEQ_000` (eligible): `processEvent_000` + 25225 → `StartSequence(SEQ_001)`.
- `SEQ_001` (eligible): `processEvent_005` + `sqrwa(780, ...)` → single
  `CompleteQuest` + manual `AddExp(780)`.
- Journal: `0, 0`.

## Rewards — MANUAL-ONLY (no SQL rows; VERIFIED absence)

- `gamedata_quest_rewards.sql` has ZERO rows for 110813 — VERIFIED.
- Manual `AddExp(780)` is the sole exp path; `sqrwa(780)` display-only.
  Consistent — no change.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; eligibility gates on both
  state-change and talk paths; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all paths.
