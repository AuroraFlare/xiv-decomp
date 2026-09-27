# Tutorial guildleve verification and repairs — 2026-09-09

The three tutorial leve IDs already had publisher cards, director routing and
help text, but the publisher passed `false` for the client menu's tutorial
visibility flag. None had a numeric encounter configuration or explicit spawn
rows. They therefore used the generic fallback around old camp markers,
including placeholder Y=44 for Black Brush and Bentbranch.

The tutorials now have an available publisher menu option and explicit
encounters with three isolated, initially passive targets each. All nine
spawn slots and three circle centers use exact recorded XYZ. The 72 ordinary
level-1/10/20 battlecraft leves remain a separate set.

| ID | Tutorial | Camp | Targets | Circle distance from camp |
| --- | --- | --- | --- | ---: |
| 10801 | My Very First Adventure | Bearded Rock | 3 Plague Rats | 110.7 yalms |
| 11601 | Moles for the Mauling | Black Brush | 3 Naked Moles | 107.1 yalms |
| 12401 | Spore Spoor | Bentbranch | 3 Stumbling Funguars | 155.1 yalms |

Distances use the camp NPC context in the placement manifest. Each objective
circle has radius 64; the camp aetheryte is outside it. Targets are at least
12 horizontal yalms apart and have link group zero. The unchanged catalog
targets resolve to existing actor classes 2204001, 2205702 and 2205901.

## Progression

The existing tutorial director now loads the shared encounter engine, exposing
the authored marker during client initialization and suppressing generic spawn
generation. After the normal start delay, it spawns the three targets and
shows the introduction. Map guidance follows; the nearby hint waits until a
participant is within 64 three-dimensional yalms of the circle center.

The first defeat gives the total-target and experience hints. Exactly three
defeats complete the objective through the shared guildleve completion path.
The tutorial then explains the reward/return node. Fast completion during the
opening messages still gives experience and reward guidance, without delayed
map/nearby instructions. Cancellation during startup or play stops the hints.

The normal reward-node script handles collection, reopening without a second
claim, returning to the camp and allowing the node to dissipate. Reward rules,
allowance consumption and journal limits remain the existing shared behavior.
This change exposes the publisher tutorial path; it does not add an automatic
opening-story quest award or establish historical availability for every 1.x
patch. The alternate archive ID 10802 is not enabled.

## Placement evidence and review

[The manifest](../Data/guildleveplacements/tutorials.json) records source hashes,
source-local node IDs, camp context and authored placement status. It uses the
user's preserved `Data/quicknavmesh-evidence/premerge-20260909` files for zones
128, 170 and 150. Existing live recordings and confirmed coordinates are intact.
The saved eLeMeN city battlecraft descriptions and local catalog support three
individual targets. Locations are authored, not recovered retail positions.

[Map previews and test commands](maps/guildleve-tutorials-20260909/index.html)
show all three circles. Each PNG was reviewed against its calibrated map and
recorded ground overlay. The companion frame preserves the pixel/world mapping.
No escape course is involved in these three encounters. Map artwork and ground
samples do not establish collision safety.

## Validation and remaining live checks

`powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate_guildleve_tutorials.ps1`
drives the real publisher, tutorial director, encounter engine and reward-node
Lua with explicit C# actor/client/database test doubles. It covers all three
city offers, held/full/allowance/decline cases, all six kill orders per tutorial,
fast completion, far/near hints, cancellation before and after startup, reward
claim/reopen and handoff to each camp's production return coordinates.

`python -B tools/mobspawns/tutorial_guildleve_placements.py --check` verifies
catalog objectives/profiles, source hashes, exact XYZ, separation, circle
containment and generated Lua. The existing low-level repair and regional
offer tests pass, as does the shared chest/reward static validator.

These checks passed offline. A live walkthrough of the stock client menu,
terrain, combat, reward grant and return teleport is still pending; no game
server restart or database import was performed for this verification.
