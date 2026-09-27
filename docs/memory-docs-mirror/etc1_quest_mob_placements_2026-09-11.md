# Etc1 quest mob placement follow-up — 2026-09-11

Added **52 stationary public mobs for nine quests** to the SQL catalogs and
prepared an additive live migration. Three other mob quests already have
placements near their client markers; two interaction quests retain their
user-confirmed targets. **Five quest areas still need movement recordings**
before their placements can be completed or corrected.

Follow-up: prepared the remaining **eight missing mob profiles** and bound the
six pirate actors to reviewed combat classes. The migration now contains 17
new profiles total; the eight pending profiles have no spawns. All 17 mob
quests now have their target profiles represented in the catalog, but the five
ground gaps below remain incomplete.

The initial placement pass did not import a database, restart the server, enable
quests, or perform a live playthrough. The later [runtime audit and availability
update](etc1_quest_runtime_audit_2026-09-11.md) enables 14 verified quests; five
placement holds remain disabled. This pass completes spatial data only for the
nine new layouts.

## Added layouts

| Quest | Zone | Quest actor | New BNPC profile | Reviewed donor | Count |
|---|---:|---:|---:|---:|---:|
| 110634 — Bridging the Gap | 128 | 2100113 | 39200 | 1241 | 6 |
| 110638 — Till Death Do Us Part | 130 | 2102717 | 39201 | 1200 | 4 |
| 110639 — Beryl Overboard | 130 | 2107613 | 39202 | 1273 | 6 |
| 110640 — Have You Seen My Son | 176 | 2101609 | 39203 | 1049 | 6 |
| 110656 — A Well-Balanced Diet | 154 | 2100509 | 39204 | 1206 | 6 |
| 110659 — The Search for Sicksa | 152 | 2104022 | 39205 | 1031 | 6 |
| 110660 — The Ultimate Prank | 157 | 2101908 | 39206 | 1233 | 6 |
| 110662 — Say it with Wolf Tails | 157 | 2100609 | 39207 | 1176 | 6 |
| 110675 — A Knock in the Night | 176 | 2101711 | 39208 | 1145 | 6 |

Each donor has the **same bound actor class** as the quest target. The new
profiles preserve its combat skills, spells, elemental parameters, movement,
and aggression policy. Their fixed levels follow the quest level as an authored
choice, not recovered retail monster levels. Donor loot is cleared: quest
items are awarded through the existing `onKillBNpc` counters. Quest actor IDs,
appearance, objective counts, dialogue and rewards are unchanged.

The manifest pins full donor rows, class paths, source file hashes and
source-local node IDs. Every plan position is exact recorded XYZ. The SQL uses
the map planner's normal three-decimal serialization (at most 0.0005 per axis
rounding); full precision remains in the manifest's frozen recordings and
exported plans. No height was interpolated or taken from nearby public actors.

Packs stay within an **authored 64-yalm radius** of the exact client journal
marker, eight yalms apart, with four yalms of horizontal clearance from catalog
actors. The radius is an authoring constraint, not a measured client circle
radius. Till Death Do Us Part has four slots because six did not fit the ground
and clearance constraints. The inherited 60-second respawn supports repeat
kills without changing objective amounts. New spawns have `roams=0` to avoid
random movement onto unrecorded ground. Aggro pursuit and collision still need
normal in-game testing.

[Review the nine placement maps](maps/etc1-quest-mobs-20260911/index.html).
They were visually inspected before installation into the catalogs. Mun-Tuy
uses its own MapNavi row 2500 and its own archived image. Nanawa uses row 1600
for coordinates and explicitly labeled world X/Z point diagrams because the
local archive has no standalone terrain image. Neither borrows a regional
outdoor transform. The two nearby Mun-Tuy quests select different recorded
floors (approximately Y=-32 and Y=-15); each layout is restricted to within
three yalms of its selected recorded floor reference.

## Existing placements retained

