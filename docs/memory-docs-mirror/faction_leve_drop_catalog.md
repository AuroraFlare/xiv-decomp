# Faction leve drop catalog

This is the implemented item-reward matrix for the 53 catalog faction leves.
It is intentionally organized for future drop-table editing.

The Level column lists the base leve/reward tier (20/30/40/50). Enemy levels
are fixed at three above that base (23/33/43/53); this does not change the
reward pools or enable difficulty adjustment or leve linking.
Faction leves can be obtained five levels below their base tier: 15/25/35/45.
Level-20/30/40 faction leves cost zero faction points; only level 50 retains
its faction-point costs. Allowance and other non-level requirements still apply.
All faction enemies display `??` instead of their numeric combat level.

## Reward channels

- Every faction leve spawns exactly one guaranteed red completion chest after
  all objectives are complete.
- Every red chest grants one item plus chest gil.
- The five level-50 leves with existing runestone pools have a custom 65%
  total runestone chance, split equally among their stones, and 35% consolation.
  Other level-50 loot tables and level-20/30/40 rewards are unchanged.
- Shared 20-30 and Shared 40-50 refer to the faction-only weighted pools below. They are available to every faction leve in the matching level band and do not alter ordinary regional-guildleve bonus chests.
- Faction item rewards are no longer displayed or granted as direct completion
  rewards. The fourth column records which former direct items were moved into
  the chest; `guess` means the old mapping lacks surviving leve-specific proof.
- Exact retail probabilities did not survive. Percentages on the per-leve chest
  tables are current provisional server tuning.

## Signature gear acquisition

The Templar, Buccaneer, and Harlequin pieces are **not** direct chest drops.
Faction-leve chests award the associated Allagan runestone; Rowena then exchanges
that stone plus the historical supporting materials for the equipment. The
server chest table therefore contains all 12 stones and deliberately excludes
the 12 finished gear pieces.

| Chest runestone | Rowena exchange gear | Current red-chest source |
|---|---|---|
| Byregot | Templar's Chain Coif | Operation: Bloody Scales (chain association) |
| Rhalgr | Templar's Haubergeon | Wanted: Mammoth and Master (Tarbh Uisge) |
| Llymlaen | Templar's Sollerets | Operation: Wolfsbane (grouping); Operation: Shuteye |
| Halone | Templar's Tassets | Operation: Wolfsbane (grouping); Operation: Shuteye |
| Azeyma | Buccaneer's Tricorne | Operation: Wolfsbane (grouping); Operation: Shuteye |
| Althyk | Buccaneer's Shirt | Wanted: Mammoth and Master (Tarbh Uisge) |
| Menphina | Buccaneer's Boots | Operation: Pulling Fangs |
| Thaliak | Buccaneer's Sash | Operation: Bloody Scales (chain association) |
| Nophica | Harlequin's Cap | Operation: Bloody Scales (chain association) |
| Nald'thal | Harlequin's Acton | Wanted: Mammoth and Master (Tarbh Uisge) |
| Nymeia | Harlequin's Tights | Operation: Wolfsbane (grouping); Operation: Shuteye |
| Oschon | Harlequin's Belt | Wanted: Mammoth and Master (Tarbh Uisge) |

The Bloody Scales and Wolfsbane labels survive as mission-chain/grouping
associations, not definitive proof of which terminal assignment awarded every
stone. Their leve assignments are consequently explicit reconstruction
policy. The 65% total runestone chance is custom tuning, not a retail rate.
Pulling Fangs, Shuteye, and Tarbh Uisge have stronger leve-specific
evidence.

The four Patch 1.23 Coliseum pieces use the other acquisition model and remain
direct random end-chest items:

| Faction leve | Direct signature chest item |
|---|---|
| Operation: Crosseye | Coliseum Subligar |
| Wanted: The Maskmaker | Coliseum Galerus |
| Wanted: Vengeance | Coliseum Shawl |
| Intel Outside (server alias: Intel Inside) | Coliseum Loincloth |

## Brotherhood of the Broken Blade

