# Man0l1 / Man0g1 Escort Content Decomp Notes

Quest: `man0l1`, `110002`, `Treasures of the Main`
Companion quest: `man0g1`, `110006`, `Souls Gone Wild`

This note is a focused handoff for the starter escort/content slices around Limsa `processEvent604`, Sisipu, and the Ankle Biter ambush route, plus the Gridania `Souls Gone Wild` child escort that appears to have the same missing-retail-director problem.

## Sources Checked

- Recovered quest scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0l1.lua`
- Recovered retail quest director stub: `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman0l101.lua`
- Recovered Gridania quest scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0g1.lua`
- Recovered Gridania quest director stubs: `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman0g101.lua`, `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman0g102.lua`
- Recovered private-area base scripts: `tools/outputs/lpb/decomp_more_20260617/lua/area/privatearea/content/privateareamastersimplecontent.lua`, `tools/outputs/lpb/decomp_more_20260617/lua/area/privatearea/content/privateareacontentbaseclass.lua`
- Recovered content group scripts: `tools/outputs/lpb/decomp_further_20260617/lua/group/contentgroup/simplecontentgroup.lua`, `tools/outputs/lpb/decomp_further_20260617/lua/group/contentgroup/contentgroupbaseclass.lua`
- Recovered client content-group accessors/commands: `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua`, `tools/outputs/lpb/content_systems_20260612/lua/chara/player/playerbaseclass.lua`, `tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua`, `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua`
- Recovered quest helpers: `tools/outputs/lpb/decomp_more_20260617/lua/quest/questbaseclass.lua`, `tools/outputs/lpb/decomp_more_20260617/lua/quest/questbaseclass_common.lua`
- Known-working comparison: `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman0l001.lua`, `Data/scripts/content/SimpleContent30002.lua`, `Data/scripts/quests/man/man0l0.lua`
- Local quest script: `Data/scripts/quests/man/man0l1.lua`
- Local Gridania quest script: `Data/scripts/quests/man/man0g1.lua`
- Local content/director scripts: `Data/scripts/content/SimpleContentMan0l101.lua`, `Data/scripts/directors/Quest/QuestDirectorMan0l101.lua`
- Local GM probe helper: `Data/scripts/commands/gm/questcomplete.lua`
- Local escort route backend/schema: `Map Server/Utils/EscortRouteBuilderUtils.cs`, `Map Server/Actors/Director/EscortRouteDirector.cs`, `Map Server/DataObjects/ChocoboCaravanRoute.cs`
- Local content area binding check: `Map Server/Actors/Area/Zone.cs`, `Map Server/Actors/Area/PrivateAreaContent.cs`, `Map Server/Lua/LuaEngine.cs`
- Local director/content group lifecycle: `Map Server/Actors/Director/Director.cs`, `Map Server/Actors/Group/ContentGroup.cs`, `Map Server/Actors/Group/Group.cs`, `Map Server/Actors/Group/GLContentGroup.cs`
- Local event recovery and landing gate: `Map Server/PacketProcessor.cs`, `Map Server/Actors/Chara/Player/Player.cs`, `Map Server/WorldManager.cs`, `Map Server/DataObjects/Session.cs`
- Runtime route file checked locally: `C:\serverdata\Treasures Of The Main.json`
- Actor/layout/private-area tables: `Data/sql/gamedata_actor_class.sql`, `Data/sql/server_eventnpc_spawn_locations.sql`, `Data/sql/server_battlenpc_mob_types.sql`, `Data/sql/server_zones_privateareas.sql`, `Data/sql/gamedata_guildleves.sql`, `Data/sql/gamedata_guildleves_rewards.sql`
- Quest/director atlases: `tools/outputs/lpb/quest_scenario_parity_contract_20260619/recovered_quest_director_inventory.csv`, `tools/outputs/lpb/decomp_more_20260617/manifest.csv`, `outputs/quest-execution-atlas-20260630/quest_event_cutscene_push_map.csv`, `outputs/quest-master-gap-atlas-20260630/quest_dimension.csv`
- Combined client indexes: `tools/outputs/lpb/decomp_further_20260617/combined_client_manifest.csv`, `tools/outputs/lpb/decomp_further_20260617/full_class_inventory.csv`, `tools/outputs/lpb/decomp_further_20260617/full_file_summary.csv`
- Cutscene contract atlas: `outputs/quest-cutscene-push-contract-atlas-20260630/cutscene_push_contracts.csv`, `tools/outputs/lpb/quest_cutscene_decomp_20260618/server_delegate_method_context.csv`
- Runtime/cutscene reconciliation atlases: `outputs/quest-cutscene-push-matrix-atlas-20260630/recovered_cutscene_push_matrix.csv`, `outputs/quest-cutscene-push-matrix-atlas-20260630/local_cutscene_delegate_inventory.csv`, `outputs/quest-push-recipe-atlas-20260630/cutscene_push_recipes.csv`, `outputs/quest-push-recipe-atlas-20260630/push_implementation_queue.csv`, `outputs/quest-push-recipe-atlas-20260630/after_warp_push_queue.csv`, `outputs/quest-runtime-deep-atlas-20260630/local_content_area_launches.csv`, `outputs/quest-runtime-deep-atlas-20260630/unmatched_active_delegate_calls.csv`, `outputs/quest-fight-materialization-atlas-20260630/fight_content_lifecycle_join.csv`, `outputs/quest-fight-materialization-atlas-20260630/fight_actor_mob_spawn_join.csv`
- Cutscene argument/lifetime atlases: `outputs/quest-cutscene-argument-atlas-20260630/cutscene_argument_requirements.csv`, `outputs/quest-cutscene-argument-atlas-20260630/after_warp_event_lifetime_queue.csv`
- Client cutscene replay/asset atlases: `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutreplay_rows_joined.csv`, `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_asset_crosscheck.csv`
- Quest text atlases and DAT text tables: `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_event_text_join.csv`, `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_text_summary_by_quest.csv`, `docs/Dat Mining/xtx_quest.csv`, `docs/Dat Mining/xtx_journalxtxSea.csv`, `docs/Dat Mining/xtx_journalxtxFst.csv`
- Alternate LUAC decompiler check: `.tmp/Sapphire/src/tools/quest_parser/unluac_2015_06_13.jar`, `.tmp/Sapphire/src/tools/custom_talk_parser/unluac_2015_06_13.jar`
- Local wiki/archive corroboration: `docs/ffxiv-1.0-wiki/regions/Mobs_by_Location.md`, `docs/ffxiv-1.0-wiki/regions/Mobs_by_Location.csv`, `docs/ffxiv-1.0-wiki/quest_archive_rows.csv`

## Retail/Recovered Director and Content Names

Confirmed from recovered client Lua:

- Retail quest director class: `QuestDirectorMan0l101`
- Retail director path: `/Director/Quest/QuestDirectorMan0l101`
- Base class: `QuestDirectorBaseClass`
- Retail LPB: `client\script\61s57qvs\tp5rq\tp5rq61s57qvsx9wjyiji.le.lpb`
- Manifest size row: source `227` bytes, decoded LUAC `214` bytes, decompiled Lua `114` bytes
- Bytecode constants found in the LUAC: `require`, `/Director/Quest/QuestDirectorBaseClass`, `_defineClass`, `QuestDirectorMan0l101`, `QuestDirectorBaseClass`

