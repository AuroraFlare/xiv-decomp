# Magitek Transporter Exit Adapter Contract - 2026-06-19

Outputs live in `tools/outputs/lpb/magitek_transporter_exit_adapter_contract_20260619`.

## High-signal findings

- Source coverage: 41/41 expected sources are present.
- `RaidDungeonWarp` is the concrete Magitek transporter object: text bank `6781/raidDungeonWarp`, scheduler `67493888`, and `askExtendWidget(self, 2, 2, 1, 2)`.
- `GimmickWarp` is a separate generic warp/quicksand prompt using text bank `10112/gimmickWarp`; it should not replace `RaidDungeonWarp`.
- `GimmickTerminal` is read-only text only, from `10096/gimmickTerminal`.
- Local Toto-Rak Light/Barrier/Poster are already implemented object-specific scripts and should remain regression siblings, not generic terminal cases.
- Actor classes `1200373`-`1200375` still have only class/appearance/GM model evidence; the current SQL snapshot has no spawn rows for them.
- Local `RaidDungeonWarp.lua` and the C# return helper are present; actor binding remains gated on captured/seeded transporter placement.
- Recovered `PlaceDrivenCommand`/`24301` is the instance-raid touch lane for command `30004`, but local `PlaceDrivenCommand.lua` is not yet a safe transporter bridge; it still primarily handles gathering/push behavior and needs cleanup after capture.

## 2026-06-20 Object Route Audit

