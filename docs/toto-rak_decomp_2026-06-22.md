# Toto-Rak Decomp Notes

Generated: 2026-06-22

Scope: legacy 1.0 Toto-Rak occupancy dungeon client Lua, local server bridge behavior, widget/cutscene call contracts, and packet-order evidence. This file separates recovered client behavior from current local implementation and from unproven retail capture claims.

## Status

- Recovered client class: `RaidFst0Dungeon03`, old occupancy lane.
- Local content target: The Thousand Maws of Toto-Rak, zone `159`, place/display id `2123`, occupancy content id `1`.
- Execution widget: `RaidDungeonExecutionWidget`.
- Opening scene: `rad0f300`.
- Ending/close scenes known in the recovered director: `rad0f306`, `rad0f307`, `rad0f308`.
- No real Toto-Rak retail pcap/pcapng/pkt trace was found locally.

## High-confidence summary

1. Toto-Rak does not use the modern `InstanceRaidBaseClass` lifecycle in the recovered legacy director. It uses `/Director/Occupancy/RaidFst0Dungeon03`, derived from `OccupancyDirectorBaseClass`.
2. `RaidFst0Dungeon03.eventNoticeCutScene(player, sceneKey, cutsceneArg, finishTime)` is the core old-dungeon cutscene/widget callback.
3. `RaidFst0Dungeon03.relogin(player, finishTime, clearFlag)` is the old-dungeon rejoin/login UI refresh callback.
4. `processUIFinalize` and `widgetSetOff` only close `RaidDungeonExecutionWidget`.
5. The exact recovered cutscene start shape is:

   ```lua
   worldMaster:createCutScene(sceneKey, self):startCutScene(1, 61, 1, 0, cutsceneArg)
   ```

   For normal Toto-Rak opening:

   ```lua
   worldMaster:createCutScene("rad0f300", self):startCutScene(1, 61, 1, 0, 1)
   ```

6. The script calls:

   ```lua
   desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
   ```

   but the recovered connector forwards only `contentId` and `finishTime` into the widget. The `2123` first argument is not passed into `RaidDungeonExecutionWidget.init`.

7. Current local server behavior now partially matches the hypothesized
   login-director piece: Toto-Rak entry/rejoin/opening prep attaches the
   occupancy director and sets `loginInitDirector` before zone-in, so the
   self-player bind can use the login-director `Player_work` shape. This is
   still not a retail trace; local `SendZoneInPackets` emits the my-player bind
   before owned director spawn/init, and the async opener clears the login
   director after send/timeout.
8. Native `RunEventFunction` only supplies the Lua receiver (`self`) by
   dispatching on the owner actor. It does not insert the `player` parameter.
   For `RaidFst0Dungeon03.relogin`, the packet Lua params must be
   `[player, finishTime, false]`. A packet with `[finishTime, false]` can ACK
   without producing the widget side effect.
9. Current dirty-tree Toto-Rak relogin senders now include that `player`
   argument on both current-event and explicit type-5 lanes. Older no-widget
   traces/notes that described `[finishTime, false]` are historical for the
   current working tree.
10. Correct-arg relogin ACK plus no system-command `24228` means the failure is
    either native `0x0130` dispatch/readiness ACKing without the Lua method body,
    or the desktop command bridge refusing before the server-visible command:
    slot/type/mode guards, stale slot 15, desktop readiness, or
    `commandAboutWidget` suppression. A fresh `0x0132 widgetCreate` is not
    expected for every open; spawn-time `0x0132 widgetCreate` is the command
    lane bootstrap.
11. Confidence boundary: the current local owner/source/order is 99%+ from
   source plus 2026-06-22 runtime logs. Retail order remains capture-bound
   because no raw retail Toto-Rak trace was found locally.

## Primary recovered client sources

- `tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/raidfst0dungeon03.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/raidroc0dungeon01.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/occupancydirectorbaseclass.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/area/privatearea/occupancy/raiddungeonsimple.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/itemlistwidget.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/itemsharewidget.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/widget/raiddungeonexecutionwidget.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/ask/treasurelistwidget.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/gamedata/cutscene_common.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/world/worldmaster.lua`
- `tools/outputs/lpb/loot_list_reward_surface_contract_20260619/*`
- `tools/outputs/lpb/instance_raid_director_base_contract_20260619/*`

## `RaidFst0Dungeon03` recovered class

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/raidfst0dungeon03.lua`

Class declaration:

```lua
require("/Director/Occupancy/OccupancyDirectorBaseClass")
_defineClass("RaidFst0Dungeon03", "OccupancyDirectorBaseClass")
```

Recovered methods:

| Method | Args | Behavior |
| --- | --- | --- |
| `initForEvent` | `self` | Empty. |
| `processUIFinalize` | `self` | `desktopWidget:closeRaidDungeonExecutionWidget()`. |
| `eventNoticeCutScene` | `self, player, sceneKey, cutsceneArg, finishTime` | Optional fade out, close widget for ending scenes, play mode-61 cutscene, fade in, open timer widget, show raid-start notification. |
| `relogin` | `self, player, finishTime, clearFlag` | Fade in from notice-event loading, open timer widget if `clearFlag == false`. |
| `widgetSetOn` | `self, ...` | Empty. |
| `widgetSetOff` | `self` | `desktopWidget:closeRaidDungeonExecutionWidget()`. |
| `debugSelect` | `self` | Returns nil. |

No literal `noticeEvent` method is recovered on `RaidFst0Dungeon03`. `noticeEvent` is the event channel/context used to deliver the callback.

### `eventNoticeCutScene`

Recovered control shape:

```lua
function RaidFst0Dungeon03.eventNoticeCutScene(self, player, sceneKey, cutsceneArg, finishTime)
  if sceneKey ~= "rad0f300" then
    player:_fadeOut(1)
    if sceneKey == "rad0f306" or sceneKey == "rad0f307" or sceneKey == "rad0f308" then
      desktopWidget:closeRaidDungeonExecutionWidget()
    end
    player:_waitFading()
  end

  worldMaster:createCutScene(sceneKey, self):startCutScene(1, 61, 1, 0, cutsceneArg)
  worldMaster:createCutScene(sceneKey, self):_delete()
  player:_fadeIn(1)

  desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
end
```

Important details:

- `rad0f300` skips the explicit pre-cutscene `player:_fadeOut(1)` branch.
- `rad0f306`, `rad0f307`, and `rad0f308` close the execution widget before cutscene playback.
- The cutscene owner is `self`, the `RaidFst0Dungeon03` director.
- The cutscene mode is `61`.
- The fifth `startCutScene` argument is `cutsceneArg`.
- After the cutscene, the timer widget is reopened and general notification type `3` is posted.
- The decompiled body contains an unconditional `if true then` around the
  post-cutscene widget reopen and general notification, so every scene driven
  through this callback reopens `RaidDungeonExecutionWidget`.

### `relogin`

Recovered control shape:

```lua
function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
end
```

Meaning:

- `finishTime` is an absolute server-time scalar used by the widget to compute remaining time.
- `clearFlag == false` means the content is still active, so the execution widget opens.
- If `clearFlag == true`, the relogin callback only clears the loading/fade state.
- The duty widget open is a direct Lua side effect of this callback, not a
  generic widget property update.
- The callback reaches `desktopWidget:openRaidDungeonExecutionWidget(2123, 1,
  finishTime)`, whose recovered connector opens widget slot `15`.

### `processUIFinalize` and `widgetSetOff`

Both close `RaidDungeonExecutionWidget`:

```lua
desktopWidget:closeRaidDungeonExecutionWidget()
```

`widgetSetOn` exists but is empty.

## Local Toto-Rak occupancy adapter

Source:

`Data/scripts/directors/Occupancy/RaidFst0Dungeon03.lua`

Local script identity:

```lua
function init()
    return "/Director/Occupancy/RaidFst0Dungeon03";
end
```

Local public functions:

| Function | Args | Local bridge |
| --- | --- | --- |
| `relogin` | `player, director, finishTime, clearFlag` | `OccupancyDungeonSendRelogin(player, director, "totorak", finishTime, clearFlag)` |
| `eventNoticeCutScene` | `player, director, sceneKey, cutsceneArg, finishTime` | `OccupancyDungeonSendEventNoticeCutScene(player, director, "totorak", sceneKey, cutsceneArg, finishTime)` |
| `processUIFinalize` | `player, director` | `OccupancyDungeonSendUiFinalize(player, director)` |
| `widgetSetOff` | `player, director` | `OccupancyDungeonSendWidgetClose(player, director)` |

Local event handler shape:

```lua
function onEventStarted(player, director, eventType, eventName, command, ...)
    local shouldEndEvent = true;

    if (command == "eventNoticeCutScene") then
        OccupancyDungeonCallCurrentEventNoticeCutScene(player, PROFILE_KEY, ...);
    elseif (command == "relogin") then
        OccupancyDungeonCallCurrentRelogin(player, PROFILE_KEY, ...);
    elseif (command == "widgetSetOff" or command == "close") then
        OccupancyDungeonCallCurrentWidgetClose(player);
    elseif (command == nil or command == false) then
        OccupancyDungeonCallSetup(player);
        shouldEndEvent = false;
    else
        OccupancyDungeonCallSetup(player);
    end

    if (shouldEndEvent and player ~= nil) then
        player:EndEvent();
    end
end
```

Dispatch signature rationale:

- Client `EventStart` enters `LuaEngine.EventStarted`.
- `LuaEngine.EventStarted` prepends `eventType` and `eventName`.
- `Director.OnEventStart` then prepends `player` and `director`.
- Therefore local director `onEventStarted` receives:

  ```text
  player, director, eventType, eventName, command, ...
  ```

## Local occupancy widget helper

Source:

`Data/scripts/occupancy_dungeon_widget.lua`

Toto-Rak profile:

```lua
totorak = {
    scriptPath = "Occupancy/RaidFst0Dungeon03",
    classPath = "/Director/Occupancy/RaidFst0Dungeon03",
    displayId = 2123,
    contentId = 1,
    openingScene = "rad0f300",
    openingCutsceneArg = 1,
    closeScenes = {
        rad0f306 = true,
        rad0f307 = true,
        rad0f308 = true
    }
}
```

Dzemael comparator profile:

```lua
dzemael = {
    scriptPath = "Occupancy/RaidRoc0Dungeon01",
    classPath = "/Director/Occupancy/RaidRoc0Dungeon01",
    displayId = 4102,
    contentId = 2,
    openingScene = "rad0r100",
    openingCutsceneArg = 1,
    closeScenes = {
        rad0r106 = true
    }
}
```

Setup sent before recovered callbacks:

```lua
OccupancyDungeonSendSetup(player)
OccupancyDungeonCallSetup(player)
```

Current local setup caveat:

- `OccupancyDungeonSendSetup(player)` is still a no-op that returns `true` when
  `player` is non-nil.
- `OccupancyDungeonCallSetup(player)` now sends `_setInstanceRaid(true)` and
  `_loadTextDataPermanently()` through `callClientFunction`.
- Those setup function names remain important retail-capture questions. They
  are setup/state packets, not the slot-15 widget open itself.

Local helper calls:

```lua
OccupancyDungeonSendRelogin(player, director, "totorak", finishTime, false)
OccupancyDungeonSendEventNoticeCutScene(player, director, "totorak", "rad0f300", 1, finishTime)
OccupancyDungeonSendWidgetClose(player, director)
OccupancyDungeonSendUiFinalize(player, director)
```

Run function bridge:

- Public/direct bridge preferred path:

  ```lua
  director:SendDirectorEventFunction(player, functionName, ...)
  ```

- Public/direct bridge fallback:

  ```lua
  player:RunEventFunction(functionName, ...)
  ```

Current-event bridge used by `onEventStarted`:

```lua
callClientFunction(player, functionName, ...)
```

Locally this reaches `player:RunEventFunction(...)`, so the outgoing
`0x0130` uses the player's current event owner/name/type established by the
client's `0x012D EventStart`.

## Widget call details

Recovered caller:

```lua
desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
```

Recovered connector:

Source:

`tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua`

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, arg1, arg2, arg3)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, arg2, arg3)
end
```

Effective signature:

```text
openRaidDungeonExecutionWidget(self, unusedOrDisplayId, contentId, finishTime)
```

For Toto-Rak:

```text
openRaidDungeonExecutionWidget(2123, 1, finishTime)
```

Effective widget initializer args:

```text
RaidDungeonExecutionWidget.init(contentId = 1, finishTime = finishTime)
```

Important correction:

- Older generated CSV text described the first arg as display id.
- The actual recovered connector discards the first arg and passes only `arg2` and `arg3` to `openWidgetYield`.
- `2123` is still a meaningful DAT place/display id for Toto-Rak, but not an initializer arg for `RaidDungeonExecutionWidget`.

Close connector:

```lua
desktopWidget:closeRaidDungeonExecutionWidget()
```

The connector closes widget slots `15` and `16`.

Exact recovered connector body:

Source:

`tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua`

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentId, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
end

function DesktopWidget.closeRaidDungeonExecutionWidget(self)
  self:closeWidget(15, nil)
  self:closeWidget(16, nil)
end
```

Layer meaning from the recovered widget/layer matrix:

- Layer `15`: `RaidDungeonExecutionWidget`.
- Layer `16`: adjacent raid/hamlet popup layer; raid close clears it too.
- The `unused` first argument is where legacy callers pass `2123` for Toto-Rak or `4102` for Dzemael.
- The actual widget initializer receives only `contentId` and `finishTime`.

## `RaidDungeonExecutionWidget`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/widget/raiddungeonexecutionwidget.lua`

Recovered shape:

```lua
function RaidDungeonExecutionWidget.init(self, contentId, finishTime)
  self:setContents(contentId)
  self:setTimer(finishTime)
end

function RaidDungeonExecutionWidget.setContents(self, contentId)
  self:setText("TextBlock_ContentsName", 10051, contentId)
end

function RaidDungeonExecutionWidget.setTimer(self, finishTime)
  local remaining = finishTime - worldMaster:_getServerTime()
  -- applies timer properties to CustomControl_TimerLabel
end
```

Timer properties:

- `CustomControl_TimerLabel IntData.Value0 = 1`
- `FloatData.Value0 = remaining`
- `FloatData.Value1 = 0`
- `FloatData.Value2 = 300`
- `IntData.Value1 = 300`
- `IntData.Value2 = 120`

Content name:

- Uses text row `10051` with content id `1` for Toto-Rak.
- The same widget is also used by the modern instance-raid base lane, which calls `openRaidDungeonExecutionWidget(nil, contentId, finishTime)`.
- The widget does not keep the display/place id. It displays the content name through row `10051` and the `contentId` argument.

Text row `10051`:

Source:

`docs/Dat Mining/xtx__text_ui.csv`

```text
10051, "[@SHEET(xtx/raidDungeon,$E8(1),25)]", ...
```

So `setContents(contentId)` resolves the visible label through `xtx/raidDungeon`, not through the discarded place/display id.

SQWT assets:

Source:

`tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_terminal_structure_deep.csv`

- `sqwt/widget/RaidDungeonExecutionWidget.form`: exists, `2903` bytes, SQEX header, window-family.
- `sqwt/widget/RaidDungeonExecutionWidget.tpl`: exists, `645` bytes, SQEX header, dictionary-family.
- `RaidDungeonStartWidget`, `RaidDungeonSuccessWidget`, and `RaidDungeonFailureWidget` SQWT assets also exist nearby.
- These assets were identified structurally; they remain packed/undecoded in the local extraction.

### `openWidgetYield` guards and slot 15

Recovered connector chain:

```text
openRaidDungeonExecutionWidget(2123, 1, finishTime)
  -> openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1, finishTime)
  -> openWidget(slot=15, widgetName="RaidDungeonExecutionWidget", alias=nil, parent=nil, show=true, 1, finishTime)
  -> openWidgetLocal(widgetName="RaidDungeonExecutionWidget", alias=nil->same, parent=nil->desktopWidget, slot=15, show=true, 1, finishTime)
  -> commandCreateWidget("RaidDungeonExecutionWidget", false, desktopWidget, inputEnable=true, "RaidDungeonExecutionWidget", 15, true, 1, finishTime)
  -> player:commandAboutWidget(player:getSystemCommand(24228), false, "RaidDungeonExecutionWidget", desktopWidget, true, "RaidDungeonExecutionWidget", 15, true, 1, finishTime)
```

Recovered `DesktopWidget.commandCreateWidget(self, widgetName, cancelFlag, ...)`
is only this wrapper:

```lua
return worldMaster:_getMyPlayer():commandAboutWidget(
  worldMaster:_getMyPlayer():getSystemCommand(24228),
  cancelFlag,
  widgetName,
  ...
)
```

Slot/type gates:

- Slot `15` is the raid/hamlet execution-widget family.
  `WidgetBaseClass.getWidgetTypeByIndex(15)` has been rechecked against the
  raw Lua 5.1 proto and returns `5`. Older notes and native labels calling this
  "widget type 4" are a legacy/zero-based family label, not the Lua array index.
  The actual guard uses the returned value:

  ```lua
  local widgetType = self:getWidgetTypeByIndex(15)
  if self.work.widgetEnableFlag[widgetType] == false then return false end
  ```

  Therefore the live probe should treat `widgetEnableFlag[5]` as the primary
  slot-15 gate, while still logging `widgetEnableFlag[4]` as a legacy diagnostic
  when comparing older notes.
- `openWidget` returns false if the slot has no widget type, if
  `work.widgetEnableFlag[type] == false`, if the root slot is already occupied
  and no parent is supplied, or if `openWidgetLocal` fails.
- `openWidgetLocal` returns false if the owning/parent actor is not alive.
  Otherwise it calls `commandCreateWidget` and may temporarily disable parent
  input while the command is playing.
- Bytecode for `openWidgetLocal` shows only one real
  `commandCreateWidget(...)` call. The text decompiler's two-call listing is a
  false reconstruction; the bytecode stores the command result, optionally
  disables parent input, then returns the stored result.
- Evidence caveat: checked-in `desktopwidget_connector.lua` text and
  `call_counts.csv` still show two `commandCreateWidget` call sites because
  they are decompiler output. Prefer the bytecode control flow for runtime
  behavior here.
- `openWidgetYield` retries while the slot-15 widget family is enabled, waits
  for `isCreateWidgetCommandPlaying()`, then returns `getWidget(15,
  "RaidDungeonExecutionWidget")`.
- `PlayerBaseClass.commandAboutWidget` can return false before sending the
  command if the widget command burst blocker is active, if the same command is
  already playing and `cancelFlag` is false, or if `_executeCommand` fails.
- `commandCreateWidget` uses system command `24228`. A successful execution of
  the recovered `relogin` widget branch should therefore be followed by a
  desktop command/widget-create path, not just a `0x0130` ACK.
- The slot-15 widget family is enabled in ordinary/cutscene-compatible desktop
  modes seen in the recovered connector: `8`, `16`, `32`, `61`, and `63`. It is
  false in the explicit `62`, `120`, `126`, and `127` branches. Mode `64`
  maps to level `3`, but the recovered `setDesktopModeDetail` branch does not
  assign fresh flags for `64`; log live `widgetEnableFlag[5]` instead of
  inferring from the mode alone.

The `RaidDungeonExecutionWidget` Lua has no content-group, `_setInstanceRaid`,
`0x0133`, or `0x017A` guard. It only sets text row `10051/contentId` and a
timer. So `contentId=1` and a future `finishTime` should not silently reject in
the widget script. If no slot-15 widget appears, the likely failure is earlier:
the `relogin` function did not execute with correct args, `openWidget` returned
false, or the system-command `24228` create-widget path did not complete.

### Slot-15 no-op branches, expanded

For the recovered Toto-Rak relogin path, no new client/server traffic appears
until `commandCreateWidget` reaches `player:commandAboutWidget(...)`. Therefore
`0x0130` ACK plus no 24228 narrows to these branches:

| Boundary | Exact no-op/failure branch | Packet symptom |
| --- | --- | --- |
| `RaidFst0Dungeon03.relogin` | Lua method was not dispatched on the director, or params mapped wrong. The widget branch only runs when `clearFlag == false` as a boolean. | `0x012E EventUpdate` may still be seen; no 24228. |
| `player:_fadeInNowLoadingForNoticeEventJustInArea()` | Native/player call errors or blocks before the widget branch. No recovered Lua catch/log path proves details. | `0x012E` may or may not appear; no 24228. |
| `openWidgetYield` entry | If `parent == nil` and `isWidgetExec(15) == true`, it returns `nil` before calling `openWidget`. `isWidgetExec` only checks `rootWidget[15] ~= nil`; it does not purge dead widgets. | No 24228. |
| `openWidget` | `getWidgetTypeByIndex(15) == nil`; not expected because slot 15 maps to a valid widget family. | No 24228. |
| `openWidget` | `work.widgetEnableFlag[5] == false` for slot `15`. This is the cleanest source-proven silent no-op for "correct relogin ACK, no widget command"; log `[4]` only as a legacy diagnostic. | No 24228. |
| `openWidget` | Parentless root slot already occupied. In `openWidgetYield`, parent is changed to `desktopWidget` before the loop, so the earlier `isWidgetExec(15)` guard is the important root-slot guard for this call. | No 24228. |
| `openWidgetLocal` | Parent actor `_isAlive() == false`; for Toto-Rak this means `desktopWidget` itself is not ready/alive. | No 24228. |
| `commandAboutWidget` | `widgetCommandBurstBlocker` rejects, `_isCommandPlaying("widgetCreate")` rejects, or `_executeCommand("widgetCreate", 24228, ...)` fails. | `openWidgetYield` waits 0.1 and retries while the slot-15 family remains enabled; if it never recovers, no server-side 24228 appears even though Lua reached the command bridge. |
| `WidgetOpenCommand` | The client emits the command and server resolves static owner `0xA0F05EA4`. Local `Data/scripts/commands/WidgetOpenCommand.lua` allows `RaidDungeonExecutionWidget` only for private zone `159`; otherwise it rejects. The allow branch logs and ends the event, but does not itself create a widget. | 24228/EventStart and `[WidgetOpenCommand] allow` or `reject` log appear. |

Desktop mode is the main recovered source for `widgetEnableFlag`. The flags are
initialized false. `DesktopWidget.init` orders mode `8`, and the recovered
`setDesktopModeDetail` assignment block enables the slot-15 family for `8`,
`16`, `32`, `61`, and `63`. Explicit disabled branches are `62`, `120`, `126`,
and `127`; mode `64` is level `3` but has no direct flag-assignment branch in
the recovered bytecode. If relogin runs while that family flag is false,
`openWidgetYield` can return nil without emitting 24228.

There is no recovered Lua guard in this path for content group, content area,
`_setInstanceRaid(true)`, `0x0133`, or `0x017A`. Those can still matter
indirectly if they affect director/event readiness or desktop mode, but
`RaidDungeonExecutionWidget.init(1, finishTime)` itself only writes text row
`10051, 1` and timer properties.

### 24228 / `widgetCreate` command shape

Recovered client command:

```lua
require("/Command/System/SystemCommandBaseClass")
_defineClass("WidgetOpenCommand", "SystemCommandBaseClass")
function WidgetOpenCommand.command(self, player, widgetName, ...)
  require("/Widget/" .. widgetName)
  return true
end
```

For Toto-Rak, the effective command bridge call is:

```text
player:commandAboutWidget(
  player:getSystemCommand(24228),
  false,
  "RaidDungeonExecutionWidget",
  desktopWidget,
  true,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime
)
```

`24228` is DAT `Open Widget`, static command owner `0xA0F05EA4`, class
`/Command/System/WidgetOpenCommand`.

The decompiled Lua text drops the return literal inside
`CharaBaseClass.getCommandName`, but the Lua bytecode for that proto keeps the
constants and branch:

```text
K23 = "WidgetOpenCommand"
K24 = "widgetCreate"

_isInstanceOf(commandActor, "WidgetOpenCommand")
  -> LOADK R3, "widgetCreate"
...
RETURN R3
```

So `getCommandName(player:getSystemCommand(24228))` is source-proven as
`"widgetCreate"`. The required `0x0132` row is therefore the command-lane
bootstrap:

```text
0x0132 source=player number=0x0100 function="widgetCreate"
```

This bootstrap is sent during my-player spawn together with `commandRequest`
and `macroRequest`; it is not expected to be resent for every widget open.
The actual open should show up as client `0x012D EventStart` for static owner
`0xA0F05EA4` / `WidgetOpenCommand`, with local script args equivalent to:

```text
eventType, "widgetCreate",
"RaidDungeonExecutionWidget",
desktopWidget,
true,
"RaidDungeonExecutionWidget",
15,
true,
1,
finishTime
```

If no 24228 appears, missing fresh `0x0132` traffic is not enough to explain
the failure by itself. The better checks are: was the spawn-time
`0x0132 widgetCreate` bootstrap present after zone-in, is
`_isCommandPlaying("widgetCreate")` false, is `_canExecuteCommand("widgetCreate")`
true as diagnostic telemetry, and is the slot-15 family `widgetEnableFlag`
true when relogin runs.

### Next runtime data for no-24228

The static decomp for the slot-15 path is now mostly known. If correct-arg
`relogin(player, finishTime, false)` ACKs but no `0x012D` / system-command
`24228` / `WidgetOpenCommand` traffic appears, the next data needed is the live
desktop/widget state at the instant `RaidFst0Dungeon03.relogin` reaches
`desktopWidget:openRaidDungeonExecutionWidget(...)`:

```text
RaidFst0Dungeon03.relogin
  args: self director, player actor, finishTime, clearFlag=false
  did _fadeInNowLoadingForNoticeEventJustInArea(player) return?
  did execution reach desktopWidget:openRaidDungeonExecutionWidget?

DesktopWidget.openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1, finishTime)
  parent input nil?
  raw rootWidget[15] before isWidgetExec
  isWidgetExec(15) result
  rootWidget[15] actor id/name/alive if present
  getWidgetTypeByIndex(15) result, expected 5 from raw Lua 5.1 proto

DesktopWidget.openWidget
  widgetEnableFlag[5] primary
  widgetEnableFlag[4] legacy diagnostic only
  mode, modeLevel, desktopMode[1..5]
  parent after openWidgetYield, expected desktopWidget
  rootWidget[15] guard result if parent nil
  openWidgetLocal return

DesktopWidget.openWidgetLocal
  parent actor, expected desktopWidget
  parent:_isAlive()
  inputEnable
  commandCreateWidget return

DesktopWidget.commandCreateWidget
  commandActor = player:getSystemCommand(24228)
  commandName = player:getCommandName(commandActor), expected "widgetCreate"
  exact forwarded args:
    false,
    "RaidDungeonExecutionWidget",
    desktopWidget,
    true,
    "RaidDungeonExecutionWidget",
    15,
    true,
    1,
    finishTime

PlayerBaseClass.commandAboutWidget
  now = worldMaster:_getServerTime()
  playerWork.widgetCommandBurstBlocker
  cancelFlag=false
  _isCommandPlaying("widgetCreate")
  _canExecuteCommand("widgetCreate") if callable from the probe
  _executeCommand("widgetCreate", player:getSystemCommand(24228), ...) return
```

Interpretation:

- `rootWidget[15] ~= nil` before `openWidgetYield` means `isWidgetExec(15)`
  returns true and the function exits before `openWidget`; no 24228.
- The returned type's `widgetEnableFlag` being false means `openWidget` returns
  false and `openWidgetYield` breaks/retries until the flag disables the loop;
  no 24228. For slot 15 this primary flag is `widgetEnableFlag[5]`.
- `parent:_isAlive() == false` means `openWidgetLocal` returns false; no 24228.
- `_isCommandPlaying("widgetCreate") == true`, a burst-blocker hit, or
  `_executeCommand(...) == false` means the command bridge was reached but
  suppressed before server-visible `24228`.
- `_canExecuteCommand("widgetCreate")` is native-backed and used by the generic
  `canCommand` path; `commandAboutWidget` does not visibly call it before
  `_executeCommand`, so log it as diagnostic command-readiness evidence, not as
  a separate Lua branch in `commandAboutWidget`.
- If `_executeCommand(...) == true`, a `0x012D` / static owner `0xA0F05EA4` /
  `WidgetOpenCommand` event should appear. If it does not, the remaining gap is
  native command dispatch below Lua.

### Local packet proof boundary

Local send packet shapes:

```text
0x012F KickEvent:
  u32 triggerActorId
  u32 ownerActorId
  u8  eventType
  u8  0x17
  u16 0x75DC
  u32 0x30400000
  char eventName[]
  luaParams at body offset 0x30

0x0130 RunEventFunction:
  u32 triggerActorId
  u32 ownerActorId
  u8  eventType
  char eventName[] at body offset 0x09
  char functionName[] at body offset 0x29
  luaParams at body offset 0x49
```

Local receive packet shapes:

```text
0x012D EventStart:
  u32 triggerActorId
  u32 ownerActorId
  u32 serverCodes
  u32 unknown
  u8  eventType
  char eventName[]
  luaParams, or empty list when the packet has params=false/0x01 marker

0x012E EventUpdate:
  u32 triggerActorId
  u32 serverCodes
  u32 unknown1
  u32 unknown2
  u8  eventType
  luaParams
```

`EventStart(params=false)` does not mean the Lua script receives no first
arguments on the local server. `LuaEngine.EventStarted` prepends
`eventType, eventName` before dispatching `onEventStarted`; command scripts
therefore see `onEventStarted(player, commandActor, eventType, eventName, ...)`.

`EventUpdate` is weaker evidence. The local receive handler only resumes a
server-side coroutine if one is sleeping on that player; otherwise it returns.
So a `0x012E` ACK after `relogin` proves the event lane answered, but it does
not by itself prove `desktopWidget:openRaidDungeonExecutionWidget` reached
`commandCreateWidget` or that the nested `WidgetOpenCommand` event began.

The next hard proof after a successful `relogin` body is one of:

```text
0x012D EventStart owner=0xA0F05EA4 event=widgetCreate path=/Command/System/WidgetOpenCommand
local [WidgetOpenCommand] allow/reject log with candidate=RaidDungeonExecutionWidget
slot-15/root-widget create evidence after command 24228
```

### DesktopWidget slot-15 decomp appendix

Recovered slot-15 path for Toto-Rak:

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentId, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
end
```

`openWidgetYield(index, widgetName, aliasName, parent, visibleFlag, ...)`:

```lua
if parent == nil then
  if self:isWidgetExec(index) == true then
    return nil
  end
  parent = self
end

local result = nil
local widgetType = self:getWidgetTypeByIndex(index)
local lookupName = aliasName ~= nil and aliasName or widgetName

while true do
  if self:openWidget(index, widgetName, aliasName, parent, visibleFlag, ...) == true then
    self:waitWidgetCreateYield(index)
    result = self:getWidget(index, lookupName)
    break
  end

  if self.work.widgetEnableFlag[widgetType] == false then
    break
  end

  self:_wait(0.1)
end

return result
```

`openWidget(index, widgetName, aliasName, parent, visibleFlag, ...)`:

```lua
local widgetType = self:getWidgetTypeByIndex(index)
if widgetType == nil then
  return false
end
if self.work.widgetEnableFlag[widgetType] == false then
  return false
end
if parent == nil and self.work.rootWidget[index] ~= nil then
  return false
end
if self:openWidgetLocal(widgetName, aliasName, parent, index, visibleFlag, ...) == false then
  return false
end
return true
```

`openWidgetLocal(widgetName, aliasName, parent, index, visibleFlag, ...)`:

```lua
if aliasName == nil then
  aliasName = widgetName
end

local inputEnable = true
if parent == nil then
  parent = self
elseif parent ~= self and parent:isShow() == true then
  inputEnable = parent:getInputEnable()
end

if parent:_isAlive() == false then
  return false
end

local created = self:commandCreateWidget(
  widgetName,
  false,
  parent,
  inputEnable,
  aliasName,
  index,
  visibleFlag,
  ...
)

if created == true and parent ~= self and parent:isShow() == true then
  parent:setInputEnable(false)
end

return created
```

Bytecode anchors from
`tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac`:

```text
root/proto522 lines 20825-20870  openWidgetLocal
  one CALL to commandCreateWidget at pc 24-33
  returns the stored result at pc 45

root/proto523 lines 20888-20921  openWidget
  getWidgetTypeByIndex(index)
  work.widgetEnableFlag[type] == false -> return false
  parent == nil and rootWidget[index] ~= nil -> return false
  openWidgetLocal(...) == false -> return false
  otherwise return true

root/proto531 lines 21205-21211  isWidgetExec
  return work.rootWidget[index] ~= nil

root/proto544 lines 21617-21662  openWidgetYield
  parent nil + isWidgetExec(index) true -> return nil
  openWidget(...) true -> waitWidgetCreateYield(index), getWidget(index, lookupName)
  openWidget(...) false + widgetEnableFlag[type] false -> break
  otherwise wait 0.1 and retry
```

2026-06-23 raw Lua 5.1 chunk recheck: parsing
`tools/outputs/lpb/content_systems_20260612/luac/widget/desktopwidget_connector.luac`
directly finds the same `root/proto522` (`lineDefined=20825`,
`lastLineDefined=20870`). In that proto, constant slot `6` is
`"commandCreateWidget"`, pc `24` is the `SELF` for that method, and pc `33` is
the single `CALL`. The later pc `42`/`44` pair is `setInputEnable(false)`, not a
second widget command. So the focused Lua text with two `commandCreateWidget`
expressions is a decompiler artifact; the client issues only one command attempt
per `openWidgetLocal` call.

`commandCreateWidget(widgetName, cancelFlag, ...)`:

```lua
return worldMaster:_getMyPlayer():commandAboutWidget(
  worldMaster:_getMyPlayer():getSystemCommand(24228),
  cancelFlag,
  widgetName,
  ...
)
```

`PlayerBaseClass.commandAboutWidget(commandActor, cancelFlag, ...)`:

```lua
local now = worldMaster:_getServerTime()
local blocker = self.playerWork.widgetCommandBurstBlocker

if blocker ~= 0 and now < blocker and not cancelFlag then
  return false
end

local commandName = self:getCommandName(commandActor)

if not cancelFlag then
  if self:_isCommandPlaying(commandName) then
    return false
  end
else
  self:_cancelCommand(commandName)
end

self.playerWork.widgetCommandBurstBlocker = now

if cancelFlag then
  self:recordRequestInformation()
end

return self:_executeCommand(commandName, commandActor, ...)
```

For `WidgetOpenCommand`, `getCommandName(commandActor)` resolves the command
lane as `widgetCreate`. So the concrete pre-packet local blocker is:

```lua
self:_isCommandPlaying("widgetCreate") == true
```

or `_executeCommand("widgetCreate", player:getSystemCommand(24228), ...)`
returning false.

Bytecode anchors from
`tools/outputs/lpb/decomp_further_20260617/luac/chara/player/playerbaseclass.luac`:

```text
root/proto61 lines 8030-8075  commandAboutWidget
  widgetCommandBurstBlocker future-time gate -> return false
  getCommandName(commandActor)
  cancelFlag false + _isCommandPlaying(commandName) true -> return false
  cancelFlag true -> _cancelCommand(commandName)
  playerWork.widgetCommandBurstBlocker = now
  cancelFlag true -> recordRequestInformation()
  _executeCommand(commandName, commandActor, ...) -> returned result

root/proto45 lines 7444-7475  canCommand
  getCommandName(commandActor)
  commandName ~= "commandRequest" and not _canExecuteCommand(commandName)
    -> return false
  commandActor:canFire(player, ...)
```

So `_canExecuteCommand("widgetCreate")` is useful readiness telemetry, but it is
not a Lua-side branch inside `commandAboutWidget`; the widget bridge reaches
`_executeCommand` directly after the burst/playing checks.

Native hook status from `native_boundary_scan_20260617`:

```text
PlayerBaseClass._executeCommand_inl      -> "_executeCommand_cpp"
PlayerBaseClass._isCommandPlaying_inl    -> "_isCommandPlaying_cpp"
PlayerBaseClass._canExecuteCommand_inl   -> "_canExecuteCommand_cpp"
```

The current C decompile/search did not expose useful concrete bodies for these
three hooks. Treat them as named native black boxes below the Lua gate. For the
Toto-Rak no-24228 symptom, the key distinction is whether
`commandAboutWidget` reaches `_executeCommand("widgetCreate", 24228, ...)` and
what boolean that native call returns.

Slot and root state:

```lua
function DesktopWidget.isWidgetExec(self, index)
  return self.work.rootWidget[index] ~= nil
end

function DesktopWidget.getWidget(self, index, name)
  local root = self.work.rootWidget[index]
  if root ~= nil and root:_isAlive() == false then
    self.work.rootWidget[index] = nil
    return nil
  end
  return self:getWidgetByName(root, name)
end
```

Important difference: `getWidget(15, ...)` purges a dead root, but
`isWidgetExec(15)` does not. A stale dead `rootWidget[15]` can therefore make
`openWidgetYield` return `nil` before 24228.

`getWidgetTypeByIndex(15)`:

```text
slot 0 -> type 0
slot 1 -> type 1
slot 2 -> type 2
slot 3 -> type 3
slot 4/5 -> type 4
slot 6/7/8/9/15/16 -> type 5
slot 10/11/12 -> type 6
slot 13/14/17 -> type 7
```

The text decomp around this function is damaged enough to make the human label
"type 4" misleading. The raw bytecode path for slot `15` is:

```text
WidgetBaseClass_common.luac root.9:
  K10 = 15.0
  K5  = 5.0
  pc42 EQ R3 K10
  pc44 JMP +2
  pc47 LOADK R2 K5
  pc73 RETURN R2
```

So Toto-Rak slot `15` returns type `5`, and `openWidget` indexes
`work.widgetEnableFlag[type]`. Live probes should record:

```text
returnedType = getWidgetTypeByIndex(15)
work.widgetEnableFlag[returnedType]
work.widgetEnableFlag[5]
work.widgetEnableFlag[4] -- legacy diagnostic only
```

For slot `15`, `widgetEnableFlag[5]` is the primary gate. Older notes that say
"type 4" are using a legacy/zero-based family label and should not be read as
Lua array index `[4]`.

Desktop mode and slot-15 family enable:

```text
mode 8   -> level 1, slot-15 family enabled
mode 16  -> level 2, slot-15 family enabled
mode 32  -> level 2, slot-15 family enabled
mode 61  -> level 3, slot-15 family enabled
mode 62  -> level 3, slot-15 family disabled
mode 63  -> level 3, slot-15 family enabled
mode 64  -> level 3, no recovered setDesktopModeDetail flag branch; log live flag
mode 120 -> level 1, slot-15 family disabled
mode 126 -> level 4, slot-15 family disabled
mode 127 -> level 5, slot-15 family disabled
```

The level values are bytecode-backed from `getModeLevel`; the enable values are
bytecode-backed from `setDesktopModeDetail`. Mode `64` is returned by
`getModeLevel`, but the recovered `setDesktopModeDetail` branch has no direct
`64` assignment, so the live flag value must be captured. The source-proven
runtime consequence is enough for the bug: if the returned family flag is
false, `openWidget` returns false and `openWidgetYield` breaks without 24228.

Mode bytecode anchors:

```text
root/proto0   lines 125-406   DesktopWidget init
  initializes desktopMode[1..5] = 0, rootWidget[1..17] = nil,
  widgetEnableFlag[1..7] = false, then orderDesktopWidgetMode(8)

root/proto144 lines 6292-6339  orderDesktopWidgetMode
  level = getModeLevel(mode)
  desktopMode[level] = mode
  if level >= work.modeLevel then setDesktopModeDetail(mode, level)

root/proto147 lines 6488-6530  getModeLevel
  8/120 -> 1, 16/32 -> 2, 61/62/63/64 -> 3,
  126 -> 4, 127 -> 5

root/proto149 lines 6563-6972  setDesktopModeDetail
  assigns work.mode, work.modeLevel, and widgetEnableFlag[1..7]
```

### Widget-container helper decomp

This is a separate native-widget-container route. It is not the recovered
Toto-Rak duty-widget path.

Native bridge declarations on `DesktopWidget`:

```lua
_reserveWidgetContainer(index)              -> _reserveWidgetContainer_cpp
_getWidgetContainerSize()                   -> _getWidgetContainerSize_cpp
_createWidgetInWidgetContainer(index, widgetName, ...) -> _createWidgetInWidgetContainer_cpp
_isExistWidgetInWidgetContainer(index)      -> _isExistWidgetInWidgetContainer_cpp
_isCreatingWidgetInWidgetContainer(index)   -> _isCreatingWidgetInWidgetContainer_cpp
_getWidgetFromWidgetContainer(index)        -> _getWidgetFromWidgetContainer_cpp
_deleteCreatingWidgetInWidgetContainer(index) -> _deleteCreatingWidgetInWidgetContainer_cpp
```

The recovered Lua wrapper that supplies the full native create argument shape is
`createWidget2(containerIndex, parent, visibleFlag, ...)`:

```lua
function DesktopWidget.createWidget2(self, containerIndex, parent, visibleFlag, ...)
  if self:_isExistWidgetInWidgetContainer(containerIndex) == true then
    return
  end

  local widgetName, aliasName, widgetIndex = self:getCreateParameter(containerIndex)

  if parent == nil then
    parent = self
  end

  self:_createWidgetInWidgetContainer(
    containerIndex,
    widgetName,
    parent,
    aliasName,
    widgetIndex,
    visibleFlag,
    ...
  )
end
```

`getCreateParameter(containerIndex)` only recovers two valid built-in mappings:

```text
container 1 -> widgetName="GuildleveExecutionWidget", widgetIndex=6
container 2 -> widgetName="EquipWidget", widgetIndex=3
```

The decompiled `aliasName` is returned as nil unless explicitly set. No mapping
for container `15`, `0x0F`, `0x1B`, `RaidDungeonExecutionWidget`, or
`HamletDefenseWidget` is recovered.

Container guards exposed in Lua:

```lua
function DesktopWidget.deleteWidget2(self, containerIndex)
  if self:_isExistWidgetInWidgetContainer(containerIndex) == false then
    return
  end
  if self:_isCreatingWidgetInWidgetContainer(containerIndex) == true then
    self:_deleteCreatingWidgetInWidgetContainer(containerIndex)
  else
    self:closeWidgetDirect(self:_getWidgetFromWidgetContainer(containerIndex))
  end
end

function DesktopWidget.getWidget2(self, containerIndex)
  if self:isValidWidget(containerIndex) == false then
    return nil
  end
  return self:_getWidgetFromWidgetContainer(containerIndex)
end

function DesktopWidget.isValidWidget(self, containerIndex)
  if self:_isExistWidgetInWidgetContainer(containerIndex) == false then
    return false
  end
  if self:_isCreatingWidgetInWidgetContainer(containerIndex) == true then
    return false
  end
  return true
end
```

`DesktopWidget._onCreatedWidgetInWidgetContainer(self, arg1, arg2)` exists but
is empty in recovered Lua, so post-create success/failure behavior is native.

Forcing `_createWidgetInWidgetContainer` directly over `0x0130` is therefore not
equivalent to `desktopWidget:openRaidDungeonExecutionWidget(...)`. If a direct
native call were attempted with the wrapper's full shape, the inferred complete
argument list would be:

```text
_createWidgetInWidgetContainer(containerIndex, widgetName, parent,
                               aliasName, widgetIndex, visibleFlag, ...)
```

The current local Toto-Rak fallback sends:

```text
_createWidgetInWidgetContainer(15, "RaidDungeonExecutionWidget", 1, finishTime)
```

That is short relative to the recovered wrapper shape: `1` lands in the
`parent` position, `finishTime` lands where the alias/name-like parameter would
be, and the explicit `widgetIndex`, `visibleFlag`, and init args are missing.
Even before native guards, this is not a source-proven replacement for the
slot-15 `commandCreateWidget(24228)` path.

### Widget creation completion boundary

`openRaidDungeonExecutionWidget` and `openWidgetYield` start the slot-15 open
path, but they do not directly populate `work.rootWidget[15]`.

Recovered completion path:

```text
Widget actor init
  -> WidgetBaseClass init/finalize path
  -> desktopWidget:processWidgetCreated(widget, rootFlag, inputEnable,
                                        aliasName, index, showFlag, ...)
```

The important recovered `processWidgetCreated` behavior is:

```lua
if widget:isCreateCancel() == true then
  closeWidgetDirect(widget)
  return
end

if rootFlag ~= true then
  return
end

if work.rootWidget[index] == nil then
  work.rootWidget[index] = widget
end

if work.widgetEnableFlag[widget:getWidgetType()] == false then
  return
end

if widget:getVisibleFlag() == false then
  return
end

-- then visible child widgets are shown
```

So the slot-15 state has two different checkpoints:

```text
command edge:
  DesktopWidget.commandCreateWidget
    -> PlayerBaseClass.commandAboutWidget
    -> player:_executeCommand("widgetCreate", systemCommand24228, ...)

root-widget edge:
  later widget actor construction
    -> processWidgetCreated(..., index=15, ...)
    -> work.rootWidget[15] = widget
```

`DesktopWidget.getWidget(index, name)` purges `rootWidget[index]` only when the
stored actor exists and `_isAlive() == false`, then searches that root by name.
`DesktopWidget.isWidgetExec(index)` is simply `work.rootWidget[index] ~= nil`.
`openWidgetYield` waits while `isCreateWidgetCommandPlaying()` is true and then
calls `getWidget(index, lookupName)`; it is not a general "wait until
rootWidget[index] becomes non-nil" loop.

This makes the live split sharper:

```text
no 0x012D / no 24228 edge:
  failure is before or inside commandAboutWidget / native _executeCommand

0x012D exists but rootWidget[15] stays nil:
  widget actor creation did not finish, was cancelled, was non-root,
  had a different root index, or never reached processWidgetCreated

rootWidget[15] exists but nothing visible:
  widgetEnableFlag[5] false, widget visible flag false,
  or child show/update path suppressed visibility
```

## General notification after cutscene

Recovered call:

```lua
desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
```

Recovered connector behavior:

- Notification type `3` routes to `openPublicEffectWidget(1)`.
- Notification type `8` routes to `closeRaidDungeonExecutionWidget()`.
- `openPublicEffectWidget(1)` maps to `"RaidDungeonStartWidget"`.

Meaning:

- After the mode-61 occupancy cutscene, the client opens the execution timer widget and shows the raid-start public effect.
- Do not confuse the two numeric domains: `processUpdateGeneralNotificationDialog(3, nil, nil, 1)` is a notification update with payload `1`; a direct `openPublicEffectWidget(3)` would instead open `"RaidDungeonFailureWidget"`.

Useful `openPublicEffectWidget(effectId)` mappings from the connector:

| Effect id | Splash widget |
| ---: | --- |
| `1` | `RaidDungeonStartWidget` |
| `2` | `RaidDungeonSuccessWidget2` |
| `3` | `RaidDungeonFailureWidget` |
| `4`-`6` | `GrandCompanyRecruitWidget1` through `GrandCompanyRecruitWidget3`, with effect arg `2130706533` |
| `13` | `DutyAbandonedWidget` |
| `14`-`16` | `DutyCommencedWidget1` through `DutyCommencedWidget3` |
| `17`-`19` | `DutyCompleteWidget1` through `DutyCompleteWidget3` |
| `20` | `DutyFailedWidget` |

`openPublicEffectWidget` always uses widget layer `13` through
`SplashEffectWidget` and closes an existing layer-13 splash before opening the
new one.  `openCutSceneEffectWidget` is a separate layer-14 path; its effect id
`3` maps to `"RaidDungeonSuccessWidget"`, not the same widget as public effect
id `2`.

Useful `openCutSceneEffectWidget(effectId)` mappings:

| Effect id | Splash widget |
| ---: | --- |
| `1` | `RaidDungeonTitleWidget1` |
| `2` | `RaidDungeonTitleWidget2` |
| `3` | `RaidDungeonSuccessWidget`, with effect arg `2130706534` |
| `4`-`6` | `LocationTitleWidget1` through `LocationTitleWidget3` |
| `7`-`8` | `RaidDungeonTitleWidget3` through `RaidDungeonTitleWidget4` |
| `9`-`11` | `DutyCompleteWidget4` through `DutyCompleteWidget6` |
| `12`-`14` | `HamletDefenseTitleWidget1` through `HamletDefenseTitleWidget3` |
| `15` | `CastrumNovumTitleWidget` |

`openCutSceneEffectWidget` does not replace an already-running layer-14 widget;
if layer `14` exists, it returns early. `closeCutSceneEffectWidget()` calls
`finish()` on layer `14` rather than direct-close.

Caller caveat:

- `RaidFst0Dungeon03` only reaches public effect `1`, through
  `processUpdateGeneralNotificationDialog(3, nil, nil, 1)` after cutscene
  playback.
- No Toto-Rak caller was found for public effect `2`, `3`, `13`, `17..19`, or
  `20` in the recovered old occupancy lane.

`SplashEffectWidget` runtime:

```lua
function SplashEffectWidget.init(self, effectArg)
  if effectArg ~= nil then
    desktopWidget:executeEffect(effectArg)
  end
  self:setUICommandCondition("UILuaCommands.AnimationCompleted")
  self:sendCommand("Animation.Start")
end

function SplashEffectWidget.processUICommandEvent(self, ..., command)
  if command == "UILuaCommands.AnimationCompleted" then
    desktopWidget:closeWidgetDirect(self)
  end
end

function SplashEffectWidget.finish(self)
  self:sendCommand("Fadeout.Start")
end
```

SQWT asset hits exist for `RaidDungeonExecutionWidget`,
`RaidDungeonStartWidget`, `RaidDungeonFailureWidget`,
`RaidDungeonSuccessWidget`, and `RaidDungeonSuccessWidget2` as `.form/.tpl`.
No recovered Lua class bodies were found for the start/success/failure raid
splash widgets themselves; recovered behavior routes through `SplashEffectWidget`
plus those SQWT assets.

## Cutscene call details

Recovered Toto-Rak opening:

```lua
worldMaster:createCutScene("rad0f300", self):startCutScene(1, 61, 1, 0, 1)
```

Recovered generic Toto-Rak call:

```lua
worldMaster:createCutScene(sceneKey, self):startCutScene(1, 61, 1, 0, cutsceneArg)
```

`worldMaster:createCutScene(scene, owner)` source:

`tools/outputs/lpb/decomp_further_20260617/lua/world/worldmaster.lua`

Recovered shape:

```lua
return _createActor(nil, "CutScene", false, scene, owner)
```

`CutScene._onInit(scene, owner)` source:

`tools/outputs/lpb/content_systems_20260612/lua/gamedata/cutscene.lua`

Recovered shape:

```lua
self:_setFilename(scene)
self.work.actorclassSheet = _createActor(nil, "SpreadSheet", false, "actorclass")
self.work.textOwner = owner
```

So the `sceneKey` passed by `RaidFst0Dungeon03` becomes the cutscene actor filename.

`startCutScene` source:

`tools/outputs/lpb/decomp_more_20260617/lua/gamedata/cutscene_common.lua`

Important details:

- First arg `1` selects play rather than replay.
- Second arg `61` is the cutscene mode used by the old occupancy dungeon wrapper.
- Third arg `1` enables the skip/show-skip behavior in this path.
- Fourth arg `0` is passed through as recovered.
- Fifth arg is the script's `cutsceneArg`.
- In `cutscene_common.lua` terms, the Toto-Rak varargs after
  `(playSelector, desktopMode, skipMode)` are `0, cutsceneArg`.
- Skip modes `1`, `3`, `5`, and `7` normalize to skip mode `1`.
- Skip modes `2`, `4`, `6`, and `8` normalize to skip mode `2`.
- For normal play, the client orders desktop widget mode unless the path is suppressed.
- With normalized skip mode `1`, the client shows the cutscene skip UI before `_play(...)` and hides it afterward.
- On successful play, the client cancels the desktop widget mode unless suppressed.
- On successful play with mode not equal to `64`, it waits for map load.
- `startCutScene` calls `_play(...)` for first arg `1`; other play-kind values
  take the `_replay(...)` path.
- After `_play` or `_replay`, it hides static widget `14`.
- The recovered script deletes the cutscene actor after playback:

  ```lua
  worldMaster:createCutScene(sceneKey, self):_delete()
  ```

  `_delete` itself is a native actor method, not Lua-defined on `CutScene`.
  `CutScene._onFinalize` deletes the temporary `actorclassSheet` and clears
  references. The decompiler emits repeated `createCutScene(...):_delete()`
  call sites, so this proves the create/start/delete lifecycle but should not
  be overread as exact temporary-register identity.

For Toto-Rak's recovered call:

```text
playType    = 1  -> normal _play path
desktopMode = 61 -> old occupancy notice-event cutscene mode
skipMode    = 1  -> cutscene skip UI path
```

### CutReplay and replay-only scenes

Source:

`docs/Dat Mining/cutReplay.csv`

Toto-Rak replay rows:

| Replay row | Key | Live literal in `RaidFst0Dungeon03` |
| --- | --- | --- |
| `11082101` | `rad0f300` | yes |
| `11082102` | `rad0f301` | no |
| `11082103` | `rad0f302` | no |
| `11082104` | `rad0f303` | no |
| `11082105` | `rad0f304` | no |
| `11082106` | `rad0f305` | no |
| `11082107` | `rad0f306` | yes |
| `11082108` | `rad0f307` | yes |
| `11082109` | `rad0f308` | yes |

All nine rows have cutReplay mode fields `1, 1` and marker slots `-200` repeated. The row block is a replay family; direct live ownership is only proven for keys literally referenced by the recovered occupancy director.

Asset inventory evidence:

Source:

`tools/outputs/lpb/content_systems_20260612/cutscene_asset_directory_inventory.csv`

All nine `rad0f300..rad0f308` keys have `client/cut/...` asset directories. Main-file counts from the inventory are:

| Key | Main-file count |
| --- | --- |
| `rad0f300` | `1` |
| `rad0f301` | `2` |
| `rad0f302` | `2` |
| `rad0f303` | `8` |
| `rad0f304` | `1` |
| `rad0f305` | `4` |
| `rad0f306` | `8` |
| `rad0f307` | `5` |
| `rad0f308` | `5` |

This proves the assets exist. It still does not prove `rad0f301..rad0f305` are used by the live duty director.

Replay widget evidence:

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/widget/ask/replaycutsceneselectwidget.lua`

`ReplayCutsceneSelectWidget.createList(questId)` scans:

```lua
for cutsceneId = questId * 100 + 1, questId * 100 + 30 do
  if cutReplaySheet:_isExistKey(cutsceneId) then
    -- add row to replay list
  end
end
```

`PopulaceCutScenePlayer.processCutScenePlay` then:

- Computes `questId = floor(cutsceneId / 100)`.
- Loads the cutReplay row temporarily.
- Reads the cutscene key from column `0`.
- Reads up to eight replay args from columns `8..15`.
- Resolves special replay tokens such as `-202`, `-206`, `-207`, and `-208`.
- Starts normal/HQ or SNPC replay cutscene paths.

Conclusion:

- `rad0f301..rad0f305` are asset/replay-backed.
- No recovered Toto-Rak live Lua owner was found for `rad0f301..rad0f305`.
- `rad0f300`, `rad0f306`, `rad0f307`, and `rad0f308` are both replay-backed and direct live literals in `RaidFst0Dungeon03`.

## Base occupancy and private-area classes

### `OccupancyDirectorBaseClass`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/occupancydirectorbaseclass.lua`

```lua
require("/Director/DirectorBaseClass")
_defineBaseClass("OccupancyDirectorBaseClass", "DirectorBaseClass")
```

No additional methods were recovered.

### `DirectorBaseClass`

Source:

`tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua`

Key recovered behavior:

```lua
function DirectorBaseClass.delegateEvent(self, player, target, functionName, ...)
  target:_callFunction(functionName, player, self, ...)
end
```

`_onEventCancel` closes all owned content widgets and resets fade if the event name is `noticeEvent`.

This supports `noticeEvent` as a director-owned event channel rather than a specific `RaidFst0Dungeon03.noticeEvent` method.

Recovered base UI lifecycle call sites:

- `_onFinalize(self)` is the only recovered base call site for
  `processUIFinalize()`.
- `_onUpdateWork(self, list, target, value, ...)` is the only recovered base call
  site for `processUIInit()` and `processUIUpdate(target)`.
- Intended branch evidence: `_init` updates call `processUIInit()`, and `work`
  updates call `processUIUpdate(target)`.
- Base stubs exist for `processUIInit(self)`, `processUIUpdate(self, target)`,
  and `processUIFinalize(self)`.

Reliability caveat:

- The recovered `_onFinalize` and `_onUpdateWork` bodies contain early
  decompiler artifacts such as `do break` / `do return` before the visible
  lifecycle calls.  Treat them as strong lifecycle-intent evidence, not clean
  executable ordering.

Recovered event-channel details:

- `delegateEvent(self, player, target, functionName, ...)` calls
  `target:_callFunction(functionName, player, self, ...)`.
- `_onEventCancel(self, player, eventName, ...)` closes owned content widgets and
  only resets player fade when `eventName == "noticeEvent"`.
- `_onNoticeRejected(self, player)` is empty.
- `PlayerBaseClass.isEventPlaying()` includes `"noticeEvent"` among active event
  names.

### `/Area/PrivateArea/Occupancy/RaidDungeonSimple`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/area/privatearea/occupancy/raiddungeonsimple.lua`

```lua
require("/Area/PrivateArea/Occupancy/PrivateAreaOccupancyBaseClass")
_defineClass("RaidDungeonSimple", "PrivateAreaOccupancyBaseClass")
```

No additional methods were recovered.

Important distinction:

- Recovered path is `/Area/PrivateArea/Occupancy/RaidDungeonSimple`.
- No recovered `/Director/Occupancy/RaidDungeonSimple` class was found.

### Recovered private-area parent chain

`RaidDungeonSimple` parent chain:

```text
RaidDungeonSimple
  -> PrivateAreaOccupancyBaseClass
    -> PrivateAreaBaseClass
```

Recovered declarations:

```lua
-- /Area/PrivateArea/Occupancy/PrivateAreaOccupancyBaseClass
require("/Area/PrivateArea/PrivateAreaBaseClass")
_defineBaseClass("PrivateAreaOccupancyBaseClass", "PrivateAreaBaseClass")

-- /Area/PrivateArea/PrivateAreaBaseClass
function PrivateAreaBaseClass._onInit(self, ...)
  self:_callSuperClassFunc("_onInit", ...)
  self.privateAreaWork._save = {}
  self.privateAreaWork._temp = {{"_assignForChild", 64}}
  self:init(self:_getZoneName())
end

function PrivateAreaBaseClass.init(self, ...)
end
```

The recovered content-area sibling chain is similarly thin:

```lua
require("/Area/PrivateArea/PrivateAreaBaseClass")
_defineBaseClass("PrivateAreaContentBaseClass", "PrivateAreaBaseClass")

require("/Area/PrivateArea/Content/PrivateAreaContentBaseClass")
_defineClass("PrivateAreaMasterSimpleContent", "PrivateAreaContentBaseClass")
```

Negative result:

- No recovered `onZoneIn`, `onLogin`, `start`, `relogin`, `delegateEvent`, widget, or cutscene implementation was found in `RaidDungeonSimple`, `PrivateAreaOccupancyBaseClass`, `PrivateAreaBaseClass`, `PrivateAreaContentBaseClass`, or `PrivateAreaMasterSimpleContent`.
- The recovered old-dungeon widget/cutscene behavior remains in `RaidFst0Dungeon03` / `RaidRoc0Dungeon01`, not in the area class parent chain.

### Thin sibling occupancy classes

The following classes were checked and do not hide Toto-Rak lifecycle methods:

- `tools/outputs/lpb/decomp_more_20260617/lua/director/instanceraid/occupancyplayers/occupancyplayersbaseclass.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/instanceraid/occupancyplayers/raidplayers.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/instanceraid/occupancyplayers/occupancyplayerstest.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/area/zone/zonemasteroccupancy.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/group/relationgroup/occupancyplayersrelationgroup.lua`

Recovered shapes:

```lua
_defineBaseClass("OccupancyPlayersBaseClass", "DirectorBaseClass")
function OccupancyPlayersBaseClass._onInit(self)
end

require("/Director/InstanceRaid/OccupancyPlayers/OccupancyPlayersBaseClass")
_defineClass("RaidPlayers", "OccupancyPlayersBaseClass")

require("/Area/Zone/ZoneBaseClass")
_defineClass("ZoneMasterOccupancy", "ZoneBaseClass")

require("/Group/RelationGroup/RelationGroupBaseClass")
_defineClass("OccupancyPlayersRelationGroup", "RelationGroupBaseClass")
```

No `start`, `onZoneIn`, `onLogin`, `delegateEvent`, `relogin`, or `openRaidDungeonExecutionWidget` bodies were found in these classes.

## Modern `InstanceRaidBaseClass` contrast

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/director/instanceraid/instanceraidbaseclass.lua`

Modern instance-raid lane has a richer lifecycle:

- `startEvent(cutscene, owner, modeFlag, contentID, startTime, finishTime, eventType, ...)`
- `reloginEvent(contentID, startTime, finishTime, eventType, clearFlag)`
- `clearEvent()`
- `failedEvent(reasonIndex)`
- `exitCutScene(...)`
- `cutSceneEvent(...)`
- `_onReceiveDataPacket(subtype, ...)`

Modern widget open:

```lua
desktopWidget:openRaidDungeonExecutionWidget(nil, self:getContentID(), self.instanceRaidWork.finishTime)
```

Modern cutscene execution:

```lua
worldMaster:createCutScene(scene, owner):startCutScene(1, 63, mode, ...)
```

Modern result-effect behavior:

- `startEvent(...)` stores `contentID`, `startTime`, `finishTime`, and
  `eventType`.
- If `eventType ~= 0`, `startEvent` calls `processStartEffect()`, which opens
  public effect `1`.
- `processUIFinalize()` closes the information widget and clears
  `countdownStatus` / `clearFlag`.
- `clearEvent()` closes the raid execution UI and notifies row `52021`.
- `failedEvent(reasonIndex)` maps failure reasons through rows `52065`,
  `52054`, `52010`, and `52093`; for non-`1` failures with `eventType ~= 0`,
  it opens public effect `3` before fade/warp recovery.
- `_onLoop` emits timer notices through `worldMaster:notify`: row `52009` for
  threshold minutes `30`, `20`, `10`, `5`, `3`, and `1`, and row `52092` at
  the half-time checkpoint.
- `_onReceiveDataPacket(1, startTime, finishTime)` marks clear, refreshes a
  post-clear timer, and closes the widget.
- `_onReceiveDataPacket(2)` marks clear, stops countdown, and closes the
  widget.
- `_onReceiveDataPacket(3, ...)` forwards to `processUserMessage(...)`.

Do not conflate this with legacy Toto-Rak:

- Toto-Rak recovered legacy class uses `RaidFst0Dungeon03.eventNoticeCutScene`.
- Toto-Rak recovered legacy class uses mode `61`.
- Modern `InstanceRaidBaseClass` uses mode `63`.
- The modern base owns data-packet countdown/clear/failure state; the old
  Toto-Rak occupancy director only owns cutscene/relogin/widget callbacks.

## Dzemael comparator

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/raidroc0dungeon01.lua`

Dzemael has the same old occupancy shape:

- Class: `RaidRoc0Dungeon01`
- Base: `OccupancyDirectorBaseClass`
- Opening scene: `rad0r100`
- Close scene: `rad0r106`
- Widget call:

  ```lua
  desktopWidget:openRaidDungeonExecutionWidget(4102, 2, finishTime)
  ```

Effective widget args:

```text
contentId = 2
finishTime = finishTime
```

The first arg `4102` is also discarded by the connector before widget init.

Old occupancy crosswalk:

| Duty | Director class | Display / place id | Raid content id | Opening scene | Close-before-CS scenes |
| --- | --- | ---: | ---: | --- | --- |
| Toto-Rak | `/Director/Occupancy/RaidFst0Dungeon03` | 2123 | 1 | `rad0f300` | `rad0f306`, `rad0f307`, `rad0f308` |
| Dzemael | `/Director/Occupancy/RaidRoc0Dungeon01` | 4102 | 2 | `rad0r100` | `rad0r106` |

Both old occupancy directors:

- inherit the thin `OccupancyDirectorBaseClass`;
- run `startCutScene(1, 61, 1, 0, cutsceneArg)`;
- reopen `openRaidDungeonExecutionWidget(displayOrPlaceId, contentId, finishTime)`;
- call `processUpdateGeneralNotificationDialog(3, nil, nil, 1)`.

Cut replay cross-check:

| Duty | Live/director scenes | Replay-only scenes seen in data |
| --- | --- | --- |
| Toto-Rak | `rad0f300`, `rad0f306`, `rad0f307`, `rad0f308` | `rad0f301`-`rad0f305` |
| Dzemael | `rad0r100`, `rad0r106` | `rad0r101`-`rad0r105` |

The guide scripts are also template siblings: Toto-Rak loads text group `6704`
as `raidFst0Dungeon03Guide`, while Dzemael loads text group `6720` as
`raidRoc0Dungeon01Guide`.

DAT crosswalk used here:

- `xtx_raidDungeon.csv`: id `1` is Toto-Rak; id `2` is Dzemael Darkhold.
- `_zoneParam.csv`: zone `159` maps to place/display `2123`; zone `231` maps
  to `4102`.
- `xtx_placeName.csv`: `2123` is The Thousand Maws of Toto-Rak; `4102` is
  Dzemael Darkhold.

## Local server bridge

Primary source:

`Map Server/WorldManager.cs`

Constants:

- `ThousandMawsOfTotorakZoneId = 159`
- `TotorakEntranceZoneId = 154`
- `TotorakRaidDungeonId = 1`
- `TotorakDurationMinutes = 60`
- `TotorakLegacyDutyWidgetDirectorScriptPath = "Occupancy/RaidFst0Dungeon03"`
- `TotorakLegacyDutyAreaClassPath = "/Area/PrivateArea/Occupancy/RaidDungeonSimple"`
- `TotorakLegacyDutyWidgetOpenFunction = "relogin"`
- `TotorakLegacyDutyWidgetCloseFunction = "widgetSetOff"`
- `TotorakLegacyDutyWidgetCutsceneFunction = "eventNoticeCutScene"`
- Opening cutscene arg: `1`
- Opening cutscene delay: `2200 ms`
- Widget open delay: `1200 ms`
- Close scene keys: `rad0f306`, `rad0f307`, `rad0f308`
- Failure/timeout re-entry timer: `5` minutes
- Minimum level: `25`
- Party size: `2..4`

### Start flow

`StartTotorakInstanceForEntrants`:

1. Creates content area:

   ```csharp
   sourceZone.CreateContentAreaWithoutContentGroup(
       starter,
       TotorakLegacyDutyAreaClassPath,
       "totorak",
       "Totorak",
       TotorakLegacyDutyWidgetDirectorScriptPath)
   ```

2. Copies public spawn locations to the private content area.
3. Calls `contentArea.SpawnAllActors()`.
4. Gets content director.
5. Calls `director.StartDirector(false)`.
6. Adds director and entrants as members.
7. Calls `director.StartContentGroup()`, but this is inert for the no-content-group lane.
8. Sets timed re-entry expiry.
9. Stores a `TotorakInstanceState`.
10. Prepares each entrant for zone-in.
11. Calls `DoZoneChangeContent`.
12. Leaves the prepared login director available for the zone-in self bind.
13. Schedules either opening cutscene or relogin/widget open; the async widget
    opener clears the login director after send/timeout.

Local C# lifecycle details:

- `Zone.CreateContentAreaWithoutContentGroup(...)` passes `hasContentGroup=false` into `CreateContentAreaInternal`.
- `CreateContentAreaInternal` creates the director first, allocates a dynamic private-area type, constructs `PrivateAreaContent`, and registers it under the private area name.
- Dynamic private-area content types start at `100000`; static SQL private-area rows are below that range.
- `PrivateAreaContent` calls Lua `onCreate(player, contentArea, director)` during construction.
- `Director.StartDirector(false)` calls Lua `init`, updates the director class path/name when returned, and starts coroutine `main`; it does not immediately send spawn/init packets because `spawnImmediate=false`.
- `DoZoneChangeContent` registers the player's return point before the player appears inside the content area, then sends zone packets and calls Lua `onZoneIn(player, contentArea)`.

Volatile `TotorakInstanceState` holds:

- `Area`
- `PartyGroupId`
- `ExpiresAtUtc`
- `IsFinishing`
- `IsStarting`
- `StartupGraceExpiresAtUtc`
- `ClearSceneSent`
- `OccupancyDirector`
- `SpawnedOccupancyDirectorPlayerIds`
- `SpawnedInstanceRaidDirectorPlayerIds`

Party rejoin uses `TryJoinActiveTotorakInstance` and checks that the player is
at the entrance, eligible by timer and level, and attached to the matching
active party instance.

### No content group on this lane

Source:

- `Map Server/Actors/Area/Zone.cs`
- `Map Server/Actors/Director/Director.cs`

`CreateContentAreaWithoutContentGroup` passes `hasContentGroup=false`. The `Director` constructor only creates a content group when `hasContentGroup` is true. Therefore current local Toto-Rak production does not have a content group, and `StartContentGroup()` does not start meaningful group packets here.

### Attach/bind helper

Source:

`Map Server/WorldManager.cs`

`AttachTotorakLegacyDutyWidgetDirector(player, instance, sendPackets, setLoginDirector, reason)`:

1. Ensures a `RaidFst0Dungeon03` director.
2. Calls `director.ReplacePlayerMember(player)`.
3. Calls `player.SetLoginDirector(director)` only when `setLoginDirector == true`.
4. Sends director spawn/init manually only when needed and only for non-content-director/manual-bind cases.

Current entry/rejoin/opening-widget paths use `setLoginDirector=true`; the
direct widget-close helper uses `false`.

Relevant wrappers:

```csharp
BindTotorakLegacyDutyWidgetDirector(player, instance)
    -> Attach(..., sendPackets: true, setLoginDirector: true, "bind")

PrepareTotorakLegacyDutyZoneInit(player, instance, reason)
    -> Attach(..., sendPackets: false, setLoginDirector: true, reason)

ScheduleTotorakLegacyDutyWidgetOpen(player, instance, reason)
    -> Attach(..., sendPackets: true, setLoginDirector: true, reason)
```

Login/reconnect note:

- No recovered client `onLogin` method was found on `RaidDungeonSimple`, `PrivateAreaOccupancyBaseClass`, `OccupancyDirectorBaseClass`, or `RaidFst0Dungeon03`.
- Current local login reconnect is C# behavior: `DoZoneIn(..., isLogin: true, ...)` calls `ScheduleTotorakLegacyDutyWidgetOpenForPlayer(player, "login-reconnect")`.
- `DoZoneIn` then calls Lua `onZoneIn(player, playerArea)`, but local `Data/scripts/content/Totorak.lua` only applies music. It does not own widget/relogin logic.

## Packet lane and local event flow

Packet classes:

- `Map Server/Packets/Receive/Events/EventStartPacket.cs`
- `Map Server/Packets/Receive/Events/EventUpdatePacket.cs`
- `Map Server/Packets/Send/Events/KickEventPacket.cs`
- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`
- `Map Server/Packets/Send/Events/EndEventPacket.cs`
- `Map Server/Packets/Send/Actor/ActorInstantiatePacket.cs`
- `Map Server/Packets/Send/Actor/_0x132Packet.cs`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs`
- `Map Server/Packets/Send/Player/GenericDataPacket.cs`
- `Map Server/Packets/Send/Actor/Events/SetNoticeEventCondition.cs`
- `Map Server/Packets/Send/Groups/SynchGroupWorkValuesPacket.cs`

Send-side event opcodes:

| Opcode | Direction | Local class | Role |
| --- | --- | --- | --- |
| `0x00CC` | server to client | `ActorInstantiatePacket` | Script/class bind for actor instantiation, full `0x128`, body `0x108`. |
| `0x012D` | client to server | `EventStartPacket` | Client starts/accepts event context, full `0xD8`. |
| `0x012E` | client to server | `EventUpdatePacket` | Client event update/result lane, full `0x78`. |
| `0x012F` | server to client | `KickEventPacket` | Server opens/kicks an event on an owner actor, full `0x90`, body `0x70`. |
| `0x0130` | server to client | `RunEventFunctionPacket` | Server invokes a Lua function on active event owner, full `0x2B8`, body `0x298`. |
| `0x0131` | server to client | `EndEventPacket` | Server closes active client event, full `0x50`, body `0x30`. |
| `0x0132` | server to client | `_0x132Packet` | Command/widget/event-function bootstrap, full `0x48`, body `0x28`; still capture raw retail order/source. |
| `0x0133` | server to client | `GenericDataPacket` | Raw Lua-param data packet, used by modern instance-raid lanes, full `0xE0`, body `0xC0`. |
| `0x0137` | server to client | `SetActorPropetyPacket` | Actor property/init targets such as `/_init`, full `0xA8`, body `0x88`. |
| `0x017A` | server to client | `SynchGroupWorkValuesPacket` | Content-group work sync. |

Direction warning:

- Send-side `0x012F` is `KickEventPacket`.
- Receive-side `0x012F` in other local code is not the same semantic lane; do not mix it with send-side `KickEvent`.
- Send-side `0x0131` is `EndEventPacket`.
- Receive-side `0x0131` in other local packet dispatch is an unrelated request lane.

### `KickEventPacket`

Source:

`Map Server/Packets/Send/Events/KickEventPacket.cs`

Shape:

```text
0x00 u32 triggerActorId
0x04 u32 ownerActorId
0x08 u8  eventType
0x09 u8  0x17
0x0A u16 0x75DC
0x0C u32 0x30400000
0x10 eventName[0x20]
0x30 Lua params
```

Local Toto-Rak use:

```csharp
player.KickEvent(director, "noticeEvent", payload)
```

That helper builds:

```csharp
KickEventPacket.BuildPacket(player.Id, director.Id, "noticeEvent", 5, luaParams)
```

and returns `new SubPacket(0x012F, triggerActorId, data)`.

### `RunEventFunctionPacket`

Source:

`Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`

Shape:

```text
0x00 u32 triggerActorID
0x04 u32 ownerActorID
0x08 u8  eventType
0x09 eventName[0x20]
0x29 functionName[0x20]
0x49 Lua params
```

Director helper:

Source:

`Map Server/Actors/Director/Director.cs`

```csharp
RunEventFunctionPacket.BuildPacket(
    player.Id,
    director.Id,
    "noticeEvent",
    5,
    functionName,
    luaParams)
```

Diagnostic name: `DirectorRunEventFunction`.

The helper returns `new SubPacket(0x0130, triggerActorID, data)`.

### Lua param encoding for this path

Source:

`Map Server/Lua/LuaUtils.cs`

`LuaUtils.CreateLuaParamList(...)` and `WriteLuaParams(...)` encode the
Toto-Rak notice-event payloads as:

```text
KickEvent params ["relogin", finishTime, false]
  0x02 "relogin\0"
  0x00 finishTime as big-endian uint from LuaParam typeID 0x01
  0x04 false
  0x0F terminator

RunEventFunction params [player, finishTime, false]
  0x06 player actor id as big-endian uint
  0x00 finishTime as big-endian uint from LuaParam typeID 0x01
  0x04 false
  0x0F terminator
```

Arg semantics:

- `RaidFst0Dungeon03.relogin` is recovered as
  `function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)`.
- `RaidFst0Dungeon03.eventNoticeCutScene` is recovered as
  `function RaidFst0Dungeon03.eventNoticeCutScene(self, player, sceneKey, cutsceneArg, finishTime)`.
- Native dispatch supplies only the receiver (`self`) by resolving the function
  on the owner actor. The packet Lua params still need to include `player`.
- Correct `0x0130 relogin` params are `[player, finishTime, false]`.
- Correct `0x0130 eventNoticeCutScene` params are
  `[player, "rad0f300", 1, finishTime]`.
- A no-player `0x0130 relogin` body `[finishTime, false]` maps as
  `player=finishTime`, `finishTime=false`, `clearFlag=nil`. That cannot reach
  the recovered widget branch because `clearFlag == false` is not true, and
  the first fade call is aimed at a number rather than a player actor.

Current Toto-Rak call sites pass `finishTime` as `uint`. `CreateLuaParamList`
stores that as LuaParam typeID `0x01`, but `WriteLuaParams` deliberately writes
wire tag byte `0x00` for typeID `0x01` before writing the big-endian uint value.
So a raw payload comparison should expect a `0x00` numeric tag, not a literal
`0x01` tag, for `finishTime`.

Byte-order note:

- Fixed packet-body integer fields written directly by `BinaryWriter` are
  little-endian in local source.
- Lua-param integer/actor values are endian-swapped by `LuaUtils` before the
  `BinaryWriter` write, so they appear big-endian in the Lua-param stream.

For the current logged no-opening run with `player.Id = 0x00000001`,
`director.Id = 0x64F80002`, and `finishTime = 1782172355`
(`0x6A39CAC3`), the source-derived body bytes to compare are:

```text
0x012F body prefix:
  01 00 00 00                                      trigger actor, little-endian player
  02 00 F8 64                                      owner actor, little-endian director
  05 17 DC 75 00 00 40 30                          type/unknown/server-code fields
  6E 6F 74 69 63 65 45 76 65 6E 74 00 ...          "noticeEvent\0" at 0x10, zero-padded to 0x30
  02 72 65 6C 6F 67 69 6E 00                       Lua string "relogin"
  00 6A 39 CA C3                                   Lua uint finishTime, wire tag 0x00 + big-endian value
  04 0F                                            false + terminator

0x0130 conditional Lua current-event relogin body prefix:
  01 00 00 00                                      trigger actor, little-endian player
  02 00 F8 64                                      owner actor, little-endian director
  50                                               current event type observed in 0x012D
  6E 6F 74 69 63 65 45 76 65 6E 74 00 ...          "noticeEvent\0" at 0x09, zero-padded to 0x29
  72 65 6C 6F 67 69 6E 00 ...                      "relogin\0" at 0x29, zero-padded to 0x49
  06 00 00 00 01                                   Lua actor player id, big-endian value
  00 6A 39 CA C3                                   Lua uint finishTime, wire tag 0x00 + big-endian value
  04 0F                                            false + terminator

0x0130 correct explicit/direct helper relogin differs only in event type:
  offset 0x08 = 05

0x0130 current dirty-tree active-event retry in Map Server/WorldManager.cs:
  offset 0x08 = 50 for current-event player.RunEventFunction
  offset 0x08 = 05 for explicit Director.SendDirectorEventFunction fallback
  Lua params are 06 00 00 00 01 00 <finishTime> 04 0F
  The actor tag before finishTime is present in the current working tree.

0x0130 historical bad-arg retry shape from older no-widget notes/logs:
  offset 0x08 = 50 or 05, depending on current-type/direct helper lane
  Lua params are 00 <finishTime> 04 0F
  Missing actor tag 06 00 00 00 01 before finishTime

0x0131 Lua/current close body prefix:
  01 00 00 00                                      source player, little-endian
  00 00 00 00                                      required zero close-owner field
  50                                               current event type from 0x012D
  6E 6F 74 69 63 65 45 76 65 6E 74 00 ...          "noticeEvent\0" at 0x09

0x0131 C# fallback close differs only in event type:
  offset 0x08 = 05
```

### `EndEventPacket`

Source:

`Map Server/Packets/Send/Events/EndEventPacket.cs`

Shape:

```text
0x00 u32 sourcePlayerActorId
0x04 u32 zero close-owner field
0x08 u8  eventType
0x09 eventName[0x20]
```

The local implementation keeps the close-owner field zero because echoing the event owner can leave NPC talk events waiting.

### `EventStartPacket`

Source:

`Map Server/Packets/Receive/Events/EventStartPacket.cs`

Client-to-server parse shape:

```text
0x00 u32 triggerActorID
0x04 u32 ownerActorID
0x08 u32 serverCodes
0x0C u32 unknown
0x10 u8  eventType
0x11 eventName[0x20]
0x31 Lua params, or empty marker if next byte is 0x01
```

Local dispatch resolves `ownerActorID` through static actors, retainers, area
actors, battle-command synthetic actors, then `player.GetDirector(ownerActorID)`.
For the Toto-Rak bridge, the important route is the owned director lookup.

### `EventUpdatePacket`

Source:

`Map Server/Packets/Receive/Events/EventUpdatePacket.cs`

Client-to-server parse shape:

```text
0x00 u32 triggerActorID
0x04 u32 serverCodes
0x08 u32 unknown1
0x0C u32 unknown2
0x10 u8  eventType
0x11 Lua params
```

The local opcode is receive-side `0x012E`. Do not conflate this with the
capture-requested `0x0132`; local `0x0132` is a separate send-side bootstrap
packet.

### `_0x132Packet`

Source:

`Map Server/Packets/Send/Actor/_0x132Packet.cs`

Shape:

```text
0x00 u16 number
0x02 function[0x20] ASCII, truncated/padded by packet body
```

The subpacket source actor is the `sourceActorId` passed to
`_0x132Packet.BuildPacket(sourceActorId, number, function)`.

Local my-player spawn bootstrap:

```text
0x000B commandForced
0x000A commandDefault
0x0006 commandWeak
0x0008 commandContent
0x0006 commandJudgeMode
0x0100 commandRequest
0x0100 widgetCreate
0x0100 macroRequest
```

Hamlet probes also use targeted `0x0132 widgetCreate` packets, including a
widget-index variant. For Toto-Rak capture work, log every `0x0132` near
zone-in and event startup with source/target actor ids, `number`, function
label, raw body, and ordering relative to player bind, director bind,
`KickEvent`, `RunEventFunction`, and widget creation.

### `GenericDataPacket`

Source:

`Map Server/Packets/Send/Player/GenericDataPacket.cs`

Shape:

```text
0x00 Lua params
```

It returns `new SubPacket(0x0133, sourceActorId, data)`. `Player.SendDataPacket`
uses `player.Id` as the source actor, while `Director.SendInstanceRaidData` uses
the director id. This is used by the modern `InstanceRaidBaseClass` lane
(`_onReceiveDataPacket(...)`), not by the recovered old
`RaidFst0Dungeon03.eventNoticeCutScene`/`relogin` widget lane.

### Actor bind and group packets

`ActorInstantiatePacket` is opcode `0x00CC`.  For directors it carries the actor
id, generated actor name, Lua class name, and Lua init params beginning at body
offset `0x44`.

Local packet body layout:

```text
0x00: int16 0x0000       -- instance id? comment in source
0x02: int16 0x3040
0x04: objectName[0x20]
0x24: className[0x20]
0x44: Lua init params
```

`SetActorPropetyPacket` is opcode `0x0137`.  Director init uses it for:

```text
/_init
```

`SetActorPropetyPacket` writes a one-byte running payload length at body offset
`0`, then target/property chunks. `AddTarget()` uses target marker `0x82 + len`
for normal final targets, `0x60 + len` when more chunks follow, and `0xA4 + len`
for array mode.

Property entry forms are:

```text
byte/short/int: len/type byte + u32 murmur(propertyName) + value
```

The current local `AddProperty` roots are `work`, `charaWork`, `playerWork`,
`npcWork`, `guildleveWork`, and `behestWork`. Bitfield targets add byte `9`,
`u16 from`, and `u16 to` before the target string.

`SynchGroupWorkValuesPacket` is opcode `0x017A`.  When a content group exists,
local content-group initialization sends work for:

```text
/_init
contentGroupWork/director
contentGroupWork/property
```

The Toto-Rak normal path currently creates the area with
`CreateContentAreaWithoutContentGroup`, so the group packet family is useful
comparative plumbing rather than part of the default local Toto-Rak entry lane.

### Director actor and content-group bridge

Local `Director` actor ids use:

```csharp
6 << 28 | zone.ZoneId << 19 | (uint)directorIndex + 2
```

Director spawn packet order:

1. `AddActor`
2. event conditions
3. speed
4. position
5. name
6. state
7. zoning flag
8. `ActorInstantiatePacket`

Director init packet:

```text
SetActorPropetyPacket("/_init").AddTarget()
```

The director script bind seeds the class path, five `LuaParam(4, 4)` values, and
any init return values after the class path.  Director event conditions include
`noticeEvent`, `noticeRequest`, and `reqForChild`; the occupancy bridge sends
`RunEventFunctionPacket` on `noticeEvent` with event type `5`.

Local `AttachTotorakLegacyDutyWidgetDirector(...)` replaces/adds the player as
a director member, optionally sets `loginInitDirector`, and sends director
spawn/init packets only when `sendPackets == true`, the director is not already
the content director, and the player has not already received that persisted
occupancy director spawn for the content copy.

When a director is created with a content group in other paths, local
`ContentGroup` uses type `30006` (`SimpleContentGroup24B`) and seeds:

```text
contentGroupWork._globalTemp.director = director.Id << 32
contentGroupWork.property[0] = true
contentGroupWork.property[1] = true
contentGroupWork.property[2] = true
```

Recovered client `ContentGroupBaseClass:getDirector()` reads that shifted
director id, resolves it back to a live actor, and returns nil if the actor is
missing or dead.

## Local proven widget/relogin packet/order sequence

This is current local implementation behavior for duty-widget relogin/open, not
a retail capture.

1. Server creates private content area with area class `/Area/PrivateArea/Occupancy/RaidDungeonSimple` and director script `Occupancy/RaidFst0Dungeon03`.
2. Server starts the `RaidFst0Dungeon03` director with `StartDirector(false)`.
3. Server adds entrants as director members.
4. Server prepares occupancy director membership for zone init with
   `setLoginDirector=true`.
5. Server calls `DoZoneChangeContent`.
6. `DoZoneChangeContent` sends:

   ```text
   DeleteAllActors
   _0xE2(0x10)
   ClearInstance
   SendZoneInPackets
   SendInstanceUpdate(true)
   optional EndEvent for prior event
   ```

7. `Player.SendZoneInPackets` queues the player's own spawn/script bind first.
8. Current normal Toto-Rak paths set `loginInitDirector` before zone-in, and
   `Player.CreateScriptBindPacket` uses the login-director `Player_work` shape
   when that field is non-null.
9. `Player.SendZoneInPackets` later queues owned directors, including the `RaidFst0Dungeon03` director spawn/init.
10. After the widget-open delay, server sends `0x012F KickEvent` on owner director, event `noticeEvent`.
11. Client replies with `0x012D EventStart`.
12. Server routes owner actor by static actor, retainer, area actor, battle command actor, then owned director.
13. Server calls `Player.StartEvent`.
14. `LuaEngine.EventStarted` prepends event type/name and calls `Director.OnEventStart`.
15. `Director.OnEventStart` prepends `(player, director)` and calls local
    `RaidFst0Dungeon03.onEventStarted(player, director, eventType, eventName,
    command, ...)`.
16. In the current logged no-opening widget path, `0x012D EventStart` returns
    `Params: false`. Local `RaidFst0Dungeon03.onEventStarted` therefore takes
    the `command == false` setup branch, calls `OccupancyDungeonCallSetup`, and
    sets `shouldEndEvent = false`.
17. Because that observed setup branch does not call
    `OccupancyDungeonCallCurrentRelogin`, it does not queue the current-event
    `player:RunEventFunction("relogin", ...)` from Lua.
18. The event remains active with owner = director, event = `noticeEvent`, and
    current type observed as `0x50`.
19. The C# active-event retry checks whether the same notice event
    is still active: first after `250 ms`, then every `200 ms`, up to `30`
    attempts. Once active, it waits `2500 ms`, sends setup calls, then
    repeatedly sends `0x0130 relogin(player, finishTime, false)` on the
    current-event lane and, if the event remains active after `350 ms`, an
    explicit type-5 fallback through `Director.SendDirectorEventFunction(...)`
    with the same Lua args. It can repeat this open attempt up to `4` times,
    `2000 ms` apart, before optional slot-15 container fallback and a final
    `player.EndEvent()` close.
20. The client ACKs the event lane, but ACK is still not proof that the
    slot-15 widget side effect completed. With the current correct args, a
    no-widget result should be investigated at the native dispatch/owner gate,
    widget-mode/slot guard, or system-command `24228` create-widget boundary.

### Current local widget/relogin payload

Kick payload:

```text
KickEvent(owner = director, eventName = "noticeEvent", params = ["relogin", finishTime, false])
```

Conditional Lua current-event run function:

```text
RunEventFunction(
  triggerActorID = player.Id,
  ownerActorID = director.Id,
  eventName = "noticeEvent",
  eventType = currentEventType from client EventStart, observed locally as 0x50,
  functionName = "relogin",
  params = [player, finishTime, false])
```

This is the shape if `onEventStarted` receives command `"relogin"` and calls
`OccupancyDungeonCallCurrentRelogin`. The current no-opening widget runtime log
does not show that branch; it shows `EventStart` params `false`.

Current C# active-event retry/direct run function in `Map Server/WorldManager.cs`:

```text
Current-event retry:
RunEventFunction(
  triggerActorID = player.Id,
  ownerActorID = director.Id,
  eventName = "noticeEvent",
  eventType = currentEventType from client EventStart, observed locally as 0x50,
  functionName = "relogin",
  params = [player, finishTime, false])
```

```text
Explicit fallback:
RunEventFunction(
  triggerActorID = player.Id,
  ownerActorID = director.Id,
  eventName = "noticeEvent",
  eventType = 5,
  functionName = "relogin",
  params = [player, finishTime, false])
```

This matches the recovered client method argument shape in the current
dirty-tree source. Older notes describing `[finishTime, false]` were from the
pre-correction retry shape and should be treated as historical negative
evidence only.

### Current local direct opening cutscene payload

The current direct cutscene helper does not use the widget-open path's explicit
`KickEvent -> EventStart -> active-event wait` sequence. It uses
`Director.SendDirectorEventFunction(...)`:

```text
RunEventFunction(
  triggerActorID = player.Id,
  ownerActorID = director.Id,
  eventName = "noticeEvent",
  eventType = 5,
  functionName = "eventNoticeCutScene",
  params = [player, "rad0f300", 1, finishTime])
```

## Retail packet order status

No local retail Toto-Rak capture was found.

User hypothesis:

```text
director spawn/bind
player bind with login director
event kick/run function
widget open
```

Current local code now partially matches this, but it is still not a retail
packet capture:

- `PrepareTotorakLegacyDutyZoneInit(...)` and the opening-cutscene prep both
  attach the occupancy director with `setLoginDirector=true` before zone-in.
- `Player.SendZoneInPackets` emits the player's own spawn/script bind before
  owned director spawn/init. Because the attach path replaced/added the player
  member first, `SetLoginDirector` can set `loginInitDirector`, and the
  self-bind can carry the occupancy director in the login-director argument
  lane.
- The my-player spawn path also emits `0x0132` command/widget bootstrap packets
  such as `commandRequest`, `widgetCreate`, and `macroRequest`.
- Owned director spawn/init is emitted later from `Player.SendZoneInPackets`
  by iterating `ownedDirectors`.
- The later scheduled attach for the widget event also passes
  `setLoginDirector=true`; the async event opener clears the login director
  after send/timeout as cleanup.

Therefore:

- The hypothesized order may still be retail, but it is not proven by local files.
- The current local proven order is my-player spawn plus `0x0132`
  command/widget bootstrap and player bind, then owned director spawn/init,
  then delayed `KickEvent`, client `EventStart(false)`, C# active-event setup,
  current-type `relogin(player, finishTime, false)`, explicit type-5
  `relogin(player, finishTime, false)` fallback, optional slot-15 container
  fallback, client `EventUpdate`, and final plain `player.EndEvent()` if the
  notice event is still active. The observed ACK is not proof of client widget
  execution.

## Runtime trace needed

Static Lua is no longer the limiting evidence for the opening scene. The
recovered call target is:

```lua
eventNoticeCutScene(player, "rad0f300", 1, finishTime)
```

and that callback runs:

```lua
worldMaster:createCutScene("rad0f300", self):startCutScene(1, 61, 1, 0, 1)
desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
```

The remaining unknown is the runtime envelope/order around that Lua callback.
The likely crash class is wrong event ownership, binding, or packet order, not
necessarily a wrong cutscene key.

### Duty-widget capture focus

For the Toto-Rak duty widget specifically, the recovered path is not a generic
widget-property update:

```lua
RaidFst0Dungeon03.relogin(player, finishTime, false)
  -> desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  -> openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1, finishTime)
```

So the capture target is the director-owned `noticeEvent` sequence that makes
the client execute `relogin`, not an independent "open widget" packet.

Highest-value comparison rows:

| Opcode | Why it matters for the duty widget |
| ---: | --- |
| `0x012F` | Kicks director-owned `noticeEvent`; owner/source/event type must be right before the client will enter the event. |
| `0x0130` | Runs `relogin` on the active/director event owner; this is the packet that should cause the slot-15 widget open side effect. |
| `0x0132` | Command/widget bootstrap context such as `commandRequest`, `widgetCreate`, and `macroRequest`; compare order/source, but do not treat it as the legacy Toto-Rak widget open itself. |
| `0x0137` | Work/property updates for actor/director/player state; important for work-driven widgets and login/director readiness, but not the direct legacy duty-widget open call. |

Expected legacy relogin payload shape:

```text
KickEvent noticeEvent ["relogin", finishTime, false]
RunEventFunction noticeEvent "relogin" [player, finishTime, false]
```

The real question is whether retail uses the same owner/source/order around
that sequence, especially director id, event owner, caller/trigger actor,
send-side `0x012F` type `0x05`, client/current event type, and whether
`0x012D EventStart` establishes the current event before `0x0130 relogin`.

### Source-derived local owner/source/order

No raw retail Toto-Rak packet capture was found in the repository. The strongest
current evidence is the checked-in local source path for entry/rejoin widget
open:

| Step | Packet/action | Proven local source/owner/order |
| ---: | --- | --- |
| 1 | Prepare zone init | `AttachTotorakLegacyDutyWidgetDirector(player, instance, sendPackets=false, setLoginDirector=true, reason)` adds/replaces the player as a director member, then sets `player.loginInitDirector`. No packets are sent here. |
| 2 | Zone-change prelude | `DoZoneChangeContent` queues `DeleteAllActors`, `_0xE2(0x10)`, clears instance state, then calls `player.SendZoneInPackets(...)`. |
| 3 | My-player spawn | `Player.GetSpawnPackets(this, spawnType)` emits my-player spawn packets. For the same player, this includes `0x0132` bootstrap rows before player script bind: `commandForced`, `commandDefault`, `commandWeak`, `commandContent`, `commandJudgeMode`, `commandRequest`, `widgetCreate`, `macroRequest`. Header `sourceId = player.Id`, `targetId = session/player id`. |
| 4 | Player bind | The my-player `0x00CC ActorInstantiatePacket` has subpacket header source `player.Id`. `ActorInstantiatePacket` does not write a separate body source field. Current local Toto-Rak prep sets `loginInitDirector`, so the self-bind can carry the occupancy director in the `Player_work` init-director slot. |
| 5 | Owned director spawn | Later in `Player.SendZoneInPackets`, `ownedDirectors` are spawned. The Toto-Rak occupancy director emits event conditions, then `0x00CC` script bind with subpacket header source `director.Id`, class `RaidFst0Dungeon03`, then `0x0137 /_init` with the director as the work/property target. Target is still the player's session id after queueing. |
| 6 | Delayed widget event | After `1200 ms`, `ScheduleTotorakLegacyDutyWidgetOpen` attaches again with `sendPackets=true`, `setLoginDirector=true`. Because the director is the content director and already known through zone-in, manual spawn packets are normally not resent. |
| 7 | `0x012F KickEvent` | `KickTotorakLegacyDutyEvent` calls `player.KickEvent(director, "noticeEvent", "relogin", finishTime, false)`. Header `sourceId = player.Id`, queued `targetId = session/player id`; body `triggerActorId = player.Id`, `ownerActorId = director.Id`, `eventType = 5`, `eventName = "noticeEvent"`, Lua params `["relogin", finishTime, false]`. |
| 8 | `0x012D EventStart` | Expected client response: `triggerActorID = player.Id`, `ownerActorID = director.Id`, `eventName = "noticeEvent"`. The local 2026-06-22 runtime log reports `eventType/currentEventType = 0x50` and params `false` for this director notice event. Server resolves the owner through the player's owned director list and sets `currentEventOwner/currentEventName/currentEventType`. |
| 9 | Lua setup branch | With observed params `false`, `RaidFst0Dungeon03.onEventStarted` calls `OccupancyDungeonCallSetup(player)` and sets `shouldEndEvent = false`. This intentionally leaves the notice event active; it does not call `OccupancyDungeonCallCurrentRelogin`. |
| 10 | Conditional Lua current-event `0x0130` | If a client/runtime path returned command `"relogin"` instead, `OccupancyDungeonCallCurrentRelogin -> callClientFunction -> player.RunEventFunction("relogin", player, finishTime, false)` would build a current-event `0x0130`: header `sourceId = player.Id`, queued `targetId = session/player id`; body `triggerActorID = player.Id`, `ownerActorID = currentEventOwner = director.Id`, `eventType = currentEventType` observed locally as `0x50`, `eventName = "noticeEvent"`, `functionName = "relogin"`, Lua params `[player, finishTime, false]`. Current no-opening logs do not prove this branch. |
| 11 | C# active-event retry/direct relogin | Server waits for `currentEventOwner == director.Id` and `currentEventName == "noticeEvent"`: first check after `250 ms`, then every `200 ms`, up to `30` attempts. Once the event is active, current source waits `2500 ms`, sends command/widget bootstrap and current-type setup calls, then sends current-type `0x0130 relogin` and, after `350 ms` if the event remains active, explicit-type `0x0130 relogin`: header/body trigger `player.Id`, owner `director.Id`, event `"noticeEvent"`, current type observed as `0x50`, explicit fallback type `5`, function `"relogin"`, params `[player, finishTime, false]`. It can repeat open attempts up to `4` times, `2000 ms` apart. This matches the recovered client method argument shape. |
| 12 | C# fallback EndEvent | After optional slot-15 container fallback, C# waits `2500 ms`; if the notice event is still active, it queues plain `player.EndEvent()`. The current 18:52 log shows the client answers the explicit helper with `EventUpdate` step `0x5`, so fallback close may not be needed in that run. |
| 13 | Cleanup | The async opener clears `player.loginInitDirector` in `finally` after send/timeout. |

Event type note: local `KickEventPacket` and direct
`Director.SendDirectorEventFunction` builders send type `5`. A conditional Lua
current-event relogin path would inherit the client's `0x012D EventStart` type,
observed in the local runtime log as `0x50`; its `0x0130 relogin`,
`0x012E EventUpdate`, and Lua `player.EndEvent()` close would follow that active
current-event type. The current proven no-opening widget path instead leaves
the event active on `EventStart(false)` and sends relogin through the C#
active-event retry with the `player` Lua arg present; its explicit fallback
uses type `5`, and its fallback close is currently plain `player.EndEvent()`.

Source ids in the local `SubPacket` header are not the same as event owner ids:
the header source for `0x012F`, `0x0130`, and `0x0131` is the player id because
the builders use the trigger/source player id. The event owner that matters for
Lua dispatch is the director id inside the packet body at owner offset `0x04`.
`Session.QueuePacket(...)` sets the subpacket `targetId` to the player's
session id after construction.

Local dynamic director ids are `0x6...` actor ids built from zone id and
director index. The widget constants are separate:

- `director.Id`: event owner for `noticeEvent`.
- `player.Id`: trigger/source and client target session id.
- `1`: `RaidDungeonExecutionWidget` content id.
- `15`: widget slot opened by the recovered desktop connector.
- `2123`: legacy Toto-Rak place/display argument, discarded by the recovered
  connector before widget init.

Local direct cutscene helper caveat:

- `SendTotorakLegacyDutyCutscene(...)` uses
  `director.SendDirectorEventFunction(player, "eventNoticeCutScene", ...)`.
- That builds `0x0130` directly as owner = director, event = `"noticeEvent"`,
  type = `5`, without the local widget-open path's explicit
  `KickEvent -> EventStart -> active-event wait`.
- For duty-widget relogin, focus on the widget-open path above, not this direct
  cutscene shortcut.

### Local runtime log confirmation

Local runtime logs on 2026-06-22 confirm the owner/order envelope for the
no-opening-cutscene duty-widget path, including the current explicit-type C#
retry helper:

- `map.log:14146-14148`: after zone-in, the scheduled attach reports
  `loginInit=False`, kicks `noticeEvent` with command `relogin`, and queues the
  widget-open notice event against director `0x64F80002` with finish time
  `1782172355`.
- `map.log:14149-14158`: client `EventStart` reports `Source Actor: 0x1`,
  `Caller Actor: 0x64F80002`, caller path
  `/Director/Occupancy/RaidFst0Dungeon03`, event starter `noticeEvent`, and
  params `false`.
- `map.log:14159`: current runtime sends
  `Sent active-event explicit-type legacy widget open` only after the current
  event context is `owner=0x64F80002:event=noticeEvent:type=0x50`.
- `map.log:14160-14172`: the client then sends `EventUpdate` with step `0x5`,
  and the transport summary reports `DirectorRunEventFunction:1`, proving the
  explicit director helper path was used for the retry/direct relogin.

Earlier runs add useful comparison evidence:

- `map.log:13427-13449` shows the same owner/order envelope before the helper
  log label changed; use it as packet-envelope evidence, not current retry-type
  authority.
- `map.log:11801-11832` shows `EventStart`, multiple `EventUpdate` callbacks at
  step `0x50`, and a transport burst with `RunEventFunction:3`, matching the
  Lua `_WAIT_EVENT` resume/end path plus possible retry behavior.

Raw payload boundary:

- Current runtime logs contain the explicit-type retry message, but not a raw
  hex body dump for the corresponding `0x0130`.
- `DebugPrintSubPacket()` prints raw header/body hex only in `#if DEBUG`.
- The release logs in this workspace have transport summaries and selected
  hotbar/hamlet raw packet channels, but no Toto-Rak raw packet body dump.
- Therefore the exact raw bytes above are source-derived from packet builders
  and Lua-param encoders, not captured retail or captured local raw hex.

### Static envelope decomp pass

Recovered Lua does not contain a deeper Toto-Rak-specific packet receiver for
this path:

- `PlayerBaseClass.isEventPlaying()` checks native event state for
  `"talkDefault"`, emotes, push events, commands, and `"noticeEvent"`.
- `PlayerBaseClass._isEventPlaying_inl` maps that check to
  `_isEventPlaying_cpp`.
- `DirectorBaseClass.delegateEvent(player, target, functionName, ...)` calls
  `target:_callFunction(functionName, player, director, ...)`.
- `NpcBaseClass.delegateEvent(player, target, functionName, ...)` has the same
  native `_callFunction` shape, but passes the NPC owner.
- `DirectorBaseClass._onEventCancel` closes owned content widgets and resets
  player fade for `"noticeEvent"`.
- `NpcBaseClass._onNoticeRejected` and `DirectorBaseClass._onNoticeRejected`
  are empty in the recovered Lua.

That puts the fragile part below Lua: native actor/event context binding,
event ownership, and `RunEventFunction` dispatch readiness. The prior native
probe pack adds these useful constraints:

- `KickEvent` success, client `EventStart`, and `RunEventFunction` dispatch are
  separate gates.
- The native kick-ready gate is not enough to prove the later
  function-dispatch gate is ready.
- For cinematic `noticeEvent`, the `KickEvent` body event type byte should be
  `0x05`; native notes say only that type sets the notice flag.
- `RunEventFunction` can be queued/retained instead of dispatched if the target
  actor's event/script context is not ready.
- The dispatch gate is tied to native actor event/script context, not just a
  visible actor id.
- The pending run-function queue drains from the back and stops at the first
  dispatch-readiness failure.

Local C# mirrors the same ownership dependency:

- `Player.StartEvent(...)` sets `currentEventOwner`, `currentEventName`, and
  `currentEventType` from client `0x012D EventStart`.
- `Player.RunEventFunction(...)` builds `0x0130` from those current event
  fields.
- `Director.SendDirectorEventFunction(...)` bypasses the current-player fields
  and explicitly builds `0x0130` as owner = director, event = `"noticeEvent"`,
  type = `5`.
- Current local `RaidFst0Dungeon03.onEventStarted` can use the current-event
  `OccupancyDungeonCallCurrent*` bridge when it receives an explicit command,
  so that conditional `RunEventFunction` envelope depends on the preceding
  `0x012D EventStart` having set the correct current owner/name/type.
- The current proven no-opening widget relogin keeps the event active with
  `EventStart(false)` and then uses the active-event retry to send
  `relogin(player, finishTime, false)` on the current-event lane, followed by
  `Director.SendDirectorEventFunction(...)` as an explicit type-`5` fallback
  with the same Lua args.

So a useful retail trace must prove not only that the payload says
`eventNoticeCutScene/rad0f300`, but that the director/client event context is
ready when the run function arrives. If the client queues, rejects, or no-ops
the run function, the static Lua callback can be correct and the entry can
still crash or hang.

`0x012E EventUpdate` ACK is therefore a weak signal for this bug. It proves the
client answered the event lane; it does not prove the relogin body reached
`openWidgetLocal -> commandCreateWidget -> commandAboutWidget`. The hard proof
boundary is system command `24228`: once the widget branch reaches
`_executeCommand("widgetCreate", player:getSystemCommand(24228), ...)`, the
server should see a client event for static owner `0xA0F05EA4` unless the
command bridge is suppressed locally before packet emission.

Content-group side clue:

- `ContentGroupBaseClass.getDirector()` returns
  `contentGroupWork._globalTemp.director` only if it exists and `_isAlive()`.
- If retail Toto-Rak uses a content group, `0x017A`/group work may be part of
  how the client learns the authoritative director. Current local Toto-Rak does
  not use a content group by default, so this remains capture-first.

Ideal retail/client trace window:

| Opcode | Capture fields needed |
| ---: | --- |
| `0x00CC` | Actor id, object name, class name, Lua init params for director and player bind. |
| `0x012D` | Client event-start trigger actor, owner actor, server codes, unknown, event type, event name, raw Lua params. |
| `0x012F` | Kick trigger actor, owner actor, event type, event name, raw Lua params. |
| `0x0130` | Run-function trigger actor, owner actor, event name/type, function name, raw Lua params. |
| `0x0131` | End-event source actor, event type, event name, and timing relative to cutscene/widget execution. |
| `0x0132` | Source/target actor ids, raw body, `number`, function label such as `commandRequest`/`widgetCreate`/`macroRequest`, and relative position in the sequence. |
| `0x0133` | Source actor and raw Lua params if any generic-data packet appears during entry. |
| `0x0137` | Actor id, property target, property ids/values, especially `/_init` and player login-director work. |
| `0x017A` | Content-group list id, director work values, and property flags if a group exists. |

Critical ordering questions:

- Does retail spawn/bind the director before the player bind?
- Does the player bind carry a login director pointer for Toto-Rak entry?
- Is `noticeEvent` owner the occupancy director id, another director, or a
  content/group actor?
- Does `0x012F KickEvent` arrive before any `0x0130 RunEventFunction`, and does
  the client answer with `0x012D EventStart` between them?
- Is the `KickEvent` event type byte `0x05` for the opening `noticeEvent`?
- Is the `RunEventFunction` actually dispatched, or is it queued/retained until
  a missing actor event/script context becomes ready?
- Does retail send setup functions such as `_setInstanceRaid` or
  `_loadTextDataPermanently` before `eventNoticeCutScene`?
- Is `0x0131 EndEvent` sent before cutscene start, after cutscene return, or
  after widget open?
- Do `0x0132 commandRequest`, `0x0132 widgetCreate`, or
  `0x0132 macroRequest` appear before the recovered Lua widget callback?
- Are `0x0133` or `0x017A` required before the client will accept the director
  as the proper event owner?
- For the legacy Toto-Rak duty widget, what exact owner/source/order causes
  `RaidFst0Dungeon03.relogin` to execute? The widget open itself is recovered
  as that callback's slot-15 Lua side effect.
- For work-driven widget comparators, do `0x0137` property updates create or
  refresh widget state before a callback runs?

Until that trace exists, implementation should treat `rad0f300` and
`openRaidDungeonExecutionWidget(2123, 1, finishTime)` as known-good callback
payloads, while treating actor ownership, login-director bind, event close
timing, and group/generic-data packets as capture-first.

### 2026-06-22 follow-up: ACK is not widget proof

An older local no-widget result had a concrete argument-shape problem in
addition to the larger retail-order uncertainty: the active retry sent
`[finishTime, false]` instead of `[player, finishTime, false]`. The current
dirty working tree has corrected both active retry callsites, so this section
keeps the bad-arg case as historical negative evidence and moves the current
probe boundary to native dispatch, widget mode/slot guards, and system command
`24228`.

Correct recovered client call target:

```lua
function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
end
```

Therefore a correct `0x0130 RunEventFunction` for the widget side effect is:

```text
trigger actor = player id
owner actor   = /Director/Occupancy/RaidFst0Dungeon03 id
event name    = noticeEvent
event type    = 0x05 for explicit noticeEvent, or the active type if using current-event state
function      = relogin
Lua params    = [player, finishTime, false]
```

Current evidence does not prove that `0x50` versus `0x05` changes actual
`0x0130` Lua method resolution. The recovered special requirement is narrower:
the opening `0x012F KickEvent` should use notice-event type `0x05`; after that,
both `0x0130` lanes must be judged by downstream side effects such as 24228 or
slot-15 traffic, not by ACK alone.

The native side supplies `self` by dispatching the function on the owner actor.
It does not synthesize `player`. That only happens in recovered Lua helper
paths such as `DirectorBaseClass.delegateEvent(...)`, which explicitly calls
`target:_callFunction(functionName, player, director, ...)`.

Current local source has these relogin packet shapes:

| Path | Source | Params | Notes |
| --- | --- | --- | --- |
| Local Lua bridge/direct helper | `Data/scripts/occupancy_dungeon_widget.lua` via `OccupancyDungeonSendRelogin` | `[player, finishTime, false]` | Correct for recovered client method. |
| Older direct post-cutscene probe | `Map Server/WorldManager.cs` log line 9684 | `[player, finishTime, false]` | Transport summary shows `p0=Player_[0x1]`, `p1=finishTime`. |
| Current active-event retry | `Map Server/WorldManager.cs:2831` | `[player, finishTime, false]` | Correct for recovered `RaidFst0Dungeon03.relogin`; uses current event type, observed locally as `0x50`. |
| Current explicit type-5 retry | `Map Server/WorldManager.cs:2844` | `[player, finishTime, false]` | Correct for recovered `RaidFst0Dungeon03.relogin`; explicit notice type `0x05`. |

The historical no-player shape explains a client ACK with no widget without
needing to blame `contentId=1`, `finishTime`, or the widget class:

- `EventUpdate` step `0x50` or `0x05` proves the client answered the event
  lane.
- It does not prove `RaidFst0Dungeon03.relogin` reached its widget side effect.
- With no `player` param, `relogin(self, finishTime, false)` maps to
  `player=finishTime`, `finishTime=false`, `clearFlag=nil`.
- The widget branch is guarded by `clearFlag == false`, so that bad call shape
  cannot open the widget even if the native dispatcher reports success.
- If the client reaches the first line, the fade call targets a number instead
  of a player actor. The client can still send an ACK or error-handled update
  without any UI actor being created.

For the current dirty-tree source, the best next local probe is:

```text
0x012F KickEvent noticeEvent ["relogin", finishTime, false]
wait for 0x012D EventStart owner=director event=noticeEvent
0x0130 RunEventFunction noticeEvent type=0x05 "relogin" [player, finishTime, false]
watch for client follow-up 0x012D/0x012E plus system-command 24228 / widgetCreate event traffic
watch for local [WidgetOpenCommand] allow/reject logs from owner 0xA0F05EA4
```

If the correct-arg `0x0130` ACKs but no system-command `24228` follow-up
appears, the failure is still before `openWidgetYield` successfully reaches
`commandAboutWidget -> _executeCommand("widgetCreate")`. Absence of a fresh
`0x0132` row is not enough by itself, because `0x0132 widgetCreate` is the
spawn-time command-lane bootstrap, not the per-open widget command. If a fresh
`0x0132` appears anyway and no slot-15 actor appears, treat that as extra
bootstrap/probe evidence rather than the primary open boundary.

The current dirty-tree callsites already match this probe shape:

```csharp
player.RunEventFunction(TotorakLegacyDutyWidgetOpenFunction, player, finishTime, false);
director.SendDirectorEventFunction(player, TotorakLegacyDutyWidgetOpenFunction, player, finishTime, false);
```

Recovered client `DesktopWidget.commandCreateWidget` reaches:

```lua
player:commandAboutWidget(player:getSystemCommand(24228), ...)
```

The recovered client `WidgetOpenCommand.command` is a raw
`require("/Widget/" .. widgetName)` and returns true. The local
`Data/scripts/commands/WidgetOpenCommand.lua` is a guarded server shim: it
allows `RaidDungeonExecutionWidget` only when the player is in private zone
`159`, and otherwise rejects. The allow branch logs and calls `EndEvent`; it
does not itself create the widget. Therefore, if correct-arg `relogin` is truly
executing but the widget still does not appear, the next high-probability
boundary is the system-command `24228` create-widget round-trip and then
client-side slot-15/root-widget creation, not the `RaidFst0Dungeon03.relogin`
args.

Current local `24228` receive boundary:

- DAT/bridge rows map command id `24228` to static actor `0xA0F05EA4`,
  display text `Open Widget`, and recovered/local class `WidgetOpenCommand`.
- `Map Server/PacketProcessor.cs` handles client `0x012D EventStart` by
  resolving `ownerActorID` through static actors first, then retainer, area
  actor, battle-command actor, and finally director ownership.
- Therefore a successful
  `DesktopWidget.commandCreateWidget -> commandAboutWidget(24228, ...)`
  round-trip should enter the server as a static command owner, expected
  `owner=0xA0F05EA4` for `/Command/System/WidgetOpenCommand`.
- The route probe already includes command id `24228`, but
  `debug_event_route_probe` is currently false in `Data/map_config.ini`.
- `Data/scripts/commands/WidgetOpenCommand.lua` chooses the first string/number
  argument as the widget candidate, rejects path-like and desktop/system names,
  and allows `RaidDungeonExecutionWidget` only when `player.CurrentArea.ZoneId`
  is `159` and the area reports private.
- That means `RaidDungeonExecutionWidget` should produce `[WidgetOpenCommand]
  allow` inside Toto-Rak private content, and `[WidgetOpenCommand] reject`
  outside that exact context.

Expected useful logs if this boundary is reached:

```text
[EventRouteProbe] ... owner=0xA0F05EA4 commandId=24228 ... path=/Command/System/WidgetOpenCommand ...
[WidgetOpenCommand] allow owner=0xA0F05EA4 ... candidate=RaidDungeonExecutionWidget ...
```

The second line can appear without the first when `debug_event_route_probe`
remains false. Current adjacent debug flags are:

```text
debug_event_route_probe=false
debug_hotbar_enabled=false
hamlet_defense_enabled=true
debug_hamlet_ui_packets=false
debug_hamlet_ui_raw_packets=false
```

Practical interpretation:

```text
If logs show 0x012D owner=0xA0F05EA4 / commandId=24228 with candidate=RaidDungeonExecutionWidget,
  then relogin reached commandCreateWidget.
  If the log says allow, the local guard passed and the remaining proof target is slot-15/root-widget creation.
  If the log says reject, fix the command context/args before looking farther client-side.
If no 0x012D owner=0xA0F05EA4 and no system-command 24228 / slot-15 actor traffic appears,
  then the failure is earlier: native 0x0130 dispatch, openWidgetYield guard, or commandAboutWidget did not fire.
```

### 2026-06-22 native boundary pass

Local binary available:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe
ImageBase 0x400000, PE32
.text  VA 0x401000, size about 0xB3B56D
.rdata VA 0xF3E000
```

Tooling boundary:

- `pefile` and `capstone` were available for local inspection.
- `ghidraHeadless`, `dumpbin`, `objdump`, `llvm-objdump`, `radare2`, `r2pipe`,
  `lief`, `ida64`, and `strings` were not available in this environment.

Opcode-immediate scanning for the packet ids
`0x012D/0x012E/0x012F/0x0130/0x0131/0x0132/0x0133/0x0137/0x017A` did not recover
a clean event-packet receive/dispatch handler. The strongest-looking hits were
false positives:

- `0x45D327 push 0x12d` and `0x45D341 push 0x130` sit near an `.rdata`
  pointer resolving to OpenSSL `.\crypto\evp\digest.c`.
- `0x4613D1 push 0x130` sits near OpenSSL `.\crypto\ex_data.c`.
- `0x4358EF push 0x133` and `0x438C86 push 0x17a` sit in D3D/task diagnostic
  neighborhoods such as `SetStreamSource` / `ManagerSerialImpl::Present`.

Therefore this immediate-scan pass did not recover a dedicated
`0x0130 RunEventFunction` handler. The source-derived packet field shape
remains the best local packet-body evidence: trigger actor, owner actor, event
type, event name, function name, then Lua params.

Native receive envelope from prior outputs:

- `tools/outputs/lpb/native_retainer_setup_submit_next_20260618/receive_opcode_dispatch_ranges.csv`
  maps a middle receive range `0x012E..0x013D` to `0x004DCFFF`.
- The instruction decode at `0x004DC696` reads `word ptr [esi+2]`, compares it
  to `0x013D`, then to `0x012E`, and jumps to `0x004DCFFF` for every opcode in
  that inclusive range. Therefore `0x0130` is covered by this broad lane.
- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/target_notes/target_004DCFFF_receive_dispatch_shared_object_vtable_handler.md`
  decodes `0x004DCFFF` as:

```text
call 0x004D9910           ; object lookup
if null -> default exit
load object vtable +0x24
push esi                  ; packet/context pointer
call vtable[0x24]
```

- The C decompile of `FUN_004d9910` at `ffxivgame.exe.c:36016` is an object
  lookup against the `this+0x17804`/`this+0x17808` container and returns
  `node+0x10` when found.

This is the best native packet-order statement recovered locally:

```text
0x0130 enters broad middle lane 0x012E..0x013D
  -> 0x004DCFFF shared object/vtable dispatch
  -> lookup object keyed by the packet/object id context
  -> call object vtable slot +0x24 with the packet pointer
```

That still does not identify the concrete object class behind the Toto-Rak
director, nor the Lua method resolver for `"relogin"`/`"eventNoticeCutScene"`.
It does explain why no dedicated `case 0x0130` or standalone
`RunEventFunction` native handler has surfaced.

Source/owner refinement:

- The native dispatch pointer in `esi` is best read as the game-message header,
  not the full subpacket header: the opcode is at `[esi+2]`, and the body starts
  at `esi+0x10`.
- The local `SubPacket` wrapper carries `sourceId` outside that game-message
  header. `RunEventFunctionPacket.BuildPacket(...)` returns
  `new SubPacket(0x0130, triggerActorID, data)`, and both local Toto-Rak helper
  paths use `triggerActorID = player.Id`.
- Therefore the first `0x004DCFFF -> 0x004D9910` lookup is almost certainly
  keyed by the surrounding packet/source actor, i.e. the player/trigger actor in
  the local packet shape. The director is not lost; it is the owner field inside
  the `0x0130` body.
- For local `0x0130 RunEventFunction`, body-relative offsets are:

```text
0x00 u32 triggerActorID   = player/source
+0x04 u32 ownerActorID    = director/event owner
+0x08 u8  eventType       = active current type, or explicit 0x05 fallback
+0x09 str eventName       = "noticeEvent"
+0x29 str functionName    = "relogin" / "eventNoticeCutScene"
+0x49     Lua params      = [player, finishTime, false] for relogin
```

  If `esi` is the game-message header, those same fields are at `esi+0x10`,
  `esi+0x14`, `esi+0x18`, `esi+0x19`, `esi+0x39`, and `esi+0x59`.

Object lifecycle around the shared receive lane:

- `0x00CA` creates/registers the object used by later shared dispatch:
  `0x004DCCBF -> 0x004D90C0 -> 0x00537620`, then calls the created object's
  vtable slot `+0x14`.
- `0x00CB` tears down or switches the current object state through
  `0x004DCCF6`/`0x004D9980`, and may call vtable slot `0`.
- `0x0130` does not create that object. It depends on the prior object/source
  lifecycle already being complete. If `0x004D9910` misses, `0x004DCFFF` exits
  before the object vtable call.
- If a local `0x0130` gets a client `EventUpdate` ACK, the source/player object
  probably existed and the receiver ran far enough to answer. That is still not
  proof that the named director Lua method ran.

Receiver readiness gate:

- The recovered receiver map names the event packet family as:

```text
0x012F KickEvent          -> LuaActorImpl slot 56, KickClientOrderEventReceiver
0x0130 RunEventFunction   -> LuaActorImpl slot 57, StartServerOrderEventFunctionReceiver
0x0131 EndEvent           -> LuaActorImpl slot 58, EndClientOrderEventReceiver
0x0136 SetEventStatus     -> LuaActorImpl slot 48, SetEventStatusReceiver
```

- 2026-06-23 installed-binary RTTI update: the retail-installed
  `ffxivgame.exe` reidentifies the receiver class family directly. MSVC RTTI
  names:

```text
LuaActorImpl
  TypeDescriptor 0x01270B10
  vtable         0x00FDFB2C

LuaActorImplInterface
  TypeDescriptor 0x01270A90
  vtable         0x00FDF98C

StartServerOrderEventFunctionReceiver
  TypeDescriptor 0x012D8AD8
  COL            0x011734BC
  vtable         0x010574C8
  entries        0x008A1BB0, 0x0089F430, 0x0089EB20, 0x0089E260, 0x0089E060

KickClientOrderEventReceiver
  TypeDescriptor 0x012D8A78
  vtable         0x010574B0

EndClientOrderEventReceiver
  TypeDescriptor 0x012D8408
  vtable         0x01057348
```

- The actual `LuaActorImpl` packet-receiver slots are now concrete in the
  installed binary. `LuaActorImpl` vtable `0x00FDFB2C` contains:

```text
slot 48 (+0xC0) SetEventStatus       -> 0x00759D20
slot 56 (+0xE0) KickEvent            -> 0x0076C0D0
slot 57 (+0xE4) RunEventFunction     -> 0x0076C220
slot 58 (+0xE8) EndEvent             -> 0x0076C3B0
```

- Static xrefs are narrow: `0x0076C220` has no direct `call`/`jmp` xrefs in the
  installed PE and only one absolute xref, `0x00FDFC10`, the
  `LuaActorImpl` vtable slot-57 entry. Neighbor slots confirm the table:
  `0x00FDFC0C -> 0x0076C0D0`, `0x00FDFC10 -> 0x0076C220`, and
  `0x00FDFC14 -> 0x0076C3B0`. No independent static `0x0130` dispatcher to
  `0x0076C220` was found, so the live proof target is the vtable-dispatched
  slot-57 entry itself.
- `LuaActorImpl` slot 57 (`0x0076C220`) is the direct `0x0130`
  RunEventFunction decoder. It reads the body as:

```text
+0x00 trigger/source actor key
+0x04 owner actor key
+0x08 eventType byte
+0x09 eventName string, copied with 0x40-byte limit
+0x29 functionName string, copied with 0x40-byte limit
+0x49 Lua param blob, copied as 0x40 bytes
```

  The wrapper stages `&trigger`, `&owner`, `&eventType`, `functionName`,
  `eventName`, `paramsBegin`, and fixed param size `0x40`, then constructs a
  `StartServerOrderEventFunctionReceiver` stack object through `0x0089EDB0`.
  This proves the native arg semantics for packet `0x0130`: the packet includes
  both actor keys, and native does not synthesize the player argument from thin
  air. The Lua param blob must still contain the Lua arguments the script method
  expects.
- `StartServerOrderEventFunctionReceiver` constructor `0x0089F360` lays out the
  decoded `0x0130` run-function envelope like this:

```text
+0x08 trigger/source actor key
+0x0C owner actor key
+0x10 functionName string copied from packet+0x29
+0x64 eventName string copied from packet+0x09
+0xB8 eventType byte
+0xBC param/vector object
+0xC0 param begin
+0xC4 param end
+0xC8 param capacity
+0xCC pending queue/drain state
```

  `0x0089F360` is the clone/copy constructor used by receiver vtable `+0x04`;
  the packet-facing stack constructor at `0x0089EDB0` writes the same receiver
  layout from the slot-57 decoded fields. The packet wire layout is still
  `eventName` at `+0x09` and `functionName` at `+0x29`; only the receiver's
  internal string fields put `functionName` first.
- Its main receiver body is `0x0089E260`. It resolves the trigger/source actor
  from `this+0x08`, checks that the Lua-param vector is non-empty, then calls
  `0x006E1140` with:

```text
trigger actor object in ecx
context/manager
functionName   = this+0x10
eventName      = this+0x64
ownerActorKey  = this+0x0C
eventType      = this+0xB8
params begin   = this+0xC0
params size    = this+0xC4 - this+0xC0
```

- `0x006E1140` is a thunk into the actor dispatcher:

```asm
mov [esp+4], ecx        ; replace first stack arg with trigger actor object
mov ecx, [ecx+0xF8]     ; actor event/script dispatcher
jmp 0x00896F70
```

- `0x00896F70` is the deeper run-function dispatch body. Confirmed gates:

```text
resolve owner actor from ownerActorKey against dispatcher container
require owner actor != nil
require owner actor +0x5C != 0
require dispatcher context [dispatcher+8] != nil
require [dispatcher+8].vtable+0x10() ready
look up eventName/functionName through 0x00790AA0
success path calls 0x006DE1E0 and 0x00CD0940
miss/not-ready path calls 0x00894090 with the param vector
```

  The success path is now concrete up to the native Lua-dispatch handoff:
  lookup hit goes to `0x00897152`, marks `[dispatcher+8]+0x20 = 1`, optionally
  calls `0x00892F60`, then calls `0x006DE1E0`, `0x00CD0940`, and `0x00CD0A00`
  in that order. `0x00CD0A00` is a bare `ret`, and `0x00CD0940` is only:

```text
0x00CD0940
  call 0x00CCDDA0
  call 0x00CD7A30
  call 0x00CCF9B0
  ret 0x10

0x00CCF9B0
  gate [this+0x0C]+0x1CC byte and receiver/node +0x7F
  call 0x00CCCD80
  if true: call 0x00CCEE30
  restore cursor/state
  ret 0x0C
```

  A direct-call scan found no success-body call from `0x00CC0000..0x00CEFFFF`
  to `0x004D6D30`, `0x0075E670`, or `0x00894090`. So success-path
  EventUpdate timing remains hook-only; the only source-proven `0x012E` send
  for this receiver is the fallback helper path below.

  The weak-ACK path is also concrete. Lookup miss goes to `0x0089707C` and then
  calls `0x00894090` at `0x008970ED`; owner/context-not-ready goes to
  `0x008971B4` and calls the same helper at `0x0089722B`. That helper calls
  `0x0075E670`, which builds and sends compact opcode `0x012E` through
  `0x004D6D30`. Therefore a real `0x012E/EventUpdate` can be emitted without
  the `0x006DE1E0 -> 0x00CD0940` Lua-method success path running.
- The receiver's queue/readiness helper is now concrete. `0x00CC72A0` reads the
  dispatch-ready byte:

```asm
mov eax, [esp+4]
mov ecx, [ecx]
push eax
call 0x00CD7A30
mov al, [eax+0x7D]
ret 4
```

  Nearby helpers set/read the same state family: `0x00CC72C0` resolves a node
  and calls `0x00CE1DD0`, `0x00CC72F0` sets `+0x7E`, `0x00CC7280` reads
  `+0x80`, and `0x00CC7330`/`0x00CC7350` set/read `+0x7F`.
- Queue drain `0x0089E8E0` walks the receiver's pending vector, resolves queued
  actor keys, checks `0x00CC72A0`, removes ready entries from the back, and
  stops/retains when an entry is unresolved or not ready. This makes
  "ACK/update but no `relogin` widget side effect" a realistic native failure
  mode, especially if the owner/script context is not fully ready when `0x0130`
  arrives.
- The slot-57 wrapper submits the constructed receiver through `0x007859B0`.
  That wrapper checks scheduler/receiver queue state, can attempt the receiver
  status path immediately, or clone/enqueue via the receiver vtable `+0x04`
  path. This is another reason an accepted packet is not automatically proof of
  the Lua method side effect.
- `FUN_0043b530` is concrete in the current C decompile
  (`Client Sourcecode Decomp/ffxivgame.exe.c:16280`): it only writes
  `param_1+0x7d = 1`. Nearby code calls it before `SetEvent(...)`, but that is
  still generic synchronization/state evidence, not actor-specific event-owner
  proof.
- The current C decompile also has a generic state object family where
  `FUN_00ce2bc0` initializes bytes `+0x7d/+0x7e` to `0`, and `FUN_00ce1dd0`
  writes `param_1+0x7d = param_3` and may trigger follow-up work if `+0x7e` was
  already set. This supports a native readiness-byte idiom, but this current-C
  family by itself does not tie directly to Toto-Rak `0x0130` or
  `LuaActorImpl` slot 57.
- The generated native-xref outputs preserve additional `0xCC72A0` call-target
  seeds whose bytes include a read of `[eax+0x7d]`, including unrelated
  `Application::Lua::Script::Client::Control::...s_ItemSearchWidgetResumeChecker`
  vtable slots `0x713E50`/`0x713E20`. Those tables are not Toto-Rak receiver
  proof; the stronger proof is the installed-binary RTTI/vtable/body decode
  above.
- Do not cite the large `+0x7d` cluster around `FUN_00908d50`/`FUN_00908d70` as
  event readiness evidence. That code is red-black-tree/iterator machinery.
- The `+0x5c` KickEvent-ready gate is recorded as being raised only after the
  `+0x7d` run-function readiness path is satisfied. So a successful-looking
  Kick/EventStart does not, by itself, prove the later `relogin` body can run.
  Given the recovered `0x0089E8E0` queue drain, receiver acceptance/queue state
  can happen before the Lua side effect, which is the best current native
  explanation for "packet ACKed, no slot-15 widget".

Current owner/source/order conclusion:

```text
bind/create player source object first
bind/create director/event owner and notice-event context
0x012F KickEvent noticeEvent, source/trigger=player, body owner=director, type=0x05
0x012D EventStart reply records active owner/name/type
0x0130 RunEventFunction, source/trigger=player, body owner=director,
  eventName="noticeEvent", eventType=current active type or explicit 0x05,
  functionName="relogin", Lua params=[player, finishTime, false]
widget proof boundary: commandAboutWidget(24228) / slot-15 widget traffic
```

The concrete map-resident object vtable behind `0x004DCFFF` slot `+0x24` is
still not decoded in the current local artifacts. The installed binary now
proves the `LuaActorImpl` slot-57 decoder and the downstream
`StartServerOrderEventFunctionReceiver` class/vtable/readiness behavior, but it
does not statically prove that the handle below the shared `0x004D8860 ->
0x00575040` slot-57 trampoline points at `LuaActorImpl`. The constructor path
can initialize that handle to wrapper vtable `0x00FE02AC`, whose slot 57 is
`0x0075AF00 ret 4`; the live path must prove a later handle swap to
`0x00FDFB2C+0xE4 == 0x0076C220`. The remaining identity is hidden behind the
`0x00CA -> 0x004D90C0 -> owner+0x4AC -> 0x00537620` factory/handle lifecycle.
That means the final 100% retail answer still requires either a working retail
trace or a fresh native decode/hook of the factory-created map object handle.

Decompiled C follow-up:

- A larger local native artifact exists at
  `Client Sourcecode Decomp/ffxivgame.exe.c`, with companion header
  `Client Sourcecode Decomp/ffxivgame.exe.h`.
- Around the constructor chain at `ffxivgame.exe.c:63564-63744`, the decompile
  writes vtable-ish pointers at member offsets that numerically match several
  event packet ids:

```text
FUN_00600f50 -> param_1 + 0x12d, writes UNK_00fad68c
FUN_00601300 -> param_1 + 0x12f, writes UNK_00fad6ec
FUN_00601700 -> param_1 + 0x131, writes UNK_00fad74c
FUN_00601a20 -> param_1 + 0x133, writes UNK_00fad7ac
FUN_00601df0 -> param_1 + 0x135, writes UNK_00fad80c
FUN_00602130 -> param_1 + 0x137, writes UNK_00fad86c
```

- This is not enough to call the chain a packet dispatch table. A later
  destructor-like path at `ffxivgame.exe.c:140009-140014` treats
  `param_1[0x12d]` as a member pointer and checks flag bits around
  `param_1 + 0x12e`.
- The useful negative fact is narrower: the decompiled native artifact has
  tempting numeric hits for `0x012D`, `0x012F`, `0x0131`, `0x0133`, `0x0135`,
  and `0x0137`, but this pass did not produce a comparable `0x0130`
  constructor/member/dispatch hit.
- Direct searches in the C decompile for `noticeEvent`, `relogin`,
  `RaidDungeonExecutionWidget`, `WidgetOpenCommand`, `/Widget/`, and a clean
  `0x0130` dispatch arm did not recover the run-function receive path.
- Existing native-retainer outputs place `0x017A` elsewhere: high receive
  handler `0x004DD147` skips a `0x10` packet header and delegates payload to
  `0x005763B0`.

Inference:

The constructor/member-offset chain is only a weak numeric lead, not a packet
map. The stronger statement is that the concrete object class and Lua resolver
behind `0x0130 RunEventFunction` were not recovered from either this C-decompile
pass or the previously mapped object/high receive table that contains `0x017A`.
The exact object-specific queue/retain/method-dispatch behavior therefore
remains the main native gap.

The `_setInstanceRaid` native bridge was recoverable enough to classify:

```text
0x72E5F0 registrar loads handler 0x6E3C10
0x72E6D9 registers string VA 0xFD6630 "_setInstanceRaid"
0x6E3C10 reads first Lua arg through helper 0x71BA00
0x6E3C10 writes byte ptr [ebx+0xBB] = byte ptr [arg]
```

That supports treating `_setInstanceRaid(true)` as a bool-ish script/area flag
setter. It is not a widget opener, content group sync, or hidden
`RaidDungeonExecutionWidget` prerequisite in the recovered Lua path.

## Director and player bind details

### Director bind

Source:

`Map Server/Actors/Director/Director.cs`

Director spawn packets:

1. `AddActor(0)`
2. Event conditions
3. Speed
4. Position with spawn type `0`
5. Name
6. State
7. Zoning
8. Script bind

Director init packets:

```text
SetActorPropetyPacket("/_init") with AddTarget()
```

Director constructor event conditions:

- `noticeEvent`, unknown1 `0xE`, unknown2 `0`
- `noticeRequest`, unknown1 `0`, unknown2 `1`
- `reqForChild`, unknown1 `0`, unknown2 `1`

### Player bind

Source:

`Map Server/Actors/Chara/Player/Player.cs`

When binding self:

- If `loginInitDirector != null`, player work includes the director pointer.
- Otherwise the standard player work bind is used.

Current local self-bind Lua param shape:

```text
without login director:
/Chara/Player/Player_work, true, false, false, true, 0, false, timers, true

with login director:
/Chara/Player/Player_work, false, false, true, loginInitDirector, true, 0, false, timers, true
```

The third bool is the local "is init director" flag in the source comment.  The
login-director path is only accepted when the director is already in the
player's `ownedDirectors` list.

Current Toto-Rak:

- Normal entry/rejoin/opening prep sets `loginInitDirector` before zone-in.
- The async widget opener clears `loginInitDirector` after send/timeout.

## Data anchors

DAT and local data rows:

- `docs/Dat Mining/xtx_raidDungeon.csv`: id `1` = The Thousand Maws of Toto-Rak.
- `docs/Dat Mining/xtx_placeName.csv`: id `2123` = The Thousand Maws of Toto-Rak.
- `docs/Dat Mining/_zoneParam.csv`: zone `159`, place `2123`.
- `docs/Dat Mining/zoneGroupParam.csv`: group row includes `2123`, zone `159`.
- `docs/Dat Mining/cutReplay.csv`: `rad0f300` through `rad0f308`.
- `Data/sql/server_zones.sql`: zone `159` local name `fst0Dungeon03`.

Toto-Rak cutReplay rows:

| Row | Key |
| ---: | --- |
| `11082101` | `rad0f300` |
| `11082102` | `rad0f301` |
| `11082103` | `rad0f302` |
| `11082104` | `rad0f303` |
| `11082105` | `rad0f304` |
| `11082106` | `rad0f305` |
| `11082107` | `rad0f306` |
| `11082108` | `rad0f307` |
| `11082109` | `rad0f308` |

All nine rows share cutReplay mode fields `1, 1` and placeholder flag values
`-200` across the trailing flag columns.

Replay metadata caveat:

- `xtx_cutReplay.csv` labels these only as generic `Cutscene 1` through
  `Cutscene 9`.
- The replay selection widget scans `questId * 100 + 1` through `+30` and keeps
  rows where `cutReplaySheet:_isExistKey(...)` succeeds.
- The replay player reads cutReplay columns `8..15` as actor override slots.
  Toto-Rak's rows are all `-200` in those slots, so no hidden replay SNPC
  override metadata was found here.
- Column `6 == 2` is the recovered switch for HQ/NQ replay behavior; Toto-Rak
  rows do not use that value.

Party matching/content crosswalk:

- Old raid dungeon content id `1` = Toto-Rak.
- Old raid dungeon content id `2` = Dzemael.
- Modern and later instance raid ids, such as Aurum Vale `6` and Cutter's Cry `7`, belong to the modern `InstanceRaidBaseClass` lane, not the old Toto-Rak occupancy wrapper.
- DAT zone group row `209` is the `2123, 159` Toto-Rak grouping. Do not
  conflate that DAT group id with unrelated SQL zone-table columns.

## Recovered guide/menu surface

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/populace/occupancyguide/raidfst0dungeon03guide.lua`

Class:

```lua
require("/Chara/Npc/Populace/OccupancyGuide/OccupancyGuideBaseClass")
_defineClass("RaidFst0Dungeon03Guide", "OccupancyGuideBaseClass")
```

Init:

```lua
self:_loadTextDataPermanently(6704, "raidFst0Dungeon03Guide")
```

Functions:

- `initAsOccupancyGuide`
- `askMainMenu`
- `tellErrorMessage`
- `debugSelectErrorCode`
- `resetClientNeckDirection`

Recovered `askMainMenu` shape:

```lua
function RaidFst0Dungeon03Guide.askMainMenu(
  self, talkTurnActor, suppressIntro, levelArg, unknownA,
  minPartyArg, unknownB, timeoutArg, raidId)
  local choice = 1
  if talkTurnActor ~= nil then
    self:startCliantTalkTurn(2, talkTurnActor)
  end
  if not suppressIntro then
    self:say(self, 1, 0)
  end

  choice = self:askExtendWidget(self, 2, 4, 1, choice, raidId, raidId, raidId)
  ...
  return choice
end
```

Menu branch highlights:

- Choice `1` says rows `7`, `8`, and `9`.
- Choice `2` says row `10`, then worldMaster rows `11`, `41`, `13`, `15`, and `40`, with local rows `12` and `14` between them.
- Choice `3` says row `16`, then asks final confirmation with
  `askExtendWidget(self, 17, 2, 1, 1, raidId)`.
- Choice `4` / cancel paths are decompiler-damaged, but no content-start call
  is visible in the recovered guide body.

Menu row meanings from `raidFst0Dungeon03Guide.csv`:

| Row | Meaning |
| ---: | --- |
| `1` | Intro: Toto-Rak under Wood Wailer control. |
| `2` | "State your purpose." |
| `3` | Inquire about the raid dungeon. |
| `4` | Inquire about entry requirements. |
| `5` | Enter the raid dungeon. |
| `6` | Leave. |
| `7`-`9` | Toto-Rak lore and current investigation text. |
| `10`-`15`, `40`, `41` | Entry rules, time limit, re-entry lockout, loot-list exit handling, quest requirement. |
| `16`-`19` | Final preparation / enter yes-no prompt. |

This matters because the recovered Toto-Rak guide uses `askExtendWidget`, not `askEnterInstanceRaid`. The local server helper currently can call `askEnterInstanceRaid(raidId)`, but that prompt belongs to `InstanceRaidGuideBaseClass`.

Recovered `tellErrorMessage` row routing includes:

- Error `12` -> row `20`.
- Error `2` -> row `21`.
- Error `18` -> rows `22`, `24`, and worldMaster row `23`.
- Error `19` -> row `25` and worldMaster row `26`.
- Errors `20` or `10` -> row `32` and worldMaster row `33`.
- Errors `21` or `11` -> row `34` and worldMaster row `35`.
- Error `13` -> row `27`.
- Error `14` -> row `28`.
- Error `4` -> row `29`.
- Error `3` -> row `30`.
- Errors `8`, `6`, `7`, and `9` -> rows `36`, `37`, `38`, and `39`.

`debugSelectErrorCode` exposes a broader probe list:

```text
1, 16, 17, 12, 2, 18, 19, 13, 14, 4, 3, 5, 10, 11, 8, 6, 7, 9, 20, 21
```

Exact debug selector mapping:

| Selector | Error code |
| ---: | ---: |
| `1` | `1` |
| `2` | `16` |
| `3` | `17` |
| `4` | `12` |
| `5` | `2` |
| `6` | `18` |
| `7` | `19` |
| `8` | `13` |
| `9` | `14` |
| `10` | `4` |
| `11` | `3` |
| `12` | `5` |
| `13` | `10` |
| `14` | `11` |
| `15` | `8` |
| `16` | `6` |
| `17` | `7` |
| `18` | `9` |
| `19` | `20` |
| `20` | `21` |

Recovered `tellErrorMessage` does not visibly route `1`, `16`, `17`, or `5`; DAT row `31` exists, but no recovered callsite was found for it in this body.

Error row meaning crosswalk:

| Error code | Row(s) | Meaning |
| ---: | --- | --- |
| `12` | `20` | Too many parties already inside. |
| `2` | `21` | Too many parties petitioning for entry. |
| `18` | `22`, `23`, `24` | Player lacks Imperial Devices quest/progress proof. |
| `19` | `25`, `26` | Party member lacks Imperial Devices quest/progress proof. |
| `13` | `27` | Player still has re-entry lockout. |
| `14` | `28` | Party member still has re-entry lockout. |
| `4` | `29` | Party too small / outside size requirement. |
| `3` | `30` | Party too large. |
| `20`, `10` | `32`, `33` | Player level/class gate failure. |
| `21`, `11` | `34`, `35` | Party-member level/class gate failure. |
| `8` | `36` | Party member not assembled at entrance. |
| `6` | `37` | Player has another pending duty/task. |
| `7` | `38` | Party member has another pending duty/task. |
| `9` | `39` | Party member not in a fit state. |

Current local bridge status:

- Local server constants mirror the guide rows: raid id `1`, party size `2..4`,
  duration `60` minutes, and minimum level `25`.
- `WorldManager.GetTotorakInstanceEntrants` denies with direct `SendTotorakMessage` chat strings.
- No local server mapping was found from the C# denial cases into `RaidFst0Dungeon03Guide.tellErrorMessage` numeric ids.
- Local validation covers public entrance zone, party/leader, party size, online/same-area members, level, and re-entry timer.
- Local validation does not enforce the recovered guide's quest-completion/progress rows.
- `Data/scripts/totorak_entry.lua` currently has
  `TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false` and
  `TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED = true`, so the local NPC route is
  intentionally test-friendly unless those toggles are flipped.

This is the entrance/menu/error text surface, not the in-duty director. It does not own `eventNoticeCutScene`, `relogin`, or `openRaidDungeonExecutionWidget`.

## Entry prompt and guide base surface

Newly recovered guide-base evidence keeps the entrance prompt separate from the in-duty occupancy director.

`OccupancyGuideBaseClass`:

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/populace/occupancyguide/occupancyguidebaseclass.lua`

```lua
function OccupancyGuideBaseClass.initForEvent(self)
  self:initAsOccupancyGuide()
end
```

This base has no `start`, `onZoneIn`, `onLogin`, `delegateEvent`, widget, or cutscene logic. It only forwards initialization into the concrete guide.

`InstanceRaidGuideBaseClass.askEnterInstanceRaid`:

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua`

Recovered effective call:

```lua
local answers = {52046, 52047}
return desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true, 52045, answers, raidId) == 1
```

Concrete Toto-Rak call from local entry helper:

```lua
callClientFunction(player, "askEnterInstanceRaid", raidId)
```

Argument meaning:

- `52045`: entry prompt text row, parameterized by `raidId`.
- `52046`: yes answer row.
- `52047`: no answer row.
- `raidId`: old raid dungeon content id; Toto-Rak is `1`.

The recovered `desktopWidget:askForEventMode` connector body in `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua` is partially mangled by the decompiler, so the best evidence for the exact prompt call is the recovered caller above plus the cleaner `AskWidget.ask` path. `AskWidget.ask` takes a text owner/text id, default answer, paging/cancel flags, a title/message row, an answer-row array, then trailing text parameters.

Guide text/error DAT anchors:

Source:

`docs/Dat Mining/raidFst0Dungeon03Guide.csv`

Useful rows:

- Row `11`: entry requirement is a party of `2` to `4` Disciples of War or Magic at minimum level `$E8(4)`.
- Row `13`: duty time limit row, parameterized by `$E8(2)`.
- Rows `14` and `15`: re-entry wait / timer-tab explanation.
- Rows `16` and `17`: final "Enter?" guide prompt.
- Rows `20` and `21`: too many parties inside / too many parties petitioning.
- Rows `23`, `26`, and `41`: quest-completion or quest-progress requirements.
- Rows `27` and `28`: personal or party-member re-entry lockout.
- Rows `29`, `30`, and `31`: party-size and qualification failures.
- Rows `33`, `34`, and `35`: level-gate failures.
- Row `40`: loot-list transfer/loss warning for exiting.

These rows are DAT evidence for retail guide messaging. They are not by themselves proof that every gate is implemented in the current local server path.

## Recovered dungeon object surfaces

These are object/prompt surfaces, not the Toto-Rak director lifecycle base.

### `RaidDungeonWarp`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/raiddungeonwarp.lua`

Functions:

- `initForEvent`: loads text `6781`, `"raidDungeonWarp"`.
- `activateWarpDevice`: runs scheduler `67493888`.
- `askYesNo`: if enabled, uses `askExtendWidget(self, 2, 2, 1, 2)`; otherwise `worldMaster:say(self, 1)`.

DAT rows:

| Row | Meaning |
| ---: | --- |
| `1` | Transporter not functioning. |
| `2` | Activate magitek transporter? |
| `3` | Yes. |
| `4` | No. |

Local bridge:

Source:

`Data/scripts/base/chara/npc/object/RaidDungeonWarp.lua`

- Calls `WorldManager:CanUseRaidDungeonWarp(player, npc)`.
- If enabled, first calls client `activateWarpDevice()`.
- Calls client `askYesNo(enabled)`.
- On choice `1`, calls `WorldManager:UseRaidDungeonWarp(player, npc)`.

Current `WorldManager` behavior:

- `CanUseRaidDungeonWarp` returns true when the current private content area has
  a stored return point for the player.
- It also returns true for any private zone-`159` Toto-Rak area, even without a
  return point, to allow the local fallback.
- `UseRaidDungeonWarp` closes the legacy duty widget and zones to the stored
  return point when present.
- If the return point is missing in private Toto-Rak, it logs a warning and
  falls back to public Toto-Rak entrance zone `154` at
  `(835.642, -12.682, 643.485)`, rotation `2.502`.

Binding status:

- Local helper can fall back to Toto-Rak public entrance.
- That fallback movement is not proof of retail transporter binding.
- Actor classes `1200373..1200375` remain visual/model leads, not proven live transporter bindings.
- The fallback can hide bad return-point capture in tests; live validation
  should prove a real return point before treating a transporter as retail-like.
- Current local SQL proves doors/barriers/photocells in Toto-Rak, but does not
  prove live production placement for `RaidDungeonWarp`, `RaidDungeonExit`, or
  `InstanceRaidExit`.

### `RaidDungeonExit`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/raiddungeonexit.lua`

Functions:

- `initForEvent`: loads text `6736`, `"raidDungeonExit"`.
- `eventTalkStep0`: empty.
- `askYesNo(promptType, placeNameId, retryArgA, retryArgB)`: prompt row `7` branch for type `3`; otherwise row `1` and possibly row `4`.
- `debugAskYesNo`.

Recovered prompt flow:

- Type `3`: `askExtendWidget(self, 7, 2, 1, 2, placeNameId)`.
- Default path: `askExtendWidget(self, 1, 2, 1, 2, placeNameId)`.
- If the default path returns yes (`1`), it asks the confirmation prompt
  `askExtendWidget(self, 4, 2, 1, 2, retryArgA, retryArgB, placeNameId)`.

DAT rows:

| Row | Meaning |
| ---: | --- |
| `1` | Exit `[placeName]`? |
| `2` | Immediately. |
| `3` | Not yet. |
| `4` | Re-entry wait confirmation. |
| `5` | Absolutely. |
| `6` | On second thought... |
| `7` | Exit `[placeName]`? type-3 branch |
| `8` | Immediately. |
| `9` | Not yet. |

Local exit bridge:

Source:

`Data/scripts/base/chara/npc/object/RaidDungeonExit.lua`

The local script parses optional prompt arguments from an `RDEX|...` unique id, calls:

```lua
callClientFunction(player, "askYesNo", prompt, place, retryA, retryB)
```

On acceptance it prefers `WorldManager:ExitCurrentContentToReturnPoint(player, "raid-dungeon-exit")`. If no content return point exists but the object is in an exit-enabled static private area, it sends worldMaster row `34110` and calls `WarpToPublicArea`.

Current `WorldManager:ExitCurrentContentToReturnPoint` only succeeds when the
player is in `PrivateAreaContent` and that content area has a stored
`ContentAreaReturnPoint` for the player. On success, it closes the legacy
Toto-Rak widget and calls `DoZoneChange` to the stored zone/name/type/spawn and
coordinates.

### `InstanceRaidExit`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/instanceraidexit.lua`

Recovered prompt:

```lua
local answers = {52043, 52044}
return desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true, 52042, answers, raidDungeonId) == 1
```

Rows:

- `52042`: "End your duty in [raidDungeon]?"
- `52043`: "Yes."
- `52044`: "No."

Adjacent exit/failure rows:

- `52054`: party-defeated exit messaging.
- `52061`: loot-list transfer/discard on leaving.
- `52093`: objective-failed exit messaging.

Local bridge:

`Data/scripts/base/chara/npc/object/InstanceRaidExit.lua`

- Requires `WorldManager:CanExitCurrentContentToReturnPoint(player)`.
- Resolves `raidDungeonId` via `GetCurrentContentRaidDungeonId(player)`.
- Calls client `askExit(raidDungeonId)`.
- On acceptance, calls `ExitCurrentContentToReturnPoint(player, "instance-raid-exit")`.

Current caveat:

- `GetCurrentContentRaidDungeonId` only resolves the current content as Toto-Rak when the player is inside a tracked private Toto-Rak instance.
- No production SQL binding was found for `InstanceRaidExit` in the current local Toto-Rak runtime.
- This is a modern instance-raid exit prompt shape; do not mix it with the old
  `RaidDungeonExit.askYesNo` row-`6736` prompt without owner evidence.

### `PrivateAreaPastExit`

Source:

`Data/scripts/base/chara/npc/object/PrivateAreaPastExit.lua`

This is a static private-area boundary helper, not a Toto-Rak-specific duty exit. It exposes push ranges named `"exit"` and `"caution"`:

- `"caution"` sends worldMaster row `34109`.
- `"exit"` sends row `34110` and calls `WarpToPublicArea` if the private area allows exit.
- If the area does not allow exit, the script leaves the player inside; the warp-back call is commented out locally.

### `RaidDungeonHeadCount`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/raiddungeonheadcount.lua`

Only an empty `initForEvent` was recovered.

### `RaidDungeonTreasureBox`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/raiddungeontreasurebox.lua`

Recovered methods include:

- `processOpenDzemaelEpicQuestType`
- `getDropItem`
- `getDropItemDirect`
- `getDropData`
- `getDropTable`
- `getDropTableIndevidual`
- `getDropTableSelectOne`
- `addDropItemLocal`
- `getDropTableData2`
- `addDropItemForPlayer`
- `canAddItemLocal`
- `initForEvent`
- `eventTalkStep0`
- `isMapMarkerVisibleForTalkable`

Dzemael-specific gate:

- Quest `110868`
- Item `10011244`
- No-reward system message `60027`
- Open scheduler `67932160`

Recovered resolver details:

- `processOpenDzemaelEpicQuestType(player)` checks offering quest `110868`.
- It calls quest method `isDropDzemael(player)`.
- It blocks the grant if the player already has item `10011244`.
- If eligible, it resolves `getDropItem()` from `work.dropID`.
- If nothing is granted, it prints system message `60027`.
- It always runs scheduler `67932160` at the end of the open path.

Drop algorithm shape:

- `getDropItemDirect(dropID)` reads `dropSheet` columns `0`, `1`, and `7`.
- `dropSheet` column `7` points to a `dropTableSheet` id.
- `dropTableSheet` type `0` means individual rolls over slots `1..8`.
- `dropTableSheet` type `1` means select-one roll over slots `1..8`.
- Per-slot data is stored in six-column slot groups.
- `dropQualitySheet` is consulted for simple quality values.
- `addDropItemForPlayer(player, drops, package, warnFull)` grants with
  `player:addItem(package, itemId, quality, quantity)`.
- `canAddItemLocal` creates a temporary item, applies simple quality when
  present, checks `_canAddItem`, and prints system message `25262` on full
  inventory when `warnFull == true`.

Important caveats:

- This is a recovered Dzemael/relic chest resolver, not a proven Toto-Rak clear
  reward path.
- No preserved `dropSheet`, `dropTableSheet`, or `dropQualitySheet` table rows
  were found in the current workspace pass.
- Current local Toto-Rak does not bind this chest resolver into Shaula death or
  duty completion.

Toto-Rak loot-list evidence:

- The hard Toto-Rak loot text anchor is exit/list handling, not a chest table.
- `raidFst0Dungeon03Guide` row `40` describes loot-list transfer/loss on exit.
- `worldMaster` row `52061` carries the corresponding exit-time loot-list
  transfer/discard warning.
- No Toto-Rak-specific `dropSheet` / `dropTableSheet` rows or clear-time chest
  resolver surfaced in this pass.

Recovered loot-list/UI caveats:

- No recovered `LootListWidget` class was found.
- The persistent loot list is recovered as `ItemListWidget` mode `3` plus
  `ItemShareWidget` for pass/discard.
- The recovered persistent loot-list UI is `ItemListWidget` mode `3`, not
  `TreasureListWidget`.
- Recovered loot UI actions operate on client package `5`; local Lua/C# define
  `INVENTORY_LOOT` / `ItemPackage.LOOT` as package `4` and
  `MELDREQUEST` as package `5`.
- `Character.ResolveClientItemPackage` does not currently alias client package
  `5` to local `ItemPackage.LOOT`.
- Local `ItemMovePackageCommand` ignores the client-provided target/proper
  package and moves claims to package `0` normal inventory.
- Local `ItemTransferCommand` passes loot into the receiver's normal inventory,
  while recovered UI help says the receiver should receive it into their own
  loot list.
- Local `ItemWasteCommand` removes the item without emitting recovered
  discard/loss row `52088`.
- The only recovered `52087` ask caller found in this pass was Hamlet-related
  (`PopulaceHamletCaptain`), not Toto-Rak.
- Local `ProcessLootAutoClaim` is timer-based and uses local backend package
  state; it is not explicit duty-exit row `52061` transfer/discard parity.
- Therefore Toto-Rak exit handling should not blindly use current local loot
  package ids; package translation and claim/pass/drop semantics need capture
  or an explicit bridge before implementing row `52061` parity.

Recovered persistent loot UI details:

- `DesktopWidget.openDropItemWidget()` opens
  `openMainMenuRootWidget("ItemListWidget", nil, true, 3)`.
- `DesktopWidget.isExistDropItemCommand()` returns true when
  `getItemPackageCount(5) > 0`.
- `ItemListWidget.setInitialData(..., mode)` selects tab index `4`, sets
  `work.listbox = 5`, and sets title row `3213` when `mode == 3`; the normal
  title row is `3207`.
- `ItemListWidget.getPackageFromList(5)` returns package `5`.
- `ItemListWidget.makeDropItemList()` asks
  `worldMaster:_getMyPlayer():_getItemPackageCapacity(5)`.
- It populates rows with `setItemToXmlLight(5, ..., 5, slot)`.
- The drop-list count/status update uses text row `3231`.
- `ItemListWidget.updatePlayerItem(package, slot)` refreshes the drop list when
  `package == 5`.
- `operateGetDrop()` reads `_getItem(5, chosenItem)`, counts the stack, asks the
  item for `getItemProperPackage()`, then calls
  `desktopWidget:executePlayerItemMovePackage(5, chosenItem, properPackage, count)`.
- Successful direct claim sets `work.lastsub = 6`; the submenu focus then lands
  on `Button_DropItemGetAll`.
- `operateShareDrop()` only opens `ItemShareWidget` when `work.chosenPackage == 5`;
  successful open sets `work.editWidgetOpen = 3` and `work.lastsub = 7`.
- `getShareItem()` returns `0` when `editWidgetOpen == 4`, returns
  `chosenItem` only when `chosenPackage == 5`, and otherwise returns `-1`.
- The submenu contains `Button_DropItemGetAll`, `Button_DropItemGiveAll`,
  `Button_Trash`, `Button_Sort`, and `Button_Cancel` alongside normal
  inventory/bazaar/materia buttons.
- `ItemSubWidget` dispatches those three loot buttons to parent
  `operateGetDrop()`, `operateShareDrop()`, and `operateTrash()`.

Recovered connector command ids:

- `executePlayerItemMovePackage(package, slot, targetPackage, count)` resolves
  the item, then calls `executePlayerCommandLocal(24223, item, targetPackage,
  package, nil, nil, count)`.
- `executePlayerItemTransfer(package, slot, partyIndexOrZero, targetPackage)`
  resolves the item and target actor, then calls
  `executePlayerCommandLocal(24225, item, targetPackage, package, nil, targetActor)`.
- `executePlayerItemWaste(package, slot)` resolves the item, then calls
  `executePlayerCommandLocal(24226, item, package)`.

Recovered `ItemShareWidget` details:

- `getFormName()` returns `"PartyManagerWidget"`.
- `init()` sets title row `3236`, margin `"40%,15%,0,0"`, `Button_Leave` text
  row `3240`, `Button_Breakup` text row `3252`, and initially hides
  `Button_Breakup`.
- It displays up to eight party-member rows from template `PartyMember`.
- Help rows are `75391` for `ListBox_PartyList` and `75393` for
  `TextBlock_Number`.
- Member count display uses `TextBlock_Number` and the count format row `228`.
- Widget close/cancel calls parent `setItemShare(12)` and closes the share UI.
- Selecting self from `Button_List` claims the item through
  `executePlayerItemMovePackage(5, slot, properPackage, count)` and sets parent
  share result `11`.
- Selecting another party member calls `executePlayerItemTransfer(5, slot,
  targetActor, 5)` and sets parent share result `13`.
- `Button_Breakup` discards with `executePlayerItemWaste(5, slot)` and sets
  parent share result `11`.
- `Button_Leave` is another self-claim path using
  `executePlayerItemMovePackage(5, slot, properPackage, count)`.

Local command-script mismatch details:

- `ItemMovePackageCommand.onEventStarted(player, actor, eventType, eventName,
  itemReference, targetPackage, sourcePackage, arg1, arg2, unknown, arg3, arg4,
  arg5, type9ItemIds)` ignores the recovered target/proper package and moves
  from `itemReference.itemPackage` to backend package `0`.
- `ItemTransferCommand.onEventStarted(...)` resolves the passed target player
  but moves into the receiver's `INVENTORY_NORMAL`, not their recovered loot
  package.
- `ItemWasteCommand.onEventStarted(...)` deletes from
  `itemReference.itemPackage` and ends the event without recovered row `52088`.
- A safe bridge should be scoped to loot UI refresh/send/update and
  claim/pass/drop commands: client loot package `5` should map to backend
  `ItemPackage.LOOT = 4` there, but not as a global alias because local
  `MELDREQUEST = 5` is also real.

Recovered `TreasureListWidget` role:

- It is an event-mode one-tab virtual item picker based on `ItemListWidget`.
- It returns the selected item as a 1-based row index, or `-1` on close/cancel.
- It creates virtual item rows with `_createVirtualItem(itemId, count, 1)`.
- No local Toto-Rak caller was found for it in this pass.

### `InstanceRaidTreasureBox`

Source:

`tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/treasurebox/instanceraidtreasurebox.lua`

Recovered body:

```lua
require("/Chara/Npc/Object/TreasureBox/TreasureBoxBaseClass")
_defineClass("InstanceRaidTreasureBox", "TreasureBoxBaseClass")
```

No additional instance-raid treasure methods were recovered in this class.  The
old `RaidDungeonTreasureBox` above is the only recovered raid chest class here
with substantial item/drop logic.

### Toto-Rak local object scripts

Local concrete Toto-Rak mechanics exist for:

- `Data/scripts/base/chara/npc/object/RaidDungeonLight.lua`
- `Data/scripts/base/chara/npc/object/RaidDungeonBarrier.lua`
- `Data/scripts/base/chara/npc/object/RaidDungeonPoster.lua`

These are stateful photocell/barrier/poster scripts and must stay separate from generic terminal routing.

### Recovered object prompt contracts

Recovered `RaidDungeonLight`:

```lua
function RaidDungeonLight.initForEvent(self)
  self:_setGroundOn(false)
  self:_loadTextDataPermanently(6813, "raidDungeonLight")
end

function RaidDungeonLight.isMapMarkerVisibleForTalkable(self)
  return false
end

function RaidDungeonLight.askYesNo(self)
  return self:askExtendWidget(self, 1, 2, 1, 1)
end
```

Recovered `RaidDungeonBarrier`:

```lua
function RaidDungeonBarrier.initForEvent(self)
  self:_setGroundOn(false)
  self:_loadTextDataPermanently(6829, "raidDungeonBarrier")
end

function RaidDungeonBarrier.eventTalkRead(self, arg)
  worldMaster:say(self, 5)
end

function RaidDungeonBarrier.askYesNo(self)
  return self:askExtendWidget(self, 2, 2, 1, 1)
end
```

Recovered `RaidDungeonPoster`:

```lua
function RaidDungeonPoster.initForEvent(self)
  self:_setGroundOn(false)
  self:_loadTextDataPermanently(6753, "raidDungeonPoster")
end
```

`RaidDungeonPoster.eventTalkRead(self, index)` maps indices `1..7` to
`self:say(self, 1..7)` and maps `8`, `9`, `10` to `worldMaster:say(self, 14)`,
`worldMaster:say(self, 15)`, and `worldMaster:say(self, 16)`.

Recovered object DAT text banks:

| Bank | Rows | Meaning |
| --- | --- | --- |
| `raidDungeonWarp` / `6781` | `1` | Transporter not functioning. |
| `raidDungeonWarp` / `6781` | `2`-`4` | Activate transporter prompt, yes, no. |
| `raidDungeonLight` / `6813` | `1`-`3` | Place photocell in pack prompt, yes, no. |
| `raidDungeonBarrier` / `6829` | `2`-`4` | Insert photocells prompt, yes, no. |
| `raidDungeonBarrier` / `6829` | `5` | Terminal deactivated text. |
| `raidDungeonPoster` / `6753` | `1`-`7` | Rydel / Toto-Rak Expedition Notes. |
| `raidDungeonPoster` / `6753` | `14`-`16` | Magitek device / energy discharge text. |

Relevant world-message rows for the local object bridge:

| Row | Meaning |
| ---: | --- |
| `52023` | Obtain a magitek photocell. |
| `52024` | Current photocell count. |
| `52025` | Place photocells into the terminal. |
| `52026`-`52030` | Terminal activated wind/chamber flavor rows. |
| `52031` | Terminal power level percent. |
| `52069` | Magitek terminal is now activated. |

Current local `RaidDungeonLight` / `RaidDungeonBarrier` only emit `52023`,
`52024`, and `52025`; the additional recovered/DAT terminal activation rows are
not wired into the current local barrier flow.

Current local object runtime:

`RaidDungeonLight.lua`:

- Calls client `askYesNo()`.
- On choice `1`, calls `player:CollectTotorakPhotocell(npc:GetUniqueId())`.
- Emits worldMaster rows `52023` and `52024`, passing the current count to
  `52024`.
- Despawns the photocell NPC and ends the event.

`RaidDungeonBarrier.lua`:

- Uses `PHOTOCELLS_REQUIRED = 4`.
- If `player:IsTotorakBarrierOpen(uniqueId)` is already true, it plays map-object
  animation `"hide"` and ends the event.
- If the player has fewer than four photocells, it emits row `52024`, then calls
  client `eventTalkRead()` to show the recovered row-`5` deactivated-terminal
  text.
- On `askYesNo()` choice `1`, `SpendTotorakPhotocells(4)` succeeds, then it
  marks the barrier open, emits rows `52025` and `52024`, and plays `"hide"`.

`RaidDungeonPoster.lua`:

- Parses the trailing numeric suffix from `npc:GetUniqueId()`.
- Clamps the index to `1..10`, defaulting to `1`.
- Calls client `eventTalkRead(index)`, then ends the event.

Local player-side Toto-Rak object state:

- `CollectTotorakPhotocell` applies to party members in the same current area
  when a party is present, otherwise self only.
- Each player tracks collected photocell unique ids; collecting the same id twice
  does not increment that player's count.
- `SpendTotorakPhotocells` checks the caller's count, then subtracts from same-area
  party members.
- `SetTotorakBarrierOpen` mirrors the opened barrier id to same-area party
  members.
- `ClearTotorakDungeonState` clears photocell count, collected ids, opened
  barrier ids, and Toto-Rak battle music state.
- `WorldManager.ResetTotorakDungeonStateOnEntry` calls that clear when a player
  enters zone `159`, so photocell/barrier objective persistence across reconnect
  or instance recovery is not retail-proven in this local path.

### Current local Toto-Rak object bindings

Proven SQL bindings:

- Actor class `1200226` -> `/Chara/Npc/Object/RaidDungeonLight`.
- Actor class `1200228` -> `/Chara/Npc/Object/RaidDungeonBarrier`.
- Actor class `1200227` -> `/Chara/Npc/Object/RaidDungeonPoster`, but no direct production spawn row was found in the current SQL.

Actor-class binding detail:

- `1200200..1200208` are additional `RaidDungeonBarrier` variants, but current
  zone `159` rows use `1200228`.
- `1200226`, `1200227`, and `1200228` expose `talkDefault` and `noticeEvent`
  event-condition rows in actor-class data.
- DAT `actorclass.csv` leaves display id `0` for `1200226`, `1200227`, and
  `1200228`, so same-number `xtx_displayName` rows are not usable object-name
  evidence for these devices.
- Device appearances are concrete: `1200226` uses model `20974` variant `1024`,
  `1200227` uses model `10999` variant `1024`, and `1200228` uses model
  `20936` variant `4096`.
- `1200373`, `1200374`, and `1200375` remain unresolved magitek-device leads:
  they share model `20988` variants `1024`, `2048`, and `3072`, but the local
  actor-class rows are placeholder `~~~magitek???~~~` names and no live
  `/Chara/Npc/Object/RaidDungeonWarp` binding was found for them.
- `1290001..1290004` are `PrivateAreaPastExit` boundary classes, with exit and
  caution push ranges of `30/20`, `40/30`, `50/40`, and `60/50`.

Spawn evidence:

- `1200226` has zone `159` `fstdun3_photocell_*` spawns in `Data/sql/server_eventnpc_spawn_locations.sql`.
- `1200228` has zone `159` `fstdun3_barrier_*` spawns in `Data/sql/server_eventnpc_spawn_locations.sql`.
- Barrier rows also have map-object backing in `Data/sql/server_eventnpc_mapobj.sql`.
- Photocell rows `3017..3032` do not have corresponding map-object backing in
  the current `server_eventnpc_mapobj.sql` pass.
- The spawn loader left-joins `server_eventnpc_mapobj` by spawn id and carries
  layout/instance into `SpawnLocation`; NPCs with both values become static
  map-object actors. This is why current barrier rows can play map-object
  animation `"hide"`, while photocell rows behave as normal ENPCs.

Exact current photocell rows:

```text
3017 1200226 fstdun3_photocell_first_1   zone 159 pos 1013.376, -39.033, 655.838
3018 1200226 fstdun3_photocell_first_2   zone 159 pos 1028.583, -39.000, 715.237
3019 1200226 fstdun3_photocell_first_3   zone 159 pos 1015.525, -42.716, 868.086
3020 1200226 fstdun3_photocell_first_4   zone 159 pos 1141.456, -44.933, 755.754
3021 1200226 fstdun3_photocell_shaula_1  zone 159 pos 1204.460, -50.443, 619.273
3022 1200226 fstdun3_photocell_shaula_2  zone 159 pos 1241.639, -48.765, 648.973
3023 1200226 fstdun3_photocell_shaula_3  zone 159 pos 1222.746, -51.057, 622.052
3024 1200226 fstdun3_photocell_shaula_4  zone 159 pos 1278.979, -58.029, 620.939
3025 1200226 fstdun3_photocell_sargas_1  zone 159 pos 1265.250, -54.001, 691.356
3026 1200226 fstdun3_photocell_sargas_2  zone 159 pos 1317.279, -53.382, 708.558
3027 1200226 fstdun3_photocell_sargas_3  zone 159 pos 1383.185, -55.106, 713.024
3028 1200226 fstdun3_photocell_sargas_4  zone 159 pos 1327.079, -55.032, 745.965
3029 1200226 fstdun3_photocell_antares_1 zone 159 pos 1172.341, -41.997, 827.584
3030 1200226 fstdun3_photocell_antares_2 zone 159 pos 1274.352, -54.526, 792.363
3031 1200226 fstdun3_photocell_antares_3 zone 159 pos 1225.664, -52.712, 748.282
3032 1200226 fstdun3_photocell_antares_4 zone 159 pos 1204.630, -45.315, 900.182
```

Exact current barrier rows:

```text
919 1200228 fstdun3_barrier_tornsrest       zone 159 pos 1119.88, -44.125, 880.115 mapobj 3580
920 1200228 fstdun3_barrier_foolsrest_east  zone 159 pos 1150.34, -47.975, 687.889 mapobj 3583
921 1200228 fstdun3_barrier_foolsrest_west  zone 159 pos 1120.43, -48.125, 688.064 mapobj 3585
922 1200228 fstdun3_barrier_seraucheforne   zone 159 pos 1223.84, -52.000, 816.426 mapobj 3587
923 1200228 fstdun3_barrier_bergand_north   zone 159 pos 1262.39, -55.991, 743.272 mapobj 3589
924 1200228 fstdun3_barrier_bergand_east    zone 159 pos 1279.77, -56.076, 751.932 mapobj 3591
925 1200228 fstdun3_barrier_joukil          zone 159 pos 1232.05, -52.125, 672.751 mapobj 3593
```

Door object rows are also present in the same zone: `fstdun3_door_3460` through `fstdun3_door_3493` are actor class `5900001` rows backed by map-object group `313`, but these are door/map-object inventory rather than the photocell/barrier state machine.

Local `RaidDungeonLight` behavior:

```lua
local choice = callClientFunction(player, "askYesNo")
if choice == 1 then
  local count = player:CollectTotorakPhotocell(npc:GetUniqueId())
  player:SendGameMessage(GetWorldMaster(), 52023, MESSAGE_TYPE_SYSTEM)
  player:SendGameMessage(GetWorldMaster(), 52024, MESSAGE_TYPE_SYSTEM, count)
  npc:Despawn()
end
```

`Player.CollectTotorakPhotocell` shares collection with party members in the same area. Collection is keyed by the NPC unique id, so repeated collection of the same photocell id does not increment the count again.

Local `RaidDungeonBarrier` behavior:

- Requires `4` photocells.
- If already open, plays map-object animation `"hide"` and exits.
- If under count, sends row `52024` with the current count, then calls `eventTalkRead`.
- On yes, spends `4`, marks the barrier id open, sends `52025` and `52024`, then plays `"hide"`.

`Player.SpendTotorakPhotocells` and `Player.SetTotorakBarrierOpen` propagate to party members in the same area. This makes photocell spend and opened-barrier state party-scoped for colocated members, while still stored per `Player` object.

Local `RaidDungeonPoster` behavior:

```lua
callClientFunction(player, "eventTalkRead", getPosterIndex(npc))
```

The poster index is parsed from trailing digits in the NPC unique id and clamped to `1..10`.

Local `RaidDungeonWarp` behavior:

```lua
local enabled = worldManager:CanUseRaidDungeonWarp(player, npc)
if enabled then
  callClientFunction(player, "activateWarpDevice")
end
local choice = callClientFunction(player, "askYesNo", enabled)
if choice == 1 then
  worldManager:UseRaidDungeonWarp(player, npc)
end
```

`WorldManager.CanUseRaidDungeonWarp` returns true if the current `PrivateAreaContent` has a captured return point for the player. It also returns true for private Toto-Rak zone `159` as a fallback case.

`WorldManager.UseRaidDungeonWarp` first closes the legacy duty widget, then zones the player to the captured return point. If the player is in private Toto-Rak but no return point is present, it logs a warning and falls back to the public entrance coordinates.

Manual exit / return cleanup:

- `UseRaidDungeonWarp` closes the recovered duty widget before zoning to the
  captured content return point.
- `ExitCurrentContentToReturnPoint(player, reason)` requires a live
  `PrivateAreaContent` return point, closes the recovered duty widget, then
  zones to that captured point.
- Normal `DoZoneChange` consumes the re-entry ticket when the old area is a
  `PrivateAreaContent` and the new area differs: it unregisters the player from
  the content area and clears `characters_content_reentry`.
- If the player still has a current content group, the same zone-change path
  removes the member, clears `currentContentGroup`, and checks whether the old
  private area should be destroyed.
- Neither manual exit path calls `ContentFinished()` by itself; finished/destroy
  state still depends on timeout or another finalization owner.
- Neither manual exit path implements recovered row `52061` loot-list
  transfer/discard semantics.

Current caveat:

- `1200373..1200375` remain warp-device visual/model leads only. Their local class rows are `~~~magitek???~~~`, they share model `20988`, and GM bg-model group `988` maps to them. No production spawn/map-object binding was found tying them to `/Chara/Npc/Object/RaidDungeonWarp`.

## GM probe surfaces

Source:

`Data/scripts/commands/gm/totorak.lua`

Relevant modes:

- `!totorak dutywidget [minutes]`: opens recovered in-duty timer widget via probe director.
- `!totorak dutyclose`: sends `widgetSetOff`.
- `!totorak dutycs [open|clear|fail|exit|scene] [arg] [minutes]`: runs recovered occupancy cutscene/widget callback with a probe director.
- `!totorak livecs [open|clear|fail|exit|scene] [arg]`: runs live occupancy cutscene bridge in an active normal Toto-Rak instance.
- `!totorak spawnboss shaula|sargas|antares`: spawns recovered BNPC probes in active content.

Probe callback examples:

```lua
OccupancyDungeonSendRelogin(player, director, "totorak", finishTime, false)
OccupancyDungeonSendWidgetClose(player, director)
OccupancyDungeonSendEventNoticeCutScene(player, director, "totorak", sceneKey, 1, finishTime)
```

Live cutscene bridge:

```lua
GetWorldManager():PlayTotorakLegacyDutyCutsceneForPlayer(player, sceneKey, 0, "gm-livecs")
```

## Shaula and clear-scene bridge

Source:

`Map Server/WorldManager.cs`

Recovered/local probe constants:

- Antares: BNPC `3001`, actor class `2301102`
- Sargas: BNPC `3093`, actor class `2301103`
- Shaula: BNPC `3095`, actor class `2301104`

Death hook:

Source:

`Map Server/Actors/Chara/Npc/BattleNpc.cs`

`BattleNpc.Die` calls:

```csharp
Server.GetWorldManager().HandleTotorakBattleNpcDeath(this);
```

`HandleTotorakBattleNpcDeath`:

- Requires actor class `2301104` (Shaula).
- Requires active private Toto-Rak content in zone `159`.
- Guards once per instance with `ClearSceneSent`.
- Sets `ClearSceneSent = true`; it does not set `IsFinishing`.
- Sends:

  ```csharp
  PlayTotorakLegacyDutyCutsceneForPlayer(player, "clear", 0, "shaula-death")
  ```

Cutscene alias resolution:

- `clear`, `finish`, `complete`, `306`, `rad0f306` -> `rad0f306`
- `fail`, `failure`, `lose`, `307`, `rad0f307` -> `rad0f307`
- `exit`, `end`, `308`, `rad0f308` -> `rad0f308`
- `open`, `opening`, `start`, `300`, `rad0f300` -> `rad0f300`

### Current battle probe data

Local hardcoded probe aliases:

```text
antares, 3001, 2301102 -> Antares  BNPC 3001 actor class 2301102
sargas,  3093, 2301103 -> Sargas   BNPC 3093 actor class 2301103
shaula, boss, clear, 3095, 2301104 -> Shaula BNPC 3095 actor class 2301104
```

`SpawnTotorakBattleProbeForPlayer` is GM/probe-only behavior:

- Requires an active private Toto-Rak content copy in zone `159`.
- Requires matching live `TotorakInstanceState`.
- Looks up the BNPC mob type and warns if its actor id does not match the expected actor class.
- Spawns at player position plus `2.0` on X/Z using unique ids like `totorak_probe_shaula_<playerId>_<unix>`.
- Sets level from the mob type, stretches detection range to at least `50`, calculates stats, sets HP/TP, and fans spawn/init/status packets to players in the content area.

Client/DAT identity anchors:

- `actorclass.csv`: `2301102 -> 3201108`, `2301103 -> 3201109`, `2301104 -> 3201110`.
- `xtx_displayName.csv`: `3201108 Antares`, `3201109 Sargas`, `3201110 Shaula`.
- `xtx_achievement.csv`: achievements `1301`, `1302`, and `1303` explicitly say to defeat Antares, Sargas, and Shaula in the Thousand Maws of Toto-Rak.
- Local actor-class scripts: `2301102` and `2301103` use
  `/Chara/Npc/Monster/Spider/SpiderMaleStandard`; `2301104` uses
  `/Chara/Npc/Monster/Spider/SpiderFemaleStandard`.
- Local appearances use model `10017`: Antares and Sargas variant `2048`,
  Shaula variant `3072`.

Local mob-type anchors:

```text
3001 2301102 antares lvl 38-38 zone note "The Thousand Maws of Toto-Rak; source location only"
3093 2301103 sargas  lvl 38-38 zone note "The Thousand Maws of Toto-Rak, Execution Chamber"
3095 2301104 shaula  lvl 40-40 zone note "The Thousand Maws of Toto-Rak, Interrogation Chamber"
```

These rows are staged in `server_battlenpc_mob_types_loot.sql` and promoted into `server_battlenpc_mob_types`; they are not spawn rows.

### Natural placement status

No natural static battle placement for Antares/Sargas/Shaula was found in the current SQL snapshot:

- `server_battlenpc_spawn_locations.sql` schema is `id, bnpcId, uniqueId, mobName, zoneId, ...`.
- Numeric hits where `id` is `3001`, `3093`, or `3095` are unrelated zone `130` rows (`yarzon_burrower`, `pharosfly`, `anemone`), not Toto-Rak boss BNPC placement.
- Column-aware checks found no second-column `bnpcId` rows for `3001`, `3093`, or `3095` in zone `159`.
- `server_battlenpc_nm_spawn_locations.sql` did not provide zone `159` placement for these three.
- `nm_spawn_capture_checklist.csv` still marks all three as `needs_pos`.

Important limitation:

- Shaula death owns the clear-scene bridge only.
- `BattleNpc.Die` continues through generic battle reward/quest/EXP handling
  after calling the Toto-Rak hook; the hook itself does not become a duty-result
  grant path.
- It does not call `ContentFinished`, clear or set timers, grant duty rewards,
  unregister re-entry tickets, return players, or remove the instance.
- Full clear rewards, content finalization, teardown, exit return handling, and
  lockout parity are not proven by this bridge alone.

## Timeout, reconnect, and teardown

Source:

`Map Server/WorldManager.cs`

Implemented timeout path:

- `UpdateTotorakInstances` scans active `TotorakInstanceState` rows.
- Null areas are removed.
- Empty instances with no online players and no re-entry participants are marked content-finished, checked for destroy, and removed.
- Expired instances set `IsFinishing = true`, are removed from the tracked list, then pass to `ExpireTotorakInstance`.

`ExpireTotorakInstance` behavior:

- Calls `instance.Area.ContentFinished()`.
- Online players receive a timeout chat message.
- Online players get `Player.TIMER_TOTORAK` set to `5` minutes.
- Online players receive `widgetSetOff`.
- Online players are zoned to public entrance zone `154` at `(835.642, -12.682, 643.485, 2.502)`.
- Offline participants get the same 5-minute timer through `Database.SetCharacterContentTimer`.
- Offline participants are moved to their saved content return point; if none exists, they are moved to the same public Toto-Rak entrance fallback.
- The private area is checked for destruction after the moves.

What timeout does not currently do:

- It does not play `rad0f307` / failure cutscene.
- It does not send a recovered failure result flow.
- It closes the widget and warps instead.

Reconnect and recovery:

- Content return points are captured before content zone-in and saved in the DB.
- Normal zone changes out of content unregister the player and clear the DB re-entry ticket.
- Login/disconnect recovery can reattach to live content or move the character to the saved return point if content is invalid/missing.
- Active disconnect cleanup first uses the generic content preservation/recovery path,
  `SessionCleanup.TryPreserveOrRecoverContentReentry`.
- `SessionCleanup.TryRecoverTotorakDisconnect` still exists as a Toto-Rak-specific
  helper for zone `159`, but this pass found no current call reference to it. Treat
  it as inactive fallback/dead helper unless a caller is restored.

Runtime content re-entry storage:

- `Database.EnsureContentReentryTable` creates `characters_content_reentry`.
- The checked-in schema source is `Data/sql/characters_content_reentry.sql`.
- Key content identity columns: `zoneId`, `privateAreaName`, `privateAreaType`.
- Return identity columns: `returnZoneId`, `returnPrivateArea`,
  `returnPrivateAreaType`.
- Return position columns: `returnX`, `returnY`, `returnZ`, `returnRotation`,
  `returnSpawnType`.
- Timer/policy columns: `expiresAtUtc`, `policy`, `updatedAtUtc`.
- Indexes exist for content-area lookup and expiry lookup.
- Character location persists separately on the `characters` table through
  `currentZoneId`, `currentPrivateArea`, `currentPrivateAreaType`, position,
  and pending-destination fields.
- Content timers persist in `characters_timers`; Toto-Rak uses player timer
  index `0`, stored as the `thousandmaws` column.

Live `PrivateAreaContent` keeps the matching in-memory state:

- `participantIds`
- `returnPoints`
- `reentryPolicy`
- `expiresAtUnix`
- `isContentFinished`

`WorldManager.DoZoneChangeContent` registers the return point and persists the
same ticket with `Database.SaveContentAreaReentry` before content zone-in
completes.  `PrivateAreaContent.ReconnectPlayer(player)` calls
`currentDirector?.ReplacePlayerMember(player)`, which swaps stale disconnected
`Player` objects by character id before re-adding the new player object to the
director and content group if present.

Missing-instance recovery caveat:

- If live content still exists and is valid, login reattaches through
  `CanReconnectPlayer` / `ReconnectPlayer`.
- If live content is gone or invalid, `Database.TryRecoverPlayerFromContentReentry`
  returns the player to the saved return point and clears the ticket.
- This missing-instance DB recovery path did not show a Toto-Rak five-minute
  failure cooldown write in this pass; the five-minute timer is proven in live
  timeout expiry.

Objective-state caveat:

- Re-entry persistence is location/timer/content-ticket oriented.
- Photocells and opened barriers live on `Player` runtime fields.
- `ResetTotorakDungeonStateOnEntry` clears those fields on entry to zone `159`.
- That means reconnect/re-entry parity for photocell/barrier progress is missing or unproven.

Success/finalization caveat:

- Shaula death currently sends only the clear cutscene bridge.
- It does not mark `IsFinishing`, call `ContentFinished`, clear or set timers, grant duty rewards, unregister re-entry tickets, return players, or remove the instance.
- Manual exits and exit objects use generic content-return behavior, not a clear-owned duty result path.

## Local content hooks

Source:

`Data/scripts/content/Totorak.lua`

Only music hooks were found:

- `onCreate(player, contentArea, director)`
- `onZoneIn(player, contentArea)`

Behavior:

- Applies Toto-Rak field/battle music.
- Calls `player:ChangeMusic(20)` on zone-in.

No widget, cutscene, or director lifecycle is hidden in this local content script.

Local music/combat state:

- Field music is `20`.
- Battle music is `6`.
- `Player` tracks `isTotorakBattleMusicPlaying` for private Toto-Rak areas.
- New engagement or landed damage from a battle NPC switches to battle music.
- The player returns to field music when no longer engaged and no local
  Toto-Rak battle NPC has hate targeting that player.
- `ClearTotorakDungeonState` resets photocells, opened barriers, and the
  battle-music flag.

## Local entry scripts

Primary local entry helper:

`Data/scripts/totorak_entry.lua`

NPC:

`Data/scripts/base/chara/npc/populace/PopulaceTotorakEntrance.lua`

Normal production path can call:

```lua
GetWorldManager():StartTotorakInstance(player)
```

Debug path can create older/simple content using `Instance/Totorak`, whose local script returns `/Director/OpeningDirector`. That debug lane is not equivalent to recovered legacy occupancy `RaidFst0Dungeon03`.

Local constants in `Data/scripts/totorak_entry.lua`:

- `TOTORAK_ENTRY_MIN_PARTY_SIZE = 2`
- `TOTORAK_ENTRY_MAX_PARTY_SIZE = 4`
- `TOTORAK_ENTRY_DURATION_MINUTES = 60`
- `TOTORAK_ENTRY_MINIMUM_LEVEL = 25`
- `TOTORAK_ENTRY_RAID_ID = 1`

Current local test toggles:

- `TOTORAK_NPC_DEBUG_ENTRY_ENABLED = false`
- `TOTORAK_NPC_ENTRY_CUTSCENE_ENABLED = false`
- `TOTORAK_NPC_AUTO_PREP_TEST_QUEST_ENABLED = true`
- `TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false`
- `TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED = true`
- `TOTORAK_NPC_RETAIL_TALK_PROBE_ENABLED = false`

Quest-aware NPC routing:

- `PopulaceTotorakEntrance.onEventStarted` first looks for default/tutorial/active quest handlers and dispatches `OnCommand`, `OnTalk`, `OnPush`, `OnEmote`, or `OnNotice` when a quest owns the interaction.
- If no quest owns the interaction, it calls `TotorakTryStartFromNpc(player)`.
- `DftFst.lua` also routes Bloisirant / Toto-Rak entrance default talk (`npcId == 1001150`) to `TotorakTryStartFromNpc(player)`.

Binding caveat:

- Checked-in SQL spawns Bloisirant as actor class `1001150` in zone `154`.
- The actor class row points at `/Chara/Npc/Populace/PopulaceStandard`.
- The custom `PopulaceTotorakEntrance.lua` fallback exists locally, but the checked-in SQL binding does not prove that Bloisirant is directly using that custom class.
- The proven checked-in route is the `DftFst.lua` default-talk bypass for `npcId == 1001150`.

`TotorakAskEntry`:

```lua
local raidId = GetWorldManager():GetTotorakRaidDungeonId()
if raidId == nil or raidId == 0 then
  raidId = TOTORAK_ENTRY_RAID_ID
end
return callClientFunction(player, "askEnterInstanceRaid", raidId)
```

As currently toggled, the local NPC path keeps the entry widget disabled and safe-solo-after-widget enabled. With those settings, `TotorakTryStartFromNpc` does not exercise the full retail guide acceptance lane by default. If `TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED` is turned off after acceptance, it calls `GetWorldManager():StartTotorakInstance(player)`.

Entry quest scaffolding:

- `TOTORAK_ENTRY_QUESTS` recognizes `111405`, `111406`, `111605`, `111606`, and `111805` at sequence `10`.
- With `TOTORAK_NPC_AUTO_PREP_TEST_QUEST_ENABLED = true`, the helper can auto-add default quest `111605` and set it to sequence `10`.
- On successful local start, `TotorakAdvanceEntryQuest` moves the first matching sequence-10 entry quest to sequence `20`.
- This advancement is tied to successful entry, not Shaula clear.
- `com0g5`, `com0g6`, `com0l5`, `com0l6`, and `com0u5` call `TotorakTryStartFromNpc(player)` in their Toto-Rak entry sequence.
- `com0u6` is the Ul'dah follow-up quest (`111806`, Know Your Enemy), not part of the current local `TOTORAK_ENTRY_QUESTS` list.

Concrete local entry quest hooks:

| Script | Quest id | Name | Entry sequence | City/source NPC | Pre-entry event | Post-entry/follow-up |
| --- | ---: | --- | ---: | --- | --- | --- |
| `com0l5` | `111405` | An Officer and a Wise Man | `10` | Orn Guincum `1500199` | `com0l500` | `com0l510`, grants magitek accumulator |
| `com0l6` | `111406` | Ceruleum Shock | `10` | Orn Guincum `1500199` | `com0l510` | aftermath talk only |
| `com0g5` | `111605` | Their Finest Hour | `10` | Syro Fulke `1500200` | `com0g500` | `com0g510`, A-Ruhn-Senna placeholder/fallback |
| `com0g6` | `111606` | Appetite for Destruction | `10` | Syro Fulke `1500200` | `com0g510` | aftermath talk only |
| `com0u5` | `111805` | Burning Man | `10` | Aubrey `1500198` | `com0u500` | `com0u510`, grants shattered gauntlet and cooling plate |
| `com0u6` | `111806` | Know Your Enemy | n/a | Aubrey `1500198` | `com0u510` | follow-up quest, no Toto-Rak entry hook |

Every entry quest above uses Bloisirant actor class `1001150` at sequence `10`
and calls `TotorakTryStartFromNpc(player)` from `onTalk`.

Quest-gating caveat:

- Recovered guide rows mention quest-completion/progress requirements.
- Current `StartTotorakInstance` validation does not require the starter or party members to have a matching Imperial Devices quest state.
- Current denials are server chat strings, not recovered guide error ids.

Current local toggle caveat:

- `TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false`.
- `TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED = true`.
- With those defaults, the quest/Bloisirant route goes through
  `TotorakStartDebugInstance(player, "TotorakNpcStoryDebug")` instead of the
  party/timer production path.
- Turning safe-solo off makes the route call `GetWorldManager():StartTotorakInstance(player)`.

Current authoritative local party validation in `WorldManager.GetTotorakInstanceEntrants`:

- Starter must be in public entrance zone `154`, not a private area.
- Starter must be in a party.
- Starter must be party leader.
- Party size must be `2..4`.
- All members must be online.
- All members must be in the same area as the starter.
- All members must be level `25` or higher.
- No member may have active content timer `Player.TIMER_TOTORAK`.

Current local instance creation in `StartTotorakInstanceForEntrants`:

- Creates private content area from public zone `159`.
- Uses area class `/Area/PrivateArea/Occupancy/RaidDungeonSimple`.
- Uses private name `"totorak"` and content script `"Totorak"`.
- Uses director script `Occupancy/RaidFst0Dungeon03`.
- Copies public spawns into the content area and calls `SpawnAllActors`.
- Starts the occupancy director and adds the director/entrants as director
  members. It calls `StartContentGroup()`, but this production path used
  `CreateContentAreaWithoutContentGroup`, so there is no meaningful backing
  content group packet stream here.
- Sets timed re-entry expiry to `DateTime.UtcNow + 60 minutes`.
- Prepares either opening cutscene zone init or direct widget zone init by
  attaching the entrant as an occupancy director member and setting the login
  director, zones entrants to `(880.116, -22.89, 648.988, 0)`, then schedules
  the opening cutscene or widget open. The async widget opener clears the login
  director after send or timeout.

## `noticeEvent` ownership evidence

Evidence that the flow is director-owned `noticeEvent`:

- `DirectorBaseClass._onEventCancel` specifically resets player fade when event name is `noticeEvent`.
- No recovered Lua `DirectorBaseClass._onEventStart` body was found; local
  `onEventStarted` is server/script adapter plumbing.
- `PlayerBaseClass.isEventPlaying()` includes `"noticeEvent"`.
- `NpcBaseClass.delegateEvent` has a similar delegate shape, but `NpcBaseClass._onEventCancel` resets fade for talk/push/emote/command families rather than `noticeEvent`.
- Local `Director.SendDirectorEventFunction` always sends `RunEventFunctionPacket` with event name `"noticeEvent"` and event type `5`.
- Local `Director.OnEventStart` prepends `(player, director)` before resuming
  Lua `onEventStarted`.
- Recovered `DirectorBaseClass.delegateEvent` calls
  `target:_callFunction(functionName, player, director, ...)`.
- Recovered `NpcBaseClass.delegateEvent` calls
  `target:_callFunction(functionName, player, npc, ...)`.
- Local public/direct `Data/scripts/occupancy_dungeon_widget.lua` calls prefer
  `director:SendDirectorEventFunction(...)` and falls back to
  `player:RunEventFunction(...)`.
- Local `RaidFst0Dungeon03.onEventStarted` instead uses
  `OccupancyDungeonCallCurrent*`, which reaches the current-event
  `callClientFunction -> player:RunEventFunction` path.

Conclusion:

`noticeEvent` is the event channel used to deliver `eventNoticeCutScene`, `relogin`, `widgetSetOff`, or `processUIFinalize` to the director. It is not a separate recovered method on `RaidFst0Dungeon03`.

## Confidence ladder

100% source-proven in the recovered/static material:

- `RaidFst0Dungeon03.eventNoticeCutScene(self, player, sceneKey,
  cutsceneArg, finishTime)` calls
  `worldMaster:createCutScene(sceneKey, self):startCutScene(1, 61, 1, 0,
  cutsceneArg)`.
- Normal Toto-Rak opening is `rad0f300` with `cutsceneArg = 1`.
- `RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)` opens the
  duty widget only when `clearFlag == false`.
- `desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)` forwards
  only `contentId = 1` and `finishTime` into slot `15`
  `RaidDungeonExecutionWidget`.
- `RaidDungeonExecutionWidget.init(contentId, finishTime)` has no Lua guard for
  `_setInstanceRaid`, content group, `0x0133`, or `0x017A`.
- `24228` maps to static owner `0xA0F05EA4`
  `/Command/System/WidgetOpenCommand`.
  The low 16 bits carry the command id: `0xA0F05EA4 & 0xFFFF = 0x5EA4 =
  24228`.
- Bytecode for `CharaBaseClass.getCommandName` resolves
  `WidgetOpenCommand` to command lane `"widgetCreate"`.
- Slot `15` maps to returned widget type `5` in raw
  `WidgetBaseClass_common.luac`; older "type 4" wording is only a legacy or
  zero-based family label. Bytecode for `setDesktopModeDetail` enables the
  slot-15/type-5 family only in desktop modes `8`, `16`, `32`, `61`, and `63`;
  explicit false branches include `62`, `120`, `126`, and `127`, while mode
  `64` has no recovered flag-assignment branch and needs a live
  returned-type/flag read.
- Bytecode for `openWidgetLocal` performs one real
  `commandCreateWidget(...)` call, stores the result, and returns that same
  result after optional parent-input disabling.
- `openWidget` returns false before 24228 if the returned type's
  `widgetEnableFlag` is false; `openWidgetYield` can return nil before 24228
  if `rootWidget[15]` is already non-nil.

99% local-source proven in the current dirty working tree:

- `0x012F KickEvent` is sent with trigger/source player, owner director,
  event name `noticeEvent`, type `5`, and params
  `["relogin", finishTime, false]`.
- `0x012D EventStart(false)` records current owner/name/type on the player;
  the observed current event type in local logs is `0x50`.
- Current C# active-event retry sends `relogin(player, finishTime, false)` on
  the current-event lane, then an explicit type-5 fallback with the same args.
- A client `EventUpdate` ACK proves only that the event lane answered. It does
  not prove slot `15` was created.
- Native receive outputs show `0x0130` is covered by the broad middle opcode
  lane `0x012E..0x013D`, entering `0x004DCFFF`, looking up an object via
  `0x004D9910`, then calling the resolved object's vtable slot `+0x24`.
- In the local packet shape, the first native source lookup should be the
  player/trigger object. The director remains the body owner field. For
  `relogin`, the effective packet is source/trigger `player`, body
  `ownerActorID = director`, `eventName = "noticeEvent"`,
  `functionName = "relogin"`, Lua params `[player, finishTime, false]`.
- `0x0130` depends on a prior object lifecycle. The native `0x00CA` path
  creates/registers receive objects, while `0x00CB` tears down/switches current
  object state; the shared `0x0130` lane only looks up and dispatches.
- Installed-binary RTTI and disassembly now recover the direct
  `LuaActorImpl` slot-57 `0x0130` decoder at `0x0076C220`, plus
  `StartServerOrderEventFunctionReceiver` vtable `0x010574C8`, constructor
  `0x0089F360` / packet-facing constructor `0x0089EDB0`, main body
  `0x0089E260`, queue drain `0x0089E8E0`, deeper dispatcher `0x00896F70`, and
  readiness byte reader `0x00CC72A0`. It can queue/retain and must pass
  owner/context readiness gates before the Lua side effect.
- The still-missing piece is the bridge from
  `0x0130 -> 0x004DCFFF -> 0x004D9910 -> object vtable +0x24` into the
  now-known `LuaActorImpl` slot-57 decoder `0x0076C220`. The native fallback
  ACK path `0x00896F70 -> 0x00894090 -> 0x0075E670` is now recovered, so
  ACK/update traffic is specifically not sufficient proof that
  `RaidFst0Dungeon03.relogin` executed.
- If correct-arg relogin ACKs but no widget appears, the next local proof point
  is `commandCreateWidget -> commandAboutWidget(24228)` and the local
  guarded `WidgetOpenCommand`/widget-create traffic.
- If current local `WidgetOpenCommand` receives
  `RaidDungeonExecutionWidget`, it allows only private zone `159` and otherwise
  rejects as `unknown`/context failure.

Capture-bound / not honestly 100% yet:

- Exact retail Toto-Rak director/player bind order.
- Whether retail sets `loginInitDirector` in the player bind for this duty.
- Whether retail uses content-group work/`0x017A` for Toto-Rak even though the
  current local default does not.
- Exact client-native `0x0130` queue/retain behavior when owner actor, event
  type, or script context is not ready.
- Exact map-object `+0x24` bridge into `LuaActorImpl` slot 57. Current installed
  binary work recovers the slot-57 packet decoder, receiver class, packet field
  layout, readiness gates, and deeper dispatch body, but not the concrete
  map-resident vtable method that selects it or the exact final Lua resolver
  frame inside `0x00CD0940`.
- Exact retail timing for `0x0131 EndEvent` relative to cutscene start, relogin,
  and widget create.

## Open gaps

1. Retail packet order for real Toto-Rak entry remains unproven without a capture.
2. Current local order is proven from source: player bind still precedes owned
   director spawn/init, and current normal Toto-Rak prep can set the
   login-director pointer before that bind. Retail still needs capture.
3. `RaidDungeonWarp` actor binding and exact destination mapping remain capture-first.
4. Natural retail battle population/coordinates are not recovered; Shaula/Sargas/Antares are probeable but not naturally placed from recovered rows.
5. Full clear/fail/exit finalization is partial. `rad0f306` is bridged from Shaula death, but rewards/teardown/result flow remain incomplete.
6. `rad0f307` and `rad0f308` are probeable via aliases but do not yet have natural recovered outcome owners in local production.
7. `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, and `InstanceRaidTreasureBox` are recovered surfaces but are not broadly bound into local Toto-Rak runtime.
8. Recovered guide error ids are not wired to current local entry denial strings.
9. Re-entry preserves content location/timer state, but photocell/barrier objective persistence is missing or unproven.
10. Checked-in Bloisirant binding proves `PopulaceStandard` plus `DftFst` bypass, not direct `PopulaceTotorakEntrance` ownership.
11. Content-group bridge packet/work details are known, but default local Toto-Rak uses `CreateContentAreaWithoutContentGroup`.
12. `TryRecoverTotorakDisconnect` exists, but the active cleanup path appears to be the generic content re-entry preservation/recovery path.
13. Missing-instance login recovery returns the player to the saved return point, but no Toto-Rak failure cooldown write was found on that specific DB-recovery path.

## Quick reference

Toto-Rak recovered client calls:

```lua
desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
desktopWidget:closeRaidDungeonExecutionWidget()
desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
worldMaster:createCutScene("rad0f300", self):startCutScene(1, 61, 1, 0, 1)
```

Duty widget packet target:

```text
Director-owned noticeEvent -> 0x0130 RunEventFunction "relogin" -> slot 15 openRaidDungeonExecutionWidget side effect
Native 0x0130 envelope -> opcode range 0x012E..0x013D -> 0x004DCFFF -> source/player object lookup 0x004D9910 -> vtable +0x24
RunEventFunction body owner -> director actor, eventName="noticeEvent", function="relogin", params=[player, finishTime, false]
Receiver gate -> LuaActorImpl slot 57 0x0076C220 / StartServerOrderEventFunctionReceiver vtable 0x010574C8 / 0x00CC72A0 +0x7D readiness
```

Toto-Rak local widget/relogin handshake:

```text
Toto-Rak constants                                                  -- zone=159, entrance=154, display=2123, contentId=1
Legacy occupancy director id                                       -- dynamic; read from [TotorakDutyWidget] director=0x...
KickEvent noticeEvent ["relogin", finishTime, false]                 -- source/trigger=player, owner=director, send type=5
Client EventStart noticeEvent owner=director params=false            -- source/trigger=player, observed current type=0x50
Lua onEventStarted setup branch                                      -- no relogin call; event remains active
Current C# active retry noticeEvent "relogin" [player, finishTime, false] -- source=player, owner=director, current type=0x50
Explicit fallback noticeEvent "relogin" [player, finishTime, false]   -- source=player, owner=director, explicit type=5
Client EventUpdate step 0x50/0x5                                     -- answer to current/direct helper, not widget proof
Next proof boundary                                                   -- 24228/WidgetOpenCommand or slot-15 widget actor traffic
If 24228 owner=0xA0F05EA4 candidate=RaidDungeonExecutionWidget appears -- inspect local WidgetOpenCommand allow/reject and then slot-15 widget traffic
If 24228 never appears                                                -- failure is earlier: native dispatch/openWidgetYield/commandAboutWidget
```

Toto-Rak local direct helper payloads:

```text
RunEventFunction noticeEvent "eventNoticeCutScene" [player, "rad0f300", 1, finishTime]
RunEventFunction noticeEvent "widgetSetOff" []
```

Current local order:

```text
Create content area/director
Start director without content group
Add player as director member
Prepare occupancy director membership and login-director bind state
DoZoneChangeContent
My-player 0x0132 command/widget bootstrap
Player 0x00CC bind
Owned director spawn/init
Delayed KickEvent noticeEvent
Client EventStart(false), owner=director, current type=0x50
Lua onEventStarted setup branch holds the event open
C# active retry relogin [player, finishTime, false], current type=0x50
C# explicit fallback relogin [player, finishTime, false], explicit type=5
Client EventUpdate step 0x50/0x5
Optional fallback plain player.EndEvent()
Slot 15 opens only if the client executes relogin with [player, finishTime, false]
If args are correct and slot 15 still does not open, inspect system command 24228 / WidgetOpenCommand allow/reject or slot-15 actor traffic
```

## 2026-06-23 narrow receiver/widget-state addendum

This pass intentionally stayed narrow around the current failure:

```text
correct-arg 0x0130 relogin ACKs
no RaidDungeonExecutionWidget
no fresh 0x0132/system-command widget-create traffic
```

### Exact source-backed no-24228 gates

The recovered client Lua still proves the slot-15 path:

```lua
RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
```

`DesktopWidget.openRaidDungeonExecutionWidget` discards the first/display arg and
calls:

```lua
self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
```

Recovered references:

- `tools/outputs/lpb/decomp_more_20260617/lua/director/occupancy/raidfst0dungeon03.lua:28`
  has `relogin(self, player, finishTime, clearFlag)` and opens only when
  `clearFlag == false`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:6310`
  calls `openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, A2,
  A3)`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:15066`
  is `openWidgetYield`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:14627`
  is `openWidget`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:14605`
  is `openWidgetLocal`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget.lua:27`
  is `commandCreateWidget -> commandAboutWidget(getSystemCommand(24228), ...)`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:1115`
  is `commandAboutWidget`.

The precise silent branches before any `24228` can appear are:

| Point | Live value needed | No-24228 branch |
|---|---|---|
| `relogin` body | Did execution reach line 31 after fade? | If native/event resolver ACKs without executing the Lua body, no widget path is reached. |
| `openWidgetYield` entry | `rootWidget[15]` before normalization | Parent is `nil` on entry, so `isWidgetExec(15) == true` returns `nil` before `openWidget`. `isWidgetExec` only checks non-nil, while `getWidget` later purges dead roots. |
| `openWidget` type | `getWidgetTypeByIndex(15)` | Expected raw Lua 5.1 proto value `5`; nil would return false before the command. |
| `openWidget` mode flag | `work.widgetEnableFlag[5]`; also log `[4]` as legacy diagnostic | False returns false; `openWidgetYield` then breaks if the flag is still false. |
| `openWidgetLocal` parent | `parent:_isAlive()` where parent should now be `desktopWidget` | False returns false before `commandCreateWidget`. |
| `commandAboutWidget` burst gate | `playerWork.widgetCommandBurstBlocker`, server time, cancel flag | Recent blocker returns false before `_executeCommand`. |
| `commandAboutWidget` playing gate | `_isCommandPlaying("widgetCreate")` | True with `cancelFlag == false` returns false before `_executeCommand`. |
| command bridge | `_executeCommand("widgetCreate", getSystemCommand(24228), ...)` return | False means no command event; true should emit the static `0xA0F05EA4/24228` `WidgetOpenCommand` event. |

`_canExecuteCommand("widgetCreate")` is not a visible branch in
`commandAboutWidget`; it belongs to the generic `canCommand` path
(`playerbaseclass.lua:913`). It is still useful live telemetry, but not the
source-proven widget-create suppression branch.

### What existing server packets can and cannot prove

`0x012E EventUpdate` does carry Lua return params, and local server Lua resumes
on those params. That proves return-value probing is possible in principle.
However, the exact requested DesktopWidget internals are not exposed by an
existing recovered director/player event method:

```text
widgetEnableFlag[5]
widgetEnableFlag[4] legacy diagnostic
rootWidget[15]
desktop mode / modeLevel
desktopWidget:_isAlive()
raw commandAboutWidget return
raw _executeCommand(24228) return
```

Those are local client Lua object fields or native command returns inside the
DesktopWidget/Player objects. A normal director-owned `0x0130` can ACK without
returning them, and an ACK by itself does not prove the widget side effect. To
get the live values with high confidence, use either:

1. a temporary client Lua probe inserted at the exact functions above, or
2. native breakpoints/hooks on the same functions and on `_executeCommand`.

Local packet-path references:

- `Data/scripts/global.lua:225` implements local `callClientFunction` as
  `player:RunEventFunction(functionName, ...)`.
- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs:37` writes the
  `0x0130` body: trigger actor, owner actor, event type, event name, function
  name, and Lua params. It is a function-call packet, not an expression
  evaluator.
- `Map Server/Actors/Chara/Player/Player.cs:6588` targets the player's current
  event owner/name/type.
- `Map Server/Actors/Director/Director.cs:329` targets the director
  `noticeEvent` explicitly with type `5`.
- `Map Server/Packets/Receive/Events/EventUpdatePacket.cs:44` parses `0x012E`
  returned Lua params.
- `Map Server/PacketProcessor.cs:491` routes `0x012E` to
  `Player.UpdateEvent(...)`, and `Map Server/Actors/Chara/Player/Player.cs:6556`
  resumes the Lua event wait through `LuaEngine.OnEventUpdate`.

Therefore existing packet logging can prove:

```text
0x0130 was sent
0x012E ACK/update returned
24228/WidgetOpenCommand did or did not appear downstream
```

It cannot by itself prove:

```text
RaidFst0Dungeon03.relogin body ran past fade
desktopWidget.openWidgetYield was entered
widgetEnableFlag[5] was true
rootWidget[15] was nil
commandAboutWidget reached _executeCommand
_executeCommand(24228) returned true
```

The most useful probe points are:

```text
RaidFst0Dungeon03.relogin entry/after fade/before open
DesktopWidget.openWidgetYield entry
DesktopWidget.openWidget before each return false
DesktopWidget.openWidgetLocal before parent:_isAlive and after commandCreateWidget
DesktopWidget.commandCreateWidget before commandAboutWidget
PlayerBaseClass.commandAboutWidget before burst gate, before _isCommandPlaying, before/after _executeCommand
```

Log these exact values at those points:

```text
widgetEnableFlag[5]
widgetEnableFlag[4] legacy diagnostic
rootWidget[15] nil/non-nil and, if non-nil, _isAlive()
getWidgetTypeByIndex(15)
work.mode
work.modeLevel
work.desktopMode[1..5]
desktopWidget:_isAlive()
_isCommandPlaying("widgetCreate")
commandAboutWidget return
_executeCommand("widgetCreate", player:getSystemCommand(24228), ...) return
```

### Exact native boundary after 0x0130

The current local native artifacts still stop at the shared object/vtable
dispatch boundary:

```text
0x0130 is in middle receive range 0x012E..0x013D
  -> 0x004DCFFF
  -> call 0x004D9910 object lookup
  -> if object != nil, call object.vtable[+0x24](packet/context)
```

Concrete references:

- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/target_notes/target_004DCFFF_receive_dispatch_shared_object_vtable_handler.md:9`
  decodes the handler: push packet/context, call `0x004D9910`, load vtable
  `+0x24`, call it.
- `Client Sourcecode Decomp/ffxivgame.exe.c:36016` is `FUN_004d9910`; it looks
  up an object in the container at owner `+0x17804` and returns the found node
  value at `+0x10`.
- `tools/outputs/lpb/native_retainer_setup_submit_next_20260618/receive_opcode_dispatch_ranges.csv`
  records middle range `0x012E..0x013D -> 0x004DCFFF`.

Important correction: the visible `+0x7d` uses in the currently indexed
`ffxivgame.exe.c` also appear in generic tree/sentinel helpers
(`Client Sourcecode Decomp/ffxivgame.exe.c:126405` onward). So the current C
decompile alone does not prove `actor[+4]+0x7d` for `0x0130`.

The installed binary pass changes the confidence level: it recovers the direct
`LuaActorImpl` slot-57 packet decoder at `0x0076C220`, reidentifies
`StartServerOrderEventFunctionReceiver` through MSVC RTTI and vtable
`0x010574C8`, then recovers the constructor/body/queue helpers around
`0x0089EDB0`, `0x0089F360`, `0x0089E260`, `0x0089E8E0`, `0x00896F70`, and
`0x00CC72A0`. So the packet field layout, receiver class, and `+0x7D`
readiness/queue behavior are no longer only prior-note evidence. The unresolved
part is the live handle identity below the shared map-object
`object.vtable+0x24` handler. The `0x004D8860` case for `0x0130` reaches
`0x00575040`, a slot-57 trampoline, but the constructor-initialized handle can
point at wrapper vtable `0x00FE02AC`, whose slot 57 is no-op `0x0075AF00`. The
live Toto-Rak path must still prove whether that handle has been swapped to
`LuaActorImpl` vtable `0x00FDFB2C` before packet dispatch.

Result:

```text
0x0130 dispatch envelope is source-proven through object.vtable +0x24.
object.vtable +0x24 commonly reaches 0x004D8860 -> 0x00575040 slot-57 trampoline.
LuaActorImpl slot 57 decoder 0x0076C220 is installed-binary-proven.
StartServerOrderEventFunctionReceiver is installed-binary-proven after slot 57.
Live handle vtable identity is still a native-hook target. The success frame is
decoded through 0x00CD0940 -> 0x00CCF9B0; the best current hook for the actual
Lua method invocation candidate is 0x00CCEE30 after 0x00CCCD80 returns true.
```

## 2026-06-23 current-C queue/readiness follow-up

This pass pulled the nearby current `ffxivgame.exe.c` functions that looked like
they might back the older `+0x7d` readiness notes. The result is useful, but it
needs to be kept in the right bucket.

### What is source-proven now

`FUN_004d9910` is present in the current C decompile
(`Client Sourcecode Decomp/ffxivgame.exe.c:36016`). It is an object lookup
against the owner container around `param_1 + 0x17804/+0x17808` and returns
`node+0x10` or `0`. The generated instruction decode, not the current C symbol
table, still provides the shared receive lane:

```text
0x012E..0x013D -> 0x004DCFFF
0x004DD005      call 0x004D9910
0x004DD016      load [object.vtable + 0x24]
0x004DD01A      call vtable slot with packet/context
```

That is enough to say `0x0130` reaches object lookup and an object-specific
vtable handler if the source object exists. It is not enough to name the handler
body.

The installed client binary confirms the same top edge
(`C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe`,
image base `0x00400000`):

```asm
; 0x004DCFFF, shared 0x012E..0x013D object dispatch case
mov edx, [ebp + 8]     ; outer/source object id
push edx
mov ecx, edi           ; receive/object manager
call 0x004D9910        ; lookup object in manager container
test eax, eax
je 0x004DD3A9
mov edx, [eax]
mov ecx, eax
mov eax, [edx + 0x24]
push esi               ; packet/body pointer
call eax               ; concrete receiver handler
```

`0x004D9910` itself walks the manager container rooted around
`ecx + 0x17804`, returns `0` on miss, and otherwise returns the object pointer
stored at node `+0x10`. That makes the source/order requirement concrete:
`0x0130` needs the earlier create/bind packet path to have registered the
object; it does not create the object on this packet.

The current C also proves a native queued-work/readiness idiom using bytes
`+0x7d/+0x7e`:

- `FUN_00ce2bc0` (`ffxivgame.exe.c:220079`) initializes a queue/node-like
  object. It links the node, sets state `param_1[2] = _DAT_0130d4f8`, raises
  setup flags around `+0x7a/+0x7b/+0x7f`, and clears both `+0x7d` and `+0x7e`
  at `ffxivgame.exe.c:220121`.
- `FUN_00ce2d50` (`ffxivgame.exe.c:220134`) is the visible allocation/enqueue
  wrapper. It bumps parent counters at `+0x74/+0x78`, allocates/calls
  `FUN_00ce2bc0`, stores the parent at new node `+0x0c`, and marks node
  `+0x7a = 1`.
- `FUN_00ce2440` (`ffxivgame.exe.c:219806`) sets `+0x7e = 1`; a construction
  path calls it and then calls `FUN_00ce1dd0` (`ffxivgame.exe.c:217252` and
  `ffxivgame.exe.c:217256`).
- `FUN_00ce26c0` (`ffxivgame.exe.c:219895`) sets `+0x80 = 1` and `+0x7e = 1`,
  then calls `FUN_00ce1dd0(..., 1)`. One visible caller is
  `ffxivgame.exe.c:214503`.
- `FUN_00ce1dd0` (`ffxivgame.exe.c:219699`) is the readiness transition:
  it computes a follow-up condition from old `+0x7e != 0 && param_3 != 0`,
  writes `+0x7d = param_3`, clears `+0x7e` when setting ready, and for selected
  states runs follow-up work and sets `+0x80 = 1`.

So the native idiom is real:

```text
create/enqueue object -> +0x7d = 0, +0x7e = 0
queue/block work      -> +0x7e = 1
mark ready            -> +0x7d = 1, clear +0x7e, drain/follow up if needed
```

### What is not source-proven yet

The current C still does not prove that this `FUN_00ce*` object family is the
exact `0x0130` `LuaActorImpl slot 57` object body. The installed binary does
prove the `LuaActorImpl` slot-57 decoder, the
`StartServerOrderEventFunctionReceiver` vtable/body, and the `0x00CC72A0`
receiver queue/readiness path, but the concrete map-object vtable owner behind
`0x004DCFFF -> object.vtable +0x24` remains unidentified.

Also, the tempting `0x713E20` / `0x713E50` tables are not Toto-Rak receiver
proof. Local xref CSVs identify them as
`Application::Lua::Script::Client::Control::...s_ItemSearchWidgetResumeChecker`
vtable candidates. Their call seeds include a `0xCC72A0` path whose bytes read
`[eax+0x7d]`, which is supporting evidence for the readiness-byte idiom, but it
is not a proven `0x0130` duty/event receiver.

The honest current native status is therefore:

```text
source-proven:
  0x0130 is inside the 0x012E..0x013D shared receive lane
  0x004DCFFF calls 0x004D9910, then object.vtable+0x24
  0x004D9910 looks up an already-registered source object
  current C has a real +0x7d/+0x7e queued-readiness object family
  installed binary proves LuaActorImpl slot 57 decoder 0x0076C220
  installed binary proves 0x0130 body offsets: +0 trigger, +4 owner, +8 type,
    +9 eventName, +0x29 functionName, +0x49 fixed 0x40-byte param blob
  installed binary proves StartServerOrderEventFunctionReceiver vtable/body
  installed binary proves 0x00CC72A0 reads the receiver queue readiness byte at +0x7D
  installed binary proves resolver fallback ACK:
    0x00896F70 -> 0x00894090 -> 0x0075E670 -> 0x004D6D30 sends compact 0x012E

not yet source-proven:
  live Toto-Rak handle identity under 0x004D8860 -> 0x00575040
  whether object+0x80 still wraps vtable 0x00FE02AC or points at LuaActorImpl vtable 0x00FDFB2C
  exact instruction inside 0x00CCEE30 that invokes "relogin" / "eventNoticeCutScene"
  any success-path EventUpdate send; only fallback ACK is statically proven
```

### No-24228 decision tree tightened

For the current local symptom:

```text
0x0130 relogin(player, finishTime, false) ACKs
no 24228 / WidgetOpenCommand
no slot-15 RaidDungeonExecutionWidget
```

the strongest split is now:

1. Native receiver/event resolver accepted enough to ACK, but did not execute
   `RaidFst0Dungeon03.relogin` through the widget call.
2. `relogin` did run, but `DesktopWidget` refused before `commandAboutWidget`
   could emit system command `24228`.
3. `commandAboutWidget` ran, but `_executeCommand("widgetCreate", 24228, ...)`
   returned false before a server-visible command event.

The exact source-backed pre-24228 widget gates are unchanged, but the priority
order is clearer:

```text
relogin body reached after _fadeInNowLoadingForNoticeEventJustInArea()
rootWidget[15] before openWidgetYield normalization
  - isWidgetExec(15) only checks non-nil and does not purge dead roots
  - getWidget(15) would purge dead roots later, but openWidgetYield can return before that
getWidgetTypeByIndex(15) == 5
work.widgetEnableFlag[getWidgetTypeByIndex(15)] == true
work.widgetEnableFlag[5] == true
work.widgetEnableFlag[4] captured only as legacy diagnostic
desktopWidget:_isAlive() == true after parent defaults to desktopWidget
playerWork.widgetCommandBurstBlocker does not reject
_isCommandPlaying("widgetCreate") == false
_executeCommand("widgetCreate", player:getSystemCommand(24228), ...) returns true
```

`_canExecuteCommand("widgetCreate")` remains useful telemetry, but the recovered
`PlayerBaseClass.commandAboutWidget` path does not visibly call it. The visible
Lua path is burst blocker, `_isCommandPlaying`, then `_executeCommand`.

The highest-value live hooks are therefore:

```text
RaidFst0Dungeon03.relogin entry / after fade / before openRaidDungeonExecutionWidget
DesktopWidget.openWidgetYield entry
DesktopWidget.openWidget before each false return
DesktopWidget.openWidgetLocal before parent:_isAlive and after commandCreateWidget
DesktopWidget.commandCreateWidget before commandAboutWidget
PlayerBaseClass.commandAboutWidget before burst gate, before _isCommandPlaying, before/after _executeCommand
```

If `_executeCommand("widgetCreate", 24228, ...)` returns true, the next expected
server-visible edge is:

```text
0x012D EventStart owner=0xA0F05EA4 event=widgetCreate path=/Command/System/WidgetOpenCommand
```

If that edge still does not appear, the remaining gap is below Lua in the native
command system rather than in Toto-Rak args, cutscene name, or generic widget
properties.

## 2026-06-23 native lifecycle and 24228 edge addendum

This pass tightened two separate boundaries:

```text
native object lifecycle:
  0x00CA -> 0x004DCCBF -> 0x004D90C0 -> 0x00537620 -> created object.vtable+0x14
  later 0x0130 -> 0x004DCFFF -> 0x004D9910 -> existing object.vtable+0x24

widget command edge:
  DesktopWidget.commandCreateWidget
    -> PlayerBaseClass.commandAboutWidget
    -> _executeCommand("widgetCreate", system command 24228, ...)
    -> client sends 0x012D EventStart owner=0xA0F05EA4 event=widgetCreate
```

### ACK strength is lower than it looked

`0x012E/EventUpdate` is weak evidence. It proves the client answered the event
lane, not that `RaidFst0Dungeon03.relogin` ran through the widget call.

Source-backed local packet facts:

- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs:37` writes `0x0130`
  as trigger actor, owner actor, event type byte, event name, function name at
  body offset `0x29`, and Lua params at body offset `0x49`.
- `Map Server/Packets/Receive/Events/EventUpdatePacket.cs:44` parses `0x012E`
  as trigger, server codes, two unknown fields, one event-type/step byte, and
  Lua params.
- `Map Server/PacketProcessor.cs:491` routes `0x012E` straight to
  `Player.UpdateEvent(...)`; `Map Server/Actors/Chara/Player/Player.cs:6556`
  then calls `LuaEngine.OnEventUpdate`.
- `Map Server/Lua/LuaEngine.cs:689` returns if no wait coroutine is registered.
  So an ACK/update can be observed and still prove no downstream side effect.

Installed-client native proof tightens this from "weak" to "specifically
ambiguous":

```text
0x00896F70  run-function resolver
  lookup miss          -> 0x008970ED call 0x00894090
  owner/context miss   -> 0x0089722B call 0x00894090
  lookup success       -> 0x006DE1E0 -> 0x00CD0940

0x00894090  EventUpdate/fallback emitter
  -> 0x0075E670
    writes opcode 0x012E
    writes compact size 0x68
    copies 0x40 bytes from the param vector
    -> 0x004D6D30 send
```

So the client can ACK a `0x0130 RunEventFunction` envelope from a resolver
fallback path before `RaidFst0Dungeon03.relogin` has a chance to call
`desktopWidget:openRaidDungeonExecutionWidget(...)`.

Success-path send status:

- `0x00897152` calls `0x006DE1E0`, then `0x00CD0940`, then `0x00CD0A00`.
- `0x00CD0940` calls `0x00CCDDA0`, `0x00CD7A30`, and `0x00CCF9B0`; no direct
  send builder is present in that body.
- Byte-level direct-call scan results from the installed PE:
  `0x0075E670` has one direct caller (`0x0089410A`), `0x00894090` has fallback
  callers including `0x008970ED` and `0x0089722B`, and direct calls to
  `0x004D6D30` are confined to the `0x0075/0x0076` packet-builder cluster.
- No direct call from the `0x00CC0000..0x00CEFFFF` success/Lua-dispatch cluster
  to `0x004D6D30`, `0x0075E670`, or `0x00894090` was found.

Therefore a success-path ACK may still exist indirectly, but it is not
statically proven here. For this bug, the stronger runtime proof is the success
branch itself (`0x0076C220 -> 0x0089E260 -> 0x00896F70 -> 0x00897152 ->
0x006DE1E0/0x00CD0940`) plus subsequent widget command emission.

C-decompile cross-check:

- `Client Sourcecode Decomp/ffxivgame.exe.c` resolves
  `FUN_00cccd80` as a boolean predicate in this same success-cluster family.
  Its false branch can clear the receiver/node byte at `param_2+0x7E` and
  return `false`.
- Nearby C output calls `FUN_00cccd80(param_2, param_2)` only after checking
  `param_2+0x7F` in the same readiness family. This corroborates the
  installed-binary hook plan around `+0x7F`, `+0x7E`,
  `0x00CCCD80`, and the conditional `0x00CCEE30` call.
- This C output still does not name the Lua method resolver or prove that
  `"relogin"` was invoked. Treat it as gate evidence, not as proof of the Lua
  body.

Nearby installed-client send builders:

| Builder | Opcode/size | Current interpretation |
| --- | --- | --- |
| `0x0075E670` | `0x012E`, compact `0x68` | client EventUpdate/fallback ACK emitted by `0x00894090` |
| `0x0075E770` | `0x012F`, compact `0x38` | client-side Kick/Event lane response helper |
| `0x0075E860` | `0x0130`, compact `0x20` | client-to-server compact event helper, not the server-to-client `RunEventFunctionPacket` |
| `0x0075E8D0` | `0x0130`, compact `0x20` | second compact client `0x0130` helper |
| `0x0076E3F0` loop body | `0x012D`, compact `0xC8` | client EventStart-ish builder; still needs a concrete widgetCreate call-site tie |

Do not confuse the compact client-side `0x0130` builders with the local
server-to-client `RunEventFunctionPacket` shape (`0x2B8`) decoded by
`LuaActorImpl` slot 57.

Current consequence:

```text
0x0130 relogin(...) sent
0x012E ACK/update returned
no 24228 / no 0x012D WidgetOpenCommand
```

still leaves both of these alive:

1. native `0x0130` receiver accepted or ACKed without running the Lua body;
2. Lua body ran, but DesktopWidget/commandAboutWidget refused before
   `_executeCommand` produced a client-to-server command event.

Minimal decisive trace:

| First hit/miss | Meaning |
| --- | --- |
| Hit fallback `0x008970ED` or `0x0089722B -> 0x00894090 -> 0x0075E670`, no hit at `0x00897152` | `0x0130` was ACKed from resolver/not-ready fallback. Do not debug DesktopWidget yet. |
| Hit `0x00897152 -> 0x006DE1E0 -> 0x00CD0940`, but no `RaidFst0Dungeon03.relogin` hook | Native success path reached, but the Lua method resolver/body is still missing. Continue at `0x00CCCD80` / `0x00CCEE30`. |
| Hit `RaidFst0Dungeon03.relogin`, no `DesktopWidget.commandCreateWidget` | Lua body ran; failure is `fadeInNowLoading`, `clearFlag`, `rootWidget[15]`, `widgetEnableFlag[5]`, parent `_isAlive`, or `openWidget` return. |
| Hit `DesktopWidget.commandCreateWidget` / `PlayerBaseClass.commandAboutWidget`, no client `0x012D` owner `0xA0F05EA4` | Command bridge refused or queued: inspect burst blocker, `_isCommandPlaying("widgetCreate")`, `getSystemCommand(24228)`, and `_executeCommand` return. |
| Client `0x012D` owner `0xA0F05EA4` appears | The failure moved past `relogin`; inspect local `WidgetOpenCommand` allow/reject and post-command widget actor/root creation. |

### 0x0130 wrapper is proven; vtable +0x24 body is not

The current native evidence proves the shared receive wrapper and object lookup
for `0x0130`, but it does not yet prove the concrete Lua method resolver body.

Source-backed receive edge:

- `tools/outputs/lpb/native_retainer_setup_submit_next_20260618/receive_opcode_dispatch_ranges.csv:24`
  maps `0x012E..0x013D` to `0x004DCFFF`.
- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/target_notes/target_004DCFFF_receive_dispatch_shared_object_vtable_handler.md:12`
  decodes the body as:

```text
edx = [ebp+8]       -- object id / owner id selector
push edx
ecx = edi           -- receive/owner context
call 0x004D9910     -- lookup in owner object map
if object == nil: exit
eax = [object.vtable+0x24]
push esi            -- payload/context
call eax
```

- `Client Sourcecode Decomp/ffxivgame.exe.c:36016` is current-C
  `FUN_004d9910`; it looks in owner `+0x17804/+0x17808`, returns null on
  miss, and returns the found node value at `node+0x10` on hit.
- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/receive_dispatch_handler_summary.csv:6`
  still lists "collect vtable owners and decode slot +0x24 implementations" as
  the next unresolved target.

So the highest-confidence native dispatch statement is:

```text
0x0130 payload reaches 0x004DCFFF
  -> lookup object by [ebp+8] in owner+0x17804 map
  -> if found, call object.vtable+0x24(payload/context)
```

The installed-binary RTTI pass makes the intended next layer more specific:
`LuaActorImpl` slot 57 is `0x0076C220`, which decodes the `0x0130` body and
constructs `StartServerOrderEventFunctionReceiver`; that receiver has vtable
`0x010574C8`, main body `0x0089E260`, queue drain `0x0089E8E0`, and readiness
reader `0x00CC72A0`. The resolver/fallback ACK chain is now identified as
`0x00896F70 -> 0x00894090 -> 0x0075E670 -> 0x004D6D30`.

The shared `+0x24` bridge is now sharper but still not finished. Most created
Application/Main-element objects use `+0x24 = 0x004D8860`. Its `0x0130` case is:

```asm
004D8963 mov  ecx, [esi+80h]
004D8969 test ecx, ecx
004D8971 add  edi, 10h
004D8974 push edi
004D8975 call 00575040

00575040 mov  ecx, [ecx]
00575042 mov  eax, [ecx]
00575044 mov  eax, [eax+0E4h]
0057504A jmp  eax
```

So the shared object does reach a slot-57 trampoline. The critical detail is
the identity of the handle at `object+0x80` when the packet arrives. Static
scan now strongly favors the "wrong lane" interpretation for this shared path:
the constructor path `0x004DAB50 -> 0x005752D0` initializes that handle as a
wrapper whose vtable is `0x00FE02AC`, and `0x00FE02AC+0xE4 = 0x0075AF00`
(`ret 4`). The real `LuaActorImpl` slot is `0x00FDFB2C+0xE4 = 0x0076C220`.
Therefore this is proven:

```text
0x0130 -> object.vtable+0x24 -> 0x004D8860 -> 0x00575040 -> handle.vtable+0xE4
```

but this is not proven for the live Toto-Rak director through this shared
handle lane:

```text
handle.vtable+0xE4 == LuaActorImpl slot 57 0x0076C220
```

No static write was found that replaces `object+0x80` with a `LuaActorImpl`
before `0x0130`. That makes `0x004D8860 -> 0x00575040 -> 0x0075AF00` a
high-confidence no-op lane for `RunEventFunction`, not proof that the Lua
method body ran. The remaining proof target is either a different native
receiver path that enters `LuaActorImpl::RunEventFunction` directly at
`0x0076C220`, or live evidence that this handle was unexpectedly swapped.
A live hook should log the `[ebp+8]` lookup id, lookup hit/miss, object pointer,
object vtable pointer, slot `+0x24` target, `object+0x80`, `[[object+0x80]]`,
and `[[[object+0x80]]+0xE4]` for the director-owned `0x0130`; separately hook
`0x0076C220` itself as the direct "Lua body can run" proof point.

Handle-wrapper follow-up from the installed binary:

- `0x005752D0` has one direct constructor caller, `0x004DABAC`, from the shared
  map-object constructor. It allocates a 4-byte handle container, resolves an
  initial object through `0x00CC9500`, then calls `0x00574700`.
- `0x00574700` allocates a `0x54` wrapper and calls `0x00769FD0`.
  `0x00769FD0` writes wrapper vtable `0x00FE02AC` and stores the resolved
  target object at wrapper `+0x04`.
- `0x00FE02AC+0xE4` is no-op `0x0075AF00`; `0x00FDFB2C+0xE4` is real
  `LuaActorImpl` `RunEventFunction` decoder `0x0076C220`.
- `0x00575390` is a notify/refresh helper, not a direct setter. Direct callers
  are `0x004D779F`, `0x004DB54F`, and `0x004DCF9C`; it resolves the current
  handle target, then calls target vtable `+0x18` with a temporary actor key.
- Static ref scan found no swap path that makes this shared
  `0x004D8860 -> 0x00575040` lane hit real `LuaActorImpl::RunEventFunction`.
  `object+0x80` install is constructor-only in the scanned region
  (`0x004DABAC call 0x005752D0`, then `mov [esi+80h], eax`), and the only later
  write found is teardown (`0x004DB71A mov [esi+80h], 0` after `0x00574900`).
- Refresh/read sites `0x004DB53E` and `0x004DCF8F` read `+0x80` and call
  `0x00575390`; they do not replace `object+0x80`.
- Raw vtable refs line up with that split: wrapper vtable `0x00FE02AC` is
  written by wrapper constructors `0x00766BDD` and `0x0076A00D`; real
  `LuaActorImpl` vtable `0x00FDFB2C` is written by ctor/dtor-like code
  `0x0075954B` and `0x007595AA`.

### 0x00CA object create/register is now the runtime-order anchor

The low `0x00CA` receive handler is not just a cosmetic spawn packet. It is the
client-side object create/register path that later shared event dispatch depends
on.

Confirmed instruction path:

- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/target_notes/target_004DCCBF_receive_dispatch_low_0x00CA_handler.md:9`
  starts the low `0x00CA` handler.
- It calls `0x004D9910`; if lookup misses, it calls `0x004D90C0`
  (`...target_004DCCBF...md:20`).
- It then sets `created_or_found_object + 0x92 = 1`
  (`...target_004DCCBF...md:21`) and calls `0x004CAF60`
  (`...target_004DCCBF...md:24`).
- `tools/outputs/lpb/native_retainer_dispatch_helpers_next_20260618/target_notes/target_004D90C0_low_0x00CA_create_register_helper.md:20`
  shows `0x004D90C0` calling validator `0x004D9030`.
- The same target note at line `32` shows the call to factory/register
  `0x00537620`.
- The same note at line `37` shows the created object vtable slot `+0x14`
  call.

`0x00537620` is decoded as an indexed runtime function-pointer factory plus a
separate post-dispatch jump table, but it still does not name the concrete
actor/director class:

- `tools/outputs/lpb/native_retainer_inner_parsers_next_20260618/low_create_register_summary.csv:3`
  says `0x00537620` dispatches through `this+0x04/+0x08` function pointers and
  post-dispatch jump table `0x0053777C`.
- Since `0x004D90C0` calls `0x00537620` with `ecx = owner+0x4ac`, the runtime
  creator vector is at `*(owner+0x4b0)` through `*(owner+0x4b4)`. The call
  target is loaded from `creator_begin + selector * 4` and called before the
  `0x0053777C` post-create action table runs.
- `tools/outputs/lpb/native_retainer_priority_inner_next_20260618/factory_register_jump_table_curated.csv:2`
  maps post-dispatch indexes `2..17` to owner slots such as `owner+0x18`,
  `owner+0x1c`, `owner+0x20`, and special index `8` via `0x004E5CA0` on
  `owner+0x38`.
- `tools/outputs/lpb/native_retainer_priority_inner_next_20260618/next_targets.csv:10`
  still marks the actual indexed creator function-pointer table as the next
  unresolved target.

Installed-client follow-up resolves that creator vector more precisely, but it
also narrows what it proves. `0x004DBF40` initializes the owner object, then
`0x004DBFA5` calls `0x0053B230` on `owner+0x4AC`. That table seeds an
Application/Main-element factory, not the final `LuaActorImpl` event-object
bridge:

| Selector | Callback | Constructor | Size | Primary vtable | Name / primary `+0x24` |
| --- | --- | --- | --- | --- | --- |
| 0 | `0x00532FC0` | `0x00532F40` | `0x94` | `0x00FA0B30` | `DaemonElement`, `+0x24=0x004D8860` |
| 1 | `0x00533040` | `0x0055F940` | `0x98` | `0x00FA4910` | `CommonResourceElement`, `+0x24=0x004D8860` |
| 2 | `0x005330C0` | `0x00566380` | `0x194` | `0x00FA47A0` | `CameraElement`, `+0x24=0x004D8860` |
| 3 | `0x00533140` | `0x00565170` | `0x120` | `0x00FA4DB8` | `CutManagerElement`, `+0x24=0x004D8860` |
| 4 | `0x005331C0` | `0x005600B0` | `0x260` | `0x00FA4AA8` | `GameManagerElement`, `+0x24=0x004D8860` |
| 5 | `0x005333C0` | `0x0055EB70` | `0x130` | `0x00FA4640` | `BootupElement`, `+0x24=0x004D8860` |
| 6 | `0x00533240` | `0x00564F80` | `0xCC` | `0x00FA4F18` | `MainElement`, `+0x24=0x004D8860` |
| 7 | `0x005332C0` | `0x00566880` | `0x104` | `0x00FA50C4` | `TargetElement`, `+0x24=0x004D8860` |
| 8 | `0x00533540` | `0x0058B4E0` | `0xEF0` | `0x00FA7C50` | `CharaElement`, `+0x24=0x0058CCA0` |
| 9 | `0x005335C0` | `0x0059EE50` | `0x208` | `0x00FAAD88` | `MapLayoutElement`, `+0x24=0x0059CED0` |
| 10 | `0x00533640` | `0x00687320` | `0x9C` | `0x00FC43D0` | `EffectElement`, `+0x24=0x004D8860` |
| 11 | `0x00533340` | `0x0055D170` | `0x98` | `0x00FA4410` | `CustomControlElement`, `+0x24=0x004D8860` |
| 12 | `0x00533440` | `0x00561190` | `0x1B8` | `0x00FA4C08` | `ScreenshotManagerElement`, `+0x24=0x004D8860` |
| 13 | `0x005334C0` | `0x0055F8B0` | `0x838` | `0x00FA42B0` | `ClientWorkElement`, `+0x24=0x004D8860` |
| 14 | `0x00533740` | `0x0066F770` | `0xFB0` | `0x00FC21C8` | `WidgetElement`, `+0x24=0x004D8860` |
| 15 | `0x005336C0` | `0x0066EB80` | `0x98` | `0x00FC2008` | `SqwtElement`, `+0x24=0x004D8860` |
| 16 | `0x005337C0` | `0x00688710` | `0x1E78` | `0x00FC5A68` | `DebugWindow`, `+0x24=0x004D8860` |
| 17 | `0x00533840` | `0x00599CB0` | `0xF0` | `0x00FA9AD8` | `LuaDebugLog`, `+0x24=0x004D8860` |
| 18 | `0x00533940` | `0x0068DDF0` | `0x100` | `0x00FC6690` | `LuaDebugSelect`, `+0x24=0x004D8860` |
| 19 | `0x005338C0` | `0x0068D510` | `0xBC8` | `0x00FC60E0` | `LuaDebugOut`, `+0x24=0x004D8860` |
| 20 | `0x005339C0` | `0x0068E4C0` | `0x94` | `0x00FC6BC0` | `LightElement`, `+0x24=0x004D8860` |
| 21 | `0x00533A40` | `0x0068E680` | `0x94` | `0x00FC70D0` | `DebugInfoElement`, `+0x24=0x004D8860` |
| 22 | `0x00533AC0` | `0x00686FB0` | `0x120` | `0x00FC4538` | `EffectDebugElement`, `+0x24=0x004D8860` |
| 25 | `0x00539940` | `0x00539890` | `0xB8` | `0x00FA1010` | `XamlElement`, `+0x24=0x004D8860` |
| 26 | `0x0053B1B0` | `0x0053AF60` | `0x280` | `0x00FA1200` | `FormElement`, `+0x24=0x004D8860` |

The fixed application bootstrap at `0x004D9110` creates selectors
`2, 1, 3, 7, 4, 12, 13, 14, 0x15, 9`, with selector `6` created on a
conditional mode/type branch. `CharaElement` slot `+0x24` (`0x0058CCA0`) covers
scene/chara opcode ranges but falls through for `0x0130`, so it is not the
Toto-Rak `RunEventFunction` receiver. This is why the remaining bridge target
is still the map-resident object returned by `0x004D9910`, not the
Application/Main element factory by itself.

Important guardrail: local `AddActorPacket.BuildPacket(sourceActorId, val)` only
proves that opcode `0x00CA` carries one local byte at `data[0]`
(`Map Server/Packets/Send/Actor/AddActorPacket.cs:28` and `:31`). The artifacts
do not prove that this local `val` byte is the native `0x0053777C` factory
index. Do not equate "local AddActor val 8" with "factory index 8" without a
runtime hook.

Follow-up narrowing on the factory selector:

- In `0x004DCCBF`, a lookup miss loads `eax = [ebp+8]` and
  `esi = [esi+0x10]`, then calls `0x004D90C0` with both values
  (`...target_004DCCBF...md:15`, `:17`, and `:20`).
- In `0x004D90C0`, the second caller argument becomes `edi` and is validated
  through `0x004D9030`; the first caller argument is loaded into `edx` and is
  the last pushed argument to `0x00537620`
  (`...target_004D90C0...md:20`, `:24`, and `:32`).
- In `0x00537620`, after its prologue, `ebx = [esp+0x24]` is the factory
  selector; the code bounds-checks it against the function-pointer table,
  calls `table[selector]`, then uses `selector - 2` for the post-dispatch jump
  table (`target_instruction_decode.csv:384`, `:408`, `:412`, `:414`, and
  `:418`).

Stack accounting makes the first argument passed from `0x004D90C0` the
`0x00537620` selector. Therefore the native factory selector is sourced from
the low receive handler's `[esi+0x10]` value on the create-miss path, while
`[ebp+8]` remains the object id/lookup id.

The missing bridge is still the exact runtime mapping from local
`AddActorPacket` payload layout to that `[esi+0x10]` value. Local callsites are
suggestive, not conclusive: actor/player/NPC spawns usually send local `val=8`,
while area/director/world spawns send local `val=0`; no recovered receive
struct proof yet ties that local byte to the native selector.

Full decoded post-dispatch store/action table. This table is not the class
creator table; it runs after the runtime creator vector has returned an object:

| Factory selector | Post-dispatch action |
| --- | --- |
| 2 | `owner+0x18 = created_object` |
| 3 | `owner+0x1c = created_object` |
| 4 | `owner+0x20 = created_object` |
| 5 | `owner+0x24 = created_object` |
| 6 | `owner+0x10 = created_object` |
| 7 | `owner+0x14 = created_object` |
| 8 | call `0x004E5CA0` on `owner+0x38` with pair from `ebp` and `created_object` |
| 9 | `owner+0x34 = created_object` |
| 10 | no owner store, shared return-only epilogue |
| 11 | no owner store, shared return-only epilogue |
| 12 | `owner+0x28 = created_object` |
| 13 | `owner+0x2c = created_object` |
| 14 | `owner+0x30 = created_object` |
| 15 | no owner store, shared return-only epilogue |
| 16 | no owner store, shared return-only epilogue |
| 17 | `owner+0x44 = created_object` |

### 0x00CB current-object switch/clear

Low `0x00CB` is the paired remove/current-object transition path:

- `tools/outputs/lpb/native_retainer_wrapper_submit_dispatch_next_20260618/target_notes/target_004DCCF6_receive_dispatch_low_0x00CB_handler.md:9`
  starts the handler.
- It calls guard `0x575750`, then looks up the object with `0x004D9910`
  (`...target_004DCCF6...md:18`).
- If the found object equals owner `+0x17838`, it calls
  `0x004D9980(0xC0000000)` (`...target_004DCCF6...md:22` and `:26`).
- It then calls the found object vtable slot `0` with arg `1`
  (`...target_004DCCF6...md:33`).

Current C agrees with the state fields:

- `Client Sourcecode Decomp/ffxivgame.exe.c:36016` is `FUN_004d9910`, which
  looks in owner `+0x17804/+0x17808` and returns the node value at `+0x10`.
- `Client Sourcecode Decomp/ffxivgame.exe.c:36054` is `FUN_004d9980`.
  Non-sentinel input looks up a new object and stores it at owner `+0x17838`;
  sentinel `0xC0000000` clears `+0x17838`. The helper tracks current and
  previous ids at `+0x1783c/+0x17840`.

This strengthens the runtime order requirement:

```text
the source/owner object must be created and registered before shared 0x0130 dispatch can call object.vtable+0x24
```

but it still does not identify the concrete `+0x24` class/vtable.

### Local spawn/order evidence

Local server order is source-proven, but it is not automatically retail order.

Current local NPC-click caveat:

- `Data/scripts/quests/dft/DftFst.lua:249` routes Bloisirant into
  `TotorakTryStartFromNpc`, and `DftFst.lua:262` ends the NPC event.
- `Data/scripts/totorak_entry.lua:13`, `:18`, `:28`, and `:32` currently enable
  the safe/debug route while skipping entry cutscene and entry widget.
- The current NPC path therefore falls into debug content, not the live
  occupancy path: `Data/scripts/totorak_entry.lua:189` creates
  `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent` with director
  `Instance/Totorak`, `:206` calls `DoZoneChangeContent`, and `:207` starts the
  debug director afterward.
- That debug start order is `AddMember(director)`, `AddMember(player)`,
  `StartDirector(true)`, `StartContentGroup` at
  `Data/scripts/totorak_entry.lua:70`. It does not set the login director before
  zone-in.

For normal actors, `Map Server/Actors/Actor.cs:353` builds spawn packets in this
order:

```text
0x00CA AddActor
event condition packets
speed
position
name
state
is-zoning false
ActorInstantiate/script bind
```

The first packet is `CreateAddActorPacket(8)` at
`Map Server/Actors/Actor.cs:356`; the script bind is last at
`Map Server/Actors/Actor.cs:363`. The overload at
`Map Server/Actors/Actor.cs:372` has the same order.

For Toto-Rak's legacy occupancy director:

- `Map Server/WorldManager.cs:2635` enters
  `AttachTotorakLegacyDutyWidgetDirector(...)`.
- `Map Server/WorldManager.cs:2646` sets the login director when requested.
- `Map Server/WorldManager.cs:2654` queues `director.GetSpawnPackets()` only
  when the attach call is allowed to send packets and the director is not
  already the content director/already spawned for that player.
- `Map Server/WorldManager.cs:2655` then queues `director.GetInitPackets()` for
  that same manual-spawn branch.
- `Map Server/WorldManager.cs:2755` builds the `noticeEvent` kick payload.
- `Map Server/WorldManager.cs:2831` sends current-event
  `RunEventFunction("relogin", player, finishTime, false)`.
- `Map Server/WorldManager.cs:2844` sends explicit director-owned fallback
  `RunEventFunction("relogin", player, finishTime, false)` with event
  `noticeEvent` type `5`.
- `Map Server/WorldManager.cs:2887` sends the current-event setup pair:
  `_setInstanceRaid(true)`, then `_loadTextDataPermanently(...)`.
- `Map Server/WorldManager.cs:2918` and `:2932` queue the `0x0132` bootstrap
  event-function names used by the local fallback.

The live party path is more specific:

- `Map Server/WorldManager.cs:2237` and `:2254` enter the live
  `StartTotorakInstanceForEntrants(..., playOpeningCutscene: true)` path.
- `Map Server/WorldManager.cs:2306` creates a `RaidDungeonSimple` content area
  with director `Occupancy/RaidFst0Dungeon03`.
- `Map Server/WorldManager.cs:2319`, `:2326`, `:2327`, and `:2330` then run
  `EnableInstanceRaidBind`, copy public spawns, `SpawnAllActors`,
  `director.StartDirector(false)`, `director.AddMember(director)`,
  `director.AddMember(entrant)`, and `director.StartContentGroup`.
- Because this path uses `StartDirector(false)`, it does not queue director
  spawn/init at that point. `Map Server/Actors/Director/Director.cs:150` and
  `:173` show that `StartDirector(true)` would queue `GetSpawnPackets()` and
  then `GetInitPackets()`.
- Before zone change, `Map Server/WorldManager.cs:2359` and `:2726` attach the
  occupancy director with `sendPackets=false` and `setLoginDirector=true`.
  `Map Server/WorldManager.cs:2644` and `:2645` show the attach order:
  `ReplacePlayerMember`, then `SetLoginDirector`.
- `Map Server/Actors/Chara/Player/Player.cs:6327` shows `SetLoginDirector`
  only sticks if the director is already owned by the player; the ownership is
  established through `Director.AddMember`/`Player.AddDirector` at
  `Map Server/Actors/Director/Director.cs:217` and
  `Map Server/Actors/Chara/Player/Player.cs:6339`.
- During zone-in, `SendZoneInPackets` queues player/area/world state first and
  then each owned director's `GetSpawnPackets()` followed by `GetInitPackets()`
  (`Map Server/Actors/Chara/Player/Player.cs:1080`, `:1106`, `:1124`,
  `:1139`).
- The player script bind includes `loginInitDirector` when set at
  `Map Server/Actors/Chara/Player/Player.cs:761`, and the generic `_0x132`
  command bootstrap is present in the player spawn before script bind
  (`Player.cs:651` and `:779`).

Best local live-path order model:

```text
create RaidDungeonSimple content area with Occupancy/RaidFst0Dungeon03
  -> add director/player to content group
  -> attach legacy occupancy director with sendPackets=false
  -> SetLoginDirector if ownership was established
zone change / SendZoneInPackets
  -> player self spawn + generic 0x0132 command bootstrap + player script bind with login director
  -> area/world/weather state
  -> owned director 0x00CA spawn/create/register
  -> owned director init/script state
opening cutscene path, if enabled
  -> direct eventNoticeCutScene(player, "rad0f300", 1, finishTime)
  -> schedule widget open later
widget open path
  -> bind/check legacy director again
  -> KickEvent noticeEvent command="relogin"
  -> current-event setup (_setInstanceRaid, _loadTextDataPermanently)
  -> current-type relogin(player, finishTime, false)
  -> explicit noticeEvent type-5 relogin fallback
  -> optional widget-container fallback
  -> only if DesktopWidget command path succeeds: client 0x012D owner 0xA0F05EA4 event widgetCreate
```

No confirmed retail packet capture was found in this pass, so this is confirmed
local order only. The current local NPC route is definitely not retail-like, and
the live path is still a local bridge/probe around the occupancy scripts.

### 24228 / WidgetOpenCommand downstream edge

The `24228` command identity is firm:

- `AI Scripts/command.csv:847` names command `24228` as "Open Widget".
- `tools/outputs/lpb/system_command_bridge_contract_20260619/static_actor_command_matrix.csv:802`
  maps it to static owner `0xA0F05EA4` and
  `/Command/System/WidgetOpenCommand`.
- `Data/scripts/commands/WidgetOpenCommand.lua:84` logs allow with
  owner `0xA0F05EA4`; line `99` logs reject with the same owner.
- `Map Server/PacketProcessor.cs:768` has the local fallback mapping
  `24228 => WidgetOpenCommand`.

Therefore, after a successful

```text
_executeCommand("widgetCreate", player:getSystemCommand(24228), ...)
```

the next server-visible edge should be:

```text
0x012D EventStart
  trigger = player actor id
  owner   = 0xA0F05EA4
  event   = "widgetCreate"
  path    = /Command/System/WidgetOpenCommand
```

Recovered command bridge details:

```lua
-- tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget.lua:27
DesktopWidget.commandCreateWidget(self, widgetName, cancelFlag, ...)
  -> player:commandAboutWidget(player:getSystemCommand(24228),
                               cancelFlag,
                               widgetName,
                               ...)
```

`PlayerBaseClass.getSystemCommand(id)` is minimal:

```lua
if not _getStaticActor(id):isEnabled() then
  return nil
end
return _getStaticActor(id)
```

So the first command-edge precondition is that static actor `24228` is enabled.
`DesktopWidget.commandCreateWidget` does not use the safer
`DesktopWidget.getSystemCommand` wrapper, which separately returns
`nil,index,false` when the command actor is nil or not alive.

`PlayerBaseClass.commandAboutWidget(commandActor, cancelFlag, ...)` then does:

```text
serverTime = worldMaster:_getServerTime()
if widgetCommandBurstBlocker != 0 and serverTime < widgetCommandBurstBlocker and not cancelFlag:
  return false
commandName = getCommandName(commandActor)
if not cancelFlag and _isCommandPlaying(commandName):
  return false
if cancelFlag:
  _cancelCommand(commandName)
widgetCommandBurstBlocker = serverTime
if cancelFlag:
  recordRequestInformation()
return _executeCommand(commandName, commandActor, ...)
```

No visible Lua-side `_canExecuteCommand("widgetCreate")` call exists in this
path. `_canExecuteCommand` appears in the generic `canCommand` path, while the
direct widget path reaches `_isCommandPlaying` and `_executeCommand`.
`getCommandName` is decompiler-damaged around the `WidgetOpenCommand` branch,
so the resolved native command name should be logged live even though the rest
of the widget stack and cancel/reject handlers strongly imply `widgetCreate`.

The recovered client `WidgetOpenCommand.command` body is also tiny:

```lua
require("/Widget/" .. widgetName)
return true
```

That means `/Widget/RaidDungeonExecutionWidget` loading is downstream of the
command event; if the server never sees `0x012D owner=0xA0F05EA4`, the failure
is earlier than this command body or inside native `_executeCommand_cpp`.

Native command bridge status:

- The recovered Lua bridge bodies are only shims:
  `_executeCommand_inl -> "_executeCommand_cpp"`,
  `_isCommandPlaying_inl -> "_isCommandPlaying_cpp"`, and
  `_canExecuteCommand_inl -> "_canExecuteCommand_cpp"`
  (`tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass_u.lua:139`
  and `tools/outputs/lpb/native_boundary_scan_20260617/lua_native_bridge_inventory.csv:134`).
- Prior IDA/export notes label `_executeCommand` registrar `0x0073F080`,
  `_canExecuteCommand` registrar `0x00730C00`, shared descriptor builder
  `0x0073D1E0`, and `_executeCommand` vtable-slot-`+0xA8` thunk `0x006DE650`
  (`tools/ida_export_hamlet_context.idc:230`, `:289`, and `:291`).
- `docs/instance_cutscene_decomp_findings_2026-06-10.md:784` says
  `sub_753F90` registers the general command methods and that
  `_executeCommand (0x0073F080)` installs handler `0x006DE650`, a vtable thunk
  to slot `+0xA8`.
- The installed binary now identifies the native `0x012D` command/event packet
  builder below `_executeCommand`: `0x00776760` writes opcode `0x012D`, compact
  size `0xC8`, copies the event name at `+0x29`, copies `0x80` bytes of params
  at `+0x49`, and is sent by the immediate command path through `0x004D6D30`.
- `_isCommandPlaying_cpp` and `_canExecuteCommand_cpp` still remain diagnostic
  native bodies for this path; `commandAboutWidget` does not visibly call
  `_canExecuteCommand` before `_executeCommand`.

Best native breakpoints under `commandAboutWidget`:

```text
0x0073F080  _executeCommand registrar / bridge setup
0x006DE650  _executeCommand vtable slot +0xA8 thunk
runtime [ecx] at 0x006DE650, then [[ecx]+0xA8]
  0x00FDFB2C -> 0x00759C20 generic LuaActorImpl path
  0x00FD785C -> 0x0070A010 MyPlayer command path
0x00730C00  _canExecuteCommand registrar, diagnostic only for this path
0x0073D1E0  shared command descriptor builder
```

Installed-binary disassembly update
(`C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe`,
image base `0x00400000`) sharpens that split:

```asm
; 0x006DE650, _executeCommand native thunk
mov eax, [ecx]
mov eax, [eax + 0xA8]
jmp eax

; nearby command thunks
0x006DE660 -> vtable +0xAC
0x006DE670 -> vtable +0xB0
0x006DE680 -> vtable +0xB4
0x006DE690 -> vtable +0xB8

; 0x006DE6A0, _canExecuteCommand native thunk
mov eax, [ecx]
mov eax, [eax + 0xBC]
jmp eax
```

Installed-binary RTTI/vtable refinement:

```text
LuaActorImpl
  TypeDescriptor 0x01270B10
  vtable         0x00FDFB2C
  +0xA8          0x00759C20
  +0xBC          0x00759D10

PlayerBase
  TypeDescriptor 0x012BFA48
  vtable         0x00FD5E04
  +0xA8          0x006DE8A0  ; ret 4 base no-op
  +0xBC          0x006DE8F0  ; ret 4 base no-op

MyPlayer
  TypeDescriptor 0x012C19A4
  vtable         0x00FD785C
  +0xA8          0x0070A010
  +0xBC          0x00704AA0
```

So the runtime `ecx` at `0x006DE650` matters. If it is a generic
`LuaActorImpl`, `_executeCommand` enters `0x00759C20 -> 0x008A44D0 ->
0x00703F60`. If it is the concrete player object (`MyPlayer`), the slot target
is `0x0070A010`, which validates command/event parameters and eventually calls
the player event/script dispatcher path `0x00898480`. `PlayerBase`'s base
implementation is only `ret 4` and should not be the live Toto-Rak player path.

The `MyPlayer` path below `0x0070A010` now has a useful split:

```text
0x0070A010
  -> validate current command/event context and command args
  -> 0x00898480
       if command object vtable +0x1C() returns 1: 0x00897310 immediate path
       otherwise:                                0x00896510 queued path
```

Immediate path:

- `0x00897310` calls `0x0075E3A0` or `0x0075E510`, depending on the command
  state byte.
- `0x0075E3A0` and `0x0075E510` both call `0x00776760`, then send through
  `0x004D6D30`.
- `0x00776760` is the compact EventStart builder:

```asm
00776786 mov [eax], 012Dh
0077678C mov [eax+04h], 0C8h
00776796 copy 0x20 bytes to [eax+29h]   ; event name
007767BE copy 0x80 bytes to [eax+49h]   ; Lua/event params
```

Queued path:

- `0x00896510` builds/enqueues a receiver/work item, calls `0x008963F0`, and
  returns `true`, but it does not call `0x004D6D30` in that function body.
- Therefore `_executeCommand(...) == true` is not same-frame proof that
  `0x012D` hit the wire unless the `0x00897310` branch is observed. It can also
  mean queued native acceptance.

`0x00759D10` is the generic `LuaActorImpl` `_canExecuteCommand` body: it calls
through `[ecx+8].vtable+0x64` and returns the byte result. The MyPlayer
`_canExecuteCommand` override at `0x00704AA0` first checks `this+0x5C` and can
return false through the command-result writer path. This remains diagnostic for
`commandAboutWidget`, because the visible Lua widget path does not call
`_canExecuteCommand`.

`0x0073F080` is therefore not the command body. It registers/builds the Lua
bridge around thunk `0x006DE650`: it loads `esi = 0x006DE650`, calls helper
`0x00728B70`, calls descriptor builder `0x0073D1E0`, then installs the bridge
through `0x00726720`. `0x00730C00` does the same class of work for
`_canExecuteCommand` with thunk `0x006DE6A0` and install helper `0x007267D0`.

The shared descriptor builder at `0x0073D1E0` initializes a caller-provided
vector, reserves three entries, then pulls candidate descriptors from offsets
`0x0C`, `0x10`, and `0x24` of a runtime table when the table has enough
entries. This supports "bridge argument descriptor setup", not packet emission.

`0x00753F90` is a registration table driver. It calls, in order, the registrars
for `_executeCommand`, `_executeTalk`, `_executeEmote`, `_callServerOnCommand`,
`_doServerOnCommand`, `_canExecuteCommand`, and more sibling command methods.
It is not the per-call `widgetCreate` send path.

Practical implication: when Lua reaches
`player:_executeCommand("widgetCreate", commandActor, ...)`, the first native
edge to hook is `0x006DE650`. At that instant `ecx` is the concrete player
native object; read `[ecx]`, then hook/call-trace the target at
`[[ecx] + 0xA8]`. The previous static labels prove the bridge and vtable slot,
and the installed binary now names the MyPlayer branch and native compact
`0x012D` builder. Hook `0x00898480`, `0x00897310`, `0x00896510`, `0x00776760`,
and `0x004D6D30` to distinguish immediate wire send from queued native
acceptance.

Cancel/reject cleanup is narrow:

- `PlayerBaseClass._onCommandCancel` and `_onCommandRejected` call
  `processCancelCommandAboutWidget("widgetCreate")`.
- `processCancelCommandAboutWidget("widgetCreate")` calls
  `desktopWidget:processWidgetCreateAborted()`.
- `processWidgetCreateAborted()` loops root widget slots `1..17` and clears
  only entries whose actor exists but `_isAlive() == false`. It does not clear
  a live but wrong/stale `rootWidget[15]`.

If no `0x012D` appears after the `0x0130 relogin` ACK, the current best split is:

```text
no relogin Lua body:
  native 0x0130 receiver/readiness/owner resolver accepted or ACKed without the side effect

relogin body reached, no command edge:
  rootWidget[15] stale/non-nil before getWidget purge
  widgetEnableFlag[5] false
  desktopWidget parent not alive
  getSystemCommand(24228) nil/disabled/not alive
  widgetCommandBurstBlocker active
  unexpected commandName != widgetCreate despite bytecode expectation
  _isCommandPlaying(commandName) true
  _executeCommand(commandName, 24228, ...) returned false

executeCommand true, still no 0x012D:
  missing native _executeCommand_cpp internals below recovered Lua;
  true may mean accepted/queued, not necessarily network event emitted
```

Packet-observation caveat: the local route-probe log for event starts is gated
by `debug_event_route_probe` and defaults false
(`Map Server/ConfigConstants.cs:192`). Absence of that debug line is not
absence of `0x012D`; the raw packet log or `PacketProcessor` receive log must
confirm whether `0x012D owner=0xA0F05EA4` actually arrived.

Also, `0x0132 widgetCreate` is bootstrap/registration evidence, not proof of
each widget open. Local spawn queues general command event names at
`Map Server/Actors/Chara/Player/Player.cs:659` through `:661`, and the Toto-Rak
fallback queues similar names at `Map Server/WorldManager.cs:2905` through
`:2908`. The per-open command edge is still `0x012D` from `_executeCommand`.

### Desktop mode correction

Mode `64` should not be treated as a proven slot-15/type-5 widget enabler.

Confirmed Lua/bytecode evidence:

- `tools/outputs/lpb/content_systems_confidence_20260615/luac_constants_selected.csv:2980`
  puts `61/62/63/64` in the same `getModeLevel` group.
- `...luac_constants_selected.csv:3008` and `:3036` list
  `setDesktopModeDetail` constants `16, 61, 62, 63, 126, 127, 32, 8, 120`,
  but not `64`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:4499`
  and nearby decomp branches show `8/16/61/63/32` as the visible branches that
  set the slot-15 family enable boolean; `62/120/126/127` do not in that pass,
  and no `64` branch is visible before default return.

Further correction: "type 4" is an older/zero-based family label, not Lua array
index `4`. `WidgetBaseClass.getWidgetTypeByIndex(15)` returns `5` in raw
bytecode, and `openWidget` / `openWidgetYield` index
`work.widgetEnableFlag[type]`. Therefore slot `15` is gated by
`widgetEnableFlag[5]`. Probe `[5]` as primary; `[4]` is only a legacy
diagnostic while comparing older notes.

Explicit mode-to-flag outcome after `setDesktopModeDetail(mode, level)`:

| Mode | Level | `widgetEnableFlag[1..7]` | Slot-15 outcome |
| --- | --- | --- | --- |
| 8 | 1 | `[T,T,T,T,T,T,T]` | enabled |
| 16 | 2 | `[F,F,F,T,T,F,T]` | enabled |
| 32 | 2 | `[F,F,F,T,T,F,T]` | enabled |
| 61 | 3 | `[T,F,F,T,T,T,T]` | enabled |
| 62 | 3 | `[T,F,F,F,F,T,F]` | disabled |
| 63 | 3 | `[T,F,F,T,T,T,T]` | enabled |
| 64 | 3 | no visible flag-write branch | stale/unchanged |
| 120 | 1 | `[T,T,T,F,F,T,T]` | disabled |
| 126 | 4 | `[F,F,F,F,F,F,T]` | disabled |
| 127 | 5 | `[F,F,F,F,F,F,F]` | disabled |

`orderDesktopWidgetMode` computes/stores the mode level and only applies the
detail branch when the new level is at least the current level. Mode `64` is in
`getModeLevel` as level `3`, but no visible `setDesktopModeDetail` flag-write
branch was found for `64`, so live behavior depends on the prior flag state.

So a live probe should log:

```text
work.mode
work.modeLevel
desktopMode[1..5]
widgetEnableFlag[5]
widgetEnableFlag[4] legacy diagnostic
```

at `RaidFst0Dungeon03.relogin` and at `DesktopWidget.openWidgetYield`, rather
than assuming mode `64` makes slot-15/type-5 widget creation legal.

### Caravan, guildleve, hamlet, and instance controls

The working caravan widget is useful, but it does not prove the full Toto-Rak
path. It proves a narrower lane:

```text
CaravanGuardDirector.processUIUpdate(step 70, "step")
  -> desktopWidget:processUpdateContentsInformation(self, "start")
  -> actor:getKindContentsInformation() == 2
  -> updateContentsInformation(actor, 2, "ChocoboCaravanWidget", "start")
  -> openContentsWidget(contentsIndex, 2, actor, "ChocoboCaravanWidget", actor)
  -> openWidget(widgetIndex 6..9, "ChocoboCaravanWidget", nil, nil, true, actor)
  -> commandCreateWidget(...)
  -> player:commandAboutWidget(player:getSystemCommand(24228), false, ...)
```

Source-backed content-widget details:

- `CaravanGuardDirector.getKindContentsInformation()` returns `2`.
- `DesktopWidget.processUpdateContentsInformation` maps kind `1` to
  `GuildleveExecutionWidget` and kind `2` to `ChocoboCaravanWidget`.
- `getFreeContentsIndex()` / `getContentsIndex()` use `work.widgetOwner[1..4]`
  and `work.contentsType[1..4]`; content widgets are owner-scoped, not hard
  rooted at slot `15`.
- `getContentsWidgetIndex(contentsIndex)` returns `contentsIndex + 6 - 1`, so
  content slots are `6..9`.
- `openContentsWidget(index, type, owner, widgetName, ...)` validates
  `checkActor(owner)`, rejects conflicting `widgetOwner[index]` or
  `contentsType[index]`, then calls
  `openWidget(index + 5, widgetName, nil, nil, true, ...)`.
- For caravan start, the variadic arg passed through is the caravan director
  actor itself. `ChocoboCaravanWidget.init(actor)` then pulls
  `finishTime, town, placeStart, placeEnd, name1, name2, name3` through
  `actor:getUIDataOpen()`.
- Caravan updates are `processUpdateContentsInformation(self, "update", 1)`
  for progress, `2` for status plus markers, and `3` for HP. Finish/finalize
  calls `processUpdateContentsInformation(self, "finish")`.

Guildleve is the same content-information family, not a direct raid-widget
open:

```text
GuildleveBaseClass.processUIInit / processUpdateWork
  -> desktopWidget:processUpdateContentsInformation(self, "start" | "update" | "cancel", ...)
  -> getKindContentsInformation() == 1
  -> GuildleveExecutionWidget
  -> content slot 6..9
```

So caravan/guildleve working proves:

- `desktopWidget` exists and can execute the content-information HUD lane.
- `widgetEnableFlag[5]` is likely enabled in the live mode if the caravan HUD
  opens through this Lua `openWidget` lane, because content slots `6..9` share
  the same recovered widget-family gate as slot `15`.
- `commandCreateWidget -> commandAboutWidget(24228)` can work for at least one
  content HUD, if the live packet trace shows a `0x012D` / `24228` widgetCreate
  event for caravan.
- The SQWT/UI side can render content HUDs, timers, progress, and marker-driven
  state.

It does not prove:

- `0x0130` actually dispatched `RaidFst0Dungeon03.relogin`.
- `RaidFst0Dungeon03.relogin` reached its widget branch after fade-in.
- `rootWidget[15]` was nil or alive-clean at the moment of Toto-Rak relogin.
- `openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1,
  finishTime)` survived the slot-15 `isWidgetExec` and parent/alive checks.
- `RaidDungeonExecutionWidget.init(1, finishTime)` was created.
- The local `WidgetOpenCommand` allow/reject branch for
  `RaidDungeonExecutionWidget` and private zone `159` was reached.

Hamlet is a closer slot-15 control than caravan:

```lua
function DesktopWidget.openHamletExecutionWidget(self)
  self:openWidgetYield(15, "HamletDefenseWidget", nil, nil, false)
  self:openWidgetYield(16, "HamletDefensePopupWidget", nil, nil, true)
end
```

But local Hamlet has two different lanes that must not be conflated:

- recovered/client lane:
  `InstanceRaidHamletDefense.openInformationWidget() ->
  desktopWidget:openHamletExecutionWidget() -> slot 15/16`;
- local probe/container lane:
  `_setInstanceRaid`, `_loadTextDataPermanently`, Hamlet score natives,
  optional `_loadForm`, then `_reserveWidgetContainer`,
  `_isExistWidgetInWidgetContainer`, `_getWidgetFromWidgetContainer`,
  `_createWidgetInWidgetContainer`, `_getWidgetFromWidgetContainer`.

The local C# probe uses `HamletDefenseWidgetIndex = 0x1B`, not recovered
DesktopWidget slot `15`. Earlier Hamlet decomp treats that `0x1B`
`_reserveWidgetContainer` / `_createWidgetInWidgetContainer` route as a
detached generic-container experiment, not the retail HUD home. The recovered
HUD home is `openHamletExecutionWidget() -> openWidgetYield(15,
"HamletDefenseWidget", nil, nil, false)`, created hidden, plus slot `16`
popup. Therefore a local Hamlet HUD appearing via `[HamletUiWidget]` /
`[HamletUiProbe]` / `[HamletUiPacket]` proves only the SQWT/form/container
experiments and Hamlet data packets; it is not proof that recovered
`openWidgetYield(15, "HamletDefenseWidget", ...)` succeeded. Only a Hamlet
trace that reaches `openHamletExecutionWidget` and then emits
`0x012D owner=0xA0F05EA4 commandId=24228 event=widgetCreate` is a true slot-15
control. Even then, it still does not prove the `RaidDungeonExecutionWidget`
initializer or Toto-Rak's old occupancy `0x0130` dispatch.

Modern instance raids are the closest recovered control:

```lua
function InstanceRaidBaseClass.reloginEvent(self, contentID, startTime, finishTime, eventType, clearFlag)
  self.instanceRaidWork.contentID = contentID
  self.instanceRaidWork.eventType = eventType
  self.instanceRaidWork.clearFlag = clearFlag
  self:processLogin(true)
  worldMaster:_getMyPlayer():_fadeInNowLoadingForNoticeEventJustInArea()
  worldMaster:_getMyPlayer():_fadeIn(1)
  self:_wait(1)
  if clearFlag == false then
    self:openInformationWidget()
  end
  self.instanceRaidWork.initFlag = true
end

function InstanceRaidBaseClass.openInformationWidget(self)
  desktopWidget:openRaidDungeonExecutionWidget(nil, self:getContentID(), self.instanceRaidWork.finishTime)
end
```

Local modern-raid bridge caveat:

- `Data/scripts/directors/InstanceRaid/InstanceRaidBaseClass.lua` is a thin
  bridge that sends setup plus `player:RunEventFunction("reloginEvent", ...)`
  or a separate `player:RunEventFunction("openInformationWidget")`.
- `WorldManager.SendTotorakInstanceRaidRelogin` sends setup, then
  `Director.SendDirectorEventFunction(..., "reloginEvent", 1, startTime,
  finishTime, 1, clearFlag)`, and then always sends a separate
  `Director.SendDirectorEventFunction(..., "openInformationWidget")`.
- Recovered `reloginEvent` opens the widget only when `clearFlag == false`.
  Therefore the local modern bridge can force the widget with the separate
  `openInformationWidget` even when recovered `reloginEvent` itself would not.

As a control, modern InstanceRaid is excellent only if the trace distinguishes:

```text
[TotorakInstanceRaid] Sent reloginEvent ...
DirectorRunEventFunction function=reloginEvent
DirectorRunEventFunction function=openInformationWidget
[WidgetOpenBoundary] owner=0xA0F05EA4 commandId=24228 event=widgetCreate
[WidgetOpenCommand] allow/reject candidate=RaidDungeonExecutionWidget
```

If modern `reloginEvent/openInformationWidget` reaches the `24228` boundary but
old `RaidFst0Dungeon03.relogin` does not, the downstream slot-15
`RaidDungeonExecutionWidget` path is probably good and the remaining suspect is
old occupancy `0x012F/0x0130` ownership/readiness/order. If neither modern nor
old reaches `24228`, inspect desktop slot-15 readiness and
`commandAboutWidget(24228)` before blaming the occupancy script.

Content-lane split:

| Path | Dispatch/open lane | Slot/index lane | State owner |
| --- | --- | --- | --- |
| Guildleve | `processUpdateContentsInformation`, kind `1`, then `openContentsWidget` | content index `1..4` maps to widget index `6..9` via `getContentsWidgetIndex(index) = index + 5` | `widgetOwner[index]`, `contentsType[index]`, content actor work |
| Chocobo caravan | `processUpdateContentsInformation`, kind `2`, then `openContentsWidget` | same content indices `1..4` / widget indices `6..9` | caravan actor/work fields such as finish time, route, progress, chocobo state |
| Recovered Hamlet | `openHamletExecutionWidget` | root slot `15` for `HamletDefenseWidget`, root slot `16` for popup | root-widget state, not content-owner slots |
| Toto-Rak | `RaidFst0Dungeon03.relogin -> openRaidDungeonExecutionWidget` | root slot `15` for `RaidDungeonExecutionWidget` | root-widget state plus `24228/widgetCreate` |
| Modern InstanceRaid | `InstanceRaidBaseClass.openInformationWidget -> openRaidDungeonExecutionWidget` | same root slot `15` / same `RaidDungeonExecutionWidget` | instance-raid director state |

Why instance widgets are slot `15`:

- `DesktopWidget` initializes `work.rootWidget` as a 17-entry root-widget
  array, separate from the 4-entry content-owner arrays `widgetOwner` and
  `contentsType`.
- Do not conflate index domains. `work.widget[1..24]` is the static-widget
  array used by `getStaticWidget`; `work.rootWidget[1..17]` is the dynamic
  root-widget array used by `openWidget`, `openWidgetYield`, `getWidget`, and
  `isWidgetExec`.
- Static index `15` is `ConsoleIconTrayWidget`, and static index `16` is
  `StatusEffectWidget`. Those are unrelated to dynamic root slot `15`
  `RaidDungeonExecutionWidget` / `HamletDefenseWidget` and dynamic root slot
  `16` `HamletDefensePopupWidget`.
- `openContentsWidget` never chooses slot `15`; it maps content index `1..4`
  to widget index `6..9` via `getContentsWidgetIndex(index) = index + 5`.
- `openRaidDungeonExecutionWidget` always opens root slot `15` as
  `RaidDungeonExecutionWidget` and passes only `contentId, finishTime` through
  to widget init. The first/display arg is discarded by the connector.
- `closeRaidDungeonExecutionWidget` closes both root slots `15` and `16`.
  That matches Hamlet, where `openHamletExecutionWidget` opens slot `15` as
  `HamletDefenseWidget` and slot `16` as `HamletDefensePopupWidget`.
- `InstanceRaidBaseClass.openInformationWidget` uses
  `openRaidDungeonExecutionWidget(nil, contentId, finishTime)`. The recovered
  modern subclasses for Aurum Vale, Cutter's Cry, Dark Moogle, Ifrit, Garuda,
  WhiteGeneral, BeaconBattle, and Hyper Ifrit extend this base and do not
  override `openInformationWidget`.
- `InstanceRaidHamletDefense` is the recovered exception: it extends the same
  base lifecycle, but overrides `openInformationWidget` to call
  `openHamletExecutionWidget()`. So Hamlet proves slot `15` is a general
  instance execution layer, not a Toto-Rak-only hardcode.
- Raw Lua 5.1 proto re-check maps slots `6`, `7`, `8`, `9`, `15`, and `16` to
  widget type `5`. That means `widgetEnableFlag[5]` is the shared family gate,
  while the slot number still determines root-vs-content ownership and
  placement.

Dynamic overlay lane cross-check:

| Dynamic root slot | Recovered opener | Meaning |
| ---: | --- | --- |
| `13` | `openPublicEffectWidget(effectId) -> openWidget(13, "SplashEffectWidget", effectName, nil, true, ...)` | Public/duty splash effects such as raid start, failure, duty commenced/complete. |
| `14` | `openCutSceneEffectWidget(effectId) -> openWidget(14, "SplashEffectWidget", effectName, nil, true, ...)` | Cutscene/title/location effect lane. Hamlet title widgets `12..14` also route here as splash templates. |
| `15` | `openRaidDungeonExecutionWidget(...) -> openWidgetYield(15, "RaidDungeonExecutionWidget", ...)` or `openHamletExecutionWidget() -> openWidgetYield(15, "HamletDefenseWidget", ...)` | Instance execution HUD lane. |
| `16` | `openHamletExecutionWidget() -> openWidgetYield(16, "HamletDefensePopupWidget", ...)` and `closeRaidDungeonExecutionWidget()` also clears it | Instance companion/popup lane paired with slot `15`. |

This explains the old raid sequence: Toto-Rak opens the execution timer in
dynamic root slot `15`, then `processUpdateGeneralNotificationDialog(3, nil,
nil, 1)` opens the raid-start splash in dynamic root slot `13`. Those are
parallel overlay lanes, not competing widget ids.

Concrete `24228/widgetCreate` argument shape for these lanes:

```text
DesktopWidget.openWidgetLocal(name, alias, parent, index, visible, ...)
  alias defaults to name
  parent defaults to desktopWidget
  parentInputEnable defaults true, or parent:getInputEnable() if parent is shown
  parent:_isAlive() == false -> false before commandCreateWidget
  commandCreateWidget(name, false, parent, parentInputEnable, alias, index, visible, ...)

DesktopWidget.commandCreateWidget(name, cancelFlag, ...)
  player:commandAboutWidget(player:getSystemCommand(24228), cancelFlag, name, ...)
```

So the recovered command payloads should be:

| Lane | `commandAboutWidget(24228, ...)` argument spine |
| --- | --- |
| Toto-Rak / modern raid | `false, "RaidDungeonExecutionWidget", desktopWidget, true, "RaidDungeonExecutionWidget", 15, true, contentId, finishTime` |
| Hamlet main HUD | `false, "HamletDefenseWidget", desktopWidget, true, "HamletDefenseWidget", 15, false` |
| Hamlet popup | `false, "HamletDefensePopupWidget", desktopWidget, true, "HamletDefensePopupWidget", 16, true` |
| Public raid/duty splash | `false, "SplashEffectWidget", desktopWidget, true, effectWidgetName, 13, true, optionalStyleArg` |
| Cutscene/title splash | `false, "SplashEffectWidget", desktopWidget, true, effectWidgetName, 14, true, optionalStyleArg` |

For Toto-Rak specifically, `openRaidDungeonExecutionWidget(2123, 1,
finishTime)` discards `2123`, so the slot-15 payload spine should end with
`15, true, 1, finishTime`.

Post-create retention path:

```text
DesktopWidget.createWidget(widgetName, parent, ...)
  require("/Widget/" .. widgetName)
  _createActor(nil, basename(widgetName), false, parent, true, ...)

WidgetBaseClass.initCommon(...)
  loadFormData(formName)
  non-Desktop widgets start with SQWT Visibility="Hidden"
  widgetWork.common.widgetIndex = index
  widgetWork.common.visibleFlag = visible

DesktopWidget.processWidgetCreated(widget, rootFlag, ..., index, ...)
  if widget:isCreateCancel() == true:
    closeWidgetDirect(widget); return
  if rootFlag ~= true:
    return
  if rootWidget[index] == nil:
    rootWidget[index] = widget
  if widgetEnableFlag[widget:getWidgetType()] == false:
    return
  if widget:getVisibleFlag() == false:
    return
  show visible child widgets, then show the root widget
```

That path explains three otherwise confusing cases:

- `24228/widgetCreate` can succeed and still leave no visible HUD if
  `visibleFlag == false`. This is normal for `HamletDefenseWidget`, whose
  recovered open uses `openWidgetYield(15, "HamletDefenseWidget", nil, nil,
  false)`.
- A widget can be retained in `rootWidget[15]` and then not shown if
  `widgetEnableFlag[5]` is false at `processWidgetCreated` time. This is a
  post-command failure shape, distinct from the earlier pre-command
  `openWidget` no-op.
- `rootWidget[15]` being non-nil later blocks a fresh `openWidgetYield(15,
  ...)` at the `isWidgetExec(15)` check before any new `24228` can be sent.
  `getWidget(15, name)` purges dead roots, but `isWidgetExec(15)` only checks
  non-nil.

Root lifecycle helpers make that `15` retention behavior explicit:

```text
DesktopWidget.openRootWidget(index, name, parent, visible, ...)
  isWidgetExec(index) == true -> false
  openWidget(index, name, nil, parent, visible, ...)

DesktopWidget.openChildWidget(name, parentWidget, visible, ...)
  openWidget(parentWidget:getWidgetIndex(), name, nil, parentWidget, visible, ...)

DesktopWidget.setForceVisible(index, flag)
  rootWidget[index] == nil -> false
  rootWidget[index]:forceVisible(flag)
```

- `processWidgetDeleted(widget)` uses `widget:getWidgetIndex()` and clears
  `rootWidget[index]` when the retained slot points at that widget, or when the
  retained actor is already dead. This is direct proof that the create argument
  `index=15` becomes the long-lived root key.
- `processWidgetCreateAborted()` only sweeps dead `rootWidget[1..17]` after a
  widget command abort. It does not run before `openWidgetYield`'s
  `isWidgetExec(index)` guard.
- `openRootWidget` has the same root-slot occupancy guard as `openWidgetYield`.
  A stale-but-alive `rootWidget[15]` therefore refuses a fresh raid/Hamlet open
  before command `24228` is emitted.
- `openChildWidget` inherits the parent widget's `widgetIndex`, so child opens,
  root deletion, and force-visible calls all share the same index family.
- `setForceVisible(index, flag)` is post-retention only. It can affect an
  already-created root, but cannot bootstrap a missing slot `15`.
- `selectWidgetYield(widget, showFlag)` mirrors the visible-create path: visible
  child widgets are shown first, then the root is shown only when
  `showFlag == true`.

Mode-transition race note:

`setDesktopModeDetail(...)` begins by finishing static widget `17` and calling
`cancelWidgetCommand()`. A desktop mode transition near
`relogin -> openWidgetYield(15)` can therefore cancel a pending `widgetCreate`;
the later abort cleanup only sweeps dead retained roots. This is a plausible
ACKed-`relogin`/no-HUD shape when no durable slot-15 result remains.

Focused live trace additions:

- `rootWidget[15]`, `rootWidget[15]:_isAlive()`, and `isWidgetExec(15)` before
  and after `openWidgetYield`.
- `processWidgetDeleted`, `processWidgetCreateAborted`, `cancelWidgetCommand`,
  and `isCreateWidgetCommandPlaying` around zone-in/relogin.
- Desktop mode/modeLevel transitions around `0x0130 relogin`. Mode `61`/`63`
  are clearly type-5-friendly; mode `64` is cutscene mode by `isCutSceneMode`,
  but is not a proven widget-enable state in the visible `setDesktopModeDetail`
  branch.

Widget-container route re-check:

- `_createWidgetInWidgetContainer` is a separate native helper family wrapped
  by `createWidget2(containerIndex, parent, visibleFlag, ...)`.
- `getCreateParameter(containerIndex)` only recovers two mappings:
  `1 -> GuildleveExecutionWidget` with widget index `6`, and
  `2 -> EquipWidget` with widget index `3`.
- There is no recovered container mapping for container `15`, `0x0F`, `0x1B`,
  `RaidDungeonExecutionWidget`, or `HamletDefenseWidget`.
- Therefore the recovered retail instance/Hamlet path is dynamic
  `openWidget`/`openWidgetYield` into `rootWidget[15]`, not
  `_createWidgetInWidgetContainer`.

Mode/enable warning for slot `15`:

- `getModeLevel` recognizes modes `61`, `62`, `63`, and `64` as level `3`, but
  the visible `setDesktopModeDetail` flag-write cases include `61` and `63`,
  not `64`.
- Mode `61` and mode `63` both enable `widgetEnableFlag[5]` in the recovered
  table; mode `62` disables it; mode `64` leaves the result dependent on prior
  state unless native code fills the gap.
- Therefore a live trace around Toto-Rak should log both the current mode stack
  and `widgetEnableFlag[5]`. Slot `15` being structurally correct does not
  guarantee it is enabled in the desktop state where `relogin` runs.

Hamlet slot-15 visibility/update caution:

- `openHamletExecutionWidget` creates `HamletDefenseWidget` with visible flag
  `false`, while the popup slot `16` is created with visible flag `true`.
- `HamletDefenseWidget.init()` initializes its work arrays and controls, but
  does not call `cmdShow`.
- `InstanceRaidBaseClass._onReceiveDataPacket(3, ...)` forwards to
  `processUserMessage(...)` only after `instanceRaidWork.initFlag == true`.
- So Hamlet can correctly create root slot `15` and still show nothing until a
  later data subtype reaches `InstanceRaidHamletDefense.processUserMessage` and
  drives `cmdShow` / `cmdSetTitle` / `cmdSetTimer` / `cmdSet*` updates.

Recovered Hamlet live-HUD population map:

| Data subtype | Meaning | Slot-15/16 effect |
| ---: | --- | --- |
| `1` | Title/rank/opening state | Drives title/timer/show behavior on `HamletDefenseWidget`; this is the important one for making the hidden slot-15 shell visible. |
| `2` | Harvest table | Updates `harvestTbl[1..3]`, later expanded into the 9 gathering/bingo cells. |
| `3` | Harvest reset | Clears harvest counts and resets gathering-item cells on the slot-15 widget. |
| `4` | Field buffs | Updates six field-buff flags, then maps them into `cmdSetArmyBuff` / `cmdSetEnemyBuff` state. |
| `5` | Defense line statuses | Updates `lineStatusTbl[1..3]` and calls `cmdSetDefenseLineStatus(index, status)`. Status `1` normal, `2` danger, `3` fallen. |
| `6` | Goods/cart statuses | Updates `goodsStatusTbl[1..4]` and calls `cmdSetGoodsStatus(index, status)`. Status `1` normal, `2` danger, `3` lost. |
| `7` | Cargo target | Updates `cargoTarget` and calls `cmdSetTargetGoods(index)`; `0` is the safe/no-target value. |
| `8` | Boss flag | Sets `bossFlag = true` and drives `cmdSetBossStatus(true)`. |
| `9` | Battle value / war potential | Updates `battleValue` and drives `cmdSetWarPotentialValue(value, max)`. |
| `10` | Popup/information notice | Calls `InstanceRaidHamletDefense.dispInformation(...)`, which fetches slot `16` via `getHamletPopupWidget()` and calls `HamletDefensePopupWidget.dispInformation(...)`. |

Widget command details from `HamletDefenseWidget`:

- `cmdShow()` is just `show()`; without it the slot-15 shell remains hidden.
- `cmdSetTitle(contentId, hamletRank)` uses content ids `8`, `9`, `10` for
  Aleport, Hyrstmill, and Golden Bazaar, sets icon groups
  `988/991/994`, `989/992/995`, or `990/993/996`, and writes text owner
  `13012`.
- `cmdSetTimer(finishTime)` expects an absolute server timestamp and computes
  `finishTime - worldMaster:_getServerTime()`, with warning thresholds `300`
  and `120`.
- `cmdSetWarPotentialValue(value, max)` uses a different visual path depending
  on `isShow()`, so sending it before `cmdShow()` can update the hidden status
  bar path instead of the animated visible bar.

Boundary note: score, ranking, and tutorial widgets are separate ask/native
surfaces. The main live Hamlet HUD is the slot-15/slot-16
`processUserMessage` path above, not `0x01A8` score, `0x01A6` ranking, or a
tutorial `GenericData` opener.

Content-widget lane control:

```text
desktopWidget:processUpdateContentsInformation(actor, action, updateType)
  actor:getKindContentsInformation() == 1 -> GuildleveExecutionWidget
  actor:getKindContentsInformation() == 2 -> ChocoboCaravanWidget
  updateContentsInformation(actor, contentType, widgetName, action, updateType)
  openContentsWidget(contentsIndex, contentType, actor, widgetName, actor)
  getContentsWidgetIndex(contentsIndex) = contentsIndex + 5
```

Recovered opt-in producers:

- `GuildleveBaseClass.getKindContentsInformation()` returns `1`; its
  `processUIInit`, `processUpdateWork`, and `processUIFinalize` drive
  `start` / `update` / `cancel`.
- `CaravanGuardDirector.getKindContentsInformation()` returns `2`; step `70`
  starts the caravan HUD, progress/status/HP changes update it, and finish or
  finalize closes it.
- `DirectorBaseClass.getKindContentsInformation()` is nil/empty by default, so
  directors do not enter this lane unless they opt in.

The content lane has its own ownership guards:

- It uses `work.widgetOwner[1..4]` and `work.contentsType[1..4]`.
- It rejects a conflicting owner or content type for an occupied content index.
- It opens dynamic root slots `6..9` with `visible=true`, not root slot `15`.
- `ChocoboCaravanWidget` and `RaidDungeonExecutionWidget` both use owner
  `10051` for the content title and the same timer warning thresholds
  `300/120`, but they arrive through different slot/ownership lanes.

So caravan/guildleve is the best positive control for `widgetEnableFlag[5]`
and `commandAboutWidget(24228)`, while modern instance raid is the best
positive control for the actual root slot-15 `RaidDungeonExecutionWidget`
path.

Modern instance-raid subclass scan:

| Subclass | Override evidence | Information-widget result |
| --- | --- | --- |
| `InstanceRaidAurumVale` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidCuttersCry` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidBeaconBattle` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidDarkMoogle` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidHyperIfrit` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidLesserGaruda` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidNormalGaruda` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidNormalIfrit` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidNormalWhiteGeneral` | Empty subclass of `InstanceRaidBaseClass`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidLesserIfrit` | Overrides `processStartEvent` only; plays `GC010105`. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidLesserWhiteGeneral` | Overrides start/cutscene helpers only; plays `gc010715` and weather-aware cutscenes. | Inherits slot-15 `RaidDungeonExecutionWidget`. |
| `InstanceRaidHamletDefense` | Overrides `openInformationWidget`. | Uses slot `15` `HamletDefenseWidget` plus slot `16` `HamletDefensePopupWidget`. |

Practical interpretation:

| Evidence | Meaning |
| --- | --- |
| Caravan/guildleve opens | Type-5 content HUDs and content slots `6..9` can work. This suggests `widgetEnableFlag[5]` is likely enabled, but does not prove root slot `15`. |
| Hamlet opens through recovered `openHamletExecutionWidget` | Root slot `15` and companion slot `16` can work in an instance context, but the widget class is Hamlet-specific. |
| Modern instance raid opens `RaidDungeonExecutionWidget` | Same root slot `15`, same widget class, same `contentId/finishTime` init as Toto-Rak; remaining Toto-Rak gap becomes old occupancy event ownership/order. |
| Old Toto-Rak opens and emits `24228/widgetCreate` | Full target path is live. If the widget still does not appear after this, inspect `WidgetOpenCommand`/`processWidgetCreated` rather than `0x0130`. |

So a working caravan or guildleve HUD proves content-index widgets and generic
content UI can render, but it does not prove the root slot-15 gate, stale
`rootWidget[15]` handling, or the legacy Toto-Rak `0x0130 -> relogin` edge.

That means the best comparison ladder is:

| Probe | What it proves if it works | What remains unproven |
| --- | --- | --- |
| Caravan `ChocoboCaravanWidget` | Content-information lane, content slots `6..9`, director-actor open data, type-5 widget family, maybe `24228` if traced. | Slot `15`, `RaidDungeonExecutionWidget`, old occupancy `0x0130`. |
| Guildleve `GuildleveExecutionWidget` | Same content-information lane with kind `1`. | Same gaps as caravan. |
| Hamlet `HamletDefenseWidget` | If traced through recovered `openHamletExecutionWidget`, slot `15` root-widget lane can open in that mode/context. | Local Hamlet's `0x1B` widget-container probes are not the same proof; raid widget initializer and Toto-Rak `relogin` still remain. |
| Modern `InstanceRaidBaseClass` raid | Same `openRaidDungeonExecutionWidget(nil, contentID, finishTime)` and same `RaidDungeonExecutionWidget`. | Legacy `RaidFst0Dungeon03` event ownership/order. |
| Toto-Rak old occupancy | Full target: `0x0130 -> relogin -> openRaidDungeonExecutionWidget(2123, 1, finishTime)`. | Nothing material if `24228` and widget actor traffic appear. |

The most useful live comparison now is to log the same command edge for a
working caravan and the failing Toto-Rak relogin:

```text
DesktopWidget.processUpdateContentsInformation:
  action, updateId, actor id/name/alive, kind

DesktopWidget.updateContentsInformation / openContentsWidget:
  contentsIndex, contentsType, widgetOwner[index], getContentsWidgetIndex(index)
  widgetName, openWidget return

DesktopWidget.openWidgetYield / openWidget:
  index, widgetName, parent, visible flag, variadic args
  getWidgetTypeByIndex(index)
  widgetEnableFlag[getWidgetTypeByIndex(index)]
  rootWidget[index], isWidgetExec(index)
  desktop mode, modeLevel, desktopMode[1..5]

DesktopWidget.commandCreateWidget / PlayerBaseClass.commandAboutWidget:
  commandActor = getSystemCommand(24228)
  commandName = getCommandName(commandActor), expected "widgetCreate"
  widgetCommandBurstBlocker
  _isCommandPlaying("widgetCreate")
  _executeCommand("widgetCreate", 24228, ...) return

Packet edge:
  0x012D owner=0xA0F05EA4 / commandId=24228 / event=widgetCreate
  candidate widget name and raw payload
```

If caravan produces `24228` but Toto-Rak does not, the split is still exactly:

1. `0x0130` ACKed without executing `RaidFst0Dungeon03.relogin`;
2. `relogin` ran but slot `15` / `rootWidget[15]` / parent readiness refused
   before `commandAboutWidget`;
3. `commandAboutWidget` reached but `_executeCommand("widgetCreate", 24228,
   ...)` rejected or queued without a visible send.

If a modern instance raid produces `RaidDungeonExecutionWidget` with the same
`24228` edge, then the remaining Toto-Rak-specific suspect is old occupancy
event ownership/order/source, not the raid widget or generic widget system.

### Local bridge check: packet edges and trace cases

The local server bridge is already structured well enough to split the failure
without broad decomping.

Send-side event function lanes:

```text
Director.SendDirectorEventFunction(player, functionName, ...)
  -> RunEventFunctionPacket.BuildPacket(
       triggerActorId = player.Id,
       ownerActorId = director.Id,
       eventName = "noticeEvent",
       eventType = 5,
       functionName,
       params)

Player.RunEventFunction(functionName, ...)
  -> RunEventFunctionPacket.BuildPacket(
       triggerActorId = player.Id,
       ownerActorId = player.currentEventOwner,
       eventName = player.currentEventName,
       eventType = player.currentEventType,
       functionName,
       params)
```

So the explicit director lane is the cleanest proof target. It does not depend
on the server's current-event cache being populated with the correct owner,
name, and type after `0x012D`.

Local packet shapes match the recovered native `0x0130` offsets:

| Packet | Local builder/parser | Fields that matter |
| --- | --- | --- |
| `0x012F` | `KickEventPacket.BuildPacket` | `+0` trigger, `+4` owner, `+8` type, fixed `0x17`, fixed `0x75DC`, fixed server code `0x30400000`, event name, params at `+0x30`. `Player.KickEvent` always uses event type `5`. |
| `0x0130` | `RunEventFunctionPacket.BuildPacket` | `+0` trigger, `+4` owner, `+8` type, `+9` event name, `+0x29` function name, `+0x49` Lua params. |
| `0x012D` | `EventStartPacket` | client-to-server start has trigger, owner, server codes, unknown, type, event name, Lua params. |
| `0x012E` | `EventUpdatePacket` | client-to-server update has trigger, server codes, two unknowns, type, Lua params; there is no owner field, so the server interprets it against `player.currentEventOwner`. |
| `0x0132` | `_0x132Packet.BuildPacket` | server-to-client command/event-function bootstrap: `+0` ushort number, then up to `0x20` bytes of ASCII function name. Local my-player spawn sends `commandRequest`, `widgetCreate`, and `macroRequest` with source `player.Id` and number `0x0100`. |
| `0x0133` | `GenericDataPacket.BuildPacket` | server-to-client Lua-param payload sourced from an actor id. Local `Director.SendInstanceRaidData` uses this for modern instance-raid timer/close/message state, but it is not the `commandAboutWidget(24228)` edge. |

The content-area bind lane is also visible locally:

```text
PrivateAreaContent.EnableInstanceRaidBind()
  -> bindAsInstanceRaid = true
  -> CreateScriptBindPacket(... bindAsInstanceRaid ...)

Director.StartContentGroup()
  -> ContentGroup.Start()
  -> contentGroupWork._globalTemp.director = director.Id << 32
  -> contentGroupWork.property[0..2] = true
  -> group packets plus contentGroupWork/director and contentGroupWork/property

Character.SetCurrentContentGroup(group)
  -> charaWork.currentContentGroup = group.GetTypeId()
  -> sends charaWork/currentContentGroup
```

Those are useful state probes around zone-in, but if `0x0130 relogin` ACKs and
no `0x012D owner=0xA0F05EA4 commandId=24228` follows, missing `0x0133` or
content-group work is probably not the first blocker. The client still has not
proved it reached `commandAboutWidget`.

Local Toto-Rak startup path:

```text
StartTotorakInstanceForEntrants
  -> CreateContentAreaWithoutContentGroup(
       "/Area/PrivateArea/Occupancy/RaidDungeonSimple",
       "totorak",
       "Occupancy/RaidFst0Dungeon03")
  -> PrivateAreaContent.EnableInstanceRaidBind()
  -> SpawnAllActors()
  -> contentArea.GetContentDirector()
  -> director.StartDirector(false)
  -> director.AddMember(director)
  -> director.AddMember(players)
  -> director.StartContentGroup()
  -> PrepareTotorakInstanceRaidZoneInit
       -> defer InstanceRaidBaseClass bind until after landing
  -> DoZoneChangeContent(...)
  -> ScheduleTotorakLegacyDutyWidgetOpen

All opening-scene requests are forced to the widget-only path, and the global
Toto-Rak cutscene gate suppresses rad0f300-rad0f308.
```

The local helper scripts line up with the decompiled old occupancy shape:

```text
RaidFst0Dungeon03.onEventStarted(player, director, eventType, eventName, command, ...)
  command == "relogin"
    -> OccupancyDungeonCallCurrentRelogin(player, "totorak", finishTime, clearFlag)
    -> _setInstanceRaid(true)
    -> _loadTextDataPermanently()
    -> player:RunEventFunction("relogin", player, finishTime, false)

RaidFst0Dungeon03.relogin(player, director, finishTime, clearFlag)
  -> OccupancyDungeonSendRelogin(...)
  -> director:SendDirectorEventFunction(player, "relogin", player, finishTime, clearFlag)
```

That means the correct local payload is still:

```text
0x0130 owner = occupancy director id
eventName = "noticeEvent"
eventType = 0x05
functionName = "relogin"
params = player, finishTime, false
```

`callClientFunction` is just `player:RunEventFunction(functionName, ...)` plus
`_WAIT_EVENT`, so the client has to dispatch the native/Lua body before any
slot-15 widget command can appear.

The best runtime classifier is the local command boundary logging:

```text
[TotorakDutyWidget] Sent active-event current-type ...
[TotorakDutyWidget] Sent active-event explicit-type ...
0x012E EventUpdate
[WidgetOpenBoundary] ... owner=0xA0F05EA4 commandId=24228 event=widgetCreate ...
[WidgetOpenCommand] allow/reject ...
```

Interpretation:

| Trace result | Meaning |
| --- | --- |
| current-type `relogin` ACKs, explicit-type does not | current event context works better than explicit director ownership; inspect actor spawn/bind/readiness for the director id used by explicit `0x0130`. |
| both `relogin` calls ACK, no `[WidgetOpenBoundary]` | either `0x0130` ACKed without executing `RaidFst0Dungeon03.relogin`, or relogin executed but `openWidgetYield/openWidget/commandAboutWidget` refused before `_executeCommand("widgetCreate", 24228, ...)` sent `0x012D`. Do not spend time on `WidgetOpenCommand` yet. |
| `[WidgetOpenBoundary]` appears, then `[WidgetOpenCommand] reject` | the client reached `commandAboutWidget`; fix server-side command policy, candidate arg decoding, zone id, or `PrivateAreaContent.IsPrivate()` state. |
| `[WidgetOpenBoundary]` appears, `[WidgetOpenCommand] allow`, no UI | the slot-15 client actor/render path after command completion is suspect. Probe `rootWidget[15]`, `_createWidgetInWidgetContainer`, and `RaidDungeonExecutionWidget.init`. |
| modern `InstanceRaidBaseClass` emits `RaidDungeonExecutionWidget` with `24228` but old Toto-Rak does not | the raid widget path is OK; the old occupancy `0x012F/0x0130` owner/order/readiness path is bad. |

`WidgetOpenCommand.lua` is fail-closed but currently allows exactly
`RaidDungeonExecutionWidget` when the player is in private zone `159`. Its
allow/reject logs include the candidate index and full arg list. Therefore,
absence of `[WidgetOpenBoundary]` means the server never saw the client's
`commandAboutWidget(24228)` request at all; the failure is on the native
`0x0130` dispatch side or inside `DesktopWidget.openWidgetYield/openWidget`.

Local caravan is also now a better control case:

```text
RegionalCaravan.init(thisDirector)
  -> "/Director/CaravanGuard/CaravanGuardDirector",
     town, placeStart, placeEnd, name1, name2, name3

ChocoboCaravanDirector.InitializeRetailWork()
  -> work.town/placeStart/placeEnd/name1/name2/name3
  -> work.progressPer, work.finishTime, work.step
  -> work.chocoboStatus[], work.chocoboHPStatus[]

ChocoboCaravanDirector.SyncRetailStart()
  -> work/hp
  -> work/step with work.step and work.finishTime
  -> work/progress with work.progressPer
```

So a working caravan widget proves the local retail content-information data
lane and type-5 content widgets, especially if the trace shows its own
`0x012D` / `24228`. It still does not prove the old occupancy `noticeEvent`
dispatch path or the slot-15 `RaidDungeonExecutionWidget` lane.

### Focused Lua re-check: exact widget no-op points

The focused decompiled Lua under `tools/outputs/lpb/focused/widget` reinforces
the same split:

```lua
-- desktopwidget_connector.lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentId, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
end

function DesktopWidget.openHamletExecutionWidget(self)
  self:openWidgetYield(15, "HamletDefenseWidget", nil, nil, false)
  self:openWidgetYield(16, "HamletDefensePopupWidget", nil, nil, true)
end
```

`RaidDungeonExecutionWidget.init(contentId, finishTime)` is only:

```lua
self:setContents(contentId)
self:setTimer(finishTime)
```

`setContents` writes text id `10051` with the content id, and `setTimer`
computes `finishTime - worldMaster:_getServerTime()` before writing the timer
custom-control properties. There is no visible content-group, instance-raid, or
zone guard inside the widget's own Lua init.

The concrete pre-command no-op chain is:

```text
openWidgetYield(index, name, alias, parent, visible, ...)
  if parent == nil and isWidgetExec(index) == true:
    return nil
  parent defaults to desktopWidget
  type = getWidgetTypeByIndex(index)
  while true:
    if openWidget(index, name, alias, parent, visible, ...) == true:
      wait while isCreateWidgetCommandPlaying()
      return getWidget(index, alias or name)
    if widgetEnableFlag[type] == false:
      break
    wait 0.1
  return nil

openWidget(index, name, alias, parent, visible, ...)
  type = getWidgetTypeByIndex(index); nil => false
  widgetEnableFlag[type] == false => false
  parent == nil and rootWidget[index] ~= nil => false
  openWidgetLocal(...) == false => false
  return true

openWidgetLocal(name, alias, parent, index, visible, ...)
  alias defaults to name
  parent defaults to desktopWidget
  parent:_isAlive() == false => false
  commandCreateWidget(name, false, parent, parentInputEnable, alias, index, visible, ...) => commandAboutWidget(24228)
```

Two subtleties matter for live hooks:

- `openWidgetYield` only purges stale/dead roots through `getWidget` after a
  create attempt succeeds. The earlier `openWidget` branch checks
  `rootWidget[index] ~= nil` directly, so stale `rootWidget[15]` can block
  before any `24228`.
- `processWidgetCreated` only assigns `work.rootWidget[index] = widget` when
  the created widget is a root widget (`A2 == true`) and the slot is empty.
  If a command creates the actor but the root flag/index is wrong, the command
  can succeed without giving `getWidget(15, "RaidDungeonExecutionWidget")` a
  usable root.
- The root assignment happens before the later
  `widgetEnableFlag[widget:getWidgetType()]` and `widget:getVisibleFlag()`
  checks. So a command can create and retain `rootWidget[15]`, then return
  before showing child controls. The next retry can then die earlier at
  `isWidgetExec(15)` with no fresh `24228`.

`WidgetBaseClass` confirms how the create arguments become widget state:

```text
WidgetBaseClass._onInit(parent, inputEnable, aliasName, widgetIndex, visibleFlag, ...)
  -> initCommon(parent, aliasName, widgetIndex, visibleFlag)
       widgetWork.common.widgetName = "Window_" .. formName
       setWindowName("Window_" .. aliasName) if form/name differ
       widgetWork.common.widgetIndex = widgetIndex
       widgetWork.common.visibleFlag = visibleFlag
  -> init(select(4, ...))
```

For `openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1,
finishTime)`, the intended create/init shape is therefore:

```text
parent      = desktopWidget
inputEnable = true
aliasName   = "RaidDungeonExecutionWidget"
widgetIndex = 15
visibleFlag = true
widget init = (1, finishTime)
```

`RaidDungeonExecutionWidget.init(contentId, finishTime)` receiving `1,
finishTime` is consistent with that `select(4, ...)` boundary. A direct native
container call must not shift those values into `parent` or alias/index fields.

One recovered line in `WidgetBaseClass._onInit` that computes the
`processWidgetCreated` root flag is decompiler-damaged, so do not infer the
root/non-root decision from text alone. Live hooks should log the actual
`processWidgetCreated(widget, rootFlag, inputEnable, aliasName, index,
visibleFlag, ...)` arguments.

Exact `commandAboutWidget` hook surface for Toto-Rak:

```text
DesktopWidget.commandCreateWidget(
  widgetName = "RaidDungeonExecutionWidget",
  cancelFlag = false,
  parent = desktopWidget,
  parentInputEnable = true,
  alias = "RaidDungeonExecutionWidget",
  index = 15,
  visible = true,
  contentId = 1,
  finishTime = finishTime)

  -> player:commandAboutWidget(
       player:getSystemCommand(24228),
       false,
       "RaidDungeonExecutionWidget",
       desktopWidget,
       true,
       "RaidDungeonExecutionWidget",
       15,
       true,
       1,
       finishTime)
```

Recovered `PlayerBaseClass.getSystemCommand(24228)` first checks
`_getStaticActor(24228):isEnabled()`. If disabled, it returns `nil`, so a live
probe should log the command actor pointer/id/class before `getCommandName`.
Recovered `SystemCommandBaseClass.isEnabled()` returns `true`, and
`WidgetOpenCommand` does not override it. Therefore "disabled command" is
unlikely once static actor `24228` resolves; missing/static actor resolution or
a later native `_executeCommand` refusal are better suspects.

Recovered `PlayerBaseClass.commandAboutWidget(commandActor, cancelFlag, ...)`
does exactly:

```text
now = worldMaster:_getServerTime()
blocker = playerWork.widgetCommandBurstBlocker

if blocker ~= 0 and now < blocker and cancelFlag == false:
  return false

commandName = getCommandName(commandActor)   -- expected "widgetCreate"

if cancelFlag == false and _isCommandPlaying(commandName):
  return false

if cancelFlag == true:
  _cancelCommand(commandName)

playerWork.widgetCommandBurstBlocker = now

if cancelFlag == true:
  recordRequestInformation()

return _executeCommand(commandName, commandActor, ...)
```

So the exact no-`24228` live probes at the command bridge are:

```text
getSystemCommand(24228) result: nil/alive/enabled/class/id
getCommandName(commandActor): expected "widgetCreate"
widgetCommandBurstBlocker before, serverTime now, now < blocker?
cancelFlag: false for RaidDungeonExecutionWidget
_isCommandPlaying("widgetCreate") before execute
_executeCommand("widgetCreate", commandActor, ...) return
```

`_canExecuteCommand("widgetCreate")` remains useful diagnostic telemetry, but
the recovered `commandAboutWidget` path does not call it. It is on the generic
`canCommand` path, not the widget-open bridge.

### Highest-value runtime hooks now

Native hooks:

```text
0x004DCCBF:
  incoming source/id, lookup result from 0x004D9910, created object from 0x004D90C0, object.vtable, object+0x92

0x004D90C0 / 0x00537620:
  validator result, factory index, created object, created object.vtable, post-dispatch owner slot

0x004DCFFF:
  opcode [packet+2], trigger/source id, 0x004D9910 result, object.vtable, vtable+0x24 target

0x004D8860 case 0x0130 / 0x004D8963:
  object pointer in esi
  object+0x80 handle pointer
  packet body pointer after +0x10 adjustment
  whether case reaches 0x00575040

0x00575040:
  incoming handle pointer
  [handle] target object
  [[handle]] vtable
  [[[handle]]+0xE4] slot-57 target
  expected no-op wrapper target: 0x0075AF00
  expected real LuaActorImpl target: 0x0076C220

0x0076C220:
  direct LuaActorImpl slot-57 RunEventFunction proof
  ecx/[ecx] vtable
  packet +0 trigger/source actor
  packet +4 owner actor
  packet +8 eventType
  packet +9 eventName
  packet +0x29 functionName
  packet +0x49 Lua params

0x004D9980:
  input id, owner+0x17838, owner+0x1783c, owner+0x17840 before/after

0x0089E260 / 0x00896F70:
  StartServerOrderEventFunctionReceiver execute
  owner resolution, owner+0x5C, dispatcher+8 readiness, lookup result

0x008970ED / 0x0089722B / 0x00894090 / 0x0075E670:
  fallback EventUpdate ACK path; proves ACK without Lua method body

0x00897152 / 0x00897199:
  success path into 0x006DE1E0 and 0x00CD0940; this is stronger proof than ACK

0x00CD094A / 0x00CD0961 / 0x00CD0969:
  success-body calls to 0x00CCDDA0, 0x00CD7A30, 0x00CCF9B0

0x00CCF9B0 / 0x00CCF9E3 / 0x00CCF9F4:
  gate receiver/node +0x7F, call 0x00CCCD80, then conditionally 0x00CCEE30
  log receiver/node +0x7E as queued/clear-on-false state

0x00CCCD80 return AL:
  success predicate before likely Lua invocation path

0x00CCEE30:
  best current native candidate for the actual Lua method execution path

0x0089410A / 0x0075E728:
  fallback ACK builder call and actual send edge inside 0x0075E670
```

Client Lua/native command hooks:

```text
RaidFst0Dungeon03.relogin entry / after fade / before openRaidDungeonExecutionWidget
DesktopWidget.openWidgetYield entry
DesktopWidget.openWidget false-return branches
DesktopWidget.openWidgetLocal before parent:_isAlive and after commandCreateWidget
DesktopWidget.commandCreateWidget before commandAboutWidget
PlayerBaseClass.commandAboutWidget:
  widgetCommandBurstBlocker
  _isCommandPlaying("widgetCreate")
  _executeCommand("widgetCreate", 24228, ...) return

Post-24228 Lua widget creation:
  WidgetBaseClass._onInit entry:
    parent, inputEnable, aliasName, widgetIndex, visibleFlag, varargs
  WidgetBaseClass.initCommon return:
    widgetWork.common.widgetName
    widgetWork.common.widgetIndex
    widgetWork.common.visibleFlag
  RaidDungeonExecutionWidget.init:
    contentId, finishTime
  DesktopWidget.processWidgetCreated:
    widget, rootFlag, inputEnable, aliasName, index, visibleFlag, varargs
    rootWidget[15] before/after
    widget:getWidgetType()
    widgetEnableFlag[widget:getWidgetType()]
    widget:getVisibleFlag()
  DesktopWidget.processWidgetCreateAborted / processWidgetDeleted:
    rootWidget[15] cleanup behavior

0x006DE650 / MyPlayer 0x0070A010:
  concrete [ecx] vtable and +0xA8 target
  command actor from getSystemCommand(24228)
  command name/type args entering native path

0x00898480:
  command object vtable +0x1C result
  branch to 0x00897310 immediate send vs 0x00896510 queued accept

0x00897310 / 0x00776760 / 0x004D6D30:
  immediate EventStart builder and send
  opcode 0x012D, size 0xC8
  owner/static command id payload for 0xA0F05EA4 / 24228

0x00896510:
  queued native accept path
  queued receiver/work item pointer and later drain/send target
```

### 2026-06-23 instance / Hamlet slot-15 re-check

Fresh pass over recovered instance, Hamlet, widget, and player Lua found no
second retail instance-HUD route. The recovered root is still:

```text
Legacy Toto-Rak/Dzemael occupancy:
  RaidFst0Dungeon03.relogin(player, finishTime, clearFlag)
  RaidRoc0Dungeon01.relogin(player, finishTime, clearFlag)
    -> desktopWidget:openRaidDungeonExecutionWidget(displayId, contentId, finishTime)
    -> openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true,
                       contentId, finishTime)

Modern InstanceRaidBaseClass:
  openInformationWidget()
    -> desktopWidget:openRaidDungeonExecutionWidget(nil, getContentID(), finishTime)
    -> the same slot-15 RaidDungeonExecutionWidget lane

Hamlet:
  InstanceRaidHamletDefense.openInformationWidget()
    -> desktopWidget:openHamletExecutionWidget()
    -> openWidgetYield(15, "HamletDefenseWidget", nil, nil, false)
    -> openWidgetYield(16, "HamletDefensePopupWidget", nil, nil, true)
```

Refined points from this pass:

- `WidgetOpenCommand.command(player, widgetName, ...)` is only
  `require("/Widget/" .. widgetName); return true` in recovered client Lua.
  The Lua command class does not contain slot-15/type policy. Missing `24228`
  is earlier than the system command body.
- `WidgetBaseClass.getWidgetTypeByIndex(15)` and `16` both resolve to widget
  family `5`. Slots `6`, `7`, `8`, `9`, `15`, and `16` share that type-5
  family, which is why caravan/guildleve are useful but incomplete controls:
  they prove the family and command bridge can work, not the root-slot-15 lane.
- `DesktopWidget.openWidget` guard order is exactly:
  `getWidgetTypeByIndex(index)`, `widgetEnableFlag[type]`,
  parentless `rootWidget[index] ~= nil`, `openWidgetLocal(...)`.
  `openWidgetLocal` then checks `parent:_isAlive()` before
  `commandCreateWidget`.
- `DesktopWidget.commandCreateWidget(name, cancelFlag, ...)` delegates to
  `player:commandAboutWidget(player:getSystemCommand(24228), cancelFlag, name,
  ...)`.
- `PlayerBaseClass.getSystemCommand(24228)` returns nil if the static command
  actor is not enabled. `SystemCommandBaseClass.isEnabled()` is recovered as
  true and `WidgetOpenCommand` does not override it, so static actor resolution
  is the thing to log, not a Lua allow branch.
- `PlayerBaseClass.commandAboutWidget` has two Lua-visible pre-execute gates:
  `playerWork.widgetCommandBurstBlocker` and
  `_isCommandPlaying("widgetCreate")` when `cancelFlag == false`.
  Toto-Rak uses `cancelFlag=false`, so either gate can suppress
  `_executeCommand("widgetCreate", 24228, ...)`.
- `DesktopWidget.cancelWidgetCommand()` calls
  `player:cancelCommandAboutWidget()` with no command actor; that cancels both
  `"widgetCreate"` and `"macroRequest"` if they are playing.
  `setDesktopModeDetail(...)` calls this at mode transition start, and
  `PlayerBaseClass.processCancelCommandAboutWidget("widgetCreate")` calls
  `desktopWidget:processWidgetCreateAborted()`.
- `processWidgetCreateAborted()` only clears dead `rootWidget[1..17]`. It does
  not clear a still-alive stale `rootWidget[15]`, so the next relogin retry can
  no-op at `isWidgetExec(15)` with no new `24228`.

Hamlet-specific visibility note:

`slot 15 visible=false` is intentional for `HamletDefenseWidget`. The hidden
shell becomes visible from `processUserMessage` subtype `1`, which drives title,
timer, and `cmdShow()`. Therefore a Hamlet test can successfully create root
slot `15` and still show nothing until subtype `1` arrives. Toto-Rak is simpler:
its `RaidDungeonExecutionWidget` is created with `visible=true`, so no later
message is required for the basic timer HUD once creation succeeds.

### Dynamic root lane map after wider raid/Hamlet sweep

The useful mental model is a fixed dynamic-root lane table. Slot `15` is not a
random widget id and not a container id; it is the long-lived instance execution
root after the normal event/content/effect lanes:

| Dynamic root | Recovered use | Notes for instance debugging |
| ---: | --- | --- |
| `3` | Main-menu root widgets such as map/status/equip/config families. | General menu lane, unrelated to instance HUD. |
| `4` | Event/ask/trade/craft/bazaar lane. | `askEventModeWidgetYield`, trade and craft widgets live here. |
| `5` | Journal/cutscene replay/Grand Company status lane. | Not the duty execution timer. |
| `6..9` | Content-information widgets from `getContentsWidgetIndex(contentsIndex) = contentsIndex + 5`. | Guildleve/caravan live here through `widgetOwner[1..4]` and `contentsType[1..4]`. |
| `11` | Cutscene map root via `openMapForCutScene -> openRootWidget(11, "MapNavigationWidget", ...)`. | Cutscene utility lane. |
| `12` | Tutorial widgets. | Tutorial/event-training lane. |
| `13` | Public effect splash lane via `openPublicEffectWidget -> openWidget(13, "SplashEffectWidget", ...)`. | Raid start/fail, duty commenced/complete, caravan/GC splashes. |
| `14` | Cutscene/title splash lane via `openCutSceneEffectWidget -> openWidget(14, "SplashEffectWidget", ...)`. | Raid title/location/Hamlet title splashes. |
| `15` | Instance execution HUD: `RaidDungeonExecutionWidget` or `HamletDefenseWidget`. | The target lane for Toto-Rak, Dzemael, modern instance raids, and Hamlet main HUD. |
| `16` | Instance companion/popup lane: `HamletDefensePopupWidget`. | Paired cleanup with slot `15` through `closeRaidDungeonExecutionWidget()`. |
| `17` | Job/quest information and quest reward widgets. | Separate quest reward lane, not duty execution. |

Wider search result:

- Across recovered Lua outputs, literal `openWidgetYield(15, ...)` only resolves
  to `DesktopWidget.openRaidDungeonExecutionWidget` and
  `DesktopWidget.openHamletExecutionWidget`.
- Old occupancy raids call `openRaidDungeonExecutionWidget(...)` from
  `RaidFst0Dungeon03` and `RaidRoc0Dungeon01`.
- Modern instance raids inherit
  `InstanceRaidBaseClass.openInformationWidget -> openRaidDungeonExecutionWidget`.
- Hamlet overrides only the information widget opener and uses
  `openHamletExecutionWidget`, still on root slot `15` plus popup slot `16`.
- `PublicRaidBaseClass` and `RaidGimmickBaseClass` are recovered as thin
  `DirectorBaseClass` shells with no slot-15 widget behavior.
- `/Area/PrivateArea/Occupancy/RaidDungeonSimple` and
  `PrivateAreaOccupancyBaseClass` are also just area-class wrappers; they do not
  contain the execution-widget decision. The widget decision is in the
  occupancy/instance director Lua plus `DesktopWidget`.

This is why caravan is only a partial control. Caravan proves the type-5
content-widget family and `processUpdateContentsInformation` lane can work, but
it opens slots `6..9`, not `15`. A modern instance raid is the stronger control
for Toto-Rak because it reaches the same `RaidDungeonExecutionWidget` class,
same slot `15`, and same `contentId, finishTime` initializer shape.

### InstanceRaidBaseClass sequencing compared to old occupancy

Recovered modern instance sequencing is more patient than old
`RaidFst0Dungeon03.relogin`:

```text
InstanceRaidBaseClass.startEvent(
  cutsceneName, cutsceneOwner, modeFlag,
  contentID, startTime, finishTime, eventType, ...)
  -> store contentID/eventType/clearFlag=false
  -> setCountDownTimer(startTime, finishTime, false)
  -> processLogin(false)
  -> processStartEvent(...)
  -> executeCutScene(...) or player:_fadeInNowLoadingForNoticeEventJustInArea()
  -> player:_fadeIn(1)
  -> wait 1 second
  -> if eventType != 0: processStartEffect(); wait 1 second
  -> openInformationWidget()
  -> initFlag = true

InstanceRaidBaseClass.reloginEvent(contentID, startTime, finishTime, eventType, clearFlag)
  -> store contentID/eventType/clearFlag
  -> setCountDownTimer(startTime, finishTime, true) if startTime > 0
  -> processLogin(true)
  -> player:_fadeInNowLoadingForNoticeEventJustInArea()
  -> player:_fadeIn(1)
  -> wait 1 second
  -> if clearFlag == false: openInformationWidget()
  -> initFlag = true
```

The base data packet path is also gated:

```text
InstanceRaidBaseClass._onReceiveDataPacket(subtype, ...)
  initFlag == false -> return
  subtype 1 -> mark clear, refresh timer, closeInformationWidget()
  subtype 2 -> mark clear, stop countdown, closeInformationWidget()
  subtype 3 -> processUserMessage(...)
```

Implication for Toto-Rak:

- Modern instance entry waits after fade before opening slot `15`; old
  `RaidFst0Dungeon03.relogin` calls
  `_fadeInNowLoadingForNoticeEventJustInArea()` and immediately opens
  `RaidDungeonExecutionWidget` if `clearFlag == false`.
- If old occupancy relogin arrives during a desktop mode transition, this
  immediate open is more exposed to `setDesktopModeDetail -> cancelWidgetCommand`
  races than modern `InstanceRaidBaseClass.reloginEvent`.
- Hamlet's hidden slot-15 shell explains why subtype `3` / user-message timing
  matters for Hamlet, but not for Toto-Rak's basic visible timer. Toto-Rak needs
  only `relogin -> openRaidDungeonExecutionWidget -> 24228 -> processWidgetCreated`
  once the desktop lane is ready.

## 2026-06-23 two-tunnel decomp consolidation

This pass stops broad Lua/widget searching and keeps only the two tunnels that
can explain the current symptom:

```text
0x0130 -> shared receive dispatch -> LuaActorImpl slot 57 -> RaidFst0Dungeon03.relogin

RaidFst0Dungeon03.relogin
  -> desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  -> openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, 1, finishTime)
  -> openWidget/openWidgetLocal
  -> DesktopWidget.commandCreateWidget
  -> PlayerBaseClass.commandAboutWidget
  -> _executeCommand("widgetCreate", getSystemCommand(24228), ...)
```

### Tunnel A: `0x0130` to `relogin`

Source-backed packet body from
`Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`:

```text
body +0x00 u32 triggerActorID
body +0x04 u32 ownerActorID
body +0x08 u8  eventType
body +0x09 str eventName
body +0x29 str functionName
body +0x49 Lua params
SubPacket sourceActorId = triggerActorID
```

For Toto-Rak relogin, the packet-body truth is therefore:

```text
triggerActorID = player id
ownerActorID   = RaidFst0Dungeon03 director id
eventName      = "noticeEvent"
eventType      = current active type, or explicit 0x05 fallback
functionName   = "relogin"
Lua params     = [player, finishTime, false]
```

The local Lua param tags make the correct relogin blob explicit:

```text
0x06 <player actor id>   ; actor param
0x00 <finishTime>        ; int/uint param in this implementation
0x04                     ; boolean false
0x0F                     ; terminator
```

If `player` is omitted, the native method receiver still supplies only `self`,
so `[finishTime, false]` misbinds as `player=finishTime`,
`finishTime=false`, `clearFlag=nil`.

The installed-binary and generated native notes align with this shape:

```text
0x0130 is in receive range 0x012E..0x013D
  -> 0x004DCFFF shared object/vtable dispatch
  -> 0x004DD005 call 0x004D9910
  -> 0x004D9910 lookup in manager container this+0x17804/+0x17808
  -> if object exists, call object.vtable+0x24 with packet/context
```

`0x004D9910` is lookup, not creation. It walks the already-registered object
tree and returns the node payload at `+0x10`, or `0` on miss. That means a
correct packet body can still die before slot 57 if the shared dispatch key
does not resolve to a live packet receiver object.

Address-level correction from the receive wrapper:

```text
0x004DC6D0  esi = [ebp+0x0c]        ; packet/subpacket pointer
0x004DC71A  opcode = word [esi+0x02]
0x004DC71E  if opcode <= 0x013D
0x004DC729  if opcode >= 0x012E -> 0x004DCFFF

0x004DCFFF  edx = [ebp+0x08]        ; wrapper lookup key
0x004DD002  push edx
0x004DD003  ecx = edi               ; receive owner/container
0x004DD005  call 0x004D9910
0x004DD00A  if eax == 0 -> exit
0x004DD012  edx = [eax]             ; object vtable
0x004DD014  ecx = eax               ; object this
0x004DD016  eax = [edx+0x24]        ; object-specific receiver
0x004DD019  push esi                ; packet/context
0x004DD01A  call eax
```

So hook wording should stay precise: `[ebp+0x08]` is the shared dispatch
lookup key used by `0x004D9910`, while the `0x0130` body still separately
contains `triggerActorID`, `ownerActorID`, `eventType`, `eventName`, and
`functionName`. Do not assume the wrapper lookup key and body `ownerActorID`
are identical without logging both in the same receive.

Local send helpers split the two useful `0x0130` shapes this way:

```text
current-event player.RunEventFunction:
  header/source = player.Id
  triggerActorID = player.Id
  ownerActorID = player.currentEventOwner
  eventName = player.currentEventName
  eventType = player.currentEventType

explicit director.SendDirectorEventFunction:
  header/source = player.Id
  triggerActorID = player.Id
  ownerActorID = director.Id
  eventName = "noticeEvent"
  eventType = 0x05
```

For the current local Toto-Rak test this means the `0x50` ACK and the explicit
`0x05` ACK are not equivalent proof of dispatch. They prove two different
envelopes reached the native receiver.

The direct `0x0130` Lua receiver is still the installed-binary-proven
`LuaActorImpl` vtable slot 57:

```text
LuaActorImpl vtable 0x00FDFB2C
slot 56 (+0xE0) KickEvent          -> 0x0076C0D0
slot 57 (+0xE4) RunEventFunction   -> 0x0076C220
slot 58 (+0xE8) EndEvent           -> 0x0076C3B0

slot 57 constructs StartServerOrderEventFunctionReceiver
  trigger/source actor key
  owner actor key
  eventType
  eventName
  functionName
  Lua param blob
```

The deeper receiver path is:

```text
0x0076C220 LuaActorImpl slot 57
  -> 0x0089EDB0 packet-facing StartServerOrderEventFunctionReceiver constructor
  -> 0x0089E260 receiver body
  -> trigger/source actor lookup
  -> require non-empty Lua param vector
  -> 0x006E1140 thunk
       mov [esp+4], ecx        ; first arg becomes trigger actor object
       mov ecx, [ecx+0xF8]     ; actor event/script dispatcher
       jmp 0x00896F70
```

The queue/readiness side is still source-important:

```text
0x0089E8E0 queue/drain helper
0x00CC72A0 readiness reader, uses receiver/event context byte +0x7D
0x00896F70 resolver/dispatch body
  -> resolves owner actor from body +0x04
  -> requires owner actor exists
  -> requires owner actor +0x5C != 0
  -> requires dispatcher/context readiness
  -> resolves eventName/functionName through 0x00790AA0
  -> success path 0x006DE1E0 -> 0x00CD0940
0x00896F70 -> 0x00894090 -> 0x0075E670 -> 0x004D6D30 fallback compact 0x012E ACK
```

Sharper branch split:

```text
0x00897152 -> 0x006DE1E0 -> 0x00CD0940
  success-side dispatch path

0x008970ED -> 0x00894090
  lookup-miss fallback ACK

0x0089722B -> 0x00894090
  owner/context-not-ready fallback ACK

0x00894090 -> 0x0075E670 -> 0x004D6D30
  compact 0x012E EventUpdate send
```

That is why an `EventUpdate` ACK is weak evidence: the resolver/fallback ACK can
fire from the native event lane even when the named Lua function did not run.
No direct success-body send builder has been proven from the
`0x00CC0000..0x00CEFFFF` cluster to `0x004D6D30`, `0x0075E670`, or
`0x00894090`, so success-side dispatch plus later widget command emission is
stronger evidence than ACK alone.

The honest remaining native caveat is object identity: the
`0x004DCFFF -> 0x004D9910 -> object.vtable+0x24` envelope is high confidence,
and the downstream `LuaActorImpl` slot-57 decoder is high confidence, but the
exact live map object returned by `0x004D9910` for Toto-Rak still wants a hook
to prove its `vtable+0x24` target is the real slot-57 path.

The remaining unproven native pieces are therefore narrow:

- the live Toto-Rak object returned by `0x004D9910`;
- whether the relevant handle path still points at wrapper vtable `0x00FE02AC`
  or reaches `LuaActorImpl` vtable `0x00FDFB2C`;
- the exact instruction inside the `0x00CCEE30`-family native body that invokes
  `relogin` / `eventNoticeCutScene`;
- any success-path `EventUpdate` send, if one exists separately from the proven
  fallback ACK.

C-decompile cross-check for the readiness byte:

```text
FUN_00ce2bc0  initializes a queue/node-like object and clears +0x7D/+0x7E
FUN_00ce2d50  allocates/enqueues one of those objects and stores parent at +0x0C
FUN_00ce1dd0  writes +0x7D = param_3, clears +0x7E when ready, and may drain/follow up
```

That supports the queued-readiness model, but it still does not expose a
hardcoded call to `relogin` or `eventNoticeCutScene`. Also, not every `+0x7D`
hit belongs to this event path: the `FUN_00908D50` / `FUN_00908D70` /
`FUN_00908D90` cluster is tree-iterator/sentinel code. Treat it as generic
container machinery, not RunEventFunction proof.

The closest visible static C success-gate slice is still opaque:

```text
FUN_00ccf7d0
  checks context byte and param_2+0x7F
  -> FUN_00cccd80 predicate/gate
       can clear param_2[0x7E]
       returns boolean
  -> FUN_00ccecb0 when the predicate succeeds
       calls opaque helpers FUN_00ccffe0 / FUN_00cd0840 / FUN_00cce8e0
```

This is useful as a breakpoint band, but it still exposes no direct
`relogin` / `eventNoticeCutScene` string, no direct named Lua resolver call,
and no proof that this exact `FUN_00CE*` object family is the final slot-57
named-method invocation. Static C is basically exhausted at this boundary:
the remaining proof needs a live hook on the success path and the later
widget-create boundary.

Native does not invent the Lua `player` argument. It only supplies the Lua
receiver/self through the actor/method dispatch. The packet param blob still
must include `player` for `RaidFst0Dungeon03.relogin(self, player, finishTime,
clearFlag)`.

The ACK warning is now precise: a compact `0x012E EventUpdate` can prove the
receiver answered the event lane, but it does not by itself prove the named Lua
method body reached the widget call. The fallback/resolver ACK path is
statically stronger than the success-path side effect. For this bug,
the client-started `0x012D EventStart` for owner `0xA0F05EA4` /
`widgetCreate` is the first server-visible proof that `relogin` passed the
widget open gate.

### Tunnel B: `relogin` to widget-create EventStart

Recovered Toto-Rak Lua:

```lua
function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
end
```

Recovered desktop connector:

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentId, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
end
```

So `2123` is not a widget init argument. The widget receives only:

```text
RaidDungeonExecutionWidget.init(contentId = 1, finishTime = finishTime)
```

The source-backed pre-widget-create no-op branches are:

| Branch | Exact guard | Server-visible result |
| --- | --- | --- |
| `relogin` branch | `clearFlag == false` must be boolean false. | If not, no widget call and no `24228`. |
| `openWidgetYield` entry | If parent is nil and `isWidgetExec(15) == true`, returns nil. | No `24228`; stale `rootWidget[15]` can block. |
| `openWidget` type lookup | `getWidgetTypeByIndex(15)` must return non-nil, currently type/family `5`. | No `24228` if nil. |
| `openWidget` enable flag | `work.widgetEnableFlag[5]` must be true. | No `24228` if false. |
| `openWidget` root occupancy | If parent remains nil and `rootWidget[15] ~= nil`, returns false. | No `24228`. |
| `openWidgetLocal` parent | Parent defaults to `desktopWidget`; `desktopWidget:_isAlive()` must be true. | No `24228` if false. |
| `commandCreateWidget` actor | `player:getSystemCommand(24228)` must return the enabled static actor, otherwise nil is passed into `commandAboutWidget`. | No valid `widgetCreate` command; likely Lua/native error before `_executeCommand`. |
| `commandAboutWidget` burst | `playerWork.widgetCommandBurstBlocker` can reject non-cancel calls while server time is still below the blocker. | No `24228`. |
| `commandAboutWidget` playing | `_isCommandPlaying("widgetCreate")` must be false unless cancel flag is true. | No `24228`. |
| `commandAboutWidget` execute | `_executeCommand("widgetCreate", getSystemCommand(24228), ...)` must return true. | No `24228` if false. |

Four implementation details matter for this table:

- `isWidgetExec(15)` only checks whether `rootWidget[15] ~= nil`; it does not
  prove that the root widget is alive or purge a dead root. A stale slot-15 root
  can therefore block before `commandCreateWidget`.
- Desktop mode controls `widgetEnableFlag`. Bytecode-backed mode mapping
  identifies `8`, `16`, `32`, `61`, and `63` as enabling the slot-15
  family/type `5`; `62`, `120`, `126`, and `127` write it false. Mode `64`
  maps to level `3` but has no visible flag-write branch, so it inherits the
  prior value instead of enabling type `5` itself. `setDesktopModeDetail` also
  calls `cancelWidgetCommand()` during transitions, so mode churn can collide
  with old occupancy relogin's immediate open.
- `openWidgetYield` loops only while the slot's widget type remains enabled.
  For slot `15`, a false `widgetEnableFlag[5]` breaks the loop and returns nil.
- `openWidgetLocal` looks duplicated in the decompiled Lua, but the Lua 5.1
  bytecode proto has one real `SELF commandCreateWidget` and one `CALL`. The
  command result is reused for the parent-input side effect and the return. So a
  single `openWidgetLocal` attempt should emit at most one `24228`.
  Bytecode anchor: `desktopwidget_connector.luac` function with source lines
  `20825..20870` (reported as proto `522/523` depending on zero-based vs
  one-based indexing), `SELF commandCreateWidget` at pc `23/24`, `CALL` at pc
  `32/33`, result kept in `R8` and returned at pc `44/45`.

The bytecode-backed `getWidgetTypeByIndex(index)` map is:

```text
0 -> 0
1 -> 1
2 -> 2
3 -> 3
4, 5 -> 4
6, 7, 8, 9, 15, 16 -> 5
10, 11, 12 -> 6
13, 14, 17 -> 7
```

So slot `15` is unambiguously type `5`. Caravan/content slots `6..9` and
Hamlet popup slot `16` share the type-5 enable family, but they do not prove
slot-15 root occupancy or `RaidDungeonExecutionWidget` creation.

Recovered command bridge:

```lua
function DesktopWidget.commandCreateWidget(self, widgetName, cancelFlag, ...)
  return worldMaster:_getMyPlayer():commandAboutWidget(
    worldMaster:_getMyPlayer():getSystemCommand(24228),
    cancelFlag,
    widgetName,
    ...)
end

function PlayerBaseClass.commandAboutWidget(self, commandActor, cancelFlag, ...)
  local now = worldMaster:_getServerTime()
  if self.playerWork.widgetCommandBurstBlocker ~= 0
     and now < self.playerWork.widgetCommandBurstBlocker
     and not cancelFlag then
    return false
  end

  local commandName = self:getCommandName(commandActor)
  if not cancelFlag then
    if self:_isCommandPlaying(commandName) then
      return false
    end
  else
    self:_cancelCommand(commandName)
  end

  self.playerWork.widgetCommandBurstBlocker = now
  if cancelFlag then
    self:recordRequestInformation()
  end
  return self:_executeCommand(commandName, commandActor, ...)
end
```

`getCommandName(commandActor)` is also bytecode-backed for this path. The text
decompiler drops the inner return-looking assignments, but
`charabaseclass.luac` line range `524..598` does this:

```text
if _isInstanceOf(commandActor, "SystemCommandBaseClass"):
  if commandActor:getPriority() == -1:
    commandName = "commandRequest"
  elseif commandActor:getPriority() == 4:
    commandName = "commandContent"

  if _isInstanceOf(commandActor, "WidgetOpenCommand"):
    commandName = "widgetCreate"
  elseif _isInstanceOf(commandActor, "MacroCommand"):
    commandName = "macroRequest"

  return commandName
```

The function starts by calling `commandActor:getPriority()` before the class
branches, so a nil `getSystemCommand(24228)` result is not a normal false
return path. It should be treated as a hard pre-command failure.

`WidgetOpenCommand.command` itself is tiny in the recovered Lua:

```lua
function WidgetOpenCommand.command(self, caller, widgetName, ...)
  require("/Widget/" .. widgetName)
  return true
end
```

So the useful failure evidence is mostly before this script body:
`openWidget`/`openWidgetLocal`, `PlayerBaseClass.commandAboutWidget`, and native
`_executeCommand`.

`_canExecuteCommand("widgetCreate")` is useful telemetry, but this recovered
path does not visibly call it. The visible order is burst blocker,
`_isCommandPlaying`, then `_executeCommand`.

The expected `24228` command vector after a successful Lua-side gate is:

```text
openRaidDungeonExecutionWidget(2123, 1, finishTime)
  -> openWidgetYield(15, "RaidDungeonExecutionWidget",
       nil, nil, true, 1, finishTime)
  -> commandCreateWidget("RaidDungeonExecutionWidget",
       false, desktopWidget, true,
       "RaidDungeonExecutionWidget", 15, true, 1, finishTime)
  -> commandAboutWidget(getSystemCommand(24228),
       false,
       "RaidDungeonExecutionWidget", desktopWidget, true,
       "RaidDungeonExecutionWidget", 15, true, 1, finishTime)
  -> _executeCommand("widgetCreate", commandActor24228,
       "RaidDungeonExecutionWidget", desktopWidget, true,
       "RaidDungeonExecutionWidget", 15, true, 1, finishTime)
```

`cancelFlag=false` is consumed by `commandAboutWidget`; it is not forwarded as
an `_executeCommand` argument. The first trailing argument is the widget name.

After the bridge call is accepted, `openWidgetYield` waits while
`isCreateWidgetCommandPlaying()` is true, then returns
`getWidget(15, "RaidDungeonExecutionWidget")`. If the command event ran but no
root/name match was created, the Lua return is still nil even though the
command boundary was crossed.

The local server boundary for that command is
`/Command/System/WidgetOpenCommand`, owner id `0xA0F05EA4` / command id
`24228` (`Open Widget` in `AI Scripts/command.csv`). Recovered client
`WidgetOpenCommand.command` only requires `/Widget/<widgetName>` and returns
true; the local server shim is stricter and allows
`RaidDungeonExecutionWidget` only in private zone `159`, otherwise it logs a
reject and ends the command event.

`0x0132` rows named `widgetCreate` are command/function bootstrap, not the
per-open widget payload. The local `_0x132Packet` shape is just:

```text
u16 number
ascii function name, max 0x20 bytes
```

The per-open proof boundary is the client-started `0x012D EventStart` produced
by `_executeCommand("widgetCreate", getSystemCommand(24228), ...)`:

```text
0x012D EventStart:
  triggerActorID = player/caller
  ownerActorID   = 0xA0F05EA4
  eventType      = command event type
  eventName      = "widgetCreate"
  luaParams      = "RaidDungeonExecutionWidget",
                   desktopWidget,
                   true,
                   "RaidDungeonExecutionWidget",
                   15,
                   true,
                   1,
                   finishTime
```

So the clean trace split is:

```text
No client 0x012D owner=0xA0F05EA4 event=widgetCreate:
  failure is still inside Tunnel A or the pre-command part of Tunnel B.

0x012D owner=0xA0F05EA4 event=widgetCreate appears:
  relogin and pre-command widget gates passed; inspect WidgetOpenCommand,
  command event close, and processWidgetCreated/root slot 15.
```

`_createWidgetInWidgetContainer` is not directly on this recovered Lua path.
That helper appears in the separate `createWidget2`/container helper lane and in
local fallback probes. Treating it as a pre-`24228` requirement for
`openRaidDungeonExecutionWidget` mixes two mechanisms.

Slot-15 comparison cross-check:

- The only unique raw `openWidgetYield(15, ...)` calls recovered in the Lua
  connector are `openRaidDungeonExecutionWidget` and
  `openHamletExecutionWidget`.
- Modern `InstanceRaidBaseClass.openInformationWidget` still reaches
  `openRaidDungeonExecutionWidget(nil, contentID, finishTime)`, so modern
  Cutter/Aurum-style instance raids are the closest control for Toto-Rak.
- Hamlet uses the same root slot `15` for `HamletDefenseWidget` and slot `16`
  for `HamletDefensePopupWidget`, but inherits the modern delayed start/relogin
  timing before opening.
- Caravan and Guildleve are not slot-15 controls. They use
  `processUpdateContentsInformation` and `openContentsWidget`, which maps
  content lanes to widget slots `6..9`.
- SQWT `.form/.tpl` assets prove layout/template availability. They do not
  prove the client reached `openWidgetYield`, `commandAboutWidget`, or
  system-command `24228`.

### RaidDungeonExecutionWidget body

The widget Lua itself is tiny and does not contain a raid/content gate:

```lua
function RaidDungeonExecutionWidget.init(self, contentId, finishTime)
  self:setContents(contentId)
  self:setTimer(finishTime)
end

function RaidDungeonExecutionWidget.setContents(self, contentId)
  self:setText("TextBlock_ContentsName", 10051, contentId)
end

function RaidDungeonExecutionWidget.setTimer(self, finishTime)
  remaining = finishTime - worldMaster:_getServerTime()
  self:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value0", 1)
  self:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value0", remaining)
  self:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value1", 0)
  self:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value2", 300)
  self:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value1", 300)
  self:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value2", 120)
end
```

`contentId=1` is not suspicious. UI text row `10051` resolves through
`xtx/raidDungeon`, and `xtx_raidDungeon.csv` row `1` is
`the Thousand Maws of Toto-Rak`. Row `2` is Dzemael, matching the other legacy
raid call `RaidRoc0Dungeon01 -> openRaidDungeonExecutionWidget(4102, 2,
finishTime)`. Modern instance raids pass the same second argument shape through
`InstanceRaidBaseClass.openInformationWidget -> openRaidDungeonExecutionWidget(nil,
contentID, finishTime)`.

The first argument to `openRaidDungeonExecutionWidget` is legacy/display data
and is discarded by the connector before widget init. The only arguments that
reach `RaidDungeonExecutionWidget.init` are `contentId` and `finishTime`.

Caravan is a useful positive control for the widget body, but not for the open
lane. `ChocoboCaravanWidget.setContents` uses the same
`TextBlock_ContentsName` / `10051` text path, and its timer writes the same
`CustomControl_TimerLabel` fields through `setControlProperty`. That suggests
the controls and text indirection are normal shared content-HUD plumbing. If
`24228` fires and the widget still fails after native creation, then the next
post-create probes are `RaidDungeonExecutionWidget.init`, `setText`, and the
timer property setters. If `24228` never fires, this widget body is never
reached.

The installed SQWT assets are present:

```text
client/sqwt/widget/RaidDungeonExecutionWidget.form  2903 bytes
client/sqwt/widget/RaidDungeonExecutionWidget.tpl    645 bytes
```

Existing binary probes classify both as `SQEX 00 00 00 00` containers. The
`.form` has `Window`-family terminal evidence and the `.tpl` has
`Dictionary`-family terminal evidence, but neither exposes raw XML/control
names by simple strings or decompression. That means the layout exists, but the
control tree still needs native parser tracing to prove the form-level binding
of `TextBlock_ContentsName` and `CustomControl_TimerLabel` directly.

The shared `WidgetBaseClass` helpers do not add another Lua gate here:

```text
setControlProperty(control, prop, value)
  -> _setProperty(nil, control, prop, value)
  -> _setProperty_cpp

setText(control, numericTextId, ...)
  -> setItemText(nil, control, numericTextId, ...)
  -> setTextProperty(nil, control, "Text", numericTextId, ...)
  -> _setTextProperty_cpp
```

So a missing control, bad property name, or bad text expansion would have to be
observed at the native `_setProperty_cpp` / `_setTextProperty_cpp` boundary.
There is no visible Lua-side return check or silent content-id branch in
`RaidDungeonExecutionWidget`.

### Slot-15 post-create/root lifecycle

Once native widget creation succeeds, the root-slot bookkeeping comes back
through `WidgetBaseClass._onInit`:

```lua
desktopWidget:processWidgetCreated(widget, rootFlag, inputEnable, aliasName, index, showFlag, ...)
```

Bytecode-backed `_onInit` argument flow:

```text
_onInit(self, parent, inputEnable, aliasName, index, showFlag, initArgs...)

initCommon(parent, aliasName, index, showFlag)
send BeforeLuaInit
self:init(initArgs...)
send AfterLuaInit

if parent ~= nil:
  if parent:_isAlive() == false:
    return
  self:_setParentWidget(parent)

self.widgetWork.initialized = true

if self is not DesktopWidget
   and desktopWidget:isInitializing() == false:
  rootFlag = (parent == nil) or (not parent:isInitializing())
  desktopWidget:processWidgetCreated(
    self,
    rootFlag,
    inputEnable,
    aliasName,
    index,
    showFlag,
    initArgs...)
```

For `openRaidDungeonExecutionWidget`, `parent` is `desktopWidget`, not nil, but
the desktop is expected to be already initialized. Therefore the root flag
should be true for the slot-15 widget after successful native creation. If
`desktopWidget:isInitializing()` is still true, or if the parent dies between
`openWidgetLocal` and `_onInit`, `processWidgetCreated` is skipped.

The source-backed behavior of `processWidgetCreated` is:

```text
if rootFlag == true:
  parent = widget:_getParentWidget()
  if parent ~= desktopWidget:
    parent:setInputEnable(previousInputEnable)

if widget:isCreateCancel() == true:
  desktopWidget:closeWidgetDirect(widget)
  return

if not rootFlag:
  return

if rootWidget[index] == nil:
  rootWidget[index] = widget

if widgetEnableFlag[widget:getWidgetType()] == false:
  return

if widget:getVisibleFlag() == false:
  return

show visible child widgets
widget:show(...)
```

That gives three more useful split points after `24228`:

- A successful create can assign `rootWidget[15]` before it checks
  `widgetEnableFlag[5]` or the widget visible flag.
- If the type flag or visible flag is false at this moment, the widget can fail
  to appear while leaving slot `15` occupied.
- `getWidget(15, ...)` purges dead roots, but `isWidgetExec(15)` and
  `openRootWidget` only test non-nil occupancy. `processWidgetCreateAborted()`
  also only clears dead roots after a cancelled `widgetCreate`, not an alive but
  invisible root.

This does not explain the current "no `24228`" trace by itself, but it explains
why later retries can be blocked by `rootWidget[15]` even when no visible
`RaidDungeonExecutionWidget` exists.

### Helper hook checklist

The next live helper/hook pass should log exactly these values at the moment
`0x0130 relogin` is received and again when `openWidgetYield` starts:

```text
0x004DCFFF:
  opcode
  packet pointer [ebp+0x0c]
  wrapper lookup key [ebp+0x08] used for 0x004D9910
  body triggerActorID
  body ownerActorID
  0x004D9910 return object
  object.vtable
  [object.vtable+0x24] target

LuaActorImpl slot 57 / 0x0076C220:
  triggerActorID
  ownerActorID
  eventType
  eventName
  functionName
  raw Lua params

StartServerOrderEventFunctionReceiver:
  trigger actor lookup result
  owner actor lookup result
  queue/readiness byte used by 0x00CC72A0
  whether 0x006E1140 / 0x00896F70 is entered
  whether fallback EventUpdate ACK path runs

RaidFst0Dungeon03.relogin:
  player arg type/value
  finishTime
  clearFlag exact Lua type/value
  entry/exit around _fadeInNowLoadingForNoticeEventJustInArea()

DesktopWidget.openWidgetYield:
  rootWidget[15]
  isWidgetExec(15)
  getWidgetTypeByIndex(15)
  work.widgetEnableFlag[5]
  work.widgetEnableFlag[4] only as legacy comparison
  desktopWidget:_isAlive()
  desktop mode / modeLevel
  isCreateWidgetCommandPlaying()

PlayerBaseClass.commandAboutWidget:
  getSystemCommand(24228)
  getCommandName(commandActor)
  widgetCommandBurstBlocker and server time
  _isCommandPlaying("widgetCreate")
  _canExecuteCommand("widgetCreate") as telemetry
  _executeCommand("widgetCreate", 24228, ...) return

WidgetBaseClass._onInit / DesktopWidget.processWidgetCreated:
  widget class/name
  rootFlag
  parent widget and parent:_isAlive()
  index/rootIndex
  widget:getWidgetType()
  widget:isCreateCancel()
  widget:getVisibleFlag()
  widgetEnableFlag[5]
  rootWidget[15] before/after

RaidDungeonExecutionWidget.init:
  contentId
  finishTime
  worldMaster:_getServerTime()
  remaining = finishTime - serverTime
  setText("TextBlock_ContentsName", 10051, contentId) return/error
  _setProperty CustomControl_TimerLabel return/error for all six writes
```

Decision rule:

```text
No client 0x012D owner=0xA0F05EA4 event=widgetCreate:
  either slot-57 ACK did not execute RaidFst0Dungeon03.relogin,
  or relogin/openWidgetYield/commandAboutWidget refused locally.

Client 0x012D owner=0xA0F05EA4 event=widgetCreate appears:
  Tunnel A and pre-command Tunnel B are proven good.
  Then inspect WidgetOpenCommand allow/reject and processWidgetCreated/root slot 15.
```

## 2026-06-23 seven-target focused decomp pass

Scope for this pass:

```text
0x004DCFFF
0x0076C220
0x00897152
RaidFst0Dungeon03.relogin
DesktopWidget.openWidgetYield
PlayerBaseClass.commandAboutWidget
_executeCommand("widgetCreate", 24228, ...)
```

Short version: the static decomp is now strong enough to split the failure into
two precise tunnels. If the client hits `0x00897152` and then the Lua
`RaidFst0Dungeon03.relogin` hook, the `0x0130` side is good and the remaining
failure is slot-15/widget-command gating. If the client ACKs `0x0130` but never
hits `0x00897152` or `relogin`, the ACK is coming from the native fallback path,
not from the Lua method body.

### Target 1: `0x004DCFFF`

Confidence: high for shared receive dispatch, hook-only for live object identity.

`0x004DCFFF` is the shared receive-object dispatcher used by the middle opcode
range containing `0x0130`. `receive_opcode_dispatch_ranges.csv` maps:

```text
0x012E..0x013D -> 0x004DCFFF
```

The recovered body is small and decisive:

```asm
0x004DCFFF  mov  edx, [ebp+8]
0x004DD002  push edx
0x004DD003  mov  ecx, edi
0x004DD005  call 0x004D9910
0x004DD00A  test eax, eax
0x004DD00C  je   0x004DD3A9
0x004DD012  mov  edx, [eax]
0x004DD014  mov  ecx, eax
0x004DD016  mov  eax, [edx+0x24]
0x004DD019  push esi
0x004DD01A  call eax
```

Meaning:

```text
object = lookup_0x004D9910(dispatcher, wrapperKey)
if object != nil:
  object.vtable[0x24](packetOrPayload)
```

For Toto-Rak `0x0130`, this target proves only that the opcode reaches an
object-specific receive handler. It does not by itself prove that the object is
the Lua actor implementation. The live hook should log `[ebp+8]`, `esi`, the
return from `0x004D9910`, `[object]`, and `[vtable+0x24]`. The expected
slot-57 continuation is `0x0076C220`.

### Target 2: `0x0076C220`

Confidence: high for `LuaActorImpl` slot-57 `RunEventFunction` packet decode;
hook-only for whether the live `0x004DCFFF` object reaches this slot.

Installed-binary vtable evidence identifies:

```text
LuaActorImpl vtable 0x00FDFB2C
slot 56 (+0xE0) KickEvent        -> 0x0076C0D0
slot 57 (+0xE4) RunEventFunction -> 0x0076C220
slot 58 (+0xE8) EndEvent         -> 0x0076C3B0
```

The `0x0130` packet body decoded by slot 57 is:

```text
+0x00 trigger/source actor key
+0x04 owner actor key
+0x08 eventType byte
+0x09 eventName string, 0x40-byte bounded copy
+0x29 functionName string, 0x40-byte bounded copy
+0x49 Lua param blob, 0x40 bytes
```

Slot 57 constructs a `StartServerOrderEventFunctionReceiver` through
`0x0089EDB0`. The receiver's internal layout then becomes:

```text
+0x08 trigger/source actor key
+0x0C owner actor key
+0x10 functionName
+0x64 eventName
+0xB8 eventType
+0xBC param/vector object
+0xC0 param begin
+0xC4 param end
+0xC8 param capacity
+0xCC queue/drain state
```

This proves the argument semantics that matter for Toto-Rak: native does not
invent the Lua `player` argument. It decodes actor keys for dispatch ownership,
but the Lua parameter blob still has to include the arguments expected by
`RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)`.

Correct packet-side Lua args for the relogin tunnel remain:

```text
playerActor, finishTime, false
```

### Target 3: `0x00897152`

Confidence: medium-high for success branch boundary, not enough to name the
final C++ Lua invoke without a hook.

`0x0076C220` eventually reaches `0x00896F70` through:

```text
0x0089E260 StartServerOrderEventFunctionReceiver execute
  -> 0x006E1140 thunk
  -> 0x00896F70 dispatcher
```

The recovered gates before success are:

```text
owner actor key resolves
owner actor +0x5C is nonzero
dispatcher context [dispatcher+8] is non-nil
[dispatcher+8].vtable+0x10() reports ready
eventName/functionName lookup through 0x00790AA0 succeeds
```

The success branch starts at `0x00897152`:

```text
0x00897152
  mark [dispatcher+8]+0x20 = 1
  optional call 0x00892F60
  call 0x006DE1E0
  call 0x00CD0940
  call 0x00CD0A00
```

`0x00CD0940` is only:

```text
call 0x00CCDDA0
call 0x00CD7A30
call 0x00CCF9B0
ret 0x10
```

The important split is the fallback ACK path:

```text
lookup miss        -> 0x008970ED -> 0x00894090
owner/context miss -> 0x0089722B -> 0x00894090
0x00894090 -> 0x0075E670 -> 0x004D6D30 sends compact 0x012E/EventUpdate
```

So yes: the client can ACK a `0x0130` without executing
`RaidFst0Dungeon03.relogin`. A hit on `0x00897152` is the first strong native
proof that the dispatch did not fall into weak ACK. A hit on `relogin` is the
first script-level proof that the Lua body actually ran.

### Target 4: `RaidFst0Dungeon03.relogin`

Confidence: complete for static Lua body and arg positions.

Recovered body:

```lua
function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
end
```

For `0x0130`, the packet must call:

```text
eventName    = noticeEvent
eventType    = 0x05
functionName = relogin
params       = playerActor, finishTime, false
```

Native supplies `self` from the resolved event owner/director. It does not supply
`player`. `finishTime` is passed through as-is. The third Lua param must be the
boolean false if the widget branch should run; numeric `0`, nil, or omitted args
are not equivalent for the exact source branch.

The first arg `2123` in `openRaidDungeonExecutionWidget(2123, 1, finishTime)` is
discarded by the wrapper, so it is not a widget init/content argument.

### Target 5: `DesktopWidget.openWidgetYield`

Confidence: complete for Lua-level no-op branches before `commandCreateWidget`.

`openRaidDungeonExecutionWidget` is:

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentId, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
end
```

So the effective widget init args are:

```text
RaidDungeonExecutionWidget.init(contentId = 1, finishTime = finishTime)
```

The source-backed `openWidgetYield` branch map is:

```text
if parent == nil:
  if isWidgetExec(15) == true:
    return nil
  parent = desktopWidget

type = getWidgetTypeByIndex(15)  -- bytecode-backed result: 5

loop:
  if openWidget(15, "RaidDungeonExecutionWidget", nil, parent, true, 1, finishTime):
    waitWidgetCreateYield(15)
    return getWidget(15, "RaidDungeonExecutionWidget")

  if widgetEnableFlag[type] == false:
    break

  _wait(0.1)

return nil
```

The `openWidget` / `openWidgetLocal` no-packet exits are:

```text
getWidgetTypeByIndex(15) == nil
widgetEnableFlag[5] == false
parent nil and rootWidget[15] ~= nil
parent:_isAlive() == false
commandCreateWidget(...) returns false
```

Important slot detail: `isWidgetExec(15)` only checks
`rootWidget[15] ~= nil`. It does not purge a dead root. The `getWidget()` helper
does purge dead roots, but `openWidgetYield` can return nil before reaching that
cleaner. A stale `rootWidget[15]` is therefore a real silent pre-24228 blocker.

The bytecode-backed type map still matters:

```text
6, 7, 8, 9, 15, 16 -> widget type/family 5
```

Therefore `widgetEnableFlag[5]` is the primary slot-15 gate.
`widgetEnableFlag[4]` is only a legacy comparison probe.

### Target 6: `PlayerBaseClass.commandAboutWidget`

Confidence: complete for Lua guard behavior before native command execution.

`DesktopWidget.commandCreateWidget` forwards through system command `24228`:

```lua
function DesktopWidget.commandCreateWidget(self, widgetName, cancelFlag, ...)
  return worldMaster:_getMyPlayer():commandAboutWidget(
    worldMaster:_getMyPlayer():getSystemCommand(24228),
    cancelFlag,
    widgetName,
    ...)
end
```

For Toto-Rak this means:

```text
commandCreateWidget(
  "RaidDungeonExecutionWidget",
  false,
  desktopWidget,
  true,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime
)
```

`PlayerBaseClass.commandAboutWidget(commandActor, cancelFlag, ...)` then does:

```lua
now = worldMaster:_getServerTime()
if widgetCommandBurstBlocker ~= 0 and now < widgetCommandBurstBlocker and not cancelFlag then
  return false
end

commandName = self:getCommandName(commandActor)
if not cancelFlag then
  if self:_isCommandPlaying(commandName) then
    return false
  end
else
  self:_cancelCommand(commandName)
end

self.playerWork.widgetCommandBurstBlocker = now
if cancelFlag then
  self:recordRequestInformation()
end

return self:_executeCommand(commandName, commandActor, ...)
```

For the raid widget path, `cancelFlag` is false. That means:

```text
burst blocker can reject before native execute
_isCommandPlaying("widgetCreate") can reject before native execute
recordRequestInformation() is not called in this path
_canExecuteCommand("widgetCreate") is not visibly called by commandAboutWidget
```

The exact native bridge call becomes:

```text
_executeCommand(
  "widgetCreate",
  getSystemCommand(24228),
  "RaidDungeonExecutionWidget",
  desktopWidget,
  true,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime
)
```

The `false` cancel flag is consumed by `commandAboutWidget` and is not forwarded
into `_executeCommand`.

### Target 7: `_executeCommand("widgetCreate", 24228, ...)`

Confidence: high for Lua/native boundary name and args, low for native internal
failure branches without a hook.

The inline bridge file names the native methods:

```lua
PlayerBaseClass._executeCommand_inl     -> "_executeCommand_cpp"
PlayerBaseClass._isCommandPlaying_inl   -> "_isCommandPlaying_cpp"
PlayerBaseClass._canExecuteCommand_inl  -> "_canExecuteCommand_cpp"
```

Static Lua does not expose `_executeCommand_cpp` internals. Therefore the first
server-visible proof of success past this point is not `0x0132`; it is the
client sending a command-start packet for system command `24228`, observed as
the widget-create command envelope. In current server traces this is the
`0x012D`/command side for event `widgetCreate` owned by the system command actor,
not a generic property update.

Use this as the focused live decision tree:

```text
Hit 0x004DCFFF, but [vtable+0x24] != 0x0076C220:
  wrong object/owner/source for the incoming 0x0130 packet.

Hit 0x0076C220, then fallback 0x00894090/0x0075E670, no 0x00897152:
  packet decoded, but event owner/readiness/name/function lookup failed.
  The EventUpdate ACK is weak and does not prove relogin ran.

Hit 0x00897152, but no RaidFst0Dungeon03.relogin:
  native success branch reached; continue below 0x00CCF9B0 / 0x00CCCD80 / 0x00CCEE30.

Hit RaidFst0Dungeon03.relogin, but no DesktopWidget.commandCreateWidget:
  player fade call, clearFlag, stale rootWidget[15], widgetEnableFlag[5],
  parent _isAlive, or openWidget/openWidgetLocal branch stopped it.

Hit DesktopWidget.commandCreateWidget / commandAboutWidget, but no client widgetCreate command:
  getSystemCommand(24228), widgetCommandBurstBlocker, _isCommandPlaying("widgetCreate"),
  or _executeCommand_cpp return rejected it.

Client widgetCreate command appears:
  both tunnels are proven through _executeCommand. Continue at server WidgetOpenCommand
  allow/reject, then client WidgetBaseClass._onInit / processWidgetCreated / rootWidget[15].
```

## 2026-06-23 bridge decomp answer: what can and cannot be solved statically

This bridge can be decompiled far enough to explain the current `slot57_calls=0`
result, but not far enough to prove the live Toto-Rak object identity without a
runtime hook.

Static decomp proves this receive envelope:

```text
0x0130
  -> opcode range 0x012E..0x013D
  -> 0x004DCFFF
  -> 0x004D9910(ownerContext, wrapperLookupKey)
  -> if lookup hit: call returnedObject.vtable+0x24(payload)
```

`0x004D9910` is not a packet parser and not Lua dispatch. It is a container
lookup:

```text
tree root/container = ownerContext + 0x17804
lookup key          = stack arg from 0x004DCFFF, originally [ebp+8]
helper              = 0x0071D420
miss result         = eax = 0
hit result          = eax = foundNode + 0x10 payload/object pointer
```

`0x004DCFFF` then performs the actual indirect call:

```asm
call 0x004D9910
test eax, eax
je exit
edx = [eax]          ; object vtable
ecx = eax            ; object this
eax = [edx+0x24]     ; object receive handler
push esi             ; payload/context
call eax
```

For many Application/Main-element objects, `vtable+0x24` is `0x004D8860`.
The recovered `0x0130` case inside that handler reaches a generic slot-57
trampoline:

```asm
004D8963  mov  ecx, [esi+80h]    ; handle object from map object
004D8969  test ecx, ecx
004D8971  add  edi, 10h          ; packet body/payload adjustment
004D8974  push edi
004D8975  call 00575040

00575040  mov  ecx, [ecx]
00575042  mov  eax, [ecx]
00575044  mov  eax, [eax+0E4h]   ; slot 57
0057504A  jmp  eax
```

So the bridge is:

```text
0x004DCFFF
  -> returnedObject.vtable+0x24
  -> often 0x004D8860
  -> 0x004D8860 case 0x0130
  -> 0x00575040
  -> [[returnedObject+0x80]].vtable+0xE4
```

The intended Lua receiver is:

```text
LuaActorImpl vtable 0x00FDFB2C
slot 57 / +0xE4 = 0x0076C220
```

But the constructor-backed handle lane can instead be:

```text
wrapper vtable 0x00FE02AC
slot 57 / +0xE4 = 0x0075AF00
0x0075AF00 = ret 4 no-op
```

That means a `0x0130` can traverse the shared native bridge and still never hit
`0x0076C220`. This matches the observed `totoraknative installed at
0x0076C220, slot57_calls=0` result.

The remaining non-static proof is one pointer identity:

```text
For the live Toto-Rak 0x0130:
  what does 0x004D9910 return?
  what is [returnedObject]?
  what is [[returnedObject]+0x24]?
  what is returnedObject+0x80?
  what is [[returnedObject+0x80]]?
  what is [[[returnedObject+0x80]]+0xE4]?
```

Decision:

```text
If [[[returnedObject+0x80]]+0xE4] == 0x0076C220:
  bridge reaches LuaActorImpl slot 57; continue at event owner/readiness resolver.

If [[[returnedObject+0x80]]+0xE4] == 0x0075AF00:
  bridge hits the wrapper no-op lane; ACK/order can look good while relogin never runs.

If returnedObject.vtable+0x24 is not 0x004D8860:
  decode that concrete +0x24 handler next; 0x004DCFFF itself is already done.
```

So yes, the bridge is decompiled enough to stop broad guessing. The only part
that cannot be answered from static decomp alone is the live object/handle
identity selected by `0x004D9910` for the actual Toto-Rak `0x0130` packet.

## 2026-06-23 remaining useful static decomp: lookup-map seeding

There is one more useful static layer below the live `0x004D9910` lookup
question: how the object map is seeded before `0x0130`. This does not replace
the live hook, but it tells us what earlier packets/state to inspect if
`0x004D9910` returns nil, the wrong object, or a wrapper/no-op handle.

The low `0x00CA` path is the object create/register anchor:

```text
0x00CA receive
  -> 0x004DCCBF
  -> 0x004D9910 lookup existing object by packet/id
  -> if missing: 0x004D90C0 create/register
  -> mark object+0x92 = 1
  -> notify/update through 0x004CAF60
```

`0x004D90C0` is now concrete:

```text
arg stack +0x10 -> validator 0x004D9030
if validator false:
  return nil

call 0x00537620 with:
  ecx = owner + 0x4AC
  arg = create source / selector
  arg = validated id
  arg = owner + 0x174F0
  arg = owner
  arg = owner + 0x510

if created object != nil:
  call createdObject.vtable+0x14

return created object
```

`0x004D9030` is a special-id validator. Non-special ids pass. Special ids with
high bits `0xC0000000` are validated through a three-lane table:

```text
if (id & 0xE0000000) != 0xC0000000:
  return true

type = (id >> 24) & 0x0F
if type >= 3:
  return true

low24 = id & 0x00FFFFFF
table = 0x01336B60 + type * 24
ok = 0x00D35AF0(table, low24)

if ok:
  resolved = id
else:
  resolved = 0xC0000000

return resolved == id
```

So bad/sentinel-style ids can fail object creation before the map is populated.

`0x00537620` is a function-pointer factory/register dispatcher:

```text
factoryBegin = this+0x04
factoryEnd   = this+0x08
index        = stack arg after prologue, used as factory selector

reject if:
  factoryBegin == nil
  index >= (factoryEnd - factoryBegin) / 4
  factoryBegin[index] == nil

created = factoryBegin[index](five stack/context args)

if index - 2 <= 0x0F:
  dispatch post-create jump table 0x0053777C

return created
```

The curated post-create table shows where selected factory indexes store the
created object:

```text
index 2  -> owner+0x18 = created
index 3  -> owner+0x1C = created
index 4  -> owner+0x20 = created
index 5  -> owner+0x24 = created
index 6  -> owner+0x10 = created
index 7  -> owner+0x14 = created
index 8  -> call 0x004E5CA0 on owner+0x38 with {extra, created}
index 9  -> owner+0x34 = created
index 10 -> no owner store
index 11 -> no owner store
index 12 -> owner+0x28 = created
index 13 -> owner+0x2C = created
index 14 -> owner+0x30 = created
index 15 -> no owner store
index 16 -> no owner store
index 17 -> owner+0x44 = created
```

The related low `0x00CB` state transition helper (`0x004D9980`) is also relevant
to live Toto-Rak ordering:

```text
if incoming id == owner+0x1783C:
  no state change

if incoming id == 0xC0000000:
  clear owner+0x17838 current object
  clear/reset owner+0x950, +0x998, +0x17430, +0x174C8
  call 0x004D6A50

else:
  object = 0x004D9910(incoming id)
  owner+0x17838 = object
  update owner+0x17430, +0x174C8, +0x998
  owner+0x17840 = previous owner+0x1783C
  owner+0x1783C = incoming id
```

Why this matters for Toto-Rak:

```text
0x0130 dispatch depends on an object already being present in owner+0x17804.
That object normally comes from earlier 0x00CA create/register.
The current object pointer owner+0x17838 and current id owner+0x1783C are driven
by 0x00CB-style state transitions.
```

So the last static target is not another broad Lua/widget search. If live
`0x004D9910` misses or returns the wrong object, inspect the earlier object
lifecycle:

```text
0x00CA:
  packet/id
  create source / factory selector
  0x004D9030 validator result
  0x00537620 factory index
  created object
  created object vtable
  created object+0x80 handle

0x00CB:
  incoming id
  owner+0x17838 before/after
  owner+0x1783C before/after
  owner+0x17840 previous id

0x0130:
  [ebp+8] lookup key must match the object id seeded above
  0x004D9910 return should be the seeded object
```

That is the clean remaining static bridge: `0x00CA` seeds the object map,
`0x00CB` selects/updates current object state, and `0x0130` uses
`0x004D9910` to find the object whose `vtable+0x24` will decide whether slot 57
is real Lua (`0x0076C220`) or a wrapper/no-op lane (`0x0075AF00`).

## 2026-06-24 trace read: owner mismatch is now the leading failure

Trace source: pasted packet log around `2026-06-24T00:45:06Z`.

The useful packet-order shape is present:

```text
0x0132 widgetCreate bootstrap
0x00CC binds /Director/Occupancy/RaidFst0Dungeon03
0x012F KickEvent noticeEvent
0x012D EventStart noticeEvent
0x0130 _setInstanceRaid(true)
0x0130 _loadTextDataPermanently
0x0130 relogin(player, finishTime, false), type 0x50
0x0130 relogin(player, finishTime, false), type 0x05
fallback/container probes: _loadForm, _reserveWidgetContainer,
  _isExistWidgetInWidgetContainer, _getWidgetFromWidgetContainer,
  _createWidgetInWidgetContainer(...)
0x0131 EndEvent
```

But the owner identity is not aligned:

```text
0x00CC director bind:
  outer/focus id = 0x64F80002
  path = /Director/Occupancy/RaidFst0Dungeon03

0x012F KickNoticeFocus:
  owner = 0x64F80000
  event = noticeEvent
  params = relogin, finishTime, false

0x012D EventStart:
  owner = 0x64F80000
  event = noticeEvent

0x0130 relogin:
  owner = 0x64F80000
  event = noticeEvent
  function = relogin
  params = actor:0x00000001, finishTime, false
```

So the best current read is:

```text
The script actor we want is 0x64F80002.
The event/run-function chain is targeting 0x64F80000.
```

That explains the observed native result:

```text
totoraknative installed at 0x0076C220
slot57_calls = 0
```

A correct-looking `0x0130 relogin(player, finishTime, false)` can still miss
`LuaActorImpl::RunEventFunction` if the native shared dispatch lookup selects
the wrong object. In this trace, the wrong-object candidate is now concrete:
the packets are using `0x64F80000` where the recovered director bind names
`0x64F80002`.

The fallback/container probes do not yet prove local widget creation either.
They appear as incoming `0x0130` function packets:

```text
_loadForm("sqwt/widget/RaidDungeonExecutionWidget.form")
_reserveWidgetContainer(15)
_isExistWidgetInWidgetContainer(15)
_getWidgetFromWidgetContainer(15)
_createWidgetInWidgetContainer(
  15,
  "RaidDungeonExecutionWidget",
  nil,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime)
```

There is no later `commandAboutWidget(24228)` / client `0x012D widgetCreate`
in the trace. There is also no obvious ACK after the fallback/container cluster
before `0x0131 EndEvent`. Treat this as "the server sent fallback/container
function packets", not proof that the recovered retail
`openRaidDungeonExecutionWidget -> openWidgetYield -> commandAboutWidget(24228)`
path executed.

Next concrete proof/test:

```text
1. Target the director-bound actor id, 0x64F80002, for the notice/relogin chain:
   0x012F owner = 0x64F80002
   0x012D/EventStart owner = 0x64F80002 if applicable
   0x0130 owner = 0x64F80002
   event = noticeEvent
   function = relogin
   params = actor:0x00000001, finishTime, false
   prefer event type 0x05 for the final relogin test

2. If changing owner still gives no widget, hook 0x004DCFFF for that packet:
   [ebp+8] lookup key
   0x004D9910 return object
   object vtable
   object.vtable+0x24
   object+0x80
   [[object+0x80]]
   [[[object+0x80]]+0xE4]

3. Expected success proof:
   [[[object+0x80]]+0xE4] == 0x0076C220
   then hit 0x00897152
   then hit RaidFst0Dungeon03.relogin
   then client emits commandAboutWidget / 24228 widgetCreate
```

This trace moves the leading hypothesis from "bad relogin args" to "event
owner / native dispatch target mismatch". The most suspicious value is now
`0x64F80000` versus the actual bound `RaidFst0Dungeon03` actor at
`0x64F80002`.

## 2026-06-24 hook-safe post-lookup probe for `0x004DCFFF`

Do not hook `0x004D9910` entry for the next pass. The safer probe is in the
caller after `0x004D9910` returns on the shared `0x004DCFFF` path.

Relevant instruction window:

```asm
004DCFFF  mov  edx, [ebp+08h]      ; lookup key
004DD002  push edx
004DD003  mov  ecx, edi            ; owner/receive context
004DD005  call 004D9910
004DD00A  test eax, eax
004DD00C  je   004DD3A9            ; lookup miss exit
004DD012  mov  edx, [eax]          ; eax = returned object
004DD014  mov  ecx, eax            ; ecx = returned object
004DD016  mov  eax, [edx+24h]      ; eax = returnedObject.vtable+0x24
004DD019  push esi                 ; payload/context
004DD01A  call eax                 ; call concrete object receive handler
004DD01C  jmp  004DD3A9
```

Best probe points:

```text
0x004DD012:
  First lookup-hit-only point.
  EAX = returned object from 0x004D9910.
  ESI = payload/context passed to the later handler.
  EDI = owner/receive context used for 0x004D9910.
  [EBP+8] = lookup key used by 0x004D9910.
  This is after the `test/je`, so hook code does not need to preserve flags for
  the miss branch, though preserving flags is still preferred.

0x004DD019:
  Best "about to call concrete handler" point.
  ECX = returned object / this pointer for the handler.
  EDX = returned object's vtable.
  EAX = returnedObject.vtable+0x24, the concrete handler target.
  ESI = payload/context that will be pushed.
  [EBP+8] = lookup key.
```

For a hardware breakpoint / VEH single-step style probe, `0x004DD019` is the
cleanest because the dynamic call target has already been loaded:

```text
log lookupKey   = [EBP+8]
log object      = ECX
log objectVtbl  = EDX
log slot24      = EAX
log payload     = ESI

if slot24 == 0x004D8860:
  log handlePtr      = [object+0x80]
  log handleObj      = [handlePtr]
  log handleVtable   = [handleObj]
  log handleSlot57   = [handleVtable+0xE4]
```

For a 5-byte detour/trampoline, avoid `0x004DD00A`: that instruction sets flags
used by the immediately following `je`. Safer detour choices are:

```text
0x004DD012:
  relocate 7 bytes:
    mov edx, [eax]
    mov ecx, eax
    mov eax, [edx+24h]
  jump back to 0x004DD019

0x004DD019:
  only use if the hook framework can correctly relocate:
    push esi
    call eax
    jmp 004DD3A9
  A normal 5-byte overwrite lands across this call/jmp cluster, so this is
  better as a breakpoint probe than a simple inline detour.
```

Decision values:

```text
slot24 != 0x004D8860:
  decompile/log that exact slot24 handler next.

slot24 == 0x004D8860 and handleSlot57 == 0x0076C220:
  shared bridge reaches real LuaActorImpl RunEventFunction.
  If relogin still does not run, continue at 0x00896F70 / 0x00897152 resolver.

slot24 == 0x004D8860 and handleSlot57 == 0x0075AF00:
  shared bridge reaches no-op wrapper slot 57.
  ACK/order can look correct while RaidFst0Dungeon03.relogin never runs.

object == nil at 0x004DD00A:
  lookup key was not seeded in owner+0x17804; inspect earlier 0x00CA create and
  0x00CB state selection.
```

Given the trace with `slot57_calls=0`, the most useful next log row is one
line from `0x004DD019`: `lookupKey, object, objectVtbl, slot24, handlePtr,
handleObj, handleVtable, handleSlot57`.

## 2026-06-24 01:16 trace: fallback reached container create packet

Trace source:
`C:\Users\drime\.codex\attachments\5c3d4a6e-3aae-469a-8cc1-3164283404d9\pasted-text.txt`.

This later local trace keeps the same key owner mismatch as the `00:45` trace,
but it adds one useful boundary: the server-side fallback sequence is now
visible through the final slot-15 container create helper.

Observed order:

```text
0x0132 EventFunctionBootstrap:
  commandForced 0x000B
  commandDefault 0x000A
  commandWeak 0x0006
  commandContent 0x0008
  commandJudgeMode 0x0006
  commandRequest 0x0100
  widgetCreate 0x0100
  macroRequest 0x0100
  widgetCreate 0x000F

0x00CC:
  source/focus = 0x64F80002
  class = RaidFst0Dungeon03
  path = /Director/Occupancy/RaidFst0Dungeon03

0x012F KickNoticeFocus:
  owner = 0x64F80000
  event = noticeEvent
  params = relogin, finishTime, false

0x012D EventStart:
  owner = 0x64F80000
  event = noticeEvent
  type = 0x50

0x0130 RunEventFunction:
  _setInstanceRaid(true)
  _loadTextDataPermanently(nil)
  _loadTextDataPermanently()
  relogin(player, finishTime, false), type 0x50
  relogin(player, finishTime, false), type 0x05

0x0130 fallback/container helpers:
  _loadForm("sqwt/widget/RaidDungeonExecutionWidget.form")
  _reserveWidgetContainer(15)
  _isExistWidgetInWidgetContainer(15)
  _getWidgetFromWidgetContainer(15)
  _createWidgetInWidgetContainer(
    15,
    "RaidDungeonExecutionWidget",
    nil,
    "RaidDungeonExecutionWidget",
    15,
    true,
    1,
    finishTime)
```

Implications:

- The recovered `relogin(player, finishTime, false)` argument shape is now
  confirmed in the local packet stream on both the active event type (`0x50`)
  and explicit notice type (`0x05`).
- The `0x0132 widgetCreate` rows are still command/function bootstrap rows, not
  proof that `openRaidDungeonExecutionWidget` reached `commandAboutWidget`.
- The slot-15 fallback packet sequence matches the manually reconstructed local
  fallback in `WorldManager.cs`, including form path, container index `15`,
  widget name `RaidDungeonExecutionWidget`, content id `1`, and `finishTime`.
- Because the bind names `0x64F80002` while the event/function chain uses
  `0x64F80000`, this trace still does not prove
  `RaidFst0Dungeon03.relogin` executed on the bound recovered director object.
- Current source already tries to queue Toto-Rak `0x0130` packets with
  `director.Id` as packet source and owner in
  `WorldManager.QueueTotorakLegacyDutyRunFunction`. If a fresh build still
  decodes owner `0x64F80000`, verify build freshness and the capture decoder's
  source/owner fields before changing the packet construction logic.

Best next decomp/probe target remains the native `0x0130` lookup/dispatch
boundary, not the Lua argument list:

```text
At 0x004DD019, log:
  lookupKey = [EBP+8]
  object = ECX
  objectVtbl = EDX
  slot24 = EAX
  payload = ESI

For slot24 == 0x004D8860, also log:
  object+0x80
  [[object+0x80]]
  [[[object+0x80]]+0xE4]
```

Decision check:

```text
If owner 0x64F80000 returns the no-op slot-57 wrapper, retest by targeting
0x64F80002 for the notice/relogin chain.

If owner 0x64F80002 reaches LuaActorImpl slot 57 and still no widget appears,
continue at DesktopWidget.openWidgetYield / commandAboutWidget(24228) and the
root slot-15 `RaidDungeonExecutionWidget` actor creation path.
```

## 2026-06-24 01:42 trace: outer receiver reaches 0x64F80002

Trace source:
`C:\Users\drime\.codex\attachments\7c1bac1c-7a3e-4971-9857-ff65acb70ac2\pasted-text.txt`.

This capture predates the latest recovered Lua surface, but it is still useful
because it separates two fields that were being treated as one likely owner
mismatch:

```text
01:43:07.311 0x012F KickNoticeFocus:
  outer/source = 0x00000001
  owner        = 0x64F80000
  type         = 0x05
  event        = noticeEvent
  params       = relogin, finishTime, false

01:43:07.613 0x012D EventStart:
  owner = 0x64F80000
  type  = 0x50
  event = noticeEvent

01:43:07.619 / 01:43:07.959 0x0130:
  outer/source = 0x00000001
  owner        = 0x64F80000
  functions    = _setInstanceRaid, _loadTextDataPermanently

01:43:10.297 0x0132 WidgetCreateBootstrap:
  number = 0x000F
  function = widgetCreate

01:43:10.301 onward 0x0130:
  outer/source = 0x64F80002
  owner        = 0x64F80000
  functions    = _setInstanceRaid, _loadTextDataPermanently,
                 relogin(type 0x50), relogin(type 0x05),
                 _loadForm, _reserveWidgetContainer,
                 _isExistWidgetInWidgetContainer,
                 _getWidgetFromWidgetContainer,
                 _createWidgetInWidgetContainer(15, RaidDungeonExecutionWidget,
                                                nil, RaidDungeonExecutionWidget,
                                                15, true, 1, finishTime)
```

Implications:

- The trace does not include the `0x00CC` bind row, so the earlier `01:16`
  capture remains the better proof that `/Director/Occupancy/RaidFst0Dungeon03`
  binds as `0x64F80002`.
- It does corroborate that later `0x0130` packets can be addressed through
  `0x64F80002` while the embedded event `owner` field remains `0x64F80000`.
  That makes the embedded owner less likely to be the sole failure cause.
- The `0x0132 number=0x000F widgetCreate` row is still a function/bootstrap row.
  It is not proof that `openRaidDungeonExecutionWidget` reached
  `commandAboutWidget(24228)`.
- The strongest next runtime proof is whether the native `0x0130` lookup
  chooses the `0x64F80002` receiver/object before calling the Lua slot-57 path.

Updated hook priority:

```text
At FUN_004d9980 / 0x004DD019, log both:
  selectedKey / lookupKey
  current outer packet actor/source if available

Expected useful distinction:
  outer/source = 0x64F80002 and lookupKey = 0x64F80002:
    focus selection is good; continue at slot-57 / widget dispatch.

  outer/source = 0x64F80002 but lookupKey = 0x64F80000:
    packet is addressed to the director externally, but native lookup is still
    selecting the base occupancy owner.
```

## Local recovered-surface probe commands

The local GM helper now exposes every recovered `RaidFst0Dungeon03` method as a
separate probe-director command. These commands are meant to make captures less
ambiguous by separating recovered director methods from the C# slot-15 fallback.

```text
!totorak dutyinit       -> RaidFst0Dungeon03.initForEvent()
!totorak dutywidget     -> RaidFst0Dungeon03.relogin(player, finishTime, false)
!totorak dutycs [scene] [arg] [minutes] -> RaidFst0Dungeon03.eventNoticeCutScene(player, scene, arg, finishTime)
!totorak dutyseton      -> RaidFst0Dungeon03.widgetSetOn(player, 0, 0)
!totorak dutyclose      -> RaidFst0Dungeon03.widgetSetOff()
!totorak dutyfinalize   -> RaidFst0Dungeon03.processUIFinalize()
!totorak dutydebug      -> RaidFst0Dungeon03.debugSelect()
```

Expected packet proof by method:

```text
initForEvent/widgetSetOn/debugSelect:
  0x0130 ACK is enough to prove packet delivery only; recovered methods are
  no-ops and should not create UI.

widgetSetOff/processUIFinalize:
  Should close `RaidDungeonExecutionWidget` if it exists. No slot-15 create is
  expected.

relogin/eventNoticeCutScene:
  The recovered success boundary is still downstream widget behavior:
  `openRaidDungeonExecutionWidget -> openWidgetYield -> commandAboutWidget(24228)`
  and then root slot-15 `RaidDungeonExecutionWidget` traffic.
```

`RaidRoc0Dungeon01` now has the same local no-op recovered surface for parity,
but the GM probes above intentionally target Toto-Rak / `RaidFst0Dungeon03`.

## Static client C-decomp supplement for the 0x0130 lookup

The local Ghidra C export does not preserve the `0x004DCFFF` basic-block label
directly, but the relevant helper functions are present:

```text
Client Sourcecode Decomp/ffxivgame.exe.h:
  FUN_004d9910(int ownerContext)
  FUN_004d9980(int ownerContext, int selectedKey)
  FUN_004dd670 / 004dd6a0 / 004dd6d0 / 004dd700 / 004dd850 / 004dd880
```

Recovered static shape:

```text
FUN_004d9910(ownerContext):
  reads ownerContext + 0x17808
  validates ownerContext + 0x17804 as the map/list root
  returns *(node + 0x10) for the selected actor/object entry
  returns 0 when the lookup reaches the sentinel/root

FUN_004d9980(ownerContext, selectedKey):
  when selectedKey changes:
    object = FUN_004d9910(ownerContext, selectedKey)
    *(ownerContext + 0x17838) = object
    *(ownerContext + 0x17840) = previous selected key
    *(ownerContext + 0x1783c) = selectedKey
```

The decompiler expresses the lookup key through preserved registers/stack state
instead of a clean C argument, which matches the earlier assembly-level warning:
log registers at the call site rather than trusting the C signature.

The nearby `FUN_004dd670`, `FUN_004dd6a0`, `FUN_004dd6d0`,
`FUN_004dd850`, and `FUN_004dd880` bodies are mostly one-line vtable writes
to `UNK_00f90f..` tables. `FUN_004dd700` additionally initializes a small
container at `param + 8` before restoring another vtable. That cluster is useful
for class-family identification, but it does not replace the runtime proof:

```text
0x004DD019 still needs to log:
  lookupKey
  returned object
  returned object vtable
  vtable+0x24 call target
  slot-57 target when the object is the Lua actor bridge
```

### Object-selection field map

Additional static read of `Client Sourcecode Decomp/ffxivgame.exe.c`:

```text
FUN_004d92d0(ownerContext) at C export line ~35975:
  ownerContext+0x17834 = 0
  ownerContext+0x17838 = 0
  iterates the object list rooted at ownerContext+0x17808
  releases objects stored at node+0x10

FUN_004d9980(ownerContext, selectedKey) at C export line ~36054:
  if selectedKey == ownerContext+0x1783c:
    no state change

  if selectedKey == 0xC0000000:
    ownerContext+0x9A8   = 0xC0000000
    ownerContext+0x17838 = 0
    performs close/reset helpers

  else:
    ownerContext+0x17838 = FUN_004d9910(ownerContext, selectedKey)
    ownerContext+0x4A8   = 0
    ownerContext+0x9A8   = selectedKey

  ownerContext+0x17840 = old ownerContext+0x1783c
  ownerContext+0x1783c = selectedKey

FUN_004dac20(ownerContext, object) at C export line ~36167:
  object[0x22] is used as the object/actor key for cleanup
  if ownerContext+0x17834 == object:
    calls object.vtable+0x28 and clears ownerContext+0x17834
  if ownerContext+0x17838 == object:
    calls FUN_004d9980(ownerContext, 0xC0000000)

FUN_004d72e0(ownerContext) at C export line ~35813:
  returns ownerContext+0x17834

FUN_004d7430(ownerContext) at C export line ~35845:
  returns ownerContext+0x17838 != 0

FUN_004d7440(ownerContext, value) at C export line ~35853:
  ownerContext+0x1783c = 0xC0000000
  ownerContext+0x174ec = value
```

Interpretation for Toto-Rak:

```text
ownerContext+0x1783c  = selected actor/object key
ownerContext+0x17838  = selected actor/object pointer
ownerContext+0x17840  = previous selected key
0xC0000000            = selected-object reset sentinel
```

This gives a cleaner hook strategy than only watching the eventual
`RunEventFunction` receiver:

```text
1. Break/log FUN_004d9980.
   Log ownerContext, selectedKey, old +0x1783c, old +0x17838.
   For Toto-Rak, check whether selectedKey ever becomes the bound
   RaidFst0Dungeon03 id (`0x64F80002`) or only the base-looking
   `0x64F80000`.

2. Break/log after FUN_004d9910 inside FUN_004d9980.
   Log returned object and ownerContext+0x17838 after assignment.

3. Break/log FUN_004dac20 when object[0x22] is in the `0x64F8....` range.
   If the selected object is removed before relogin dispatch, the later
   `0x0130` ACK can still be misleading.

4. Keep the existing 0x004DD019 probe.
   This remains the best direct proof of which object receives the function
   packet and which vtable+0x24 handler is called.
```

### `FUN_00cccd80` gate/caller refinement

The C export shows the `FUN_00cccd80` predicate is called from
`FUN_00ccf7d0` only after checking a byte at `param_2+0x7F`:

```text
FUN_00ccf7d0(..., receiver) at C export line ~214638:
  if receiver[0x7F] == 0:
    FUN_00cca8a0()
  else:
    FUN_00cf08f0(receiver, ...)
    if FUN_00cccd80(receiver, receiver):
      FUN_00ccecb0(receiver, 1)
    ...
```

Within `FUN_00cccd80`, one early false path clears `receiver[0x7E]` before
returning false. The exact predicate names are still unknown, but the field
pair is now concrete enough for runtime logging:

```text
At FUN_00ccf7d0 call to FUN_00cccd80:
  log receiver
  log receiver[0x7F]
  log receiver[0x7E]

At FUN_00cccd80 return:
  log return value
  log receiver[0x7E] after return
```

Decision value:

```text
receiver[0x7F] == 0:
  0x00CCCD80 is skipped; dispatch/readiness is failing before that predicate.

FUN_00cccd80 returns false and clears receiver[0x7E]:
  receiver exists, but the success/readiness gate rejected it.

FUN_00cccd80 returns true:
  continue to the concrete Lua dispatch / slot-57 proof rather than arguing
  packet args.
```

### Receiver readiness bytes `+0x7E/+0x7F`

The nearby C export gives a little more shape to the `receiver+0x7E` and
`receiver+0x7F` bytes used around `FUN_00cccd80`.

```text
Receiver/init constructor at C export line ~220117:
  receiver[0x7F] = 1
  receiver[0x7E] = 0

FUN_00ce1bb0(receiver, ...) at C export line ~219601:
  if receiver[0x7E] != 0:
    return true
  otherwise, for a narrow set of receiver type/state ids:
    run lazy setup
    receiver[0x7E] = 1
    return true
  otherwise:
    return false

FUN_00ce1dd0(receiver, ..., modeByte) at C export line ~219716:
  oldReady = receiver[0x7E] != 0 and modeByte != 0
  receiver[0x7D] = modeByte
  if modeByte != 0 and receiver[0x7E] != 0:
    receiver[0x7E] = 0
  if oldReady:
    runs update/refresh helpers and may mark receiver[0x80] = 1
```

Conservative terminology for probes:

```text
receiver[0x7F] = armed/valid for the `FUN_00ccf7d0` gate.
receiver[0x7E] = prepared/lazy-ready for `FUN_00ce1bb0` and
                 `FUN_00cccd80`'s early gate.
receiver[0x7D] = mode byte that can invalidate prepared state.
```

This is still not enough to name the receiver type, but it sharpens the runtime
question:

```text
If receiver[0x7F] is already 0 at FUN_00ccf7d0:
  the event receiver was not armed; inspect creation/initialization.

If receiver[0x7F] is 1 but receiver[0x7E] never becomes 1:
  lazy preparation is failing before the Lua dispatch gate.

If receiver[0x7E] becomes 1, then is cleared by FUN_00ce1dd0:
  mode/state churn is invalidating a previously prepared receiver.
```

## 2026-06-24 focused no-24228 widget-open decomp

Short finding: the live `_createWidgetInWidgetContainer(15, "RaidDungeonExecutionWidget", ...)`
trace is not, by itself, proof that recovered Lua reached `24228` / `widgetCreate`.
The local fallback path in `Map Server/WorldManager.cs` can emit the exact observed
`_loadForm`, `_reserveWidgetContainer`, `_isExistWidgetInWidgetContainer`,
`_getWidgetFromWidgetContainer`, and `_createWidgetInWidgetContainer` calls without
going through `DesktopWidget.commandCreateWidget`.

The recovered Lua lane that should produce `24228` is:

```text
RaidFst0Dungeon03.relogin
  -> DesktopWidget.openRaidDungeonExecutionWidget(displayIdIgnored, contentId, finishTime)
  -> DesktopWidget.openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
  -> DesktopWidget.openWidget(...)
  -> DesktopWidget.openWidgetLocal(...)
  -> DesktopWidget.commandCreateWidget(...)
  -> PlayerBaseClass.commandAboutWidget(player:getSystemCommand(24228), false, ...)
  -> PlayerBaseClass.getCommandName(commandActor) == "widgetCreate"
  -> player:_executeCommand("widgetCreate", commandActor, ...)
```

### Exact no-24228 Lua gates

`DesktopWidget.openRaidDungeonExecutionWidget` ignores its first argument and calls:

```lua
self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
```

For Toto-Rak this means slot `15`, widget name and alias `"RaidDungeonExecutionWidget"`,
`visibleFlag == true`, `contentId == 1`, and the supplied `finishTime`.

`DesktopWidget.openWidgetYield` has the first root-slot gate. When `parent == nil`,
it checks `self:isWidgetExec(index)` before assigning `parent = self`:

```text
if parent == nil and desktopWidget.work.rootWidget[15] ~= nil:
  return nil
```

`isWidgetExec` only tests `rootWidget[index] ~= nil`; it does not validate `_isAlive()`.
A stale non-nil `rootWidget[15]` therefore blocks the command path before any 24228
attempt.

After that guard, `openWidgetYield` calls `openWidget`. If `openWidget` returns `true`,
it waits for `isCreateWidgetCommandPlaying()` to clear, fetches the widget, and returns
it. If `openWidget` returns `false`, it only gives up when
`desktopWidget.work.widgetEnableFlag[widgetType] == false`; otherwise it `_wait(0.1)`
and retries.

Slot `15` maps to widget type `5`. The exact recovered `getWidgetTypeByIndex` mapping is:

```text
0 -> 0
1 -> 1
2 -> 2
3 -> 3
4, 5 -> 4
6, 7, 8, 9, 15, 16 -> 5
10, 11, 12 -> 6
13, 14, 17 -> 7
```

So the exact enable gate for the raid execution widget is:

```text
desktopWidget.work.widgetEnableFlag[5]
```

`DesktopWidget.openWidget` returns `false` before `openWidgetLocal` when:

```text
getWidgetTypeByIndex(15) == nil
desktopWidget.work.widgetEnableFlag[5] == false
parent == nil and desktopWidget.work.rootWidget[15] ~= nil
```

In the normal `openRaidDungeonExecutionWidget` path, `openWidgetYield` has already
assigned `parent = desktopWidget`, so the `parent == nil and rootWidget[15] ~= nil`
gate normally only matters through the earlier `isWidgetExec(15)` check.

`DesktopWidget.openWidgetLocal` normalizes the parent/default desktop widget and checks
the parent actor before calling `commandCreateWidget`:

```text
aliasName nil -> aliasName = widgetName
parent nil -> parent = desktopWidget
parent != desktopWidget and parent:isShow() == true -> capture parent:getInputEnable()
parent:_isAlive() == false -> return false
otherwise commandCreateWidget(...)
```

For this Toto-Rak call the effective parent is `desktopWidget`, so a dead
`desktopWidget:_isAlive()` is the parent-alive blocker. If the enable flag remains
true, this `false` return makes `openWidgetYield` retry instead of immediately ending.
Raw bytecode also verifies there is only one real `commandCreateWidget` call here; the
double call visible in one recovered Lua listing is a decompiler artifact.

`DesktopWidget.commandCreateWidget` is the 24228 bridge:

```lua
return worldMaster:_getMyPlayer():commandAboutWidget(
  worldMaster:_getMyPlayer():getSystemCommand(24228),
  cancelFlag,
  widgetName,
  ...
)
```

For the raid execution widget, the effective call is:

```text
player:commandAboutWidget(
  player:getSystemCommand(24228),
  false,
  "RaidDungeonExecutionWidget",
  desktopWidget,
  true,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime
)
```

`PlayerBaseClass.getSystemCommand(24228)` is only:

```lua
if not _getStaticActor(24228):isEnabled() then
  return nil
end
return _getStaticActor(24228)
```

There is no `_isAlive()` check in this Lua function. If the static actor is disabled,
`commandActor` becomes `nil`. If `_getStaticActor(24228)` itself were nil, the recovered
Lua would likely fault at `:isEnabled()` rather than produce a clean `false`.

The static mapping is available and says command id `24228` is static actor
`0xA0F05EA4`, class `/Command/System/WidgetOpenCommand`, enabled, and bridged to
`WidgetOpenCommand`. Raw bytecode for `CharaBaseClass.getCommandName` verifies that a
`WidgetOpenCommand` returns command name `"widgetCreate"`.

`PlayerBaseClass.commandAboutWidget` has two silent `false` exits before
`_executeCommand`:

```text
now = worldMaster:_getServerTime()
blocker = player.playerWork.widgetCommandBurstBlocker

if blocker ~= 0 and now < blocker and cancelFlag == false:
  return false

commandName = player:getCommandName(commandActor) -- "widgetCreate" for 24228

if cancelFlag == false and player:_isCommandPlaying("widgetCreate") == true:
  return false

ok = player:_executeCommand("widgetCreate", commandActor, ...)
player.playerWork.widgetCommandBurstBlocker = now
if cancelFlag == true:
  player:recordRequestInformation()
return ok
```

So the last Lua-level no-24228 candidates are:

```text
player.playerWork.widgetCommandBurstBlocker is non-zero and still in the future
player:_isCommandPlaying("widgetCreate") == true
player:_executeCommand("widgetCreate", commandActor, ...) returns false or fails below Lua
```

`PlayerBaseClass.processCancelCommandAboutWidget("widgetCreate")` only calls:

```lua
desktopWidget:processWidgetCreateAborted()
```

That handler loops through `rootWidget[1..17]` and clears dead entries. It does not
emit a new `24228`; it is only cleanup after cancellation/abort.

### Current field/offset confidence

The recovered Lua work schema gives exact field names and logical indices:

```text
desktopWidget.work.rootWidget        array[1..17] actor
desktopWidget.work.widgetEnableFlag  array[1..7] boolean
desktopWidget.work.rootWidget[15]
desktopWidget.work.widgetEnableFlag[5]
```

No native C struct byte offset for these Lua work fields was recovered in the current
exports. The reliable notation is the Lua work-field name plus index above.

### Probe checklist

Before or inside `openRaidDungeonExecutionWidget`:

```text
desktopWidget.work.rootWidget[15]
desktopWidget.work.rootWidget[15] ~= nil and rootWidget[15]:_isAlive()
desktopWidget.work.widgetEnableFlag[5]
desktopWidget:_isAlive()
```

At `commandCreateWidget`:

```text
player:getSystemCommand(24228)
commandActor:isEnabled()
player:getCommandName(commandActor)
all commandAboutWidget args
```

At `commandAboutWidget`:

```text
worldMaster:_getServerTime()
player.playerWork.widgetCommandBurstBlocker
player:_isCommandPlaying("widgetCreate")
return value of player:_executeCommand("widgetCreate", commandActor, ...)
```

Packet/log expectation:

```text
Fallback lane proof:
  observed 0x0130 bootstrap/container calls, including _createWidgetInWidgetContainer

Recovered 24228 lane proof:
  0x012D EventStart owner=0xA0F05EA4 commandId=24228 event=widgetCreate
  then local WidgetOpenCommand allow/reject log
```

Therefore, if the trace has the fallback container sequence but no `0x012D` owner
`0xA0F05EA4` / `24228` / `widgetCreate`, focus on the Lua gates before
`commandCreateWidget`, the `widgetCommandBurstBlocker` / `_isCommandPlaying` exits,
or native `_executeCommand` returning/failing below Lua.

## 2026-06-24 02:12 clean no-fallback trace interpretation

The `2026-06-24T02:12:06Z` packet sample is useful because current local code has
`TotorakLegacyDutyEnableWidgetContainerFallback = false`. That means the trace is no
longer polluted by our direct slot-15 container fallback; it is a cleaner look at
whether recovered client Lua emits `24228/widgetCreate`.

Observed in the trace:

```text
02:12:06.141  0x0132 commandRequest/widgetCreate/macroRequest bootstrap number=0x0100
02:12:29.963  0x012F KickNoticeFocus owner=0x64F80000 event=noticeEvent params=relogin
02:12:30.018  0x012D EventStart owner=0x64F80000 commandId=0 event=noticeEvent
02:12:32.743  0x0132 WidgetCreateBootstrap number=0x000F function=widgetCreate
02:12:32.747  0x0130 owner/source=0x64F80002 embedded owner=0x64F80000 _setInstanceRaid
02:12:33.009  0x0130 owner/source=0x64F80002 embedded owner=0x64F80000 _loadTextDataPermanently
02:12:33.271  0x0130 owner/source=0x64F80002 embedded owner=0x64F80000 type=0x50 relogin
02:12:33.631  0x0130 owner/source=0x64F80002 embedded owner=0x64F80000 type=0x05 relogin
02:12:43.263  0x0131 EndEvent noticeEvent
```

Absent in this trace:

```text
0x012D EventStart owner=0xA0F05EA4 commandId=24228 event=widgetCreate
local [WidgetOpenCommand] allow/reject log
_loadForm("sqwt/widget/RaidDungeonExecutionWidget.form")
_reserveWidgetContainer(15)
_createWidgetInWidgetContainer(...)
```

Interpretation:

```text
The 0x0100 and 0x000F widgetCreate rows prove function bootstrap/registration only.
They are not the recovered system command 24228 lane.

The director notice event does start and stays active long enough to receive both
current-type and explicit-type relogin functions.

Recovered RaidFst0Dungeon03.relogin is small:
  fade in now-loading for notice event
  if clearFlag == false:
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)

The trace uses clearFlag=false, so the missing edge is after relogin delivery and
inside DesktopWidget/PlayerBaseClass, not in the director packet owner/source bridge.
```

This sample pushes the next runtime probe toward these exact values at the moment
`openRaidDungeonExecutionWidget` runs:

```text
desktopWidget.work.rootWidget[15]
desktopWidget.work.widgetEnableFlag[5]
desktopWidget:_isAlive()
player.playerWork.widgetCommandBurstBlocker
player:_isCommandPlaying("widgetCreate")
return from player:_executeCommand("widgetCreate", player:getSystemCommand(24228), ...)
```

## 2026-06-24 bytecode hook map for no-24228 path

These hook anchors come from stripped Lua 5.1 bytecode. `proto_off` and `pc off` are
luac file offsets, not live process addresses. They are still stable anchors for
bytecode/proto instrumentation and for mapping decompiled branches.

### RaidFst0Dungeon03.relogin

Source:

```text
tools/outputs/lpb/decomp_more_20260617/luac/director/occupancy/raidfst0dungeon03.luac
proto root.p3
proto_off=0x49E code_off=0x4B2
original lines=2682-2687
params=4
```

Register contract:

```text
R0 = self/director
R1 = player
R2 = finishTime
R3 = clearFlag
```

Relevant PCs:

```text
pc000 off=0x4B2  player:_fadeInNowLoadingForNoticeEventJustInArea()
pc002 off=0x4BA  compare clearFlag == false
pc003 off=0x4BE  jump to return when clearFlag ~= false
pc004 off=0x4C2  GETGLOBAL desktopWidget
pc005 off=0x4C6  SELF openRaidDungeonExecutionWidget
pc006 off=0x4CA  arg displayId = 2123
pc007 off=0x4CE  arg contentId = 1
pc008 off=0x4D2  arg finishTime = R2
pc009 off=0x4D6  CALL desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
pc010 off=0x4DA  return
```

Interpretation: with the captured `clearFlag=false`, the branch falls through to
`openRaidDungeonExecutionWidget`.

### DesktopWidget.openRaidDungeonExecutionWidget

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p228
proto_off=0x1BAC8 code_off=0x1BADC
original lines=9465-9467
params=4
```

Register contract:

```text
R0 = desktopWidget
R1 = displayId, ignored
R2 = contentId
R3 = finishTime
```

Relevant PCs:

```text
pc000 off=0x1BADC  SELF openWidgetYield
pc001 off=0x1BAE0  arg index = 15
pc002 off=0x1BAE4  arg widgetName = "RaidDungeonExecutionWidget"
pc003 off=0x1BAE8  aliasName = nil, parent = nil
pc004 off=0x1BAEC  visibleFlag = true
pc005 off=0x1BAF0  vararg contentId = R2
pc006 off=0x1BAF4  vararg finishTime = R3
pc007 off=0x1BAF8  CALL openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentId, finishTime)
```

Hook entry here to prove the received `contentId` and `finishTime`.

### DesktopWidget.openWidgetYield

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p544
proto_off=0x330E9 code_off=0x330FD
original lines=21617-21662
params=6 vararg=3
```

Register contract:

```text
R0 = desktopWidget
R1 = index              expected 15
R2 = widgetName         expected "RaidDungeonExecutionWidget"
R3 = aliasName          expected nil
R4 = parent             expected nil on entry, then desktopWidget
R5 = visibleFlag        expected true
vararg = contentId, finishTime
R8 = widgetType         expected 5 after getWidgetTypeByIndex(15)
R10 = openWidget result
```

Hook PCs:

```text
pc000 off=0x330FD  parent nil check
pc002 off=0x33105  call isWidgetExec(index)
pc005 off=0x33111  compare isWidgetExec(index) == true
pc007 off=0x33119  nil return value for rootWidget/index already executing
pc008 off=0x3311D  return nil before openWidget/commandCreateWidget
pc011 off=0x33129  getWidgetTypeByIndex(index)
pc013 off=0x33131  widgetType return, expected 5
pc018 off=0x33145  prepare openWidget(...)
pc025 off=0x33161  call openWidget(...)
pc026 off=0x33165  compare openWidget result == true
pc028 off=0x3316D  waitWidgetCreateYield(index), only after openWidget true
pc031 off=0x33179  getWidget(index, alias/name), only after openWidget true
pc039 off=0x33199  load work.widgetEnableFlag
pc041 off=0x331A1  read widgetEnableFlag[widgetType]
pc042 off=0x331A5  compare widgetEnableFlag[widgetType] == false
pc044 off=0x331AD  break/return nil when enable flag is false
pc045 off=0x331B1  _wait(0.1) when openWidget false but enable flag still true
pc048 off=0x331BD  retry loop to pc018
pc049 off=0x331C1  return widget/nil
```

Most useful values here:

```text
desktopWidget.work.rootWidget[15] via isWidgetExec
desktopWidget.work.widgetEnableFlag[5]
openWidget return value
```

### DesktopWidget.openWidget

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p523
proto_off=0x31E3E code_off=0x31E52
original lines=20888-20921
params=6 vararg=3
```

Hook PCs:

```text
pc005 off=0x31E66  call getWidgetTypeByIndex(index)
pc008 off=0x31E72  widgetType result, expected 5
pc009 off=0x31E76  compare widgetType == nil
pc011 off=0x31E7E  return false when widgetType nil
pc013 off=0x31E86  load work
pc014 off=0x31E8A  load widgetEnableFlag
pc015 off=0x31E8E  read widgetEnableFlag[widgetType]
pc016 off=0x31E92  compare flag == false
pc018 off=0x31E9A  return false when flag false
pc020 off=0x31EA2  parent nil check
pc022 off=0x31EAA  load work
pc023 off=0x31EAE  load rootWidget
pc024 off=0x31EB2  read rootWidget[index]
pc025 off=0x31EB6  compare rootWidget[index] ~= nil
pc027 off=0x31EBE  return false when parent nil and rootWidget[index] non-nil
pc029 off=0x31EC6  prepare openWidgetLocal(...)
pc036 off=0x31EE2  call openWidgetLocal(...)
pc037 off=0x31EE6  compare openWidgetLocal result == false
pc039 off=0x31EEE  return false from openWidget
pc041 off=0x31EF6  return true from openWidget
```

In the `openRaidDungeonExecutionWidget` path, `openWidgetYield` normally changes
`parent` from nil to `desktopWidget` before this function, so the `parent nil and
rootWidget[index]` gate is usually observed through `openWidgetYield`'s earlier
`isWidgetExec` call.

### DesktopWidget.openWidgetLocal

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p522
proto_off=0x31CFE code_off=0x31D12
original lines=20825-20870
params=6 vararg=3
```

Hook PCs:

```text
pc000 off=0x31D12  aliasName nil check
pc002 off=0x31D1A  aliasName = widgetName
pc004 off=0x31D22  parent nil check
pc006 off=0x31D2A  parent = desktopWidget
pc010 off=0x31D3A  parent:isShow(), only for non-desktop parent
pc014 off=0x31D4A  parent:getInputEnable(), only for visible non-desktop parent
pc017 off=0x31D56  parent:_isAlive()
pc019 off=0x31D5E  compare parent alive result == false
pc021 off=0x31D66  return false when parent/desktopWidget not alive
pc023 off=0x31D6E  prepare commandCreateWidget
pc032 off=0x31D92  call commandCreateWidget(...)
pc033 off=0x31D96  compare commandCreateWidget result == true
pc044 off=0x31DC2  return commandCreateWidget result
```

For the raid widget, the commandCreateWidget call registers as:

```text
R10 = "RaidDungeonExecutionWidget"
R11 = false
R12 = desktopWidget
R13 = inputEnable, normally true
R14 = "RaidDungeonExecutionWidget"
R15 = 15
R16 = true
R17+ = 1, finishTime
```

### DesktopWidget.commandCreateWidget

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget.luac
proto root.p4
proto_off=0x682 code_off=0x696
original lines=207-213
params=3 vararg=3
```

Register contract:

```text
R0 = desktopWidget
R1 = widgetName
R2 = cancelFlag
vararg = parent, inputEnable, aliasName, index, visibleFlag, contentId, finishTime
```

Hook PCs:

```text
pc007 off=0x6B2  player:getSystemCommand
pc008 off=0x6B6  load command id 24228
pc009 off=0x6BA  call getSystemCommand(24228), result in R6
pc010 off=0x6BE  move cancelFlag into commandAboutWidget arg
pc011 off=0x6C2  move widgetName into commandAboutWidget arg
pc012 off=0x6C6  append varargs
pc013 off=0x6CA  tailcall player:commandAboutWidget(commandActor, cancelFlag, widgetName, ...)
```

Full effective args:

```text
player:commandAboutWidget(
  player:getSystemCommand(24228),
  false,
  "RaidDungeonExecutionWidget",
  desktopWidget,
  true,
  "RaidDungeonExecutionWidget",
  15,
  true,
  1,
  finishTime
)
```

### PlayerBaseClass.getSystemCommand

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/chara/player/playerbaseclass.luac
proto root.p41
proto_off=0x3F52 code_off=0x3F66
original lines=7240-7257
params=2
```

Hook PCs:

```text
pc000 off=0x3F66  GETGLOBAL _getStaticActor
pc002 off=0x3F6E  call _getStaticActor(id), result in R2
pc003 off=0x3F72  prepare R2:isEnabled()
pc004 off=0x3F76  call commandActor:isEnabled(), result in R3
pc005 off=0x3F7A  test enabled
pc007 off=0x3F82  nil return value when disabled
pc008 off=0x3F86  return nil
pc009 off=0x3F8A  return commandActor
```

There is no nil guard before `R2:isEnabled()`. A missing static actor would fault here;
a disabled actor returns nil cleanly.

### CharaBaseClass.getCommandName

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/chara/charabaseclass.luac
proto root.p17
proto_off=0x12B8 code_off=0x12CC
original lines=524-598
params=2
```

WidgetOpenCommand branch:

```text
pc053 off=0x13A0  _isInstanceOf(commandActor, "SystemCommandBaseClass")
pc057 off=0x13B0  test SystemCommandBaseClass result
pc067 off=0x13D8  _isInstanceOf(commandActor, "WidgetOpenCommand")
pc070 off=0x13E4  call WidgetOpenCommand instance check
pc071 off=0x13E8  test WidgetOpenCommand result
pc073 off=0x13F0  commandName = "widgetCreate"
pc093 off=0x1440  return commandName
```

For static command actor `24228`, expected return is `"widgetCreate"`.

### PlayerBaseClass.commandAboutWidget

Source:

```text
tools/outputs/lpb/decomp_further_20260617/luac/chara/player/playerbaseclass.luac
proto root.p61
proto_off=0x57F9 code_off=0x580D
original lines=8030-8075
params=3 vararg=3
```

Register contract:

```text
R0 = player
R1 = commandActor
R2 = cancelFlag
R4 = now = worldMaster:_getServerTime()
R5 = player.playerWork.widgetCommandBurstBlocker
R6 = commandName
R7 = _isCommandPlaying / _executeCommand result
```

Hook PCs:

```text
pc000 off=0x580D  worldMaster:_getServerTime()
pc002 off=0x5815  now result in R4
pc003 off=0x5819  load playerWork
pc004 off=0x581D  read widgetCommandBurstBlocker into R5
pc005 off=0x5821  compare blocker ~= 0
pc007 off=0x5829  compare now < blocker
pc009 off=0x5831  test cancelFlag
pc011 off=0x5839  false return value for burst-blocked non-cancel command
pc012 off=0x583D  return false
pc013 off=0x5841  call getCommandName(commandActor)
pc015 off=0x5849  commandName result in R6
pc016 off=0x584D  cancelFlag branch
pc018 off=0x5855  call _isCommandPlaying(commandName)
pc020 off=0x585D  _isCommandPlaying result in R7
pc023 off=0x5869  false return value when command already playing
pc024 off=0x586D  return false
pc026 off=0x5875  cancel path: _cancelCommand(commandName)
pc029 off=0x5881  prepare _executeCommand(commandName, commandActor, ...)
pc033 off=0x5891  call _executeCommand, result in R7
pc034 off=0x5895  load playerWork
pc035 off=0x5899  widgetCommandBurstBlocker = now
pc038 off=0x58A5  cancel path recordRequestInformation()
pc040 off=0x58AD  return _executeCommand result
```

Authoritative bytecode order:

```text
if blocker ~= 0 and now < blocker and cancelFlag == false:
  return false

commandName = getCommandName(commandActor)

if cancelFlag == false and _isCommandPlaying(commandName):
  return false

if cancelFlag == true:
  _cancelCommand(commandName)

ok = _executeCommand(commandName, commandActor, ...)
player.playerWork.widgetCommandBurstBlocker = now
if cancelFlag == true:
  recordRequestInformation()
return ok
```

The recovered Lua text placed the blocker write before `_executeCommand`; the bytecode
shows `_executeCommand` happens first.

### Native execute edge

`playerbaseclass_u.lua` maps the Lua inline/native boundary as:

```text
PlayerBaseClass._executeCommand_inl      -> "_executeCommand_cpp"
PlayerBaseClass._isCommandPlaying_inl    -> "_isCommandPlaying_cpp"
PlayerBaseClass._canExecuteCommand_inl   -> "_canExecuteCommand_cpp"
```

No useful native body for `_executeCommand_cpp` or `_isCommandPlaying_cpp` was recovered
from the current exports. If `pc033` in `commandAboutWidget` is reached and returns true,
the external proof should be an outgoing `0x012D EventStart` with owner/static actor
`0xA0F05EA4`, command id `24228`, and event name `widgetCreate`.

### Slot/type hook summary

`WidgetBaseClass.getWidgetTypeByIndex` is:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/widgetbaseclass_common.luac
proto root.p9
proto_off=0x237E code_off=0x2392
```

Slot-15 branch:

```text
pc041 off=0x2436  compare index == 15
pc044 off=0x2442  compare index == 16
pc046 off=0x244A  widgetType = 5
pc072 off=0x24B2  return widgetType
```

`DesktopWidget.isWidgetExec` is:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p531
proto_off=0x32588 code_off=0x3259C
```

Hook PCs:

```text
pc000 off=0x3259C  load work
pc001 off=0x325A0  load rootWidget
pc002 off=0x325A4  read rootWidget[index]
pc005 off=0x325B0  return true when rootWidget[index] ~= nil
pc007 off=0x325B8  return false when rootWidget[index] == nil
```

Important root alive nuance:

```text
The no-24228 root-slot gate does not call rootWidget[15]:_isAlive().
It only checks rootWidget[15] ~= nil through isWidgetExec.
```

The later `rootWidget[index]:_isAlive()` checks are here:

```text
DesktopWidget.getWidget
  proto root.p530
  proto_off=0x324BE code_off=0x324D2
  pc004 off=0x324E2  load work
  pc005 off=0x324E6  load rootWidget
  pc006 off=0x324EA  read rootWidget[index]
  pc009 off=0x324F6  rootWidget[index]:_isAlive()
  pc011 off=0x324FE  compare alive == false
  pc015 off=0x3250E  clear rootWidget[index] when dead
  pc017 off=0x32516  return nil

DesktopWidget.processWidgetCreateAborted
  proto root.p533
  proto_off=0x32804 code_off=0x32818
  pc004 off=0x32828  loop i=1..17, load work
  pc006 off=0x32830  read rootWidget[i]
  pc012 off=0x32848  rootWidget[i]:_isAlive()
  pc014 off=0x32850  compare alive == false
  pc018 off=0x32860  clear rootWidget[i] when dead
```

So hook `rootWidget[15]:_isAlive()` for diagnostics, but do not expect that call to
protect the early `openWidgetYield` no-24228 exit.

`DesktopWidget.waitWidgetCreateYield` is:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac
proto root.p545
proto_off=0x3327C code_off=0x33290
```

Hook PCs:

```text
pc000 off=0x33290  call isCreateWidgetCommandPlaying()
pc002 off=0x33298  test result
pc005 off=0x332A4  _wait(0.1) while command is playing
pc009 off=0x332B4  return when no create command is playing
```

`DesktopWidget.isCreateWidgetCommandPlaying` is:

```text
tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget.luac
proto root.p5
proto_off=0x744 code_off=0x758
```

Hook PCs:

```text
pc007 off=0x774  player:getSystemCommand
pc008 off=0x778  load 24228
pc009 off=0x77C  getSystemCommand(24228)
pc010 off=0x780  tailcall player:isCommandAboutWidgetPlaying(commandActor)
```

`PlayerBaseClass.processCancelCommandAboutWidget("widgetCreate")` is cleanup only:

```text
tools/outputs/lpb/decomp_further_20260617/luac/chara/player/playerbaseclass.luac
proto root.p64
proto_off=0x5B17 code_off=0x5B2B
pc000 off=0x5B2B  compare commandName == "widgetCreate"
pc002 off=0x5B33  GETGLOBAL desktopWidget
pc004 off=0x5B3B  desktopWidget:processWidgetCreateAborted()
```

## 2026-06-24 02:36 clean owner-matched no-24228 trace

The `2026-06-24T02:36:50Z` sample is the cleanest trace so far for the
post-dispatch question. The later relogin packets no longer show the earlier split
between packet source `0x64F80002` and embedded owner `0x64F80000`; both are now
`0x64F80002`.

Observed:

```text
02:36:50.028  0x0132 commandRequest/widgetCreate/macroRequest bootstrap number=0x0100
02:37:21.363  0x012F KickNoticeFocus owner=0x64F80002 type=0x05 event=noticeEvent
                 params=str:relogin int:1782272256 false
02:37:21.699  0x012D EventStart owner=0x64F80002 commandId=2 type=0x50 event=noticeEvent
02:37:21.702  0x0130 owner=0x64F80002 type=0x50 _setInstanceRaid
02:37:22.042  0x0130 owner=0x64F80002 type=0x50 _loadTextDataPermanently
02:37:24.342  0x0132 WidgetCreateBootstrap number=0x000F function=widgetCreate
02:37:24.346  0x0130 source=0x64F80002 owner=0x64F80002 type=0x50 _setInstanceRaid
02:37:24.609  0x0130 source=0x64F80002 owner=0x64F80002 type=0x50 _loadTextDataPermanently
02:37:24.874  0x0130 source=0x64F80002 owner=0x64F80002 type=0x50 relogin
                 params=actor:0x00000001 int:1782272256 false
02:37:25.235  0x0130 source=0x64F80002 owner=0x64F80002 type=0x05 relogin
                 params=actor:0x00000001 int:1782272256 false
02:37:34.876  0x0131 EndEvent type=0x50 event=noticeEvent
```

Still absent:

```text
0x012D EventStart owner=0xA0F05EA4 commandId=24228 event=widgetCreate
[WidgetOpenCommand] allow/reject log
_loadForm("sqwt/widget/RaidDungeonExecutionWidget.form")
_reserveWidgetContainer(15)
_createWidgetInWidgetContainer(...)
```

Interpretation:

```text
The event owner/source bridge is no longer the leading suspect for this sample.

Both relogin invocations have the recovered argument shape:
  player, finishTime, clearFlag=false

Recovered RaidFst0Dungeon03.relogin should therefore fall through:
  pc002 clearFlag == false
  pc009 openRaidDungeonExecutionWidget(2123, 1, finishTime)

Since there is still no 0xA0F05EA4 / 24228 / widgetCreate EventStart, the next
unproven boundary is inside:
  DesktopWidget.openWidgetYield/rootWidget[15]
  DesktopWidget.openWidget/widgetEnableFlag[5]
  DesktopWidget.openWidgetLocal desktopWidget:_isAlive()
  DesktopWidget.commandCreateWidget
  PlayerBaseClass.commandAboutWidget
  native _executeCommand("widgetCreate", commandActor, ...)
```

Two relogin functions appear about `361 ms` apart. If the first call returns before
`commandCreateWidget`, the second call should repeat the same early gate. If the first
call reaches `commandAboutWidget` but native `_executeCommand` returns false, the best
hook is `PlayerBaseClass.commandAboutWidget root.p61 pc029-pc040` to capture the
execute call and return value.

Highest-value runtime hooks for the next run:

```text
RaidFst0Dungeon03.relogin root.p3:
  pc002 clearFlag compare
  pc009 call openRaidDungeonExecutionWidget

DesktopWidget.openWidgetYield root.p544:
  pc002/pc005 isWidgetExec(15)
  pc008 return nil before openWidget
  pc013 widgetType, expected 5
  pc025 openWidget result
  pc041 widgetEnableFlag[5]

DesktopWidget.openWidgetLocal root.p522:
  pc017 desktopWidget:_isAlive()
  pc021 early false return
  pc032 commandCreateWidget call

DesktopWidget.commandCreateWidget root.p4:
  pc009 getSystemCommand(24228)
  pc013 commandAboutWidget tailcall

PlayerBaseClass.commandAboutWidget root.p61:
  pc004 widgetCommandBurstBlocker
  pc015 commandName, expected "widgetCreate"
  pc020 _isCommandPlaying result
  pc033 _executeCommand result
  pc040 final return
```

## 2026-06-24 06:24 slot57-positive/no-command next decomp

Latest run context:

```text
2026-06-24 06:24:49-06:25:02 local
totoraknative thunks loaded
command thunk breakpoints installed:
  0x006DE660
  0x006DE670
  0x006DE680
  0x006DE690
  0x006DE6A0

Observed:
  zero command_thunk rows
  zero execute_command rows
  0x012F Kick noticeEvent/relogin
  0x012D EventStart owner=0x64F80002
  0x0130 _setInstanceRaid
  0x0130 _loadTextDataPermanently
  0x0132 widgetCreate bootstrap
  0x0130 relogin twice, actor:0x00000001, finishTime, false
  handle_slot57=0x0076C220

Still absent:
  0x012D owner=0xA0F05EA4 commandId=24228 event=widgetCreate
  command_thunk / execute_command rows
  WidgetOpenCommand allow/reject
  _loadForm / _reserveWidgetContainer / _createWidgetInWidgetContainer
```

This run proves the map-object handle can become the real `LuaActorImpl`
slot-57 lane. It does not prove the native receiver reached the Lua method
body. The next decomp target is therefore the receiver success/body handoff,
not the command thunks.

Native boundary now splits like this:

```text
0x0076C220
  LuaActorImpl slot 57 / RunEventFunction packet decode
  constructs StartServerOrderEventFunctionReceiver

0x0089E260 -> 0x00896F70
  receiver execute and run-function dispatch

failure/fallback:
  0x008970ED -> 0x00894090 -> 0x0075E670
  0x0089722B -> 0x00894090 -> 0x0075E670
  sends/ACKs without proving RaidFst0Dungeon03.relogin ran

success:
  0x00897152
    [dispatcher+8]+0x20 = 1
    optional 0x00892F60
    call 0x006DE1E0
    call 0x00CD0940-family body handoff
    call 0x00CD0A00
```

The local Ghidra C export names the body handoff cluster with nearby but not
always identical addresses to the installed-binary notes. The field behavior is
stable:

```text
FUN_00CCF7D0(this, receiver)
  if *(*(*(this+0x0C)+0x1CC)+8) != 0:
    return

  if receiver[0x7F] == 0:
    FUN_00CCA8A0()
    return

  FUN_00CF08F0(receiver, ...)
  FUN_00CF34C0()

  if FUN_00CCCD80(receiver, receiver) != 0:
    FUN_00CCECB0(receiver, 1)

  post/update cleanup:
    FUN_00CF33E0(...)
    FUN_00CE16F0()
    FUN_00CE1710()
    optional FUN_00CE2880/FUN_00CE19B0
    optional FUN_00CCD910/FUN_00D00770/FUN_00CF09C0
```

Exact gates to hook:

```text
[this+0x0C]+0x1CC+8
  nonzero returns before the receiver readiness path.

receiver[0x7F]
  0 means skip FUN_00CCCD80 and FUN_00CCECB0 completely.
  This byte is initialized to 1 by the receiver/node constructor path and can
  later be cleared by FUN_00CF19C0 through *(param_1+0x38)+0x7F = 0.

receiver[0x7E]
  lazy-ready/prepared byte.
  initialized to 0.
  set to 1 by FUN_00CE1BB0 / FUN_00CE1CC0 / related prepare paths.
  cleared by FUN_00CCCD80 on one false/refresh path.
  cleared by FUN_00CE1DD0 when mode byte is nonzero and 0x7E was set.

receiver[0x7D]
  mode byte written by FUN_00CE1DD0.
  nonzero mode can invalidate receiver[0x7E].
```

`FUN_00CCCD80(receiver, receiver)` visible branch model:

```text
if FUN_00CE1BB0(...) != 0:
  build local stack object
  uVar3 = FUN_00CD2A30()
  uVar2 = FUN_00445D20(uVar3)

  if high-byte test from the decompiler state is 0:
    FUN_00CD6330(receiver)
    return false

  receiver[0x7E] = 0

FUN_00CF33A0()
FUN_00CD7A50(receiver+4)
FUN_00CF34C0()
FUN_00CF3340(receiver)
FUN_00CD7B00(..., receiver+4, ...)
FUN_00CF34F0(0xfffffffe)
cVar1 = FUN_00CF37C0(0xffffffff)

if cVar1 != 0:
  FUN_00CF34F0(0xfffffffd)
else:
  error/report path through FUN_00CF3860 / FUN_00CC6FA0 / FUN_00CD5960

return cVar1 != 0
```

`FUN_00CCECB0(receiver, 1)` visible branch model:

```text
iStack_20 = *(*(receiver+0x0C)+0x1C0)
uStack_24 = *(iStack_20+0x34)

prep = FUN_00CE1BB0(*(receiver+0x0C), ...)
FUN_00CF34C0()

*(receiver+0x11C) = -1

pendingCount = 0
if *(receiver+0xDC) != 0:
  pendingCount = (*(receiver+0xE0) - *(receiver+0xDC)) / 0x3C

workResult = FUN_00CCFFE0(
  receiver,
  *(receiver+0x0C),
  receiver+4,
  1,
  pendingCount != 0,
  receiver+0x11C
)

if FUN_00CF39C0() != 0:
  workResult = 1
else:
  if workResult == 0 and prep == 0:
    FUN_00CD0840(&uStack_24, &UNK_00CCFE80)
    maybe grow receiver+0x70 queue
  FUN_00CCE8E0(receiver)

return workResult == 0
```

Important decompiler caveat: `FUN_00CCFFE0` is declared as three arguments in
the generated header, but the caller clearly supplies six logical values on the
stack. Hooking this entry should dump stack args rather than trusting the header.

`FUN_00CCFFE0(...)` useful visible effects:

```text
stackBase = FUN_00CF34C0()

if param3[9] == 0 or ((param3[10] - param3[9]) >> 2) == 0:
  *param3 = -1
else:
  *param3 = stackBase + 2

if low byte of the decompiled param_2 is 0:
  FUN_00CF4230(stackBase+1, ...)
else:
  FUN_00CF4010(stackBase+1, 0xffffffff, ...)

then type/call-family split:
  FUN_00CF3D80() true -> FUN_00CD3E70(...)
  else FUN_00CF3D60() true -> FUN_00CD3990(...)
  else FUN_00CF3D90() true -> FUN_00CD4080(...)

return one byte captured as uStack_45
```

Next hook row order:

```text
1. 0x00897152
   Proves native success branch after slot-57. If this does not hit, do not
   debug DesktopWidget yet.

2. Fallback edges 0x008970ED and 0x0089722B
   If either hits instead of 0x00897152, the client ACK/update path can still
   look alive while relogin did not execute.

3. FUN_00CCF7D0 entry
   Log:
     this
     receiver
     safe read *(*(*(this+0x0C)+0x1CC)+8)
     receiver[0x7D], receiver[0x7E], receiver[0x7F], receiver[0x80]
     *(receiver+0x0C)
     *(receiver+0xDC), *(receiver+0xE0)
     *(receiver+0x11C)

4. FUN_00CCCD80 entry/return
   Log receiver, receiver[0x7E], receiver[0x7F], return AL.

5. FUN_00CCECB0 entry/return
   Log receiver, arg2, pendingCount from receiver+0xDC/0xE0,
   receiver+0x11C before/after, return AL.

6. FUN_00CCFFE0 entry/return
   Dump stack args 1..6, param3 pointer, param3[9], param3[10],
   *param3 before/after, returned byte.

7. Only after the above passes, hook script/Lua bytecode:
   RaidFst0Dungeon03.relogin root.p3 pc002 and pc009.
   DesktopWidget.openWidgetYield root.p544 pc002/pc008/pc041.
```

Decision table for the next run:

```text
slot57=0x0076C220, no 0x00897152:
  receiver decode happened, but native dispatch fell to fallback/not-ready.

0x00897152 hit, FUN_00CCF7D0 gate flag nonzero:
  success branch entered but body handoff returned before receiver readiness.

FUN_00CCF7D0 hit, receiver[0x7F] == 0:
  receiver/node was disarmed before body execution.

FUN_00CCCD80 returns false:
  receiver exists but lazy-ready/body predicate rejected it; watch receiver[0x7E].

FUN_00CCCD80 true and FUN_00CCECB0/FUN_00CCFFE0 run:
  native body handoff accepted. The next proof is relogin pc002/pc009 and then
  DesktopWidget.openWidgetYield slot 15 / widgetEnableFlag[5].

RaidFst0Dungeon03.relogin pc009 hit but no command thunk:
  shift to openWidgetYield/openWidget/openWidgetLocal early returns.

DesktopWidget.commandCreateWidget or PlayerBaseClass.commandAboutWidget hit:
  then the old 24228/getSystemCommand/_executeCommand probes become relevant
  again.
```

## 2026-06-24 installed-binary exact receiver hook sites

Follow-up disassembly used the installed binary at:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe
size: 15,996,808 bytes
timestamp: 2012-09-20 20:34:04
```

This supersedes the previous hook priority for the direct slot-57 success path.
`0x00CCF7D0 -> 0x00CCECB0` is a sibling path in the same body family, but the
actual `0x00897152 -> 0x00CD0940` route calls `0x00CCF9B0`, then
`0x00CCCD80`, then conditionally `0x00CCEE30`.

Exact native dispatch split:

```asm
; 0x00896F70 run-function resolver
0x00896FD0  je   0x008971B4        ; owner actor nil
0x00896FDA  je   0x008971B4        ; owner+0x5C == 0
0x00896FE5  je   0x008971B4        ; dispatcher context nil
0x00896FF4  je   0x008971B4        ; dispatcher ready vcall false
0x00897076  jne  0x00897152        ; event/function lookup success
0x008970ED  call 0x00894090        ; lookup miss fallback/ACK path
0x0089722B  call 0x00894090        ; owner/context-not-ready fallback/ACK path
```

Exact success body:

```asm
0x00897152  mov  eax, [esi+0x08]
0x00897155  mov  byte ptr [eax+0x20], 1
0x00897161  call dword ptr [vtable+0x0C]
0x00897163  cmp  al, 1
0x00897165  jne  0x00897171
0x0089716C  call 0x00892F60        ; optional
0x00897179  call 0x006DE1E0
0x00897199  call 0x00CD0940
0x008971AA  call 0x00CD0A00
```

`0x00CD0940` is the small handoff wrapper:

```asm
0x00CD0940  mov  eax, [esp+0x10]
0x00CD0945  mov  esi, ecx
0x00CD0947  mov  ecx, [esi]
0x00CD094A  call 0x00CCDDA0
0x00CD0961  call 0x00CD7A30
0x00CD0968  push eax               ; receiver/node returned by 0x00CD7A30
0x00CD0969  call 0x00CCF9B0
0x00CD096F  ret  0x10
```

Direct body gate at `0x00CCF9B0`:

```asm
0x00CCF9B0  push esi
0x00CCF9B1  mov  esi, ecx          ; body context
0x00CCF9B3  mov  eax, [esi+0x0C]
0x00CCF9B6  mov  ecx, [eax+0x1CC]
0x00CCF9BC  cmp  byte ptr [ecx+0x08], 0
0x00CCF9C0  jne  0x00CCFA04        ; context gate return
0x00CCF9C3  mov  ebx, [esp+0x0C]   ; receiver/node from 0x00CD7A30
0x00CCF9C7  cmp  byte ptr [ebx+0x7F], 0
0x00CCF9CB  je   0x00CCFA03        ; disarmed receiver return
0x00CCF9D4  call 0x00CF34C0
0x00CCF9DF  mov  ecx, esi
0x00CCF9E3  call 0x00CCCD80
0x00CCF9E8  test al, al
0x00CCF9EA  je   0x00CCF9F9        ; predicate false, skip accepted body
0x00CCF9F4  call 0x00CCEE30        ; accepted body continuation
0x00CCF9FC  call 0x00CF33E0
0x00CCFA05  ret  0x0C
```

`0x00CCCD80` argument/return details:

```asm
; caller 0x00CCF9B0
0x00CCF9DD  push ebx               ; arg1 = receiver/node
0x00CCF9DF  mov  ecx, esi          ; this/body context
0x00CCF9E3  call 0x00CCCD80

; callee setup
0x00CCCDAD  mov  edi, ecx          ; body context
0x00CCCDAF  mov  eax, [edi+0x0C]
0x00CCCDB2  mov  ebx, [esp+0x148]  ; receiver/node after prolog
0x00CCCDBC  call 0x00CE1BB0
0x00CCCE10  je   0x00CCCF58        ; early false path
0x00CCCE16  mov  byte ptr [ebx+0x7E], 0
...
0x00CCCF58  mov  edx, [edi+0x0C]
0x00CCCF5B  mov  ecx, [edx+0x1CC]
0x00CCCF62  call 0x00CD6330
0x00CCCF67  xor  al, al            ; return false
0x00CCCF72  mov  al, 1             ; return true path
0x00CCCF8D  ret  0x08
```

`0x00CCEE30` accepted-body continuation:

```asm
0x00CCEE6B  mov  eax, [esp+0x120]  ; second pushed arg from 0x00CCF9B0
0x00CCEE72  mov  ebx, [esp+0x11C]  ; receiver/node
0x00CCEE79  mov  esi, ecx          ; body context
0x00CCEE7B  mov  ecx, [esi+0x0C]
0x00CCEE7E  mov  ebp, [ecx+0x1C0]
0x00CCEE91  call 0x00CF39C0
0x00CCEE98  je   0x00CCEFC2        ; normal/work path

; alternate/exception-ish path when 0x00CF39C0 is true
0x00CCEEA9  call 0x00CF3540
0x00CCEEC9  call 0x00CF3780
0x00CCEECE  test al, al
0x00CCEED4  je   0x00CCEF0F
0x00CCEEE2  call 0x00CCFB20
0x00CCEF37  call 0x00CCFC00
0x00CCEFBD  jmp  0x00CCF260

; normal/work path
0x00CCEFC8  call 0x00CF08F0
0x00CCEFCD  test al, al
0x00CCEFEA  call 0x00CE1BB0
0x00CCEFFA  lea  ecx, [esi+0x11C]
0x00CCF008  mov  eax, [esi+0xDC]
0x00CCF015  mov  ebp, [esi+0xE0]
0x00CCF042  call 0x00CCFFE0
0x00CCF090  call 0x00CF39C0
0x00CCF097  jne  0x00CCF1C4
0x00CCF0A1  jne  0x00CCF1B9
0x00CCF0AD  call 0x00CCFAE0
0x00CCF0B4  je   0x00CCF1B9
0x00CCF0BF  jne  0x00CCF1B9
0x00CCF19B  call 0x00CD4970
0x00CCF1BB  call 0x00CCE8E0
0x00CCF259  xor  eax, eax
0x00CCF25D  sete al                ; final AL = (bl == 0)
0x00CCF287  ret  0x08
```

`0x00CCFFE0` work helper argument map from the callee prolog:

```asm
0x00CD0007  mov  edi, [esp+0x50]   ; arg1 after prolog
0x00CD0017  mov  ebp, [esp+0x4C]   ; arg0-ish / previous stack slot
0x00CD002F  mov  esi, [esp+0x54]   ; arg2 after prolog
0x00CD0056  mov  eax, [esi+0x24]
0x00CD0060  mov  edx, [esi+0x28]
0x00CD006A  mov  eax, [esp+0x5C]
0x00CD006E  mov  [eax], 0xFFFFFFFF ; out index = -1
0x00CD0076  mov  eax, [esp+0x5C]
0x00CD007D  mov  [eax], edx        ; out index = stackBase + 2
0x00CD0087  cmp  byte ptr [esp+0x58], bl
0x00CD009C  call 0x00CF4010
0x00CD00AB  call 0x00CF4230
0x00CD00BA  call 0x00CF3D80
0x00CD00D7  call 0x00CD3E70
0x00CD00E2  call 0x00CF3D60
0x00CD00FF  call 0x00CD3990
0x00CD010A  call 0x00CF3D90
0x00CD0127  call 0x00CD4080
0x00CD0176  ret
```

Revised next live hook order:

```text
1. 0x00897152
   Success branch after event/function lookup.

2. 0x008970ED and 0x0089722B
   Fallback ACK paths. If these hit without 0x00897152, relogin body did not
   cross the native success bridge.

3. 0x00CD0969
   Confirms the success wrapper is calling the direct body gate.

4. 0x00CCF9B0 entry and branch sites:
   log ecx as bodyContext, [ecx+0x0C], [[ecx+0x0C]+0x1CC]+8,
   stack receiver/node, receiver[0x7D], receiver[0x7E], receiver[0x7F],
   receiver[0x80].

5. 0x00CCF9C0 / 0x00CCF9CB / 0x00CCF9EA
   Exact early exits for context gate, receiver disarmed, predicate false.

6. 0x00CCCD80 entry and return 0x00CCCF8D
   Log bodyContext, receiver/node, receiver[0x7E] before/after, AL.

7. 0x00CCF9F4 and 0x00CCEE30
   If these hit, native accepted the body continuation.

8. 0x00CCF042 / 0x00CCFFE0 and 0x00CD0176
   Only needed if 0x00CCEE30 enters the normal/work path; log args, out index,
   and returned byte.

9. If 0x00CCEE30 returns accepted and still no widget path:
   move to Lua body/bytecode proof: RaidFst0Dungeon03.relogin pc002/pc009,
   then DesktopWidget.openWidgetYield slot 15 / widgetEnableFlag[5].
```

## 2026-06-24 deeper accepted-body/type-handler sites

Further static pass below `0x00CCEE30` shows that the useful proof after
`0x00CCCD80 == true` is the `0x00CCFFE0` type split and the virtual calls made
by its selected handler. The small helper at `0x00CCFAE0` is only an empty-vector
predicate over a `0x3C`-byte entry vector; it is useful for queue diagnostics,
but it is not body-execution proof.

`0x00CCFAE0`:

```asm
0x00CCFAE0  mov  eax, [ecx+0x08]
0x00CCFAE3  test eax, eax
0x00CCFAE5  jne  0x00CCFAF1
0x00CCFAE7  xor  ecx, ecx
0x00CCFAEB  sete cl
0x00CCFAEE  mov  al, cl
0x00CCFAF0  ret

0x00CCFAF1  mov  ecx, [ecx+0x0C]
0x00CCFAF4  sub  ecx, eax
0x00CCFAF6  mov  eax, 0x88888889
0x00CCFAFB  imul ecx
0x00CCFAFF  sar  edx, 5            ; divide byte length by 0x3C
0x00CCFB0B  test eax, eax
0x00CCFB0D  sete cl
0x00CCFB10  mov  al, cl
0x00CCFB12  ret
```

The `0x00CCFFE0` selected-action split is exact:

```asm
0x00CD00BA  call 0x00CF3D80
0x00CD00BF  test al, al
0x00CD00C1  je   0x00CD00DE
0x00CD00D0  mov  ecx, [ebp+0x1CC]
0x00CD00D6  push eax               ; fallback object 0x01266B10 if missing
0x00CD00D7  call 0x00CD3E70        ; handler A
0x00CD00DC  jmp  0x00CD0132

0x00CD00E2  call 0x00CF3D60
0x00CD00E7  test al, al
0x00CD00E9  je   0x00CD0106
0x00CD00F8  mov  ecx, [ebp+0x1CC]
0x00CD00FE  push eax
0x00CD00FF  call 0x00CD3990        ; handler B
0x00CD0104  jmp  0x00CD0132

0x00CD010A  call 0x00CF3D90
0x00CD010F  test al, al
0x00CD0111  je   0x00CD0132
0x00CD0120  mov  ecx, [ebp+0x1CC]
0x00CD0126  push eax
0x00CD0127  call 0x00CD4080        ; handler C
```

Handler A, `0x00CD3E70`, sets an active byte and then calls virtual slot
`+0x10` unless `0x00CF19C0` reports a consumed/blocked state:

```asm
0x00CD3EBC  mov  byte ptr [esi+0x08], 1
...
0x00CD3FBE  call 0x00CF19C0
0x00CD3FC3  cmp  al, bl
0x00CD3FC5  je   0x00CD3FCC
0x00CD3FC7  mov  byte ptr [esi+0x08], bl
0x00CD3FCA  jmp  0x00CD4033
...
0x00CD401C  mov  edx, [esi]
0x00CD401E  mov  edx, [edx+0x10]
0x00CD4029  mov  ecx, esi
0x00CD402B  call edx               ; handler A virtual slot +0x10
0x00CD402D  mov  byte ptr [edi+0x13B], bl
```

Handler B, `0x00CD3990`, sets active/type bytes and calls virtual slot `+0x04`:

```asm
0x00CD39E2  mov  byte ptr [esi+0x08], 1
0x00CD39E6  mov  byte ptr [esi+0x09], 1
...
0x00CD3A9D  mov  edx, [esi]
0x00CD3AA0  mov  eax, [edx+0x04]
0x00CD3AA3  mov  ecx, esi
0x00CD3AAD  call eax               ; handler B virtual slot +0x04
0x00CD3AEB  mov  byte ptr [edi+0x13B], bl
```

Handler C, `0x00CD4080`, sets active byte and calls virtual slot `+0x14`:

```asm
0x00CD40D2  mov  byte ptr [esi+0x08], 1
...
0x00CD4189  mov  edx, [esi]
0x00CD418C  mov  eax, [edx+0x14]
0x00CD418F  mov  ecx, esi
0x00CD4199  call eax               ; handler C virtual slot +0x14
0x00CD41D7  mov  byte ptr [edi+0x13B], bl
```

Queue-growth helper `0x00CD4970` is a separate later diagnostic, not the first
proof target:

```asm
0x00CD49D8  mov  edx, [esi]
0x00CD49DA  mov  edx, [edx+0x30]
0x00CD49E0  mov  ecx, esi
0x00CD49EA  call edx               ; queue helper virtual slot +0x30
```

Revised post-`0x00CCEE30` hook priority:

```text
If 0x00CCF9F4 calls 0x00CCEE30:
  log entry ecx as bodyContext, [ecx+0x0C], [bodyContext+0x1CC].

If 0x00CCEE30 normal/work path reaches 0x00CCF042:
  log 0x00CCFFE0 entry and return, plus out index at [esp+0x5C].

Inside 0x00CCFFE0:
  hook 0x00CD00D7 / 0x00CD00FF / 0x00CD0127.
  These identify handler A/B/C from CF3D80/CF3D60/CF3D90.

Inside selected handler:
  handler A: hook 0x00CD402B virtual slot +0x10.
  handler B: hook 0x00CD3AAD virtual slot +0x04.
  handler C: hook 0x00CD4199 virtual slot +0x14.

If any handler virtual call executes:
  native body processing is past the receiver gate and into action dispatch.
  The next useful proof becomes RaidFst0Dungeon03.relogin pc002/pc009.

If 0x00CCEE30 hits but no handler virtual call executes:
  stay in native body queue/state:
    0x00CCFAE0 empty-vector result
    0x00CCFFE0 out index
    bodyContext+0xDC/+0xE0
    bodyContext+0x13B/+0x13C/+0x13D
```

## 2026-06-24 receiver handoff register map at 0x00897152

The exact installed-binary success branch starts at `0x00897152` inside
`0x00896F70`. This function returns with `ret 0x1C`, so it has one `this` in
`ECX` plus seven stack args. After the prolog, the live stack base at the
breakpoint is:

```text
ESP+0x00  security cookie
ESP+0x04  saved EDI
ESP+0x08  saved ESI
ESP+0x0C  saved EBP
ESP+0x10  saved EBX
ESP+0x90  previous SEH frame
ESP+0x94  SEH handler 0x00EBE115
ESP+0x98  try/state value, normally 6 on this branch
ESP+0x9C  return address
ESP+0xA0  original arg1
ESP+0xA4  original arg2
ESP+0xA8  original arg3
ESP+0xAC  original arg4
ESP+0xB0  original arg5
ESP+0xB4  original arg6
ESP+0xB8  original arg7
```

Important correction for the live probe: `[ESP+4]` at `0x00897152` is the
saved `EDI`, not the first stack argument. The stack args begin at `ESP+0xA0`
because the SEH/local/register-save prolog is still active.

Register state at `0x00897152`:

```text
EIP = 0x00897152
ESI = incoming ECX from 0x00896F70, the dispatcher/lane object
EDI = ESI + 0x04, lookup/subobject used by the resolver
EBX = original arg1, loaded from [ESP+0xA0]
EBP = resolved owner/actor candidate
EAX/AL = nonzero return from 0x00790AA0, overwritten immediately
ECX = volatile leftover from 0x00790AA0, do not treat as this
EDX = volatile leftover from 0x00790AA0, do not treat as stable
```

How `EBX` and `EBP` get there:

```asm
0x00896F9A  mov  esi, ecx          ; save original this
0x00896F9C  mov  ebx, [esp+0xAC]   ; original arg4 for resolver
0x00896FA3  lea  edi, [esi+0x04]
...
0x00896FB2  mov  ebx, [esp+0xA0]   ; arg1
0x00896FB9  mov  ebp, ebx          ; direct resolver path
...
0x00896FC5  mov  ebx, [esp+0xA0]   ; arg1
0x00896FCC  mov  ebp, eax          ; lookup result path
0x00896FCE  test ebp, ebp
0x00896FD6  cmp  byte ptr [ebp+0x5C], 0
...
0x00897076  jne  0x00897152        ; only this success branch reaches here
```

The success handoff itself:

```asm
0x00897152  mov  eax, [esi+0x08]
0x00897155  mov  byte ptr [eax+0x20], 1
0x00897159  mov  ecx, [esi+0x08]
0x0089715C  mov  eax, [ecx]
0x0089715E  mov  edx, [eax+0x0C]
0x00897161  call edx
0x00897163  cmp  al, 1
0x00897165  jne  0x00897171
0x00897167  mov  ecx, [esi+0x08]
0x0089716A  push ebx
0x0089716B  push edi
0x0089716C  call 0x00892F60

0x00897171  push edi
0x00897172  lea  eax, [esp+0x24]   ; base ESP + 0x20
0x00897176  push eax
0x00897177  mov  ecx, ebx
0x00897179  call 0x006DE1E0

0x00897186  mov  edx, [esp+0xA4]   ; original arg2
0x0089718D  push esi
0x0089718E  lea  ecx, [esp+0x64]   ; base ESP + 0x60
0x00897192  push ecx
0x00897193  push edx
0x00897194  push ebp
0x00897195  lea  ecx, [esp+0x30]   ; base ESP + 0x20
0x00897199  call 0x00CD0940
```

At the `0x00897179` call instruction, after the two pushes:

```text
ECX       = EBX = original arg1
[ESP]     = base ESP + 0x20
[ESP+0x4] = EDI = ESI + 0x04
```

At the `0x00897199` call instruction, after the four pushes:

```text
ECX        = base ESP + 0x20
[ESP]      = EBP, resolved owner/actor candidate
[ESP+0x04] = original arg2
[ESP+0x08] = base ESP + 0x60
[ESP+0x0C] = ESI, dispatcher/lane object
```

At `0x00CD0940` function entry this becomes:

```text
ECX        = base ESP + 0x20          ; wrapper/local this
[ESP+0x04] = EBP                     ; arg1
[ESP+0x08] = original arg2           ; arg2
[ESP+0x0C] = base ESP + 0x60         ; arg3
[ESP+0x10] = ESI                     ; arg4
```

The wrapper then converts this to the `0x00CCF9B0` body gate:

```asm
0x00CD0940  mov  eax, [esp+0x10]    ; dispatcher/lane ESI
0x00CD0945  mov  esi, ecx           ; wrapper/local this
0x00CD0947  mov  ecx, [esi]
0x00CD094A  call 0x00CCDDA0
...
0x00CD0961  call 0x00CD7A30
0x00CD0966  mov  ecx, [esi]
0x00CD0968  push eax                ; receiver/node returned by 0x00CD7A30
0x00CD0969  call 0x00CCF9B0
```

At `0x00CCF9B0` function entry:

```text
ECX        = bodyContext = [wrapper/local this]
[ESP+0x04] = receiver/node returned by 0x00CD7A30
```

Opt-in `totoraknative` probe columns for the receiver/handoff run:

```text
hook_897152:
  regs: eax ebx ecx edx esi edi ebp esp eip
  stack: [esp+0x98], [esp+0x9C], [esp+0xA0]..[esp+0xB8]
  guarded:
    dispatcher=esi
    dispatcher_ctx=[esi+0x08]
    dispatcher_ctx_vt=[dispatcher_ctx]
    dispatcher_ctx_slot0c=[dispatcher_ctx_vt+0x0C]
    dispatcher_ctx_byte20=[dispatcher_ctx+0x20]
    lookup_subobject=edi
    actor_arg1=ebx
    resolved_actor=ebp
    actor_arg1_alive_byte=[ebx+0x5C]
    resolved_actor_alive_byte=[ebp+0x5C]
    local20=esp+0x20
    local60=esp+0x60

hook_897179:
  ecx should equal actor_arg1/ebx
  [esp] should equal local20
  [esp+0x04] should equal lookup_subobject/edi

hook_897199:
  ecx should equal local20
  [esp] should equal resolved_actor/ebp
  [esp+0x04] should equal original arg2
  [esp+0x08] should equal local60
  [esp+0x0C] should equal dispatcher/esi

hook_CD0940_entry:
  ecx wrapper/local this
  [esp+0x04] arg1 resolved_actor
  [esp+0x08] arg2
  [esp+0x0C] arg3 local60
  [esp+0x10] arg4 dispatcher

hook_CCF9B0_entry:
  bodyContext=ecx
  receiverNode=[esp+0x04]
  receiverNode bytes: +0x7D +0x7E +0x7F +0x80
  bodyOwner=[bodyContext+0x0C]
  executor=[bodyOwner+0x1CC]
  executor_vtable=[executor]
  executor_active_byte=[executor+0x08]
  executor slots: [vtable+0x04], [vtable+0x10], [vtable+0x14], [vtable+0x30]
```

The executor base/default vtable is also now concrete. `FUN_00CD37F0` writes
`0x0110E564`, and the slots used by the later type handlers are no-op stubs:

```text
0x0110E568 -> 0x00CD2D00 ; ret 4
0x0110E574 -> 0x00CD2D30 ; ret 4
0x0110E578 -> 0x00CD2D40 ; ret 4
0x0110E594 -> 0x00CD2DB0 ; ret 0x0C
```

So the next live decision is straightforward:

```text
No hit at 0x00897152:
  the 0x0130 ACK/relogin observation is still native fallback/queue behavior.

Hit 0x00897152 but no hit at 0x00897179:
  failure is the dispatcher context vcall at [dispatcher_ctx_vt+0x0C] or its
  optional 0x00892F60 path.

Hit 0x00897179 but no hit at 0x00897199:
  failure is inside 0x006DE1E0 or its local20 handoff.

Hit 0x00897199 and 0x00CD0940 but no 0x00CCF9B0:
  failure is in 0x00CCDDA0 / 0x00CD7A30 wrapper conversion.

Hit 0x00CCF9B0 with executor_vtable == 0x0110E564:
  native accepted the body gate, but the executor is still the base no-op
  vtable; the Lua method body is not being driven by a concrete executor.

Hit 0x00CCF9B0 with non-base executor slots:
  hook the concrete slot targets next, especially +0x04, +0x10, +0x14, +0x30.
```

## 2026-06-24 readiness-gate split before 0x0089722B

The next narrow split is the four readiness gates that all jump to the common
fallback builder at `0x008971B4`, then to the common fallback/ACK call at
`0x0089722B`. A breakpoint only at `0x0089722B` cannot identify the failed
gate, because `0x008971B4` clobbers `ESI`, `EBX`, and `EBP` while building the
fallback payload.

Installed-binary exact gate sequence:

```asm
0x00896F9A  mov  esi, ecx          ; dispatcher/lane object
0x00896F9C  mov  ebx, [esp+0xAC]   ; original arg4, used by resolver
0x00896FA3  lea  edi, [esi+0x04]   ; resolver subobject
0x00896FA6  push ebx
0x00896FA7  mov  ecx, edi
0x00896FA9  call 0x00CC7190
0x00896FAE  test al, al
0x00896FB0  je   0x00896FBD
0x00896FB2  mov  ebx, [esp+0xA0]   ; original arg1
0x00896FB9  mov  ebp, ebx          ; direct owner path
0x00896FBB  jmp  0x00896FCE

0x00896FBD  push ebx
0x00896FBE  mov  ecx, edi
0x00896FC0  call 0x00CC7A50
0x00896FC5  mov  ebx, [esp+0xA0]   ; original arg1
0x00896FCC  mov  ebp, eax          ; resolved owner path

0x00896FCE  test ebp, ebp
0x00896FD0  je   0x008971B4        ; gate 1: owner actor nil

0x00896FD6  cmp  byte ptr [ebp+0x5C], 0
0x00896FDA  je   0x008971B4        ; gate 2: owner +0x5C == 0

0x00896FE0  mov  ecx, [esi+0x08]
0x00896FE3  test ecx, ecx
0x00896FE5  je   0x008971B4        ; gate 3: dispatcher context nil

0x00896FEB  mov  eax, [ecx]
0x00896FED  mov  edx, [eax+0x10]
0x00896FF0  call edx               ; gate 4 pre-call: dispatcher ready vcall
0x00896FF2  test al, al
0x00896FF4  je   0x008971B4        ; gate 4: ready vcall returned false
```

Gate hook table:

```text
0x00896FD0 gate_owner_nil
  Previous instruction: test ebp, ebp
  Failure condition: ZF == 1, EBP == 0
  Stable values:
    dispatcher=ESI
    resolver_subobject=EDI
    actor_arg1=EBX = [ESP+0xA0]
    resolver_arg4=[ESP+0xAC]

0x00896FDA gate_owner_disabled
  Previous instruction: cmp byte ptr [ebp+0x5C], 0
  Failure condition: ZF == 1, safe_u8(EBP+0x5C) == 0
  Stable values:
    owner=EBP
    owner_flag_5c=safe_u8(EBP+0x5C)

0x00896FE5 gate_dispatcher_context_nil
  Previous instruction: test ecx, ecx
  Failure condition: ZF == 1, ECX == 0
  Stable values:
    dispatcher=ESI
    dispatcher_ctx=ECX = safe_u32(ESI+0x08)

0x00896FF0 gate_ready_pre_vcall
  This is not a failure branch. Hook it to preserve the indirect target.
  Stable values before call:
    dispatcher=ESI
    dispatcher_ctx=ECX
    dispatcher_ctx_vtable=EAX = safe_u32(ECX)
    ready_vcall_target=EDX = safe_u32(EAX+0x10)

0x00896FF4 gate_ready_vcall_false
  Previous instruction: test al, al
  Failure condition: ZF == 1, AL == 0
  Values:
    ready_return_al=AL
    ready_return_zf=(EFLAGS & 0x40) != 0
```

Common readiness fallback:

```asm
0x008971B4  push 0
0x008971B6  push 0x40
0x008971B8  lea  ecx, [esp+0x30]
0x008971BC  call 0x00785B90
...
0x00897213  mov  eax, [esp+0xB0]   ; original arg5
0x0089721A  mov  ecx, [esp+0xA0]   ; original arg1
0x00897221  push ebp               ; fallback payload length
0x00897222  push esi               ; fallback payload buffer
0x00897223  push 0x012C3F72
0x00897228  push eax               ; original arg5
0x00897229  push ecx               ; original arg1
0x0089722A  push edi               ; resolver subobject, original dispatcher+4
0x0089722B  call 0x00894090
```

At `0x0089722B`, the readiness gate identity is already gone. Treat this as the
common readiness-fallback emit:

```text
[ESP+0x00] = resolver_subobject / original dispatcher+4
[ESP+0x04] = original arg1
[ESP+0x08] = original arg5
[ESP+0x0C] = 0x012C3F72
[ESP+0x10] = fallback payload buffer
[ESP+0x14] = fallback payload length
```

Recommended `totoraknative` opt-in rows:

```text
readiness_gate:
  address
  gate_name
  taken = branch condition only, not merely breakpoint hit
  eflags
  zf
  al
  eax ebx ecx edx esi edi ebp esp
  stack_args: [esp+0xA0] [esp+0xA4] [esp+0xA8] [esp+0xAC] [esp+0xB0] [esp+0xB4] [esp+0xB8]
  guarded: [esi+0x08], [[esi+0x08]], [[[esi+0x08]]+0x10], [ebp+0x5C]

readiness_fallback_emit at 0x0089722B:
  args: [esp+0x00] [esp+0x04] [esp+0x08] [esp+0x0C] [esp+0x10] [esp+0x14]
```

Decision matrix:

```text
0x00896FD0 taken:
  owner actor resolution failed; EBP is nil before any owner flag/context checks.

0x00896FDA taken:
  owner actor exists, but [owner+0x5C] is zero/disabled.

0x00896FE5 taken:
  owner actor is valid, but dispatcher context [dispatcher+0x08] is nil.

0x00896FF4 taken:
  dispatcher context exists, but its vtable +0x10 readiness method returned AL=0.
  The concrete target from 0x00896FF0 is the next subtarget.

No readiness gate taken, but no 0x00897152:
  this is not the 0x0089722B readiness fallback. The later lookup split at
  0x00897076 failed and should hit sibling fallback 0x008970ED instead.

No readiness gate taken and 0x00897152 hits:
  the native receiver crossed the readiness bridge; continue at the handoff
  map in the previous section.
```

## 2026-06-24 dispatcher lane context attach target

The latest live probe result narrows the failure to the dispatcher/lane context
pointer, not the packet owner/source shape and not the widget command bridge.

Live state at the failing run:

```text
owner actor resolved: yes
owner +0x5C enabled: yes
dispatcher/lane object: ESI = 0x3FD22590
[ESI+0x08]: 0
failed gate: 0x00896FE5 gate_dispatcher_context_nil_taken
fallback: 0x008971B4 -> 0x0089722B
```

The important correction is the extra hop:

```asm
0x0089E260 receiver body
  ...
  0x0089E270 call 0x00CC7A50       ; EAX = owner_context
  0x0089E275 mov  ebp, eax         ; EBP = owner_context
  ...
  0x0089E2BC mov  ecx, ebp
  0x0089E2BE call 0x006E1140

0x006E1140 lane thunk
  0x006E1140 mov [esp+0x04], ecx   ; preserve owner_context as stack arg
  0x006E1144 mov ecx, [ecx+0xF8]   ; ECX = owner_context->lane
  0x006E114A jmp 0x00896F70        ; this/lane enters dispatcher

0x00896F70 dispatcher
  ...
  0x00896FE0 mov ecx, [esi+0x08]   ; ECX = lane->context
  0x00896FE3 test ecx, ecx
  0x00896FE5 je 0x008971B4         ; current failing branch
```

So the known live `ESI=0x3FD22590` is already the value loaded from
`owner_context+0xF8`. The nil value is not `owner_context+0xF8`; it is
`[lane+0x08]`. The next question is therefore:

```text
Who writes or clears 0x3FD22590+0x08?
```

Nearby detach/clear candidate:

```asm
0x00896ED0 lane detach/replace helper, exact entry still class-ambiguous
0x00896EF4 mov esi, ecx
0x00896F02 cmp dword ptr [esi+0x08], 0
0x00896F05 mov byte ptr [esi+0x1C], 0
0x00896F08 mov byte ptr [esi+0x1D], 0
0x00896F0B je 0x00896F50
0x00896F0D mov edi, [esi+0x08]
0x00896F10 mov dword ptr [esi+0x08], 0
...
0x00896F32 mov dword ptr [esi+0x08], 0
0x00896F35 call 0x00896AF0
```

This is a proven nearby clearer for the same lane field. If either clear-site
breakpoint hits before the failing `relogin`, the lane was attached and then
detached. If neither hits and `[lane+0x08]` is already zero at the thunk/entry
points, the Toto-Rak lane was probably never attached to a receiver context.

I added an opt-in `totoraknative` lane probe in:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Windower\TotorakNativeProbe.cs
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Windower\Windower\Addons\totoraknative\totoraknative.lua
```

Build verified:

```text
dotnet build "FFXIV Windower.csproj" -p:Platform=x86
Build succeeded, 0 warnings, 0 errors
```

New command:

```text
!totoraknative lane
```

Aliases accepted by the native side and Lua wrapper:

```text
lane
setup
attach
context
```

This command reuses the handoff INT3 ring and installs the lane/setup breakpoints
alongside the existing readiness gates:

```text
0x0089E260 receiver_89e260_entry
0x0089E275 receiver_89e275_owner_context
0x0089E2BE receiver_89e2be_call_lane_thunk
0x006E1140 lane_thunk_6e1140_entry
0x006E1144 lane_thunk_6e1144_load_f8
0x006E114A lane_thunk_6e114a_jmp_dispatcher
0x00896ED0 lane_detach_896ed0_entry
0x00896F10 lane_detach_896f10_clear_ctx
0x00896F32 lane_detach_896f32_clear_ctx
0x00896F70 dispatcher_896f70_entry
0x00896F9A dispatcher_896f9a_after_prolog
0x00896FD0 gate_owner_nil
0x00896FDA gate_owner_disabled
0x00896FE5 gate_dispatcher_context_nil
0x00896FF0 gate_ready_pre_vcall
0x00896FF4 gate_ready_vcall_false
0x008970ED receiver_lookup_miss_fallback
0x00897152 handoff_897152
0x00897179 handoff_897179
0x00897199 handoff_897199
0x0089722B receiver_not_ready_fallback
0x00CD0940 body_cd0940
0x00CCF9B0 body_ccf9b0
```

New `handoff` CSV fields to read for this problem:

```text
name
eax_f8 / eax_f8_ctx
ebp_f8 / ebp_f8_ctx
ecx_08 / ecx_f8 / ecx_f8_ctx
ecx_b8 / ecx_c0 / ecx_c4 / ecx_c8
ecx_1c / ecx_1d / ecx_1e
esi_08 / esi_f8 / esi_f8_ctx
esi_1c / esi_1d / esi_1e
dispatcher_ctx
dispatcher_ctx_vt
dispatcher_ctx_slot10
```

How to read one run:

```text
receiver_89e275_owner_context:
  EAX is the owner_context returned by 0x00CC7A50.
  eax_f8 should become the lane object.
  eax_f8_ctx is [lane+0x08].

lane_thunk_6e1144_load_f8:
  ECX is still owner_context.
  ecx_f8 should equal the lane object.
  ecx_f8_ctx is the missing lane context.

lane_thunk_6e114a_jmp_dispatcher:
  ECX should now be the lane object.
  ecx_08 is the context pointer that later becomes dispatcher_ctx.

dispatcher_896f70_entry:
  ECX is the lane object on entry.
  ecx_08 should be nonzero if the lane is attached.

dispatcher_896f9a_after_prolog / gate_dispatcher_context_nil:
  ESI is the lane object.
  esi_08 and dispatcher_ctx are the same missing field.

lane_detach_896f10_clear_ctx / lane_detach_896f32_clear_ctx:
  ESI should be the lane object being detached.
  A hit here before relogin explains why the later dispatcher sees nil.
```

Suggested live sequence:

```text
!totoraknative off
!totoraknative lane
!totorak livetest
```

Expected decision matrix:

```text
owner_context+0xF8 is zero:
  setup did not create/assign a lane object for this actor context.

owner_context+0xF8 is nonzero, but [lane+0x08] is zero at 0x006E1144:
  lane object exists but was never attached before the receiver call.

[lane+0x08] is nonzero at 0x006E1144 but zero by 0x00896FE5:
  something detached it between thunk entry and readiness gate; use the
  0x00896F10/0x00896F32 rows first, then add a hardware watch if needed.

0x00896F10 or 0x00896F32 hits with the Toto-Rak lane:
  proven detach path. Next decomp target is the caller of 0x00896ED0/0x00896AF0.

[lane+0x08] is nonzero through 0x00896FE5:
  this is no longer the context-nil failure; continue to ready vcall or lookup.
```

## 2026-06-24 deeper lane attach decomp pass

This pass is decomp-only and focuses on the dispatcher/lane context field that
blocks the Toto-Rak `relogin` handoff before `0x00897152`.

The important static correction still holds:

```text
owner_context+0xF8 = dispatcher/lane object
lane+0x08          = attached runtime context required by 0x00896F70
```

The `0x006E1140` thunk proves the first line:

```asm
0x006E1140  mov [esp+0x04], ecx   ; replace first stack arg with owner_context
0x006E1144  mov ecx, [ecx+0xF8]   ; ECX = owner_context->lane
0x006E114A  jmp 0x00896F70        ; run dispatcher body with this=lane
```

So the current failure is not "no lane object." It is specifically "lane object
has no attached context":

```asm
0x00896FE0  mov  ecx, [esi+0x08]  ; ESI = lane
0x00896FE3  test ecx, ecx
0x00896FE5  je   0x008971B4       ; Toto-Rak live failure
```

### Adjacent class family is mostly teardown, not attach

The nearby Ghidra C export exposes three destructor-shaped functions:

```c
FUN_00895380(this):
  this->vtable = 0x01056FF4
  if (*(u8 *)(this+0x1E) != 0 && *(u32 *)(this+0x04) != 0)
      (***(this+0x04))(1)
  FUN_0077CD50()
  FUN_00CC9330()

FUN_00895490(this):
  this->vtable = 0x01057004
  FUN_00895380(this)

FUN_00895560(this):
  this->vtable = 0x0105705C
  FUN_00CD0A30()
  FUN_00895380(this)
```

Useful field inference from these destructors:

```text
object+0x04 = owned child / resolver-like object pointer
object+0x1E = ownership or "destroy child" flag
```

These functions do not write `object+0x08` as an attached context. They are
destructor/cleanup paths. That means hits on `0x00895380`, `0x00895490`, or
`0x00895560` are useful for proving teardown, but they are not the expected
attach writer for the live `lane+0x08` nil.

### 0x0089ABE0 / 0x0089AF40 are container cleanup

The `0x0105705C` reference at `FUN_0089ABE0` initially looked promising, but
the C body makes it a cleanup loop over a container rooted at `this+0x04`:

```c
FUN_0089ABE0(container):
  sentinel = *(container+0x04)
  node = *sentinel
  *sentinel = sentinel
  *(sentinel+0x04) = sentinel
  *(container+0x08) = 0

  while (node != sentinel) {
      next = *(node+0x00)
      *(node+0x08) = 0x0105705C
      FUN_00CD0A30()
      FUN_00895380()
      free(node, 0x2C)
      node = next
  }
```

`FUN_0089AF40` calls `FUN_0089ABE0()` and then frees the container sentinel:

```c
FUN_0089AF40(container):
  FUN_0089ABE0(container)
  free(*(container+0x04), 0x2C)
  *(container+0x04) = 0
```

This is not a good candidate for initializing the live dispatcher lane context.
It is a teardown path for 0x2C-byte container nodes. The `0x0105705C` write here
should be treated as "set derived destructor vtable before freeing node," not as
"attach dispatcher context."

Related cleanup helpers:

```c
FUN_0089AB50(container):
  clear tree/list through FUN_0089A840()
  free(*(container+0x04), 0x10)
  *(container+0x04) = 0
  *(container+0x08) = 0

FUN_0089ADA0(container):
  same clear/free shape as FUN_0089AB50()

FUN_0089BAD0(container):
  while (*(container+0x08) != 0) {
      node = **(container+0x04)
      if (node[2] != 0) (**node[2])(1)
      unlink node
      free(node, 0x0C)
      --*(container+0x08)
  }
  FUN_006CE520()
  free(*(container+0x04), 0x0C)
  *(container+0x04) = 0
```

These are useful negative evidence: they explain nearby vtable and `+0x08`
noise in the C export, but they do not explain the live `lane+0x08` attach.

### Confirmed detach/replace candidate for lane+0x08

The strongest same-field body remains the installed-binary slice around
`0x00896ED0`:

```asm
0x00896ED0  lane detach/replace helper, exact entry still class-ambiguous
0x00896EF4  mov esi, ecx
0x00896F02  cmp dword ptr [esi+0x08], 0
0x00896F05  mov byte ptr [esi+0x1C], 0
0x00896F08  mov byte ptr [esi+0x1D], 0
0x00896F0B  je  0x00896F50
0x00896F0D  mov edi, [esi+0x08]
0x00896F10  mov dword ptr [esi+0x08], 0
...
0x00896F32  mov dword ptr [esi+0x08], 0
0x00896F35  call 0x00896AF0
```

This is not the attach writer either. It is a detach/replace side of the lane
context lifecycle:

```text
lane+0x08 = context pointer being detached
lane+0x1C = state flag cleared during detach
lane+0x1D = state flag cleared during detach
0x00896AF0 = follow-up release/cleanup helper for the old context path
```

If this helper hits before the failing `relogin`, the lane was attached and then
cleared. If it never hits and `lane+0x08` is zero at `0x006E1144`, the lane was
probably never attached for this event lane.

### Current best field map

For the dispatcher/lane object that reaches `0x00896F70`:

```text
lane+0x00 = vtable or primary object header
lane+0x04 = resolver subobject used by 0x00CC7190 / 0x00CC7A50
lane+0x08 = attached runtime context required before ready vcall
lane+0x1C = detach/ready state flag, cleared by 0x00896ED0 path
lane+0x1D = detach/ready state flag, cleared by 0x00896ED0 path
lane+0x1E = ownership/child flag seen in adjacent destructor family
```

For the attached context at `lane+0x08`, once non-null:

```text
context+0x00       = vtable
[vtable+0x10]      = readiness method used at 0x00896FF0
context+0x20       = byte set to 1 by success handoff at 0x00897155
[vtable+0x0C]      = optional success-branch method called at 0x00897161
```

### Remaining attach writer shape

The missing initializer should have one of these shapes:

```asm
; owner_context lane install
mov [owner_context+0xF8], lane

; lane context attach
mov [lane+0x08], context
mov byte ptr [lane+0x1C], ?
mov byte ptr [lane+0x1D], ?
```

The C export found in this workspace does not expose a trustworthy named body
for that attach writer. It does expose the destructor/container cleanup paths
above, which are useful because they rule out a tempting false trail:
`0x0105705C` is teardown-adjacent, not proven attach.

### Narrow next decomp/probe target

The next target should be the first writer of `lane+0x08`, not any widget or
`commandAboutWidget` path:

```text
1. At 0x006E1144, capture owner_context and lane = [owner_context+0xF8].
2. If lane is nonzero, set a write watch on lane+0x08.
3. The first writer with a nonzero value is the attach function.
4. The first writer with zero is the detach path; if it is 0x00896F10 or
   0x00896F32, chase the caller of 0x00896ED0.
5. If no writer fires before relogin, the event lane is born detached and the
   missing setup is earlier than 0x0130 RunEventFunction, likely in the
   EventStart/lane-registration side.
```

Static decomp follow-up, if the installed client bytes are available:

```text
Disassemble xrefs/callers of:
  0x00896ED0  detach/replace helper
  0x00896AF0  old-context cleanup/release helper
  0x00896F70  dispatch body

Scan for writes:
  [reg+0x08] near functions that also touch +0x1C/+0x1D/+0x1E
  [reg+0xF8] near owner_context construction/actor setup
```

Current inference:

```text
Toto-Rak now fails because the client has an owner_context and lane, but the
lane was not attached to a runtime context before StartServerOrderEventFunction
tries to dispatch relogin. 0x0130 does not create that context; it consumes it.
So the missing setup is probably in the earlier EventStart / actor-lane attach
path, or in a detach that runs between EventStart and relogin.
```

## 2026-06-24 targeted native lane attach search

Scope for this pass: no more Toto-Rak Lua/widget decomp. This only follows the
native attach chain:

```text
owner_context+0xF8 = lane                 already proven live
lane+0x08          = runtime context       missing/null at failure
```

Live failure being explained:

```asm
0x00896F70 dispatcher body
0x00896F9A  mov  esi, ecx          ; ESI = lane
...
0x00896FE0  mov  ecx, [esi+0x08]   ; runtime context
0x00896FE3  test ecx, ecx
0x00896FE5  je   0x008971B4        ; live Toto-Rak branch taken
```

### Static export result

The workspace Ghidra C export does not expose a trustworthy first writer for
either of these attach writes:

```asm
mov [owner_context+0xF8], lane
mov [lane+0x08], context
```

The focused function scan found no `0x0089xxxx` C-export body that writes or
constructs `owner_context+0xF8`. The visible `+0xF8` hits in the export are
unrelated string/vector/tree/destructor fields, for example:

```text
FUN_009C8230       small-buffer/string cap field at +0xF8
FUN_00A62480       large-object destructor clears +0xF8
FUN_00ACE8D0       large context init zeros +0xF8
FUN_00CCE460       vector begin/current/end family using +0xF0/+0xF4/+0xF8
FUN_00D0BA80       tree/container root at +0xF8
```

The same pass searched for the expected lane-context fingerprint:

```text
function touches/writes +0x08
and also touches +0x1C/+0x1D/+0x1E
```

Only one `0x0089` C-export function matched the loose shape:

```text
FUN_0089E760 lines 118537-118572
```

But `FUN_0089E760` is destructor-shaped:

```c
this->vtable = 0x010574A4;
this[2] = 0x01057488;
FUN_00CC9330();
free(this[5]..this[7]);
this[5] = 0;
this[6] = 0;
this[7] = 0;
FUN_007942C0();
this->vtable = 0x00FDF980;
```

So the C export does not currently name the first attach writer. It mainly gives
negative evidence: the obvious `0x0089`/`0x006E` field hits are cleanup,
container, or resolver noise.

### 0x006E neighborhood

The exact `0x006E1140` thunk is installed-binary-proven, but not emitted as a
named C function in this export:

```asm
0x006E1140  mov [esp+0x04], ecx   ; first stack arg becomes owner_context
0x006E1144  mov ecx, [ecx+0xF8]   ; ECX = lane
0x006E114A  jmp 0x00896F70
```

Nearby emitted `0x006E` functions are not the attach writer:

```text
FUN_006E0C40  destroys vector entries at +0x14/+0x18
FUN_006E23B0  creates/registers a helper through 00CC7510/00CC8280,
              then writes result+0x68/+0x70, not +0xF8 or +0x08
FUN_006E5A00  vector destructor, clears +0x14/+0x18/+0x1C
FUN_006E8800  vector destructor, clears +0x04/+0x08/+0x0C
FUN_006ECE20  larger destructor/owned child cleanup
```

This means `0x006E1140` should still be treated as a consumer of
`owner_context+0xF8`, not the initializer.

### Receiver body is also a consumer

The receiver path remains:

```asm
0x0089E260 receiver body
  0x0089E270 call 0x00CC7A50       ; EAX = owner_context
  0x0089E275 mov  ebp, eax         ; save owner_context
  ...
  0x0089E2BC mov  ecx, ebp
  0x0089E2BE call 0x006E1140       ; consumes owner_context+0xF8
```

No visible `0x0089E260`-family C-export body writes `owner_context+0xF8` before
the thunk. That matches the live result: the lane already exists by the time the
receiver runs, but `lane+0x08` is null.

### EventStart/object lifecycle is now the best static direction

The best static attach suspects are no longer in `0x0089E260` or
`0x00896F70`. They are in the earlier receive-object lifecycle:

```text
0x00CA EventStart/create-ish low handler
  -> 0x004DCCBF
  -> lookup object through 0x004D9910
  -> if missing, create/register through 0x004D90C0
  -> mark object+0x92 = 1
  -> notify through 0x004CAF60

0x00CB close/state-update low handler
  -> 0x004DCCF6
  -> 0x00575750 map-state guard
  -> lookup object through 0x004D9910
  -> maybe clear current state through 0x004D9980
  -> call object.vtable+0 with arg 1

0x0130 RunEventFunction
  -> 0x004DCFFF shared object dispatch
  -> 0x004D9910 object lookup
  -> object.vtable+0x24
  -> 0x004D8860 / handle slot57 / 0x0076C220
  -> 0x0089E260 / 0x006E1140 / 0x00896F70
```

Key correction: `0x0130` does not attach `lane+0x08`. It consumes the object,
handle, owner_context, lane, and attached runtime context.

### 0x004D90C0 create/register helper

`0x004D90C0` is the cleanest native creation boundary to decomp or hook next:

```asm
0x004D90C0  push esi
0x004D90C1  push edi
0x004D90C2  mov  edi, [esp+0x10]       ; requested id/source
0x004D90C6  push edi
0x004D90C7  mov  esi, ecx              ; owner
0x004D90C9  call 0x004D9030            ; special-id validator
0x004D90CE  test al, al
0x004D90D0  je   0x004D9108            ; reject -> return null

0x004D90D2  mov  ecx, [esi+0x174F0]
0x004D90D8  mov  edx, [esp+0x0C]
0x004D90DC  lea  eax, [esi+0x510]
0x004D90E2  push eax                   ; owner+0x510
0x004D90E3  push esi                   ; owner
0x004D90E4  push ecx                   ; owner+0x174F0 value
0x004D90E5  push edi                   ; requested id/source
0x004D90E6  push edx                   ; packet/create source
0x004D90E7  lea  ecx, [esi+0x4AC]      ; factory/register subobject
0x004D90ED  call 0x00537620            ; indexed factory/register

0x004D90F2  mov  esi, eax              ; created object
0x004D90F4  test esi, esi
0x004D90F6  je   0x004D9101
0x004D90F8  mov  eax, [esi]
0x004D90FA  mov  edx, [eax+0x14]
0x004D90FD  mov  ecx, esi
0x004D90FF  call edx                   ; createdObject.vtable+0x14
0x004D9101  mov  eax, esi              ; return created object
```

This path does not visibly write `lane+0x08` itself. The interesting child is
the created object's vtable slot `+0x14`, because that is the first per-object
post-create callback after registration. If `lane+0x08` is ever attached during
EventStart/create, this slot is now the top static suspect.

`0x004D9030` validates special ids:

```asm
id high mask       = id & 0xE0000000
special prefix     = 0xC0000000
type nibble        = (id >> 24) & 0x0F
allowed type range = type < 3
lookup table       = 0x01336B60 + type * 24
low id             = id & 0x00FFFFFF
fallback id        = 0xC0000000
return true        = resolved id == original id
```

`0x00537620` is an indexed function-pointer factory/register dispatcher:

```text
this+0x04 = begin of function-pointer table
this+0x08 = end/count-derived pointer
index     = factory selector from stack +0x24 after prologue
rejects null table, out-of-range index, null function pointer
calls table[index] with five stack/context args
then dispatches post-create storage through jump table 0x0053777C for indexes 2..17
```

So there are two subtargets below `0x004D90C0`:

```text
1. The indexed factory function selected inside 0x00537620.
2. The returned object's vtable+0x14 callback at 0x004D90FF.
```

Either one could allocate or attach the runtime context that later appears as
`lane+0x08`. The general handler around them does not.

### 0x004CAF60 notify/update helper

`0x004CAF60`, called after `0x00CA` marks the object active, is small:

```asm
0x004CAF60  mov  esi, ecx
0x004CAF63  mov  eax, [esi+0x18]
0x004CAF66  mov  ecx, [eax+0x08]
0x004CAF69  call 0x004D7490            ; returns [ecx+0x1783C]
0x004CAF6E  cmp  eax, [esp+0x08]       ; compare to packet id/value
0x004CAF72  jne  0x004CAF7C
0x004CAF74  mov  ecx, [esi+0x18]
0x004CAF77  call 0x004CA100
```

This helper is probably not the first lane attach writer. It only fires its
child when the current state id matches the packet id/value. Still, it is a
good secondary hook because it proves whether EventStart/create is also making
the object current enough for owner state callbacks.

### 0x004D9980 current-state helper

`0x004D9980` owns the receive owner's current-object fields:

```text
owner+0x17838 = current object pointer
owner+0x1783C = current id
owner+0x17840 = previous id
owner+0x4A8   = flag cleared on non-sentinel switch
owner+0x950 / +0x998 / +0x17430 / +0x174C8 = state/update subobjects
```

Sentinel clear path:

```asm
input == 0xC0000000:
  clear owner+0x950 / owner+0x998
  clear/update owner+0x174C8
  clear/update owner+0x17430
  mov [owner+0x17838], 0
  call 0x004D6A50
  owner+0x17840 = old owner+0x1783C
  owner+0x1783C = 0xC0000000
```

Non-sentinel switch path:

```asm
input != owner+0x1783C:
  call 0x004D9910(input)
  mov [owner+0x17838], eax             ; current object pointer
  mov byte ptr [owner+0x4A8], 0
  update owner+0x17430 / owner+0x174C8
  mov [owner+0x998+0x10], input
  owner+0x17840 = old owner+0x1783C
  owner+0x1783C = input
```

This function still does not directly write `owner_context+0xF8` or
`lane+0x08`. Its value is upstream: if `0x00CA` created the object but `0x00CB`
or another state path leaves `owner+0x17838/+0x1783C` wrong, then the later
`0x0130` can reach a real handle while the event lane remains detached.

### 0x004D9910 object lookup

`0x004D9910` is not an attach writer. It is a tree lookup:

```asm
0x004D9916  lea ecx+0x17804            ; owner object map/tree
0x004D9928  call 0x0071D420            ; lower_bound/find style helper
...
0x004D9947  xor eax, eax               ; miss
...
0x004D9963  mov eax, [found_node+0x10] ; hit: object pointer/value
```

This matters because every lifecycle hop uses the same object identity:

```text
0x00CA create/activate: lookup or create by id
0x00CB close/update:    lookup by id and maybe set current object
0x0130 run function:    lookup by id and call object.vtable+0x24
```

If these ids differ, or if `0x00CA` never arrives for this owner/id, `0x0130`
can only consume whatever stale/partial object mapping exists.

### Refined attach-writer hypothesis

The first nonzero write to `lane+0x08` is likely one of these:

```text
A. Created object factory path:
   0x00CA -> 0x004DCCBF -> 0x004D90C0 -> 0x00537620
   inside indexed factory function or the post-create storage switch.

B. Created object post-create callback:
   0x004D90FF -> createdObject.vtable+0x14
   likely place to bind actor/event/script context after object registration.

C. Current-state update side effect:
   0x00CB -> 0x004DCCF6 -> 0x004D9980 or its children
   likely if lane context is attached only when the object becomes current.

D. Counterpart to detach helper:
   sibling/caller of 0x00896ED0 / 0x00896AF0
   should write [lane+0x08] and set +0x1C/+0x1D rather than clearing them.
```

The current static evidence ranks them:

```text
highest:  0x004D90FF object.vtable+0x14 and 0x00537620 indexed factory children
medium:   0x004D9980 children/state update callbacks
medium:   caller/sibling of 0x00896ED0, if detach is happening before relogin
low:      0x0089E260, 0x006E1140, 0x00896F70 themselves; they are consumers
```

### Runtime/watchpoint equivalent

If doing this dynamically, the shortest proof is still a write-watch:

```text
break at 0x006E1144:
  owner_context = ECX
  lane = [owner_context+0xF8]
  watch write [lane+0x08]

if first writer stores nonzero:
  log writer EIP/return address and new context

if first writer stores zero:
  likely detach, compare EIP to 0x00896F10 / 0x00896F32

if no writer fires before relogin:
  the lane is born detached for this object; go upstream to 0x00CA/0x00CB
```

Suggested hook rows for the next native probe:

```text
0x004DCCBF  0x00CA create handler entry: id=[ebp+8], owner=edi, source=[esi+0x10]
0x004D90C0  create/register helper entry: owner=ecx, requested id=[esp+0x10]
0x004D90ED  before 0x00537620: log selector args and owner subobjects
0x004D90FF  before createdObject.vtable+0x14: log created object, vtable, slot14
0x004CAF60  notify/update helper: log current id from 0x004D7490 and compare id
0x004DCCF6  0x00CB handler entry: id=[ebp+8], owner=edi
0x004D9980  state switch helper: log owner+17838/1783C/17840 before and after
0x004DCFFF  0x0130 shared dispatch: log object, vtable+0x24, handle slot57
0x006E1144  owner_context -> lane handoff: log owner_context, lane, [lane+8]
0x00896FE5  failing context-nil branch: log lane, [lane+8], owner actor
```

### Bottom line

The decomp now rules out the receiver path as the initializer:

```text
0x0089E260       consumes owner_context
0x006E1140       consumes owner_context+0xF8
0x00896F70       consumes lane+0x08
0x00896ED0       clears/detaches lane+0x08
```

The missing attach almost certainly lives before `0x0130`, in the EventStart /
receive-object registration path, with `0x004D90FF` created-object
`vtable+0x14` and the `0x00537620` indexed factory children now the most
targeted static decomp targets.

## 2026-08-10 event-lane attach closure

Installed executable bytes close that previously unknown writer. The
`0x0130` path is consumer-only:

```text
0x004DCFFF object lookup
  -> object vtable+0x24 at 0x004DD019/0x004DD01A
  -> 0x0089E260 receiver
  -> 0x006E1140 loads [owner_context+0xF8]
  -> 0x00896F70 reads [lane+0x08] at 0x00896FE0
  -> null exits at 0x00896FE5
```

The exact attach/replace function is `0x00896AF0`. Its write at
`0x00896B72` stores the new context into `[lane+0x08]`, copies the current UI
command token into the attached context, marks `lane+0x1C`, and continues into
the `_onUICommandEvent` path. The visible upstream caller is
`0x006F56B5`, which passes the lane as `ecx`. `0x00896ED0` is the symmetric
detach route and clears `[lane+0x08]` at `0x00896F10/0x00896F32`.

Therefore the missing Toto-Rak step is an earlier EventStart/UI-command attach
through `0x006F56B5 -> 0x00896AF0`, not another widget packet and not a change
to the later `RunEventFunction` payload. The executable hash and exact
instructions are locked in
`outputs/dungeon-widget-bootstrap-contract-20260810/totorak_event_lane_route.csv`.
