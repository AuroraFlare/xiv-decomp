# Grand Company Custom Surface Contract - 2026-06-21

This is a docs-only decomp checkpoint for Grand Company custom windows and owner-routed surfaces.

## Local vs Recovered

| Surface | Local status | Recovered status | Missing authority |
| --- | --- | --- | --- |
| Company warp | `PopulaceCompanyWarp.lua` owns actor/destination tables and movement. | Recovered flow owns GC number, ticket id, rank, salute/dialogue, and main-menu ask. | Pass checking, rank/choice validation, and server-owned owner context. |
| Company shop / seal shop | `PopulaceCompanyShop.lua` uses hard-coded `shopInfo` and `purchaseItem`. | Recovered shop loads `gcSealShopItem`, opens `Ask/GrandCompanyShopWidget`, and resolves rows through detail helpers. | Data-driven `gcSealShopItem`/`gcRank`, row re-resolution, rank/city/range checks, cap checks, rollback. |
| GC shop widget | Local script trusts selected index paths. | `GrandCompanyShopWidget` masks rank-gated rows, opens child `ShopEditWidget`, and returns `selectedItemSheetIndex`. | Treat returned index as selector only; never as authority. |
| GC supply/exchange | `PopulaceCompanySupply.lua` is static/debug data plus Noc001 delegates. | Recovered supply uses `itemGcExSupply` and `Ask/QuestDeliveryWidget`. | Turn-in ledger, remove-before-reward, package/slot/item/count revalidation, cap checks. |
| Enlist/rank/seals | `PopulaceCompanyOfficer.lua` hard-codes rank/cost/next rank and only plays UI. | Recovered officer opens join/status widgets. | DB writer, spend-before-rank, rank prerequisites, seal cap refresh, idempotency. |
| GC quest/content info | Local `gc_quest_template.lua` can start/advance/complete if the gate is enabled. | GC701 has QCI/kind-1 overlay evidence. | QCI is not `ContentCommand`; no enlistment/rank/seal mutation from overlay probes. |
| Company ship | Local `CompanyShip.lua` is no-op. | Recovered `companyship.lua` is also identity-only. | Transport authority remains `PopulaceFlyingShip` plus route backend, not CompanyShip. |

## Custom Windows Found

- `Ask/GrandCompanyShopWidget`
- `ShopEditWidget`
- `GrandCompanyStatusWidget`
- `GrandCompanyJoinWidget` and join-effect path
- `Ask/GrandCompanyOfficialJoinWidget`
- `Ask/QuestDeliveryWidget`
- `GuildleveExecutionWidget`
- Company leve widgets such as `Ask/GuildleveSelectLevelWidget` and `Ask/GuildleveStartWidget`

## Current Unsafe List

- `shop.lua` remains unsafe for quantity transactions: it checks/removes unit price while granting quantity, and sell paths can credit before final item removal/revalidation.
- GC shop must not trust local `buyIndex` or recovered `selectedItemSheetIndex`; re-read the provider row by owning NPC, company, rank, and range before commit.
- GC supply must not trust `QuestDeliveryWidget` package/slot/count payloads without a pending context and server inventory re-resolution.
- Officer rank-up is UI-only today; no seal spend, rank write, cap update, or persistence is proven.
- Company warp has pass checking disabled and needs hard owner/choice/rank validation before widening.
- All GC shop/status/join/supply windows stay owner-routed and excluded from generic `WidgetOpen`.

## Still Missing

- Data-driven GC shop authority from `gcSealShopItem`/`gcRank`.
- Real enlist/rank/seal mutation and packet refresh.
- Official join owner bridge; recovered widget is confirm/cancel only.
- GC supply `itemGcExSupply` transaction ledger.
- Full `PopulaceCompanyGLPublisher` / company leve flow.
- `TalkCommand` and `ContentCommand` owner/work-sync proof for GC quest/content widgets.
