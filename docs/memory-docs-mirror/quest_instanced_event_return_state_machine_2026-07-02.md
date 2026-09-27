# Quest Instanced Event Return State Machine - 2026-07-02

This pass turns the owner/cutscene decomp into a server event state-machine contract: dispatch packet, wait kind, client return packet, close policy, and the probe required before we automate quest mutation.

## Findings

- Local `callClientFunction` is a `RunEventFunctionPacket` dispatch followed by a `_WAIT_EVENT` coroutine wait; the coroutine resumes only from client `EventUpdatePacket` luaParams.
- `kickEventContinue` is a different wait shape: it stores an expected owner/event pair and resumes on a matching `EventStartPacket`.
- There is no separate server `EventFinishPacket` in this repo; event return is inbound `EventUpdatePacket` (`0x012E`) and event close is outbound `EndEventPacket` (`0x0131`).
- `Player.EndEvent` must be treated as a destructive close boundary because it clears the active owner/name/type immediately after queuing `EndEventPacket`.
- 7 quests have recovered after-warp NQ methods: `com0g1; com0u1; com0l1; com0l5; com0u5; com0l6; com0u6`.
- Toto-Rak entry remains a helper-owned bridge for `com0l5; com0g6; com0u5; com0l6`; sequence `10 -> 20` belongs after successful instance start, not after a blind cutscene call.
- GC 301/302 remains template-collapsed locally for `gcu302; gcg301; gcu301; gcl302; gcl301; gcg302`; recovered owner scenes must be recovered before replacing the officer-only template path.
- Scene keys are not actor identities. The debug `startNQCutScene` bridge is useful for smoke, but quest adapters still need owner capture per callsite.

## Generated Files

- `outputs\quest-instanced-event-return-state-machine-20260702\event_primitive_rows.csv`
- `outputs\quest-instanced-event-return-state-machine-20260702\cutscene_return_state_rows.csv`
- `outputs\quest-instanced-event-return-state-machine-20260702\instanced_entry_bridge_rows.csv`
- `outputs\quest-instanced-event-return-state-machine-20260702\per_quest_event_contract_rows.csv`
- `outputs\quest-instanced-event-return-state-machine-20260702\event_return_hazard_rows.csv`
- `outputs\quest-instanced-event-return-state-machine-20260702\event_probe_playbook_rows.csv`

## Row Counts

- `event_primitive_rows.csv`: 12
- `cutscene_return_state_rows.csv`: 40
- `instanced_entry_bridge_rows.csv`: 8
- `per_quest_event_contract_rows.csv`: 18
- `event_return_hazard_rows.csv`: 10
- `event_probe_playbook_rows.csv`: 6

## Highest Risk Boundaries

- `single_player_event_wait_slot`: Never fire a second client function until the previous EventUpdate/EventStart has resumed the coroutine.
- `event_update_resume_has_no_owner_match`: Log currentEventOwner/currentEventName/currentEventType at dispatch and EventUpdate receipt.
- `end_event_clears_active_owner`: Capture close tuple before EndEvent; do not infer owner from EndEventPacket's zeroed close field.
- `missing_owner_breaks_event_start_route`: Require owner actor visibility or director ownership before kicking notice/object cutscene events.
- `kick_event_waited_as_plain_event_update`: Use kickEventContinue/_WAIT_EVENT_START for kicked event contexts, then callClientFunction for the client method return.
- `after_warp_cutscene_lifetime`: Smoke each after-warp NQ call and confirm EventUpdate arrives before sequence/item/reward mutation.
- `totorak_widget_and_zone_change_timing`: Probe widget-enabled and widget-disabled paths separately; keep sequence 10->20 tied to successful instance start and verify failed starts close normally.
- `gc_template_collapse`: Wire real recovered owner scenes and content/battle metadata before replacing template progression.
