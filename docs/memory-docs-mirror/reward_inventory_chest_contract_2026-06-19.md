# Reward / Inventory / Chest Contract (2026-06-19)

Generated: 2026-06-19T22:30:10Z

## High-confidence contracts

- Inventory grants are locally proven as `InventoryBeginChange 0x016D -> InventorySetBegin 0x0146 -> list/remove 0x0148..0x014C or 0x0152..0x0156 -> InventorySetEnd 0x0147 -> InventoryEndChange 0x016E`.
- `ContentRewardWidget` is a blocking display/result widget. Providers populate reward rows; server-side reward code owns item/gil/EXP grants after event resume. Recovered semantics matter: confirm returns `1`, cancel/close returns `-1`, and local `GuildleveWarpPoint` currently grants after the widget without inspecting that return.
- Guildleve completion uses `RunEventFunction(eventGuildleveReward)` plus `_WAIT_EVENT`, then `GrantGuildleveCompletionRewards` validates one-claim/capacity and grants item rewards, EXP, and gil. Director-backed claims are protected by `completionRewardClaims`; no-director fallback and cancel behavior still need explicit probes.
- Guildleve start/select is locally wired through parent/child aetherytes, and `GuildleveDirector` already syncs kind-1 HUD counters/markers/progress consumed by `GuildleveExecutionWidget`.
- Guildleve bonus chest flow is locally wired from DB chest spawns through kill rolls, open/grant, and `GuildleveBonusTreasureBox.lua`, but default chance/reward data is provisional.
- `RaidDungeonTreasureBox` recovers the Dzemael epic chest resolver: quest 110868, item 10011244, drop sheets, full-inventory text 25262, and no-item text 60027.
- Hamlet and Behest rewards are local one-claim server gates. They should not be routed through the guildleve content reward widget unless a matching retail provider is recovered.
- Local caravan completion currently has no reward grant. Static evidence ties caravan escort rewards to relic item paths, but thresholds and packet order remain probe work.

## 2026-06-20 Loot/Reward Helper Addendum

- Local reward plumbing exists for BNPC loot, guildleve completion, guildleve bonus chests, and timer auto-claim, but manual loot-list UI remains unsafe until the package bridge and command validators are proven.
- Recovered raid treasure/headcount objects remain absent locally. `RaidDungeonTreasureBox` is the only recovered raid chest resolver with grant logic; `InstanceRaidTreasureBox` is a thin subclass and `RaidDungeonHeadCount` is an empty marker.
- Reward widgets return results, not authority: `ContentRewardWidget` returns `1/-1`; `RewardSelectWidget` and `TreasureListWidget` return 1-based indexes; `QuestRewardWidget` mode 1 has no decline signal because cancel also returns `1`.
- Keep raid/trial reward UI and duty-exit loot finalization gated until package bridge probes, forged command rejects, drop-sheet recovery, owner/event/package captures, and clear/fail/exit timing are complete.

## 2026-06-21 Widget Result Boundary Table

| widget | recovered result | server rule |
| --- | --- | --- |
| `ContentRewardWidget` | confirm `1`, cancel `-1` | May gate a claim, but provider must still validate eligibility, capacity, one-claim/idempotency, and reward rows. |
| `RewardSelectWidget` | selected `index + 1`, cancel `-1` | Index only; re-resolve against a server-owned reward table before grant. |
| `QuestRewardWidget` | mode 1 operate/cancel both return `1` | Acknowledgement only; never use as accept/decline or item authority. |
| `QuestDeliveryWidget` | package, slot/item, count, name/catalog, materia/status tuple | Selector only; re-read owned inventory with context-local package mapping and stale-slot rejection. |
| `TreasureListWidget` | selected `index + 1`, cancel `-1` | Virtual item selector; trusted caller/provider decides grant after re-resolution. |

- `QuestDeliveryWidget` can expose package ids such as `1`, `100`, `8`, and `5`. Those ids are provider-local and must not share the loot package `5` alias outside the delivery context.
- `InstanceRaidTreasureBox` remains a thin recovered surface and `RaidDungeonHeadCount` is marker/empty logic; only Dzemael-specific `RaidDungeonTreasureBox` has recovered grant logic so far.

## Implementation bridge

