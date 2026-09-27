# Implementing New Assassin Actions and Traits

Date: 2026-08-19  
Status: working end-to-end implementation for native class `13` (Assassin)

## Purpose

This document records the complete process used to turn the Assassin concept
into real FFXIV 1.x actions and traits. It covers the client DAT rows, command
registry, Actions & Traits widget, hotbar behavior, server SQL, Lua mechanics,
status effects, icons, deployment, and the failures encountered while bringing
the class online.

The current result is:

- 18 new actions using command IDs `29743` through `29760`;
- 11 new traits using command IDs `29761` through `29771`;
- correct action and trait levels in the client and server;
- independent server mechanics for every action rather than reused donor
  mechanics;
- working combo highlights and combo execution;
- client-visible recast and TP costs matching the server;
- visible Shadow Fang and Hide statuses;
- five removable Additional Actions at level 50 while native Assassin actions
  remain fixed;
- no Assassin offhand weapon, because equipping one makes the 1.x character
  model T-pose;
- Triple Attack as the class's multi-hit replacement for Dual Wield.

This implementation extends the retail client through data and script assets.
It does not patch `ffxivgame.exe`.

## Implementation History

The working design was reached in these stages:

1. The class progression was drafted from FFXI Thief and FFXIV 2.0 Rogue,
   using retail 1.x commands as animation and presentation references.
2. The first prototype borrowed retail command IDs directly. Those entries
   could animate, but they were still the retail actions internally and shared
   donor behavior instead of being independent Assassin actions.
3. Genuine custom command rows were created. They appeared in Actions & Traits,
   proving the DAT rows and widget lists were readable, but entering a custom
   ID into a live hotbar slot could crash the client.
4. The crash was isolated from traits and SQL. The retail
   `client/script/rq9q1797qvs.san` registry stopped at ID `29742`, so the client
   could describe `29743` from DATs but could not construct its live command
   object.
5. The 13-byte `sane` header and XOR-`0x73` record format were recovered. A
   one-action `29743` pilot round-tripped and loaded successfully, followed by
   the full actions and traits registry.
6. The class widget was extended from a visibility-only patch into real
   class-action and trait branches. The Additional Action double-click path was
   also repaired so only borrowed actions can be removed.
7. Every action received a unique namespaced SQL name and independent Lua
   mechanic. Shared client Lua was reduced to a thin ID dispatcher that calls
   the server's declared Ability or WeaponSkill state.
8. Level-based hotbar reconciliation replaced unsafe global acquisition
   updates. This removed the broad hotbar slowdown, kept early persisted
   restoration quarantined, and allowed safe post-initialization acquired
   flags needed by combo highlighting.
9. Mechanics were tuned individually: self-targeting Shade Shift, rear/front
   positionals, Hide interaction, fourfold Mindscatter, 60-second Assassinate,
   buff-stealing Aura Steal, high-cost combo finishers and Whirlwind Edge, and 20-minute
   party-AoE Goad.
10. Custom status presentation was added for Shadow Fang and Hide, along with
    the supplied Shade Shift action icon and Assassin class terminology.
11. Assassin Dual Wield and offhand daggers were removed after repeatable
    T-poses on equip/login. Triple Attack I and II replaced the intended
    multi-hit role without using the broken offhand client path.
12. Trait levels, tooltip wording, client-visible costs, and scripted trait
    bonuses were synchronized across SQL, DATs, the widget, the registry, and
    tests. The final level-48 trait is Enhanced Physical Attack Power II.

## The Four Required Layers

A command is not complete merely because it appears in Actions & Traits. A
working custom action requires four layers that agree on the same command ID:

```text
Actions & Traits widget and command DAT rows
        |
        v
client /StaticActor.san ID -> command-class registration
        |
        v
server_battle_commands row and class/level permission
        |
        v
independent Lua command/effect mechanics
```

Each layer has a different responsibility:

| Layer | Responsibility |
| --- | --- |
| Client command DATs | Name, help text, icon, client level, recast, TP cost, and general presentation metadata. |
| Client `ActionSettingWidget` | Which actions and traits appear for class 13, their ordering, their levels, and Additional Action toggling. |
| Client `/StaticActor.san` | Maps each new numeric ID to a concrete client Lua command class. Without it, a DAT row can display but the client can crash when the command enters a live hotbar slot. |
| Server SQL and code | Authoritative class, level, target rules, potency, hits, status, cast/recast, costs, animation values, combo links, acquisition, and permissions. |
| Server Lua mechanics | Behavior that cannot be represented by the SQL row alone: positionals, executes, buff stealing, Hide interaction, conditional statuses, and trait-specific changes. |

The most important lesson is that a donor command is only a presentation and
client-class donor. A custom command must retain its own new ID, namespaced SQL
name, and mechanics script. Reusing a donor's Lua behavior makes it the donor
action with a different label, not a new ability.

## Primary Source Files

The implementation is split across these areas:

| Area | Source |
| --- | --- |
| Server action rows and statuses | `Data/sql/custom content/Custom Classes/assassin/10_assassin_actions.sql` |
| Server trait rows | `Data/sql/custom content/Custom Classes/assassin/20_assassin_traits.sql` |
| Ability mechanics | `Data/scripts/commands/ability/assassin_*.lua` |
| Weaponskill mechanics | `Data/scripts/commands/weaponskill/assassin_*.lua` |
| Status effect mechanics | `Data/scripts/effects/assassin_hide.lua`, `shadow_fang.lua`, and `ambush.lua` |
| Client action/trait DAT builder | `tools/actions/build_assassin_action_overlay.py` |
| Actions & Traits widget builder | `tools/actions/build_newjobs_actionsettingwidget_overlay.py` |
| Client command-registry builder | `tools/actions/build_assassin_static_actor_registry.py` |
| Assassin visible-status builder | `tools/actions/build_assassin_shadow_fang_status_overlay.py` |
| Class icon builders | `tools/actions/build_newjobs_assassin_icon_dat.py` and `build_newjobs_class_icon_overlay.py` |
| Package verification | `tools/assassin/test_assassin_package.py` and `tools/actions/tests/test_build_assassin_static_actor_registry.py` |
| Install-ready client union | `docs/dat_mods/assassin/complete_overlay` |

