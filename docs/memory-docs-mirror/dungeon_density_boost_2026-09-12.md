# Five-dungeon population increase

This pass adds **322 ordinary mobs** using exact recorded XYZ. The user
excluded Mistbeard and Copperbell from the further increase; their 156 and
192 static placements are unchanged. All 6,094 prior canonical static rows
retain their IDs, profiles, coordinates and settings. The existing NM SQL,
guildleve definitions, quest actors, profiles and weather are unchanged.

| Dungeon | Zone | Prior ordinary | Added | Ordinary now | Increase | All static now |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Cassiopeia Hollow | 132 | 144 | 72 | 216 | 50.0% | 216 |
| U'Ghamaro Mines | 137 | 60 | 47 | 107 | 78.3% | 107 |
| Mun-Tuy Cellars | 157 | 87 | 44 | 131 | 50.6% | 143 |
| Nanawa Mines | 176 | 102 | 51 | 153 | 50.0% | 171 |
| Shposhae | 235 | 216 | 108 | 324 | 50.0% | 327 |

All **53 included ordinary types** now have at least thirteen placements per
dungeon. This is a dungeon-wide minimum, not a requirement to put every species
in every room or on every floor. Common types can exceed nineteen. U'Ghamaro
needs more than a 50% increase to bring all eight types to thirteen while
retaining its sixteen Gurneymen, so the species minimum takes priority there.

The all-static totals retain Mun-Tuy's twelve quest actors, Nanawa's eighteen
quest actors and Shposhae's three passive Seeker stand-ins. None are multiplied.
Unresolved roster entries and event exclusions in the earlier reports remain
unresolved or excluded; this pass does not introduce species or change levels.

[Latest nine-map review](maps/dungeon-density-boost-20260912/index.html): dark
outlines mark prior mobs, white outlines mark this addition, and teal marks
recorded samples and captured links. Each PNG has its own pixel/world frame.

## Species totals

| Dungeon | Ordinary type | Final count |
| --- | --- | ---: |
| Cassiopeia | Bomb | 13 |
| Cassiopeia | Cassiopeia | 18 |
| Cassiopeia | Earth Elemental | 13 |
| Cassiopeia | Giant Bat | 13 |
| Cassiopeia | Goblin Thug | 13 |
| Cassiopeia | Hoverfly Swarm | 13 |
| Cassiopeia | Island Crab | 15 |
| Cassiopeia | Lightning Elemental | 13 |
| Cassiopeia | Orobon | 13 |
| Cassiopeia | Painted Ladybug | 13 |
| Cassiopeia | Pus Gnat | 14 |
| Cassiopeia | Revenant | 13 |
| Cassiopeia | Sea Hare | 13 |
| Cassiopeia | Sea Puk | 13 |
| Cassiopeia | Skeleton Swordbearer | 13 |
| Cassiopeia | Water Elemental | 13 |
| U'Ghamaro | Tinder | 13 |
| U'Ghamaro | Prelate | 13 |
| U'Ghamaro | Ashman | 13 |
| U'Ghamaro | Gateman | 13 |
| U'Ghamaro | Gurneyman | 16 |
| U'Ghamaro | Junkman | 13 |
| U'Ghamaro | Overman | 13 |
| U'Ghamaro | Underman | 13 |
| Mun-Tuy | Cellar Puk | 13 |
| Mun-Tuy | Dreadwolf | 13 |
| Mun-Tuy | Goblin Thug | 13 |
| Mun-Tuy | Kalong | 13 |
| Mun-Tuy | Magicked Bones | 14 |
| Mun-Tuy | Marshlight | 13 |
| Mun-Tuy | Molting Miteling | 13 |
| Mun-Tuy | Squirrel | 13 |
| Mun-Tuy | Toad Poacher | 13 |
| Mun-Tuy | Wykes | 13 |
| Nanawa | Balloon | 15 |
| Nanawa | Cellar Puk | 13 |
| Nanawa | Goblin Thug | 13 |
| Nanawa | Iron Coblyn | 27 |
| Nanawa | Jumping Djigga | 13 |
| Nanawa | Magicked Bones | 13 |
| Nanawa | Maidenbug | 13 |
| Nanawa | Molting Miteling | 13 |
| Nanawa | Skeleton Swordbearer | 13 |
| Nanawa | Wykes | 20 |
| Shposhae | Aurelia | 40 |
| Shposhae | Black Bat | 36 |
| Shposhae | Gloom Lurker | 13 |
| Shposhae | Gripper | 43 |
| Shposhae | Jackal Pup | 34 |
| Shposhae | Shade Lurker | 14 |
| Shposhae | Shadow Lurker | 14 |
| Shposhae | Spawning Orobon | 44 |
| Shposhae | Spelaean Slug | 86 |

## Ground evidence and density

