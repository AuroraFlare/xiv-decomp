# Per-Instance Item Augments

This implements FF11-style Dark Matter augments. It reuses existing equipment catalog rows but stores the rolls on each individual `serverItemId`. It is mechanically separate from materia and does not consume materia slots or materia stat caps. A client display overlay projects those augments through the stock materia presentation fields so the ordinary item detail can render them.

## Player-visible lifecycle

1. A drop is created as a unique equipment instance in the loot package.
2. Its augment pool rolls between one and five authored stats and persists them immediately.
3. The exact rolled instance can be assigned between party members' loot packages. It remains unbound during this step.
4. Moving the item from loot into any non-loot package sets `BoundByAugment` before the inventory move completes.
5. A bound augmented item is rejected by direct trade, bazaar listing/purchase, and materia-trade escrow. The normal client exclusive tag is also set on that instance.

An NPC may instead augment an existing item in normal inventory. That operation binds the selected instance immediately. Other copies of the same catalog item are not affected.

## Database setup

A fresh import automatically includes `Data/sql/server_item_augments.sql`. For an existing database, import these in order:

1. `Data/sql/runtime_schema_updates.sql`
2. `Data/sql/server_item_augments.sql`

The first adds `server_items.instanceFlags`; the second creates definitions, pools, pool entries, item eligibility, BNPC drop mappings, and per-instance augment rows.

Assign an existing catalog item to a pool without cloning it:

```sql
INSERT INTO server_item_augment_eligibility (catalogId, poolId)
VALUES (8012410, 1)
ON DUPLICATE KEY UPDATE poolId = VALUES(poolId);
```

Make a specific BNPC drop roll that pool. `chance` is a zero-to-one probability evaluated independently of the ordinary drop entry:

```sql
INSERT INTO server_battlenpc_drop_augments
  (dropListId, itemId, quantity, poolId, chance)
VALUES
  (1001, 8012410, 1, 1, 0.25);
```

`equipmentSlotMask = 0` means all equipment points. Otherwise bit `equipPoint` selects an allowed equipment point. `jobMask` is persisted for future authored job filtering but is not currently evaluated.

The seeded general Dark Matter pool rolls every augment across the full `-20…-1` and `+1…+50` range. Individual future pools can narrow `minimumRoll` and `maximumRoll` while retaining direct support for every integer inside their authored range.

## NPC-facing API

These methods are exposed on `Player` for the remaining NPC dialogue/menu work:

- `GetInventoryItemAugmentPoolId(slot)` returns the selected normal-inventory equipment's assigned pool, or zero when it is not eligible.
- `AugmentInventoryItem(slot)` rerolls from the item eligibility mapping.
- `AugmentInventoryItemWithPool(slot, poolId)` rerolls from an NPC-selected tier.
- `SetInventoryItemAugments(slot, spec)` replaces rolls with exact values such as `hp:30,haste:3,attack:-8`.
- `GetItemAugmentSummary(packageId, slot)` returns a server-rendered name, stat list, and binding state.
- `AddGeneratedLootItemWithAugments(itemId, quantity, poolId)` creates independently rolled loot instances.
- `TransferLootItemTo(recipient, lootSlot)` assigns the exact instance to another in-area party member without binding it.

All mutating calls return the normal inventory result codes. The NPC should validate/consume its catalyst or currency, call the augment method once, then show `GetItemAugmentSummary`. The roll replacement and bind flags are committed together in one database transaction.

The exact-value syntax accepts one to five comma- or semicolon-separated `code:value` pairs. Every seeded augment accepts every non-zero integer from `-20` through `+50`; zero is reserved for an empty display slot. The client overlay decodes the exact number from the grade byte, so values such as `+11`, `+37`, and `-19` no longer need authored materia-grade ladders. Examples:

```lua
local poolId = player:GetInventoryItemAugmentPoolId(inventorySlot)
if poolId ~= 0 then
    local result = player:AugmentInventoryItem(inventorySlot)
end

local exact = player:SetInventoryItemAugments(
    inventorySlot,
    "hp:30,haste:3,attack:-8"
)
```

