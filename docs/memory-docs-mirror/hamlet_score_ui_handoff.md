# Hamlet Score UI Handoff

Goal: get the 1.x Hamlet Defense score window to open and read real score rows from the client-side `HamletDefenseScoreReceiver`.

This file captures the useful findings from the 2026-05-27 IDA/x32dbg/server probe session.

## 2026-05-28 Update

The score packet/parser side is still considered proven, but the UI-open strategy changed after live testing.

- Use `!testhamlet retailstart hyrstmill` for the current lifecycle test. It now stays in public Hyrstmill, attaches a Hamlet director, kicks the intro `noticeEvent`, tries the selected cutscene experiment mode, and has a 15-second auto-commence fallback if the client never returns from the intro event. The old private-content version is `!testhamlet retailinstance hyrstmill` and is unsafe because it can crash the stock client.
- The current server path can render the small blue `You are now bound by duty.` attention box, but it still does not render the retail gold `Duty Commenced` title graphic or open the live Hamlet widget. The useful signal in current tests remains the HUD/objective/spawns or the auto-commence message.
- `!testhamlet win` sends native compact `0x01A8 HamletDefenseScore` from the active Hamlet director before and after completion. Recent logs showed the expected `payload=0x105`, `shape=native-compact`, `rating=2`, `victory=True`, and `rows=1` metadata.
- The client accepts the native score data but still does not auto-open the score-result window. Current hypothesis: the missing piece is a retail end/result event signal or client state gate, not the native score payload layout.
- Local DAT mining has the retail Hamlet cutscene replay rows. `docs/Dat Mining/cutReplay.csv` maps Aleport/Hyrstmill/Golden Bazaar opening and ending entries to scene keys `ham0s201`, `ham0s202`, `ham0f301`, `ham0f302`, `ham0w201`, and `ham0w202`; `docs/Dat Mining/xtx_cutReplay.csv` gives their display names.
- The former `scoreopen` path is unsafe. It can leave the stock client in a bad active-event/UI state where chat/party menus stop behaving normally. The normal alias is disabled; only explicit `unsafe` aliases remain for deliberate lock-path testing.
- Recovery path if an unsafe event/UI probe traps the client: try `!testhamlet uiprobe scoreend`, then `!testhamlet cancel`; relog if chat input itself is trapped.
- x32dbg is not needed for the immediate server-side loop. If client-side UI work resumes, avoid `00535690` as a first breakpoint because it is too hot and can keep the process constantly paused.

## What Is Proven

- Opcode `0x01A8` is the Hamlet Defense score packet.
- The native compact payload shape reaches the correct client receiver and parser.
- x32dbg proved this path:
  - `0089E420` - `HamletDefenseScoreReceiver` receive method.
  - `006F2210` - score state allocation/setup.
  - `006F1480` - compact score payload parser.
- The safe Hyrstmill test payload starts with:

```text
09 00 00 00 02 18 ...
```

- Meaning:
  - byte `0x00`: `0x09` Hyrstmill raid/hamlet id.
  - byte `0x04`: `0x02` supply rating.
  - byte `0x05`: row code `0x18`.
  - byte `0x85`: row count `0x01`.
- In the parser, row code `0x18` mapped to score id `12003` (`0x2EE3`).
- The first row append built:

```text
points = 10
scoreId = 12003
count = 1
```

- Stepping over `006F152F call ffxivgame.7231A0` returned normally, so the row append path is valid.

## DAT Cutscene Lead

`cutReplay.csv` and `xtx_cutReplay.csv` confirm the named Hamlet opening/ending scenes:

```text
11082008 -> ham0s201 -> The Battle for Aleport (Opening)
11082009 -> ham0s202 -> The Battle for Aleport (Ending)
11082010 -> ham0f301 -> The Battle for Hyrstmill (Opening)
11082011 -> ham0f302 -> The Battle for Hyrstmill (Ending)
11082012 -> ham0w201 -> The Battle for the Golden Bazaar (Opening)
11082013 -> ham0w202 -> The Battle for the Golden Bazaar (Ending)
```

