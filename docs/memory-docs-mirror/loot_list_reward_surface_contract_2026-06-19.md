# Loot-list reward surface contract (2026-06-19)

## Executive findings

- Recovered client loot UI is package-5 based: `/loot`, the tray icon, `ItemListWidget` mode 3, `ItemSubWidget`, and `ItemShareWidget` all operate on the drop/loot package as `5`.
- Local server constants currently define `ItemPackage.LOOT = 4` and `ItemPackage.MELDREQUEST = 5`; because recovered loot UI also uses client package `5`, the bridge must be scoped, not global.
- Claim/pass/drop semantics are only partially local: claim goes to normal inventory, pass goes to receiver normal inventory, and drop lacks the retail 52088 message. Focused review found `ItemMovePackageCommand` trusts item refs too broadly; loot commands must reject every source except recovered client package `5` resolved narrowly to backend `LOOT = 4`.
- Retail text requires a real loot-list backend: 25021/25033 add, 25027 full, 25048 pass failure, 52061 duty-exit transfer/discard, and 52088 discard/loss.
- `TreasureListWidget` is a separate event-mode virtual item selector, not the full persistent `/loot` menu. It should only return selected index/cancel to a trusted provider, and the server must re-resolve the selected reward before grant.
- Hamlet 52086-52091 messages are adjacent but should remain in Hamlet supply/reward logic rather than generic loot-list code.


## Scoped Client Package 5 Alias Contract

- Backend constants stay unchanged: `NORMAL = 0`, `CRYSTALS = 1`, `LOOT = 4`, `MELDREQUEST = 5`.
- Add only a scoped alias: recovered client loot package `5` -> backend `ItemPackage.LOOT = 4`.
- Apply the alias only in loot UI package refresh/request, loot package send/update serialization, `ItemMovePackageCommand`, `ItemTransferCommand`, and `ItemWasteCommand`.
- Do not globally remap `LuaUtils.ItemRefParam.itemPackage`, do not renumber backend packages, and do not make generic `GetItemPackage(5)` return loot.
- Serialize loot-list packets as client package `5` even when the backend source package is `LOOT = 4`; do not serialize meld-request state through the same generic package-5 path until meld request behavior is separately probed.
## 2026-06-20 Forged Command Audit

- `ItemMovePackageCommand`, `ItemTransferCommand`, and `ItemWasteCommand` currently trust client item references too broadly. A forged command can try to pull from normal inventory, crystals, key items, bazaar, trade, equipment, backend `MELDREQUEST = 5`, or stale slots unless the command path rejects before mutation.
- The loot package alias must be part of a validator, not just a package-number translation: require client source package `5`, resolve only to backend `LOOT = 4`, require actor/slot/count ownership, reject client source package `4`, reject mismatched `sourcePackage` vs `itemRef.itemPackage`, and reject all-pass sentinel `0` until a bulk pass path is atomic.
- Pass should move loot-list ownership to another eligible loot list, not directly into receiver normal inventory; claim should move to the item’s canonical destination only after capacity/unique checks; waste should remove only from the player’s backend loot package and emit/log the discard path.
## 2026-06-20 Forged Command Audit

- `ItemMovePackageCommand`, `ItemTransferCommand`, and `ItemWasteCommand` currently trust client item references too broadly. A forged command can try to pull from normal inventory, crystals, key items, bazaar, trade, equipment, backend `MELDREQUEST = 5`, or stale slots unless the command path rejects before mutation.
- The loot package alias must be part of a validator, not just a package-number translation: require client source package `5`, resolve only to backend `LOOT = 4`, require actor/slot/count ownership, reject client source package `4`, reject mismatched `sourcePackage` vs `itemRef.itemPackage`, and reject all-pass sentinel `0` until a bulk pass path is atomic.
- Pass should move loot-list ownership to another eligible loot list, not directly into receiver normal inventory; claim should move to the item’s canonical destination only after capacity/unique checks; waste should remove only from the player’s backend loot package and emit/log the discard path.
## 2026-06-20 Raid / Guildleve Reward Addendum

