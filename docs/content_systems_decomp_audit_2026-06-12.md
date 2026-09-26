# Content Systems Decomp Audit - 2026-06-12

## Scope And Confidence

This pass focused on the 1.x client-side Lua/LPB data for Hamlet Defense, raid and trial dungeons, Chocobo Caravan, widgets, cutscene widgets, and nearby area/player control flow. The fresh output lives under:

- `tools/outputs/lpb/content_systems_20260612/`
- `tools/outputs/lpb/content_systems_20260612/lua/`
- `tools/outputs/lpb/content_systems_20260612/manifest.csv`
- `tools/outputs/lpb/content_systems_20260612/manifest.json`
- `tools/outputs/lpb/content_systems_20260612/second_order_exact_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/second_order_exact_scan_summary.json`
- `tools/outputs/lpb/content_systems_20260612/second_order_decompile_summary.json`
- `tools/outputs/lpb/content_systems_20260612/trial_widget_absence_scan.json`
- `tools/outputs/lpb/content_systems_20260612/broad_content_keyword_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/broad_content_keyword_scan_summary.json`
- `tools/outputs/lpb/content_systems_20260612/broad_content_decompile_summary.json`
- `tools/outputs/lpb/content_systems_20260612/broad_content_new_script_index.csv`
- `tools/outputs/lpb/content_systems_20260612/broad_content_new_script_index_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_cutscene_key_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutscene_key_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_asset_filename_hits.csv`
- `tools/outputs/lpb/content_systems_20260612/content_asset_filename_hits_summary.json`
- `tools/outputs/lpb/content_systems_20260612/trial_widget_asset_absence_scan.json`
- `tools/outputs/lpb/content_systems_20260612/content_dat_table_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/content_dat_table_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_raid_dungeon_names.csv`
- `tools/outputs/lpb/content_systems_20260612/content_worldmaster_520xx_messages.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutreplay_rows.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutreplay_rows_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_dat_high_signal_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_lua_api_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_lua_api_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_directory_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_directory_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_cutreplay_full_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_cutreplay_text_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_dat_full_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_only_key_lpb_exact_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_only_key_lpb_exact_scan_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_coverage_rollup_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_live_api_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_live_literal_keys.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_map.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_key_asset_crosscheck.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_per_content_matrix.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_per_content_matrix.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_absence_support_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_absence_support_scan.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_graph.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_graph.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_usage_audit.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_usage_audit.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_lua_exact_hits.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_lua_exact_hits.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_deep_audit_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_coverage_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_deep_trace.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_deep_trace.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_remaining_uncertainty_matrix.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_remaining_uncertainty_matrix.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_server_probe_notes.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_server_probe_notes.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_expanded_replay_candidate_map.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_expanded_replay_candidate_map.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_expanded_replay_candidate_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_residual_replay_sweep.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_residual_replay_sweep.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_static_evidence_deepening.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_static_evidence_deepening.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_confidence_after_static_mining.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_confidence_after_static_mining.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_server_native_boundary_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_server_native_boundary_followup.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_caravan_static_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_caravan_static_followup.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_runtime_boundary_reprobe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_runtime_boundary_reprobe.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_binary_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_binary_probe.json`
- `tools/outputs/lpb/content_systems_20260612/probe_sqwt_binary.ps1`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_native_layout_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_native_layout_probe.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_native_string_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_native_string_probe.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_family_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_family_probe.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_family_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_confidence_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_confidence_followup.json`
- `tools/outputs/lpb/content_systems_20260612/probe_sqwt_native_layout.ps1`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_probe.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_deep_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_deep_followup.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_deep_summary.json`
- `tools/outputs/lpb/content_systems_20260612/probe_reward_packet_sequence_deep.ps1`

The manifest now contains 455 decompiled LPBs with no decode/decompile failures recorded in the current passes. The first focused pass had 127 scripts; an exact-hook scan of all 2,517 installed client LPBs found 24 more second-order callers; a later broad content-family keyword pass found 304 more candidate scripts. All 328 follow-up candidates decompiled cleanly.

At this point I would call the recovered client Lua, widget/control-plane, filename-visible SQWT asset data, and directly named DAT/CSV content tables about 96-98% complete for this scope. The remaining uncertainty is mostly native-only behavior, live server packet ordering, exact reward/chest activation triggers, and some launch conditions that are only visible once the server reproduces the same state transitions.

The cutscene-specific follow-up pushes cutscene coverage over 95% for client-side data: 834 cutscene API references across 161 decompiled Lua files, 690 physical `client/cut` directories with 9,593 files, 614 full `cutReplay.csv` rows, and 568 unique replay scene keys. Every replay scene key has a matching physical `client/cut` directory. The remaining cutscene uncertainty is not "missing scene names"; it is native packet/state ordering and a few generic motion-library consumers outside the scene launcher path.

The instanced-content cutscene follow-up is also over 95% for client-side data. It mapped the live InstanceRaid/Occupancy director calls plus raid, dungeon, trial, Hamlet, Rivenroad, and Toto-Rak/company replay rows. The corrected hard map is 21 live cutscene API rows across 6 instance-related Lua files, 8 direct live duty launcher/gate keys, 80 mapped instanced-content replay rows, and 57 unique instance-related scene keys. All 8 direct live keys and all 80 mapped replay rows are backed by physical `client/cut` assets. The correction assigns `11082301..11082304` / `rad0r400..rad0r403` to Aurum Vale and `11082401..11082404` / `rad0w500..rad0w503` to Cutter's Cry. An expanded story-adjacent sweep adds 49 more in-scope candidate rows / 32 unique keys for Castrum/Beacon, Garuda/Howling Eye, Rivenroad lead-in, Moogle/Nightmare, and Grand Company story-bridge rows, bringing the in-scope plus story-adjacent view to 129 rows / 89 unique keys. Three public-stronghold rows are retained separately as out-of-scope references. A deeper exact-key pass splits the 57 hard-map keys into 8 live duty launcher/gate keys, 18 quest/story launcher literals, 1 delete-only/preload reference, and 30 replay-asset-only or dynamic-server-argument keys. The final static evidence pass raises Ifrit content-tier mapping, Aurum/Cutter identity plus static absence, and Castrum/Beacon content/replay classification over 95%, while exact server-supplied scene-key selection remains below 95. The server/native boundary follow-up adds a full local server/Data/.codex-tmp absence scan, local Chocobo Caravan lifecycle evidence, raid/guildleve chest boundary evidence, and a focused SQWT probe; it raises local/client mechanics where supported but keeps original retail server values below 95.

The reward/caravan static follow-up raises item/source and eligibility evidence over 95% for the A Relic Reborn materials, Dzemael Enchiridion client resolver, Rowena's caravan item source, Castrum coffer key identities, Garuda Hard chest eligibility, and caravan reward eligibility text. The runtime boundary reprobe now also pins the local event packet opcodes/field shape, the local caravan route lifecycle, the caravan reward dialog API, `White-hot Ember`/`Howling Gale` trial-material source text, and the sampled SQWT `.form`/`.tpl` binary surface. The newest event-wait and SQWT-native pass raises local reward wait/resume, `RunEventFunction`, `EndEvent`, guildleve chest closure, and inventory transaction sequencing to 95%+ for the local implementation. It also raises native SQWT parser/control vocabulary and packed-payload classification over 95%, while terminal `Window`/`Dictionary` footer clues sit at 93-95%. It still does not raise exact drop tables, contribution thresholds, special coffer requirements, server-supplied scene values, decoded SQWT layout trees, or original retail reward trigger timing over 90-95%. Those remain server/capture/data-table/native-parser problems.

This pass supersedes the older "payload/widget missing" caveat for the requested content families. The key Hamlet, raid execution, caravan, cutscene effect, ranking, score, popup, tutorial, delivery, party-matching, and replay widget Lua/control layers are now decompiled or cross-checked against installed SQWT layout assets. The packed SQWT control trees themselves remain a separate parser/native-trace task.

## Discovery Summary

The installed client script corpus was scanned by keyword after decoding LPB bytecode. The broad scan produced 736 hits across the requested families. Important keyword families included:

- `widget`: 401 hits
- `cutscene`: 166 hits
- `raid`: 102 hits
- `guildleve`: 88 hits
- `hamlet`: 49 hits
- `instanceraid`: 37 hits
- `occupancy`: 27 hits
- `chocobo`: 24 hits
- `dungeon`: 24 hits
- `privatearea`: 23 hits
- `moogle`: 22 hits
- `ifrit`: 21 hits
- `contentsinformation`: 19 hits
- `whitegeneral`: 15 hits
- `noticeevent`: 13 hits
- `garuda`: 11 hits
- `caravan`: 10 hits

The later broad content-family pass scanned the same 2,517 LPBs with wider family terms. It found 451 hit files, of which 147 were already in the manifest and 304 were newly decompiled. Missing candidates by family:

| Family | Newly decompiled scripts |
|---|---:|
| `cutscene` | 152 |
| `trial` | 61 |
| `raid_dungeon` | 60 |
| `drops_rewards` | 47 |
| `hamlet` | 10 |
| `caravan` | 3 |
| `specific_widgets` | 1 |

The cutscene-only verification then exact-scanned all 2,517 installed LPBs for the 112 physical `client/cut` keys that were not already covered by Lua key references or replay rows. There were 0 LPB decode failures. The scan found 65 exact-hit rows across 39 keys and 31 scripts; the scene-specific hits were already in the 455-file manifest. The only outside-manifest hits were generic `mot`/motion, NPC base, emote, craft/negotiation judge, and generic widget consumers, not unrecovered content cutscene launchers.

Exact widget/class finds:

- `widget/hamletdefensewidget.lua`
- `widget/hamletdefensepopupwidget.lua`
- `widget/ask/hamletdefensescorewidget.lua`
- `widget/ask/hamletdefenserankingwidget.lua`
- `widget/ask/hamletdefensetutorialwidget.lua`
- `widget/ask/questdeliverywidget.lua`
- `widget/raiddungeonexecutionwidget.lua`
- `widget/chocobocaravanwidget.lua`
- `widget/pcmatchingeditwidget.lua`
- `widget/splasheffectwidget.lua`
- `widget/desktopwidget_connector.lua`
- `widget/ask/journallistwidget.lua`
- `widget/ask/replaycutsceneselectwidget.lua`
- `gamedata/cutscene.lua`
- `gamedata/cutscene_common.lua`

The second-order exact-hook scan checked the decoded bytecode for the recovered widget/director hooks and data names across the full installed corpus. It found 66 exact-hit scripts:

- 42 were already in the first focused manifest.
- 24 were newly added and decompiled.
- 0 LPBs failed to decode.
- 0 newly added scripts failed to decompile.

The 24 second-order additions mostly cover shared guildleve/company/quest UI content, debug effect callers, the cutscene replay NPC, and the Hamlet supply/ranking scenario:

- `commanddebugger/commanddebuggertest.lua`
- `director/directorbaseclass.lua`
- `director/guildleve/*.lua`
- `director/quest/questdirectorgc*.lua`
- `director/quest/questdirectornmrush*.lua`
- `chara/npc/populace/populacecutsceneplayer.lua`
- `quest/scenario/noc/noc002.lua`

The non-Lua filename cross-check found 216 SQWT assets under `client/sqwt`: 80 `.gtex`, 80 `.spk`, 28 `.form`, and 28 `.tpl` files. The visible widget/layout names include `HamletDefenseWidget`, `HamletDefensePopupWidget`, `HamletDefenseRankingWidget`, `HamletDefenseScoreWidget`, `HamletDefenseTutorialWidget`, `RaidDungeonExecutionWidget`, raid start/success/failure/title widgets, duty commenced/complete/failed widgets, and `ChocoboCaravanWidget`.

No separate `trialwidget` class or Thornmarch-specific widget class was found. A decoded full-corpus absence scan found no `TrialWidget`, `trialwidget`, `Thornmarch`, or `thornmarch` strings in any installed LPB. A direct client filename scan also found no `TrialWidget`, `Thornmarch`, or obvious trial boss widget names under `sqwt/widget`. The only generic `trial` string hits were two unrelated scenario scripts: `quest/scenario/exc/exc300.lua` and `quest/scenario/man/man2g0.lua`. Trial duties use the same instance raid base/HUD path as raids and dungeons.

## DAT/CSV Content Tables

Sources:

- `tools/outputs/lpb/content_systems_20260612/content_dat_table_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/content_dat_table_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_dat_high_signal_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_raid_dungeon_names.csv`
- `tools/outputs/lpb/content_systems_20260612/content_worldmaster_520xx_messages.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutreplay_rows.csv`

The DAT/CSV pass found 28 directly named content tables, totaling 2,167 lines, for the same families recovered in Lua:

- Hamlet: score, supply, captain, breeder, push-event, and instance defense text.
- Caravan: manager, guide, adviser, guard text.
- Raid/dungeon: guide, poster, warp, light, exit, barrier, and title text.
- Cutscene replay: `cutReplay.csv` and `xtx_cutReplay.csv`.
- Generic content command helpers: `xtx_command_content.csv`.

High-signal table coverage:

| Table | Text group | Rows | Notes |
|---|---:|---:|---|
| `instanceRaidGuideAurumVale.csv` | 9920 | 20 | Aurum Vale no-quest guide, entry/explanation/requirements/retry text |
| `instanceRaidGuideCuttersCry.csv` | 9936 | 30 | Cutter's Cry guide, rank-sensitive text and entry/explanation/requirements/retry text |
| `InstanceRaidHamletDefense.csv` | 10208 | 28 | Hamlet start/clear/fail/local event and battlefield notification text |
| `populaceCaravanManager.csv` | 7520 | 64 | Caravan manager entry, route, capacity, reward, cross-company text |
| `populaceCaravanGuide.csv` | 7552 | 43 | Active caravan cancel/reward/fail/bonus text |
| `populaceHamletPushEvent.csv` | 10176 | 51 | Hamlet DoL/DoH support, harvest pots, support items, and mode restriction text |

`content_worldmaster_520xx_messages.csv` extracts 89 shared duty/Hamlet rows from `worldMaster.csv`, grouped as:

| Category | Rows |
|---|---:|
| Entry requirement/progress | 20 |
| Dungeon mechanics/requirements | 16 |
| Duty entry/timer/exit | 10 |
| Dungeon object/progress/exit | 9 |
| Hamlet delivery/anima | 9 |
| Party member denial/failure | 7 |
| Entry/exit prompts | 6 |
| Hamlet supply/loot | 6 |
| Duty warning/fail/passive | 4 |
| Hamlet defense schedule | 2 |

## Hamlet Defense

### Main Execution Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/hamletdefensewidget.lua`

