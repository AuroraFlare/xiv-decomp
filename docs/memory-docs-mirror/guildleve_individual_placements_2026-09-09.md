# Individual level-30 and level-40 guildleve placements

All **102 ordinary regional battlecraft leve layouts** now use recorded movement ground. Four use measured video-map estimates, 97 use authored recorded-ground locations, and one retains the previous connected layout. These are project changes, not a claim of live terrain validation or exact retail reproduction. The [Nanawa follow-up](guildleve_nanawa_authored_2026-09-09.md) replaces its earlier manual-capture layouts with the new movement recording and conservative routes along saved trails.

[Open the per-leve map gallery](maps/guildleve-individual-20260909/index.html). It includes 94 placement maps and eight Nanawa point diagrams. Nanawa lacks standalone terrain artwork in the local archive; its diagrams use its own client coordinate frame. The images show only areas actually used by each encounter. Their companion `.frame.json` files describe the exact rendered crop.

Follow-up: [shared fleeing rebuild and route correction](guildleve_flee_rebuild_2026-09-09.md) removes per-waypoint pauses and unnecessary detours, links the survivor with its arrival pack, and selects nearby arrival slots. Eight level-30/40 leve courses were replaced using frozen ground, and all 27 standard survivor chases use the shared route simplifier. User review restored 12484's original course and added required bends at four corners in 13025; required points cannot be simplified away. The [current escape-route gallery](maps/guildleve-flee-routes-20260909/index.html) supersedes escape lines in the earlier placement gallery. The later Nanawa pass also updates its circles and spawn slots in both placement galleries. After the Nanawa and Treespeak follow-ups, the current inventory has 2,732 spatial leaves, all at exact recorded movement XYZ; the larger counts below describe the original placement pass. Inferred connections still require live terrain testing.

## Footage reviewed and locations recovered

Reviewed **284 paused samples from 71 title-matched videos**: two early samples and two near the middle of each recording. Also scanned the eight previously saved storyboards for map views, then opened useful map timestamps in the public player. This is sampled review, not 71 complete playthroughs. Other candidate URLs from the older search were not all watched. The [review ledger](../outputs/guildleve-placement-review-20260909/review-ledger.json) records URLs, actual playback timestamps, frame paths and hashes.

