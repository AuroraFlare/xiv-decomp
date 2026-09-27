# Quest Scenario Parity Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\quest_scenario_parity_contract_20260619`.

## High-signal findings

- Recovered scenario inventory has `620` quest scenario files; local has `314` quest scripts excluding template definitions.
- Local backend is real, not empty: quest state, ENPC flags, accept/complete/abandon, journal callbacks, persistence, rewards, request commands, and cutscene event packets are present.
- Code-level parity is split: `153` recovered codes have handwritten local scripts and `159` are present through scaffold/template instances.
- The direct missing bucket is still large: `208` recovered codes are in gamedata but lack local scripts, and `100` recovered codes lack both local scripts and gamedata rows.
- Recovered quest directors are the sharpest runtime gap: `177` recovered director files versus `7` local quest director files. Missing or unmapped director statuses total `168`.
- Prior quest cutscene/widget docs still stand; this pass adds the missing scenario/director parity layer and points to those docs for cutscene ordering and content-info widget details. 2026-06-20 update: `Cul400` now has a local script/scaffold entry, but normal offer/start remains hidden by `noOffer=true`; recovered `processEventCharlysStart` and `cul40010/20/25/30` remain full-retail parity work. No verified local `gamedata_quest_rewards` row was found for quest `110443`, so reward synthesis is blocked until packet/server-row proof exists.

## Combat Instance Entry Constraint

Any new or reconstructed quest combat instance must run `guardCombatInstanceEntry(player)` before its entry prompt/cutscene and before mutating sequence, counters, flags, directors, areas, spawns, or transfer state. Reusable start helpers must repeat the pure `checkCombatInstanceEntry(player)` check, and the C# content/transfer boundary must remain authoritative.

The rejection must be an unprefixed `MESSAGE_TYPE_SYSTEM` line with the exact text `Change to a combat job or Disciple of War or Magic class before entering this instance.` Do not make it look like player, NPC, or quest dialogue. Static combat battlefields must be narrowly registered in `Database.IsPartyLockedStaticInstanceArea`; noncombat/cutscene-only instances are explicit exceptions and must use the noncombat content APIs.

## Largest Missing Families

| Family | Category | Recovered | Local Present | Missing | Coverage | Sample Missing |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| etc | side_special_misc | 195 | 86 | 109 | 44.1% | etc0g5; etc0g6; etc0g7; etc0g8; etc0g9; etc0l5; etc0l6; etc0l7; etc0l8; etc0l9; etc0u5; etc0u6; etc0u7; etc0u8; etc0u9; etc105; etc1g3; etc1g7; etc1i0; etc1i1 |
| test | test | 38 | 0 | 38 | 0.0% | scealphaa; scecuttest; scedummy01; scedummy02; scedummy03; scedummy04; scedummy05; scedummy06; scedummy07; scedummy08; scedummy09; scedummy10; scedummy11; scedummy12; scedummy13; scedummy14; scedummy15; scedummy16; scedummy17; scedummy18 |
| wld | world_sidequest | 40 | 12 | 28 | 30.0% | wld0g5; wld0g6; wld0g7; wld0g8; wld0g9; wld0i1; wld0i2; wld0i3; wld0i4; wld0i5; wld0i6; wld0i7; wld0i8; wld0i9; wld0l5; wld0l6; wld0l7; wld0l8; wld0l9; wld0u5 |
| com | grand_company | 45 | 27 | 18 | 60.0% | com0g8; com0g9; com0l8; com0l9; com0u8; com0u9; com5g2; com5g3; com5g4; com5g5; com5l2; com5l3; com5l4; com5l5; com5u2; com5u3; com5u4; com5u5 |
| spl | seasonal | 25 | 14 | 11 | 56.0% | spl0g3; spl0g4; spl0g5; spl0i5; spl0l3; spl0l4; spl0l5; spl0u3; spl0u4; spl0u5; spl101_quest |
| acn | class | 6 | 0 | 6 | 0.0% | acn200; acn300; acn306; acn400; acn500; acn506 |
| gcg | grand_company | 19 | 14 | 5 | 73.68% | gcg501; gcg502; gcg601; gcg602; gcg603 |
| gcl | grand_company | 19 | 14 | 5 | 73.68% | gcl501; gcl502; gcl601; gcl602; gcl603 |
| gcu | grand_company | 19 | 14 | 5 | 73.68% | gcu501; gcu502; gcu601; gcu602; gcu603 |
| sum | primal | 9 | 4 | 5 | 44.44% | sum7l0; sum7t0; sum8a0; sum8l0; sum8t0 |