`HamletDefenseWidget` extends `WidgetBaseClass`. Its work state is enough to drive the full Hamlet duty HUD:

- `contentId`
- `hamletRank`
- `hasGatheringItem[9]`
- `defenseLineStatus[3]`
- `goodsStatus[4]`
- `goodsKindTarget`
- `bossStatus`
- `armyBuff[3]`
- `enemyBuff[3]`

Important command methods:

- `cmdShow`
- `cmdSetTitle(contentId, hamletRank)`
- `cmdSetTimer(finishTime)`
- `cmdSetDefenseLineStatus(index, status)`
- `cmdSetWarPotentialValue(value, max)`
- `cmdSetGoodsStatus(index, status)`
- `cmdSetBossStatus(flag)`
- `cmdSetTargetGoods(index)`
- `cmdSetArmyBuff(index, status, ...)`
- `cmdSetEnemyBuff(index, status, ...)`
- `cmdSetGatheringItem(index)`
- `cmdResetGatheringItem`
- `setBingoReachEffect`
- `setBingoEffect`

Hamlet title content IDs:

| Content ID | Hamlet | Title icon set |
|---:|---|---|
| 8 | Battle for Aleport | 988, 991, 994 |
| 9 | Battle for Hyrstmill | 989, 992, 995 |
| 10 | Battle for the Golden Bazaar | 990, 993, 996 |

Defense line statuses:

| Status | Meaning | UI command |
|---:|---|---|
| 1 | Normal | `UILuaCommands.StatusNormal` |
| 2 | Danger | `UILuaCommands.StatusDanger` |
| 3 | Fallen | `UILuaCommands.LineOfDefenseFall` |

Goods statuses:

| Status | Meaning | UI command |
|---:|---|---|
| 1 | Normal | `UILuaCommands.StatusNormal` |
| 2 | Danger | `UILuaCommands.StatusDanger` |
| 3 | Lost | `UILuaCommands.GoodsLost` |

Gathering bingo rows:

- `1, 2, 3`
- `4, 5, 6`
- `7, 8, 9`
- `1, 4, 7`

The timer logic matches the raid/caravan widgets and uses remaining-time thresholds of 300 and 120 seconds for warning states.

### Hamlet Popup Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/hamletdefensepopupwidget.lua`

`HamletDefensePopupWidget` extends `WidgetBaseClass`. The main method is:

- `dispInformation(isArmy, hamletId, buffIcon, owner, textId, ...)`

It sets the popup text from owner/text ID, optionally applies a buff icon, then picks either the army or enemy flag/icon:

- Army icon: `988 + hamletId - 1`
- Enemy forces icon: `994 + hamletId - 1`
- Army animation: `ArmyAnimation.Start`
- Enemy animation: `EnemyAnimation.Start`

### Score Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/hamletdefensescorewidget.lua`

`HamletDefenseScoreWidget` extends `AskBaseClass`. It reads player-native score bindings:

- `_countHamletDefenseScore()`
- `_getHamletDefenseScore(i)`
- `_getHamletDefenseScoreAll()`

It populates `DataMaker_ListBox` rows with text `13019`, `bonus`, and `point` properties. It uses title text `13012`; score row text includes IDs `225` and `3189`. If no content ID is passed, the widget defaults to content ID `9`.

### Ranking Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/hamletdefenserankingwidget.lua`

`HamletDefenseRankingWidget` extends `AskBaseClass`. It reads area-native supply ranking bindings:

- `_countHamletSupplyRanking()`
- `_getHamletSupplyRanking(i)`

Important text/icon data:

- Title text: `13001`
- Hamlet level text: `13002`
- Grand company banners:
  - `1`: `LAB_profile_stateBanner_LimsaLominsa`
  - `2`: `LAB_profile_stateBanner_Gridania`
  - `3`: `LAB_profile_stateBanner_Uldah`
- Company icons:
  - `1`: 527
  - `2`: 528
  - `3`: 529
- Crown icon: `985 + rank - 1`

### Hamlet Tutorial And Delivery Widgets

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/hamletdefensetutorialwidget.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/questdeliverywidget.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/debug/populacemenuman.lua`

`HamletDefenseTutorialWidget` extends `AskBaseClass`. It is opened by `PopulaceMenuMan.showHamletDefenceTutorial(gcId)` through `desktopWidget:askEventModeWidgetYield("Ask/HamletDefenseTutorialWidget", 1, gcId, 1)`.

Tutorial state:

- `kind`
- `gcId`
- `page`

Tutorial page counts:

| Kind | Page count | Page group |
|---:|---:|---|
| 1 | 9 | All Hamlet tutorial pages |
| 2 | 2 | Disciples of the Hand pages |
| 3 | 2 | Disciples of the Land pages |

Tutorial text IDs:

| Kind | Text IDs |
|---:|---|
| 1 | `11108`, `11109`, `11110`, `11111`, `11112`, `11114`, `11115`, `11116`, `11117` |
| 2 | `11116`, `11117` |
| 3 | `11114`, `11115` |

Tutorial graphics use GC/page-dependent icons `1065`, `1071`, and `1077`, with `UILuaCommands.BINGOAnimeStart` and `UILuaCommands.BINGOAnimeStop` for the animated bingo examples. The backed layout control names include `Grid_All_N`, `Grid_DisciplesOfTheLand_N`, `Grid_DisciplesOfTheHand_N`, matching `IconControl_*` and `Label_*` controls.

`QuestDeliveryWidget` is the shared delivery/shop-looking widget that Hamlet supply uses. `getFormName()` returns `GrandCompanyShopWidget`, and the Hamlet path fills `TabItem_4_Maker` through:

- `actor:getHamletSupplyCraftItemNum()`
- `actor:getHamletSupplyGatherItemNum()`
- `actor:getHamletSupplyCraftItemAnima()`
- `actor:getHamletSupplyGatherItemAnima()`
- `actor:getHamletSupplyCraftItemData(i)`
- `actor:getHamletSupplyGatherItemData(i)`

It stores per-row Hamlet prices as `nqanima` and `hqanima`, then reads them back with `getHamletItemData(...)` during item selection and `setPrice(...)`. Hamlet price display uses text ID `225`.

### Hamlet Director

Source: `tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/instanceraidhamletdefense.lua`

`InstanceRaidHamletDefense` extends `InstanceRaidBaseClass` and is the main controller for the Hamlet duty state.

Content to Hamlet mapping:

| Content ID | Hamlet ID | Duty |
|---:|---:|---|
| 8 | 1 | Battle for Aleport |
| 9 | 2 | Battle for Hyrstmill |
| 10 | 3 | Battle for the Golden Bazaar |

Work state:

- `hamletRank`
- `hamletID`
- `cargoTarget`
- `battleValue`
- `bossFlag`
- `harvestTbl[3]`
- `lineStatusTbl[3]`
- `goodsStatusTbl[4]`
- `fieldBuffTbl[6]`

Behavior:

- `processStartEffect` prints the start NPC line and opens public effect `14`, `15`, or `16` by Hamlet.
- `processFailedEffect` prints the fail NPC line and opens public effect `20`.
- `localClearEvent` prints the clear NPC line and asks the score widget if `_countHamletDefenseScore()` returns data.
- `openInformationWidget` calls `desktopWidget:openHamletExecutionWidget()`.
- `processUserMessage` updates cached line/goods/harvest/buff/boss/target/battle values, then pushes them into the Hamlet widget.
- User message type `10` calls `dispInformation`.

NPC speaker actor class IDs:

| Hamlet ID | Speaker actor class ID |
|---:|---:|
| 1 | 1600146 |
| 2 | 1200220 |
| 3 | 1000062 |

Local text rows:

| Event | Hamlet 1 | Hamlet 2 | Hamlet 3 |
|---|---:|---:|---:|
| Start | 2 | 5 | 8 |
| Clear | 3 | 6 | 9 |
| Fail | 4 | 7 | 10 |

The director loads text group `10208`, `InstanceRaidHamletDefense`.

### Hamlet Supply And Support Layer

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletsupply.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletpushevent.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletcaptain.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/noc/noc002.lua`
- `docs/Dat Mining/itemHamletSupply.csv`
- `docs/Dat Mining/xtx_itemName.csv`
- `tools/mobspawns/actor_id_mob_name_only.csv`

`PopulaceHamletSupply` loads text group `10192`, `populaceHamletSupply`, and opens the normal quest-delivery widget for item and materia delivery:

- Item menu: `Ask/QuestDeliveryWidget` with the supplied item arguments.
- Materia menu: `Ask/QuestDeliveryWidget`, argument set `0, 0, 0, 1`.
- Price update: calls `setPrice(...)` on the active quest delivery widget.

Quartermaster actor IDs and supply table bases:

| Actor class ID | Name | Craft rows | Gather rows |
|---:|---|---:|---:|
| 1500433 | Militia Quartermaster B'davzzi | 12001-12008 | 12009-12011 |
| 1500320 | Militia Quartermaster Dhebi Polaali | 11001-11008 | 11009-11011 |
| 1500434 | Militia Quartermaster P'lhabgo | 13001-13008 | 13009-13011 |

`itemHamletSupply.csv` rows `11001..13011` resolve to the same item families for each quartermaster:

| Item ID | English name | Quantity |
|---:|---|---:|
| 10011200 | Militia Bow | 1 |
| 10011201 | Militia Sword | 1 |
| 10011202 | Militia Helm | 1 |
| 10011203 | Militia Gorget | 1 |
| 10011204 | Militia Longboots | 1 |
| 10011205 | Militia Leggings | 1 |
| 10011206 | Militia Poultice | 1 |
| 10011207 | Militia Rations | 1 |
| 10011197 | Light Kidney Ore | 10 |
| 10011198 | Young Indigo Herring | 10 |
| 10011199 | Supple Spruce Branch | 10 |

`PopulaceHamletPushEvent` loads text group `10176`, `populaceHamletPushEvent`. It classifies Hamlet support actors into support, harvest, craft, and hidden marker types. Important actor IDs:

| Actor class ID | Role inferred by script |
|---:|---|
| 1500435 | Quartermaster/support actor branch |
| 1500387 | Quartermaster/support actor branch |
| 1500436 | Type `1` support actor |
| 1200360 | Harvest type `1` |
| 1200361 | Harvest type `2` |
| 1200362 | Harvest type `3` |
| 1200381 | Type `3` support actor |
| 1200369 | Craft/support actor branch |
| 1200370 | Craft/support actor branch |
| 1200371 | Craft/support actor branch |
| 1200372 | Type `4`, hidden map marker |

Map marker types:

| Actor state | Marker type |
|---|---:|
| Harvest type `1` | 14 |
| Harvest type `2` | 15 |
| Harvest type `3` | 16 |
| Type `3` | 13 |
| Type `1` | 18 |
| Default | 6 |

Craft support selection uses four effect categories and three crafter groups. The selectable crafted-material item IDs are:

| Selection | Group 1 | Group 2 | Group 3 |
|---|---:|---:|---:|
| Defense/evasion | 10011231 | 10011235 | 10011239 |
| Attack | 10011232 | 10011236 | 10011240 |
| Regen/healing | 10011234 | 10011238 | 10011242 |
| Enmity/order disruption | 10011233 | 10011237 | 10011241 |

English item names:

| Item ID | English name |
|---:|---|
| 10011231 | Pavis Parts (Reinforcement) |
| 10011232 | Pavis Parts (Spikes) |
| 10011233 | Pavis Parts (Musk) |
| 10011234 | Pavis Parts (Blessing) |
| 10011235 | Decoy Parts (Reinforcement) |
| 10011236 | Decoy Parts (Spikes) |
| 10011237 | Decoy Parts (Musk) |
| 10011238 | Decoy Parts (Blessing) |
| 10011239 | Fortifying Philter |
| 10011240 | Spiking Philter |
| 10011241 | Musky Philter |
| 10011242 | Sanctifying Philter |

Crafter group detection:

- Main skills `29..31`: group `1`.
- Main skills `32..34`: group `2`.
- Everything else: group `3`.

`populaceHamletPushEvent.csv` confirms the live support rules in text:

- Gatherers carry fragile alchemical pots, one at a time.
- Three matching pots or one of each pot type create enemy debuffs.
- Crafters take crate materials, synthesize one support item, and deliver it.
- Crafted support items grant militia buffs or alter enemy behavior.
- Hamlet Defense blocks switching to active mode during the battle for DoL/DoH support roles.

`PopulaceHamletCaptain` loads text group `10160`, `PopulaceHamletCaptain`. It maps captain actor IDs to local text variants:

| Actor class ID | Text variant |
|---:|---|
| 1500340 | Aleport |
| 1500342 | Hyrstmill |
| 1500341 | Golden Bazaar |

It exposes:

- `talkInContents`: duty entry confirmation flow.
- `talkAfterContents`: post-duty dialogue.
- `talkAfterContentsSupplyReward`: reward branch with supply rank variants `1..3`.
- `talkAfterContentsExit`: exit confirmation using text `52042`, `52043`, `52044`, and optional warning `52087`.

`Noc002` loads text group `10128`, `noc002`, and is the scenario-side Hamlet supply/ranking wrapper. It:

- Loads eleven `itemHamletSupplySheet` rows for task board and supply explanations.
- Presents supply options with text `31` and choices `32..39`.
- Calls `desktopWidget:askHamletDefenseRankingWidget(...)`.
- Emits supply point and error system messages:
  - Point up: text `55`
  - Supply rank-in: `52090`
  - Insufficient supply: `52078`
  - Invalid item: `52083`
  - Item not held: `52077`
  - Durability/life not max: `52079`
  - Content already started: `52082`
  - Item modification: `52081`
  - Anima add: `52084`

