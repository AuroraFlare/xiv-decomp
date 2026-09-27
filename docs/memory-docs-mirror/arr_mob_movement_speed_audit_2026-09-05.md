# ARR mob movement-speed audit (2026-09-05)

## Outcome

The server's two battle-NPC catalogs used a uniform run speed of `4`. ARR does
not: its `ModelChara` records select a `ModelSkeleton` movement profile whose
run speeds range from `3.5` to `8.0` for the relevant models.

This change applies the ARR family profile while retaining `4` as the minimum.
That means the audit only increases mobs that ARR treats as faster; it does not
slow existing 1.x encounters whose ARR analogue is below `4`.

Coverage:

- Base/static catalog: 498 rows audited; 424 increased and 74 retained at `4`.
- Guildleve/behest catalog: 262 rows audited; 216 increased and 46 retained at `4`.
- Live migration mob rows: 96 audited; 91 increased and 5 retained at `4`.
- NM/normal-spawn overlays and the loot-enrichment replacement pass are
  reprofiled so later imports cannot silently restore the old blanket value.
- Script-created enemies resolve the same family profile from their actor class.

The base catalog now has this distribution:

| Run speed | Rows |
| ---: | ---: |
| 4.0 | 74 |
| 4.5 | 47 |
| 4.7 | 8 |
| 5.0 | 119 |
| 5.5 | 47 |
| 6.0 | 194 |
| 8.0 | 9 |

## Family profiles

| Run speed | 1.x actor families / exceptions |
| ---: | --- |
| 8.0 | Coeurl, Raptor, Ifrit (normal body) |
| 7.0 | Khimaira |
| 6.0 | Ahriman, Birdman/Ixal, Boar, Bomb, Cyclops, Elemental, Empire, Fighter/humanoid, Gargoyle, Gnole/Kobold, Goblin, Golem, Kujata, Livingdead, Lizardman/Amalj'aa, Moogle, Pixie/Sylph, Qiqirn, Scalelizard/Drake, Skeleton, Sprite, WhiteGeneral, Wolf |
| 5.5 | Basilisk, Bird, Gigantoad, Goobbue, Imp, Ogre, Petitghost/Soul, Specter, Termite/Ant, WillOTheWisp |
| 5.0 | Bat, Cactus, Crab, Firefly, Flan, Fly, FrillLizard, Garuda, Griffin, Killermachine/Vanguard, Longlegs/Yarzon, Mole, Morbol, Mysticarmor, Orebeetle/Coblyn, Serow, Spider/Diremite, Treant, Yak, Infernal Nail |
| 4.7 | Dodo |
| 4.5 | Crowd/Swarm, Flower/Roseling, Jellyfish, Monkey/Opo-opo, Salamander/Eft |
| 4.0 | Apkallu, Bug/Beetle, Chigoe/Mosquito, Funguar, Kesaranpasaran/Snurble, Lemming/Squirrel, Piranha/Orobon, Sheep/Lamb, Slug, Winglizard/Puk, unknown/default |

The missing retail actor-class row for `cloud_dragon_probe` uses the ARR dragon
baseline of `5`. Missing `228xxxx`/`229xxxx` combatant rows are named humanoids
and use the humanoid profile of `6`.

## Evidence and method

ARR-compatible servers resolve battle-NPC speed through
`BNpcBase -> ModelChara -> ModelSkeleton`; Sapphire's
[`BNpc.cpp`](https://github.com/SapphireServer/Sapphire/blob/master/src/world/Actor/BNpc.cpp)
shows that runtime path explicitly. The older
[`ModelChara.txt`](https://github.com/kelhor/ffxiv_data_dump/blob/master/ModelChara.txt)
and [`ModelSkeleton.txt`](https://github.com/kelhor/ffxiv_data_dump/blob/master/ModelSkeleton.txt)
provide the early-client mappings and float walk/run values. The ARR model IDs
were named with ffxiv-explorer's
[`monsters.lst`](https://github.com/goaaats/ffxiv-explorer-fork/blob/develop/monsters.lst).

As a stability check, 288 ARR-era model entries (IDs through 304) were
joined through both the 2015 dump and the current
[`ModelChara.csv`](https://github.com/thewakingsands/ffxiv-datamining-tc/blob/master/ModelChara.csv)
and [`ModelSkeleton.csv`](https://github.com/thewakingsands/ffxiv-datamining-tc/blob/master/ModelSkeleton.csv).
All 287 surviving profiles retained the same run speed. The sole differing row
was ID 77: an old invisible/placeholder model slot later repurposed for the
Snowcloak yeti, rather than a speed change to a surviving ARR family.

Some 1.x families were renamed or removed in ARR. Those are mapped to the
closest surviving model/skeleton lineage shown in the table above. That part is
an explicit compatibility inference, while direct matches such as Raptor,
Ifrit, Dodo, Ahriman, Gigantoad, and Apkallu use their named ARR profiles.

## Runtime and schema notes

Fractional profiles require the SQL `speed` columns to be `decimal(4,2)` and
the C# value/read paths to use `float`. Existing databases are upgraded by the
catalog imports' `ALTER TABLE ... MODIFY COLUMN` statements.

After deploying, reimport both catalog files and any applicable enrichment/live
migration files before restarting the map server so the in-memory mob-type
caches receive the new values.
