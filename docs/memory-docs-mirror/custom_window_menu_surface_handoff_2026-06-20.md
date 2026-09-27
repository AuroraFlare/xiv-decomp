# Custom Window/Menu Surface Handoff - 2026-06-20

This page tracks client-facing windows, menus, shops, HUDs, and ask widgets found during the quest/content decomp pass. The important rule: a recovered widget name is not the same thing as a safe server feature. Most windows need a specific quest, NPC, command, content director, or packet owner before they should be opened.

## Current answer

Yes, custom windows are a real lane. The client has many recovered windows we can use or mirror: quest ask/detail/delivery/reward windows, content reward windows, dungeon/Hamlet/caravan HUDs, shop buy/sell windows, retainer/bazaar/trade windows, materia and repair windows, storage windows, market/search windows, cutscene replay selectors, naming/timer widgets, crafting/gathering windows, negotiation/parley windows, bonus point assignment, achievement/title lists, party/community widgets, GC status, countdown confirmations, and client/static config or macro surfaces.

The safe path is not a universal `WidgetOpenCommand`. The safe path is to make each window owned by the proper local event or command bridge, validate the returned result on the server, and only then mutate inventory, rewards, currency, instance state, or quest state.

## Found windows and current status

| Surface | Recovered/custom windows | Local status | Main blocker |
| --- | --- | --- | --- |
| Quest dialogue/reward | `Ask/QuestAskWidget`, `Ask/QuestDetailWidget`, `Ask/QuestDeliveryWidget`, `Ask/QuestRewardWidget`, `Ask/JournalDetailWidget`, `Ask/ContentRewardWidget` | Partly bridged by quest scripts and reward contracts; server-owned accept/complete/reward gates exist; `spl101` now uses a thin item-select bridge; guildleve start/reward/chest flow is locally wired | Pending quest-widget context validation is missing; QuestReward/ContentReward are display-confirm shells; QuestDelivery must re-resolve owned item/package/count/HQ/materia/capacity before mutation; guildleve edge probes still needed |
| Dungeon/raid/trial HUD | `RaidDungeonExecutionWidget`, content reward/result windows, public effect widgets | Local instance/private-area and dungeon director plumbing exists; `RaidDungeonExit`/`InstanceRaidExit` scripts and return-point cleanup exist; AV/Cutter IDs/zones are known | `ContentCommand` work-sync, GM-only lifecycle probe, live director/widget validation, unbound exit actor placement, and clear/fail/result finalization are still missing |
| Hamlet Defense | `HamletDefenseWidget`, `HamletDefensePopupWidget`, `Ask/HamletDefenseScoreWidget`, `Ask/HamletDefenseRankingWidget`, `Ask/HamletDefenseTutorialWidget`, `Ask/QuestDeliveryWidget` | Noc002 read-only menu/error bridge exists; Hamlet supply preview exists; local C# seeds HUD subtype `3-9` and native score/ranking packets | Active-director HUD validation, subtype `1/2/10`, non-empty ranking gating, captain actor mapping, live preview validation, low-permission `!testhamlet`, unproven `ClaimReward`, and mutation gates remain missing |
| Chocobo caravan | `ChocoboCaravanWidget`, `ChocoboNamingWidget`, `ChocoboRentalTimerWidget` | Caravan director mirrors retail kind `2` work fields; manager/guide/guard/adviser bridges, `RegionalCaravan`, `!testcaravan`, and movement backend exist; chocobo naming is locally wired/persisted; rental backend sends expiry data | Live HUD validation, exact route data, guard command effects beyond placeholder logging, three-chocobo HP/status/damage/escape, escort `npcHP`, rental-timer UI callback proof, name encoding, contribution/cargo/rewards remain missing |
| Cutscene replay/skip | `CutSceneSkipWidget`, `CutSceneSkipWarningWidget`, `Ask/ReplayCutsceneSelectWidget`, `Ask/JournalListWidget` mode `7` | Skip/replay contracts are documented; replay book now uses `questScenarioComplete`; `PopulaceCutscenePlayer` bridges to recovered client replay methods | Skip is runtime-only and must not be WidgetOpen; live replay validation and row-accuracy probes are still missing |
| Shops | `Ask/ShopBuyWidget`, `Ask/ShopSellWidget`, `Ask/GrandCompanyShopWidget`, `Ask/RewardSelectWidget`, guild shop menus | Ordinary shops, guild mark shops, and hard-coded GC shops are locally implemented through Lua tables and `shop_prices.lua`; Rowena recovered menus are known | P0 transaction hardening: multi-buy quantity charging, sell final revalidation/remove-before-credit, GC rank/city/special masks, black-market field order/seal cap, Hamlet tier, and server-validated Rowena/primal token transactions |
| Materia | `Ask/MateriaRemoveWidget`, `Ask/MateriaDialogWidget`, `Ask/MateriaInformWidget`, attach/warning/caution widgets | Attach/materialize backend and commands exist; remover widgets are mapped; `InventoryItem.ClearMateria` can zero persisted slots | Safe `Player` preview/commit API, retail command id capture, gil validation, and equipped-stat refresh are missing |
| Repair | `RepairEquipmentWidget`, `RepairEquipmentDialogWidget`, repair command flow | NPC repair backend and local repairer script are present; repair-all/single repair are substantially implemented; recovered `24243/24244` command contracts are identified | Player-to-player repair command scripts, fulfillment backend, route probes, transaction/idempotency, and UI index/page probes remain |
| Storage | `Ask/ItemStoragePutWidget`, `Ask/ItemStorageGetWidget` | Recovered widgets expect `_countStoredItem`/`_getStoredItem`; local inn script currently `RemoveItem`/`AddItem`s catalog ids only and retrieve can mint selected catalog ids; `SetPlayerItemStoragePacket` opcode `0x01A5` exists but is dormant | Persistent item-instance storage table/API, entitlement checks, category/slot return-param probe, packet lifecycle, full-inventory reject, and HQ/materia/unique preservation are missing |
| Retainers | `RetainerTradeWidget`, `RetainerItemListWidget`, `RetainerListWidget`, `RetainerNamingWidget`, `RetainerDismissalWidget` | Retainer spawn/despawn, hire/dismiss, item transfer, and bazaar backend mostly exist; trade/list return codes match local Lua loops | Market dispatch/community group backing, package `8` lookup/send consistency, and richer widget mode coverage need probes |
| Bazaar/trade | `BazaarListWidget`, `BazaarEditWidget`, `TradeWidget`, `TradeEditWidget` | Player trade is relatively healthy; bazaar add/remove/buy/sell backend exists | `BazaarCheckCommand` open path is disabled because it froze characters; fix/probe package `8`, command-issuer bazaar ownership, trade special-state rejects, target actor validation, and update ordering before any browse/check re-enable |
| Market/search | `ItemSearchWidget`, `PcSearchWidget`, `PcSearchSelectWidget`, `MarketSelectWidget`, `MarketStand` | Player search packets exist; MarketEntrance can move players to wards; recovered `MarketStand` exists in decomp output | Item/retainer search packets are dormant; local `MarketStand.lua` is missing; item search counter is hidden; original client search is not wired to the web auction-house layer |
| Terminals/gimmicks | Generic terminal text, magitek transporter/warp asks, dungeon warp/exit prompts | Toto-Rak photocells/barriers/posters are locally scripted; GimmickTerminal is read-only; RaidDungeonWarp is partially bridged | `TalkCommand` and `PlaceDrivenCommand` captures plus magitek transporter binding/destination proof are needed before broad binding |
| Crafting | `CraftStartWidget`, `CraftEditWidget`, `CraftRecipeWidget`, `CraftProgressWidget`, `CraftRepairWidget` | Local `CraftCommand` opens progress and recovered `CraftJudge` drives open/close/update paths; command `22001` and craft relation specials `22012/22016` are known leads | GM-only known-recipe probes, cancel/fail/full-inventory handling, and keeping entry through `CraftCommand`/`CraftJudge`, not WidgetOpen |
| Gathering | `Ask/MiningInputWidget`, `Ask/FellingInputWidget`, `Ask/FishingInputWidget` | Local `DummyCommand` delegates `openInputWidget`; recovered `HarvestJudge` opens/updates/selects/closes all three; command range `22002..22009` is known | Real gathering-point actor binding, input tuple logging, node-state validation, grade/remainder/server loot checks before grants |
| Negotiation/parley | `Ask/NegotiationListWidget`, `Ask/NegotiationAskWidget`, `Ask/NegotiationWidget`, `NegotiationMessageWidget` | Local `NegotiationCommand` has list/ask/open/input hooks; recovered `NegotiationJudge` drives widgets; likely special target path `29497` | Controlled target with negotiation enabled; no reward mutation until result/state validation exists |
| Character/status | `Ask/BonusPointAssignWidget`, `AchievementListWidget`, `AchievementDetailWidget`, `AchievementTitleListWidget`, `GrandCompanyStatusWidget` | Bonus point command locally saves allotments, and C# rejects negative, over-cap, overspent, and decreased allotments before saving | Reset/respec retail parity, title changes only after unlocked-title validation, and GC status staying read-only/profile remain open |
| Community/static client | `PartyRootWidget`, `PcMatchingFindWidget`, `PcMatchingViewWidget`, linkshell/address widgets, `Ask/WaitingCountdownWidget`, config/support/macro widgets | Party matching/content id docs exist; recovered main menu opens party/linkshell/config/support and config opens `UserMacroEditWidget`; logout/teleport use countdown widget | Open/update probes first; invite/kick/current-LS/title/config persistence and countdown cancel reasons need server permission/state checks |

