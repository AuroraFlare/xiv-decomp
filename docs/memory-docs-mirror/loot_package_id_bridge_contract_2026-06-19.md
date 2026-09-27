# Loot package-id bridge contract (2026-06-19)

## Executive findings

- Recovered client loot UI and item commands consistently use package `5` for loot/drop list rows. The 2026-06-20 helper pass confirmed this in `DesktopWidget`, `ItemListWidget`, and `ItemShareWidget` claim/pass/discard paths.
- Local constants consistently define `LOOT = 4` and `MELDREQUEST = 5`; no package `5` to local LOOT alias was found. `Character.SendItemPackage(5)` currently exact-resolves to `MELDREQUEST`, so a loot bridge must be narrow and intentional.
- The client command bridge passes useful source/target package arguments for claim/pass/drop; the local claim/pass scripts currently ignore the most important ones.
- `InventorySetBeginPacket` serializes the package code directly, and `LuaUtils.ItemRefParam` reads the client item package byte directly.
- Command ids `24223`, `24225`, and `24226` are recovered from the client for move/transfer/waste, but local id-to-script dispatch still needs runtime confirmation.

## 2026-06-21 Evidence Index

- Client loot/drop list package `5` is visible in `ItemListWidget` drop-list construction and claim calls, and in `ItemShareWidget` pass, self-claim, and waste calls.
- Backend mismatch is explicit: local `ItemPackage.LOOT = 4` and `ItemPackage.MELDREQUEST = 5`; package resolution currently resolves exact package ids before aliases, so raw client package `5` can hit meld-request storage.
- Local command scripts still trust references too broadly: `ItemMovePackageCommand` moves referenced items to normal inventory, `ItemTransferCommand` can pass directly to receiver normal inventory, and `ItemWasteCommand` deletes from the referenced package. These are not safe until the scoped client-5-to-backend-4 validator exists.
- `QuestDeliveryWidget` also uses context-local package ids including `1`, `100`, `8`, and `5`. Do not reuse the loot package alias in delivery/storage/retainer contexts; each provider needs its own resolver.
- Recovered `RaidDungeonTreasureBox` is Dzemael/relic-specific and quest/key/drop-sheet gated, while `RaidDungeonHeadCount` is marker logic only. Treat `InstanceRaidTreasureBox` as a thin/recovered surface until local owner/package behavior is captured.

## 2026-06-20 Loot Helper Addendum

- No recovered `LootListWidget` class/file was found. Persistent loot-list behavior is recovered through `ItemListWidget`, `ItemSubWidget`, and `ItemShareWidget` using client package `5`; `TreasureListWidget` is a separate Ask virtual-item selector and must not be treated as persistent loot storage.
- Keep backend packages unchanged. Add only a scoped client loot package `5` to backend `ItemPackage.LOOT = 4` bridge for loot-list send/update and claim/pass/drop commands. Never globally alias package `5` because local `MELDREQUEST = 5` is real.
- `ItemMovePackageCommand`, `ItemTransferCommand`, and `ItemWasteCommand` are unsafe until they reject every non-loot source, stale slot, mismatched source package, bad count, wrong actor, and ineligible receiver before mutation.
- Manual loot commands should accept only client source package `5` and resolve that to backend `LOOT = 4`; reject client package `4` so callers cannot bypass the client contract and address backend internals directly.
- Claim/move should re-read the server slot from backend loot, validate actor/owner/source/count, then move to the proper canonical inventory package. Pass/transfer should move into the recipient's backend loot package, not directly to normal inventory. Discard should delete only from backend loot after the same source/slot validation.
- Duty-exit loot transfer/discard should remain blocked until clear/fail/abandon/logout/zone-exit finalization and retail messages are captured.

## 2026-06-20 Raid / Reward Helper Addendum

- Local recovered raid object scripts are still absent for `Data/scripts/base/chara/npc/object/RaidDungeonHeadCount.lua`, `Data/scripts/base/chara/npc/object/RaidDungeonTreasureBox.lua`, and `Data/scripts/base/chara/npc/object/treasurebox/InstanceRaidTreasureBox.lua`; keep these dormant until owner/event/package behavior is captured.
- `GuildleveBonusTreasureBox.lua` is present and wired through `OpenGuildleveChest`, but its reward tables remain provisional and its item rewards also land in backend `ItemPackage.LOOT`, so client visibility still depends on the scoped package-5 bridge.
- `TreasureListWidget` returns a 1-based selection or `-1`; `ContentRewardWidget` returns confirm/cancel style results. Neither window is inventory authority. The provider must re-resolve the reward server-side before any grant.
- Duty exit currently routes through `ExitCurrentContentToReturnPoint`; no explicit clear/fail/abandon exit hook was found that claims or discards remaining loot with retail messages. The timer auto-claim path is not equivalent to duty-exit `52061`/`52088` behavior.
- Local guildleve completion opens `eventGuildleveReward` and then immediately grants rewards; cancel/full-inventory/double-claim probes are still needed before treating that as recovered ContentRewardWidget parity.

## 2026-06-21 Package/Command Risk Update

