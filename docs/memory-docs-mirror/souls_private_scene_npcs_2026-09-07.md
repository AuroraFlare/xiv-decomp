# Missing NPCs at the Gridania flower beds

The supplied Opyltyl dialogue and destination `(-223.792, 12, -1498.369)`
identify Souls Gone Wild (`Man0g1`, quest 110006), sequence 50. Court in the
Sands has a separate miner emote step in Ul'dah, zone 209.

Zone 206 is correct for both public Gridania and the flower-bed scenes. Their
full identities are `206 / PrivateAreaMasterPast / 1` for the dance and type 2
for the whispering children. The pasted log confirms successful entry to type 1,
release of actor visibility on movement, seven NPC construction/init trains
(`0x46700006` through `0x4670000C`), and a final keep list containing 11 actors.

The repository and the configured local database both contain Fufucha and all
six children at the correct coordinates in both scenes, with appearance rows
and the children's emote conditions. No placement or database repair was
justified by those checks. The tester's database was not directly inspected.

## Transition defect and repair

Each Area restarts NPC allocation, and numeric actor IDs include the zone but
not the private-area type. Different private scenes therefore reuse the same
IDs. The staged transfer called `ClearInstance`, which only clears server
delivery bookkeeping, without explicitly retiring these source NPCs. The
subsequent destination keep list preserves reused IDs and cannot distinguish
the old scene's actor from its replacement. The recovered client registry
insertion at `0x004E5CA0` also has a duplicate-key path that does not insert a
new entry. This is a concrete ID-lifetime hazard consistent with the report;
the pasted summary does not prove which client objects remained at the time.

Same-zone transfers involving a private area now explicitly retire tracked
NPCs through the existing Session removal path. Retirement runs after event
settling and before the reload delay, while source actor identities are still
known. It preserves combat-claim cleanup, leaves area masters and players to
their existing lifecycle, and aborts if removal cannot be queued.

The Souls dance entry and completion also closed their events before queued
warps, despite `processEvent140` and `processEvent150` using an after-warp fade.
Those handoffs now publish the destination quest state and leave event closure
to the zone manager. Opyltyl's two re-entry branches use the same ownership
rule. The existing requirement of one successful child's emote is unchanged.

`!mypos` now appends the private-area name and type when applicable.

## Validation and rollout

The focused regression suite exercises Gridania entry, private-to-private
transfer, exit, Ul'dah miner scene transfer, nonmatching area transitions,
duplicate retirement, failed delivery, all six child emote routes, and
ordinary dialogue. It verifies explicit removal before admitting a new NPC
with the same ID and event ownership across queued quest transfers.

Run `Fishing Tests` with `--teleport-handoff-only`. The existing Court tests
also run with `--quest-npc-routing-only`. Debug compilation passes after adding
two missing `Meteor.Common` imports for pre-existing `Vector3` references in
`BattleCommand.cs` and `CommandResult.cs`.

Both focused suites passed. The broader `--client-crash-regression-only` run
stopped at the Sirocco passive/sight/five-minute-respawn SQL assertion in
`Fishing Tests/Program.cs:3462`. That test and its three SQL inputs are unchanged
from HEAD; this unrelated failure prevents claiming the broader suite passed.

Deploy the updated scripts and rebuilt Map Server, then restart Map Server.
The running Release server was not restarted by this investigation. No quest
reset or SQL migration is required. Retest Opyltyl entry, one child emote, the
whispering scene, and Court's miner step. Look for `[PrivateAreaActors]` before
`[ZoneReloadStage]`. Native NPC rendering still needs in-game confirmation.
