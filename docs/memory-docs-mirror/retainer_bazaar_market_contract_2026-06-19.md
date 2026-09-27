# Retainer, Bazaar, Trade, Market, And Search Contract - 2026-06-19

## Scope

This pass covers recovered retainer widgets/scripts, bazaar widgets/commands, player-to-player trade widgets/commands, market entrance/stand/private-area surfaces, PC search, item search, retainer search shells, and the separate web auction-house layer.

Generated artifacts live in `tools\outputs\lpb\retainer_bazaar_market_contract_20260619`.

## Summary

| Metric | Count |
| --- | ---: |
| Sources present | 99 / 99 |
| Function contracts | 605 |
| Class contracts | 42 |
| Widget contracts | 12 |
| Command contracts | 9 |
| Local backend surfaces | 12 |
| Local script parity rows | 12 |
| Packet contracts | 12 |
| Backlog rows inventoried | 41 |
| Source term hits | 1329 |
| Local gaps | 10 |
| Probe queue | 10 |

## Main Findings

Retainer core is real locally. `Player.SpawnMyRetainer` creates a `Retainer` actor, sends a `RetainerMeetingRelationGroup`, locks the retainer in the database, and `DespawnMyRetainer` releases that lock. Hiring, dismissing, market-state persistence, and item package refresh APIs are also present.

The recovered retainer UI is now mapped. `RetainerTradeWidget` returns retrieve/entrust result codes that local `retainer.lua` handles through `TransferRetainerItem`. `RetainerItemListWidget` returns add/remove bazaar operations that local `doBazaar` maps into `WorldManager.AddToBazaar` and `RemoveFromBazaar`.

Player-to-player trade is one of the healthier slices. Local `TradeOfferCommand`, `ConfirmTradeCommand`, and `TradeExecuteCommand` match the recovered command bridge: open tray, poll `processUpdateTradeCommandTrayData`, reply with set/fix/re-edit notices, and complete through `WorldManager.CompleteTrade`.

Bazaar backend exists, but the open/check path is blocked. `WorldManager` has add/remove/buy/sell operations and local Bazaar* command scripts exist. However, `BazaarCheckCommand.lua` currently sends a disabled/freezing message instead of delegating to recovered `processChackBazaar -> desktopWidget.orderBazaarWidget(1)`. The first technical blocker is package `8`: client retainer-bazaar requests alias toward backend package `7`, but full-package sends can serialize canonical `7`, and Lua direct `GetItemPackage(8)` has no alias.

Search splits cleanly: player search is live, item/retainer market search is not. `PacketProcessor` handles player search opcodes and sends begin/info/comment packets. The item/retainer search packet classes are mostly shells, LuaEngine packet registrations are commented, and no queue site was found.

Market wards are only partly wired. Local `MarketEntrance.lua` can send players into wards and GC offices, but item search is hidden and Mercantile Wards are debug-only. Recovered `MarketStand` has lease, makeup, retainer-list, and check-bazaar methods; no local `MarketStand.lua` exists.

The web auction house is separate from original client market search. It has substantial DB transaction logic and retainer locks, but nothing currently bridges it to `ItemSearchWidget`, `RetainerResult*Packet`, or market stand UI.

## 2026-06-20 Transaction Audit Risks

- **P0 Bazaar deal/undeal actor hijack risk.** `BazaarDealCommand.lua` and `BazaarUndealCommand.lua` let the client supply `bazaarActor`; backend ownership checks can validate against that supplied actor without proving the command issuer controls it. Require issuer-owned player/retainer context before add/remove/listing mutation.
- **P0 Trade can move special-state items.** `Player.AddTradeItem` and `WorldManager.CheckIfCanTrade` validate quantity/space but should explicitly reject bazaar-listed, meld-request, loot, equipped, selling, attached, trade-locked, and other special-package items.
- **P1 Package `8` bridge remains prerequisite.** Retainer-bazaar UI must preserve client package `8` while resolving to backend retainer bazaar storage only in retainer-bazaar paths; do not let generic package lookup or full-package sends collapse it into the wrong package.
- **P1 Regression targets.** Add forged-command tests for bazaar actor hijack, trade listed/equipped/meld-request/loot items, invalid package refs, rare/exclusive behavior, gil cap, partial stacks, and cancel/re-edit after accepted trade state.
## 2026-06-20 Widget Provider Notes

