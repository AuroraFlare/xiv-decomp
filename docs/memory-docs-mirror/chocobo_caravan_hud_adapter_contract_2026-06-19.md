# Chocobo Caravan HUD adapter contract (2026-06-19)

This pass narrows the caravan work to the retail HUD adapter. Local code moves a path companion, computes route progress, and seeds the `CaravanGuardDirector` content-information kind `2` work-sync provider consumed by `ChocoboCaravanWidget`; the remaining bridge is live validation plus reward/result polish.

## Executive findings

- Recovered `CaravanGuardDirector.getKindContentsInformation()` returns `2`; `DesktopWidget.processUpdateContentsInformation` maps kind `2` to `ChocoboCaravanWidget`.
- The retail HUD provider syncs `step`, `progressPer`, `finishTime`, `chocoboStatus[3]`, `chocoboHPStatus[3]`, and `markerX/Y/Z[3]`; local code now mirrors these fields while keeping `guildleveWork` fallback packets.
- Active HUD starts at step `70`; progress/status/HP update indices are `1`, `2`, and `3`; finish paths are step `80`/`90` or finalize cleanup.
- Status values are concrete: `1` walk, `2` stop, `3` flight, `4` escaped, `5` return; HP values are `1` normal, `2` caution, `3` danger.
- `RegionalCaravan.lua` now returns `/Director/CaravanGuard/CaravanGuardDirector`; `GuildleveExecutionWidget` parity is fallback plumbing, not the primary caravan HUD contract.
- Local `ChocoboCaravanDirector` is real enough for live HUD probes: it validates routes, spawns a path companion, moves through waypoints, updates progress, completes/fails, captures pending guide result data, and syncs the retail HUD fields.
- Guard command menus are wired but effects are placeholder-only: calm/feed/callback validate the active director/chocobo, log `[ChocoboCaravanCommand]`, and send a no-effect message; HP/status/cargo/escape/feed-item mutation is not implemented.
- Route and reward data remain provisional: local routes do not yet carry the six retail party-matching route/place pairs, static pack-chocobo rows are not command-capable, and contribution thresholds, cargo loss, party eligibility, GC seals, item reward tables, and relic reward rolls are still missing.

## 2026-06-20 Route, Reward, And Chocobo Tail Addendum

- Route evidence is split: local manager seeds four provisional routes (`1500213` Wineport `1031 -> 1030` actor `2210501`, `1500214` Quarrymill `2004 -> 2003` actor `2210504`, `1500215` Silver Bazaar `3043 -> 3044` actor `2210507`, `1500284` Aleport/high route `1030 -> 1031` actor `2210510`), while recovered party matching exposes six route/place pairs (`1280005 -> 1031`, `1280003 -> 1030`, `1280066 -> 2004`, `1280073 -> 2003`, `1280034 -> 3043`, `1280033 -> 3044`).
- Guard command UI is exact enough for probes: text bank `7680`, menu row `1`, choice `2` opens feed row `6` with four choices and returns command/feed-choice. Local calm/feed/callback remain validate/log/no-effect only.
- Reward evidence is dialogue/API-shaped, not grant-shaped: `caravanGuardReward(cargo, nil, areaGC, playerGC, killCount, areaNameOffset)` branches cargo `0`, `1..5`, `6..8`, `9`; kill-count message thresholds `40..49` and `50+` have extra text. No contribution formula, cargo-loss rule, seal/item table, or transaction timing is recovered.
- Chocobo support surfaces are identified but still need live proof: opcode `0x0197` writes rental expiry/min-left/appearance, DesktopWidget static slot `23` is `ChocoboRentalTimerWidget`, and `processRentalChocobo(expireTime)` shows the timer.
- `ChocoboNamingWidget` confirms through row `7015`, returns a converted name only on positive confirm, and returns empty string on cancel/close. Non-Chinese names allow `A-Z a-z`, max `10`, decision enabled at length `>=3`; Chinese uses IME/ZenHan length `3..4` plus `IsValidFirst`.
- Recovered `ChocoboRideCommand` gates command `12014` through area `_canRideChocobo`, `_isWarpRideChocobo`, `_isPushingOut`, and rows `26002` chocobo / `26020` goobbue. Local row split is correct, but the retail judge/static actor `320013` bridge is still missing.

