# Coerthas Central Lowlands ordinary mobs — 2026-09-12

**Current override:** the [September 13 reduction](population_reduction_2026-09-13.md)
leaves **196** ordinary actors across all ten species. The 522/261 counts and
support statistics below describe earlier frozen passes; current exports and
previews show the 196 survivors.

Zone **147** now has **261 authored ordinary spawns**, covering all ten ordinary
species in the supplied legacy roster. The previous public spawn catalog had
no literal public-world placements in this zone. This change updates project
SQL and supplies an additive migration; it has **not been imported into the
running database**, and no server restart or in-game roaming test was performed.

The user subsequently requested a **50% reduction: 522 → 261**. A balanced
subset retains every species and habitat, preserving each surviving XYZ,
profile, unique ID and catalog ID. The original 522-point manifest stays frozen;
`Data/mobplacements/coerthas_central_lowlands_reduction.json` records the exact
retained IDs and the 261 removed rows. Current canonical SQL, additive exports
and map previews show only the survivors.

The [interactive map](maps/coerthas-central-lowlands-20260912/index.html) includes
species filters, recorded ground, captured edges, open pockets, zoom, and
clickable mobs with exact teleport commands. The running local preview is
<http://127.0.0.1:8767/coerthas-central-lowlands-20260912/index.html>.

## Population and historical evidence