This is replay/catalog data, not the live duty-entry trigger by itself. It strongly suggests the current bare `noticeEvent` intro start is incomplete: the retail path likely calls a cutscene/movie delegate with one of the `ham0*` scene keys, then proceeds into the title/HUD/result state gate.

Implementation experiment now active: `HamletDefenseData` stores these scene keys, and the Hamlet intro Lua path can try `etcdelegate`, `nq`, `nqdelegate`, `directordelegate`, `direct`, or `off` before `StartHamletDefense()`. Live testing on 2026-05-28 showed `etcdelegate`, `nq`, `nqdelegate`, and `directordelegate` all returned `noticeEvent params=false` with no visible cutscene, so the replay data is real but not directly playable from the Hamlet director event context.

The user then successfully watched the full Hyrstmill replay cutscene from The Unending Journey/journal, and also played the ending row. That proves `ham0f301` and `ham0f302` can play locally. No `[CutsceneBookProbe]`, `eventTalkStep*`, or replay-specific callback appeared in the map log when selecting the journal row, so the inn replay selection is likely client-side after `SetCutsceneBookPacket`. `!testhamlet uidebug on` now also logs inn replay client packets without requiring an active Hamlet director, plus outgoing `0x01A3` cutscene book and `0x01A7` dream packets.

Retail sequence note from the user: the intro cutscene fades in, the gold non-cutscene `Duty Commenced` center-screen title graphic appears, then the live Hamlet widget appears at top-left. Testing `worldMaster` text id `50011` as an `attention` data packet rendered the blue generic bound-by-duty box, not the gold title graphic, and did not unlock the widget. That makes `HamletDefenseTitleWidget1/2/3` plus the live `HamletDefenseWidget` bootstrap a better next target than score/result packet work for the duty-start GUI.

2026-05-29 tutorial-director result: `!testhamlet retailtutorial hyrstmill` rendered the Gridania tutorial guildleve `Spore Spoor` HUD while the Hamlet server lifecycle spawned carts and sent Hamlet chat. This proves the client accepted the alternate tutorial director path/init tuple, but it stayed inside the guildleve execution HUD family. Stop spending live attempts on more guildleve-shaped tutorial ids; the remaining target is the Hamlet-specific title/HUD bootstrap.

## 2026-05-31 Widget-Profile Update

The live `noticeEvent` widget-container route is now proven. The server and Windower logs both show the ordered Hamlet UI sequence reaching the stock client, and the client creates visible UI. The current visible failure is the red `Undefined` tile pair, which means the widget/container path exists but is still missing the correct form/template binding, creation name, widget index, or data source.

New selectable widget profiles are wired through `!testhamlet widgetprofile`:

```text
!testhamlet widgetprofile loadbare
!testhamlet widgetprofile loadwindow
!testhamlet widgetprofile bare
!testhamlet widgetprofile window
```

Profiles:

```text
loadbare   -> _loadForm("sqwt/widget/HamletDefenseWidget.form"), then create "HamletDefenseWidget"
loadwindow -> _loadForm("sqwt/widget/HamletDefenseWidget.form"), then create "Window_HamletDefenseWidget"
bare       -> create "HamletDefenseWidget"
window     -> create "Window_HamletDefenseWidget"
```

`loadbare` is the current default. `!testhamlet uistatus` reports the active profile, widget index, form name, create name, and whether `_loadForm` will be attempted.

The live sequence inside the active `noticeEvent` remains:

```text
_setInstanceRaid
_loadTextDataPermanently
_waitForHamletDefenseScore
_countHamletDefenseScore
_getHamletDefenseScore
_getHamletDefenseScoreAll
0x0133 requestedData hamletDefScore
0x0133 requestedData hamletDefScoreAll
0x01A8 HamletDefenseScore native compact data
optional _loadForm
_reserveWidgetContainer
_isExistWidgetInWidgetContainer
_getWidgetFromWidgetContainer
_createWidgetInWidgetContainer
_getWidgetFromWidgetContainer
0x01A8 HamletDefenseScore native compact data again
```

Latest `loadbare` live result from 2026-05-31:

- Map Server logged `client=path=/Director/Guildleve/PrivateGLBattleSweepNormal, params=hamlet` during `retailstart`, so the retail-start path did apply the Hamlet init profile for this run.
- `[HamletUiWidget]` logged `profile=loadbare, widget=0x1B, loadForm=True, form=sqwt/widget/HamletDefenseWidget.form, create=HamletDefenseWidget`.
- Windower logged incoming `RunEventFunction|_loadForm|sqwt/widget/HamletDefenseWidget.form`, incoming `RunEventFunction|_createWidgetInWidgetContainer|HamletDefenseWidget`, incoming `0x01A8 HamletDefenseScore`, and then `0x0131 EndClientOrderEvent noticeEvent`.
- The client still rendered the red `Undefined` tiles. No Windower packet showed an explicit error string; the fallback is visual.
- The native compact `0x01A8` payload shape was not changed. The logged test packet was still the known-safe single-row payload (`payload=0x105`, `header=9`, `rating=2`, `rows=1`).

Interpretation:

- `_loadForm("sqwt/widget/HamletDefenseWidget.form")` plus bare `HamletDefenseWidget` creation is not sufficient.
- Because visible UI is created, the next failure layer is probably widget identity/binding or data binding, not packet transport.
- `0x1B` remains the working hypothesis for the global `Window_HamletDefenseWidget` table index, but that assumption should be exhausted through profile tests before changing the `0x01A8` payload shape.

Next safe live profile order:

```text
!testhamlet cancel
!testhamlet widgetprofile loadwindow
!testhamlet retailstart hyrstmill

!testhamlet cancel
!testhamlet widgetprofile bare
!testhamlet retailstart hyrstmill

!testhamlet cancel
!testhamlet widgetprofile window
!testhamlet retailstart hyrstmill
```

Success criteria are either the real Hamlet widget rendering or any visual/log change away from the red `Undefined` tiles. If all four profiles produce the same fallback, stop changing only form/name and pivot to one of these:

- Narrow widget-index probes around the execution-widget table instead of broad loops.
- Alternate `_loadForm` names such as `HamletDefenseWidget`, `HamletDefenseWidget.form`, or related score/title widget forms.
- Recheck whether the red `Undefined` tiles are data-bound labels waiting for a different Hamlet data source rather than a missing form.
- Compare IDA paths around `_loadForm`, `_createWidgetInWidgetContainer`, `Window_HamletDefenseWidget`, and the `undefined` fallback string.

Build note: `dotnet build "Map Server\Map Server.csproj" -c Release -p:Platform=x64 --no-restore` succeeded after the profile changes. A normal Release deploy/build can fail while the live Map Server process is running because `Meteor.Common.dll` and `Map Server.exe` are locked by the active server.

## Static IDA Findings

IDA Free 9.3 loaded `ffxivgame.exe` as a 32-bit PE. The executable contains a PDB path string:

```text
D:\rapture\src\Application\Rapture\project\client\windows\WinRapture\WinRapture_ReleaseMT\ffxivgame.pdb
```

That means the developer build path was embedded in the binary. It does not mean the actual PDB file is present locally.

Useful strings found:

```text
.rdata:00FC1D80 Window_HamletDefenseWidget
.rdata:00FD6D44 _countHamletDefenseScore
.rdata:00FD7558 _getHamletDefenseScoreAll
.rdata:00FD7AF0 _countHamletSupplyRanking
.rdata:00FD7B0C _getHamletSupplyRanking
.rdata:00FD7338 _waitForHamletDefenseScore
.rdata:00FD8624 hamletDefScore
.rdata:00FD473C _onCommand
.rdata:01056B04 _onCommandCancel
.rdata:01056AF4 _onCommandEvent
.rdata:01056AC0 _onCommandRejected
.rdata:01056B18 _onCommandRequest
.data:012D8368 .?AVHamletDefenseScoreReceiver@Network@Command@Client@Script@Lua@Application@@
.data:012D8310 .?AVHamletSupplyRankingReceiver@Network@Command@Client@Script@Lua@Application@@
```

Useful vtable/data chain found:

```text
.rdata:01057330 HamletDefenseScoreReceiver_vftable dd offset sub_8A1030
.rdata:01057334 dd offset sub_89E420
.rdata:0105733C dd offset loc_8A10A0
.rdata:01057340 dd offset sub_89D030
.rdata:01057348 dd offset sub_89D180
```

`X` on the RTTI class-name strings does not show code xrefs because those strings are metadata, not normal code references. The useful path is through the nearby vtable entries.

## Widget Table Findings

`Window_HamletDefenseWidget` is part of the global widget-name table, not a direct code opener.

Table start:

```text
.data:012BA870 off_12BA870 dd offset aWindowLogwidge_0 ; "Window_LogWidget0"
```

Hamlet entry:

```text
.data:012BA8DC dd offset aWindowHamletde ; "Window_HamletDefenseWidget"
```

Index math:

```text
0x012BA8DC - 0x012BA870 = 0x6C
0x6C / 4 = 27 = 0x1B
```

So the client widget table index for `Window_HamletDefenseWidget` is:

```text
27 decimal / 0x1B
```

Follow-up probes now distinguish that global live-widget table index from the Hamlet title selector stored in server data. `HamletDefenseData.titleWidgetIndex` is `1/2/3` for Aleport/Hyrstmill/Golden Bazaar, while `raidDungeonId` is `8/9/10`. `!testhamlet uiprobe titleindex` sends `widgetCreate` with the `titleWidgetIndex`; `!testhamlet uiprobe titlecontainer` tries `_createWidgetInWidgetContainer` with `HamletDefenseTitleWidgetN` and `Window_HamletDefenseTitleWidgetN`. Live result: both stayed in the `Official Behest`/guildleve HUD; `titlecontainer` only produced empty no-param `0x012E` EventUpdate replies. The next safe checks are `!testhamlet uiprobe dutytitle` for `DutyCommencedWidgetN` and `!testhamlet uiprobe titleform` for `_loadForm` candidates.

`off_12BA870` xrefs are only inside `sub_66EE60`:

```text
sub_66EE60+D7
sub_66EE60+DF
sub_66EE60+11C
```

That function maps a widget name string to the table index and stores the match at `this+0x10`.

Callers of `sub_66EE60`:

```text
.text:00535B5D call sub_66EE60
sub_5387F0+273 call sub_66EE60
```

Useful `sub_5387F0` shape:

```text
v16 = sub_535690(*(this + 38));
sub_66EE60(this + 148, *(this + 31), *(_DWORD *)(v16 + 44));
sub_66EFD0(this + 148);
```

Meaning:

- `sub_535690(index)` looks up a widget entry by byte index.
- `*(v16 + 44)` points to the object containing the widget name at `+8`.
- `sub_66EE60` maps that widget name back to the global table index.
- `sub_66EFD0` appears to render/position/update a selected widget after it is already valid.

`sub_535690` decompile confirms it is a collection lookup by byte index:

```text
sub_535690(this, char index) -> widget entry or 0
```

Current hypothesis: if the client requests/selects widget index `0x1B`, `sub_535690` should return the Hamlet widget entry, and `sub_66EE60` should classify it as `Window_HamletDefenseWidget`.

## Function Map

Important functions from decompilation:

```text
007413A0 - Lua wrapper for _getHamletDefenseScoreAll.
0071E730 - virtual thunk used by the wrapper.
0089E420 - HamletDefenseScoreReceiver receive method.
006F2210 - installs/refreshes the parsed score state object.
006F1480 - compact native 0x01A8 score payload parser.
006EEFE0 - initializes parsed score state fields.
006E8800 - frees/reset old score state.
00725F50 - row-code lookup helper.
007231A0 - appends one parsed score row.
0089D070 - constructs score row/request helper object.
0089D030 - writes parsed score metadata to target object offsets 340/344.
0089CF60 / 0089CFD0 - temporary helper construct/destruct pair.
```

The important decompile shape for `006F1480`:

```text
this+20 = payload[0..3]
this+24 = payload[4]
for i in 0..0x7F:
    rowCode = payload[5+i]
    if rowCode == 0: break
    scoreId = table[rowCode - 1]
    points = lookup(scoreId)
    count = payload[0x85+i]
    if count != 0: points *= count
    this+16 += points
    append(points, scoreId, count)
```

