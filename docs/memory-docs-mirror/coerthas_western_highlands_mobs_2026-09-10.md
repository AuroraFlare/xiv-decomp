# Coerthas Western Highlands ordinary mob placements — 2026-09-10

453 public-world spawns across 15 ordinary species in zone **148**. No notorious monsters. The normal SQL catalogs now include the placements and 15 separately scoped profiles (39100–39114); existing profiles retain their original levels.

## Placement review

The user requested loose area populations around the legacy mob references. Initial habitats extend 155–210 world units from the center of the cited integer grid square, with at least 24 units between same-species spawns and 18 between different species. Goblin Freesword and Redhorn Ogre lack coordinates on the archive: their areas are explicitly authored choices. Napalm occupies two recorded pockets north and south of its map reference; its exact reference is unrecorded. Puroboros occupies recorded terrain south of its reference. These are approximate habitats, not recovered exact retail spawn points.

All XYZ come from individually frozen zone-148 movement recordings. Each habitat pins its own source; node IDs and captured edges remain local to that source. Every selected node has a captured edge to a distinct nearby node, within 8 horizontal units and 3 vertical units. No heights or cross-source edges were invented. SQL and the capture CSV use the standard three-decimal coordinate precision; plans retain full recorded precision.

The original zone-148 snapshot contains 5,086 nodes and 1,268 captured edges. The later Wyrmking expansion snapshot contains 6,544 nodes and 1,578 captured edges. Its frozen path and SHA-256 are in [the manifest](../Data/mobplacements/coerthas_western_highlands.json). The supplemental premerge inventory has no zone-148 file. The mutable live recording was not modified by this placement pass.

A zone header alone is not a regional boundary polygon. The general map tool was used to render the recording and each proposed habitat, and all 35 rendered habitat crops were visually reviewed against the western region. No new points approach the Central Highlands connection at (24,21). Selected spawns keep at least 95 units from Riversmeet aetheryte and 65 from other catalog NPCs/gates. This leaves room for the existing 50-unit idle roaming radius; combat pursuit has its existing runtime behavior.

The existing controller enables roaming (`roams=1`, delay 23 seconds) and prefers the zone-specific captured graph. Sparse captured components constrain actual roaming; the presence of a local edge is not proof that every destination within 50 units is reachable. The source is movement evidence, not a full collision mesh. In-game inspection remains pending.

[Overview](maps/coerthas-western-highlands-20260910/overview.png) · [Color legend](maps/coerthas-western-highlands-20260910/legend.png). The same folder includes one numbered crop and calibrated `.frame.json` per habitat.

## Levels and profile evidence

The user-directed enemy detail pages supersede the initial level estimates. A zone-specific range takes precedence over the species-wide infobox: Hippogryph uses the Western Highlands row 70–74, rather than the broader 65–74 infobox. Other infobox ranges are species-level evidence; the zone row generally leaves its level blank. User transcriptions are retained separately from browser-verified facts.

Counts below include the expansion; this table retains each species’ initial anchor. Additional authored anchors are listed in the expansion section.

| Species | Levels | Spawns | Historical grid / authored anchor | Exact BNPC / combat donor |
| --- | --- | ---: | --- | --- |
| gall_gnat | 45–49 | 21 | 18,24 | 39100 / 1159 |
| hippogryph | 70–74 | 93 | 12,17 | 39101 / 1037 |
| inferno_drake | 75–79 | 42 | 11,16 | 39102 / 1338 |
| napalm | 70–74 | 18 | 19,17 | 39103 / 1049 |
| puroboros | 75–79 | 11 | 11,14 | 39104 / 1049 |
| razorback | 70–74 | 38 | 16,12 | 39105 / 1038 |
| scarred_kalong | 46–50 | 10 | 19,27 | 39106 / 1195 |
| toxic_toad | 45–54 | 9 | 19,27 | 39107 / 1263 |
| smolenkos | 75–84 | 39 | 17,15 | 39108 / 1353 |
| spinesnap_ogre | 80–84 | 25 | 16,17 | 39109 / 1321 |
| velociraptor | 47–49 | 54 | 7,18 | 39110 / 1034 |
| wild_hog | 40–49 | 21 | 16,23 | 39111 / 1095 |
| goblin_freesword | 40–49 | 33 | 18,22 (authored) | 39112 / 1262 |
| redhorn_ogre | 70–74 | 21 | 16,21 (authored) | 39113 / 1304 |
| bandit_spearman | 45–49 | 18 | 16,24 | 39114 / 1310 |

