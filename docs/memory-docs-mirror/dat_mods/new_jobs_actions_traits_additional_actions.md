# New Jobs Actions, Traits, Icons, and Additional Actions

Generated: 2026-06-19

## Short Answer

Yes, we can fill the new jobs' Actions & Traits page with real actions, traits, names, icons, levels, and help text once we choose the command IDs and client DAT rows.

Yes, those actions can also be made available through Additional Actions, but that has one extra requirement: the Additional Actions class selector currently expects the retail battle-class buttons. To expose Fencer, Assassin, Arcanist, and the other new classes as selectable source classes, we need to patch the selector/button logic or intentionally map those actions through an existing selectable class.

Traits can be displayed in the Traits section. They should not normally be placed in Additional Actions unless we intentionally fake a trait as an active command.

## Current State

The current `NewJobs` overlay patches `ActionSettingWidget` so unknown class IDs fall through to the widget's existing empty-list path. That hides the red X placeholder controls.

Overlay path:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\NewJobs\client\script\n1635q\97q1vwr5qq1w3n1635q.le.lpb
```

Builder:

```text
C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\tools\actions\build_newjobs_actionsettingwidget_overlay.py
```

Right now, the patch hides empty/unknown class lists. The next version would replace those empty lists with class-specific command/level tables.

## Character Select Compatibility

The character-select screen is a separate lobby/native surface from `ActionSettingWidget`. It can resolve at least some unreleased class text rows, such as `Assassin`, but the native select flow still trips a generic client-side popup:

```text
15001 A system error has occurred. (1004)
```

The lobby server now applies a presentation-only donor map when serializing the character-list appearance blob:

```text
Lobby Server/CharacterCreatorUtils.cs
Lobby Server/DataObjects/CharaInfo.cs
```

This keeps the real `mainSkill` value in the database and world-login path, but sends character select a retail class ID for unreleased classes:

| Unreleased class | Sent to character select |
| --- | --- |
| Fencer `5` | Gladiator `3` |
| Enforcer `6` | Marauder `4` |
| Musketeer `9` | Archer `7` |
| Sentinel `10` | Gladiator `3` |
| Samurai `11` | Lancer `8` |
| Stavesman `12` | Conjurer `23` |
| Assassin `13` | Pugilist `2` |
| Flayer `14` | Lancer `8` |
| Mystic `21` | Thaumaturge `22` |
| Arcanist `24` | Conjurer `23` |

This should stop the select-screen crash/error path, with the tradeoff that the character card shows the donor class name and icon until the native select-screen validator/presenter is patched.

The cleaner version likely does require more decomp or native hook work. The error does not appear to be sent by the Meteor lobby server; it looks like a client-side validation/presentation failure after the select screen sees an unreleased class ID.

## How Actions Render

`ActionSettingWidget.setClassAction(classId)` drives two UI surfaces:

| Call shape | UI surface | Button prefix |
| --- | --- | --- |
| `setClassAction()` | Current class Actions list | `Button_ClassAction_` |
| `setClassAction(selectedClass)` | Additional Actions list for a selected source class | `Button_AddAction_` |

The list format is:

```lua
{ commandId, requiredLevel, commandId, requiredLevel, ... }
```

Example shape:

```lua
-- Fencer example shape, not final tuning.
{ 26792, 1, 26798, 8, 26802, 15, 26805, 20, 26814, 32 }
```

The widget then calls `setIconList(...)`, which:

- shows one slot per command/level pair;
- greys out commands above the player's level;
- stores the command ID on the button;
- marks equipped commands as selected;
- hides all remaining unused slots.

## Icons, Names, and Help Text

Yes, icons can show.

The widget does not directly hardcode icon IDs in `ActionSettingWidget`. It hands the command ID to the client command/text data path:

```lua
setText("<button>:TextBlock_CommandData", 10214, commandId, 36)
```

So the visible name/icon/help comes from the client command DAT rows. For good UI, each command ID needs client-side command metadata:

| Needed data | Why |
| --- | --- |
| command row | lets the client recognize the command ID |
| gameCommand/gameCommandBasic rows | supplies command UI behavior and detail data |
| localized command text rows | supplies name/help text |
| icon ID | supplies the visible action icon |

If a command row has icon `30000` or missing metadata, it may show a generic/placeholder icon. Reusing an existing icon ID is easiest. Custom icon art is possible too, but then we also need to add or replace the underlying icon asset DATs.

The existing custom Gladiator action package is the closest pattern:

```text
C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\tools\actions\build_custom_gladiator_action_dats.py
```

That generator clones donor command DAT rows, changes command IDs/names/icons/text, and pairs them with server SQL.

## Server Side Still Matters

The client list only makes the UI look right. The server decides whether an action works.

For each action we need:

| Layer | Requirement |
| --- | --- |
| Client ActionSettingWidget | command appears in class/additional-action list |
| Client command DAT rows | command name, icon, help text, UI metadata |
| Server `server_battle_commands` | action executes, has range/cast/recast/cost/effect |
| Server scripts/effects | special behavior such as steal, poison, bind, pet/distaff logic |
| Permission/acquisition | player can equip/use the action at the intended level/class |

## Additional Actions

Additional Actions are possible, but there are two cases.

### Case 1: Show A New Job's Own Actions

This is the easier path.

When the player is currently Fencer/Assassin/Arcanist/etc., `setClassAction()` can show that class's own action list in the main Class Actions section.

Needed:

- add the class ID branch/list to `setClassAction`;
- add the command IDs to `getClassCommandTbl`;
- make sure each command has client DAT metadata and server behavior.

### Case 2: Use New Job Actions As Cross-Class Additional Actions

This is doable, but needs more than just adding command IDs.

The battle Additional Actions selector calls:

```lua
setAddClassButtonVisible("Button_FighterSorcerer_", 7)
setClassAction(work.selectClass)
```

The `7` is important: the retail widget only expects seven Fighter/Sorcerer source buttons. Those are the original battle classes. To expose new jobs cleanly as Additional Action source classes, we need one of these approaches:

| Approach | Result | Risk |
| --- | --- | --- |
| Replace/repurpose an existing source button | Quick test path for one or a few new jobs | Hides/replaces a retail class in the selector |
| Expand the button logic and form/template | Proper support for more source classes | Requires SQWT form/template work, not just Lua/LPB |
| Map new-job actions through an existing selectable class | Lets actions appear without new selector buttons | Blurs class identity and permission rules |

Even after the button appears, the client/server must agree that the player has permission:

- `checkClassCommandPermission(classId)` must pass;
- the action must be acquired/unlocked at the intended level;
- equip slot limits must allow it;
- `executePlayerEquipAction(...)` must be accepted by the server.

## Traits

Traits are driven separately by:

```lua
ActionSettingWidget.setSpecialSkill()
```

Its list format is also:

```lua
{ commandId, requiredLevel, commandId, requiredLevel, ... }
```

Those entries render in:

```text
Button_PropertyCommand_
Border_Property_
```

Traits can be displayed once we have command IDs/text/icons for them. The actual passive effect must still be implemented server-side. Displaying a trait in the UI does not automatically apply the passive behavior.

Traits should usually stay in the Traits section. If we add them to Additional Actions, they would behave like equipable active commands only if we deliberately implement them that way.

## Candidate Starter Lists

Current live-update SQL already has a small action spine for three classes:

| Class | Class ID | Candidate commands |
| --- | ---: | --- |
| Fencer | `5` | `26792` Red Lotus, `26798` Phalanx, `26802` Spinstroke, `26805` Onion Cut, `26814` Riot Blade |
| Assassin | `13` | `26615` Concussive Blow, `26514` Blindside, `26518` Steal, `26524` Accomplice |
| Arcanist | `24` | `28592` Scourge, `28597` Banish, `28602` Bio |

Direct unreleased anchors also exist for some classes:

| Class | Class ID | Anchors |
| --- | ---: | --- |
| Fencer | `5` | `22106` rapier basic attack |
| Enforcer | `6` | `22107` Bludgeon |
| Musketeer | `9` | `22110` Discharge |
| Sentinel | `10` | `22111` Guard, `22112` Block |
| Arcanist | `24` | `22308` Create Distaff, `22309` Animate Distaff |

Many of those direct anchors have placeholder icon `30000`, so they need donor icons or custom icon data before they look good.

## Recommended Implementation Plan

1. Pick the action list per class: command ID, required level, and whether it should be class-only or cross-class.
2. Patch/clone client command DAT rows so each command has a real name, icon, and help text.
3. Extend the `NewJobs` ActionSettingWidget builder to emit class-specific `setClassAction`, `getClassCommandTbl`, and `setSpecialSkill` lists instead of only hiding empty slots.
4. Add/verify server `server_battle_commands` rows and behavior scripts.
5. Decide Additional Actions policy:
   - class-only first, or
   - replace/expand/add source buttons for cross-class use.
6. Verify in game:
   - own class actions show;
   - icon/name/help render correctly;
   - level gating greys out high-level actions;
   - equip/unequip works;
   - action execution works;
   - traits display and apply if implemented.

## Practical Recommendation

Do class actions first, with reused donor icons and text rows. That gives the highest payoff with the least UI risk.

After that, add Additional Actions support in a separate pass. The clean version probably requires expanding the selector beyond the retail seven battle-class buttons, while the quick test version can repurpose a button or temporarily map actions through an existing class.
