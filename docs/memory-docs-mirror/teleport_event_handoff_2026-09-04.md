# Teleport event handoff and earlier loading curtain

## Fault found

`BeginZoneChange` reserves the player synchronously but queues execution through
`RunExclusiveZoneOperation`. TeleportCommand's successful Teleport, home Return,
and inn Return branches then fell through to `EndEvent`. When the queued C# work
started, `hasActiveEvent` was false, bypassing its separate EventFinish transport
drain and 250 ms client scheduler settle. A closed event in server memory does
not mean the client has finished retiring that event.

The local Release log at 2026-09-04 18:05:25.964 shows a Return command update,
followed by the reload latch at 18:05:26.004 without a ZoneEvent settle. That
particular Return subsequently completed; it demonstrates the bypass, not proof
that it caused a particular crash. Local WER dumps were inspected, but no dump
was conclusively correlated to this handoff. Existing recovered TeleportCommand
Lua confirms `eventConfirm` returns its result without owning the server zone
transition.

## Change

- Accepted Teleport/Return keeps commandContent open while the zone reservation
  or transition is active. The manager closes it against the source actor table.
- Cancelled/rejected travel still closes its menu. The aetheryte helper reports
  actual pending transition state so a rejected guildleve Return also closes.
- A recently closed caller event receives a synchronous transport drain and
  scheduler settle before hard reload as a defensive fallback for other scripts.
- The existing `0x00E2(2)` loading/reload signal now precedes destination actor
  relocation and bookkeeping. Its 250 ms quiet period overlaps server work;
  SetMap still waits for that interval and retains the 1000 ms map and weather
  barriers. The generation checks and post-landing visibility gates remain.

This changes when loading can begin; it does not specify a new native fade
duration or promise a fixed reduction in perceived travel time.

## Verification

`dotnet "Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll" --teleport-handoff-only`
passes 24 executable Lua scenarios (accepted, rejected, cancelled across eight
routes), the staged transport/readiness regression, and the rested EXP/weather
transition regression. A stale rested-state source assertion was updated for
the already-present party attachment between zone insertion and reconciliation.

Debug build passed. The normal Release output was locked by another process;
the separate Release build is staged under `artifacts/teleport-handoff-release`.
No running server was stopped or restarted.

Native verification remains: restart with the rebuilt server and updated
TeleportCommand.lua, then repeat cross-zone Teleport, same-zone travel, living
Return, dead Return, and inn Return. Check that cross-zone commands log ZoneEvent
before ZoneReloadStage and that no new client crash occurs. Also compare the
visible curtain onset; its exact improvement depends on destination bookkeeping.