## Desktop Widget Connector

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua`

Important entry points:

- `openRaidDungeonExecutionWidget(self, unused, contentID, finishTime)`
  - Opens slot `15` as `RaidDungeonExecutionWidget`.
  - The first explicit argument is ignored by the function body.
- `closeRaidDungeonExecutionWidget()`
  - Closes slots `15` and `16`.
- `openHamletExecutionWidget()`
  - Opens slot `15` as `HamletDefenseWidget`.
  - Opens slot `16` as `HamletDefensePopupWidget`.
- `getHamletExecutionWidget()`
  - Returns slot `15`.
- `getHamletPopupWidget()`
  - Returns slot `16`.
- `askHamletDefenseRankingWidget(...)`
  - Uses `askEventModeWidgetYield2("Ask/HamletDefenseRankingWidget", 1, ...)`.
- `askHamletDefenseScoreWidget(contentID)`
  - Uses `askEventModeWidgetYield2("Ask/HamletDefenseScoreWidget", 1, contentID)`.

`processUpdateContentsInformation(actor, action, updateType)` routes generic content widgets by `actor:getKindContentsInformation()`:

| Kind | Widget |
|---:|---|
| 1 | `GuildleveExecutionWidget` |
| 2 | `ChocoboCaravanWidget` |

Hamlet and instance raids do not use this generic content-information path. They open their own execution widgets directly.

The second-order scan added the shared content-information callers:

- `GuildleveBaseClass.getKindContentsInformation()` returns `1`.
- Guildleve start/update/finalize calls send `processUpdateContentsInformation(..., "start" | "update" | "cancel", ...)`.
- Company/quest content directors such as `QuestDirectorGcg70101`, `QuestDirectorGcl70101`, and `QuestDirectorGcu70101` also return kind `1` and use the same generic content-information lane.
- Those Grand Company quest directors use public effect IDs `14..16` for start, `17..19` for completion, `20` for failure, and `13` for cancellation, matching the public duty effect family.
- `DirectorBaseClass.getKindContentsInformation()` is empty/nil by default; content classes opt in by overriding it.

This reinforces that Chocobo Caravan is special because it opts into generic content kind `2`, while Hamlet and instance raid execution widgets are opened directly by their directors.

`processUpdateGeneralNotificationDialog(type, ..., effectId, ...)` has important widget side effects:

| Type | Behavior |
|---:|---|
| 1 | Caution inform dialog |
| 2 | Tutorial success |
| 3 | `openPublicEffectWidget(effectId)` |
| 4 | Tutorial widget |
| 5 | Close tutorial |
| 7 | Close/cancel tutorial mode |
| 8 | Close raid dungeon execution widget |
| 9 | Order tutorial mode and set tutorial mask |

## Raid, Dungeon, And Trial Duties

### Raid Execution Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/raiddungeonexecutionwidget.lua`

`RaidDungeonExecutionWidget` extends `WidgetBaseClass`.

Main behavior:

- `init(contentID, finishTime)` calls `setContents` and `setTimer`.
- `setContents` reads title text from owner `10051` with ID `contentID`.
- `setTimer` uses server time and the same 300/120 second warning thresholds as the Hamlet and caravan widgets.

Important `xtx_raidDungeon.csv` IDs:

| ID | Duty |
|---:|---|
| 1 | The Thousand Maws of Toto-Rak |
| 2 | Dzemael Darkhold |
| 3 | The Bowl of Embers (Hard) |
| 4 | The Bowl of Embers |
| 5 | Thornmarch |
| 6 | Aurum Vale |
| 7 | Cutter's Cry |
| 8 | The Battle for Aleport |
| 9 | The Battle for Hyrstmill |
| 10 | The Battle for the Golden Bazaar |
| 11 | The Howling Eye (Hard) |
| 12 | The Howling Eye |
| 13 | Castrum Novum Transmission Tower |
| 14 | The Bowl of Embers (Extreme) |
| 15 | Rivenroad |
| 16 | Rivenroad (Hard) |

### Instance Raid Base

Source: `tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/instanceraidbaseclass.lua`

`InstanceRaidBaseClass` provides the common flow for raids, dungeons, trials, and Hamlet subclasses.

Work fields:

- `startTime`
- `finishTime`
- `contentID`
- `eventType`
- `countdownStatus`
- `clearFlag`
- `initFlag`

Core flow:

- `startEvent(cutsceneName, owner, cutsceneModeFlag, contentID, startTime, finishTime, eventType, ...)`
  - Stores content/timer/event fields.
  - Calls `processLogin(false)`.
  - Calls `processStartEvent(...)`.
  - Plays the start cutscene unless `cutsceneName == "none"`.
  - Calls `_fadeInNowLoadingForNoticeEventJustInArea` for no-cutscene starts.
  - Calls `processStartEffect()` when `eventType != 0`.
  - Opens the information widget.
  - Sets `initFlag = true`.
- `reloginEvent(contentID, startTime, finishTime, eventType, clearFlag)`
  - Restores duty state after relog.
- `clearEvent`
  - Orders desktop mode `126`, closes the info widget, and notifies text `52021`.
- `failedEvent(reason)`
  - Notifies `52065`, `52054`, `52010`, or `52093` for reasons `1..4`.
  - Uses the public failure effect for non-reason-1 failures.
- `_onReceiveDataPacket`
  - Only acts after `initFlag` is true.
  - Type `1`: mark clear, update timer, close info.
  - Type `2`: mark clear, stop timer, close info.
  - Type `3`: call `processUserMessage(...)`.
- `openInformationWidget`
  - Calls `desktopWidget:openRaidDungeonExecutionWidget(nil, contentID, finishTime)`.
- `processStartEffect`
  - Opens public effect `1`.
- `processFailedEffect`
  - Opens public effect `3`.

Trial-like classes are thin subclasses of this base. No separate trial HUD was found.

### Trial/Duty Subclasses

Recovered instance raid subclasses include:

- `InstanceRaidAurumVale`
- `InstanceRaidBeaconBattle`
- `InstanceRaidCuttersCry`
- `InstanceRaidDarkMoogle`
- `InstanceRaidHyperIfrit`
- `InstanceRaidLesserGaruda`
- `InstanceRaidLesserIfrit`
- `InstanceRaidLesserWhiteGeneral`
- `InstanceRaidNormalGaruda`
- `InstanceRaidNormalIfrit`
- `InstanceRaidNormalWhiteGeneral`

Most are empty wrappers over `InstanceRaidBaseClass`.

Notable exceptions:

- `InstanceRaidLesserIfrit.processStartEvent(arg, owner)` optionally executes cutscene `GC010105`.
- `InstanceRaidLesserWhiteGeneral.processStartEvent(owner)` executes `gc010715`.
- `InstanceRaidLesserWhiteGeneral.processCutSceneEvent(cutscene, owner, weather)` fades out, changes weather, executes the cutscene, then fades in.

### Instanced-Content Cutscene Coverage

Sources:

- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_live_api_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_live_literal_keys.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_map.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_key_asset_crosscheck.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_per_content_matrix.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_per_content_matrix.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_absence_support_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_absence_support_scan.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_graph.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_dynamic_launch_graph.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_usage_audit.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_usage_audit.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_lua_exact_hits.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_replay_key_lua_exact_hits.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_deep_audit_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_coverage_summary.json`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_static_evidence_deepening.csv`
- `tools/outputs/lpb/content_systems_20260612/instance_content_cutscene_confidence_after_static_mining.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_server_native_boundary_followup.csv`

This focused pass separated the live director lane from the replay/story lane.

Live/direct lane:

| Measure | Count |
|---|---:|
| Instance-related live cutscene API rows | 21 |
| Instance-related Lua files with live cutscene API rows | 6 |
| Direct live literal scene keys | 8 |
| Direct live literal keys with `client/cut` assets | 8 |
| Direct live literal keys with replay rows | 8 |

Direct live literal keys:

| Key | Script | Content guess | Evidence |
|---|---|---|---|
| `rad0f300` | `director/occupancy/raidfst0dungeon03.lua` | Content `1`, Toto-Rak | Opening path in `eventNoticeCutScene`; asset and replay row present |
| `rad0f306` | `director/occupancy/raidfst0dungeon03.lua` | Content `1`, Toto-Rak | Closing path; asset and replay row present |
| `rad0f307` | `director/occupancy/raidfst0dungeon03.lua` | Content `1`, Toto-Rak | Closing path; asset and replay row present |
| `rad0f308` | `director/occupancy/raidfst0dungeon03.lua` | Content `1`, Toto-Rak | Closing path; asset and replay row present |
| `rad0r100` | `director/occupancy/raidroc0dungeon01.lua` | Content `2`, Dzemael/Thanalan raid set | Opening path; asset and replay row present |
| `rad0r106` | `director/occupancy/raidroc0dungeon01.lua` | Content `2`, Dzemael/Thanalan raid set | Closing path; asset and replay row present |
| `GC010105` | `director/instanceraid/instanceraidlesserifrit.lua` | Ifrit/Bowl of Embers lesser path | `executeCutScene`; asset and replay rows present |
| `gc010715` | `director/instanceraid/instanceraidlesserwhitegeneral.lua` | Content `15`, Rivenroad/WhiteGeneral path | `executeCutScene`; asset and replay rows present |

Dynamic launch graph:

| Path | Scene source | Static keys | Read |
|---|---|---|---|
| `InstanceRaidBaseClass.startEvent` | `A1_20` server packet arg | None | Stores content ID from `A4_23`; executes supplied scene unless it is `"none"` |
| `InstanceRaidBaseClass.exitCutScene` | `A1_38` server packet arg | None | Dynamic exit/warp cutscene hook |
| `InstanceRaidBaseClass.cutSceneEvent` | `A1_42` server packet arg | None | Dynamic mid-duty cutscene hook |
| `InstanceRaidBaseClass.executeCutScene` | Caller supplied | None | Normalizes InstanceRaid cutscenes to `startCutScene(1,63,flag,...)` |
| `InstanceRaidLesserIfrit.processStartEvent` | Hard-coded subclass literal | `GC010105` | Only Ifrit subclass with a static live literal |
| `InstanceRaidLesserWhiteGeneral.processStartEvent` | Hard-coded subclass literal | `gc010715` | Static Rivenroad/WhiteGeneral live literal |
| `InstanceRaidLesserWhiteGeneral.processCutSceneEvent` | `A1_3` server packet arg | None | Dynamic Rivenroad scene after weather change |
| `RaidFst0Dungeon03.eventNoticeCutScene` | `A2_5` event notice arg | `rad0f300`, `rad0f306`, `rad0f307`, `rad0f308` | Toto-Rak occupancy path; opens content ID `1` HUD |
| `RaidRoc0Dungeon01.eventNoticeCutScene` | `A2_5` event notice arg | `rad0r100`, `rad0r106` | Dzemael occupancy path; opens content ID `2` HUD |
| `CutSceneOnceBeaconPrefaceJudge.processEvent` | `A2_2` preface event arg | None | Confirms Castrum/Beacon dynamic cutscene hook, but no static scene key |
| `ChocoboRideCommand.myChocoboCutScene` | Hard-coded literal | `sum6a000` | Delete-only/preload reference; no `startCutScene`, not a duty launcher |

Deep dynamic launch trace follow-up:

- Modern `InstanceRaidBaseClass` scene launch is now over 95% for client mechanics. The scene-bearing entrypoints are `startEvent(cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType, ...)`, `exitCutScene(cutsceneName, owner, modeFlag)`, and `cutSceneEvent(cutsceneName, ...)`. All three pass the supplied name through `executeCutScene`, which normalizes playback to `startCutScene(1, 63, mode, ...)`.
- `reloginEvent`, `clearEvent`, `failedEvent`, and `_onReceiveDataPacket` do not supply or launch scene keys. `_onReceiveDataPacket` types `1`, `2`, and `3` are clear/timer/user-message paths, not hidden cutscene launchers.
- Legacy occupancy launchers use a separate `startCutScene(1, 61, 1, 0, arg)` lane. The recovered static occupancy keys remain Toto-Rak `rad0f300` and `rad0f306..308`, plus Dzemael `rad0r100` and `rad0r106`.
- The Castrum/Beacon preface helper is real and exact at the client boundary: `CutSceneOnceBeaconPrefaceJudge.processEvent` plays its second event argument with `startCutScene(1, 61, 1)`. The helper still does not reveal which `bcn0l*` value retail supplied.
- The local server protocol shape is now mapped well enough to separate packet mechanics from missing retail values: `KickEvent` is opcode `0x012F`, client event-start is `0x012D`, server `RunEventFunction` is `0x0130`, client event-update is `0x012E`, generic data is `0x0133`, and event close is `0x0131`. `LuaEngine.EventStarted` prepends `eventType` and `eventName` before dispatching or resuming a wait; `LuaEngine.OnEventUpdate` resumes waits with returned Lua params.
- No local C# or `Data/scripts` caller was found for `startEvent`, `exitCutScene`, or `cutSceneEvent` with retail instance values. That keeps exact Aurum/Cutter live timing, exact Ifrit scene-key selection, and Castrum preface scene values in the server-argument/capture bucket, not in the missing-client-Lua bucket.

Static evidence deepening follow-up:

| Claim | Confidence after this pass | What is still not 95% |
|---|---:|---|
| Ifrit content ID `4` is the non-Hard Bowl / `It Kills with Fire` family | 97% | Exact server-passed scene key for every live launch |
| Ifrit content ID `3` is Bowl (Hard) / `Ifrit Bleeds` | 97% | Whether each replay key is selected by `startEvent` args or subclass `processStartEvent` in every retail case |
| Ifrit content ID `14` is Bowl (Extreme), relic-gated after `Ifrit Bleeds` | 97% | Exact live scene args for `InstanceRaidHyperIfrit` |
| Aurum Vale identity, replay rows, and no static Lua live literal | 98% | Exact live launch condition for `rad0r400..rad0r403`, if any |
| Cutter's Cry identity, replay rows, and no static Lua live literal | 98% | Exact live launch condition for `rad0w500..rad0w503`, if any |
| Castrum/Beacon content and replay classification | 98% | Exact dynamic preface `bcn0l*` key supplied by retail event data |
| Beacon preface client path | 98% | Which `bcn0l*` key retail passes as event arg 2 |
| Repo packet opcode/field shape | 96% | Retail-native timing, cancel/finalize order, and reward/chest sequencing |

Evidence anchors for the raised rows are in `instance_content_cutscene_static_evidence_deepening.csv/json`. The important correction is that Ifrit's content-tier mapping is now over 95%, while exact scene-key selection remains below 95 because `NormalIfrit` and `HyperIfrit` expose no literal and `InstanceRaidBaseClass` accepts the scene name from event args. Aurum/Cutter similarly move over 95% for identity plus static absence, but not for exact live launch timing.

Server/native boundary follow-up:

| Claim | Confidence after this pass | Read |
|---|---:|---|
| Local server/Data/.codex-tmp static scene-arg absence | 99% for local corpus absence | Fixed-string scan found 0 hits for `startEvent`, `exitCutScene`, `cutSceneEvent`, `processCutSceneEvent`, `rad0r400..403`, `rad0w500..503`, `bcn0l`, and `GC010105/gc010105` in local server scripts. This proves absence in the local corpus, not the original retail server values. |
| Aurum/Cutter guide live entry path | 98% no client Lua scene launcher | The no-quest guide scripts load text groups `9920`/`9936`, run explain/requirements/entry selection, and return true from the entry branch; the `InstanceRaidAurumVale` and `InstanceRaidCuttersCry` wrappers are empty. |
| Dynamic InstanceRaid values | 97% client mechanics / 78-82% exact values | `InstanceRaidBaseClass` argument positions and playback mode are bounded, but exact retail scene keys are still server arguments. |
| Castrum/Beacon preface | 98% content+path / 80% exact key | The preface judge plays event argument 2 via `startCutScene(1, 61, 1)`; no static `bcn0l*` literal was found in local server/Data/.codex-tmp. |

