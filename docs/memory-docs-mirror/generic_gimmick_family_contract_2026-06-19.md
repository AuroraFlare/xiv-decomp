# Generic Gimmick Family Contract

Generated: 2026-06-19T21:40:06

Outputs live in `tools/outputs/lpb/generic_gimmick_family_contract_20260619`.

## Summary

- Recovered coverage: 35/35 expected gimmick-family surfaces are present.
- Local script coverage: 35/35 expected class identities currently have a local candidate script; 0 are missing.
- `GimmickNpcBaseClass` now has a local flat shim, but recovered `talkRange` work sync and child-init inheritance semantics remain binding-probe work.
- The prompt leaves (`GimmickWarp`, `GimmickTerminal`, `GimmickExitRect`, `GimmickPoisonCure`, `GimmickTreasureBox`) are small, but they still depend on recovered client prompt methods rather than a local `desktopWidget:askForEventMode` clone.
- The rect leaves are mostly identity/trigger classes; their movement or effect must be driven from explicit unique-id or content logic, not from broad generic defaults.
- The map-object lane (`GimmickMapObjBaseClass`, `MagicSquareGimmick`, `BeaconFortGateGimmick`) has local identity shims, but status/midstream scheduler behavior still needs a bridge/probe.
- Director-side `Gimmick*` and `RaidGimmick*` scripts now have local identity shims; encounter behavior remains content-owned and unproven.

## Class Family Matrix

