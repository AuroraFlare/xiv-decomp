# NPC Shop / Custom Exchange Surface Contract - 2026-06-21

This read-only checkpoint covers owner-bound commerce and exchange selectors that should not be opened through generic `WidgetOpenCommand`.

## Found High-Risk Surfaces

- Normal shops: `PopulaceShopSalesman.lua` and shared `shop.lua` are live, but buy quantity/range validation and sell final-slot revalidation are unsafe. Sell flow caches slot/item/price, then later commits without proving the same item is still there.
- Guild shops: `PopulaceGuildShop.lua` lacks strong positive quantity/range hardening; mark-to-gil exchange spends all marks without gil-cap handling.
- GC shops: `PopulaceCompanyShop.lua` hard-codes rank `13`, has TODOs for rank/city/item-range checks, and indexes `shopInfo[buyIndex]` without a nil guard.
- Black market: `PopulaceBlackMarketeer.lua` mutates coin/seals directly, has NPC/city guard TODOs, and appears to swap price tuple indexes: gil path uses `[3]`, seal path uses `[2]`.
- GC supply/custom delivery: `PopulaceCompanySupply.lua` is mostly static/debug data today. `deliveryMenuOpen` trusts `Type7Param.slot` and can nil-deref; real turn-ins need remove-before-reward validation.
- Special-event cryers: `PopulaceSpecialEventCryer.lua` hard-codes crystal/event mode state and grants GC seals without consuming inputs or rank-cap checks.
- Rowena/primal exchange: `PopulaceNMReward.lua` is dialogue-only locally. Recovered data proves reward-select/token exchange adjacency, but no local server-owned exchange transaction exists.
- Inn storage: `ObjectItemStorage.lua` deletes one selected item on store and mints one selected item on retrieve. No storage table, category proof, full-inventory rollback, or stored-count authority exists.
- Support desk: FAQ/body/issues/open/read are DB-backed reads; send/close mutate DB. Receive packets can set `invalidPacket`, but the dispatcher path needs an explicit malformed-packet guard before save/close; use disposable characters for ticket mutation probes until that guard exists.

## Owner/Selector Rule

Every returned widget row, index, quantity, slot, item id, or type parameter is only a selector. The server must re-resolve it against the owning NPC/packet flow, current inventory package, currency/seal state, rank/city/range masks, cap rules, and pending context before any mutation.

Keep these selector families off generic `WidgetOpenCommand`: shops, storage, market/search, support, retainer, event exchanges, GC supply, Rowena/NM reward, black market, and special-event cryers.

## Safe Probe Order

1. Data-only diffs: compare local tables with `blackMarket.csv`, `gcSealShopItem.csv`, `shopItem.csv`, `populaceGuildShop.csv`, `populaceNMReward.csv`, and `objectItemStorage.csv`.
2. Smoke `WidgetOpenCommand` rejection only; do not allowlist these selector widgets.
3. Owner-open/cancel only: black market, guild shop, GC shop, GC supply, special-event cryer, Rowena/NM, inn storage, normal shop buy/sell.
4. Capture returned indices, quantities, packages, slots, and type params while canceling confirmations.
5. Support desk read probes only: FAQ/body/issues/open/read. Do not send or close tickets until malformed-packet guards are proven.
6. After guards exist, run malformed index/quantity/slot probes on disposable characters.
7. Single cheap mutations last: normal shop buy, guild shop buy, GC shop buy, black market gil/seal buy, event exchange, then inn storage.
8. Rowena/primal exchange remains dialogue-only until pending exchange context, required inputs, inventory space, cap checks, remove-before-grant, and rollback behavior exist.
9. Special-event crystal/seal exchange stays owner-open/cancel/log-only until it consumes the required crystals/clusters before granting, validates event entitlement, checks seal caps, and rolls back cleanly on failure.

## 2026-06-21 Source Evidence Addendum

- Shared `shop.lua` remains P0 transaction risk: buy checks/removes a unit price while granting the requested quantity, and sell credits currency before final item removal/revalidation. Do not reuse it for new custom windows until `unitPrice * quantity`, positive count, capacity, unique, and remove-before-credit are enforced.
- Normal shop and guild shop flows pass client selector/quantity values into that helper. Treat returned shop rows and quantities as selectors only; re-read the provider row by owning NPC/range before commit.
- GC shop has explicit missing rank/city/range validation and trusts `shopInfo[buyIndex]`. Wrong-company, low-rank, special/event, invalid row, and seal-cap probes are required before production widening.
- Black market table comments say `{ itemId, gilPrice, sealPrice, city, itemCategory }`, while local gil/seal paths appear to consume the opposite price slots. Keep black market owner-open/cancel/log-only until the tuple order is confirmed and city/rank/cap checks are server-owned.
- GC supply and Hamlet supply are delivery selectors, not authority. `Type7Param.slot`, package ids, HQ/materia state, and quantity must be re-resolved before any item removal, supply point, anima, seal, or reward grant.
- Special-event cryers can currently grant seals while only simulating crystal/cluster consumption. Keep these disabled for mutation until input removal happens before grant and rollback/cap behavior is proven.
- Rowena/NM/primal exchange is recovered as reward-select/token-cost adjacency, but local `PopulaceNMReward` is dialogue/select only. Do not derive real token grants from the recovered menu text until a transaction ledger exists.
- Package request opcode `0x0131` can ask world actors for item packages before the spawned-retainer branch. Add visibility, current-event/current-owner, actor-context, and ownership gates before using package reads in shop/storage/support/retainer windows.
- Support desk receive packets can mark `invalidPacket`; handler paths must return on malformed packets before DB read/save/close lifecycle code runs.

## Cross-Links

- `docs/materia_shop_storage_widget_contract_2026-06-19.md`
- `docs/retainer_bazaar_market_contract_2026-06-19.md`
- `docs/custom_window_menu_surface_handoff_2026-06-20.md`
- `docs/widget_open_allowlist_contract_2026-06-19.md`
- `docs/event_surface_contract_deepdive_2026-06-19.md`

## 2026-06-21 Support Desk Guard Split

- Support FAQ/list/body/issues requests should reject malformed packets before reading DB rows and should clamp language/index inputs. `getIssues(lanCode)` currently behaves as locale-insensitive in the local path.
- Support ticket send should reject malformed title/body/request data before save. It should also preserve a clear pending/open ticket context if the UI flow is split across multiple packets.
- Support ticket close is not just an `invalidPacket` problem: the close opcode currently has no parsed request packet and closes by player name. Require an open-ticket/session context and avoid broad close-by-name semantics.
- These support windows stay excluded from generic `WidgetOpen`; decomp confirms they are operator/support surfaces with DB side effects.

## 2026-06-21 Grand Company Shop Note

- Recovered `GrandCompanyShopWidget` returns `selectedItemSheetIndex`; local `PopulaceCompanyShop` uses `buyIndex`. Treat both as selectors only.
- Re-read the authoritative GC shop row by owning NPC/company/rank/range before commit. Do not trust client filtering for rank, city/company, special/event masks, quantity, or seal caps.
- GC supply uses the same broad `QuestDeliveryWidget` pattern as Hamlet supply but different sheets and authority. Do not share mutation logic until each path has its own pending context and ledger.