Mapped replay/story lane:

| Tier | Rows | Unique keys | Rows with assets | Direct live keys |
|---|---:|---:|---:|---:|
| Content replay | 14 | 14 | 14 | 0 |
| Content replay/live occupancy | 16 | 16 | 16 | 6 |
| Live trial/primal + replay | 3 | 1 | 3 | 1 |
| Live trial/Rivenroad + replay | 3 | 1 | 3 | 1 |
| GC/primal replay | 6 | 2 | 6 | 0 |
| Party-matching linked replay | 23 | 8 | 23 | 0 |
| Story/replay entry candidate | 15 | 15 | 15 | 0 |

That gives 80 mapped instanced-content replay rows, 57 unique instance-related scene keys, 80 rows with physical assets, and 0 missing physical assets.

Exact Lua usage classification for those 57 unique keys:

| Classification | Unique keys | Meaning |
|---|---:|---|
| Live duty launcher/gate | 8 | The 8 direct keys listed above; these pass through `executeCutScene` or occupancy `eventNoticeCutScene` |
| Quest/story launcher literal | 18 | 15 `com0*` Toto-Rak/company story candidates in `quest/scenario/com/*`, plus `gc010710`, `gc010714`, and `gc010750` in `quest/scenario/gcl/gcl107.lua` |
| Delete-only/preload reference | 1 | `sum6a000` appears in `ChocoboRideCommand.myChocoboCutScene`, but only as `createCutScene(...):_delete()` |
| Replay asset only or dynamic server arg | 30 | No exact Lua literal; represented by replay rows and assets, or by dynamic packet arguments |

The 30 replay-asset-only or dynamic-argument keys break down into 18 legacy raid/dungeon keys, 6 Hamlet keys, 3 Rivenroad/WhiteGeneral keys, 2 Rivenroad Hard keys, and 1 Ifrit/GC key. This is the cleanest boundary found so far: if a key is not in the 8 live duty gates or the 18 quest/story launchers, the recovered client only exposes it through replay data, physical scene assets, or a dynamic server-supplied scene argument.

Content-oriented grouping:

| Content / group | Rows | Unique keys | Direct live keys |
|---|---:|---:|---:|
| Content `1`, The Thousand Maws of Toto-Rak | 9 | 9 | 4 |
| Toto-Rak/company entry story candidates | 15 | 15 | 0 |
| Content `2`, Dzemael Darkhold | 7 | 7 | 2 |
| Content `6`, Aurum Vale | 4 | 4 | 0 |
| Content `7`, Cutter's Cry | 4 | 4 | 0 |
| Ifrit/Bowl of Embers lesser path | 3 | 1 | 1 |
| Ifrit-related GC replay path | 6 | 2 | 0 |
| Content `8`, Battle for Aleport | 2 | 2 | 0 |
| Content `9`, Battle for Hyrstmill | 2 | 2 | 0 |
| Content `10`, Battle for the Golden Bazaar | 2 | 2 | 0 |
| Content `15`, Rivenroad / WhiteGeneral path | 24 | 7 | 1 |
| Content `16`, Rivenroad (Hard) | 2 | 2 | 0 |

Per-content `xtx_raidDungeon` matrix:

| ID | Duty | Live literals | Replay rows (base hard map) | Confidence | Evidence read |
|---:|---|---:|---:|---|---|
| 1 | The Thousand Maws of Toto-Rak | 4 | 24 | High | `raidfst0dungeon03` validates `rad0f300` and `rad0f306/307/308`; replay adds `rad0f301..305` and `com0*` entry candidates |
| 2 | Dzemael Darkhold | 2 | 7 | High | `raidroc0dungeon01` validates `rad0r100` and `rad0r106`; replay adds `rad0r101..105` |
| 3 | The Bowl of Embers (Hard) | 1 | 9 | High for tier, medium for exact scene args | `xtx_raidDungeon`, quest rows, boss rows, and patch notes align this with `Ifrit Bleeds`; exact scene-key selection is still server argument data |
| 4 | The Bowl of Embers | 1 | 9 | High for tier, medium for exact scene args | `xtx_raidDungeon`, city `It Kills with Fire` quests, and level 35 Ifrit/nail rows align this with the non-Hard Bowl family; `InstanceRaidLesserIfrit` is the only static live literal path |
| 5 | Thornmarch | 0 | 0 | High | `InstanceRaidDarkMoogle` and Moogle trial scripts have no cutscene literal/API launcher |
| 6 | Aurum Vale | 0 | 4 | High for identity/static absence | Content ID, zone rows, quest `110823`, relic journal text, and replay rows `rad0r400..403` align; no static Lua launcher found |
| 7 | Cutter's Cry | 0 | 4 | High for identity/static absence | Content ID, zone rows, quest `110824`, relic journal text, boss row, and replay rows `rad0w500..503` align; no static Lua launcher found |
| 8 | The Battle for Aleport | 0 | 2 | High | Hamlet replay rows `ham0s201` and `ham0s202` are asset-backed; subclass has no literal |
| 9 | The Battle for Hyrstmill | 0 | 2 | High | Hamlet replay rows `ham0f301` and `ham0f302` are asset-backed; subclass has no literal |
| 10 | The Battle for the Golden Bazaar | 0 | 2 | High | Hamlet replay rows `ham0w201` and `ham0w202` are asset-backed; subclass has no literal |
| 11 | The Howling Eye (Hard) | 0 | 0 | High | `InstanceRaidNormalGaruda` and Garuda trial scripts have no cutscene literal/API launcher |
| 12 | The Howling Eye | 0 | 0 | High | `InstanceRaidLesserGaruda` and Garuda trial scripts have no cutscene literal/API launcher |
| 13 | Castrum Novum Transmission Tower | 0 | 0 | High for content/replay classification, medium for exact preface key | `United We Stand`, zones `251/264`, replay `bcn0l*` rows, and the widget's `11082001..11082020` bucket align; preface key is event arg data |
| 14 | The Bowl of Embers (Extreme) | 1 | 9 | High for tier, medium for exact scene args | `xtx_raidDungeon`, Patch 1.22c, A Relic Reborn journal text, and `etc106` text align this with Extreme; `InstanceRaidHyperIfrit` itself is a no-literal wrapper |
| 15 | Rivenroad | 1 | 24 | High | `InstanceRaidLesserWhiteGeneral` starts `gc010715`; party-matching-linked GC replay rows are asset-backed |
| 16 | Rivenroad (Hard) | 0 | 2 | Medium-high | Replay rows `sum6w010` and `sum6w020` are asset-backed; live launch is likely dynamic/server-driven |

Expanded story-adjacent replay sweep:

| Candidate group | Rows | Unique keys | Scope read |
|---|---:|---:|---|
| Corrected hard instance map | 80 | 57 | Base map used above |
| Castrum Novum / United We Stand | 10 | 4 | Content `13` story-adjacent Beacon/Castrum replay rows; dynamic preface helper recovered, no static live literal |
| Garuda / Howling Eye story candidates | 14 | 7 | Content `11/12` story-adjacent Garuda rows from `Taming the Tempest` and `In for Garuda Wakening` |
| Rivenroad / Living on a Prayer lead-in | 6 | 6 | Content `15/16` story-adjacent Nael/Rivenroad lead-in rows |
| Moogle / Nightmare trial-adjacent candidates | 4 | 4 | Content `5` trial-adjacent `sum6m`/DRM rows; no Thornmarch duty launcher literal |
| Grand Company residual story bridge candidates | 15 | 11 | Grand Company/MSQ bridge rows near the Garuda/Castrum/Rivenroad quest band; Lua `startNQCutScene` support, no direct duty launcher |
| Public stronghold reference rows | 3 | 3 | Out-of-core-scope rows for U'Ghamaro, Natalan, and Zahar'ak, retained only as references |

The expanded in-scope/story-adjacent view is 129 rows / 89 unique keys, all asset-backed. Including the public-stronghold reference rows makes the broad candidate table 132 rows / 92 unique keys, still with 0 missing physical assets. A residual sweep also records two asset-backed `etc5g*` replay rows (`Waste Not Want Not`, `In Plain Sight`) as excluded general-story rows because they have no duty, InstanceRaid, raid, trial, Hamlet, Caravan, Castrum, Garuda, Moogle, or Rivenroad linkage.

Absence support scan:

| Family | Content IDs | Recovered scripts | Cutscene API rows | Direct literals | Mapped replay rows | Read |
|---|---|---:|---:|---:|---:|---|
| Aurum Vale | 6 | 4 | 0 | 0 | 4 | Guide, instance wrapper, barrier, and status scripts recovered with no live launcher; replay rows `rad0r400..403` exist |
| Cutter's Cry | 7 | 2 | 0 | 0 | 4 | Guide and instance wrapper recovered with no live launcher; replay rows `rad0w500..503` exist |
| Thornmarch/Dark Moogle | 5 | 16 | 0 | 0 | 0 | Moogle monster/director and instance wrapper scripts recovered with no separate launcher |
| Garuda/Howling Eye | 11,12 | 11 | 0 | 0 | 0 | Garuda monster/director/command and instance wrapper scripts recovered with no launcher |
| Castrum Novum/Beacon | 13 | 5 | 3 | 0 | 0 | Only dynamic preface-judge cutscene API calls; no static scene key |
| Ifrit/Bowl of Embers | 3,4,14 | 21 | 1 | 1 | 9 | Content-tier split is over 95; exact live scene-key selection is server argument data |
| Rivenroad/WhiteGeneral | 15,16 | 15 | 2 | 1 | 26 | WhiteGeneral live/replay evidence exists; hard-mode live literal is not visible |

The confidence here is high for the client-side surface: live director literals, dynamic launch graph, replay rows, per-duty wrappers, absence scans, physical scene folders, static quest/zone rows, and patch/journal text line up. The Ifrit normal/hard/extreme content-tier semantics are now over 95%; the remaining medium-confidence pieces are exact Ifrit scene-key selection, the dynamic Castrum preface scene argument, and whether some replay-only or dynamic-argument scenes are ever launched by live duty flow. Those are packet/state questions, not missing client data.

Remaining uncertainty after the dynamic and static follow-ups:

| Bucket | Current confidence | Read |
|---|---|---|
| Dynamic client launch graph | 97% | Client mechanics and packet/event lanes are recovered; retail scene values are separate. |
| Event packet field shape | 97% local protocol / 88% retail timing | Local opcodes and fields are mapped for EventStart `0x012D`, KickEvent `0x012F`, RunEventFunction `0x0130`, and EndEvent `0x0131`; retail-native cutscene init/finalize timing still needs capture. |
| Aurum Vale live launch condition | 98% identity+static absence / 70% exact live condition | `rad0r400..403` exist and are replay/asset backed; `xtx_raidDungeon`, zones, `A Relic Reborn` journal text, and exact Lua absence align. Retail live use would have to be a dynamic `startEvent`, `exitCutScene`, or `cutSceneEvent` value. |
| Cutter's Cry live launch condition | 98% identity+static absence / 70% exact live condition | `rad0w500..503` exist and are replay/asset backed; `xtx_raidDungeon`, zones, `A Relic Reborn` journal text, boss rows, and exact Lua absence align. Retail live use would have to be dynamic. |
| Ifrit normal/hard/extreme split | 97% content-tier mapping / 78-82% exact scene-key selection | IDs `4`, `3`, and `14` now line up with non-Hard, Hard/`Ifrit Bleeds`, and Extreme; `GC010105` is still the only static Ifrit live literal, and `NormalIfrit`/`HyperIfrit` expose no literal. |
| Castrum/Beacon exact preface scene | 98% content+path / 80% exact key | `United We Stand`, Transmission Tower zones, replay rows, and preface helper align; exact `bcn0l*` value is server/event data. |
| Expanded story-adjacent rows | 99% existence / 96% direct duty or quest-progression relevance where named | Assets and replay rows are solid; A Relic Reborn and Castrum journal text directly name several rows, but direct live duty-launch versus story-bridge classification still needs quest-stage or capture evidence. |
| Local server exact scene-arg scan | 99% local absence / not a retail-value proof | `Map Server`, `Data`, and `.codex-tmp/Garlemald-Server` contain no static target terms for the unresolved scene args; exact retail values still need capture/original server data. |
| Chocobo Caravan timing | 98% client UI protocol / 97% local server lifecycle / 96% client reward dialog API / 96-97% retail eligibility text / 85% retail timing | Client widget protocol, local route implementation, reward/entry dialog signatures, and patch/journal reward eligibility text are mapped; original retail step timing, contribution thresholds, cargo accounting, reward amounts, and reward/fail sequence remain below 95. |
| Reward/chest sequencing | 98% named item identities / 96-98% static eligibility+resolver / 95-98% local event-wait+inventory packet mechanics / 92-98% path-specific local reward order / 70-85% exact retail tables+trigger timing | Static item/source/eligibility evidence is strong. The local `RunEventFunction 0x0130 -> _WAIT_EVENT -> EventUpdate 0x012E -> coroutine resume` lane, `EndEvent 0x0131` shape, and inventory transaction packets are now 95%+. Local guildleve completion, guildleve chest, BattleNpc kill rewards, Hamlet claim, and Behest claim each have over-90 event/packet ordering. Exact retail drop tables, cancel behavior, distribution, batching policy, and original trigger timing are not recovered. |
| Native SQWT/form/tpl internals | 99% installed container/header profile / 95-96% packed payload classification / 95-97% native parser/control vocabulary / 93-95% terminal footer clues / 78-82% requested decoded layout tree | All 710 installed `.form`/`.tpl` rows under `client/sqwt` start with `SQEX 00 00 00 00`, have high-entropy payloads, and expose no raw XML/control-template text. Of 51 sidecars, 49 are also `SQEX` containers and only 2 web CSS files are plain-text likely. Native binaries expose SQWT source residue, `SqwtDesignData`, `ControlTemplate`/`DataTemplate`, control classes, skin/style fields, and asset extensions. Terminal suffixes expose `Window`/`Dictionary` fragments, but the requested content widget control trees still need a parser/native trace. |

### Trial Monster And Command Scripts

The broad pass added 61 trial-family scripts, mostly under:

