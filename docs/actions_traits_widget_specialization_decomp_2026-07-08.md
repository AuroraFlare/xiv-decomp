# Actions & Traits Widget Specialization Decomp

Date: 2026-07-08

## Answer

The Actions & Traits screen still exists in the recovered client Lua as
`ActionSettingWidget`. There does not appear to be a second, older duplicate
widget in the recovered widget inventory; the current main-menu entry opens
`ActionSettingWidget`, while the live hotbar is `ActionMenuWidget`.

This is not all Lua. The widget is Lua, but action ownership, persistence,
hotbar load, and use permission are split across:

- client Lua widget bytecode: `ActionSettingWidget`, `ActionMenuWidget`, and
  `CharaBaseClass` helper methods;
- server Lua command handler: `Data/scripts/commands/EquipAbilityCommand.lua`;
- server C# runtime/database: `Player`, `Database`, `WorldManager`, and
  `Character`;
- command DAT rows and matching `server_battle_commands` SQL rows.

## Existing Client Surface

- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mainmenuwidget.lua:135`
  opens `"ActionSettingWidget"` from main menu index `2`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/actionsettingwidget.lua`
  is the Actions & Traits assignment UI.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/actionmenuwidget.lua`
  is the live action bar.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/actiongaugewidget.lua`
  is the cast/action gauge.

The recovered widget inventory only shows these action-widget classes:

- `ActionGaugeWidget`
- `ActionMenuWidget`
- `ActionSettingWidget`

So "old Actions & Traits widget" most likely means the current
`ActionSettingWidget` script, not a separate older Lua class.

## What The Widget Hardcodes

`ActionSettingWidget` is heavily hardcoded:

- `setBattleGrid` lists only the seven battle class buttons:
  Gladiator, Pugilist, Marauder, Lancer, Archer, Conjurer, Thaumaturge.
- `setCraftGrid` and `setGatherGrid` similarly hardcode crafter/gatherer
  button sets.
- `setClassAction` maps class id -> explicit command id / level pairs.
- `setSpecialSkill` maps the trait/property command list by current base class.
- `setJobAction` only knows the seven retail jobs and maps each job to a window
  inside `getAdditionalCommandList`.
- `equipAction` calls
  `desktopWidget:executePlayerEquipAction(0, slot, commandId, 0)`.

Important line anchors:

- `actionsettingwidget.lua:443`: battle class button grid.
- `actionsettingwidget.lua:522`: other-class button visibility/permission.
- `actionsettingwidget.lua:1053`: class action list construction.
- `actionsettingwidget.lua:1478`: job action list construction.
- `actionsettingwidget.lua:2013`: shared icon list renderer.
- `actionsettingwidget.lua:2126`: equip action bridge.

The client helper `checkClassCommandPermission` is also hardcoded for retail job
cross-class rules. Retail job permissions recovered there are:

- Monk: Pugilist, Lancer, Archer
- Paladin: Gladiator, Marauder, Conjurer
- Warrior: Marauder, Gladiator, Pugilist
- Bard: Archer, Conjurer, Thaumaturge
- Dragoon: Lancer, Pugilist, Archer
- Black Mage: Thaumaturge, Pugilist, Archer
- White Mage: Conjurer, Gladiator, Pugilist

Relevant anchors:

- `charabaseclass_ffxivbattle.lua:57`: `getMainClassOrJob`
- `charabaseclass_ffxivbattle.lua:163`: `checkClassCommandPermission`
- `charabaseclass_ffxivbattle.lua:178`: `isJob`
- `charabaseclass_ffxivbattle.lua:264`: `getAdditionalCommandList`

## Existing Overlay Work

`tools/actions/build_newjobs_actionsettingwidget_overlay.py` already patches the
installed ActionSettingWidget LPB. Its current patch only changes unknown-class
early returns into harmless fall-through jumps for:

- `getClassCommandTbl`
- `setClassAction`
- `setSpecialSkill`

That helps stop custom/unknown jobs from leaving red X placeholder controls, but
it does not add proper class buttons, proper action rows, exact job gates, or a
new dynamic data source.

## Existing Server Placement

Actions can already be placed by the server without manually driving the widget:

- `Player.EquipAbilityInFirstOpenSlot(classId, commandId, printMessage)`
  finds a slot for a target class/job.
- `Player.EquipAbility(classId, commandId, hotbarSlot, printMessage)` persists
  to `characters_hotbar` and updates live `charaWork.command` if that class/job
  is active.