## 2026-06-20 Custom Surface Owner Follow-up

- Crafting, gathering, and negotiation are owner-routed surfaces, not WidgetOpen candidates. Keep crafting on `CraftCommand`/`CraftJudge`, gathering on point/session ownership through `HarvestJudge`, and parley on `NegotiationCommand`/`NegotiationJudge` until tuple/result/reward semantics are captured.
- Bonus-point assignment is safer than the earlier table implied: `Player.SaveAttributePointAllotment` rejects negative, over-cap, overspent, and decreased allocations before saving. The remaining gaps are reset/respec retail parity, pending-widget context, and status/title validation.
- Achievement/title, linkshell/community, party, GC status, config, macro, and support surfaces should stay on their recovered main-menu/status/community owners. They are display or profile surfaces until a server permission/persistence path is proven.
- Countdown support is partly local through `ConfirmGroupCommand` and `0x00CF` countdown rebroadcast. Recovered `ConfirmWarpCommand` and `ConfirmRaiseCommand` are still missing locally and should remain confirm intent probes, not warp/raise authority.
- Market/search split tightened: recovered `MarketStand` exists in the decomp output, but local `Data/scripts/base/chara/npc/mapobj/MarketStand.lua` is absent. Player search is live; item and retainer search remain dormant with no request/result queue site.
- Next probes for this lane: `24304/24306` confirm payloads, gathering point/session tuples, negotiation result/reward tuples, and `MarketStand` check-bazaar/freeze behavior behind a GM/test gate.