| class | base | category | function_count | local_exists | implementation_read |
| --- | --- | --- | --- | --- | --- |
| GimmickNpcBaseClass | NpcBaseClass | actor_gimmick_base | 4 | True | Shared actor-side base. Stores talkRange, forwards init args, and exposes askExit over worldMaster 52042/52043/52044. |
| GimmickBuffRect | GimmickNpcBaseClass | actor_gimmick_rect | 0 | True | Identity trigger/volume class. Binding matters even without Lua body. |
| GimmickBuffRectTriggerBox | GimmickNpcBaseClass | actor_gimmick_rect | 1 | True | Empty trigger-box variant. Needs script identity and push/box event plumbing. |
| GimmickDetectionRect | GimmickNpcBaseClass | actor_gimmick_rect | 1 | True | Empty detection-rect variant. Needs script identity and trigger plumbing. |
| GimmickExit | GimmickNpcBaseClass | actor_gimmick_prompt | 1 | True | Invisible/ground-off generic exit shell; prompt/movement belongs to a specific rectangle or exit helper. |
| GimmickExitRect | GimmickNpcBaseClass | actor_gimmick_prompt | 2 | True | Two-stage place-name exit confirmation from 10064/gimmickExitRect. |
| GimmickKeepOutRect | GimmickNpcBaseClass | actor_gimmick_rect | 1 | True | Ground-off keepout rect. Use as volume companion, not as talkable object. |
| GimmickPoisonCure | GimmickNpcBaseClass | actor_gimmick_prompt | 2 | True | Morbol fruit/root prompt family from 10080/gimmickPoisonCure. |
| GimmickTerminal | GimmickNpcBaseClass | actor_gimmick_prompt | 2 | True | Read-only terminal text. It says a row from 10096/gimmickTerminal and should not mutate dungeon state. |
| GimmickTreasureBox | GimmickNpcBaseClass | actor_gimmick_prompt | 3 | True | Key-item chest prompt plus map-marker-visible flag; reward validation remains separate. |
| GimmickWarp | GimmickNpcBaseClass | actor_gimmick_prompt | 2 | True | Generic prompt helper for magitek transporter and quicksand modes. Movement must stay explicit/data-driven. |
| GimmickWarpRect | GimmickNpcBaseClass | actor_gimmick_rect | 1 | True | Ground-off warp rect. Destination and prompt policy must come from binding/unique id. |
| PrefaceEvent | NpcBaseClass | actor_gimmick_event | 2 | True | Hidden ground-off event delegator. processEvent forwards to the supplied event owner. |
| GimmickMapObjBaseClass | GimmickNpcBaseClass | actor_gimmick_mapobj | 2 | True | Map-object base. Runs an optional scheduler from midstream frame 5, turns ground off, then calls child init. |
| GimmickMapObj | GimmickMapObjBaseClass | actor_gimmick_mapobj | 0 | True | Identity map-object subclass. |
| GimmickMapObjObstacle | GimmickMapObjBaseClass | actor_gimmick_mapobj | 1 | True | Map-object obstacle subclass that hides talkable map markers. |
| MagicSquareGimmick | GimmickNpcBaseClass | actor_gimmick_mapobj | 1 | True | Ground-off gimmick that runs an optional initial scheduler. |
| BeaconFortGateGimmick | GimmickNpcBaseClass | actor_gimmick_mapobj | 4 | True | Status-synced gate. status 1 selects showSchedulerName; all other statuses select hideSchedulerName. |
| GimmickBaseClass | DirectorBaseClass | director_gimmick | 1 | True | Director-side base. Allocates gimmickWork temp for children. |
| GateGimmick | GimmickBaseClass | director_gimmick | 0 | True | Thin director-side identity subclass. |
| NMPopGimmick | GimmickBaseClass | director_gimmick | 0 | True | Thin director-side identity subclass. |
| RaidGimmickBaseClass | DirectorBaseClass | director_raidgimmick | 0 | True | Raid-gimmick director base; recovered Lua is identity-only but class identity is useful. |
| RaidGimmickBoss | RaidGimmickBaseClass | director_raidgimmick | 0 | True | Thin raid-gimmick identity subclass; class path still matters for client binding. |
| RaidGimmickManager | RaidGimmickBaseClass | director_raidgimmick | 0 | True | Thin raid-gimmick identity subclass; class path still matters for client binding. |
| RaidGimmickObstacle | RaidGimmickBaseClass | director_raidgimmick | 0 | True | Thin raid-gimmick identity subclass; class path still matters for client binding. |
| RaidGimmickPop | RaidGimmickBaseClass | director_raidgimmick | 0 | True | Thin raid-gimmick identity subclass; class path still matters for client binding. |
| RaidGimmickMonsterBaseClass | RaidGimmickBaseClass | director_raidgimmick_monster | 0 | True | Raid-gimmick monster director base; recovered Lua is identity-only. |
| RaidGimmickMonster | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterBarrierAurum | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterHamlet | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterManager | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterRepop | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterSynchro | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterTime | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |
| RaidGimmickMonsterWatch | RaidGimmickMonsterBaseClass | director_raidgimmick_monster | 0 | True | Thin raid-gimmick monster identity subclass; behavior is server/content-owned until proven otherwise. |

## Prompt Contracts

| surface | text_source | rows | args | server_contract |
| --- | --- | --- | --- | --- |
| GimmickNpcBaseClass.askExit | worldMaster | 52042 main, 52043 yes, 52044 no | raidDungeon/content id as ask parameter | Only exit or return after explicit yes. |
| GimmickWarp.askWarp mode 1 | gimmickWarp | 1 main, 2 yes, 3 no | placeNameId usually zero/unused | Generic magitek transporter prompt; destination must come from binding. |
| GimmickWarp.askWarp mode 2 | gimmickWarp | 4 main, 5 yes, 6 no; worldMaster 52067 after jump | placeNameId for direction substitution | Quicksand destination table required before movement. |
| GimmickWarp.askWarp mode 3 | gimmickWarp | 7 main, 8 yes, 9 no; worldMaster 52067 after jump | placeNameId for route/path substitution | Same as mode 2 but route/path wording. |
| GimmickTerminal.eventTalkTerminal | gimmickTerminal | 1 deactivated, 2 eerie glow | terminal row id | Say-only terminal; close event with no state change. |
| GimmickExitRect.askExitWithPlaceNameId | gimmickExitRect | 1/2/3 then 4/5/6 | placeNameId | Two yes decisions required before content/static exit movement. |
| GimmickPoisonCure.askPoisonCure | gimmickPoisonCure | mode 1 -> 1/2/3; mode 2 -> 5/6/7 | fruit/root mode | Prompt only; server effect/status resolution happens after yes. |
| GimmickTreasureBox.askKeyItemUse | worldMaster | 60023 main, 60024 yes, 60025 no | itemId and quality/suffix | Validate required key item and reward separately. |
| BeaconFortGateGimmick text/effect | beaconFortGateGimmick | 1/2 main gate open/close, 3/4 sector I, 5/6 sector II | gate state/status | Pair status update with scheduler animation and optional notification. |

