# Level 20/30/40 Faction Leve Battlefields

The 33 level 20, 30, and 40 faction leves use a custom enemy-themed battlefield
model. This is an intentional gameplay adaptation, not a claim of retail 1.x
accuracy. Leve IDs, titles, regions, levels, faction-credit behavior, rewards,
and publisher unlock chains remain unchanged.

All faction leves (including the level 50 catalog) have fixed encounter levels.
Their enemies always use the guildleve's base level plus three: level 20 leves
have level 23 enemies, level 30 has 33, level 40 has 43, and level 50 has 53.
Every faction enemy, including the boss and all adds, displays its level as `??`
with the client's NM-style badge. This is presentation only: it does not enable
additional notorious-monster stat, drop, or respawn rules. The actual combat
levels remain 23/33/43/53, including level 53 above the normal character setter's
level-50 limit. Allied NPCs and ordinary guildleve enemies keep their usual display.
The listed leve levels and reward tiers remain 20/30/40/50; this fixed offset
does not add a difficulty-star reward bonus. Acquisition uses the permanent
level of the active class and is allowed five levels below the listed tier:

| Leve/reward tier | Minimum acquisition level | Fixed enemy level |
|---:|---:|---:|
| 20 | 15 | 23 |
| 30 | 25 | 33 |
| 40 | 35 | 43 |
| 50 | 45 | 53 |

The faction catalog is available independently of the ordinary guildleve content
cap. The server's character-level cap is unchanged. All level-20/30/40 faction
leves cost zero faction points and can be accepted with a zero-point balance.
Only level-50 faction leves retain their configured faction-point costs.
Allowance, journal-space, and special-operation prerequisites still apply.
Horn and Hand's lower-tier special cards also appear in the normal matching
tier list so the client's special-menu level gate does not delay them.

Both aetheryte menus skip the initial
difficulty selector and disable difficulty changes and leve linking during play.
The director also enforces these restrictions for direct/scripted requests and
ignores stale linked-leve bonuses. Party members can still join as helpers;
the existing boss/add tuning and party-size HP/damage scaling below are unchanged.
Ordinary guildleves retain their difficulty selection and leve linking.

These encounters use two players as their baseline. A solo player may attempt
one, but the encounter does not reduce its enemy requirements below the duo
design. Each participant above two gives every enemy 8% more maximum HP and MP
and 3% more auto-attack, physical-action, ranged, and spell damage. The party
count is frozen when the leve starts, so later joins do not reroll live enemies.

| Participants | HP/MP | Damage |
|---:|---:|---:|
| 1-2 | 100% | 100% |
| 3 | 108% | 103% |
| 4 | 116% | 106% |
| 5 | 124% | 109% |

Each mission has one battlefield anchor and one pull: a large, specially named
boss plus two to five thematically related adds. There are no reinforcement
waves. When terrain-safe coordinates are supplied, the faction NPC spawn and
the circle anchor should both use that position. Captured rotation faces the
boss side of the layout; uncaptured coordinates remain provisional.

The boss has 275% of normal HP/MP, 110% damage, and gains two appearance-size
steps (up to the client maximum). Adds become individually weaker as their
count rises, keeping the combined health budget close across all four pack
sizes:

| Adds | HP/MP per add | Damage per add | Boss + add HP budget |
|---:|---:|---:|---:|
| 2 | 80% | 90% | 435% |
| 3 | 65% | 75% | 470% |
| 4 | 52% | 60% | 483% |
| 5 | 42% | 50% | 485% |

Participant scaling is applied after these role multipliers.

## Captured battlefield placements

