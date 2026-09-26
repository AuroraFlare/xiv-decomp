# Yokimitsuro Decomp Cutscene/Director Bridge - 2026-06-13

This note connects the two Yokimitsuro repositories to the local
cutscene/content audit. The local audit already mapped the client Lua,
LPB, DAT, replay rows, and physical `client/cut` assets. The new value
from these external repos is native/protocol confidence: which event,
notice, WorkSync, and cutscene subhandler paths carry those scene keys.

## Source Snapshots

- `FFXIVLegacyClientStructs`: https://github.com/Yokimitsuro/FFXIVLegacyClientStructs at `6e68d2875278ea82b3b27a7636e8d968aeaa70ea`
- `ffxivDecomp`: https://github.com/Yokimitsuro/ffxivDecomp at `bc485d8d4de79d80c23eb8feddbfcebfbb6daab5`
- Local baseline: `docs/content_systems_decomp_audit_2026-06-12.md`

## Vocabulary Translation

The external notes use client-perspective direction names:

- Yokimitsuro "Zone outbound" means client to server. In this repo that maps to `Map Server/Packets/Receive`.
- Yokimitsuro "Zone inbound" means server to client. In this repo that maps to `Map Server/Packets/Send`.
- The `0x00fdfb80` table is a second-level client receive sub-opcode table. Do not confuse its small entries such as `4..18` with this repo's top-level packet opcodes such as `0x0130`.

## Packet Bridge

| Direction | Opcode | Local class | External meaning | Use for content/cutscenes |
|---|---:|---|---|---|
| Client to server | `0x012D` | `EventStartPacket` | tagged event/notice container, including `callServerOnX` simple variant | Notice authorization, command/talk/emote/push starts, event waits |
| Client to server | `0x012E` | `EventUpdatePacket` | event update/resume payload | Resume active events with returned Lua params |
| Client to server | `0x012F` | `WorkSyncRequestPacket` | `_updateWork` / WorkSync request | Director, character, item, and group state requests |
| Server to client | `0x0130` | `RunEventFunctionPacket` | invoke Lua function on an active event owner | Call `startEvent`, `cutSceneEvent`, `exitCutScene`, `_onReceiveDataPacket`, etc. |
| Server to client | `0x0131` | `EndEventPacket` | close active client event | Release event/cutscene wait state after completion |
| Server to client | `0x0137` | `SetActorPropetyPacket` | server-side work/property push in this repo | Sync `directorWork`, `guildleveWork`, `areaWork`, and related values |

Important server implication: `callServerOnX` is confirmed as a server
authorization checkpoint. Client Lua can run a lot of the content locally,
but it suspends on notice-like transitions until the server accepts or
rejects. Reliable instanced cutscenes therefore need both halves:

1. Accept the client's `0x012D` notice/event start when the transition is valid.
2. Use `0x0130 RunEventFunctionPacket` to call the right director function with the scene key and timing args.

## Native Cutscene Subhandlers

The external `ffxivDecomp` cutscene block closes the client receive
sub-opcodes for the native clip lifecycle:

| Sub-opcode | Hook | Role |
|---:|---|---|
| `4` | `_onTargetChanged` | desktop target soft update |
| `5` | `_onTargetDecided` | desktop target commit |
| `7` | `_onInitializationClip("PreviewSetupClip", ...)` | preview-mode cutscene init |
| `8` | `_onInitializationClip("Personage", ...)` | normal cutscene init |
| `9` | `_onShowUIClip` | show UI clip |
| `10` | `_onHideUIClip` | hide UI clip |
| `11` | `_onShowWidgetClip` | show widget clip |
| `12` | `_onHideWidgetClip` | hide widget clip |
| `13` | `_onOpenUIClip` | open UI clip |
| `14` | `_onFinalizeClip` | finalize cutscene objects |
| `17` | `_onPreCutSceneCancel` | begin cancel |
| `18` | `_onPostCutSceneCancel` | finish cancel |

These validate the client-native clip lifecycle, but normal server code
should usually not hand-send this sequence directly. The safer server
entrypoint is still the director/event function path: pass the scene key
to client Lua and let `worldMaster:createCutScene(...):startCutScene(...)`
drive the native clip block.

## InstanceRaid Cutscene Entry Points

The actionable live-duty entrypoints are:

- `InstanceRaidBaseClass.startEvent(cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType, ...)`
- `InstanceRaidBaseClass.cutSceneEvent(cutsceneName, ...)`
- `InstanceRaidBaseClass.exitCutScene(cutsceneName, owner, modeFlag)`

