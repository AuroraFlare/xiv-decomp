# Materia, Shop, Storage, And Repair Widget Contract - 2026-06-19

## Scope

This pass covers the recovered commerce-adjacent widgets and NPC scripts that were still showing up in the missing Lua surface backlog: materia removal/dialog/inform/attach, ordinary shops, grand company shops, guild shops, inn item storage, repair widgets/commands, bazaar commands, and the market selector.

Generated artifacts live in `tools\outputs\lpb\materia_shop_storage_widget_contract_20260619`.

Focused shop/custom exchange follow-up notes now live in `docs/npc_shop_custom_exchange_surface_contract_2026-06-21.md`; this file remains the broader materia, storage, repair, and commerce-widget contract.

## Summary

| Metric | Count |
| --- | ---: |
| Sources present | 67 / 67 |
| Function contracts | 569 |
| Widget contracts | 11 |
| Local backend surfaces | 14 |
| Local script parity rows | 10 |
| Backlog rows covered | 28 |
| Source term hits | 1015 |
| Local gaps | 10 |
| Probe queue | 10 |

## Main Findings

Materia attach/materialize is much healthier than materia removal. Local command actors unpack item references for `MateriaMeldCommand`, `MateriaMeldRateCommand`, and `ItemMaterializeCommand`; `Player` has `MeldMateria`, `GetMateriaMeldRate`, and `ConvertItemToMateria`; and `InventoryItem.SetMateria` persists materia through `Database.SetMateria`.

Materia removal is the missing sibling, but the shape is now clearer. Recovered `PopulaceShopMateriaRemover` opens `Ask/MateriaRemoveWidget`, selects a package-1 normal-inventory item with attached materia, then confirms through `Ask/MateriaDialogWidget` mode 2 with `(catalogId, nameArg, materiaCount, price, polishMax)`. Locally, `InventoryItem.ClearMateria(slot)` and `Database.SetMateria(..., 0, 0)` can persist slot zeroing, but there is still no public `Player` preview/commit API, no local `PopulaceShopMateriaRemover.lua`, and no confirmed remove-materia command id.

Ordinary, guild, and grand company shops are implemented locally, but the risk is now sharper than provider parity: shared `purchaseItem` appears to charge unit price rather than `price * quantity`, sell flow caches quote data and credits before final removal, GC shop trusts client-returned indexes/masks, and black marketeer local field order looks inconsistent with recovered `blackMarket` sheet layout.

Inn item storage is still a stub and should be treated as unsafe. Recovered storage widgets expect real stored-item accessors like `_countStoredItem` and `_getStoredItem`; the local `ObjectItemStorage.lua` removes or adds one catalog id directly through `RemoveItem(itemId, 1)` / `AddItem(itemId, 1)`. That does not preserve item instance state and can duplicate or destroy HQ, durability, spiritbind, materia, or unique identity on retrieve. `SetPlayerItemStoragePacket` exists as opcode `0x01A5`, but Lua registration/send sites are dormant.

NPC repair is comparatively complete. The local repairer script maps the recovered `selectItem` return shape into `Player.GetNpcRepairCost`, `RepairNpcItem`, and `RepairAllNpcItems`. The player-to-player repair order path still has a duplicate-charge TODO in `SetRepairRequest`.

## 2026-06-20 Transaction Audit Risks

- **P0 Generic shop buy/sell is exploitable.** `Data/scripts/shop.lua` checks/removes only unit `price` while granting client-supplied `quantity`; sell credits currency before final removal and trusts quantity/slot. Patch first: positive bounded counts, overflow-safe `unitPrice * quantity`, authoritative row/range lookup, space preflight, remove-before-credit for sells, and stale quote rejection.
- **P0 Object storage can mint arbitrary items.** `ObjectItemStorage.lua` accepts a selected item id from `selectReceiveItem` and calls `AddItem` without proving the item was stored/unlocked. Keep retrieval mutation fail-closed until real persisted storage state exists.
- **P0 GC/black-market/Hamlet/guild shops need catalog gates.** Company shop still has TODOs for rank/city/item-range checks and indexes returned rows directly; black marketeer appears to swap gil/seal price columns; Hamlet salesman hardcodes tier `3`; guild shops pass client quantity into shared purchase. Validate catalog membership, rank/city/special masks, caps, and nil/out-of-range rows before currency mutation.
- **P1 Materia package/state validation is too loose.** `ResolveMateriaItemReference` proves actor ownership, but meld/materialize/remove paths should explicitly reject bazaar, trade, loot, meld-request, attached/selling, equipped-in-wrong-state, and other special packages unless a command specifically allows them.
- **P1 Add one C# mutable item-reference validator.** Use it across shops, loot move/waste/transfer, trade, bazaar deal/undeal, and materia: actor id must match, package must be in an allowed set, quantity must be positive/bounded, and special states such as equipped/selling/attached/bazaar/meld/trade/loot must reject unless explicitly intended.