## Work Sync Contract

| field | scope | type | contract | local_source |
| --- | --- | --- | --- | --- |
| uiStep | work._temp | integer8 | Client-side UI lifecycle flag; starts at 0, becomes 1 when step 70 starts HUD, returns to 0 on finish/finalize. | ChocoboCaravanWork now carries this field; live client validation is still pending. |
| isFinished | work._temp | boolean | Prevents unclean-finalize public effect 13 when retail finish/fail step ran. | hasEnded bool is similar but not synced to client. |
| town | work._temp | integer8 | Grand Company/town selector for icon and effects 14-19. | ChocoboCaravanRoute now carries town/place/name metadata. |
| placeStart | work._temp | integer16 | Departure place text id for getUIDataOpen. | ChocoboCaravanRoute now carries town/place/name metadata. |
| placeEnd | work._temp | integer16 | Destination place text id for getUIDataOpen. | ChocoboCaravanRoute now carries town/place/name metadata. |
| name1/name2/name3 | work._temp | integer32 | Optional pack-chocobo/name text ids; widget sets each with text row 7304 when non-nil. | Route only has DisplayName string. |
| step | work._sync tag step | integer8 | Retail phase driver: 30 marker, 40 town start effect, 70 active HUD, 80 town finish, 90 failure/special finish. | ChocoboCaravanWork.step is synced; outcome/client effect validation remains pending. |
| finishTime | work._sync tag step | integer32 | Server-time deadline passed to widget setTimer at open/start. | ChocoboCaravanWork.finishTime is seeded from route duration. |
| progressPer | work._sync tag progress | integer8 | HUD progress bar percent, read by getUIDataUpdate(1). | UpdateProgressPercent mirrors percent into guildleveWork.aimNumNow and work.progressPer. |
| chocoboStatus[3] | work._sync tag status | integer8[3] | Three pack-chocobo state slots; status 4 also drives escaped map/minimap markers. | One route companion drives the first status slot; remaining slots default safe until multi-chocobo and damage behavior are recovered. |
| chocoboHPStatus[3] | work._sync tag hp | integer8[3] | Three HP/warning slots rendered as Normal/Caution/Danger. | ChocoboCaravanWork carries chocoboHPStatus[3] and SyncRetailHp pushes work/hp; slots default Normal until damage thresholds are recovered. |
| markerX/Y/Z[3] | work._sync tag status | float[3] | Destination/escaped-chocobo map markers; status tag carries markers with chocoboStatus. | Local mirrors the destination into guildleveWork fallback and work.markerX/Y/Z[0]. |

## Step And Effect Contract

| step | meaning | client_effect | content_info | local_mapping |
| --- | --- | --- | --- | --- |
| 30 | destination marker reset | clear minimap marker kind 2 and set marker slot 0 to marker[1] | none | route start/destination marker sync candidate |
| 40 | town departure effect | openPublicEffectWidget 14/15/16 for town 1/2/3 on step update | none | pre-HUD departure phase |
| 70 | active caravan HUD | first entry starts content-information kind 2 and clears marker; progress/status/hp tags update widget | start/update 1/2/3 | StartCaravan plus movement loop |
| 80 | town success/finish | set isFinished, reset marker, effects 17/18/19 by town, finish content-information when uiStep == 1 | finish | CompleteCaravan candidate |
| 90 | special/failure finish | set isFinished, reset marker, effect 20 on step update, finish content-information when uiStep == 1 | finish | FailCaravan/special completion candidate |
| finalize without finish | unclean finalize | clear minimap marker kind 2; if isFinished false open effect 13; finish content-information if uiStep == 1 | finish when needed | EndDirector/EndChocoboCaravanDirector cleanup |

## Status Values

