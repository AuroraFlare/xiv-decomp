# Losing One's Thread — 110669 (Etc2g5, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2g5.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out and labeled "instance"
  (Lv 25, DoW/DoM).
- Type: dialogue/delivery/interaction (goblin needle-box push chain).
  No chocobo. Kill content: NONE in production (see instance gap below).

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Honga Vunga dual-ID (1400098 display / 1000429 actor) TALK.
  Offer `processEventHONGAVUNGAStart`; accept -> `AcceptQuest`.
- SEQ_000: reminder `processEvent000`; GOBLIN_OBJECTIVE 1090220 PUSH grants
  needle box (11000221, guarded) + objectives-complete -> SEQ_005.
- SEQ_005: `processEvent010` + `sqrwa(REWARD_EXP=2430)` + needle-box removal
  + `CompleteQuest`. Single CompleteQuest. `onFinish` also purges the box.
- Journal returns (sequence, hasNeedleBox) (verified form).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventHONGAVUNGAStart`, `processEvent000`, `processEvent010`, `sqrwa`
— full recovered set bridged (verified).

## Actors (verified)

- 1000429 `honga_vunga`, zone 155 (64.04, 4, -1214.38) — matches DAT marker
  11066902 (verified); 1400098 is its catalog displayName (verified).
- `etc2g5_needle_box_objective` 1090220, zone 154
  (1028.88, 0.273, 1130.86) — matches DAT marker 11066901 (verified) and
  the 2026-08-21 in-game confirmation
  (`docs/etc_placeholder_objective_audit_2026-08-17.md`, verified).

## Markers (DAT-verified)

- 11066901 (goblin area/objective), 11066902 (Honga Vunga). Returned per
  sequence (verified).

## Counters / journal

- Item-possession journal (needle box). Journal text: xtx_quest Fst/408-409.
- quest_reward.csv: 3020002 x5 old-table row (provenance only).

## Rewards (SQL parity verified)

- `(110669, 1, 'Item', 10005001 hempen cloth x10, 'dat-new', autoGrant 1)`,
  `(110669, 2, 'Exp', 0, 2430, 'wiki', autoGrant 1)`.
- `sqrwa(REWARD_EXP=2430)` matches SQL 2430 (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110669, ..., 0, 25)`. Header agrees.

## Mob spawn evidence

- None in production — the goblin camp is a push interaction, not a fight.
  No BNPC ID is documented for this quest (verified absence).

## Instance surface — OPEN GAP (unrecovered, do NOT invent)

- `quest_availability.lua` labels this quest "instance"; the decomp
  inventory references `questdirectoretc2g501` (SimpleQuestBattle director).
  Production has NO battle content and no instanced-fight choreography was
  recovered in scope. Recorded as an unrecovered instance gap: the current
  open-world push flow is the staged simplification, NOT a recovered
  instanced fight. No instanced fight invented.

## Inferred vs verified

- VERIFIED: delegates, actors, markers incl. mypos capture, journal rows,
  reward parity.
- INFERRED: needle-box DummyItem as the retail objective item; any battle
  reading of the director reference (explicitly NOT claimed).

## Hardening (Part 2) — real bug fixed

- Completion manually granted cloth x10 + EXP 2430 on top of autoGrant SQL
  rows (double-grant) with a duplicate 25228 message. Removed manual
  `AddItem`/`attentionMessage`/`AddExp`; `sqrwa` + `CompleteQuest`
  auto-grant remain. Quest-item removal retained.