## 2026-06-20 Commerce Helper Notes

- The read-only commerce audit confirmed local backend coverage for ordinary/guild/GC shops, retainer transfer, bazaar, player trade, materia attach/materialize, NPC repair, and player search. The missing part is transaction authority and ownership validation.
- Commerce widget returns are selectors, not authority: `ShopBuyWidget` returns row plus quantity, `GrandCompanyShopWidget` returns a sheet index, `ShopSellWidget` returns package/slot/quantity, storage returns catalog-ish selectors, and materia removal resolves a normal-package slot. Every commit must re-resolve from server tables/packages.
- Highest-risk shop fix remains `shop.lua`: compute checked `unitPrice * quantity`, reject nil/out-of-range rows, preflight capacity/unique/currency caps, remove-before-credit on sells, and reject stale sell quotes. Ordinary and guild shops currently pass unit price plus arbitrary quantity into the shared helper, so multi-buy undercharge is the first concrete P0.
- Prefer one authoritative buy/sell commit path over script-local direct calls to `purchaseItem` / `sellItem`: resolve offer by NPC/shop kind/selector/quantity, recompute server-owned item id/quality/currency/total cost, lock or revision-check the player inventory, preflight capacity and caps, then mutate once.
- Sell commit must re-read package/slot at final confirmation, verify item id/quality/unique id/stack count against the quote, remove or transactionally reserve the item first, then credit currency. Cached quote globals are not sufficient authority.
- Keep `ObjectItemStorage` retrieve closed until stored item instances are persisted by `serverItemId`/category/slot and full-inventory retrieve is non-destructive.
- Add one shared mutable item-reference validator for trade, bazaar, materia, loot, item transfer, shops, and storage. It should check actor ownership, package allowlist, slot/count bounds, and special states before mutation.
- Add per-player transaction locking or item-package revision checks for shop, sell, storage, materia, and repair commits; use checked integer math for quantity, total price, currency caps, and no-partial-mutation behavior.
- Player repair is not production-ready: `SetRepairRequest` has duplicate-charge risk and recovered local scripts for `24243` `RepairOrderCommand` and `24244` `RepairEquipmentsCommand` are still missing.
- Missing commerce-facing local scripts/APIs remain `PopulaceShopMateriaRemover`, materia removal preview/commit, `MarketStand`, `RetainerMeetingSpace`, `RetainerBaseClass`, `PrivateAreaMasterMarket`, and original item/retainer search queueing.

## 2026-06-20 Storage / Materia / Repair Boundary

- Storage remains fail-closed. Current `ObjectItemStorage.lua` is catalog add/remove only: deposit loses item instance state, and retrieve can mint selected catalog ids. Require item-instance persistence by `serverItemId`, category, slot, capacity preflight, and `_canStoreItem` / `_countStoredItem` / `_getStoredItem`-equivalent APIs before enabling.
- `SetPlayerItemStoragePacket` opcode `0x01A5` exists, but Lua exposure is commented and no send site was found. Do not send it until category enablement behavior is captured.
- Materia removal should start as preview-only. Recovered UI returns package-1 gear and mode-2 confirm, but local code only has `InventoryItem.ClearMateria`; add no commit path until price/gil/cancel/equipped-stat refresh and strict mutable item-reference validation are proven.
- Player repair stays logging-only. `24243/24244` are EventRouteProbe targets, local command scripts are missing, `SetRepairRequest` can duplicate-charge on retries, and no fulfill/pay/clear backend was found.
- NPC repair is wired, but debit currently happens before durability mutation. Probe page/index/cancel/no-gil/full-durability behavior before changing debit ordering.
- Do not open storage, materia removal, or repair through generic `WidgetOpenCommand`; keep `WidgetOpenCommand` reject-only for these transaction surfaces.

