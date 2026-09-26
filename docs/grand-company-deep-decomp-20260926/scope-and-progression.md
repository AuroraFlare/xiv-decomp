# Grand Company scope, progression, rewards, and journal audit

Date: 2026-09-26. Reproduce with `python -B tools/audit_gc_deep_scope.py build`; verify with `check`.

This independently reconciles **102 core identities: 69 named quests and 33 internal `[en]` rows**, plus the separately counted **Noc001 / 110817** supply-system owner. SQL class prefixes, native quest categories 201–204, and the complete availability block agree exactly. The older 45-GC bytecode scope omitted 24 named quests and all 33 internal rows. No gameplay, SQL, placements, live database, or runtime process changed.

The source ledger below records current implementation separately from native evidence. Existing Elemen transcriptions are retained with their source lines; this pass did not fetch the archive again. Native journal wording and reward formula fields are copied from the locally extracted client sheets. Decompiled client methods are evidence of presentation logic, not proof of server progression or live acceptance.

## Scope reconciliation

| Bucket | All rows | Uncommented offers |
| --- | ---: | ---: |
| patch_1_18 | 18 | 15 |
| patch_1_19 | 20 | 0 |
| patch_unknown_or_internal | 33 | 0 |
| patch_1_22 | 9 | 0 |
| patch_1_22b | 9 | 0 |
| patch_1_20 | 6 | 0 |
| patch_1_23 | 3 | 0 |
| patch_1_22c | 3 | 0 |
| patch_1_19a | 1 | 0 |

The 2026-09-25 patch report's `patch_1_18: 15 rows` conflates **18 inventoried quests** with **15 uncommented offers**; the three Darkhold rows are present but commented. Uncommented is source availability only, not a client-tested claim.

The 24 named additions beyond the old 45 are: `Gcl303`, `Gcl305`, `Gcl103`, `Gcl104`, `Gcl105`, `Gcl106`, `Gcl107`, `Gcl702`, `Gcg303`, `Gcg305`, `Gcg103`, `Gcg104`, `Gcg105`, `Gcg106`, `Gcg107`, `Gcg702`, `Gcu303`, `Gcu305`, `Gcu103`, `Gcu104`, `Gcu105`, `Gcu106`, `Gcu107`, `Gcu702`.

## Progression findings

- Main SQL encodes each opening chain from `110014` (Together We Stand), with both `Com5*0` and `Com5*1` branching from `Com0*3`. These are database edges; the native `quest.csv` export has no recovered prerequisite IDs in the blank early columns. Journal text and branch arguments can constrain prerequisites but do not automatically authenticate every SQL edge. The audited SQL graph has no cycle.
- After `Com0*7`, SQL splits into `101 -> 102 -> 701 -> 103 -> 104 -> 105 -> 106 -> 702 -> 107` and `301 -> 302 -> 303 -> 304 -> 305`. The three 107 rows are level 45 but depend on level-50 702. This inversion remains an explicit open question.
- [Map Server/Actors/Quest/QuestStateManager.cs:219](<../../Map Server/Actors/Quest/QuestStateManager.cs#L219>) retains SQL prerequisite checking for enlistment, but explicitly bypasses the prerequisite bit for six 701/702 offers when allowlist, level, company, exact rank and medal checks succeed. [Map Server/Actors/Chara/Player/Player.cs:5693](<../../Map Server/Actors/Chara/Player/Player.cs#L5693>) requires rank 17 or 27, plus the relevant medal. All six offers remain commented today.
- Native level column 51 disagrees with SQL on every internal row (10 versus 0); Noc001 also has native 10 versus SQL 0. These are template metadata discrepancies, not permission to enable placeholders. Column 53 is recorded as rank-like raw metadata: 0/11/15/17/21/27. Its complete native schema/acceptance semantics are not inferred from those values alone.
- Native foreign-company exclusions for pre-enlistment routes and mutual exclusion of active same-dungeon variants are enforced by `GrandCompanyOpeningQuestRules`. Completion history is not a permanent dungeon-family ban. Shared 101/104/105/106/107 family code and named stub rows are kept as distinct identities; no cross-company dispatch alias is invented.

## Reward findings

- All 102 core rows have 16 raw 13-column `quest_new_reward` slots. Exact seal rows use item IDs 1000201/1000202/1000203 and the quantity two fields later. Slots with `-13,534,8090201` encode an EXP-like formula selector; treating 5, 6, 7, or 8 there as a literal EXP reward would be wrong. Formula evaluation is unresolved in this scope audit.
- The per-quest ledger separates raw native seals, archive-transcribed EXP/bonus claims, and server payout code. A no-seal slot is not evidence of no reward. The generic `InitGrandCompanyQuest` audit gate is true, so its seal inventory is not a working completed route.
- Rank completions at [Map Server/Actors/Chara/Player/Player.cs:5832](<../../Map Server/Actors/Chara/Player/Player.cs#L5832>) and [Data/scripts/quests/com/gc_rank_quest.lua:75](<../../Data/scripts/quests/com/gc_rank_quest.lua#L75>) do not award EXP in the inspected path. The archive ledger lists 6,231 EXP for 701 and 6,600 EXP for 702. Final promotion instead grants coin 10011251 if absent plus up to 5,000 seals, clamped under 50,000; it consumes the medal. This is an observed reward gap/behavior distinction, not a change request executed here.
- The main `gamedata_quest_rewards.sql` contains no reward rows for any of the 102 core identities or Noc001. [Map Server/Actors/Chara/Player/Player.cs:6087](<../../Map Server/Actors/Chara/Player/Player.cs#L6087>) can apply SQL completion rewards, but there is no such fallback for the six promotion EXP omissions in the audited main SQL. The reward generator decodes concrete EXP type -12, not these -13 slots. Source-only inspection does not assert the state of a separately configured live database.
- Once-only Lua reward checkpoints persist flags 21–23, but currency/EXP writes and quest flag saves are separate database operations. They protect coroutine retries, not process-crash atomicity; `gc_reward_checkpoint.lua:5-8` states this explicitly.
- The final promotion coin's later 25,000-seal exchange is a separate transaction, not an additional direct quest reward. Source lines for the item/medal mappings and the cap are included in `inventory.json`.

## Complete quest ledger

For every entry, the native full journal expressions and resolved English journal rows, all sixteen reward slots, extracted source lines, and SHA-256 input manifest are in [inventory.json](../../outputs/grand-company-deep-decomp-20260926/scope/inventory.json). [inventory.csv](../../outputs/grand-company-deep-decomp-20260926/scope/inventory.csv) provides a filterable index. CSV source locations are physical line numbers, including multiline records.

### 110817 / Noc001 — Provisioning & Supply Missions

all companies; **auxiliary-system-owner**; `system-owner`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L385>)). Native level **10**, category **101**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L356>)).
Native client: **service-methods**, 18 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/noc/noc001.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L356>)).

### 111401 / Com0l1 — The Price of Integrity

Maelstrom; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **110014** ([main SQL](<../../Data/sql/gamedata_quests.sql#L455>)). Native level **22**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L426>)).
Native client: **event-methods**, 9 own non-init methods (9 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0l1.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L416>)). Bespoke route: 0 direct seals and 1760 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Sea:230, Sea:231, Sea:265, Sea:232, Sea:233, Sea:266, Sea:229` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L426>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L27>)): The Price of Integrity. Guincum → Walcher → Urianger; La Noscea `(40,17)`, 30-minute private content, Peiste Familiar; return with Walcher's signed agreement `11000254`. Reward: No direct Storm Seal row + 1,760 EXP.

### 111402 / Com0l2 — Testing the Waters

Maelstrom; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111401** ([main SQL](<../../Data/sql/gamedata_quests.sql#L456>)). Native level **22**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L427>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0l2.lua#L1>).
Native reward: **250 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L417>)). Bespoke route: 250 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Sea:243` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L427>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L28>)): Testing the Waters. Guincum report/dialogue step; immediate, non-combat completion. Reward: 250 Storm Seals + 1,100 EXP.

