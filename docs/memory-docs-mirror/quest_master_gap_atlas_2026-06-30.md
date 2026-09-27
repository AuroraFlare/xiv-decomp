# Quest Master Gap Atlas - 2026-06-30

This is the quest-wide rollup layer above the execution and runtime atlases. It answers: which quests are most blocked, why, and what implementation lane should they go through?

Generated files:

- `tools/build_quest_master_gap_atlas.py`
- `outputs/quest-master-gap-atlas-20260630/README.md`
- `outputs/quest-master-gap-atlas-20260630/quest_dimension.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_runtime_gap_queue.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_marker_join.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_reward_join.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_cutscene_join.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_actor_surface_join.csv`
- `outputs/quest-master-gap-atlas-20260630/fight_readiness_by_quest.csv`
- `outputs/quest-master-gap-atlas-20260630/quest_source_manifest.csv`

Regenerate with:

```powershell
python tools\build_quest_master_gap_atlas.py --output outputs\quest-master-gap-atlas-20260630
```

## Counts

| Output | Rows |
| --- | ---: |
| Quest dimension / gap queue | 628 |
| DAT marker join | 7884 |
| Normalized reward join | 346 |
| Recovered cutscene join | 760 |
| Local actor surface join | 1336 |
| Fight readiness rows | 94 |
| Source manifest | 16 |

## What The Queue Scores

`quest_runtime_gap_queue.csv` is sorted by combined `gap_score`, with separate `implementation_gap_score` and `enablement_risk_score` columns. It intentionally favors:

- missing local quest scripts
- local scaffold/template scripts
- scene-key delegate aliases
- recovered scenes with no local push
- after-warp cutscene ordering risk
- SimpleQuestBattle targets
- BNPC rows with no mob type
- actor-path gaps
- reward/EXP duplication risk
- local marker constant gaps
- missing marker/reward rows
- private-content lifecycle complexity

The score is heuristic. Use `priority_band`, `gap_reasons`, `enablement_risk_reasons`, and `recommended_lane` before choosing a patch. A high `enablement_risk_score` means "small patch could unlock or break a lot"; a high `implementation_gap_score` means "more script/runtime work remains."

## Immediate Fix Queue

The most actionable near-term queue is scene-key delegate aliases. These are local scripts passing a scene key where the recovered callable method should be used.

| Code | Quest | Alias fixes | Lane |
| --- | --- | --- | --- |
| `com0u6` | Know Your Enemy | `com0u510 -> processEvent_005_03` | alias fix, then SQB/fight review |
| `com0u1` | Career Opportunities | `com0u105 -> processEvent_020`; `com0u110 -> processEvent_030` | first SQB target |
| `com0g1` | Breaking the Seals | `com0g105 -> processEventUrianger`; `com0g110 -> processEventUriangerMore` | first SQB target |
| `com0l1` | The Price of Integrity | `com0l105 -> processEvent_020`; `com0l110 -> processEvent_030` | first SQB target |
| `com0u4` | Arms Race | `com0u410 -> processEvent_050` | GC/SQB follow-up |
| `man300` | Toll of the Warden | eight alias rows; seven unique `man300* -> process/pE*` methods | dense MSQ cutscene fix |
| `com0l6` | Ceruleum Shock | `com0l510 -> processEvent_010` | preserve explicit SQB quest id |
| `com0l4` | Engineering Victory | `com0l410 -> processEvent_020` | GC/SQB follow-up |
| `com0g4` | The Mail Must Get Through | `com0g410 -> processEventClear, 0, 0` | preserve required clear args |
| `com0g6` | Appetite for Destruction | `com0g510 -> processEventNq` | GC/SQB follow-up |

Do not patch these by calling `startNQCutScene` directly. Keep the natural NPC/object event owner and delegate to the recovered method, with the extra args required by that method.

Important non-alias rows:

- `sqrwa` is an inherited reward widget method, not a broken scene key.
- `contentsJoinAskInBasaClass` is a real recovered spelling and belongs to content join lifecycle probing.
- `man30070` has no recovered method yet; keep it in runtime-probe triage.
- `man206 -> processEvent080_01` appears to target a recovered `Man2g0` method, so treat it as copy/paste triage.

## Dense Cutscene/Scaffold Queue

After alias fixes, the queue highlights dense cutscene scripts that are present as scaffolds or templates:

- `pgl306` - 10 missing scene pushes, 6 after-warp rows.
- `cnj306` - 10 missing scene pushes, 5 after-warp rows.
- `man406` - dense MSQ scene flow.
- `gla300`, `cul306`, `man308`, `lnc300`, `fsh300`, `exc306`, `brd0j4` - high scene count or after-warp risk.

These should be implemented through the event-owner policy from `quest_runtime_deep_atlas_2026-06-30.md`: natural talk/push from `onEventStarted`, director scenes through an event-start wait path, and after-warp rows kept open until the recovered method returns.

## Job/Class Queue

Job quests are mostly scaffold/template plus SQB/cutscene work, so they should stay completion/reward-disabled until the fight adapter is proven.

Repo naming notes:

- Marauder-class quests use `exc*` here, not `mrd*`.
- Botanist/gathering uses `hrv*`, not `btn*`.
- Crafting prefixes are `wdk/bsm/gld/tan/wvr/alc/cul`.
- No scene-key alias rows currently hit the requested job/class prefixes; the alias policy still matters for any new push implementation.

Highest job rows right now:

| Code | Quest | Lane |
| --- | --- | --- |
| `pld0j6` | Keeping the Oath | dense cutscene push/scaffold |
| `blm0j6` | Always Bet on Black | dense cutscene push/scaffold |
| `mnk0j6` | Return of the King...of Ruin | dense cutscene push/scaffold |
| `drg0j6` | Into the Dragon's Maw | SQB adapter target |
| `pld0j5` / `pld0j1` | Paladin job quests | SQB adapter target |
| `brd0j4`, `blm0j1`, `whm0j4`, `whm0j1`, `mnk0j1`, `drg0j1` | job unlock/progression quests | SQB adapter target |