## 2026-06-20 Shop / Exchange Deep-Dive Addendum

- Split shop work into separate owners: ordinary buy/sell, guild mark shops, GC shops, black marketeer, Rowena/primal reward-select exchange, company/Hamlet supply delivery, and repair. They share transaction helpers but have different provider authority.
- Hamlet vendors currently use ordinary shop mode `4` with static high-tier packs; real Hamlet rating/tier selection is not implemented.
- Guild mark shops are partially wired, but unmapped actors need nil guards and quantity pricing still flows through the same unit-price helper risk.
- GC shops have rank/city/special/category table columns, but local purchase still hardcodes rank and trusts returned `buyIndex`; server-side rank, city, item-range, special mask, and seal-cap gates remain missing.
- Black marketeer is high-risk: local schema is `{ itemId, gilPrice, sealPrice, city, category }`, but the gil shop charges the seal-price column and the seal shop charges the gil-price column. Coin trade also removes the coin before adding seals and has no seal-cap guard.
- Rowena/primal token exchange is not live as a server transaction. `PopulaceNMReward` currently talks and ends, while recovered paths open `Ask/RewardSelectWidget`; token debit, reward add, capacity, and idempotency still need a server-owned commit path.
- GC company supply and Hamlet supply are preview/status surfaces today. They may open delivery/item widgets, but they do not safely remove items or grant rewards yet.

## 2026-06-21 Owner/Selector Contracts

- `PopulaceShopMateriaRemover` is recovered only. It owns `Ask/MateriaRemoveWidget`, which selects a package-1 inventory slot, then `Ask/MateriaDialogWidget` mode `2`, which confirms/cancels the quoted removal. Local support stops at low-level `InventoryItem.ClearMateria`; no player preview/commit API or remove-materia command mapping exists. Probe preview only and never call `ClearMateria` during selector capture.
- `PopulaceNMReward` is Rowena/primal token exchange. Local `PopulaceNMReward.lua` only talks and ends; recovered `RewardSelectWidget` paths return offset result codes and need a server-owned exchange transaction before any reward grant.
- Rowena exact token sets from recovered data: Ifrit rewards `4020010`, `4030507`, `4040109`, `4070309`, `4080007`, `5020216`, `5030110` cost Inferno Totem `10011151` x10; Moogle rewards `4020112`, `4030407`, `4040013`, `4070214`, `4080212`, `5020111`, `5030036` cost Kupo Nut Charm `10011152` x10; Garuda rewards `4020407`, `4030607`, `4040507`, `4070407`, `4080507`, `5020407`, `5030407` cost Vortex Totem `10011154` x40.
- `PopulaceBlackMarketeer` recovered actor classes are `1500293`, `1500294`, and `1500295`. Local table shape is documented as `{ itemId, gilPrice, sealPrice, city, category }`, but gil purchase currently uses column `[3]` and seal purchase uses column `[2]`; treat price columns as suspect until a preview probe logs both local columns beside recovered sheet values.
- `PopulaceCompanyShop`/`GrandCompanyShopWidget` returns a selected sheet index, not authority. Local purchase hardcodes rank `13` and trusts `shopInfo[buyIndex]`; future commit must revalidate player GC, rank, city, special/event flag, row membership, price, capacity, and seal cap.
- `PopulaceGuildShop` mark currencies are actor-bound; local `processGuildShop` passes quantity into shared `purchaseItem`, but `purchaseItem` charges only unit price. Preview probes should log `shopPack * 1000 + row`, unit price, quantity, and checked `quantity * unitPrice`.
- Generic selector rule: every returned widget row/index/slot/quantity is a selector. It must be re-resolved server-side against the current provider, inventory package, allowed row range, and currency state before any mutation.

## 2026-06-21 Populace Commerce/Storage Update