## What Is Still Missing

| Priority | Gap | Count | Next |
| --- | --- | ---: | --- |
| P1 | Recovered scenario scripts with no local quest script | 308 | Choose a high-value category and add exact scripts or table-driven templates with recovered event names, objectives, markers, and rewards. |
| P1 | Local scenario coverage is often scaffold/template parity, not retail objective parity | 158 | Replace direct accept/reward scaffolds with recovered sequence, ENPC, item, NM, cutscene, and delivery logic per quest family. |
| P1 | Recovered per-quest director scripts are mostly missing locally | 168 | Implement reusable director adapters for standard quest, event-prefixed, and simple quest battle directors; only then map individual variants. |
| P1 | SimpleQuestBattle directors have no local bridge | 60 | Recover the common simplequestbattle base lifecycle and bind local job/class battle objectives to it. |
| P1 | Class quest 40/50/56 tails are mostly absent locally | 47+ | `Cul400` now has a conservative local scaffold. The next meaningful level-40 recovered bodies are `fsh400`, `bsm400`, and `exc400`; `fsh400` has the strongest explicit cutscene sequence, `bsm400` has useful Bodenolf hooks, and `exc400` is scaffold-only despite asset-side keys. Add remaining 400/500/506 loader scripts only as scaffolds unless objectives and rewards are proven. |
| P2 | Job quest chains stop at local 0j6 but recovered chains continue | 28 | Keep job tail scripts disabled until actor/marker/reward prerequisites are verified, then extend job_quest_template. |
| P2 | Late main scenario rows are present in gamedata but not locally scripted | 2 | Treat these as high-scene smoke tests after after-warp cutscene ordering is locked down. |
| P2 | Default-talk parity is partial | 1 | Backfill missing default-talk scripts only when actor_class/spawn data proves the actor surface is reachable. |
| P2 | Quest widgets are runtime-backed but exact payload parity is not complete | 94 | Use one quest from each pattern family to capture widget result codes and returned payloads, then add pending quest-widget context validation before broad enablement. Delivery widgets need server item/package/count/HQ/materia/capacity re-resolution before mutation. |
| P3 | Recovered test/system scenario files are not implementation targets yet | 39 | Keep them as reference only unless a local command/NPC explicitly invokes them. |

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Quest scenario parity triage | tools outputs + Data/scripts/quests |
| 2 | Scenario script replacement | class/job/generic/GC templates |
| 3 | Quest director adapter | Data/scripts/directors/Quest and Map Server/Actors/Director |
| 4 | Journal/request command validation | RequestQuestJournalCommand.lua and RequestInformationCommand.lua |
| 5 | Cutscene finalizer ordering | AfterQuestWarpDirector + quest cutscene bridge |
| 6 | Enablement policy | ConfigConstants quest toggles |

## Generated Files

- `source_inventory.csv` (32 rows)
- `recovered_quest_scenario_inventory.csv` (620 rows)
- `recovered_non_scenario_quest_inventory.csv` (9 rows)
- `local_quest_script_inventory.csv` (318 rows)
- `quest_code_parity.csv` (622 rows)
- `quest_family_coverage.csv` (39 rows)
- `recovered_quest_director_inventory.csv` (177 rows)
- `local_quest_director_inventory.csv` (7 rows)
- `quest_widget_command_contracts.csv` (19 rows)
- `local_backend_surface.csv` (24 rows)
- `local_gap_matrix.csv` (10 rows)
- `implementation_contract.csv` (6 rows)
- `probe_queue.csv` (7 rows)
- `source_term_hits.csv` (1751 rows)
- `contract_summary.json`
- `README.md`

## 2026-06-20 Level-40 Tail Notes

- `fsh400` is the best future sequence candidate: quest `110503`, recovered `processEventNnmulikaStart`, `005_*` dialogue, and explicit `fsh40010/20/30/40/50/60` calls. Still missing local loader, secondary actor proof, and verified reward rows after `110502`.
- `bsm400` is scaffold-plus-documentation safe: quest `110323`, recovered `processEventBodenolfStart`, and `bsm40020/30/40/45/50` hooks. Datamine text hints at Zaenskyf and HQ crafting, but objective/reward rows are not verified.
- `exc400` should stay conservative: quest `110103`, recovered Waekbyrt dialogue/fade methods, asset-side `exc40010/20/30/40/60` keys, but no explicit recovered scene calls and only an empty recovered director.
- Do not synthesize rewards for these tails from generic-looking datamine rows; add loaders as scaffolds only unless packet/server-row proof is captured.

