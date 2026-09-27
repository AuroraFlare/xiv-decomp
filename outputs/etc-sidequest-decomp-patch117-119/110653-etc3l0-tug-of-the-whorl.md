# 110653 — The Tug of the Whorl (Etc3l0)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 5, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Quest giver: Ginnade 1000050-class `GINNADE = 1000132`.
  Spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `ginnade` @ zone 230, `-623.45, 43, -56.92`).
- Objective: talk to 5 informants — Zonggo 1000057, Whahtoa 1000475,
  Ferdillaix 1000344, Frailoise 1000065, Arnegis 1000227.
  Talk-target spawn check: all five actor IDs return static rows — VERIFIED
  (same table; Ferdillaix row shared with Etc1l8 target).
- Flags 0–4 + `COUNTER_TALKED`; message 51060 per talk (x of 5),
  25225 Objectives complete at 5/5.

## Sequence flow (from `Data/scripts/quests/etc/etc3l0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Ginnade `QFLAG_TALK`. Offer branch uses
  `not player:HasQuest(quest)` gate (not `seq == SEQ_ACCEPT`) → delegate
  `processEventGinnadeStart`; 1 → `AcceptQuest` → `onStart` → SEQ_000.
- `SEQ_000`: per-target first-talk delegates (`processEvent010` … `050`)
  set flag + `IncCounter`; re-talk plays `followEvent010` … `050` with no
  state change. Ginnade re-talk → `followEvent005` reminder.
  At all-flags (`seq000_checkCondition`) → 25225 + `UpdateENPCs` band-aid +
  `StartSequence(SEQ_001)`.
- `SEQ_001`: Ginnade → `processEvent060` + `sqrwa(200, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: no `getJournalInformation` (counter shown via attention messages
  only). Markers 11070001–11070006 hide completed souls; 11070006 Ginnade in
  SEQ_001 — marker coordinates INFERRED.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventGinnadeStart`, `followEvent005`, `processEvent010/020/030/040/050`,
`followEvent010/020/030/040/050`, `processEvent060`, `sqrwa` (exp 200).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8011515 x1 + 200 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → `npc:GetActorClassId()`
  (MoonSharp instance-method convention; cf. prior Wld-phase fix).
- FIXED: `quest.GetQuestId()` dot-call → `quest:GetQuestId()` in the
  objectives-complete attention message.
- Verified safe, no change: flag-gated first-talk (no double count);
  counter only increments on fresh talks; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all paths including the pre-completion
  `UpdateENPCs` band-aid before `StartSequence(SEQ_001)`.
- Offer gate uses `HasQuest` rather than `seq == SEQ_ACCEPT` (matches Etc3g0/
  Etc3u0 family pattern). Left as-is: post-complete re-offer is governed by
  engine availability/completion guards, and converting risks breaking
  abandon/re-accept flows without evidence of a live bug.