- `SendItemPackage(5)` currently exact-resolves to local `MELDREQUEST`, not loot. Even after adding a scoped loot alias, full package serialization must preserve client package code `5` by using a client-code send path; otherwise backend package ids can leak into the client UI.
- Any client package `5` handling must live inside loot UI/claim/pass/drop paths and resolve backend storage as `LOOT = 4` without changing generic package lookup or meld-request behavior.
- Recovered claim/pass/drop ids are `24223` `ItemMovePackageCommand`, `24225` `ItemTransferCommand`, and `24226` `ItemWasteCommand`. Add these ids to EventRouteProbe logging before changing loot command behavior.
- Current local claim/pass/drop scripts trust client item refs too broadly and ignore important source/target package args. A validator must require client source package `5`, reject client package `4`, re-read backend `LOOT = 4`, validate actor/slot/count/source/target/recipient, reject stale slots, and reject all-pass sentinel `0` until a bulk path is atomic.
- Pass behavior must move ownership to the recipient backend loot list, not directly to recipient normal inventory. Claim can move to canonical inventory only after capacity/unique checks; waste can delete only from backend loot after validation.
- Route probes are not no-op probes today: after logging, valid `24223/24225/24226` actions can continue into local scripts that move or delete items. Use static owner/log-only evidence, invalid stale params, or an explicit no-dispatch probe mode until the package bridge and validators are implemented.
- Duty exit/fail/abandon/logout finalization still lacks verified loot transfer/discard hooks. Keep retail-like dungeon exits blocked from loot finalization until pending loot with full inventory is probed through exit, warp, timeout, and logout recovery.

## 2026-06-21 Reward Widget / Finalization Addendum

- Package `5` is client loot-list identity, while backend package `5` is `MELDREQUEST`. Any bridge must be scoped to loot send/update and claim/pass/drop handlers only.
- `QuestRewardWidget` is acknowledgement-only; `RewardSelectWidget` returns an index or cancel; `ContentRewardWidget` returns confirm/cancel. None of these are item authority without server-owned reward provider re-resolution.
- `QuestDeliveryWidget` item tuples must not share a global package-id resolver with loot. Delivery, storage, retainer, and loot each need context-local package mapping and stale-slot rejection.
- Raid treasure/headcount objects are still recovered-only or dormant locally. Do not wire raid loot reward UI until owner event, target actor, party/headcount, package, and clear/fail lifecycle are captured.
- Duty exit/abandon rows mention discarding unobtained items, but local finalization still lacks a verified claim/pass/drop/discard hook. Timer auto-claim is not equivalent to exit/fail/abandon/logout behavior.

## Resolution queue

1. Capture package ids in live packets: Log InventorySetBegin package code for local LOOT sync and /loot package refresh. Success: The client-visible loot list package is known: either 5, or a proven translation exists.
2. Add explicit package mapping policy: prefer resolver/command bridge mapping from client loot package `5` to backend `ItemPackage.LOOT = 4`, while leaving `MELDREQUEST` untouched until separately probed. Success: Character.SendItemPackage, ItemRefParam command handling, and InventorySetBegin all agree.
3. Use target/source package arguments in item commands: Claim/pass/drop scripts should validate source package and honor target package. Success: Claim of package-5 loot moves to proper package; pass creates recipient loot-list item.
4. Confirm command-id dispatch: Trace owner actor ids for 24223, 24225, and 24226 to confirm local script selection. Success: Runtime log shows ItemMovePackageCommand/ItemTransferCommand/ItemWasteCommand invoked for those ids.
5. Retail message and failure parity: Wire 25027 full, 25048 pass failure, and 52088 discard after package bridge is fixed. Success: Failed/full/pass/drop transitions emit retail ids instead of plain English/no text.

## Highest-risk matrix rows

- Client loot icon visibility: mismatch -- Package 5 in recovered client must map to backend loot, or local LOOT must be exposed as client package 5.
- Client loot list build: mismatch -- Capture InventorySetBegin for spawn/update; expected client-visible loot code should be 5.
- Package refresh request: likely mismatch -- Add or test explicit package 5 -> LOOT resolver behavior before relying on /loot refresh.
- Inventory package serialization: no hidden remap found -- Use SendFullPackage(player, clientPackageCode) intentionally if keeping backend package 4 and client package 5 separate.

## Generated artifacts

- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/package_id_bridge_matrix.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/command_argument_contract.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/packet_update_contract.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/risk_resolution_queue.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/loot_package_id_bridge_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 25 / 25
- Source term hits: 112
- Function contracts: 23
- Bridge matrix rows: 11
- Command argument rows: 3

## 2026-06-21 Package Scope Table

| Surface | Client/package value | Backend/local meaning | Rule |
| --- | --- | --- | --- |
| Loot list UI | `5` | Backend `LOOT = 4`, while local package `5` is `MELDREQUEST` | Map client loot `5 -> 4` only inside loot-list commands/refresh. |
| Materia/storage widgets | Context-local maps can include `5` | Not global loot authority | Resolve per widget/provider; never pass through as a global package alias. |
| Retainer bazaar | Client `8` | Backend bazaar storage `7` | Map `8 -> 7` only on retainer-bazaar paths and emit client code `8` on outbound envelopes. |
| Quest delivery | `1`, `100`, `8`, `5` depending on tab/provider | Provider-local inventory selector | Re-resolve package/slot/item/count against the delivery context before mutation. |
| Direct Lua `GetItemPackage` | Exact backend dictionary lookup | No alias for `8` today | Do not rely on Lua package aliases until explicitly implemented. |
