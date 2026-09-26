# Airship/Ferry Decomp Open Questions - 2026-06-21

> Ferry update, 2026-09-16: both native vessel timelines and the notice/lifecycle
> protocol are now audited in [ferry_cutscenes_2026-09-16.md](ferry_cutscenes_2026-09-16.md).
> It supersedes the ferry dispatch/disabled-movie status below. The offline
> correction still requires both-direction live playback and skip acceptance.

## 2026-08-24 City-Airship Closure

The city-airship portion is no longer open. A fresh installed-client LPB decode,
six-scene PWIB actor/placement census, and live three-city loop established the
complete call path:

```text
attendant noticeEvent
  -> delegateEvent(player, DftSrt, eventDeparture, departure, arrival)
  -> fade out
  -> startNQCutScene(departure, 1)
  -> startNQCutScene(arrival, 1)
  -> fade in after warp
  -> server route completion
```

The earlier direct attendant-owned `startNQCutScene` experiment failed because
that method belongs to `QuestBaseClass`; `PopulaceFlyingShip` inherits
`NpcBaseClass`. `DirectorBaseClass.delegateEvent` supplies the required owner
transition into `DftSrt`. Fresh decompilation of all involved LPBs matched the
previous recovered sources byte-for-byte.

All six `zep0` assets were hash-validated and decoded. Their 77 actor records
and 74 placement records independently bind the scenes to the three city
airship casts, actor `1200090` (`Airship`), and pilot `1001781` (`sentyou`).
The detailed evidence is in
`tools/outputs/lpb/airship_decomp_20260824/README.md`. Historical statements
below about missing city-airship playback proof or a missing local
`DftSrt.eventDeparture` caller are superseded. Ferry/ocean routes remain a
separate open surface.

This note narrows the existing `airship_ferry_transport_contract_2026-06-19.md`
to the specific transit questions: menus, visible dock/route animation, cutscene
handoff, and whether travel zones such as `art_s0` or Rhotano/ocean ship zones
are actually wired.

## Latest Helper-Wave Checkpoint

Three independent read-only helper passes confirmed the current boundary:

- Menu/route flow: recovered `PopulaceFlyingShip.eventIn` only returns city
  choices `1 = Limsa`, `2 = Gridania`, `3 = Ul'dah`; local `WorldManager`
  alone maps those choices to routes `101-106`.
- Resource/layout flow: `801-805`, `art_*_air01`, `srt_o0*`, and
  `ocn_o0_sip01` prove BG/layout resource wiring, schedulers, FCurves, VFX,
  ship/interior assets, and aliasing between resource tokens. They still do
  not prove route endpoints, cutscene names, or server zone-transfer behavior.
- Native/cutscene flow: no recovered or native static table was found that
  links route ids, airship-pass item ids, region/resource ids, or zone ids to
  concrete travel cutscene names. `DftSrt.eventDeparture(A3, A4)` remains the
  best ferry cutscene-shaped helper, but its concrete scene args are still
  unrecovered.
- Endpoint flow: SQL confirms the dock/route-land surfaces, not the route
  endpoint table. Route ids `101-106` and `201-203` are local `WorldManager`
  wiring with `fallback_marker` coordinates; `301/302` remain explicitly
  `unrecovered`.
- Default-talk flow: zone `200` plus actor class `1001291` can plausibly reach
  static actor `DftSrt`, but the repo-local callable path currently stops at
  the inert `DftSrt.lua` stub. No local path calls
  `DftSrt.eventDeparture(A3, A4)` or supplies the dynamic scene args.
- Cutscene asset flow: the first focused travel-name directory filter surfaced
  `man0l604` and `man0l605`, which are valid scene keys but currently classify
  as `Man0l1` quest scenes rather than service-travel scenes. A wider helper
  pass found a better airship-service candidate family:
  `zep0g000/010`, `zep0l000/010`, and `zep0u000/010`. These exist as physical
  cut assets and embed airship-area NPC/resource names, but they are not yet
  proven retail service-travel calls.
- Follow-up helper wave: airship binding, ferry `DftSrt` binding, and
  packet/native bridge searches found no new static route/cutscene table. They
  did confirm the current split: recovered menus return choices, local
  `WorldManager` creates route ids/placeholders, `DftSrt.eventDeparture`
  remains dynamic with no caller, and the midstream scheduler probe belongs on
  `0x0130` rather than `0x00D9`.
- Live-probe helper pass produced concrete commands for scheduler phase testing,
  real attendant departure capture, and ferry steersman default-talk capture.
  Those probes are now the shortest path to separating "client has the asset"
  from "retail travel actually invokes it."
- Second helper wave refined the `zep0*` lead: `g/l/u` map strongly to
  Gridania/Limsa/Ul'dah city context, while `000` vs `010` appears more like
  airship-side vs landing/town-side phase variants than six directed route
  pairs. The same wave again found no concrete ferry `DftSrt.eventDeparture`
  caller or `A3/A4` scene-key binding.
- Two GM probes now exist for cutscene validation:
  `!testcutscene <sceneKey> [nq|delegate|direct] [arg]` tests whether a
  basename starts as an NQ cutscene at all, while
  `!testairshipcs <sceneKey> [actorId|uniqueId|target]` sends the key through
  the actual `PopulaceFlyingShip` `transportDeparture` path. Both are GM-only.
- Third helper wave found no `zep0*` binding outside physical cut assets and
  confirmed that `airport100428`/`elv0*` hits are elevator/quest scenes, not
  service-airship route evidence. It also recommended against adding a ferry
  cutscene command until the `DftSrt.eventDeparture(A3, A4)` binding and scene
  args are recovered.

## Known Menu Surfaces

### Airship attendant menu

Recovered client surface:
`tools/outputs/lpb/airship_ferry/chara/npc/populace/populaceflyingship/populaceflyingship.lua`

Local adapter:
`Data/scripts/base/chara/npc/populace/PopulaceFlyingShip.lua`

Known behavior:

- `PopulaceFlyingShip.eventIn(player, ticketState, _, fare)` is the booking UI.
- It loads text group `7620` / `populaceFlyingShip` and shows the Highwind
  Skyways service menu, destination menu, fare/free-pass text, and confirmation.
- Destination return values are stable:
  - `1 = Limsa Lominsa`
  - `2 = Gridania`
  - `3 = Ul'dah`
  - `4`/`nil = cancel`
- Current-city choice is disabled by attendant actor class:
  - `1500003` Faezbroes, Limsa, disables choice `1`
  - `1500055` Lionnellais, Gridania, disables choice `2`
  - `1500208` Stangyth, Ul'dah, disables choice `3`
