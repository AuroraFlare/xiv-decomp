# Hamlet User-Message Adapter Contract - 2026-06-19

Outputs live in `tools/outputs/lpb/hamlet_user_message_adapter_contract_20260619`.

## High-signal findings

- Source coverage: 20/20 expected sources are present.
- The main Hamlet HUD is a retail `InstanceRaidHamletDefense.processUserMessage` bridge, not a score packet or ranking packet problem.
- Subtypes `1`-`10` cover title/rank, harvest, reset, field buffs, defense lines, goods, cargo target, boss flag, battle value, and popup notices.
- Local Hamlet Defense now seeds director-sourced GenericData/HamletHudUserMessage payloads for subtype `3` reset, `4` buffs, `5` lines, `6` goods, `7` cargo target 0, `8` boss flag, and `9` battle value.
- The still-missing live HUD rows are subtype `1` title/timer, subtype `2` real harvest counts, and subtype `10` popup notice ids; seeded subtype `3`-`9` rows still need a client probe.
- Score, ranking, and tutorial remain separate ask surfaces; keep them out of the live-HUD dispatcher while the subtype bridge is validated. Score should stay on native `0x01A8`; non-empty ranking stays debug-gated on the `0x01A6`/`0x5F0` path.

## Runtime To Subtype Map

| subtype | name | work_fields | local_state_candidates | adapter_contract | current_gap |
| --- | --- | --- | --- | --- | --- |
| 1 | title/rank/opening state | hamletRank and header/title work | hamletData.raidDungeonId 8/9/10, hamletData.supplyRating, titleWidgetIndex, guildleveWork.startTime | Send after the safe live HUD is open; derive content id and rank from hamletData, but validate exact title/timer args before production. | Local code opens/probes widgets and sends score requestedData, but no explicit subtype 1 bridge was found. |
| 2 | harvest table | harvestTbl[1..3] | potsDelivered and deliveredPots are related to land support, but not confirmed as the three retail harvest buckets | Do not blindly map potsDelivered to harvestTbl; add explicit gatherer/turn-in bucket counters or keep zeros until live semantics are capt... | No direct local source for three harvest buckets. |
| 3 | harvest reset | harvestTbl[1..3] = 0 | start/reset of a Hamlet run or reset of local gatherer supply counters | Emit on HUD bootstrap/reset before any subtype 2 updates. | Seeded: SendHamletDefenseHudSnapshot emits subtype 3 reset on open/start snapshots; live client validation remains. |
| 4 | field buffs | fieldBuffTbl[1..6] | activeSupportEffects and supportEffectEnds; ApplyLandSupport/ApplyHandSupport update effect counters | Mirror active support effects into six stable flags; expire flags when supportEffectEnds removes effects. | Seeded: ApplySupportEffect/UpdateSupportEffectExpiry now emit subtype 4 fieldBuff payloads; exact slot mapping still needs live validation. |
| 5 | defense line statuses | lineStatusTbl[1..3] | breachedLines[3] plus militia archer/laborer health/death state | Map false to 1 Normal and true to 3 LineOfDefenseFall; reserve 2 Danger for a later HP threshold probe. | Seeded: RefreshDefenseStateAnnouncements now emits subtype 5 line status payloads on breach changes. |
| 6 | goods statuses | goodsStatusTbl[1..4] | supplyCarts[4] death/currentActorIcon and GetLiveSupplyCartCount | Map alive carts to 1 Normal and dead carts to 3 GoodsLost; reserve 2 Danger for a later HP threshold probe. | Seeded: supply cart loss now emits subtype 6 goods status payloads; danger threshold still unprobed. |
| 7 | cargo target | cargoTarget | current enemy target selection or the cart under active raid; currently not tracked as a stable field | Keep 0 as the safe default until an enemy-to-cart target can be derived without flapping. | Seeded conservatively: subtype 7 sends cargo target 0 on snapshots/goods refresh; active target derivation is still missing. |
| 8 | boss flag | bossFlag = true | IsLeaderActive() and leader wave spawn; leaderDefeated is an outcome signal, not the open signal | Emit when the leader/boss becomes active, not only when leaderDefeated flips true. | Seeded: leader wave/IsLeaderActive now emits subtype 8 boss flag at leader arrival. |
| 9 | battle value | battleValue | finalScore, CalculateScore(...), guildleveWork.aimNumNow[ScoreHudIndex], MaxHudScore 99 | Mirror the same clamped score bucket currently used for guildleveWork score, then probe whether max should stay 99/100 or use a retail co... | Seeded: UpdateHudProgress now mirrors the clamped score bucket through subtype 9 battleValue. |
| 10 | popup/information notice | none persistent; calls dispInformation | SendBattleMessage strings for line breaches, supply raids, support effects, victory/defeat lines | Add only after core live HUD works; map known retail information ids instead of translating arbitrary local chat strings. | Local notices are chat/log messages, not subtype 10 popup messages. |

