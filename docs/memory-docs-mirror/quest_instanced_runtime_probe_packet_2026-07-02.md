# Quest Instanced Runtime Probe Packet - 2026-07-02

This pass turns the decomp into a runtime proof plan: existing commands, remaining command gaps, capture schema, hook points, and per-callsite pass/fail signals.

## Findings

- 34 callsites can use an existing probe surface or live focused logging immediately.
- 6 callsites are blocked on recovered owner route first, almost entirely GC template-collapse rows.
- 4 quests have an implemented GM-only private SQB spawn probe surface.
- `!testcutscene` is good for NQ scene-key smoke, but it does not prove quest owner identity; every smoked scene still needs live event tuple capture.
- Local lifecycle owner/payload rows now upgrade matching NQ callsites to owner-bound `!questdelegate class:...` probes before live mutation paths.
- `!sqbprivate` is now the current GM-only surface for the spawn-ready private SQB rows.
- Toto-Rak has the strongest current runtime probe surface, and `!occupancyduty` now carries Toto-Rak/Dzemael duty cutscene probes; entry widget, retail dialogue, unknown-role scenes, and zone-change close timing must stay separate lanes.
- Focused recovered-method rows now preserve the GC 301/302 owner-method gap and the Toto-Rak elevator/exit/NQ conflicts.
- `!qciprobe` / `!qcifinish` are adjacent for QuestContentInformation UI/timer finish/cancel work; they are not cutscene triggers.
- `!instanceraid probe` is now the current GM-only no-reward surface for non-Toto-Rak InstanceRaid startEvent smoke.
- `!gcrivenroad acceptprobe` is now the current GM-only guide-owner confirmation probe for Rivenroad normal/hard.

## Probe Status Mix

- `blocked_recovery_first`: 6
- `current_probe_available`: 34

## Quest Gate Mix

- `blocked_actor_data`: 1
- `blocked_recovery_first`: 6
- `current_probe_available`: 11

## Generated Files

- `outputs\quest-instanced-runtime-probe-packet-20260702\existing_probe_surface_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\capture_schema_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\instrumentation_hook_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\per_callsite_runtime_probe_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\per_quest_next_action_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\lane_execution_order_rows.csv`
- `outputs\quest-instanced-runtime-probe-packet-20260702\recovered_focus_rows.csv`

## Row Counts

- `existing_probe_surface_rows.csv`: 12
- `capture_schema_rows.csv`: 10
- `instrumentation_hook_rows.csv`: 11
- `per_callsite_runtime_probe_rows.csv`: 40
- `per_quest_next_action_rows.csv`: 18
- `lane_execution_order_rows.csv`: 7
- `recovered_focus_rows.csv`: 11