The recovered director body is only the class declaration. Alternate decompiler pass with `.tmp/Sapphire/src/tools/quest_parser/unluac_2015_06_13.jar` produced the same two-line body:

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan0l101", "QuestDirectorBaseClass")
```

That alternate decompiler also fully decompiled the much larger recovered `man0l1.luac`, so the shell output is not just a broken-tool symptom. Bytecode inspection agrees: `instructions=8`, `constants=5`, `nested_protos=0`, `trailing=0`.

Known-working comparison: `QuestDirectorMan0l001` has the same shell profile (`227` source bytes, `214` decoded LUAC bytes, `114` Lua bytes, `nested_protos=0`). Its behavior is supplied by `SimpleContent30002.lua` plus the server launch path, not by extra recovered methods on the retail director subclass.

No recovered retail Lua/LUAC surface named `SimpleContentMan0l101`, `man0l101`, or `Man0l101` surfaced in the client manifests checked. A fresh exact-name sweep across local scripts, recovered outputs, generated outputs, docs, and `.tmp` only found the current local `man0l1` script/director plus stale atlas rows for the older `Man0l101:SimpleContent30002` tuple. The only recovered retail content-side class in this family is the generic `PrivateAreaMasterSimpleContent`; the Treasures-specific `SimpleContentMan0l101` name is current local server implementation, not a recovered retail content script.

Current local workspace launch uses:

- Area path: `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`
- Lua content tuple: `man0l101`, `SimpleContentMan0l101`, `Quest/QuestDirectorMan0l101`
- Runtime private area/script key: `SimpleContentMan0l101`
- Legacy/client content key argument: `man0l101`
- Director: `Quest/QuestDirectorMan0l101`
- Entry position: `-63.25, 33.15, 164.51`, rotation `0.8`, update type `16`

Important engine quirk: `Zone.CreateContentArea` is exposed as `(starterPlayer, areaClassPath, contentScript, areaName, directorName)`, but `Zone.CreateContentAreaInternal` currently ignores `contentScript` after creating the director. `PrivateAreaContent` stores the fourth argument as `privateAreaName`, and `LuaEngine.GetScriptPath` loads `/content/{GetPrivateAreaName()}.lua`. In the current Lua call, the fourth argument is `SimpleContentMan0l101`, so that is the runtime private area name and content script key. Reversing the two strings would make the engine look for `/content/man0l101.lua`, which does not exist.

Older generated atlases mention `Man0l101:SimpleContent30002:Quest/QuestDirectorMan0l101`. Treat that as stale for this lane: local `SimpleContent30002.lua` is the older Y'shtola/Sthalmann/jellyfish fight surface, not the current Sisipu escort content.

## Sequence and Event Flow Around Escort Entry

`SEQ_048` is the pre-escort state after the hand-signal lesson. `ZEPHYR_TRIGGER` (`1090004`) is enabled as a push trigger.

On push at `ZEPHYR_TRIGGER` in `SEQ_048`, the local quest script calls:

- `contentsJoinAskInBasaClass`
- If result is `1`, `startMan0l1Content(player, quest)`

`startMan0l1Content` does this in order in the current local workspace:

- `quest:StartSequence(SEQ_050)`
- `skipEntryCutsceneForTest` is currently `true`, so it calls `player:EndEvent()` and skips the retail entry cutscene delegate
- if that test flag is disabled, the intended retail delegate is `processEvent604`, followed by `player:EndEvent()`
- create content area with Lua tuple `man0l101`, `SimpleContentMan0l101`, `Quest/QuestDirectorMan0l101`
- add/start the content director
- kick director `noticeEvent`
- set login director
- `DoZoneChangeContent(...)`

This means the current implementation can enter the escort content without playing `man0l604`. Retail/recovered data says the event around this transition is `processEvent604`; reenabling it needs care because it uses the after-warp fade path.

Recovered `processEvent604` is:

- `startFadeOutCutSceneDefault`
- `startNQCutScene("man0l604", 1)`
- `startFadeInCutSceneAfterWarp`

Related recovered helpers:

- `processEvent604_2`: fade out only
- `processEvent604_3`: fade in default only
- `processEventFadeIn604`: empty

## Escort Completion and Post-Escort Cutscenes

`SEQ_050` is the escort/content state. In the current local director, route completion calls `completeEncounter`, which:

- calls `ContentFinished()`
- delegates `processEvent605`
- warps to zone `128`, `PrivateAreaMasterPast`, type `2`, at `137.44, 60.33, 1322.0`, rotation `-1.60`
- starts `SEQ_055`
- ends the event
- ends the director

Recovered `processEvent605` is:

- `startFadeOutCutSceneDefault`
- `startNQCutScene("man0l605", 1)`
- `startFadeInCutSceneAfterWarp`

This is the escort-completion/corpse-scene entry cutscene. It is also used by the local `LIGHTHOUSE_TRIGGER` fallback path in `SEQ_050`.

After the corpse scene:

- `SEQ_055`: `WINDWORN_CORPSE` talk delegates `processEvent610`, then starts `SEQ_060`
- `processEvent610`: plays `man0l610`, fade in default
- `SEQ_060`: `SISIPU` talk delegates `processEvent615`, starts `SEQ_065`, then warps back toward the Fishermen's Guild
- `processEvent615`: plays `man0l615`, fade in after warp
- `SEQ_065`: `FSH_TRIGGER` push delegates `processEvent620`, grants `3000` gil, starts the Baderon linkshell handoff toward `SEQ_070`
- `processEvent620`: plays `man0l620`, fade in default

Final quest completion later happens at `SEQ_092` on `BADERON`:

- delegate `processEventComplete`
- delegate `sqrwa(300, 1, 1, 2)`
- complete quest
- grant `6000` gil and `10000` exp

Recovered `processEventComplete` is a talk-turn method with text ids `315`, `316`, scheduler `68378624`, then text ids `317`, `318`, `340`, `341`.

Recovered Treasures event cluster:

| Method | Recovered behavior | Local owner/use |
| --- | --- | --- |
| `processEvent604` | fade out, `man0l604`, after-warp fade in | escort/content entry from `SEQ_048` |
| `processEvent604_2` | fade out only | helper, no local ambush ownership found |
| `processEvent604_3` | default fade in only | helper, no local ambush ownership found |
| `processEvent604_4` | empty/nil return | helper, no local ambush ownership found |
| `processEvent605` | fade out, `man0l605`, after-warp fade in | escort completion and `LIGHTHOUSE_TRIGGER` fallback |
| `processEvent605_2` | says text id `119` | reminder/helper, not a route stop |
| `processEvent610` | fade out, `man0l610`, default fade in | windworn corpse scene |
| `processEvent610_2` | `worldMaster:say(328)` | corpse-scene helper |
| `processEvent615` | fade out, `man0l615`, after-warp fade in | Sisipu after corpse scene |
| `processEvent615_2` | talk-turn text ids `248`, `249` | Sisipu/helper text |
| `processEvent620` | fade out, `man0l620`, default fade in | Fishermen's Guild return trigger |

Text table proof from `quest_event_text_join.csv` and `quest_text_summary_by_quest.csv`:

- `man0l1` has a complete text join for this pass: `156` text references, `156` joined rows, `0` missing sheet/text rows, `29` rows with no text id.
- `processEvent605_2` is only text id `119`, a short distress/shudder helper.
- `processEvent610_2` is text id `328`, the windworn-corpse observation helper.
- `processEvent615_2` is text ids `248` and `249`, Sisipu/Baderon follow-up text after the escort, not an ambush callback.
- `processEvent050_2` through `processEvent050_15` map to text ids `184`-`216` and theme around Barracudas, Seal Rock, pirates, and Merodaulyn. That cluster is earlier guild-visit chatter, not Sisipu or Ankle Biter stop dialogue.

## Sisipu Ambush/Stop Events

No recovered retail Lua event has been found that clearly fires per Sisipu ambush stop.

Current local escort backend behavior:

- `EscortRouteDirector.TryStartEncounterAtCurrentWaypoint` detects a route stop by waypoint `StopId`.
- It spawns the stop's mobs, immediately makes each mob engage Sisipu, sets Sisipu to stopped, and logs `[EscortRoute] route=... stop=... waypoint=... mobs=...`.
- `UpdateEncounterStopWait` waits until all active encounter mobs are dead.
- It then clears the stop, logs `stopCleared`, and sets Sisipu walking again.
- Generic escort routes call `SendMessageToPlayers` for stop/start/resume/destination text, but the current server suppresses those messages when `route.RouteKey == "treasures_of_the_main"`. Since `LoadTreasuresOfTheMainRoute` normalizes the route key to that value, Treasures stop/resume/destination text should not be visible to the player in the current workspace.
- If the stop is at the last waypoint, it calls `CompleteEscortRoute()`.

Important gap: this backend does not currently call `callClientFunction` or any quest delegate when Sisipu stops, when an ambush starts, or when an ambush clears. If retail had per-stop dialogue, it is not represented in the recovered `QuestDirectorMan0l101` body we have.

The recovered `processEvent050_2` through `processEvent050_15` cluster is not an escort-stop callback in the current local script. Those delegates are wired from `seq007_onTalk` for the earlier Musketeers/Barracuda guild visit, and their text ids are Barracuda/Seal Rock chatter, not Sisipu escort dialogue.

## Route, Sisipu, and Ankle Biter IDs

Current route loader:

- Runtime route key: `treasures_of_the_main`
- Legacy fallback route key: `Treasures Of The Main`
- Route file directory: `C:\serverdata`
- Route files: `<routeKey>.json`
- Local director sets route unique id: `man0l1_sisipu_escort`

Sisipu:

- Escort actor class: `1000156`
- Actor path: `/Chara/Npc/Populace/PopulaceStandard`
- Layout/model id in `gamedata_actor_class`: `1500024`
- Field/private spawn row: `2063`, unique name `man0l1_fld1_sisipu`, zone `128`, `PrivateAreaMasterPast`, type `2`, position `135.83, 60.84, 1323.97`, rotation `0.278`
- Fishermen's Guild emote Sisipu uses actor class `1000155`, same layout/model `1500024`, spawn row `2051`, unique name `man0l1_fsh_sisipu`
- Actor `1000156` has `talkDefault` and `noticeEvent` conditions only; no emote or push conditions are defined for escort Sisipu.
- Actor `1000155` has `talkDefault`, `noticeEvent`, and emote conditions for emote ids `105`, `107`, `129`, `128`, `118`, and `116`.

Ankle Biter:

- BNPC/mob type id: `1365`
- Actor class id: `2205603`
- Actor path: `/Chara/Npc/Monster/Chigoe/ChigoeLesserScenarioLimsaLv10`
- Layout/model id in `gamedata_actor_class`: `3205603`
- Local mob type name: `ankle_biter`
- Local route defaults force every stop mob to `bnpc:1365`, actor `2205603`, display name `Ankle Biter`, level `1`
- Encounter mob unique ids are generated as `{route.UniqueId}_{stop.StopId}_{bnpcId}_{spawnIndex}`, for example `man0l1_sisipu_escort_stop1_1365_0`

Archive/wiki corroboration:

- `docs/ffxiv-1.0-wiki/regions/Mobs_by_Location.md` lists `Ankle Biter` in Lower La Noscea as `Normal` with `Guildleve: Treasures of the Main`.
- The same local archive lists `Bark Weevil` separately as `Guildleve: Evil Weevils`. This supports treating the local `Ankle Biter` normalization as quest-specific and treating `DisplayGuildleveId = 10826` / `Evil Weevils` as a generic/default HUD value, not the Treasures mob identity.
- `docs/ffxiv-1.0-wiki/quest_archive_rows.csv` has a sidequest/archive row for `Treasures of the Main`: level `1`, Limsa Lominsa `(3-5)`, starter `Hob`, type `Combat`, prerequisite `Shapeless Melody`. The main-scenario archive row exists too, but carries less location/NPC detail.

Retail DAT quest-row corroboration:

- `docs/Dat Mining/xtx_quest.csv` row `110002` confirms English title `Treasures of the Main`, location text for Limsa Lominsa, and offer NPC `Baderon`.
- This conflicts with the local archive row naming `Hob` as starter. Treat the DAT row as stronger retail quest metadata, and the archive/wiki row as useful but less precise external corroboration.
- The row's journal expression references `xtx/journalxtxSea` rows `4`, `48`, `49`, `51`, `137`, `5`, `136`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, and `50`.

Relevant triggers:

- `ZEPHYR_TRIGGER`: actor `1090004`, push radius `12.0`; local rows include `2062` outside in zone `128` and `2709` inside in zone `230`
- `LIGHTHOUSE_TRIGGER`: actor `1090176`, push radius `6.0`, spawn row `2724`, zone `128`, position `128.601, 61.552, 1299.231`
- `FSH_TRIGGER`: actor `1090006`, push radius `6.0`, spawn row `445`, zone `230`, position `-624.55, 4.25, 359`
- All three trigger actor classes have `noticeEvent` plus disabled-by-default `pushDefault` circle conditions in actor data; the quest script enables/disables the live push behavior by sequence.

Marker ID caveat:

- The local `man0l1.lua` marker constants for the escort slice are `MRKR_SISIPU=11000110`, `MRKR_ESCORTSTART=11000111`, `MRKR_LIGHTHOUSE=11000112`, `MRKR_CORPSE=11000113`, and `MRKR_SISIPU2=11000114`.
- `outputs/quest-master-gap-atlas-20260630/quest_marker_join.csv` also has quest-keyed `11000207` through `11000212` rows, but those all reuse `x=-431`, `z=187`, display `1600179`, class `MapMarker`, and text `@5208/i11000101`. Treat those rows as generic/stale marker-table fill, not escort route geometry and not ambush stop markers.
- No marker row found in the local atlases corresponds to an individual Sisipu ambush stop. The route stop table below remains the authoritative local stop-position source.

Private areas used by local `man0l1` outside the dynamic simple-content area:

| SQL row | Zone | Type | Music | Proven local use |
| ---: | ---: | ---: | ---: | --- |
| `4` | `133` | `2` | `40` | opening Wench echo/private scene |
| `11` | `230` | `3` | `40` | Musketeers' Guild echo |
| `12` | `230` | `4` | `40` | Armorers'/Blacksmiths' Guild echo |
| `14` | `230` | `5` | `37` | Fishermen's Guild/Sisipu emote scene |
| `15` | `128` | `2` | `0` | corpse scene after escort completion |

The escort content instance itself is dynamic `PrivateAreaMasterSimpleContent` with private area/script key `SimpleContentMan0l101`; it is not one of the static `PrivateAreaMasterPast` rows above.

## Treasures Runtime Route File

The active route file found on this machine is external to the repo:

- Path: `C:\serverdata\Treasures Of The Main.json`
- Raw file route key: `test_route`
- Raw file unique id: `escort_route_test_route_1_1783178613`
- Raw file actor: `1000001`
- Raw file mob for every stop: `bnpc:1027`, actor `2102127`
- Waypoint count: `656`
- Encounter stop count: `5`
- Raw move speed/update: `4.0` speed, `0.75` second update interval
- Raw start waypoint: `-48.703213, 36.460697, 162.03383`
- Raw destination waypoint: `116.45992, 61.84969, 1274.4138`

Runtime normalization in `LoadTreasuresOfTheMainRoute` changes that file before the director sees it:

- `route.RouteKey` becomes `treasures_of_the_main`
- `route.RouteType` becomes `escort`
- `route.ZoneId` becomes `128`
- `route.CaravanActorClassId` becomes Sisipu actor `1000156`
- `route.DisplayName` becomes `Sisipu`
- `route.DisplayGuildleveId` becomes `10826`
- `route.ArrivalDistance` becomes `0.5`
- every stop mob becomes `bnpc:1365`, actor `2205603`, display `Ankle Biter`, level `1`, with count clamped to at least `1`

Important display-id caveat: `10826` is `ChocoboCaravanRoute.DefaultDisplayGuildleveId`, not a recovered Treasures-specific duty id. Local guildleve data/datamine names `10826` as `Evil Weevils`, Camp Bearded Rock, level `1`, mob `bark weevil` (`3203901`). Treat `DisplayGuildleveId = 10826` as a generic/default HUD marker value until a Treasures-specific content id is recovered.

Content boundary from `SimpleContentMan0l101`:

- Square boundary min: `x=-90.0`, `z=100.0`
- Square boundary max: `x=160.0`, `z=1300.0`

Director/content group membership:

- `director:AddMember(director)` is consistent with older simple content scripts (`SimpleContent30002`, `SimpleContent30010`, `SimpleContent30079`, `SimpleContent30080`).
- The server-side comparison is not limited to old Lua examples: the Toto-Rak runtime-content path also starts the director, adds the director as a member, adds each entrant, and then calls `director.StartContentGroup()`.
- `Director.AddMember` adds the actor to the director member list, adds player actors to the player's owned-director list, and forwards the actor to `ContentGroup.AddMember` when the director has a content group.
- `Director.GetPlayerMembers()` filters members to `Player`, so the director adding itself does not directly break the quest director's player lookup.
- `ContentGroup.AddMember` only assigns `currentContentGroup` when `ShouldAssignCurrentContentGroup(actor)` is true; for simple content and guildleve content that method returns `actor is Character`. A `Director` member is recorded in the content group member id list, but it is not assigned a `currentContentGroup`.
- `ContentGroup.GetTypeId()` for this simple content path returns `30006` (`ContentGroup_SimpleContentGroup24B`). `GLContentGroup` returns `30001` (`ContentGroup_GuildleveGroup`), and both use the same `Character` assignment guard.
- `Character.SetCurrentContentGroup` writes `charaWork.currentContentGroup` to the group type id and broadcasts that property. For this content path the player's value should therefore become `30006` once the player is added to the started group.
- The missing local pattern was `director:StartContentGroup()` in `SimpleContentMan0l101.onCreate`; older simple battle content starts the content group after adding the player/director/NPCs. This is now wired so the group packets/work values can sync before the escort director starts route logic.
- The other missing local pattern was the launch `noticeEvent` kick. Working starter content (`man0l0`, `man0g0`, `man0u0`) does `player:KickEvent(director, "noticeEvent", true)` after `director:StartDirector(false)` and before `SetLoginDirector`; Treasures now mirrors that sequence.
- `QuestDirectorMan0l101.onCreateContentArea` is probably inert in the current engine: no C# caller for Lua `onCreateContentArea` was found. The live membership setup is the content script `onCreate` plus `startMan0l1Content`.

Private/simple content base evidence:

- Retail `PrivateAreaMasterSimpleContent` is a two-line shell:

```lua
require("/Area/PrivateArea/Content/PrivateAreaContentBaseClass")
_defineClass("PrivateAreaMasterSimpleContent", "PrivateAreaContentBaseClass")
```

- Retail `PrivateAreaContentBaseClass` is also only a base declaration:

```lua
require("/Area/PrivateArea/PrivateAreaBaseClass")
_defineBaseClass("PrivateAreaContentBaseClass", "PrivateAreaBaseClass")
```

- Retail `SimpleContentGroup` is a shell over `ContentGroupBaseClass`:

```lua
require("/Group/ContentGroup/ContentGroupBaseClass")
_defineClass("SimpleContentGroup", "ContentGroupBaseClass")
```

- All three shell chunks parse with `instructions=8`, `constants=5`, `nested_protos=0`.
- Retail `ContentGroupBaseClass.getDirector` returns `contentGroupWork._globalTemp.director` only when that director is alive. Its update hooks refresh nameplates and `desktopWidget.processUpdateMyPlayerRestrictionByContents` when the local player is a member.
- Recovered `CharaBaseClass.getCurrentContentGroup` returns nil when `charaWork.currentContentGroup == 0`, otherwise it resolves `_getExtendedTemporaryGroup(currentContentGroup)`. `hasCurrentContent` is just the same value being nonzero.
- Recovered `CharaBaseClass.isRestrictedByContents` scans all groups for `ContentGroupBaseClass` instances with enabled property flags, which matches the local server sending `contentGroupWork.property[0..2]`.
- Recovered `PlayerBaseClass.postMapOpen` walks all content groups and calls `getDirector():processMapOpenMessage()` when the content group's director is alive. That is another sign that the client expects the content-group work director pointer to be populated, not that a quest helper secretly starts the group.
- Recovered `ContentCommand` is gated by the player's `contentCommandVariation`; `DirectorBaseClass._onUpdateWork` sets that variation from `directorWork.contentCommand` when permitted. No Treasures/Souls-specific content command script surfaced in the exact-name sweep.
- Local `ContentGroup` mirrors the retail work surface by queueing `contentGroupWork._globalTemp.director` and `contentGroupWork.property[0..2]` for `/_init`, `contentGroupWork/director`, and `contentGroupWork/property`.
- Local server parity: `Director.StartContentGroup()` calls `contentGroup.Start()`, while `Director.StartDirector(false)` starts the director coroutine but does not start the content group. That is why `SimpleContentMan0l101.onCreate` needs the explicit `director:StartContentGroup()`.
- `ContentGroup` stores the director pointer in `_globalTemp.director`, assigns `currentContentGroup` only for `Character` members, and sends group packets/work values only after `Start()`.
- `Zone.CreateContentAreaInternal` creates the director with `hasContentGroup=true`, allocates a runtime private-area type, and constructs `PrivateAreaContent` with the fourth Lua argument as `privateAreaName`. `PrivateAreaContent` immediately calls its Lua `onCreate(starterPlayer, contentArea, director)`.
- `LuaEngine.GetScriptPath` loads private content scripts from `/content/{PrivateAreaContent.GetPrivateAreaName()}.lua`, confirming that the fourth `CreateContentArea` argument, not the third content-key argument, controls the local Lua file that executes.
- `WorldManager.DoZoneChangeContent` marks the player as entering quest-fight content, registers re-entry, moves the player into the content area, then calls `PrivateAreaContent.NotifyPlayerEntered`. `NotifyPlayerEntered` only marks lifecycle state; it does not add the player to the director or start the content group.
- `Player.IsQuestFightLandingReady()` remains false until the client sends a movement/update packet after content zone-in and at least one second has elapsed. That movement signal is `Session`'s `0x00CA` path, which calls `MarkQuestFightClientMovement("0x00CA")`. `QuestDirectorMan0l101.main` polls this before starting Sisipu's route.
- `PacketProcessor.ShouldCloseMissingOwnerEvent` auto-closes missing-owner `pushDefault` events only inside private area `SimpleContentMan0l101`, which looks like a local recovery shim for unresolved client-side push events during this content.

Quest/common helper evidence:

- `contentsJoinAskInBasaClass` is `ask(worldMaster, 25015, 2, questId)`. It is the retail join prompt only; it does not create content, add director members, or start the content group.
- `startFadeInCutSceneDefault` waits for map load, fades in, then waits for fading.
- `startFadeInCutSceneAfterWarp` calls `player:_fadeInAfterWarp()` outside the `test` zone.
- `processAfterWarpFadeOutGeneral` uses the same after-warp fade helper after a fade-out, so after-warp cutscene methods should keep the event alive until the helper returns.

Concrete stop data from the runtime route file:

| Stop | Label | Waypoint | Sisipu stop position | Mob spawn center | Raw mob | Runtime mob |
| --- | --- | ---: | --- | --- | --- | --- |
| `stop1` | `ambush1` | `33` | `4.4947577, 46.50446, 124.67722` | `32.578903, 44.03618, 127.127205`, radius `6.0`, rot `1.5926859` | `1027` / `2102127` | `1365` / `2205603` |
| `stop2` | `ambush2` | `216` | `69.56269, 42.05113, 467.07703` | `71.78733, 44.387787, 491.77914`, radius `6.0`, rot `-3.0317225` | `1027` / `2102127` | `1365` / `2205603` |
| `stop3` | `ambush3` | `353` | `128.36559, 58.301964, 721.17285` | `105.0175, 63.91706, 729.6756`, radius `6.0`, rot `1.8534657` | `1027` / `2102127` | `1365` / `2205603` |
| `stop4` | `ambush4` | `406` | `53.058277, 62.90943, 799.4605` | `26.256748, 64.264755, 805.20917`, radius `6.0`, rot `1.5016489` | `1027` / `2102127` | `1365` / `2205603` |
| `stop5` | `ambush5` | `636` | `100.17192, 47.823196, 1236.7233` | `105.94929, 54.258743, 1251.3893`, radius `6.0`, rot `-2.6489913` | `1027` / `2102127` | `1365` / `2205603` |

What fires at each stop:

- On stop start, `EscortRouteDirector.TryStartEncounterAtCurrentWaypoint` spawns the mob, makes it engage Sisipu, stops Sisipu, and logs `route=... stop=... waypoint=... mobs=...`.
- On stop clear, `UpdateEncounterStopWait` notices all active mobs are dead, logs `stopCleared`, and sets Sisipu walking.
- On final destination, `CompleteEscortRoute` marks the route complete.
- Generic escort-route system messages exist for start/stop/resume/destination, but `EscortRouteDirector.ShouldSuppressRouteMessages` suppresses them for `treasures_of_the_main`, so the current Treasures path should not show those debug messages.
- The quest-level completion cutscene does not fire from the stop itself; parent `QuestDirectorMan0l101.main` polls `escortDirector:IsEscortRouteComplete()` and then delegates `processEvent605`.
- No stop-level `delegateEvent`, retail event id, or Sisipu line fires from the current backend.

## Implementation Notes

The most retail-aligned current path is:

1. Use `ZEPHYR_TRIGGER` push to ask `contentsJoinAskInBasaClass`.
2. Retail target on accept: start `SEQ_050`, delegate `processEvent604`, create the `SimpleContentMan0l101` runtime content area, and zone into it.
3. Current local caveat: `skipEntryCutsceneForTest = true` bypasses `processEvent604` until the after-warp entry cutscene path is safe to reenable.
4. Let `QuestDirectorMan0l101` own the route and route completion.
5. On successful route completion, delegate `processEvent605`, warp to the corpse scene, then start `SEQ_055`.

Useful local repro hooks:

- `!questcomplete man0l1` / `!questcomplete man0l1 zephyr` stages the player at the Zephyr Gate prompt in `SEQ_048`.
- `!questcomplete man0l1 content` / `!questcomplete man0l1 direct` stages `SEQ_048` and calls the live `startMan0l1Content(player, quest)` path directly.
- The GM helper now names the two `CreateContentArea` string roles explicitly as `contentScript` and `privateAreaName`; the fourth/private-area value is the one that resolves `/content/{name}.lua`.

The main missing proof is the per-ambush retail callback identity. Current local behavior can complete the escort, but it cannot yet reproduce any retail per-stop Sisipu dialogue or event packets because the recovered director is only a stub.

## Souls Gone Wild Retail/Recovered Director Names

Confirmed from recovered client Lua and parity inventory:

- Quest script/class: `Man0g1`
- Quest id/title: `110006`, `Souls Gone Wild`
- Retail quest director classes: `QuestDirectorMan0g101`, `QuestDirectorMan0g102`
- Retail director paths: `/Director/Quest/QuestDirectorMan0g101`, `/Director/Quest/QuestDirectorMan0g102`
- Base class for both: `QuestDirectorBaseClass`

Both recovered director bodies are only class declarations. The parity inventory associates both directors with `man0g1` and marks them as covered by the quest script only, with missing local director implementations.

Alternate decompiler pass produced only the shell bodies for both recovered Souls directors:

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan0g101", "QuestDirectorBaseClass")
```

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan0g102", "QuestDirectorBaseClass")
```

Important naming trap: local `QuestDirectorMan0g001` is not the Souls escort director. It is used by prior quest `man0g0` / `110005` (`Sundered Skies`) with `man0g01`, `SimpleContent30010`, and `Quest/QuestDirectorMan0g001` for the wolf tutorial fight. No `SimpleContentMan0g101`, `SimpleContentMan0g102`, or local `CreateContentArea` call for `man0g1` was found.

## Souls Gone Wild Escort Sequence Flow

The local `Souls Gone Wild` implementation currently uses push triggers, cutscenes, and direct zone/private-area warps rather than a content/director route.

Pre-escort setup:

- `SEQ_050`: dance/emote tutorial with the kids in Gridania private area type `1`
- Completing all six emotes currently calls `processEvent150`, then starts `SEQ_055` and warps to private area type `2`
- `SEQ_055`: `KIDS_TRIGGER` (`1090201`) push calls `processEvent160`, starts `SEQ_060`, then warps back to public Gridania near White Wolf Gate

Escort entry:

- `SEQ_060`: `ESCORT_START_TRIGGER` (`1090202`) push calls `contentsJoinAskInBasaClass`
- On accept (`result == 1`), local code calls `processEvent170`
- It then does `DoZoneChange(player, 150, nil, 0, 15, -644.407, 22.869, -1093.677, -2.416)`
- Local script comments say `DO ESCORT DUTY HERE` and `startMan0g1Content(player, quest)`, but that content path is not implemented
- The quest immediately starts `SEQ_065`

Recovered `processEvent170` is:

- `startFadeOutCutSceneDefault`
- `startNQCutScene("man0g170", 1)`
- `startFadeInCutSceneAfterWarp`

Escort completion:

- `SEQ_065`: `ESCORT_END_TRIGGER` (`1090203`) push calls `processEvent180`
- It then warps to zone `150`, `PrivateAreaMasterPast`, type `1`, at `-769.740, 22.945, -1086.493`, rotation `-1.039`
- Starts `SEQ_070`

Recovered `processEvent180` is:

- `startFadeOutCutSceneDefault`
- `startNQCutScene("man0g180", 1)`
- `startFadeInCutSceneAfterWarp`

Retry/re-entry behavior:

- In `SEQ_070` and `SEQ_071`, pushing `ESCORT_START_TRIGGER` again repeats the same `contentsJoinAskInBasaClass` -> `processEvent170` -> zone `150` -> `SEQ_065` path.

Post-escort:

- `SEQ_070`: `STUMP_TRIGGER` (`1090204`) push calls `processEvent181`, then starts `SEQ_071`
- `processEvent181`: plays `man0g181`, fade in default
- `SEQ_071`: `STUMP_EXIT_TRIGGER` (`1090205`) push calls `processEvent182`, starts `SEQ_072`, and zones back to Gridania at `-192, 5.45, -1069.162`, rotation `-3.136`
- `processEvent182`: plays `man0g182`, fade in after warp
- `SEQ_072`: `BTN_TRIGGER` (`1090046`) push calls `processEvent185`, grants `3000` gil, starts the Miounne linkshell handoff toward `SEQ_075`
- `processEvent185`: plays `man0g185`, fade in default

Final quest completion later happens at `SEQ_105` on `MIOUNNE`:

- delegate `processEventComplete`
- delegate `sqrwa(300, 1, 1, 2)`
- complete quest
- grant `6000` gil and `10000` exp

Recovered `processEventComplete` is a talk-turn method with text ids `325`, `326`, `327`, `328`, `393`, and `394`.

## Souls Gone Wild Stop/Ambush Events

No recovered or local event was found that clearly corresponds to a child escort stop, ambush start, ambush clear, or route-director callback.

Current local behavior has no live escort route director for `man0g1`; it just accepts the duty, plays `processEvent170`, zones into the South Shroud-ish private area, sets `SEQ_065`, and waits for the `ESCORT_END_TRIGGER` push to play `processEvent180`.

Explicit negative checks:

- No `SimpleContentMan0g101`, `SimpleContentMan0g102`, `QuestDirectorMan0g101`, or `QuestDirectorMan0g102` implementation exists under local `Data/scripts`.
- The combined recovered client manifest/class inventory only exposes `director/quest/questdirectorman0g101` and `director/quest/questdirectorman0g102` for these exact `man0g10x` names; no `SimpleContentMan0g*`, `Man0g101`, or `Man0g102` content/private-area script surfaced.
- A filename-level sweep across local scripts, recovered outputs, and generated outputs found no `SimpleContentMan0g*`, `man0g101`, or `man0g102` Lua/LUAC/LPB surface beyond the two shell quest director names.
- No `LoadSoulsGoneWildRoute`, `LoadMan0g1Route`, or equivalent quest-specific route loader is exposed in `Map Server/Lua/LuaEngine.cs`.
- No Souls route JSON was present in `C:\serverdata`; the only quest-specific escort route file found there was `Treasures Of The Main.json`.
- `outputs/quest-execution-atlas-20260630/content_launch_calls.csv` has no `CreateContentArea` or `StartDirector` row for `man0g1`; its launch-ish rows are direct `DoZoneChange`, `WarpToPrivateArea`, and `WarpToPublicArea` calls.
- `tools/outputs/lpb/quest_scenario_parity_contract_20260619/recovered_quest_director_inventory.csv` maps `questdirectorman0g101` and `questdirectorman0g102` to `man0g1` with status `covered_by_quest_script_only_missing_director`.

Nearby methods that look tempting but are not stop callbacks:

- `processEvent180_2`: hermit reminder text after escort start/end area, not an ambush event
- `processEvent150_3` and `processEvent150_4`: kid whisper lines after the emote tutorial
- `QuestDirectorMan0g001`: prior `man0g0` wolf tutorial director, not `Souls Gone Wild`

Text table proof:

- `man0g1` has a complete text join for this pass: `129` text references, `129` joined rows, `0` missing sheet/text rows, `20` rows with no text id.
- `processEvent150_2` is text ids `156` and `157`, kid practice/behavior prompt text.
- `processEvent150_3` and `processEvent150_4` are whisper helpers, text ids `384` and `383`.
- `processEvent180_2` is text id `339`, a reminder to find and return with the younglings after the escort lane.
- `processEvent182_2` is text ids `381` and `382`, post-escort admonishment and Fufucha follow-up text.
- `processEvent185_2` is text ids `317`-`319`, Wailers/Quiver/Wailing Barracks handoff text.

`outputs/quest-fight-needs-implemented-20260701/quest_fight_needs_implemented_by_setting.csv` flags both `Treasures of the Main` and `Souls Gone Wild` as instanced main-scenario fights/content, but no local `man0g1` BNPC spawn/content implementation was found.

## Souls Gone Wild IDs and Layouts

Private areas used by local `man0g1`:

| SQL row | Zone | Type | Music | Proven local use |
| ---: | ---: | ---: | ---: | --- |
| `28` | `206` | `0` | `40` | CNJ guild echo |
| `29` | `206` | `1` | `51` | `SEQ_050` dance |
| `30` | `206` | `2` | `51` | `SEQ_055` kids |
| `31` | `150` | `0` | `52` | `SEQ_060`/`SEQ_065` escort lane |
| `32` | `150` | `1` | `40` | post-escort stump/echo area |
| `33` | `206` | `3` | `40` | Lancer guild echo follow-up |
| `34` | `206` | `4` | `40` | Lancer guild echo follow-up |

Gridania kids and Fufucha:

- `FUFUCHA`: actor `1000237`, path `/Chara/Npc/Populace/PopulaceStandard`, layout/model `1500021`
- `POWLE`: actor `1000238`, layout/model `1000029`, emote id `106`
- `SANSA`: actor `1000239`, layout/model `1100025`, emote id `105`
- `NICOLLAUX`: actor `1000409`, layout/model `1200068`, emote id `107`
- `AUNILLIE`: actor `1000410`, layout/model `1300028`, emote id `108`
- `ELYN`: actor `1000411`, layout/model `1100294`, emote id `122`
- `RYD`: actor `1000412`, layout/model `1000414`, emote id `101`
- `OPYLTYL`: actor `1000236`, layout/model `1600132`

Kid private-area spawn rows:

- `SEQ_050` rows `1078`-`1084`: Fufucha/kids in zone `206`, `PrivateAreaMasterPast`, type `1`
- `SEQ_055` rows `1086`-`1093`: Fufucha/kids plus `KIDS_TRIGGER` in zone `206`, `PrivateAreaMasterPast`, type `2`

Relevant trigger actors:

- `KIDS_TRIGGER`: actor `1090201`, layout/model `0`, push radius `6.0`, row `1093`, zone `206`, `PrivateAreaMasterPast`, type `2`, position `-220.120, 12.065, -1497.212`
- `ESCORT_START_TRIGGER`: actor `1090202`, layout/model `0`, push radius `6.0`; row `1096` in zone `150`, and row `2710` in zone `206`
- `ESCORT_END_TRIGGER`: actor `1090203`, layout/model `0`, push radius `6.0`, row `1097`, zone `150`, position `-723.526, 21.898, -1083.017`
- `STUMP_TRIGGER`: actor `1090204`, layout/model `0`, push radius `6.0`, row `1098`, zone `150`, `PrivateAreaMasterPast`, type `1`, position `-789.144, 21.227, -1071.109`
- `STUMP_EXIT_TRIGGER`: actor `1090205`, layout/model `0`, push radius `6.0`, row `1099`, zone `150`, `PrivateAreaMasterPast`, type `1`, position `-761.730, 22.916, -1089.964`
- `BTN_TRIGGER`: actor `1090046`, layout/model `0`, push radius `6.0`, row `553`, zone `206`, position `-202.91, 18.09, -1477.51`
- These trigger actor classes also use `noticeEvent` plus disabled-by-default `pushDefault` circle conditions in actor data; sequence logic is responsible for enabling the correct live trigger.

Archive/wiki corroboration:

- `docs/ffxiv-1.0-wiki/quest_archive_rows.csv` lists the main-scenario row for `Souls Gone Wild` as level `1`, New Gridania `(6-6)` / Carline Canopy, starter `Miounne`, type `Combat`, prerequisite `Sundered Skies`.
- The sidequest/category row repeats Gridania `(6-6)` / Carline Canopy, starter `Miounne`, type `Combat`, prerequisite `Sundered Skies`.
- `docs/Dat Mining/xtx_quest.csv` row `110006` confirms English title `Souls Gone Wild`, location text for Gridania, offer NPC `Miounne`, and journal references into `xtx/journalxtxFst` rows `16`, `17`, `18`, `19`, `185`, `20`, `180`, `21`, `22`, `137`, `23`, `24`, `25`, `181`, `26`, `27`, `28`, `29`, `30`, `31`, `32`, and `33`.

Marker IDs around the local escort slice:

| Local marker constant | Marker id | Atlas coordinates | Notes |
| --- | ---: | --- | --- |
| `MRKR_S050_KIDS` | `11000609` | `-218.429993, -1493.199951`, map `321` | kids phase marker |
| `MRKR_S055_KIDS_TRIGGER` | `11000610` | `-202.910004, -1477.51001`, map `321` | pre-escort trigger marker |
| `MRKR_S060_ESCORT_START` | `11000611` | `-183.770004, -972.099976`, map `301` | local retry/start marker |
| `MRKR_S065_ESCORT_END` | `11000612` | `-723.130005, -1083.52002`, map `301` | local escort-end marker |
| `MRKR_S070_STUMP_TRIGGER` | `11000613` | `-794.809998, -1060.319946`, map `301` | stump trigger marker |
| `MRKR_S071_STUMP_EXIT_TRIGGER` | `11000614` | `-723.130005, -1083.52002`, map `301` | stump-exit/retry marker |
| `MRKR_S072_BTN_TRIGGER` | `11000615` | `-202.910004, -1477.51001`, map `321` | Botanists' Guild return marker |

Recovered Souls event cluster:

| Method | Recovered behavior | Local owner/use |
| --- | --- | --- |
| `processEvent150` | fade out, `man0g150`, after-warp fade in | completed emote tutorial |
| `processEvent150_2` | talk-turn text ids `156`, `157` | nearby helper/reminder |
| `processEvent150_3` | says text id `384` | kid whisper/helper, not escort stop |
| `processEvent150_4` | says text id `383` | kid whisper/helper, not escort stop |
| `processEvent160` | fade out, `man0g160`, after-warp fade in | `KIDS_TRIGGER` after dance |
| `processEvent170` | fade out, `man0g170`, after-warp fade in | escort duty entry |
| `processEvent180` | fade out, `man0g180`, after-warp fade in | escort duty completion trigger |
| `processEvent180_2` | talk-turn text id `339` | hermit/reminder text, not ambush |
| `processEvent181` | fade out, `man0g181`, default fade in | stump trigger |
| `processEvent182` | fade out, `man0g182`, after-warp fade in | stump exit trigger |
| `processEvent182_2` | talk-turn text ids `381`, `382` | helper/reminder |
| `processEvent185` | fade out, `man0g185`, default fade in | Botanists' Guild return trigger |
| `processEvent185_2` | talk-turn text ids `317`, `318`, `319` | helper/reminder |

## Callsite and Atlas Breadcrumbs

Recovered LPB manifest paths:

- `director/quest/questdirectorman0l101`: `client\script\61s57qvs\tp5rq\tp5rq61s57qvsx9wjyiji.le.lpb`
- `director/quest/questdirectorman0g101`: `client\script\61s57qvs\tp5rq\tp5rq61s57qvsx9wj3iji.le.lpb`
- `director/quest/questdirectorman0g102`: `client\script\61s57qvs\tp5rq\tp5rq61s57qvsx9wj3ijh.le.lpb`
- `quest/scenario/man/man0l1`: `client\script\tp5rq\r75w9s1v\x9w\x9wjyi.le.lpb`
- `quest/scenario/man/man0g1`: `client\script\tp5rq\r75w9s1v\x9w\x9wj3i.le.lpb`

Treasures local callsite proof:

- Current local `Data/scripts/quests/man/man0l1.lua` has `startMan0l1Content` at line `819`.
- `SEQ_048` accepts the duty through `ZEPHYR_TRIGGER` and calls `startMan0l1Content` at line `622`.
- Retry/re-entry branches call `startMan0l1Content` at lines `638` and `647`.
- The `LIGHTHOUSE_TRIGGER` fallback in `SEQ_050` directly delegates `processEvent605` at line `629`, then proceeds to the corpse-scene path.
- `startMan0l1Content` currently has `skipEntryCutsceneForTest = true`, so it skips `processEvent604`; the recovered retail target is still `processEvent604` / `man0l604`.
- `startMan0l1Content` creates the current Lua content tuple at line `833`: `man0l101`, `SimpleContentMan0l101`, `Quest/QuestDirectorMan0l101`. Runtime script lookup resolves through `SimpleContentMan0l101`.
- The local launch now matches the working starter-content order: `StartDirector(false)`, `KickEvent(director, "noticeEvent", true)`, `SetLoginDirector`, then `DoZoneChangeContent`.

Treasures recovered helper methods that are not ambush callbacks:

- `processEvent604_2`: fade-out helper only.
- `processEvent604_3`: default fade-in helper.
- `processEvent604_4`: empty/nil return helper.
- `processEvent605_2`: says text id `119` only.
- `processEvent610_2`: `worldMaster:say(328)`.
- `processEvent615_2`: talk-turn text ids `248` and `249`.

Souls local callsite proof:

- `processEvent170`: three local `onPush` callsites, lines `815`, `844`, and `867`; recovered scene key `man0g170`, cutscene id `11000609`, after-warp fade.
- `processEvent180`: line `830`; recovered scene key `man0g180`, cutscene id `11000610`, after-warp fade.
- `processEvent181`: line `838`; recovered scene key `man0g181`, cutscene id `11000611`, default fade.
- `processEvent182`: line `859`; recovered scene key `man0g182`, cutscene id `11000612`, after-warp fade.
- `processEvent185`: line `882`; recovered scene key `man0g185`, cutscene id `11000613`, default fade.

Cutscene/event lifetime contract from the push atlas:

| Quest | Event | Local owner | Sequence | Scene/cutscene id | Fade/lifetime note |
| --- | --- | --- | --- | --- | --- |
| Treasures | `processEvent604` | `ZEPHYR_TRIGGER` (`1090004`) plus content launch helper | `SEQ_048`/content launch | `man0l604` / `11000208` | after-warp; keep event open until recovered method returns |
| Treasures | `processEvent605` | `LIGHTHOUSE_TRIGGER` (`1090176`) fallback and content-completion path | `SEQ_050`/completion | `man0l605` / `11000209` | after-warp; keep event open until recovered method returns |
| Treasures | `processEvent610` | `WINDWORN_CORPSE` (`1000091`) | `SEQ_055` | `man0l610` / `11000210` | default fade; caller ends event after delegate |
| Treasures | `processEvent615` | `SISIPU` (`1000156`) | `SEQ_060` | `man0l615` / `11000211` | after-warp; keep event open until recovered method returns |
| Treasures | `processEvent620` | `FSH_TRIGGER` (`1090006`) | `SEQ_065` | `man0l620` / `11000212` | default fade; caller ends event after delegate |
| Souls | `processEvent170` | `ESCORT_START_TRIGGER` (`1090202`) | `SEQ_060`, retry branches in `SEQ_070`/`SEQ_071` | `man0g170` / `11000609` | after-warp; keep event open until recovered method returns |
| Souls | `processEvent180` | `ESCORT_END_TRIGGER` (`1090203`) | `SEQ_065` | `man0g180` / `11000610` | after-warp; keep event open until recovered method returns |
| Souls | `processEvent181` | `STUMP_TRIGGER` (`1090204`) | `SEQ_070` | `man0g181` / `11000611` | default fade; caller ends event after delegate |
| Souls | `processEvent182` | local owner is `STUMP_EXIT_TRIGGER` (`1090205`) | `SEQ_071` | `man0g182` / `11000612` | after-warp; atlas also lists `ESCORT_START_TRIGGER` as an owner candidate because the retry trigger is enabled in the same sequence |
| Souls | `processEvent185` | `BTN_TRIGGER` (`1090046`) | `SEQ_072` | `man0g185` / `11000613` | default fade; caller ends event after delegate |

Cutscene argument contract:

- `outputs/quest-cutscene-argument-atlas-20260630/cutscene_argument_requirements.csv` classifies Treasures `processEvent604`, `605`, `610`, `615`, and `620` as `ctx_only_nq_hq`, `arg_count=3`, with no `required_runtime_args`.
- The same atlas classifies Souls `processEvent150`, `160`, `170`, `180`, `181`, `182`, and `185` as `ctx_only_nq_hq`, `arg_count=3`, with no `required_runtime_args`.
- Practical result: the missing piece for these escort cutscenes is not an extra payload tuple. The risky part is event lifetime and ordering. After-warp delegates (`604`, `605`, `615`, `150`, `160`, `170`, `180`, `182`) should keep the event open until the recovered method returns; default-fade delegates (`610`, `620`, `181`, `185`) expect the caller to end the event after the delegate.

Cut replay and asset crosscheck:

| Quest | Scene | Replay id | Fade modes in replay atlas | Client cut assets | Placeholder args |
| --- | --- | ---: | --- | --- | --- |
| Treasures | `man0l604` | `11000208` | `after_warp;default` | yes, `3` files / `2` dataset files | all replay slots `-200` |
| Treasures | `man0l605` | `11000209` | `after_warp;default` | yes, `3` / `2` | all replay slots `-200` |
| Treasures | `man0l610` | `11000210` | `default` | yes, `8` / `7` | all replay slots `-200` |
| Treasures | `man0l615` | `11000211` | `after_warp;default` | yes, `3` / `2` | all replay slots `-200` |
| Treasures | `man0l620` | `11000212` | `default` | yes, `6` / `5` | all replay slots `-200` |
| Souls | `man0g150` | `11000607` | `after_warp` | yes, `4` / `3` | all replay slots `-200` |
| Souls | `man0g160` | `11000608` | `after_warp` | yes, `10` / `9` | all replay slots `-200` |
| Souls | `man0g170` | `11000609` | `after_warp` | yes, `3` / `2` | all replay slots `-200` |
| Souls | `man0g180` | `11000610` | `after_warp` | yes, `5` / `4` | all replay slots `-200` |
| Souls | `man0g181` | `11000611` | `default` | yes, `5` / `4` | all replay slots `-200` |
| Souls | `man0g182` | `11000612` | `after_warp` | yes, `5` / `4` | all replay slots `-200` |
| Souls | `man0g185` | `11000613` | `default` | yes, `6` / `5` | all replay slots `-200` |

This proves the scene names and replay ids exist in retail/client data, but the replay rows do not carry hidden ambush-stop arguments or trigger geometry. Every checked replay row uses the `-200` literal zero/default placeholder in slots `9`-`15`.

Cutscene surface completeness pass:

- `outputs/quest-execution-atlas-20260630/quest_event_cutscene_push_map.csv` has `20` recovered cutscene-map rows for `man0g1`: `18` scene-key rows and `2` no-scene helper rows. All `20` have local delegate callers.
- The same map has `24` rows for `man0l1`: `16` scene-key rows and `8` no-scene/helper rows. `18` rows have local delegate callers.
- The `6` `man0l1` rows without local delegate callers are `processEvent604_2` fade-out helper, `processEvent604_3` fade-in helper, `processEvent637` linkshell/after-warp helper, `processEvent1000_7` ask helper, `processEventTu_001` tutorial helper, and `processEventTalkMenuManCutPreview` replay-preview helper.
- None of those six rows is a Sisipu/Ankle Biter route-stop callback. The only non-delegated after-warp row with quest-content relevance is `processEvent637`, covered below.

Recovered linkshell helper caveat:

- The generated push queue also flags Treasures `processEvent637` as missing locally. That method is not an escort stop or ambush callback.
- Recovered `processEvent637` sends Baderon linkshell text ids `161`-`164`, waits between lines, then calls `startFadeInCutSceneAfterWarp`. It has no scene key and no cutReplay row.
- Local `man0l1.lua` already stores the same ids in `NPCLS_MSGS[4] = {161, 162, 163, 164}`. The local `SEQ_085` exit from the armorer echo calls `processEvent635`, starts `SEQ_090`, raises `quest:NewNpcLsMsg(1)`, and `onNpcLS` maps `SEQ_090`/`SEQ_092` to that message pack.
- Practical read: retail appears to have an inline linkshell/fade helper for the post-Hnaanza public-warp handoff; the local server approximates it with the reusable linkshell notification system. This is a real non-escort parity gap, but not evidence for per-ambush Sisipu events.
- Souls has the same family shape: recovered `processEvent013` and `processEvent013_2` inline Miounne linkshell rows, while local `man0g1.lua` centralizes many linkshell sequences through `NPCLS_MSGS` and `onNpcLS`. Treat inline linkshell helper gaps separately from escort route/content gaps.

Reconciliation against the newer push-recipe/contract atlases:

- `outputs/quest-push-recipe-atlas-20260630/cutscene_push_recipes.csv` classifies the Treasures event cluster `604/605/610/615/620` as `implemented_exact_delegate`, `existing_local_exact`, and `exact_route_sequence_match`.
- The same atlas classifies Souls `150/160/170/180/181/182/185` as `implemented_exact_delegate`, `existing_local_exact`, and `exact_route_sequence_match`.
- `outputs/quest-cutscene-push-contract-atlas-20260630/cutscene_push_contracts.csv` infers the same Treasures owners as the local script: `604` -> `ZEPHYR_TRIGGER`, `605` -> `LIGHTHOUSE_TRIGGER`, `610` -> `WINDWORN_CORPSE`, `615` -> `SISIPU`, `620` -> `FSH_TRIGGER`.
- For Souls, the contract atlas agrees on `170` -> `ESCORT_START_TRIGGER`, `180` -> `ESCORT_END_TRIGGER`, `181` -> `STUMP_TRIGGER`, and `185` -> `BTN_TRIGGER`. For `182`, the local exact caller is `STUMP_EXIT_TRIGGER`, but the owner inference row also names `ESCORT_START_TRIGGER` because the retry trigger is enabled in `SEQ_071`; treat `STUMP_EXIT_TRIGGER` as the live owner and the `ESCORT_START_TRIGGER` row as an inference artifact/candidate.
- Several generated atlas line numbers predate the current local refactor. Use the live source line refs in this note over generated line refs when they disagree.

Atlas state and stale rows:

- `outputs/quest-fight-needs-implemented-20260701/quest_fight_needs_implemented_by_setting.csv` flags both `Treasures of the Main` and `Souls Gone Wild` as instanced main-scenario content.
- `outputs/quest-master-gap-atlas-20260630/quest_runtime_gap_queue.csv` marks `Treasures` as `P0_enablement_risk` with gaps around local scene push, after-warp ordering, normalized rewards, and private content lifecycle.
- The same runtime queue marks `Souls` as `P3_content_gap`, manual review, with no content tuple and gaps around after-warp ordering and normalized rewards.
- Older/generated fight atlases still point `man0l1` at `Man0l101:SimpleContent30002:Quest/QuestDirectorMan0l101` and jellyfish actor `2205403`. That row is stale for the current Sisipu escort route; use it only when auditing the older `SimpleContent30002` surface.
- `outputs/quest-runtime-deep-atlas-20260630/local_content_area_launches.csv`, `outputs/quest-fight-materialization-atlas-20260630/fight_content_lifecycle_join.csv`, and `outputs/quest-fight-materialization-atlas-20260630/fight_actor_mob_spawn_join.csv` are examples of that stale surface: they still report `Man0l101`, `SimpleContent30002`, line `839`, `SEQ_090`, and jellyfish actor `2205403`.
- Current workspace truth for `Treasures` is Lua tuple `man0l101:SimpleContentMan0l101:Quest/QuestDirectorMan0l101`, runtime content script/private area `SimpleContentMan0l101`, and route unique id `man0l1_sisipu_escort`.

## Combined Takeaways

`Treasures of the Main` currently has a local bespoke content/escort implementation: Lua tuple `man0l101`, `SimpleContentMan0l101`, `Quest/QuestDirectorMan0l101`; runtime content script/private area `SimpleContentMan0l101`; and route unique id `man0l1_sisipu_escort`.

`Souls Gone Wild` has recovered retail director names (`QuestDirectorMan0g101`, `QuestDirectorMan0g102`) but no local director/content implementation. The current local escort is a trigger and warp scaffold around `processEvent170` and `processEvent180`.

Both quests share the same core proof gap: recovered retail director bodies are stubs, so per-content callbacks and per-stop/per-ambush events cannot be verified from recovered Lua alone. `Treasures` fills that gap locally with `EscortRouteDirector`; `Souls` does not yet have an equivalent route/content surface.
