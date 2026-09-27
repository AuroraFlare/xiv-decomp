# Aetheryte/Guildleve Travel Contract (2026-06-19)

This pass ties together the recovered aetheryte object family, guildleve ask widgets, reward warp point, and the local server-side travel/director implementation.

## What is covered

- Recovered `AetheryteBaseClass`, `AetheryteParent`, `AetheryteChild`, beast aetheryte identity shims, and `GuildleveWarpPoint`.
- Recovered `Ask/AetheryteListWidget`, `Ask/GuildleveSelectLevelWidget`, `Ask/GuildleveStartWidget`, and `Ask/ContentRewardWidget` contracts.
- Local `AetheryteParent.lua`, `AetheryteChild.lua`, `aetheryte.lua`, `GuildleveWarpPoint.lua`, guildleve director/player/world backend APIs, and SQL actor/spawn bindings.

## Key findings

- `AetheryteBaseClass` is the retail base for leve selection and reward presentation. It initializes `aetheryteWork`, loads the gil icon from item `1000001` column `36`, disables ground, checks `canUseGuildleve`, and opens the guildleve/reward widgets.
- Local aetheryte support is split into `AetheryteParent.lua` and `AetheryteChild.lua`. Those scripts already drive teleport, homepoint, faction standings, guildleve start, active guildleve menu, party join, and dungeon gate travel.
- `GuildleveWarpPoint` is strong locally for the happy path: it opens `eventGuildleveReward`, waits, then calls `GrantGuildleveCompletionRewards`, and it handles both director-backed `GLWP` and behest `BHWP` return nodes. Reward confirm/cancel semantics are not proven yet.
- `GuildleveExecutionWidget` is the recovered kind-1 content HUD; local `GuildleveDirector` already syncs `GuildleveWork` counters, markers, and progress for that lane.
- Bonus chest flow is local and server-owned, but its default chance/reward tables are provisional and need double-claim/full-party/gil-recipient probes.
- SQL has concrete aetheryte actor classes and spawn rows, plus actor class `1200040` for `/Chara/Npc/Object/GuildleveWarpPoint`.
- The local `aetheryte.lua` table provides parent links, child links, and teleport positions used by both Lua travel and C# recovery/homepoint paths.

## Still missing or risky

- `P0`: `AetheryteChild.doLevequestInit` calls `logDebug` outside the local scope where it is defined. The child leve-start path can nil-call.
- `P1`: recovered `canUseGuildleve` enforces unused guildleve plus actorClassId matching `guildleveUISheet` column `78`; local start flow does not clearly revalidate this server-side.
- `P1`: recovered `AetheryteBaseClass.eventGLReward` and provider callbacks are not mirrored as a shared local base. Local completion uses `GuildleveWarpPoint`, but `ContentRewardWidget` returns `1` for confirm and `-1` for cancel while local `GuildleveWarpPoint.lua` appears to grant after `eventGuildleveReward` even on cancel/ESC until proven otherwise.
- `P1`: fake/no-director `GLWP|...` fallback is high risk. Without a live director, reward claim falls back to `HasGuildleve(id)` and lacks director eligibility/one-claim state, so repeat-claim/no-director probes must be last and disposable.
- `P2`: `Ask/AetheryteListWidget` is recovered for system teleport, but should remain context-only unless a trusted command supplies validated mode/anima/destination pairs.
- `P2`: `AetheryteBeastParent` and `AetheryteBeastChild` do not have local identity shims; add them only if beast aetheryte actor rows are imported.
- `P2`: recovered `askRetryRegionalleve` prompt rows `50144`/`50149` are not mirrored locally.
- `P2`: `GuildleveAreaOrderWidget`/`GuildleveCardOrderWidget` should be exposed only from trusted aetheryte/publisher contexts; no raw WidgetOpen path.
- `P3`: `[GLDBG]` messages are still player-visible in local aetheryte scripts.

## 2026-06-20 Teleport / Countdown Addendum

- Teleport/Return is implemented through `TeleportCommand`, which owns `Ask/AetheryteListWidget` and `Ask/WaitingCountdownWidget` context. Do not route those widgets through generic `WidgetOpenCommand`.
- Aetheryte parent/child object travel is locally implemented for menu, homepoint, zone change, child gates, parent return, and guildleve initialization. The child leve-init `logDebug` scope bug remains a P0 fix before relying on that edge path.
- `ConfirmWarpCommand` and `ConfirmRaiseCommand` are missing locally. Recovered versions validate pending state and return `fire=false`; future local scripts should be logging/pending-state probes, not warp/raise authority.
- `/countdown` packet rebroadcast exists, but still needs invalid-packet handling and a max-20 clamp before public use.
- `DoZoneChange` is not a neutral probe: it can clear transport/retainer state, end active events, adjust content membership, revive dead players, and preserve active guildleve state on KO return. Use disposable characters and DB snapshots for teleport/return/death-state probes.

