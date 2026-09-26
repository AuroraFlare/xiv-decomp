# Decomp Code Change Rollback Manifest - 2026-06-20

This file lists the current `.lua` and `.cs` code changes visible in git after the quest/widget/content decomp work. It is a rollback map, not a patch. The detailed research notes remain in `docs/decomp_progress_handoff_2026-06-20.md` and the linked contract docs.

Important caveat: this repository already had a large dirty worktree during the decomp pass, so this manifest records the current code diff. It should be reviewed before reverting anything that may have been changed outside the decomp work.

## Main Summary Docs

- `docs/decomp_progress_handoff_2026-06-20.md`
- `docs/custom_window_menu_surface_handoff_2026-06-20.md`
- `docs/chocobo_caravan_hud_adapter_contract_2026-06-19.md`
- `docs/hamlet_supply_noc002_contract_2026-06-19.md`
- `docs/cutscene_replay_skip_widget_contract_2026-06-19.md`
- `docs/seasonal_quest_gap_contract_2026-06-19.md`
- `docs/system_command_bridge_contract_2026-06-19.md`
- `docs/private_area_base_content_contract_2026-06-19.md`
- `docs/legacy_dungeon_execution_widget_contract_2026-06-19.md`

## Tracked Modified Lua Files

- `Data/scripts/base/chara/npc/monster/Chocobo/ChocoboCaravanGuard.lua`
- `Data/scripts/base/chara/npc/object/PrivateAreaPastExit.lua`
- `Data/scripts/base/chara/npc/populace/PopulaceCaravanGuide.lua`
- `Data/scripts/base/chara/npc/populace/PopulaceCutscenePlayer.lua`
- `Data/scripts/base/chara/npc/populace/PopulaceHamletSupply.lua`
- `Data/scripts/commands/ChocoboRideCommand.lua`
- `Data/scripts/commands/gm/totorak.lua`
- `Data/scripts/quests/class_quest_template.lua`
- `Data/scripts/quests/com/gc_quest_template.lua`
- `Data/scripts/quests/noc/noc002.lua`
- `Data/scripts/quests/spl/spl000.lua`
- `Data/scripts/quests/spl/spl101.lua`

## Tracked Modified C# Files

- `Map Server/Actors/Area/Area.cs`
- `Map Server/Actors/Chara/Player/Player.cs`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs`
- `Map Server/ConfigConstants.cs`
- `Map Server/Lua/LuaEngine.cs`
- `Map Server/PacketProcessor.cs`
- `Map Server/WorldManager.cs`

## Untracked New Lua Files

- `Data/scripts/base/chara/npc/gimmick/GimmickBuffRect.lua`
- `Data/scripts/base/chara/npc/gimmick/GimmickBuffRectTriggerBox.lua`
- `Data/scripts/base/chara/npc/gimmick/GimmickDetectionRect.lua`
- `Data/scripts/base/chara/npc/gimmick/GimmickKeepOutRect.lua`
- `Data/scripts/base/chara/npc/gimmick/GimmickNpcBaseClass.lua`
- `Data/scripts/base/chara/npc/gimmick/PrefaceEvent.lua`
- `Data/scripts/base/chara/npc/gimmick/gimmickmapobj/BeaconFortGateGimmick.lua`
- `Data/scripts/base/chara/npc/gimmick/gimmickmapobj/GimmickMapObj.lua`
- `Data/scripts/base/chara/npc/gimmick/gimmickmapobj/GimmickMapObjBaseClass.lua`
- `Data/scripts/base/chara/npc/gimmick/gimmickmapobj/GimmickMapObjObstacle.lua`
- `Data/scripts/base/chara/npc/gimmick/gimmickmapobj/MagicSquareGimmick.lua`
- `Data/scripts/base/chara/npc/object/ChocoboStop.lua`
- `Data/scripts/base/chara/npc/object/ContentPrivateAreaRange.lua`
- `Data/scripts/base/chara/npc/object/InstanceRaidExit.lua`
- `Data/scripts/base/chara/npc/object/RaidDungeonExit.lua`
- `Data/scripts/base/chara/npc/object/RaidDungeonRect.lua`
- `Data/scripts/commands/WidgetOpenCommand.lua`
- `Data/scripts/commands/gm/qciprobe.lua`
- `Data/scripts/commands/gm/qmobmarker.lua`
- `Data/scripts/directors/Gimmick/GateGimmick.lua`
- `Data/scripts/directors/Gimmick/GimmickBaseClass.lua`
- `Data/scripts/directors/Gimmick/NMPopGimmick.lua`
- `Data/scripts/directors/Quest/QuestContentInformationProbe.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickBaseClass.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickBoss.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickManager.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonster.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterBarrierAurum.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterBaseClass.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterHamlet.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterManager.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterRepop.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterSynchro.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterTime.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickMonster/RaidGimmickMonsterWatch.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickObstacle.lua`
- `Data/scripts/directors/RaidGimmick/RaidGimmickPop.lua`
- `Data/scripts/quests/cul/cul400.lua`

## Untracked New C# Files

- `Map Server/Actors/Director/QuestContentInformationDirector.cs`
- `Map Server/Actors/Director/Work/QuestContentInformationWork.cs`

## Highest Impact Revert Targets

- `Map Server/PacketProcessor.cs`: debug EventRouteProbe routing and command-owner instrumentation.
- `Map Server/WorldManager.cs`: private-area/caravan/content helper changes.
- `Map Server/Actors/Chara/Player/Player.cs`: replay/book/caravan/reward-adjacent helper changes.
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs`: caravan HUD/work-field changes.
- `Map Server/ConfigConstants.cs` and `Map Server/Lua/LuaEngine.cs`: config/Lua exposure changes.
- `Data/scripts/quests/noc/noc002.lua`, `Data/scripts/base/chara/npc/populace/PopulaceHamletSupply.lua`: Hamlet UI/probe bridge.
- `Data/scripts/base/chara/npc/populace/PopulaceCutscenePlayer.lua`: cutscene replay bridge.
- `Data/scripts/quests/spl/spl000.lua` and `Data/scripts/quests/spl/spl101.lua`: seasonal bridge changes.
- `Data/scripts/base/chara/npc/monster/Chocobo/ChocoboCaravanGuard.lua`, `Data/scripts/base/chara/npc/populace/PopulaceCaravanGuide.lua`, `Data/scripts/commands/ChocoboRideCommand.lua`: caravan/chocobo changes.
- All untracked `Data/scripts/directors/RaidGimmick/*`, `Data/scripts/base/chara/npc/gimmick/*`, and QCI probe files: newly added probe/scaffold scripts.

## Manual Undo Shape

- To undo tracked code files only, restore the paths listed under tracked Lua and tracked C# files.
- To undo untracked code files, delete or move aside the paths listed under untracked Lua and untracked C# files.
- To preserve research notes, do not revert `docs/` or `tools/outputs/lpb/*/README.md` files.