The GM command provides an integration harness:

```text
!augmentitem show 12
!augmentitem roll 12 1
!augmentitem set 12 hp:30,haste:3,attack:-8
!augmentitem loot 8012410 1 1
!augmentitem lootset 8012410 1 hp:30,haste:3,attack:-8
!augmentitem lootset 8012410 1 regain:50,parry:10,block:10,additional_effect_disease:5
!augmentitem lootset 8012410 1 additional_effect_slow:5,great_axe_skill:10,cure_potency:8
!augmentitem lootset 8012410 1 critical_hit_rate:10,critical_hit:30,slashing_resistance:10,fire_magic_potency:20,light_magic_potency:20
!augmentitem lootset 8012410 1 craftsmanship:5,magic_craftsmanship:5,gathering:5,output:5,perception:20
!augmentitem give 0 Firstname Lastname
```

`loot` rolls the selected pool. `lootset` (alias `lootexact`) creates deterministic augmented loot using the exact listed grades. Both enter the loot package unbound and bind only when claimed.

## Seeded stat codes

The seed schema defines 97 augment codes. In addition to the original combat/resource effects, the extended families are:

- Critical: `critical_hit_rate`, `critical_hit`.
- Elemental potency: `fire_magic_potency`, `ice_magic_potency`, `wind_magic_potency`, `earth_magic_potency`, `lightning_magic_potency`, `water_magic_potency`, `light_magic_potency`, `dark_magic_potency`.
- Elemental resistance: `fire_resistance`, `ice_resistance`, `wind_resistance`, `earth_resistance`, `lightning_resistance`, `water_resistance`.
- Status resistance: `slow_resistance`, `petrification_resistance`, `paralysis_resistance`, `silence_resistance`, `blind_resistance`, `poison_resistance`, `stun_resistance`, `sleep_resistance`, `bind_resistance`, `heavy_resistance`, `doom_resistance`, `spell_interrupt_resistance`.
- Damage-type resistance: `slashing_resistance`, `piercing_resistance`, `blunt_resistance`, `projectile_resistance`, `sonic_resistance`, `breath_resistance`, `physical_resistance`, `magic_resistance`.
- Crafting/gathering: `craftsmanship`, `magic_craftsmanship`, `control`, `gathering`, `output`, `perception`.
- Direct defense: `defense`.

The remaining seeded codes and their dedicated synthetic materia types are recorded in `docs/dat_mods/item_augments/overlay/item_augment_display_contract.json`.

All seeded definitions permit negative values down to `-20`, including stats that were traditionally positive-only. A negative flat or percentage modifier subtracts through the existing stat pipeline. Mechanics that cannot meaningfully run below zero, such as proc chances and periodic resource gains, retain their existing zero-floor behavior while still storing and displaying the negative roll.

Positive `damage_taken`, `magic_damage_taken`, and `physical_damage_taken` values are reductions; negative values are vulnerabilities. Positive `action_recast` is a recast reduction. `Attack` and `Accuracy` continue to contribute to both melee and ranged physical calculations; `Ranged Attack` and `Ranged Accuracy` add ranged-only values.

The custom mechanics use these server conventions:

