# Low-level guildleve repairs — 2026-09-09

Implemented the confirmed gaps from the
[level 1/10/20 audit](guildleve_low_level_audit_2026-09-09.md).
All **72 ordinary battlecraft encounter configs now load**. This closes the
specific missing encounter and six chase gaps identified there; it is not a
claim that all historical variants have been recovered or live-tested.

## Encounter changes

| ID | Leve | Implemented flow |
| --- | --- | --- |
| 12468 | Leaders of the Pack, level 20 / Tranquil | A Firefly pair supplies two Reveal charges. Search four Pteroc pairs in two areas. Exactly two randomly selected pairs become two Imps each. Four Imp defeats complete the leve. |
| 10884 | Burning Down the Houses, level 10 / Skull Valley | Start with one Imp. Wounding it triggers an escape, followed by a linked Nightwolf pair beside the destination. |
| 10885 | The Swarm, level 10 / Skull Valley | Four initial Syrphids in two pairs. Retreat at three kills, then five kills, with a wounded survivor. Each arrival adds another pair. Eight kills total. |
| 10886 | Send Them Packing, level 10 / Skull Valley | Six Pack Rats in two triples. After five defeats, the survivor flees and a Scalepuk pair joins it. |
| 10887 | Herbicide, level 10 / Skull Valley | Six Dodos in three pairs. Wound the last survivor, pursue it, then defeat it and the additional Dodo. |
| 10888 | Jellyfish in a Barrel, level 10 / Skull Valley | Six Aurelia in two triples. After five defeats, the survivor flees and another pair appears. |
| 11645 | Treasures of the Smallfolk, level 10 / Drybone | Four initial Spriggans. Retreat after three kills and again after one more kill, adding two at each destination. Eight kills total. |

The saved eLeMeN objective descriptions establish the species, linked packs,
retreats and Reveal flow. The 50% wounded threshold for 10884/10885/10887,
four suspect pairs in 12468, guaranteed Firefly drops, and new locations are
authored reconstruction choices. No new footage or live gameplay was reviewed.

12468 reuses the optional resource path in `_captured_disguise_pairs`. Ordinary
Pterocs are killable decoys with no objective credit or Firefly cost. True
disguises require a charge, whether resolved by Reveal or the existing paid
damage path. Both partners share one resource scope and one replacement latch.
The two Imps inherit combat hate; command-triggered replacements also engage
the player. Guaranteed supply covers the two required reveals without an
unbounded supply respawn loop. The catalog's exact existing monster profiles
are reused: 2202603 (Imp), 2200105 (Pteroc), and 2205803 (Firefly).

All repaired chases use the shared continuous route runner. The arrival wave
waits for successful route completion, joins the survivor's party, and uses
distinct recorded slots 2.5–15 yalms from the destination. Failed routes and
cancellation cannot release reinforcement waves.

## Ground and route evidence

[The manifest](../Data/guildleveplacements/low_level_repairs.json) records
selected node IDs, frozen source hashes, inferred edges and prior config paths.
The snapshots are in `Data/guildleveplacements/low-level-evidence/20260909/`:

| Zone | Recorded XYZ nodes | Use |
| --- | ---: | --- |
| 129 | 3,339 | Five Skull Valley encounter layouts |
| 171 | 10,611 | Drybone's two-stage chase |
| 154 | 3,614 | Tranquil's Firefly and Pteroc search areas |

The seven layouts contain **17 circle centers and 52 spawn slots**, all exact
recorded XYZ. Existing recordings are sufficient for these authored layouts;
no additional recording is required to implement this batch. They do not cover
every old position adequately. The six chase layouts were therefore moved onto
recorded terrain, including replacing the explicitly provisional flat-Y
10887/10888 positions. Earlier captured/provisional configurations remain as
`.before.lua` evidence and the old 11645 audit is retained under
`previous_placement`.

Some high-speed trail recordings omit links. Authoring bridges only short gaps
between **consecutive saved node IDs**, at most eight horizontal and three
vertical yalms. These are explicitly inferred edges, not recorded traversal
proof. Separate nearby trails and blank map passages are not joined. Routes
use shortest paths through that graph, then the production C# corridor/height
optimizer. 10887's course uses captured edges throughout. Map artwork and
recorded points do not prove collision; live terrain tests remain pending.

| Escape leg | Supplied waypoints | Production preview waypoints | Preview length |
| --- | ---: | ---: | ---: |
| 10884 / 1 | 24 | 7 | 93.1 yalms |
| 10885 / 1 | 26 | 8 | 108.0 yalms |
| 10885 / 2 | 25 | 7 | 103.0 yalms |
| 10886 / 1 | 25 | 9 | 105.6 yalms |
| 10887 / 1 | 25 | 8 | 106.0 yalms |
| 10888 / 1 | 33 | 10 | 136.3 yalms |
| 11645 / 1 | 20 | 5 | 65.7 yalms |
| 11645 / 2 | 15 | 6 | 65.1 yalms |

The live approach from the surviving actor is excluded from these lengths;
runtime collision checks can retain more bends. The
[placement gallery](maps/guildleve-low-level-fixes-20260909/index.html) includes
first-circle `!pos` commands. The expanded
[escape gallery](maps/guildleve-flee-routes-20260909/index.html) now covers
**32 configured survivor chases and 40 legs**. Its 32 unrelated audit records
and individual route images were preserved, including the user's 12484 and
13025 corner reviews and the latest Treespeak routes.

## Preserved captured decisions

12421, 12422 and 12441 were not regrouped solely to match the archival gloss.
Their scripts/capture history deliberately describe simultaneous or split
circles; 12422's two-circle capture is also documented in
[guildleve_spawn_points.md](guildleve_spawn_points.md). 12441's historical
species correction retained its two separate waves. These remain provenance
differences, not newly confirmed missing mechanics. 12461–12467, tutorial
availability, offer packs, objective counts, rewards, and live quicknavmesh
files were not changed by this repair batch.

## Validation

- `tools/validate_guildleves_low_level_repairs.ps1`: all 72 ordinary configs
  load; 36 chase simulations cover both kill orders and start failure, route
  loss and cancellation at every leg. Thirty-six Reveal simulations cover
  all six disguise selections, either partner, command/paid-damage races,
  no-charge/wrong-command/invalid-target rejection, stale partner replay,
  decoy credit, recorded positions and four-Imp completion.
- `tools/validate_guildleves_12466_12467.ps1`: all existing disguise selections,
  partner choices, double hits, area progression and completion still pass.
- `python -B tools/mobspawns/low_level_guildleve_repairs.py --check`: frozen
  source hashes, generated Lua equality, exact ground, valid/inferred links,
  unique slots and route endpoints pass for all seven layouts.
- Nineteen individual level-30/40 placement tests pass, including the expanded
  audit and preserved approved corners. The production C# route tests pass;
  all 40 preview legs were exported through that implementation.

Regenerate only these geometry files with
`python -B tools/mobspawns/low_level_guildleve_repairs.py`; add
`--render docs/maps/guildleve-low-level-fixes-20260909` for the placement PNGs.
This reads the frozen manifest, not a changing live recording.

No server was restarted, database imported, or live playthrough performed.