## 2026-06-20 Loader Reward-Risk Addendum

- Most current scaffolds are completion scaffolds: generic/class/GC templates can call `CompleteQuest`, and `Player.CompleteQuest` can auto-grant SQL rewards. Scene-rich does not mean safe to enable.
- `Fsh400` is the best hidden docs target: recovered `fsh40010/20/30/40/50/60`, SQL quest row exists, no local script, and no auto-grant reward row was found in this audit. If scaffolded later, keep it hidden/no-offer and detached from completion.
- `Bsm400` is another hidden docs target, but more objective/turn-in shaped; map `bsm40020/30/40/45/50` first and avoid item/craft/reward behavior.
- `Exc400` is weak for scene loader work because recovered Lua has talk/fade methods but no explicit `startNQCutScene` hits. Keep it text-routing-only unless new evidence appears.
- `Man406` and `Man308` are very scene-rich, but local scaffold scripts and SQL reward rows make visible loader work risky. `Man308` / `110017` can auto-grant 114k gil plus 32.5k EXP, and `Man406` / `110019` can auto-grant 138k gil plus 46k EXP if the main-scenario group is re-enabled and a one-talk scaffold completes.
- `Cnj306`, `Gla300`, `Lnc300`, and `Fsh300` are also scene-rich but live class scaffolds with reward rows; keep them docs-only until class scaffold completion is disabled or the quests are hidden. Their scaffold path can grant SQL gil/marks plus script EXP.
- GC entry leads and primal starters are docs-only for now: GC trial leads can still award default script EXP/gil, and primal starter rows such as `Sum6a0`, `Sum6m0`, `Sum6g0`, and `Sum6w0` can still auto-grant EXP if the group is enabled.
- Seasonal reward risk is not limited to reward-select widgets. `Spl0i3` / `110801` can auto-grant Reindeer Antlers `8012502` and Reindeer Suit `8032102`, while `Spl0i4` / `110802` can duplicate item `8012604` because Lua grants it before `CompleteQuest` reaches the SQL reward row.
- For Toto-Rak, prefer runtime entry validation through `totorak_entry.lua`, `PopulaceTotorakEntrance`, and WorldManager duty/widget cutscene plumbing over quest-completing `Etc202` work.

## 2026-06-20 Central Visibility Gate Addendum

- A Lua-only visibility fix is not enough. Handwritten `wld`, mixed `etc`, and tutorial `trl` scripts can set ENPC flags or inject talk options without using the generic scaffold gates.
- Future broad hiding should use a central C# predicate at quest state aggregation and tutorial talk injection, then keep Lua `Get*QuestsEnabled()` helpers as defense-in-depth.
- Treat `wld` as side/world visibility unless a separate `world_quests_enabled` flag is added.
- Do not blanket-disable all `Etc*` scripts: the family mixes side, special, materia/relic/dungeon/system-ish rows. Use an explicit quest id/code allowlist for side/special hiding.
- Tutorial scripts `Trl0l1`, `Trl0g1`, and `Trl0u1` are always-on talk options through `GetTutorialQuest`; hiding tutorial content must account for option ordering and default-talk fallback, not just quest markers.
- `dft` default-talk rows are not normal side/tutorial quest visibility and should stay separate from broad quest disablement.

## 2026-06-20 Ranked Missing Loader Shortlist

- `man406` / quest `110019` is the strongest main-scenario scene-only probe candidate: local is generic scaffold, recovered has `pES`, `pE10`, `pE15`, `processEvent020/025`, `pE30`, `pE50`, `pE60`, and many `man406*` scenes. Keep rewards/completion disabled until objective proof exists.
- `man308` / quest `110017` is the next main-scenario candidate: local is generic scaffold, recovered has `pES`, `pE00/01/10/20/30/50/60/80/90`, `processEvent090`, and scene cross-links into `man30900` and `man40640`. Start with cutscene/dialogue smoke probes only.
- `cnj306` `110262`, `gla300` `110081`, `lnc300` `110181`, `fsh300` `110501`, and `exc306` `110102` all have meaningful recovered class-quest event bodies while local scripts are template/scaffold parity. Add sequence-only loaders behind existing class gates; do not synthesize objective/reward logic.
- Seasonal `spl101_quest`, `spl0i1` `110799`, `spl102` `110860`, `spl0i2` `110800`, and `spl0i3` `110801` are widget/reward-heavy. Treat them as read-only/event-result logging targets until item counts, ownership, capacity, selector return semantics, and add/remove transaction rules are proven. `spl0i3` is especially completion-risky because local SQL reward rows for `110801` auto-grant Reindeer Antlers `8012502` and Reindeer Suit `8032102` through `CompleteQuest`.

