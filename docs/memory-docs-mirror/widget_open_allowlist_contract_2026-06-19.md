# WidgetOpenCommand allowlist contract (2026-06-19)

## Executive findings

- DAT `24228` maps to `WidgetOpenCommand` / `Open Widget`, and local `Data/scripts/commands/WidgetOpenCommand.lua` is present as a reject-only smoke.
- Recovered `WidgetOpenCommand` does exactly `require('/Widget/' .. arg)`, which makes a local copy unsafe without exact allowlisting.
- The current local Lua step is reject-only and should stay that way for now: EventRouteProbe records owner/params, the script rejects empty/path-like/system/unknown values, sends an error, and closes without opening widgets.
- Tier 1 candidates cover the immediate missing quest/content surfaces: dungeon execution, Hamlet HUD, caravan HUD, content reward, quest ask/detail/delivery/reward, and journal detail.
- Tier 2 candidates should remain context-gated behind Hamlet/guildleve/director state; tier 3 cutscene widgets belong to cutscene runtime, not a generic command.
- Do not allow static desktop/system widgets (`DesktopWidget`, `DesktopWidgetConnector`, `MainMenuWidget`, `WidgetBaseClass`) or low-level edit/transaction surfaces (`TradeEditWidget`, `ItemListWidget`, `BazaarListWidget`, `BazaarEditWidget`, `TradeWidget`, `RetainerTradeWidget`, `Ask/RetainerItemListWidget`) through this command.
- Broader mutation-heavy windows, including shops, materia, storage, repair, market/search, retainer, bazaar, and trade, must remain command-specific because they need item/package ownership, transaction APIs, or server-side result handlers.
- Local Hamlet code already probes widget containers directly, so WidgetOpenCommand tests must be logged separately from `_createWidgetInWidgetContainer`, direct `RunEventFunction`, and EventRouteProbe command-owner captures.

## Tier 1 Exact Load Arguments

- `RaidDungeonExecutionWidget` -> `RaidDungeonExecutionWidget` (legacy dungeon HUD): Requires content id and finish/server time.
- `HamletDefenseWidget` -> `HamletDefenseWidget` (Hamlet Defense HUD): Needs Hamlet data commands after opening.
- `ChocoboCaravanWidget` -> `ChocoboCaravanWidget` (Chocobo Caravan HUD): Needs caravan director UI data adapter.
- `Ask/ContentRewardWidget` -> `ContentRewardWidget` (content rewards): Requires content reward provider object.
- `Ask/QuestAskWidget` -> `QuestAskWidget` (quest ask): Requires quest id and event context.
- `Ask/QuestDetailWidget` -> `QuestDetailWidget` (quest detail): Requires quest id/detail data.
- `Ask/QuestDeliveryWidget` -> `QuestDeliveryWidget` (quest delivery): Requires inventory/delivery context.
- `Ask/QuestRewardWidget` -> `QuestRewardWidget` (quest reward): Requires quest reward args and mode.
- `Ask/JournalDetailWidget` -> `JournalDetailWidget` (journal detail): Requires journal/quest context.

## Tier 2 Context-Only

- `HamletDefensePopupWidget` -> `HamletDefensePopupWidget` (Hamlet popup)
- `Ask/HamletDefenseScoreWidget` -> `HamletDefenseScoreWidget` (Hamlet score)
- `Ask/HamletDefenseRankingWidget` -> `HamletDefenseRankingWidget` (Hamlet ranking)
- `Ask/HamletDefenseTutorialWidget` -> `HamletDefenseTutorialWidget` (Hamlet tutorial)
- `GuildleveExecutionWidget` -> `GuildleveExecutionWidget` (guildleve HUD)
- `Ask/GuildleveStartWidget` -> `GuildleveStartWidget` (guildleve start)
- `Ask/GuildleveSelectLevelWidget` -> `GuildleveSelectLevelWidget` (guildleve level)
- `Ask/GuildleveCardOrderWidget` -> `GuildleveCardOrderWidget` (guildleve card order)
- `Ask/GuildleveAreaOrderWidget` -> `GuildleveAreaOrderWidget` (guildleve area order)
- `GuildleveHistoryWidget` -> `GuildleveHistoryWidget` (guildleve history)