### 111403 / Com0l3 — Seals for the Whorl

Maelstrom; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111402** ([main SQL](<../../Data/sql/gamedata_quests.sql#L457>)). Native level **22**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L428>)).
Native client: **event-methods**, 1 own non-init methods (1 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0l3.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L418>)). Bespoke route: 0 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Sea:244` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L428>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L29>)): Seals for the Whorl. Grizzly Gnat report/dialogue step; non-combat and no direct seal payout. Reward: No direct Storm Seal row + 1,100 EXP.

### 111404 / Com0l4 — Engineering Victory

Maelstrom; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111403** ([main SQL](<../../Data/sql/gamedata_quests.sql#L458>)). Native level **22**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L429>)).
Native client: **event-methods**, 10 own non-init methods (10 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0l4.lua#L1>).
Native reward: **500 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L419>)). Bespoke route: 500 direct seals and 1541 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Sea:235, Sea:236, Sea:237, Sea:238, Sea:234` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L429>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L30>)): Engineering Victory. Guincum → three Eastern La Noscea waves at `(35,14)`—Funditor/Bestiarius, Speculator/Triarius, then Veles—→ Magitek transceiver `11000259` → Ebrelnaux at Millers' Glade → Guincum. Reward: 500 Storm Seals + 1,541 EXP.

### 111405 / Com0l5 — An Officer and a Wise Man

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111404** ([main SQL](<../../Data/sql/gamedata_quests.sql#L459>)). Native level **25**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L430>)).
Native client: **event-methods**, 16 own non-init methods (16 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0l5.lua#L1>).
Native reward: **300 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L420>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Sea:284, Sea:285, Sea:286, Sea:287, Sea:283` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L430>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L31>)): An Officer and a Wise Man. Guincum → 30-minute rough-pirate content in Eastern La Noscea `(31,24)` → Merlwyb/Urianger → Zanthael ceremony → Y'shtola; the route returns through the magitek-accumulator handoff. Reward: 300 Storm Seals + 1,891 EXP.

### 111406 / Com0l6 — Ceruleum Shock

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111405** ([main SQL](<../../Data/sql/gamedata_quests.sql#L460>)). Native level **25**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L431>)).
Native client: **event-methods**, 19 own non-init methods (19 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0l6.lua#L1>).
Native reward: **300 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L421>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Sea:289, Sea:290, Sea:291, Sea:292, Sea:288` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L431>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L32>)): Ceruleum Shock. Guincum → ferry-dock Imperial fight—Speardancer, Bladedancer, Shadowspinner, and Lightspinner—→ Aisborgsyn → Central Thanalan `(24,23)` → Cid. Reward: 300 Storm Seals + 1,891 EXP.

### 111407 / Com0l7 — Till Sea Swallows All

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111406** ([main SQL](<../../Data/sql/gamedata_quests.sql#L461>)). Native level **25**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L432>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [InitGrandCompanyEnlistmentQuest](<../../Data/scripts/quests/com/com0l7.lua#L1>).
Native reward: **1000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L422>)). Join company at rank 11; 1000 seals and 1080 EXP through once-only checkpoints.
Journal references: `Sea:293` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L432>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L33>)): Till Sea Swallows All. Guincum formal-assignment dialogue; pledge to the Maelstrom through the officer checkbox, then close the route with the company completion scene. Reward: 1,000 Storm Seals + 1,080 EXP.

### 111408 / Com0l8 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L462>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L433>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com0l8.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L423>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L433>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111409 / Com0l9 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L463>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L434>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com0l9.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L424>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L434>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111410 / Com5l0 — Imperial Devices (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_18`; offer uncommented. SQL level **25**, prerequisite **111403** ([main SQL](<../../Data/sql/gamedata_quests.sql#L464>)). Native level **25**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L435>)).
Native client: **event-methods**, 14 own non-init methods (13 with the processEvent prefix). Runtime: [InitTotorakGrandCompanyQuest](<../../Data/scripts/quests/com/com5l0.lua#L1>).
Native reward: **1000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L425>)). 1000 seals and 2160 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Sea:247, Sea:248, Sea:249, Sea:250, Sea:251, Sea:259, Sea:260, Sea:261, Sea:246` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L435>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L70>)): Toto-Rak Imperial Devices route; the Moogle inspects the magitek field points and returns a black thunder plate for the Limsa report. Reward: 1,000 Storm Seals + 2,160 EXP.

### 111411 / Com5l1 — Into the Dark (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_18`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111403** ([main SQL](<../../Data/sql/gamedata_quests.sql#L465>)). Native level **45**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L436>)).
Native client: **event-methods**, 10 own non-init methods (10 with the processEvent prefix). Runtime: [InitDzemaelGrandCompanyQuest](<../../Data/scripts/quests/com/com5l1.lua#L1>).
Native reward: **4000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L426>)). 4000 seals and 6231 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Sea:253, Sea:254, Sea:255, Sea:256, Sea:257, Sea:258, Sea:262, Sea:263, Sea:264, Sea:252` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L436>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L71>)): Dzemael Stronghold route; Aurnest/Kyria briefing, Dilstveitz handoff, then Imperial Primio Denarius evidence in the dungeon. Reward: 4,000 Storm Seals + 6,231 EXP.

### 111412 / Com5l2 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L466>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L437>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5l2.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L427>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L437>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111413 / Com5l3 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L467>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L438>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5l3.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L428>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L438>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111414 / Com5l4 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L468>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L439>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5l4.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L429>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L439>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111415 / Com5l5 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L469>)). Native level **10**, category **201**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L440>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5l5.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L430>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L440>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111416 / Gcl101 — It Kills with Fire (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **30**, prerequisite **111407** ([main SQL](<../../Data/sql/gamedata_quests.sql#L470>)). Native level **30**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L441>)).
Native client: **event-methods**, 26 own non-init methods (26 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl101.lua#L1>).
Native reward: **1000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L431>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:295, Sea:296, Sea:297, Sea:298, Sea:299, Sea:300, Sea:301, Sea:302, Sea:294` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L441>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L72>)): Ifrit route described in the shared family ledger. The six NM crystal checks precede the Bowl of Embers battle and the rank-assignment history. Reward: 1,000 Storm Seals + 3,040 EXP; 1,500 EXP bonus.