## 2026-06-21 Owner-Family Checkpoint

- Owner routing rule still holds across the remaining custom families: crafting through `CraftCommand`/`CraftJudge`, gathering through `PlaceDrivenCommand`/harvest judge/session ownership, negotiation through `NegotiationCommand`/`NegotiationJudge`, bonus points through `BonusPointCommand`, achievements through achievement NPC/packet paths, party/linkshell through social command/world paths, support through support packets, and GC status through profile/status ownership.
- Passive display/read probes come first: achievement lists, party root, linkshell list, support FAQ, config open/close, GC status display, achievement progress `0x0135`, support ticket reads, and player search/profile.
- Owner-routed open/cancel probes are next: craft no-op/cancel, gathering point open without loot, negotiation open/close, and bonus-point cancel/no-op.
- Disposable DB lifecycle probes can follow for support ticket save/close, linkshell create/rename/crest/delete, and achievement category unlock.
- Real mutations stay last and must keep server validation: crafting success/fail/full-inventory, guildleve gathering objective increment, bonus point valid/invalid saves, party invite/kick/leader, and linkshell invite/kick/rank/current.
- Keep title writes, GC join/rank writes, real parley rewards, broad gathering loot, confirm warp/raise, and item/retainer search logging-only for now.

## 2026-06-21 Social/Gathering/Populace Checkpoint

