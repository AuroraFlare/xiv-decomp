# Level 30 and 40 regional guildleves — implementation notes

Placement update on 2026-09-08: [94 encounters now use frozen recorded-ground
layouts](guildleve_grounded_placements_2026-09-08.md), including Cassiopeia's
map-reviewed placements with explicitly inferred route links. The remaining
eight at Nanawa await ground recordings. The provisional placement discussion below records the
original implementation state; see that update for current geometry and tests.

Implemented encounter reconstructions for all **102 ordinary regional
battlecraft guildleves** at levels 30 and 40: 48 and 54 respectively. This
includes all 71 titles for which the bounded YouTube search found a matching
recording. Three helpers handled outdoor level 30, level 40, and video
research; the integration work includes the 24 underground level-30 contracts.

## Coverage and evidence

| Level | Camps | Leves per camp | Total |
| --- | --- | --- | --- |
| 30 | Cedarwood, Nophica's Wells, Humblehearth, Cassiopeia Hollow, Nanawa Mines, the Mun-Tuy Cellars | 8 | 48 |
| 40 | Bald Knoll, Iron Lake, Halatali, Broken Water, Nine Ivies, Treespeak | 9 | 54 |

Numeric scripts load automatically through the existing encounter engine.
`_level30.lua`, `_level30_dungeons.lua` and `_level40.lua` preserve per-leve
enemy groups, reinforcements, objective slots, collection rolls, search traps,
disguises, temporary resources, fleeing stages, patrols, timed defenses and
mandatory Necrologos final battles. Existing faction and retired duplicate
rows are outside this ordinary regional catalog.

The checked-in eLeMeN archives supply encounter flows. Current server
`gamedata_guildleves.sql` supplies the normalized client objectives and target
slots. Video research found **135 candidate URLs for 71 titles** and visually
sampled **12 titles**. Metadata matches are clearly distinguished from
inspected footage in the [video evidence inventory](guildleve_level_30_40_video_evidence_2026-09-07.md).

Footage confirmed Spooring Spores' two retreats after two and five nannygoat
defeats, the final three billygoats, two Downcast Hippocerfs in Lords of Skyey
Realms and The Moons' Mistress, Fire Bomb search traps in Elemental Thralldom,
and the distinct final Gigantoad in Dropping Like Flies. Early footage differs
from current data for some page counts and defense durations; those variants
are documented rather than silently replacing the current objectives.

See the detailed [level-30 notes](guildleve_level30_implementation_2026-09-07.md)
and [level-40 notes](guildleve_level40_implementation_2026-09-07.md).

## Integration

- The regional offer cap is now 40 in `Data/map_config.ini` and both C# defaults.
  Existing eligibility rules make level-30 contracts visible at player level
  25 and level-40 contracts at 35.
- Each level-40 publisher pack includes its ninth contract. The client has
  eight card slots, so each visit selects eight eligible contracts. Holding a
  contract allows all eight remaining contracts to appear.
- The interior Nanawa and Mun-Tuy gates now preserve free exit while exposing
  their leve menus. The native, cancellable "Leave this place?" prompt exits
  only on Yes; No opens the normal or active-leve menu. Exterior entry,
  parent teleport and homepoint behavior remain available. Initiation checks
  ownership, matching gate and destination zone before creating a director.
- `manualCompletion` prevents full page counters or zero-counter defenses
  from completing before their finale. Explicit completion retains the normal
  reward and cleanup path. Ordinary scripts keep automatic completion.
- `allObjectivesComplete` supports multi-objective terminal checks.
  `requiredResource` checks or consumes an interacting player's temporary
  resource before an inspection outcome, preserving the point when stock is
  missing. The framework documentation describes these fields.
- Resource-backed disguises present true and false candidates identically.
  A paid false result resolves its entire group without target credit; true
  results reveal the required enemies. Donors replenish so false attempts or
  joining late cannot exhaust the supply permanently.
- Protected disguise and fleeing actors survive lethal damage applied through
  `DelHP`, including damage-over-time and reflected hits. The protection hook
  clamps the pending damage without changing HP before the normal subtraction.