### 111417 / Gcl301 — The Cove

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111407** ([main SQL](<../../Data/sql/gamedata_quests.sql#L471>)). Native level **25**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L442>)).
Native client: **event-methods**, 3 own non-init methods (3 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcl/gcl301.lua#L1>).
Native reward: **300 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L432>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Sea:272, Sea:273, Sea:271` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L442>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L73>)): `アワアワ大作戦` / The Cove. Clifton in the Lower Deck `(5,6)` sends the player to La Noscea `(8,21)` for a 30-minute Dirt Slug fight. Reward: 300 Storm Seals + 1,891 EXP.

### 111418 / Gcl302 — Saving the Stead Instead

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111417** ([main SQL](<../../Data/sql/gamedata_quests.sql#L472>)). Native level **25**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L443>)).
Native client: **event-methods**, 7 own non-init methods (7 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcl/gcl302.lua#L1>).
Native reward: **300 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L433>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Sea:268, Sea:269, Sea:270, Sea:267` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L443>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L74>)): `荒ぶる海賊たち` / Saving the Stead Instead. Hastrofwab `(4,7)` starts the route; a Philirskiff scene around `(40,18)` leads to a 30-minute Kobold battle at the same location. Reward: 300 Storm Seals + 1,891 EXP.

### 111419 / Gcl303 — It's a Piece of Cake to Bake a Poison Cake

Maelstrom; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111418** ([main SQL](<../../Data/sql/gamedata_quests.sql#L473>)). Native level **40**, category **201**, rank-like column 53 **15** ([native quest row](<../../docs/Dat Mining/quest.csv#L444>)).
Native client: **event-methods**, 4 own non-init methods (4 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl303.lua#L1>).
Native reward: **1000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L434>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:304, Sea:305, Sea:303` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L444>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L75>)): `スウィートビスケット騒動` / It’s a Piece of Cake to Bake a Poison Cake. Le Suceemo in the Upper Deck `(7,3)` sends the player to La Noscea `(33,32)` for a 30-minute Gluttonous Qiqirn fight and aftermath scene. Reward: 1,000 Storm Seals + 4,260 EXP.

### 111420 / Gcl304 — Kobold and the Beautiful

Maelstrom; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111419** ([main SQL](<../../Data/sql/gamedata_quests.sql#L474>)). Native level **45**, category **204**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L445>)).
Native client: **event-methods**, 8 own non-init methods (8 with the processEvent prefix). Runtime: [InitGrandCompanyFieldInteractionQuest](<../../Data/scripts/quests/gcl/gcl304.lua#L1>).
Native reward: **700 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L435>)). 700 seals and configured 4450 EXP after three field-object interactions and report.
Journal references: `Sea:275, Sea:276, Sea:277, Sea:274` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L445>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L76>)): `地底の秘境` / Kobold and the Beautiful. Lilina `(4,5)` → Kurtz Nolan `(22,7)` → three U'Ghamaro points around `(5–6,5)`. The three object interactions are the field-survey contract, not a kill quest. Reward: 700 Storm Seals + 4,450 EXP.

### 111421 / Gcl501 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L475>)). Native level **10**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L446>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcl/gcl501.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L446>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111422 / Gcl502 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L476>)). Native level **10**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L447>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcl/gcl502.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L447>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111423 / Gcl601 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L477>)). Native level **10**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L448>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcl/gcl601.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L448>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111424 / Gcl602 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L478>)). Native level **10**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L449>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcl/gcl602.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L449>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111425 / Gcl603 — [en]

Maelstrom; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L479>)). Native level **10**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L450>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcl/gcl603.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L450>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111426 / Gcl305 — Oil Crisis

Maelstrom; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111420** ([main SQL](<../../Data/sql/gamedata_quests.sql#L480>)). Native level **50**, category **201**, rank-like column 53 **21** ([native quest row](<../../docs/Dat Mining/quest.csv#L451>)).
Native client: **event-methods**, 7 own non-init methods (7 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl305.lua#L1>).
Native reward: **700 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L436>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:307, Sea:308, Sea:306` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L451>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L77>)): `一流を支えるもの` / Oil Crisis. Singsmid in the Upper Deck `(7,7)` sends the player to La Noscea `(25,8)` for a 30-minute Deadly Nightshade fight and item return. Reward: 700 Storm Seals + 6,600 EXP.

### 111427 / Gcl102 — Alive

Maelstrom; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111416** ([main SQL](<../../Data/sql/gamedata_quests.sql#L481>)). Native level **40**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L452>)).
Native client: **event-methods**, 21 own non-init methods (21 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl102.lua#L1>).
Native reward: **1000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L437>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:317, Sea:318, Sea:319, Sea:320, Sea:316` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L452>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L78>)): `王狼へのはなむけ` / Alive. After formal assignment, Guincum's La Noscea scene around `(22,7)` leads to a 30-minute Imperial Hoplomachus battle at `(20,5)`, followed by Cid, Ebrelnaux, and Jijina around `(17,6)`. Reward: 1,000 Storm Seals + 4,971 EXP.

### 111428 / Gcl701 — The Weakest Link

Maelstrom; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111427** ([main SQL](<../../Data/sql/gamedata_quests.sql#L482>)). Native level **45**, category **201**, rank-like column 53 **17** ([native quest row](<../../docs/Dat Mining/quest.csv#L453>)).
Native client: **event-methods**, 12 own non-init methods (12 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcl/gcl701.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L438>)). Rank 17->21; medal consumed; no EXP grant observed in the completion path.
Journal references: `Sea:310, Sea:311, Sea:312, Sea:313, Sea:314, Sea:309` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L453>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L79>)): `「コボルド軍野営」疲弊作戦` / The Weakest Link promotion trial. Aleine Brooks `(32,13)` starts the merit scoring; the targets are Kobold Cragsman, Kobold Roundsman, and Kobold Bedesman. Reward: 6,231 EXP; 1,000 merit; 2,500-seal badge cost.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

### 111429 / Gcl103 — Deus ex Machina

Maelstrom; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111428** ([main SQL](<../../Data/sql/gamedata_quests.sql#L483>)). Native level **45**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L454>)).
Native client: **event-methods**, 8 own non-init methods (8 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl103.lua#L1>).
Native reward: **1500 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L439>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:345, Sea:346, Sea:347, Sea:344` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L454>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L80>)): `開かれた血路` / Deus ex Machina. Guincum → Limsa gunner-guild Merlwyb scene → 30-minute Magitek Vanguard battle around `(12,23)` → report. Reward: 1,500 Storm Seals + 5,340 EXP.

### 111430 / Gcl104 — In for Garuda Wakening (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111429** ([main SQL](<../../Data/sql/gamedata_quests.sql#L484>)). Native level **45**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L455>)).
Native client: **event-methods**, 38 own non-init methods (38 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl104.lua#L1>).
Native reward: **2000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L440>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:349, Sea:350, Sea:351, Sea:352, Sea:353, Sea:354, Sea:355, Sea:348` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L455>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L81>)): `盟主ルイゾワの導き（リムサ）` / In for Garuda Wakening. Louisoix and Quarymill item setup lead to the Garuda route. Reward: 2,000 Storm Seals + 6,231 EXP; 2,500 EXP bonus.

### 111431 / Gcl105 — Don't Hate the Messenger (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111430** ([main SQL](<../../Data/sql/gamedata_quests.sql#L485>)). Native level **45**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L456>)).
Native client: **event-methods**, 75 own non-init methods (75 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl105.lua#L1>).
Native reward: **2000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L441>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:362, Sea:363, Sea:364, Sea:365, Sea:366, Sea:367, Sea:368, Sea:369, Sea:370, Sea:371, Sea:372, Sea:373, Sea:374, Sea:375, Sea:376, Sea:361` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L456>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L82>)): `リムサ・ロミンサの岐路` / Don't Hate the Messenger. Cross-city letters lead to a Mor Dhona scene around `(16,21)`, three VII Legion kills near `(7,17)`, an object inspection, and the Limsa report. Reward: 2,000 Storm Seals + 6,231 EXP.

### 111432 / Gcl106 — United We Stand (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111431** ([main SQL](<../../Data/sql/gamedata_quests.sql#L486>)). Native level **45**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L457>)).
Native client: **event-methods**, 32 own non-init methods (32 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl106.lua#L1>).
Native reward: **5000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L442>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:357, Sea:358, Sea:359, Sea:360, Sea:356` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L457>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L83>)): `勝利への行進（リムサ）` / United We Stand. Mor Dhona Jaqis Rider `(9,13)` → Castrum Novum `(5,10)` → 30-minute Transmission Tower destruction. Reward: 5,000 Storm Seals + 6,231 EXP; 6,000 EXP bonus.

### 111433 / Gcl107 — To Kill a Raven (Limsa Lominsa)

Maelstrom; **gc-core**; `patch_1_23`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111434** ([main SQL](<../../Data/sql/gamedata_quests.sql#L487>)). Native level **45**, category **201**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L458>)).
Native client: **event-methods**, 33 own non-init methods (32 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcl/gcl107.lua#L1>).
Native reward: **6000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L443>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Sea:389, Sea:390, Sea:391, Sea:392, Sea:393, Sea:394, Sea:395, Sea:396, Sea:388` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L458>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L84>)): `月下の闘い（リムサ）` / To Kill a Raven. Enterprise/Nael van Darnus battle route after the shared cross-company history. Reward: 6,000 Storm Seals + 5,340 EXP; 7,000 EXP bonus.
**Unresolved:** SQL level-45 107 depends on level-50 702, whose predecessor is 106; intended retail ordering remains unverified.

### 111434 / Gcl702 — Patrol, Interrupted

Maelstrom; **gc-core**; `patch_1_22c`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111432** ([main SQL](<../../Data/sql/gamedata_quests.sql#L488>)). Native level **50**, category **201**, rank-like column 53 **27** ([native quest row](<../../docs/Dat Mining/quest.csv#L459>)).
Native client: **event-methods**, 6 own non-init methods (6 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcl/gcl702.lua#L1>).
Native reward: **5000 of 1000201** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L444>)). Rank 27->31; medal consumed; coin 10011251 if absent and up to 5000 seals under cap 50000; no EXP grant observed. Archive lists 6600 EXP.
Journal references: `Sea:378, Sea:379, Sea:380, Sea:377` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L459>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L85>)): `「グレートバッファロー」討伐作戦` / Patrol, Interrupted. Level-50 Great Buffalo NM kill, commemorative coin, and city exchange for 25,000 Storm Seals. Reward: 5,000 Storm Seals + 6,600 EXP + coin.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