- Recovered bazaar browse/setup entry points are provider-owned, not generic widget opens: `OrdinaryRetainer.eventTalkRetainerOther`, `MarketStand.eventPushCheckBazaar`, and `BazaarCheckCommand.processChackBazaar/processSetupBazaar` call `desktopWidget:orderBazaarWidget(1/2)`.
- `BazaarListWidget.processBeforeShow` refuses to show if `desktopWidget:isValidBazaarActor()` is false, which matches the server-side need to bind browse/edit/buy operations to a current player/retainer/stand context.
- `BazaarEditWidget` is not just display: it calls `desktopWidget:setItemDeal(...)` and `desktopWidget:executeBazaarBuy(...)` with chosen package, item, stack, gil, and reward data. Server code must re-resolve ownership, package `8`, quantity, gil cap, and special item states before mutation.
- `ItemSearchWidget` has market-select, item-type, and item-select phases and cancels with result `-1`, but local `MarketEntrance` still hides the item-search counter and no packet queue site was found. Keep original item/retainer search hidden until request and result packet layouts are captured.

## 2026-06-20 Commerce Helper Ownership Addendum

- Bazaar deal/undeal must bind to an issuer-owned player or retainer context. Do not trust client-supplied `bazaarActor` as the authority for listing or removing items.
- Trade needs explicit special-state rejects before `AddTradeItem`: bazaar-listed, meld-request, loot, equipped, selling, attached, trade-locked, stale slot, wrong quantity, wrong actor, and similar package states.
- Retainer-bazaar package `8` is a path-specific bridge problem. `ItemPackage.RETAINER_BAZAAR = 8` exists and packet sends can resolve it, but direct Lua `GetItemPackage(8)` still returns nil; fix this narrowly for retainer-bazaar paths.
- Market/search remains split: player search is live, item/retainer search packet classes are dormant, and recovered `MarketStand` exists in decomp output but no local `MarketStand.lua` script exists.
- Regression probes should include bazaar actor hijack, listed/equipped/meld-request/loot trade attempts, invalid package refs, rare/exclusive behavior, gil cap, partial stacks, and cancel/re-edit after accepted trade state.

## 2026-06-20 MarketStand / Package 8 Follow-up

- Corrected MarketStand status: recovered `MarketStand` exists and actor-class rows `5000001..5000090` point at `/Chara/Npc/MapObj/MarketStand`, but no local script and no matching `server_eventnpc_spawn_locations` rows were found. Do not describe MarketStand as spawned locally yet.
- Package `8` is not only a Lua lookup issue. `SendItemPackage(8)` resolves to backend package `7` and then sends full package `7`, while direct Lua `GetItemPackage(8)` remains nil. A safe bridge must preserve client-visible package `8` only in retainer-bazaar paths.
- Bridge rule: keep backend storage as `ItemPackage.BAZAAR = 7`; treat `ItemPackage.RETAINER_BAZAAR = 8` as a client-facing view package. Requests for `8` should resolve to storage `7` but full refreshes and update packets must still emit client package `8`.
- `Character.SendItemPackage` needs to preserve the requested client package code when it calls the full-package sender; retainer refresh/update paths should do the same rather than leaking canonical package `7` back into `BazaarListWidget`.
- Normalize client-returned package refs at the Lua boundary before dereferencing. `retainer.lua` currently consumes widget-returned package ids directly, so package `8` can fail or misroute unless the retainer-bazaar path maps it before `GetItemPackage`.
- Log package bridge events with actor id, requested package, storage package, emitted package, capacity/count, widget/command source, and whether the source is own-retainer self-management, browse, edit, or buy.
- `retainer.lua` consumes widget-returned package ids directly, so retainer-bazaar result probes should expect package `8` today to fail or misroute unless the bridge is fixed.
- Keep `BazaarCheckCommand` disabled until package `8`, actor ownership, target context, and event/window ordering are proven on a GM/test shard. Re-enabling the recovered `orderBazaarWidget(1/2)` path can reopen the known freeze.
- Probe order: package `8` send/lookup first, own-retainer bazaar self-management second, BazaarCheck freeze reproduction third, a GM-only MarketStand check-bazaar adapter fourth, original item/retainer search last.
- Original item/retainer search remains dormant: player search is live, but item/retainer search packet builders are not registered/queued and `MarketEntrance` keeps the item-search counter hidden.

