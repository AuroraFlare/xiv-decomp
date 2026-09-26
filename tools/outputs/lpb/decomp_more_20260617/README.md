# Deeper LPB Decomp: Instances, Quests, Cutscenes, Retainers, Linkshells

Generated: 2026-06-17

This folder is an analysis-only artifact set. It does not modify runtime/server/source code.

## Scope

- Targeted client LPBs: 1010
- Decompiled successfully: 1010
- Decompile failures: 0
- Families: cutscene=8, instance=112, linkshell=17, quest=861, retainer=14

## Generated Files

- `lua/` - decompiled Lua output, preserving client script path layout.
- `luac/` - decoded Lua bytecode output.
- `manifest.csv` - every targeted LPB, source path, decode/decompile state, and size data.
- `class_inventory.csv` - `_defineClass` and `_defineBaseClass` declarations.
- `class_methods.csv` - methods recovered from decompiled Lua.
- `text_data_loads.csv` - `_loadTextData*` sheet IDs and names referenced by scripts.
- `api_call_inventory.csv` - high-signal calls and line text for client/server boundary mapping.
- `cutscene_calls.csv` - cutscene-related call lines.
- `quest_npc_linkshell_calls.csv` - quest calls into NPC linkshell chat.
- `retainer_linkshell_surfaces.csv` - focused file-level summary for retainer/linkshell scripts.
- `dat_table_summary.csv` - relevant DAT CSV row counts for related source tables.
- `actor_class_refs.csv` - retainer/linkshell actor-class SQL references.
- `analysis_summary.json` - aggregate counts.

## Key Findings

### Retainers

- Retainer coverage now includes manager NPCs, ordinary retainers, base retainer class, meeting/furniture objects, director/content/relation/community groups, and retainer widgets.
- `PopulaceRetainerManager` loads text sheet `545:populaceRetainerManager`, branches on actor classes `1000166`, `1000865`, and `1001184`, uses `askExtendWidget`, `askForCustomizeOption`, `askRestrictChoices`, and `askRetainerNamingWidget`, and routes tutorial selection through `createCutScene(...):startCutScene(1, 61, 2, ...)`.
- `OrdinaryRetainer`, `RetainerFurniture`, and `RetainerMeetingSpace` all expose menu, dismissal, mannequin, item-trade, item-list, and result-notice flows. The major UI bridge calls are `openRetainerTradeWidget`, `selectRetainerTradeWidget`, `openRetainerItemListWidget`, `selectRetainerItemListWidget`, and `noticeRetainerTradeResult`.
- `RetainerBaseClass` owns `updateRetainerItemPackage`; the item-list widget works through `isValidRetainer`, `getRetainerName`, `getRetainerItemPackageCapacity`, `getRetainerItem`, and `getBazaarItem`.
- `RetainerGroup` is a `CommunityGroupBaseClass` and exposes member work fields for coordinate, employment state, location, town, and retainer level.

Useful starting files:

- `lua/chara/npc/populace/populaceretainermanager.lua`
- `lua/chara/npc/retainer/ordinaryretainer.lua`
- `lua/chara/npc/object/retainerfurniture.lua`
- `lua/chara/npc/object/retainermeetingspace.lua`
- `lua/widget/ask/retaineritemlistwidget.lua`
- `lua/group/communitygroup/retainergroup.lua`

### Linkshells

- Linkshell coverage now includes the populace manager, system commands, NPC linkshell chat command, list/menu/member/icon widgets, and ask widgets for naming, confirmation, list selection, and icon selection.
- `PopulaceLinkshellManager` loads text sheet `2221:populaceLinkshellManager` and drives create/edit confirmation through `askLinkshellNamingWidget`, `askLinkshellSelectIconWidget`, and `askLinkshellConfirmWidget`.
- Name validation appears in the manager, including `checkLinkshellName` and `checkLinkshellNameChinese` paths.
- System command scripts cover appoint, change, invite, invite-cancel, kick, resign, and NPC linkshell chat.
- Quest base support includes `QuestBaseClass.tellByNpcLinkshellChat`; scenario quests call it with fixed actor/text IDs.

Useful starting files:

- `lua/chara/npc/populace/populacelinkshellmanager.lua`
- `lua/command/system/linkshellappointcommand.lua`
- `lua/command/system/linkshellchangecommand.lua`
- `lua/command/system/linkshellinvitecommand.lua`
- `lua/command/system/linkshellkickcommand.lua`
- `lua/command/system/linkshellresigncommand.lua`
- `lua/command/system/npclinkshellchatcommand.lua`
- `lua/quest/questbaseclass.lua`
- `lua/quest/questbaseclass_common.lua`

### Quests And Cutscenes

- The quest pull now covers 861 quest-family scripts, including quest base classes and scenario quest scripts.
- `QuestBaseClass` and `questbaseclass_common` centralize cutscene launch wrappers through `worldMaster:createCutScene(...):startCutScene(...)`, pending cutscene actor continuation, and HQ/NQ variants.
- `cutscene_common` includes shared cutscene player state handling and special handling for retainer-manager text owners.
- `cutscene_calls.csv` is the quickest index for every recovered cutscene bridge line.

Useful starting files:

- `lua/quest/questbaseclass.lua`
- `lua/quest/questbaseclass_common.lua`
- `lua/gamedata/cutscene_common.lua`
- `lua/gamedata/cutscene.lua`
- `lua/gamedata/cutscene_u.lua`

### Instances

- Instance coverage now includes 112 scripts across instance raid directors, public raid directors, occupancy/private-area scripts, raid gimmicks, raid monsters/objects, and instance guide NPCs.
- `InstanceRaidGuideBaseClass.askEnterInstanceRaid` is the entry prompt surface for guide NPCs.
- Occupancy raid directors show cutscene/execution handoff into `openRaidDungeonExecutionWidget`, with known IDs such as `4102` and `2123` in the recovered scripts.
- Raid gimmick manager/base/monster classes are now decompiled and indexed for further behavior mapping.

Useful starting files:

- `lua/chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua`
- `lua/director/instanceraid/instanceraidbaseclass.lua`
- `lua/director/occupancy/raidroc0dungeon01.lua`
- `lua/director/occupancy/raidfst0dungeon03.lua`
- `lua/director/raidgimmick/raidgimmickmanager.lua`
- `lua/director/publicraid/publicraidbaseclass.lua`

## External Data Anchors

- `actor_class_refs.csv` found 232 retainer/linkshell actor-class rows in `Data/sql/gamedata_actor_class.sql`.
- DAT CSVs summarized in `dat_table_summary.csv` include retainer manager text, ordinary retainer text, linkshell manager text, NPC linkshell/community member tables, cut replay tables, and quest tables.

## Remaining Gaps

- This pass decompiled client Lua bytecode. Native implementations behind objects like `desktopWidget`, `worldMaster`, and event-mode internals are still external boundaries.
- Decompiler output preserves many temporary names, so call intent is often clear while local variable names are not.
- Server/runtime behavior still needs correlation against SQL and C# code, but this pass intentionally did not edit that code.
