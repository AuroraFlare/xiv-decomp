# 110810 — Call of Booty (Etc303)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 15, prereq 110737.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Chain role: Hasthwab 1001064 (spawn VERIFIED @ zone 230) offers; F'ongho
  1000367 (spawn VERIFIED: `fongho` @ zone 128, `288.24, 26.485, 342.12`)
  completes. Single-sequence (SEQ_000 only) capstone to the three ferry-pass
  legs.
- Prereq note: SQL names ONLY 110737 (Etc3g3); the Lua header claims
  "Etc3l3, Etc3g3, or Etc3u3 completed". See 110737 chain note — the same
  INFERRED fidelity gap applies here from the consumer side. Recorded, not
  altered.

## Sequence flow (from `Data/scripts/quests/etc/etc303.lua`, VERIFIED)

- `SEQ_ACCEPT`: Hasthwab `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventHASTHWABStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: F'ongho → `processEvent_005` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`. Hasthwab re-talk → `processEvent_000` reminder.
- No `getJournalInformation`. `getJournalMapMarkerList` returns
  `MRKR_FONGHO` (11213201) unconditionally — VERIFIED in code (single-marker
  quest; coordinates INFERRED).

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventHASTHWABStart`, `processEvent_000`, `processEvent_005`,
`sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8051118 x1 + 500 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- Verified safe, no change: single `CompleteQuest`; `UpdateENPCs`/`EndEvent`
  on all paths. No counters, items, or pushes — no overkill/over-push surface.
