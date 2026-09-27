# Gathering guildleves — 2026-09-10

All **99 fieldcraft leves** are enabled in the source: 33 Miner, 33 Botanist,
33 Fisher, spanning levels 1, 10, 20, 30 and 40. All 16 named gathering areas
have reviewed objective-circle/area evidence, including the newer Iron Lake
recording. Humblehearth and Treespeak now also have pinned archival
gathering-point supplements; the remaining four-camp node gap is called out
below and remains a strict live land-coverage gate.

The all-range catalog audit also covers local crafting separately: all **152
published commissions / 608 variants** are present, with recommended crafting
tiers 1, 5, 10, 15, 20, 25, 30, 35, 40, 45 and 50. There are no level-50
regional fieldcraft rows in the checked 1.x catalog; level 50 belongs to other
regional families here.

The formerly commented publisher table had two additional wiring errors:
Gridania and Ul'dah's catalogs were swapped, and gathering used battle camp
labels. Each job now uses its own client `guildlevePack` rows, checked against
the leve's activation aetheryte. An exhausted or empty lower camp no longer
hides available higher camps. Existing level, allowance and journal checks apply.

## Locations and behavior

[Review all camp maps](maps/fieldcraft-20260910/index.html).
The yellow rings in this gallery identify objective centers; their displayed
pixel radius is illustrative. Blue points identify Fisher's server-only anchors.

| Evidence | Stored slots |
| --- | ---: |
| Existing enabled mining/logging coordinates | 96 |
| Existing spearfishing coordinates, used as fishing-area anchors | 31 |
| Recorded movement XYZ | 161 |
| Unverified fallback height | 0 |
| Total | 288 |

The 99 leves reuse **106 distinct supported seed positions**. Stored placements
remain stable; runtime Miner/Botanist circles can move as described below.
Iron Lake's six leves replace 17 old Y=44 placeholders with
whole recorded points. Individual nodes retain their own elevation. These are
authored locations in the named fields, not recovered retail coordinates or
proof of collision. In-game terrain and gathering-tool interaction still need testing.

The ordinary-node handoff is data-complete only where the world seed contains
the corresponding points: **150 of 198 stored Miner/Botanist marker slots** currently
have at least one enabled Mine/Quarry/Log/Harvest row within the objective
circle and vertical tolerance. The remaining 48 slots are the 12 slots in each
of Bloodshore (130/1008), Cedarwood (128/1015), Iron Lake (135/1009) and
Tranquil Paths (154/2016). Humblehearth's 166-row archival capture and
Treespeak's 214 imported runtime rows cover their land slots; both remain
authored capture evidence, not recovered retail XYZ. The four uncovered camps
retain their reviewed seed coordinates in SQL, but runtime hides empty circles
without awarding progress or inventing `GLGP` actors. Capture/import of
their ordinary points is still required before claiming live all-land retail
coverage.

Miner/Botanist keep the yellow circles as coordinate-driven objective regions,
but no synthetic `GLGP` gathering actors are spawned for them. The player sees
the ordinary private Mine, Quarry, Log or Harvest point at the existing world
node inside the active region. A target gather is admitted only when that node
matches the leve's skill, grade, area and active objective; a successful target
gather clears the corresponding circle and goes through the normal per-player
node depletion/replacement lifecycle. If an exact small node pool has no fresh
candidate left, the oldest eligible point returns after two distinct same-pool
depletions, preserving the 20-yalm spacing rule. This is the bounded 1.x
reconstruction of the requested repeat behavior, not a claim that the native
timer/counter has been recovered. Cancellation, failure and bycatch release the
reservation and leave the node available. A director checks both player and
point membership, so another instance of the same leve cannot consume its nodes.
Completed-node replay and substitution of a different completion actor are
rejected.

### Adaptive circles — 2026-09-25

On startup and at most once per second, the director checks currently
materialized ordinary nodes belonging to present participants. A circle that
still admits an available node stays in place. An empty circle moves to the
nearest unused eligible node to its original seed, within the leve's exact
activation camp, zone, job and grade. Movement copies the node's complete XYZ,
including a valid zero Y; it never borrows terrain height or moves/spawns a node.
The nearest-circle admission check also repairs overlapping circles so each
visible slot has a distinct usable coordinate, using height to break horizontal
ties. This relocation policy is an authored repair, not recovered retail logic.

Snapshots include distant materialized nodes (not just nearby visible actors),
but exclude pending depletion, missing reward pools, hidden/Truth points,
foreign owners/areas and stale player sessions. Active gathering reservations
freeze marker reassignment until completion/cancellation. When replacement or
recycled nodes appear, still-pending circles can return there; successfully
completed circles stay cleared. With fewer nodes than remaining objectives,
only serviceable circles are shown. A zero-node camp waits with no progress;
the search never falls back to an unrelated neighboring camp.

This changes runtime presentation only. The frozen placement manifest and
main marker/node SQL remain unchanged by this circle repair. Fisher keeps its
named-water path, and local crafting delivery/NPC behavior is unchanged.

