# 110737 — A Slippery Stone (Etc3g3)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Chain role: Miounne 1000230 (spawn VERIFIED: `miounne` @ zone 155) offers;
  Lionnellais 1500055 (SEQ_000, no static row — variant pattern) →
  Hasthwab 1001064 (SEQ_001 turn-in, spawn VERIFIED @ zone 230).
  Gridania → Limsa ferry-pass leg (sibling of Etc3u3/Etc3l3).
- Airship pass: `AIRSHIP_PASS_ITEMID` 11000208 granted in `onStart`
  (HasItem-guarded) + 25117 obtain message. Item row VERIFIED present.

## Sequence flow (from `Data/scripts/quests/etc/etc3g3.lua`, VERIFIED)

- `SEQ_ACCEPT`: Miounne `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventMIOUNNEStart`; 1 → `AcceptQuest` → `onStart` → SEQ_000.
- `SEQ_000`: Lionnellais → `processEvent_005` → `StartSequence(SEQ_001)`
  (cannot refire after advance). Miounne re-talk → `processEvent_000`.
- `SEQ_001`: Hasthwab → `processEvent_010` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`. Lionnellais re-talk → `processEvent_005_01`.
- Journal: 1 iff SEQ_000. Markers 11080301 Lionnellais / 11080302 Hasthwab —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventMIOUNNEStart`, `processEvent_000`, `processEvent_005`,
  `processEvent_005_01`, `processEvent_010`, `sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8031121 x1 + 500 exp. Lua `sqrwa` exp matches SQL. (Pass is a travel
  key item, not a completion reward — by design.)

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED (real bug): `quest:getSequence()` → `quest:GetSequence()` in
  `getJournalMapMarkerList` (nil-function journal crash; same as Etc3u3/Etc3l3).
- Verified safe, no change: single `CompleteQuest`; `UpdateENPCs`/`EndEvent`
  on all paths; pass grant idempotent.

## Chain note (INFERRED fidelity gap, no change)

- SQL prereq of 110810 (Call of Booty) names ONLY 110737, while the Etc303
  Lua header claims Etc3l3/Etc3g3/Etc3u3 are all acceptable predecessors.
  If the engine reads the single `gamedata_quests.sql` prereq column, only
  this leg unlocks 110810. Retail intent (any-of-three) vs single-column
  encoding is unresolved — recorded, not altered (main-SQL change needs
  owner decision + migration parity).