- `ticketState == true` is the free-ticket/free-pass path.
- `ticketState == nil` is the insufficient-funds path.
- Any other non-nil value is the normal paid path.
- `eventOut(player, 30010)` is the landing/exit/no-refund branch.
- The recovered client menu does not return a route id or zone id. It only
  returns the destination choice; local `WorldManager` maps that choice to a
  route id and fallback destination coordinates.
- Nearby default-talk files contain airship-attendant dialogue-only traps:
  `DftSea.defaultTalkWithFaezbroes_001`,
  `DftFst.defaultTalkWithLionnellais_001`, and
  `DftFst.defaultTalkWithHida_001` only run talk turn, chara scheduler, and one
  `say`. Local comments also mark those actor-class entries as "will not fire,
  not PplStd."; the service NPC actor classes bind to `PopulaceFlyingShip`, not
  `PopulaceStandard` default talk. These are not route/cutscene dispatch
  evidence.

Local route mapping:

| route | origin | choice | destination | current status |
| --- | --- | --- | --- | --- |
| 101 | Limsa `1500003` zone `133` | 2 | Gridania `155` | fallback coords |
| 102 | Limsa `1500003` zone `133` | 3 | Ul'dah `209` | fallback coords |
| 103 | Gridania `1500055` zone `155` | 1 | Limsa `133` | fallback coords |
| 104 | Gridania `1500055` zone `155` | 3 | Ul'dah `209` | fallback coords |
| 105 | Ul'dah `1500208` zone `209` | 1 | Limsa `133` | fallback coords |
| 106 | Ul'dah `1500208` zone `209` | 2 | Gridania `155` | fallback coords |

### Ferry steersman/default talk

Recovered client surface:
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/defaulttalk/dftsrt.lua`

Local adapter:
`Data/scripts/quests/dft/DftSrt.lua`

Known behavior:

- `defaultTalkWithPilot_001` is not a route-selection menu. It only says text
  row `1` from text group `69` / `dftSrt`.
- `eventDeparture` is the recovered cutscene-shaped helper for this surface:
  fade out, `startNQCutScene(A3, 1)`, optional `startNQCutScene(A4, 1)`, then
  fade in after warp.
- Cutscene indexing classifies quest `110544` / `Small Talk` / `Dftsrt`
  `eventDeparture` as a dynamic scene entrypoint with `direct_scene_keys = 0`.
  The recovered arguments remain symbolic `A3` and `A4`; the index does not
  recover concrete scene ids.
- `dftSrt` text rows include the passenger ship flavor/status lines:
  safe-crossing, casting off, arriving in Limsa, and arriving in Vesper Bay.
- Zone `200` has region `805`, and local `Player.GetDefaultTalkQuest` maps
  region `805` to static actor `DftSrt`.
- Ferry steersman actor class `1001291` is spawned in zone `200` as
  `ferry_man_thantonocea` and `ferry_man_noceatothan`, with `talkDefault` and
  `noticeEvent` event conditions.
- Local/recovered default-talk dispatch is region -> `Dft*` static actor ->
  actor-class table -> client function name. `displayName` and text group are
  descriptive/data-facing; they are not dispatch keys in the recovered local
  path.
- `DftSea` and `DftFst` have actor-class default-talk maps. `DftSrt` does not
  have a recovered actor-class map here, so no table currently maps the ferry
  steersmen to `eventDeparture(A3, A4)`.

Current local blocker:

- `Data/scripts/quests/dft/DftSrt.lua` intentionally keeps this inert:
  `onTalk` only ends the event, and `IsQuestENPC` returns `false`.
- Because `IsQuestENPC` returns `false`, local `PopulaceStandard.talkDefault`
  never binds steersman class `1001291` to `DftSrt` despite zone `200` being
  region `805`.
- No recovered caller/data row has been found that supplies concrete
  `eventDeparture` args `A3` and `A4`.
- A fresh repo-local callable-path trace found no code path that currently
  reaches `DftSrt.eventDeparture(A3, A4)`. Local ferry routes do not set an
  on-board departure event, and `NativeFlowKey = "defaultTalkWithPilot_001"` is
  metadata only.
- Actor class `1001291` maps through `PopulaceStandard`, not directly to
  `DftSrt`, and the route-land map objects map to `MapObjShipRouteLand`
  scheduler logic rather than an `eventDeparture` caller.

### Ferry dock menu

Recovered client surface:
`tools/outputs/lpb/airship_ferry/chara/npc/mapobj/mapobjportdoor/mapobjportdoor.lua`

Local adapter:
`Data/scripts/base/chara/npc/mapobj/MapObjPortDoor.lua`

Known behavior:

- `MapObjPortDoor.eventIn(player)` asks to approach/enter the ferry docks.
- `MapObjPortDoor.eventOut(player)` asks to leave the ferry docks.
- Text group `175` / `mapObjPortDoor` confirms the actual access behavior:
  entering the dock area registers the player for the next scheduled ferry;
  leaving/removing the player from the dock area cancels that registration.
- Local `MapObjPortDoor.lua` calls the recovered client functions and then
  dispatches `GetFerryTransportRouteId` / `StartTransportRoute` or
  `ExitFerryAtCurrentEndpoint`.
- There is no implemented route id `200`. `200` is the ferry in-transit zone
  id (`sea1Cruise01`). Current local ferry route ids are `201`, `202`, `203`,
  and `204`.
- The 2026-08-25 completion pass keeps dock registration in the surface zone,
  transfers the player into the playable cruise zone at departure, and uses a
  nine-minute voyage before the destination transfer. Exact Western Thanalan
  dock and arrival transforms still require live-client correction.
- Ferry reservations are removed on disconnect or any unrelated zone/position
  change; only the scheduled dock-to-cruise transition preserves the passenger.
- Captured zone-172 transforms now replace stale zone-171 rows for Fiachre,
  Spiraling Path, Sylviel, Sami Gamduhla, and Gerland. Their existing `DftWil`
  mappings retain the recovered retail small-talk functions.
- Actor class `1001291` is now narrowly enrolled in `DftSrt`, enabling both
  directional steersmen's recovered pilot dialogue plus the authored casting-off
  and direction-specific arrival announcements.

Local ferry route mapping:

| route | origin | destination | current status |
| --- | --- | --- | --- |
| 201 | Limsa ferry dock zone `230` | Western Thanalan zone `172` | fallback coords |
| 202 | `sea1Cruise01` zone `200`, Noscea-to-Thanalan side | Western Thanalan zone `172` | fallback coords |
| 203 | `sea1Cruise01` zone `200`, Thanalan-to-Noscea side | Limsa ferry dock zone `230` | fallback coords |
| 204 | Western Thanalan zone `172` | Limsa ferry dock zone `230` | fallback coords |
| 301 | `ocn0Cruise01` `ship_route_1`, `5141:201` anchor | unrecovered | blocked |
| 302 | `ocn0Cruise01` `ship_route_2`, `5141:201` anchor | unrecovered | blocked |

Endpoint-evidence checkpoint:

- SQL confirms the surface actors used by these flows: city airship shipports,
  `limsa_shipport`, `ferry_route_thantonoscea`, and
  `ferry_route_nosceatothan`.
- SQL does not confirm the route ids themselves. Those ids are local
  `WorldManager` definitions, and the recovered factories stamp the known
  endpoint coordinates as `fallback_marker`.
- `5141:201` exists locally only as orphan map-object rows with actor id `0`;
  it has no checked-in spawn row, zone binding, actor class, unique id, or
  coordinates.

## Known Visual Schedulers

Recovered client surfaces:

- `MapObjShipPort`
- `MapObjShipRouteLand`
- `ObjectShip`
- `ObjectAirShip`

Local adapters:

- `Data/scripts/base/chara/npc/mapobj/MapObjShipPort.lua`
- `Data/scripts/base/chara/npc/mapobj/MapObjShipRouteLand.lua`
- `Data/scripts/base/chara/npc/object/ObjectShip.lua`
- `Data/scripts/base/chara/npc/object/ObjectAirShip.lua`

Known behavior:

- These are visual scheduler surfaces, not route-selection menus.
- `MapObjShipPort` drives the port/landing visuals.
  - Layouts `131`, `321`, `431`: 300-second cycle, `stt0` near half-cycle
    approach/start and `end0` near the half-cycle end window.
  - Layouts `196`, `496`: 600-second cycle, first half `spot`, second half
    `spin`.
  - Other layouts: 300-second cycle, first half `spin`, second half `spot`.
- `MapObjShipRouteLand`
  - Layout `5145`: 600-second cycle, plays `fdot` before second `240`.
    The recovered offset is `240 - (serverTime % 600)`, so this is a
    remaining-time offset, not elapsed time from zero.
  - Other route-land layouts: plays `fdin` from second `360` onward. The
    recovered offset is `(serverTime % 600) - 360`.
- `ObjectShip`
  - Actor classes `1200020` and `1200021` run chara scheduler `67731456`.
  - Local currently approximates this with `PlayMapObjAnimation("ship")`.
- `ObjectAirShip`
  - Recovered script only calls `_setGroundOn(false)`.
  - No route selection or cutscene handoff was recovered from this class.

## Installed Client Region Resource Data

The checked-in DAT CSV export missed the internal resource-token bridge, but
the installed 1.23b client still has it:

`C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\03\C0\00\00.DAT`

This table identifies itself as `RegionResourceData`. Native code treats each
row as `0x30` bytes:
`u32 id, u32 flags, u32 datKey, u32 count/type, char[16] resourceToken,
u32 meta20, u32 meta24, u32 meta28, u32 meta2C`. Rows start at offset `0x40`.

The extractor for this table is:
`tools/extract_region_resource_data.py`

Current generated outputs:

- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/region_resource_all_rows.csv`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/region_resource_targets.csv`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/art_air01_asset_scan.csv`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/native_region_resource_loader_notes.md`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/native_bg_scheduler_bridge_notes.md`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/installed_client_travel_string_scan_notes.md`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/native_travel_numeric_binding_scan_notes.md`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/map_layout_resource_payload_notes.md`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/shipport_owner_layouts.csv`
- `tools/outputs/lpb/airship_ferry_region_resource_data_20260621/srt_ocn_resource_scan.csv`