The manifest records the source of each range. Gall Gnat, Inferno Drake, Wild Hog and Velociraptor use the user’s enemy-page transcriptions. The user supplied “46-50” as the remaining range in a reply about Scarred Kalong, Velociraptor and Wild Hog; this was interpreted as Scarred Kalong and stated back to the user.

Named client actor IDs, complete existing combat donors, and level variants are explicit. New species do not inherit unrelated donor loot: Gall Gnat, Razorback, Napalm and Puroboros use drop list 0 pending a separate loot review. Same-species variants retain their existing loot and combat lists. Puroboros uses its own `BombNormalStandard` actor and the exact standard bomb combat donor 1049; the two shipped bomb init scripts are byte-identical, checked by the generator. No shared runtime combat code was changed. The Bandit Spearman follow-up binds only actor 2180125, as detailed below.

## Deferred ordinary mobs

- **Mountain Peiste, 50–54:** confirmed in the enemy infobox and by the user. Historical reference (23,31) has no zone-148 sample within 200 units; the nearest is about 275 units from the square center. It lies beyond the southeast recorded ground in the map review. No placements were exported.


## Bandit Spearman follow-up

Six ordinary level-45–49 Bandit Spearmen now use profile **39114**, with catalog spawn IDs **5074–5079**. Existing 177 placement plans were compared before and after and remain identical. The six positions retain the frozen zone-148 node IDs and local captured edges and were visually reviewed in [the Bandit Spearman crop](maps/coerthas-western-highlands-20260910/bandit_spearman.png). Crowding from existing habitats limits this addition to six spaced points within 180 units of the (16,24) square center.

Client actor **2180125** already has its named Bandit Spearman appearance and display-name ID **3180125**. Its empty class path is now bound to the shipped `/Chara/Npc/Monster/Fighter/FighterEnemyLancerStandard`, with the standard battle-NPC property flags **23**. Appearance data and other bandit actor rows remain unchanged. This is an authored runtime binding, not a claim to have recovered its original client class path.

Exact combat donor **1310** supplies job **8 (Lancer)** and generic skill list **88**: True Thrust (27269), Heavy Thrust (27273), Impulse Drive (27275), and Feint (27278). The shipped lancer init scripts are byte-identical, checked by the generator. The donor's undead appearance and loot are not used; Bandit Spearman has spell list **0**, drop list **0** pending its own loot review, hostility enabled, and notorious flag **0**.

The combined migration fills only the expected empty actor binding, preserving its name. A conflicting live actor binding is left untouched and blocks Bandit Spearman spawn inserts. Seven scoped tests pass, including repeated imports, actor-binding conflict handling, identity preservation, and the new lancer profile. Model/combat behavior still needs in-game verification after import.

## Wyrmking and spare-ground expansion

The user supplied additional zone-148 recording and requested more ordinary mobs near Wyrmking’s Perch and other spare recorded areas. This adds **114 mobs in 12 habitats**, using the same 15 reviewed profiles and their existing levels. **39** are in the four Wyrmking habitats; **75** fill other reviewed terrain. The original **183** plans, including source nodes, XYZ, IDs and levels, were compared byte-for-byte as parsed objects and remain unchanged. A saved canonical digest protects that baseline in the regression suite. New canonical spawn IDs are **5080–5193**.

The live recording continued growing during inventory: it first showed 6,209 nodes; the frozen copy captured **6,544 nodes / 1,578 edges**. The original recording remains separate. `additional_sources.wyrmking_expansion` records the new path/hash, and every added habitat pins this source explicitly. No live recording was overwritten or concatenated with another.

These additional species territories are authored choices requested by the user, using the existing regional roster. They are not new historical coordinate evidence. All added points have a captured local movement edge and preserve recorded XYZ. Added spawns keep at least **32 horizontal units from every earlier placement and each other**, plus the existing 65-unit NPC/gate and 95-unit camp clearances. The new habitat radii are 140–185 units. Roaming remains enabled with its existing recorded-path constraints.