- `EquipAbilitiesAtLevel` auto-equips commands learned at a level for both the
  base class and its mapped job hotbar.
- `SetCurrentJob` swaps to the job context, reloads that hotbar, normalizes
  additional actions, and updates the client.

Relevant anchors:

- `Player.cs:10318`: `EquipAbilityInFirstOpenSlot`
- `Player.cs:10339`: `EquipAbility`
- `Player.cs:10563`: `NormalizeAdditionalActionHotbar`
- `Player.cs:11452` / `11670`: `EquipAbilitiesAtLevel`
- `Player.cs:11747`: `SetCurrentJob`
- `Database.cs:4027`: `LoadHotbar`
- `Database.cs:4202`: hidden DoH hotbar handling and per-command client-safety filtering.

So "actually place the actions" is feasible through server code and
`characters_hotbar`. The widget does not need to be the authority for placement.

## Existing Gates Are Not Exact Enough

The current gates are broad discipline gates, not exact class/job gates:

- `WorldManager.IsPlayerCommandAllowedForClass` blocks hidden commands and
  separates battle/crafting/gathering categories, but it does not enforce a
  precise "only this job can equip/use this exact action" table.
- `EquipAbilityCommand.lua` has a `canEquipOnCurrentClass` helper, but after
  checking current class/job, crafting, gathering, and shared commands, it falls
  through to `return true`.
- `Player.IsCommandUsableOnCurrentClass` has the same broad/fall-through shape,
  so a command can remain usable unless a narrower check is added there too.
- `Character.HasTrait` checks base class only: trait `job == GetClass()` and
  trait level <= current class level.

Relevant anchors:

- `WorldManager.cs:7918`: broad class/discipline hotbar filter.
- `EquipAbilityCommand.lua:108`: equip-side class/job helper.
- `EquipAbilityCommand.lua:263`: additional-action cap path.
- `Player.cs:11204`: use-side class/job helper.
- `Character.cs:656`: base-class-only trait ownership.

If we want hard job/class exclusivity, the server must become the authority. UI
hiding is useful polish, but not enough.

## Recommended Implementation Shape

1. Add a small manifest/table for exact gates, for example:
   `commandId -> allowed class/job ids`, plus optional `autoEquipSlot` and
   `showInActionSetting`.
2. Use that same gate in:
   `WorldManager.IsPlayerCommandAllowedForClass`, `EquipAbilityCommand.lua`,
   `Player.IsCommandUsableOnCurrentClass`, hotbar load, and any auto-equip path.
3. For placement, add a server helper that equips a manifest action to a target
   class/job hotbar through `Player.EquipAbilityInFirstOpenSlot` or
   `Player.EquipAbility`.
4. Patch/generate the `ActionSettingWidget` overlay so its hardcoded class lists,
   job action windows, and action id/level arrays match the manifest.
5. Keep DAT and SQL aligned. If a command id has no command DAT row, the client
   will not render name/icon/help correctly. If a command id has no server row,
   it can appear but will not execute correctly.

The cleanest path is server-first: make exact gates and forced placement work in
C#/server Lua, then patch the widget so the visible Actions & Traits screen
matches what the server already enforces.

## 2026-08-18 Server Authority Follow-up

No client widget bytecode or overlay was changed. The full mutation path was
reviewed from `ActionSettingWidget.equipAction` through
`EquipAbilityCommand.lua`, `Player`, `WorldManager`, and `Database`.

The server command model already loads `server_battle_commands.requirements`
as `BattleCommandRequirements`. Those flags are the recovered permission data
for Disciples of War, Disciples of Magic, and the individual battle
class/weapon families, but the former shared gate ignored them and allowed any
non-crafting/non-gathering command on every battle class/job. The server gate
now applies those flags to additional actions, preserves native owner actions,
and applies the retail three-source-class lists recovered from
`checkClassCommandPermission` when the destination is a job.

Unequip requests are now re-resolved against the live server hotbar at the
moment of mutation. Native current-class/current-job actions, their base-class
actions while on the associated job, and shared commands are rejected in C#;
the widget's earlier Lua classification is no longer the final authority. The
one-based widget slot is also translated to the zero-based persisted slot before
deletion.

The equip bridge now distinguishes acquisition failure from compatibility
failure. Unlearned actions use message `30742` (not acquired), while learned
actions rejected by the class/job requirements gate use message `30720`
(cannot set that action).