### 111601 / Com0g1 — Breaking the Seals

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **110014** ([main SQL](<../../Data/sql/gamedata_quests.sql#L489>)). Native level **22**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L460>)).
Native client: **event-methods**, 9 own non-init methods (9 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0g1.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L445>)). Bespoke route: 0 direct seals and 1541 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Fst:273, Fst:274, Fst:327, Fst:275, Fst:276, Fst:328, Fst:272` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L460>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L34>)): Breaking the Seals. Fulke → Ailith at the Black Shroud/Quarrymill route `(42,48)` → Urianger; 30-minute Drake Familiar content; return with Ailith's oath `11000251`. Reward: No direct Serpent Seal row + 1,541 EXP.

### 111602 / Com0g2 — Why Did It Have to Be Snakes

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111601** ([main SQL](<../../Data/sql/gamedata_quests.sql#L490>)). Native level **22**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L461>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0g2.lua#L1>).
Native reward: **250 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L446>)). Bespoke route: 250 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Fst:290` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L461>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L35>)): Why Did It Have to Be Snakes. Fulke report/dialogue step; immediate, non-combat completion. Reward: 250 Serpent Seals + 1,100 EXP.

### 111603 / Com0g3 — Adder's Nest Egg

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111602** ([main SQL](<../../Data/sql/gamedata_quests.sql#L491>)). Native level **22**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L462>)).
Native client: **event-methods**, 1 own non-init methods (1 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0g3.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L447>)). Bespoke route: 0 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Fst:291` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L462>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L36>)): Adder's Nest Egg. Haurtelle report/dialogue step; non-combat and no direct seal payout. The Clay Golem belongs to `111605`, not this row. Reward: No direct Serpent Seal row + 1,100 EXP.

### 111604 / Com0g4 — The Mail Must Get Through

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111603** ([main SQL](<../../Data/sql/gamedata_quests.sql#L492>)). Native level **22**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L463>)).
Native client: **event-methods**, 7 own non-init methods (7 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0g4.lua#L1>).
Native reward: **500 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L448>)). Bespoke route: 500 direct seals and 1541 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Fst:278, Fst:279, Fst:280, Fst:281, Fst:277` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L463>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L37>)): The Mail Must Get Through. Fulke → 30-minute Imperial-soldier protection content near `(24,17)` → encrypted-letter/magitek-design handoff `11000258` to Radulf at Little Ala Mhigo → Fulke. Reward: 500 Serpent Seals + 1,541 EXP.

### 111605 / Com0g5 — Their Finest Hour

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111604** ([main SQL](<../../Data/sql/gamedata_quests.sql#L493>)). Native level **25**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L464>)).
Native client: **event-methods**, 14 own non-init methods (13 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0g5.lua#L1>).
Native reward: **300 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L449>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Fst:352, Fst:353, Fst:354, Fst:355, Fst:351` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L464>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L38>)): Their Finest Hour. Fulke → Mih Khetto/Papalymo ceremony → Rootslake `(47,50)` → Earthbreaker → 30-minute Clay Golem content → Urianger. Reward: 300 Serpent Seals + 1,891 EXP.

### 111606 / Com0g6 — Appetite for Destruction

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111605** ([main SQL](<../../Data/sql/gamedata_quests.sql#L494>)). Native level **25**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L465>)).
Native client: **event-methods**, 19 own non-init methods (19 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0g6.lua#L1>).
Native reward: **300 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L450>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Fst:340, Fst:341, Fst:342, Fst:339` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L465>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L39>)): Appetite for Destruction. Fulke → Bowlord Lewin at Stillglade → clearing west of Nine Ivies → Arthur/Cid attack → Cid at Stillglade. Recovered journals 340–342 and `processEventNq` / `COM0G510` disprove the earlier Toto-Rak assignment. Reward: 300 Serpent Seals + 1,891 EXP.

### 111607 / Com0g7 — Serenity, Purity, Sanctity

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111606** ([main SQL](<../../Data/sql/gamedata_quests.sql#L495>)). Native level **25**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L466>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [InitGrandCompanyEnlistmentQuest](<../../Data/scripts/quests/com/com0g7.lua#L1>).
Native reward: **1000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L451>)). Join company at rank 11; 1000 seals and 1080 EXP through once-only checkpoints.
Journal references: `Fst:357` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L466>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L40>)): Serenity, Purity, Sanctity. Syro formal-assignment dialogue; pledge to the Twin Adder through the officer checkbox, then close the route with the company completion scene. Reward: 1,000 Serpent Seals + 1,080 EXP.