| Added area | Species | Added mobs | Authored grid anchor |
| --- | --- | ---: | --- |
| [Wyrmking north](maps/coerthas-western-highlands-20260910/wyrmking_north_drakes.png) | inferno_drake | 14 | 18,10 |
| [Wyrmking east](maps/coerthas-western-highlands-20260910/wyrmking_east_smolenkos.png) | smolenkos | 14 | 19,12 |
| [Wyrmking west](maps/coerthas-western-highlands-20260910/wyrmking_west_razorbacks.png) | razorback | 8 | 17,11 |
| [Wyrmking south](maps/coerthas-western-highlands-20260910/wyrmking_south_napalm.png) | napalm | 3 | 19,14 |
| [The Lance north](maps/coerthas-western-highlands-20260910/lance_north_hippogryphs.png) | hippogryph | 14 | 9,7 |
| [The Lance south](maps/coerthas-western-highlands-20260910/lance_south_razorbacks.png) | razorback | 14 | 11,9 |
| [The Lance approach](maps/coerthas-western-highlands-20260910/lance_approach_ogres.png) | redhorn_ogre | 5 | 13,10 |
| [Twinpools south](maps/coerthas-western-highlands-20260910/twinpools_south_raptors.png) | velociraptor | 10 | 8,20 |
| [The Fury’s Gaze](maps/coerthas-western-highlands-20260910/fury_gaze_hippogryphs.png) | hippogryph | 11 | 10,19 |
| [Ashpool shore](maps/coerthas-western-highlands-20260910/ashpool_west_raptors.png) | velociraptor | 10 | 4,15 |
| [Banepool south](maps/coerthas-western-highlands-20260910/banepool_south_drakes.png) | inferno_drake | 1 | 12,19 |
| [West of Riversmeet](maps/coerthas-western-highlands-20260910/riversmeet_west_goblins.png) | goblin_freesword | 10 | 15,18 |

Regression checks cover original-plan preservation, expansion clearance, source hashes and reserved-source protection, alongside the existing import/profile checks. All **nine** scoped tests pass. The combined additive migration can be rerun after an earlier import: existing stable IDs remain intact and the new placements are inserted. No live database import or server restart was performed.

## Additional Hippogryph coverage

The user recorded more ground around the western fields and requested a broader distribution, including positions beside the main route where ground evidence allows. A third frozen source, `additional_sources.hippogryph_expansion`, contains **7,047 nodes and 1,686 captured edges**. Its hashes, node IDs and edges remain separate from both earlier sources.

This adds **28 Hippogryphs at level 70–74**, using the already reviewed profile **39101**: 13 near the Banepool fields, 7 in the southwest fields, 3 in the eastern fields and 5 in the western fields. Hippogryph population is now **64**, and the complete pass totals **325 ordinary mobs**. Canonical added IDs are **5194–5221**. All preceding 297 placement plans are unchanged, protected by a second saved baseline digest.

Each added XYZ is a captured position with a local movement edge and at least 32 units of separation from other spawns. The four new crops show placement across recorded side loops and different parts of the fields. Map artwork is useful for reviewing the distribution but does **not** establish collision boundaries or elevations between samples. No arbitrary sideways offsets, extrapolated heights, or inferred cross-recording paths were used.

[Banepool fields](maps/coerthas-western-highlands-20260910/hippogryph_banepool_fields.png) · [Southwest fields](maps/coerthas-western-highlands-20260910/hippogryph_southwest_fields.png) · [Eastern fields](maps/coerthas-western-highlands-20260910/hippogryph_eastern_fields.png) · [Western fields](maps/coerthas-western-highlands-20260910/hippogryph_western_fields.png).

All **10 scoped tests** pass, including preservation of both previous placement passes, correct source-local XYZ and level/profile reuse, spacing, repeat imports and collision handling for database IDs. In-game terrain and behavior verification remains pending. The combined additive SQL has been regenerated but not imported into the running server.

## Eastern Wyrmking expansion

The user expanded the other part of Wyrmking’s Perch. The fourth frozen recording, `additional_sources.wyrmking_east_expansion`, contains **7,900 nodes / 1,897 captured edges**, with **860 exact XYZ positions absent from the earlier sources**. Its source path and SHA-256 are pinned in the manifest. Only newly captured ground in the eastern/southeastern Perch area was selected for this pass; unrelated new coverage elsewhere remains unused.

This adds **40 ordinary mobs**, bringing the total to **365**. All previous **325 placements in 31 habitats** retain their exact plans, source evidence, stable IDs and catalog IDs; a saved canonical digest verifies that baseline. New catalog IDs are **5222–5261**. Profiles and levels are reused unchanged.

| Added area | Species | Levels | Count | Authored grid anchor |
| --- | --- | --- | ---: | --- |
| [Upper eastern pockets](maps/coerthas-western-highlands-20260910/wyrmking_east_upper_smolenkos.png) | Smolenkos | 75–84 | 9 | 19,13 |
| [Eastern loops](maps/coerthas-western-highlands-20260910/wyrmking_east_drakes.png) | Inferno Drake | 75–79 | 13 | 21,14 |
| [Southeastern pockets](maps/coerthas-western-highlands-20260910/wyrmking_southeast_napalm.png) | Napalm | 70–74 | 10 | 21,16 |
| [Southwestern pockets](maps/coerthas-western-highlands-20260910/wyrmking_southwest_ogres.png) | Spinesnap Ogre | 80–84 | 8 | 19,16 |

