# Server Latency Audit Notes

Reducing redundant packets helps the legacy client by lowering its script and packet-processing load. It does not necessarily reduce network round-trip time by itself, so further work should focus on queueing delay, transport behavior, and server tick timing.

## Current transport assessment

- Transport queue stabilization is enabled.
- Each flush pass is limited to 32 packets or 4 milliseconds. These are reasonable defaults unless runtime diagnostics show that queues regularly remain above 32 packets.
- Verbose per-packet queue and flush logging is disabled.
- The world update loop runs every 50 milliseconds, or 20 updates per second.

## Recommended measurements

Measure the time from `QueuePacket` until the socket finishes sending the packet. Report p50, p95, and p99 queue age alongside queue depth and the hottest outgoing opcodes. Packet count alone cannot reveal thread-pool scheduling delay or short queue stalls.

Capture transport diagnostics during a representative login, zone change, and combat session. After the sample is collected, disable the periodic diagnostics during normal play.

## Low-risk optimization candidates

### Test TCP_NODELAY

The accepted gameplay socket does not currently enable `TCP_NODELAY`. Enabling it may reduce latency for small interactive packets by avoiding Nagle delays. It can increase the number of TCP segments, so it should be tested with an A/B comparison rather than enabled without measurement.

### Gate detailed packet counters

`ZoneConnection.RecordSentSubPacket` updates concurrent dictionaries and creates a diagnostic source string for every sent packet. Gate detailed opcode, name, property, and source accounting behind `OPTIONS_TRANSPORT_OUTGOING_PACKET_DIAGNOSTICS_ENABLED`. Basic queue depth can remain available without that per-packet diagnostic overhead.

### Review the flush worker only if queues grow

The queue schedules transport work through `Task.Run` and yields after the configured packet/time budget. A persistent or bursty queue-age problem could justify a dedicated sender loop, but this is more invasive and should follow measurement.

## Changes to avoid without profiling

- Do not lower the 50-millisecond world tick blindly. It affects AI, combat, enmity timing, CPU use, and packet production.
- Do not drop or broadly coalesce actor-property packets. Many are ordered state transactions required by the client.
- Do not process incoming gameplay packets concurrently without an ordering design. `PacketProcessor` currently performs work synchronously, and parallel dispatch could introduce actor-state races.
- Do not increase the flush budget unless diagnostics show that the current 32-packet/4-millisecond limits are leaving a sustained backlog.

## Suggested decision rule

- If normal-play queue depth stays around zero to two packets, prioritize client processing and an A/B test of `TCP_NODELAY`.
- If queues frequently exceed 32 packets or keep growing, inspect the highest-volume opcode and measure sender scheduling delay.
- If the world tick overruns 50 milliseconds, profile zone updates, AI, and database work before changing transport settings.
