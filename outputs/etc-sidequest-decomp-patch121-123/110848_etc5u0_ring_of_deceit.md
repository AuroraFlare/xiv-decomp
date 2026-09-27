# Ring of Deceit — 110848 (Etc5u0, patch_1_21)

- Script: `Data/scripts/quests/etc/etc5u0.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_21, commented out (Lv 1, second MSQ done).
- Type: dialogue/delivery/interaction. No kill, no instance, no chocobo.
- Header note: unlocks Ul'dah inn rear-exit usage; rewards 200 EXP.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Otopa Pottopa (1000864) TALK, class-gated offer
  `processEventOTOPAPOTTOPAStart`; accept -> `AcceptQuest` (`onStart`
  pre-arms SEQ_000 — verified consistent).
- SEQ_000: Otopa reminder `processEvent_000_1`; Judithe (1001443)
  `processEvent_010` (Judithe/Hildibrand cutscene per wiki #131)
  + `attentionMessage(25225)` + `StartSequence(SEQ_001)`.
- SEQ_001: Judithe reminder `processEvent_010_1`; Otopa `processEvent_020`
  + `sqrwa(200,1,1)` (200 EXP) + `CompleteQuest`. Single CompleteQuest.
- SEQ_ACCEPT uses `if/elseif` chain (not early-return): falls through to
  shared `EndEvent` + `UpdateENPCs` (verified complete coverage).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventOTOPAPOTTOPAStart`, `processEvent_000_1`, `processEvent_010`,
`processEvent_010_1`, `processEvent_020`, `sqrwa`. Note: recovered client
set has NO `Start_2` re-issue variant for this quest (unlike the Lv 15
chain) — production matches (verified, no missing bridge).

## Actors (verified spawn rows)

- 1000864 `otopa_pottopa`, zone 175 (-66.44, 195.45, 81.64).
- 1001443 `judithe`, zone 175 (-36.51, 196, 80.42).

## Markers (DAT-verified)

- 11092001 (Judithe), 11092002 (Otopa). Returned per sequence (verified).

## Counters / journal

- No counters; `getJournalInformation` empty (verified — matches recovered
  `item_counter`-only systems with no held item).
- Journal text: xtx_quest Wil/533-535 (verified).
- Cutscene row: cutReplay.csv `11084801,etc5u010` (verified).

## Rewards (SQL parity verified)

- `(110848, 1, 'Exp', 0, 200, autoGrant 1)`. `sqrwa(200,1,1)` matches.
  No manual grants (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110848, ..., 110010, 1)` — second Ul'dah MSQ.

## Mob spawn evidence

- None — no kill objective.

## Instance surface

- None needed (verified).

## Inferred vs verified

- VERIFIED: delegates, actors, markers, journal rows, cutscene row, rewards.
- INFERRED: inn-exit unlock side effect is a header claim only; no wiring
  found in script — recorded as unverified, not implemented.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` (2 sites). No logic change.
