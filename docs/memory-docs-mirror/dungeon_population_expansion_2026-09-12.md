# Cassiopeia Hollow and dungeon population expansion

**Latest Mistbeard override:** the
[September 13 reduction](population_reduction_2026-09-13.md) leaves **116**
ordinary actors there. Copperbell stays at **192**. Earlier counts below are
historical; current exports and previews apply the new filter.

This report preserves the earlier population snapshot. See the
[later five-dungeon increase](dungeon_density_boost_2026-09-12.md) for current
Cassiopeia, U'Ghamaro, Mun-Tuy, Nanawa and Shposhae totals. Mistbeard and
Copperbell retain the totals documented here, after the requested removal of
Mistbeard's two Water Elementals. Both spaces remain empty. The original
`plans.json` is frozen evidence; `current_plans.json` holds active placements.

The canonical SQL catalogs now include **537 additional ordinary mobs**, including
the [later Mistbeard/Copperbell update](mistbeard_copperbell_update_2026-09-12.md). This
pass preserves every one of the 451 existing static placement rows in the six
originally populated zones, including existing quest actors and Shposhae's three non-roaming Seekers.
No live database import or Map Server reload was performed.

| Dungeon | Zone | Previous static mobs | Added | Current total | Increase |
|---|---:|---:|---:|---:|---:|
| Cassiopeia Hollow | 132 | 0 | 144 | 144 | New population |
| Mistbeard Cove | 131 | 0 | 154 | 154 | New population |
| U'Ghamaro Mines | 137 | 30 | 30 | 60 | 100% |
| Mun-Tuy Cellars | 157 | 65 | 34 | 99 | 52% |
| Nanawa Mines | 176 | 86 | 34 | 120 | 40% |
| Copperbell Mines | 178 | 121 | 71 | 192 | 59% |
| Shposhae | 235 | 149 | 70 | 219 | 47% |

These totals include retained quest actors: Mun-Tuy's twelve and Nanawa's
eighteen. None were multiplied. The additions use ordinary profiles only.

[Current combined map review](maps/dungeon-population-20260912/index.html)
shows retained mobs with dark outlines and additions with white outlines.
Every PNG has its own coordinate frame. The original dungeon previews remain
available as initial snapshots and link to the current review.

## Cassiopeia Hollow

