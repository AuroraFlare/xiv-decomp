# Nanawa Mines: recorded-ground guildleve layouts

All eight level-30 leves **12221–12228** now use the new Nanawa movement recording.
The older manual-capture locations have been replaced. Enemy identities, counts,
objectives, rewards and encounter mechanics remain in their existing specifications.
These are authored layouts, not recovered retail positions.

[Open the eight updated diagrams](maps/guildleve-nanawa-20260909/index.html).
The local archive has no standalone Nanawa terrain artwork. These diagrams use
Nanawa's own client MapNavi row **1600**, region/map **104/412**, piece **1126**,
scale **2**, base **544/1888**. Its gate marker agrees with the server's
`nanawamines_aetherytegate_exit` in zone **176**. No parent Thanalan transform
or image is used; live grid and terrain validation remain pending.

## Ground and route evidence

The installed snapshot is
`Data/guildleveplacements/individual-evidence/zone_176.tsv`: **1,234 exact XYZ
points and 549 captured links**, SHA-256
`ded406e1ca60fe3c67c34a075401e41bd0ef7965a26ffc23ce667dcecaf9718a`.
This is the newer save available when the layouts were authored; the earlier
coverage assessment below had 797 points. The runtime uses a frozen per-leve
manifest, so additional recordings cannot silently move installed encounters.

The user's terrain warning is an authoring constraint: **some passages drawn
on the map are blocked; avoid undotted passages**. Missing dots are not proof
of a wall, but authoring treats those passages as unavailable. Captured links
are retained. Any inferred link must join consecutive saved node IDs, be at
most eight horizontal yalms long, and differ by at most three vertical yalms.
Nearby but separate trails are not connected merely by proximity.

The eight layouts are distinct and deterministic. Every area has **12 distinct
recorded spawn slots**, at least two yalms apart, within 42 yalms of its center,
and with at least four yalms of cataloged public-actor clearance. The native
circle radius remains 64. The minimum center distance from the gate is **102.0
yalms**, and the minimum spawn distance is **65.1 yalms**. The old western-room
buffer exception is no longer used. Individual circles can still be reused or
overlap; eight different layouts do not imply 24 completely separate rooms.

Chase destinations are selected nearby on the same recorded trail, with a
180-yalm route budget and a 60-yalm gate exclusion. All route points are marked
required to retain their terrain samples and prevent runtime smoothing from
cutting into an undotted passage. Continuous distance-based movement has no
per-waypoint pause. The live approach from the survivor's combat position and
all inferred links still need in-game testing.

| ID | Guildleve | Placement behavior |
|---|---|---|
| 12221 | Overtime in the Mines | Ten puks at a recorded area |
| 12222 | Tuning In | Three recorded replacement-pack areas |
| 12223 | The Potter's Price | Three recorded mixed-pack areas |
| 12224 | Spirited Below | 22-point, **130.8-yalm** retreat; two additions about **7.4 / 12.0 yalms** from the survivor |
| 12225 | Antling Invasion | 21-point, **125.8-yalm** retreat; one addition about **6.8 yalms** from the survivor |
| 12226 | Corpus Adamance | Resource and disguise packs at recorded positions |
| 12227 | Necrologos: Torn Asunder | Recorded search points, ambushes and summons |
| 12228 | Necrologos: Adamantine Wills | Recorded page-collection and summon areas |

Reinforcements wait for arrival and join the survivor's linked party. Their
spawn slots exclude the survivor's occupied destination. The other 94 layouts,
including the user's approved 12484 and 13025 routes, are unchanged by this pass.
The inventory at the Nanawa follow-up had **2,697 runtime locations**, all matching exact frozen
recorded XYZ across the 102 ordinary level-30/40 encounters.

## Reproduce and test

Run `python -B tools/mobspawns/nanawa_guildleve_placements.py <new-draft-directory>`
to author a new reviewable draft from the current recording. Use `--recording`
with a saved `zone_176.tsv` to reproduce from a frozen copy. Review the manifest
and diagrams, install the reviewed manifest and evidence, then run
`python -B tools/build_regional_guildleve_placements.py`. The older manual
capture helper remains for historical evidence; the command now uses movement.

After a route structure change, refresh only empty position overlays through
`tools/validate_regional_guildleve_positions.ps1 -RefreshEmptyOverlays`, which
refuses to overwrite captured edits. The ordinary position validator, runtime
XYZ audit and level-30 simulation cover the generated output. Regression tests
also check deterministic layouts, the saved-node inference policy, bounded
retreats, gate clearance and preservation of required route points.

The older camp manifest remains a historical fallback. These ordinary leve
builders resolve the new per-leve entries. No live recording, database placement
or running server was changed by this pass. In-game playthrough testing remains.

To test the gate: `!pos 176 80.056 167.929 -1267.940`.
Use `!addguildleve 12224` or `!addguildleve 12225`, then select it at the gate.

## Historical evidence

The first authored pass used 29 manual Behest floor captures, with two short
retreats in the eastern pockets. That source remains at
`individual-evidence/nanawa-captures/zone_176.json` for provenance. The earlier
[797-point coverage assessment](maps/nanawa-recording-review-20260909/assessment.json)
and [diagram](maps/nanawa-recording-review-20260909/coverage.png) remain historical
feasibility drafts, not the installed layouts. The shared
[flee-route audit](guildleve_flee_route_audit_2026-09-09.json) retains prior
Nanawa courses under `previous_placement`, since both endpoints moved with
these new layouts.