- `chara/npc/monster/ifrit/*`
- `chara/npc/monster/garuda/*`
- `chara/npc/monster/moogle/*`
- `chara/npc/monster/whitegeneral/*`
- `director/monster/*`
- `command/game/weaponskill/*`
- `command/game/basic/garudaothers.lua`

These are almost all thin class wrappers over existing base classes such as `MonsterBaseClass`, `MonsterDirectorBaseClass`, `DirectorBaseClass`, `WeaponSkillBaseClass`, or `BattleCommandBaseClass`. The useful takeaway is negative but strong: the trial boss Lua files identify actor/director/command class names, but they do not contain a separate trial HUD, duty launch path, Thornmarch widget, or visible Lua-side boss mechanic script. That supports the instance raid base/HUD model above and implies most trial behavior is native/data/server-driven.

### Party Matching Content Lists

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/pcmatchingeditwidget.lua`

`PcMatchingEditWidget` is not an execution HUD, but it is a separate client-side index of duty availability. It reads `_getOccupancyContentsTime(...)` and populates lists for raid, primal/trial, Hamlet, and Chocobo content.

Raid list content IDs:

| Slot | Content ID |
|---:|---:|
| 1 | 1 |
| 2 | 2 |
| 3 | 6 |
| 4 | 7 |
| 5 | 13 |

Primal/trial list content IDs:

| Order | Content / quest value added |
|---:|---:|
| 1 | 4 |
| 2 | 3 |
| 3 | 14 |
| 4 | 5 |
| 5 | 12 |
| 6 | 11 |
| 7 | 111433, 111633, or 111833 for content ID `15`, depending on Grand Company |
| 8 | 110870 for content ID `16` |

The same list masks some place IDs during selection: `3019`, `3038`, `1280078`, and `1280099`.

Hamlet list content IDs:

| Slot | Content ID |
|---:|---:|
| 1 | 8 |
| 2 | 9 |
| 3 | 10 |

Chocobo list rows are hardcoded route/place pairs:

| Slot | Value 1 | Value 2 |
|---:|---:|---:|
| 1 | 1280005 | 1031 |
| 2 | 1280003 | 1030 |
| 3 | 1280066 | 2004 |
| 4 | 1280073 | 2003 |
| 5 | 1280034 | 3043 |
| 6 | 1280033 | 3044 |

This widget gives a useful independent check on content IDs `1..16`, including Hamlet `8..10`, Thornmarch `5`, and the later Rivenroad-style quest-value entries for `15` and `16`.

### Older Occupancy Dungeon Directors

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/director/occupancy/raidfst0dungeon03.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/director/occupancy/raidroc0dungeon01.lua`

The Thousand Maws of Toto-Rak:

- Opening cutscene: `rad0f300`
- Closing cutscenes: `rad0f306`, `rad0f307`, `rad0f308`
- Opens `openRaidDungeonExecutionWidget(2123, 1, finishTime)`.
- Opens public effect `1`.
- Relog opens the execution widget again when not already clear.

Dzemael Darkhold:

- Opening cutscene: `rad0r100`
- Closing cutscene: `rad0r106`
- Opens `openRaidDungeonExecutionWidget(4102, 2, finishTime)`.
- Opens public effect `1`.

These older occupancy scripts pass an extra numeric value before the real content ID. The current desktop connector ignores that first explicit value and uses the next value as `contentID`.

### Entry And Exit Guides

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/instanceraidguide/noquestguidebaseclass.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/instanceraidguide/instanceraidguideaurumvale.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/instanceraidguide/instanceraidguidecutterscry.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/instanceraidexit.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/judge/instanceraidguidejudge.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/judge/preface/cutsceneoncebeaconprefacejudge.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/judge/depictionjudge.lua`
- `docs/Dat Mining/instanceRaidGuideAurumVale.csv`
- `docs/Dat Mining/instanceRaidGuideCuttersCry.csv`

`InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)` asks text `52045` with choices `52046` and `52047`, returning true when choice `1` is selected.

`InstanceRaidExit.askExit(arg)` asks text `52042` with choices `52043` and `52044`, returning true when choice `1` is selected.

`NoQuestGuideBaseClass.askExplainInstanceRaid(...)` is the common guide-menu loop for explain/requirements/enter/leave flows. The no-quest concrete guides recovered here are:

| Class | Text group | DAT rows | Notable behavior |
|---|---:|---:|---|
| `InstanceRaidGuideAurumVale` | 9920 | 20 | Uses choices `4..7`; explains lore, party/level requirements, timeout/retry, quest requirement text, and entry confirmation. |
| `InstanceRaidGuideCuttersCry` | 9936 | 30 | Uses choices `4..7`; rank-sensitive text via `isUpperRank(3, 17)`, salute/scheduler `353959936`, requirements, timeout/retry, and entry confirmation. |

`InstanceRaidGuideJudge` is an empty `JudgeBaseClass` shell. `CutSceneOnceBeaconPrefaceJudge` is a one-shot preface helper: fade out, create/start the supplied cutscene with `startCutScene(1, 61, 1)`, delete it, then fade in. `DepictionJudge` handles nameplate, target-information, and map-marker display for content groups such as `30001` and `30006`; it uses icon `246` for content-member target display. None of these judges add a separate launch/HUD path.

### Local Event Packet Reprobe

Sources:

- `Map Server/Actors/Chara/Player/Player.cs`
- `Map Server/Packets/Receive/Events/EventStartPacket.cs`
- `Map Server/Packets/Send/Events/KickEventPacket.cs`
- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`
- `Map Server/Packets/Send/Events/EndEventPacket.cs`
- `tools/outputs/lpb/content_systems_20260612/content_systems_runtime_boundary_reprobe.csv`

The local event lane is now over 95% for field shape, separately from original retail timing:

| Packet/path | Opcode | Local shape now pinned | Still below 95 |
|---|---:|---|---|
| `EventStartPacket` | `0x012D` | Reads trigger actor, owner actor, server codes, unknown, event type, event name, and Lua params. `Player.StartEvent` stores owner/name/type for follow-up calls. | Retail timing and duty-specific scene values |
| `KickEventPacket` | `0x012F` | Writes trigger actor, owner actor, event type, server-code constants, event name, then Lua params at `0x30`. | Native ordering around forced opens/cancels |
| `RunEventFunctionPacket` | `0x0130` | Writes trigger actor, owner actor, event type, event name, function name at `0x29`, and Lua params at `0x49`; `Player.RunEventFunction` uses the current event owner/name/type. | Which scene key retail supplies for each dynamic duty state |
| `EndEventPacket` | `0x0131` | Writes source player, zero close-owner field, event type, and event name; `Player.EndEventWithType` then clears local current-event state. | Cutscene finalize, cancel, chest/reward ordering, and exact close timing |

This raises the emulator-side packet confidence, but it deliberately does not fill in the unresolved retail scene args. `InstanceRaidBaseClass.startEvent`, `exitCutScene`, `cutSceneEvent`, and `CutSceneOnceBeaconPrefaceJudge.processEvent` still take scene names from event/server args.

### Raid Objects And Treasure

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeontreasurebox.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/treasurebox/instanceraidtreasurebox.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeonexit.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeonwarp.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeonbarrier.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeonlight.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/contentprivatearearange.lua`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_caravan_static_followup.csv`

`RaidDungeonTreasureBox` contains the main Lua-side drop resolver:

- `processOpenDzemaelEpicQuestType(player)` checks offering quest `110868`.
- If `isDropDzemael(player)` is true and the player does not already have item `10011244`, it resolves the box drop and calls `addDropItemForPlayer(...)`.
- If no item is granted, it prints system message `60027`.
- It runs scheduler `67932160` after opening.

Drop resolution:

- `getDropItem()` reads `work.dropID`.
- `getDropItemDirect(dropID)` reads `dropSheet` columns `0`, `1`, and `7`.
- `dropSheet` column `7` points to a `dropTableSheet` ID.
- `dropTableSheet` type `0` means individual rolls for slots `1..8`.
- `dropTableSheet` type `1` means select-one roll across slots `1..8`.
- Per-slot item data is read from six-column groups in `dropTableSheet`.
- `dropQualitySheet` is consulted for simple quality values.
- `addDropItemForPlayer` uses player inventory checks before adding items and can print full-inventory system message `25262`.

`InstanceRaidTreasureBox` itself is only a thin subclass of `TreasureBoxBaseClass`; the richer raid-specific logic is in `RaidDungeonTreasureBox`.

The resolver algorithm is now over 95% for the recovered Lua path, but not for retail reward data. A repo-wide reward probe found no preserved `dropSheet`, `dropTableSheet`, or `dropQualitySheet` CSVs/tables in this workspace; the decompiled treasure box expects those sheets to exist at runtime. For guildleve bonus chests, the local server is even clearer: `GuildleveChestsEnabled` is false by default, and `Data/scripts/guildleve_chests.lua` explicitly marks the 1.x chest chances and rewards as best guesses. So the current read is:

| Reward/chest layer | Confidence | Still below 95 |
|---|---:|---|
| `RaidDungeonTreasureBox` resolver mechanics | 96% | Exact drop IDs, table contents, party distribution, and chest spawn/open timing |
| `InstanceRaidTreasureBox` class surface | 98% | Meaningful behavior is inherited or elsewhere |
| Local guildleve chest implementation status | 97% | Retail leve chest rates and reward pools |

Static reward/coffer follow-up:

| Claim | Confidence | What is over 95 | Still below 95 |
|---|---:|---|---|
| Aurum/Cutter A Relic Reborn coffers | 96% static condition | Patch 1.22b ties coffers to accepting `A Relic Reborn`; Gerolt/item text ties `Miser's Mythril` to Aurum Vale and `Alumina Salts` to Cutter's Cry. | Exact special requirements, spawn points, drop IDs, and live timing |
| `Miser's Mythril` | 98% item/source/quantity | Gerolt asks for 3; item text names Miser's Mistress and Aurum Vale. | Exact chest/drop script and probability |
| `Alumina Salts` | 98% item/source/quantity | Gerolt asks for 3; item and quest text name the Chimera in Cutter's Cry. | Exact chest/drop script and probability |
| Dzemael `Enchiridion` resolver | 97% client resolver | `RaidDungeonTreasureBox` gates quest `110868`, checks item `10011244`, resolves a drop, and uses inventory-safe grant logic. | Exact `dropSheet`/`dropTableSheet` rows and chest timing |
| Castrum coffer keys | 98% item identity/source | Copper/Silver/Gold Castrum coffer keys are present in item tables and name Castrum Novum. | Chest/key mechanics and reward table |
| Garuda Hard chest eligibility | 97% retail reward condition | Patch text requires `Vortex Fletchings` for chest rewards. Its initial `Vortex Headdress` reward wording predates the official 1.22b Totem/Headdress name correction; the corrected local item and Rowena contracts identify reward token `10011154` as `Vortex Totem`. | Chest spawn, loot-list packet order, and distribution |

Trial reward/access follow-up:

- Garuda access is now over 95% static evidence. `gcl104.csv` has the `Vortex Feather` (`11000431`) to `Vortex Catcher` (`11000432`) conversion, says the catcher functions like the Ifrit flambeau, and says it grants passage through the Feathergorge beastman aetheryte to the Howling Eye. The same text pins the normal Garuda party requirement to 4-8 Disciples of War/Magic level 40+, 30 minutes, and a retry cooldown.
- The Relic Reborn final trial material source is now over 95% static evidence. SQL and DAT item rows name `White-hot Ember` (`11000367`) and `Howling Gale` (`11000368`), while `etc106.csv` and `xtx_journalxtxFst.csv` say they are obtained by defeating Ifrit in the Bowl of Embers (Extreme) and Garuda in the Howling Eye (Hard) respectively.
- The Garuda Hard eligibility claim remains stronger than the exact table claim. Patch text says `Vortex Fletchings` gates treasure chest eligibility; its initial `Vortex Headdress` reward wording is the pre-1.22b name mix-up. Corrected item data and the recovered Rowena exchange identify `Vortex Totem` (`10011154`) as the Garuda weapon token, but no recovered Garuda Hard chest distribution supplies its exact roll table. Item/eligibility remains 97%; chest roll table and packet order remain about 75%.

Local reward packet sequencing follow-up:

Sources:

- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_probe.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_deep_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_packet_sequence_deep_summary.json`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_event_wait_deep_followup.csv`
- `tools/outputs/lpb/content_systems_20260612/content_systems_reward_event_wait_deep_summary.json`
- `Map Server/Actors/Chara/ItemPackage.cs`
- `Map Server/Packets/Send/Actor/Inventory/*.cs`
- `Map Server/Packets/Send/GameMessagePacket.cs`
- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`
- `Map Server/Packets/Send/Events/EndEventPacket.cs`
- `Map Server/Packets/Receive/Events/EventUpdatePacket.cs`
- `Map Server/Lua/LuaEngine.cs`
- `Map Server/PacketProcessor.cs`
- `Map Server/Actors/Chara/Npc/BattleNpc.cs`
- `Map Server/Actors/Director/GuildleveDirector.cs`
- `Map Server/Actors/Chara/Player/Player.cs`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeontreasurebox.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/contentrewardwidget.lua`
- `Data/scripts/global.lua`
- `Data/scripts/base/chara/npc/object/GuildleveWarpPoint.lua`
- `Data/scripts/base/chara/npc/object/GuildleveBonusTreasureBox.lua`

The emulator-side reward packet order is now over 95% for generic grants. `ItemPackage.AddItem` mutates the DB/list, then queues `InventoryBeginChange` (`0x016D`), `InventorySetBegin` (`0x0146`), one or more inventory list/remove packets (`0x0148..0x014C` or `0x0152..0x0156`), `InventorySetEnd` (`0x0147`), and `InventoryEndChange` (`0x016E`). Game/reward messages use `GameMessagePacket` variants `0x0157..0x016A`, selected by sender style and Lua-param payload size. Local reward code generally grants first, then sends the success/failure text.

The deeper event-wait follow-up moves the core local event lane over 95%. `callClientFunction` queues `RunEventFunction` and yields on `_WAIT_EVENT`; `LuaEngine.ResolveResume` registers the player coroutine; incoming `EventUpdate` (`0x012E`) is parsed by `PacketProcessor`, passed to `Player.UpdateEvent`, and resumed by `LuaEngine.OnEventUpdate` with returned Lua params. `RunEventFunctionPacket` (`0x0130`) carries trigger actor, owner actor, event type/name, function name, and Lua params. `EndEventPacket` (`0x0131`) carries source player, a zero close-owner field, event type, and event name before `Player.EndEventWithType` clears the active event fields. For guildleve completion this proves local reward grants happen after the reward widget event update, but the script still does not inspect the returned ask result before granting, so cancel-policy parity remains below 90-95.