The earlier general analysis is in
`docs/dat_mods/new_jobs_actions_traits_additional_actions.md`. The client
registry reverse engineering is preserved in
`docs/assassin_client_command_registry_decomp_2026-08-19.md`.

## Choosing Safe New Command IDs

The original experiments borrowed retail IDs or used ranges that were not safe
for every client property path. The final Assassin package uses a contiguous,
retail-unused range:

| Purpose | Range |
| --- | --- |
| Actions | `29743..29760` |
| Traits | `29761..29771` |
| Full custom range | `29743..29771` |

The range was selected because:

- it does not collide with rows in the retail `command`, `gameCommand`,
  `gameCommandBasic`, or localized command-text sheets;
- it stays inside the client/server command-acquisition indexing band;
- it begins immediately after retail registry ID `29742`;
- it can be appended contiguously to the relevant DAT ranges and static-actor
  registry.

Do not select an ID merely because its name looks unused. Verify all command
sheets and the decoded static-actor registry. Also audit server use: retail
`DummyCommand` registry entries can still be used by gathering or another
runtime system.

The package tests perform the retail collision check automatically.

## Current Action Table

The donor ID supplies compatible client metadata and animation presentation.
The registry class determines which client event bridge receives the new ID.
The server script remains unique to the new action.

| ID | Lv. | Action | Donor | Client class | Recast | TP | Server script |
| ---: | ---: | --- | ---: | --- | ---: | ---: | --- |
| 29743 | 1 | Spinning Edge | 26814 client / 26858 animation | `CmnAttackWeaponSkill` | 3s | 1000 | `weaponskill/assassin_spinning_edge.lua` |
| 29744 | 2 | Shade Shift | 26511 | `CmnAbility` | 60s | 0 | `ability/assassin_shade_shift.lua` |
| 29745 | 4 | Gust Slash | 26858 client / 26814 animation | `AttackCommand` | 30s | 1000 | `weaponskill/assassin_gust_slash.lua` |
| 29746 | 6 | Sneak Attack | 26859 | `AttackCommand` | 60s | 0 | `ability/assassin_sneak_attack.lua` |
| 29747 | 10 | Hide | 29873 | `GathererStealthAbility` | 30s | 0 | `ability/assassin_hide.lua` |
| 29748 | 14 | Assassinate | 26858 | `AttackCommand` | 60s | 250 | `ability/assassin_assassinate.lua` |
| 29749 | 15 | Steal | 26518 | `AttackCommand` | 45s | 0 | `ability/assassin_steal.lua` |
| 29750 | 18 | Mindscatter | 26793 | `CmnAttackWeaponSkill` | 30s | 2000 | `weaponskill/assassin_mindscatter.lua` |
| 29751 | 22 | Trick Attack | 26859 | `AttackCommand` | 60s | 0 | `ability/assassin_trick_attack.lua` |
| 29752 | 26 | Aeolian Edge | 26802 | `CmnAttackWeaponSkill` | 15s | 1000 | `weaponskill/assassin_aeolian_edge.lua` |
| 29753 | 30 | Flee | 27415 | `CmnAbility` | 120s | 0 | `ability/assassin_flee.lua` |
| 29754 | 32 | Aura Steal | 26518 | `CmnAttackWeaponSkill` | 90s | 0 | `ability/assassin_mug.lua` |
| 29755 | 34 | Shadow Fang | 26802 client / 22109 Light Thrust animation | `CmnAttackWeaponSkill` | 15s | 1500 | `weaponskill/assassin_shadow_fang.lua` |
| 29756 | 38 | Dancing Edge | 26817 | `CmnAttackWeaponSkill` | 15s | 2500 | `weaponskill/assassin_dancing_edge.lua` |
| 29757 | 42 | Viper Bite | 26857 | `AttackCommand` | 30s | 0 | `weaponskill/assassin_viper_bite.lua` |
| 29758 | 46 | Whirlwind Edge | 26795 | `CmnAttackWeaponSkill` | 80s | 3000 | `weaponskill/assassin_whirlwind_edge.lua` |
| 29759 | 48 | Ambush | 26701 | `CmnAbility` | 90s | 0 | `ability/assassin_ambush.lua` |
| 29760 | 50 | Goad | 26698 animation / 27227 client | `Ability` | 1200s | 0 | `ability/assassin_goad.lua` |

The current combo tree is:

```text
Spinning Edge
  +-- Shadow Fang
  `-- Gust Slash
        +-- Aeolian Edge
        `-- Dancing Edge
```

The server SQL `comboId1`, `comboId2`, and `comboStep` values drive both combo
recognition and client combo glows. Position bonuses are resolved in the
individual Lua scripts instead of the generic SQL positional field so they do
not suppress combo recognition.

## Reusable Recipe: Combo Tooltips and Native Combo Glows

Use this section when building combos for another custom class. A tooltip, a
server combo, and a glowing hotbar button are three separate features. They
must agree, but none of them creates either of the others.

### The four combo layers

| Layer | Required data | What it does |
| --- | --- | --- |
| Client help text | `ACTIONS` name/description and `[@CR]` tokens | Tells the player the prerequisite and bonus. It is presentation only. |
| Server command graph | SQL `comboId1`, `comboId2`, and `comboStep` | Defines the legal successors and lets `WeaponSkillState` recognize starters and continuations. |
| Runtime player state | `playerWork.comboNextCommandId[0..1]` and `comboCostBonusRate` | Publishes the currently valid follow-ups to the client and drives the native glow/cost state. |
| Client command ownership | Complete DAT rows, `/StaticActor.san`, `commandAcquired`, live hotbar slot, and compatibility flag | Lets the client resolve and illuminate the custom command safely. |

If the help text says “Combo Action” but the SQL graph is empty, nothing will
combo. If the server applies the combo bonus but `commandAcquired` or the
runtime `playerWork` update is missing, the action can work without glowing.

### Author the SQL graph

The graph is stored on the action that was just executed, not on the action
that comes next:

```text
Starter row:      comboId1=SecondStep, comboId2=BranchStep, comboStep=1
Second-step row:  comboId1=FinisherA,  comboId2=FinisherB, comboStep=2
Finisher row:     comboId1=0,          comboId2=0,         comboStep=3
```

Only two simultaneous successors fit in the recovered
`playerWork.comboNextCommandId` array. A wider branch needs a different design
instead of silently adding a third SQL link.

For the current Assassin tree, the important SQL values are:

