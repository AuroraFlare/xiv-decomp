# Generated Materia Loot

This feature lets content generate a fresh equipment item with optional randomized materia already attached. It is meant for authored content rewards such as Skirmish, treasure chests, special bosses, or event loot.

It does not scan, mutate, or upgrade existing player inventory items. Materia is only rolled while a new reward item is being created.

## Core Flow

1. Content decides to grant an item reward.
2. The server creates a new `InventoryItem` for that reward.
3. Optional materia rolls are evaluated in order.
4. Successful rolls are written into the new item's modifier data.
5. Solo rewards go directly to the item's normal inventory package when the whole quantity fits; party rewards and solo overflow go to the Loot List.
6. When claimed/equipped, the normal inventory, item display, and stat systems read the materia from the item.

If no materia roll succeeds, the player still receives the plain generated item.

## Player Melding After A Generated Reward

Attached reward materia participates in the ordinary player-melding rules:

- The generated slots are already occupied and count toward the five-materia maximum.
- Any player attempt to add another materia is a forbidden meld, so it requires the Augmented Materia Melder and uses the normal failure/destruction behavior.
- The existing attached types and exact grades affect the forbidden-meld success calculation.
- A normally non-meldable catalog item may carry content-authored materia. Only that specific pre-melded instance can be granted permission for further forbidden melds; a plain copy remains non-meldable.
- Content can independently lock further melding and Mutamix removal on each generated item instance.
- A further-melding lock also overrides a catalog item that would normally be meldable. The rejection occurs before materia, catalyst, gear, or gil can be consumed.
- A removal lock prevents both the Mutamix quote/charge and the low-level item clear operation.
- If removal is allowed and all materia is purged, the explicit generated-item policies reset to ordinary catalog behavior.

Content authoring intentionally does not require a catalyst, crafting class, or
the base item's `materiaBindPermission`: those are player-action rules, not reward
construction rules. Newly added player materia must still be compatible with the
equipment's slot.

## Lua Helper

For content scripts, use:

```lua
player:AddGeneratedLootItemWithMateria(
    itemId,
    quantity,
    materiaRollSpec,
    allowFurtherMelding,
    allowMateriaRemoval
);
```

Plain generated loot is also available:

```lua
player:AddGeneratedLootItem(itemId, quantity);
```

The loot helpers use the same routing for plain, materia-bearing, and randomly augmented rewards. Solo delivery checks stack capacity and the item's own storage (including crystals and key items). The Loot List is used when a solo reward does not fit or the player is in a party. Existing shared party drops still require lot resolution; personal overflow is claimable and retains the configured auto-claim retry behavior. Exclusive ownership checks include copies already waiting in Loot.

The destination is selected before generating equipment, so a failed grant is not retried with a second roll. The explicit `AddGeneratedItemToPackage` APIs and deterministic GM `AddGeneratedLootItemWithExactAugments` helper retain their requested destinations.

For an NPC, quest, or exchange reward that should go directly to the item's
normal inventory package, use:

```lua
player:AddGeneratedInventoryItemWithMateria(
    itemId,
    quantity,
    materiaRollSpec,
    allowFurtherMelding,
    allowMateriaRemoval
);
```

Both helpers create a new item instance. They do not add materia to an item the
player already owns. The two booleans are optional and default to `true` for
backward compatibility. A four-argument call controls further melding while
leaving removal enabled; a five-argument call controls both operations.

For example, this grants a normally non-meldable Ifrit's Blade directly from an
NPC with one randomly powered Strength Materia IV already attached:

```lua
player:AddGeneratedInventoryItemWithMateria(
    4030507,
    1,
    "0:4:12-15:100",
    false, -- no additional player melding
    false  -- generated materia cannot be removed
);
```

That particular blade keeps its generated Strength Materia permanently and
cannot receive another materia. A player who tries sees: `The materia melds on
this item prevent any further melding.` A removal attempt reports: `The materia
melds on this item cannot be removed.` A plain Ifrit's Blade remains
non-meldable for its normal catalog reason.

## Roll Spec Format

`materiaRollSpec` is a comma- or semicolon-separated string:

```text
slot:type:grade:chance,slot:type:grade:chance
```

Fields:

- `slot`: materia slot on the generated item, `0` through `4`.
- `type`: internal materia type id from `MateriaType` in `Map Server/DataObjects/ItemData.cs`.
- `grade`: internal materia grade value, or a range such as `0-3`.
- `chance`: roll chance, either `0.0` to `1.0` or `0` to `100`.

Grade mapping:

```text
Tier I   = 0
Tier II  = 4
Tier III = 8
Tier IV  = 12
```

