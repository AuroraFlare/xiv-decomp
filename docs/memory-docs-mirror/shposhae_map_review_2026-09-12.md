# Shposhae map and recording recheck

**Resolved after the user copied data from the other server:** the Shposhae recording is now present at `Data/quicknavmesh/zone_235.tsv`. It contains **2,445 exact recorded XYZ points and 1,265 captured links**. Its SHA-256 is `e39cc1dc29e4709c73560bf36b8e89251dab8db96577ccc45e2593435ea48c92`; the project file matches `D:/navmesh/quicknavmesh/zone_235.tsv` byte-for-byte. The earlier searches inspected copies that did not yet contain this recording; they were not evidence of a recording failure.

The five Shposhae overlays and navigation-only PNGs now show this source, and `recordings.zip` includes its original TSV. Recorded Y ranges from **-111.78445 to 27.344355**. The format does not identify the active map page, so all recorded elevations are projected on each page for comparison. This does not assign a sample to a floor or establish connectivity beyond the captured links.

Copperbell also arrived: `zone_178.tsv` contains **71 points / 38 links**, SHA-256 `698f31ad8a45c3f1db738c8f7512481e4b89a17bfdbed79e0b15ca875bfe17b6`. Its current coverage is concentrated near the entrance, not the full dungeon. Tam-Tara's live recording increased to **947 points / 1,208 links**. These updated recordings are included in the refreshed gallery and archive.

The five images in the [dungeon gallery](maps/dungeon-navmeshes-20260912/index.html#zone_235_map_5000) are the correct **client Shposhae artwork**. This identification is stronger than the gallery's earlier generic “binding needs review” wording. The unrelated server door bindings do need review.

## Map identity

- Client `docs/Dat Mining/_zoneParam.csv` maps zone **235** to place **1122**.
- `xtx_placeName.csv` identifies place 1122 as **Shposhae**.
- MapNavi rows **5000, 5002, 5003, 5004, 5005** identify the five map pages, all in region **101**, layout **114**, at scale **2**. Their distinct offsets are retained in the gallery frames.
- Native map pieces **1091, 1093, 1095, 1097, 1099** use texture resources **40897–40901**, each 2560 × 2048. The artwork is extracted from those client resources.
- The client/content reference in `docs/open_world_dungeon_doors.md` identifies Shposhae as `sea0Dungeon04`; the layout inventory independently associates that internal name with layout 114.

This identifies the artwork and client parameters. It does not confirm displayed map-grid readings, floor membership for future recordings, or ground heights.

## Separate server-data mismatch

`Data/sql/server_zones.sql` labels zone 235 `sea0Dungeon02`. The existing 12 `shposhae_door_3679`–`3690` event-NPC rows use layout **112**, with X **-2064 to -1568** and Z **-1408 to -1168**. Every one is outside all five Shposhae map frames. The client/content reference identifies `sea0Dungeon02` as a different, unreleased Limsa dungeon.

The existing `!warp shposhae` command instead uses zone 235 at XYZ **286, 27, 350**, in the Shposhae coordinate range. The newly copied recording starts with that same point as node 1. A recorded starting warp is not a separate user-confirmed floor test; do not use it to infer nearby ground height. No SQL, door scripts, or runtime bindings were changed by this review.

## Earlier recording search, before the transfer

Before the user copied the other server's data, no `zone_235.tsv` or Shposhae-labelled TSV was found in:

- This checkout's live `Data/quicknavmesh` and other `Data` evidence directories.
- The required `Data/quicknavmesh-evidence/premerge-20260909` snapshot.
- `D:/navmesh/quicknavmesh` and `D:/navmesh/quicknavmesh-premerge-20260909`.
- This checkout's build directories, `C:/ServerData`, or `D:/Data`.

This is scoped to the searched saved files; it does not establish that another server folder or an unsaved session has no recording. The recorder names its output by **numeric zone ID**, so the misleading `sea0Dungeon02` label would still produce `zone_235.tsv`. `QuickNavmeshUtils.ResolveDataDirectory` chooses a relative `Data/quicknavmesh` directory based on the server's working directory.

At that recording-review checkpoint there were zero ordinary static mobs in zone 235. The subsequent [ordinary population pass](shposhae_mobs_2026-09-12.md) now prepares 149 mobs across all five pages. Its dedicated overlays use reviewed page assignments, while this gallery's navigation continues to show the full recording for comparison. Existing door XYZ is not navigation coverage.
