# Public dungeon and stronghold coffer completion

This pass uses the existing `OpenWorldCofferManager` and three-table framework.
It adds **sixteen missing fixed positions** and **nine key-item bindings across
seven existing ordinary profiles**, without moving mobs or changing raid content.
Both main SQL files carry the implementation; the migration is optional.

## What the historical evidence supports

The [saved framework guide](open_world_coffers.md),
[stronghold tables](open_world_coffer_stronghold_sources.md), and
[Patch 1.19 archive](patches/Patch_1.19.md) establish keyed, refillable coffers.
The location tables describe individual physical chests, not random locations.
Keep `activeCount=1` and `rerollPositionOnRefill=0` for these definitions.
Random reward selection remains the framework's existing behavior. Its weighted
position mechanism remains available for future evidence-backed rotating pools.
The existing two-second refill setting is authored tuning, not a recovered
retail timer, and is unchanged here.

The [2011 Shposhae field report](https://forum.square-enix.com/ffxiv/threads/27525-Shposhae-%28Level-15-20-Dungeon%29-Info-Page.)
was cross-checked again. Its overview repeats the Steel square for Rose Gold;
its detailed Rose Gold section gives (5,5). This pass follows the detailed
section, consistent with the saved guide. Mob key associations are preserved
separately from the report's Seeker/clam event behavior.

| Area | Configured usable coffers after main SQL import | Change / remaining boundary |
| --- | ---: | --- |
| Shposhae | 9 | Nine new fixed recorded-ground homes on maps 2–5 |
| U'Ghamaro Mines | 7 | Seven new fixed homes; three Gold chests retain distinct rewards |
| Zahar'ak | 7 | Existing positions, four key tiers, rewards and encounters preserved |
| Natalan | 8 | Existing positions, six key tiers, rewards and encounters preserved |
| Castrum Novum | 2 | Copper/Gold preserved; Silver still lacks supported rewards |
| Mistbeard, Cassiopeia, Copperbell, Nanawa, Mun-Tuy, public Tam-Tara | No supported ordinary coffer definitions recovered | Do not substitute ARR, quest, guildleve or instanced-raid chests |

Thus **33 of the existing 34 physical coffer definitions** meet the framework's
position/reward readiness conditions. This count describes the imported seed,
not live actor publication or universal key availability. A custom disabled
definition/position remains disabled.

## Placement provenance

`Data/mobplacements/public_coffers_20260916.json` pins every selected source-local
node, exact XYZ, captured support edge, historical cell, native map page and
reviewed definition. Source TSV and page-assignment manifest hashes are checked.
All sixteen points are inside their reported historical squares. Shposhae uses
only the previously reviewed page-node membership; the newer live capture is
not silently assigned to floors or merged into that frozen recording.

The three U'Ghamaro Gold homes are in the recorded western alcove beyond the
Aurum Loft door. They are distinct and ordered north/center/south, with at least
2.5 horizontal yalms between them. Other coffer separations use 3.5 yalms, nearby
ordinary mob clearance is 2.5, and nearby landmark clearance is seven. These are
authoring choices; client model clearance and facing still require review.

Exact chest XYZ and rotation are **authored**, not recovered retail positions.
No elevation interpolation or new runtime navigation edges were created. No
Shposhae/U'Ghamaro coffer live-placement confirmation exists in the saved
coordinate validations. The main SQL rounds XYZ to three decimals, matching
the existing catalog convention; the manifest retains full recorded precision.

[Maps, coordinate frames and teleport commands](maps/public-coffers-20260916/index.html)

## Keys and rewards

The main loot SQL adds guarded overlays to these already scoped public profiles:

| Profile | Mob | Key(s) |
| ---: | --- | --- |
| 39384 | Gripper | Copper Shposhae |
| 39386 | Shade Lurker | Silver Shposhae |
| 39388 | Shadow Lurker | Mythril Shposhae |
| 39382 | Gloom Lurker | Steel Shposhae |
| 39390 | Spawning Orobon | Brass Shposhae |
| 39385 | Jackal Pup | Bronze Shposhae |
| 39342 | U'Ghamaro Ashman | Brass, Copper, Bronze U'Ghamaro |

Each added key uses an **authored independent 3% chance**, consistent with the
existing provisional stronghold NM key rate. Sources establish associations,
not probabilities. The shared Ashman carrying three keys is a playable authored
mapping; distinct retail key-bearing variants remain unresolved. The existing
static lurkers receive their known keys; this does **not** reconstruct the
Seeker/clam spawn event. Passive Seekers and all mob homes remain untouched.
The guide places the Gloom Lurker clam on map 4; the earlier static Gloom
population is on map 5. That encounter/floor mismatch is not silently resolved
by attaching its known key to the existing scoped profile.

Gold, Electrum and Rose Gold Shposhae keys continue to come from the existing
Silver, Mythril and Steel reward pools. U'Ghamaro Silver's key source remains
unresolved. Zu Ga's existing Gold-key drop is unchanged; adding/reconstructing
his encounter is separate work. All existing stronghold pools and probabilities
are preserved, including their explicitly provisional guaranteed named rewards.
Unsupported common pools, gil bands and Castrum Silver rewards are not invented.

## Main SQL, preservation and validation

Main files:

- `Data/sql/server_open_world_coffers.sql`: sixteen conditional position inserts.
- `Data/sql/server_battlenpc_mob_types_loot.sql`: scoped profile/drop overlays.
- Optional `Data/sql/live migrations/public_coffers_20260916.sql`: the same
  generated statements, for an already seeded server.

Any existing position for a coffer, including a disabled GM capture, suppresses
the authored fallback. Lock/zone/actor mismatches suppress insertion. The key
overlay requires the exact reviewed profile identity and a zero or already
matching drop list; custom lists and existing item probabilities are preserved.
It never changes shared outdoor profiles. Earlier population generators retain
their frozen literal profiles; the final main loot overlay owns these new keys.

Regenerate/check with:

```powershell
python -B tools/mobspawns/public_coffer_placements.py build
python -B tools/mobspawns/public_coffer_placements.py check
python -B tools/mobspawns/public_coffer_placements.py render
python -B -m unittest discover -s tools/mobspawns -p test_public_coffer_placements.py
```

The SQL tests execute the main coffer DML offline and verify all 33 ready
definitions, repeat application, distinct Gold rewards, chained Shposhae keys,
custom/disabled capture preservation, wrong-lock rejection, custom drop lists,
existing probabilities, source/floor tamper rejection and migration parity.
SQLite is used for DML verification with MySQL-only DDL/upsert syntax removed;
this is not a MySQL live-server test. No runtime code changes, live database
import, server reload or client test was performed.

Validation: **52 tests passed** across the new coffer, coordinate, Castrum,
Zahar/Natalan and Natalan suites. The expansion and density-boost suites stop
at their old hash of `map_coordinate_validations.json`; that file already
differs from their frozen reference in committed HEAD and was not changed here.
No evidence hashes were bypassed or reset.