## 2026-06-20 Second-Wave Scene/Menu Candidates

These are below the current `man406`/`man308`/class/seasonal shortlist, but they are good follow-up probes once the first wave is stable. Keep every row scene/log-only: no quest accept/complete, no rewards, no objective counters, no BNPC/private-area/instance state, no trial start/clear/fail, and no `sqrwa` payout.

| Candidate | Local status | Recovered anchors | Keep disabled |
| --- | --- | --- | --- |
| `gcl105` / `111431` / Don't Hate the Messenger | `Data/scripts/quests/gcl/gcl105.lua` only calls `InitGrandCompanyQuest("Gcl105")` | `processEventStartLim/Gri/Uld`, `processEventCid01/02`, `processEventSenna01`, `processEventPapalymo04`; scenes `gc010610`, `gc010620`, `elv0l110`; ask rows `14`, `63`, `83`, `119`, `125`, `138`, `170`, `223` | GC state, reward/seal mutations, trial/instance transitions |
| `gla306` / `110082` / Thrill of the Fight | class-template scaffold | `processEventLulutsuStart`, `processEvent003/005/010/020/023/024/025/030/040/045/050/055`; scenes `gla30610/15/20/30/40/50`; ask rows `113`, `51030` | class objective/reward progression |
| `pgl306` / `110062` / Two Sides to Every Chip | class-template scaffold | `processEventGagarunaStart`, `processEvent020/030/040/050/060/070/080/090`; scenes `pgl30610` through `pgl30680`; ask row `51030` | confirmation results as authority, rewards |
| `cul306` / `110442` / Something in the Soup | class-template scaffold | `processEventPrudentiaStart`, `processEvent010_*`, `processEvent020/030/040/050/060/065/070`; scenes `cul30610/20/30/40/50/60/65/70`; ask row `51030` | craft/item gates, completion/reward |
| `bsm300` / `110321` and `bsm306` / `110322` | class-template scaffolds | Bodenolf event bodies; `bsm30010/20/30`, `bsm30610/20/30/40`; ask rows `152`, `156`, `109`, `123`, `126` | blacksmith objective/reward mutation |
| `wdk300` / `110301` and `wdk306` / `110302` | class-template scaffolds | `processEventANaidjaaStart`, `processEventMarcelloixStart`, many `processEvent0xx`; scenes `wdk30010..60`, `wdk30610..60`; ask rows `108`, `129`, `132`, `135` | item/craft/objective mutation |
| `min300` / `110461` / Little Saboteurs | class-template scaffold | `processEventLinetteStart`, `processEvent010/013/017/020/025/030/040/050`; scenes `min30010..70`; ask row `51030` | gather/objective gates and rewards |
| `gcl104` / `111430`, `gcl107` / `111433` | GC template scaffolds plus battle-placeholder comments | Garuda/Rivenroad lead-in scenes `gc01l410`, `gc010410`, `gc010710`, `gc010714`, `gc010750`; ask rows `279`, `16`, `87` | trial start, battle state, rewards/seals |
| `sum6m0` / `110816`, `sum6a0` / `110627`, `sum6g0` / `110867`, `sum6w0` / `110870` | generic quest scaffolds; instance raid directors are identity shims | `processEventLOUISOIXStart`, `processEventContentExit`, Moogle/Ifrit/Garuda/Raven starter flows and ask rows | primal/trial start, clear/fail, loot/reward |
| `com0l5`, `com0l6`, `com0g5`, `com0g6`, `com0u5` | partial local/probe helpers; several entry toggles intentionally disabled | quest events `com0l610`, `com0l510`, `com0g610`, `com0g510`, `com0u610`; `askEnterInstanceRaid`; `RaidFst0Dungeon03.eventNoticeCutScene`; `RaidDungeonExecutionWidget`; scenes `rad0f300/306/307/308` | in-duty timer/widget state, instance entry, occupancy state |

2026-06-21 raid/primal correction: `gcl/gcg/gcu104` and `107` are BNPC-placeholder quest lanes, not Garuda/Rivenroad launch bridges. `Sum6a0`, `Sum6m0`, `Sum6g0`, and `Sum6w0` remain hidden by `primal_quests_enabled=false`; if re-enabled, the generic scaffold can accept/complete without real trial lifecycle state, so keep these scene/log-only until the instance-raid launcher exists.

