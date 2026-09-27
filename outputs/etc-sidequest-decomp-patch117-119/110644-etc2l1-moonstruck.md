# 110644 — Moonstruck (Etc2l1)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 20, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc2l1)`.
- Quest giver: I'nairoh, native 1900133 / actor 1001307.
  Actor spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `Q_inairoh` @ zone 130, `599.452, 55, -1214.03`).
  Native 1900133 has no static spawn row (expected for native/cutscene
  variant; Lua `isINairoh` accepts both) — VERIFIED by absence query.
- Objective: push-interact `BEAST_OBJECTIVE` 1090221
  (`etc2l1_moonstruck_objective` @ zone 130, `767.000, 54.600, -1088.000`)
  — VERIFIED static row. "Clear the path toward Bloodshore."
- No kill counter, no objective item. No BNPC involvement in code.

## Sequence flow (from `Data/scripts/quests/etc/etc2l1.lua`, VERIFIED)

- `SEQ_ACCEPT` (offer): `onStateChange` sets both I'nairoh variants
  `QFLAG_TALK`. `onTalk` I'nairoh → delegate `processEventI_NairohStart`;
  return 1 → `player:AcceptQuest(quest)` → engine `OnAccept` → `onStart`
  → `StartSequence(SEQ_000)`. `EndEvent` + early return on every accept path.
- `SEQ_000` (clear path): I'nairoh re-talk → `followEvent005` reminder.
  `onPush` on 1090221 (and only in SEQ_000) → 25225 Objectives complete →
  `StartSequence(SEQ_001)` + `UpdateENPCs` + `EndEvent`. Wrong-seq/wrong-actor
  pushes end the event with no state change.
- `SEQ_001` (turn-in): I'nairoh → `processEvent010` + `sqrwa(1280, 1, 1, 9)`
  → `player:CompleteQuest(quest)` (single callsite).
- Journal: `getJournalInformation` returns 1 iff SEQ_001.
  Markers `MRKR_BEAST_AREA` (11064401) in SEQ_000,
  `MRKR_I_NAIROH` (11064402) in SEQ_001.
  Marker coordinates are authored (no DAT marker rows recovered) — INFERRED.

## Delegates (VERIFIED as literal callsites; DAT-side scene IDs unverified)

`processEventI_NairohStart` (accept), `followEvent005` (progress),
`processEvent010` (turn-in), `sqrwa` (reward screen, exp 1280).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8030920 x1 + 1280 exp. Lua `sqrwa` exp (1280) matches SQL exp.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form `npc:GetActorClassId()` throughout;
  single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on every talk/push path;
  push gated on exact sequence + actor class; abandon/re-accept resets via
  engine `OnAccept`/`OnAbandon`; reward single-claim via engine
  `CompleteQuest` + `ShouldGrantCompletionRewards` repeat guard.
- No overkill-style counter exists (single push advances); re-push guarded by
  sequence check. No change needed.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Retail mechanic is an instanced Bloodshore battle ("Clear the path toward
  Bloodshore"); availability tags this quest `instance`.
- What exists: static push objective 1090221 with world XYZ, full
  offer/push/turn-in Lua, giver spawn, reward rows.
- What is missing: the instanced fight itself — no encounter script, no BCNM
  surface, no mob roster recovered for the instance. The push-to-advance is a
  placeholder handoff, not a battle. Live-client acceptance open.
- Navmesh: objective XYZ stands as authored SQL; no ground claim made
  (push objectives are interactables, not mob homes; `locate` checks apply to
  kill-mob spawns, of which this quest has none).