Related repeatable layout dump:

- `tools/dump_map_layout_resource_data.py`
- `tools/outputs/lpb/map_layout_resource_data_20260621/summary.csv`

Important decoded rows:

| id | token | datKey | meaning in this pass |
| --- | --- | --- | --- |
| 801 | `art_s0` | `0x8B380000` | airship-over La Noscea family |
| 5101 | `art_s0_low` | `0x8B380000` | low/detail child |
| 5102 | `art_s0_air01` | `0x8B380001` | airship child |
| 802 | `art_r0` | `0x8B450000` | airship-over Coerthas family |
| 5131 | `art_r0_low` | `0x8B450000` | low/detail child |
| 5132 | `art_r0_air01` | `0x8B450001` | airship child |
| 803 | `art_f0` | `0x8B520000` | airship-over Black Shroud family |
| 5121 | `art_f0_low` | `0x8B520000` | low/detail child |
| 5122 | `art_f0_air01` | `0x8B520001` | airship child |
| 804 | `art_w0` | `0x72AD0000` | airship-over Thanalan family |
| 5111 | `art_w0_low` | `0x72AD0000` | low/detail child |
| 5112 | `art_w0_air01` | `0x72AD0001` | airship child |
| 805 | `srt_o0` | `0x89ED0000` | Strait/Merlthor ferry family |
| 5145 | `srt_o0_low_w0` | `0x89ED0000` | ferry route-land child |
| 5144 | `srt_o0_low_s0` | `0x89ED0001` | ferry route-land child |
| 5141 | `srt_o0_low` | `0x89ED0002` | shared/low ferry child |
| 5142 | `srt_o0_lin01` | `0x89ED0003` | ferry line child |
| 5143 | `srt_o0_lin02` | `0x89ED0004` | ferry line child |
| 111 | `ocn_o0` | `0x2B030000` | Rhotano/ocean family |
| 1081 | `ocn_o0_low` | `0x2B030000` | ocean low/detail child |
| 1001 | `ocn_o0_sip01` | `0x2B030001` | ship/ocean child |

This proves the `801-804 -> art_*` and `805 -> srt_o0` internal bindings, but
not that local server zones/routes should currently move players into them.
Display names are still a separate place-name layer. The airship display names
are inferred by token family and the normal base-region place-name mapping:
`art_s0 -> sea_s0 -> La Noscea`, `art_r0 -> roc_r0 -> Coerthas`,
`art_f0 -> fst_f0 -> Black Shroud`, and `art_w0 -> wil_w0 -> Thanalan`.

No production repo consumer of `RegionResourceData`, `datKey`, or
`resourceToken` was found in this pass; the only current repo consumers are this
extractor, docs, and generated CSVs. The installed native client consumer is now
partially identified in `ffxivgame.exe`: `RegionResourceData` string file/RVA
`0x00BE4A80` / VA `0x00FE4A80` has a direct code xref at file/RVA
`0x0039DA64` / VA `0x0079DA64`. The loader entry is VA `0x0079D900`.
Global `0x012C492C` is the DAT key `0x03C00000`, not the row container.