```text
Spinning Edge: comboId1=Gust Slash,   comboId2=Shadow Fang,  comboStep=1
Gust Slash:    comboId1=Aeolian Edge, comboId2=Dancing Edge, comboStep=2
Shadow Fang:   comboId1=0,            comboId2=0,            comboStep=2
Aeolian Edge:  comboId1=0,            comboId2=0,            comboStep=3
Dancing Edge:  comboId1=0,            comboId2=0,            comboStep=3
```

`SanitizeComboCommandId` rejects a successor that is missing from the battle
command cache, belongs to another class/job, or is above the player's current
level. This prevents a bad custom link from being sent to the client.

### Implement the combo bonus in the continuation script

`WeaponSkillState` calls `onCombo` only when the command ID matches one of the
current `playerWork.comboNextCommandId` values. Keep the custom bonus in the
continuation's namespaced Lua file:

```lua
function onCombo(caster, target, skill)
    skill.basePotency = skill.basePotency * 1.5;
end;
```

The command is an execution copy, so changing its potency in `onCombo` does
not alter the cached global row or another player's action.

The normal automatic transition is intentionally restricted to spells and
weaponskills. An ability that starts a branch must explicitly call
`owner:SetCombos(nextId1, nextId2)`, as Assassin Hide does. An ability used as
a continuation must explicitly mark/consume its custom branch if it does not
pass through the ordinary weaponskill transition.

### Keep positional checks out of the generic combo gate

The recovered `WeaponSkillState` performs positional handling before combo
recognition. A nonzero SQL `positionBonus` can therefore prevent a valid
continuation from reaching `onCombo` when the player attacks from another
direction. For a combo that should still advance outside its optimal
position, use SQL `positionBonus=0` and calculate the directional bonus in the
action's Lua `onSkillFinish` callback:

```lua
if action.param == HitDirection.Rear then
    action.amount = action.amount * 1.25;
end;
```

This preserves the positional reward without suppressing the combo or glow.

### Publish the next step only after the hit result

After a spell or weaponskill completes, the server advances the graph only
when both conditions are true:

1. the command was recognized as a combo starter/continuation; and
2. at least one target was actually hit.

`Character.DoBattleCommand` queues the combo-marked battle result first and
then calls `Player.SetCombos`. This packet order matters. Sending
`playerWork.comboNextCommandId` before the client receives the landed action
can make the glow appear late, appear only after another UI refresh, or not
appear at all.

`SetCombos` publishes these three properties together:

```text
playerWork.comboCostBonusRate
playerWork.comboNextCommandId[0]
playerWork.comboNextCommandId[1]
```

The current Assassin server uses a 15-second combo window. Starting a valid
cast before the deadline preserves the captured combo through completion.
Clearing the pair with `SetCombos()` removes the glow, visible status icon, and
combo cost bonus.

Assassin mirrors each ordinary combo opportunity with the native retail Combo
status (`223205`). No custom status DAT is required: the client already has its
icon, text, and countdown presentation. `SetCombos` refreshes that status to 15
seconds when a chain starts or advances and removes it when the chain finishes,
is consumed, or expires. This presentation is class-scoped; the authoritative
chain remains `playerWork.comboNextCommandId` plus the server deadline.

The Combo effect's Lua `onLose` must not call `owner:SetCombos()`. Removing the
old icon during a refresh would otherwise recursively clear the new follow-up
state. `Player.ProcessComboExpiration` owns expiration and clears the IDs,
glow, TP bonus, and icon together.

### Mark every glowable command as acquired

For command IDs in the normal acquired array, the index is:

```text
commandAcquired index = command ID - 26000
```

The index must fit the client's 4,096-entry array. More importantly, the ID
must already have complete command DAT and `/StaticActor.san` records before
the server sends the acquired property. Sending an acquired flag for a row the
client cannot construct caused the earlier login/job-switch crashes.

Once the complete client registry is proven, mark each level-eligible action
with `MarkCommandAcquired` and include the corresponding
`charaWork.commandAcquired[index]` property in the init/hotbar update. This is
required for command-aware presentation such as combo highlighting. Traits
remain outside the usable hotbar even though their client rows and registry
records exist.

### Write the FFXIV 1.0-style combo tooltip

In `build_assassin_action_overlay.py`, the action tuple is:

```python
(command_id, donor_id, "Action Name", "Action help text")
```

Use the recovered command-help line-break token rather than a literal newline:

```python
(
    31002,
    donor_id,
    "Example Finisher",
    "Delivers a melee attack."
    "[@CR]Combo Action: Example Opener"
    "[@CR]Combo Bonus: Increased damage.",
)
```

Recommended wording order:

```text
<base effect>.
Combo Action: <immediate prerequisite>
Combo Bonus: <exact bonus>.
```

Name the immediate prerequisite, not merely the first action in a three-step
chain. If the bonus adds a status, cost change, potency increase, or positional
condition, say so explicitly. Keep the language short and mechanical, like a
1.x help row.

`[@CR]` encodes to `71 63 72 70`. `patch_text_row` replaces the donor's first
text chunk with the custom name and its longest text chunk with the custom
description. The builder writes the rows to the German, English, French, and
Japanese command-text triples under `data/0B/45/06`; this prototype currently
uses the same English text in every locale. Unsupported characters fail the
build instead of emitting corrupt text, so extend `TEXT_CHARMAP` deliberately
when new punctuation is needed.

Changing only the tooltip does not require SQL or a Map Server restart. It
does require rebuilding the action overlay, merging the changed `data` tree
and manifest into `complete_overlay`, installing the same DATs in the active
launcher overlay, and fully restarting the client because command help is
cached.

### Combo verification for any new class

Test every link and branch separately:

1. Put every action on the visible hotbar and confirm it is not grey.
2. Use the starter and verify only its authored successors glow.
3. Confirm the glow appears immediately after the landed result.
4. Use each continuation and verify the correct next branch replaces it.
5. Miss the starter and confirm no successor glows.
6. Confirm the native Combo status icon appears with a 15-second timer.
7. Advance the chain and confirm the icon timer refreshes to 15 seconds.
8. Wait longer than 15 seconds and confirm both the icon and glow clear.
9. Test below each successor's unlock level and confirm invalid IDs are not sent.
10. Execute from non-optimal positions and confirm the combo still advances when intended.
11. Confirm `onCombo` changes the mechanic, not merely the tooltip or animation.
12. Relog and change classes to verify acquired state and registry construction remain safe.