| Leve | Source and observed map | Placement outcome |
| --- | --- | --- |
| 13024 — Tracking the Pack | [Video at ~25 seconds](https://www.youtube.com/watch?v=yck2U_I879c&t=25s); map registration has 367 inliers | First encounter moved to recorded ground within 3 yalms of the estimated circle center. The subsequent chase destination/path is authored. |
| 13028 — Necrologos: The Moons' Mistress | [Video at ~126 seconds](https://www.youtube.com/watch?v=jS-oK5Pm1aI&t=126s); map registration has 544 inliers | First two areas moved into the two observed rooms, within 5 yalms of the estimates. The third replacement-wave area is authored. |
| 10906 — Keeping the Peace | [Video at ~38 seconds](https://www.youtube.com/watch?v=jx7jV8pzHEQ&t=38s); map registration has 24 inliers | Defense moved near the observed southern location. The selected recorded center is about 36 yalms from the video estimate: a nearby reconstruction, not an exact recovered center. |
| 12508 — All Nine Ivies is a Stage | [Video at ~25 seconds](https://www.youtube.com/watch?v=l69QrgoHBpk&t=25s); map registration has 583 inliers | The new Nine Ivies recording covers the observed clearing. The defense center now uses exact recorded XYZ **2014.7753, 20.382423, -816.0411**, **13.35 yalms** from the estimated video center and **316.13 yalms** from camp. The earlier approximately 96-yalm coverage gap is resolved; the image estimate still carries 15 yalms of horizontal uncertainty. |

The authoritative observations are in `Data/guildleveplacements/video_location_observations.json`. Registration maps a saved video image to the appropriate archival map; outdoor maps use the established transform, and Mun-Tuy uses its own dungeon transform. Circle centers are manually estimated and carry a conservative 15-yalm horizontal uncertainty. Neither image registration nor nearby recorded XYZ constitutes user confirmation. The confirmed coordinate-validation file was not changed.

Most sampled videos show combat, a small minimap, or title cards without enough readable map detail to recover a circle center. Their new locations are labeled **authored**, even when their monster/terrain context was visually reviewed. No claim that most placements were recovered from video is made.

## Separation and reuse

The runtime now looks up placements by **guildleve ID and camp**, so editing one leve does not move every leve at its camp. The old camp lookup remains available to existing callers. The new frozen manifest is `Data/guildleveplacements/regional_level30_40_individual.json`; the earlier camp manifest remains a fallback and historical baseline.

For authored layouts, outdoor centers stay at least **160 yalms** from their camp and spawn slots at least **100**; dungeon centers use **100** and slots **60**. Video anchors may be closer, with measured distances preserved. The native circles remain radius **64**. Twelve slots per area use exact recorded XYZ, at least two yalms apart, within 42 units of their center, with four yalms of clearance from cataloged public actors. These are authoring constraints, not collision tests.

Area selection prefers nearby distinct pockets around each leve's first area. Connected chase paths are generated only when the encounter uses them. Ordinary spawn/search areas each retain their own recorded access paths; this does not assert a captured travel route between every pair of areas. Some circles still overlap, especially along narrow chase corridors. Broken Water's sparse usable coverage also produces widely separated reused pockets.

All eight/nine active circle sets differ within each recorded camp except Broken Water. **11723 / 11725 / 11726 / 11727 / 11729** share the same three physical circles, sometimes in a different order. When preserving area order, only **11723 / 11729** and **11725 / 11727** match exactly. Other leves can reuse individual circles or nearby terrain while retaining a different overall layout. See [coverage details](regional_guildleve_individual_coverage.json) for both comparisons and camp distances.

The remaining retained chase layout is **11724 — Netting the Gnats** (Broken Water). Its frozen recorded graph could not support the new camp-clearance/separation constraints. It still has a circle center about six yalms from camp; this is an explicit exception, not evidence that every leve now clears the aetheryte. The new Treespeak recording resolves **12524 — Do Toads Dream**'s former exception.

## Remaining ground and live checks

- **Nanawa Mines (176):** all eight layouts now use a frozen 1,234-point movement recording. The two flee routes follow captured links and short gaps between consecutive saved nodes; undotted passages are excluded. Every circle center clears 100 yalms from the gate. The former 84.4-yalm exception is retired. Live testing is still required.
- **Nine Ivies (151):** the 12508 clearing is now covered by the new 5,311-point / 5,472-link snapshot. Its defense circle and spawn slots use recorded ground and captured access links; live encounter testing remains. More recording is not required for this placement.
- **Treespeak (152):** the 12524 follow-up below replaces its retained chase using newly captured paths. All nine Treespeak layouts have distinct overall circle sets and their active centers clear 160 yalms from camp. Live testing remains.
- **Broken Water (174):** more connected ground away from camp would allow replacement of the remaining retained chase layout and reduce circle reuse.
- **Cassiopeia Hollow (132):** positions are recorded XYZ, but its sparse high-speed recording requires explicitly listed short inferred links. These need live route tests; they are not recorded movement edges.
- All revised encounters need normal in-game terrain/playthrough testing. No live server restart, database import, public-world mob placement, or movement-recording overwrite was performed.

This pass changes spatial configuration only. Existing enemy counts, objective families, rewards and mechanics remain in their per-leve specifications. Ordinary regional chases use the recorded/inferred retreat routes described above; this does not implement or certify separate Grand Company escort contracts.

## Nine Ivies recording follow-up

Only **12508** was reauthored from the new recording. The other 101 manifest entries, including all reviewed flee courses, remain unchanged. This leve uses one active defense circle; its two unused authoring areas do not create extra objective circles at runtime. Its existing five-minute defense, gnat waves and final flytrap/plasmoid party are unchanged.

The separate snapshot is `Data/guildleveplacements/individual-evidence/nine-ivies-20260909/zone_151.tsv`, SHA-256 `e8e9cacfcf7bea0735b347634a3d51f94c8909dfe79991c552d8d4146a500acd`. Older Nine Ivies layouts retain their original evidence file because some node IDs in the live recording changed. `author_zone` authored only 12508 from this snapshot and the saved video observation; the full nine-ID camp membership was restored before manifest validation. The [updated map](maps/guildleve-individual-20260909/index.html#12508) was inspected before installation.

For a live placement check: `!pos 151 2014.7753 20.382423 -816.0411`. The recording provides this point's elevation; the map and video do not certify collision or exact retail positioning. No server restart or deployment was performed.

Follow-up validation passed: 54 level-40 encounters / 324 completion runs plus defense and separation cases; all 102 position overlays / 2,697 spatial leaves; 18 individual-placement regressions; generated Lua synchronization; and exact frozen-XYZ verification for every runtime location. Manifest comparison confirms that only 12508 changed. The counts in the original-pass checklist below are historical.

## Treespeak recording follow-up

Only **12524 — Do Toads Dream** changed in this follow-up; the preceding Nine Ivies update and the other 100 layouts remain intact. The new frozen snapshot contains **5,618 points / 4,531 captured links** at `Data/guildleveplacements/individual-evidence/treespeak-20260909/zone_152.tsv`, SHA-256 `0fe7e106b00caa600dbf7bfad14cc2658a9766b06e4e243c202b960ca989e7e5`.

Three authored areas progress west and then southwest of camp. Their centers are **171.33, 274.60 and 344.98 yalms** from the camp anchor; every spawn slot clears **133.03 yalms**. The centers use frozen nodes **5371, 5516, 5548**. Each area's 12 slots follows the same spacing, radius, public-actor clearance and captured-access constraints as the other layouts. These are authored positions, not locations recovered from footage.

Two shortest captured-edge escape legs connect those centers, sharing only the middle endpoint and never retracing the first course. Each has 33 recorded points and is approximately **121 yalms** long. The production C# optimizer reduces them to **6 / 8 points** and **107.23 / 119.27 yalms**. Node 5358 on leg one and nodes 5528, 5532, 5535 on leg two are required terrain bends. Runtime shortcuts still depend on live collision checks. The original layout is preserved under `previous_placement` in the route audit; the new before/after images compare the new captured courses against their simplification.

The [placement map](maps/guildleve-individual-20260909/index.html#12524) and both [escape previews](maps/guildleve-flee-routes-20260909/index.html#leve-12524-1) were visually reviewed. The encounter's four initial toads, two HP-triggered retreats and one reinforcement after each arrival remain unchanged. For a starting-area check: `!pos 152 -1058.4453 20.044815 -2174.6294`.

Validation passed: 54 level-40 encounters / 324 completion runs plus defense and separation cases; all 102 position overlays / **2,732 spatial leaves**; 19 individual-placement regressions; actual C# route optimization; generated Lua synchronization; and exact frozen-XYZ verification for every runtime location. The updated position overlay was empty and its signature was refreshed. No live server restart or deployment was performed.

## Regeneration and checks

Author a new reviewable draft with `python -B tools/mobspawns/individual_guildleve_placements.py <new-draft-directory>`. Inspect its frozen manifest, evidence and rendered maps before installing it. The selected manifest and `individual-evidence` directory belong in `Data/guildleveplacements`; retain the earlier `evidence` directory for the remaining reused layout and historical route evidence. Do not overwrite current quicknavmesh recordings.

Generate Lua with `python -B tools/build_regional_guildleve_placements.py`. If structural route lengths changed, use the existing position validator's `-RefreshEmptyOverlays -ExportManifest -ExportLocations <path>` mode, which refuses to overwrite nonempty captures, then run the validator normally. `encounter_geometry_requirements.json` records actual route paths used by each encounter; the runtime location audit checks that it still matches the builders.

Validation completed:

- 48 level-30 Lua encounter simulations, including the separated-circle chase regression.
- 54 level-40 encounters: 324 completion runs, nine unattended-defense cases and 12 separated-circle regressions.
- 102 position-overlay checks covering **2,888 runtime spatial leaves**; **2,772** belong to the 94 recorded-ground encounters and match frozen XYZ.
- 22 placement/provenance regressions and 18 coordinate-calibration tests.
- Generated Lua matches frozen inputs. Gallery selection, image loading, missing-ground display and desktop/mobile layout passed browser checks.

The level-40 test fixture was updated to read the new per-leve lookup when checking markers and separating test areas; it had previously compared actual per-leve markers against the old camp template.