The loader validates table name/version, reads parent/root count at header
`+0x24`, starts rows at `+0x40`, and advances rows by `0x30`. Installed DAT
header `+0x24` is `61`; walking those 61 parents plus each parent row's
`+0x0C` child count consumes all `1089` physical rows. Parent/root objects are
stored on the loader's vector-like container at `loader + 0x08`; child objects
are stored on each parent object at `parent + 0xBC`. Native details are in
`native_region_resource_loader_notes.md`.

That native path sits near `MapLayoutResourceData`, `BgScheduler`, and related
BG resource strings, so this proves client BG/layout resource construction, not
server-side route selection. `datKey` maps directly as
`AA BB CC DD -> data\AA\BB\CC\DD.DAT`; examples include `0x8B380001 ->
data\8B\38\00\01.DAT`, `0x72AD0001 -> data\72\AD\00\01.DAT`, and
`0x89ED0000..0004 -> data\89\ED\00\00..04.DAT`.

The native xref trail has now been followed far enough for this travel
question. `0x0079D900` has one native call xref at `0x0062B27D`, inside a
`MapLayoutActor` vtable method. `0x0079DBB0` has one native call xref at
`0x00641A18`, inside a `LayoutBlockAABBQuadTree` vtable method. The loader
object is RTTI-named
`Application::Scene::Actor::Map::Resource::ResourceLoader`. These xrefs still
show layout/resource loading only: no route ids, no server zone ids, no transit
zone ids, and no cutscene names. Adjacent loader code classifies resource-token
suffixes like `_air`, `_lin`, `_csc`, and `_low` into resource-kind codes.

## What We Do Not Know Yet

### Airship dock/flyoff animation

We know the visible port scheduler names and timing windows, but not whether
the current local playback is frame-accurate.

Known now:

- Visible dock/flyoff is controlled by `MapObjShipPort` actor class `5900011`,
  not by `ObjectAirShip`. `ObjectAirShip` only calls `_setGroundOn(false)`.
- `MapObjShipPort` reads the map-object layout arg and runs
  `_runBgSchedulerFromMidstream("stt0"|"end0"|"spot"|"spin", offset)`.
- Native `_runBgSchedulerFromMidstream` confirms the recovered arg shape:
  scheduler name at arg index `0`, numeric offset at arg index `1`. The client
  multiplies the offset by `1000.0`, so recovered Lua offsets are seconds and
  native scheduler offsets are milliseconds/ticks.
- Current local `MapObjShipPort.lua` mirrors the scheduler-name selection and
  calls `RunMapObjScheduler(name, offset)` through the public
  `_runBgSchedulerFromMidstream` event-function bridge. It retains a frame-zero
  `PlayMapObjAnimation(name)` compatibility fallback if that bridge is rejected.

Important owner/layout bindings:

| spawn | zone | unique id | layout/instance | scheduler branch |
| --- | --- | --- | --- | --- |
| `3034` | `133` | `limsa_airship_shipport` | `131/7150` | `stt0`/`end0` window |
| `589` | `155` | `gridania_shipport` | `321/3294` | `stt0`/`end0` window |
| `287` | `209` | `uldah_mapshipport_1` | `431/3525` | `stt0`/`end0` window |
| `500` | `230` | `limsa_shipport` | `196/456` | `spot` then `spin` |
| `3223` | `172` | `thanalan_ferry_shipport` | `496/456` | `spot` then `spin` |
| `590` | `155` | `gridania_shipport2` | `391/2` | default `spin` then `spot` |
| `630` | `209` | `uldah_mapshipport_2` | `491/2` | default `spin` then `spot` |
| `729` | `200` | `ferry_route_thantonoscea` | `5144/201` | `fdin` |
| `730` | `200` | `ferry_route_nosceatothan` | `5145/252` | `fdot` |

Details are in `shipport_owner_layouts.csv`. The installed-client
`wil_w0_lin01` resource identifies the layout-496 vessel root as
`isgrp_000456`; spawn `3223` now binds that exact instance in zone 172.

Resolved implementation points:

- Recovered scripts call `_runBgSchedulerFromMidstream(name, offset)` and the
  local `Npc.RunMapObjScheduler` API now expresses that contract with a
  `0x0130` `RunEventFunctionPacket` against the live map-object owner.
- `0x00D9` remains unchanged. `PlayBGAnimation` is only the compatibility
  fallback, so scheduler offsets never collide with its 8-byte name field.
- The public bridge is used; `_runBgSchedulerFromMidstream_cpp` is not needed.
  `RunEventFunctionPacket` has the needed owner/event/function/Lua-param shape:
  trigger actor id, owner actor id, event type, event name, function name, then
  params. The current function-name field effectively leaves `0x20` bytes, so
  public `_runBgSchedulerFromMidstream` fits while
  `_runBgSchedulerFromMidstream_cpp` risks boundary/no-terminator trouble.
  `KickEventPacket` can establish event context but is not itself a function
  dispatch.
  If the client rejects that, this becomes packet/capture reverse work rather
  than a Lua-only wrapper.
- The smallest concrete probe is:
  `RunEventFunctionPacket(player.Id, liveMapObj.Id, "noticeEvent", 5,
  "_runBgSchedulerFromMidstream", ["spin", 30])`, using Lua param types
  string `0x2` and integer `0x0`. Use the live runtime map-object actor id as
  owner, not class id, spawn id, layout id, or instance id.
- A local GM probe command now exists for that packet shape:
  `!testbgscheduler <actorId|uniqueId|target> <scheduler> <offsetSeconds>`.
  It only targets live map-object NPCs already instantiated for the client,
  fixes the event to `noticeEvent`, caps offsets to `0..3600` whole seconds,
  and only calls public `_runBgSchedulerFromMidstream`.
- Current `LuaUtils` encodes the recovered string plus integral-second args.
  The scripts floor `os.time()` before deriving offsets, matching that packet
  contract and avoiding a speculative float encoding.
- Best first live targets are `limsa_shipport` `196/456` with `spot`/`spin`,
  `ferry_route_thantonoscea` `5144/201` with `fdin`, and
  `ferry_route_nosceatothan` `5145/252` with `fdot`.
- Layouts `131`, `321`, and `431` only emit `stt0` around cycle seconds
  `110-129` and `end0` around `140-159`; outside those windows, recovered
  script emits no scheduler call. Probes need to account for that timing.
