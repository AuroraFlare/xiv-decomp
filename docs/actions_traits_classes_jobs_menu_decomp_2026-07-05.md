# Actions, Traits, Classes, Jobs, and Menu Decomp

Date: 2026-07-05

## Short Map

The client action catalog is the command DAT sheet, represented locally by
`AI Scripts/command.csv`. The useful observed columns are:

- `0`: command id, the client/server handshake id.
- `3` and `4`: English display name and short name.
- `24`: English tooltip/body text.
- `36`: client command kind. Observed values include `2` weapon skill/basic,
  `3` spell, `5` ability, `7` trait, and `10`/`11` menu or system command.
- `37`: action icon id.
- `39`: displayed class/job id.
- `40`: displayed level.

The server runtime catalog is `Data/sql/server_battle_commands.sql`, plus custom
overlays under `Data/sql/custom content/`. The command id must match the DAT row.
The server row controls class/job gate, level gate, target rules, potency, status,
cost, cast/recast, animation, command type, and the Lua command script folder.

Traits are separate server rows in `Data/sql/server_battle_traits.sql`. Runtime
trait ownership is simpler than actions: `Character.HasTrait` checks that the
trait `classJob` equals `GetClass()` and that the trait level is <= current class
level. Modifier traits are applied during battle-trait stat recalculation; rows
with modifier `0` are present as feature hooks/placeholders.

## Classes And Jobs

Class/job ids are shared numeric ids. The current base class lives in
`state_mainSkill[0]`; `currentJob` is a separate overlay. `GetClass()` returns the
base class, while `GetCurrentClassOrJobId()` returns `currentJob` when nonzero.

Retail jobs are not independent leveling tracks here. `ChangeJobCommand.lua`
maps base class -> job id with key-item checks and animation ids:

- Pugilist 2 -> Monk 15
- Gladiator 3 -> Paladin 16
- Marauder 4 -> Warrior 17
- Archer 7 -> Bard 18
- Lancer 8 -> Dragoon 19
- Thaumaturge 22 -> Black Mage 26
- Conjurer 23 -> White Mage 27

Action acquisition is level driven: `Database.LoadGlobalBattleCommandList` keys
commands by `(classJob, lvl)`, and `RefreshCommandAcquiredFromClassLevels` marks
command ids acquired for every class level the character has. Hotbar storage is
per class/job id in `characters_hotbar`; visible hotbar commands are stored in
`charaWork.command[32..61]` as `0xA0F00000 | commandId`.

## Menus

The recovered menu layer is mostly in these client Lua widgets:

- `ActionSettingWidget`: the Actions & Traits assignment screen. It reads command
  sheet data, shows class/action/godsend/job-action lists, and calls
  `desktopWidget:executePlayerEquipAction`.
- `ActionMenuWidget`: the live action bar. It reads equipped custom commands from
  `desktopWidget`, handles shortcut execution, targeting, recasts, combo effects,
  and macro pages.
- `ActionGaugeWidget`: cast bar icon/name/progress for the current command.
- `MainMenuWidget`: opens `ActionSettingWidget`.
- `JobQuestInformationWidget`: the learned ability/item popup used by job quest
  scripts through `showGetJobAbilityWidget`.

On the server, `EquipAbilityCommand.lua` is the main menu-to-hotbar handler. It
handles equip, unequip, swapping, current-class action protection, additional
action limits, and class/job gating. Jobs cap additional actions at 5.

## Unreleased Classes

The local server enum and character level/EXP schemas already include unreleased
or custom class ids: Fencer 5, Enforcer 6, Musketeer 9, Sentinel 10, Samurai 11,
Stavesman 12, Assassin 13, Flayer 14, Mystic 21, Arcanist 24, and Shepherd 42.

Direct DAT anchors exist for only some of them. Confirmed anchors include:

- Fencer: `22106` rapier basic attack shell.
- Enforcer: `22107` Bludgeon.
- Musketeer: `22110` Discharge.
- Sentinel: `22111` Guard and `22112` Block, plus shield-discipline rows.
- Arcanist: `22308` Create Distaff and `22309` Animate Distaff.

The custom SQL overlay `11_unreleased_custom_classes_playable.sql` makes a subset
playable by adding or remapping server command rows. For classes with no native
DAT action rows, the practical path is to clone donor command DAT rows and add
matching server rows. The command id is the handshake: a DAT-only action can show
in menus, but it will not execute unless the server knows that id.

## Generated Atlas

See `outputs/actions-traits-menu-decomp-20260705/`:

- joined command rows: 1714
- server command rows after overlays: 1440
- server trait rows: 88
- unreleased/custom anchor rows: 30
- recovered job ability popup calls: 38

## Next Targets

1. Recover/label the remaining ActionSettingWidget command-sheet columns used by
   `setCommandInfo`: observed columns `38`, `76`, `79`, `114`, `115`, and `119`.
2. Trace `desktopWidget:executePlayerEquipAction` through native packet/event
   boundaries to fully document the menu packet shape.
3. For unreleased classes, decide per action whether to reuse an existing id or
   clone a DAT row. Clones require both DAT and `server_battle_commands` rows.
4. Add explicit trait/menu tests for custom classes, because the current trait
   check is base-class-only and jobs get separate soul-stone stat modifiers.