Reward-path read:

| Path | Confidence now | Local order | Still below 95 |
|---|---:|---|---|
| Generic item/gil grant | 98% local packet order | Inventory begin -> set begin -> list/remove changed slots -> set end -> inventory end | Whether every original-retail duty reward batched identically |
| Blocking reward widget event | 96-98% local event wait/resume | `RunEventFunction 0x0130` -> `_WAIT_EVENT` registration -> `EventUpdate 0x012E` -> coroutine resume with Lua params | Original retail cancel/end-event policy and exact widget-close timing |
| Event close shape | 95-97% local packet shape | `EndEvent 0x0131` with source player, zero close-owner field, event type/name -> clear active event state | Exact original retail timing for when close is sent after every reward widget/chest path |
| Guildleve completion | 96-97% local order / 85-90% cancel policy | Reward widget event wait -> item transaction(s)+text `25228` -> EXP battle action -> gil transaction+levequest gil handler -> later warp/end-event path | Cancel behavior and original retail reward table/end-event timing |
| Guildleve bonus chest | 95-96% local closure | Chest event -> gil transaction+message -> optional loot transaction+message -> chest despawn/remove -> `EndEvent` | Retail leve chest rates, reward pools, and spawn/claim timing |
| BattleNpc kill rewards | 94-96% local sequence | Death recipients -> gil transaction/message -> per-drop loot transaction(s) or failure text -> kill hooks -> EXP battle action | Retail drop timing, party distribution, and original loot-pack presentation |
| `RaidDungeonTreasureBox` Dzemael path | 96% client resolver / 90-92% grant bridge | Quest/item gate -> drop table resolver -> can-add/full message -> `addItem` -> no-reward message `60027` -> scheduler | `dropSheet`/`dropTableSheet`/`dropQualitySheet`, chest spawn/open timing, loot-list UI order |
| Hamlet claim | 92-94% local sequence | End signal -> victory/final-rating text -> score menu attempt -> gil transaction -> reward message | Retail score/ranking payout and reward-window timing |
| Behest claim | 93-95% local sequence | Battlewarden reward phase -> director claim -> gil transaction+message -> EXP battle action -> final claimed text | Retail payout tuning and whether original client used a richer reward UI |
| Reward widgets | 97% display/result role | `ContentRewardWidget` confirm sets result `1`, cancel `-1`; grants happen elsewhere | Exact retail ordering between widget close, `EndEvent`, grant, and message |

Other raid object constants:

| Class | Text group / behavior |
|---|---|
| `RaidDungeonExit` | Loads text group `6736`, `raidDungeonExit`; exit prompts use `askExtendWidget` rows `1`, `4`, and `7`. |
| `RaidDungeonWarp` | Loads text group `6781`, `raidDungeonWarp`; active scheduler `67493888`; yes/no uses row `2`. |
| `RaidDungeonBarrier` | Loads text group `6829`, `raidDungeonBarrier`; read text `5`; yes/no uses row `2`. |
| `RaidDungeonLight` | Loads text group `6813`, `raidDungeonLight`; hides talkable map marker; yes/no uses row `1`. |
| `ContentPrivateAreaRange` | Map marker range labels are `exit` and `caution`. |

The private-area content and occupancy classes in this batch are thin wrappers over `PrivateAreaBaseClass`, so the visible Lua layer does not add another HUD or launch path.

## Chocobo Caravan

### Director

Source: `tools/outputs/lpb/content_systems_20260612/lua/director/caravanguard/caravanguarddirector.lua`

`CaravanGuardDirector` extends `DirectorBaseClass` and is the retail client-side controller for Chocobo Caravan. This means the real UI path is not the guildleve execution widget; it is the generic content-information path with kind `2`.

Initialization arguments:

- `town`
- `placeStart`
- `placeEnd`
- `name1`
- `name2`
- `name3`

Temp fields:

- `uiStep`
- `isFinished`
- `town`
- `placeStart`
- `placeEnd`
- `name1`
- `name2`
- `name3`

Synced fields:

- `step`
- `progressPer`
- `finishTime`
- `chocoboStatus[3]`
- `chocoboHPStatus[3]`
- `markerX[3]`
- `markerY[3]`
- `markerZ[3]`

Sync tags:

| Tag | Data |
|---|---|
| `step` | `step`, `finishTime` |
| `progress` | `progressPer` |
| `status` | `chocoboStatus`, marker arrays |
| `hp` | `chocoboHPStatus` |

UI integration:

- `getKindContentsInformation()` returns `2`.
- `getUIDataOpen()` returns `finishTime, town, placeStart, placeEnd, name1, name2, name3`.
- `getUIDataUpdate(1)` returns progress data.
- `getUIDataUpdate(2)` returns chocobo status and marker data.
- `getUIDataUpdate(3)` returns HP status data.

Step behavior:

| Step range/value | Behavior |
|---|---|
| `< 40` | Minimap destination marker |
| `40` | Public effect `14`, `15`, or `16` by town |
| `70` | Starts content widget, clears minimap, updates progress/status/HP |
| `80` | Marks finished and uses public effect `17`, `18`, or `19` by town |
| `90` | Marks finished and uses public failure effect `20` |
| Finalize | Clears minimap; if unfinished opens public effect `13`; if UI is open sends content `finish` |

The local server implementation raises the emulated lifecycle over 95% separately from retail timing. `Area.CreateChocoboCaravanDirector` creates path `ChocoboCaravan/RegionalCaravan`; `RegionalCaravan.main` calls `StartCaravan`; `ChocoboCaravanDirector` then validates the route, spawns the path companion, syncs start/info/marker data, sends the caravan actor to players, updates waypoint motion during `Area.Update`, computes progress from route distance, completes at destination, or fails/despawns through `EndChocoboCaravanDirector`. `ChocoboCaravanRoute` defaults are now pinned: display guildleve `10826`, move speed `4.0`, arrival distance `2.0`, update interval `0.75s`, progress objective index `0`, marker index `0`, and player-arrival distance `8.0`.

That means:

| Caravan layer | Confidence | Still below 95 |
|---|---:|---|
| Retail client UI protocol | 98% | None for the visible Lua/widget path |
| Local server route lifecycle | 97% | Production tuning and non-test route data |
| Client reward/entry dialog API | 96% | Exact reward values, cargo source, and eligibility timing |
| Original retail server timing/rewards | 85% | Step schedule, cargo accounting, enemy/guard state source, marker source, reward/fail sequence |

The retail reward-source text is stronger than the runtime timing. Rowena's `A Relic Reborn` journal row directly says `Oschon's Finger` (`10011246`) is obtainable through caravan escort missions at Camp Skull Valley, Camp Drybone, and Treespeak. Patch text also says high-level caravan escort rewards were added, and later requires players to form a party and actively protect the caravan to qualify for rewards, with warning messages for insufficient contribution. That raises caravan reward eligibility/source evidence to about 96-97%, while exact contribution thresholds, roll tables, and result packet timing stay around 85%.

The local reward dialog layer is now separately pinned. `PopulaceCaravanManager` documents and calls `caravanGuardEntry(areaGC, hasRoomForGCSeals, areaName, difficulty, playerGC, playerCountRequired, levelRequired)`. `PopulaceCaravanGuide` documents `caravanGuardReward(cargo, nil, areaName, playerGC, killCount, areaName2)`, `caravanGuardNotReward`, `caravanGuardFailReward`, `caravanGuardBonusReward`, and `caravanGuardNotBonusReward`. The comment pins cargo `0..9`, area totals `1..6`, low/high area offset `0/3`, GC mismatch text, and kill-count branches for `40..49` and `50+`. Its live local test call to `caravanGuardReward` is commented out, and `ChocoboCaravanDirector` has no grant-table path, so the API shape is over 95% but reward values/timing are not.

### Widget

Source: `tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua`

`ChocoboCaravanWidget` extends `WidgetBaseClass`.

Behavior:

- `setContents` uses text owner `10051`.
- `setTimer` uses the same 300/120 second warning thresholds as raid and Hamlet widgets.
- `setPlaceName` uses text owner `204` for start/end place names.
- `setCompanyIcon` maps town IDs to company icons:
  - `1`: 833
  - `2`: 834
  - `3`: 835

Chocobo movement statuses:

| Status | UI command |
|---:|---|
| 1 | `UILuaCommands.ChocoboWalk` |
| 2 | `UILuaCommands.ChocoboStop` |
| 3 | `UILuaCommands.ChocoboFlight` |
| 4 | `UILuaCommands.ChocoboEscaped` |
| 5 | `UILuaCommands.ChocoboReturn` |

HP statuses:

| Status | UI command |
|---:|---|
| 1 | `UILuaCommands.StatusNormal` |
| 2 | `UILuaCommands.StatusCaution` |
| 3 | `UILuaCommands.StatusDanger` |

Update types:

| Update type | Meaning |
|---:|---|
| 1 | Progress |
| 2 | Chocobo status and markers |
| 3 | HP status |

### Caravan NPC And Reward Layer

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravanmanager.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravanguide.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravanadviser.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/monster/chocobo/chocobocaravanguard.lua`
- `docs/Dat Mining/populaceCaravanManager.csv`
- `docs/Dat Mining/populaceCaravanGuide.csv`
- `docs/Dat Mining/populaceCaravanAdviser.csv`
- `docs/Dat Mining/chocoboCaravanGuard.csv`

Text groups:

| Class | Text group | Label |
|---|---:|---|
| `PopulaceCaravanManager` | 7520 | `populaceCaravanManager` |
| `PopulaceCaravanGuide` | 7552 | `populaceCaravanGuide` |
| `PopulaceCaravanAdviser` | 7536 | `populaceCaravanAdviser` |
| `ChocoboCaravanGuard` | 7680 | `chocoboCaravanGuard` |

The caravan text sheets identify the six caravan endpoints and return camps used by the macro switches:

| Index | Hamlet/destination | Camp/start |
|---:|---|---|
| 1 | Wineport | Camp Bloodshore |
| 2 | Quarrymill | Camp Tranquil |
| 3 | The Silver Bazaar | Camp Horizon |
| 4 | Aleport | Camp Skull Valley |
| 5 | Hyrstmill | Treespeak |
| 6 | The Golden Bazaar | Camp Drybone |

`PopulaceCaravanManager` covers entry, explanation, join OK/NG, ample/full branch, other-company branch, and cancellation. It uses rank checks against rank `25` and several `askExtendWidget` prompts, including rows `16`, `23`, `4`, and `55`.

`PopulaceCaravanGuide` covers active escort interaction and rewards:

- `caravanGuardCancel`: abandon prompt, row `8`.
- `caravanGuardReward`: success reward and return-to-camp prompt, row `33`.
- `caravanGuardFailReward`: failure reward/return branch, row `33`.
- `caravanGuardThanks`: post-acceptance thanks and cancel prompt, row `8`.
- `caravanGuardBonusReward`: bonus reward branch.
- `caravanGuardNotBonusReward`: no-bonus branch.

Reward text distinguishes cargo state and attack intensity:

- Result `0`: no cargo.
- Result `1..5`: partial cargo.
- Result `9`: all cargo.
- Enemy pressure thresholds use values around `40` and `50`.

`PopulaceCaravanAdviser` covers advice and sales prompts. It reads player money with `getMoneyOnHand(1000001)`, uses `askMultipleTextMacro` for adviser choices, and asks purchase confirmation with row `14`.

`ChocoboCaravanGuard` extends `ChocoboBaseClass`, returns battalion `1`, and exposes `chocoboCommand(...)`:

- First prompt uses `worldMaster:askRestrictChoices(...)`.
- If the player chooses branch `2`, it follows with `worldMaster:ask(..., 6, 4, ...)`.

## Cutscenes And Cutscene Widgets

### Cutscene Effect Bridge

Source: `tools/outputs/lpb/content_systems_20260612/lua/gamedata/cutscene_common.lua`

Cutscene clips call into desktop widget splash effects through `_onShowWidgetClip` and `_onHideWidgetClip`.

Clip-to-effect mapping:

| Clip label | Effect ID | Widget/effect |
|---|---:|---|
| `2DEffectLocation1` | 1 | `RaidDungeonTitleWidget1` |
| `2DEffectLocation2` | 2 | `RaidDungeonTitleWidget2` |
| `2DEffectLocation3` | 4 | `LocationTitleWidget1` |
| `2DEffectLocation4` | 5 | `LocationTitleWidget2` |
| `2DEffectLocation5` | 6 | `LocationTitleWidget3` |
| `2DEffectLocation6` | 7 | `RaidDungeonTitleWidget3` |
| `2DEffectLocation7` | 8 | `RaidDungeonTitleWidget4` |
| `2DEffectLocation8` | 12 | `HamletDefenseTitleWidget1` |
| `2DEffectLocation9` | 13 | `HamletDefenseTitleWidget2` |
| `2DEffectLocation10` | 14 | `HamletDefenseTitleWidget3` |
| `2DEffectLocation11` | 15 | `CastrumNovumTitleWidget` |
| `2DEffectContentsSuccess` | 3 | `RaidDungeonSuccessWidget` |
| `2DEffectDutySuccess1` | 9 | `DutyCompleteWidget4` |
| `2DEffectDutySuccess2` | 10 | `DutyCompleteWidget5` |
| `2DEffectDutySuccess3` | 11 | `DutyCompleteWidget6` |

The desktop connector opens these as `SplashEffectWidget` in slot `14`.

`startCutScene` handles loading, desktop/static-widget state, skip widget state, replay mode, and optional event/quest mode. It uses `_fadeInNowLoadingForNoticeEventJustInArea`, `_loadCutScene`, `_play`, or `_replay` depending on mode flags.

### Cutscene Key Inventory

Sources:

- `tools/outputs/lpb/content_systems_20260612/content_cutscene_key_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutscene_key_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_lua_api_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_lua_api_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck_summary.json`

The broad-pass cutscene key inventory found 425 original-case cutscene keys across 547 Lua key references. Normalizing case reduces those to 348 unique keys. A separate cutscene API pass found 834 cutscene API references across 161 Lua files. The biggest API families are:

| API | References | Files |
|---|---:|---:|
| `startNQCutScene` | 571 | 131 |
| `startSnpcNQCutScene` | 44 | 9 |
| `startHQCutScene` | 43 | 12 |
| `createCutScene` | 26 | 13 |
| `closeCutSceneEffectWidget` | 18 | 3 |
| `openCutSceneEffectWidget` | 17 | 3 |
| `_isCompletedCutSceneReplayQuest` | 16 | 3 |
| `startCutScene` | 14 | 10 |
| `cutReplaySheet` | 12 | 4 |
| `ReplayCutScene` | 9 | 2 |
| `_play` | 7 | 4 |
| `executeCutScene` | 7 | 3 |