| kind | value | ui_command | marker_behavior | local_derivation |
| --- | --- | --- | --- | --- |
| chocoboStatus | 1 | UILuaCommands.ChocoboWalk | none | moving companion |
| chocoboStatus | 2 | UILuaCommands.ChocoboStop | none | stopped/waiting companion |
| chocoboStatus | 3 | UILuaCommands.ChocoboFlight | none | under attack/flee animation, not locally modeled yet |
| chocoboStatus | 4 | UILuaCommands.ChocoboEscaped | adds marker for that slot from markerX/Y/Z | escaped pack chocobo, not locally modeled yet |
| chocoboStatus | 5 | UILuaCommands.ChocoboReturn | none | returned/recovered pack chocobo, not locally modeled yet |
| chocoboHPStatus | 1 | UILuaCommands.StatusNormal | none | safe default for all three slots |
| chocoboHPStatus | 2 | UILuaCommands.StatusCaution | none | damage threshold, not locally modeled yet |
| chocoboHPStatus | 3 | UILuaCommands.StatusDanger | none | critical damage threshold, not locally modeled yet |

## Guard And Reward Gaps

- Recovered guard command dialogue loads text bank `7680`, asks menu row `1`, and asks row `6` for feed choice when command choice `2` is selected.
- Local guard script maps command `1` to calm, `2` to feed selected item, and `3` to callback when allowed, but C# effects currently only validate/log and send a no-effect message.
- `!testcaravan 2210501 60 6` is the current safe harness for opening a short live route and observing kind `2` HUD behavior.
- Reward/result handling is guide-dialogue only today: pending success/fail data is captured, but no cargo/contribution/seal/item grant is wired.

## 2026-06-20 Live Probe Boundary

- Local caravan code is strong enough for HUD validation, not reward parity: manager/guide/adviser/guard scripts, route creation, waypoint movement, progress sync, finish/fail capture, and retail-ish work fields exist.
- Validate `kindContentsInformation == 2`, `work.step`, `work.progress`, `work.status`, `work.hp`, finish time, marker slots, and route metadata before changing rewards or guard effects.
- Keep calm/feed/callback as validate/log/no-effect until HP/status/cargo/escape/feed-item semantics and inventory costs are recovered. A successful command menu click is not proof that mutation is safe.
- Remaining retail data gaps are the six exact route/place pairs, party/roster eligibility, contribution thresholds, cargo loss, GC seals, item reward tables, relic reward rolls, and multi-chocobo HP/status behavior.

## 2026-06-21 Current Status Checkpoint

- Kind `2` HUD adapter is seeded locally, and recovered `CaravanGuardDirector.getKindContentsInformation()` maps to `ChocoboCaravanWidget`; live client validation is still pending.
- One-companion movement/progress/fail/complete backend is real, but retail `ChocoboCaravanWidget` renders three chocobo status/HP lanes. Multi-chocobo damage, escape, return, cargo loss, and public effect timing remain unrecovered or unproven.
- Guard action menu is bridged, but calm/feed/callback intentionally validate/log and report no effect. Keep them no-effect until HP/status/cargo/feed item semantics and any inventory costs are recovered.
- Route data is provisional: local manager seeds four routes and fabricated forward waypoints, while recovered party matching lists six route/place pairs. Do not claim party matching or exact route parity until endpoints/place ids/eligibility are recovered.
- Rewards are dialogue-only. Pending success/fail state is captured and guide dialogue consumes it, but there is no contribution formula, seal/item grant table, relic roll, cargo-loss rule, or transaction timing contract.
- Adviser gysahl sales are not reward proof: local adviser purchase mutates gil/items directly and needs the same quantity/currency/capacity validation as other shops before broad use.
- Rental/name surfaces are stronger: naming persists and opcode `0x0197` rental data exists, but rental timer hide-on-dismount/expiry and non-ASCII name safety still need live proof.

## Adapter Gap Matrix