## Adapter Worklist

| local_surface | retail_target | adapter_contract | risk |
| --- | --- | --- | --- |
| Defense.lua widget bootstrap | InstanceRaidHamletDefense.openInformationWidget -> desktopWidget:openHamletExecutionWidget, then processUserMessage subtype updates. | Keep the safe open path and validate the director-sourced 0x0133 subtype 3-9 payloads after open. | A visible widget can still be stale if the client rejects source actor, timing, or unvalidated payload shape. |
| RefreshDefenseStateAnnouncements | Subtype 5 lineStatusTbl -> cmdSetDefenseLineStatus. | On any breach state change, send all three line statuses with false=1 and true=3. | Danger status 2 is still unprobed; live validation must confirm status 3 renders the fallen line. |
| Supply cart actor state | Subtype 6 goodsStatusTbl and subtype 7 cargoTarget. | Send four goods statuses after cart spawn and after any cart loss; leave cargo target 0 until target derivation is stable. | Danger status 2 and active target derivation are still unprobed; cargo target remains safe 0. |
| ApplySupportEffect / UpdateSupportEffectExpiry | Subtype 4 fieldBuffTbl -> army/enemy buff command slots. | Mirror active/expired support effects to the six retail flags and send subtype 4 whenever the set changes. | Army/enemy slot assignment needs live validation. |
| Leader wave / IsLeaderActive | Subtype 8 bossFlag -> cmdSetBossStatus(true). | Emit boss flag when IsLeaderActive() first returns true; do not wait for leaderDefeated. | Live timing still needs a client probe. |
| UpdateHudProgress | Subtype 9 battleValue -> war potential progress value. | Mirror the score bucket into battleValue after CalculateScore or progress refresh. | Max/scale may need adjustment after live validation. |
| ApplyLandSupport / gatherer turn-ins | Subtype 2 harvestTbl and subtype 3 harvest reset. | Add dedicated harvest counters before driving bingo; reset with subtype 3 on open/start. | Using potsDelivered as a shortcut may misrepresent the three retail harvest buckets. |
| SendBattleMessage notices | Subtype 10 popup information ids and HamletDefensePopupWidget. | Keep optional until core HUD is stable; map retail ids 11..28 explicitly. | Popup id mistakes are noisy and can obscure real HUD validation. |

## Boundaries