The grade field is the internal grade stored on the item, not the catalog item id.

Grade ranges randomize the materia's power. For example, `0:4:0-3:100` always attaches Strength Materia I, but randomly chooses grade `0`, `1`, `2`, or `3`, which changes the stat value within that tier.

## Multiple Candidates

Multiple entries can target the same materia slot. They are tried in string order until one succeeds for that slot.

Example:

```lua
player:AddGeneratedLootItemWithMateria(8012410, 1, "0:4:0:25,0:5:0:25,1:28:0:10");
```

This creates one Sheepskin Calot and rolls:

- slot `0`: Strength I at 25%
- slot `0`: Vitality I at 25%, only if Strength did not fill slot `0`
- slot `1`: Attack Power I at 10%

Possible outcomes include a plain calot, Strength only, Vitality only, Attack Power only, or one stat materia plus Attack Power.

Power-randomized example:

```lua
player:AddGeneratedLootItemWithMateria(8012410, 1, "0:4:0-3:100");
```

This always attaches Strength Materia I, but the strength value is randomly rolled within the tier I grade range.

## Implemented Materia Type IDs

Generated loot accepts any enum-defined materia type. These are the internal type ids used in roll specs:

```text
1  = HP (Bloodthirst)
2  = MP (Manathirst)
3  = HP and MP (Lifethirst)
4  = Strength
5  = Vitality
6  = Dexterity
7  = Intelligence
8  = Mind
9  = Piety
10 = Strength and Vitality (Ironman's Will)
11 = Strength and Dexterity (Swordsman's Cry)
12 = Vitality and Dexterity (Watchman's Vigil)
13 = Intelligence and Mind (Loresman's Wit)
14 = Intelligence and Piety (Wise Man's Vision)
15 = Mind and Piety (Vestryman's Wit)
16 = Fire Magic Potency
17 = Ice Magic Potency
18 = Wind Magic Potency
19 = Earth Magic Potency
20 = Lightning Magic Potency
21 = Water Magic Potency
22 = Fire Resistance
23 = Ice Resistance
24 = Wind Resistance
25 = Earth Resistance
26 = Lightning Resistance
27 = Water Resistance
28 = Attack Power (Heavens' Fist)
29 = Accuracy (Heavens' Eye)
30 = Attack Magic Potency (Hells' Fist)
31 = Magic Accuracy (Hells' Eye)
32 = Critical Hit Rate (Savage Aim)
33 = Critical Attack Power (Savage Might)
34 = Magic Critical Hit Rate (Sagacious Aim)
35 = Magic Critical Potency (Sagacious Might)
36 = Parry (Battledance)
37 = Gathering (Gatherer's Guerdon)
38 = Perception (Gatherer's Guile)
39 = Output (Gatherer's Grasp)
40 = Craftsmanship (Craftsman's Competence)
41 = Magic Craftsmanship (Craftsman's Cunning)
42 = Control (Craftsman's Command)
43 = Evasion (Bloodflight)
44 = Magic Evasion (Manaflight)
45 = Defense (Bloodwall)
47 = Slow Resistance (Cactuar Foot)
48 = Petrification Resistance (Wyvern Skin)
49 = Paralysis Resistance (Bomb Blood)
50 = Silence Resistance (Pixie Tongue)
51 = Blind Resistance (Coeurl Eye)
52 = Poison Resistance (Aurelia Kiss)
53 = Stun Resistance (Bison Hoof)
54 = Sleep Resistance (Funguar Shriek)
55 = Bind Resistance (Treant Root)
56 = Heavy Resistance (Chocobo Down)
58 = Regen (Bloodflow)
59 = Refresh (Manaflow)
60 = Regain (Mettleflow)
61 = Enmity Plus (Touch of Rage)
62 = Enmity Minus (Touch of Serenity)
65 = Fastcast (Sorcerer's Step)
66 = Haste (Sprinter's Step)
68 = Healing Magic Potency (Healer's Hand)
82 = Critical Attack Power and HP (Sanguinary Might)
83 = Magic Critical Potency and MP (Stellar Might)
84 = Healing Magic Potency and MP (Sound of Serenity)
85 = Enhancement Magic Potency (Sound of Certainty)
86 = Enfeebling Magic Potency (Sound of Suffering)
87 = Block Rate Plus (Swiftwall)
88 = Store TP and Accuracy (Evenflow)
```

Types omitted from the enum are not valid roll-spec targets yet, even if archival pages mention them, because they are either absent from the current client data or marked unsafe/untested in code.

### Negative Values