- Executable MoonSharp contract coverage now verifies layouts `131`, `321`,
  `431`, `196`, `391`, `491`, `5144`, and `5145`, including activation-window
  boundaries, recovered offsets, and the legacy fallback. Layout `496` has no
  checked-in spawn and is covered by the same code branch as `196`. A live
  client observation is still needed to confirm the resource renders each
  scheduler visually as expected.
- The installed `art_*_air01` child files confirm airship model/layout content,
  not a route menu or destination table. `art_s0/r0/f0_air01` contain
  scheduler/FCurve blocks and strings like `sgrp_w_hikuutei` and
  `hikuutei_cabin`; `art_w0_air01` has the same airship layout strings but no
  `schedul`/`@FCURVE` string hits in this scan. No literal city, destination,
  route, landing, or dock strings were found in the `air01` files. Details are
  in `art_air01_asset_scan.csv`.

### Departure cutscene

The local contract is implemented; live-client presentation is not confirmed.

Current local behavior:

- `WorldManager` queues city-airship passengers on the recovered 300-second
  city-platform visual clock.
- Airship departure is cycle second `150`, aligned with the recovered city
  `end0` scheduler; route edges retain phase offsets `0/300/600`.
- At departure it fires `noticeEvent` with trigger `transportDeparture` and
  both origin/departure and destination/arrival scene keys.
- `PopulaceFlyingShip.lua` handles that local extension by calling
  and awaiting `startNQCutScene` for the two keys in recovered
  departure-then-arrival order, then completes the queued route. The
  server-owned 60-second arrival remains a fail-safe.
- Routes `101-106` use the installed `zep0*` matrix below. The former
  `airship_depart_*` symbolic placeholders are no longer sent.

Evidence gap:

- `startNQCutScene` expects a cutscene scene-key/filename basename such as
  `man0l604`, not a full `client/cut/...` path. Recovered
  `questbaseclass_common.lua` passes that key into
  `worldMaster:createCutScene`, `worldmaster.lua` creates a `CutScene` actor,
  and `cutscene.lua` stores the first init argument with `_setFilename`.
- The retired `airship_depart_*` names were not client assets and remain only
  as historical evidence in older generated/source notes.
- The best current official-airship candidate family is `zep0g000/010`,
  `zep0l000/010`, and `zep0u000/010`. Existing crosscheck output classifies
  them as physical client cut assets with no recovered Lua reference and no
  `cutReplay` row. The city split is compelling:
  - `zep0g010` embeds `Airship`, `Lionnellais`, and `Hida`.
  - `zep0l000/010` embed `Airship`, `Ajin_Zukajin`, `Raplulu`,
    `airport100428`, and Limsa/sea-side resources such as `sea_s0_air01`.
  - `zep0u000/010` embed `Airship`, `STANGYTH`, `LUNNIE`, `airport100428`,
    and Thanalan-side resources such as `wil_w0_air01`.
  These NPC names line up with known airship-area spawns, so `zep0*` is the
  strongest service-airship family found. Local route and packet/Lua contracts
  now send it; its visual interpretation remains unproven until a live-client
  departure capture confirms the scenes and ordering.
- Follow-up asset forensics found exactly six installed `zep*` cut folders.
  All six are physical assets with no recovered Lua reference and no
  `cutReplay` row. Camera counts are `g000=5`, `g010=3`, `l000=4`, `l010=5`,
  `u000=3`, and `u010=5`. All six include scheduler/camera/BGM/sound/fade and
  motion-clip material; all decode `DataSet/10000` as `cbem_goodbye_st`, with
  `zep0g000` alone also showing `cbfm_rx_chair01`, `cbem_point`, and
  `cbfm_step_u`.
- Current inference: `g/l/u` are city-state context keys, not arbitrary route
  names. `000` carries stronger airship-side resources such as
  `fst_f0_air01`, `sea_s0_air01`, and `wil_w0_air01`; `010` leans toward
  landing/town-side resources such as `fst_f0_twn01`, `sea_s0_ind01`,
  `wil_w0_ind01`, and `airport_out`. Treat `000 = boarding/departure-ish` and
  `010 = landing/arrival-ish` as a working hypothesis, not a route-pair map.
- Current route-test hypothesis:

  | route | local route | departure scene | arrival scene |
  | --- | --- | --- | --- |
  | 101 | Limsa -> Gridania | `zep0l000` | `zep0g010` |
  | 102 | Limsa -> Ul'dah | `zep0l000` | `zep0u010` |
  | 103 | Gridania -> Limsa | `zep0g000` | `zep0l010` |
  | 104 | Gridania -> Ul'dah | `zep0g000` | `zep0u010` |
  | 105 | Ul'dah -> Limsa | `zep0u000` | `zep0l010` |
  | 106 | Ul'dah -> Gridania | `zep0u000` | `zep0g010` |

- A follow-up binding scan found no `zep0g000/010`, `zep0l000/010`, or
  `zep0u000/010` hit outside the obvious installed `client/cut/zep0*` assets.
  Repo crosschecks still classify all six as `in_lua_refs=False`,
  `in_cutReplay=False`, and `in_client_cut_assets=True`.
- `airport100428` is a false-positive anchor here. It also appears in
  `elv0l01a`, `elv0l02a`, `elv0l0a1`, `elv0l0a2`, `elv0u01a`,
  `elv0u02a`, `elv0u0a1`, and `elv0u0a2`, but recovered calls bind those keys
  to `ElevatorStandard.playElevatorCutSeane` and quest after-warp scenes such
  as `Ceruleum Shock`, `Know Your Enemy`, and `Like Father, Like Son`. Keep
  `elv0*` in the rejected elevator/quest bucket unless live capture says
  otherwise.
- The only concrete recovered pass-adjacent cutscene assets found in this pass
  are `client/cut/man0l604` and `client/cut/man0l605`, with replay ids
  `11000208` and `11000209`. Those ids overlap the recovered airship-pass item
  ids, but the known recovered caller is `Man0l1.processEvent604/605` under
  the main quest flow, so they are not proven reusable travel scenes.
- Physical installed-client cutscene directories exist for `man0l604` and
  `man0l605`, but no physical cutscene directories or recovered asset names
  were found for `airship_depart_*`, `sea1Cruise01`, `ocn0Cruise01`, or obvious
  route/departure/arrival names.
- The focused `client\cut` directory scan checked 690 immediate cutscene
  folders. For travel anchors such as `air`, `ship`, `ferry`, `sea`, `ocn`,
  `srt`, `art`, city names, and `man0l60[45]`, it matched only `man0l604` and
  `man0l605`. That earlier filter did not catch the `zep` namespace, so it is
  now a filter limitation rather than evidence against `zep0*`.