| surface | belongs_to | not_this | reason |
| --- | --- | --- | --- |
| Main live HUD | InstanceRaidHamletDefense.processUserMessage subtypes 1-10 | 0x01A8 score packet, 0x01A6 ranking packet, tutorial ask widget | The live HUD updates work arrays and widget commands directly from user messages. |
| Score window | HamletDefenseScoreWidget, hamletDefScore/hamletDefScoreAll, 0x01A8 | Subtype 9 war-potential value | Subtype 9 is a live bar; final/end score rows use a separate ask/data flow. |
| Ranking window | HamletDefenseRankingWidget and 0x01A6 hamletSupplyRanking | Live HUD processUserMessage | Non-empty ranking packet remains gated and should not block the live HUD bridge. |
| Tutorial window | HamletDefenseTutorialWidget ask flow | Live HUD opening or subtype traffic | Tutorial kind/page navigation is a separate UI surface. |
| Known-bad director class paths | Safety guard | Implementation shortcut | Local code blocks /Director/HamletDefense/* paths because probes indicated client error/crash risk. |

## Implementation Order

| priority | component | contract | verification |
| --- | --- | --- | --- |
| 1 | Safe open path | Keep the current known-bad path guard, choose one reproducible widget index 0x1B open path, and log active owner/event/type. | HamletDefenseWidget opens without error 40000 or unsafe probes. |
| 2 | User-message dispatcher | Validate the seeded director-sourced GenericData/HamletHudUserMessage helper for subtype 3-9 payloads. | Subtype 3 reset and subtype 5/6 status updates visibly change the live HUD without score packets. |
| 3 | State mirrors | Live-probe the seeded breachedLines, supplyCarts, support effects, IsLeaderActive, and score-bucket mirrors. | Each local state change has one logged subtype update and one widget command effect. |
| 4 | Uncertain states | Finish or keep gating title/timer, line/cart danger status, active cargo target, harvest counts, and popup ids until semantics validate. | Defaults are stable: lines/goods normal/lost, cargo target 0, harvest reset only, no arbitrary popup ids. |
| 5 | Separate ask surfaces | Keep score/ranking/tutorial work outside the live-HUD dispatcher; continue using 0x01A8 native score and gated 0x01A6 ranking probes. Keep production ranking empty; use only opt-in one-row probes until layout is validated. | End-score window can iterate without destabilizing the live HUD. |

## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | Active-director subtype reset/open smoke | Open Hamlet live HUD from an active Hamlet director/context, send subtype 3 then subtype 5 with all normals and subtype 6 with all normals. | Widget remains open; gathering items clear; all line/goods indicators are normal. |
| 2 | Line breach | Kill or force a militia line, then send subtype 5 with one status 3. | Only the matching defense line switches to LineOfDefenseFall and no score-window traffic is required. |
| 3 | Goods lost | Kill or mark one supply cart lost, then send subtype 6 statuses. | Matching goods slot switches to GoodsLost; live cart count can still update guildleveWork independently. |
| 4 | Support effect flags | Apply one land and one hand support effect, send subtype 4, wait for expiry and send subtype 4 again. | Buff slots activate then return to neutral/hidden; exact slot assignments are logged. |
| 5 | Boss flag timing | Spawn leader wave and emit subtype 8 when IsLeaderActive first flips true. | Boss pop effect appears on spawn, not on defeat. |
| 6 | War potential mirror | Call CalculateScore/UpdateHudProgress during a run and send subtype 9 with the clamped score bucket. | War potential bar tracks the same value as local score bucket without needing the 0x01A8 end-score packet. |

## Generated Files

- `source_inventory.csv` (20 rows)
- `source_term_hits.csv` (568 rows)
- `function_contracts.csv` (180 rows)
- `user_message_subtype_contract.csv` (10 rows)
- `local_runtime_to_subtype_adapter.csv` (8 rows)
- `widget_status_values.csv` (10 rows)
- `score_ranking_tutorial_boundary.csv` (5 rows)
- `implementation_contract.csv` (5 rows)
- `probe_queue.csv` (6 rows)

## 2026-06-21 Subtype Status

- Active local Hamlet HUD sends cover subtypes `3-9`: harvest reset, field buffs, defense line state, goods/cart state, cargo target, optional boss flag, and battle value.
- Recovered subtypes `1`, `2`, and `10` should remain gated until their title/rank/harvest-table/popup payloads are wired from real director state.
- `0x01A8` score and `0x01A6` ranking remain separate from the live HUD dispatcher; keep non-empty ranking probes opt-in only.
