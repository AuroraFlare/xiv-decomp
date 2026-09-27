# Shposhae ordinary population — 2026-09-12

Prepared **149 new mobs across all twelve ordinary types and all five native
map pages**, in **zone 235**. No guildleve mobs, NMs or NM adds were placed.
Entrances, transition windows and authored NM spaces have room to move.
The repository SQL is ready; **no live database import or server reload was performed**.

## Roster and sources

The [requested May 11, 2013 Shposhae capture](https://web.archive.org/web/20130511052543/http://ffxiv.gamerescape.com/wiki/Shposhae)
contains twelve ordinary species and four separately listed NMs. All ordinary
levels and aggression flags below come from its Shposhae table, not ARR pages.

| Ordinary mob | Level | Aggressive | Added | BNPC | Named client actor | Reviewed donor |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| Aurelia | 17–19 | Yes | 19 | 39380 | 2105401 | 1232 |
| Black Bat | 15–16 | No | 17 | 39381 | 2104103 | 1208 |
| Gloom Lurker | 17–18 | Yes | 5 | 39382 | 2109915 | 1191 |
| Gloom Seeker | 15 | No | 1 | 39383 | 2109914 | 1191 |
| Gripper | 15–17 | Yes | 21 | 39384 | 2107617 | 1065 |
| Jackal Pup | 18–21 | Yes | 16 | 39385 | 2101416 | 1117 |
| Shade Lurker | 15–16 | Yes | 6 | 39386 | 2109907 | 1191 |
| Shade Seeker | 15 | No | 1 | 39387 | 2109906 | 1191 |
| Shadow Lurker | 16–17 | Yes | 6 | 39388 | 2109913 | 1191 |
| Shadow Seeker | 15 | No | 1 | 39389 | 2109912 | 1191 |
| Spawning Orobon | 16–19 | Yes | 18 | 39390 | 2104511 | 1077 |
| Spelaean Slug | 16–19 | Yes | 38 | 39391 | 2104215 | 1221 |

The donor aggression values differ for Aurelia, Black Bat, Gripper, Slug and
the passive Seekers. Only the new scoped profiles receive the archive flags;
outdoor profiles and placements retain their current behavior and levels.
Full donor rows, named actor IDs, class paths, levels and source claims are
pinned in `Data/mobplacements/shposhae.json`.

Eleven actors match their donor's class exactly. The existing `black_bat`
profile 1208 binds actor 2104102, whose client name is Cave Bat and class is
BatNormalStandard. New actor **2104103** is explicitly named Black Bat and uses
BatStandard. Both initialization scripts are byte-identical; their paths and
hashes are frozen in the reviewed exception. The shared profile is not changed.
Combat settings remain representative same-family defaults, not reconstructed
retail skill tuning.

Period footage inspected:

- [sambonz, Shposhae Dungeon, 10:09](https://www.youtube.com/watch?v=LWIo_CD2mBM&t=609s):
  three Black Bats are visible together along a passage. This corroborates an
  ordinary grouped population; no exact level or server coordinate was inferred.
- [Krimzon GamingUK, Mythril Chest Treasure Hunt, 0:41](https://www.youtube.com/watch?v=c1L7ZbKIK_8&t=41s):
  multiple Shadow Lurkers and a Spelaean Slug are visible along the mythril
  coffer route. This supports the mixed population on the associated map page.
  The source title/description identifies patch 1.19. The screenshot was not
  used as a calibrated coordinate frame.

The Shade Seeker subpage requests redirected to an ARR beta/Patch 2.0 Sastasha
entry at level 12; that page was rejected. The retrieved
[Gloom Seeker page](https://web.archive.org/web/20130511052543/http://ffxiv.gamerescape.com/wiki/Gloom_Seeker)
explicitly describes an extinct original-release mob at level 15 in Shposhae.
The main legacy roster supplies all three Seekers' levels and passive status.

**Seekers are a limited static representation.** One passive, non-roaming
Seeker is placed on each associated map (Shade 2, Shadow 3, Gloom 5).
Client `worldMaster.csv` messages 60071–60073 mention their disappearance.
Their special disappearance/encounter behavior is not reconstructed here;
no claim is made that the persistent stand-ins reproduce the retail event.

Giant Remora (3042), Remora (3091), Lone Coeurl (3067) and Shearing Sheridan
(3096) remain excluded. They have staged profiles in the loot SQL, but no
existing static spawn rows in the canonical repository. Custom live NM rows
are preserved by the scoped migration. Ordinary static presence does not
implement NM triggers, coffer keys or the Call of Booty event.

## Ground and page assignments

The transferred recording is frozen byte-for-byte as
`Data/mobplacements/shposhae/evidence/zone_235.tsv`:

- **2,445 exact XYZ nodes and 1,265 captured edges**.
- SHA-256: `e39cc1dc29e4709c73560bf36b8e89251dab8db96577ccc45e2593435ea48c92`.
- Recorded Y spans **−111.78445 to 27.344355**. New mobs retain their individual
  measured elevations; the lower areas are not flattened onto the entry level.
- Only one source existed under `Data` before freezing. The required September 9
  supplemental inventory contains no zone 235. No sources or inferred links
  were merged, and the live recording was not edited.
- Every selected spawn has a captured local edge of 0.75–8 horizontal units
  and at most 3 vertical units. Source-local node IDs and line provenance remain
  in every generated plan.

All five pages independently bind region 101, layout 114, place 1122 and scale 2.
Client `_zoneParam[235]` also binds place 1122. Each 2560×2048 page has its own
offsets; it never borrows the parent La Noscea transform.

| Map | Native MapNavi | Base X/Z | Piece | Reviewed samples | Added mobs |
| --- | ---: | --- | ---: | ---: | ---: |
| 1 | 5000 | 511 / 479 | 1091 | 922 | 51 |
| 2 | 5002 | 544 / 607 | 1093 | 409 | 23 |
| 3 | 5003 | 448 / 496 | 1095 | 442 | 27 |
| 4 | 5004 | 544 / 256 | 1097 | 331 | 27 |
| 5 | 5005 | 608 / 240 | 1099 | 206 | 21 |

Page assignments were reviewed against **all five native artworks**, the
recorded XYZ/elevation bands and bounded windows of the recorded traversal.
The recorder does not contain an active map-page field. These are reviewed
assignments, not recovered client page metadata or user-confirmed floor tests.
The manifest pins exact sample membership, height bands and reviewed source
windows; 135 transition/ambiguous samples remain unassigned. Numeric node order
does not establish movement connectivity: only captured edges are drawn or
used for placement validation.

The [five-page review](maps/shposhae-20260912/index.html) separates samples and
mobs by reviewed page. The [contact sheet](maps/shposhae-20260912/all-pages.png)
provides an overview. Each detail crop and full native overlay has its own
`.frame.json`; use that frame's map rectangle and realized X/Z pixel scales.
All five PNGs were visually inspected against the native passages.
Saved coordinate validations contain no confirmed Shposhae point. Live map-grid,
floor transition and roaming checks remain pending.

## Distribution and clear space

The ordinary mix is authored from the recorded passages and archive ecology.
Black Bats occupy entrance/upper passages; Grippers fill upper and second-page
branches; Aurelia and Orobon use sampled waterside routes; Slugs occupy several
connecting routes; Jackal Pups concentrate on map 4. The three Lurker tiers
follow the associated coffer pages: silver/map 2, mythril/map 3, steel/map 5.
The coffer association supports a habitat hypothesis, not exact retail XYZ.

Archive integer X/Y values describe grid squares. Their page identity is often
unspecified; the raw references remain in the manifest instead of being treated
as exact spawn coordinates. Seeker placements lie within their listed 5,4 cell
on their authored pages. Shade/Shadow core habitats follow their listed cells;
Gloom Lurkers also use the neighboring recorded chamber. The general population
uses broader authored habitats rather than claiming strict historical confinement.

New mobs at nearby elevations (Y difference at most 9) are separated by at least
**21 horizontal units**; within each habitat spacing is **23–25 units**. Distinct
stacked levels do not exclude each other merely because X/Z overlaps. The
entrance has a 45-unit buffer around X286/Z350. Authored Sheridan, Remora and
Coeurl spaces have 24–27-unit buffers on maps 2, 3 and 5. These are deliberately
open spaces, **not recovered NM spawn coordinates** and have no invented Y.

Recorded samples are not a triangulated collision surface or proof that every
random roaming step is safe. The work places mobs on captured ground; retail
spawn density, complete encounter scripting and collision coverage are separate.

## Existing server mismatch and loot scope

As documented in the [earlier Shposhae map review](shposhae_map_review_2026-09-12.md),
the server labels zone 235 `sea0Dungeon02`, and its twelve named Shposhae doors
use layout 112 at coordinates outside every real layout-114 Shposhae map. Those
rows were not used as terrain anchors and are unchanged. All new mobs use the
recorded numeric zone **235**. This population does not repair unrelated door
bindings or alter the earlier seamless-zone runtime fix.

Aurelia and Black Bat retain their same-named donor drop lists (1232 and 1208).
Other new named types use `dropListId=0` pending loot review. No donor's unrelated
loot, speculative coffer-key chance or treasure-table change was introduced.
Existing coffer definitions, loot SQL, NPCs and leve layouts are hash-protected.

## Generated files and validation

- Manifest: `Data/mobplacements/shposhae.json`.
- Full-precision plans, exact-point CSV, append-only SQL and frozen evidence:
  `Data/mobplacements/shposhae/`.
- Canonical profiles: **39380–39391**; canonical spawn IDs **960318–960466**.
- Existing-database migration: `Data/sql/live migrations/shposhae_20260912.sql`.

Use the scoped migration for an existing database, followed by a Map Server
reload. It retains stable placement IDs, skips conflicting BNPC profiles, and
preserves existing mobs and custom NMs. Do not run the old counter-based CSV
converter on the isolated capture file.

```powershell
python -B tools/mobspawns/shposhae.py build
python -B tools/mobspawns/shposhae.py check
python -B tools/mobspawns/shposhae.py render
python -B -m unittest discover -s tools/mobspawns -p test_shposhae.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
```

All **eight Shposhae tests and 18 coordinate tests pass**. They cover native page
offsets, exact XYZ, source-local edge support, page separation, spacing, roster
levels/aggression, non-roaming Seekers, reviewed class hashes, repeat imports,
profile conflicts, FLOAT32 comparisons, and preservation of custom NM/quest/
outdoor rows. SQLite validates migration semantics; no live MySQL import or
in-game traversal was performed.
