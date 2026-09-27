# 110726 — Quid Pro Quo (Etc3u1)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3u1)`.
- Quest giver: Peneli Zuneli, native 1400119 / actor 1001421.
  Actor spawn VERIFIED (`peneli_zuneli` @ zone 209, `28.78, 206, 335.11`).
- Objective A (SEQ_000): gather five responses — Kukusi 1001463, Neymumu
  1001419, Rorojaru 1000374, Singleton 1001445, Abylgo Hamylgo 1000965.
  Flags 0–4 + `COUNTER_TALKED` (target 5); message 51062, 25225 at 5/5.
- Objective B (SEQ_002): push-interact `FINAL_OBJECTIVE` 1090224
  (`etc3u1_airship_wreck_objective` @ zone 170,
  `-153.270, 185.480, -210.150`) — VERIFIED static row.
- Four-sequence chain: SEQ_000 talks → SEQ_001 report → SEQ_002 final
  objective → SEQ_003 return. No kill counter, no objective item.

## Sequence flow (from `Data/scripts/quests/etc/etc3u1.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Peneli variants `QFLAG_TALK`; delegate
  `processEventPeneliZuneliStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: recipients via shared `handleRecipient` helper (first-talk
  delegate + `markTalked`; re-talk `..._2` variant, no state change).
  Counter >= 5 → 25225 → SEQ_001. Peneli re-talk → `processEvent000`.
- `SEQ_001`: Peneli → `processEvent010` + `processEvent010_2` →
  `StartSequence(SEQ_002)` (talk-driven, unconditional once in SEQ_001).
- `SEQ_002`: Peneli re-talk → `processEvent015_2` reminder. `onPush` on
  1090224 → `processEvent020` (forced `true` arg) + 25225 → SEQ_003.
  Pushes in other sequences end the event silently.
- `SEQ_003`: Peneli → `processEvent025` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: sequence + talk counter. `getJournalMapMarkerList` returns `{}`
  (no markers authored for any sequence) — VERIFIED absence in code.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventPeneliZuneliStart`, `processEvent000`, five `processEvent005_*`
  + five `..._2`, `processEvent010`, `processEvent010_2`, `processEvent015_2`,
  `processEvent020`, `processEvent025`, `sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

7500 gil + item 8010703 x1 + 500 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; per-recipient flag gating
  (no double count); single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all
  talk/push paths; push gated on SEQ_002 + actor class.
- `markTalked` advances on counter >= 5 without re-checking all flags; flags
  are set atomically with the increment on the same path, so counter/flag
  skew is not reachable in this code — recorded as reviewed, no change.

## Instance-surface need (UNRECOVERED — do NOT stub)

- The talk chain (SEQ_000–001) is fully implemented server-side; the
  `instance` tag attaches to the SEQ_002 final objective (airship wreck).
- What exists: static push objective with world XYZ, full 4-sequence Lua,
  giver spawn, reward rows.
- What is missing: whatever instanced/cutscene content the wreck interaction
  fronts — no encounter script or scene surface recovered. Live-client
  acceptance open.