Nanawa's latest independent frozen snapshot has **1,808 nodes and 829 captured
edges**, SHA-256 `47805f4d08edd052f388210fa471b4e76b1084f30724710149ee684600314e25`.
Historical cell **7,4** now has **81 recorded points**, world X=156..256,
Z=-1488..-1388. Five new mobs occupy that cell: one Molting Miteling, two
Skeleton Swordbearers and two Jumping Djiggas. Of all 51 Nanawa additions,
27 use exact XYZ absent from the previous snapshot. Changed recorded averages
are not represented as wholly new terrain. The old recording is preserved as
a separate source with separate node IDs and captured edges.

The other sources already match the newer data used by the prior pass:
Cassiopeia 1,358 nodes, U'Ghamaro 487, Mun-Tuy 1,535 and Shposhae 2,445.
The manifest pins their file paths, hashes and inventories. The supplemental
premerge inventory was checked; it adds no separate coverage to these five
dungeons. No recording was concatenated, relabeled or repaired in this pass.

All 322 additions use recorded XYZ without offsets or interpolated elevation.
For local ground context, 208 selected points have a nearby captured-edge
neighbor; 114 use a nearby recorded point from the same source without a
captured connecting edge. That latter evidence is explicitly labeled point
cloud support, and no connecting edge is invented. Nearby support is within
0.75–10 horizontal yalms and three vertical yalms. Movement recordings establish
sampled ground, not a complete collision mesh or continuous walkability.

The minimum horizontal separation for these new pinned placement IDs is
11.5 yalms in Cassiopeia, 6 in U'Ghamaro, 10 in Mun-Tuy, 11 in Nanawa and 10
in Shposhae. The earlier larger doorway, gate, entrance, quest and NM-pocket
buffers remain. The three Seekers have twenty-one-yalm buffers. These are
spawn separations; aggro and roaming can bring actors closer during play.

The denser U'Ghamaro population extends scarce sentry, worker and caster roles
into adjacent recorded working passages. Cassiopeia's rarer elementals and
goblins extend into connected western recesses and northern shore habitats.
Mun-Tuy uses adjacent southwest work passages. Nanawa uses the newly recorded
central loop and eastern approaches. Exact habitat bounds, chosen node IDs and
support are saved in the manifest. Habitat choices and counts are authored
for the requested density, not recovered retail spawn positions or quantities.

Shposhae retains its reviewed source-node membership on five distinct native
maps, all zone 235. Ambiguous transition nodes remain unassigned. No expansion
beyond recorded positions is used, including in broad rooms.

| Shposhae native page | Retained | Added | Total |
| --- | ---: | ---: | ---: |
| 5000 | 72 | 36 | 108 |
| 5002 | 33 | 16 | 49 |
| 5003 | 46 | 22 | 68 |
| 5004 | 40 | 20 | 60 |
| 5005 | 28 | 14 | 42 |

## Saved artifacts and activation

- Manifest: `Data/mobplacements/dungeon_density_boost.json`.
- Generator: `tools/mobspawns/dungeon_density_boost.py build|check|render`.
- Frozen preboost catalog and Nanawa recording:
  `Data/mobplacements/dungeon_density_boost/evidence/`.
- Exact-point capture CSV, full provenance plans and append-only SQL:
  `Data/mobplacements/dungeon_density_boost/`.
- Scoped migration: `Data/sql/live migrations/dungeon_density_boost_20260912.sql`.
- Canonical spawn IDs: **961006–961327**, with stable generated unique IDs.

The canonical catalog includes this additive block. For an existing database,
apply the scoped migration after the earlier dungeon profile/population
migrations, then reload the Map Server through the normal server workflow.
It checks full reviewed BNPC identity, tolerates normal FLOAT representation,
skips missing or conflicting profiles and preserves existing unique IDs on
repeat import. It creates no profiles and deletes or moves no actors.
No live database import or Map Server restart was performed by this task.

The [earlier expansion report](dungeon_population_expansion_2026-09-12.md)
contains the retained roster research and level evidence. Initial constraints
and unresolved historical details remain documented for
[Nanawa](nanawa_mines_2026-09-12.md),
[U'Ghamaro](ughamaro_mines_2026-09-12.md),
[Mun-Tuy](mun_tuy_cellars_2026-09-12.md) and
[Shposhae](shposhae_mobs_2026-09-12.md).

## Validation

The nine map images were visually reviewed for habitat placement and open
space. Automated checks cover repeat SQL imports, full profile matching,
FLOAT32 profiles, exact source coordinates, newly covered Nanawa ground,
Shposhae page membership, one occurrence per preview actor, protected actors,
stable IDs and byte preservation of the entire preboost catalog outside the
new block. All **71 existing tests** passed across the original expansion,
five initial dungeon suites, Copperbell recording update and coordinate tools.
All **10 new density-boost tests** pass after correcting the test's baseline
count to include all 6,094 prior SQL rows. Those rows contain 6,075 distinct
uniqueId values because of nineteen pre-existing duplicate Ixali identities
outside this task's zones; those original statements are preserved verbatim.
`dungeon_density_boost.py check` also passes.
