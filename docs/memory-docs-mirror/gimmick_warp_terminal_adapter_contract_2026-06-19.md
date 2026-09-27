# Gimmick Warp / Terminal Adapter Contract - 2026-06-19

Outputs live in `tools/outputs/lpb/gimmick_warp_terminal_adapter_contract_20260619`.

## High-signal findings

- Source coverage: 48/48 expected sources are present.
- `GimmickNpcBaseClass` stores a data-driven `talkRange` and forwards remaining init args to `initForGimmick(...)`; local generic scripts should preserve that shape.
- `GimmickTerminal` is row-driven read-only text from `10096/gimmickTerminal`, not a stateful dungeon terminal.
- `GimmickWarp` has three prompt modes: mode `1` magitek transporter text, mode `2` quicksand direction, and mode `3` quicksand path/route text.
- The local generic warp bridge only moves when a configured route is present; inline test routes use `GMWP|mode|placeNameId|zone|privateArea|privateAreaType|x|y|z|rotation|spawnType`.
- `RaidDungeonWarp` remains separate from generic `GimmickWarp`: it uses text `6781`, scheduler `67493888`, and a content-return style exit helper.
- Local generic gimmick bridges are present for terminal, warp, warp rect, exit, exit rect, poison cure, and treasure box; treasure box remains partial until non-guildleve key-item reward tables are recovered.
- Actor classes `1200373`-`1200375` are still visual/default-talk leads only; no current SQL spawn rows prove a generic or dedicated transporter binding.
- Generic `/Chara/Npc/Gimmick/...` SQL bindings are absent in the checked SQL tables, so local generic gimmick scripts exist but are not production-bound yet.
- Local `GimmickMapObjBaseClass` and map-object gimmick variants are still stubs compared with recovered scheduler behavior; implement any scheduler shim narrowly and only after a bound object proves it needs that path.

## 2026-06-21 Magitek Split Update

- Dedicated dungeon magitek transporter work belongs to `RaidDungeonWarp`, not `GimmickTerminal`. `GimmickTerminal` remains say-only text rows `1/2` from `10096/gimmickTerminal`.
- `GimmickWarp` is still generic configured-route prompt logic. Movement must come from a proven `GMWP`-style route or unique-id mapping, not from actor class `1200373..1200375` alone.
- `PlaceDrivenCommand` / `24301` / `30004` is capture-only for now. Local `PlaceDrivenCommand.lua` is gathering/push-oriented and has cleanup/debug hazards; add no transporter behavior until real touch owners and variation args are captured.
- Probe fields for any magitek/generic warp candidate: actor class/path, unique id, event type, command id, variation/subvariation, push data, map-object layout/instance, route/destination key, and private-area/content return point.

## Surface Split

| surface | client_contract | local_status | adapter_contract | not_this |
| --- | --- | --- | --- | --- |
| GimmickNpcBaseClass | initForEvent(talkRange, ...) sets gimmickNpcWork.talkRange and calls initForGimmick(...); getLimitedDistanceForTalk returns that range. | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickNpcBaseClass.lua as a shared helper; binding and exact askForEventMode parity remain unpr... | Preserve talkRange/init args in any local generic gimmick wrapper. | Normal fixed object init without args. |
| GimmickTerminal | load 10096/gimmickTerminal; eventTalkTerminal(row) calls worldMaster:say(row). | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickTerminal.lua. | Read-only terminal only; row must be supplied by binding/unique script data. | Stateful Toto-Rak Light/Barrier/Poster or RaidDungeonWarp. |
| GimmickWarp | load 10112/gimmickWarp; askWarp(mode, placeNameId) uses askForEventMode rows by mode. | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickWarp.lua with explicit configured-route gating. | Generic prompt wrapper; server movement requires explicit destination mapping by unique id/trigger/mode. | Dedicated RaidDungeonWarp exit helper. |
| GimmickWarpRect | init only: _setGroundOn(false). | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickWarpRect.lua as a configured trigger companion. | Treat as invisible/rect trigger companion; destination still comes from server trigger mapping. | Talkable object with fixed prompt row. |
| GimmickExitRect | load 10064/gimmickExitRect; two-stage askExitWithPlaceNameId(placeNameId). | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickExitRect.lua with explicit placeNameId gating. | Use for content exit rectangles that require place-name and re-entry warning prompts. | Toto-Rak magitek transporter prompt. |
| GimmickPoisonCure | load 10080/gimmickPoisonCure; mode 1 fruit rows 1/2/3, mode 2 root rows 5/6/7. | Implemented at Data/scripts/base/chara/npc/gimmick/GimmickPoisonCure.lua; clears known Poison/Envenom status ids after prompt acceptance. | Small prompt bridge plus server status/effect resolution after yes. | Terminal/warp. |
| GimmickTreasureBox | map marker temp flag; askKeyItemUse(itemId) uses world rows 60023/60024/60025. | Partial local bridge at Data/scripts/base/chara/npc/gimmick/GimmickTreasureBox.lua; guildleve chest resolver only, generic key-item reward table st... | Bridge separately to reward/key-item validation; covered by reward/chest work. | Read-only terminal. |