The [supplied Lowlands roster](https://web.archive.org/web/20130510104620/http://ffxiv.gamerescape.com/wiki/Coerthas_Central_Lowlands)
is preserved locally in `docs/ffxiv-1.0-wiki/regions/Coerthas_Central_Lowlands.html`.
Its ordinary species membership is the baseline. Deepvoid Pikeman, Scamp,
Sludge, Soul, Warrior, Watcher and Wizard, plus Atomos, are excluded. No guildleve,
caravan, quest or NM spawn is added or changed.

| Species | Levels | Spawns | Scoped BNPC | Level evidence |
| --- | ---: | ---: | ---: | --- |
| Antelope Stag | 45–54 | 25 | 39500 | [1.x species infobox](https://web.archive.org/web/20130510040015/http://ffxiv.gamerescape.com/wiki/Antelope_Stag); Lowlands has no regional override |
| Hippogryph Pup | 60–64 | 23 | 39501 | [Original-release Extinct transcription](https://web.archive.org/web/20141015125406/http://ffxiv.gamerescape.com/wiki/Hippogryph_Pup) |
| Hippogryph | 70–74 | 37 | 39502 | Lowlands roster explicitly supplies this range |
| Inferno Drake | 75–79 | 25 | 39503 | [Working 2012 species page](https://web.archive.org/web/20120809153603/http://ffxiv.gamerescape.com/wiki/Inferno_Drake) |
| Maned Wyrmhound | 75–79 | 30 | 39504 | [Original-release Extinct transcription](https://web.archive.org/web/20190910065517/https://ffxiv.gamerescape.com/wiki/Maned_Wyrmhound); only Central Lowlands listed |
| Puroboros | 75–79 | 18 | 39505 | [1.x species infobox](https://web.archive.org/web/20130514232233/http://ffxiv.gamerescape.com/wiki/Puroboros) |
| Redwing Ked | 65–74 | 37 | 39506 | [Original-release Extinct transcription](https://web.archive.org/web/20190910171611/https://ffxiv.gamerescape.com/wiki/Redwing_Ked); species range, no recovered regional override |
| Scarred Kalong | 45–49 | 15 | 39507 | [Original-release Extinct transcription](https://web.archive.org/web/20190911221614/https://ffxiv.gamerescape.com/wiki/Scarred_Kalong) |
| Snurble | 60–64 | 20 | 39508 | Lowlands roster explicitly supplies this range |
| Toxic Toad | 45–54 | 31 | 39509 | [1.x species infobox](https://web.archive.org/web/20130515054254/http://ffxiv.gamerescape.com/wiki/Toxic_Toad) |

The user's **79–82 Inferno Drake estimate remains unconfirmed**. The requested
capture redirected to an unavailable page; a working older archive gives 75–79,
and its Lowlands row gives location `35–40` with no level override. Here, `35–40`
means historical map cell **35,40**, not enemy level. The implementation uses
75–79. No shared profile or Western Highlands range was changed.

The later Extinct pages above explicitly describe original-release enemies;
they are historical transcriptions, not claims about ARR populations. Ranges
from species infoboxes remain species evidence when the Lowlands row is blank.
The distinct Central Highlands Antelope Stag 50–54 row was not substituted.

## Ground and habitat review

The evidence snapshot is
`Data/mobplacements/evidence/ccl-20260912/zone_147.tsv`: **7,226 nodes and 1,376
captured edges**, SHA-256
`9e420f5f32f028ed8663a0f90c873944ad2ecc734d6675c5bc1fe218c9128aa5`.
It is a byte copy of the live recording at authoring time. Later recording
updates remain independent; this task did not merge or rewrite runtime navmesh
files. The supplemental premerge manifest has no zone-147 recording.

The native Coerthas outdoor transform is MapNavi **3000**, base `(3712,2144)`,
world map extent `6656 × 5120`, with 100 world units per grid cell. Horizontal
server coordinates are X/Z; Y is recorded elevation. Every spawn keeps a
source-local node ID, exact recorded XYZ, source hash, source line and stable
`map_...` identity. SQL rounds XYZ to the planner's standard three decimals.

Of the 261 retained placements, **81** have a captured local edge within 12 horizontal
units and 3 elevation units. The other **180** have at least two nearby recorded
samples within those bounds, explicitly labeled `nearby_recorded_samples`.
Those samples are contextual support for the recorded position; they are not
new captured edges and do not prove the intervening terrain or full roam circle
is traversable. No additional edges or elevations were invented.

There are **25 authored habitats**. Hippogryphs occupy western woods and the
northern lake approach; pups use the camp's outer approaches. Toads use recorded
lake shores and southern watercourse approaches. Drakes and Wyrmhounds occupy
opposite sides of Shepherd Peak and adjoining ridges; Keds fill Fellwood, with
Puroboros pockets, Kalongs in connecting passages, and Stags on southern and
eastern open ground. These assignments use the map and broad historical cells;
they are not recovered individual retail spawn positions.

Historical reference cells retained in the manifest are Stag **37,47**, Drake
**35,40**, Wyrmhound **37,41**, Ked **27,44**, Snurble **40,34**, and Toad **36,42**.
**Snurble cell 40,34 has no frozen recorded ground.** Its 20 mobs use nearby
authored northeastern and Teriggan-approach habitats instead. This is an explicit
habitat substitution, not a claimed reconstruction of the uncovered square.
Other habitats deliberately extend beyond a single historical reference cell.

Spawn centers have at least **27 yalms separation**, with **95 yalms** around
Camp Ever Lakes' aetheryte and **65 yalms** around other public NPCs and gates.
Eleven additional clearings and transition pockets remain open. The overview
and detailed northeastern, Shepherd Peak and Ram Lake crops were read during
review; positions stay on the recorded routes rather than interpolating into
undocumented lake interiors, cliffs or room centers. Clearance describes spawn
centers, not a runtime no-entry barrier for roaming or combat.

The existing map-coordinate calibration guide and confirmed test file were
loaded before authoring. No zone-147 point was added as user-confirmed, and
no whole-zone collision validation is claimed.

## Video review

- [Speakers Network: Coerthas Central Lowlands & Caravan Escort, Episode XXII](https://www.youtube.com/watch?v=iM-4Xu5Yt8Y&t=136s),
  published 2017-10-12: the 2:16 Shepherd Peak section shows a grassy gate approach
  with steep rock and pines. Used as retrospective terrain context; no extra
  ordinary species was established from the reviewed footage.
- [Lirion: Final Fantasy XIV — Coerthas run](https://www.youtube.com/watch?v=cfCRqoUIksI&t=898s),
  published 2011-10-01: description identifies the run to Camp Ever Lakes;
  reviewed 14:58 pine-lined slopes and 16:09 open grassy approach. An old
  Antelope Doe combat log does not prove its location in the visible scene.
  This footage predates the later roster, so it does not justify adding Doe.
- [Ryligh Kell: Patch 1.23a](https://www.youtube.com/watch?v=mmLOs4e0vv0), published
  2012-08-15: description covers the Atomos event at Ever Lakes and associated
  spawned enemies. Event enemies remain excluded.

An [earlier EXP camp guide](https://forum.square-enix.com/ffxiv/threads/18957-Grind-Camps/page13?highlight=Grind+camps&p=266762)
mentions Grass Raptors at Ever Lakes in 2011. Its 49–50 recommendation is a
**player-level bracket**, not an established enemy level range. This earlier
reference does not establish Grass Raptors in the supplied later-era roster;
they are recorded as an unconfirmed additional species and are not spawned.
No additional ordinary species was sufficiently established by this review.

## Profiles, artifacts and validation

The [manifest](../Data/mobplacements/coerthas_central_lowlands.json) pins exact
reviewed donors, their class-script hashes, the catalog combat overlay snapshot,
and all chosen nodes. Donors are 1370, 1037, 1338, 1317, 39104, 39019, 1195,
1242 and 1263. The native Hippogryph Pup actor **2100405** uses the shipped Lesser
Griffin initializer, identical to the reviewed donor initializer. Maned Wyrmhound
uses native Basilisk actor **2100713** and combat list **5006**. No native actor
binding or appearance row needed alteration.

The base catalog applies ranged-attack flags through later SQL UPDATEs, which
the literal-row parser does not project. These reviewed flags are therefore
explicit in the new profiles. Redwing Ked, Puroboros and Scarred Kalong retain
their respective floating offsets of **0.9, 0.8 and 1.0** above recorded ground.
Snurble remains passive. All ten profiles are ordinary, with their reviewed
family skills. **Hippogryph Pup, Maned Wyrmhound and Puroboros have no reconstructed
drop list** (`dropListId=0`); they do not borrow another named species' loot.
The other seven reuse existing same-species drop lists.

Use:

```powershell
python -B tools/mobspawns/coerthas_central_lowlands.py build
python -B tools/mobspawns/coerthas_central_lowlands.py check
python -B tools/mobspawns/coerthas_central_lowlands.py render
python -B -m unittest discover -s tools/mobspawns -p test_coerthas_central_lowlands.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
```

The canonical profile and spawn SQL contain a dedicated marked block; catalog
spawn IDs remain within **962000–962521**, with gaps for the removed rows. All pre-existing catalog content was compared
against Git and preserved, accounting for checkout line-ending normalization.
The [additive migration](../Data/sql/live%20migrations/coerthas_central_lowlands_20260912.sql)
inserts missing scoped profiles and stable placement identities. A conflicting
live profile is skipped using all reviewed fields; imports do not overwrite
existing profiles or placements. Rerunning the migration does not duplicate mobs.

If the earlier 522-mob population was already imported, apply
`Data/sql/live migrations/coerthas_central_lowlands_half_density_20260912.sql`.
It deletes exactly the 261 selected original public rows, matching UID, zone,
profile, name and original XYZ (with a 0.001 FLOAT tolerance). Moved or private
custom variants are skipped. It is idempotent and never deletes profiles. The
revised additive migration does not recreate the removed rows.

`Data/mobplacements/coerthas_central_lowlands/` contains the provenance plans,
exact-point capture CSV and `placements_append_only.sql`. These were inspected
before adding the canonical blocks. Import the full migration when the new
scoped profiles are not yet present; never run the old counter-based CSV
converter on this capture file.

Validation completed: **10 population/provenance/import/reduction tests and 18 coordinate
tests passed**; generated outputs match `check`. The interactive preview was
opened and visually reviewed, including layer toggles, species filtering,
Show all and zoom. Full roaming, collision and appearance review in-game remains
pending after deployment.

Representative exact recorded review points (not claimed as new live tests):

```text
Hippogryph Pup: !pos 147 -230.722 172.723 1290.141
Inferno Drake: !pos 147 -225.297 191.483 1987.483
Maned Wyrmhound: !pos 147 47.404 170.593 2049.272
```