| local_surface | current_behavior | retail_target | adapter_contract | risk |
| --- | --- | --- | --- | --- |
| RegionalCaravan init | Returns /Director/CaravanGuard/CaravanGuardDirector with town/place/name metadata. | CaravanGuardDirector class with getKindContentsInformation() == 2. | Keep local movement backend and validate the seeded CaravanGuardDirector-compatible work provider in-client. | GuildleveExecutionWidget is now fallback plumbing; the remaining risk is unvalidated live ChocoboCaravanWidget behavior. |
| StartCaravan | Spawns path companion, initializes distance, syncs guildleveWork fallback plus retail work fields, markers, and actors. | Set work.step through 30/40/70, finishTime/town/place/name metadata, then validate content-information kind 2 in-client. | StartCaravan now populates open data and transitions to active step 70; probe exact client property targets. | HUD context is seeded; field order/property-target validation remains. |
| UpdateProgressPercent | Writes guildleveWork.aimNumNow[index] and work.progressPer. | work.progressPer plus tag progress -> processUpdateContentsInformation(update, 1). | Keep mirroring the computed percent into progressPer and validate update index 1. | Route progress is mirrored; remaining risk is client update target mismatch. |
| caravanNpc moveState | One path companion is walking/stopped. | chocoboStatus[3] and chocoboHPStatus[3]. | Keep all three status slots initialized; derive slot 1 from companion movement and leave HP defaults until damage exists. | Widget status defaults are seeded; multi-slot/damage behavior remains incomplete. |
| SyncDestinationMarker | Writes guildleveWork fallback marker data and work.markerX/Y/Z[0], then duplicates packets to director/player. | work.markerX/Y/Z[1] for destination and escaped status markers carried with status tag. | Destination is mirrored into retail marker slot 1; slots 2/3 remain reserved for escaped pack chocobos. | Map/minimap marker branch needs live validation against the retail work fields. |
| CompleteCaravan | Sets progress 100, stops companion, snaps destination, captures pending result, emits step 80, sends chat, EndDirector. | step 80 by town, effects 17/18/19, content-information finish. | Emit success step and persist pending guide result before EndDirector so the client and guide can finish coherently. | HUD/guide finish is seeded; remaining risk is live effect/finish timing. |
| FailCaravan | Sends reason, captures pending fail result, emits step 90, and EndDirector. | step 90/effect 20 plus pending fail reward dialogue; unclean finalize remains a separate teardown path. | Use runtime capture to validate ordinary failure step 90/effect 20 versus unclean finalize effect 13. | Pending failure dialogue is durable; public effect and marker cleanup still need live validation. |

## Implementation Contract

| priority | component | contract | verification |
| --- | --- | --- | --- |
| 1 | Retail work provider | Add/surface CaravanGuardDirector-compatible work fields and tags, especially step/progress/status/hp. | Client calls getKindContentsInformation() == 2 and opens ChocoboCaravanWidget. |
| 2 | Route metadata | Extend ChocoboCaravanRoute with town, placeStart, placeEnd, name1/name2/name3, and finishTime/deadline source. | getUIDataOpen populates timer, company icon, place names, and optional names. |
| 3 | Progress adapter | Mirror route percent into progressPer and send update index 1. | ProgressBar_Progress tracks movement without using GuildleveExecutionWidget. |
| 4 | Status/HP/marker adapter | Initialize 3 status/HP slots and marker arrays; start with safe defaults, then wire escape/damage later. | Widget renders Walk/Stop and Normal labels; escaped markers only appear for status 4. |
| 5 | Finish/fail transitions | Emit retail step 80/90 or confirmed finalize path before ending director. | HUD closes via processUpdateContentsInformation(..., 'finish') and public effects match town/outcome. |

## Key Functions

