# Fade to White Man200 Helper Pass

## Scope

This pass keeps the existing handwritten `Man200` route intact while moving repeated decomp patterns behind shared helpers. It does not add a new route, alter sequence numbers, change content launch behavior, or change reward amounts.

## Helper Changes

- `scenario_decomp_helpers.getDefaultSnpcArgList`
  - Builds the pre-companion SNPC payload used by `pE10`, `pE20`, `pE25`, and `processSnpcSelect`: `???`, `1`, `1`, `1`, initial town.
- `scenario_decomp_helpers.delegateDefaultSnpcEvent`
  - Delegates a recovered event with that default payload.
- `scenario_decomp_helpers.getActorClassMappedValue`
  - Looks up a value from a table keyed by an NPC actor class id.
- `scenario_decomp_helpers.delegateActorClassMappedEvent`
  - Delegates the event mapped from an NPC actor class id.
- `scenario_decomp_helpers.addItem`
  - Wraps raw item grant behavior without adding attention-message side effects.

## Man200 Changes

- Added `scenario_decomp_helpers` to `Data/scripts/quests/man/man200.lua`.
- Converted Waking Sands ambient talk routing to actor-class keyed tables:
  - `MAN200_SEQ000_TALK_EVENTS`
  - `MAN200_SEQ010_TALK_EVENTS`
  - `MAN200_SHARED_TALK_EVENTS`
- Replaced active raw `delegateEvent` calls with helper delegates.
- Replaced direct SNPC getter payloads for `pE050`, `pE050_2`, `pE055`, and `pE060` with `delegateSnpcEvent`.
- Replaced pre-companion placeholder SNPC payloads with `delegateDefaultSnpcEvent`.
- Replaced direct actor-class reads with `getActorClassId`.
- Replaced direct completion, reward-window, item, EXP, and journal SNPC nickname helpers where behavior matched existing helper primitives.

## Guardrails

- `startMan20001Content` still launches the existing local `man20001` content path; this pass only wraps the prompt and SNPC cutscene delegate around it.
- Existing warps, `ContentFinished`, NPC linkshell timing, and post-quest development warning remain unchanged.
- The `1000001` item grant is preserved as an item grant plus existing `SendGameMessage`; it was not converted into `AddGil`.