- Titles/achievements: display/progress is implemented and `0x0135` progress reads are comparatively safe, but inbound title-change writes are still missing. Future title selection must require unlocked-title validation before writing state.
- Linkshell/community: create/invite/active/member backend paths exist, but widgets are not authority. Use read/list first, then disposable create/crest/delete, and only later invite/kick/current-LS mutations.
- Party/search: party core exists while recruitment/matching is partial or canned. `24204` `PartyJoinCommand`, `24209` `PartyAcceptCommand`, and `24239` request-join toggle stay logging-only until pending-invite validation is wired.
- Support desk: FAQ/body/issues/open/read paths are low-risk reads; ticket send/close mutates DB and needs malformed-packet/`invalidPacket` guard review before broad testing.
- Gathering: local non-guildleve gathering is a demo-shaped `DummyCommand` mining path only. Recovered `HarvestJudge` covers mining/felling/fishing command ids `22002/22003/22004`, but client-returned aim/strike/power/angle tuples are not loot authority until node/session/exhaustion/item-pool validation exists.
- Negotiation/parley: local command `29497` and `NegotiationCommand.lua` are seeded, but only as controlled open/input/cancel probes. No target validation, result authority, quest mutation, or reward path is production-safe.
- Inn/populace shells: replay is inn-owner-routed and storage is not safe. `ObjectItemStorage` still moves catalog ids without persistent item ownership; probe selector params only.
- GC/populace shells: company guide/buffer/officer/status are mostly read/menu shells, company warp bypasses ticket/pass checks, company shop/supply and special-event cryers can mutate currency/items without enough validation, and `PopulaceMenuMan` must remain debug-only.
- NPC shop/custom exchange risks now have a focused checkpoint in `docs/npc_shop_custom_exchange_surface_contract_2026-06-21.md`: black-market price indexes, GC shop nil/rank guards, stale shop sell slots, support invalid-packet checks, special-event seal cap/input consumption, Rowena pending exchange context, and inn storage persistence.

## 2026-06-21 Malformed Packet Checkpoint

- Several custom-window packet families parse an `invalidPacket` flag but still continue into handler logic. Document these as unsafe for public mutation probes until the dispatcher returns early on malformed packets.
- Support desk send/close mutate DB tickets and need explicit malformed-packet guards. FAQ/body/issues/open/read are passive DB reads but should still clamp malformed language/index values before lookup.
- Social list add/remove, achievement progress requests, recruitment/player-search requests, `PartySyncPacket`, and `LinkshellResultPacket` also need invalid-packet early returns. Player search is live and mostly in-memory, but malformed search requests can still enumerate connected sessions.
- Party join/accept and linkshell/community actions must stay pending-context/world-authority validated. Do not treat `PartyRootWidget`, `CommunityMenuWidget`, `PcSearchWidget`, `AchievementListWidget`, `AchievementTitleListWidget`, or `SupportDeskWidget` as generic `WidgetOpenCommand` targets.

## 2026-06-21 Client/Static Widget Sweep

- Recovered action/equipment/log/config/status/target/player panels (`ActionMenuWidget`, `EquipWidget`, `LogSettingWidget`, config subwidgets, `TargetParameterWidget`, player/profile widgets) are primarily desktop/static client UI. Do not treat them as missing quest/shop windows unless an EventStart owner or packet handler proves a server-owned mutation path.
- Display/effect widgets (`PublicInformDialogWidget`, `NpcSayWidget`, `SplashEffectWidget`, `ChainBonusEffectWidget`, `PartyBuffEffectWidget`, `StatusEffectWidget`, warning/error/common dialogs) are useful result/effect surfaces but not authority. Server code may trigger specific messages/effects, but raw WidgetOpen access stays blocked.
- Tutorial/help widgets are split: local `showTutorialSuccessWidget` is used by starter quest directors, while recovered `JobTutorialWidget`, `TutorialWidget`, and `TutorialModeSelectWidget` need owner proof before use outside debug/menu contexts.
- Content-specific display leads such as `CastrumNovumMapWidget` and `ExtraBossInfomationWidget` are recovered-only in the current sweep; no local owner or safe launch path was found. Keep them as future content-director display candidates, not generic custom-window targets.
- User macro/config surfaces appear client/local-config owned; recovered `MacroCommand` executes text commands, so server-side macro execution or persistence should remain blocked until a packet/owner path is captured.

