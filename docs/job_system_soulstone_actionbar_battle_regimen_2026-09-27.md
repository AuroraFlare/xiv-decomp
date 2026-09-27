# Job system, soul stones, action bar, Battle Regimen, AoE, and Actions & Traits — deep decomp

Date: 2026-09-27

## Scope and 100% note

This is a metadata-level deep dive, not a byte-for-byte reproduction of the
commercial 1.x client. Full-source "100% decomp" of `ffxivgame.exe` /
`ffxivboot.exe` is infeasible to verify and unlawful to redistribute, so this
repo tracks the lawful alternative: 100% coverage of the *behavioral contract*
needed to add abilities, actions, menus, and job features. Concretely:

- Client Lua widget inventory for gear/actions/traits/status/repair: 13/13
  scripts reproduce frozen 2026-06-17 artifacts exactly
  (`menu_widget_decomp_2026-09-26.md`).
- Action catalog join: 1714 DAT command rows, 1440 server command rows after
  overlays, 88 trait rows, 30 unreleased anchors, 38 job-ability popup calls
  (`actions_traits_classes_jobs_menu_decomp_2026-07-05.md`).
- Job quest bytecode: 239 non-init methods, 279 path templates, 72/72 EQ edges
  covered for BLM/PLD/BRD/DRG (`job_blm_pld_brd_drg_decomp_2026-09-07.md`).
- Remaining gaps are listed as explicit unresolved items at the end, not hidden.

## Job crystals (soul stones): what equipping does

Retail jobs are overlays, not separate leveling tracks:

- Base class lives in `state_mainSkill[0]`; `currentJob` is a separate overlay.
- `GetClass()` returns base class; `GetCurrentClassOrJobId()` returns
  `currentJob` when nonzero.
- `ChangeJobCommand.lua` maps base class -> job id with key-item checks and
  equip animation ids. Live script:
  `FF14-Memory/Data/scripts/commands/ChangeJobCommand.lua`
  (research copies under `.codex-tmp/...` and `.tmp/...`).
- Mapping: Pugilist 2 -> Monk 15, Gladiator 3 -> Paladin 16,
  Marauder 4 -> Warrior 17, Archer 7 -> Bard 18, Lancer 8 -> Dragoon 19,
  Thaumaturge 22 -> Black Mage 26, Conjurer 23 -> White Mage 27.
- Job souls are key items, not inventory item 3020410 (that is The Keeper's
  Hymn). Confirmed souls: 2000207 BLM, 2000201 PLD, 2000205 BRD, 2000204 DRG.
  WAR/MNK/WHM soul key-item IDs are still open; do not guess them.
- Patch 1.21 rule (Gamer Escape): five job actions per job, first learned on
  soul acquisition; learned job actions auto-equip on job switch; usable only
  with that job equipped.
- Jobs cap additional (cross-class) actions at 5. Trait ownership check
  (`Character.HasTrait`) is base-class-only; jobs add separate soul-stone stat
  modifiers.

## Class actions: catalog and handshake

Client catalog: command DAT sheet, locally `AI Scripts/command.csv` (see also
`docs/Dat Mining/xtx_command.csv`). Observed columns: 0 command id, 3/4 names,
24 tooltip, 36 kind (2 weapon skill/basic, 3 spell, 5 ability, 7 trait,
10/11 menu/system), 37 icon id, 39 class/job id, 40 level.

Server catalog: `Data/sql/server_battle_commands.sql` plus
`Data/sql/custom content/` overlays. The command id must match the DAT row.
Server row owns gates, targeting, potency, cost, cast/recast, status, animation,
command-type flags, and Lua folder. Traits: `server_battle_traits.sql`.

Acquisition is level driven: `Database.LoadGlobalBattleCommandList` keys by
`(classJob, lvl)`; `RefreshCommandAcquiredFromClassLevels` marks acquired ids.
Hotbar storage is per class/job id in `characters_hotbar`; visible commands in
`charaWork.command[32..61]` as `0xA0F00000 | commandId`.

