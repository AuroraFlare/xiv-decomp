# Quest Decomp Unknowns: Fight and Job Pass - 2026-06-30

This is a focused handoff for quest data that is still unknown, stubbed, or only scaffolded, with emphasis on fight quests, job quests, and class quest battle/data gaps. It consolidates a local source pass plus four read-only helper passes.

## Evidence Map

Primary checked-in surfaces:

- `Data/scripts/quests`: 319 local quest Lua files, including templates and scaffolds.
- `Data/scripts/directors/Quest`: 7 local quest director scripts.
- `Data/scripts/content`: 9 local content scripts.
- `Data/sql/gamedata_quests.sql`: quest id, name, class code, prerequisite, and minimum level.
- `Data/sql/gamedata_quest_rewards.sql`: generated reward rows.
- `Data/sql/server_battlenpc_mob_types.sql` and `Data/sql/server_battlenpc_spawn_locations.sql`: BNPC actor/spawn coverage.

Primary recovered/decomp surfaces:

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario`: 620 recovered quest scenario files.
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest`: 177 recovered quest director files.
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/simplequestbattle`: recovered `SimpleQuestBattle` base plus 60 child directors.
- `tools/outputs/lpb/content_systems_20260612/lua`: content/cutscene/widget cross-checks.

Primary generated ledgers:

- `tools/outputs/lpb/quest_scenario_parity_contract_20260619/quest_code_parity.csv`
- `tools/outputs/lpb/quest_scenario_parity_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/simple_quest_battle_director_contract_20260619/simplequestbattle_director_inventory.csv`
- `outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_summary.csv`
- `docs/quest_exp_gaps.csv`
- `docs/quest_reward_gaps.csv`

## Current Coverage Snapshot

Quest scenario parity, from `quest_code_parity.csv`:

| Status | Count | Meaning |
| --- | ---: | --- |
| `missing_local_script_gamedata_present` | 209 | SQL row exists, recovered scenario exists, no checked-in local quest script. |
| `present_as_scaffold_or_template` | 158 | Local script exists but routes through generic/class/job/GC scaffolding. |
| `present_as_handwritten_script` | 153 | Local script has handwritten flow. |
| `missing_local_script_no_gamedata` | 100 | Recovered scenario exists, but no local SQL row. |
| `local_only_script` | 2 | Local script has no recovered scenario match in the ledger. |

SimpleQuestBattle parity:

- Recovered child directors: 60.
- Recovered base: `SimpleQuestBattleBaseClass`.
- Local SimpleQuestBattle base/children: 0.
- Categories: 26 Grand Company, 16 side/special, 12 job, 1 class, 5 test/unknown.
- 55 child directors map to local quest scripts that currently bypass the recovered SimpleQuestBattle layer.
- Explicit client quest id overrides to preserve: `com0l6 -> 111406`, `com0u5 -> 111805`, `etc3g2 -> 110736`.

Current config gates in `Data/map_config.ini`:

- Enabled: `side_quests_enabled=true`.
- Disabled: `grand_company_quests_enabled=false`, `class_quests_enabled=false`, `job_quests_enabled=false`, `special_quests_enabled=false`, `seasonal_quests_enabled=false`, `primal_quests_enabled=false`.

## Highest-Value Unknowns

### 1. SimpleQuestBattle Bridge

This is the biggest fight quest gap. Recovered children exist, but local quest scripts mostly either complete through scaffolds or use bespoke `Man*` content/director scripts.

Recovered base:

- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/simplequestbattle/simplequestbattlebaseclass.lua`
- It exposes `eventContentGiveUp`, `getOwnClientQuestId`, and `getOwnClientQuestIdAsSimple`.
- `eventContentGiveUp` asks row `25230` with mode `2` and the owning client quest id.

Missing local pieces:

- No local `Data/scripts/directors/Quest/SimpleQuestBattle` adapter.
- No local child director shims for the 60 recovered children.
- No central give-up/cancel flow for simple quest battles.
- Local content maps are much fewer than recovered battle directors.

Best smoke anchor before broad migration:

- `Man0u0` / quest `110009` / `Flowers for All`
- Local files:
  - `Data/scripts/quests/man/man0u0.lua`
  - `Data/scripts/directors/Quest/QuestDirectorMan0u001.lua`
  - `Data/scripts/content/SimpleContent30079.lua`