- `RaidDungeonHeadCount.lua`, `RaidDungeonTreasureBox.lua`, and `treasurebox/InstanceRaidTreasureBox.lua` are still missing locally even though recovered surface rows exist. Porting them should wait until TalkCommand/PlaceDrivenCommand ownership, package-5 loot visibility, and dungeon director finalization are proven.
- `GuildleveBonusTreasureBox.lua` exists locally, and `GuildleveDirector` can place chest rewards into backend `ItemPackage.LOOT`; the same scoped package bridge is required before those rewards reliably show in the recovered client loot list.
- `ContentRewardWidget` and `TreasureListWidget` remain provider result surfaces. `ContentRewardWidget` confirm/cancel should not grant by itself, and `TreasureListWidget` selected index must be re-resolved against a trusted reward provider.
- Duty exit should get its own finalization path after loot commands are safe. Current return-point zoning and timer auto-claim do not prove retail clear/fail/abandon/logout transfer or discard semantics.

## 2026-06-21 Reward/Exit Risk Update

- `ContentRewardWidget` returns confirm/cancel and `TreasureListWidget` returns a 1-based selection or `-1`; neither is reward authority. Add pending widget context plus server-side provider re-resolution before any grant, and decide guildleve cancel behavior explicitly.
- `QuestRewardWidget` mode `1` is acknowledgement-shaped, and `RewardSelectWidget` returns only a selected index or cancel. Treat all reward widgets as result surfaces; the server provider decides grant, cost, capacity, rollback, and idempotency.
- `QuestDeliveryWidget` returns client-selected package, slot, count, catalog/name/materia-ish data. Treat that tuple as a selector only; re-read the server-owned item, HQ/materia state, count, capacity, and owner package before any quest, Hamlet, GC supply, or seasonal delivery mutation.
- Local guildleve completion currently opens `eventGuildleveReward` and grants immediately. Probe confirm, cancel/ESC, full inventory, and no-director repeat claim before treating it as recovered reward parity.
- Loot package command route probes must include `24223`, `24225`, and `24226`; they are not covered by the current route-probe set unless added explicitly.
- Route probes are not no-op probes today: after logging, valid `24223/24225/24226` actions can continue into local scripts that move or delete items. Use static owner/log-only evidence, invalid stale params, or an explicit no-dispatch probe mode until the package bridge and validators are implemented.
- Duty exit with pending loot remains unresolved: `InstanceRaidExit`, `RaidDungeonExit`, transporter/warp, timeout, and logout recovery need a visible transfer/discard policy with auto-claim disabled or isolated during probes.
- No production Ifrit/Garuda direct loot registry was found in the inspected local code. Trial reward rows should stay blocked behind content clear/finalization and package-5 loot-list proof.
- `RaidDungeonTreasureBox` and `InstanceRaidTreasureBox` remain recovered-output-only locally. Keep them disabled until object owner/spawn binding, drop sheets, package-5 loot visibility, duplicate/full-inventory handling, and quest/key gating are proven.

## 2026-06-21 Duty-Exit Evidence Addendum

- DAT text for the Dzemael/Cutter-style dungeon lanes says pending loot is transferred on exit and failures are lost/discarded. That is an exit/finalization policy, not proof of the current timer auto-claim path.
- Local behavior currently includes timed loot auto-claim; this should not be treated as parity for `RaidDungeonExit`, `InstanceRaidExit`, transporter exit, timeout, abandon, or logout recovery.
- `RaidDungeonTreasureBox` recovered logic is Dzemael/relic-specific, checking quest/key state before resolving drop sheets and calling `addItem`. Do not generalize it into all raid/trial chest behavior.
- `RaidDungeonHeadCount` is an empty/marker-style recovered object, not a reward provider.
- Add exit probes only after claim/pass/drop validators reject non-loot package refs and package `5` serializes from backend `LOOT = 4` without touching backend `MELDREQUEST = 5`.

## High-priority bridge queue