1. Inventory grant helper: Wrap AddItem/AddItems/AddGeneratedItemToPackage with explicit precheck, transaction batching choice, and post-grant message policy. Verification: One-item, multi-item, full-inventory, and unique-item grants emit the expected inventory packets/messages.
2. ContentRewardWidget grant boundary: Treat ContentRewardWidget as blocking presentation and selection/result only; server validates and grants after event resume. Verification: RunEventFunction eventGuildleveReward waits for EventUpdate before any inventory mutation, and cancel/ESC behavior is intentionally defined after capture.
3. Raid chest provisional resolver: Implement quest/item gate plus 25262/60027 messages and a placeholder table resolver with explicit incomplete-table metadata. Verification: Full inventory prints 25262, no-drop prints 60027, successful drop uses the inventory transaction helper.
4. Guildleve bonus chest gate: Keep chest spawn/open behind a config/table gate and record chest type, opener, gil recipients, generated loot result, despawn time. Verification: Open path cannot double-claim and emits separate gil/item transaction logs.
5. Hamlet and Behest claim policies: Preserve one-claim gates and keep reward tables data-driven; do not route through guildleve reward widgets. Verification: A second claim attempt fails without a second inventory mutation.
6. Caravan reward probe: Add logging/probe hooks for route, contribution, active protection, party state, and result/reward packet order before adding grants. Verification: Completion log distinguishes no-reward local completion from future reward-eligible completion.

## Remaining gaps

- Retail drop tables are still missing for dungeon and leve chests: Recover sheet rows or capture live chest open packets before marking tables implementation-ready.
- Guildleve reward edge behavior is not proved: Probe full inventory, cancel/close reward window, duplicate warp activation, no-director fallback after reconnect/timeout, and leve-link party reward multiplier before calling the flow retail-complete.
- Caravan reward completion is not implemented locally: Probe contribution thresholds and add a route reward resolver after route/place metadata is aligned.
- Hamlet/Behest retail reward tuning is provisional: Tie Hamlet score/ranking packets and Behest site data to retail payout rows or captures.
- Loot-list UI versus direct inventory grant remains split: Separate guildleve direct grants, virtual `TreasureListWidget` selections, loot package grants, and future loot-list packet captures in bridge code. `RewardSelectWidget` and `TreasureListWidget` return 1-based indexes, not trusted item ids; `QuestRewardWidget` mode 1 has no decline signal because both operate/cancel return `1`.

## Artifact index

- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/reward_surface_contracts.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/inventory_packet_sequence.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/event_wait_grant_sequence.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/content_reward_widget_contract.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/content_reward_cell_contract.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/treasure_chest_contract.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/caravan_reward_boundary.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/local_gap_summary.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/bridge_queue.csv`
- `tools/outputs/lpb/reward_inventory_chest_contract_20260619/contract_summary.json`

## 2026-06-21 Guildleve/Reward Authority Addendum

- `ContentRewardWidget` is a confirm/cancel shell, not reward authority. Local `GuildleveWarpPoint` still grants after the reward event call without a proven confirm result, so cancel/ESC/no-response probes are required before widening the path.
- No-director/fake `GLWP` fallback is weaker than director-backed reward claims. Keep it controlled-test only until repeat claim, reconnect/timeout, fake owner, full inventory, and double-click probes are exhausted.
- Reward item loops need rollback/idempotency attention. Item prechecks exist in some paths, but partial grant failure and passive guildleve rewards can still diverge from a clean transaction model.
- `QuestDeliveryWidget` package ids are provider-context ids, not global package authority. Its package `5` result must not be confused with the loot-list package `5` bridge.
- Recovered raid treasure/headcount remains absent locally; do not use recovered drop text or UI indexes as item grants until owner/event/package behavior is captured.

## 2026-09-25 Regional guildleve audit closure

- The ordinary regional guildleve completion path now treats `ContentRewardWidget` as authoritative only for its recovered result: `1` confirms, while cancel, close, nil, or malformed results end the interaction without granting or finalizing the node.
- Director-backed claims include the current director run identity. Claims are also gated on a successful ended director; the no-director fallback requires a completed current journal entry rather than any held entry.
- Completion item rewards are aggregate-prechecked and added in package batches. A failed delivery releases the claim and leaves the completion interaction retryable. Exact retail item rows, reward selection rules, and client timeout/reconnect behavior remain evidence work.