Most keys are scenario keys. The direct content-duty keys are:

| Script | Cutscene key |
|---|---|
| `director/occupancy/raidfst0dungeon03.lua` | `rad0f300`, `rad0f306`, `rad0f307`, `rad0f308` |
| `director/occupancy/raidroc0dungeon01.lua` | `rad0r100`, `rad0r106` |
| `director/instanceraid/instanceraidlesserifrit.lua` | `GC010105` |
| `director/instanceraid/instanceraidlesserwhitegeneral.lua` | `gc010715` |

Hamlet replay cutscene keys do not appear as direct Lua `executeCutScene` literals in the recovered scripts; they are exposed through `cutReplay.csv` and the replay NPC/widget path below.

### Full Asset And DAT Cross-Check

Sources:

- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_directory_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_directory_inventory_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_only_key_lpb_exact_scan.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_asset_only_key_lpb_exact_scan_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_coverage_rollup_summary.json`

The installed client has 690 immediate `client/cut` directories and 9,593 files totaling 720,340,590 bytes. Of those directories, 689 have a same-name main scene file and 665 have a `DataSet` directory. The one directory without a same-name main file is `client/cut/mot`, which behaves like a shared motion-library bucket rather than a scene key.

The cross-check union across Lua keys, replay DAT keys, and physical cut assets has 761 normalized keys:

| Measure | Count |
|---|---:|
| Physical `client/cut` keys | 690 |
| Full `cutReplay.csv` rows | 614 |
| Unique `cutReplay.csv` keys | 568 |
| Replay keys with physical assets | 568 |
| Replay keys without physical assets | 0 |
| Normalized Lua cutscene keys | 348 |
| Scene-like Lua keys | 303 |
| Scene-like Lua keys with physical assets | 277 |
| Keys present in Lua, replay DAT, and assets | 267 |

The 71 Lua keys without a physical asset are mostly script/base identifiers such as `com0g1`, `man0l0`, `gcg102`, `whm0j1`, and `noc002`; they also do not appear as replay rows. Treat them as Lua scenario owner names or branch bases, not missing `client/cut` folders.

Requested-family cross-check:

| Family prefix | Union keys | Lua | Replay DAT | Assets | All three |
|---|---:|---:|---:|---:|---:|
| `man` | 216 | 214 | 184 | 196 | 184 |
| `gc` | 36 | 26 | 35 | 36 | 26 |
| `etc` | 32 | 31 | 16 | 17 | 16 |
| `com` | 30 | 30 | 15 | 15 | 15 |
| `exc` | 24 | 19 | 15 | 20 | 15 |
| `rad` | 24 | 6 | 24 | 24 | 6 |
| `whm` | 10 | 10 | 5 | 5 | 5 |
| `ham` | 6 | 0 | 6 | 6 | 0 |
| `noc` | 2 | 2 | 0 | 0 | 0 |

The asset-only exact LPB scan covered the 112 asset keys not already seen in Lua or replay rows. Scene-specific exact hits such as `cho0*`, `bsm400*`, `cul400*`, `fsh400*`, elevator clips, and `wpn0f010` point to scripts already in the manifest. The only outside-manifest hits are generic `mot` consumers in base NPC/player/emote/judge/widget code, so this pass did not find an unrecovered content cutscene launcher.

### Public Effect Widgets

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/splasheffectwidget.lua`
- `tools/outputs/lpb/content_systems_20260612/content_asset_filename_hits_summary.json`

Important public effect IDs:

| Effect ID | Meaning/widget |
|---:|---|
| 1 | `RaidDungeonStartWidget` |
| 2 | `RaidDungeonSuccessWidget2` |
| 3 | `RaidDungeonFailureWidget` |
| 4 | Grand company recruit effect 1 |
| 5 | Grand company recruit effect 2 |
| 6 | Grand company recruit effect 3 |
| 13 | `DutyAbandonedWidget` |
| 14 | `DutyCommencedWidget1` |
| 15 | `DutyCommencedWidget2` |
| 16 | `DutyCommencedWidget3` |
| 17 | `DutyCompleteWidget1` |
| 18 | `DutyCompleteWidget2` |
| 19 | `DutyCompleteWidget3` |
| 20 | `DutyFailedWidget` |

`SplashEffectWidget` is the generic runner behind these public/cutscene effects. `init(effectId)` calls `desktopWidget:executeEffect(effectId)` when an effect ID is supplied, waits on `UILuaCommands.AnimationCompleted`, sends `Animation.Start`, and closes itself when the animation completes. `finish()` sends `Fadeout.Start`.

The SQWT filename cross-check found matching non-Lua layout/effect assets for the visible effect family:

- `HamletDefenseTitleWidget1..3`
- `RaidDungeonTitleWidget1..4`
- `RaidDungeonStartWidget`
- `RaidDungeonSuccessWidget`
- `RaidDungeonSuccessWidget2`
- `RaidDungeonFailureWidget`
- `DutyCommencedWidget1..3`
- `DutyCompleteWidget1..6`
- `DutyFailedWidget`

It also found localized `.spk`/`.gtex` effect assets for `DutyCommenced`, `DutyComplete`, `DutyFailed`, `HamletDefenseTitle`, `RaidDungeonStart`, `RaidDungeonSuccess`, `RaidDungeonFailure`, and `RaidDungeonTitle`.

A focused native/SQWT probe confirmed the requested widget assets as concrete `.form`/`.tpl` files, including `ChocoboCaravanWidget`, `RaidDungeonExecutionWidget`, `HamletDefenseWidget`, `HamletDefensePopupWidget`, `HamletDefenseScoreWidget`, `HamletDefenseRankingWidget`, `HamletDefenseTutorialWidget`, `CastrumNovumMapWidget`, `CastrumNovumTitleWidget`, and the `Duty*`/`RaidDungeon*` splash widgets. The new `content_systems_sqwt_binary_probe.csv/json` samples those files from the installed client. Every sampled row exists and starts with `SQEX`; the probe found zero UTF-16 string runs and only opaque ASCII-like runs after the header, with no decoded layout tree from naive scalar/string sampling.

The deeper native probe adds two more facts:

- `content_systems_sqwt_native_layout_probe.csv/json` samples 12 requested `.form`/`.tpl` files. Their first-1KB payload entropy is high, about `7.52..7.79` bits/byte, and no substantial gzip/deflate/zlib/raw-deflate decode succeeds at the tested offsets. That supports "custom packed/encrypted/obfuscated native container" over "plain compressed XML/layout."
- `content_systems_sqwt_native_string_probe.csv/json` finds SQWT vocabulary in `ffxivgame.exe`: `SqwtDesignData.StringValue*`, `XmlData.*`, `ControlTemplate`, `Template`, `Window_*Widget`, `Button_*`, `TextBlock_*`, `ListBox_*`, `IconControl_*`, `.form`, `.tpl`, `.spk`, `.gtex`, and source-path residue such as `D:\rapture\src\Component\source\Sqwt\common.cpp`. So the native runtime vocabulary is now strong, but the requested files still need parser/native work to become decoded control trees.
- `content_systems_sqwt_family_probe.csv/json`, `content_systems_sqwt_family_summary.json`, and `content_systems_sqwt_confidence_followup.csv/json` extend the check across the installed SQWT layout family. They scan 761 layout-side files: 710 `.form`/`.tpl`, all 710 with `SQEX` headers, plus 51 sidecars (`.css`, `.skin`, `.sml`, `.style`, `.xml`). Of those sidecars, 49 are also `SQEX` containers; only `sqwt\boot\system\web\default.css` and `sqwt\boot\system\web\patch.css` are plain-text likely. The `.form`/`.tpl` first-1KB entropy range is `7.1831..7.8304` with an average of `7.7496`; zero rows expose UTF-16 layout text. The family does show native-object footer clues: 49 rows end exactly in `Window>`, 228 rows end in the broader `Window` suffix family, and 183 rows end in the `Dictionary` suffix family. Requested examples include `RaidDungeonExecutionWidget.form -> Window>`, `RaidDungeonExecutionWidget.tpl -> nary>`, `HamletDefenseScoreWidget.form -> indow>`, `HamletDefenseScoreWidget.tpl -> ionary>`, and `DutyCompleteWidget1.tpl -> onary>`. These are useful SQWT internals, but they are not enough to reconstruct the full control tree.
- `content_systems_sqwt_native_parser_vocab_deep.csv/json` and `content_systems_sqwt_native_parser_vocab_deep_summary.csv/json` make the native evidence repeatable rather than sample-based. The deep scan matched 36 tracked tokens across 4 binaries: 33 SQWT/control/style/asset tokens plus 3 generic compression strings. The SQWT-specific matches cover source residue (`Component\source\Sqwt`, `Sqwt\common.cpp`), `SqwtDesignData.StringValue0/1/2`, `SqwtShowAnchor`, `InputMethod.SqwtInputAllowedChars`, `ControlTemplate`, `DataTemplate`, `<data template`, `UIElement.Execute`, `stafflist.xml`, `Sqwt::Controls::TextAlignment`, `Button_`, `TextBlock_`, `ListBox_`, `IconControl_`, `Window_`, `SqwtSkinStatus`, `SqwtImagePartsIndex`, `SqwtStyleControlName`, `SqwtStyleFile`, `SqwtSkinDirect`, and the `.form`/`.tpl`/`.skin`/`.style`/`.spk`/`.gtex` extensions.
- `content_systems_sqwt_terminal_structure_deep.csv/json`, `content_systems_sqwt_terminal_structure_deep_summary.json`, and `content_systems_sqwt_deep_confidence.csv/json` add the low-level layout-container profile. All 710 `.form`/`.tpl` rows start with `SQEX 00 00 00 00`; payload entropy remains `7.1831..7.8304` with average `7.7496`; 651 rows have some printable terminal suffix; 228 end in the `Window` suffix family; 183 end in the `Dictionary` suffix family; 0 packed rows expose raw `ControlTemplate`, `<Window`, or `<Dictionary` text. Requested samples include `RaidDungeonExecutionWidget.form => Window>`, `RaidDungeonExecutionWidget.tpl => nary>`, `ChocoboCaravanWidget.form => ow>`, `DutyCompleteWidget1.tpl => onary>`, `HamletDefenseScoreWidget.form => [indow>`, and `HamletDefenseScoreWidget.tpl => ionary>`.

The local helper scripts are useful but bounded: `tools/mine_hamlet_ui_widgets.py` and `tools/hamlet/hamlet_ui_asset_probe.py` scan filenames/strings, `tools/hamlet/hamlet_ui_widget_alias.py` is an alias experiment, and `tools/ida_export_hamlet_context.py` exports native context. None expands packed `.form`/`.tpl` internals into a native layout tree. Installed container/header inventory is therefore about 99%; packed payload classification is about 95-96%; native parser/control vocabulary is about 95-97%; terminal object/footer clues are about 93-95%; requested content widget layout trees are about 78-82% until parser/native work is done.