- Percentage chances are clamped to 0–100.
- Haste modifies attack delay; Fast Cast modifies spell cast time; Quick Magic can make an eligible spell instant.
- Conserve MP and Conserve TP roll their listed proc chance and save a random 20–50 percent of the positive resource cost.
- Save TP is the minimum retained after a weapon skill. TP Bonus affects weapon-skill scaling without granting spendable TP.
- Damage-taken reductions are capped before the final multiplier so authored values cannot produce negative damage.
- Buff Duration modifies beneficial same-side status durations.
- Regen, Refresh, generic Spikes, Shock Spikes, Counter, and HQ Gear Chance have live runtime hooks.
- Regain restores its listed TP every resource tick (three seconds). `block` adds Block Rate through the existing shield-block formula; a shield is still required.
- Additional Effect: Disease is its listed percentage chance once per landed, damaging auto-attack or weapon-skill command. Poison Resistance reduces that chance and 100 resistance is immune. Because the 1.x client has no status row literally named Disease, a successful proc applies its native disease effect, Bio, for 30 seconds at magnitude 10 (damage over time and Attack Down).
- Additional Effect: Slow, Paralyze, Bio, and Dia use the same once-per-command rule and apply their native 30-second statuses. Slow, Paralysis, and Poison Resistance reduce the corresponding proc chances; Dia has no dedicated resistance stat in this server.
- A successful Additional Effect emits the client's native dark/Umbral weapon-additional-effect impact immediately after the original hit. This is the Shadowsear-like target burst, not a second Shadowsear cast: it adds no damage, attack animation, audio, or duplicate combat-log line.
- Weapon skill augments add directly to the physical combat-skill term only for their matching implemented weapon family. Archery covers the server's ranged Archer, Bard, and Musketeer path; Staff covers Stavesman and all implemented magic classes.
- Elemental, Healing, Enhancing, and Enfeebling Magic Skill feed the server's four native magic potency channels, so existing C# and Lua spell calculations consume them automatically.
- Cure Potency increases healing dealt and Healing Received increases healing taken. They are independent percentages applied to the final heal and can be positive or negative.
- Fire, Ice, Wind, Earth, Lightning, and Water Magic Potency feed their matching spell element. Light Magic Potency maps to Astral commands and Dark Magic Potency maps to Umbral commands.
- General Physical Resistance combines with the matching Slashing, Piercing, Blunt, Projectile, Sonic, or Breath resistance in the physical damage multiplier. Magic Resistance and elemental resistances remain in the native magic-defense path.
- Defense adds directly to the native Defense-plus-Vitality physical mitigation pool.
- The status-resistance family is consumed by the native status application and interruption paths. Positive resistance lowers the corresponding application chance.
- Craftsmanship, Magic Craftsmanship, Control, Gathering, Output, and Perception use the server's existing crafting and gathering stat formulas. Control and Perception predated this extension; their definitions were retained rather than duplicated.

## Client display boundary

The display bridge assigns one dedicated synthetic materia type to each augment: IDs 1 through 97 map contiguously to client types 89 through 185. Types 128 through 185 require the overlay's `NormalItemBaseClass` patch, which normalizes signed `integer8` packet values back to 0–255 before item-detail lookup. The updated overlay is mandatory for these custom types.

During inventory serialization, the server translates each `(augmentId, rollValue)` into a transient `(materiaType, materiaGrade)` pair. It writes those pairs to the five stock presentation fields without changing `InventoryItem.modifiers.materiaType`. Server stat calculation continues to read the durable augment rows, so the synthetic display projection can neither apply twice nor become real materia.

Run the deterministic builder against an installed client:

```powershell
python tools/materia/build_item_augment_display_overlay.py
```

The staged DatOverlay package is written to `docs/dat_mods/item_augments/overlay`. It contains:

- One synthetic materia sheet row per augment.
- Four generic `Item Augment I-IV` display-proxy names using the client's existing unused materia catalog placeholders.
- English parameter labels through parameter 15173.
- An extended DesktopWidget item-detail scan through parameter 15173.
- A DesktopWidget materia helper patch that decodes grades 0–49 as `+1…+50`, grades 50–69 as `-1…-20`, and uses a stable proxy icon/name for every encoded grade.
- The existing NewJobs four-class-icon DesktopWidget patch, because both features replace the same LPB target.
- A `NormalItemBaseClass` signed-byte normalization patch for custom materia types 128–185.

Use `--verify-only` to validate the server codec, SQL IDs, installed client layout, generated DAT rows, and LPB patch without writing files. The generated JSON contract records every type, grade, value, parameter ID, and file hash.

The stock packet offers only five materia fields, so the implementation intentionally caps items at five augments. The grade byte is treated as a direct-value transport by the patched widget instead of being limited to the materia sheet's sixteen authored value columns. Real materia and randomized augments are mutually exclusive on one item instance; attempts to augment a melded item or meld an augmented item are rejected. This keeps both UI and mechanics unambiguous.
