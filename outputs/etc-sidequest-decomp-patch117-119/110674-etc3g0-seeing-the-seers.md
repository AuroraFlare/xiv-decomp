# 110674 — Seeing the Seers (Etc3g0)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 5, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Quest giver: Kinnison 1001430.
  Spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `kinnison` @ zone 206, `-194, 23, -1610`).
- Objective: talk to 5 seers — Sybell 1001437, Khuma Moshroca 1001081,
  Nellaure 1000821, Mestonnaux 1001103, Lefwyne 1001396.
  Talk-target spawn check: all five actor IDs return static rows — VERIFIED.
- Flags 0–4 + `COUNTER_TALKED`; message 51061 per talk (x of 5),
  25225 at 5/5. Same engine pattern as Etc3l0/Etc3u0.

## Sequence flow (from `Data/scripts/quests/etc/etc3g0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Kinnison `QFLAG_TALK`. Offer uses `HasQuest` gate → delegate
  `processEventOffersStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: per-seer first-talk delegates (`...Speak`) set flag +
  `IncCounter`; re-talk plays `...SpeakAfter` with no state change. Kinnison
  re-talk → `processEventOffersAfter`. All-flags → 25225 + `UpdateENPCs`
  band-aid + `StartSequence(SEQ_001)`.
- `SEQ_001`: Kinnison → `processEventClear` + `sqrwa(200, 1, 1, 9)` →
  single `CompleteQuest`.
- Markers 11080001–11080006 (Kinnison + 5 seers), completed seers hidden —
  coordinates INFERRED. No `getJournalInformation` (counter via messages).

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventOffersStart/After`, five `processEvent*Speak` +
  five `processEvent*SpeakAfter`, `processEventClear`, `sqrwa` (exp 200).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8070807 x1 + 200 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: removed duplicated `local data = quest:GetData();` in
  `getJournalMapMarkerList` (harmless shadowing, tidied while in the function).
- Verified safe, no change: flag-gated first-talk; `seq000_checkCondition`
  requires all five flags (counter alone cannot advance); single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths.
- `HasQuest` offer gate retained (family pattern; see 110653 note).