## 2026-06-21 Helper Wave Routing Checkpoint

- Generic `WidgetOpenCommand` remains fail-closed. The next safe opens are director/HUD contexts only, not commerce/edit/support windows.
- `TalkCommand` and `ContentCommand` are still missing local command scripts and require C# owner/work-sync first: Talk needs target owner transfer from `0xA0F05E25`; Content needs `directorWork.contentCommand/contentCommandSub` mirrored to `playerWork.variableCommandContent/Sub`.
- Commerce/custom exchange selectors are owner-routed and transaction-gated: shops, GC supply, black market, Rowena/NM reward, special-event cryers, support, storage, repair, materia removal, retainer/bazaar, and loot all require pending context plus server re-resolution.
- Hamlet splits into five lanes: active-director HUD subtypes `3-9`, score packet `0x01A8`, ranking packet `0x01A6` empty-only, supply preview through `QuestDeliveryWidget`, and reward/select windows blocked from mutation.
- Caravan kind `2` HUD is real, but local backend still fans one bird/status into three retail lanes. Guard commands and rewards are presentation/log-only until independent HP/status/cargo/reward semantics are captured.
- Dungeon terminals split three ways: `GimmickTerminal` read-only text, `RaidDungeonWarp` magitek transporter with unresolved binding, and Toto-Rak photocell/barrier/poster object scripts with real local state. Do not merge those owners.
- Instance raid/trial content IDs and identity directors exist, but guide accept is not a launcher. AV/Cutter/primal/Rivenroad need content-area creation, director ownership, start/relogin, clear/fail/exit, and loot finalization before production entry.
- Malformed packet early returns are a cross-cutting blocker for support, social/community, search, and event/widget result paths.

## 2026-06-20 Owner Path Matrix

- Crafting: use `CraftCommand` plus `CraftJudge`; local recipe checks, ingredient consumption, result add, success handling, and gear wear exist, so next probes must be GM-only known-recipe cancel/fail/full-inventory flows.
- Gathering: use `DummyCommand`/`HarvestJudge` plus `PlaceDrivenCommand` target binding; gathering point DB/resolver exists, but reward grants should wait for node exhaustion, grade/remainder, and session authority proof.
- Negotiation/parley: use `NegotiationCommand`/`NegotiationJudge`; local hooks are demo/open/update/input/close only, so capture result tuples on one controlled target without reward mutation.
- Bonus points: local save validation is useful, but persistent stat mutation stays high-risk until cancel/no-op and reset/respec retail parity are captured.
- Achievement/title and GC status: treat as read/profile first; capture title-selection and official-join payloads separately, then require unlocked-title/affiliation validation before writes.
- Linkshell/community: backend create/rename/crest/delete/member paths exist; start with read/list/chat and disposable-DB lifecycle captures before enabling live invite/kick/rename flows.
- Countdown/confirm: local countdown rebroadcast exists; `24304` and `24306` should probe pending warp/raise state only and must not become direct warp/raise authority.
- Repair/order: NPC repair is wired, but `24243`/`24244` stay logging-only until player repair charge, fulfillment, ownership, and retry semantics are idempotent.
- Player search/support/config: player search and support FAQ/ticket packets are wired; item/retainer search is dormant, support tickets need sanitization, and config appears client/user-config owned until packet capture proves server persistence.

## Safe local support today