The requested April 25 archive redirects to the
[May 10, 2013 Cassiopeia roster](https://web.archive.org/web/20130510104700/http://ffxiv.gamerescape.com/wiki/Cassiopeia_Hollow).
The following use the zone-specific levels and hostility from that roster.
Counts and habitat boundaries are authored; they are not recovered retail
spawn counts or coordinates.

| Ordinary species | Level | Count | Hostile |
|---|---:|---:|---|
| Bomb | 30–34 | 8 | Yes |
| Cassiopeia | 25–29 | 16 | No |
| Earth Elemental | 30–54 | 2 | Yes |
| Giant Bat | 25–29 | 12 | Yes |
| Goblin Thug | 29–30 | 4 | No |
| Hoverfly Swarm | 25–28 | 12 | No |
| Island Crab | 35–39 | 13 | No |
| Lightning Elemental | 30–39 | 4 | Yes |
| Orobon | 39 | 6 | Yes |
| Painted Ladybug | 30–34 | 12 | No |
| Pus Gnat | 28–30 | 13 | Yes |
| Revenant | 30–34 | 8 | Yes |
| Sea Hare | 35–39 | 12 | No |
| Sea Puk | 25–29 | 11 | No |
| Skeleton Swordbearer | 29–30 | 9 | Yes |
| Water Elemental | 30 | 2 | Yes |

Native identity: zone 132, place 1113, MapNavi 700, layout 113, piece 1056,
2560×2048 artwork, scale 2, base X=-640 / Z=1408. Thus grid cell 3,5 covers
world X=940..1040 and Z=-908..-808. Server Y remains recorded elevation.
The gate icon maps within about 2.1 yalms of the catalog gate. No new
user-confirmed height validations were invented or added.

The sixteen profiles use reserved IDs 39400–39415. Full donor rows, actor
classes and initializer hashes are pinned. Fly/bee, boggy/sandy Orobon and
elemental class substitutions have equivalent initializer text; Water differs
only in line endings. Existing family skill lists are reused. Elementals use
scalable HP/MP instead of the donor quest actor's fixed HP. This is a population
pass, not a reconstruction of every elemental spell or historical loot table.
New names have dropListId=0; exact-name donors retain their reviewed drop lists.

Excluded: the two roster NMs and all explicitly listed leve targets. Feral
Dodo and Lowland Billygoat are also excluded as event monsters. The
[Feral Dodo archive](https://web.archive.org/web/20130425164018/http://ffxiv.gamerescape.com/wiki/Feral_Dodo)
and [Billygoat archive](https://web.archive.org/web/20120912011508/http://ffxiv.gamerescape.com/wiki/Lowland_Billygoat)
label them Event Monsters. In
[Kaibun's Cassiopeia behest at 3:26](https://www.youtube.com/watch?v=928KPq-vXtg&t=206s),
Feral Dodo, Giant Slug and Lowland Nannygoat are visible in the event objectives.
That frame is evidence of event use and cavern context, not normal spawn XYZ.

Two unresolved groups remain outside this ordinary pass:

- **Yarzon Scavenger:** the main page supplies outdoor cell 32,13 and no local
  level. Both subpage attempts resolved to an ARR beta page, which was rejected.
- **Stormcry pirates:** quest 110679's existing profiles 39214–39216 remain
  staged, as documented in `etc1_quest_mob_placements_2026-09-11.md`. Their
  recorded-ground gap at the journal marker/cell 11,6 remains; this pass does
  not relocate the quest into another chamber.

## Density and floor decisions

U'Ghamaro now has Tinder 8, Prelate 7, Ashman 8, Gateman 6, Gurneyman 16,
Junkman 6, Overman 4 and Underman 5. Its minimum addition clearance is 9 yalms,
appropriate to the requested fuller stronghold groups; doors retain ten yalms,
the entry forty and the authored boss pocket twenty-nine. Scarce sentry roles
also use adjacent reviewed working passages.

The other four expanded dungeons use fourteen-yalm minimum separation from
ordinary actors, with the existing larger gate, quest and NM buffers retained.
Cassiopeia uses nineteen yalms. These are minimum spawn separations, not a
promise that aggro or roaming cannot bring mobs closer during play.

Mun-Tuy uses the newer **1,535-node / 1,290-edge** recording, frozen separately
from the original 940-node snapshot. Eight additions specifically use newly
recorded eastern cellars. All original placements stay at their exact positions.

Copperbell remains entirely in zone 178. Mining Pits now has **81** mobs;
Formicary has **111**. Original source-local nodes from 175/209 keep their
provenance while their authored destination remains the repaired dungeon zone.
The background recording filter in Copperbell previews is approximate by
height; mob page assignments are explicit, including raised Formicary spurs.

Shposhae now has **72 / 33 / 46 / 40 / 28** mobs on pages
5000 / 5002 / 5003 / 5004 / 5005. Ten additions specifically fill the broad
southern chamber on page 5003 highlighted by the user's crop. Selection used
the calibrated native artwork and frame, not the uncalibrated clipboard crop.
No mobs were assigned to the previously unresolved transition windows.
The three passive Seekers remain one each, non-roaming. Their special behavior
and coffer-key drops remain unreconstructed. The prior layout-112 door mismatch
is unchanged.

## Evidence, application and verification

`Data/mobplacements/dungeon_population_expansion.json` pins all sources,
baseline rows, reused profiles, donor reviews, native rows, habitat bounds,
page memberships, node selections and stable placement identities.
All 539 additions use **exact recorded XYZ**. No offsets or interpolated
heights were needed, although the user permitted short offsets.

Local support is a captured edge for 314 additions. For the remaining 225,
the manifest explicitly records nearby XYZ in the **same** captured point
cloud, within ten horizontal and three vertical yalms. This is inferred local
support, not an invented graph edge or proof of walkability between samples.
No source files were concatenated and no cross-source links were generated.

Commands from the project root:

```powershell
python -B tools/mobspawns/dungeon_population_expansion.py build
python -B tools/mobspawns/dungeon_population_expansion.py check
python -B tools/mobspawns/dungeon_population_expansion.py render
```

The additive migration is
`Data/sql/live migrations/dungeon_population_expansion_20260912.sql`.
Apply it after the initial dungeon migrations. New canonical spawn IDs are
960467–961005; the first 360 additions retain IDs 960467–960826 unchanged. Migration guards
check full profile identity with FLOAT tolerance, preserve conflicting custom
IDs, and make repeat imports idempotent. Use the additive SQL, not the old
counter-based CSV converter. SQL serializes XYZ to three decimals; plans and
frozen evidence retain the original precision.

Validation: map-coordinate tests, all five initial dungeon suites, and the
new expansion suite cover source/page mistakes, exact coordinates, exclusion
of special actors, repeat imports, custom profile conflicts and FLOAT32
profiles. Native overlays were visually inspected. Live collision, roaming
and gameplay density still require normal in-game testing after import/reload.