| ID | Level | Faction leve | Former direct item moved to chest | Guaranteed red-chest item roll |
|---:|---:|---|---|---|
| 1001 | 20 | Operation: Reave-quest | Onion Doublet; Onion Pattens | 10% Onion Doublet; 10% Onion Pattens; 80% Shared 20-30 |
| 1002 | 20 | Operation: Kobold as Ice | Tarnished Hoplon | 10% Tarnished Hoplon; 90% Shared 20-30 |
| 1003 | 20 | Operation: Sylph Stalkings | Onion Doublet; Onion Pattens (guess) | 10% Onion Doublet; 10% Onion Pattens; 80% Shared 20-30 |
| 1004 | 30 | Operation: Supplication Denied | None | 10% Blackened Scale Mail; 10% Onion Doublet; 10% Onion Helm; 70% Shared 20-30 |
| 1005 | 30 | Operation: Bloody Side Up | None | 10% each Onion Gaskins/Onion Doublet/Tarnished Hoplon/Hermes' Shoes; 60% Shared 20-30 |
| 1006 | 30 | Operation: Reaving Home | None | 10% each Hermes' Shoes/Garlond Goggles/Onion Helm/Tarnished Hoplon/Onion Pattens; 50% Shared 20-30 |
| 1007 | 40 | Operation: Warm Welcome | Vintage Jester's Cap (guess) | 10% Vintage Jester's Cap; 90% Shared 40-50 |
| 1008 | 40 | Operation: Broken Thunder | None | 10% Vintage Jester's Cap; 10% Vintage Guisarme; 80% Shared 40-50 |
| 1009 | 40 | Operation: Scar and Defeather | None | 10% Vintage Scale Mail; 10% Vintage Shepherd's Belt; 80% Shared 40-50 |
| 1010 | 40 | Operation: Frame Work | None | 10% Vintage Bill; 10% Vintage Round Shield; 80% Shared 40-50 |
| 1011 | 50 | Operation: Bloody Scales | Discarded old Azeyma/Halone guess | 65% runestone total: equal Byregot/Thaliak/Nophica (~21.67% each); 35% Shared 40-50 |
| 1012 | 50 | Operation: Under Siege | Discarded old Azeyma/Halone guess | Shared 40-50 |
| 1013 | 50 | Operation: Pulling Fangs | None | 65% Menphina Runestone; 35% split equally among Fire/Ice/Wind/Earth/Lightning/Water Crystal x4 (~5.83% each) |
| 1014 | 50 | Operation: Wolfsbane | Discarded old Azeyma/Halone guess | 65% runestone total: 16.25% each Llymlaen/Halone/Azeyma/Nymeia; 35% Shared 40-50 |
| 1015 | 50 | Operation: Up, Up, and Away | None | Shared 40-50 |
| 1016 | 50 | Operation: Shuteye | None | 65% runestone total: 16.25% each Azeyma/Halone/Llymlaen/Nymeia; 35% Shared 40-50 |
| 1017 | 50 | Operation: Leaving the Nest | None | Shared 40-50 |
| 1018 | 50 | Operation: Tailspin | None | Shared 40-50 |
| 1019 | 50 | Operation: Deepground | None | Shared 40-50 |
| 1020 | 50 | Operation: Crosseye | None | 10% Coliseum Subligar; 90% Shared 40-50 |

## Azeyma's Shields

| ID | Level | Faction leve | Former direct item moved to chest | Guaranteed red-chest item roll |
|---:|---:|---|---|---|
| 1101 | 20 | Wanted: Xha Viqqoh the Nibbler | Onion Doublet; Onion Pattens (guess) | 10% Onion Doublet; 10% Onion Pattens; 80% Shared 20-30 |
| 1102 | 20 | Wanted: Palemoon Parazuzu | Onion Doublet; Onion Gaskins | 10% each Onion Doublet/Onion Gaskins/Onion Pattens; 10% Aldgoat Steak x2; 60% Shared 20-30 |
| 1103 | 20 | Wanted: Rorogun the Tailtamer | Onion Doublet; Tarnished Hoplon | 10% Onion Doublet; 10% Tarnished Hoplon; 80% Shared 20-30 |
| 1104 | 30 | Wanted: B'khenna the Phoenixfire | None | 10% each Dated Danburite Ring/Dated Darksilver Ring/Dated Pearl Ring; 70% Shared 20-30 |
| 1105 | 30 | Wanted: Ser Aucheforne of the High Tide | None | 10% each Dated Black Pearl Ring/Dated Fluorite Ring/Dated Sphene Ring; 70% Shared 20-30 |
| 1106 | 30 | Wanted: Godwin Goodgoat | None | 10% each Dated Lapis Lazuli Ring/Dated Malachite Ring/Dated Sunstone Ring; 70% Shared 20-30 |
| 1107 | 40 | Still Wanted: B'khenna the Phoenixfire | None | 10% Vintage Shepherd's Belt; 10% Vintage Seneschal Coatee; 10% Vintage Cudgel; 70% Shared 40-50 |
| 1108 | 40 | Wanted: Coiled Adder | None | 10% Vintage Guisarme; 90% Shared 40-50 |
| 1109 | 40 | Wanted: Toadsquatter Femomo | Vintage Jester's Cap | 10% Vintage Jester's Cap; 10% Vintage Coif; 10% Vintage Robe; 70% Shared 40-50 |
| 1110 | 40 | Wanted: Alvara Sourkiss | None | 10% Vintage Smithy's Gloves; 10% Vintage Thighboots; 80% Shared 40-50 |
| 1111 | 50 | Wanted: Soft Evidence | Cobalt Celata | 10% Cobalt Celata; 90% Shared 40-50 |
| 1112 | 50 | Wanted: Violent Verdure | None | Shared 40-50 |
| 1113 | 50 | Wanted: Mammoth and Master | None | 65% runestone total: 16.25% each Althyk/Nald'thal/Oschon/Rhalgr; 35% Shared 40-50 |
| 1114 | 50 | Wanted: Ursulien the Unseen | None | Shared 40-50 |
| 1115 | 50 | Wanted: Princess Pudding | None | Shared 40-50 |
| 1116 | 50 | Wanted: Striped Lightning | None | Shared 40-50 |
| 1117 | 50 | Wanted: Porus | None | Shared 40-50 |
| 1118 | 50 | Wanted: The Maskmaker | None | 10% Coliseum Galerus; 90% Shared 40-50 |
| 1119 | 50 | Wanted: Vengeance | None | 10% Coliseum Shawl; 40% Dodoskin Subligar; 40% Boarskin Harness; 10% Shared 40-50 |