### 111608 / Com0g8 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L496>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L467>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: missing wrapper `Data/scripts/quests/com/com0g8.lua`.
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L452>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L467>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111609 / Com0g9 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L497>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L468>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com0g9.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L453>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L468>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111610 / Com5g0 — Imperial Devices (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer uncommented. SQL level **25**, prerequisite **111603** ([main SQL](<../../Data/sql/gamedata_quests.sql#L498>)). Native level **25**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L469>)).
Native client: **event-methods**, 14 own non-init methods (8 with the processEvent prefix). Runtime: [InitTotorakGrandCompanyQuest](<../../Data/scripts/quests/com/com5g0.lua#L1>).
Native reward: **1000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L454>)). 1000 seals and 2160 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Fst:293, Fst:294, Fst:295, Fst:296, Fst:322, Fst:323, Fst:292` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L469>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L91>)): Twin Adder Toto-Rak Imperial Devices route; the branch uses Broazilan `(39,44)` and the Moogle/object sequence before the Gridania report. Reward: 1,000 Serpent Seals + 2,160 EXP.

### 111611 / Com5g1 — Into the Dark (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_18`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111603** ([main SQL](<../../Data/sql/gamedata_quests.sql#L499>)). Native level **45**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L470>)).
Native client: **event-methods**, 13 own non-init methods (13 with the processEvent prefix). Runtime: [InitDzemaelGrandCompanyQuest](<../../Data/scripts/quests/com/com5g1.lua#L1>).
Native reward: **4000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L455>)). 4000 seals and 6231 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Fst:298, Fst:299, Fst:300, Fst:301, Fst:302, Fst:324, Fst:325, Fst:326, Fst:297` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L470>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L92>)): Twin Adder Dzemael Stronghold route; Aurnest/Juhelmeric briefing and the Imperial soldier/item handoff. Reward: 4,000 Serpent Seals + 6,231 EXP.

### 111612 / Com5g2 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L500>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L471>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5g2.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L456>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L471>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111613 / Com5g3 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L501>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L472>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5g3.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L457>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L472>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111614 / Com5g4 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L502>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L473>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5g4.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L458>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L473>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111615 / Com5g5 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L503>)). Native level **10**, category **202**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L474>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com5g5.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L459>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L474>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111616 / Gcg101 — It Kills with Fire (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **30**, prerequisite **111607** ([main SQL](<../../Data/sql/gamedata_quests.sql#L504>)). Native level **30**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L475>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg101.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **1000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L460>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:363, Fst:364, Fst:365, Fst:366, Fst:367, Fst:368, Fst:369, Fst:375, Fst:362` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L475>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L93>)): Twin Adder Ifrit route described in the shared family ledger. Reward: 1,000 Serpent Seals + 3,040 EXP; 1,500 EXP bonus.

### 111617 / Gcg301 — Eternal Recurrence

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111607** ([main SQL](<../../Data/sql/gamedata_quests.sql#L505>)). Native level **25**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L476>)).
Native client: **event-methods**, 3 own non-init methods (3 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcg/gcg301.lua#L1>).
Native reward: **300 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L461>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Fst:344, Fst:345, Fst:343` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L476>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L94>)): `遥かなる循環` / Eternal Recurrence. Dilstbroda `(7,3)` sends the player to the Black Shroud `(17,16)` for a 30-minute Dreadwolf fight. Reward: 300 Serpent Seals + 1,891 EXP.

### 111618 / Gcg302 — The Pen Is Mightier Than the Spear

Order of the Twin Adder; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111617** ([main SQL](<../../Data/sql/gamedata_quests.sql#L506>)). Native level **25**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L477>)).
Native client: **event-methods**, 5 own non-init methods (5 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcg/gcg302.lua#L1>).
Native reward: **300 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L462>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Fst:347, Fst:348, Fst:374, Fst:346` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L477>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L95>)): `護国にかける決意` / The Pen Is Mightier Than the Spear. Demuldeg `(7,2)` and a `(47,50)` Nut battle lead to Sharini and an art/evidence handoff. Reward: 300 Serpent Seals + 1,891 EXP.

### 111619 / Gcg303 — Woes of the Botanist

Order of the Twin Adder; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111618** ([main SQL](<../../Data/sql/gamedata_quests.sql#L507>)). Native level **40**, category **202**, rank-like column 53 **15** ([native quest row](<../../docs/Dat Mining/quest.csv#L478>)).
Native client: **event-methods**, 6 own non-init methods (6 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg303.lua#L1>).
Native reward: **1000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L463>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:391, Fst:392, Fst:393, Fst:390` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L478>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L96>)): `ひらめきの種` / Woes of the Botanist. Enni `(4,3)` sends the player to the Black Shroud `(31,33)` for a 30-minute Migrating Doo fight, followed by Kuplu Kopo/Enni scenes. Reward: 1,000 Serpent Seals + 4,260 EXP.

### 111620 / Gcg304 — Gone with the Wind

Order of the Twin Adder; **gc-core**; `patch_1_19a`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111619** ([main SQL](<../../Data/sql/gamedata_quests.sql#L508>)). Native level **45**, category **204**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L479>)).
Native client: **event-methods**, 7 own non-init methods (7 with the processEvent prefix). Runtime: [InitGrandCompanyFieldInteractionQuest](<../../Data/scripts/quests/gcg/gcg304.lua#L1>).
Native reward: **700 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L464>)). 700 seals and configured 4450 EXP after three field-object interactions and report.
Journal references: `Fst:336, Fst:337, Fst:338, Fst:335` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L479>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L97>)): `烈風の要塞` / Gone with the Wind. Allaire `(8,5)` sends the player to Natalan `(42,19)` to inspect three stronghold objects. Reward: 700 Serpent Seals + 4,450 EXP.

### 111621 / Gcg501 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L509>)). Native level **10**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L480>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcg/gcg501.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L480>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111622 / Gcg502 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L510>)). Native level **10**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L481>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcg/gcg502.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L481>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111623 / Gcg601 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L511>)). Native level **10**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L482>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcg/gcg601.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L482>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111624 / Gcg602 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L512>)). Native level **10**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L483>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcg/gcg602.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L483>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111625 / Gcg603 — [en]

Order of the Twin Adder; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L513>)). Native level **10**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L484>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcg/gcg603.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L484>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111626 / Gcg305 — A Taste for Death

Order of the Twin Adder; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111620** ([main SQL](<../../Data/sql/gamedata_quests.sql#L514>)). Native level **50**, category **202**, rank-like column 53 **21** ([native quest row](<../../docs/Dat Mining/quest.csv#L485>)).
Native client: **event-methods**, 5 own non-init methods (5 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg305.lua#L1>).
Native reward: **700 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L465>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:395, Fst:396, Fst:394` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L485>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L98>)): `骸を喰らう者` / A Taste for Death. Zuzupojah `(6,5)` sends the player to the Black Shroud `(38,44)` for a 30-minute Ripe Shrieker fight. Reward: 700 Serpent Seals + 6,600 EXP.

### 111627 / Gcg102 — Two Vans are Better than One

Order of the Twin Adder; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111616** ([main SQL](<../../Data/sql/gamedata_quests.sql#L515>)). Native level **40**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L486>)).
Native client: **event-methods**, 27 own non-init methods (27 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg102.lua#L1>).
Native reward: **1000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L466>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:384, Fst:385, Fst:386, Fst:387, Fst:388, Fst:389, Fst:383` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L486>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L99>)): `凶鳥の舞` / Two Vans are Better than One. Fulke → Kankrol instance around `(46,32)` → 30-minute Imperial Equites battle → Frimlroof/Kankrol/Tholl aftermath → Landing scene with Ebrelnaux and Bald. Reward: 1,000 Serpent Seals + 4,971 EXP.

### 111628 / Gcg701 — You Don't Have the Rite

Order of the Twin Adder; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111627** ([main SQL](<../../Data/sql/gamedata_quests.sql#L516>)). Native level **45**, category **202**, rank-like column 53 **17** ([native quest row](<../../docs/Dat Mining/quest.csv#L487>)).
Native client: **event-methods**, 12 own non-init methods (12 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcg/gcg701.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L467>)). Rank 17->21; medal consumed; no EXP grant observed in the completion path.
Journal references: `Fst:377, Fst:378, Fst:379, Fst:380, Fst:381, Fst:376` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L487>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L100>)): `「イクサル軍伐採所」急襲作戦` / You Don't Have the Rite promotion trial. Borsel `(22,13)` starts the merit scoring against Ixali Rim Cutter, Soil Seer, and Cloud Walker. Reward: 6,231 EXP; 1,000 merit; 2,500-seal badge cost.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

### 111629 / Gcg103 — Shadow of the Raven

Order of the Twin Adder; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111628** ([main SQL](<../../Data/sql/gamedata_quests.sql#L517>)). Native level **45**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L488>)).
Native client: **event-methods**, 7 own non-init methods (7 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg103.lua#L1>).
Native reward: **1500 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L468>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:472, Fst:473, Fst:474, Fst:471` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L488>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L101>)): `心をひとつに` / Shadow of the Raven. Conjurer-guild scene `(2,1)` with Kan-E leads to a 30-minute Magitek Vanguard battle at `(17,35)`. Reward: 1,500 Serpent Seals + 5,340 EXP.

### 111630 / Gcg104 — In for Garuda Wakening (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111629** ([main SQL](<../../Data/sql/gamedata_quests.sql#L518>)). Native level **45**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L489>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg104.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **2000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L469>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:476, Fst:477, Fst:478, Fst:479, Fst:480, Fst:481, Fst:482, Fst:475` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L489>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L102>)): Twin Adder Garuda route from the shared family ledger. Reward: 2,000 Serpent Seals + 6,231 EXP; 2,500 EXP bonus.

### 111631 / Gcg105 — Don't Hate the Messenger (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111630** ([main SQL](<../../Data/sql/gamedata_quests.sql#L519>)). Native level **45**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L490>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg105.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **2000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L470>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:489, Fst:490, Fst:491, Fst:492, Fst:493, Fst:494, Fst:495, Fst:496, Fst:497, Fst:498, Fst:499, Fst:500, Fst:501, Fst:502, Fst:503, Fst:488` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L490>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L103>)): Gridania crossroads / messenger route: cross-city letters, Mor Dhona scene, VII Legion objective, and report. Reward: 2,000 Serpent Seals + 6,231 EXP.

### 111632 / Gcg106 — United We Stand (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111631** ([main SQL](<../../Data/sql/gamedata_quests.sql#L520>)). Native level **45**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L491>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg106.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **5000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L471>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:484, Fst:485, Fst:486, Fst:487, Fst:483` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L491>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L104>)): Gridania victory march / Castrum Novum Transmission Tower route. Reward: 5,000 Serpent Seals + 6,231 EXP; 6,000 EXP bonus.

### 111633 / Gcg107 — To Kill a Raven (Gridania)

Order of the Twin Adder; **gc-core**; `patch_1_23`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111634** ([main SQL](<../../Data/sql/gamedata_quests.sql#L521>)). Native level **45**, category **202**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L492>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcg/gcg107.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **6000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L472>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Fst:551, Fst:552, Fst:553, Fst:554, Fst:555, Fst:556, Fst:557, Fst:558, Fst:550` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L492>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L105>)): Twin Adder Nael van Darnus / Moonlit Battle route. Reward: 6,000 Serpent Seals + 5,340 EXP; 7,000 EXP bonus.
**Unresolved:** SQL level-45 107 depends on level-50 702, whose predecessor is 106; intended retail ordering remains unverified.

### 111634 / Gcg702 — Cure for the Common Pox

Order of the Twin Adder; **gc-core**; `patch_1_22c`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111632** ([main SQL](<../../Data/sql/gamedata_quests.sql#L522>)). Native level **50**, category **202**, rank-like column 53 **27** ([native quest row](<../../docs/Dat Mining/quest.csv#L493>)).
Native client: **event-methods**, 6 own non-init methods (6 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcg/gcg702.lua#L1>).
Native reward: **5000 of 1000202** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L473>)). Rank 27->31; medal consumed; coin 10011251 if absent and up to 5000 seals under cap 50000; no EXP grant observed. Archive lists 6600 EXP.
Journal references: `Fst:519, Fst:520, Fst:521, Fst:518` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L493>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L106>)): Cure for the Common Pox final NM record. The Elemen record names Big-hearted Hot Pox, plus the commemorative-coin exchange. Reward: 5,000 Serpent Seals + 6,600 EXP + coin.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

### 111801 / Com0u1 — Career Opportunities

Immortal Flames; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **110014** ([main SQL](<../../Data/sql/gamedata_quests.sql#L523>)). Native level **22**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L494>)).
Native client: **event-methods**, 9 own non-init methods (9 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0u1.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L474>)). Bespoke route: 0 direct seals and 1760 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Wil:338, Wil:339, Wil:395, Wil:340, Wil:341, Wil:396, Wil:337` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L494>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L41>)): Career Opportunities. Aubrey → Taylor at the Camp Horizon/ferry-dock route in Western Thanalan `(9,31)` → Urianger; 30-minute Anole Familiar content; return with Taylor's letter `11000252`. Reward: No direct Flame Seal row + 1,760 EXP.

### 111802 / Com0u2 — Kindling a Flame

Immortal Flames; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111801** ([main SQL](<../../Data/sql/gamedata_quests.sql#L524>)). Native level **22**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L495>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0u2.lua#L1>).
Native reward: **250 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L475>)). Bespoke route: 250 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Wil:342` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L495>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L42>)): Kindling a Flame. Aubrey report/dialogue step; immediate, non-combat completion. Reward: 250 Flame Seals + 1,100 EXP.

### 111803 / Com0u3 — Burning a Hole in One's Pocket

Immortal Flames; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111802** ([main SQL](<../../Data/sql/gamedata_quests.sql#L525>)). Native level **22**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L496>)).
Native client: **event-methods**, 1 own non-init methods (1 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0u3.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L476>)). Bespoke route: 0 direct seals and 1100 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Wil:343` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L496>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L43>)): Burning a Hole in One's Pocket. Rahz report/dialogue step; non-combat and no direct seal payout. Reward: No direct Flame Seal row + 1,100 EXP.

### 111804 / Com0u4 — Arms Race

Immortal Flames; **gc-core**; `patch_1_18`; offer uncommented. SQL level **22**, prerequisite **111803** ([main SQL](<../../Data/sql/gamedata_quests.sql#L526>)). Native level **22**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L497>)).
Native client: **event-methods**, 11 own non-init methods (11 with the processEvent prefix). Runtime: [bespoke-opening](<../../Data/scripts/quests/com/com0u4.lua#L1>).
Native reward: **500 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L477>)). Bespoke route: 500 direct seals and 1760 EXP; inspect referenced checkpoint/route evidence for completion conditions.
Journal references: `Wil:345, Wil:346, Wil:347, Wil:348, Wil:344` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L497>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L44>)): Arms Race. Aubrey → 30-minute Hellhound troop content near the Golden Bazaar → Aubrey → C'ndanya, Raaka Maaka, and Bamponcet contracts; the server pair is actor `2109801` / mob type `1361`, and the three evidence items are `11000256`, `11000255`, and `11000253`. Reward: 500 Flame Seals + 1,760 EXP.

### 111805 / Com0u5 — Burning Man

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111804** ([main SQL](<../../Data/sql/gamedata_quests.sql#L527>)). Native level **25**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L498>)).
Native client: **event-methods**, 23 own non-init methods (23 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0u5.lua#L1>).
Native reward: **300 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L478>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Wil:425, Wil:426, Wil:427, Wil:428, Wil:429, Wil:424` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L498>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L45>)): Burning Man. Aubrey → 30-minute pirate content west of Camp Horizon → Thancred/Urianger → Raubahn ceremony → Thancred; the post-fight evidence includes the Shattered Gauntlet `11000261` and Magitek Cooling Plate `11000262`. Reward: 300 Flame Seals + 1,891 EXP.

### 111806 / Com0u6 — Know Your Enemy

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111805** ([main SQL](<../../Data/sql/gamedata_quests.sql#L528>)). Native level **25**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L499>)).
Native client: **event-methods**, 22 own non-init methods (22 with the processEvent prefix). Runtime: [InitGrandCompanyCampaignQuest](<../../Data/scripts/quests/com/com0u6.lua#L1>).
Native reward: **300 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L479>)). 300 seals and 1891 EXP after route evidence; requires route readiness and successful completion (not guaranteed by wrapper existence).
Journal references: `Wil:416, Wil:417, Wil:418, Wil:415` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L499>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L46>)): Know Your Enemy. Aubrey → Cid/Ironworks → Charledore pursuit → hostile confrontation → Cid → Aubrey. Client actor `2289025` remains blank/property-zero, so the server encounter and completion path are intentionally unresolved. Reward: 300 raw Flame Seals in client evidence; not granted while the actor is blocked.

### 111807 / Com0u7 — By Fire Reborn

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111806** ([main SQL](<../../Data/sql/gamedata_quests.sql#L529>)). Native level **25**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L500>)).
Native client: **event-methods**, 2 own non-init methods (2 with the processEvent prefix). Runtime: [InitGrandCompanyEnlistmentQuest](<../../Data/scripts/quests/com/com0u7.lua#L1>).
Native reward: **1000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L480>)). Join company at rank 11; 1000 seals and 1080 EXP through once-only checkpoints.
Journal references: `Wil:430` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L500>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L47>)): By Fire Reborn. Aubrey formal-assignment dialogue; pledge to the Immortal Flames through the officer checkbox, then close the route with the company completion scene. Reward: 1,000 Flame Seals + 1,080 EXP.

### 111808 / Com0u8 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L530>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L501>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com0u8.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L481>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L501>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111809 / Com0u9 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L531>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L502>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/com/com0u9.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L482>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L502>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111810 / Com5u0 — Imperial Devices (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_18`; offer uncommented. SQL level **25**, prerequisite **111803** ([main SQL](<../../Data/sql/gamedata_quests.sql#L532>)). Native level **25**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L503>)).
Native client: **event-methods**, 13 own non-init methods (12 with the processEvent prefix). Runtime: [InitTotorakGrandCompanyQuest](<../../Data/scripts/quests/com/com5u0.lua#L1>).
Native reward: **1000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L483>)). 1000 seals and 2160 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Wil:350, Wil:351, Wil:352, Wil:353, Wil:354, Wil:389, Wil:390, Wil:391, Wil:349` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L503>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L112>)): Immortal Flames Toto-Rak Imperial Devices route; Nuala/Bloisirant briefing, Moogle/object checks, and gauntlet/cooling-plate evidence. Reward: 1,000 Flame Seals + 2,160 EXP.

### 111811 / Com5u1 — Into the Dark (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_18`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111803** ([main SQL](<../../Data/sql/gamedata_quests.sql#L533>)). Native level **45**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L504>)).
Native client: **event-methods**, 8 own non-init methods (8 with the processEvent prefix). Runtime: [InitDzemaelGrandCompanyQuest](<../../Data/scripts/quests/com/com5u1.lua#L1>).
Native reward: **4000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L484>)). 4000 seals and 6231 EXP after dungeon evidence, via once-only checkpoints.
Journal references: `Wil:357, Wil:358, Wil:359, Wil:360, Wil:361, Wil:392, Wil:393, Wil:394, Wil:356` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L504>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L113>)): Immortal Flames Dzemael Stronghold route; Volmont and the Coerthas/Dzemael Imperial soldier handoff. Reward: 4,000 Flame Seals + 6,231 EXP.