Fisher retains the existing free-water casting flow. All 33 anchor-zero positions
resolve to the correct named fishing area. The 90 stored Fisher rows intentionally
do not spawn artificial fishing actors or yellow objective circles; the named-water
override validates the area and catch instead. Exact-item leves count their target
item; surveys count successful catches in the required area.

The existing shared gathering director supplies all 99 objective definitions:
54 exact-item tasks and 45 surveys. No new per-leve Lua wrapper is required.
Reward and inventory transactions retain the existing implementation.

## Rebuild and validation

`Data/guildleveplacements/fieldcraft.json` is the reviewed source. It records
source hashes and source-local recording node IDs or imported SQL line numbers.
The earlier 271 placements retain their three-decimal precision; new Iron Lake
coordinates retain the recorded values, stored as FLOAT by the server.
The general marker generator now reads this manifest rather than reselecting
from mutable recordings or inventing missing heights.

The Humblehearth supplement is
`Data/guildleveplacements/evidence/humblehearth-gathering-points-20260714.csv`.
It is the canonicalized Humblehearth subset of the archived
`C:\serverdata\gathering_points.pre-camp-fix-20260714.csv` capture
(source SHA-256 `4772b38b78c13395d02110c1308db132f2eef5a01dc1a87c1cb3eda5f4d7df45`).
The Treespeak supplement is
`Data/guildleveplacements/evidence/treespeak-gathering-points-20260714.csv`.
It preserves 230 rows from the frozen
`C:\serverdata\gathering_points.before-emerald-moss-fix-20260714-123303.csv`
snapshot (source SHA-256
`53e4ec07ca97daf9f4e6fd419f87b911793953cd1de47ccd9412fb2f0837d43`). The
snapshot's explicit place `2028` and grade `5` are retained; its stale
`Emerald Moss` label is corrected to `Treespeak` in the checked-in subset.
Regenerate the point SQL with the supplement passed explicitly:

```powershell
python -B tools/gatheringpoints/import_gathering_points.py `
  --input C:\serverdata\gathering_points.csv `
  --supplement Data\guildleveplacements\evidence\humblehearth-gathering-points-20260714.csv `
  --supplement Data\guildleveplacements\evidence\treespeak-gathering-points-20260714.csv `
  --output Data\sql\server_gathering_points_import.sql `
  --replace
```

```powershell
python -B tools/mobspawns/fieldcraft_guildleve_placements.py build
python -B tools/mobspawns/fieldcraft_guildleve_placements.py check
python -B tools/mobspawns/fieldcraft_guildleve_placements.py render
python -B tools/validate_local_and_fieldcraft_guildleves.py
python -B tools/validate_local_and_fieldcraft_guildleves.py --require-complete-land-nodes
pwsh -NoProfile -File tools/validate_fieldcraft_guildleves.ps1
dotnet build 'Map Server/Map Server.csproj' --no-restore -o .tmp/fieldcraft-build
dotnet run --project tools/fieldcraft-guildleve-tests -- '.tmp/fieldcraft-build/Map Server.dll' .
```

Checks cover all executable publisher menus, client pack destinations, catalog
coverage, source provenance, SQL/CSV parity, fishing-area resolution, director
startup, actual compiled objective/grade binding, reservations, cancellation,
successful gather/catch progression, circle relocation/overlap/stacked heights,
stable placement, sparse/recycled availability, actor snapshots, reservation
freezing, refresh throttling, ended/deleted lifecycle, cleanup, instance isolation, replay,
bycatch filtering and completion counters. They run without the game or a database;
they do not claim a live inventory/reward or collision test.

The first validator invocation checks the full catalog and runtime plumbing.
The strict `--require-complete-land-nodes` invocation is the stored-seed coverage
gate: it remains intentionally red until every enabled Miner/Botanist marker
has a matching captured/imported Mine, Quarry, Log or Harvest node. It now
reports 150/198 land slots; the remaining 48 are the four camps listed above.
Fisher fieldcraft uses the named-water path and does not require a physical
node.

The circle-follow repair passes compiled tests for all 66 Miner/Botanist and
33 Fisher rows, but needs a rebuilt-server client test: verify circle relocation,
walking to the indicated ordinary node, successful objective cleanup, and
replacement/recycled availability. Offline coverage does not establish retail
accuracy, navigable terrain or native client rendering.

## Applying to an existing server

`Data/sql/updates/2026-09-10_fieldcraft_markers.sql` is an idempotent update of
only the 288 fieldcraft marker slots. Apply it to the server's gamedata database
with the existing `markerIndex` schema, then use the rebuilt Map Server and
updated scripts. No live database import or server restart was performed here.
The broader seed SQL also contains the updated Iron Lake positions for fresh installs.

For future uncovered locations, set `enabled` false with a reason in the manifest
and comment out their IDs within the existing publisher camp arrays. Preserve
empty camp slots so the client labels keep their correct indexes; do not invent Y.