| path | function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- | --- |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.init | 3 | 107 | CaravanGuardDirector; progressPer; finishTime; chocoboStatus; chocoboHPStatus; markerX; markerY; markerZ | Defines temp/sync work fields and step/progress/status/hp tags for the retail HUD. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.processUIInit | 108 | 118 | CaravanGuardDirector; markerX; markerY; markerZ; openPublicEffectWidget; setMiniMapWidgetMarkerData | Initial marker/effect setup based on step and town. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.processUIUpdate | 119 | 317 | CaravanGuardDirector; processUpdateContentsInformation; chocoboStatus; markerX; markerY; markerZ; openPublicEffectWidget; setMiniMapWidgetMarkerData | Phase driver for step 30/40/70/80/90 and content-information start/update/finish calls. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.processUIFinalize | 318 | 327 | CaravanGuardDirector; processUpdateContentsInformation; openPublicEffectWidget; setMiniMapWidgetMarkerData | Clears markers, opens unclean effect 13 if unfinished, and finishes HUD if open. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.getKindContentsInformation | 328 | 332 | CaravanGuardDirector; getKindContentsInformation | Returns kind 2, which DesktopWidget maps to ChocoboCaravanWidget. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.getUIDataOpen | 333 | 335 | CaravanGuardDirector; getUIDataOpen; finishTime | Returns finishTime, town, placeStart, placeEnd, name1, name2, name3. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.getUIDataUpdate | 336 | 371 | CaravanGuardDirector; getUIDataUpdate; progressPer; chocoboStatus; chocoboHPStatus | Returns progressPer for 1, chocoboStatus triple for 2, HP triple for 3. |
| tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua | CaravanGuardDirector.processMapOpenMessage | 372 | 399 | CaravanGuardDirector; chocoboStatus; markerX; markerY; markerZ; setMapNavigationWidgetMarkerData | Restores caravan markers when the map opens. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua | ChocoboCaravanWidget.updateChocoboStatus | 82 | 117 | ChocoboCaravanWidget; chocoboStatus; ChocoboWalk; ChocoboStop; ChocoboFlight; ChocoboEscaped; ChocoboReturn | Maps status 1..5 to ChocoboWalk/Stop/Flight/Escaped/Return UI commands. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua | ChocoboCaravanWidget.updateChocoboHp | 118 | 143 | ChocoboCaravanWidget; chocoboStatus; StatusNormal; StatusCaution; StatusDanger | Maps HP status 1..3 to Normal/Caution/Danger UI commands. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua | ChocoboCaravanWidget.updateCaravanProgress | 144 | 146 | ChocoboCaravanWidget | Writes ProgressBar_Progress. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua | ChocoboCaravanWidget.update | 147 | 208 | ChocoboCaravanWidget; getUIDataUpdate; chocoboStatus | Consumes update indices 1 progress, 2 status, 3 HP. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.processUpdateContentsInformation | 3333 | 3365 | ChocoboCaravanWidget; processUpdateContentsInformation; getKindContentsInformation; GuildleveExecutionWidget | Dispatches kind 2 content-information to ChocoboCaravanWidget. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.StartCaravan | 182 | 228 | SpawnPathCompanion | Local route backend start: spawn companion, sync guildleveWork fallback plus retail work fields, markers, and actors. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.CompleteCaravan | 235 | 261 | progressPer; chocoboStatus; CompleteCaravan; CapturePendingResultForPlayers | Local success endpoint maps to retail step 80 and captures pending guide result before ending. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.FailCaravan | 262 | 277 | chocoboStatus; FailCaravan; CapturePendingResultForPlayers | Local failure endpoint maps to retail step 90 and captures pending guide result; effect mapping still needs live validation. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.UpdateCaravanMovement | 342 | 407 | UpdateCaravanMovement; CompleteCaravan | Moves local path companion and updates route progress. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.UpdateProgressPercent | 423 | 438 | progressPer; guildleveWork; aimNumNow | Computes percent and sends it through guildleveWork.aimNumNow plus work.progressPer. |
| Map Server/Actors/Director/ChocoboCaravanDirector.cs | ChocoboCaravanDirector.SyncDestinationMarker | 448 | 463 | markerX; markerY; markerZ; guildleveWork | Local destination marker sync via guildleveWork fallback and work.marker arrays. |


## Naming / Rental Side Surfaces

- `ChocoboNamingWidget` is recovered and locally used by `PopulaceChocoboLender`; `IssueChocobo` persists the name into `characters_chocobo`, and actor `1080101` is locally spawned for the naming visual flow.
- Rental backend data exists: `MountChocobo(true, minutes)` drives `StartChocoboRental`, and `SetCurrentMountChocoboPacket` sends absolute expiry/minutes. The remaining proof is whether opcode `0x0197` reaches recovered `_onChocoboRentalRide` and static slot `23` / `ChocoboRentalTimerWidget` in-client.
- Name encoding is not safe to widen yet: recovered non-Chinese naming accepts ASCII letters, the Chinese/IME branch differs, local DB is `latin1`, and `SetChocoboNamePacket` length-checks Unicode while sending ASCII. Reject or preserve non-ASCII explicitly before broadening name input.
- `Data/scripts/base/chara/npc/object/ChocoboStop.lua` now exists as an inert no-op for SQL-bound actor class `1090464`; validate spawn/script resolution without adding UI/action side effects.
- `ChocoboRideCommand` restricted-message row parity is patched: recovered retail uses `26002` for chocobo restriction and remaps to `26020` for goobbue. Live validation should confirm both rows in no-ride areas and keep broader ride-eligibility/pushing-out logic as a future probe.

