# 110735 — Scrubbing the Soul (Etc3g1)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3g1)`.
- Quest giver: Mestonnaux, native 1200141 / actor 1001103.
  Actor spawn VERIFIED (`mestonnaux` @ zone 206, `-211.76, 18.1, -1473.52`).
- Objective A (SEQ_000): speak with five Gridanians — Biddy 1100121/1000737,
  Tatagoi 1400114/1001080, Nuala 1100210/1000681, Nellaure 1300118/1000821,
  Alaire 1000831. Flags 0–4 + `COUNTER_TALKED` (target 5); message 51061,
  25225 at 5/5.
- Objective B (SEQ_002): talk to Yayatu 1001581 (no push actor anywhere in
  this script). Four-sequence chain: talks → report → Yayatu → return.
- NOTE (tag-vs-code mismatch): availability says `instance`, but the Lua has
  no 109xxxx objective, no `onPush` combat surface, no encounter handoff —
  the whole quest is dialogue. Either the tag is stale or a retail instanced
  leg is unrepresented. Recorded, not retagged (availability file untouched
  per instructions).

## Sequence flow (from `Data/scripts/quests/etc/etc3g1.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Mestonnaux variants `QFLAG_TALK`; delegate
  `processEventMestonnauxStart` (arg 0); 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: five talk branches with first-talk/`_2` re-talk pairs; Nuala
  has a third branch (`processEventNuala_3`) when the counter is already
  complete. `markTalked` sets flag + increments; >= 5 → 25225 → SEQ_001.
  Mestonnaux re-talk → `processEvent000_2` with the live counter arg.
- `SEQ_001`: Mestonnaux → `processEvent010` + `processEvent010_2` (counter
  arg) → `StartSequence(SEQ_002)`.
- `SEQ_002`: Mestonnaux re-talk → `processEvent015` reminder. Yayatu talk →
  `processEventYayatu` + 25225 → SEQ_003.
- `SEQ_003`: Mestonnaux → `processEvent020` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: sequence + talk counter. Markers: `{}` always — VERIFIED absence.
- `onStateChange` SEQ_001 clears Alaire and explicitly unflags Yayatu
  (`QFLAG_NONE, false`); SEQ_002 flags Yayatu `QFLAG_TALK`; SEQ_003 unflags.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventMestonnauxStart`, `processEvent000_2`, five first-talk +
  five `_2` re-talk (+ Nuala `_3`), `processEvent010`, `processEvent010_2`,
  `processEvent015`, `processEventYayatu`, `processEvent020`, `sqrwa` (500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

7500 gil + item 8071201 x1 + 500 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; per-NPC dual-ID `isX` helpers
  accept both native and actor variants; flag gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all paths.
- Biddy actor 1000737 static rows include a `PrivateAreaMasterPast` variant
  (`man0g1_echo_biddy`); the quest registers the class for open-world talk.
  Which spawn the engine resolves for the quest ENPC is engine behavior —
  recorded as an observation, not a bug (no evidence of misrouting).