## Local API Surface

| surface | status | evidence_terms | implementation_use |
| --- | --- | --- | --- |
| Script binding | present | CreateScriptBindPacket, classPath, init return params | Can bind recovered class identities once local script files and SQL class paths exist. |
| Push/rect events | present | SetPushEventConditionWithCircle/Fan/TriggerBox, SetEventStatusPacket | Use for GimmickWarpRect, GimmickExitRect, buff/detection/keepout trigger volumes. |
| NPC push command fields | present | pushCommand, pushCommandSub, pushCommandPriority | Actor classes can expose push commands through gamedata_actor_pushcommand. |
| Map-object visual transport | present | SetActorBGPropertiesPacket, PlayMapObjAnimation | Bridge GimmickMapObjBaseClass, MagicSquareGimmick, and BeaconFortGateGimmick scheduler names. |
| BG animation packet | present | PlayBGAnimation | Can send animation name; recovered midstream frame argument still needs a visual probe. |
| Client function call bridge | partial | callClientFunction -> player:RunEventFunction | Enough for named client functions, but recovered desktopWidget:askForEventMode needs a wrapper contract. |
| Existing mapobj samples | present | npc:PlayMapObjAnimation(player, animation) | Good local examples for scheduler-name playback. |
| Stateful Toto-Rak siblings | implemented | askYesNo, eventTalkRead, object-specific behavior | Regression set; do not replace with generic terminal/warp behavior. |

## Local Gap Matrix

| gap | impact | next |
| --- | --- | --- |
| Generic actor-side gimmick shims are present but bindings are unproven | Terminals, warps, rect triggers, poison cure, map objects, and treasure/key-item prompts can be probed locally, but cannot be claimed retail-bound until class path, unique-id, a... | Keep the local shims behavior-light, then bind known actor/spawn rows through explicit probe tables before enabling movement, rewards, or scheduler side effects. |
| desktopWidget:askForEventMode is not a direct local Lua helper | Prompt scripts can exist but cannot return retail yes/no choices without a wrapper. | Create a small askForEventMode-compatible bridge or per-surface wrapper functions. |
| Generic map-object scheduler/status bridge is missing | Magic squares and Beacon-style gates cannot animate from recovered scheduler args/status changes. | Map scheduler names to PlayBGAnimation and probe whether midstream frame 5 needs special packet support. |
| Actor class and spawn bindings are not proven | Scripts may be correct but never instantiate on real dungeon objects. | Add logging/probe bindings for classPath, uniqueId, event type, push condition, mapObj layout/instance, and script args. |
| Director-side generic/raid-gimmick shims are present but behavior is unproven | Content scripts can bind the recovered names, but encounter behavior, scheduler ownership, rewards, and state transitions are still server/content-owned gaps. | Keep the director shims behaviorless until a specific content script proves which raid-gimmick manager owns each state transition. |
| Rect/trigger classes need destination and effect policies | A generic prompt or movement action without binding data can warp to wrong places or double-fire. | Keep movement/effect resolution in explicit unique-id tables or C# content logic. |

## 2026-06-21 Map Object Shim Note

- `BeaconFortGateGimmick` has a local identity/status shim, but scheduler/status playback is still only partial. Do not treat the script as parity until show/hide scheduler names, midstream timing, and status updates have a live map-object probe.
- `DoorStandard`, `DoorServer`, `MapObjTutorial`, and `MapObjOnlyShowHide` are mostly identity, binding, or animation shims. They prove class resolution and BG binding, not recovered retail scheduler behavior.
- `GimmickTerminal` is say-only, `GimmickWarp` is prompt-only without explicit route data, and `RaidDungeonWarp` is a distinct dungeon transporter surface. Keep terminal, generic warp, and raid warp evidence separated.