### Port the pattern to another custom class

Do not copy the Assassin numeric range or class-specific guards blindly. For a
new class, make one explicit source-of-truth list containing its action IDs,
levels, donors, names, help, recasts, costs, registry classes, and combo links,
then make every layer consume or test that list.

At minimum, replace or add all of the following:

- a separately audited unused command/trait range;
- the SQL `classJob` value and unique namespaced Lua filenames;
- `gameCommandBasic` class byte 4 and level byte 8;
- the new class branches in `getClassCommandTbl`, `setClassAction`, and
  `setSpecialSkill`;
- the `/StaticActor.san` ID-to-client-class records;
- server permission/range checks and deterministic level reconciliation;
- safe post-initialization `commandAcquired` synchronization;
- class-specific combo tests, including both branches and level boundaries;
- complete-overlay merge and active-launcher deployment paths.

Keep special behavior scoped to the new class. Assassin's Hide branch,
dagger restrictions, and early-login quarantine ordering are useful examples,
not universal mechanics. The reusable native combo contract is the SQL graph,
landed-result ordering, `SetCombos`, acquired state, and matching client rows.

## Current Trait Table

All client trait IDs map to
`/Command/Game/Constance/CmnConstance`. A nonzero server modifier is applied by
the ordinary battle-trait stat calculation. A modifier-zero row is a mechanical
unlock that the relevant action script checks with `caster.HasTrait(id)`.

| ID | Lv. | Trait | Server implementation |
| ---: | ---: | --- | --- |
| 29761 | 1 | Triple Attack I | Modifier 138, +3% Triple Attack. |
| 29762 | 8 | Enhanced Physical Attack Power I | Modifier 17, Attack Power +8. |
| 29763 | 12 | Auto Attack Speed Up I | Modifier 59, dagger auto-attack delay -5%. |
| 29764 | 16 | Triple Attack II | Modifier 138, an additional +4% Triple Attack. |
| 29765 | 20 | Enhanced Shade Shift | Scripted; Shade Shift evades three physical attacks instead of two. |
| 29766 | 24 | Enhanced Hide | Scripted; Sneak Attack and Trick Attack gain 5% damage when launched from Hide. |
| 29767 | 28 | Enhanced Sneak Attack | Scripted; Sneak Attack damage +10%. |
| 29768 | 36 | Auto Attack Speed Up II | Modifier 59, an additional -5% dagger delay. |
| 29769 | 40 | Enhanced Trick Attack | Scripted; Trick Attack damage +10%. |
| 29770 | 44 | Enhanced Debilitation | Modifier 26, enfeebling potency +10. |
| 29771 | 48 | Enhanced Physical Attack Power II | Modifier 17, Attack Power +10. |

The client help text uses short FFXIV 1.0-style wording. For example:

```text
Enhanced Hide
Increases damage dealt by Sneak Attack and Trick Attack while Hide is active by 5%.

Enhanced Physical Attack Power II
Increases attack power by 10.
```

Do not assign a broad stat modifier to a trait whose effect is action-specific.
An earlier Enhanced Sneak Attack prototype used a generic critical modifier,
which would have affected unrelated critical attacks. Its modifier is now zero
and the exact 10% bonus lives in `assassin_sneak_attack.lua`.

## Step 1: Define the Authoritative Server Rows

Add one `server_battle_commands` row per action in
`10_assassin_actions.sql`. Important fields include:

| Field group | What it controls |
| --- | --- |
| `id`, `name`, `classJob`, `lvl` | New ID, unique script name, owner class, and unlock level. |
| `requirements`, target fields, AoE fields | Who can use it and which actors can be targeted. |
| `basePotency`, `numHits`, `positionBonus` | Base damage and hit structure. |
| `statusId`, `statusDuration`, `statusChance` | Ordinary applied status data. |
| `castType`, `castTime`, `recastTime`, `mpCost`, `tpCost` | Authoritative cost and timing. |
| animation fields | Server result, model, effect, and battle animation presentation. |
| `comboId1`, `comboId2`, `comboStep` | Combo successors and step number. |
| `commandType`, `actionType`, `actionProperty` | Which server execution state and behavior family handles the command. |

Every action name is namespaced, such as `assassin_goad` or
`assassin_shadow_fang`. The loader uses that name to find the independent Lua
file under the matching command-type folder.

Do not rely on the donor SQL row for special behavior. Clone values that are
actually useful, then explicitly set class, level, targets, potency, costs,
recast, statuses, command type, and combo links.

### Values duplicated on the client

The server is authoritative during execution, but the client displays its own
copies of several values. Keep these synchronized:

| Value | Server source | Client source |
| --- | --- | --- |
| Level | SQL `lvl` | `COMMAND_LEVELS`, `gameCommandBasic` byte 8, and the widget list. |
| Recast | SQL `recastTime` | `COMMAND_RECAST_SECONDS`, written as a little-endian float at byte 17 of `gameCommandBasic`. |
| TP cost | SQL `tpCost` | `COMMAND_TP_COSTS`, written as a little-endian signed 16-bit value at byte 23. |
| Class | SQL `classJob=13` | `gameCommandBasic` byte 4 and the widget class branch. |
| Icon | Client only | `gameCommandBasic` bytes 0-3 plus the corresponding icon resource. |

If the action works but the detail window shows the donor cooldown or cost,
the client `gameCommandBasic` row is stale.

## Step 2: Implement Independent Lua Mechanics

Create a real script for every SQL name:

```text
commandType = ability     -> Data/scripts/commands/ability/<name>.lua
commandType = weaponskill -> Data/scripts/commands/weaponskill/<name>.lua
```

The usual callbacks are:

```lua
function onAbilityPrepare(caster, target, ability) return 0; end
function onAbilityStart(caster, target, ability) return 0; end
function onSkillFinish(caster, target, skill, action, actionContainer)
    action.DoAction(caster, target, skill, actionContainer);
end
```

Weaponskills also provide `onSkillPrepare`, `onSkillStart`, and `onCombo`.

Examples of behavior that required custom mechanics:

- Shade Shift forces `caster` as both source and target and selects two or
  three dodge charges based on trait `29765`.