The four crops were visually reviewed. Two candidates on the long southern ridge/descent connector (source nodes 7628 and 7638) were excluded to keep this pass in the Perch field pockets. Selected nodes preserve full captured XYZ, have local captured movement edges, and meet the existing 32-unit spawn spacing and NPC/camp clearances. No lateral offsets or extrapolated ground heights were used. Habitat extents and the species distribution are authored extensions, not newly recovered retail coordinates or proof of collision boundaries.

All **11 scoped tests** pass, including preservation of the 325-placement baseline, new-source-only positions within the reviewed area, original level/profile reuse, spacing, repeated additive imports and generated-file freshness. The combined SQL and maps are updated; no live database import or server restart was performed.

## Riversmeet infill and cave bats — 2026-09-12

The user's two red screenshot outlines now contain **19 additional mobs**:
6 Wild Hogs and 8 Goblin Freeswords in the long northern/eastern outline,
and 5 Gall Gnats in the smaller southern outline. The separately requested
cave at **19,27** has **2 additional Scarred Kalongs**. Existing profiles and
levels are unchanged. The 365-placement baseline is protected by a canonical
plan digest; new catalog IDs are **5262–5282**.

The 724×994 screenshot was calibrated against the complete Coerthas artwork:
one screenshot pixel corresponds to one native navigation unit, with navigation
origin `(1396,1750)`. Grid spacing, river confluences, lake outlines and the
Riversmeet artwork align; sampled grayscale correlation is 0.819. Allow about
2 pixels of alignment uncertainty. Inset selection polygons, screenshot hash,
and calibration are saved in `riversmeet_infill_review` in the manifest.

Every addition uses exact XYZ and a local captured edge from the separately
frozen `cwh-riversmeet-20260912/zone_148.tsv` source. Field additions retain
32-unit mob clearance; the already populated cave uses 24-unit clearance.
The two cave nodes remain inside grid square 19,27, with recorded ground Y
317.946 and 317.685. No live recordings were modified. The four new calibrated
crops were visually reviewed:
[north](maps/coerthas-western-highlands-20260910/riversmeet_infill_upper_north.png),
[southeast](maps/coerthas-western-highlands-20260910/riversmeet_infill_upper_south.png),
[southern pocket](maps/coerthas-western-highlands-20260910/riversmeet_infill_lower.png),
[cave](maps/coerthas-western-highlands-20260910/riversmeet_infill_cave.png).

Napalm/Puroboros profiles already specify floating height **0.8** and Scarred
Kalong specifies **1.0**. The server copies this value from the mob profile and
includes it in spawn, teleport and movement packets, separately from ground Y.
The combined migration now repairs zero heights on these three exact regional
profile/actor/name identities. It preserves nonzero custom heights and leaves
other identities unchanged. No missing floating value was observed in the
repository; the live database and visual hovering were not verified.

All **14 scoped tests** pass, including unchanged baseline plans, polygon/cave
containment, captured source XYZ, actor clearance, repeat import, zero-offset
repair and preservation of custom heights. Generated-file checking also passes.
No live SQL import or server restart was performed. Ground recordings and map
review do not establish collision or visual hovering; in-game checking remains
necessary after import and restart.

## Expanded bandit recording — 2026-09-12

The user's expanded navmesh supports **12 more Bandit Spearmen**, for **18 total**.
They use the existing profile **39114**, levels **45–49**, in the western and
southern lakeshore pockets around the original **16,24** reference. This is an
authored expansion within 200 units of that square's center. All 12 XYZ are
absent from the five earlier frozen source recordings and each has a captured
local movement edge. They retain 32-unit mob spacing and the standard NPC/camp
clearances. The [numbered placement crop](maps/coerthas-western-highlands-20260910/bandit_expansion_lakeshore.png)
was visually reviewed before updating the catalogs.

The frozen `cwh-bandits-20260912/zone_148.tsv` contains **7,927 nodes and 3,174
captured edges**. Its hash and source-local node selections are saved separately
in the manifest; the live file continued growing during the review and was not
modified by the authoring tool. A canonical digest verifies that all prior
**386 placements in 39 habitats** remain unchanged. New catalog IDs are
**5283–5294**. No profiles, levels, combat behavior or floating offsets changed.

All **15 scoped tests** and generated-file checks pass, including previous-plan
preservation, new-source-only XYZ, spacing, repeat import and bandit actor-binding
guards. The combined migration is updated; no live import or restart was done.
The map and movement recording do not replace an in-game terrain/roaming check.

## Twinpools density increase — 2026-09-12