- Inn storage stays P0/fail-closed: `ObjectItemStorage.lua` deposit/retrieve removes or adds catalog ids, not stored item instances. Probe only `ItemStoragePut/GetWidget` selector params until persistent storage owns `serverItemId`, category, slot, capacity, HQ/materia/durability, and unique state.
- Company shop is live commerce but still incomplete: local `PopulaceCompanyShop` trusts selected rows and has rank/range validation gaps. Treat wrong-company, low-rank, special/event, city, price, capacity, and seal-cap checks as required before production use.
- Company supply is preview/status first. Selection logging or delivery preview is useful, but real supply turn-ins need remove-before-reward, item identity, anima/supply-point, duplicate, full-inventory, and cancel validation.
- `PopulaceSpecialEventCryer` is high-risk because it can directly grant seals/items and exchange validation/cost removal is incomplete. Generic recovered town/GM/telepo/wave cryers are still missing locally.
- `PopulaceMenuMan` is a recovered debug custom-menu wrapper with tutorial, cutscene preview, warp, appearance, item, and achievement branches. Keep it GM/debug-only; never treat it as a retail custom-window entry point.
- Support desk and linkshell manager are adjacent DB-backed selector surfaces, not commerce, but they follow the same rule: passive/read paths first, disposable DB lifecycle second, and no persistent mutation without validation of packet shape and ownership.

## 2026-06-21 Preview-Only Probe Sequence

1. Snapshot normal inventory package `1`, currencies, key items, gil, GC seals, guild marks, item unique ids, and materia arrays.
2. Start the target event, open only the owner widget path, and capture selector output.
3. Re-resolve the selected row/slot/server item and log `wouldGrant`, `wouldConsume`, `wouldCost`, and validation failures.
4. End the event immediately.
5. Snapshot again and assert no inventory, currency, materia, quest, or shop-state changes.

## 2026-06-21 Craft/Repair/Materia Command Status

- Crafting is the strongest command lane: `CraftCommand`/`CraftJudge` cover `22001`, and recovered craft hooks line up with local craft repair/materia helper calls.
- NPC repair is wired through `PopulaceItemRepairer`, but player repair stays logging-only. `RepairOrderCommand.lua` and `RepairEquipmentsCommand.lua` are still missing for `24243/24244`, and `SetRepairRequest` needs idempotent stage/pay/fulfill/clear handling before currency mutation.
- Materia attach/rate has local command actor coverage through `22014/22015/22016` (`22014`/`22016` -> `MateriaMeldCommand`, `22015` -> `MateriaMeldRateCommand`). Item materialize is `24240` and has a local `ItemMaterializeCommand` path; keep that distinct from missing materia removal.
- Materia removal is UI-found/backend-missing: `Ask/MateriaRemoveWidget`, `Ask/MateriaDialogWidget` mode `2`, and low-level `InventoryItem.ClearMateria` exist, but no safe `Player` preview/commit API or confirmed remove command exists. Keep removal as preview-only.

## 2026-06-21 Storage/Repair Source Evidence Update

- Inn storage is still catalog add/remove rather than item-instance movement. `ObjectItemStorage.lua` can remove or mint by item id; it does not persist `serverItemId`, category, slot, durability, spiritbind, HQ, materia, or unique state.
- `SetPlayerItemStoragePacket` opcode `0x01A5` exists, but the Lua registration/send path is still dormant. Do not assume category enablement or all-items masks until a client probe proves when `0x01A5` is required.
- Materia attach command ids are concrete: `22014` and `22016` route to `MateriaMeldCommand`, while `22015` routes to `MateriaMeldRateCommand`. Capture payloads for valid/invalid references before broadening UI parity.
- Materia removal remains recovered-only at the NPC/UI layer. `InventoryItem.ClearMateria` can persist slot zeroing, but there is no server-owned preview/commit API, price validation, no-gil branch, cancel branch, or command id proof.
- Repair commands `24243/24244` are still mapped/documented but unsafe to fulfill from generic packet data. `SetRepairRequest` needs stage/pay/fulfill/clear separation and duplicate-charge guards before player repair requests can mutate gil or durability.
- Storage, repair, and materia-removal widgets all need pending owner contexts and server-side item-reference validators. Client package/slot tuples are not item authority.

## Widget Contracts

