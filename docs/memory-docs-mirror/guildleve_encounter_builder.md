# Objective-first guildleve encounter builder

For the implemented level-30/40 encounters, use `!glbuild edit <id>` to move
their prepared circles and individual locations while preserving mechanics.
See the [positions-only workflow](guildleve_level_30_40_placement.md). The
`start`/`resume` workflow below creates or resumes a complete encounter capture.

`!glbuild` is an in-game GM authoring tool for the data-driven guildleve
framework. Its starting point is the guildleve objective, not an empty spawn
list. On `start` it reports:

- the guildleve title, plate/archetype, level, zone, and source-backed retail
  encounter flow;
- each `mob1`-`mob4` target resolved to its display name, actor class, and BNPC
  profile when available;
- each objective's required count and item target;
- an archetype-specific checklist explaining what must be captured beyond mob
  positions.

Every mob placement is echoed with the resolved mob name, target slot,
objective counter/item, wave, group, role, tag, and coordinates. Private named
preview markers remain in the world until `previewclear`, `finish`, or `cancel`.

## Basic workflow

```text
!glbuild start 11661
!glbuild circle
!glbuild mob 1 1 1
!glbuild mob 2 1 1
!glbuild info
!glbuild finish
```

Arguments shown to GMs are one-based (`mob 1`, `objective 1`). Generated Lua
uses the framework's zero-based `mobIndex` and `objectiveIndex` values.

After `finish`, a saved session can be reopened with `!glbuild resume <id>`.
This retains its circle, mobs, chests, waves, and mechanics so missing placements
can be appended without recapturing the completed work. Resume also works while
outside the saved zone for metadata-only corrections such as `drop`, `repeat`,
and `reviewed`; position-recording commands remain locked to the original zone.
After metadata-only edits, `finish` may save from the current zone.

Use `wave <name>` before placing a different pack. The current placement wave
starts as `main`, but it is not forced into the initial-wave list. On `finish`,
the builder automatically chooses the first wave that actually contains
actors. A circle-only placement pass can also be exported with no initial mob
wave for later merging into an existing config. Use `initial <wave...>` only
when you need to override that automatic choice.
Each unnamed `circle` appends one simultaneous initial objective marker, up to
the client's three marker slots. `circle <wave>` instead records the single
active marker used when that later wave spawns.

## Objective helpers

The same tool covers the eight regional battle archetypes and records evidence
for special/fieldcraft objectives:

- Sweep/eliminate: `mob`, `wave`, `sequence`, and `repeat` capture packs and
  reinforcements.
- Chase/flee: record repeated `route <name>` waypoints. Use `flee <objective>
  <hpPercent> <route> <finalWave> [afterProgress]` when whichever objective mob
  survives must flee at an HP threshold, or `movement <tag> <route> <objective>
  [startProgress]` for a predetermined tagged actor.
- Gather-from-mobs: `drop <objective> <chance> [min] [max]` maps kills to the
  exact objective item and counter.
- Round/sequential battle: `initial` identifies the opening pack and `sequence
  <wave> <afterObjective>` gates later packs.
- Survive/defend: `survival <seconds> <objective>` records the timer; protected
  NPCs can be placed with `actor ... protect <tag>`.
- Detect, orb, search, and reveal: place decoys with `mob ... decoy <tag>` and
  record interactive locations with `point <name> <objective> [chance]
  [passWave] [failProgress]`. `content <variation> [subVariation]` records a
  required client target/action command.
- Escort/protect: place a tagged `actor`, record the route, then use `escort
  <tag> <route> <objective>`.
- Chests: `chest [none|blue|blue_plated|gold] [chance]` records any number of
  chest locations and their SQL metadata.

Examples of nontrivial flows:

```text
# Item drops from cactuars (A Leg Up)
!glbuild start 11663
!glbuild circle
!glbuild mob 1 1 1
!glbuild drop 1 75 1 1
!glbuild repeat main second main
!glbuild reviewed verified cactuar leg drop and replacement behavior
!glbuild finish

# A fleeing target followed by a final wave
!glbuild mob 1 1 0
!glbuild route escape
!glbuild route escape
!glbuild wave final
!glbuild mob 2 2 1
!glbuild mob 4 4 1
!glbuild flee 1 50 escape final 5

# Search/reveal point that transforms a decoy into a real wave
!glbuild wave decoys
!glbuild mob 1 none 0 decoy disguised_1
!glbuild wave revealed_1
!glbuild mob 2 1 1
!glbuild point reveal_1 1 100 revealed_1 0
```

`repeat main second main` records a continuous cycle. The builder removes the
duplicate closing name in generated Lua and emits `repeatWaveCycle = true`, so
the encounter wraps only while its objective is incomplete. A named `circle`
also selects that wave for subsequent mob placements.

`undo` removes the last positional capture. `previewclear` removes visual
markers without changing captured data. `cancel` discards the session without
writing files.

## Review and output

Anything other than a plain sweep, plus sweep descriptions containing a second
stage, is treated as a complex objective. `finish` refuses to export it until
the author explicitly records `reviewed <note>`. This keeps a circle and a few
mobs from being mistaken for a complete chase, drop, reveal, escort, or timed
objective.

`finish` also requires an objective circle, battle mobs for battle leves,
nonempty initial waves, and existing routes referenced by movement/escort
rules. Plain sweep objectives additionally require at least the configured
`aimNum` count for every direct objective, preventing a partial pack capture
from being exported as complete. It writes:

```text
C:\serverdata\guildleve_authoring\<id>\<id>.lua
C:\serverdata\guildleve_authoring\<id>\<id>_placement.sql
C:\serverdata\guildleve_authoring\<id>\<id>.json
```

The Lua file is a reviewable encounter config for
`Data/scripts/directors/Guildleve/Leves/<id>.lua`. The SQL file contains the
active map marker and chest rows. The JSON manifest retains names, source flow,
review note, and every captured helper so unsupported or still-researched
special objectives do not lose their evidence.

The runtime catalog at `Data/guildleve_authoring_objectives.tsv` is generated
from the checked-in eLeMeN extraction:

```powershell
python tools/build_guildleve_authoring_catalog.py
python tools/build_guildleve_authoring_catalog.py --check
python tools/build_guildleve_authoring_target_catalog.py
python tools/build_guildleve_authoring_target_catalog.py --check
```