## Tier 3 Excluded For Now

- `CutsceneSkipWidget` -> `CutsceneSkipWidget` (cutscene skip)
- `CutsceneSkipWarningWidget` -> `CutsceneSkipWarningWidget` (cutscene skip warning)
- `Ask/JournalListWidget` mode `7` -> replay parent journal selector (cutscene replay)
- `Ask/ReplayCutsceneSelectWidget` -> `ReplayCutsceneSelectWidget` (cutscene replay)

## Safety Rules

- Exact allowlist only: Map exact load arguments to exact recovered widget paths. Do not concatenate unchecked user/event strings into require.
- Path traversal rejection: Reject values containing '..', backslash, leading slash, repeated slash, or file extension suffixes.
- Tier gates: Tier 1 can be tested first. Tier 2 requires matching content/director context. Tier 3 belongs to specialized runtime flows.
- No Desktop/MainMenu/System widgets: Never allow DesktopWidget, DesktopWidgetConnector, MainMenuWidget, WidgetBaseClass, or low-level edit/transaction widgets through WidgetOpenCommand.
- Pending context required: Every allowed future open needs expected widget, expected owner/director, player/session binding, TTL, exact argument shape, schema id, mutation policy, and a server-owned result handler.
- Context binding: Create the pending context before `RunEventFunction` and bind it to the exact owner actor, event name/type, function name, widget load arg, source actor/director, optional quest/content id, and an idempotency key. Do not alter recovered widget args with a nonce unless that widget is proven to echo it.
- Result validation: On `0x012E`, reject expired, consumed, owner-mismatched, trigger-mismatched, widget-mismatched, or schema-mismatched results before resuming mutation-capable code. Consume the context before the handler mutates.
- Quest/reward asks: Active quest/content coroutines own results; client result data must never mutate inventory/rewards/currency until the server revalidates. `QuestRewardWidget` is acknowledgement-only, `ContentRewardWidget` is confirm/cancel only, and `QuestDeliveryWidget` selected item tuples must be re-resolved from server inventory.
- HUDs: Active content directors own all data updates; WidgetOpenCommand may only enter a validated HUD context, not drive progress/status/reward state itself.

## 2026-06-21 Static/Client Exclusion Update

- `WidgetOpenCommand` exists locally and should remain reject-only until a pending-context allowlist exists. Recovered client behavior is raw `require('/Widget/' .. arg)`, so any future open must be exact-string, owner-bound, and result-schema-bound.
- Static desktop slots and always-on client panels are not missing server windows: `PlayerParameterWidget`, `TargetParameterWidget`, `PartyParameterWidget`, `StatusEffectWidget`, `MiniMapWidget`, `PublicInformDialogWidget`, `CaptionWidget`, `NpcSayWidget`, `ErrorDialogWidget`, `WarningDialogWidget`, `AchievementPopupWidget`, `ActionMenuWidget`, `EquipWidget`, `ItemListWidget`, `ItemUseWidget`, `SortChangeWidget`, config widgets, and macro widgets should stay excluded.
- Tutorial/help and scenario overlays need owner proof before any allowlist work: `JobTutorialWidget`, `TutorialWidget`, `TutorialModeSelectWidget`, `TutorialSuccessWidget`, `PopupHelpWidget`, `CastrumNovumMapWidget`, `ExtraBossInfomationWidget`, and `JobQuestInformationWidget` are display surfaces, not authority by themselves.
- Cutscene skip/replay stays runtime-owned: skip widgets require a live cutscene actor, and replay selection belongs to inn `PopulaceCutscenePlayer` plus `JournalListWidget` mode `7`.
- Transaction and selector windows remain command/NPC specific, not generic opens: shops, storage, support, retainer, market, materia removal, repair, bazaar, trade, loot, quest delivery, and seasonal reward selectors all need server-side re-resolution before mutation.
- Social/support/status widgets stay owner or packet routed: `SupportDeskWidget`, `CommunityMenuWidget`, `PartyRootWidget`, `PcSearchWidget`, `AchievementListWidget`, and `AchievementTitleListWidget` should not be opened through generic `WidgetOpenCommand`.
- The focused commerce/custom-window follow-up is now split into `docs/npc_shop_custom_exchange_surface_contract_2026-06-21.md`; use that for shop/exchange selector risks instead of widening this allowlist.