- **Ask/MateriaRemoveWidget**: Lists package-1 normal inventory equipment with attached materia and returns the selected item slot. Local status: Missing local NPC caller and player-level preview/removal API; `InventoryItem.ClearMateria` exists.
- **Ask/MateriaDialogWidget**: Mode 1 materialize confirm, mode 2 materia removal confirm with price display/no-gil OK hiding. Local status: Materialize command present; remove confirm flow is mapped but not locally wired.
- **Ask/MateriaInformWidget**: Displays success/failure and replacement-item/catalyst information. Local status: No local script-level use found; backend sends chat messages instead.
- **Materia attach widgets**: Attach target/materia selection and warning/caution flows. Local status: Backend meld and rate commands present; UI parity still needs client probe.
- **Ask/ShopBuyWidget**: Provider-backed shop buy list and quantity child widget. Local status: Implemented locally through Lua price tables and purchaseItem helper.
- **Ask/ShopSellWidget**: Inventory sell list, price request, and quantity confirm. Local status: Implemented locally with sell price confirmation and sellItem helper.
- **Ask/GrandCompanyShopWidget**: Grand company seal shop with rank/special item masks. Local status: Implemented locally with hard-coded shopInfo and purchaseItem.
- **Ask/ItemStoragePutWidget**: Select inventory item to deposit into inn storage. Local status: Recovered put widget filters inventory through `_getItem`/`_canStoreItem`; local script only receives a catalog-style id and removes one item. Gap: exact return params, item-instance ownership, category/slot storage, and `_canStoreItem` rules are unproven.
- **Ask/ItemStorageGetWidget**: Select stored item to retrieve by category. Local status: Recovered get widget expects `_countStoredItem(category)` and `_getStoredItem(category, itemIndex)`; local script only adds one catalog id. Gap: no persistent stored-item table/API or capacity-safe retrieve path.
- **RepairEquipmentWidget / RepairEquipmentDialogWidget**: Repair UI, slot selection, command bridge, and confirmation. Local status: NPC repair backend present; player repair order path still has TODO risk.
- **Ask/MarketSelectWidget**: Generic 1-24 answer market/ward chooser. Local status: Local MarketEntrance uses eventPushStepPrvMarket, not this ask widget directly.

## Local Backend Map

- **Materia command actor creation**: Present via `CreateMateriaCommandEventActor maps 22014/22016 to MateriaMeldCommand and 22015 to MateriaMeldRateCommand`. Gap: No recovered remove-materia command actor path found locally.
- **Materia meld**: Present via `MeldMateriaBySlots, GetMateriaMeldRateBySlots, MeldMateria, TryPrepareMateriaMeld`. Gap: UI warning/inform widgets are not yet proven against this backend path.
- **Item materialize**: Present via `ConvertItemToMateriaBySlot, ConvertItemToMateria`. Gap: Recovered MateriaDialogWidget mode 1 expects executePlayerMaterializeCommand; local command actor covers command path.
- **Materia slot persistence**: Partial via `SetMateria, ClearMateria`. Gap: ClearMateria exists but there is no public Player remove-materia API or PopulaceShopMateriaRemover script.
- **Ordinary shop buy/sell**: Present via `openShopMenu, openSellMenu, selectShopBuy, selectShopSell`. Gap: Uses local shop_prices.lua rather than recovered shopBaseSheet/shopItemSheet provider.
- **Shop transaction helpers**: Present via `purchaseItem, sellItem`. Gap: P0 quantity/transaction risks are unresolved: multi-buy appears undercharged because helpers remove only unit price, and sell credits currency before final item removal/revalidation.
- **Grand company shop**: Present via `eventShopMenuOpen, eventShopMenuAsk, purchaseItem`. Gap: Returned index is trusted; rank, city, item range, special/event masks, ownership, nil rows, and GC seal cap must be validated server-side.
- **Guild mark shop**: Present via `selectMode, processGuildShop, purchaseItem`. Gap: Guild shop relies on `shop_prices` presence rather than explicit allowed range/mask validation; exchange/refund paths must stay separate from normal quantity pricing.
- **Inn item storage**: Stub via `storageMenu, selectStoreItem, selectReceiveItem`. Gap: No persistent storage table/API; local add/remove is catalog-only and can duplicate or destroy item instances. Safe design should move existing `InventoryItem` records into storage ownership/category/slot, using exact-instance patterns like `TransferRetainerItem` plus `ItemPackage.AddExistingItem`/`RemoveItem(InventoryItem)`, or otherwise preserve a `serverItemId` with modifiers rather than re-creating by catalog id.
- **Storage entitlement packet**: Dormant via `SetPlayerItemStoragePacket.BuildPacket` / opcode `0x01A5`. Gap: Packet is not registered/exposed in LuaEngine and is not sent by ObjectItemStorage; category enablement/all-items mask behavior needs a client probe before relying on Put/Get widgets.
- **NPC repair**: Present via `talkWelcome, selectItem, confirmRepairItem, confirmUseFacility`. Gap: Needs client index/page probe for every repair row plus repair-all selection.
- **Repair backend**: Present via `GetNpcRepairCost, GetNpcRepairItemId, RepairNpcItem, RepairAllNpcItems, SetRepairRequest`. Gap: SetRepairRequest still has a TODO about duplicate charging for repeated requests.
- **Bazaar backend**: Present via `AddToBazaar, RemoveFromBazaar, BazaarBuyOperation, BazaarSellOperation`. Gap: Recovered bazaar widgets/commands were inventoried here but need a separate retainer/bazaar pass.
- **Market entrance**: Partial via `eventPushChoiceAreaOrQuest, eventPushStepPrvMarket`. Gap: Does not use recovered MarketSelectWidget; likely a separate market-ward UI path.

