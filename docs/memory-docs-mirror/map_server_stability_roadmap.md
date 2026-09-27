# Map Server Stability Roadmap

This note tracks follow-up work for keeping the map server stable during heavy combat, mob respawn, and crowded-zone packet bursts.

## Current Mitigation

The current transport changes focus on stopping one burst from monopolizing the map server:

- Send flushes are serialized so multiple flushes do not write to the same socket at the same time.
- Flush passes are budgeted by packet count and elapsed milliseconds, then rescheduled if packets remain.
- Repetitive non-critical `0x0137` actor-property packets can be throttled when the queue is already deep.
- Critical `/_init` `0x0137` packets are preserved so respawned actors stay named, targetable, and valid.

These changes are intended to improve normal play and small-group stress behavior. They are not a full solution for large events or 50 players killing many mobs at once.

## Next Priorities

1. Add per-session priority queues

Critical packets should have their own lane and should not compete directly with repeated property updates or combat text.

Suggested priority groups:

- Critical: actor add/remove, position spawn, name, appearance, `/_init`, script bind, zoning, disconnect.
- Important: HP/MP/TP, targetability/combat state, status effects, hate/claim ownership.
- Best-effort: repeated property churn, combat log text, reward text, duplicate visual updates.

2. Coalesce repeated actor-property updates

Many `0x0137` packets update the same actor properties repeatedly during combat. Instead of sending every intermediate value, keep only the latest pending value per actor/property target when the queue is under pressure.

Good first targets:

- HP/MP/TP updates.
- Cast gauge updates.
- Recast timer updates.
- Repeated combat state/property refreshes.

3. Add zone-level broadcast pacing

Right now mass mob death or respawn can enqueue packets for every nearby player immediately. Add a zone broadcast scheduler that spreads large broadcast batches across ticks.

This should prevent:

- One mob cluster from creating a packet wall.
- One crowded area from starving the rest of the zone.
- Multiple players disconnecting at the same time because the map server fell behind.

4. Make respawn packets atomic from the client's point of view

Respawn should deliver a complete actor creation sequence before lower-priority packets are interleaved.

The protected sequence should include:

- Add actor.
- Spawn position.
- Appearance.
- Name.
- State and substate.
- Init status.
- Actor icon.
- Zoning false.
- Script bind.
- Required `/_init` property packets.

5. Reduce reward packet bursts

EXP, chain, loot, gil, and battle result packets can arrive in tight clusters after multi-kills. The client and server both appear sensitive to those bursts.

Suggested work:

- Batch reward summaries where retail-compatible.
- Suppress duplicate chain text when it repeats within a short interval.
- Spread reward text over multiple ticks during multi-kill events.
- Keep level-up and critical reward state higher priority than flavor text.

6. Add transport metrics that can be enabled during tests

Diagnostics should make overload visible without requiring huge debug logs.

Useful counters:

- Current queue depth per session.
- Packets sent per flush pass.
- Packets dropped by opcode and reason.
- Critical packets preserved.
- Flush pass elapsed time.
- Number of rescheduled flushes.
- Maximum queue depth over the last interval.

7. Add synthetic stress tools

Testing with two real clients is useful, but it cannot prove 50-player behavior.

Useful tools:

- GM command to spawn and kill N mobs at once.
- GM command to trigger respawn bursts without waiting.
- Fake session/load harness that can attach to a zone connection and consume outgoing packets.
- Packet replay test for known dangerous combat and respawn sequences.

8. Audit shared data structures touched by map ticks and send tasks

The transport now uses background flush tasks. Any shared collections or actor state used across zone updates and send preparation should be reviewed for thread safety.

Pay special attention to:

- Session list access.
- Actor instance lists.
- Actor property packet generation.
- Broadcast around actor/point.
- Disconnect and cleanup paths.

9. Revisit socket send behavior

The current send code handles partial sends and uses send timeouts. Longer term, consider a dedicated per-connection send worker or async socket sends with explicit backpressure.

Goals:

- Avoid blocking map update work on socket writes.
- Keep per-client slowdowns isolated.
- Disconnect or degrade one slow client without harming the zone.

10. Define stability targets

Pick measurable targets so tuning is not guesswork.

Suggested starting targets:

- 2 clients: no disconnects after 15 minutes of repeated mob kills and respawns.
- 10 simulated players: no unbounded queue growth during multi-kill bursts.
- 50 simulated players: queue depth spikes but drains after combat stops.
- Respawned mobs always keep names and targetability.
- No simultaneous disconnects caused by one combat burst.

## Current Recommended Test Profile

These values favor stability during crowded-zone testing:

```ini
transport_queue_stabilization_enabled = true
transport_queue_opcode_throttle_enabled = true
transport_queue_opcode_throttle_min_interval_ms = 35
transport_queue_opcode_throttle_queue_depth = 8
transport_flush_max_packets_per_pass = 32
transport_flush_max_milliseconds_per_pass = 4
```

Tuning guidance:

- If S/R climbs forever or players disconnect together, reduce `transport_flush_max_packets_per_pass` to `24` or `transport_flush_max_milliseconds_per_pass` to `2-3`.
- If updates feel too delayed but the server remains stable, raise `transport_flush_max_packets_per_pass` to `48-64` or `transport_flush_max_milliseconds_per_pass` to `6-8`.
- If actors become stale but clients stay connected, raise `transport_queue_opcode_throttle_queue_depth` to `12-16`.

## World-to-Map Send/Receive Color Interpretation

The World-to-Map Send/Receive status can start red, move to yellow, then settle on green during startup, login, or session attach. Treat this as a normal warm-up sequence if it happens briefly and remains green after the World and Map servers have exchanged traffic.

Suggested interpretation:

- Red at startup means no recent World-to-Map send/receive activity has been observed yet.
- Yellow means one side has begun activity, or the recent packet/health window is only partially satisfied.
- Green means both directions are active enough for the monitor to consider the World-to-Map connection healthy.

What to watch during solo testing:

- Good: red -> yellow -> green once, then stays green during idle, movement, login, and logout.
- Suspicious: the status flips back to red while logged in, especially near `[WorldZoneSend]`, `[WorldZoneRecv]`, socket send failures, or zone disconnect logs.
- Bad: the status stays red or yellow after login completes, or the player cannot enter the map.

Useful solo test pass:

1. Start Map and World, then watch the World-to-Map status before login.
2. Login one character and confirm the status reaches green.
3. Move in map for 1-2 minutes and confirm it stays green.
4. Logout and reconnect once. A brief color reset is acceptable if it returns green.
5. With debug enabled, confirm World logs show `[WorldZoneSend]` and `[WorldZoneRecv]` around login/session begin.

This note assumes the color display is based on recent send/receive activity. Do not treat the startup transition itself as a failure unless it remains red/yellow or coincides with failed login, zoning failure, or disconnects.

## Important Caution

Dropping packets can stabilize the server, but dropping the wrong packets creates broken actors. Any future throttling should explicitly preserve actor creation, respawn, zoning, and core state packets before dropping best-effort updates.