1. Scoped package id bridge: Keep backend constants unchanged, and map client loot package `5` to backend `ItemPackage.LOOT = 4` only for loot UI refresh/send/update serialization and loot claim/pass/drop command paths. Verification: backend `MELDREQUEST = 5` still works outside loot paths, while loot UI serializes package `5` rows sourced from backend `LOOT = 4`.
2. Loot-list backend service: Expose add/full/claim/pass/drop operations with worldMaster 25021/25027/25033/25048/52088 messages. Verification: Unit/integration path can add, fill, claim, pass, and discard a loot item with retail message ids.
3. Fix claim/pass/drop command routing: `ItemMovePackageCommand`, `ItemTransferCommand`, and `ItemWasteCommand` must require client source package `5`, resolve to backend `LOOT = 4`, validate actor/slot/count/ownership, and reject non-LOOT packages before moving or deleting anything. Verification: forged NORMAL/CRYSTALS/KEYITEMS/MELDREQUEST/BAZAAR/TRADE/EQUIPMENT refs are hard rejects.
4. Duty exit claim/discard flow: On dungeon/raid exit, attempt to claim all remaining loot-list items, then discard failures and emit 52061/52088 style text. Verification: Full-inventory exit leaves no loot-list rows and logs discarded items.
5. Trial reward registry: Mark Inferno Totem and Vortex Totem (`10011154`) as loot-list-first rewards; gate Garuda Hard on Vortex Fletchings. Verification: An eligible Garuda player receives Vortex Totem in the loot list; a non-eligible player does not. The original 1.22 note's ?Vortex Headdress? wording predates Square Enix's acknowledged Totem/Headdress name correction.
6. TreasureListWidget event bridge: Add a scripted event helper for virtual item selection prompts returning selected index or cancel. Verification: Trusted caller re-resolves and grants only the selected item after confirmation; no raw widget result can grant by itself.
7. Hamlet separation guard: Keep Hamlet supply/rating/removal text and widget flows under Hamlet director/widget contracts. Verification: Generic loot-list claim/pass/drop paths do not emit 52089-52091.

## Open gaps

- high: Client package `5` versus local `LOOT = 4` / `MELDREQUEST = 5` -- A global remap would break meld requests. Next: implement a scoped loot alias only for loot UI and loot commands, preserving backend constants and serializing loot updates as client package `5`.
- high: Claim/pass/drop commands ignore proper source/target package -- Only recovered client loot package `5` should resolve to backend `LOOT = 4`; client package `4`, backend `MELDREQUEST = 5`, normal inventory, key items, crystals, bazaar, trade, equipment, stale slots, wrong actor ids, bad counts, and bulk-pass sentinel `0` must reject before mutation.
- high: Pass command routes to receiver normal inventory -- Untradeable loot pass semantics are broken for inferno/vortex-style rewards. Next: Pass a package-5 item to another party member and confirm recipient package/visibility.
- medium: Retail loot message ids are not emitted locally -- User-facing UX and log categories diverge from retail. Next: Trace local AddGeneratedItemToPackage failure/success messages for package loot.
- medium: Duty-exit transfer is timer-based locally -- Leaving a dungeon may preserve, claim, or discard loot at the wrong moment. Keep duty-exit auto-transfer/discard blocked until clear/fail/abandon/logout/zone-exit finalization points are verified.
- low-medium: No local TreasureListWidget caller found -- Scripted item choice prompts may need a new event-mode widget call. Next: Search native event-call captures for Ask/TreasureListWidget or ItemListWidget virtual-item prompts; any future caller must re-resolve the 1-based selected index server-side and treat `-1` as cancel.
- medium-high: Garuda/Ifrit loot-list reward packet order unresolved -- Special rewards may be granted directly and become impossible to pass. Next: Capture post-clear chest/reward packets for Howling Eye Hard and Bowl of Embers variants.
- medium: Hamlet supply messages share worldMaster range but not generic loot behavior -- Generic loot backend could accidentally consume Hamlet-specific supply flows. Next: Keep Hamlet widget/director contract as a separate backend and only share inventory transaction helpers.

## Generated artifacts

- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/loot_list_surface_matrix.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/treasurelist_widget_contract.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/itemlist_loot_widget_contract.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/local_loot_package_contract.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/loot_list_text_message_contract.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/backend_gap_summary.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/bridge_queue.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 38 / 38
- Source term hits: 130
- Function contracts: 42
- Loot-list surfaces: 11
- Text/message rows: 32
- Backend gaps: 8