- A full installed-client raw ASCII/UTF-16LE scan found no literal hits for
  `sea1Cruise01`, `ocn0Cruise01`, `ship_route_1`, `ship_route_2`,
  `ferry_route`, `ferry_man`, `airship_depart`, `transportDeparture`,
  `limsa_to`, `gridania_to`, `uldah_to`, `dftSrt`, or `DftSrt`. This is strong
  negative evidence for raw installed bytes, but it does not exclude compressed
  or custom-encoded payloads.
- That scan did find physical lowercase `man0l604` and `man0l605` strings in
  `client\cut\man0l604\man0l604` and `client\cut\man0l605\man0l605`.
- `man0l604` and `man0l605` are proven valid scene keys because recovered
  `man0l1.lua` calls `startNQCutScene("man0l604", 1)` and
  `startNQCutScene("man0l605", 1)`, and `cutReplay.csv` maps replay ids
  `11000208` and `11000209` to those keys. The overlap between those ids and
  airship-pass item ids/free-pass route metadata is still weak adjacency, not
  scene-selection evidence.
- Recovered/local quest context strongly classifies `man0l604` and `man0l605`
  as `Man0l1` / `Treasures of the Main` scenes for the Limsa starter
  Zephyr Gate / Oschon's Torch escort-lighthouse sequence. `processEvent604`
  follows the content-join prompt for travel to Zephyr Gate, and
  `processEvent605` follows the lighthouse trigger/corpse sequence. Nearby
  text points to Oschon's Torch and the lighthouse, not city airship travel.
- Other airship-looking scene keys, including `gc01l410`, `gc01g410`, and
  `gc01u410`, remain quest/Grand Company context rather than service-travel
  evidence.
- Other boat/ocean-looking scene keys also classify as story rather than public
  transport. `man2l030` contains `ocn_o0_sip01`/`ocn_o0_low` but joins to
  quest `110004` / "Never the Twain Shall Meet"; `man0l000/005/010/020` are
  `110001` / "Shapeless Melody" sea-voyage intro scenes.
- The numeric collision remains real: replay ids `11000208/11000209` map to
  `man0l604/605`, while item ids `11000208/11000209` are airship-pass items.
  However, `Man0l1` does not appear to grant those pass items; the local
  pass-message scripts are separate `Etc3g3` / `Etc3u3` content. Treat the
  collision as a red herring unless visual/capture evidence says otherwise.
- Recovered `Etc3g3.processEvent_005` and `Etc3u3.processEvent_005` are
  dialogue/ask/wait/chara-scheduler functions. They do not call
  `startNQCutScene`, so the pass-item branch does not currently support
  `man0l604/605` as service-travel scene evidence.
- Recovered `PopulaceFlyingShip` contains menu/dialog functions, not the actual
  flight/departure cutscene handoff.
- The closest recovered cutscene-shaped helper found so far is ferry/default
  talk related, not airship specific: `DftSrt.eventDeparture` in
  `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/defaulttalk/dftsrt.lua`.
  It calls `startFadeOutCutSceneDefault`, then `startNQCutScene(A3, 1)`, an
  optional second `startNQCutScene(A4, 1)`, and
  `startFadeInCutSceneAfterWarp`.
- The recovered/correlation rows preserve only dynamic `A3` and `A4` args. No
  concrete scene ids, asset names, or callers have been recovered for them yet.
- `A3` and `A4` are still best classified as cutscene filename/key arguments:
  `DftSrt.eventDeparture` passes them into `startNQCutScene`, which creates a
  `CutScene` actor and stores the first arg with `_setFilename`.
- They do not appear to be raw `srt_o0*` tokens or `5141/5144/5145` route-map
  children. The missing source is a retail event/default-talk binding table or
  caller that maps region `805`, actor class `1001291`, the steersman spawns,
  and `DftSrt` into `eventDeparture(sceneA, sceneB?)`.
- Repeated default-talk binding searches found only the plausible runtime path:
  steersman `1001291` -> `PopulaceStandard.talkDefault` ->
  `Player.GetDefaultTalkQuest` -> region `805` -> static actor `DftSrt`.
  The missing retail piece is still an ENPC/default-talk map or caller that
  allows class `1001291` and supplies `eventDeparture` `A3/A4`.
- Safe local exposure would be limited to a guarded steersman allowlist for
  `defaultTalkWithPilot_001`; wiring `eventDeparture` remains speculative
  until scene keys are recovered.
- Do not add a synthetic `!testferrycs <sceneKey>` yet. It would either guess
  `A3/A4` or bypass the exact binding we are trying to recover. The safe probe
  is the normal click path with `debug_event_route_probe` enabled on
  `ferry_man_thantonocea` and `ferry_man_noceatothan`. If a command is needed
  later, make it a guarded `!testferrydefaulttalk [actorId|uniqueId|target]`
  against zone `200`, actor class `1001291`, and the two known steersman unique
  ids, with no user-supplied function or scene name.
- A repo/generated/temp plus installed-client ASCII/UTF-16LE string pass still
  found no concrete `A3`/`A4` scene keys. Installed-client exact-token counts
  were `0` for `DftSrt`, `eventDeparture`, `defaultTalkWithPilot_001`, the
  ferry NPC ids, and `sea1Cruise01`; `srt_o0` appears as resource data only.
- A bounded `ffxivgame.exe` numeric/string scan also found no exact
  little-endian hits for static actor `0xA0F1AFD0`, low quest id `110544`,
  steersman actor class `1001291`, or ids `11000208/11000209`, and no
  ASCII/UTF-16LE hits for `DftSrt`, `eventDeparture`, `airship`, or `ferry`.
  The only `805`/`69` co-locations were weak code false positives or OpenSSL
  object/certificate data.
- `docs/Dat Mining/dftSrt.csv` rows `1-4` are ferry status/flavor text, not
  scene keys.

### Airship travel zones `801-804` / `art_*`

Present in installed client data, but not wired locally.

Findings from this pass:

- The strings `art_s0`, `art_r0`, `art_f0`, and `art_w0` were not found in the
  checked-in repo outside this open-question note, but they were found in the
  installed client `RegionResourceData` DAT at
  `data\03\C0\00\00.DAT`.
- The exact display names `Airship over La Noscea`, `Airship over Coerthas`,
  `Airship over Black Shroud`, and `Airship over Thanalan` were not found in
  the checked-in scripts, DAT CSVs, LPB inventories, docs, or generated outputs.
- `server_zones.sql` has no zone rows `801`, `802`, `803`, or `804`.
- DAT-mining hits for `801-804` in this repo are generic/shared tables such as
  blank `_region.csv` rows for `801-804`, Black Shroud achievements/titles, and
  two unnamed `2Dmap_piece.csv` rows for `801`/`802` referenced by
  `mapNavi_data.csv` rows `5300`/`5310`; they do not currently prove a
  server-reachable transit zone.