### Cutscene Replay

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/replaycutsceneselectwidget.lua`
- `tools/outputs/lpb/content_systems_20260612/content_cutreplay_rows.csv`
- `tools/outputs/lpb/content_systems_20260612/content_cutreplay_rows_summary.json`
- `tools/outputs/lpb/content_systems_20260612/cutscene_cutreplay_full_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_cutreplay_text_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_movie_table_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_staffroll_table_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_replay_npc_text_inventory.csv`
- `tools/outputs/lpb/content_systems_20260612/cutscene_dat_full_summary.json`
- `docs/Dat Mining/cutReplay.csv`
- `docs/Dat Mining/xtx_cutReplay.csv`

`ReplayCutSceneSelectWidget.createList(questId)` checks rows from `questId * 100 + 1` through `questId * 100 + 30` in `cutReplaySheet`. Existing rows are listed as replay choices. Selection hides the child and parent widgets, then finishes the parent with the selected `cutsceneId`.

The full DAT pass parsed:

| Table | Rows | Notes |
|---|---:|---|
| `cutReplay.csv` | 614 | Replay id, scene key, replay mode/flags, and up to eight replay data markers |
| `xtx_cutReplay.csv` | 614 | Localized replay labels |
| `_movie.csv` | 22 | Movie subtitle/timing rows; max end frame `4234` |
| `_staffroll.csv` | 1,147 | Staff roll/credits data, not a content launch path |
| `populaceCutScenePlayer.csv` | 101 | Replay NPC UI/help text |

The 614 replay rows contain 568 unique scene keys, and all 568 have a matching `client/cut/<key>` directory.

Important widget text IDs:

| Text ID | Use |
|---:|---|
| 5001 | Title |
| 5101 | List title |
| 5102 | Current title |
| 5024 | Current condition |
| 5109 | Current condition |
| 5104 | Close |
| 5105 | No list |
| 5103 | Row text |

Recovered Hamlet replay rows:

| Replay row | Cutscene | Label |
|---:|---|---|
| 11082008 | `ham0s201` | Battle for Aleport Opening |
| 11082009 | `ham0s202` | Battle for Aleport Ending |
| 11082010 | `ham0f301` | Battle for Hyrstmill Opening |
| 11082011 | `ham0f302` | Battle for Hyrstmill Ending |
| 11082012 | `ham0w201` | Battle for the Golden Bazaar Opening |
| 11082013 | `ham0w202` | Battle for the Golden Bazaar Ending |

The structured replay extraction found 36 hard content-family replay rows:

| Family | Rows |
|---|---:|
| Hamlet Defense | 6 |
| Toto-Rak / forest raid cutscene set | 9 |
| Dzemael Darkhold | 7 |
| Aurum Vale | 4 |
| Cutter's Cry | 4 |
| Grand Company Ifrit cutscene | 3 |
| Grand Company WhiteGeneral cutscene | 3 |

These replay rows prove the Hamlet, raid/dungeon, and primal-adjacent cutscene assets are present and addressable from the client. The expanded candidate sweep adds 49 more in-scope story-adjacent rows for Castrum/Beacon, Garuda/Howling Eye, Rivenroad lead-in, Moogle/Nightmare, and Grand Company story-bridge candidates, plus 3 out-of-core public-stronghold reference rows. Two `etc5g*` rows are recorded as excluded general-story residuals. The remaining open piece is the exact live duty trigger/server state around some start and clear events, not the existence of the cutscene rows or scene folders.

### Cutscene Replay NPC

Source: `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecutsceneplayer.lua`

`PopulaceCutScenePlayer` is the NPC-side replay executor that sits behind the replay selection widget:

- Loads the selected `cutReplaySheet` row temporarily.
- Stores `work.saveQuestId`.
- Gets the cutscene name from `cutReplaySheet` column `0`.
- Reads columns `8..15` as replay data requirements/flags.
- Checks player replay state with `getCutSceneReplayData(...)`.
- Uses `cutReplaySheet` column `6` to alter replay behavior when the value is `2`.
- Handles special replay markers such as `-202`, `-206`, and `-207`, with a placeholder branch visible for `-208`.
- Calls the game data cutscene player, fades out/in, restores music, unloads the `cutReplaySheet` key, and closes the replay select widget.

This gives a second independent client-side confirmation that `cutReplay.csv` rows are active replay rows, not just orphaned table data.

### Native Callback Path Still Relevant

Sources:

- `docs/instance_cutscene_decomp_findings_2026-06-10.md`
- `tools/outputs/lpb/content_systems_20260612/lua/gamedata/cutscene_common.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua`

Earlier native/IDA notes still matter for live playback. The recovered Lua names line up with this client callback table:

| Sub-op | Lua target |
|---:|---|
| 7 | `CutScene._onInitializationClip(PreviewSetupClip)` |
| 8 | `CutScene._onInitializationClip(Personage)` |
| 9 | `CutScene._onShowUIClip` |
| 10 | `CutScene._onHideUIClip` |
| 11 | `CutScene._onShowWidgetClip` |
| 12 | `CutScene._onHideWidgetClip` |
| 13 | `CutScene._onOpenUIClip` |
| 14 | `CutScene._onFinalizeClip` |
| 17 | `System._onPreCutSceneCancel` |
| 18 | `System._onPostCutSceneCancel` |
| 20 | `DesktopWidget._onPreWarp` |
| 21 | `DesktopWidget._onPostWarp` |
| 38 | `_onReceiveDataPacket` |

IDA previously identified `006FB9C0` as the finalize-clip Lua invoker. It is gated by a cutscene object byte, calls `_onFinalizeClip` for both `PreviewSetupClip` and `Personage`, releases setup state, and then clears the path. The same earlier pass identified `006FEDE0` as `_onPreWarp`, which sets a DesktopWidget byte, and `006FEF10` as `_onPostWarp`, which no-ops unless that byte was set and then resets it.

So the cutscene data side is now strongly covered, while the remaining live-playback risk is command-updater routing and event/warp ordering: initialize clips, optional UI/widget clips, finalize clip, pre/post warp, EndEvent, and zone-in completion.

## Area And Player Gates

Sources:

- `tools/outputs/lpb/content_systems_20260612/lua/area/areabaseclass.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/area/areabaseclass_u.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/player/playerbaseclass.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/player/playerbaseclass_u.lua`

`AreaBaseClass._onInit(actorNumber, isInstanceRaid, isEntranceDesion)` stores:

- `areaWork.actorNumber`
- `areaWork.isInstanceRaid`
- `areaWork.isEntranceDesion`

It also calls `_setInstanceRaid(isInstanceRaid)`.

`AreaBaseClass.isInstanceRaid()` returns `areaWork.isInstanceRaid`.

Native bridge functions include:

- `_setInstanceRaid_cpp`
- `_countHamletSupplyRanking_cpp`
- `_getHamletSupplyRanking_cpp`
- Chocobo area native bindings
- `_fadeInNowLoadingForNoticeEventJustInArea_cpp`
- `_getOccupancyContentsTime_cpp`
- `_countHamletDefenseScore_cpp`
- `_getHamletDefenseScore_cpp`
- `_getHamletDefenseScoreAll_cpp`
- Chocobo player native bindings

Player interaction gates:

- Normal command `22004` while touching is only allowed when `currentAreaMaster:isInstanceRaid() == false`.
- Inside an instance raid, `_onTouch(touchKind, enter)` with `touchKind == 5` gets static actor `24301` and executes command `30004`, command kind `5`, with state `1` on enter and `2` on leave.

This is likely important for duty boundaries, exits, and invisible interaction volumes.

## Packet/Data Notes Still Relevant

Existing packet-level notes remain useful:

- Hamlet Defense score data is exposed to Lua through player-native `_countHamletDefenseScore`, `_getHamletDefenseScore`, and `_getHamletDefenseScoreAll`.
- Hamlet supply ranking data is exposed to Lua through area-native `_countHamletSupplyRanking` and `_getHamletSupplyRanking`.
- Earlier notes identify compact native payload shapes for Hamlet score/ranking packets, but this pass did not change packet structures.

The client widget layer now explains how those native arrays are displayed. The remaining server-side task is to ensure the native data stores are populated in the format the client expects before opening the ranking/score widgets.

## Implementation-Relevant Takeaways

- Hamlet uses instance raid infrastructure plus a dedicated `InstanceRaidHamletDefense` subclass and dedicated slots `15`/`16`.
- The Hamlet execution HUD is not a generic content-information widget.
- Hamlet ranking and score are separate Ask widgets backed by native area/player data stores.
- Hamlet tutorial and delivery widgets are recovered; the tutorial has 9 all-role pages plus 2-page DoH/DoL variants, and the delivery path uses `QuestDeliveryWidget`/`GrandCompanyShopWidget` with Hamlet-specific `nqanima`/`hqanima` row data.
- Hamlet supply/ranking support also has a scenario wrapper in `Noc002`, including `askHamletDefenseRankingWidget`, eleven-row supply sheet display, supply point messages, and supply error messages.
- Hamlet DoL/DoH support is backed by `PopulaceHamletSupply`, `PopulaceHamletPushEvent`, `itemHamletSupplySheet`, and the item IDs listed above.
- Raid, dungeon, and trial duties share `InstanceRaidBaseClass` and `RaidDungeonExecutionWidget`.
- Instanced-content cutscenes split into a live director lane and a replay/story lane. The live lane has 8 direct literal keys and all 8 are both replay-backed and asset-backed.
- The mapped instanced-content replay lane now covers 80 hard-map rows, 57 unique scene keys, and 0 missing physical `client/cut` assets across Toto-Rak, Dzemael, Aurum Vale, Cutter's Cry, Ifrit/GC trial paths, Hamlet, Rivenroad, and related story-entry candidates.
- The expanded in-scope/story-adjacent replay sweep covers 129 rows and 89 unique keys, all asset-backed; the 132-row broad table keeps 3 public-stronghold rows explicitly out of core instanced scope and records 2 `etc5g*` general-story rows as residual exclusions.
- The instanced-content cutscene matrix now covers all `xtx_raidDungeon` IDs `1..16`. Positive rows have asset-backed live/replay evidence, and no-static-live-literal rows are backed by recovered wrapper/guide/family scans.
- Exact-key replay usage now splits the 57 unique instance-related keys into 8 live duty launcher/gate keys, 18 quest/story launcher literals, 1 delete-only/preload reference, and 30 replay-asset-only or dynamic-server-argument keys.
- Dynamic duty cutscene launch is bounded to `InstanceRaidBaseClass.startEvent`, `exitCutScene`, `cutSceneEvent`, subclass overrides for Ifrit/Rivenroad, the two legacy occupancy directors, and the Castrum/Beacon preface helper.
- Static retail evidence now raises several previously fuzzy claims over 95%: Ifrit content IDs `4/3/14` map to non-Hard/Hard/Extreme, Aurum Vale and Cutter's Cry have over-95 identity plus no-static-launcher support, and Castrum/Beacon has over-95 content/replay classification plus a recovered dynamic preface path.
- A full local server/Data/.codex-tmp exact scan found no hidden static caller for the unresolved Aurum/Cutter/Ifrit/Castrum scene args; exact retail scene values remain server-argument/capture data.
- Trial content does not have a separate trial widget in the decoded installed LPB corpus or filename-visible SQWT widget assets.
- Trial monster/director/weapon-skill scripts are mostly thin class wrappers, so visible trial mechanics are not implemented in recovered Lua.
- `PcMatchingEditWidget` independently confirms content ID grouping for raids, primal/trial duties, Hamlet, and Chocobo Caravan routes.
- `xtx_raidDungeon.csv` now independently confirms the full 1-16 content-name list, including Garuda, Castrum Novum, Rivenroad, and Rivenroad (Hard).
- The DAT/CSV pass found 28 directly named content tables; the high-signal text groups line up with the Lua text loads for Hamlet, Caravan, Aurum Vale, Cutter's Cry, raid objects, and cutscene replay.
- `worldMaster.csv` rows `52003..52097` cover shared duty entry/timer/exit, object progress, requirements, fail/passive checks, Hamlet delivery/anima, Hamlet supply/loot, and Hamlet defense schedule messages.
- Old occupancy dungeon directors pass an ignored leading value before the real raid content ID.
- Local event packet shape is now over 95 for emulator protocol: EventStart `0x012D`, KickEvent `0x012F`, RunEventFunction `0x0130`, and EndEvent `0x0131` have their field layout and `Player` state wiring mapped; original retail timing and dynamic scene values still need capture/native work.
- Raid treasure Lua is recovered in `RaidDungeonTreasureBox`; its resolver mechanics are over 95%, but exact retail drop tables and chest/reward timing are still below 95.
- Local reward packet ordering is now over 95 for emulator inventory grants and event waits: `InventoryBeginChange 0x016D -> InventorySetBegin 0x0146 -> InventoryList/Remove 0x0148..0x014C/0x0152..0x0156 -> InventorySetEnd 0x0147 -> InventoryEndChange 0x016E`, plus `RunEventFunction 0x0130 -> _WAIT_EVENT -> EventUpdate 0x012E -> coroutine resume`, with `EndEvent 0x0131` shape mapped. Path-specific local event ordering is also over 90 for guildleve completion, guildleve bonus chest, BattleNpc kill rewards, Hamlet claim, and Behest claim. Exact original retail content reward tables, cancel behavior, and trigger timing remain below 95.
- Static reward evidence is over 95 for named Relic Reborn material/source/quantity links (`Miser's Mythril`, `Alumina Salts`, `Enchiridion`, `Oschon's Finger`, `White-hot Ember`, `Howling Gale`), Castrum coffer key identities, Garuda access items, Garuda Hard chest eligibility, and caravan reward eligibility/source text; exact drop tables, special coffer requirements, contribution thresholds, and original retail packet timing still need capture or missing data tables.
- Chocobo Caravan should be modeled as `CaravanGuardDirector` plus generic content-information kind `2`, not as guildleve UI; the client UI protocol, local server route lifecycle, reward/entry dialog API, and static reward eligibility/source text are over 95%, while original retail timing/reward values remain below 95.
- Caravan entry, cancel, reward, fail-reward, bonus-reward, adviser, and chocobo command NPC scripts are now identified.
- Cutscene 2D effect clips are data-driven labels that open/close desktop splash effects.
- The cutscene inventory now covers 834 API references across 161 Lua files, 425 original-case Lua scene keys, 348 normalized Lua scene keys, and 690 physical `client/cut` directories.
- Full replay coverage is confirmed by `ReplayCutSceneSelectWidget`, `PopulaceCutScenePlayer`, 614 `cutReplay.csv` rows, 614 `xtx_cutReplay.csv` rows, and 568 unique replay scene keys with 0 missing physical asset directories.
- The final exact scan of all 2,517 installed LPBs found no unrecovered content cutscene launcher outside the current 455-file manifest.
- Hamlet title splash effects are effect IDs `12`, `13`, and `14`.
- Public duty start/complete/fail effects are effect IDs `1`, `14..20` depending on content family and company/town.
- Filename-visible SQWT assets and the binary/native reprobes confirm the Hamlet, raid/duty, Castrum, and Chocobo Caravan layout/effect files expected from the Lua widget calls as installed `SQEX` `.form`/`.tpl` containers. Native binaries expose SQWT design/parser/control/style vocabulary at 95%+ confidence, and the packed files have consistent `SQEX 00 00 00 00` headers plus `Window`/`Dictionary` footer fragments, but requested layout-tree internals still need parser/native work.

## Remaining Gaps

I am not at 100% confidence because these areas are still outside pure Lua decompile coverage:

- Exact live server packet sequencing for Hamlet start, progress user messages, clear, fail, and score/ranking population.
- Exact original-retail Chocobo Caravan step timing, marker/cargo source data, enemy/guard state changes, contribution thresholds, route reward tables, and reward/fail sequence.
- Exact retail reward/chest trigger timing, special coffer requirements, drop IDs, drop/dropTable/dropQuality contents, party distribution, cancel behavior, and post-duty grant behavior. Local inventory/event-wait/event-close mechanics are now over 95 where implemented; original retail reward timing/tables are not.
- Native SQWT/UI `.form`/`.tpl` internals behind the Lua command names; installed container inventory, headers, sidecar split, native parser/control vocabulary, packed-payload classification, and footer/object-fragment clues are now high-confidence, but the requested packed layout trees are not decoded.
- Native retail cutscene packet timing around initialization/finalize clips, DesktopWidget pre/post warp, cancellation, and EndEvent category timing. The repo packet opcode/field shape is now mapped, but retail timing still needs capture or native work.
- Exact scene-key/server-arg selection for Ifrit variants, the dynamic Castrum preface scene value, and the server-side selection conditions for replay-only or dynamic-argument keys whose scene names and assets are already recovered. The content-tier and replay/category classification for those rows is now over 95 where static data supports it.
- Any content hidden in non-Lua native code or in unrelated data tables without content-family filenames/keywords.

Best next probes:

- Capture or emulate the `InstanceRaidBaseClass` start/relogin/clear/fail packet sequence against a local client.
- Populate Hamlet native score/ranking stores before opening the Ask widgets and confirm row rendering.
- Build or trace a native SQWT parser from the `ffxivgame.exe` SQWT loader to turn `Window>`/Dictionary suffix evidence into full control trees.
- Drive `CaravanGuardDirector` through steps `40`, `70`, `80`, and `90` with packet logging and compare it against the local `ChocoboCaravanDirector` route/progress implementation.
- Trigger Hamlet cutscene replay rows and live title effect clips to confirm splash effect timing.
- Recover or capture `dropSheet`, `dropTableSheet`, and `dropQualitySheet` data, then exercise `RaidDungeonTreasureBox` with known `dropID` values after duties complete to confirm grants and full-inventory behavior.
- Capture `RunEventFunctionPacket` calls for `startEvent`, `exitCutScene`, `cutSceneEvent`, and `processCutSceneEvent` on content IDs `3`, `4`, `6`, `7`, `13`, `14`, `15`, and `16`.
- Build or port a SQWT `.form`/`.tpl` parser and compare decoded controls/bindings against `UILuaCommands` for Hamlet, RaidDungeon, ChocoboCaravan, Duty, and Castrum widgets.