Seasonal cross-check: no new seasonal P1 was found beyond `spl101_quest`, `spl0i1`, `spl0i2`, `spl0i3`, and `spl102`. Remaining missing `spl0g3/g4/g5`, `spl0i5`, `spl0l3/l4/l5`, `spl0u3/u4/u5`, and `spl103` are recovered `initText` placeholders only.

## 2026-06-20 Seasonal Reward Guard Addendum

- Seasonal reward-heavy quests `110799`, `110800`, `110801`, `110859`, and `110860` should stay out of generic completion/grant paths. They need widget return logging, item count checks, unique ownership, capacity preflight, and add-before-remove rollback before mutation.
- `spl101_quest` has no local quest row and should be treated as a menu/dialogue probe surface only.
- `spl0i3` / `110801` is the highest seasonal completion risk because `Player.CompleteQuest` would grant local SQL reward rows for Reindeer Antlers `8012502` and Reindeer Suit `8032102`.
- Do not trust decompiled constant-looking `RewardSelectWidget` comparisons in `spl0i1`, `spl0i2`, or `spl102` as selected indexes; log cancel, confirm, and every return value first.

## 2026-06-20 Visibility Guard Update

- `Cul400` / `110443` is now explicitly hidden in `class_quest_template.lua` with `noOffer = true`, and the class template now honors `noOffer`. Keep it docs/probe-only until objective, marker, reward, and cutscene sequencing are proven.
- `Spl101` / `110859` is now explicitly hidden in `generic_quest_scaffold.lua` with `noOffer = true`. `seasonal_quests_enabled=false` already hid seasonal offers, but this prevents `Spl101` from appearing if seasonal testing is enabled later.
- Current config now hides broad generated/simple class and late main-scenario scaffolds with `main_scenario_quests_enabled=false` and `class_quests_enabled=false`. `side_quests_enabled=true` and `tutorial_quests_enabled=true` remain enabled, while `grand_company_quests_enabled=false`, `job_quests_enabled=false`, `special_quests_enabled=false`, `seasonal_quests_enabled=false`, and `primal_quests_enabled=false`.
- Before the config flip, main/class candidates such as `man304`, `man308`, `man402`, `man406`, `pgl300`, `arc300`, `cnj300`, `gld300`, `hrv306`, and `tan306` were likely offerable if prerequisite/class gates lined up. Do not wire recovered scene bodies into them without either keeping the group disabled, hiding the target first, or adding a scene-only debug gate.
- Job `0j6`, GC, special, seasonal, and primal rows are safer decomp/doc targets because their groups are currently config-disabled, but reward/action/item grants still need explicit no-mutation guards before any local implementation.
- Side/tutorial audit result: no additional live generic side/tutorial scaffold offer was found in the latest pass; `Trl0l3` is `noOffer`, and `Etc202` is under the disabled `special` group.

## 2026-06-20 Handwritten Visibility Leak Addendum

- C# loads all `gamedata_quests` rows without category filtering, then normal quest availability is driven by level/prereq checks. Category config only hides Lua surfaces that explicitly call the gate helper or use `InitQuestScaffold`.
- `Etc200` / `110818`, `Etc201` / `110819`, and `Etc304` / `110869` are classified as `special`, but their handwritten scripts do not currently call `GetSpecialQuestsEnabled()`. With `special_quests_enabled=false`, they are still the primary visibility leak candidates.
- `Etc200` exposes Sibold talk/reward states and completes through `sqrwa`; `Etc201` exposes Leleyo/Aurum Vale contact talk and reward states; `Etc304` exposes Louisoix plus Twelve prayer object push/emote paths.
- The hide must prevent ENPC flag creation as well as accept/complete flows. `Quest.IsQuestENPC` reads quest-state ENPC flags, so guard `onStateChange`, `onTalk`, journal methods, and active event handlers; for `Etc304`, also guard `handlePrayer`, `onPush`, and `onEmote`.
- `Etc106` is already guarded by `GetSpecialQuestsEnabled()`, and `Etc202` uses `InitQuestScaffold`; no other live special-script contradiction like `etc200/201/304` was found in this audit.
- Safest hide strategy, if broad hiding is desired: add small `GetSpecialQuestsEnabled()` guards to `etc200`, `etc201`, and `etc304` in `onStateChange`, event handlers, journal info, and journal markers. For `etc304`, also guard `handlePrayer`, `onPush`, and `onEmote`.
- Do not delete DB rows or spawn rows to hide these. Returning without re-adding ENPC flags is enough for marker cleanup because quest state rebuilds current ENPC state and removes old entries.

