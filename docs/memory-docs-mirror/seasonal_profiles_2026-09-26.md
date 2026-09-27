# Versioned seasonal profiles and supported city homes

The main Map Server configuration now separates Hatching-tide 2011/2012,
Moonfire 2011/2012, Valentione 2011/2012, Little Ladies' Day 2011/2012, Heavensturn 2011, Foundation Day
2011/2012, and the late 2012 Seventh Umbral event. All new switches default
to `false`. The existing Halloween, Starlight and Heavensturn switches retain
their own event scopes. `seasonal_quests_enabled` is a legacy scaffold probe
switch; enabling a named event no longer enables every seasonal scaffold.

## Client event mode

`SetSpecialEventWorkPacket` previously sent mode 18 to every player, even with
seasonal content disabled. It now sends zero with no relevant profile active.
Native consumers documented in `seasonal_control_plane_decomp_2026-07-11.md`
establish the following single-word values:

| Profile | SpecialEventWork[9] | Recovered consumer |
|---|---:|---|
| Moonfire 2012 | 18 | Fire Dance emote visibility and command |
| Foundation Day | 11 | Company tracers and Patriot's Choker shop rows |
| Seventh Umbral 2012 | 20 | Late-era teleport filtering and dialogue/music |
| Other profiles or none | 0 | No claimed mode-9 consumer |