## Gaps

- **P1 PopulaceShopMateriaRemover is not present locally.** Recovered NPC has welcome/select/preRemove/confirmRemove/openRemoveWidget/selectRemoveWidget, but Data/scripts has no matching script. Next: Add a local script wrapper only after adding a Player remove-materia API and price validation.
- **P1 Materia removal backend stops at InventoryItem.ClearMateria.** `InventoryItem.ClearMateria` persists slot zeroing; no `Player.RemoveMateria`/`RemoveMateriaBySlot` preview or command script was found. Next: implement preview first, validating package `1`, item ownership, equipment type, attached materia count, computed price, and current gil without mutation; add commit only after retail command-id capture.
- **P1 ObjectItemStorage is a non-persistent item duplication/destruction risk.** Local retrieve path adds selected catalog id to inventory; deposit path removes one catalog id; no stored inventory table or `_getStoredItem` API exists. Next: probe Put/Get return params, design stored-item persistence around item-instance movement, and expose `_countStoredItem`/`_getStoredItem` equivalents before enabling storage broadly. Candidate schema: `characters_item_storage(characterId, category, slot, serverItemId)`, with unique keys on `(characterId, category, slot)` and `serverItemId`.
- **P1 SetPlayerItemStoragePacket is dormant.** Packet class exists as opcode `0x01A5`, but LuaEngine registration is commented and no send site was found. Next: Probe whether `0x01A5` is needed before ItemStoragePut/GetWidget opens or before category enablement, and whether the all-items-enabled mask is acceptable.
- **P1 Storage API shape is still missing.** Recovered hooks imply `_canStoreItem`, `_countStoredItem`, and `_getStoredItem`; local code has no equivalent. Next: design `CanStoreItem(category, catalogId)`, `CountStoredItem(category)`, `GetStoredItemCatalogId(category, index)`, `StoreInventoryItem(category, itemRef, quantity?)`, and `RetrieveStoredItem(category, index)` with preflight capacity/unique checks before any delete.
- **P2 Shop provider parity uses local tables rather than recovered shopBaseSheet/shopItemSheet.** Recovered ShopBaseClass reads shopBaseSheet/shopItemSheet; local PopulaceShopSalesman uses shopInfo/shopRange/shop_prices.lua. Next: Compare local ranges/prices with client sheet rows for high-traffic vendors and hamlet packs.
- **P2 Grand company shop masks are not proven against recovered widget logic.** Recovered GrandCompanyShopWidget has rank/special mask functions; local script makes purchase decisions with hard-coded shopInfo. Next: Probe low-rank, wrong-company, special, and fireworks/choker cases.
- **P2 Materia attach UI parity is not closed.** Local command backend is present, but recovered attach/warning/caution widgets have not been matched to exact system command round trips. Next: Capture 22014/22015/22016 command payloads from the client with valid and invalid item references.
- **P2 NPC repair UI should be page/index probed.** Local script maps recovered selectItem returns through custom page/list-index handling. Next: Probe each equipment row, cancel row, repair-all row, full-durability item, and insufficient gil.
- **P2 Repair order command has repeated-request charging risk.** Player.SetRepairRequest contains a TODO to prevent duplicate charging when request state is repeatedly sent. Next: Separate validation/stage/charge transitions before wiring more UI paths to RepairOrderCommand.
- **P3 MarketSelectWidget is recovered but not mapped to local MarketEntrance.** Local MarketEntrance uses eventPushChoiceAreaOrQuest and eventPushStepPrvMarket instead. Next: Leave for a market-ward/retainer pass unless a specific missing market UI appears in play.