- Sneak Attack guarantees a critical hit, gains full damage from the rear or
  Hide, applies a 20% wrong-position penalty, and consumes Hide.
- Trick Attack gains its positional bonus from the front or Hide and consumes
  Hide.
- Enhanced Hide applies a separate 1.05 multiplier only when Sneak Attack or
  Trick Attack is launched from Hide.
- Assassinate rejects targets above 20% HP.
- Steal performs a non-damaging loot-table attempt, with rear/Hide advantage.
- Aura Steal deals damage, chooses a stealable visible beneficial effect, always
  dispels it, and has a 50% chance to grant the Assassin a 60-120 second copy.
- Hide toggles its own status and randomly selects a 45-65 second duration.
- Whirlwind Edge is forced to the player as a self-centered enemy AoE.
- Goad uses a self-centered 20-yalm party AoE and a 20-minute recast.

The Aura Steal implementation required server helpers in `StatusEffect.cs` and
`StatusEffectContainer.cs` to find a stealable effect, copy it with an
independent timed duration, and remove the enemy copy safely.

Guaranteed critical actions use the `BattleCommand.guaranteedCritical` field
and the corresponding check in `BattleUtils.cs`. This is preferable to
temporarily inflating the player's global critical rate.

## Step 3: Route the New Client Command Classes

The static-actor registry selects a client Lua command class, but that shared
class must still dispatch the custom ID into the correct server execution
state.

The implementation uses:

- `CmnAttackWeaponSkill.lua` for the custom weaponskill-compatible actor;
- `AttackCommand.lua` for rows using the generic attack actor;
- `GathererStealthAbility.lua` for Hide's Stealth I presentation;
- the retail common ability actor for ordinary abilities.

The shared bridges look up the new ID in `server_battle_commands`, inspect its
authoritative command type, and call one of:

```lua
player.WeaponSkill(commandId, targetActor)
player.Ability(commandId, targetActor)
player.Cast(commandId, targetActor)
player.Engage(targetActor)
```

This shared bridge is not the action mechanic. It only transports the custom
ID into the server state that loads the action's unique namespaced Lua file.

Self-targeting needs special care. Hide calls
`player.Ability(29747, player.Id)`, Shade Shift executes
`action.DoAction(caster, caster, ...)`, Whirlwind Edge calls
`player.WeaponSkill(29758, player.Id)`, and Goad's `Ability` bridge starts the
party circle on `player.Id`. This prevents an enemy selection from redirecting
or invalidating those actions while still preserving each resolved Goad party
recipient in `assassin_goad.lua`.

## Step 4: Build Genuine Client Command Rows

`build_assassin_action_overlay.py` appends 30 rows: 18 actions, 11 traits, and
one hidden Trust castbar presentation row. It clones animation-compatible donor
rows, then replaces the fields that must belong to Assassin or the Trust cast.

The builder also patches the existing universal Quickstride row `27415` to use
packaged icon `30998` from `icons/quickstride.png`. Quickstride is the shared
Sprint action for all combat classes/jobs plus Disciples of the Hand and Land;
the separate Assassin action Flee is not changed by this icon override.

The final row, `29772`, duplicates Raise's visuals but resolves the action name
as `a Trust`. Its `gameCommandBasic` timing is explicitly patched to a 3-second
cast and a 0-second recast. It shares this writer because command DAT overlays
are whole-table replacements and the Assassin overlay already owns the files.

The three fixed command sheets are:

| Sheet | Data/range/offset files | Row size |
| --- | --- | ---: |
| `command` | `data/01/03/00/8E.DAT`, `8F.DAT`, `90.DAT` | 11 |
| `gameCommand` | `data/01/03/00/EA.DAT`, `EB.DAT`, `EC.DAT` | 180 |
| `gameCommandBasic` | `data/01/03/04/B5.DAT`, `B6.DAT`, `B7.DAT` | 26 |

Localized name/help rows are appended to German, English, French, and Japanese
command-text triples under `data/0B/45/06`. The current prototype deliberately
uses the same English FFXIV 1.0-style text in all four sheets so every client
locale resolves the custom ID.

The builder must update all three parts of each sheet:

1. append the row bytes to the data DAT;
2. extend the enabled ID range;
3. rebuild the boundary/end-offset table.

Appending only the data bytes is not enough. A stale range or terminal offset
can make the last row invisible or cause the client to read across a row
boundary.

The command-help line break token is encoded as `[@CR]`, whose client bytes are
`71 63 72 70`. The builder also includes the recovered character codes for
digits, punctuation, hyphens, and `%`, which are needed for concise trait help
such as `3%`, `5%`, and `Attack Power +10`-style values.

Edit these structures together when adding or changing content:

```text
ACTIONS
TRAITS
COMMAND_LEVELS
COMMAND_RECAST_SECONDS
COMMAND_TP_COSTS
```

Then rebuild:

```powershell
python tools/actions/build_assassin_action_overlay.py
```

The builder emits the DAT tree, Shade Shift icon, preview, and a manifest under
`docs/dat_mods/assassin/action_overlay`.

## Step 5: Extend `/StaticActor.san`

This was the missing layer behind the login and job-switch crashes.

The retail command registry is logically `/StaticActor.san` and is installed
as:

```text
client/script/rq9q1797qvs.san
```

Retail ended at command ID `29742`. DAT rows `29743+` could render in the
Actions & Traits page, but when a new ID entered `charaWork.command`, the client
had no ID-to-class mapping from which to construct a command object.

The recovered registry format is:

```text
"sane"
uint32_be(decoded_payload_length + 4)
0xFF
uint32_be(record_count) XOR 0x73737373
XOR-0x73 records...
```

Each decoded record is:

```text
uint32_be(command_id)
UTF-8 client class path
0x00
```

The safe builder preserves the verified 2,812-record retail prefix byte for
byte, refuses duplicate IDs or unknown appended records, adds the selected
range, then decodes its own output and verifies the round trip.

Build the full action-and-trait registry with:

```powershell
python tools/actions/build_assassin_static_actor_registry.py `
  --mode full `
  --output docs/dat_mods/assassin/static_actor_registry/full
```

The output contains both forms required at runtime:

```text
client/script/rq9q1797qvs.san
staticactors.bin
```