## 2026-06-21 Market/Bazaar Freeze Notes

- Recovered `MarketStand.eventPushCheckBazaar` is the safest MarketStand bridge point because it only reaches `desktopWidget:orderBazaarWidget(1)`. Lease, makeup, retainer-call, lease-end, and lease-extend flows need relation group `80001` plus lease-state modeling and should stay disabled.
- `BazaarCheckCommand` remains intentionally disabled locally. The most likely freeze causes are invalid or missing `bazaarTargetActor`, package `8` requests answered as package `7`, a widget wait loop that never observes close/create state, or ending the event while the original UI command is still waiting.
- Package `8` acceptance criteria: full sends and updates must preserve outbound client package `8`, backend lookup must still resolve to storage package `7`, and client-returned package refs must be normalized before Lua or C# dereference.
- Safe GM order is unchanged but now sharper: request full package `8` without opening UI, then own-retainer add/remove, then isolated BazaarCheck with a known live target and one bazaar item, then a GM-only `MarketStand` check-bazaar adapter, then original item/retainer market search.
- Original item/retainer search is still dormant even though packet classes exist: player search is the only live search path; item/retainer result packet builders are unregistered or empty and no queue/send site was found.
- Player search itself needs a malformed-request guard before broad testing. The live path can still enumerate connected sessions even when a request parsed as invalid, so passive PC search probes should stay controlled until invalid packets return early.

## 2026-06-21 Retainer/Bazaar/Search Ownership Update

- Package `8` is still unresolved as a client-facing retainer-bazaar view over backend package `7`: full package sends and incremental bazaar updates can leak canonical `7` back to the client. Do not re-enable retainer-bazaar browsing until outbound full sends and updates preserve client code `8` while resolving storage as `7`.
- Package request opcode `0x0131` can target world actors before the my-retainer path. Add ownership, visibility, current-event/interaction, and target-context gates before using package reads for market, retainer, or bazaar windows.
- `retainer.lua` trusts widget-returned `packageId` and `rewardPackage`; package `8` can nil or misroute at `GetItemPackage`. Normalize client package refs at the retainer/bazaar boundary before Lua or C# dereference.
- Bazaar command scripts still trust client-selected actors too much. Bind deal/undeal/trade commands to an issuer-owned player, own retainer, or proven browse target before backend buy/sell/listing logic runs.
- `MarketStand` remains recovered-only locally: actor-class rows exist, but there is no local `MarketStand.lua` or spawn proof. Keep lease/extend/makeup/retainer-call flows disabled even after a future check-bazaar probe.
- `ItemSearchWidget` is a recovered phase shell only. Local market entrances keep item search hidden, Lua registrations are commented, and retainer result bodies are empty; keep item/retainer search disabled until request row layouts and send sites are captured.

## 2026-06-21 Package Request Source Evidence

- Package constants are now a useful warning label: backend `BAZAAR = 7`, client-facing `RETAINER_BAZAAR = 8`, backend `LOOT = 4`, and backend `MELDREQUEST = 5`.
- `Character.ResolveClientItemPackage` can map client `8` to backend `7`, but full sends and incremental updates must still preserve the outbound client code expected by the UI. Storage lookup and wire code are separate concerns.
- Update-item-package request handling can query arbitrary world actors before the spawned-retainer branch. Add visibility, current interaction/event, owner/retainer relationship, and current bazaar target gates before answering package reads.
- Retainer and bazaar Lua should normalize client-returned package ids before dereference. Client package `8` should not reach a raw `GetItemPackage(8)` path unless that path intentionally resolves to backend bazaar storage and emits code `8`.
- `BazaarCheckCommand` should stay disabled until package `8`, target actor ownership, event ordering, and close/open lifecycle are proven with a known live target.

## Widget Contracts