Class/crafting/gathering dense cutscene queue remains broad: `pgl306`, `cnj306`, `gla300`, `cul306`, `min300`, `exc306`, `arc300`, `lnc300`, `fsh300`, `wdk306`, `gla306`, `hrv306`, `gld300`, `thm300`, `arc306`, `lnc306`, `bsm306`, and `bsm300`.

Scoped job/class/craft/gathering pass found 166 relevant master rows: 92 scaffold/template, 45 missing-local with gamedata, 28 recovered no-gamedata, and 1 handwritten. All job `0j1`-`0j6` wrappers exist; recovered `0j7/0j8/0j9/1j0` tails have no gamedata. Many class `400/500/506` tails are still missing or wrapper-only.

Reward/completion caution:

- `class_quest_template.lua` can send `sqrwa`, grant items, complete the quest, then add EXP.
- `job_quest_template.lua` can grant key items/items/actions, complete the quest, then add EXP.
- `class_quests_enabled=false` and `job_quests_enabled=false` in `Data/map_config.ini` are useful protection while replacing scaffold flow.

## Missing Local Script Queue

The highest missing-local-script rows currently include examples such as:

- `bsm400`
- `fsh400`
- `cul400`
- many `acn*` rows

These need local script generation or scaffold replacement, but they are not necessarily the fastest path to visible quest progress. Prefer alias/cutscene fixes first, then generate local scripts in batches once the push/fight runtime is stable.

## Fight Readiness

`fight_readiness_by_quest.csv` splits fight work into three lanes:

- `bespoke_content`: already has local content/director launch data.
- `BNPC_objective`: standard objective kill/data rows.
- `SQB`: recovered SimpleQuestBattle target with no local adapter yet.

Best smoke path:

1. `Man0u0` - bespoke content, Goobbue kill, local director, return flow.
2. `Man0l0` / `Man0g0` - three-kill tutorial variants.
3. Ambient BNPC objectives: `Etc1g4`, `Etc1u1`, `Etc1u5`, `Etc1u6`, `Etc2l0`, `Etc2u2`, `Wld0g1`, `Wld0g4`.
4. First SQB targets: `com0g1`, `com0l1`, `com0u1`.
5. Convert `Man2g0` from timed WIP into a real bespoke fight.

SQB rows are deliberately low readiness even when a director exists: the blocker is mob type/spawn/content/return lifecycle, not merely the recovered child script. First SQB targets `com0g1`, `com0l1`, and `com0u1` are at 35/100 because actor classes and directors are known, but mob type, spawn, content map, kill reachability, and return flow are still missing.

Job SQB targets such as `blm0j1`, `brd0j1`, `brd0j4`, `drg0j1`, `drg0j6`, `mnk0j1`, `pld0j1`, `pld0j5`, `war0j1`, `war0j3`, `whm0j1`, and `whm0j4` score 15/100: they have a recovered director target but lack actor class, mob type, spawn/content, content map, reachable kill route, return flow, reward lock, and non-scaffold completion safety. `wvr306` is the notable class/craft SQB target and has the same adapter problem.

## Dungeon/Instance Profiles

Use `outputs/quest-runtime-deep-atlas-20260630/instance_raid_launch_profiles.csv` for dungeon/trial/Hamlet work. It adds one launch checklist row per content id:

- `occupancy_legacy`: Toto-Rak and Dzemael. Toto-Rak has the only real C# lifecycle; Dzemael has Lua profile data but no lifecycle bridge.
- `modern_instance_raid`: AV, Cutter, Ifrit/Garuda tiers, Thornmarch, Beacon/Castrum, and Rivenroad. These need generated admission/private-area/start/relogin/clear/fail/reward profiles before `askEnterInstanceRaid` can do more than prompt.
- `hamlet_defense`: Aleport, Hyrstmill, Golden Bazaar. Hamlet has a separate manager lane and should stay separate.

Recovered modern start shape is:

```lua
startEvent(sceneName, owner, modeFlag, contentId, startTime, finishTime, eventType, ...)
```

Local Lua already sends this shape. The missing piece is the C#/data profile bridge: validate admission, create or attach content, send `_setInstanceRaid`, then send the profile's `startEvent`/lane-specific equivalent.

## How To Use The Tables

For a quest implementation slice:

1. Start in `quest_runtime_gap_queue.csv`.
2. If `scene_key_alias_rows > 0`, inspect `scene_key_alias_fixes`.
3. Open `quest_cutscene_join.csv` for method args, fade mode, scene keys, and replay rows.
4. Open `quest_actor_surface_join.csv` for `SetENpc` actors, flags, and sequence context.
5. Check `quest_marker_join.csv` and `quest_reward_join.csv` before completing the quest.
6. If the quest has `sqb_target`, `bnpc_rows`, or `content_launch_rows`, check `fight_readiness_by_quest.csv`.

## Next Best Implementation Slices

1. Patch and runtime-test `com0g1`, `com0l1`, and `com0u1` alias rows.
2. Patch a contained MSQ alias batch in `man300`.
3. Build a GM-only event-context probe that refuses unsafe owner/type combinations.
4. Prove `Man0u0` fight lifecycle end to end.
5. Add a minimal SQB adapter and one target mob type for `com0g1`.
6. Generate/consume `InstanceRaidLaunchProfile` rows for Toto-Rak and Dzemael before generic AV/Cutter/Rivenroad.
7. Only then broaden to dense scaffold/cutscene batches like `pgl306` and `cnj306`.