All three normalize into the client cutscene system through
`executeCutScene`, which calls `startCutScene(1, 63, mode, ...)`.
Use `cutsceneName == "none"` for no entry cutscene.

The following are not hidden scene-key launchers:

- `reloginEvent`
- `clearEvent`
- `failedEvent`
- `_onReceiveDataPacket` types `1`, `2`, and `3`

The older occupancy dungeon lane is separate and uses
`startCutScene(1, 61, 1, 0, arg)`.

## Scene-Key Status

Already strong from the local audit:

| Content path | Known live/static keys | Status |
|---|---|---|
| Toto-Rak occupancy | `rad0f300`, `rad0f306`, `rad0f307`, `rad0f308` | Direct live literals and replay/assets present |
| Dzemael occupancy | `rad0r100`, `rad0r106` | Direct live literals and replay/assets present |
| Lesser Ifrit | `GC010105` | Direct live subclass literal |
| Rivenroad / WhiteGeneral | `gc010715` | Direct live subclass literal |
| Aurum Vale | `rad0r400..rad0r403`, replay ids `11082301..11082304` | Identity/static absence high; exact live server arg still not proven |
| Cutter's Cry | `rad0w500..rad0w503`, replay ids `11082401..11082404` | Identity/static absence high; exact live server arg still not proven |
| Castrum / Beacon preface | `bcn0l*` family | Client path proven; exact retail arg still missing |

The external data raises confidence in the packet/native delivery path,
not in the missing dynamic server values themselves. Exact Aurum/Cutter
launch timing and Beacon `bcn0l*` selection remain capture/table problems.

## Hamlet Defense Bridge

The external Hamlet finding gives concrete client-side shape that lines
up with our current Hamlet work:

- Content IDs `8`, `9`, `10` map to Hamlet IDs `1`, `2`, `3`.
- `InstanceRaidHamletDefense` extends `InstanceRaidBaseClass`.
- Hamlet temp state includes rank, hamlet id, cargo target, battle value,
  boss flag, three harvest states, three defense-line states, four goods
  states, and six field-buff flags.
- `_onReceiveDataPacket(A1=3, eventType, ...)` dispatches 28 Hamlet user
  message/event types.
- Major popup events are in the `21..28` range.
- Hamlet master NPC ids are `1600146`, `1200220`, `1000062`.

Implementation implication: the current guildleve-compatible Hamlet HUD
path is useful as a bootstrap, but the retail-shaped path should move
toward `InstanceRaidHamletDefense.startEvent(...)` plus targeted
`_onReceiveDataPacket(3, eventType, ...)` calls once the notice/event
resume loop is stable.

## Chocobo Caravan Bridge

The external `CaravanGuardDirector` shape is richer than the current
single-companion local implementation:

- Init args: `town`, `placeStart`, `placeEnd`, `name1`, `name2`, `name3`.
- Three caravan/chocobo entities are tracked in parallel.
- Sync fields include `step`, `progressPer`, `finishTime`,
  `chocoboStatus[3]`, `chocoboHPStatus[3]`, and marker coordinates
  `markerX/Y/Z[3]`.
- Sync tags split updates into `step`, `progress`, `status`, and `hp`.
- `step < 40` is transit; `step >= 40` triggers town arrival effects
  `14`, `15`, or `16`.

Implementation implication: our current caravan director is a good
functional scaffold, but a retail-shaped implementation needs three
tracked escort actors, per-actor HP/status, and the four tag-style update
groups instead of one progress objective.

## Practical Next Steps

1. Add a typed helper around `RunEventFunctionPacket` for director calls:
   `CallDirectorFunction(player, director, functionName, params)`.
2. Add explicit wrappers for instance cutscenes:
   `StartInstanceRaidEvent`, `PlayInstanceRaidCutscene`, and
   `PlayInstanceRaidExitCutscene`.
3. Keep accepting and closing client `0x012D` notice starts cleanly; this
   is what wakes the client's notice wait/resume path.
4. Extend `DirectorWork` only when a client path needs the full sync buffer;
   `contentCommand/contentCommandSub` is enough for command variation, but
   Hamlet and retail instance scripts need their own work layouts.
5. Create a data table for per-content default scene args. Seed it with
   the proven literals above, and keep Aurum/Cutter/Beacon dynamic values
   marked as unproven until capture or table evidence supplies them.

Bottom line: these repos are extremely useful. They connect our static
scene-key inventory to the event/notice/native paths that actually deliver
cutscenes in live content. They do not remove the need for retail server
args where the client intentionally receives the scene key dynamically.