## Horn and Hand

| ID | Level | Faction leve | Former direct item moved to chest | Guaranteed red-chest item roll |
|---:|---:|---|---|---|
| 1201 | 20 | Collecting Sea Shells | Onion Pattens; Growth Formula Gamma x3 | 10% Hempen Bowstring; 10% Onion Pattens; 10% Growth Formula Gamma x3; 70% Shared 20-30 |
| 1202 | 30 | Spoiled Soil | Linen Yarn x3 | 10% Linen Yarn x3; 90% Shared 20-30 |
| 1203 | 40 | Old Money | Peiste Leather x3 | 10% Peiste Leather x3; 90% Shared 40-50 |
| 1204 | 30 | Something in the Air | Hippogryph Sinew x3 | 10% Horn Glue; 10% Hippogryph Sinew x3; 80% Shared 20-30 |
| 1205 | 30 | It's the Smell | Mythril Ingot x3 | 10% Mythril Ingot x3; 90% Shared 20-30 |
| 1206 | 30 | A Weighty Problem | Rotting Round Shield; Mahogany Lumber x3 | 10% Rotting Round Shield; 10% Mahogany Lumber x3; 80% Shared 20-30 |
| 1207 | 40 | Diamonds in the Rough | Ripped Haubergeon; Rosewood Lumber x3 | 10% Ripped Haubergeon; 10% Rosewood Lumber x3; 80% Shared 40-50 |
| 1208 | 40 | Golden Opportunity | None | 10% Vintage Haubergeon; 10% Vintage Kite Shield; 80% Shared 40-50 |
| 1209 | 40 | While They're Young | Scarred Kite Shield; Horn Glue x5 | 10% each Vintage Haubergeon/Vintage Robe/Scarred Kite Shield/Horn Glue x5; 60% Shared 40-50 |
| 1210 | 30 | Heat of the Moment | Lanolin x3 | 10% Lanolin x3; 90% Shared 20-30 |
| 1211 | 20 | Unlike a Rolling Stone | Onion Pattens; Growth Formula Gamma x3 (guess) | 10% Onion Pattens; 10% Growth Formula Gamma x3; 80% Shared 20-30 |
| 1212 | 20 | Looting the Larder | None | Shared 20-30 |
| 1213 | 30 | Hook, Line, and Sinker | None | Shared 20-30 |
| 1214 | 50 | Intel Outside (server alias: Intel Inside) | None | 10% Coliseum Loincloth; 90% Shared 40-50 |

## Shared red-chest pools

Each armor/material entry has relative weight 25 and each materia entry has
weight 1. Both pools contain all six primary-stat materia for their tier:
tier II at Level 20–30 and tier III at Level 40–50. The Level 20–30 pool has
approximately 3.31% total materia chance or 0.55% per type; Level 40–50 remains
approximately 3.85% total or 0.64% per type.

### Shared 20-30

| Item | Chance |
|---|---:|
| Cotton Coif | 13.81% |
| Cotton Sugarloaf Hat | 13.81% |
| Velveteen Bandana | 13.81% |
| Dodoskin Subligar | 13.81% |
| Silver Ingot | 13.81% |
| Undyed Cotton Cloth | 13.81% |
| Boar Leather | 13.81% |
| Strength Materia II | 0.55% |
| Vitality Materia II | 0.55% |
| Dexterity Materia II | 0.55% |
| Intelligence Materia II | 0.55% |
| Mind Materia II | 0.55% |
| Piety Materia II | 0.55% |

### Shared 40-50

| Item | Chance |
|---|---:|
| Woolen Hat | 16.03% |
| Woolen Coif | 16.03% |
| Woolen Beret | 16.03% |
| Mythril Ingot | 16.03% |
| Undyed Woolen Cloth | 16.03% |
| Raptor Leather | 16.03% |
| Strength Materia III | 0.64% |
| Vitality Materia III | 0.64% |
| Dexterity Materia III | 0.64% |
| Intelligence Materia III | 0.64% |
| Mind Materia III | 0.64% |
| Piety Materia III | 0.64% |

## Red-chest gil

| Faction-leve level | Chest gil |
|---:|---:|
| 20 | 666 |
| 30 | 1,000 |
| 40 | 1,333 |
| 50 | 1,666 |

Operation: Supplication Denied overrides this with 3,100 gil. Wanted: Rorogun
the Tailtamer overrides it with 4,499 gil.