- Why it is good: already creates `PrivateAreaMasterSimpleContent`, spawns one Goobbue enemy `2203301`, handles `onKillBNpc`, calls `ContentFinished`, returns the player, and advances quest sequence.

Do not start by broad-enabling all SQB children. First prove one GM-only adapter path can survive:

1. content create
2. director ownership
3. `HandleBNpcKill`
4. completion
5. return warp
6. cleanup
7. give-up/cancel

### 2. Known Fake Fight: `Man2g0`

`Man2g0` / quest `110008` / `Beckon of the Elementals` is the clearest WIP fight in checked-in code.

Local files:

- `Data/scripts/quests/man/man2g0.lua`
- `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua`
- `Data/scripts/content/SimpleContentMan2g01.lua`

Evidence:

- `man2g0.lua` labels `SEQ_004` as an "Instanced Fight with Elemental".
- `QuestDirectorMan2g001.lua` sends "Combat Sequence Still Work in Progress".
- The same director says the quest phase will automatically progress in 10 seconds.
- It calls `processEvent010`, starts sequence `5`, finishes content, then zones the player back to zone `206`.
- `SimpleContentMan2g01.lua` spawns the "Spirit of the Wood" as a generic actor `1000608`, not as a battle enemy.

This should be treated as a real future fight implementation target, not a SimpleQuestBattle parity target.

### 3. Job Quest Fight Parity

Local job scripts exist for all seven jobs from `0j1` through `0j6`, but every one is just:

```lua
require ("quests/job_quest_template")
InitJobQuest("<Code>")
```

`Data/scripts/quests/job_quest_template.lua` enforces job/class/level/prereq gates and grants known rewards/actions, but it does not implement retail objective sequences, NMs, duties, cutscenes, or battle phases.

Recovered job scenarios exist for `0j1` through `0j6`, plus tiny recovered `initText` tails for `0j7`, `0j8`, `0j9`, and `1j0`. The useful work is in the existing `0j1` to `0j6` recovered bodies, especially job finales and SQB-linked battle quests.

SimpleQuestBattle-linked job quests:

| Quest | Code | Name | Reward action | Recovered director |
| ---: | --- | --- | --- | --- |
| 111261 | `blm0j1` | Hearing Voices | `27305 convert` | `questdirectorblm0j101` |
| 111301 | `brd0j1` | A Song of Bards and Bowmen | `27237 ballad_of_magi` | `questdirectorbrd0j101` |
| 111304 | `brd0j4` | Doing It the Bard Way | `27232 rain_of_death` | `questdirectorbrd0j401` |
| 111321 | `drg0j1` | Eye of the Dragon | `27266 jump` | `questdirectordrg0j101` |
| 111326 | `drg0j6` | Into the Dragon's Maw | `27268 dragonfire_dive` | `questdirectordrg0j601` |
| 111221 | `mnk0j1` | Brother from Another Mother | `27108 shoulder_tackle` | `questdirectormnk0j101` |
| 111281 | `pld0j1` | Paladin's Pledge | `27146 cover` | `questdirectorpld0j101` |
| 111285 | `pld0j5` | Parley on High Ground | `27159 spirits_within` | `questdirectorpld0j501` |
| 111201 | `war0j1` | Pride and Duty (Will Take You from the Mountain) | `27186 vengeance` | `questdirectorwar0j101` |
| 111203 | `war0j3` | Curious Gorge Goes to the Bazaar | `27188 collusion` | `questdirectorwar0j301` |
| 111241 | `whm0j1` | Seeds of Initiative | `27344 presence_of_mind` | `questdirectorwhm0j101` |
| 111244 | `whm0j4` | The Wheel of Disaster | `27359 holy` | `questdirectorwhm0j401` |

Recovered normal job `0j6` directors also exist for `blm`, `brd`, `mnk`, `pld`, `war`, and `whm`. `drg0j6` is in the SimpleQuestBattle set. These should stay no-mutation until job action/item grants, AF rewards, clear conditions, and completion are separately disabled or proven.

### 4. Class Quest Battle/Data Parity

Combat class quest local coverage is mixed:

- `Pgl200` / quest `110060` / `The House Always Wins` is the standout handwritten combat class quest.
- Most other combat class quests are class-template completion scaffolds.
- Dense `300/306` class quests have recovered scene/dialogue bodies but local scripts call only `InitClassQuest`.
- Level `400/500/506` tails are mostly missing local loaders, with `Cul400` noted elsewhere as locally handled conservatively/no-offer despite stale generated CSV wording.

