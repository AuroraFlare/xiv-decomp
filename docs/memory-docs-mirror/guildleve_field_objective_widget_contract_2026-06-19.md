# Guildleve Field Objective/Widget Contract (2026-06-19)

This pass follows the aetheryte guildleve-start path into active field objectives, the live guildleve widget, history/card/area widgets, minimap markers, land-leve gathering points, and bonus chests.

## Key findings

- The recovered `GuildleveAreaNotice`, `GuildleveGuidePoint`, `GuildleveHiddenPoint`, and `GuildleveSearchPoint` scripts are tiny identity/talk shims; only `GuildleveSearchPoint` adds visible behavior by returning `false` from `isMapMarkerVisibleForTalkable`.
- Local land-leve field gameplay is implemented through `MiningPoint.lua`, `PlaceDrivenCommand.lua`, and `GuildleveDirector.HandleGatheringPoint`, using `GLGP|leveId|index` unique ids and actor classes `1200052..1200057`.
- The live objective UI is packet/provider driven: `GuildleveDirector` sends `guildleveWork/start`, `guildleveWork/infoVariable`, and `guildleveWork/marker` packets that the client uses to create/update `GuildleveExecutionWidget`.
- `GuildleveHistoryWidget` is locally backed by `RequestInformationCommand.lua` request type `glHist`, which pulls up to eight ids from the player history-evaluation APIs.
- Active minimap coordinates are loaded from `gamedata_guildleve_mapmarkers`; full-map/journal `qtmap` marker ids come from `Data/scripts/guildleve_map_markers.lua`.
- Bonus chests are locally implemented through actor class `1200161`, `GuildleveBonusTreasureBox.lua`, `guildleve_chests.lua`, and `GuildleveDirector.OpenGuildleveChest`.

## Still missing or risky

- `P1`: exact local scripts/bindings for the recovered `Guildleve*Point` class names are absent, though recovered behavior is almost entirely no-op.
- `P1`: `PlaceDrivenCommand.lua` still has a test print and a lowercase `player:endEvent()` failure branch.
- `P1`: `GuildleveExecutionWidget` parity is packet-order dependent; no direct local widget open path should be used for it.
- `P2`: `GuildleveCardOrderWidget` and `GuildleveAreaOrderWidget` are recovered but need their local publisher call path traced before direct use.
- `P2`: normal non-guildleve `MiningPoint` gathering behavior remains mostly commented out.
- `P2`: marker data should be probed with single-slot and multi-slot active leves.

## 2026-09-13 Initial widget visibility

The reported solo symptom was a missing execution widget until the first kill
changed its objective counter. Startup previously sent `guildleveWork/start`
before any objective data, repeated start, then replayed `/_init`.

The recovered `GuildleveBaseClass` bytecode confirms that the first start changes
`uiStep` from 0 to 1 and requests widget creation. Subsequent starts do not repeat
that request. Objective updates compare `aimNumNow` and `uiState` with temporary
caches; `processUIInit` copies both current arrays into those caches. The desktop
connector's update path can recreate a missing widget, which is consistent with
the observed recovery on a kill. These methods were checked with
`tools/disassemble_lua51.py` against the saved client bytecode, because the older
Lua decompilation contains broken control flow.

The shared live UI publisher now sends the player mirror and complete director
objectives/markers before a single director-owned start notification. It no longer
replays `/_init` after opening. Solo starts, all admitted party participants,
running joins and zone-return restoration use that same ordering. Completion
signals and authoritative timers/progress are unchanged.

Validation: `Fishing Tests --guildleve-widget-only` captures compiled production
startup packets for one, four and eight participants before any kills, checks the first
open's complete objective state, and runs the zone-return packet/lifecycle tests.
The encounter framework, gathering startup validator and compiled fieldcraft
harness also pass. In-game widget rendering still needs verification with the
rebuilt Map Server; these are offline protocol checks, not a live client test.

## 2026-06-20 Battle / Reward Safety Addendum

- Guildleve battle flow is substantially implemented and server-authoritative: `Area` creates `GuildleveDirector`, the director owns load/start/spawn/kill/objective state, and completion/reward claim paths exist.
- `GuildleveActiveStatePacket` is presence/party-lock state only; it is not reward or completion authority.
- `GuildleveWarpPoint` opens the reward event and then immediately grants completion rewards; the widget is display/flow, not a claim-confirmation authority.
- Dangerous bypasses still exist: direct completion commands can mark a leve complete outside objective flow, `TryClaimGuildleveCompletionReward` has a less-strict fallback, and faction credits can be awarded on first completed mark.
- Safe probe order is static inventory, QCI HUD-only, active leve creation/markers/UI, one-kill-before-complete objective progress, bonus chest on a disposable character, then one completion/warp/reward pass with duplicate-click checks. Test fake `GLWP` fallback and GM `completeguildleve` last.

## 2026-06-21 Reward/Chest Probe Update

- Battle and field objectives are server-owned. `GLGP|leveId|index` actors should be trusted only when an active director owns the same leve and objective index; stale or forged unique ids should fail before gathering or progress mutation.
- Escort/rescue `npcHP` is a separate recovered guildleve objective field, not a chocobo-caravan HUD field. Local guildleve work does not yet expose a proven `npcHP` lane, so escort objective widgets need their own probe before tying NPC health to progress or failure.
- Bonus chest flow marks a chest opened before `AddGeneratedItemToPackage(ItemPackage.LOOT, ...)`. If loot add/full-package handling fails, the item can be lost and the chest cannot be retried, so chest probes need normal, full, duplicate, party-recipient, and disconnect cases.
- Chest item visibility depends on the scoped loot bridge: guildleve chest rewards enter backend `ItemPackage.LOOT = 4`, while recovered loot UI uses client package code `5`. Do not rely on generic package `5` lookup because local `MELDREQUEST = 5` is real.
- Completion reward probes should capture confirm, cancel/ESC, duplicate click, full inventory, no-director fallback, fake `GLWP`, and `completeguildleve` separately. Only the live-director happy path should be tested first.

## Generated artifacts

- Output directory: `tools/outputs/lpb/guildleve_field_objective_widget_contract_20260619/`
- Main tables: `function_contracts.csv`, `field_point_contract.csv`, `live_widget_contract.csv`, `marker_data_contract.csv`, `local_backend_api_surface.csv`, `local_gap_matrix.csv`, `probe_queue.csv`

## Counts

- `sources_present`: 49
- `source_count`: 49
- `backlog_surface_count`: 16
- `function_contract_count`: 129
- `field_point_contract_count`: 6
- `widget_contract_count`: 4
- `actor_class_count`: 11
- `marker_sql_row_count`: 624
- `marker_sql_unique_leve_count`: 624
- `backend_api_present`: 23
- `local_gap_count`: 7
- `probe_count`: 7