The same generated bytes must be deployed to the client overlay and to
`Map Server/bin/Release/staticactors.bin`. Adding a new action or trait requires
extending `ASSASSIN_CLASS_PATHS`, the full-mode ID range, and the server's
Assassin command constants.

## Step 6: Patch Actions & Traits and the Hotbar

`ActionSettingWidget` uses three separate class-specific lists:

| Function | Purpose |
| --- | --- |
| `getClassCommandTbl` | Recognizes which IDs belong to the class. |
| `setClassAction` | Renders `{commandId, level, ...}` pairs in Class Actions. |
| `setSpecialSkill` | Renders `{traitId, level, ...}` pairs in Traits. |

The Assassin branches are generated by
`build_newjobs_actionsettingwidget_overlay.py`. Rebuild the staged widget with:

```powershell
python tools/actions/build_newjobs_actionsettingwidget_overlay.py `
  --output-lpb docs/dat_mods/assassin/widget_overlay/client/script/n1635q/97q1vwr5qq1w3n1635q.le.lpb `
  --decoded-out docs/dat_mods/assassin/widget_overlay/decoded/actionsettingwidget.no_x_custom_jobs.luac
```

When the eleventh trait was added, the injected Lua prototype needed registers
through register 26. The builder therefore enforces a `max_stack_size` of at
least 27 for the trait branch. Adding list entries without expanding the Lua
stack metadata can corrupt the chunk and crash when the class page loads.

The same widget patch fixes Additional Action removal. Double-clicking an
equipped Additional Action now finds its visible slot and sends the ordinary
command-ID-zero removal request. Server-side `EquipAbilityCommand.lua` checks
the slot type:

- actions from another class are removable;
- actions belonging to the current class/job are protected;
- Assassin has five Additional Action slots at level 50;
- only Flee is intentionally cross-classable from the Assassin kit.

The server reconciles level-appropriate Assassin actions into open live hotbar
slots on login, level change, and class change. It removes actions above the
current level. Traits never enter the usable hotbar.

### Deterministic hotbar restoration plus normal acquisition state

Persisted Assassin hotbar rows are still skipped during the early database
restore and logged as `assassin-session-only`. That quarantine prevents a
custom command from entering `charaWork.command` before the client has
completed initialization.

After the complete command DATs and `/StaticActor.san` registry are available,
`EnsureAssassinCommandsForCurrentLevel` deterministically rebuilds the live bar
from class level and SQL progression. It also permits the ordinary
`commandAcquired` state to reach the initialized client. `MarkCommandAcquired`
sets the safe in-range property, and hotbar/init packets serialize it alongside
the command slot. This later acquired update is required by native
command-aware features, particularly combo highlighting.

Keep both halves of the policy:

- quarantine custom rows during early persisted login restoration;
- mark and send acquired state only after the client rows, registry, class,
  level, and live hotbar command are valid.

Returning to a permanent “never acquired” policy can make combos execute
without a glow. Sending acquisition too early or for an unregistered ID can
restore the old login/job-switch crash.

## Step 7: Add Status Rows, Status Icons, and Special Effects

A server status is not automatically visible in the 1.x client. Visible custom
statuses need both sides:

| Status | Server ID | Client icon | Behavior |
| --- | ---: | ---: | --- |
| Shadow Fang | 223271 | 10300 | Visible enemy bleed with a custom purple icon. |
| Hide | 223272 (server), 223201 (client presentation) | 10156 | Distinct Assassin logic presented through native Stealth I so the client activates its hard-bound translucent-character renderer. |
| Shade Shift | 223195 | 10301 | Dedicated visible dodge-charge status using the supplied Shade Shift artwork. |
| Ambush | 223196 | 10072 | Dedicated visible one-shot status using the retail Attack Up icon. |

The SQL rows live in `10_assassin_actions.sql`; their mechanics live under
`Data/scripts/effects`. The client rows and icons are built with:

```powershell
python tools/actions/build_assassin_shadow_fang_status_overlay.py
```

Hide uses its own server status rather than modifying retail Stealth IV. The
server status remains `AssassinHide` (`223272`) for combat, ordinary-sight, and
True Sight rules, but `StatusEffect.GetStatusId()` publishes native Stealth I
(`223201`) in the player's client status slot. Cloning Stealth's DAT row alone
does not fade the model because the 1.x client binds that renderer to the
native numeric status ID. Status gain/loss battle results must use the same
client presentation ID as the status slot; sending `223272` in the result and
`223201` in `charaWork.status` makes the client reconcile two apparent effects
and visibly delays the Stealth fade.

Packet order matters as well. The native Stealth command presentation lasts
three seconds, and the client defers a status-slot update received after that
command result until the presentation completes. Hide flushes its pending
`charaWork.status` and timer delta immediately before its battle-result packet,
so translucency begins with the Stealth animation rather than after it.

Hide lasts a random 45-65 seconds and ends on reuse, a hostile attack, Sneak
Attack, Trick Attack, death, zone, logout, or class change. Ordinary
sight-detecting monsters cannot detect it; monsters carrying True Sight can.
After Hide's action-result packet, `Character.DoBattleCommand` publishes Sneak
Attack and Trick Attack as its two native combo follow-ups. Do not publish this
pair from the status `onGain`: that callback runs before the starter result and
the 1.x client can ignore the early transition. The branch and native Combo
status icon begin immediately after Hide and expire together after 15 seconds,
even if concealment remains. When another hostile attack breaks invisibility
before that deadline, the branch receives a fresh ordinary 15-second grace
window. Either finisher consumes the branch and
receives its combo hit effect even if translucency has already ended.

Shade Shift uses dedicated status `223195` and `assassin_shade_shift.lua`.
Its pre-action and evade callback flags force physical misses and consume one
charge per evaded attack. Ambush uses dedicated status `223196`; its effect
script explicitly loads `battleutils` so `ActionType.Physical` is available.

## Step 8: Icons and Class Terminology

The command DAT builder preserves donor icon metadata unless a packaged custom
icon explicitly overrides it.

Current custom presentation:

- Shade Shift uses custom action icon ID `30999` at
  `data/1C/5C/03/E7.DAT`;
- Shade Shift status uses custom status icon ID `10301` at
  `data/1C/5A/01/2D.DAT`;
- Shadow Fang status uses custom status icon ID `10300` at
  `data/1C/5A/01/2C.DAT`;
