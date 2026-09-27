# 110641 — Food for Thought (Etc1l8)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 20, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Quest giver: Dympna 1000331.
  Spawn VERIFIED (`dympna` @ zone 230, `-492.38, 39.9, 362.82`).
- Objective: spread the rumor to 5 targets — Aergwynt 1000347, Ferdillaix
  1000344, Buburoon 1000219, Rbaharra 1000340, Fufuna 1000345 — by performing
  /psych in front of each. Talk-target spawns VERIFIED (all five static rows:
  aergwynt/ferdillaix/buburoon/rbaharra/fufuna).
- Mechanic: `onTalk` with targets plays only Speak/After dialogue (no
  progress); progress fires in `onEmote` for `emoteDefault1` (Psych), which
  plays `DoEmote(npc.Id, 30, 21291)`, waits 2.5s, then runs the per-target
  `processEvent*` + flag + counter. Flags 0–4 + `COUNTER_TALKED`;
  message 51059 (x of 5), 25225 at 5/5.
- Targets registered with emote-enabled ENPC flags
  (`QFLAG_TALK, true, false, true` in `onStateChange`) — VERIFIED in code.

## Sequence flow (from `Data/scripts/quests/etc/etc1l8.lua`, VERIFIED)

- `SEQ_ACCEPT`: Dympna `QFLAG_TALK`. `HasQuest` offer gate → delegate
  `processEventOffersStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Dympna re-talk → `processEventOffersAfter`. Emote Psych on an
  unflagged target → its `processEvent*` + flag + `IncCounter`; on flagged
  targets nothing fires (no double count). Wrong emotes play the emote with
  no quest effect. All-flags → 25225 + `UpdateENPCs` band-aid + SEQ_001.
- `SEQ_001`: Dympna → `processEventClear` + `sqrwa(1120, 1, 1, 9)` →
  single `CompleteQuest`.
- Markers 11064101–11064106, completed targets hidden — INFERRED coordinates.
  No `getJournalInformation`.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventOffersStart/After`, five `processEvent*Speak` + five
  `...After` (talk-only), five emote `processEvent*`, `processEventClear`,
  `sqrwa` (exp 1120).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

10000 gil + item 8080224 x1 + 1120 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: two `npc.GetActorClassId()` dot-calls (onTalk + onEmote) → colon form.
- FIXED: `quest.GetQuestId()` dot-call → colon form.
- Verified safe, no change: emote-name gate (`emoteDefault1` only);
  flag-gated progress; single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all
  talk and emote paths.