To add a new ability: patch DAT row (name, tooltip, icon, category, class/level)
AND add the matching server row with the same command id; test list, hotbar,
tooltip, execution, animation/VFX, damage/status. Full workflow with donor-kit
tables: `FF14-Memory/docs/unreleased_class_ability_dat_server_notes.md`.

## Class/job animations

- Presentation is model/material/VFX state plus per-actor action banks, not a
  single global animation table. Example: camp crystal orange state is a
  `b902` appearance/material/VFX swap, with no bone deformation
  (`atomos_deepvoid_summoning_animation_decomp_2026-07-29.md`).
- Dungeon actor animation banks, Ifrit/Garuda/Moogle state machines, and
  coffer/cutscene timelines are already decomposed per-target; see
  `dungeon_actor_animation_decomp_2026-07-19.md`,
  `ifrit-animation-decomp-2026-08-02/`,
  `garuda-moogle-coffer-animation-decomp-2026-08-02/`, and the
  `tools/decompile_*` scripts.
- Server `server_battle_commands` animation/VFX fields select the donor
  presentation; prefer player-safe donors over raw enemy-only data.
- Open: a unified motion-ID -> widget/packet index across all jobs is not yet
  built; per-skill motion IDs exist but are scattered across target reports.

## Action bar (live) and Battle Regimen button

Client widgets (all reproduced 13/13):

- `widget/actionmenuwidget` (67 methods): the live action bar. Reads equipped
  custom commands from `desktopWidget`, handles shortcuts, targeting, recasts,
  combo effects, macro pages. It does NOT read the command DAT directly.
- `widget/actiongaugewidget` (9 methods): cast/action gauge icon/name/progress.
- `widget/actionsettingwidget` (41 methods): assignment screen; see below.
- `widget/actionequipwidget`: single-line stub; real equip path goes through
  `desktopWidget:executePlayerEquipAction(0, slot, commandId, 0)` ->
  server `EquipAbilityCommand.lua`.

Retail Battle Regimen flow (Gamer Escape wiki + 1.x forum threads):

1. First player targets the enemy and presses the Battle Regimen button on the
   action bar, entering Battle Regimen Mode. Cast-time actions are pre-cast now
   and fire instantly during the regimen.
2. A red icon appears next to the target name while setup is in progress.
3. Each further participant enters Regimen Mode and queues exactly one action,
   in the agreed order. Macros (`/br on`, `/ac "Name" <t>`) coordinate timing.
4. Any participant presses the glowing red launch button; queued actions execute
   automatically in order, producing combo effects (e.g. WS->WS ≈ +50% on the
   second hit connecting; WS->WS->spell damage up; other period combos per the
   wiki table).

Is it turn-on-able? Verdict: client button exists in the 1.x UI lineage, but
the Meteor server has no regimen implementation — a repo-wide search for
`regimen` in `Map Server`/`World Server` and docs returns no handler. So there
is no server flag to flip today. Enabling it requires: (a) confirming the
client button/packet in this exact build via widget string + packet capture
research, (b) implementing server queue/stack/launch/execute state per party +
target, (c) deciding retail-vs-custom combo table. The companion reg doc in
FF14-Memory specifies the capture plan and state machine sketch.

## AoE button

Status: unresolved as a standalone client toggle. No `AoE button` widget or
command row has been isolated in the decomp docs yet. Known adjacent mechanics:

- Curaga is a capped-pool party heal (cap C, per-target cap C/2, ascending-HP
  order), Protect is natively party-area, Holy hits around the caster, Sacred
  Prism converts the next compatible spell to AoE (1 min recast).
- Server `server_battle_commands` range/AOE/cone columns are the authoritative
  targeting switch for any action.
- Next step: string-search the recovered `actionmenuwidget.lua` /
  `actionsettingwidget.lua` for target-mode/AoE tokens and capture the target-
  select packet for a known AoE spell (Curaga, Protect) vs single-target Cure.