- Defenses wait for a living participant at their destination and pause
  progress while nobody remains there. Each arriving enemy explicitly engages
  a participant, even when its combat profile has no passive detection range.
  The server publishes the native defense countdown fields separately from
  the overall leve clock. The 30-yalm radius and pause/resume policy are
  reconstruction choices; no immediate fail-on-leaving rule is claimed.
- Thirteen supplemental named enemy profiles supply combat metadata for
  explicit actors outside DAT target slots. They reuse existing exact or
  same-family profiles and disable ordinary world loot. These are server
  combat defaults, not newly recovered retail stats. The authoring catalog is
  regenerated with those actors.

The gate exit prompt uses the existing inherited client method
`askExtendWidget(worldMaster, 51036, 2, 1, 1)`, already used by native
`Etc5l2.processEventExit`. The text rows are "Leave this place?" / Yes / No.
Bytecode inspection confirms mode 1 permits cancellation; the client returns
`-3` on Cancel. Only result 1 travels and only result 2 opens the gate menu.
The server already serializes the WorldMaster argument as an actor reference.
This needs no injected client function or additional exit actor.

## Placement and remaining verification

`_regional_placements.lua` supplies provisional coordinates. Each leve also
has a separate `Leves/Positions/<id>.lua` spatial overlay, applied after its
encounter is built. The positions-only editor and workflow are documented in
[the placement guide](guildleve_level_30_40_placement.md).
Eight camps use recorded quicknavmesh nodes and connected route segments,
marked `provisional_navmesh`. Cassiopeia Hollow, Nanawa Mines, the Mun-Tuy
Cellars and Iron Lake have no corresponding quicknavmesh graph. Their compact
offsets use existing in-game faction anchors and are marked
`provisional_capture_offsets`.

**Terrain at the generated offsets and the encounters themselves have not
been tested in a live client.** The four areas without navigation data need
particular attention. None of these positions is claimed as an original
retail circle or spawn. Exact random/drop probabilities, search-point
distribution, replacement cadence and some named supporting-enemy variants
also remain provisional.

Stalking the Stalkers (`11704`) preserves five archived enemies while its
current SQL objective caps at four; completion requires all five deaths.
That discrepancy remains documented pending better evidence.

Runtime config markers override the old SQL marker seed. The older marker
generator only recognizes literal positions in numeric scripts, so it was
not used to regenerate markers from these builder-based configs. Use
`!glbuild edit <id>` when refining an implemented encounter. Its spatial
overlay preserves the waves, triggers, rewards and resource rules; ordinary
`!glbuild start` creates a new encounter and is not the placement-edit workflow.
The existing edit to `Data/quicknavmesh/zone_154.tsv` was preserved.

## Applying to an existing server

1. Apply `Data/sql/live migrations/regional_guildleves_level30_40.sql` to the
   existing server database. It adds/replaces only the 13 supplemental
   guildleve combat profiles and requires the existing table and columns.
   Fresh installations receive the same profiles from the regular SQL seed.
2. Build Map Server and restart it using the updated scripts and authoritative
   `Data/map_config.ini`. A Lua reload alone does not load the new C# APIs or
   refresh database combat profiles.
3. Accept a level-30 or level-40 regional contract at its city publisher, then
   start it at its listed camp. At Nanawa or Mun-Tuy, enter the dungeon and
   answer No to "Leave this place?" to open the gate's leve menu. Start with a
   simple elimination contract and check the map circle and spawn terrain
   before trying chases or searches.
4. Check a last-page summon, both Spooring Spores retreats, an empty-resource
   interaction followed by a paid reveal, and a defense with a final enemy.
   Confirm the reward appears only after the required final battle.

No live database migration, server restart or in-game playtest was performed
by this change.

## Validation

Run from the repository root with Python, PowerShell, .NET 10 and restored
Map Server dependencies:

```powershell
python tools/build_regional_guildleve_placements.py --check
python tools/build_regional_guildleve_mob_profiles.py --check
python tools/build_guildleve_authoring_target_catalog.py --check
python tools/validate_guildleves_level30.py
pwsh -NoProfile -File tools/validate_guildleves_level40.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_offers.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_catalog.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_gates.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_positions.ps1
dotnet build 'Map Server/Map Server.csproj' --no-restore --nologo -v quiet -p:OutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/guildleve-level-30-40/
dotnet run --project tools/regional-guildleve-tests/RegionalGuildleveTests.csproj -- '.codex-build/guildleve-level-30-40/Map Server.dll'
dotnet run --project tools/regional-guildleve-position-editor-tests/RegionalGuildlevePositionEditorTests.csproj -- '.codex-build/guildleve-level-30-40/Map Server.dll' 'Data/scripts'
```

Results on 2026-09-07:

- Map Server builds with zero errors; existing warnings remain.
- All 102 configs load. Their 86 unique referenced combat actors resolve to
  registered classes and combat profiles.
- All 48 level-30 encounter simulations pass.
- All 324 level-40 simulations pass, covering six variations per contract,
  including failed rolls, false-first paid reveals, replenishment, delayed
  defense arrival, pause/resume and overlapping defense waves. Additional
  no-arrival cases verify that defenses cannot finish from the camp.
- All 24 underground contracts pass the actual gate initiation flow in their
  intended zones. Exit/cancel, active menus, parent teleport, homepoint and
  invalid ownership/camp/zone selections are covered separately.
- Actual publisher packs pass offer reachability, ownership, full-journal and
  level filtering checks. Existing eight-card layouts retain their slot order.
- The compiled C# completion predicate preserves ordinary completion and
  blocks premature page/defense completion. Additional compiled tests verify
  nearest living participant selection, actual hate/AI engagement and the
  defense HUD's integer16/integer16/boolean packet fields.
- A further damage-path regression reproduced and repaired lethal DoT/reflection
  bypassing protected disguise and fleeing targets. It covers direct `DelHP`,
  repeated overkill, final-runner protection and ordinary damage.
- Positions have separate per-leve overlays. All 102 pass spatial validation
  without changing their mechanics, including unknown/stale input rejection,
  source isolation, serialization and original circle ownership even where
  circles overlap.
- Separated-circle scenarios preserve suppliers, earlier page summons and
  surviving runners. Reinforcements use unoccupied prepared spawn slots when
  their source enemies, patrol actors or fleeing runner can still be alive.
- The compiled positions editor passes nine actual encounter families,
  including whole-circle translation, individual coordinates/facing, undo,
  resume, export/reload and rejection of stale or invalid captures.
- Before staging, the existing `12463`-`12467` encounter regressions also
  passed: captured pairs, missed-drop replacements, completion/cancellation,
  the ten-point chase in both kill orders, and all disguise selections.
  The original authoring-builder checks and old eight-card publisher behavior
  pass as well. The shared runtime additions are opt-in; the HP correction
  preserves the existing protected-target one-HP floor.
- Generated placement, combat-profile and authoring-target files are current.
- The existing `validate_guildleve_encounter_framework.ps1` compiles all Lua
  but then fails a pre-existing assertion that `gm/factionleve.lua` contains
  `permissions = 1`; committed HEAD already contains `permissions = 0`.
  With only that stale assertion excluded in memory, all remaining framework
  checks and behavior cases pass, including the 53 existing faction configs.
  The permission and that assertion were preserved; syntax discovery now
  includes the per-leve position modules.

An independent Astra Ultra audit checked all 102 compositions against the
archives/current SQL and all 12 sampled-video findings, then traced runtime
and activation paths. It found and drove the gate, Reveal and defense repairs
above. The eight graph-derived routes have no segment above 6.54 m or height
step above 1.91 m; this supports route continuity, not original retail placement
or a live terrain certification.

The simulations use the real Lua engine with a modeled director. They verify
progression and completion logic; they do not establish live packet behavior,
terrain, timing fidelity or balance.