That is why the native packet has two 128-byte arrays: row codes at `+0x05`, counts at `+0x85`.

## Dynamic Debugger Findings

Breakpoints that proved the score packet path:

```text
bp 0089E420
bp 006F2210
bp 006F1480
```

Observed at `006F1480`:

```text
[esp+4] = 001AD570   ; native payload pointer
payload = 09 00 00 00 02 18 ...
payload+0x85 = 01
```

Observed during the first row parse:

```text
rowCode = 0x18
scoreId = 0x2EE3 = 12003
count = 1
points = 10
```

Observed at the row append call:

```text
006F152F call ffxivgame.7231A0

001AD508 0000000A   ; points
001AD50C 00002EE3   ; score id 12003
001AD510 00000001   ; count
```

Stepping over the append returned to `006F1534`, confirming that the parser accepted the row and continued normally.

Breakpoints that did not hit from the current UI/open probes:

```text
bp 007413A0   ; _getHamletDefenseScoreAll wrapper
bp 0071E730   ; virtual thunk from wrapper
```

That is the main clue: score data is parsed, but the current widget/open sequence has not yet triggered the client getter.

## Current Server State

The UI/open/bootstrap probe helpers now send the proven native compact `0x01A8` payload instead of the old guessed 48-byte `single` payload.

`retailstart` now has a selectable Hamlet widget profile for the live `noticeEvent` bootstrap. Use `!testhamlet widgetprofile [loadbare|loadwindow|bare|window]` before `!testhamlet retailstart hyrstmill`; `!testhamlet uistatus` reports the active profile. `loadbare` sends `_loadForm("sqwt/widget/HamletDefenseWidget.form")` and creates `HamletDefenseWidget`, but the 2026-05-31 live test still rendered red `Undefined` tiles. The next profile to test is `loadwindow`, then `bare`, then `window`.

The bug fixed today: `scoreopen`, `scorebootstrap`, source probes, delayed open probes, and the default score UI probe were still appending the old guessed `single` payload after the native work. That could overwrite the good parsed score state with an empty/invalid one.

The old guessed payload is still available only for explicit comparison:

```text
!testhamlet uiprobe scorepacket
!testhamlet uiprobe scoresingle
!testhamlet uiprobe single
```

Use the native path for normal testing:

```text
!testhamlet scoremenu native
!testhamlet uiprobe scorebootstrap
!testhamlet uiprobe widgetindex
!testhamlet uiprobe scorenativepacket
```

`widgetindex` is a new safe probe for the widget-table hypothesis. It sends the normal bootstrap, then sends `widgetCreate` with number `0x1B` / `27`, the client table index calculated for `Window_HamletDefenseWidget`, followed by the score data requests and native compact `0x01A8` payload.

Do not use `scoreopen` for normal testing. It is now exposed only through explicit unsafe aliases because the forced opener path can lock client UI/event focus.

Restart the Map Server after rebuilding before re-testing in game.

## Current Safe Test Script

In game:

```text
!testhamlet uidebug on
!testhamlet uiraw on
!testhamlet widgetprofile loadwindow
!testhamlet retailstart hyrstmill
```

Wait for the Hamlet opening cutscene, the Hamlet HUD/objective/spawns, or the 15-second auto-commence message:

```text
Hamlet Defense auto-commenced after the intro event did not finish.
```

Then complete:

```text
!testhamlet win
```

Expected result: opening cutscene if the replay delegate is accepted, then victory/reward chat, native score packet logs from the active Hamlet director, and no client UI lockup. For the current widget-profile pass, the useful signal is whether `loadwindow`, `bare`, or `window` changes the red `Undefined` tiles. The retail score window may still need a separate end/result gate.

## Deferred Debugger Script

Use x32dbg again only when deliberately resuming client-side score UI work. The parser proof breakpoints remain useful:

```text
bp 0089E420
bp 006F2210
bp 006F1480
```

Getter/UI breakpoints remain useful once a safer opener path is found:

```text
bp 007413A0
bp 0071E730
```

Avoid starting with:

```text
bp 00535690
```