## Implementation Order

| order | task | acceptance | risk |
| --- | --- | --- | --- |
| 1 | Verify actor-side gimmick class bindings with controlled probes | A controlled actor can bind each local gimmick class without falling back to PopulaceStandard, while dedicated Toto-Rak objects stay on their own scripts. | Low if behavior is mostly no-op until bridges exist. |
| 2 | Add askForEventMode-compatible prompt bridge | Prompt rows 1/2/3 etc. display and return deterministic choices in live probes. | Medium because widget/event ownership must match the client event stack. |
| 3 | Validate terminal/warp/exit/poison/treasure prompt helpers | Each helper can be called in isolation, performs no movement unless configured, and keeps binding/destination/status behavior gated by proof. | Medium if a generic script accidentally hijacks Toto-Rak dedicated objects. |
| 4 | Bridge map-object scheduler playback | Initial scheduler and status changes play visible BG animations through PlayBGAnimation. | Medium until midstream frame behavior is visually compared. |
| 5 | Capture and seed real bindings | Probe tables can distinguish magitek leads, quicksand, exit rectangles, and Beacon gates. | Medium because false bindings create convincing but wrong interactions. |
| 6 | Verify director/gimmick and director/raidgimmick identity shims | GateGimmick, NMPopGimmick, RaidGimmick* and RaidGimmickMonster* load locally without changing encounter state. | Low if kept behaviorless until content logic exists. |
| 7 | Run regression probes for existing dedicated objects | Existing object interactions still call their dedicated scripts after the generic family is present. | Medium if SQL class paths are broadened too aggressively. |

## Probe Queue

| priority | probe | method | expected |
| --- | --- | --- | --- |
| 1 | Class bind smoke test | Spawn/bind one controlled actor for every recovered Gimmick*/RaidGimmick* class. | Client instantiates the intended class path and does not fall back to PopulaceStandard. |
| 2 | Generic prompt rows | Call askWarp modes 1/2/3, askExit, askExitWithPlaceNameId, askPoisonCure modes 1/2, and askKeyItemUse. | Rows and substitutions match DAT/worldMaster text and return true only on yes. |
| 3 | Rect trigger ownership | Bind GimmickWarpRect/GimmickExitRect/BuffRect/DetectionRect/KeepOutRect with push circle/box conditions. | Only the intended trigger fires; movement/effect is driven by configured unique id. |
| 4 | Map-object scheduler playback | Bind MagicSquareGimmick and BeaconFortGateGimmick to mapobj test actors with show/hide scheduler names. | Initial scheduler and status toggle play the expected BG animation. |
| 5 | Binding capture for magitek/quicksand leads | Log actorClassId, classPath, uniqueId, push condition, script args, placeNameId, and destination on use. | 1200373-1200375 and quicksand actors are classified before implementation movement is enabled. |
| 6 | Dedicated object regression | Exercise Toto-Rak Light/Barrier/Poster, PrivateAreaPastExit, and Hamlet widgets after generic scripts exist. | No dedicated object is rerouted to the generic terminal/warp prompt path. |

## Generated Files

- `source_inventory.csv` (35 rows)
- `function_index.csv` (31 rows)
- `class_family_matrix.csv` (35 rows)
- `prompt_contract.csv` (9 rows)
- `prompt_text_rows.csv` (38 rows)
- `local_api_surface.csv` (8 rows)
- `sql_binding_probe.csv` (38 rows)
- `local_gap_matrix.csv` (6 rows)
- `implementation_contract.csv` (7 rows)
- `probe_queue.csv` (6 rows)
- `backlog_gimmick_high_value.csv` (33 rows)
- `source_term_hits.csv` (603 rows)
- `contract_summary.json` (1 rows)
- `README.md` (1 rows)