High-value dense class candidates:

| Code | Quest | Name | Current local status |
| --- | ---: | --- | --- |
| `pgl200` | 110060 | The House Always Wins | handwritten |
| `pgl300` | 110061 | Here There Be Pirates | class template |
| `pgl306` | 110062 | Two Sides to Every Chip | class template |
| `gla300` | 110081 | Unalienable Rights | class template |
| `gla306` | 110082 | Thrill of the Fight | class template |
| `lnc300` | 110181 | Culture Shock | class template |
| `cnj306` | 110262 | The Call of Nature | class template |
| `bsm300` | 110321 | Song of the Sirens | class template |
| `bsm306` | 110322 | The Sound of Silence | class template |
| `wdk300` | 110301 | Hide and Seek Shenanigans | class template |
| `wdk306` | 110302 | Spanning the Spectrum | class template |
| `cul306` | 110442 | Something in the Soup | class template |
| `min300` | 110461 | Little Saboteurs | class template |
| `fsh300` | 110501 | The Beast of the Barrel | class template |
| `exc306` | 110102 | Captain's Orders | class template |
| `tan306` | 110382 | Head of the Class | class template |
| `wvr306` | 110402 | A Fruitful Murder | class template plus SQB child |

Missing or loader-light class tails worth documenting but not enabling blindly:

- `bsm400` / `110323`
- `exc400` / `110103`
- `fsh400` / `110503`
- `pgl400`, `gla400`, `thm400`
- `arc400/500/506`
- `cnj400/500/506`
- `exc500/506`
- `lnc400/500/506`

## BNPC and Objective Data Gaps

`outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_summary.csv` found:

- Quest BNPC objective rows: 41.
- Rows with ambient server spawn coordinates: 8.
- Rows with no matching mob type: 33.
- Unique no-mob-type quest codes: 29.

Good ambient anchors:

- `Etc1g4` / The Penultimate Prank / `BNPC_AURORA_ANGLER` / actor `2104508`
- `Etc1u1` / Sleepless in Eorzea / `BNPC_NUTGRABBER_MARMOT` / actor `2104021`
- `Etc1u5` / An Inconvenient Dodo / `BNPC_STUFFED_DODO` / actor `2102009`
- `Etc1u6` / Besmitten and Besmirched / `BNPC_MOILING_MOLE` / actor `2105717`
- `Etc2l0` / Fishing for Answers / `BNPC_GIANT_CRAB` / actor `2107601`
- `Etc2u2` / Ore for an Ore / `BNPC_IRON_COBLYN` / actor `2102105`
- `Wld0g1` / In the Name of Science / `BNPC_SABLETOOTH_SPRIGGAN` / actor `2106214`
- `Wld0g4` / Spores on the Brain / `BNPC_MATURE_FUNGUAR` / actor `2105916`

High-value no-mob-type rows:

| Quest | Code | Actor(s) | Why it matters |
| --- | --- | --- | --- |
| Breaking the Seals | `Com0g1` | `2202206` | SQB candidate and GC field fight. |
| The Price of Integrity | `Com0l1` | `2200708` | SQB candidate and GC field fight. |
| Career Opportunities | `Com0u1` | `2200205` | SQB candidate and GC field fight. |
| Arms Race | `Com0u4` | `2109801` | SQB candidate. |
| Know Your Enemy | `Com0u6` | `2289025` | SQB candidate, actor class path missing in summary. |
| Revenge on the Reavers | `Etc1l3` | `2180301`, `2180302`, `2180303` | Multi-actor objective. |
| The Customer Comes First | `Etc1u4` | `2180210`, `2180211`, `2180212` | Multi-actor objective. |
| Freedom Isn't Free | `Etc2u1` | `2106541` | Amalj'aa kill/drop objective. |
| Sanguine Studies | `Wld0u2` | `2106537` | Amalj'aa kill/drop objective. |
| Rustproof | `Wld0u4` | `2106542` | Amalj'aa kill/drop objective. |

Do not treat missing mob type as proof that a quest needs private content. Some rows are likely open-world hunt/drop objectives that need actor/mob-type mapping; others are genuine quest-specific or faction NPCs that may need private/director spawning.

## Primal, Raid, GC Duty, and Special Rows

These are battle/content candidates but should stay disabled or log-only until instance lifecycle ownership is proven.

Primal/Rivenroad scaffolds:

- `Sum6a0` / `110627` / Ifrit Bleeds, We Can Kill It
- `Sum6m0` / `110816` / A Feast of Fools
- `Sum6g0` / `110867` / Taming the Tempest
- `Sum6w0` / `110870` / The Raven, Nevermore

GC duty/boss placeholders in `Data/scripts/quests/com/gc_quest_template.lua`:

- `Com5l1`, `Com5g1`, `Com5u1` / Into the Dark / Batraal placeholder `2303501`
- `Gcl101`, `Gcg101`, `Gcu101` / It Kills with Fire / Ifrit placeholder `2207302`
- `Gcl303` / poison-cake Qiqirn placeholder `2206305`
- `Gcl305`, `Gcg305`, `Gcu305` / Cutter's Cry or Myrmidon Princess placeholder `2303003`
- `Gcl104`, `Gcg104`, `Gcu104` / Garuda placeholder `2209501`
- `Gcl107`, `Gcg107`, `Gcu107` / Nael placeholder `2210902`

Earlier notes corrected `Gcl/Gcg/Gcu104` and `107`: they are not full Garuda/Rivenroad launch bridges yet. They are placeholder BNPC/objective lanes until guide acceptance is connected to content creation, zoning, director start/relogin, clear/fail, exit, and reward cleanup.

## Recommended Implementation Queue

1. Keep the first pass read-only/GM-only: add or test a SimpleQuestBattle adapter against `Man0u0`/`SimpleContent30079` without enabling recovered child directors.
2. Preserve SQB explicit id overrides before generating a table-driven child registry.
3. Pick one GC SQB target after the adapter smoke, probably `Com0g1`, `Com0l1`, or `Com0u1`, because they have local scripts and clear recovered child directors.
4. Fix no-mob-type data for the chosen target only. Avoid broad actor synthesis until one quest path proves the join assumptions.
5. Implement `Man2g0` as a separate bespoke fight target after SQB smoke, because it is currently a fake timed progression, not a recovered SQB migration.
6. For job quests, target one SQB-linked early job quest before any `0j6` finale. The finales have higher reward/action/AF mutation risk.
7. For class quests, use `Pgl200` as a handwritten reference and keep dense `300/306` class probes scene/log-only until class reward/completion paths are disabled for testing.
8. Defer primal/raid/GC duty rows until content/instance lifecycle is proven through the existing instance guides/directors, not through quest completion scaffolds.

## Regeneration Commands

Run from repo root:

```powershell
python tools\build_quest_scenario_parity_contract.py --output .codex-tmp\quest_scenario_parity --doc .codex-tmp\quest_scenario_parity.md
python tools\build_side_world_quest_gap_contract.py --output .codex-tmp\side_world_gap --doc .codex-tmp\side_world_gap.md
python tools\build_seasonal_quest_gap_contract.py --output .codex-tmp\seasonal_gap --doc .codex-tmp\seasonal_gap.md
python tools\build_scaffold_quest_replacement_contract.py --output .codex-tmp\scaffold_replacement --doc .codex-tmp\scaffold_replacement.md
python tools\build_simple_quest_battle_director_contract.py --output .codex-tmp\simple_quest_battle --doc .codex-tmp\simple_quest_battle.md
```

Quest mob drops:

```powershell
python outputs\quest-mob-drops-20260613\extract_quest_mob_drop_data.py
node outputs\quest-mob-drops-20260613\build_quest_mob_drop_workbook.mjs
```

Reward builder caution:

```powershell
python tools\build_quest_rewards.py
```

`build_quest_rewards.py` writes `Data/sql/gamedata_quest_rewards.sql`, so use a temp copy or inspect diffs carefully before running it as part of a research pass.

## Guardrails

- Do not use scaffold completion as proof of retail objective parity.
- Do not enable job/class/GC/primal groups just to test scenes; those templates can grant items, actions, gil, EXP, or completion.
- Do not add SQB child directors until the base adapter, give-up/cancel, return, and cleanup paths are proven.
- Do not warp directly from a kill callback during an active battle/cutscene event unless the event lifecycle has been proven stable. See `docs/quest_instance_implementation_guide.md`.
- Treat `ask(...)` widget return values as log-only until return semantics are captured for that exact widget.
- Treat `quest_code_parity.csv` as a generated snapshot. When it disagrees with checked-in Lua, prefer the checked-in Lua and refresh the generator later.