### 111812 / Com5u2 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L534>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L505>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: missing wrapper `Data/scripts/quests/com/com5u2.lua`.
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L485>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L505>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111813 / Com5u3 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L535>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L506>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: missing wrapper `Data/scripts/quests/com/com5u3.lua`.
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L486>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L506>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111814 / Com5u4 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L536>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L507>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: missing wrapper `Data/scripts/quests/com/com5u4.lua`.
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L487>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L507>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111815 / Com5u5 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L537>)). Native level **10**, category **203**, rank-like column 53 **0** ([native quest row](<../../docs/Dat Mining/quest.csv#L508>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: missing wrapper `Data/scripts/quests/com/com5u5.lua`.
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L488>)). No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L508>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111816 / Gcu101 — It Kills with Fire (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **30**, prerequisite **111807** ([main SQL](<../../Data/sql/gamedata_quests.sql#L538>)). Native level **30**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L509>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu101.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **1000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L489>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:438, Wil:439, Wil:440, Wil:441, Wil:442, Wil:443, Wil:444, Wil:445, Wil:437` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L509>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L114>)): Immortal Flames Ifrit route described in the shared family ledger. Reward: 1,000 Flame Seals + 3,040 EXP; 1,500 EXP bonus.

### 111817 / Gcu301 — Prying Eyes

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111807** ([main SQL](<../../Data/sql/gamedata_quests.sql#L539>)). Native level **25**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L510>)).
Native client: **event-methods**, 3 own non-init methods (3 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcu/gcu301.lua#L1>).
Native reward: **300 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L490>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Wil:398, Wil:399, Wil:397` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L510>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L115>)): `エシュテムの新製品` / Prying Eyes. Refchild `(6,6)` sends the player to Thanalan `(15,29)` for a 30-minute Red Coblyn fight; the enraged level-26 Red Coblyn yields the Prism Eye. Reward: 300 Flame Seals + 1,891 EXP.

### 111818 / Gcu302 — Different Strokes

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **25**, prerequisite **111817** ([main SQL](<../../Data/sql/gamedata_quests.sql#L540>)). Native level **25**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L511>)).
Native client: **event-methods**, 9 own non-init methods (9 with the processEvent prefix). Runtime: [InitGrandCompanySidequest](<../../Data/scripts/quests/gcu/gcu302.lua#L1>).
Native reward: **300 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L491>)). 300 seals and 1891 EXP after earned evidence/route conditions via once-only checkpoints.
Journal references: `Wil:401, Wil:402, Wil:403, Wil:408, Wil:400` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L511>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L116>)): `確執の果て` / Different Strokes. Galeren `(5,5)` and Adalbert Cotter `(7,4)` lead to Thanalan `(45,21)` for a 30-minute Hungry Dreadwolf fight and Lennard aftermath. Reward: 300 Flame Seals + 1,891 EXP.

### 111819 / Gcu303 — A Weaver and a Mummer

Immortal Flames; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111818** ([main SQL](<../../Data/sql/gamedata_quests.sql#L541>)). Native level **40**, category **203**, rank-like column 53 **15** ([native quest row](<../../docs/Dat Mining/quest.csv#L512>)).
Native client: **event-methods**, 6 own non-init methods (6 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu303.lua#L1>).
Native reward: **1000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L492>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:461, Wil:462, Wil:460` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L512>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L117>)): `すべては隊士様のために` / A Weaver and a Mummer. Kahelno `(7,5)` sends the player to Thanalan `(19,33)` for a 30-minute Imperial Centurion fight. Reward: 1,000 Flame Seals + 4,260 EXP.

### 111820 / Gcu304 — When Alchemists Cry

Immortal Flames; **gc-core**; `patch_1_19`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111819** ([main SQL](<../../Data/sql/gamedata_quests.sql#L542>)). Native level **45**, category **204**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L513>)).
Native client: **event-methods**, 8 own non-init methods (8 with the processEvent prefix). Runtime: [InitGrandCompanyFieldInteractionQuest](<../../Data/scripts/quests/gcu/gcu304.lua#L1>).
Native reward: **700 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L493>)). 700 seals and configured 4450 EXP after three field-object interactions and report.
Journal references: `Wil:405, Wil:406, Wil:407, Wil:404` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L513>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L118>)): `灼熱の聖域` / When Alchemists Cry. Berthal `(5,6)` sends the player to Zahar'ak `(47–48,40–41)` to inspect three stronghold objects. Reward: 700 Flame Seals + 4,450 EXP.

### 111821 / Gcu501 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L543>)). Native level **10**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L514>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcu/gcu501.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L514>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111822 / Gcu502 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L544>)). Native level **10**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L515>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcu/gcu502.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L515>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111823 / Gcu601 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L545>)). Native level **10**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L516>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcu/gcu601.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L516>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111824 / Gcu602 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L546>)). Native level **10**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L517>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcu/gcu602.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L517>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111825 / Gcu603 — [en]

Immortal Flames; **gc-core**; `patch_unknown_or_internal`; offer not enabled in core allowlist. SQL level **0**, prerequisite **0** ([main SQL](<../../Data/sql/gamedata_quests.sql#L547>)). Native level **10**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L518>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitQuestScaffold](<../../Data/scripts/quests/gcu/gcu603.lua#L1>).
Native reward: **sheet row absent**. No ordinary quest reward path established (missing wrapper or noOffer system/internal scaffold).
Journal references: `none` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L518>)).
**Internal row:** no named retail objective is established. Preserve the native template metadata, missing/stub distinctions, and disabled state; synthetic scaffold titles do not become recovered quest names.

### 111826 / Gcu305 — Challenge Accepted

Immortal Flames; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111820** ([main SQL](<../../Data/sql/gamedata_quests.sql#L548>)). Native level **50**, category **203**, rank-like column 53 **21** ([native quest row](<../../docs/Dat Mining/quest.csv#L519>)).
Native client: **event-methods**, 3 own non-init methods (3 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu305.lua#L1>).
Native reward: **700 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L494>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:464, Wil:465, Wil:463` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L519>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L119>)): `裏の裏` / Challenge Accepted. I Pagglo `(5,4)` sends the player to Thanalan `(39,30)` for a 30-minute Rotting Servant fight and Jaqis aftermath. Reward: 700 Flame Seals + 6,600 EXP.

### 111827 / Gcu102 — Like Father, Like Son

Immortal Flames; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **40**, prerequisite **111816** ([main SQL](<../../Data/sql/gamedata_quests.sql#L549>)). Native level **40**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L520>)).
Native client: **event-methods**, 24 own non-init methods (24 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu102.lua#L1>).
Native reward: **1000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L495>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:448, Wil:449, Wil:450, Wil:451, Wil:452, Wil:447` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L520>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L120>)): `ふたりの機工師` / Like Father, Like Son. Aubrey → Jaqis scene `(27,25)` → item → 30-minute Imperial Hoplomachus battle `(24,23)` → Imperial Centurion scene → Wellhead/Cid return. Reward: 1,000 Flame Seals + 4,971 EXP.

### 111828 / Gcu701 — Gore a Lizard, Hurry

Immortal Flames; **gc-core**; `patch_1_20`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111827** ([main SQL](<../../Data/sql/gamedata_quests.sql#L550>)). Native level **45**, category **203**, rank-like column 53 **17** ([native quest row](<../../docs/Dat Mining/quest.csv#L521>)).
Native client: **event-methods**, 12 own non-init methods (12 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcu/gcu701.lua#L1>).
Native reward: **no direct seal slot** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L496>)). Rank 17->21; medal consumed; no EXP grant observed in the completion path.
Journal references: `Wil:454, Wil:455, Wil:456, Wil:457, Wil:458, Wil:453` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L521>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L121>)): `「アマルジャ軍祭場」補給断絶作戦` / Gore a Lizard, Hurry promotion trial. Rudold `(40,32)`/Aleine start the merit scoring against Amalj'aa Pennoncier, Captain, and High Divinator. Reward: 6,231 EXP; 1,000 merit; 2,500-seal badge cost.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

### 111829 / Gcu103 — Careless Whispers

Immortal Flames; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111828** ([main SQL](<../../Data/sql/gamedata_quests.sql#L551>)). Native level **45**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L522>)).
Native client: **event-methods**, 11 own non-init methods (11 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu103.lua#L1>).
Native reward: **1500 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L497>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:567, Wil:568, Wil:569, Wil:570, Wil:566` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L522>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L122>)): `決断の狼煙` / Careless Whispers. Aubrey → Royal Promenade `(6,5)` Raubahn scene → 30-minute Magitek Vanguard battle at `(7,27)` → fallen-sergeant/ferry-dog aftermath around `(5,26)`. Reward: 1,500 Flame Seals + 5,340 EXP.

### 111830 / Gcu104 — In for Garuda Wakening (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_22`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111829** ([main SQL](<../../Data/sql/gamedata_quests.sql#L552>)). Native level **45**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L523>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu104.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **2000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L498>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:559, Wil:560, Wil:561, Wil:562, Wil:563, Wil:564, Wil:565, Wil:558` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L523>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L123>)): Immortal Flames Garuda route from the shared family ledger. Reward: 2,000 Flame Seals + 6,231 EXP; 2,500 EXP bonus.

### 111831 / Gcu105 — Don't Hate the Messenger (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111830** ([main SQL](<../../Data/sql/gamedata_quests.sql#L553>)). Native level **45**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L524>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu105.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **2000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L499>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:577, Wil:578, Wil:579, Wil:580, Wil:581, Wil:582, Wil:583, Wil:584, Wil:585, Wil:586, Wil:587, Wil:588, Wil:589, Wil:590, Wil:591, Wil:576` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L524>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L124>)): Ul'dah crossroads / messenger route: cross-city letters, Mor Dhona scene, VII Legion objective, and report. Reward: 2,000 Flame Seals + 6,231 EXP.

### 111832 / Gcu106 — United We Stand (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_22b`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111831** ([main SQL](<../../Data/sql/gamedata_quests.sql#L554>)). Native level **45**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L525>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu106.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **5000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L500>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:572, Wil:573, Wil:574, Wil:575, Wil:571` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L525>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L125>)): Ul'dah victory march / Castrum Novum Transmission Tower route. Reward: 5,000 Flame Seals + 6,231 EXP; 6,000 EXP bonus.

### 111833 / Gcu107 — To Kill a Raven (Ul'dah)

Immortal Flames; **gc-core**; `patch_1_23`; offer not enabled in core allowlist. SQL level **45**, prerequisite **111834** ([main SQL](<../../Data/sql/gamedata_quests.sql#L555>)). Native level **45**, category **203**, rank-like column 53 **11** ([native quest row](<../../docs/Dat Mining/quest.csv#L526>)).
Native client: **init-only**, 0 own non-init methods (0 with the processEvent prefix). Runtime: [InitGrandCompanyQuest](<../../Data/scripts/quests/gcu/gcu107.lua#L1>). Named journal/reward row has no own processEvent methods. A shared family implementation is not a proven server alias.
Native reward: **6000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L501>)). Generic audit gate is true; inventory seal values are not reachable completed-route rewards. No source-backed EXP/gil in this scaffold.
Journal references: `Wil:606, Wil:607, Wil:608, Wil:609, Wil:610, Wil:611, Wil:612, Wil:613, Wil:605` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L526>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L126>)): Immortal Flames Nael van Darnus / Moonlit Battle route. Reward: 6,000 Flame Seals + 5,340 EXP; 7,000 EXP bonus.
**Unresolved:** SQL level-45 107 depends on level-50 702, whose predecessor is 106; intended retail ordering remains unverified.

### 111834 / Gcu702 — Mess with the Goat, Get the Horns

Immortal Flames; **gc-core**; `patch_1_22c`; offer not enabled in core allowlist. SQL level **50**, prerequisite **111832** ([main SQL](<../../Data/sql/gamedata_quests.sql#L556>)). Native level **50**, category **203**, rank-like column 53 **27** ([native quest row](<../../docs/Dat Mining/quest.csv#L527>)).
Native client: **event-methods**, 6 own non-init methods (6 with the processEvent prefix). Runtime: [InitGrandCompanyRankQuest](<../../Data/scripts/quests/gcu/gcu702.lua#L1>).
Native reward: **5000 of 1000203** ([reward row](<../../docs/Dat Mining/quest_new_reward.csv#L502>)). Rank 27->31; medal consumed; coin 10011251 if absent and up to 5000 seals under cap 50000; no EXP grant observed. Archive lists 6600 EXP.
Journal references: `Wil:593, Wil:594, Wil:595, Wil:592` ([native expressions](<../../docs/Dat Mining/xtx_quest.csv#L527>)).
Archive transcription ([ledger](<../../docs/grand_company_quests_elemen_ledger_2026-08-22.md#L127>)): Immortal Flames final NM record; Elemen names Elder Mosshorn and the commemorative-coin exchange. Reward: 5,000 Flame Seals + 6,600 EXP + coin.
**Runtime difference:** offer builder bypasses SQL prerequisite bit for six rank quests, while retaining allowlist/level/company/exact rank/medal.

## Boundaries and unresolved work

GC leves, shop, warp, supply, officer, and other service helpers are related systems, not additional named GC quest rows. Noc001 is included because it is a concrete SQL/native quest identity used as the supply-menu owner. Prefix-matching native scenario files outside the 102 identities: `` (empty means none).

No native prerequisite graph is claimed; no archive reward is silently substituted for server behavior; no stub is counted as an implemented playable quest. Client UI execution, normal-party acceptance, server encounter behavior, and exact native EXP formula evaluation remain distinct validation work.