## Probe Queue

- **P1 Materia remover preview path** Setup: Create or GM-spawn one equipment item with materia and enough gil. Expected: Ask/MateriaRemoveWidget lists the item and confirm dialog receives the recovered five preview args; DB and item materia remain unchanged until a later commit path is explicitly enabled.
- **P1 Materia remover no-gil/cancel** Setup: Use a melded item with zero gil, then repeat with cancel on MateriaDialogWidget. Expected: No slot clears, NPC cancel/no-gil branch plays, item remains unchanged.
- **P1 Item storage return-param capture** Setup: Open Put/Get widgets with NQ, HQ, damaged, spiritbound, and melded items across categories. Expected: Capture exact category/item/package/slot/catalog tuple before any mutation path trusts it. Recovered Put appears to return catalog id only, while Get returns `_getStoredItem(category,index)`, so the server may need a pending item-ref context for deposit authority.
- **P1 Item storage persistence** Setup: Deposit an HQ or melded item into each storage category, relog, retrieve. Expected: Stored item instance survives with modifiers, durability, spiritbind, materia, and unique id, not just catalog id.
- **P1 Storage full-inventory reject** Setup: Fill normal inventory and attempt retrieve. Expected: Retrieve fails without deleting the stored item and without duplicating a catalog item.
- **P0 Shop buy quantity/range/desync** Setup: Manipulate ShopBuyWidget index/quantity/count for ordinary, guild, GC, and black marketeer shops. Expected: Server validates count > 0, authoritative row/range/masks, checked `unitPrice * count`, currency cap, stack/unique constraints, and rejects nil/out-of-range rows.
- **P0 Shop sell final revalidation** Setup: Quote NQ/HQ/melded equipment, move/swap/change quantity before final confirm, then attempt sell. Expected: Server re-reads slot/package, verifies item id/quality/count, removes first, then credits; stale quote cannot pay out.
- **P0 GC/black-market validation** Setup: Test wrong company/city, low rank, special/event items, invalid black-market rows, and seal cap edge cases. Expected: Server-side masks and caps reject before purchase/credit, independent of client filtering.
- **P2 Repair all repeated confirm** Setup: Damage several pieces, trigger repair all, replay or repeat confirm path. Expected: Gil charges once per actual repair and no duplicate charge occurs.
- **P2 Materia command actor payloads** Setup: Use client attach/materialize widgets for 22014/22015/22016 payload capture. Expected: Local command scripts parse the same item reference shape recovered DesktopWidget emits.
- **P3 MarketSelectWidget caller** Setup: Search/capture market ward entrance and retainer UI calls. Expected: Either confirm local eventPushStepPrvMarket is the active path or find a MarketSelectWidget caller.

## 2026-06-21 Storage/Repair/Materia Source-Truth Addendum

- Recovered inn storage is widget/API-owned: Put/Get widgets expect `_canStoreItem`, `_countStoredItem`, and `_getStoredItem` style APIs. Local `ObjectItemStorage.lua` still removes/adds by catalog id, which can destroy or mint item-instance state such as HQ, durability, materia, spiritbind, and unique ids.
- Any future storage commit needs a pending `StorageOperationContext`: owner actor, category, source package, source slot/server item id, catalog id, quoted count/capacity, TTL, and revalidation on commit. Storage persistence should move or reserve item instances, not recreate by catalog id.
- `SetPlayerItemStoragePacket` opcode `0x01A5` exists but remains dormant/commented from Lua exposure. Probe whether category enablement is required before treating storage widgets as usable.
- NPC repair is locally menu-owned, but debit/durability changes should be atomic or refund-safe. Today gil removal and durability update are separate operations.
- Player-to-player repair remains disabled/missing: recovered `RepairOrderCommand`/`RepairEquipmentsCommand` exist, but local command scripts are absent and `SetRepairRequest` still needs duplicate-charge/retry protection.
- Materia attach/rate/materialize have local command coverage, but item-reference validation is broad. Materia removal is recovered-only at UI/script level; local server only exposes low-level `ClearMateria`, not a safe preview/commit API.
- Package ids from storage/materia widgets are context-local. A widget package `5` in storage/materia must not become a global alias for loot or meld request.