## Prompt Modes

| surface | mode | main_row | choice_rows | prompt | extra_arg | server_contract |
| --- | --- | --- | --- | --- | --- | --- |
| GimmickWarp | 1 | 1 | 2 yes, 3 no | Activate the magitek transporter? | placeNameId usually zero/unused | Only route to a generic configured destination, not the RaidDungeonWarp content-return helper unless binding proves it is the same object. |
| GimmickWarp | 2 | 4 | 5 yes, 6 no | Quicksand flowing in direction of placeNameId; jump in? | placeNameId passed to askForEventMode for xtx/placeName substitution | Requires explicit quicksand destination mapping; also consider worldMaster 52067 jump message. |
| GimmickWarp | 3 | 7 | 8 yes, 9 no | Quicksand connected to path leading to placeNameId; jump in? | placeNameId passed to askForEventMode | Same as mode 2, but text semantics imply a route/path rather than only direction. |
| GimmickTerminal | row 1 | 1 | none | The terminal appears to have been deactivated. | terminal row id | Say-only terminal; end event after display. |
| GimmickTerminal | row 2 | 2 | none | The terminal is emitting an eerie glow... | terminal row id | Say-only terminal; no stateful dungeon behavior. |
| GimmickExitRect | two-stage exit | 1 then 4 | 2/3 then 5/6 | Leave placeNameId, then confirm re-entry warning. | placeNameId | Pair with content exit helper and timer/re-entry policy. |

## Actor Binding Leads

| actor_class_id | actor_path | appearance_payload | variant_field | default_talk_hint | spawn_rows_found | binding_read |
| --- | --- | --- | --- | --- | --- | --- |
| 1200373 | ~~~magitek???~~~ | 20988 | 1024 | present in populace.csv | 0 | Generic GimmickWarp mode 1 or RaidDungeonWarp visual lead; not confirmed. |
| 1200374 | ~~~magitek???~~~ | 20988 | 2048 | present in populace.csv | 0 | Same model family, likely a variant; no spawn placement in SQL. |
| 1200375 | ~~~magitek???~~~ | 20988 | 3072 | present in populace.csv | 0 | Same model family, likely a variant; no spawn placement in SQL. |

## Local Gap Matrix

