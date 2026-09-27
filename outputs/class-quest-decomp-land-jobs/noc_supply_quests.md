# Noc supply quests (110809 / 110817 / 110862 / 110863) - VERIFIED

Noc files are provisioning/supply/hamlet scaffolds, not class story quests.
All four are one-line `InitQuestScaffold` stubs except Noc002's read-only
delegate shim.

## Noc000 - Guild Tasks (110809)

- SQL (VERIFIED): `(110809, 'Guild Tasks', 'Noc000', 0, 0)`.
- Script (VERIFIED): `InitQuestScaffold("Noc000")` only.
- OPEN: route, actors, mechanics.

## Noc001 - Provisioning & Supply Missions (110817)

- SQL (VERIFIED): `(110817, 'Provisioning & Supply Missions', 'Noc001', 0,
  0)`.
- Script (VERIFIED): `InitQuestScaffold("Noc001")` only.
- OPEN: route, actors, mechanics.

## Noc002 - Hamlet Defense (110862)

- SQL (VERIFIED): `(110862, 'Hamlet Defense', 'Noc002', 0, 1)`.
- Script (VERIFIED): `InitQuestScaffold("Noc002")` + a strict allowlist
  `onEventStarted` shim: only read-only/error-feedback client functions
  (`processTaskBoardOrder`, `processCaptainAskWhat*`, `processSupplyAskWhat*`,
  `processSupply*Error`, `processTalkEnd`, `initText`) are forwarded to
  `delegateEvent`; everything else (including path-like values) is dropped,
  then `player:EndEvent()`. No sequences, kills, or rewards in script.
- INFERRED: supply-mission dialogue surface only; no combat mechanics here.
- OPEN: hamlet-defense battle mechanics (not in this script).

## Noc003 - Class is in Session (110863)

- SQL (VERIFIED): `(110863, 'Class is in Session', 'Noc003', 0, 1)`.
- Script (VERIFIED): `InitQuestScaffold("Noc003")` only.
- OPEN: route, actors, mechanics.