- **RetainerTradeWidget**: Moves items and gil between player packages and a summoned retainer. Local status: Local retainer.lua implements the loop through Player.TransferRetainerItem; probe HQ/materia/full-stack preservation.
- **RetainerItemListWidget**: Sets/removes retainer bazaar deals, including sell, seek-item, and repair-style rows. Local status: Local doBazaar handles 13/21 and WorldManager.AddToBazaar/RemoveFromBazaar; recovered widget has more mode/UI nuance.
- **RetainerListWidget**: Lists owned retainers and returns a selected retainer index. Local status: Local bell calls eventPushStepOpenRetainerMenu then Player.SpawnMyRetainer; community group backing is thin.
- **RetainerNamingWidget**: Collects and validates retainer names during hire flow. Local status: Local manager calls eventTalkStep4 then Player.HireRetainer with server-side name/candidate validation.
- **RetainerDismissalWidget**: Confirms retainer dismissal. Local status: Local dismissal blocks when retainer still has normal, currency, or bazaar possessions.
- **BazaarListWidget**: Displays a player/retainer bazaar and launches sell, buy, repair, abort, or item-select flows. Local status: Backend exists, but local BazaarCheckCommand intentionally disables opening because it froze characters.
- **BazaarEditWidget**: Edits bazaar price, stack count, seek item, and retainer/player item context. Local status: Server validates AddToBazaar modes; exact recovered edit modes still need client replay probes.
- **TradeWidget / TradeEditWidget**: Player-to-player trade tray and item/money editor. Local status: Local trade scripts and WorldManager.CompleteTrade line up with recovered command flow.
- **PcSearchWidget / PcSearchSelectWidget**: PC search result/target operations: tell, party invite, request join. Local status: PacketProcessor has live player-search request/result handling; UI operator bridge still needs client probe.
- **ItemSearchWidget**: Market item search setup through market, item type, and item selection phases. Local status: Local MarketEntrance disables the item-search choice and packet builders are not queued anywhere.
- **MarketSelectWidget**: Generic ward/market selection ask with up to 24 answers. Local status: Local MarketEntrance uses eventPushStepPrvMarket; RetainerFurniture dispatch branch is commented out.
- **MarketStand**: Market stand counter: lease/extend/end, makeup, retainer list, caution, and bazaar check. Local status: No local MarketStand.lua found even though actor-class rows exist.

## Local Backend Map

- **Retainer spawn/despawn**: Present via `SpawnMyRetainer, DespawnMyRetainer, RetainerMeetingRelationGroup, SetRetainerAccessLock`. Gap: Spawn placement is local/bell-specific; recovered RetainerMeetingSpace and access groups are not fully mirrored.
- **Retainer hire/dismiss/state**: Mostly present via `HireRetainer, GetRetainerCandidateChoices, DismissRetainer, SetRetainerMarketState`. Gap: Market dispatch state exists but UI branch is disabled and retainer community group publishing is thin.
- **Retainer inventory transfer**: Present via `RefreshRetainerItemPackages, RefreshRetainerBazaarItemPackages, TransferRetainerItem`. Gap: Needs probes for HQ/materia/partial-stack behavior against recovered wait/update semantics, plus client package `8` preservation for retainer-bazaar refreshes.
- **Player trade**: Present via `CreateTradeGroup, AcceptTrade, RefuseTrade, CancelTrade, CompleteTrade`. Gap: Trade validation uses itemData.isRare while other paths use isExclusive; unique/rare cases need probes.
- **Trade offer state**: Present via `StartTradeTransaction, AddTradeItem, RemoveTradeItem, ClearTradeItems, FinishTradeTransaction`. Gap: No explicit server-side distance check in the execute loop beyond CancelTradeTooFar helper availability.
- **Bazaar core**: Present via `AddToBazaar, RemoveFromBazaar, BazaarBuyOperation, BazaarSellOperation`. Gap: Client BazaarCheck open path disabled locally; package `8` lookup/send consistency, repaired-item seek mode, and UI mode parity need probes.
- **Bazaar command actors**: Partial via `BazaarCheckCommand, BazaarDealCommand, BazaarTradeCommand, BazaarUndealCommand`. Gap: BazaarCheckCommand displays a disabled/freezing message instead of delegateCommand/processChackBazaar.
- **Player search**: Present via `0x01DC profile, 0x01DD/0x01DE/0x01DF request, SendPlayerSearchResults`. Gap: Only player search is live; PC search widget operator actions still need client probe.
- **Item/retainer search**: Dormant via `ItemSearchResults*Packet, RetainerResult*Packet, RetainerSearchResult`. Gap: Packet builders exist but are shells/commented in LuaEngine and no queue/send site was found.
- **Market entrance**: Partial via `eventPushChoiceAreaOrQuest, eventPushStepPrvMarket, DoZoneChange`. Gap: Item search is disabled and Mercantile Wards only emit debug messages.
- **Market stand**: Missing via `not found`. Gap: Recovered lease/makeup/retainer-list/check-bazaar object has no local script.
- **Auction house web layer**: Separate implementation via `AH_GetAuctionListings, AH_CreateListing, AH_BuyListing, AH_CancelListing`. Gap: Useful retainer-backed market, but not wired into the original client ItemSearchWidget/market ward flow.