## 2026-06-21 Visibility Proof Chain

- Current config exports `job_quests_enabled=false`, `special_quests_enabled=false`, `seasonal_quests_enabled=false`, and `primal_quests_enabled=false` to Lua, but C# quest availability itself does not apply a quest-category filter.
- Generic scaffolds and job templates are gated in normal play: scaffolded `Sum6*` and `Spl*` rows, job `111201..111326`, Dreamer/Foundation Day delegates, `spl0i4`, `spl000`, `spl101`, and `PopulaceSpecialEventCryer` all have Lua-side gates in the current repo.
- The normal visibility contradiction remains handwritten `Etc200/110818`, `Etc201/110819`, and `Etc304/110869`: they are SQL-visible level-45 special rows, can reach `SEQ_ACCEPT = 65535`, and set ENPC/event flags without checking `GetSpecialQuestsEnabled()`.
- `Etc304` has the widest unsafe interaction surface because Louisoix talk and Twelve prayer object push/emote handlers are all ungated.
- GM/debug `player:AddQuest` can bypass config and place disabled rows in the journal. Treat that as a controlled test path, not a normal visibility leak.

## 2026-06-20 Post-Wave Quest Scene/Menu/Director Gaps

- Post-wave main-scenario probes after `man406`/`man308`: `man304` / `110016` and `man402` / `110018` are local `generic_scaffold_instance` scripts only. Recovered anchors: `man304` `pES/pE10/pE20/pE30`, scenes `man30400/10/20/30`, ask row `490`, after-warp finalizers in `pE20/pE30`; `man402` `pES/pE10/pE20/pE30/pE03/pE23`, scenes `man40200/10/20/30`, after-warp finalizer in `pE30`. Keep completion, reward, objective, SNPC placement/order mutation, and after-warp progression disabled.
- `man502` / `110020` and `man504` / `110021` remain disabled/reference-only: gamedata rows exist but no local scripts exist; recovered scenario bodies are `initText` only, with `man502` directors recovered but no local quest/director implementation.
- Cutscene-finalizer smoke set remains `man2l0`, `man0g1`, `man0l1`, `man0u1`, `man2g0`, `man2u0`. Use them only to verify `scene -> event close -> scheduled warp -> map/private-area load -> startFadeInCutSceneAfterWarp`; do not add new progression/reward behavior during finalizer testing.
- Next class scene-only candidates: `pgl300` / `110061`, `arc300` / `110161`, `hrv306` / `110482`, `cnj300` / `110261`, `gld300` / `110361`, `tan306` / `110382`. All are local `class_template_instance` scripts only; keep class gates, item/craft/gather checks, objective counters, completion, rewards, and `sqrwa` disabled.
- Job `0j6` director candidates: `blm0j6` / `111266`, `whm0j6` / `111246`, `mnk0j6` / `111226`, `pld0j6` / `111286`, `war0j6` / `111206`, `brd0j6` / `111306`. Local status is `job_template_instance`; recovered normal directors exist but are missing locally. Keep AF item grants, ability grants, reward widgets, battle clears, and job completion disabled.
- Job tail codes `blm/brd/drg/mnk/pld/war/whm` `0j7/0j8/0j9/1j0` stay disabled: recovered files exist, but there are no local scripts and no gamedata quest ids.
- GC 701 menu/director candidates: `gcg701` / `111628`, `gcl701` / `111428`, `gcu701` / `111828` are local `grand_company_template_instance` scripts only. Recovered scenario anchors include `askExtendWidget` rows, `openGrandCompanyJoinEffectWidget(city, 21)`, and `GrandCompanyStatusWidget`; recovered directors expose `getKindContentsInformation() == 1`. Keep GC enlistment/status/rank/seal mutation and content-info work sync disabled.
- Primal late rows `sum7l0` / `110628`, `sum7t0` / `110629`, `sum8a0` / `110630`, `sum8l0` / `110631`, `sum8t0` / `110632` remain disabled/reference-only: gamedata rows exist, no local scripts exist, recovered scenario bodies are `initText` only, and no recovered quest director row was found.
- SimpleQuestBattle remains adapter-first only. Post-wave queue includes GC `com0g1/com0g4/com0g6/com0l1/com0l4/com0l5/com0l6/com0u1/com0u4/com0u5/com0u6/gcg103/gcg301/gcg302/gcg303/gcg305/gcl103/gcl301/gcl302/gcl303/gcl305/gcu103/gcu301/gcu302/gcu303/gcu305`, job `blm0j1/brd0j1/brd0j4/drg0j1/drg0j6/mnk0j1/pld0j1/pld0j5/war0j1/war0j3/whm0j1/whm0j4`, and class `wvr306`. Preserve explicit client quest id overrides `com0l6 = 111406`, `com0u5 = 111805`, and `etc3g2` / `QuestDirectorEtc3g201 = 110736`.