- Current airship routes warp from city landing to city landing after the
  travel timer. They do not move the player into an `art_*` over-region zone.
- `art_*_air01` files are real airship model/layout resources and contain
  reusable airship pieces plus, for `s0/r0/f0`, local FCurve/scheduler blocks.
  They do not contain destination/city strings and do not prove that route
  `101-106` should use `801-804` as destination zone ids.
- The native `RegionResourceData` loader proves that these rows are consumed as
  BG/layout resource descriptors by `MapLayoutActor` / `ResourceLoader`. It
  still does not prove that any travel route or cutscene chooses `801-804` as
  a server territory/zone.
- The missing source has now been narrowed to installed-client
  `RegionResourceData`. The checked-in `_zoneParam`, `regionParam`,
  `zoneGroupParam`, `worldMaster`, `mapNavi`, `2Dmap`, and `xtx_placeName`
  exports do not contain the `801-804 -> art_*` binding.

### Ferry/ocean route zones

Partially wired.

Known:

- Zone `200` is implemented as `sea1Cruise01` / Strait of Merlthor.
- Zone `200` is region `805`, which locally points default talk at `DftSrt`.
- Zone `200` has ferry route-land map objects:
  - `5900013`, `ferry_route_thantonoscea`, layout `5144`, instance `201`
  - `5900014`, `ferry_route_nosceatothan`, layout `5145`, instance `252`
- Zone `200` also has port-door map objects for both directions and two
  steersman NPCs, `ferry_man_thantonocea` and `ferry_man_noceatothan`.
- The local ferry flow can board into zone `200`, then exit/arrive at Limsa
  zone `230` or Western Thanalan zone `172`.

Unknown:

- Ocean/Rhotano routes `301` and `302` are still blocked.
- The `ocn0Cruise01` / `ship_route_1` / `ship_route_2` endpoints are not
  recovered.
- Both recovered `ship_route_1.lua` and `ship_route_2.lua` currently return the
  same hard payload, `false, false, 0, 0, 0x1415, 201`. That is layout
  `5141`, instance `201`, and it does not distinguish direction, destination
  zone, or landing coordinates.
- Installed-client `RegionResourceData` identifies `5141` as `srt_o0_low`,
  under root `805` / `srt_o0`. That gives `5141` a real resource identity, but
  still not a route endpoint.
- Installed-client `data\89\ED\00\*.DAT` files identify as
  `MapLayoutResourceData` and contain route-map scheduler/group strings such as
  `fdin`, `fdot`, `grp_low`, and `sgrp_*`; no ferry cutscene caller or
  `eventDeparture` scene key was found there.
- The inspected `srt/ocn/art` `MapLayoutResourceData` payloads have a common
  top-level shape: identity/version, child-table byte size at `+0x20`, a
  count-ish field at `+0x24`, `DEF_BLK` entries at `+0x40`, and layout payload
  at `0x40 + table_size`. Details are in
  `map_layout_resource_payload_notes.md`.
- Repeatable dumps now live under
  `tools/outputs/lpb/map_layout_resource_data_20260621/`. The summary confirms
  inspected files use `table_size / 0x20 == countish + 2`; per-token CSVs dump
  table entries, printable strings, scheduler/FCurve markers, and raw
  `301/302` candidates.
- Installed-client `data\2B\03\00\01.DAT` (`ocn_o0_sip01`) identifies as
  `MapLayoutResourceData` and contains ship/ocean strings such as
  `ocn_o0_sip01`, `ocn_o0_rounge`, `ocn_o0_indoor`, `ocn0Battle01` through
  `ocn0Battle05`, plus scheduler/FCurve blocks. It still does not contain
  `ship_route_1`, `ship_route_2`, `ocn0Cruise01`, or endpoint coordinates.
  Selected offsets are in `srt_ocn_resource_scan.csv`.
- `entries_ocn_o0_sip01.csv` row indices `192-198` are visual/VFX/light rows
  inside that layout resource, not transport route or cutscene rows:
  `0U2zSivleafinst`, `vfx_g03_out`, glow VFX, `vfx_g03_out`, light, and a
  repeated `0U2zSivleafinst` asset. `ocn_o0_sip01` itself is
  `RegionResourceData` row `1001`, so do not confuse those entry indices with
  the local Rhotano zone ids `192-198`.
- Broader installed-client string scan found adjacent sea/ship strings such as
  `o0l0_l0_sea01`, `o0s0_f0_sea01`, `s0s1_man0l0`, `ship_stor`,
  `ship_in_l`, and `ocn0Ship01`, but none of these are route endpoint bindings.
- Raw little-endian `301` and `302` do appear inside
  `data\89\ED\00\00.DAT`, but they are layout object ids near the
  `fdin`/`fdot` visual data, not transport route ids. Nearby records contain
  transform-like floats, not endpoint zone/coordinate tables.
- Local SQL has `5141:201` only as orphaned map-object rows with actor id `0`;
  no checked-in spawn row binds it to `ocn0Cruise01`, a zone, or coordinates.
- Zones `192`, `193`, `194`, `195`, `196`, and `198` exist locally as Rhotano
  `ocn*Battle*` battle/ocean zones, not cruise endpoints; they are not
  currently used by the ferry route table.
- There is a local/installed data mismatch worth tracking: the installed
  `ocn_o0_sip01` resource contains `ocn0Battle01..05`, while local zone rows
  are `192 ocn1Battle01`, `193 ocn0Battle02`, and `194-198 ocn1Battle03..06`.
  This mismatch is not enough to wire route `301/302`.
- `197` and `801-804` are not present in the checked zone tables.
- Recovered zone masters for `ZoneMasterBattleOcnO0/O1`,
  `ZoneMasterCruiseOcnO2`, and `ZoneMasterCruiseSeaS1` are empty/identity
  shells, not route endpoint sources.

### Schedule alignment

The 2026-08-25 ferry pass resolves the clock drift for this route.

- Temporary UAT override (2026-08-25): ferry passenger departures and
  `MapObjShipPort` ferry layouts `196`/`496` use a 60-second cycle and cast off
  at second 30. Registration locks at second 25. Restore the recovered
  `600`-second cycle, `180`-second boarding boundary, and `15`-second lock
  after testing.
- `MapObjShipRouteLand` retains its recovered 600-second onboard visual period.
- The playable `sea1Cruise01` interval is 540 seconds, based on the supplied
  reverse-route capture and its approximately nine-minute ride description.
- Exact departure phase within the shared period remains a live-client probe;
  sharing the period ensures any chosen phase no longer drifts over time.