The user requested roughly 50% more mobs in the Twinpools screenshot. The
selected connected fields contained **111 existing mobs**; **55 additions**
bring that area to **166**, an increase of **49.55%**. This count is scoped to
the calibrated screenshot polygon, not the entire zone. The isolated riverbank
in the screenshot's southeast corner is excluded.

| Species | Before in selected area | Added | After |
| --- | ---: | ---: | ---: |
| Hippogryph | 50 | 29 | 79 |
| Velociraptor | 36 | 18 | 54 |
| Inferno Drake | 10 | 5 | 15 |
| Puroboros | 10 | 1 | 11 |
| Goblin Freesword | 3 | 1 | 4 |
| Spinesnap Ogre | 2 | 1 | 3 |

The 1204×962 screenshot matches the archived artwork at native navigation
origin `(336,1406)`, with one native unit per pixel. Lake outlines, grid and
Twinpools/Fury Gaze artwork were checked visually; a coarse grayscale match
scored 0.837 within two pixels of that origin. The manifest preserves the
screenshot hash, polygon, original 111 catalog rows, species counts and the
roughly three-pixel calibration tolerance.

All new XYZ use the separately frozen `cwh-twinpools-20260912/zone_148.tsv`
recording and source-local captured edges. Each spawn is within 160 horizontal
units of an existing same-species spawn in the selected area. A 32-unit
clearance could not support the requested increase, so this density pass uses
**24-unit clearance** from existing mobs and between new mobs. NPC/gate
clearance remains 65 units and Riversmeet camp clearance remains 95. The bomb
territory only supported one addition with those constraints; the remaining
population increase favors Hippogryphs and Velociraptors. This is authored
density, not evidence of exact retail spawn distributions or terrain collision.

All six new numbered species crops (`twinpools_density_*.png`) were visually
reviewed before updating the catalogs. Existing profiles, levels, floating
offsets and all **398 prior placement plans** are unchanged, checked by a
canonical digest. New catalog IDs are **5295–5349**. The **16 scoped tests**
pass, including exact source XYZ, polygon containment, baseline count and row
preservation, same-species proximity, spacing, and repeated additive imports.
No live database import or restart was performed; in-game checking remains
pending after importing the updated migration and restarting Map Server.

## Regeneration and import

```powershell
python -B tools/mobspawns/coerthas_western_highlands.py build
python -B tools/mobspawns/coerthas_western_highlands.py check
python -B tools/mobspawns/coerthas_western_highlands.py render
python -B -m unittest discover -s tools/mobspawns -p test_coerthas_western_highlands.py
```

`build` uses reviewed node IDs and frozen hashes; it never reselects positions from a later recording. Canonical spawn IDs are 4897–5349, inserted before the catalog’s dynamic NM ID allocation. This preserves the existing NM section and its allocation behavior.

For an existing database, use only the [additive migration](../Data/sql/live%20migrations/coerthas_western_highlands_20260910.sql). It inserts the 15 scoped profiles and uses the map planner’s stable-ID append-only placement statements. Existing rows are not replaced; the three guarded zero floating-height repairs described above are the only updates to existing mob profiles. Spawn insertion checks profile actor, name, levels, ordinary/hostile flags and combat lists, so a different live profile occupying a reserved ID is skipped rather than used. Expected additions on a fresh import are 15 profiles and 453 placements, or 55 placements after the previous 398-placement import; inspect import counts before restarting Map Server. No live database import or server restart was performed by this pass.

[Generated plans](../Data/mobplacements/coerthas_western_highlands/plans.json) include exact source nodes, XYZ, profile IDs, evidence, and `!pos 148 X Y Z` commands. The companion `mobspawns.csv` contains individual points with zero count/distance; do not run the counter-based converter on it. `placements_append_only.sql` requires the reviewed profiles already installed; the combined migration installs profiles, the scoped actor binding, and placements.

Validation executes the additive migration twice against an isolated SQLite schema, checks existing-row preservation, profile-ID collision handling, exact positions, zone ownership, corrected level ranges, ordinary-mob flags, donor combat and loot isolation, and generated output freshness. The 18 existing map-coordinate tests also passed. SQLite checks do not substitute for a live MySQL import or in-game terrain/roaming test.

## Historical sources

The requested [May 10, 2013 zone page](https://web.archive.org/web/20130510105047/http://ffxiv.gamerescape.com/wiki/Coerthas_Western_Highlands) was opened in the browser. Its 16-species list and coordinates match the saved April 25 local page; individual enemy links resolve to different capture dates. Some nearest captures had already changed to ARR content and were not used for legacy levels. Exact detail-page links and user corrections are preserved per species in the manifest.