- Presence split is now clearer: `GimmickTerminal`, `GimmickWarp`, `GimmickExitRect`, `RaidDungeonWarp`, `RaidDungeonLight`, `RaidDungeonBarrier`, `RaidDungeonPoster`, `RaidDungeonExit`, `InstanceRaidExit`, `PrivateAreaPastExit`, and `RaidDungeonRect` exist locally, but only Toto-Rak photocells/barriers and `PrivateAreaPastExit` have strong binding proof today.
- `TalkCommand` must not generic-route Toto-Rak `RaidDungeonLight`, `RaidDungeonBarrier`, or `RaidDungeonPoster` into `GimmickTerminal`; those are object-owned state machines with photocell count, barrier animation, and poster row behavior.
- `RaidDungeonWarp` is not `GimmickWarp` or `GimmickTerminal`: it has text bank `6781/raidDungeonWarp`, scheduler `67493888`, prompt shape `askExtendWidget(self, 2, 2, 1, 2)`, and a content-return helper.
- `GimmickWarp` stays separate for generic warp/quicksand prompts: text bank `10112/gimmickWarp`, mode rows `1-3`, `4-6`, `7-9`, and quicksand message `52067`.
- Exit rectangles are push/notice/rect-owned, not talk-owned by default: `PrivateAreaPastExit`, `GimmickExitRect`, `RaidDungeonExit`, and `InstanceRaidExit` need separate movement/cleanup validation.
- Recovered but locally absent adjacent raid objects remain `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, and `InstanceRaidTreasureBox`; keep treasure/headcount work out of generic terminal routing.

## 2026-06-21 Transport/Terminal Audit

- Real movement surfaces are `RaidDungeonWarp`, `GimmickWarp` with explicit configured `GMWP|...` route data, exit rectangles, airship attendants, and ferry doors. `GimmickTerminal` is read-only text only.
- `1200373..1200375` remain visual/model leads only: class rows, appearance `20988`, and GM model group `988`, but no spawn rows or owner captures. Do not bind transporter behavior to them until a real EventStart owner or explicit seeded placement is proven.
- Terminal routing must capture true target ownership. Required command lanes remain `24101` TalkCommand, `24301` PlaceDriven/touch, `24228` WidgetOpen, and `24302` ContentCommand; none should become a broad transporter fallback.
- `RaidDungeonWarp` should execute only with supported private content and a saved return point, or the narrow Toto-Rak private-zone fallback to public entrance. Keep return-point exit, missing-return fallback, and sibling Toto-Rak object scripts in the regression set.
- Do not add `24301/30004` transporter handling until real transporter touch params are captured and local `PlaceDrivenCommand` cleanup/debug hazards are fixed.
## Surface Split

| surface | client_class | text_bank | prompt_api | visual_or_scheduler | local_status | adapter_decision |
| --- | --- | --- | --- | --- | --- | --- |
| RaidDungeonWarp | NpcBaseClass | 6781/raidDungeonWarp | askExtendWidget(self, 2, 2, 1, 2) | _runCharaScheduler(67493888) | implemented at Data/scripts/base/chara/npc/object/RaidDungeonWarp.lua | Implement as its own object script; do not route through generic GimmickWarp. |
| GimmickWarp | GimmickNpcBaseClass | 10112/gimmickWarp | desktopWidget:askForEventMode(..., row set by mode 1/2/3) | _setGroundOn(false) | implemented at Data/scripts/base/chara/npc/gimmick/GimmickWarp.lua | Keep separate for generic magitek/quicksand prompt objects; not the dungeon RaidDungeonWarp object. |
| GimmickTerminal | GimmickNpcBaseClass | 10096/gimmickTerminal | worldMaster:say(row) | none | implemented at Data/scripts/base/chara/npc/gimmick/GimmickTerminal.lua | Use only for read-only terminals; not for photocell/barrier/transporter state. |
| RaidDungeonLight | NpcBaseClass | raidDungeonLight | askYesNo | despawn on collect locally | implemented | Regression sibling; leave object-specific. |
| RaidDungeonBarrier | NpcBaseClass | raidDungeonBarrier | eventTalkRead/askYesNo | PlayMapObjAnimation('hide') locally | implemented | Regression sibling; leave object-specific. |
| RaidDungeonPoster | NpcBaseClass | raidDungeonPoster | eventTalkRead(index) | none | implemented | Regression sibling; leave object-specific. |

## Actor Binding Leads

| actor_class_id | actor_path | appearance_payload | gm_bg_model_group | spawn_rows_found | binding_status | contract |
| --- | --- | --- | --- | --- | --- | --- |
| 1200373 | ~~~magitek???~~~ | 20988 | 988 | 0 | visual_lead_only | Do not bind production transporter logic until an EventStart owner or explicit seeded spawn confirms placement. |
| 1200374 | ~~~magitek???~~~ | 20988 | 988 | 0 | visual_lead_only | Same visual family as 1200373; likely a device variant, but no current SQL spawn confirms behavior. |
| 1200375 | ~~~magitek???~~~ | 20988 | 988 | 0 | visual_lead_only | Same visual family as 1200373/1200374; hold for capture or controlled seed. |

## Exit Helper Contract

| component | current_evidence | contract | open_question |
| --- | --- | --- | --- |
| CanUseRaidDungeonWarp helper | Recovered askYesNo takes an enabled boolean; disabled says raidDungeonWarp row 1. | Add a public WorldManager helper or Player helper that returns true only when the player is in a supported content/private area and a return point/... | Whether non-content public Magitek devices should use generic GimmickWarp instead. |
| UseRaidDungeonWarp helper | PrivateAreaContent.TryGetReturnPoint owns the safe return destination; DoZoneChange clears content re-entry when leaving runtime content. | Read return point from current PrivateAreaContent, then call DoZoneChange with that return point. Let DoZoneChange unregister/clear the re-entry ti... | Whether voluntary dungeon exit should set a re-entry/content timer or leave timing to content completion/expiry. |
| Toto-Rak fallback | WorldManager has TotorakEntranceZoneId=154 and exit coords 835.642,-12.682,643.485 rot 2.502. | If no return point exists but the player is in Toto-Rak zone 159 private content, fall back to the known public entrance coordinates and clear stal... | Live transporter may return to current content entrance or public entrance depending actor placement. |
| Lua object script | Local sibling scripts call client functions, then server helpers, then EndEvent. | Create RaidDungeonWarp.lua with init false,false,0,0; on event, compute enabled, call activateWarpDevice/askYesNo(enabled), and on choice 1 call Us... | Whether scheduler 67493888 should run before disabled row 1 or only for enabled devices. |
| Actor binding | 1200373-1200375 have class/appearance/GM model evidence, but no spawn rows. | Bind only captured owner classes or explicit seeded spawns; log owner actor class/path/unique id during probes. | Which of the three variants is entrance, exit, or inactive visual. |

## Local Lua Shape

| step | lua_surface | recommended_shape | reason |
| --- | --- | --- | --- |
| 1 | init | return false, false, 0, 0 | Matches local RaidDungeonLight/Barrier/Poster object scripts. |
| 2 | enabled gate | local enabled = GetWorldManager():CanUseRaidDungeonWarp(player, npc) | Recovered askYesNo accepts true/false and row 1 is the disabled transporter message. |
| 3 | visual activation | if enabled then callClientFunction(player, 'activateWarpDevice') end | Scheduler 67493888 is specific to RaidDungeonWarp; disabled scheduler timing needs a small probe. |
| 4 | choice prompt | local choice = callClientFunction(player, 'askYesNo', enabled) | Enabled prompt uses askExtendWidget(self, 2, 2, 1, 2); disabled path says row 1 and returns nil. |
| 5 | server exit | if choice == 1 then GetWorldManager():UseRaidDungeonWarp(player, npc) end | Destination and return-point cleanup belongs in C# where PrivateAreaContent and DB re-entry state are available. |
| 6 | event close | player:EndEvent() | Matches local sibling object scripts after prompt/server action. |

## Prompt Text Rows

| source | row_id | english |
| --- | --- | --- |
| raidDungeonWarp | 1 | The magitek transporter does not appear to be functioning. |
| raidDungeonWarp | 2 | Activate the magitek transporter? |
| raidDungeonWarp | 3 | Yes. |
| raidDungeonWarp | 4 | No. |
| gimmickWarp | 1 | Activate the magitek transporter? |
| gimmickWarp | 2 | Yes. |
| gimmickWarp | 3 | No. |
| gimmickWarp | 4 | The quicksand here appears to be flowing in the direction of [@SHEETEN(xtx/placeName,2,$E8(1),1,1)]. Jump in? |
| gimmickWarp | 5 | Yes. |
| gimmickWarp | 6 | No. |
| gimmickWarp | 7 | The quicksand here appears to be flowing in the direction of [@SHEETEN(xtx/placeName,2,$E8(1),1,1)]. Jump in? |
| gimmickWarp | 8 | Yes. |
| gimmickWarp | 9 | No. |
| gimmickTerminal | 1 | The terminal appears to have been deactivated. |
| gimmickTerminal | 2 | The terminal is emitting an eerie glow... |
| raidDungeonLight | 1 | Place the photocell in your pack? |
| raidDungeonLight | 2 | Yes. |
| raidDungeonLight | 3 | No. |

## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | EventStart owner capture | Interact with the in-dungeon Magitek transporter and log owner actor class, path, unique id, zone/private area, event type, trigger, `24301` params, and any command `30004` state. | Confirms or rejects 1200373/1200374/1200375 as the real binding and proves whether PlaceDrivenCommand is the entry path. |
| 2 | Enabled prompt smoke | Seed/capture one RaidDungeonWarp object, call activateWarpDevice and askYesNo(true). | Scheduler 67493888 plays and prompt row 2 returns choice 1/2. |
| 3 | Disabled prompt smoke | Call askYesNo(false) on the same object without server exit. | Client says row 1 and returns nil; scheduler behavior is confirmed. |
| 4 | Return point exit | Enter Toto-Rak content, use transporter with a saved PrivateAreaContent return point. | Player zones to saved return point, content re-entry ticket clears, party/content state remains coherent. |
| 5 | Fallback exit | Force missing return-point state inside Toto-Rak private zone and use helper in debug mode. | Player lands at zone 154 fallback coords 835.642,-12.682,643.485 rot 2.502, with stale ticket cleared. |
| 6 | Sibling regression | Use photocell, barrier, poster after adding RaidDungeonWarp. | 1200226/1200228/poster flows still hit their object-specific scripts and state. |
| 7 | PlaceDriven cleanup branch | After capture, remove local debug/lowercase-end risks and add only the proven `30004` transporter branch. | Touch command exits cleanly and does not hijack gathering/push, exit rectangles, Toto-Rak objects, or generic terminal behavior. |

## 2026-06-21 Binding Guard Update

- Treat `UseRaidDungeonWarp` Toto-Rak fallback as a safety helper, not proof of retail transporter placement. A real transporter still needs owner actor class, unique id, zone/private-area, route/destination, and event type capture.
- `1200373`, `1200374`, and `1200375` should stay visual-only until capture or controlled seeded spawns prove which variant is active, inactive, entrance, or exit.
- `RaidDungeonWarp` and `GimmickWarp` share magitek wording but are separate recovered surfaces. `RaidDungeonWarp` owns the disabled/activate prompt; `GimmickWarp` owns generic route/quicksand prompts.
- Do not add `30004` or `PlaceDrivenCommand` behavior broadly. Only the captured transporter owner/actor branch should be allowed, and it must not intercept gathering, object push, exit rectangles, Toto-Rak photocells/barriers, or read-only terminals.

## Generated Files

- `source_inventory.csv` (41 rows)
- `source_term_hits.csv` (335 rows)
- `function_contracts.csv` (80 rows)
- `surface_split_contract.csv` (6 rows)
- `actor_binding_leads.csv` (3 rows)
- `exit_helper_contract.csv` (5 rows)
- `local_lua_shape.csv` (6 rows)
- `prompt_text_rows.csv` (22 rows)
- `probe_queue.csv` (6 rows)
