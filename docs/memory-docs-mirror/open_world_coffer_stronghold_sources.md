# Beastman Stronghold Coffer Source Matrix

**Current implementation:** see [the September 16 completion](public_coffers_2026-09-16.md).
U'Ghamaro now has seven authored recorded-ground homes and three key associations
on the existing Ashman profile. Zahar'ak/Natalan already have positions and key
bindings from their September 12 pass. The source tables remain evidence;
earlier implementation TODOs below are historical, and unknown rates/variants
remain explicitly provisional.

This matrix translates the coffer tables in the three eLeMeN 1.x archive pages
provided for the open-world beastman strongholds. Map coordinates are historical
1.x map-grid references, not server XYZ coordinates.

Sources:

- [U'Ghamaro Mines](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/StrongholdandDungeon/U%27GhamaroMines.html)
- [Natalan](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/StrongholdandDungeon/Natalan.html)
- [Zahar'ak](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/StrongholdandDungeon/Zahar%27ak.html)

The pages say these chests randomly yield gil, ordinary items, and unique
equipment. They identify the unique equipment associated with each physical
chest, but do not publish the gil bands, common-item pools, or rare-equipment
probabilities. The SQL seed temporarily makes the named equipment the sole
reward so the captured chest can be exercised end-to-end. Every such row is
marked `probability provisional` and should be revised when rate data is found.

## U'Ghamaro Mines — zone 137

The source reports seven physical chests across five distinct key tiers.

| Runtime coffer ID | Key | Map reference | Key source | Named equipment |
| --- | --- | --- | --- | --- |
| `ughamaro_brass` | Brass, 10011140 | X:5 Y:5; west after the Mine Entrance Gate | U'Ghamaro ashman, level 55 gladiator | Mercenary's Leggings, 8081122 |
| `ughamaro_silver` | Silver, 10011141 | X:5 Y:3; north after Gate 2605 | Not listed on the source page | Mercenary's Pot Helm, 8011521 |
| `ughamaro_copper` | Copper, 10011142 | X:6 Y:3; through Gate 2610, east across the plaza, then north | U'Ghamaro ashman, level 55 gladiator | Sipahi Gloves, 8070526 |
| `ughamaro_bronze` | Bronze, 10011143 | X:7 Y:4; through Gate 2610, east across the plaza, then south | U'Ghamaro ashman, level 55 gladiator | Warlock's Satchel Belt, 8090207 |
| `ughamaro_gold` | Gold, 10011144 | X:6 Y:5; northern of three beyond Gate 2611 | Third Order Patriarch Zu Ga | Sentinel's Cuirass, 8030112 |
| `ughamaro_gold_center` | Gold, 10011144 | X:6 Y:5; center of three beyond Gate 2611 | Third Order Patriarch Zu Ga | Mercenary's Slops, 8051121 |
| `ughamaro_gold_south` | Gold, 10011144 | X:6 Y:5; southern of three beyond Gate 2611 | Third Order Patriarch Zu Ga | Sorcerer's Hat, 8010129 |

The existing server loot data already gives Gold U'Ghamaro Coffer Key to Zu Ga
at a provisional 3% rate. The [2026-09-12 ordinary population pass](ughamaro_mines_2026-09-12.md)
adds a representative U'Ghamaro ashman profile and recorded-ground spawns.
Its loot remains unset: the separate key-bearing actor variants and drop
probabilities still need review before attaching the three ordinary key sources.

## Natalan — zone 143

The source reports eight physical chests across six distinct key tiers.

| Runtime coffer ID | Key | Map reference | Key source | Named equipment |
| --- | --- | --- | --- | --- |
| `natalan_brass` | Brass, 10011145 | X:43 Y:19; near the Main Gate | Natalan sentry, level 52 gladiator | Sentinel's Gauntlets, 8070112 |
| `natalan_copper` | Copper, 10011146 | X:44 Y:20; beyond the North Inner Gate | Natalan sentry, level 53 marauder | Sentinel's Plate Belt, 8090106 |
| `natalan_silver` | Silver, 10011147 | X:44 Y:20; beyond the Rear Inner Gate | Natalan sentry, level 59 lancer | Mercenary's Mitts, 8070811 |
| `natalan_steel` | Steel, 10011148 | X:42 Y:20; beyond the Wolftamer Inner Gate | Scarred watchwolf, level 59 | Mask of the Mortal Hex, 8010708 |
| `natalan_mythril` | Mythril, 10011149 | X:43 Y:22; beyond the South Inner Gate | Natalan sentry, level 59 conjurer | Sentinel's Celata, 8010008 |
| `natalan_gold` | Gold, 10011150 | X:43 Y:20; eastern of three beyond the Chieftain Inner Gate | Lozol Totoloq the Decapitator | Sipahi Sarouel, 8050727 |
| `natalan_gold_center` | Gold, 10011150 | X:42 Y:20; center of three beyond the Chieftain Inner Gate | Lozol Totoloq the Decapitator | Sorcerer's Tights, 8051025 |
| `natalan_gold_west` | Gold, 10011150 | X:42 Y:20; western of three beyond the Chieftain Inner Gate | Lozol Totoloq the Decapitator | Sipahi Shirt, 8030725 |

The existing server loot data already gives Gold Natalan Coffer Key to Lozol at
a provisional 3% rate. The four Natalan sentry job/level variants and the
Scarred watchwolf lack authoritative server spawn bindings at these locations,
so their key drops remain evidence-backed TODOs rather than guessed rows.

## Zahar'ak — zone 174

The source reports seven physical chests across four distinct key tiers.

| Runtime coffer ID | Key | Map reference | Key source | Named equipment |
| --- | --- | --- | --- | --- |
| `zahar_brass` | Brass, 10011136 | X:49 Y:40; north after the Second Battle Gate | Zahar'ak feretrar, level 55 thaumaturge | Sentinel's Sabatons, 8080112 |
| `zahar_copper` | Copper, 10011137 | X:49 Y:39; north after the Third Battle Gate | Zahar'ak scriniary, level 55 thaumaturge | Sorcerer's Ringbands, 8071212 |
| `zahar_silver` | Silver, 10011138 | X:50 Y:39; east beyond the Fourth Battle Gate | Ranig'oh, level 56 | Sipahi Turban, 8011323 |
| `zahar_silver_west` | Silver, 10011138 | X:50 Y:39; west beyond the Fourth Battle Gate | Ranig'oh, level 56 | Sipahi Crakows, 8080525 |
| `zahar_gold` | Gold, 10011139 | X:50 Y:40; east beyond the Sixth Battle Gate | Flamefist Ahlygg Roh | Sentinel's Trousers, 8050149 |
| `zahar_gold_north_west` | Gold, 10011139 | X:50 Y:41; northern of the two western chests | Flamefist Ahlygg Roh | Mercenary's Acton, 8030823 |
| `zahar_gold_south_west` | Gold, 10011139 | X:50 Y:41; southern of the two western chests | Flamefist Ahlygg Roh | Sorcerer's Robe, 8030244 |

The existing server loot data already gives Gold Zahar'ak Coffer Key to
Flamefist at a provisional 3% rate. The feretrar, scriniary, and Ranig'oh actor
classes exist in client data but do not have authoritative server mob/spawn
rows for these stronghold placements, so the ordinary key sources are not
force-wired yet.

## Position capture IDs

Each runtime coffer ID represents one physical chest and should receive one
fixed `retail` position row. For example:

```text
!owcoffer spawn zahar_gold_north_west
!owcoffer key zahar_gold_north_west
!owcoffer sql zahar_gold_north_west retail
```

Do not combine the three Gold positions under one definition: their named
equipment differs. Weighted/random candidates remain available within a single
physical coffer definition if later coordinate captures disagree about its
exact XYZ, but `rerollPositionOnRefill` should stay disabled for these fixed
stronghold chests.