- Hide's action uses the Stealth I donor presentation;
- Hide's status uses retail Stealth status icon `10156`;
- Ambush status uses retail Attack Up icon `10072`;
- the Assassin class icon maps native class ID `13` to custom handle `1152`.

The client previously displayed class 13's retail placeholder terminology as
`Dark Arts`. The complete overlay includes the class/skill-name DAT rows that
present it as Assassin instead.

When allocating a custom icon ID, first confirm that the handle is unused and
write the GTEX to the correct family/handle path. Merely changing the numeric
icon ID in `gameCommandBasic` produces a missing or undefined icon if the GTEX
resource does not exist.

## Step 9: Weapons and the Dual-Wield Failure

The class originally used a Dual Wield trait and allowed an Assassin dagger in
both hand slots. Equipping the second dagger consistently made the player
T-pose, and the broken pose could persist across class changes until the hand
appearance was rebuilt.

The working policy is:

- Assassin daggers use main-hand equip point `37` only;
- the equip script rejects the generated Assassin dagger range in the second
  weapon slot;
- no Assassin Dual Wield policy is registered;
- loaded equipment rebuilds main-hand appearance before any offhand
  appearance;
- Triple Attack I and II provide the intended multi-hit class identity.

Do not re-enable Assassin offhand equipment unless a correct client model,
motion, and weapon-class combination has been proven on login, zone, and class
change.

## Complete Build and Deployment Order

Use this order when action/trait IDs, levels, registry classes, or client rows
change.

### 1. Rebuild the client staging outputs

```powershell
python tools/actions/build_assassin_action_overlay.py

python tools/actions/build_assassin_shadow_fang_status_overlay.py

python tools/actions/build_newjobs_actionsettingwidget_overlay.py `
  --output-lpb docs/dat_mods/assassin/widget_overlay/client/script/n1635q/97q1vwr5qq1w3n1635q.le.lpb `
  --decoded-out docs/dat_mods/assassin/widget_overlay/decoded/actionsettingwidget.no_x_custom_jobs.luac
```

Merge the generated `data` and `client` trees into
`docs/dat_mods/assassin/complete_overlay`. Preserve the complete manifest's
class-name policy and the status, gear, class-name, and icon files; do not
replace the entire complete pack with only the action-overlay manifest.

### 2. Run package tests

```powershell
python -m unittest `
  tools.assassin.test_assassin_package `
  tools.actions.tests.test_build_assassin_static_actor_registry
```

The tests validate ID collisions, levels, costs, recasts, combo links, Lua
scripts, registry ranges, widget traits, status rows/icons, hotbar restrictions,
and the no-offhand policy.

### 3. Load SQL in order

Import these files after the base database:

```text
00_assassin_schema.sql
10_assassin_actions.sql
20_assassin_traits.sql
30_assassin_weapons.sql
```

The action and trait tables are cached by the Map Server at startup, so a live
SQL update is not sufficient by itself.

### 4. Stop and rebuild the Map Server

Stop the exact Release Map Server process, then build:

```powershell
dotnet build "Map Server/Map Server.csproj" -c Release --no-restore
```

Build first, then generate and copy the registry. A build can refresh the
Release output from its ordinary source assets.

### 5. Generate and deploy the full registry

```powershell
python tools/actions/build_assassin_static_actor_registry.py `
  --mode full `
  --output docs/dat_mods/assassin/static_actor_registry/full

Copy-Item `
  -LiteralPath 'docs/dat_mods/assassin/static_actor_registry/full/staticactors.bin' `
  -Destination 'Map Server/bin/Release/staticactors.bin' `
  -Force