## Gaps

- **P1 Item and retainer market search are not live.** Local ItemSearchResults*/RetainerResult* packet classes exist, but rg found no queue/send site; LuaEngine registrations are commented and MarketEntrance sets showItemSearchCounter=false. Next: Implement a real request path and queue begin/body/end packets, or keep the search counter hidden until packet capture defines the client request shape.
- **P1 MarketStand is recovered and actor-classed, but not spawned locally.** Recovered MarketStand has eventPushStepCounter, eventPushMakeupCounter, eventPushEndLeaseStand, eventPushExpandLeaseStand, eventPushCheckBazaar; Data/sql has MarketStand actor classes, but no local script or spawn rows were found. Next: keep it disabled until package `8` and BazaarCheck are proven, then add only a GM/test mapobj adapter for check-bazaar.
- **P1 BazaarCheckCommand is intentionally disabled.** Local BazaarCheckCommand sends 'Currently disabled due to freezing characters' and comments out delegateCommand/processChackBazaar. Next: First fix/probe package `8` lookup/send behavior, then re-enable behind a debug flag after reproducing the freeze with valid player and retainer bazaar actors.
- **P1 Retainer dispatch to market streets is disabled in the local bell flow.** Player.SetRetainerMarketState and Database.UpdateRetainerState exist, but RetainerFurniture choice 8/eventTalkSelectBazaarStreet is commented out and showDispatchChoice=false. Next: Wire dispatch only after RetainerGroup/market stand visibility is understood, otherwise state changes will be invisible to client UI.
- **P1 Retainer community/access groups are not fully backed locally.** Recovered RetainerGroup, RetainerAccessGroup, RetainerAccessDirector, and RetainerMeetingRelationGroup exist; local C# only has RetainerMeetingRelationGroup, group constants, and a RetainerGroupRefreshPacket request. Next: Implement/update world community retainer group member payloads before relying on RetainerListWidget status/location rows.
- **P2 Retainer item and bazaar widgets have richer mode coverage than local retainer.lua.** Recovered RetainerItemListWidget tracks bazaarItemPackage, bazaartype, retainerBazaarCapacity, edit modes, and repair/seek details; local doBazaar handles resultCode 13/21 only. Next: Probe sell-single, sell-partial-stack, sell-full-stack, seek-item, and seek-repair rows against local AddToBazaar mode handling.
- **P2 Player trade is present but rare/exclusive behavior needs validation.** WorldManager.CheckIfCanTrade checks itemData.isRare, while bazaar/retainer paths use isExclusive for unique checks. Next: Run trade probes for rare/exclusive, gil cap, full inventory, partial stack, and target cancel/re-edit.
- **P2 Auction house is a separate web market, not the original market ward/item-search flow.** auction_house.php/core.php lock retainers and move items through DB transactions, but no client ItemSearchWidget or RetainerResult packet path calls it. Next: Treat auction house as a parallel feature unless a bridge to client market search is explicitly designed.
- **P2 Black marketeer local implementation is simplified.** Recovered PopulaceBlackMarketeer reads blackMarketSheet and has seal/gil shop menu methods; local script uses hard-coded commemorative coin checks and simple shop tables. Next: Defer unless black market vendors become a gameplay target; then compare recovered sheet keys to local shopInfo.
- **P3 PrivateAreaMasterMarket and market zone masters are only lightly mapped locally.** Recovered PrivateAreaMasterMarket has init/cueAttentionOnClient; SQL maps zones/private areas to class names, but no local script/class was found with that name. Next: Leave as market-ward polish after MarketEntrance, MarketStand, and retainer dispatch are functional.