The recovered 1.0 materia table is almost entirely positive. The implemented
exception is type `62`, Touch of Serenity, whose real values are Enmity `-1`
through `-16`. That negative number is beneficial because it reduces generated
enmity; it is not a cursed penalty.

The current roll-spec system cannot express arbitrary signed augments such as
`HP -20`. It attaches a real materia family and one of that family's recovered
grades, and no implemented HP materia has negative values. Truly cursed/random
stat penalties would require a separate custom-augment value format and
persistent signed modifier storage rather than reusing real materia grades.

## Skirmish Example

A Skirmish chest reward can keep normal reward logic and only opt in for special drops:

```lua
local rewardItemId = 8012410; -- Sheepskin Calot
local result = player:AddGeneratedLootItemWithMateria(
    rewardItemId,
    1,
    "0:4:0:20,0:5:0:20,0:6:0:20,1:28:0:5"
);

if (result == 0) then
    player:SendMessage(0x20, "", "You find a curious piece of gear in the coffer.");
else
    player:SendMessage(0x20, "", "You could not collect the coffer reward.");
end
```

This gives the item a chance to be plain, a chance to receive one basic stat materia, and a small independent chance for Attack Power in the second slot.

## GM Smoke Test

For quick manual testing, use `!testmaterialoot`. With no arguments, it creates a generated Sheepskin Calot with randomized Strength Materia I power, delivered directly when solo with room or placed in Loot for party/overflow cases:

```text
!testmaterialoot
```

Override the item, quantity, or roll spec when testing specific reward setups:

```text
!testmaterialoot 8012410 1 0:4:0-3:100,1:28:0-3:25
```

Use `!invslots normal` for direct solo delivery or `!invslots loot` for party/overflow delivery. Melded entries print as `slot:type:grade`, such as `materia=[0:4:2]`.

Routing regressions run with `dotnet run --project "Fishing Tests/Fishing Tests.csproj" -- --loot-routing-only`. These exercise delivery and rejection using temporary inventory packages; they do not require a database or live client.

## Chest Reward Tuple Path

Guildleve chest rewards can also return materia roll tuples from `Data/scripts/guildleve_chests.lua`.

The return shape is:

```lua
return itemId, quantity, gil, materiaSlot, materiaType, materiaGrade, chance, ...
```

Example:

```lua
return 8012410, 1, 0, 0, 4, 0, 25, 0, 5, 0, 25;
```

That grants a Sheepskin Calot and rolls Strength I or Vitality I into slot `0`.

For randomized power from Lua tuple returns, use a string grade range:

```lua
return 8012410, 1, 0, 0, 4, "0-3", 100;
```

## Optional BNPC Drop Table

Normal BNPC drops still use `server_battlenpc_drop_list`.

To decorate specific generated BNPC drops, add rows to `server_battlenpc_drop_materia`:

```sql
INSERT INTO server_battlenpc_drop_materia
    (dropListId, itemId, quantity, materiaSlot, rollOrder, materiaType,
     materiaGrade, materiaGradeMax, chance, allowFurtherMelding, allowMateriaRemoval)
VALUES
    (12345, 8012410, 1, 0, 10, 4,  0, 3, 25, 0, 0),
    (12345, 8012410, 1, 0, 20, 5,  0, 3, 25, 0, 0),
    (12345, 8012410, 1, 1, 10, 28, 0, 0, 10, 0, 0);
```

The row must match the `dropListId`, `itemId`, and `quantity` from `server_battlenpc_drop_list`. If the optional materia table is missing, normal BNPC drops continue working as plain drops.

For exact power, set `materiaGradeMax` equal to `materiaGrade`. For randomized power, set `materiaGradeMax` higher. A tier I range is usually `0` to `3`, tier II is `4` to `7`, tier III is `8` to `11`, and tier IV is `12` to `15`.

`allowFurtherMelding` and `allowMateriaRemoval` default to `1`. Set either to
`0` to lock that operation on generated copies that actually receive at least
one materia. Keep the values consistent across all rows for one drop. If rows
disagree, deny (`0`) wins so a later permissive row cannot weaken a lock.

## Boundaries

- Materia rolls only apply to generated equipment items.
- Stackable/non-equipment rewards ignore materia rolls and are granted normally.
- Existing player inventory items are never modified by this feature.
- If multiple generated copies are granted, each copy rolls materia independently.
- This does not enforce real melding catalysts, class level, success rates, or overmeld rules. It is a content reward generation system, not the player melding UI. See `docs/materia_melding_mechanics.md` for the current 1.0 retail mechanics reference.
- Once generated, attached materia is handled by the real equipment/stat and player-melding paths; the preceding boundary applies only while the reward instance is being constructed.
