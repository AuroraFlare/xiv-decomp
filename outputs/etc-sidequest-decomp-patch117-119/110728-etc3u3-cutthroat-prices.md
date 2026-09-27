# 110728 — Cutthroat Prices (Etc3u3)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Chain role: Momodi 1000841 (spawn VERIFIED: `momodi` @ zone 175) offers;
  Stangyth 1500208 (SEQ_000) → Hasthwab 1001064 (SEQ_001 turn-in, spawn
  VERIFIED: `hasthwab` @ zone 230, `-778.32, 16.35, 383.49`).
  Stangyth 1500208 has no static row (variant pattern — VERIFIED absence).
- Airship pass: `AIRSHIP_PASS_ITEMID` 11000209 granted in `onStart`
  (HasItem-guarded) + 25117 obtain message. Item row VERIFIED present.
  Two-sequence ferry-pass chain (Ul'dah → Limsa leg).

## Sequence flow (from `Data/scripts/quests/etc/etc3u3.lua`, VERIFIED)

- `SEQ_ACCEPT`: Momodi `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventMIOUNNEStart` (retail copy/paste naming — comment in code
  calls it out; preserved verbatim); 1 → `AcceptQuest` → `onStart`
  (pass grant + message) → SEQ_000.
- `SEQ_000`: Stangyth → `processEvent_005` → `StartSequence(SEQ_001)`
  (talk-driven, unconditional in SEQ_000 — cannot refire after advance).
  Momodi re-talk → `processEvent_000`.
- `SEQ_001`: Hasthwab → `processEvent_010` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`. Stangyth re-talk → `processEvent_005_01`.
- Journal: 1 iff SEQ_000. Markers 11090301 Stangyth / 11090302 Hasthwab —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventMIOUNNEStart`, `processEvent_000`, `processEvent_005`,
  `processEvent_005_01`, `processEvent_010`, `sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8031121 x1 + 500 exp. Lua `sqrwa` exp matches SQL. (Airship pass is a
  travel key item granted in-script, not a completion reward — by design.)

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED (real bug): `quest:getSequence()` → `quest:GetSequence()` in
  `getJournalMapMarkerList`. Lua is case-sensitive; the lowercase call
  addresses a nil function and would error whenever the client requests
  journal markers for this quest. Same fix applied to Etc3g3/Etc3l3.
- Verified safe, no change: single `CompleteQuest`; `UpdateENPCs`/`EndEvent`
  on all paths; pass grant idempotent.