| Quest | Placement audit |
|---|---|
| 110654 — Proceed with Caution | Three Watchers, actors 1090193–1090195, at the exact user-confirmed positions in the [objective audit](etc_placeholder_objective_audit_2026-08-17.md). No mobs required. |
| 110655 — Playing with Fire | Three hearths, actors 1090196–1090198, at the exact user-confirmed positions in that audit. No mobs required. |
| 110676 — Sleepless in Eorzea | Profile 1031 / actor 2104021; existing same-zone mob approximately 18 yalms from marker 11067601. |
| 110680 — An Inconvenient Dodo | Profile 1030 / actor 2102009; existing same-zone mob approximately 9.4 yalms from marker 11068001. |
| 110681 — Besmitten and Besmirched | Profile 1029 / actor 2105717; existing same-zone mob approximately 5.7 yalms from marker 11068102. |

Existing mob positions were retained, not relabeled as user-confirmed or newly
ground-validated. The two interaction quests' actor and spawn validators pass.
The full older objective validator stops on `110654 is no longer active in
quest_availability.lua`; this is the pre-existing disabled availability state,
not a placement regression.

## Recording gaps

These marker coordinates are **world X/Z**, not teleport XYZ or map-grid
coordinates. Elevation at the target remains unresolved. Use the owning
quest's journal marker or `!qmobmarker <questId>` during capture; do not teleport
to the marker using an invented Y.

| Quest | Zone / map | Marker | Target world X / Z | Nearest recorded ground |
|---|---|---:|---|---|
| 110633 — Assessing the Damage | 130 / Eastern La Noscea | 11063301 | 1598.229980 / -1026.760010 | 148.69 yalms away |
| 110636 — Revenge on the Reavers | 131 / Mistbeard Cove | 11063601 | -1741.760010 / -1848.430054 | 256.78 yalms away |
| 110658 — The Penultimate Prank | 150 / Central Shroud | 11065801 | -451.410004 / -375.829987 | 378.9 yalms away in live and supplemental recordings |
| 110677 — Dressed to Be Killed | 178 / Copperbell Mines | 11067701 | -398.670013 / -206.949997 | No zone-178 recording found |
| 110679 — The Customer Comes First | 132 / Cassiopeia Hollow | 11067902 | 1756.670044 / -808.229980 | 97.17 yalms away |

Checked live `Data/quicknavmesh`, the separate supplemental
`Data/quicknavmesh-evidence/premerge-20260909` source, and available frozen
zone-130/131/132 evidence under `Data/guildleveplacements`. None covers the
four missing encounter areas within the chosen radius. The Penultimate Prank
has existing actor 2104508 profiles, but its nearest same-zone mob is about
233.3 yalms from the marker; existing mobs elsewhere do not resolve placement
at that marker. That population is preserved pending a recording.

### Prepared profiles for the remaining placements

| Quest / actor | New profile | Reviewed donor | Combat class |
|---|---:|---:|---|
| 110633 / Jetsam Jelly 2105409 | 39209 | 1275 | JellyfishNormalStandard |
| 110636 / Serpent Reaver claw 2180301 | 39210 | 1067 | FighterEnemyGladiatorStandard |
| 110636 / Serpent Reaver fin 2180302 | 39211 | 1066 | FighterEnemyMarauderStandard |
| 110636 / Serpent Reaver eye 2180303 | 39212 | 1256 | FighterEnemyArcherStandard |
| 110677 / Dapper Cadaver 2101816 | 39213 | 1136 | LivingdeadStandard |
| 110679 / Stormcry quartermaster 2180210 | 39214 | 1067 | FighterEnemyGladiatorStandard |
| 110679 / Stormcry boatswain 2180211 | 39215 | 1066 | FighterEnemyMarauderStandard |
| 110679 / Stormcry powder monkey 2180212 | 39216 | 1256 | FighterEnemyArcherStandard |