## 2026-06-21 Guildleve/Aetheryte Risk Update

- Parent/child aetheryte travel, active leve menus, director ownership, QCI kind-1 HUD, field objective sync, and completion reward handoff are locally substantial, but they remain context-owned flows rather than raw widget-open targets.
- Start flow should revalidate recovered `canUseGuildleve`: the player owns an unused leve and the selected leve's `guildleveUISheet` column `78` matches the interacting aetheryte actor class. Do this before any local start/party-start behavior is trusted.
- `ContentRewardWidget` should stay display/provider-owned until confirm/cancel is captured. Local reward grant currently follows the reward event call instead of a proven widget-confirm result.
- No-director/fake `GLWP` reward paths, repeat-claim attempts, cancel/ESC reward windows, full inventory, and duplicate click probes should run only after normal live-director completion works on a disposable character.
- Do not raw-open `GuildleveExecutionWidget`, `AetheryteListWidget`, `GuildleveAreaOrderWidget`, or `GuildleveCardOrderWidget`; route them only from the owning teleport, aetheryte, publisher, or active director context.

## Generated artifacts

- Output directory: `tools/outputs/lpb/aetheryte_guildleve_travel_contract_20260619/`
- `source_inventory.csv`, `function_contracts.csv`, `aetheryte_backlog_closure.csv`, `widget_contract.csv`, `guildleve_event_flow_contract.csv`
- `reward_provider_contract.csv`, `local_script_parity.csv`, `client_function_calls.csv`, `widget_reference_hits.csv`
- `aetheryte_actor_class_summary.csv`, `aetheryte_spawn_rows.csv`, `aetheryte_link_summary.csv`, `dungeon_gate_zone_change_contract.csv`
- `local_backend_api_surface.csv`, `local_gap_matrix.csv`, `implementation_contract.csv`, `probe_queue.csv`, `source_term_hits.csv`, `contract_summary.json`

## Counts

- `sources_present`: 32
- `source_count`: 32
- `backlog_surface_count`: 8
- `function_contract_count`: 136
- `widget_contract_count`: 4
- `local_parity_count`: 10
- `actor_class_count`: 119
- `spawn_row_count`: 104
- `aetheryte_spawn_zone_count`: 30
- `backend_api_present`: 12
- `local_gap_count`: 8
- `probe_count`: 8

## 2026-06-21 Reward/Travel Guard Addendum

- `GuildleveWarpPoint.lua` currently opens `eventGuildleveReward` and then grants rewards without a proven confirm/cancel result. Recovered `ContentRewardWidget` returns `1` for confirm and `-1` for cancel, so local grant should not be widened until cancel/ESC/no-response probes prove no mutation.
- Director-backed reward claims are the safer lane because the director captures eligibility, multiplier, owner/link state, and one-claim guards. The no-director `GLWP` fallback is weaker and should stay controlled-test only.
- Parent/child start flows validate selected gamedata, but recovered `canUseGuildleve` also checks unused-leve state and actor-class match against `guildleveUISheet[78]`. That server-side actor gate is still missing before local `CreateGuildleveDirector` can be considered retail-equivalent.
- `AetheryteChild.lua` leve start still has the known scoped `logDebug` bug in `doLevequestInit`; keep child leve start probes narrow until that runtime path is corrected.
- `TeleportCommand` owns the dead active-guildleve return-aetheryte behavior. `DoZoneChange` is not a neutral transport helper because it clears transport/retainer queues, can end or preserve guildleves depending on death/return state, removes content groups, and revives return flows.
- Aetheryte unlocks are now character-persistent in `characters_aetherytes`. `unlock_all_aetherytes=true` preserves the legacy all-unlocked behavior; `false` makes parent and child interactions unlock individual nodes. Interactions are recorded in both modes. The Teleport command passes zero anima cost for locked slots because the stock `eventAetheryte` widget uses zero to hide and compact destinations, then revalidates the returned destination server-side before anima consumption or zoning. The server work array matches the recovered 512-bit client contract. Beast/faction aetheryte rows should remain shims unless imported with matching actor and persistence semantics.

## 2026-09-25 Regional guildleve audit closure

- `GuildleveWarpPoint.lua` now consumes the recovered `ContentRewardWidget` result: only `1` confirms the reward. Cancel, close, nil, malformed, or failed-delivery results end the interaction without granting or finalizing the completion node.
- Parent/child leve starts now revalidate the selected journal entry against the interacting actor class, matching the recovered `canUseGuildleve` check. Parent-assigned rows remain usable at parent crystals; child-assigned rows remain usable only at their exact child gate.
- Failed regional entries now take the recovered retry/return decision before director creation; a confirmed retry consumes one allowance and resets the journal flags, while return removes the failed entry.