The decoder also recognizes the earlier tracer-only company festival mode 8.
No profile is invented for that phase. Conflicting 18/11/20 profiles reject
configuration at startup because the client has one such word. The two
Hatching-tide releases also reject simultaneous selection because their shared
human NPCs have different services. Moonfire and Foundation Day releases each
require exclusive selection because they share booth homes. These are operator conflict policies, not
claims about retail scheduling. The shared 2010/2011 bell profiles (Starlight,
Heavensturn, Valentione and Little Ladies' Day) also require exclusive selection.
Weather and resident city décor remain separate
protocol lanes; mode 18 does not itself launch fireworks or change weather.

The central quest allowlist also checks the exact seasonal profile before new
offers, including when the allowlist file is missing or malformed. The six
2011 Dreamer IDs, both Moonfire IDs, the existing Halloween/winter IDs and
Scrambled Eggs have independent gates. Quest scripts retain their own checks.

## Main SQL population

`Data/sql/server_seasonal_eventnpc_spawn_locations.sql` owns the complete new
population. `WorldManager.Seasonal.cs` reads only enabled profiles after the
ordinary public population starts. There is no live-only migration or code
fallback position. An installation missing the table logs the required main
SQL file. Existing static identities are checked before creation.

The initial city and field-cadet layer has **74 homes**:

| Profile | Homes | Evidence and limits |
|---|---:|---|
| Hatching-tide shared humans | 6 | Native spokesperson markers 11501001–03 and unique surviving human name identities |
| Hatching-tide 2011 spriggans | 6 | 2011 quest actor identities, reconstructed nearby homes |
| Valentione 2012 | 9 | Native three-role actor roster; guide cells Limsa (7,6), Gridania (6,5), Ul'dah (5,3) |
| Moonfire 2011 | 2 | Limsa/Gridania matching captain names and later marker hubs; reuse for 2011 is reconstructed |
| Moonfire 2012 | 3 | Native captain markers 11501101–02, plus Lower La Noscea field cadet at recorded ground near guide cell (26,30) |
| Foundation/late 2012 | 12 | Eight unchanged historical Gridania/Ul'dah main-SQL rows, plus four Limsa homes on exact recorded ground at guide cell (7,6) |
| Foundation 2011 | 12 | Native aliases share the 2012 display identities; reusing those booth homes for 2011 is inferred |
| Three 2011 bell profiles | 15 | Five of nine documented squares per profile have supported recorded homes |
| Little Ladies' Day 2012 | 9 | Contemporary guide Limsa (7,6), Gridania (6,5), Ul'dah (5,3), with native nine-role topology |

The forty targeted Hatching/Moonfire/Little Ladies/Foundation actor-class rows now use the
existing `PopulaceStandard` interaction bridge, preserving each native display
name and appearance. This server binding is a reconstruction; it is not a claim
that the empty client rows contained that class path.

All **58 homes without prior SQL locations use complete XYZ from one frozen recording**.
No sample's Y is transferred to a different X/Z. The eight original Foundation rows and
eight 2011 booth reuses retain the entire prior SQL XYZ and rotation. Role-to-node assignment and new rotation
zero are authored. None is claimed as recovered retail actor XYZ or accepted
client clearance. Native page selection does not assign recorded floor membership.

The reproducible manifest pins source-local node IDs and recording SHA-256 values
under `Data/seasonalevents/placements.json`. Sources are the separate frozen
`Data/quicknavmesh-evidence/quicknavmesh-20260924/zone_ID.tsv` files. Each city was
inventoried and located with the shared coordinate CLI. Rendered native artwork
was inspected on Limsa Upper Decks page 914, Gridania page 2800 and Ul'dah Merchant
Strip page 1800; PNGs and exact `.frame.json` calibrations are in
`docs/maps/seasonal-20260926/`. These show the supported walkway regions; client
testing still needs floor contact, path clearance, neighboring NPCs and interaction.

Ul'dah's Moonfire captain marker 11501103 is at X/Z -237.919998/174.449997.
Its nearest height-filtered recording is about 143 yalms away. That city captain
is deliberately absent from this layer: no distant sample height or other event
hub is substituted. Bells cover Limsa Upper (7,7), Lower (5,5), Gridania (4,4),
and Ul'dah (5,3)/(7,4). Limsa (7,2), Gridania (6,1)/(7,4), and Ul'dah (5,5)
have no frozen samples inside the documented squares. Little Ladies 2012 uses
the contemporary March 2012 wikiwiki guide's Gridania (6,5), correcting the
secondary fandom page's unsupported (6,6) cell.
Decor, 2012 Hatching spriggans/pods and other seasonal encounters need their own
supported populations. A switch alone does not imply those populations are complete.

## Egg gathering population

`hatching_field_population.py` adds four seasonal gathering sites per year,
with eight isolated mob/drop profiles (62000–62007). Ordinary spriggan profile
1197 and all ordinary spawn rows remain unchanged. Main mob-type, main loot and
`server_seasonal_battlenpc_spawn_locations.sql` carry the complete data.
The runtime publishes the selected year, retaining normal public leash, senses,
death rewards and respawn through the existing battle-NPC implementation.

| Species | Supported site | Frozen source-local node |
|---|---|---:|
| Shuffling | North Shroud page 2200, (15,22) | 2775 |
| Scrambling | South Shroud page 2400, (39,52) | 1321 |
| Scurrying | Western Thanalan page 1300, (19,33) | 5891 |
| Sprinting | Tam-Tara first ring page 2600, (4,5) | 1095 |

The archived 2011 Dreamer's Dilemma guide supplies species, cells, fancy eggs,
polarity associations and elemental eggs. Native Spl101 confirms four fancy
types and five colored eggs for 2012. Reusing the Western Thanalan site for
2012 is inferred; its named Humblehearth cave lacks frozen local coverage.
All homes use complete XYZ, recorded hash and node ID; rendered native artwork
was inspected, including both Tam-Tara pages to distinguish the matching corridor.

Population count (one per site), facing, levels 10/20/30/40, 60-second respawn,
standard spriggan combat kit and drop rates are authored reconstruction. Each
species guarantees its fancy egg; 2011 adds 25% associated Astral/Umbral and
independent 1/6 chances per elemental egg, while 2012 uses independent 20%
chances per color. These are explicit playable defaults, not recovered retail
probabilities. Other regional sites, Motley/Midnight sources, pods and secret
daily recipes remain unresolved. Live floor, combat and loot acceptance is open.

## Reproduction and validation

```powershell
python -B tools/mobspawns/seasonal_event_placements.py build
python -B tools/mobspawns/seasonal_event_placements.py check
python -B tools/mobspawns/hatching_field_population.py build
python -B tools/mobspawns/hatching_field_population.py check
dotnet run --project tools/seasonal-profile-tests/SeasonalProfileTests.csproj --configuration Release
python -B tools/validate_quest_availability.py
python -B tools/validate_seasonal_event_runtime.py
python -B -m unittest tools.mobspawns.test_map_coordinates tools.mobspawns.test_map_registry
```

The profile harness links the production mode policy and packet serializer. It
checks conflicting profiles, recovered values, the disabled default, actor scope,
the exact +2 payload word and zero remaining fields. The population check fails
if a frozen source changes, an historical Foundation row is altered, or the main
SQL/manifest/class bindings diverge. No live database was changed or server
restarted by this implementation pass.
