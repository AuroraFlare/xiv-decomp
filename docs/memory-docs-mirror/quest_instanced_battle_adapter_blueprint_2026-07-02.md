# Quest Instanced Battle Adapter Blueprint - 2026-07-02

This pass deepens the instanced/SQB quest set after the cutscene blueprint. It reads the current SQL, Lua quest scripts, GC template, and existing June 30 SQB atlas to separate spawn-ready probes from shell-only recovered directors.

## High-Signal Findings

- 4 quests are now private-spawn probe candidates because current SQL has matching actor + mob-type rows and the local quest scripts already have actor-class kill guards.
- 1 quest remains hard-blocked on actor data: `com0u6` / Charledore has actor `2289025` but a blank actor-class path/property row, and mob type `1362` is already `tourney_gladiator`.
- 6 GC 301/302 tail quests are metadata-only in `gc_quest_template.lua`; without `GC_BATTLES` entries, the template falls through to officer talk, which can bypass the intended battle.
- `etc2g3` already has a local `QFLAG_PUSH`/`onPush` objective. Preserve that route until SQB parity can be proven without mutating the current sequence behavior.
- All reward/completion paths stay locked. The adapter needs strict kill, cleanup, return warp, give-up/cancel, cutscene result, and duplicate-grant proof first.

## Spawn-Ready Private Probes

| Quest | Actor | Mob Type | Guard -> Success | Probe |
| --- | ---: | --- | --- | --- |
| com0u4 / Arms Race | 2109801 | 1361 `hellhound` | SEQ_010 + bnpc == BNPC_HELLHOUND -> SEQ_020 | `!sqbprivate status com0u4; !sqbprivate spawn com0u4; expect actor:2109801 mob:1361 unique:com0u4_hellhound reward_locked` |
| com0g1 / Breaking the Seals | 2202206 | 1358 `drake_familiar` | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 | `!sqbprivate status com0g1; !sqbprivate spawn com0g1; expect actor:2202206 mob:1358 unique:com0g1_drake_familiar reward_locked` |
| com0u1 / Career Opportunities | 2200205 | 1360 `anole_familiar` | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 | `!sqbprivate status com0u1; !sqbprivate spawn com0u1; expect actor:2200205 mob:1360 unique:com0u1_anole_familiar reward_locked` |
| com0l1 / The Price of Integrity | 2200708 | 1359 `peiste_familiar` | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 | `!sqbprivate status com0l1; !sqbprivate spawn com0l1; expect actor:2200708 mob:1359 unique:com0l1_peiste_familiar reward_locked` |

## Hard Blocker

- `com0u6` / Know Your Enemy: actor `2289025` is present but not spawn-safe (`` path, property `0`). Gate with `!bnpcdbprobe actor:2289025 recover_path_property_mob_type`.

## GC Tail Risk

The focused GC tails are all present in `GC_QUESTS`, but absent from `GC_BATTLES`. Current template behavior only sets a battle ENPC when `getBattle(config, stepIndex)` returns a row; otherwise it sets the city officer and `onTalk` advances the quest. Do not add placeholder battle rows without recovered actor, step, success owner, cleanup, and return proof.

| Quest | Local Script | Risk |
| --- | --- | --- |
| gcu302 / Different Strokes | `Data/scripts/quests/gcu/gcu302.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |
| gcg301 / Eternal Recurrence | `Data/scripts/quests/gcg/gcg301.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |
| gcu301 / Prying Eyes | `Data/scripts/quests/gcu/gcu301.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |
| gcl302 / Saving the Stead Instead | `Data/scripts/quests/gcl/gcl302.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |
| gcl301 / The Cove | `Data/scripts/quests/gcl/gcl301.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |
| gcg302 / The Pen Is Mightier Than the Spear | `Data/scripts/quests/gcg/gcg302.lua` | missing_GC_BATTLES_row_officer_talk_bypass_risk |

## Adapter Contract

The runtime bridge is specific enough for a GM-only probe, but not broad enablement. Use `SpawnEnemyWithMobType(actorClassId, mobTypeId, uniqueId, x, y, z, rot, displayName)` only after creating a private content area. Treat mob actor mismatches as fatal even though runtime currently only warns. Kill callbacks receive actor class ids, and quest scripts fan out before directors.

## Generated Files

- `outputs\quest-instanced-battle-adapter-blueprint-20260702\battle_adapter_quest_rows.csv`
- `outputs\quest-instanced-battle-adapter-blueprint-20260702\spawn_ready_probe_rows.csv`
- `outputs\quest-instanced-battle-adapter-blueprint-20260702\actor_data_blocker_rows.csv`
- `outputs\quest-instanced-battle-adapter-blueprint-20260702\sqb_shell_gap_rows.csv`
- `outputs\quest-instanced-battle-adapter-blueprint-20260702\runtime_adapter_contract_rows.csv`
