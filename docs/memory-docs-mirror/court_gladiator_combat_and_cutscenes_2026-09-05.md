# Court in the Sands: gladiator and cutscene corrections

The player can initiate the duel once the client is ready, while the gladiator
still waits ten seconds before attacking on its own. An attack or direct damage
action from the player releases Court's hold. Loading, other quest fights, and
scripted flee holds retain their existing protection.

The quest's Lua spawn path applies -50 to AutoAttackDamage and
PhysicalActionDamage. This halves its auto-attack and physical skill damage
modifiers without changing its level, HP, or other gladiators.

After victory, the player lands in the post-fight private area away from both
triggers. The two circles have a radius of two yalms and activate in order:

| Step | Position in zone 209 | Handler |
| --- | --- | --- |
| Landing | -181.758, 189.985, 219.688; rotation 1.753 | No scene |
| First spot | -177.792, 189.950, 215.566; rotation -3.014 | processEvent035 / man0u135 |
| Second spot | -177.773, 192.141, 210.842; rotation 3.111 | processEvent040 or processEvent045 / man0u140 |

The first handler normalizes the empty client return value before logging.
MoonSharp can otherwise throw from tostring on a void result, preventing the
completion flag and return warp. It saves the flag after the delegate returns,
retires the first trigger and enables the second, then performs the warp expected
by startFadeInCutSceneAfterWarp. The second trigger never substitutes for the first.

Both scene handlers capture the player's position and rotation at entry. Their
required return warps restore that position instead of snapping to a circle's
center or using coordinates changed by the movie. Both guild completion orders
retire the second trigger before returning to the public area. The zone-change
pipeline owns EventFinish; the second handler no longer ends the event separately.

The five-minute server countdown checks the shared director's deleted state.
Victory ends that director immediately, before the two-second presentation
delay. Native kill callbacks load a fresh Lua script, so their local completed
flag alone cannot stop main's countdown. The shared lifecycle also prevents
duplicate kill rewards, a timeout during the victory delay, and an old timer
warping the player out after a win or director cancellation. This hidden fight
director sends a time-limit notice, but does not create a separate timer widget.

## Applying the change

Deploy the updated quest and director Lua files and rebuild/deploy Map Server.
Map Server now supplies the two dedicated actor definitions and normalizes the
two spawn locations when zone 209's PrivateAreaMasterPast level 1 starts. Missing
database rows are created in memory; legacy, misplaced, and duplicate Court
trigger rows are replaced. Other NPCs and private areas are preserved. This fixes
a gap in the earlier migration, which only updated rows that already existed;
the ordinary spawn path also silently skipped classes missing from the database.

The updated `Data/sql/migrations/20260905_court_post_fight_triggers.sql` also
inserts missing rows and updates existing rows if persisting the definitions in
the database is desired. Runtime recovery does not require that migration.
Shared actor classes 1090077 and 1099047 are unchanged.

Existing characters at the post-fight stage use their saved completion flag:
unfinished first scenes enable the first spot; finished first scenes enable
the second spot. No quest reset is needed.

## Verification

- `dotnet run --project tools/quest-map-marker-tests --no-restore`
- `dotnet run --project "Fishing Tests/Fishing Tests.csproj" --no-restore -p:BuildInParallel=false -m:1 -- --quest-npc-routing-only`

Tests exercise the production combat hold gates, loading protections, empty
cutscene replies, state commits after replies, both guild completion orders,
player-first combat, failed engagement retry, timeout cleanup, and post-kill
landing. SQL/JSON checks verify the two circles are separate and the second
position matches the supplied coordinates. Native client playback still needs
an in-game retest after deployment.
Timer regressions use fresh callback closures to match native dispatch, including
victory at second 299, duplicate/late kills, and external director cancellation.
Native tests now cover missing/legacy/duplicate spawn data, dedicated actor
definitions without a database catalog, and the actual session's push-status and
quest-circle packets for first scene, second scene, and both scenes completed.
Cutscene coroutine tests inject movement while each movie is suspended and verify
the original entry position is restored with trigger handoff completed before warp.