### Live probe checklist

Debug build/log setup:

```text
!hotbardebug on
!hotbardebug trace on
!hotbardebug raw on
```

Tail the debug map log:

```powershell
Get-Content -Wait "C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\Map Server\bin\Debug\Logging\2026-06-21\map.log"
```

Scheduler phase probes:

```text
!warp 133 -472 92 194
!testbgscheduler limsa_airship_shipport stt0 0
!testbgscheduler limsa_airship_shipport stt0 10
!testbgscheduler limsa_airship_shipport end0 0
!testbgscheduler limsa_airship_shipport end0 10

!warp 230 -846.89 5 240
!testbgscheduler limsa_shipport spot 0
!testbgscheduler limsa_shipport spot 30
!testbgscheduler limsa_shipport spin 30

!warp 200 0 10 -128
!testbgscheduler ferry_route_thantonoscea fdin 0
!testbgscheduler ferry_route_thantonoscea fdin 30

!warp 200 0 10 128
!testbgscheduler ferry_route_nosceatothan fdot 0
!testbgscheduler ferry_route_nosceatothan fdot 120
```

Expected scheduler evidence: visible phase shift, chat confirmation, and
`[TransportQueueDiag]` with `BgSchedulerProbe`, `scheduler=<name>`, and
`offsetSeconds=<n>`. If a target is not instantiated, spawn a temporary map
object controller with `!spawnbgobj placed <spawnId> here`, then use the actor
id printed in chat as the first `!testbgscheduler` argument.

Airship departure capture:

```text
!givegil 10000
!warp 133 -473.9 92 188.4
```

Click Faezbroes and choose Gridania or Ul'dah. Watch for `[Transport]
Airship cutscenes depart=... arrive=...`, `Event START` on `noticeEvent`, and
two ordered `RunEventFunction` calls to `startNQCutScene`. Seeing any
`airship_depart_*` argument indicates an obsolete build; the current contract
sends the paired `zep0*` keys.

No-wait airship candidate smoke tests:

```text
!testcutscene zep0g000
!testcutscene zep0g010
!testcutscene zep0l000
!testcutscene zep0l010
!testcutscene zep0u000
!testcutscene zep0u010
```

These prove only whether the basename can start as an NQ cutscene. They do not
prove the real travel owner path.

Airship-owner path probes:

```text
!warp 133 -473.9 92 188.4
!testairshipcs zep0l000 target
!testairshipcs zep0l010 target
```

Target the live attendant first. This sends `noticeEvent` with
`transportDeparture` through `PopulaceFlyingShip.lua`, then that script calls
`startNQCutScene(sceneKey, 1)` and closes the event. It is stricter than
`!testcutscene` because it uses a real airship service owner, but it still does
not prove retail route binding by itself.

Ranked airship-owner matrix:

| rank | route | probe |
| --- | --- | --- |
| 1 | 101 Limsa -> Gridania | Faezbroes: `zep0l000`; Lionnellais: `zep0g010` |
| 2 | 105 Ul'dah -> Limsa | Stangyth: `zep0u000`; Faezbroes: `zep0l010` |
| 3 | 104 Gridania -> Ul'dah | Lionnellais: `zep0g000`; Stangyth: `zep0u010` |
| 4 | 102 Limsa -> Ul'dah | Faezbroes: `zep0l000`; Stangyth: `zep0u010` |
| 5 | 106 Ul'dah -> Gridania | Stangyth: `zep0u000`; Lionnellais: `zep0g010` |
| 6 | 103 Gridania -> Limsa | Lionnellais: `zep0g000`; Faezbroes: `zep0l010` |

Support the hypothesis if `*000` looks like city-specific
boarding/departure/flyaway and `*010` looks like the destination landing or
disembark side. Falsify it if a scene shows the wrong city or the phase is
reversed.

Ferry default-talk capture:

```text
!warp 200 -14.52 12.409 127.997
```

Click `ferry_man_thantonocea`, then:

```text
!warp 200 14.52 12.409 -127.997
```

Click `ferry_man_noceatothan`. The expected current baseline is an event start
for actor class `1001291` followed by no useful `DftSrt` service dispatch,
because local `DftSrt.lua` is inert and no recovered actor-class binding for
`eventDeparture(A3, A4)` has been found.

Do not use a synthetic ferry cutscene command for this pass. The useful data is
the owner id, event name, and default-talk function path from the real steersman
click.

## Next Decomp/Probe Targets

1. Probe `RunEventFunctionPacket`/client-native public
   `_runBgSchedulerFromMidstream` against live `5900011`/`5900013`/`5900014`
   map-object owners using `!testbgscheduler`. Use the runtime map-object
   actor id or unique id and integer-second offsets. Try direct packet reverse
   work only if the public function probe fails.
2. Search binary/event binding tables by text sheet `69`, region `805`, actor
   class `1001291`, and ferry NPC ids to find how retail calls
   `DftSrt.eventDeparture(A3, A4)`.
3. Wire or probe `DftSrt` locally only after the concrete retail binding is
   known; a guarded `defaultTalkWithPilot_001` allowlist is safer than guessing
   `eventDeparture` scene keys.
4. Treat the native `RegionResourceData` xref trail as resolved for this
   travel question unless new evidence appears: it reaches `MapLayoutActor` /
   `ResourceLoader` layout loading, not route or cutscene selection.
5. Probe airship departure with enough gil/quest pass/no gil and visually
   confirm that each route plays its origin `*000` scene followed by its
   destination `*010` scene, then arrives at the correct terminal. Confirm the
   quest pass is consumed without removing gil.
6. Recover `ocn0Cruise01` `ship_route_1` and `ship_route_2` endpoints from a
   script/transport-route table before enabling routes `301` and `302`. Do not
   use the `301/302` layout object ids found in `srt_o0_low_w0` as endpoints.

## 2026-06-21 Helper Sweep Confirmation

- The later helper sweep reaffirmed the same boundary: `DftSrt.eventDeparture(A3,A4)` is recovered and ferry-shaped, but dispatch is still missing. Do not wire ferry steersman behavior until a default-talk actor/caller and concrete scene args are captured.
- Airship and ferry retail menus are owner-routed through `PopulaceFlyingShip` and `MapObjPortDoor`; visual ship/map objects are separate animation/identity surfaces.
- `sea1Cruise01` remains the only concretely wired ferry scene key locally. `ocn0Cruise01`, `ship_route_1`, `ship_route_2`, and route ids `301/302` remain open questions.
- `PopulaceCompanyWarp` is company/aethernet travel, not evidence for ferry or airship retail route ids.