- Local shops can open buy/sell flows through `Data/scripts/base/chara/npc/populace/shop/PopulaceShopSalesman.lua`, `Data/scripts/shop.lua`, and `Data/scripts/shop_prices.lua`.
- Local retainer item transfer and retainer bazaar edit loops exist in `Data/scripts/retainer.lua`.
- Player-to-player trade command/backend coverage is much stronger than market search or bazaar browsing.
- Materia attach/materialize has command/backend support through `MateriaMeldCommand`, `MateriaMeldRateCommand`, and `ItemMaterializeCommand`.
- NPC repair is wired locally; player repair-order/execution command ids `24243/24244` are now logging-only probe targets, and fulfillment/transaction behavior still needs care.
- Caravan HUD work fields are seeded for `ChocoboCaravanWidget`, and local manager/guide/guard/adviser bridges exist. Guard commands currently validate/log and send a no-effect message; live client validation and real calm/feed/callback effects are still pending. Chocobo naming already opens the recovered widget and persists to the local chocobo table; the rental timer UI remains unproven.
- Hamlet Noc002 is safe as a read-only/error-feedback bridge, and PopulaceHamletSupply can now preview `Ask/QuestDeliveryWidget` selections without mutation.
- PopulaceCutscenePlayer can now hand off to recovered client replay prompt/playback methods from its local NPC script; the replay book packet now uses quest-scenario completion bits instead of all-true placeholder data.
- `WidgetOpenCommand` exists only as a reject-only probe, which is the correct current safety posture. Future candidates must be exact-string, context-owned opens: HUDs first, then quest/journal detail asks, then reward/delivery asks. Crafting, gathering, negotiation, bonus points, achievements, community widgets, GC status, countdown confirmations, config, macro, and support surfaces should stay on their owning command/judge/status paths.

## 2026-06-20 Support / Community / Search Packet Notes

- Achievement progress read is packet-backed and comparatively safe (`0x0135` -> progress response), but gameplay achievement unlock/progress writes mutate `characters_achievements` and `characters.achievementPoints`.
- Support desk FAQ/body/issues/open-ticket/read-ticket paths are DB-backed read probes. Sending and closing tickets mutate DB rows, and malformed packet constructors can mark `invalidPacket` without every handler checking it.
- Player search is live and in-memory: profile update plus search requests return begin/info/comment packets over connected sessions. Item/retainer search remains dormant and should stay hidden; `retainer_search_enabled=false` is read from config but no handler gate was found around the item/retainer search opcode family.
- Community/social lists are DB-backed and mutating. Even read paths can run first-use table creation/alteration, and add/remove paths can crash or misbehave on null names if packet validation is ignored.
- Recruitment/community matching is mostly stubbed or canned. Use it only after passive/read probes, and do not treat returned local character details as proof of full backend support.
- Title display is loaded and emitted, but no inbound title-change handler was found. Any future title-selection window must require unlocked-title validation before writing state.

## 2026-06-20 Missing Surface Classification Addendum

- `MarketEntrance` is implemented travel. `MarketStand`, item search, and retainer search remain missing/dormant packet-backed market surfaces, not generic custom-window candidates.
- Linkshell and party manager flows have server-owned command/world-group backends, but linkshell/party/search submenu widgets are pure client windows unless they are reached through those owner paths.
- `ItemSplitCommand`, `ItemStuffCommand`, and `QuestDeliveryWidget` are server-owned inventory/quest surfaces once implemented; `SplashEffectWidget` is a client effect/widget lead only.
- Achievement unlock/progress is implemented through DB/packet/Lua triggers, but title change is still missing even though title display packets exist.
- Storage is implemented but unsafe/dormant: current inn storage moves catalog ids rather than item instances, and must stay out of production until stored-item persistence and `0x01A5` behavior are designed.
- Owner-routed UI opens that can be probed before mutation include NPC shops, NPC repair, aetherytes, inn exit, MarketEntrance, and PopulaceCutscenePlayer. Mutating paths such as buy/sell, GC shop, black market, storage put/get, player repair request, title change, item split/stuff, delivery rewards, and teleport/return anima consumption need validation/idempotency first.

## Still missing or unsafe