## 2026-06-21 Helper Wave Safety Update

- Local `WidgetOpenCommand` is still correctly fail-closed. The recovered client performs dynamic widget loading from the argument string, so exact allowlist, owner binding, and pending result schema are prerequisites, not polish.
- Ask/select widgets now have clearer result roles: `QuestAskWidget` is approve/refuse, `ContentRewardWidget` is confirm/cancel, `QuestRewardWidget` is acknowledgement-only, `RewardSelectWidget` returns an index or cancel, and `QuestDeliveryWidget` returns an item tuple that must be server re-resolved.
- Do not add commerce, retainer, bazaar, market, storage, support, repair, materia-removal, loot, or seasonal reward widgets to this generic path. They are transaction surfaces and belong to their owning NPC/command/packet flows.
- Hamlet and caravan HUDs are content-information/director surfaces. `0x01A8` Hamlet score and `0x01A6` Hamlet ranking are data receivers, not generic widget openers.
- Cutscene skip/replay stays runtime-owned. Replay has a native inn owner path through `JournalListWidget` mode `7`; skip requires a live cutscene owner/static slot and should not be synthesized by command `24228`.

## Probe Queue

1. Keep reject-only smoke and capture rejected `24228` values with owner `0xA0F05EA4` and path `/Command/System/WidgetOpenCommand`.
2. First HUD probe: `RaidDungeonExecutionWidget`, because args are narrow: content id plus finish/server time.
3. Then `ChocoboCaravanWidget`, only via active `CaravanGuardDirector` kind `2` data.
4. Then `HamletDefenseWidget`, after separating WidgetOpen logs from existing container/direct probes.
5. First asks: `Ask/QuestDetailWidget` and `Ask/JournalDetailWidget`.
6. Then `Ask/QuestAskWidget`.
7. Then reward/delivery asks: `Ask/ContentRewardWidget`, `Ask/QuestRewardWidget`, `Ask/QuestDeliveryWidget`.
8. Last: Hamlet score/ranking/tutorial and guildleve widgets.
9. Keep cutscene skip/replay, including `Ask/JournalListWidget` mode `7`, and all generic desktop/transaction/edit widgets excluded.

## Generated artifacts

- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/widget_function_contracts.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/widget_allowlist_matrix.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/local_open_call_matrix.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/unsafe_input_rejection_contract.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/widget_open_allowlist_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 37 / 37
- Source term hits: 484
- Widget function contracts: 240
- Allowlist rows: 22
- Local open call rows: 50
- Safety rules: 4
- Probe rows: 5

## 2026-06-21 Exclusion Reinforcement

- Keep support desk, social, player-search, party-manager, and linkshell widgets excluded from raw `WidgetOpen`. Recovered widgets issue real operator actions such as tell, party invite/request, leave/disband/leader/kick, appoint/kick/resign, and linkshell invite.
- Keep `ContentRewardWidget`, `QuestRewardWidget`, `RewardSelectWidget`, and `QuestDeliveryWidget` owner/provider-routed only. Their return values are UI results, not authority to grant items or complete content.
- Keep `AetheryteListWidget`, `GuildleveExecutionWidget`, `GuildleveAreaOrderWidget`, `GuildleveCardOrderWidget`, and `GuildleveStartWidget` behind teleport/aetheryte/publisher/director ownership.
- Keep replay/skip surfaces excluded: `ReplayCutsceneSelectWidget`, `JournalListWidget` mode `7`, `CutSceneSkipWidget`, and `CutSceneSkipWarningWidget` depend on live cutscene/replay owner state.
- Retainer/bazaar/storage/package widgets remain excluded until package aliases, outbound client package codes, ownership, distance/current-event gates, and transaction rollback behavior are validated.
- Keep GC shop/status/join/official-join/supply windows excluded from generic `WidgetOpen`. They are owner-routed company surfaces and require company, rank, seal, row, and delivery context validation.
