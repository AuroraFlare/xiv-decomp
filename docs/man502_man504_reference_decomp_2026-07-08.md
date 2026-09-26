# Man502 / Man504 Reference Decomp Notes

## Scope

This pass keeps both late main-scenario rows hidden/reference-only. It adds passive metadata and helper accessors only; no quest offer, objective, director start, reward, completion, or route mutation is enabled.

## Recovered Evidence

- `man502` / quest `110020`
  - Recovered scenario script: `quest/scenario/man/man502`
  - Recovered method surface: `Man502.initText`
  - Text sheet load: `_loadTextDataPermanently(1648, "man502")`
  - Recovered quest directors exist as base-class shells: `QuestDirectorMan50201`, `QuestDirectorMan50202`
  - Common SNPC preview mapping has quest `110020` preview index `1` and fallback route to `man50250`
  - `man50250` is handled as an HQ SNPC cutscene by common questbaseclass logic

- `man504` / quest `110021`
  - Recovered scenario script: `quest/scenario/man/man504`
  - Recovered method surface: `Man504.initText`
  - Text sheet load: `_loadTextDataPermanently(1661, "man504")`
  - No recovered director shell or scene route evidence was found in the local decomp indexes

## Local Changes

- `Data/scripts/scenario_decomp_helpers.lua`
  - Added reference-only quest metadata helpers for `man502` and `man504`.
  - Added list accessors for Man SNPC preview scenes and HQ preview scenes.

- `Data/scripts/quests/man/man502.lua`
  - Exposes passive constants for quest id, text sheet id, recovered scenario, recovered methods, recovered director shells, preview scenes, and HQ preview scenes.
  - Still calls only `InitQuestScaffold("Man502")`, which remains `noOffer`.

- `Data/scripts/quests/man/man504.lua`
  - Exposes passive constants for quest id, text sheet id, recovered scenario, recovered methods, recovered director shells, and preview scenes.
  - Still calls only `InitQuestScaffold("Man504")`, which remains `noOffer`.

## Guardrails

- Do not infer a `pE50` or other Man502 event route from `man50250`; current evidence only proves common SNPC preview selection.
- Do not start `QuestDirectorMan50201` or `QuestDirectorMan50202` from quest script until a recovered retail launch path is found.
- Keep both rows hidden until owner, objective, event lifetime, and route evidence are recovered.