## Old Actions & Traits menu: it exists

There is no second hidden legacy widget; the "old" menu IS the recovered
`ActionSettingWidget`, opened from main menu index 2
(`mainmenuwidget.lua:135`). It reads command-sheet data, renders
class/action/godsend/job-action lists, and equips via
`executePlayerEquipAction`. `MainMenuWidget` -> `ActionSettingWidget`;
`JobQuestInformationWidget.showGetJobAbilityWidget` is the learned-ability popup
(38 recovered calls).

Hardcoded limits that matter for revival/extension
(`actions_traits_widget_specialization_decomp_2026-07-08.md`):

- `setBattleGrid` lists only the 7 battle classes; craft/gather grids likewise
  hardcoded. `setClassAction` maps class -> explicit command/level pairs;
  `setSpecialSkill` maps trait lists by base class; `setJobAction` knows only
  the 7 retail jobs as windows into `getAdditionalCommandList`.
- `checkClassCommandPermission` hardcodes cross-class pools
  (MNK: PUG/LNC/ARC; PLD: GLA/MRD/CNJ; WAR: MRD/GLA/PUG; BRD: ARC/CNJ/THM;
  DRG: LNC/PUG/ARC; BLM: THM/PUG/ARC; WHM: CNJ/GLA/PUG).
- Anchors: `actionsettingwidget.lua:443` battle grid, `:522` visibility,
  `:1053` class list, `:1478` job list, `:2013` icon renderer, `:2126` equip
  bridge; `charabaseclass_ffxivbattle.lua:57` `getMainClassOrJob`.
- Server `EquipAbilityCommand.lua` enforces equip/unequip/swap, current-class
  protection, additional-action limits, class/job gating.

Revival/extension paths:

- New abilities on existing classes/jobs: DAT row + server row, no widget change
  needed if you reuse existing list windows.
- New menus or revived layouts: patch `ActionSettingWidget` list builders
  (client DAT mod) + matching server gates; unreleased classes need per-action
  reuse-vs-clone decisions and new trait/menu tests because trait checks are
  base-class-only.
- Old-menu look: restyle/relabel the existing widget; do not hunt for a second
  widget class — inventory shows only ActionGauge/ActionMenu/ActionSetting.

## Reproduction

```powershell
python -B tools/rerun_menu_widget_decomp.py
python -B tools/build_actions_traits_menu_decomp.py
python -B tools/build_job_gc_decomp.py
python -B tools/test_job_gc_decomp.py
```

Outputs: `tools/outputs/menu-widget-decomp-20260926/`,
`outputs/actions-traits-menu-decomp-20260705/`,
`outputs/job-gc-decomp-20260907/`.

## Sources

- Repo docs cited inline; Gamer Escape Battle Regimen wiki and 1.x forum
  threads (see `video_catalog_job_action_animation_ui_2026-09-27.md`).
- Game install inventoried: 1.x client (ffxivgame.exe 2012-09-20, 15.996.808
  bytes; ffxivboot.exe 2010-09-22), `client/`, `data/`, `Launcher/`,
  `ffxiv_patches/`.

## Unresolved

Items 1-3 closed by `battle_regimen_combination_killswitch_targetmode_2026-09-27.md`:
all seven soul IDs (2000201-2000207), the regimen "Combination" kill-switch
(`canStartCombination`=false + zeroed stack counts, display chain intact), and
the targetMode 1-4 map (no standalone AoE toggle in recovered Lua).

Still open:

1. `setCommandInfo` columns 38/76/79/114/115/119 labels.
2. `executePlayerEquipAction` native packet shape.
3. Unified cross-job motion-ID index.
4. targetMode 1-4 semantic labels; configWork(13) meaning.
5. Battle Regimen live packet/opcode capture (client chain found; needs runtime
   confirmation + server implementation per the FF14-Memory reg doc).