## 2026-06-20 Scene-Only Probe Guardrails

- `man406`, `man308`, `cnj306`, `gla300`, `lnc300`, `fsh300`, and `exc306` are all scaffold/template parity only locally. Recovered director files for these are base-class shells, so do not infer battle, private-area, objective, or director behavior from the director names alone.
- Keep these probe loaders scene/dialogue-only: disable `AcceptQuest`, `CompleteQuest`, `QFLAG_REWARD`, ENPC progression, SQL reward payout, `delegateEvent(... "sqrwa")`, item/gil/EXP grants, objective mutation, quest director startup, BNPC/NM spawning, private-area warp, win/loss handling, and item/gather/emote objective logic.
- Treat `ask(...)` calls as log-only until widget result semantics are captured; several recovered sequences include worldMaster ask rows but no server-side validation contract yet. For seasonal reward scripts, do not trust decompiled constant-looking `RewardSelectWidget` comparisons as selected indexes.

| Quest | Local status | Scene/dialogue probe anchors | Keep disabled |
| --- | --- | --- | --- |
| `man406` / `110019` / Futures Perfect | generic scaffold; actor `1100449`, marker `11001902`; SQL reward rows exist but are not authority for probe | `pES`, `pE10`, `pE15`, `processEvent020`, `processEvent025`, `pE30`, `pE50`, `pE60`; scenes `man40600/10/15/20/30/35/45/50/60`, `MAN40625`; `man40645` has asset evidence but no `cutReplay` row | rewards, objectives, after-warp progression, SNPC ordering beyond logging |
| `man308` / `110017` / Lord Errant | generic scaffold; actor `1100449`, marker `11001703`; SQL reward rows exist but are not authority for probe | `pES`, `pE00`, `pE01`, `pE10`, `pE20`, `pE30`, `pE50`, `pE60`, `pE80`, `processEvent090`, `pE90`; scenes `man30800/10/30/50/60/80/90`, plus `man30900` and `man40640` links | Paglth'an/battle target behavior, completion, rewards |
| `cnj306` / `110262` / The Call of Nature | class-template scaffold; Soileine start evidence; actor `1000141`, marker `11026201` | `processEventSoileineStart`, `processEvent010/020/030/040/050/060/070/080/090/095`; scenes `cnj30610` through `cnj30690`; ask rows include `50` and worldMaster `51030` | class completion/reward currency, objective gates |
| `gla300` / `110081` / Unalienable Rights | class-template scaffold; Lulutsu start evidence; actor `1300018`, marker `11008101` | `processEventLulutsuStart`, `processEvent020/030/040/050/060/070/080`; scenes `gla30010` through `gla30080`; ask rows `164` and worldMaster `51030` | `j_moldva` NM/battle row `3062`, rewards, class progression |
| `lnc300` / `110181` / Culture Shock | class-template scaffold; Jmoldva start evidence; actor `1400019`, marker `11018101` | `processEventJMoldvaStart`, `processEvent020/030/040/050/060/065/070`; scenes `lnc30010/20/30/40/50/60/65/70` | battle/objective handling, reward/completion |
| `fsh300` / `110501` / The Beast of the Barrel | class-template scaffold; N'nmulika start evidence; actor `1500024`, marker `11050101` | `processEventNnmulikaStart`, `processEvent010/020/025/030/040/050/060/070`; scenes `fsh30010/20/25/30/40/50/60/70`; ask rows `106`, `116`, worldMaster `51030` | fishing/objective gates, rewards, completion |
| `exc306` / `110102` / Captain's Orders | class-template scaffold; Waekbyrt start evidence; actor `1600217`, marker `11010201` | `processEventWaekbyrtStart`, `processEvent010/020/030/040/050/060/070`; scenes `exc30610` through `exc30670`; ask row `64`, worldMaster `51030` | NM/objective behavior, rewards, completion |

