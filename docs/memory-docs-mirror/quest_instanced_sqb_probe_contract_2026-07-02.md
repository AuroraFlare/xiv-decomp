# Quest Instanced SQB Probe Contract - 2026-07-02

This is the command/runtime contract that sits between the battle adapter blueprint and any actual quest enablement. It keeps the work GM-only and proof-oriented: spawn and kill callback first, cleanup/return/reward later.

## Contract Summary

- `!sqbprivate` is a GM-only proof helper for spawn-ready private SQB rows.
- Wave 1 should only prove private content creation, `SpawnEnemyWithMobType`, actor-class kill callback, and quest sequence movement.
- The spawn command uses hardcoded profiles only; arbitrary actor/mob chat args are rejected.
- `!sqbprivate spawn` should refuse to auto-stage quests. Use the existing raw `!questcomplete <questId> <sequence>` deliberately before spawning.
- Retail return warp, give-up/cancel, and rewards remain wave 2 because the return policy is not recovered for this quest slice.
- The third/fourth Lua args to `CreateContentArea` are easy to misread: `contentScript` is a legacy label, while `areaName` becomes the private area key and content Lua filename.

## Spawn Wave

| Quest | Stage | Spawn | Callback-Only | Actor/Mob | Expected |
| --- | --- | --- | --- | --- | --- |
| com0u4 / Arms Race | `!questcomplete 111804 10` | `!sqbprivate spawn com0u4` | `!testbnpckill 2109801` | 2109801 / 1361 | SEQ_010 + bnpc == BNPC_HELLHOUND -> SEQ_020 |
| com0g1 / Breaking the Seals | `!questcomplete 111601 30` | `!sqbprivate spawn com0g1` | `!testbnpckill 2202206` | 2202206 / 1358 | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 |
| com0u1 / Career Opportunities | `!questcomplete 111801 30` | `!sqbprivate spawn com0u1` | `!testbnpckill 2200205` | 2200205 / 1360 | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 |
| com0l1 / The Price of Integrity | `!questcomplete 111401 30` | `!sqbprivate spawn com0l1` | `!testbnpckill 2200708` | 2200708 / 1359 | SEQ_030 + bnpc == BNPC_FAMILIAR -> SEQ_040 |

The live proof is the `QuestDirectorSqbPrivateProbe` PASS message after the real quest script has moved the sequence; a kill callback without the sequence advance remains `NO SEQUENCE PROOF`.

## Implementation Shape

Use `Data/scripts/commands/gm/sqbprivate.lua`, `Data/scripts/content/SimpleContentSqbPrivateProbe.lua`, and `Data/scripts/directors/Quest/QuestDirectorSqbPrivateProbe.lua`. The command creates a `PrivateAreaMasterSimpleContent`, disables re-entry for the GM probe, binds/starts the director, calls `SpawnEnemyWithMobType` on the returned `contentArea`, adds player/target as director members, then `DoZoneChangeContent` with spawn type `16`. Do not call `CompleteQuest`, `AddExp`, `AddGil`, `AddItem`, or plain `SpawnEnemy`.

The safe call shape is:

```lua
local contentArea = player.CurrentArea:CreateContentArea(
    player,
    "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
    "sqbprivate_" .. profile.key,
    "SimpleContentSqbPrivateProbe",
    "Quest/QuestDirectorSqbPrivateProbe"
)
```

`Zone.CreateContentArea` receives both `contentScript` and `areaName`, but `PrivateAreaContent` is constructed with `areaName`, and `LuaEngine` resolves content scripts from `GetPrivateAreaName()`. That is why the fourth argument must be `SimpleContentSqbPrivateProbe`.

Wave 1 may include GM recovery cleanup after the quest sequence advances, but it should not claim retail cleanup/return parity. The tutorial and Beckon directors prove `ContentFinished` plus hardcoded return warps are possible, but they also show event/cutscene order matters, so this quest slice needs its own return proof before automation.

## Blocked Rows

- `com0l4`, `com0g4`, `com0l5`, and `com0g6` are shell directors with no recovered target actor, success owner, cleanup, or quest-id override.
- `com0u5` and `com0l6` are shells too, but their explicit client quest id overrides (`111805` and `111406`) must be preserved.
- `com0u6` still has only local Charledore callback proof; actor `2289025` has blank actor data and mob type `1362` is already occupied.
- `etc2g3` stays on its `QFLAG_PUSH`/`onPush` route until no-mutation parity is proven.
- The six GC tail quests must not get placeholder `GC_BATTLES` rows; missing or wrong battle metadata can advance through officer talk.

## Generated Files

- `outputs\quest-instanced-sqb-probe-contract-20260702\sqb_probe_command_surface.csv`
- `outputs\quest-instanced-sqb-probe-contract-20260702\sqb_probe_launch_sequence.csv`
- `outputs\quest-instanced-sqb-probe-contract-20260702\sqb_spawn_probe_cases.csv`
- `outputs\quest-instanced-sqb-probe-contract-20260702\sqb_probe_safety_gates.csv`
- `outputs\quest-instanced-sqb-probe-contract-20260702\sqb_blocked_followup_rows.csv`
