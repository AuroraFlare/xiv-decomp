# 110746 — What a Pirate Wants (Etc3l3)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Chain role: Baderon 1000137 (spawn VERIFIED: `baderon` @ zone 133) offers;
  Tefh Moshroca 1000131 (SEQ_000) → Hasthwab 1001064 (SEQ_001 turn-in).
  Limsa → Ul'dah rum leg (sibling of Etc3u3/Etc3g3).
- Rum: `RUM_ITEMID` 11000207 is announced with a 25117 obtain message on the
  SEQ_000→SEQ_001 advance, but NO `AddItem` call exists anywhere in the
  script (contrast Etc3u3/Etc3g3, which `AddItem` their passes). Item row
  11000207 VERIFIED present in `gamedata_items.sql`.
  Standing: message-only "obtain" — recorded as an OBSERVED discrepancy, not
  changed (retail may genuinely message without granting, or the grant may be
  missing; no decomp evidence either way — INFERRED-open).

## Sequence flow (from `Data/scripts/quests/etc/etc3l3.lua`, VERIFIED)

- `SEQ_ACCEPT`: Baderon `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventBADERONStart`; 1 → `AcceptQuest` → SEQ_000. (No onStart item
  grant — the rum message fires only at the SEQ_001 advance.)
- `SEQ_000`: Tefh Moshroca → `processEvent_005` + rum message →
  `StartSequence(SEQ_001)` (cannot refire). Baderon re-talk →
  `processEvent_000`.
- `SEQ_001`: Hasthwab → `processEvent_010` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`. Moshroca re-talk → `processEvent_005_01`.
- Journal: 1 iff SEQ_001 (note: inverted vs siblings, which report SEQ_000).
  Markers 11070301 Moshroca / 11070302 Hasthwab — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventBADERONStart`, `processEvent_000`, `processEvent_005`,
  `processEvent_005_01`, `processEvent_010`, `sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8031121 x1 + 500 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED (real bug): `quest:getSequence()` → `quest:GetSequence()` in
  `getJournalMapMarkerList` (nil-function journal crash; same as
  Etc3u3/Etc3g3).
- Verified safe, no change: single `CompleteQuest`; `UpdateENPCs`/`EndEvent`
  on all paths.