- Generic custom-window opening through `WidgetOpenCommand` is not safe yet. Exact allowlists, owner proof, per-player pending context, TTL, argument shape checks, and server-owned result handlers are still missing; desktop/system/edit/transaction widgets and cutscene skip/replay stay excluded.
- `TalkCommand` is still the main blocker for generic NPC/terminal/menu entry, and it needs C#-anchored target/event-owner handling: strict owner `24101` / `0xA0F05E25`, target-slot resolution, owner transfer before `Player.StartEvent`, row `25081` on range failure, and no generic routing for object-owned dungeon scripts.
- `ContentCommand` is still the main blocker for retail-shaped dungeon/trial/Hamlet/caravan action icons; `DirectorWork`, `playerWork.variableCommandContent/Sub`, and packet-reflector handling for `directorWork` are missing.
- `PlaceDrivenCommand` still needs exact magitek/touch terminal captures; candidate transporter actor classes `1200373..1200375` are not spawned locally and remain only model/appearance leads until real in-dungeon EventStart ownership is captured.
- Item storage needs persistent item-instance storage before use, especially for HQ/melded/unique items. The current local inn script is a catalog-id add/remove stub and retrieve can mint selected catalog ids; it must not be used for real storage until `_countStoredItem`/`_getStoredItem`-style APIs, entitlement checks, category/slot persistence, capacity rejects, and opcode `0x01A5` behavior are understood.
- Materia removal needs a preview-first server API before enabling mutation: select package-1 gear with attached materia, compute confirm args, then only later clear slots after retail command-id and gil behavior are captured.
- Bazaar browsing/checking is intentionally disabled until the freeze is reproduced and fixed around `orderBazaarWidget(1)`, package `8`, target actor cleanup, command-issuer bazaar ownership, and retainer-bazaar package refresh/update ordering. Trade must also reject special-state items before adding them to a trade.
- MarketStand and original client item/retainer search are not implemented locally; keep `retainer_search_enabled` and the item-search counter disabled until packet row layouts and result queueing are captured.
- Cutscene replay needs live validation of the new `PopulaceCutscenePlayer` bridge and replay-book row accuracy before it is more than a UI shell. Logging-only route probe coverage now includes `24211`, `24212`, `24241`, and `24312`; keep `ReplayCutsceneSelectWidget` bound to inn/replay-book context, not generic WidgetOpen.
- Quest/content/seasonal reward windows must remain display/result surfaces; grants should happen only after server-side validation resumes the event. Guildleve completion already follows this pattern through `GuildleveWarpPoint` and `GrantGuildleveCompletionRewards`, but cancel/full-inventory/duplicate/chest edge probes remain. `Cul400` is now scaffolded locally, but the recovered direct cutscenes still need a real server sequence before retail parity, and no verified local reward row exists for quest `110443`. Seasonal `spl0i1`/`spl0i2`/`spl102` and Rowena token exchanges need explicit server-side count/capacity/add/remove transaction validation before any write path; `spl0i3` must avoid `CompleteQuest(110801)` because local C# would auto-grant Reindeer gear from SQL reward rows.
- Loot-list UI needs a package bridge first: recovered client package `5` conflicts with local `MELDREQUEST`, while local loot is package `4`. The safe direction is a narrow client-5-to-backend-LOOT mapping for loot display/commands, not global package renumbering. Duty-exit loot transfer/discard should stay closed until dungeon clear/fail/exit finalization is validated.

## Related docs

- [WidgetOpenCommand allowlist contract](widget_open_allowlist_contract_2026-06-19.md)
- [Terminal/widget command bridge contract](terminal_widget_command_bridge_contract_2026-06-19.md)
- [Materia, shop, storage, and repair widget contract](materia_shop_storage_widget_contract_2026-06-19.md)
- [Retainer, bazaar, trade, market, and search contract](retainer_bazaar_market_contract_2026-06-19.md)
- [Reward / inventory / chest contract](reward_inventory_chest_contract_2026-06-19.md)
- [Hamlet supply / Noc002 contract](hamlet_supply_noc002_contract_2026-06-19.md)
- [Chocobo caravan HUD adapter contract](chocobo_caravan_hud_adapter_contract_2026-06-19.md)
- [Cutscene replay/skip widget contract](cutscene_replay_skip_widget_contract_2026-06-19.md)
- [Private-area base/content/occupancy contract](private_area_base_content_contract_2026-06-19.md)
- [NPC shop/custom exchange surface contract](npc_shop_custom_exchange_surface_contract_2026-06-21.md)

## Best next decomp targets

