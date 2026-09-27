# Materia Meld Compatibility

Source: [https://web.archive.org/web/20121023162224/http://ffxiv.gamerescape.com/wiki/Category:Materia](https://web.archive.org/web/20121023162224/http://ffxiv.gamerescape.com/wiki/Category:Materia).
The September 29, 2012 capture shown in the user-provided link text was also checked and produced the same 256-row materia table: [https://web.archive.org/web/20120929233240/http://ffxiv.gamerescape.com/wiki/Category:Materia](https://web.archive.org/web/20120929233240/http://ffxiv.gamerescape.com/wiki/Category:Materia).

This is the Gamer Escape 1.0 category table normalized into repo documentation. The full per-tier data, including catalyst and effect values, is in `docs/materia_meld_compatibility.csv`.

Extraction summary:

- Rows: 256 materia tier entries.
- Materia families: 64.
- The table maps cleanly to the current used materia type IDs in `docs/materia_current_base_stats.md`.
- `Sagacious Might Materia` is the only family where the archived category table appears to vary meld targets by tier. This conflicts with the 1.x client/DAT model, which stores one meldable flag set per materia family, and is treated as an archive anomaly rather than a retail tier rule.
- The implementation therefore uses the DAT-derived family-level target set for every tier. No tier-specific slot restriction is encoded.
- The archive category does not include every SQL-backed legacy/test materia row, including type IDs 34, 58-60, 65, and 66. The implementation uses DAT meldable flags plus catalyst-family inference for those rows.
- The archived `Savage Aim Materia IV` catalyst cell was malformed; it is normalized to `Cretified Matter` from the surrounding Savage Aim catalyst pattern.

## Meldable Flag Map

The flag names were matched by comparing the archive targets with `gamedata_items_materia.meldable1` through `meldable38`. Flags 28-38 are inferred from the archive icon order because all secondary-tool-compatible materia share the same secondary-tool set in this source.

| Flag | Target |
| ---: | --- |
| meldable1 | Head |
| meldable2 | Body |
| meldable3 | Hands |
| meldable4 | Legs |
| meldable5 | Feet |
| meldable6 | Waist |
| meldable7 | Pugilist's Arm |
| meldable8 | Gladiator's Arm |
| meldable9 | Marauder's Arm |
| meldable10 | Lancer's Arm |
| meldable11 | Archer's Arm |
| meldable12 | Shield |
| meldable13 | Conjurer's Arm |
| meldable14 | Two-Handed Conjurer's Arm |
| meldable15 | Thaumaturge's Arm |
| meldable16 | Two-Handed Thaumaturge's Arm |
| meldable17 | Carpenter's Primary Tool |
| meldable18 | Blacksmith's Primary Tool |
| meldable19 | Armorer's Primary Tool |
| meldable20 | Goldsmith's Primary Tool |
| meldable21 | Leatherworker's Primary Tool |
| meldable22 | Weaver's Primary Tool |
| meldable23 | Alchemist's Primary Tool |
| meldable24 | Culinarian's Primary Tool |
| meldable25 | Miner's Primary Tool |
| meldable26 | Botanist's Primary Tool |
| meldable27 | Fisher's Primary Tool |
| meldable28 | Carpenter's Secondary Tool |
| meldable29 | Blacksmith's Secondary Tool |
| meldable30 | Armorer's Secondary Tool |
| meldable31 | Goldsmith's Secondary Tool |
| meldable32 | Leatherworker's Secondary Tool |
| meldable33 | Weaver's Secondary Tool |
| meldable34 | Alchemist's Secondary Tool |
| meldable35 | Culinarian's Secondary Tool |
| meldable36 | Miner's Secondary Tool |
| meldable37 | Botanist's Secondary Tool |
| meldable38 | Fisher's Secondary Tool |

## Compatibility By Materia

| Type ID | Materia | Meld targets |
| ---: | --- | --- |
| 1 | Bloodthirst Materia | Body; Hands; Legs; Feet; Waist; Shield |
| 2 | Manathirst Materia | Head; Body; Legs; Waist; Pugilist's Arm; Archer's Arm; Conjurer's Arm; Thaumaturge's Arm |
| 3 | Lifethirst Materia | Legs; Shield |
| 4 | Strength Materia | Hands; Gladiator's Arm; Pugilist's Arm; Marauder's Arm; Lancer's Arm; Blacksmith's Primary Tool; Armorer's Primary Tool; Botanist's Primary Tool |
| 5 | Vitality Materia | Body; Gladiator's Arm; Marauder's Arm; Archer's Arm; Conjurer's Arm; Two-Handed Conjurer's Arm; Carpenter's Primary Tool; Armorer's Primary Tool; Leatherworker's Primary Tool; Miner's Primary Tool |
| 6 | Dexterity Materia | Hands; Gladiator's Arm; Pugilist's Arm; Marauder's Arm; Lancer's Arm; Archer's Arm; Carpenter's Primary Tool; Goldsmith's Primary Tool; Weaver's Primary Tool; Fisher's Primary Tool |
| 7 | Intelligence Materia | Head; Pugilist's Arm; Thaumaturge's Arm; Two-Handed Thaumaturge's Arm; Goldsmith's Primary Tool; Leatherworker's Primary Tool; Alchemist's Primary Tool; Botanist's Primary Tool |
| 8 | Mind Materia | Head; Gladiator's Arm; Archer's Arm; Conjurer's Arm; Two-Handed Conjurer's Arm; Thaumaturge's Arm; Two-Handed Thaumaturge's Arm; Blacksmith's Primary Tool; Weaver's Primary Tool; Culinarian's Primary Tool; Miner's Primary Tool |
| 9 | Piety Materia | Body; Lancer's Arm; Archer's Arm; Conjurer's Arm; Two-Handed Conjurer's Arm; Thaumaturge's Arm; Two-Handed Thaumaturge's Arm; Alchemist's Primary Tool; Culinarian's Primary Tool; Fisher's Primary Tool |
| 10 | Ironman's Will Materia | Legs |
| 11 | Swordsman's Cry Materia | Legs |
| 12 | Watchman's Vigil Materia | Legs |
| 13 | Loresman's Wit Materia | Legs |
| 14 | Wise Man's Vision Materia | Legs |
| 15 | Vestryman's Faith Materia | Legs |
| 16 | Fire Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 17 | Ice Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 18 | Wind Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 19 | Earth Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 20 | Lightning Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 21 | Water Materia | Feet; Pugilist's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 22 | Fire Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 23 | Ice Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 24 | Wind Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 25 | Earth Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 26 | Lightning Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 27 | Water Veil Materia | Body; Waist; Shield; Carpenter's Secondary Tool; Blacksmith's Secondary Tool; Armorer's Secondary Tool; Goldsmith's Secondary Tool; Leatherworker's Secondary Tool; Weaver's Secondary Tool; Alchemist's Secondary Tool; Culinarian's Secondary Tool; Miner's Secondary Tool; Botanist's Secondary Tool; Fisher's Secondary Tool |
| 28 | Heavens' Fist Materia | Hands; Marauder's Arm; Lancer's Arm |
| 29 | Heavens' Eye Materia | Hands; Gladiator's Arm; Pugilist's Arm; Marauder's Arm; Lancer's Arm; Archer's Arm |
| 30 | Hells' Fist Materia | Feet; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 31 | Hells' Eye Materia | Head; Conjurer's Arm; Thaumaturge's Arm |
| 32 | Savage Aim Materia | Legs |
| 33 | Savage Might Materia | Body; Marauder's Arm; Lancer's Arm; Archer's Arm |
| 35 | Sagacious Might Materia | Hands; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm (the archived II/III rows disagree, but the client/DAT family value does not vary by tier) |
| 36 | Battledance Materia | Hands; Gladiator's Arm; Marauder's Arm; Lancer's Arm; Two-Handed Conjurer's Arm; Two-Handed Thaumaturge's Arm |
| 37 | Gatherer's Guerdon Materia | Miner's Primary Tool; Botanist's Primary Tool; Fisher's Primary Tool |
| 38 | Gatherer's Guile Materia | Miner's Primary Tool; Botanist's Primary Tool; Fisher's Primary Tool |
| 39 | Gatherer's Grasp Materia | Miner's Primary Tool; Botanist's Primary Tool; Fisher's Primary Tool |
| 40 | Craftsman's Competence Materia | Carpenter's Primary Tool; Blacksmith's Primary Tool; Armorer's Primary Tool; Goldsmith's Primary Tool; Leatherworker's Primary Tool; Weaver's Primary Tool; Alchemist's Primary Tool; Culinarian's Primary Tool |
| 41 | Craftsman's Cunning Materia | Carpenter's Primary Tool; Blacksmith's Primary Tool; Armorer's Primary Tool; Goldsmith's Primary Tool; Leatherworker's Primary Tool; Weaver's Primary Tool; Alchemist's Primary Tool; Culinarian's Primary Tool |
| 42 | Craftsman's Command Materia | Carpenter's Primary Tool; Blacksmith's Primary Tool; Armorer's Primary Tool; Goldsmith's Primary Tool; Leatherworker's Primary Tool; Weaver's Primary Tool; Alchemist's Primary Tool; Culinarian's Primary Tool |
| 43 | Bloodflight Materia | Body; Feet |
| 44 | Manaflight Materia | Head; Feet |
| 45 | Bloodwall Materia | Body; Shield |
| 47 | Cactuar Foot Materia | Feet |
| 48 | Wyvern Skin Materia | Hands |
| 49 | Bomb Blood Materia | Hands |
| 50 | Pixie Tongue Materia | Head |
| 51 | Coeurl Eye Materia | Head |
| 52 | Aurelia Kiss Materia | Legs |
| 53 | Bison Hoof Materia | Legs |
| 54 | Funguar Shriek Materia | Legs |
| 55 | Treant Root Materia | Feet |
| 56 | Chocobo Down Materia | Feet |
| 61 | Touch of Rage Materia | Waist; Gladiator's Arm; Marauder's Arm |
| 62 | Touch of Serenity Materia | Waist; Conjurer's Arm; Thaumaturge's Arm |
| 68 | Healer's Hand Materia | Head; Conjurer's Arm; Thaumaturge's Arm |
| 82 | Sanguinary Might Materia | Waist |
| 83 | Stellar Might Materia | Waist |
| 84 | Sound of Serenity Materia | Feet |
| 85 | Sound of Certainty Materia | Head |
| 86 | Sound of Suffering Materia | Hands |
| 87 | Swiftwall Materia | Hands |
| 88 | Evenflow Materia | Hands |