## 2026-06-21 Multi-Lane / Reward Guard Update

- Caravan HUD kind `2` is confirmed, and the recovered widget expects `progressPer`, `finishTime`, three `chocoboStatus` lanes, three `chocoboHPStatus` lanes, and marker arrays.
- Local state still fans a single spawned `caravanNpc` and one status decision across all three lanes. Independent HP, damage, escape, return, cargo, and per-bird marker semantics are still missing.
- Guard command labels and text bank evidence are concrete, but local calm/feed/callback hooks remain no-effect placeholders. Do not wire feed/calm/callback to inventory, HP, cargo, or reward effects until retail command effects are captured.
- Caravan rewards are presentation-recovered, not transaction-recovered. Guide dialogue covers success/fail/bonus/no-bonus/cargo/kill thresholds, but local reward grant semantics should remain disabled until a server-owned reward provider and claim ledger exist.
- Adviser gysahl sale remains a transaction-order risk: local code adds item first and removes gil after success. Treat it as its own guarded shop path, not a reusable pattern for broader shops.
- Escort/rescue `npcHP` belongs to GuildleveExecutionWidget kind `1`, not caravan kind `2`. Local `GuildleveWork` still lacks that `npcHP` field, so do not reuse caravan HP slots for escort/rescue.
- Chocobo naming remains ASCII/capture-only for non-ASCII. Recovered naming has IME-specific behavior, but local packet sending and DB charset are not proven safe for non-ASCII names.
## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | Content-information kind 2 open | Start a local caravan, ideally `!testcaravan 2210501 60 6`, and log DesktopWidget.processUpdateContentsInformation arguments. | Kind 2 resolves to ChocoboCaravanWidget and start receives finishTime/town/place/name open data. |
| 2 | Progress update mirror | Move along a route and capture progress tag/work.progressPer updates. | Widget update index 1 fires and ProgressBar_Progress matches route percent. |
| 3 | Status/default HP render | Start route with all three slots initialized to Walk/Normal, then stop/complete. | Widget sends ChocoboWalk/StatusNormal commands and no nil status paths fire. |
| 4 | Marker branch separation | Compare guildleveWork destination marker with retail markerX/Y/Z slot 1 and escaped status 4 markers. | Retail branch controls caravan minimap markers while existing guildleve markers do not regress unrelated content. |
| 5 | Outcome effect mapping | Complete and fail routes for town 1/2/3 while logging public effects 13-20. | Success uses 17/18/19, town departure uses 14/15/16, and failure semantics are confirmed for 20 versus 13. |
| 6 | Guard command effects | Interact with the spawned guard during a route and test calm/feed/callback choices. | Current expected behavior is validation/logging plus no-effect message; later success requires status/HP/cargo/feed mutation with no inventory desync. |
| 7 | Pending guide reward | Complete and fail a short route, then talk to the guide. | Pending success/fail dialogue appears; no reward grant should occur until the reward transaction contract is implemented. |

## Generated artifacts

- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/work_sync_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/step_effect_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/status_value_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/adapter_gap_matrix.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/chocobo_caravan_hud_adapter_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 19 / 19
- Source term hits: 291
- Function contracts: 56
- Work-sync rows: 12
- Adapter gap rows: 7
- Probe rows: 5

## 2026-06-21 Active Lane Clarification

- The local director is real and test-spawnable, and the work object exposes recovered three-lane fields: step, progress, finish time, three chocobo status lanes, three HP status lanes, and three marker lanes.
- Current implementation uses one spawned caravan actor and fans that state across all three retail lanes. Treat only marker/status lane `0` as meaningful until per-bird actors, HP, escape/return, cargo loss, and marker ownership are implemented.
- Guard commands are active but placeholder-only: calm/feed/callback validate/log and send no-effect messages. Feed-item consumption and status/HP/cargo mutation remain missing.
- Guide reward handling is dialogue-only: completion stores an in-memory pending result, and the guide consumes it for success/fail dialogue. There is no reward/seal/item transaction authority or persistent claim ledger yet.