1. `TalkCommand`: capture target params and implement strict C# owner-transfer routing for NPCs, terminals, shops, and quest entry, while leaving object-owned dungeon scripts on their own owners.
2. `ContentCommand`: expose `directorWork`/`playerWork` content command work-sync and packet-reflector support before adding Lua guard/delegate behavior.
3. `WidgetOpenCommand`: keep reject-only, then stage HUD-only probes (`RaidDungeonExecutionWidget`, `ChocoboCaravanWidget`, `HamletDefenseWidget`) behind active director context. For Hamlet, validate subtype `3-9` before subtype `1/2/10`, then keep score/ranking/tutorial separate.
4. `PopulaceHamletSupply`: validate the preview-only delivery widget path, then add inventory/anima/supply-point validation before mutation.
5. `PopulaceCutscenePlayer`: live-validate the replay bridge and quest-completion-backed replay bits.
6. Retainer bazaar package bridge: preserve client package code `8` on retainer-bazaar sends and add an `8 -> 7` lookup path for Lua/package access before browse/check work.
7. `MarketStand` and `BazaarCheckCommand`: reproduce the freeze, then re-enable only behind a GM/test gate with validated actor/package/update order.
8. `ChocoboCaravanWidget`: validate kind `2` HUD open/update packets against a live caravan, then separately probe guard command effects and pending guide rewards.
9. Loot-list package bridge: map/probe recovered client package `5` to local loot before raid/trial reward UI.
10. `Cul400`: move from scaffold to sequence-gated dialogue/cutscene parity only after objective/marker capture; do not synthesize rewards for `110443` without verified server rows/packets.
11. Repair probes: logging-only `24243/24244` coverage is now in the EventRouteProbe list; next resolve `MODE_SEEK_REPAIR` staging, fulfillment, and debit/retry semantics before wiring player-to-player repair.
12. `ObjectItemStorage`: design persistent stored-item handling before opening storage windows broadly; start by probing Put/Get return params and whether `0x01A5` category enablement is required.
13. Craft/gather/negotiation/status widgets: probe through `CraftCommand`/`CraftJudge`, harvest judges, `NegotiationCommand`, `BonusPointCommand`, status/main-menu owners, and countdown system commands; do not add them to generic WidgetOpen.
14. Chocobo rental/naming polish: verify slot `23` timer activation from `0x0197`, validate actor `1090464` against the new no-op `ChocoboStop.lua`, validate restricted-call rows (`26002` chocobo, `26020` goobbue), and avoid non-ASCII name corruption before widening name input.

## 2026-06-21 Missing Surface Rollup

- `WidgetOpenCommand` remains reject-only. Do not add replay/skip, support, social, party, linkshell, retainer, bazaar, market, guildleve, aetheryte, Hamlet, caravan, raid, or reward widgets to a generic allowlist.
- Support desk packets `0x01D0`, `0x01D1`, `0x01D2`, and `0x01D5` parse malformed flags but handlers still read or save request data. Close-ticket `0x01D6` has no parsed request packet and closes by player name, so it needs pending/open-ticket context rather than an `invalidPacket` check alone.
- Social add/remove handlers and player search still need malformed handling. Player search is especially sharp because malformed search can still enumerate candidates after result code changes.
- Party/world packet handlers `0x1020..0x1023` execute defaulted actions when malformed; `PartyLeavePacket` can become a leave request with `isDisband=false`. Linkshell is mostly guarded, but invite-cancel still depends on pending relation/session validation.
- `EventStartPacket` and `EventUpdatePacket` still route into event handling even when malformed, and `WorkSyncRequestPacket` parses an actor id but the handler dispatches by property name. This is why recovered `TalkCommand` and `ContentCommand` behavior should wait for current-event owner guards.
- Dungeon surfaces are split: `GimmickTerminal` is read-only and still binding-unresolved, `RaidDungeonWarp` is a prompt/destination helper with fallback warnings, Toto-Rak objects have active local state, and recovered treasure/headcount is absent locally.
- Company warp is an owner-routed custom surface separate from airship/ferry. It should stay behind actor/pass checks, not a generic window route.
- `_WAIT_EVENT`/`EventUpdate` is currently authority-loose: a client result can resume the player's waiter without enough owner/name/type/trigger/widget/schema validation. This is the blocker for mutation-capable custom windows, even when the recovered widget result shape is known.
- Inn exit/replay is an owner-routed surface, but inn storage is not safe by association. Storage widgets stay transaction-blocked until item-instance persistence and pending storage contexts exist.
- GC shop/status/join/supply, support/social/player-search/party/linkshell, repair, storage, materia removal, and retainer/bazaar windows remain excluded from raw `WidgetOpen`.
