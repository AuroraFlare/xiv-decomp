# Custom Dual-Wield Policy

The 1.0 client supports an item being equipped in either arm when its equipment row uses logical `equipPoint` **36**.  The server has an explicit policy on top of that client capability so a second weapon is restricted to the owning class and cannot be forged into another class's offhand.

Assassin and Fencer are enabled today. Assassin receives dual wield innately without spending a trait slot. Both classes have independent one-handed custom weapon rows, and either can attack twice only when both arms contain weapons from that class's configured ranges.

## Add another class

1. Generate the class's weapon rows as independent weapons: set server SQL and client DAT `equipPoint` to `36`, and set weapon `frequency` to `1`.  In the sparse extracted CSV sheets those physical fields are columns `70` and `99`, respectively.
2. Add the class id and its custom weapon class id to `DUAL_WIELD_POLICIES` in `Data/scripts/commands/EquipCommand.lua`.  This is the equip-packet guard.
3. Add the same class id and every released/unreleased weapon-id range to `DualWieldPolicies` in `Map Server/Actors/Chara/Character.cs`.  This is the combat hit-count guard.
4. Regenerate the class DAT overlay and SQL, then rebuild the combined package with `tools/build_new_weps_and_gear_dat_package.py`.
5. Extend `TestAssassinDualWieldContract` (despite its legacy name) with the new range and overlay assertions.

The two policy lists intentionally use class-specific item ranges. A policy class cannot use a shield or another policy class's weapon in its offhand; a valid pair is the only accepted secondary-arm state. The shared combat modifier model applies main-hand damage, delay, and attack type to both auto hits. Offhand equipment modifiers still apply, its level-adjusted weapon damage is added to physical weapon skills and damaging abilities, and its landed auto hit grants 35% supplemental TP.