That lookup is too hot and can keep the process constantly paused before any useful Hamlet-specific signal appears. If widget-table work resumes later, prefer narrower caller/context breakpoints first, then add the hot lookup only after a nearby Hamlet-specific call path is active.

If `sub_535690` is reached in a controlled context, inspect:

```text
[ESP+4]
```

The low byte is the widget index. We want to see:

```text
1B
```

At `00535B5D`, inspect the call context around:

```text
lea ecx, [esi+250h]
call sub_66EE60
```

At `0066EE60`, inspect:

```text
ECX       ; widget helper object
[ECX+10]  ; after the name-table loop, should become 0000001B for Hamlet
[ESP+8]   ; a3 widget-entry-ish object
```

If possible, step past:

```text
sub_447200(v8, *(void **)(a3 + 8))
```

Then inspect the local string buffer/name. The target string is:

```text
Window_HamletDefenseWidget
```

Interpretation:

- If `sub_535690` sees index `0x1B` and `sub_66EE60` maps to `0x1B`, the client is selecting the Hamlet widget and the remaining problem is likely the getter/data call path.
- If the normal probes do not request/select index `0x1B`, test `!testhamlet uiprobe widgetindex` and watch whether `sub_535690` receives `0x1B` or whether `sub_66EE60` maps to `Window_HamletDefenseWidget`.
- If `0066EE60` never hits, the current probe is not reaching the generic widget creation/update path.

## If The Getter Still Does Not Pause

The score data side is working, so the missing piece is probably the widget/open event path.

IDA next steps:

1. Search strings for `Window_HamletDefenseWidget`.
2. Press `X` on the string xrefs and decompile nearby functions.
3. Search/decompile xrefs for:
   - `_waitForHamletDefenseScore`
   - `_countHamletDefenseScore`
   - `_getHamletDefenseScore`
   - `_getHamletDefenseScoreAll`
4. Find the actual widget/event function that calls the getter.
5. Add breakpoints on the wrappers for all four functions, not only `_getHamletDefenseScoreAll`.

The current guessed event names that have not hit yet:

```text
operateUI
openHamletDefenseWidget
openHamletDefenseScoreWidget
delegateCommand -> _getHamletDefenseScoreAll
```

Also check the `Window_HamletDefenseWidget` xrefs and the vtable around `01057330`, because the string/vtable path gave better signal than raw class-name RTTI xrefs.

## Important Context

- The visible HUD currently says `Official Behest` because the safe client director path is still Guildleve-compatible:

```text
/Director/Guildleve/PrivateGLBattleSweepNormal
```

- That is intentional for stability while probing. Earlier Hamlet-specific director paths hit client error `40000`.
- Ranking opcode `0x01A6` now has a recovered native parser shape: `20 * 0x4C = 0x5F0` bytes. The empty ranking probe is allowed, but the old `0x60` byte sample ranking payload remains disabled because it crashes the stock client.
- Unsafe `scorekick...` probes can lock movement or open blocking event UI. Use them only for deliberate event-path testing.
- IDA Free's F5 decompiler prompt said the free decompiler is cloud-based, batch decompilation is disabled, and only x64 code is supported by that plugin. For this session, normal F5 decompilation was still useful on the loaded client functions.
- IDA's `Create EXE file...` menu item is an export/output option. It is not part of the Hamlet UI investigation path.
- `!testhamlet uiprobe scorepacket`, `scoresingle`, and `single` intentionally keep the old guessed 48-byte packet shape available as a control test. Do not use those for normal UI-open testing.

## How Close

- Score packet/parser: about 90-95 percent for the native compact shape. We have one proven row code and a working single-row payload.
- Ranking packet/parser: layout is strong enough for a gated native-shape probe; field semantics and UI behavior still need validation.
- Full row table: about 60-70 percent. Next useful dump is the client row-code table behind `dword_134B76C`.
- Score window/UI open path: about 45-60 percent. We have the data and several candidate event calls, but the client has not yet called the getter wrapper.
- Overall Hamlet score window: about 65-70 percent. The hard packet-shape part is mostly solved; the remaining blocker is finding the exact widget/event trigger.