| ID | Area | Zone | Circle/NPC anchor | Commander-facing rotation |
|---:|---|---:|---|---:|
| 1001 | Camp Skull Valley | 129 | `-1340.990, 45.271, -725.375` | `0.019` |
| 1101 | Camp Skull Valley | 129 | `-1218.301, 44.720, -613.933` | `3.016` |
| 1002 | Camp Bloodshore | 130 | `1152.629, 44.689, -677.796` | `-2.816` |
| 1102 | Camp Bloodshore | 130 | `1341.450, 46.000, -765.111` | `-0.697` |
| 1203 | Camp Iron Lake | 135 | `-162.380, 71.010, -2330.882` | `-2.997` |
| 1004 | Cedarwood | 128 | `638.241, 42.179, -157.129` | `-1.141` |
| 1006 | Cedarwood | 128 | `668.969, 60.189, 129.092` | `0.572` |
| 1106 | Cedarwood | 128 | `837.080, 61.998, 258.820` | `-2.288` |
| 1105 | Cassiopeia | 132 | `1266.236, -67.816, -869.467` | `0.044` |
| 1202 | Cassiopeia | 132 | `1381.175, -70.272, -1071.569` | `-0.290` |
| 1212 | Camp Horizon | 172 | `-1415.806, 24.000, -442.310` | `-0.349` |
| 1007 | Camp Broken Water | 174 | `1792.494, 280.000, 1084.622` | `-2.098` |
| 1008 | Camp Broken Water | 174 | `1916.109, 263.852, 1053.068` | `-1.261` |
| 1107 | Camp Broken Water | 174 | `1799.519, 264.421, 1194.671` | `-2.766` |
| 1005 | Nophica's Wells | 172 | `-872.395, 86.563, 529.679` | `-1.706` |
| 1104 | Nophica's Wells (compact) | 172 | `-1038.907, 92.020, 299.397` | `0.538` |
| 1209 | Nanawa Mines | 176 | `207.910, 167.794, -1453.524` | `-1.593` |
| 1010 | Camp Nine Ivies | 151 | `1601.616, 15.252, -771.969` | `1.881` |
| 1108 | Camp Nine Ivies | 151 | `1500.283, 20.054, -794.270` | `1.118` |
| 1110 | Camp Nine Ivies | 151 | `1396.286, 19.342, -964.113` | `1.094` |
| 1207 | Camp Nine Ivies (shared arena) | 151 | `1601.616, 15.252, -771.969` | `1.881` |
| 1003 | Camp Tranquil | 154 | `614.384, -11.421, 1069.586` | `1.705` |
| 1103 | Camp Tranquil | 154 | `673.515, -12.000, 797.003` | `-0.577` |
| 1211 | Camp Tranquil | 154 | `675.124, 0.038, 1150.831` | `-1.515` |
| 1213-A | Mun-Tuy Cellars (randomized) | 157 | `-880.373, -36.000, -2188.570` | `-3.091` |
| 1213-B | Mun-Tuy Cellars (randomized) | 157 | `-751.760, -23.347, -2127.474` | `1.529` |
| 1213-C | Mun-Tuy Cellars (randomized) | 157 | `-847.099, -24.132, -2095.552` | `1.608` |
| 1009 | Camp Dragonhead | 143 | `52.980, 288.562, -217.523` | `2.148` |
| 1109 | Camp Dragonhead | 143 | `166.557, 264.080, 149.591` | `-2.412` |
| 1206 | Camp Glory | 145 | `1587.695, 206.597, 848.961` | `-2.893` |
| 1210 | Camp Glory | 145 | `1682.844, 178.367, 997.693` | `2.705` |
| 1208 | Camp Riversmeet | 148 | `-2007.522, 274.953, -28.857` | `2.356` |

## Encounter identity

- Brotherhood of the Broken Blade (`1001-1010`): a battlefield captain leading
  a compact pirate, beastman, or military squad.
- Azeyma's Shields (`1101-1110`): the wanted target already present with its
  local guards.
- Horn and Hand (`1201-1213`): a named resource guardian or criminal leading
  creatures associated with the stolen resource or quarry.

Every mission awards its ordinary faction-leve completion chest after its last
required enemy or item objective is complete.

## Brotherhood objectives

| ID | Level | Title | Playable objective |
|---:|---:|---|---|
| 1001 | 20 | Operation: Reave-quest | Bilge-soaked Captain with two Bloodied and two Windborn Buccaneers. |
| 1002 | 20 | Operation: Kobold as Ice | Oversized Frostbeard Supplicant with four weaker supplicants. |
| 1003 | 20 | Operation: Sylph Stalkings | Goldleaf Sylphlord with one red, one turquoise, and one green Sylph. |
| 1004 | 30 | Operation: Supplication Denied | Oversized Ashcrown Supplicant with four weaker supplicants. |
| 1005 | 30 | Operation: Bloody Side Up | Oversized Goretooth Goon with three weaker Qiqirn Goons. |
| 1006 | 30 | Operation: Reaving Home | Reaver Captain with two Bloodied and two Windborn Buccaneers. |
| 1007 | 40 | Operation: Warm Welcome | Flamefist Transfigurator with one drapper, one lancer, and two bowyers. |
| 1008 | 40 | Operation: Broken Thunder | Thunderclap Transfigurator with two transfisticators and two transfixers. |
| 1009 | 40 | Operation: Scar and Defeather | Oversized Scarwing Bravo with four weaker Ixali Bravos. |
| 1010 | 40 | Operation: Frame Work | Oversized Ironframe Bravo with five substantially weaker Ixali Bravos. |

## Azeyma's Shields objectives

