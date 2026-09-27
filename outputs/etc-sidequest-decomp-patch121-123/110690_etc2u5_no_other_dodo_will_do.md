# No Other Dodo Will Do — 110690 (Etc2u5, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2u5.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out and labeled "instance"
  (Lv 15, DoW/DoM).
- Type: dialogue/delivery/interaction (dodo-leather push chain).
  No chocobo. Kill content: NONE in production (see instance gap below).

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Hildie dual-ID (`isHildie`: 1300097 display / 1000787 actor)
  TALK. Offer `processEventHildieStart`; accept -> `AcceptQuest`.
- SEQ_000: reminder `processEvent_000`; DODO_OBJECTIVE 1090223 PUSH grants
  young dodo leather (11000219, guarded) + objectives-complete -> SEQ_005.
- SEQ_005: four delegates (`_010`, `_010_1`, `_020`, `_030`, matching wiki
  #103) + `sqrwa(REWARD_EXP=500)` + leather removal + `CompleteQuest`.
  Single CompleteQuest. `onFinish` also purges leather.
- Journal returns (sequence, hasLeather) (verified form).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

All six recovered events bridged: `processEventHildieStart`, `_000`, `_010`,
`_010_1`, `_020`, `_030`, plus `sqrwa` (verified).

## Actors (verified)

- 1000787 `hildie`, zone 175 (-71.24, 195.2, 57.32) + private-area alias row;
  1300097 is its catalog displayName (verified — no separate spawn).
  Matches DAT marker 11069001 (verified).
- `etc2u5_young_dodo_objective` 1090223, zone 171
  (1181.55, 279.9, -768.36) — matches DAT marker 11069002 (verified).

## Markers (DAT-verified)

- 11069001 (Hildie), 11069002 (dodo area). Returned per sequence (verified).

## Counters / journal

- Item-possession journal (leather). Journal text: xtx_quest Wil/602-604.

## Rewards (SQL parity verified)

- `(110690, 1, 'Item', 9010055 dodoskin wristbands, 1, 'dat-new', autoGrant 1)`,
  `(110690, 2, 'Exp', 0, 500, 'dat-new', autoGrant 1)`.
- `sqrwa(REWARD_EXP=500)` matches SQL 500 (verified).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110690, ..., 0, 15)`. Header agrees.

## Mob spawn evidence

- None in production — the dodo area is a push interaction, not a fight.
  No BNPC ID documented for this quest (verified absence).

## Instance surface — OPEN GAP (unrecovered, do NOT invent)

- `quest_availability.lua` labels this quest "instance"; the decomp
  inventory references `questdirectoretc2u501` (SimpleQuestBattle director).
  Production has NO battle content and no instanced-fight choreography was
  recovered in scope. Recorded as an unrecovered instance gap; the push flow
  is the staged simplification, NOT a recovered instanced fight.

## Inferred vs verified

- VERIFIED: delegates, actors, markers, journal rows, reward parity.
- INFERRED: leather DummyItem as the retail objective item; any battle
  reading of the director reference (explicitly NOT claimed).

## Hardening (Part 2) — real bug fixed

- Completion manually granted wristbands + EXP 500 on top of autoGrant SQL
  rows (double-grant) with a duplicate 25228 message. Removed manual
  `AddItem`/`attentionMessage`/`AddExp`; `sqrwa` + `CompleteQuest`
  auto-grant remain. Leather removal retained.
