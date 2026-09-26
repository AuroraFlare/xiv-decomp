# Starter City Opening Quests Decomp - 2026-07-05

## Scope

Targets from the fight backlog/screenshot:

| Quest | Id | Code | Local script | Recovered client script |
| --- | ---: | --- | --- | --- |
| Shapeless Melody | 110001 | Man0l0 | `Data/scripts/quests/man/man0l0.lua` | `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0l0.lua` |
| Sundered Skies | 110005 | Man0g0 | `Data/scripts/quests/man/man0g0.lua` | `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0g0.lua` |
| Flowers for All | 110009 | Man0u0 | `Data/scripts/quests/man/man0u0.lua` | `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0u0.lua` |

All three are first-row main scenario quests in `Data/sql/gamedata_quests.sql`.
They have no prerequisite and replace into the next city quest:
`Man0l1`, `Man0g1`, and `Man0u1`.

## High-Level Result

These are not recovered SimpleQuestBattle children. The recovered director files
for `QuestDirectorMan0l001`, `QuestDirectorMan0g001`, and
`QuestDirectorMan0u001` are only thin client class declarations:

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan0x001", "QuestDirectorBaseClass")
```

The useful decomp source is the quest scenario Lua plus the local handwritten
server adapters:

- Scenario scripts contain the tutorial, talk, blocker, cutscene, and post-warp
  event functions.
- Local quest scripts bind actors, sequence gates, map markers, and the private
  content launch.
- Local content scripts spawn allies/enemies directly.
- Local quest directors handle tutorial waits, kill counters, content finish,
  return warp, and post-fight sequence handoff.

The current materialization atlas already classifies all three as
`bespoke_content`, `strict_kill_route_reachable`, and `script_spawn_ready`.
Remaining work is runtime proof, not broad decomp discovery.

## Focused Extract Pack

Generated output pack:

`outputs/starter-city-opening-quests-decomp-20260705`

Builder:

`tools/build_starter_city_opening_quests_decomp.py`

Run with:

```powershell
python tools\build_starter_city_opening_quests_decomp.py
```

The pack condenses the generic multi-megabyte quest decomp atlases into these
quest-specific files:

- `quest_summary.csv`: identity and implementation counters.
- `fight_route_matrix.csv`: content/director/kill/return route summary.
- `content_spawn_rows.csv`: parsed ally/enemy/stopper spawns from local content
  scripts.
- `actor_surface_rows.csv`: active local ENPC bindings by sequence/function.
- `dat_marker_rows.csv`: DAT marker rows filtered to the three quest ids.
- `local_marker_constants.csv`: marker constants defined by the local quest
  scripts.
- `local_constant_rows.csv`: sequence, flag, marker, actor, and other local
  constants from the deep atlas.
- `delegate_push_call_rows.csv`: local delegate pushes with owner/wait/end-event
  contract hints.
- `lifecycle_action_rows.csv`: local event lifecycle actions such as
  `EndEvent`, `ContentFinished`, and warps.
- `reward_rows.csv`: normalized reward rows and duplicate-grant risk notes.
- `flag_usage_rows.csv`: local `GetFlag`/`SetFlag`/`UnsetFlag` reads and
  writes.
- `counter_usage_rows.csv`: local quest/director counter reads and writes.
- `source_delegate_call_rows.csv`: direct source scan of quest and director
  client delegate calls.
- `transition_action_rows.csv`: ordered local sequence, zone, event, and
  completion actions.
- `choice_gate_rows.csv`: client choice-return captures and comparisons.
- `function_skeleton_rows.csv`: per-function local event/state/action
  summaries.
- `sequence_flow_rows.csv`: compact sequence-to-runtime flow map.
- `server_delegate_surface.csv`: local delegate calls joined to recovered
  method context, with raw method presence marked separately.
- `client_method_summary.csv`: recovered method step/text/scene summary,
  including raw widget-only/helper-only methods.
- `client_dialogue_rows.csv`: all recovered dialogue/text rows for these
  methods.
- `client_signal_rows.csv`: granular recovered client operations by method and
  signal kind.
- `client_method_body_extracts.csv`: raw recovered client method body excerpts
  and body signals.
- `content_spawn_atlas_rows.csv`: richer content spawn rows with actor paths
  and display ids.
- `objective_crosscheck_rows.csv`: objective actor/count vs script-spawn and
  ambient-objective evidence.
- `source_to_client_method_rows.csv`: source delegate calls joined to recovered
  method summaries and body excerpts.
- `marker_condition_rows.csv`: local marker insert conditions joined to marker
  ids and DAT marker rows.
- `replay_scene_rows.csv`: replay/cutscene rows.
- `runtime_probe_checklist.csv`: concrete probe checklist.
- `probe_commands.csv`: GM command scaffold for live smoke checks.
- `dossier_man0l0.md`, `dossier_man0g0.md`, `dossier_man0u0.md`: generated
  per-quest handoff notes.

Current counts:

| Code | Delegates | Source calls | Raw client methods | Actor bindings | Constants | Flags | Transitions | Rewards | Spawns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `man0l0` | 31 | 35 | 44 | 27 | 35 | 31 | 29 | 3 | 5 |
| `man0g0` | 12 | 16 | 29 | 9 | 39 | 19 | 29 | 1 | 6 |
| `man0u0` | 28 | 32 | 47 | 23 | 61 | 32 | 28 | 1 | 4 |

Readability extracts:

| Code | Client signals | Dialogue rows | Body extracts | Source-to-client joins | Marker conditions |
| --- | ---: | ---: | ---: | ---: | ---: |
| `man0l0` | 112 | 45 | 44 | 35 | 4 |
| `man0g0` | 49 | 16 | 29 | 16 | 3 |
| `man0u0` | 97 | 42 | 47 | 32 | 6 |

Delegate coverage:

- Every local delegate call for these three now has
  `raw_client_method_present=yes` in `server_delegate_surface.csv`.
- Every direct source delegate call in `source_to_client_method_rows.csv` joins
  to a raw recovered client method.
- The older generic timeline join still reports context count `0` for a few
  methods because it ignores widget-only bodies and client tutorial-judge
  wrappers. Treat `raw_client_method_present` as the stronger existence signal.
- `marker_condition_rows.csv` gives live marker gating context. Gridania and
  Ul'dah marker conditions join to DAT marker rows; Limsa marker constants use
  `110002xx` ids in the local `man0l0` script, so the focused `110001` DAT
  marker join is intentionally empty there.

Objective/materialization cross-check:

| Quest | Objective | Script enemy spawns | Actor path | Objective rows | Ambient rows | Read |
| --- | --- | ---: | --- | ---: | ---: | --- |
| `man0l0` | 3x `2205403` | 3 | `/Chara/Npc/Monster/Jellyfish/JellyfishScenarioLimsaLv00` | 0 | 0 | `bespoke_content_script_spawn` |
| `man0g0` | 3x `2201407` | 3 | `/Chara/Npc/Monster/Wolf/WolfScenarioGridaniaLv00` | 0 | 0 | `bespoke_content_script_spawn` |
| `man0u0` | 1x `2203301` | 1 | `/Chara/Npc/Monster/Goobbue/GoobbueLesserScenarioUldahLv00` | 0 | 0 | `bespoke_content_script_spawn` |

Client signal highlights:

- `man0l0`: 112 recovered client signals, including 45 dialogue rows, 10
  cutscene signals, 21 fade calls, and 14 scheduler calls.
- `man0g0`: 49 recovered client signals, including 16 dialogue rows, 1
  cutscene signal, 3 fade calls, and 9 scheduler calls.
- `man0u0`: 97 recovered client signals, including 42 dialogue rows, 4
  cutscene signals, 3 fade calls, and 13 scheduler calls.

Raw-only findings worth keeping visible:

| Quest | Method | Read |
| --- | --- | --- |
| `man0l0` | `processEvent000_2` | Widget-only exit prep: cancels/closes/orders desktop widget mode `16`; no text or scene row expected. |
| `man0u0` | `processEvent000_3` | Wrapper into `_getTutorialJudge():man0u0processEvent000_3`; static quest timeline cannot expose branch internals. |
| `man0u0` | `processEvent020_8` | Wrapper into `_getTutorialJudge():man0u0processEvent020_8`; probe return/choice behavior live. |
| `man0g0` | `processTtrBlkNml002` | Empty recovered body; no current local delegate calls it. |

Delegate/lifecycle contract findings:

- All focused local delegate pushes are classified as `natural_onEventStarted`
  with `caller_end_event_after_delegate`.
- Lifecycle action rows show the same content-entry skeleton on all three:
  `AddDirector`, `StartDirector`, `SetLoginDirector`, `DoZoneChangeContent`,
  `KickEvent`, and two `StartSequence` calls.
- The only focused delegate risk note is `man0l0.processEvent020_9`, the Hob
  choice helper. It is a fade/ask helper without a direct scene key, so live
  probe should verify choice return value `1` before replacement into `Man0l1`.

Local state-machine findings:

- Source delegate scan covers both quest scripts and directors. Counts are
  `35` for `man0l0`, `16` for `man0g0`, and `32` for `man0u0`.
- Flag usage splits are `man0l0`: 26 reads / 5 writes, `man0g0`: 15 reads / 4
  writes, and `man0u0`: 26 reads / 6 writes.
- Each quest has four `StartSequence` calls in local source: initial `SEQ_000`,
  content `SEQ_005`, silent director reset to `0`, then return `10`.
- Each quest has one explicit `ReplaceQuest` handoff and one direct
  `KickEvent` content-start handoff. Directors then use five
  `kickEventContinue` calls through the battle tutorial lane.
- Director `onKillBNpc` summaries now show the recovered post-fight story
  methods directly: `man0l0.processEvent000_3`, `man0g0.processEvent020_1`,
  and `man0u0.processEvent020`.
- The only local choice gates found are in Limsa: `processEventNewRectAsk == 1`
  to enter content and `processEvent020_9 == 1` to replace into `Man0l1`.

Reward rows:

| Quest | Rewards | Grant note |
| --- | --- | --- |
| `man0l0` | 1000 gil, currency `1000013` x10, item `8050110` x1 | `CompleteQuest` auto-grants; do not duplicate in Lua. |
| `man0g0` | 2000 gil | `CompleteQuest` auto-grants; do not duplicate in Lua. |
| `man0u0` | 2000 gil | `CompleteQuest` auto-grants; do not duplicate in Lua. |

## Shared Runtime Pattern

1. Character starts in `SEQ_000`.
2. A targeting/tutorial push starts `processTtrNomal002`.
3. A talk tutorial starts `processTtrNomal003`.
4. Required mini-talks unlock the exit trigger or final handoff actor.
5. Exit creates private content, starts the director, sets login director, and
   zone-changes into the content area.
6. The current working-tree adapter order then starts `SEQ_005` and kicks
   `noticeEvent`. This is the timing-sensitive part of these three quests.
7. The director runs `processTtrBtl001`, `processTtrBtl002`, class-specific
   battle guidance, then waits for the objective kills.
8. On kill completion it closes the tutorial widget, sends attention packet
   `51073`, resumes the event lane with `kickEventContinue`, plays the recovered
   post-fight story method, finishes content, warps back, and starts `SEQ_010`.
9. `SEQ_010` exposes city NPCs and the next quest handoff.

The recovered `processTtrAfterBtl001` and `processTtrBtl004` functions are
generic tutorial tail/success widgets. Local directors currently avoid relying
on those as terminal flow gates and instead move into the recovered story scene
plus return warp. Keep that narrow until packet order is live-proven.

## Shapeless Melody / Man0l0

Local launch:

- Exit trigger: `1090025`
- Confirm method: `processEventNewRectAsk`
- Exit scene before content: `processEvent000_2`
- Content area: `man0l01`
- Content script: `SimpleContent30002`
- Director: `Quest/QuestDirectorMan0l001`
- Content spawn: `DoZoneChangeContent(player, contentArea, -4.8, 16.35, 8.1, 0.2, 16)`

Content spawns:

| Role | Actor class | Label | Position |
| --- | ---: | --- | --- |
| Ally | 2290001 | `yshtola` | `-6, 16.35, 11.58, 2.9` |
| Ally | 2290002 | `stahlmann` | `1.1, 16.35, 17.44, -3.1` |
| Enemy | 2205403 | `jellyfish1` | `-4.75, 16.35, 16.86, -3.1` |
| Enemy | 2205403 | `jellyfish2` | `-2.25, 16.35, 15.55, -2.6` |
| Enemy | 2205403 | `jellyfish3` | `-0.8, 16.35, 13.8, -2.5` |

Kill route:

- Director counts `JELLYFISH = 2205403`.
- Completion threshold is `3`.
- Attention packet is `51073, 1`.
- Post-fight story method is `processEvent000_3`.
- Return warp is zone `230`, `PrivateAreaMasterPast`, type `1`,
  `-826.868469, 6, 193.745865, -0.008368492`.
- `SEQ_010` handoff: Hob runs `processEvent020_9`; choice `1` replaces into
  `Man0l1`.

Recovered replay rows:

- `man0l000` / `MAN0L000`: `processEvent000_1`,
  `processEventTalkMenuManCutPreview`
- `man0l010`: `processEventTalkMenuManCutPreview`, `processTtrBtl001`
- `man0l020`: `processEventTalkMenuManCutPreview`
- `man0l030`: `processEventTalkMenuManCutPreview`

Notes:

- The local content variable is consistently `sthalmann`; the spawned actor
  label is `stahlmann`. No nil-party-add issue was found in this pass.
- Local script already covers the dense ship talk surface and Limsa arrival
  talk surface.

## Sundered Skies / Man0g0

Local launch:

- Final sequence-0 actor: Yda, `1000009`
- Content area: `man0g01`
- Content script: `SimpleContent30010`
- Director: `Quest/QuestDirectorMan0g001`
- Content spawn:
  `DoZoneChangeContent(player, contentArea, 362.4087, 4, -703.8168, 1.5419, 16)`

Content spawns:

| Role | Actor class | Label | Position |
| --- | ---: | --- | --- |
| Ally | 2290005 | `papalymo` | `365.9, 4.1, -706.7, -0.7` |
| Ally | 2290006 | `yda` | `365.26, 4.1, -700.73, 1.56` |
| Enemy | 2201407 | `wolf1` | `374.4, 4.4, -698.7, -1.9` |
| Enemy | 2201407 | `wolf2` | `375.4, 4.4, -700.24, -2` |
| Enemy | 2201407 | `wolf3` | `375.1, 4.4, -703.6, -1.54` |
| Actor | 1090384 | `openingstoper` | `356.1, 3.7, -701.6, -1.4` |

Kill route:

- Director counts `WOLF = 2201407`.
- Completion threshold is `3`.
- Attention packet is `51073, 2`.
- Post-fight story method is `processEvent020_1`.
- Return warp is zone `155`, `PrivateAreaMasterPast`, type `1`,
  `175.38, -1.21, -1156.51, -2.1`.
- `SEQ_010` handoff: push actor `1099046` replaces into `Man0g1`.

Recovered replay rows:

- `man0g000` / `MAN0G000`: `processEvent000_0`

Notes:

- The recovered post-fight Gridania story method is `processEvent020_1`, not
  a generic tutorial tail. The local director uses that method before returning
  to city state `SEQ_010`.
- `processTtrBlkNml001` is present and maps the Gridania blocker line to
  display name `1600102`.

## Flowers for All / Man0u0

Local launch:

- Exit trigger / blocker actor: `1090372`
- Content area: `man0u01`
- Content script: `SimpleContent30079`
- Director: `Quest/QuestDirectorMan0u001`
- Content spawn:
  `DoZoneChangeContent(player, contentArea, -17.7, 192, 37.7, 0.93, 16)`

Content spawns:

| Role | Actor class | Label | Position |
| --- | ---: | --- | --- |
| Ally | 2290003 | `niellefresne` | `-14.37, 192, 37, -0.6` |
| Ally | 2290004 | `thancred` | `-17.3, 192, 42.3, 1.1` |
| Enemy | 2203301 | `goobbue` | `-12.1, 192, 42.96, -2.3` |
| Actor | 1090385 | `openingstoper` | `-24.34, 192, 34.22, 0` |

Kill route:

- Director counts `GOOBBUE = 2203301`.
- Completion threshold is `1`.
- Attention packet is `51073, 3`.
- Post-fight story method is `processEvent020`.
- Return warp is zone `175`, `PrivateAreaMasterPast`, type `3`,
  `-22.81, 196, 87.82, 2.98`.
- `SEQ_010` handoff: push actor `1099046` replaces into `Man0u1`.

Recovered replay rows:

- `man0u000` / `MAN0U000`: `processEvent000`,
  `processTtrNomal001withHQ`
- `man0u005`: `processTtrNomal001`, `processTtrNomal001withHQ`

Notes:

- Several Ul'dah event functions delegate into `_getTutorialJudge()`, notably
  `processEvent000_3` and `processEvent020_8`. Local scripts can call these
  directly, but the actual branch text/choice behavior is owned by the client
  tutorial judge.
- The local director no longer calls `processTtrBtl004` after the return warp;
  that avoids layering a generic tutorial success widget over the post-fight
  story handoff until live packet order is proven.

## Runtime Probe Plan

Use these as positive controls before marking the three fight rows as fully
enabled:

| Quest | Setup | Objective proof | Expected return |
| --- | --- | --- | --- |
| `man0l0` | Start quest `110001`, progress to exit trigger, enter `man0l01` | Kill 3x `2205403` | Zone `230`, private area type `1`, `SEQ_010`, Hob handoff to `Man0l1` |
| `man0g0` | Start quest `110005`, talk Yda/Papalymo/Yda, enter `man0g01` | Kill 3x `2201407` | Zone `155`, private area type `1`, `SEQ_010`, push handoff to `Man0g1` |
| `man0u0` | Start quest `110009`, complete three mini-talks, enter `man0u01` | Kill 1x `2203301` | Zone `175`, private area type `3`, `SEQ_010`, push handoff to `Man0u1` |

Probe checks:

- `noticeEvent` starts exactly once on content entry.
- `kickEventContinue` resumes the battle tutorial lane after `quest:StartSequence(0, true)`.
- Attention packet `51073` is visible before the post-fight story handoff.
- `ContentFinished()` fires before the return zone change.
- `quest:StartSequence(10)` updates the journal after the return handoff.
- Player party and temporary combat mods are cleared after return.
- No duplicate quest completion, reward grant, or follow-up quest replacement
  occurs before the explicit city handoff actor.

GM shortcut scaffold:

| Quest | Direct content checkpoint | Objective command |
| --- | --- | --- |
| `man0l0` | `!questcomplete man0l0 jellyfish` | `!testbnpckill 2205403` x3 |
| `man0g0` | `!questcomplete man0g0 wolf` | `!testbnpckill 2201407` x3 |
| `man0u0` | `!questcomplete man0u0 goobbue` | `!testbnpckill 2203301` x1 |

The full ordered command sequence is in `probe_commands.csv`: accept quest,
enter the direct content checkpoint, inspect with `!quest info`, simulate the
objective kills, then inspect the returned `SEQ_010` state.

## Implementation Read

No new broad decomp is needed for these three. The useful next action is a
narrow live smoke/probe pass against the existing local adapters. If a code
change is needed after probing, it should stay in the director completion order
and not expand into SQB adapter work.