| ID | Level | Title | Playable objective |
|---:|---:|---|---|
| 1101 | 20 | Wanted: Xha Viqqoh the Nibbler | Xha Viqqoh with four weaker Wharf Rats. |
| 1102 | 20 | Wanted: Palemoon Parazuzu | Palemoon Parazuzu with two wolves of each local guard type. |
| 1103 | 20 | Wanted: Rorogun the Tailtamer | Rorogun with three galago guards. |
| 1104 | 30 | Wanted: B'khenna the Phoenixfire | B'khenna with two Beady Beetles and two ladybug guards. |
| 1105 | 30 | Wanted: Ser Aucheforne of the High Tide | Ser Aucheforne with two Shore Slugs and two Sea Hares. |
| 1106 | 30 | Wanted: Godwin Goodgoat | Godwin with a Lone Wolf and three mixed karakul guards. |
| 1107 | 40 | Still Wanted: B'khenna the Phoenixfire | B'khenna with three Giant Gnats and two syrphid guards. |
| 1108 | 40 | Wanted: Coiled Adder | Coiled Adder with two Desert Peistes and two pteroc guards. |
| 1109 | 40 | Wanted: Toadsquatter Femomo | Toadsquatter Femomo with four weaker Gigantoads. |
| 1110 | 40 | Wanted: Alvara Sourkiss | Alvara Sourkiss with three Forest Funguars and two Flytraps. |

## Horn and Hand objectives

| ID | Level | Title | Playable objective |
|---:|---:|---|---|
| 1201 | 20 | Collecting Sea Shells | Ammunition Keeper with one Bloodied and one Windborn Buccaneer. |
| 1202 | 30 | Spoiled Soil | Soil Guardian with two Giant Slugs and one Salt Hare. |
| 1203 | 40 | Old Money | Ancient Coffer Guardian with three Kobold Supplicants and two Zealots. |
| 1204 | 30 | Something in the Air | Venomtongue Smuggler with two Footpads and two Nightblades. |
| 1205 | 30 | It's the Smell | Sweetbox Fiend with two Funguars and one Flytrap. |
| 1206 | 30 | A Weighty Problem | Armor Coffer Guardian with two Ixali Bravos and two Bombardiers. |
| 1207 | 40 | Diamonds in the Rough | Gem Broker with three Qiqirn of one band and two of the other. |
| 1208 | 40 | Golden Opportunity | Gold Hoarder with three Spriggans of one kind and two of the other. |
| 1209 | 40 | While They're Young | Brood Guardian with three Antlings of one kind and two of the other. |
| 1210 | 30 | Heat of the Moment | Airship Raider with two Wind and two Fire Elementals. |
| 1211 | 20 | Unlike a Rolling Stone | Moss Fiend with one Squirrel and one Marmot. |
| 1212 | 20 | Looting the Larder | Butcher Basilisk with one Fellbite and one Rockbite Peiste. |
| 1213 | 30 | Hook, Line, and Sinker | Hide Poacher with two Skulking Wolves and one Foraging Doe. |

## Data contract

All 33 missions use kill objective `12001`, no collection items, and counters
that exactly match their one-pull rosters. Horn and Hand keeps mission class
type `4`, its original faction plates, and three nonzero mob targets. Fresh databases receive this metadata
from `Data/sql/gamedata_guildleves.sql`; existing databases receive the same
idempotent updates from
`Data/sql/live migrations/faction_leve_enemy_battlefields.sql`.

Enemy drop tables are deliberately unchanged in this pass. Battlefield-specific
drops and new items can be designed separately without changing the encounter
layout or objective counters.

## GM battle testing

Use `!factionleve <leveId>` to test any player-captured battlefield at its fixed
encounter level. The old optional `1` argument is still accepted for compatibility;
other difficulty arguments are rejected.
If the GM is in another zone, the first invocation moves them to the captured
anchor; repeat the command after the zone finishes loading to begin the fight.
The command starts the same guildleve director, objective circle, one-pull
roster, party snapshot, and combat scaling used by normal play. Mun-Tuy leve
`1213` selects one of its three captured anchors and shares that selection with
the director.

Command-started runs are GM test mode: they do not change any participant's
guildleve journal or faction credits, and they suppress the completion chest,
warp point, and completion rewards. Use `!factionleve status` to inspect the
attached test and `!factionleve stop` to clean it up. IDs `1201`, `1204`, and
`1205` remain unavailable through this command until their zone-safe placements
are captured.

Run `tools/validate_guildleve_encounter_framework.ps1` to compile every leve
script and verify objective reachability, one-pull battlefield identity, boss
presentation and combat scaling, SQL counter parity, migration coverage, and
actor-class validity.

After building Map Server, run `pwsh -File tools/validate_faction_leve_rules.ps1`
to exercise the compiled server restrictions, Lua property access, both aetheryte
menus, cancellation paths, and fixed-level GM tests without starting a live server.
