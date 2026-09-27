# Faction Guildleve Placement Capture

All 53 archived faction leves have objective-aware runtime configs. Their
current coordinates are intentionally provisional: each config starts from the
named area's coarse `gamedata_guildleve_mapmarkers` anchor and distributes the
actors locally. This makes every contract testable while preserving a clear
boundary between recovered mechanics and uncaptured placement.

## What is already implemented

- `1001-1020`: Brotherhood of the Broken Blade parties, waves, item drops,
  named bosses, and reinforcements.
- `1101-1119`: Azeyma's Shields bounty waves, fleeing targets, item searches,
  boss additions, and battle allies.
- `1201-1214`: Horn and Hand collection caches, stealth-follow targets,
  recovered-item points, and the four-minute `Intel Outside` destination.
- Faction-credit cost, objective work values, timers, targets, completion
  rewards, guaranteed faction coffers, and offer rules remain owned by the
  existing SQL/runtime data.

The implementation source is
`Data/scripts/directors/Guildleve/Leves/_faction_leves.lua`. Each numeric
faction file is a small loader for the matching catalog row.

## Positions still needing direct capture

The following groups describe the placement evidence needed; they are not
missing server mechanics.

| Capture group | Guildleve IDs | Evidence needed |
|---|---|---|
| Single-field combat | `1001` (first circle captured), `1002-1003`, `1007`, `1009`, `1012`, `1014`, `1017`, `1020` | For `1001`, remaining evidence is every linked party and its rotations. Others still need the objective circle, every linked party, rotations, and the wide separation of Arges/Brontes in `1020`. |
| Multi-wave combat | `1004-1006`, `1008`, `1010-1011`, `1013`, `1015-1016`, `1018-1019` | Initial/later circles, party membership, wave order, and boss/add positions |
| Standard bounty waves | `1101-1103`, `1105-1106`, `1109-1112`, `1115` | Initial prey circle, bounty circle, linked guards, and item-source packs |
| Fleeing bounties | `1104`, `1107`, `1108` | Initial disguise/bounty party, every flee waypoint, and the destination reinforcement circle |
| Search/relic bounties | `1113`, `1114` | Search/item points, revealed target circle, and later bounty circle |
| Relic/ally boss fights | `1116-1119` | Boss/add positions, HP-phase adds, allied NPC positions, and ally AI/failure observations |
| Static collections | `1201-1206`, `1209-1211` | Every crate/bottle/egg/ground-glow position and its native objective bucket |
| Stealth tracking | `1207`, `1208`, `1212`, `1213` | Tracked actor start, short route samples, retail detection distance, and final item point |
| Timed arrival | `1214` | Start NPC and exact destination; confirm the archived four-minute sub-timer |

All provisional positions currently use `Y=44`. Correct altitude and
terrain-safe routes are therefore the highest-value captures, even when the
coarse `X/Z` field is already recognizable.

Captured placement:

- `1001` `Operation: Reave-quest`: full encounter captured in zone `129`.
  War Wolf/start circle is at `(-1424.762, 41.359, -744.934)`, rotation
  `0.553`; `party_1` is at `(-1564.0342, 44.45087, -762.4956)` with two
  enemies; clearing it reveals `party_2` at
  `(-1676.7462, 46.037106, -697.5811)` with the remaining eight enemies.
  The temporary authoring wave named `main` and its mob were intentionally
  discarded.

## In-game capture loop

Use the existing GM authoring helper from the correct zone:

```text
!glbuild start <guildleveId>
!glbuild info
!glbuild circle [wave]
!glbuild wave <name>
!glbuild mob <slot 1-4> [objective 1-4|none] [group] [role] [tag]
!glbuild point <name> <objective> [chance] [passWave] [failProgress]
!glbuild route <name>
!glbuild reviewed <what was verified>
!glbuild finish
```

Additional commands such as `sequence`, `drop`, `repeat`, `movement`, `flee`,
and `actor` are available when a capture proves more than placement. `finish`
writes the review bundle to
`C:\serverdata\guildleve_authoring\<guildleveId>\`. Merge the captured
coordinates into the shared faction catalog rather than replacing its numeric
loader file blindly; the generated Lua is a review artifact and may not
include all recovered faction-specific branches.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate_guildleve_encounter_framework.ps1
dotnet build "Map Server/Map Server.csproj" --no-restore
```

The encounter validator checks that all 53 IDs load, every nonzero objective
has enough reachable progress, placement provenance remains explicit, the Lua
compiles, and the generic encounter branches execute against the fake
director.