## Probe Queue

- **P1 Item search hidden path** Setup: Temporarily set MarketEntrance showItemSearchCounter=true and interact with all three city entrances. Expected: Either client sends a captured request opcode for item search, or the UI hangs and the feature remains disabled.
- **P1 Retainer search packet send site** Setup: Search logs and instrument PacketProcessor for opcodes around 0x01D7-0x01E1 while operating ItemSearchWidget. Expected: Concrete request payload identified before filling RetainerResultBodyPacket.
- **P1 Retainer bazaar package 8 bridge** Setup: Request and refresh retainer-bazaar package `8` through both packet and Lua paths. Expected: Client sees package code `8`, backend resolves to retainer bazaar storage, and no request falls through to the wrong package.
- **P1 Bazaar check freeze reproduction** Setup: After package `8` bridge works, restore delegateCommand in BazaarCheckCommand on a test shard and target a player with one bazaar item. Expected: Freeze cause isolated to invalid actor/package/update ordering, not the command itself.
- **P1 MarketStand push** Setup: Warp to a market ward with a MarketStand actor class and push/interact. Expected: Missing-script error today; after adapter, eventPushCheckBazaar opens or fails cleanly.
- **P2 Retainer transfer identity** Setup: Move a melded unique equipment item, HQ stack, and partial stack to/from retainer. Expected: Full item moves retain server unique id/modifiers; partial stack creates correct quantity without duplicating modifiers improperly.
- **P2 Retainer bazaar mode matrix** Setup: Use RetainerItemListWidget to set bazaarType 11, 12, 13, item seek, and repair seek. Expected: WorldManager.AddToBazaar accepts only valid modes and RetainerItemListWidget updates after package changes.
- **P2 Player trade edge cases** Setup: Two clients trade gil, rare/exclusive items, partial stacks, and cancel after one side accepts. Expected: No duplicated items, no stale SetTradeQuantity, and correct messages for full/unique/gil-cap failures.
- **P2 Retainer dispatch visibility** Setup: Enable eventTalkSelectBazaarStreet, choose a street, relog, and open RetainerListWidget. Expected: Retainer placeName/conditions persist and appear in status/location rows only if RetainerGroup is populated.
- **P2 Auction house lock collision** Setup: Open web auction sell page while the same retainer is spawned at a bell. Expected: Lock blocks listing operations or bell access consistently; no simultaneous DB item move.
- **P3 PC search operator actions** Setup: Run player search, select a result, test tell, party invite, and request join. Expected: Packet results populate UI; operator commands call local social/party paths or fail harmlessly.

## 2026-06-21 Package/Search Evidence Addendum

- `0x0131` package request is still too broad: the receive packet parses only `actorID` and `packageId`, and the dispatcher can send packages for any found world actor before spawned-retainer fallback. Missing gates: ownership, current event, distance, visibility, and package allowlist by owner type.
- Client package `8` is only partially bridged. Packet lookup can resolve `8 -> 7` for retainer bazaar storage, but outbound full sends and delta sends still need to emit client code `8`; direct Lua `GetItemPackage(8)` still has no alias because retainers create backend package `7`.
- Local `retainer.lua` trusts widget-returned package ids before dereferencing. Recovered `RetainerItemListWidget` returns bazaar/reward package fields, so all package ids from that widget need server-side context validation.
- Bazaar actor ownership remains the sharp transaction risk: Lua deal/undeal/trade scripts can choose the `bazaarActor` from client-provided values before backend owner checks run. Separate "backend validates item owner" from "caller is authorized to select this bazaar actor."
- `BazaarCheckCommand` should remain disabled until package `8` send/update order is proven; recovered `orderBazaarWidget(1)` validates a bazaar target and requests package `8`, but the local command is still intentionally off because it can freeze clients.
- Market/item search is still dormant. `MarketEntrance` hides item search, item/retainer packet registrations are commented, and `RetainerResultBodyPacket` is empty. Player search is live, but malformed player search still needs a reject path because invalid requests can match all candidates.
- The web auction house is a separate market implementation. It is useful, but it is not evidence that original client `ItemSearchWidget` or retainer result packets work.