## 2026-06-21 Quest/Cutscene Tail Audit

- No additional literal `400/500/506` class tail beyond the known `bsm400`, `cul400`, `exc400`, and `fsh400` set has a dense recovered retail body. Other tails such as `acn400`, `cnj400`, `lnc400`, and `wvr400` are `initText` placeholders and should stay low priority.
- The next useful class/cutscene work is the hidden `300/306` scaffold layer: `bsm300`, `wdk300`, `wdk306`, `exc306`, `tan306`, `gla306`, `cul306`, `min300`, `pgl306`, and `wvr306`. These are dense recovered scene/dialogue bodies, but local scripts currently call only `InitClassQuest`.
- Risk posture: `class_quests_enabled=false` currently hides this group, but re-enabling class quests can make them visible and mutating through `class_quest_template` offer/accept/`sqrwa`/complete behavior plus SQL reward rows. Keep any probe scene/log-only and disable per-quest completion/rewards before testing with the class gate on.
- Highest-value next probes are `bsm300`, `wdk300`, and `wdk306`, followed by `exc306`, `gla306`, `pgl306`, `cul306`, `min300`, and `tan306`. Treat `wvr306` as adapter-first because recovered inventory shows both normal and SimpleQuestBattle director rows but no local recovered director bridge.
- Job `0j6` directors stay hidden but mutation-risky: local job template can grant AF items/actions before completion. Probe only after job grants, battle clear, rewards, and completion are hard-disabled.
- GC701 remains menu/director-rich but log-only: it touches GC join/status UI and QCI content-info directors, but must not mutate rank, status, seals, enlistment, or content-info work outside the probe adapter.
- Cutscene replay/skip validation stays on native owner flows: inn replay actor and live skippable cutscenes only. Do not inject `ReplayCutsceneSelectWidget`, `CutSceneSkipWidget`, or `CutSceneSkipWarningWidget` through generic WidgetOpen.
- Current SQL/parity data maps the handwritten special visibility leak candidates to `Etc200/201/304` ids `110818/110819/110869`; use those ids for hide/visibility audits.

## 2026-06-21 Local-vs-Recovered Dense Probe Refresh

- The dense `300/306` class set is local only as `InitClassQuest(...)` shims: `bsm300`, `wdk300`, `wdk306`, `exc306`, `gla306`, `pgl306`, `cul306`, `min300`, `tan306`, and `wvr306`. Keep them scene/log-only and hidden by the class gate.
- `Cul400` is locally present but explicitly `noOffer=true`; stale generated CSV rows may still show no local loader. Treat the markdown and local script as current authority until the generator is refreshed.
- `Bsm400`, `Exc400`, and `Fsh400` remain recovered-only/no local loader. `Fsh400` is still the best future hidden docs target; `Bsm400` is docs/scaffold-safe; `Exc400` stays text-routing-only.
- GC701 has local company quest-template hooks and a provisional QCI bridge. That proves kind-1 overlay probing, not GC enlistment/status/rank/seal mutation, SimpleQuestBattle, or `ContentCommand` work sync. "Log-only" is the desired probe policy; if the GC gate is enabled, the local template can still advance, grant default EXP/gil, and complete unless those mutation paths are explicitly disabled.
- Recovered SimpleQuestBattle remains adapter-first: many recovered child directors exist, but no local base adapter or exact local child director files are production-ready. `wvr306` is a good example because recovered normal and SimpleQuestBattle evidence exists while local quest code is only a class template shim.

## 2026-06-21 Hide/Expose Rule Of Thumb

- Safe to keep hidden/scaffolded: job rows, Sum6/primal rows, `Spl*` seasonal rows, dense `300/306` class rows, `Cul400`, GC701, and recovered SimpleQuestBattle children.
- Must stay no-mutation: any class/job/GC quest that can reach `AcceptQuest`, `CompleteQuest`, `QFLAG_REWARD`, `sqrwa`, item/action grants, objective counters, BNPC spawns, private areas, or content-info work sync before its owner/director path is proven.
- Needs actual hide guard if runtime visibility matters: `Etc200`, `Etc201`, and `Etc304`. They are the current known normal-player visibility exceptions because they are SQL-visible and lack the same script-level config guard as generic special/seasonal scaffolds.
- Stale generated CSVs should not override local source when they disagree on `Cul400` or other newly added shims; refresh generators later, but use markdown plus local script existence as the current operational truth.