The six previously empty pirate class bindings now retain their exact actor,
display-name and appearance IDs and use property flags 23, matching existing
combat actors. Stormcry's main-hand graphics exactly match the respective
Black Crow donor actors (2180214, 2180217, 2180215). Reaver claw has the same
weapon/equipment model with another variant; fin uses another axe equipment
model; eye has the identical bow graphic. The main-hand weapon families are
76, 141 and 201, respectively. Their packing is verified against
`Player.GraphicChange` in `Map Server/Actors/Chara/Player/Player.cs`: weapon,
equipment and variant occupy successive ten-bit fields. This is a local
combat reconstruction, not proof of retail pirate skill rotations.

The manifest freezes exact main-hand values, donor snapshots and expected
bindings. Validation checks the referenced scripts exist and prevents profile
ID collisions. Live binding updates only affect the expected display-name ID
with an empty class and zero flags; they preserve pre-existing custom bindings.
No spawns are emitted for any pending area. New recording nodes must remain
separate from older source-local IDs.

### Capture handoff

[Open the remaining-area maps](maps/etc1-quest-mobs-20260911/capture/index.html).
These were rendered and inspected from each map's own frame. Mistbeard's
saved three confirmed test points were loaded and preserved; they are outside
the Reaver target and do not establish its floor. Cassiopeia's target is in the
separate eastern room beyond the currently recorded route. Copperbell's panel
deliberately shows only target X/Z because its floor and terrain layer remain
unresolved.

`Data/mobplacements/etc1-quest-mobs/capture_requests.json` provides the exact
journal targets, source-by-source hashes, coverage counts, source-local nearest
nodes, and approach-point teleport commands. It scans all checked-in zone
recordings, including live, supplemental and frozen evidence, independently.
Approach points are not the requested target locations and their heights must
not be copied to the targets.

For each of the five areas above:

1. Open its active quest journal map, or use `!qmobmarker <questId>` at the
   relevant objective sequence.
2. Turn recording off with `!quicknavmeshoff` before any teleport. Once standing
   on normal ground, use `!quicknavmeshon` and walk into the indicated area.
3. Record the approach and several spaced sweeps through the target room or
   clearing. Use `!quicknavmesh save` when finished.
4. Supply the saved `zone_130.tsv`, `zone_131.tsv`, `zone_150.tsv`,
   `zone_178.tsv`, and `zone_132.tsv`, or their containing folder path. Existing
   recordings and their source-local node IDs should be retained separately.

## Regeneration and validation

- Authoring manifest: `Data/mobplacements/etc1_quest_mobs.json`.
- Frozen ground: `Data/mobplacements/etc1-quest-evidence-20260911/`.
- Generated provenance, capture CSV and stable-ID placement SQL:
  `Data/mobplacements/etc1-quest-mobs/`.
- Live import: `Data/sql/live migrations/etc1_quest_mobs_20260911.sql`.
  It adds the profiles before placements, retains existing data, and checks the
  full profile identity before attaching a spawn to a BNPC ID. A conflicting
  live ID causes those spawns to be skipped; inspect imported counts.
- Canonical SQL reserves spawn IDs 960000–960051; the live migration uses
  auto-increment plus the same content-derived placement `uniqueId` values.

```powershell
python -B tools/mobspawns/etc1_quest_mobs.py build
python -B tools/mobspawns/etc1_quest_mobs.py render
python -B tools/mobspawns/etc1_quest_mobs.py capture
# Inspect plans, CSV, SQL and rendered PNGs before installing a revised draft.
python -B tools/mobspawns/etc1_quest_mobs.py install
python -B tools/mobspawns/etc1_quest_mobs.py check
python -B -m unittest discover -s tools/mobspawns -p test_etc1_quest_mobs.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
```

Validation passed: nine frozen-ground layouts, 17 new profile references, six
pirate bindings and generated catalog synchronization; seven regressions covering exact XYZ, additive SQL
idempotence, stationary spawns, conflicting/missing profiles, and separate
dungeon frames, plus pending-profile imports and conservative binding updates;
18 coordinate tests; existing objective actor/spawn checks.
SQL behavior tests use SQLite-compatible execution of the generated DML, with
the transaction opener adapted. They are not a live MySQL import or combat test.