```

Copy the matching `client/script/rq9q1797qvs.san` into the complete overlay and
the launcher's active Assassin overlay.

This launcher currently also has an older organizational folder named
`AssassinRegistryPilot`. Overlay labels are ignored during path matching, and
the log has shown that folder winning the registry redirect. Until it is
retired, keep its `rq9q1797qvs.san` byte-identical to the main Assassin copy.
Likewise, keep any duplicate `ActionSettingWidget` copy in `NewJobs`
byte-identical so overlay precedence cannot load an older list.

### 6. Start the Map Server and verify startup

Start the exact Release executable with its Release directory as the working
directory. The expected log includes:

```text
Battle command cache updated
Loaded 88 battle traits
Map Server has started @ 0.0.0.0:1989
```

The trait count can change as unrelated traits are added; the important check
is that startup succeeds and the new rows are present in the loaded database.

### 7. Fully restart the game client

The command sheets, icons, Lua widget, and static-actor registry are cached by
the client. Logging out or changing class is not enough after these assets
change. Exit the game process completely and relaunch through the overlay.

Confirm redirects in:

```text
Windower/Logs/Windower.log
```

The registry redirect must resolve to the newly built 110,105-byte full file,
and the widget redirect must resolve to the current Assassin-patched LPB.

## Verification Checklist

After a full client restart:

1. Log in on a retail class first and verify normal idle/combat animation.
2. Switch to Assassin and confirm there is no client crash.
3. Open Actions & Traits and confirm all 18 Class Actions and 11 Traits.
4. Verify the levels: actions `1..50`; traits at
   `1, 8, 12, 16, 20, 24, 28, 36, 40, 44, 48`.
5. Use `!setlevel 1` and `!setlevel 50` and confirm the live hotbar is
   reconciled without duplicate actions.
6. Verify action names, 1.0-style help, icons, recasts, and TP costs.
7. Execute every action and confirm the expected unique server script runs.
8. Test combo glows and both finisher branches.
9. Confirm Shadow Fang and Hide status icons and help text.
10. Confirm Shade Shift evades two attacks, then three with its trait.
11. Confirm Enhanced Hide gives Sneak/Trick an additional 5% only from Hide.
12. Equip five actions from other classes, then double-click them to remove
    them. Confirm native Assassin actions cannot be removed.
13. Confirm Assassin daggers can only occupy the main hand and no class
    T-poses after login or class change.

## Troubleshooting Guide

| Symptom | Most likely cause |
| --- | --- |
| Action appears in Actions & Traits but crashes when equipped or when Assassin loads | Missing/stale `rq9q1797qvs.san` record, wrong registry class path, or an older overlay copy winning the redirect. |
| Only one pilot action appears | Pilot registry/widget output was deployed instead of `--mode full` and the full class lists. |
| Class Actions or Traits section is empty | Missing/overridden `ActionSettingWidget` Assassin branch. |
| Crash began after adding another trait | Lua injected register count exceeded `max_stack_size`, or the trait was omitted from the static registry. |
| Action displays but does nothing | Its client command class did not route the ID into `Ability`/`WeaponSkill`, SQL command type is wrong, or the namespaced Lua file is missing. |
| The donor action executes instead | The retail donor ID or donor SQL name was reused instead of a genuine new ID/name. |
| Tooltip shows the wrong recast | `gameCommandBasic` byte-17 float was inherited from the donor. |
| Tooltip omits its recast/cost rows | `gameCommandBasic` field 119 (byte 25) was inherited as a nonzero compact-help flag. Set it to zero for full action details. |
| Tooltip shows the wrong TP cost | `gameCommandBasic` byte-23 signed value was inherited from the donor. |
| Tooltip shows `[@CR]` literally or has broken lines | A literal string/newline was written instead of passing `[@CR]` through `assassin_text_payload`, or the active overlay contains an older text DAT. |
| Tooltip names the combo but no bonus occurs | Help text is presentation only; the SQL graph or continuation `onCombo` callback is missing. |
| Action/trait is shown at the wrong level | SQL `lvl`, `COMMAND_LEVELS`, `gameCommandBasic` byte 8, and the widget pair list disagree. |
| Combo bonus works but no button glows | The follow-up is not marked/sent in `commandAcquired`, is absent from the live hotbar, is incompatible, or lacks a valid client command/registry row. |
| Wrong actions glow | The previous command's SQL `comboId1`/`comboId2` links are wrong, stale SQL remains cached, or custom code overwrote `playerWork.comboNextCommandId`. |
| Glow appears late | `SetCombos` was published before the landed command-result packet instead of afterward. |
| Combo only works from one direction | A generic SQL `positionBonus` gated combo recognition; move the optional positional damage check into the action Lua. |
| Combo icon does not appear | `SetCombos` did not add native status `223205`, the class guard rejected the current class, or the pending status delta was not flushed. |
| Combo icon refresh clears the chain | `combo.lua` still calls `owner:SetCombos()` from `onLose`, recursively clearing the follow-up during remove-and-add refresh. |
| Combo never expires | The class-specific expiration path is not processing, or a special branch keeps refreshing the 15-second window. |
| Starter misses but successors glow | Runtime code advanced the graph without requiring `hitTarget`. |
| Self-buff fails while an enemy is selected | The client bridge or action finish callback used the selected actor instead of the caster. |
| Shade Shift applies but never evades | The status is missing its pre-action callback flag or its magnitude/charge count is wrong. |
| Hide status exists but enemies still ignore no detection rules | AI sight logic is not checking `AssassinHide`, or the target has True Sight. |
| Status mechanic works but no icon/help appears | Server status exists, but the client status row/text/icon DAT is missing or stale. |
| Additional Action cannot be removed | Old widget toggle patch or old `EquipAbilityCommand.lua` is active. |
| Class action can be removed | Server slot classification or current-class protection is missing. |
| Character T-poses, including after changing jobs | An Assassin dagger entered the offhand, or loaded hand appearance was reconstructed in the wrong order. |
| All classes feel slower after the patch | Too much work was added to global action acquisition or hotbar refresh paths; keep reconciliation class-scoped and avoid full command scans on ordinary refreshes. |

## Adding the Next Action

When adding another action after `29760`, do all of the following before
testing:

1. Confirm a retail-unused ID and client acquisition-safe index.
2. Add an SQL row with a unique `assassin_...` name.
3. Add the matching independent ability or weaponskill Lua file.
4. Add the action, donor, name, and 1.0-style help to `ACTIONS`; use `[@CR]`
   for `Combo Action` and `Combo Bonus` lines.
5. Add level, recast, and TP values to all three client dictionaries.
6. Add the `{id, level}` pair to `ASSASSIN_ACTIONS` in the widget builder.
7. Add the correct client class path to `ASSASSIN_CLASS_PATHS`.
8. Extend the server action range/constants and permission set where needed.
9. Add status rows, status scripts, and client status assets if applicable.
10. If it participates in a combo, set the previous action's `comboId1` or
    `comboId2`, assign the correct `comboStep`, implement `onCombo`, and verify
    the follow-up's acquired index is safe and serialized.
11. Extend the tests before rebuilding and deploying.

Because traits currently follow the actions contiguously, inserting a new
action inside the existing allocation would require moving every trait ID and
migrating client/server state. Prefer reserving a new audited range or planning
the entire extension before changing the established IDs.

## Adding the Next Trait

For another trait after `29771`:

1. Add the `server_battle_traits` row with class 13 and the intended level.
2. Use a real modifier/bonus for an ordinary passive, or modifier zero for a
   mechanic implemented by an explicit `HasTrait(newId)` check.
3. Add its donor, 1.0-style name, and help text to `TRAITS`.
4. Add its level to `COMMAND_LEVELS` and `ASSASSIN_TRAITS`.
5. Add `/Command/Game/Constance/CmnConstance` to the registry mapping.
6. Extend the server trait last-ID constant.
7. Recalculate the widget Lua register requirement if the injected list grows.
8. Extend tests for the row, level, description, mechanic, widget, and
   registry.

## Final Design Rules

- Client visibility does not prove runtime safety.
- A DAT donor supplies bytes and presentation, not the custom mechanic.
- New IDs need a valid `/StaticActor.san` class mapping.
- Levels, recasts, and costs live in more than one place and must match.
- Combo help text documents a combo; SQL and runtime player state implement it.
- Publish a landed combo result before publishing its next-command IDs.
- A glowable custom command needs valid client rows, a registry class, a safe
  acquired flag, a live compatible slot, and a current `playerWork` combo ID.
- Every action gets its own namespaced Lua file.
- Mechanical traits use explicit `HasTrait` checks; ordinary passives use
  server modifiers.
- Traits stay out of the usable hotbar.
- Current-class actions remain fixed; only Additional Actions are removable.
- Avoid global acquisition/hotbar work when a class-scoped reconciliation is
  sufficient.
- Never deploy an Assassin offhand weapon until the client model path is proven
  not to T-pose.
- Rebuild the server registry after the Release build, deploy matching client
  and server copies, and fully restart the client after asset changes.