| path | exists | status | contract |
| --- | --- | --- | --- |
| Data/scripts/base/chara/npc/gimmick/GimmickTerminal.lua | True | implemented | Read-only terminal eventTalkTerminal(row). |
| Data/scripts/base/chara/npc/gimmick/GimmickWarp.lua | True | implemented | Generic askWarp(mode, placeNameId) prompt plus configured destination. |
| Data/scripts/base/chara/npc/gimmick/GimmickWarpRect.lua | True | implemented | Rect/trigger helper; no prompt by itself. |
| Data/scripts/base/chara/npc/gimmick/GimmickExit.lua | True | implemented | Ground-off generic exit companion; no prompt by itself. |
| Data/scripts/base/chara/npc/gimmick/GimmickExitRect.lua | True | implemented | Two-stage exit prompt with placeNameId. |
| Data/scripts/base/chara/npc/gimmick/GimmickPoisonCure.lua | True | implemented | Morbol fruit/root prompt and server effect. |
| Data/scripts/base/chara/npc/gimmick/GimmickTreasureBox.lua | True | partial | Key-item chest prompt, separate reward resolver. |
| Data/scripts/base/chara/npc/object/RaidDungeonLight.lua | True | implemented | Regression sibling; do not genericize. |
| Data/scripts/base/chara/npc/object/RaidDungeonBarrier.lua | True | implemented | Regression sibling; do not genericize. |
| Data/scripts/base/chara/npc/object/RaidDungeonPoster.lua | True | implemented | Regression sibling; do not genericize. |

## Implementation Order

| priority | component | contract | verification |
| --- | --- | --- | --- |
| 1 | Binding capture | Capture owner class/path/unique id/event type for real generic terminals/warps before broad binding, including `24301` touch params where applicable. | Logs distinguish 1200373-1200375 and any actual gimmick class paths. |
| 2 | Gimmick base wrapper | Preserve talkRange and init args for local generic gimmick scripts. | Terminal and warp respect limited talk distance and row/mode args. |
| 3 | GimmickTerminal | Add read-only terminal path that calls eventTalkTerminal(row), with row default/gate from binding data. | Rows 1/2 display and do not alter dungeon state. |
| 4 | GimmickWarp | Add askWarp(mode, placeNameId) bridge; move only through explicit unique-id destination table or inline GMWP\|mode\|placeNameId\|zone\|privateArea\|priv... | Mode 1/2/3 prompts return boolean and route to configured destinations only. |
| 5 | Exit/rect helpers | Keep GimmickExitRect and GimmickWarpRect separate from talkable objects; pair with push/rect event triggers. | Rect events can prompt/exit without creating visible object-talk regressions. |
| 6 | Regression split | Keep RaidDungeonWarp and Toto-Rak Light/Barrier/Poster separate from generic gimmicks. | Existing photocell/barrier/poster and dedicated transporter probes still hit their own scripts. |

## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | Generic terminal row | Bind a controlled object to GimmickTerminal and call eventTalkTerminal with rows 1 and 2. | Client displays deactivated/glow rows and event closes with no state change. |
| 2 | GimmickWarp mode 1 | Call askWarp(1, 0) on a controlled object. | Prompt uses rows 1/2/3 and returns true only on yes. |
| 3 | GimmickWarp quicksand modes | Call askWarp(2, placeNameId) and askWarp(3, placeNameId). | Prompts substitute the place name and use rows 4/5/6 and 7/8/9. |
| 4 | Quicksand server mapping | Trigger a configured quicksand source and emit worldMaster 52067 before moving. | Message and destination match the unique-id destination table. |
| 5 | ExitRect two-stage ask | Call askExitWithPlaceNameId(placeNameId). | Two prompts appear in sequence; true only when both choices are yes. |
| 6 | Regression siblings | Run RaidDungeonWarp, Light, Barrier, Poster after generic gimmick scripts exist. | No stateful object is hijacked by GimmickTerminal/GimmickWarp. |

## Generated Files

- `source_inventory.csv` (48 rows)
- `source_term_hits.csv` (265 rows)
- `function_contracts.csv` (60 rows)
- `surface_split_contract.csv` (7 rows)
- `prompt_mode_contract.csv` (6 rows)
- `actor_binding_leads.csv` (3 rows)
- `local_gap_matrix.csv` (10 rows)
- `prompt_text_rows.csv` (34 rows)
- `implementation_contract.csv` (6 rows)
- `probe_queue.csv` (6 rows)
