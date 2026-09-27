# Hamlet Defense — What Data Is Missing (2026-06-12)

Goal of this file: state, as precisely as possible, **why the live Hamlet Defense
HUD widget still does not appear** and **exactly what data would unblock it**, so the
next session does not re-walk the same dead ends. Pairs with
[hamlet_score_ui_handoff.md](hamlet_score_ui_handoff.md),
[hamlet_ui_handoff_2026-05-25.md](hamlet_ui_handoff_2026-05-25.md), and
[content_systems_decomp_audit_2026-06-12.md](content_systems_decomp_audit_2026-06-12.md).

---

## TL;DR

The live Hamlet HUD (`HamletDefenseWidget`, the top-left supply-cart / war-potential /
timer panel) is opened **only** by the client-side director class
`InstanceRaidHamletDefense` calling `openInformationWidget()` →
`desktopWidget:openHamletExecutionWidget()`. That call path is reached from
`InstanceRaidBaseClass.startEvent` / `reloginEvent`, which on **retail were driven by
the retail server** through an event session. We do not have a capture of that retail
server → client drive, and our attempts to reproduce it with `RunEventFunction`
(calling `startEvent` / `openInformationWidget` by name on the director actor) produce
**no observable client effect**. The single unresolved question that gates everything:

> **Can this 1.0 client execute a director-class Lua method (not an underscore-native
> function) when the server sends it via `RunEventFunction` (opcode `0x0130`)?**

Every implementation path forks on that one bit, and we still do not have it.

---

## Architecture established from the 2026-06-12 decompile

Decompiled client scripts under
`tools/outputs/lpb/content_systems_20260612/lua/` confirm the full structure:

- **Client director class** = `/Director/InstanceRaid/InstanceRaidHamletDefense`
  (`director/instanceraid/instanceraidhamletdefense.lua`), extends
  `InstanceRaidBaseClass`. NOT `/Director/HamletDefense/*` (those crash → error 40000).
- **Widget open path** (`director/instanceraid/instanceraidbaseclass.lua`):
  `startEvent(cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType)`
  → `openInformationWidget()` → (overridden in HamletDefense) →
  `desktopWidget:openHamletExecutionWidget()` →
  `openWidgetYield(15, "HamletDefenseWidget")` +
  `openWidgetYield(16, "HamletDefensePopupWidget")`
  (`widget/desktopwidget_connector.lua:6332`).
- **Guildleve HUD opens "for free"** because `GuildleveBaseClass.processUIInit()`
  auto-opens its HUD on the ordinary work-sync `_init` packet
  (`director/guildleve/guildlevebaseclass.lua:263`). `InstanceRaidBaseClass` has
  **no `processUIInit`** — its HUD is event-driven only. This is the core asymmetry.
- **The battle trigger was server-side.** The client NPCs only *collect a choice* and
  return it to the server:
  - `PopulaceHamletCaptain.talkInContents` (the Militia Captain, e.g. Rontremont)
    calls `desktopWidget:askForEventMode(...)` and **returns** the player's yes/no
    (`chara/npc/populace/populacehamletcaptain.lua:29`). It does not create a director.
  - `InstanceRaidGuideBaseClass.askEnterInstanceRaid` does the same for instanced
    dungeons (`...instanceraidguide/instanceraidguidebaseclass.lua:10`).
  - `PopulaceHamletPushEvent` (`...populacehamletpushevent.lua`) is the
    supply/support/craft buff NPC, not the battle starter.
  In all cases the retail **server** consumed that return value, instantiated the
  director, and drove `startEvent`. That server code is the missing artifact.
- **Work-bag shapes** (for a correct client-side actor; from the decomp):
  - `InstanceRaidBaseClass` uses `instanceRaidWork` with `_temp` fields
    `startTime, finishTime, contentID, eventType, countdownStatus, clearFlag, initFlag`
    plus a 192-byte `_assignForChild`. These are **client-written from `startEvent`
    args**, not server-synced (unlike Guildleve's `guildleveWork._sync`).
  - `InstanceRaidHamletDefense.processInitialize` sets up `work._temp`:
    `hamletRank, hamletID, cargoTarget, battleValue, bossFlag` + arrays
    `harvestTbl[3], lineStatusTbl[3], goodsStatusTbl[4], fieldBuffTbl[6]`.

---

## What is PROVEN to work

- Opcode `0x01A8 HamletDefenseScore` reaches the correct client receiver/parser
  (`0089E420`), native compact payload (`payload=0x105`, `rows=1`). See
  [hamlet_score_ui_handoff.md](hamlet_score_ui_handoff.md).
- The client accepts `/Director/InstanceRaid/InstanceRaidHamletDefense` as a class path
  without crashing (today's `[HamletRetailStart] client=path=...InstanceRaidHamletDefense`).
- Native underscore functions sent via `RunEventFunction` inside a `noticeEvent` session
  **did** render visible UI on 2026-05-31: the red `Undefined` tiles from
  `_createWidgetInWidgetContainer(0x1B, "HamletDefenseWidget")` + `_loadForm`.
- The Behest/Guildleve HUD renders reliably (it is work-sync driven).

## What has NEVER worked (any director, any args, any session)

- Any **director-class Lua method** dispatched by name via `RunEventFunction`:
  `startEvent`, `openInformationWidget`, `setCountDownTimer`, `cmdSetTitle`,
  `cmdShow`, `delegateEvent` cutscene modes — none produced an observed client effect.
- **Return values** from `callClientFunction` — the client never sends back a usable
  value over this path; every `EventUpdate` carried the same generic
  `unknown2=0xCC6BD671` regardless of the function called. So our `getContentID()` /
  `getFinishTime()` probes returning `nil` are **inconclusive**, not proof of failure.

> NOTE: As of 2026-06-13 the regression where the C# scheduled bootstrap was skipped
> (`reason=active-event`) has been fixed in `Defense.lua` (end the event before
> `StartHamletDefense`). The red-tile native sequence should fire again on `retailstart`;
> if it does NOT even reproduce the May-31 tiles, treat that as an environmental change
> (client cache/settings), not a server logic change.

---

## The data we are missing, ranked by unblock value

### 1. (FREE) The `setUiStateOffOf` Lua-dispatch probe result — run it
A pure-Lua `GuildleveBaseClass` method is wired in `Defense.lua` to hide the first
Behest objective row ~5s after the HUD opens, under the guildleve director.
- **Row vanishes** → `RunEventFunction` *can* dispatch director-class Lua methods.
  Then the instance-raid failure is **class binding / actor instantiation**, and we
  attack the ActorInstantiate tuple with confidence.
- **Row stays** → `RunEventFunction` fundamentally cannot reach director Lua on this
  client. Every name-dispatch approach is dead; pivot to work-sync + data packets
  (the channel that demonstrably drives director Lua, i.e. how Behest's HUD works).
This single observation decides the entire strategy and costs one run.

### 2. A client-side packet/behavior trace (Windower) during one `retailstart`
All of today's debugging was server-side only; we are inferring client behavior from
silence. A Windower log shows whether each `RunEventFunction` is processed, rejected,
or dropped, and whether the client emits anything we are not logging. The 2026-05-31
session used Windower to confirm the red-tile sequence; we should not proceed blind.

### 3. A retail packet capture of ANY 1.0 instance-raid duty start
The gold data, and confirmed absent from the corpus (see audit doc §"Dynamic instance
scene argument values"). All 1.0 duties share `InstanceRaidBaseClass.startEvent`, so a
capture of Hamlet, Ifrit, Aurum Vale, Cutter's Cry, or Totorak duty-start would reveal:
the exact event type, owner actor, trigger ordering, and the real `startEvent`
arguments. Sources worth hunting: seventhumbral-era Wireshark dumps, old 1.0 community
packet archives, any `.pcap`/`.bin` capture from 2012-2013.

### 4. (IDA) The client `RunEventFunction` / `0x0130`-receive dispatch logic
How the client resolves a function name from a `0x0130` packet: native-only table vs
Lua member lookup, and against which actor (event **owner** = director vs **player**).
This settles #1 definitively from the binary instead of by experiment. Repo already has
`tools/ida_export_hamlet_context.py` and known string addresses
(`.rdata:00FC1D80 Window_HamletDefenseWidget`, the `_*HamletDefenseScore*` symbols).
Target: the handler that consumes the incoming `0x0130` and the actor-method resolver.

### 5. (IDA / capture) Director ActorInstantiate requirements
What a client director actor needs at spawn for its class to fully construct: the five
header params in `CreateScriptBindPacket` (currently all `4`/`0x4` placeholders), the
`directorId` semantics (Guildleve passes magic `0x4e25` as the first init arg; we pass
the raid dungeon id), and whether `instanceRaidWork` exists on a generically-spawned
director. A working capture (#3) or the instantiate handler (#4) answers this as a
side effect. If #1 says "Lua dispatch works," this becomes the prime suspect.

---

## Concrete experiments queued (cheap, server-side)

- **A/B Lua-dispatch test** (item 1): `!testhamlet retailstart hyrstmill` (guildleve
  control) and watch for the first Behest objective row disappearing ~5s in.
- **Instantiate tuple sweep** (only if item 1 is positive): vary the
  `CreateScriptBindPacket` header params and the `init()` return tuple for the
  instance-raid profile, looking for the client actually constructing
  `InstanceRaidHamletDefense` (probe via a visible side-effect method, not a return
  value).
- **Work-sync pivot** (only if item 1 is negative): stop trying to call `startEvent`;
  instead replicate the Behest mechanism — drive the HUD through director work-sync /
  data packets, accepting that the instance-raid family may need a different
  server-push shape than name-dispatch.

---

## Files read this session (all under `tools/outputs/lpb/content_systems_20260612/lua/`)

- `director/instanceraid/instanceraidhamletdefense.lua` — HUD-bearing director subclass.
- `director/instanceraid/instanceraidbaseclass.lua` — `startEvent`/`reloginEvent`/
  `openInformationWidget` (the only widget-open entry points).
- `director/guildleve/guildlevebaseclass.lua` — `processUIInit` auto-open (why Behest
  "just works").
- `widget/desktopwidget_connector.lua:6332` — `openHamletExecutionWidget` (opens slots
  15/16).
- `widget/ask/hamletdefensescorewidget.lua`, `...rankingwidget.lua`,
  `...tutorialwidget.lua` — result/ranking/help panels (static, not the live HUD).
- `chara/npc/populace/populacehamletcaptain.lua` — battle-start choice NPC (returns to
  server).
- `chara/npc/populace/populacehamletpushevent.lua` — supply/support/craft buff NPC.
- `chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua` —
  `askEnterInstanceRaid` (instanced-dungeon entry choice, also server-consumed).

Decompile pipeline note: client `.le.lpb` files are `rle`-compressed Lua 5.1 bytecode.
The `content_systems_20260612` batch already contains both the decoded `.luac` and the
`unluac`-decompiled `.lua` for every hamlet/instanceraid/occupancy/publicraid script, so
no further client-script decoding is required for this subsystem — the remaining gaps
(#3, #4, #5) are retail captures and `ffxivgame.exe` reverse-engineering, not client Lua.

---

## DEEP DIVE ADDENDUM (2026-06-12, later session) — dispatch & lifecycle mechanics

Going deeper into the client dispatch path produced four concrete, high-value findings
that change the strategy. All from `content_systems_20260612/lua/`.

### Finding A — `delegateEvent` / `_callFunction` is the proven Lua-method dispatch channel

`directorbaseclass.lua:127` and `playerbaseclass.lua:963`:

```
delegateEvent(self, A1, A2_target, A3_method, ...extra)
  -> A2_target:_callFunction(A3_method, A1, self, ...extra)
  -> A2_target[A3_method](A2_target, A1, self, ...extra)
```

`_callFunction(actor, name, ...)` is the **native** dispatcher that invokes a *named Lua
class method* on a *specific actor object*. This is how the server's OWN working scripts
call client Lua methods. Real examples pulled from `Data/scripts/`:

```
callClientFunction(player, "delegateEvent", player, quest,    "processEvent025")
callClientFunction(player, "delegateEvent", player, quest,    "pE00", "???",1,1,1, town)
choice = callClientFunction(player, "delegateEvent", player, defaultFst, "defaultTalkWithInn_ExitDoor", nil,nil,nil)
choice = callClientFunction(player, "delegateEvent", player, questNOC,   "pETaskBoardAskLimsa")
```

Two important corrections to earlier session notes:
- **Return values DO come back** through `delegateEvent` (`choice = callClientFunction(...)`).
  Our earlier "returns never work" was only true for *raw* `RunEventFunction(name)`.
- Raw `callClientFunction(player, "openInformationWidget")` fails because the raw path
  resolves the name against the event/native table, never the director's class-method
  table. `delegateEvent` forces dispatch through `_callFunction` into the class methods.

**UNPROVEN nuance (the catch):** every working example targets a **quest / static actor**
(`GetStaticActor`). Whether a **director** actor is a valid `_callFunction` target is NOT
proven — and the handoff history notes that `directordelegate` cutscene mode
(`delegateEvent` on the director) produced *no* visible cutscene. So a director may not be
resolvable as a delegate target the same way a static actor is. This is now the precise
open question, replacing the older vaguer "can RunEventFunction call Lua at all."

### Finding B — `startEvent` is a server-kicked COROUTINE; the HUD opens only after it yields

`instanceraidbaseclass.lua:127`. Nothing in the entire client corpus calls `startEvent`,
`setCountDownTimer`, or `openInformationWidget` — they exist only inside this base class.
The retail **server** kicked `startEvent` as an event. Its body:

```
startEvent(self, cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType)
  instanceRaidWork.contentID = contentID; eventType = eventType; clearFlag = false
  setCountDownTimer(startTime, finishTime, false)
  processLogin(false); processStartEvent(...)
  if cutsceneName ~= "none" then executeCutScene(...) else _fadeInNowLoading... end
  _getMyPlayer():_fadeIn(1)
  self:_wait(1)                       -- <-- COROUTINE YIELD
  if eventType ~= 0 then processStartEffect(); self:_wait(1) end   -- <-- YIELD
  self:openInformationWidget()        -- <-- HUD OPENS ONLY HERE (line 145)
  instanceRaidWork.initFlag = true    -- <-- gate for all later HUD data (line 146)
```

Implication: even if `startEvent` is dispatched correctly, the widget opens only *after*
the coroutine progresses past one or two `_wait(1)` yields. If the server kick does not
drive the event coroutine forward (the way cutscenes are advanced), it stalls before
line 145 and **no widget ever appears** — exactly our observed symptom. `_wait` may be a
pure client-side timer (auto-resumes) or a server-driven yield; which one it is decides
whether a bare kick is enough. **This is testable**: kick `startEvent` with
`eventType = 0` (skips the second `processStartEffect`+`_wait`, halving the yields) and
see if the widget opens ~1s later.

### Finding C — ALL HUD population is gated behind `initFlag` (set only at end of startEvent)

`instanceraidbaseclass.lua:215` `_onReceiveDataPacket(self, kind, ...)`:

```
if instanceRaidWork.initFlag == false then return end   -- HARD GATE
kind == 1 -> clearFlag=true; setCountDownTimer(a,b,false); closeInformationWidget()  [VICTORY]
kind == 2 -> clearFlag=true; countdownStatus=0; closeInformationWidget()            [FAIL/END]
kind == 3 -> processUserMessage(...)                                                [HUD UPDATE]
```

So the supply-cart / war-potential / timer / buff updates (data packets of `kind == 3`)
are **silently dropped until `startEvent`/`reloginEvent` finishes and sets initFlag**.
This means our whole "send score/HUD data" effort cannot land until the widget-open
coroutine completes. Fix the open, and population becomes reachable.

### Finding D — `reloginEvent` is a SIMPLER widget-open path worth trying first

`instanceraidbaseclass.lua:148`. The "player relogged into an active duty" handler:

```
reloginEvent(self, contentID, startTime, finishTime, eventType, clearFlag)
  ... setCountDownTimer ...; processLogin(true)
  _fadeInNowLoading...; _fadeIn(1); self:_wait(1)
  if clearFlag == false then self:openInformationWidget() end   -- opens HUD
  instanceRaidWork.initFlag = true
```

Advantages over `startEvent`: no cutscene branch, no `processStartEffect`, only **one**
`_wait(1)` before `openInformationWidget()`. If a bare event kick can clear a single
`_wait`, `reloginEvent` is the path of least resistance to get the widget on screen.
Signature to kick: `reloginEvent(contentID, startTime, finishTime, eventType=0, clearFlag=false)`.

### Revised experiment ladder (in priority order)

1. **Kick `reloginEvent`** on the director with `clearFlag=false, eventType=0` and watch
   for the HUD ~1-2s later. Simplest open path; one coroutine yield.
2. **Kick `startEvent` with `eventType=0`** (one fewer yield than eventType=1) and watch.
3. **`delegateEvent` to the director** calling `openInformationWidget` directly:
   `callClientFunction(player, "delegateEvent", player, thisDirector, "openInformationWidget")`
   — bypasses the coroutine entirely. If the HUD opens, the director IS a valid delegate
   target and we are essentially done with the open; if not, the director is not
   `_callFunction`-resolvable and we need correct ActorInstantiate (gap #5).
4. Only after the HUD opens: drive `kind==3` data packets to `_onReceiveDataPacket` to
   populate, per `InstanceRaidHamletDefense.processUserMessage` subtypes (title, carts,
   war potential, buffs).

### `processUserMessage` subtypes (the post-open HUD update protocol, for later)

From `instanceraidhamletdefense.lua` `processUserMessage(self, subtype, ...)` (delivered
as `_onReceiveDataPacket` kind==3), the HUD update sub-opcodes are approximately:
`1`=title/rank, `2`/`3`=harvest table, `4`=field buffs (6), `5`=defense line status (3),
`6`=goods status (4), `7`=cargo target, `8`=boss flag, `9`=battle value (war potential),
`10`=combined refresh. These map onto widget commands `cmdSetGatheringItem`,
`cmdSetEnemyBuff`, `cmdSetArmyBuff`, etc. Documented here so the population phase does not
need re-derivation once the open is solved.

---

## DEEP DIVE PART 2 (2026-06-12) — dispatch resolution & the single decisive test

### Finding E — Director instantiation uses the SAME packet builder as the working Guildleve director

`Map Server/Actors/Director/Director.cs::CreateScriptBindPacket` is shared by ALL
directors. It sends `[classPath, 4,4,4,4,4, <init() return minus [0]>]` as the
ActorInstantiate params; the client runs `DirectorBaseClass._onInit(self, directorId, ...)`
→ `init(...)`. Guildleve works with this exact builder, so the *mechanism* of building a
client director object is sound. The only variables are `classPath` and the `init()`
return tuple. `InstanceRaidBaseClass.init(self, ...)` ignores extra args and just calls
`processInitialize()` to build its work bags — so it needs NO special init tuple, only the
correct classPath. The client accepted `/Director/InstanceRaid/InstanceRaidHamletDefense`
without error 40000, which means the script loaded and the class *should* be bound.

### Finding F — Totorak (the only working instanced content here) never calls director methods

`OpeningDirector.lua` is an empty shell. `Data/scripts/.../Totorak.lua` drives cutscenes
via `callClientFunction(player, "delegateEvent", player, quest, eventName)` — delegating to
**quest / static actors**, using the director only as the event owner. Every proven
`delegateEvent` in this codebase targets a static actor. Hamlet has no static-actor
equivalent: its widget-open logic (`openInformationWidget`) lives **on the director class**.
So hamlet requires something Totorak never needed — dispatching a method onto the
director object itself. That is the genuinely new ground.

### The dependency chain, fully mapped

```
ActorInstantiate(classPath=InstanceRaidHamletDefense)   [client builds director object]
        │  (accepted — no error 40000)
        ▼
director:startEvent(...)  OR  director:reloginEvent(...)   [server-kicked event handler]
        │  runs coroutine: fadeIn, _wait(1) [YIELD], (eventType≠0 → effect, _wait(1))
        ▼
director:openInformationWidget()            [line 145 — OPENS HamletDefenseWidget]
        │  sets instanceRaidWork.initFlag = true   [line 146]
        ▼
_onReceiveDataPacket(director, kind, ...)   [gated on initFlag; non-event actor data pkt]
        kind==3 → processUserMessage → cmdSet* → HUD POPULATED
        kind==1/2 → closeInformationWidget (victory/fail)
```

Two binary unknowns remain, each resolvable in ONE live test:

- **Q1 — Is the client director a valid Lua-method dispatch target?**
  Test (inside the working `noticeEvent` session, no coroutine involved):
  ```lua
  callClientFunction(player, "delegateEvent", player, thisDirector, "openInformationWidget")
  ```
  `openInformationWidget` is synchronous (just `desktopWidget:openHamletExecutionWidget()`),
  so if the director is dispatchable, **the Hamlet HUD opens immediately** — no `_wait`, no
  coroutine, no initFlag needed for the open itself.
  - HUD opens → Q1 = YES. The open is solved; remaining work is the documented populate
    protocol. **Hamlet HUD becomes achievable server-side-only.**
  - Nothing opens → Q1 = NO. The director object is not `_callFunction`-resolvable client
    side despite loading; we are blocked on correct ActorInstantiate (gap #5), which needs
    `ffxivgame.exe` RE or a retail capture.

- **Q2 (only if Q1=YES but a full `startEvent` kick still stalls) — is `_wait` server-driven?**
  Test: kick `reloginEvent` (one `_wait`, no cutscene/effect) or `startEvent` with
  `eventType=0`. If the HUD opens ~1s later, `_wait` auto-resumes client-side and a bare
  kick is sufficient. If it stalls, the server must drive event-coroutine resumption.

### Why earlier `startEvent` attempts were inconclusive (not disproof)

When we kicked `startEvent` / called it raw, the body yields at `_wait(1)` BEFORE
`openInformationWidget` (line 145). A stall there looks identical to "dispatch failed" from
the server side — no widget, no error. The `delegateEvent → openInformationWidget` test
removes that ambiguity by skipping the coroutine entirely. **Run it before any other
hamlet experiment.**

---

## HOW CLOSE ARE WE? (honest assessment, 2026-06-12)

**The entire mechanism is now mapped end-to-end** — what opens the widget, what gates
population, the exact dispatch channel, and the data-packet protocol to fill it. There are
no remaining *architectural* unknowns for the server-side-only path.

What's left is **one decisive live test** (Q1 above). Its outcome bifurcates sharply:

- **If `delegateEvent → openInformationWidget` opens the HUD:** we are ~1-2 focused
  sessions from a populated Hamlet HUD. The open is done; the populate protocol
  (`_onReceiveDataPacket` kind==3 + `processUserMessage` subtypes) is already documented
  and just needs server-side wiring + tuning. **High confidence, days of work.**

- **If it does NOT open:** the client won't dispatch Lua methods onto a director actor, and
  we are blocked on getting the client to build a fully-resolvable director — which realistically
  needs `ffxivgame.exe` reverse-engineering of the ActorInstantiate/_callFunction resolver
  (gap #4/#5) or a retail 1.0 duty-start packet capture (gap #3). **Weeks, or dependent on
  finding an external capture.**

Estimate: **~70% chance the optimistic branch holds**, because (a) the director script loads
without error, (b) the instantiation packet is identical to the working guildleve director,
and (c) `delegateEvent`/`_callFunction` is a generic base mechanism not obviously restricted
to static actors. The 30% risk is that the client gates `_callFunction` to actors registered
in a client-side lookup (static actors / quests) that dynamically-spawned directors don't
join.

**Single next action that collapses the uncertainty:** run the Q1 test
(`delegateEvent → openInformationWidget` on the director, inside `noticeEvent`) and report
whether the top-left Hamlet HUD appears.

---

## DEEP DIVE PART 3 (2026-06-12) — the widget lives at slot 15, not container 0x1B (explains the red tiles)

### Finding G — the real HUD is desktop widget SLOT 15, created HIDDEN

`widget/desktopwidget_connector.lua:6332` `openHamletExecutionWidget`:
```
openWidgetYield(15, "HamletDefenseWidget",      nil, nil, false)  -- 5th arg false = created HIDDEN
openWidgetYield(16, "HamletDefensePopupWidget", nil, nil, true)
```
- The live HUD is a **desktop static widget at slot 15**, NOT a widget-container widget at
  index `0x1B`. Our entire `_reserveWidgetContainer` / `_createWidgetInWidgetContainer(0x1B,
  "HamletDefenseWidget")` approach was building a **second, wrong widget instance** in the
  generic container — that is exactly the red `Undefined` tiles seen on 05-31. They were a
  detached copy with no data source, never the real HUD. **Abandon the 0x1B container route
  entirely.**
- `HamletDefenseWidget.init` (`widget/hamletdefensewidget.lua:3`) initializes everything to
  `-1`/blank and calls `initTimer/initDefenseLineStatus/initGoodsStatus/initArmyBuff/
  initEnemyBuff/initGatheringItem` — but does NOT call `cmdSetTitle` or `cmdShow`. And the
  widget is created with `false` = hidden. So **even a perfect `openInformationWidget` shows
  nothing on screen** until the server drives `cmdShow`. This independently explains "widget
  opens but I see nothing."

### Finding H — server populates the slot-15 widget via `delegateCommand`, gated by `_onReceiveDataPacket`

`cmdShow` / `cmdSetTitle` / `cmdSetWarPotentialValue` etc. are defined ONLY on the widget and
are NOT called by `init`. The director's `processUserMessage` (run from `_onReceiveDataPacket`
kind==3) fetches the widget via `desktopWidget:getHamletExecutionWidget()` (returns the slot-15
widget) and issues the commands. Server→widget dispatch uses:
```
PlayerBaseClass.delegateCommand(self, target, cmd, ...) -> target:_callFunction(cmd, self, ...)
                                                        -> target[cmd](target, self, ...)
```
i.e. `delegateCommand(player, <slot15 widget>, "cmdShow")` → `widget:cmdShow(player)` →
`widget:show()`.

### Exact populate signatures (from `widget/hamletdefensewidget.lua`)

- `cmdShow(self)` → `self:show()` — REQUIRED to make the hidden widget visible.
- `cmdSetTitle(self, contentId, hamletRank)` — `contentId` 8/9/10 selects GC icon set
  (Limsa/Gridania/Uldah → Aleport/Hyrstmill/Golden Bazaar); sets text id 13012 with
  (contentId, rank). Guarded: only re-icons if contentId changed (init value -1).
- `cmdSetTimer(self, endTimeUnix)` — computes `remaining = endTimeUnix - worldMaster:_getServerTime()`,
  writes `CustomControl_TimerLabel` props (`FloatData.Value0 = remaining`, warn thresholds
  300/120s). **Pass an absolute Unix end timestamp**, not a duration.
- `cmdSetWarPotentialValue(self, value, max)` — sets `ProgressBar_WarPotential` max+value;
  branches on `isShow()` (animated bar if visible, status bar if hidden) → **call `cmdShow`
  BEFORE `cmdSetWarPotentialValue`** for the animated bar.
- `cmdSetDefenseLineStatus(self, idx, status)`, `cmdSetGoodsStatus(self, idx, status)`,
  `cmdSetBossStatus(self, bool)`, `cmdSetTargetGoods(self, kind)`,
  `cmdSetArmyBuff(self, idx, on, ...)`, `cmdSetEnemyBuff(self, idx, on, ...)`,
  `cmdSetGatheringItem(self, slot)`, `cmdResetGatheringItem(self)` — the remaining HUD cells.
- Widget `work` bag: `contentId, hamletRank, hasGatheringItem[9], defenseLineStatus[3],
  goodsStatus[4], goodsKindTarget, bossStatus, armyBuff[3], enemyBuff[3]` (all init -1).

### Finding I — RaidFst0Dungeon03 (a REAL retail dungeon) proves the synchronous-open pattern

`director/occupancy/raidfst0dungeon03.lua` — a working retail dungeon director. Its
server-invoked methods open the duty widget **synchronously, no coroutine**:
```
relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime) end
eventNoticeCutScene(self, player, scene, A3, finishTime)
  ... cutscene ... desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
widgetSetOff(self) -> desktopWidget:closeRaidDungeonExecutionWidget()
```
These are the exact analog of hamlet's `openInformationWidget`/`openHamletExecutionWidget`,
and `relogin` confirms a director method CAN open the duty widget with no `_wait`. The
methods take `player` as the first arg after `self` — the `delegateEvent`/`_callFunction`
signature shape. **This is the cleanest working reference for the invocation we need.**

### Finding J (risk) — NO instance-raid/dungeon duty widget has EVER worked on this server

`grep` of `Map Server/` and `Data/scripts/` for `openRaidDungeonExecutionWidget`,
`widgetSetOn`, `eventNoticeCutScene`, `relogin`, `RaidFst0`, `Occupancy` → **zero hits**.
Totorak "works" only as cutscene+logic via `delegateEvent` to quests; it never shows a duty
timer HUD. So hamlet would be the **first** instance-raid duty HUD on this emulator — there
is no working widget to copy, which is why this has been hard. The retail pattern is now
fully reverse-engineered (Findings A-J), but it has never been exercised here.

### Updated picture of the full retail sequence (reverse-engineered)

```
1. ActorInstantiate(InstanceRaidHamletDefense)              [build client director]
2. server kicks startEvent/reloginEvent on the director     [coroutine; _wait yields]
     -> openInformationWidget() -> openHamletExecutionWidget()
        -> slot-15 HamletDefenseWidget created HIDDEN
        -> instanceRaidWork.initFlag = true
3. server sends data packet kind==3 to the DIRECTOR actor   [_onReceiveDataPacket]
     -> processUserMessage(subtype, ...) -> getHamletExecutionWidget()
        -> delegateCommand(player, widget, "cmdSetTitle", contentId, rank)
        -> delegateCommand(player, widget, "cmdShow")            [NOW VISIBLE]
        -> cmdSetTimer / cmdSetWarPotentialValue / cmdSet*       [populated]
```

The two server→client primitives this requires — both already present in our server —
are: (a) an **event kick** that runs a director coroutine method to completion, and (b) a
**data packet targeted at the director actor** that fires its `_onReceiveDataPacket`. The
revised experiment ladder (Part 2) plus the slot-15/cmdShow correction here is the complete
recipe. The only true unknown remains Q1: will the client run these director methods for a
dynamically-spawned director (vs only for static actors/quests).

---

## LIVE TEST RESULTS (2026-06-12, late) — delegateEvent onto a spawned director fails in ALL contexts

Q1 was tested directly. The server kicks `noticeEvent` (proven session) and dispatches
`delegateEvent(player, thisDirector, "openInformationWidget")` onto the spawned
`InstanceRaidHamletDefense` director.

| Context | Director path | isInstanceRaid | Result |
|---|---|---|---|
| Public Hyrstmill | InstanceRaidHamletDefense | no | dispatch accepted (`invalid=False`), **no widget, no error** |
| Public + `_setInstanceRaid(true)` precondition | same | client flag only | **no widget** |
| Private content instance (`privateAreaType=1`) + area `clientInstanceRaid=true` | same | YES (area `_onInit`) | **no widget, no crash** — identical |

Key log evidence: dispatch always logged as
`function=delegateEvent params=0x1, 0x64C00002, "openInformationWidget"` — target =
director (`0x6…` id) — client returns the same generic EventUpdate as for non-working
calls. Compare the WORKING cutscene dispatch in the same session:
`delegateEvent params=0x1, 0xA0F1B0E4, "ham0f301"` — target = a **quest/static actor**
(`0xA…` id), which DID play.

**Conclusion:** `delegateEvent` / `_callFunction` dispatch reaches the client and is
accepted, but produces no effect when the target is our dynamically-spawned **director**
actor (`0x6…`), in every context tried, while the identical mechanism works on
**static/quest** actors (`0xA…`). The instance context is NOT the missing variable.

This means one of:
1. The client never builds a script-bound, `_callFunction`-resolvable object for our
   director (the ActorInstantiate / CreateScriptBindPacket for directors may not register
   the actor in the client table that `_callFunction` looks up), OR
2. The client routes director methods (`startEvent`/`openInformationWidget`) ONLY through
   its native event dispatcher (a kicked event of that name on the owner), never through
   `RunEventFunction`/`delegateEvent` — i.e. we are using the wrong primitive entirely.

Both are below the Lua layer; distinguishing them requires `ffxivgame.exe` RE of the
`0x0130` RunEventFunction handler and the actor/`_callFunction` resolver (gap #4), or a
retail capture of a real instance-raid duty start (gap #3). Server-side Lua/packet
experiments have now been exhausted for the open step.

### What was added this session (kept for reuse, not reverted by intent)
- `PrivateAreaContent.clientInstanceRaid` flag → ActorInstantiate position 14
  (`isInstanceRaid`); set true by the Hamlet instance lifecycle. Correctly drives
  `AreaBaseClass:_setInstanceRaid(true)` on zone-in (verified no crash).
- `HamletDefenseDirector`: `InstanceRaidHamletDefenseClientDirectorClassPath`,
  `IsInstanceRaidClientDirector()`, `GetEndServerTime()`, `instanceraid` profile/alias,
  `UseRetailStartClientDirectorProfile` routes hamlet→instanceraid.
- `Defense.lua`: instance-raid `init()` branch + `onEventStarted` Q1 dispatch probe.

---

## DEEP DIVE PART 4 (2026-06-12) — actor-ID classes explain WHY every primitive failed

Decoding the actor IDs from the live logs against the server's ID scheme cracked the
mechanism question.

### Actor-ID type scheme (from server source)
- **Static/global actors**: `id | 0xA0F00000` (`StaticActors.cs:86`). The working cutscene
  target `0xA0F1B0E4` is a static actor (`Etc202`). `worldMaster = 0x5FF80001`
  (`WorldMaster.cs:32`). These are always-spawned, always script-bound globals.
- **Directors**: `6 << 28 | zoneId << 19 | id+2` (`Director.cs:61`) → the `0x6…` range. Our
  hamlet director `0x64C00002` is here.

### The three server→client primitives, and why each can't reach a director method

1. **`RunEventFunction(name)`** (raw `callClientFunction(player, name, ...)`): resolves
   `name` against the client's **native event-function table** (the `_underscore`
   functions). Proven: `_createWidgetInWidgetContainer`/`_loadForm` executed (red tiles),
   but `openInformationWidget` and `startEvent` did nothing — they are director Lua class
   methods, not native event functions, so the lookup misses.
2. **`delegateEvent` → `target:_callFunction(method, ...)`**: invokes a Lua class method on
   a **target actor**, but only resolves targets the client holds in its scriptable-actor
   registry. Static actors (`0xA0F…`) resolve (cutscene played); our director (`0x64C00002`,
   `0x6…`) was accepted but no-op'd — directors are not in that registry for `_callFunction`.
3. **`KickEvent(owner, eventName)`**: the client only recognizes a FIXED set of event names
   — `talkDefault`, `emoteDefault1..8`, `pushDefault`, `pushCommand`, `noticeEvent`
   (`playerbaseclass.lua:32`). `startEvent` is NOT among them, so kicking it yields a
   non-dispatching ("zombie") session. That is why our earlier `startEvent` kick failed.

**Net:** none of the three primitives we have been using can invoke `startEvent` /
`openInformationWidget` on a `0x6…` director. Every negative result this session is now
explained by mechanism, not by chance.

### Where the retail trigger actually lives — the content-group / content-command path

The client reaches a director only via `group:getDirector()` (`playerbaseclass.lua:1173`,
`ContentGroupBaseClass.getDirector`). Director lifecycle is driven by **work-sync** and the
**content-command** system, not by the three primitives above:
- `DirectorBaseClass._onUpdateWork`: on the `"_init"` work sync it calls `processUIInit`;
  on `directorWork.contentCommand` sync it calls
  `worldMaster:_getMyPlayer():setContentCommandVariation(contentCommand, contentCommandSub)`.
- Guildleve's HUD opens precisely this way: `GuildleveBaseClass.processUIInit` auto-opens on
  `_init`. `InstanceRaidBaseClass` has NO `processUIInit`, so a bare work-sync opens nothing.
- The remaining retail entry for `startEvent` is therefore the **content group / occupancy /
  content-command** machinery (our server already has unused `commandContent`/`commandForced`
  bootstrap functions in `FullCommandBootstrapFunctions`). On retail the content group's
  start drove the InstanceRaid director's `startEvent`; we have never exercised that path to
  completion.

### Consequence for strategy
The open step is gated on driving the **content-group/content-command lifecycle** so the
client invokes the director's `startEvent` itself — OR on confirming (via `ffxivgame.exe` RE)
exactly which work/command write the client maps to `startEvent`. This is the precise,
narrowed unknown. The three primitives are conclusively eliminated, which is real progress:
we now know the door, not just that the room is dark.

### Concrete next experiments (server-side, grounded in this finding)
1. Drive the **content-command** path: set `directorWork.contentCommand`/`contentCommandSub`
   on the director and sync it, so the client runs `setContentCommandVariation` and enters
   content mode — then see whether the InstanceRaid lifecycle (and `startEvent`) is invoked.
2. Inspect how our server builds the **content group** for the hamlet director
   (`CreateContentGroup` vs `CreateGLContentGroup`); the InstanceRaid client director may
   require an occupancy/raid-style content group, not the Simple one, to drive its lifecycle.

---

## DEEP DIVE PART 5 (2026-06-13) — the content-group is how the client resolves a director; our wiring gaps

Built directly on Part 4 (directors aren't `delegateEvent`-resolvable). The decomp of the
content-group classes shows HOW the client is *supposed* to get a usable director, and
pinpoints what our server doesn't drive.

### Finding K — the client resolves the director via the content group's `_globalTemp.director`
`ContentGroupBaseClass.getDirector()` returns `contentGroupWork._globalTemp.director`
(`tools/outputs/lpb/content_group_decomp/lua/ContentGroupBaseClass.lua:155`). The director
is a SYNCED field on the content group (`_globalTemp`/`_nesting`), and the client reaches
the director only through `group:getDirector()` (`playerbaseclass.lua:1173`). Content-group
`_init` / property sync also drives `desktopWidget:processUpdateMyPlayerRestrictionByContents`.

### Finding L — our server DOES register the director in the group (good), so the client has it
`Map Server/Actors/Group/ContentGroup.cs:55`:
`contentGroupWork._globalTemp.director = (ulong)director.Id << 32;` and it syncs
`contentGroupWork._globalTemp.director` (lines 119/127-128). So `group:getDirector()` should
resolve our director client-side. This means the director object exists for the client via
the group — yet a raw-ID `delegateEvent` to `0x64C00002` still no-op'd (Part 4). The retail
trigger does NOT come from a raw-ID dispatch; it comes from the content-command / group
lifecycle below.

### Finding M — our director never sets `directorWork.contentCommand`, so content mode never engages
Client `DirectorBaseClass._onUpdateWork` (`directorbaseclass.lua:155`): on the director's
`_init` work sync it calls
`setContentCommandVariation(directorWork.contentCommand, contentCommandSub)` **only if
`directorWork.contentCommand ~= 0`** (and `getQuestContentsCommandPermitFlag()`), and again
whenever `directorWork.contentCommand` syncs. `DirectorBaseClass._onInit` declares
`directorWork._sync = {contentCommand:int32, contentCommandSub:int32, syncBuffer:bool[128]}`.
Our `Map Server/Actors/Director/Director.cs` has NO `contentCommand` field, never writes it,
never syncs it → it stays 0 → `setContentCommandVariation` NEVER fires → the player never
enters content-command mode. This is a concrete, server-side gap and a prime suspect for why
the instance-raid director lifecycle/HUD never engages.

### Finding N — wrong content-group family for an instance raid
Hamlet uses `DirectorContentGroupKind.PublicPop`
(`HamletDefenseDirector.cs:133`) → client `PublicPopGroup`. Retail instance raids ride with
`/Director/InstanceRaid/OccupancyPlayers/RaidPlayers` (required at
`instanceraidbaseclass.lua:2`) and an occupancy/relation group
(`group/relationgroup/occupancyplayersrelationgroup`), NOT `PublicPopGroup`. `RaidPlayers`
and `OccupancyPlayersBaseClass` are thin `DirectorBaseClass` subclasses used for player
management alongside the main InstanceRaid director. Our server implements none of this; the
hamlet director is driven by the wrong group family for the InstanceRaid client class.

### Revised root-cause picture
The InstanceRaid client director is real and is referenced by our synced content group, but
its lifecycle (`startEvent` → `openInformationWidget`) is driven by the **content-command /
occupancy-group machinery**, which our server does not exercise:
1. `directorWork.contentCommand` is never set/synced (Finding M).
2. The content group is `PublicPop`, not the occupancy/raid family the InstanceRaid director
   pairs with (Finding N).
3. No `RaidPlayers`/`OccupancyPlayers` sub-director is created.

### Concrete next experiments (server-side, no binary RE)
1. **Set + sync `directorWork.contentCommand`** on the hamlet director to a non-zero
   instance-raid content-command value so the client runs `setContentCommandVariation` on
   `_init` and enters content mode. Add a `contentCommand`/`contentCommandSub` field to
   `Director.cs` (or the hamlet subclass) and include it in the director work sync.
2. **Match the content-group family**: drive the hamlet director with an occupancy/raid-style
   content group (and create a `RaidPlayers` sub-director) instead of `PublicPopContentGroup`,
   so the client's InstanceRaid lifecycle is engaged the way it expects.
3. If 1+2 cause the client to invoke the director lifecycle (watch for the HUD or for
   `setContentCommandVariation`/content-mode side effects), the open is solved and the
   already-documented populate protocol applies.

### Remaining unknowns (still need capture or RE)
- The exact `contentCommand`/`contentCommandSub` numeric values for Hamlet Defense
  (a retail capture or `ffxivgame.exe` content-command table would give these).
- Whether the occupancy-group path alone invokes `startEvent`, or an additional kicked
  `pushCommand`/work write is required. These are the last gaps; the mechanism is otherwise
  mapped.

---

## DEEP DIVE PART 6 (2026-06-13) — the red tiles WERE the real widget; container route is a dead end

Continued client decomp (debug utilities + widget-container internals) reframed two earlier
assumptions and closed off the container approach for good.

### Finding O — `_createActor` is the universal widget-create primitive; the red tiles were the real `HamletDefenseWidget`
`DesktopWidget.createWidget` and `Debug.createTestWidget` both build a widget via
`_createActor(nil, className, false, "/Widget/<name>", parent, ...)` then `:show()`
(`debug_utility.lua:442`, `desktopwidget.lua:19`). `_createWidgetInWidgetContainer` uses the
same native under the hood. So the 05-31 red "Undefined" tiles were NOT a wrong/foreign
widget — they were a genuine `HamletDefenseWidget` instance rendering with its init defaults
(`contentId = -1`, `hamletRank = -1` → `setText("TextBlock_ContentsName", 13012, -1, -1)`
= "Undefined"). The widget CLASS renders; it was simply never populated (`cmdSetTitle`/
`cmdShow` never reached it) and was created in the wrong management context (below).

### Finding P — `HamletDefenseWidget` is NOT a widget-container widget; the `0x1B` route is invalid
`DesktopWidget.getCreateParameter` (`desktopwidget_connector.lua:15395`) maps widget-container
indices to types: **index 1 = `GuildleveExecutionWidget`, index 2 = `EquipWidget`** — and
nothing else. The container create/get/delete path (`createWidget2`, `getWidget2`,
`_createWidgetInWidgetContainer`) is built only for those. `HamletDefenseWidget` has no
container index, so `_createWidgetInWidgetContainer(0x1B, "HamletDefenseWidget")` forced it
into a slot it was never designed for — which is why `_getWidgetFromWidgetContainer(0x1B)`
returned nil and `cmdShow`/data binding never took. **Abandon the `0x1B` widget-container
route permanently.** The widget's only correct home is desktop **slot 15** via
`desktopWidget:openHamletExecutionWidget()` (Part 3, Finding G).

### Finding Q — the direct-create path exists but is not server-invokable
`Debug.createTestWidget(self, "/Widget/HamletDefenseWidget", desktopWidget)` would create AND
show the widget directly, bypassing the director entirely. But `debug` and `desktopWidget`
are CLIENT-side global singletons, not server-known actors (only `0xA0F…` static actors and
`0x5FF80001` worldMaster are server-addressable). `_createActor`/`createWidget`/`openWidget`
are native methods on `desktopWidget`, which we cannot target with `delegateEvent`/
`delegateCommand` from the server. So there is no server-side shortcut to open the slot-15
widget that bypasses the director — the open must go through
`director:openInformationWidget()` (Part 5), which is gated on the content-command/occupancy
lifecycle our server doesn't drive.

### Net after Parts 4-6 (mechanism fully bounded)
- The widget renders (proven) and its correct home is desktop slot 15 via
  `openHamletExecutionWidget`, reachable only from `director:openInformationWidget`.
- The director is referenced by our synced content group, but its lifecycle never engages
  because (a) `directorWork.contentCommand` is never set/synced, (b) the content group is
  `PublicPop` not the occupancy/raid family, (c) no `RaidPlayers` sub-director exists.
- No server→client primitive (RunEventFunction native table / delegateEvent actor registry /
  KickEvent standard-event list) can directly invoke a director method or a `desktopWidget`
  method; the engagement must come from the content-command/occupancy machinery.

### What is left to learn (and where)
- Exact `contentCommand`/`contentCommandSub` values for Hamlet → binary gamedata sheet or a
  retail capture (NOT in client Lua; the client gamedata folder only carries cutscene sheets).
- Whether driving content-command + an occupancy/raid content group is sufficient to make the
  client invoke `director:startEvent` → `openInformationWidget`, or whether an additional
  native step is needed → testable server-side once content-command is wired (Part 5 exp #1).

Client-script decomp for this subsystem is now exhausted: the open path, the populate
protocol, the data channel, the actor-resolution rules, the content-group wiring, and the
widget-management model are all mapped. The two residual unknowns are binary gamedata values
and one server-side experiment.

---

## BREAKTHROUGH (2026-06-13) — directorWork sync WORKS; the client director is alive

Experiment #1 (Part 5/Finding M) succeeded with a visible result. Syncing
`directorWork.contentCommand = 1` (via new `DirectorWork` + allowlisting `directorWork` in
`SetActorPropetyPacket`) made a **content-command menu element (a paper/scroll icon) appear
in the client mini-menu**. Confirmed:

1. The `directorWork` property-sync channel reaches the client and is acted upon (the
   MurmurHash property path `directorWork.contentCommand` is recognized).
2. `setContentCommandVariation` ran → content-command mode engaged.
3. **CRITICAL: the client ran `DirectorBaseClass._onUpdateWork` -> `setContentCommandVariation`
   on our dynamically-spawned director (`0x64C00002`).** The client director object is alive,
   script-bound, and executes its Lua methods when driven by WORK-SYNC. Earlier worry that
   the director was not a real client object is disproven.

### Reframe of the whole problem
The blocker was never a dead director. The director runs its methods via the **work-sync
`_onUpdateWork` channel** (NOT via RunEventFunction/delegateEvent/KickEvent, all still ruled
out). Guildleve's HUD opens through this exact channel (`processUIInit` on `_init`). The
InstanceRaid HUD differs only in that `InstanceRaidBaseClass` has no `processUIInit`; its
`openInformationWidget` is reached from `startEvent`. So the remaining task is to find the
WORK-SYNC / content-command state change the client maps to the InstanceRaid widget open.

### Next experiments (now grounded on a working channel)
1. Inspect `InstanceRaidBaseClass.processUpdateWork` / `processUIInit` and any
   `_onUpdateWork` branch that could open the HUD via a work field, then drive that field.
2. With content mode engaged, drive the rest of the content lifecycle: the `directorWork`
   `syncBuffer[128]` and the content-group property sync, and/or a `pushCommand` event
   (the NPC is `PopulaceHamletPushEvent`; `pushCommand`/`pushDefault` ARE recognized events).
3. Sweep `contentCommand` values — the paper icon is variation 1; the correct Hamlet value
   may unlock content actions/HUD tied to the InstanceRaid content.

### New code (this session, working)
- `Map Server/Actors/Director/Work/DirectorWork.cs` (contentCommand/contentCommandSub).
- `Director.directorWork` field; `directorWork` added to `SetActorPropetyPacket` allowlist.
- `HamletDefenseDirector.EngageContentCommand(player)` — syncs `directorWork/contentCommand`.

---

## EXTERNAL DECOMP (2026-06-13) — Yokimitsuro/ffxivDecomp (Ghidra RE of 1.23b client)

The user provided two RE repos. `Yokimitsuro/ffxivDecomp` is a Ghidra reverse-engineering
corpus of the 1.23b client (`docs/re/exe` native findings, `docs/re/lua` script findings,
symbol maps). Key findings that resolve our architecture questions:

### Confirmed: the Director is a CLIENT-SIDE content engine; the server only spawns + syncs + authorizes
From `finding_directorbaseclass_content_orchestration_model.md`:
```
1. SERVER spawns the Director (spawn opcode 0x17c with a Director class name)
2. CLIENT runs the Director's Lua: init -> processUIInit: OPEN CONTENT WIDGETS
                                   -> setContentCommandVariation
3. EVENT STEPS via delegateEvent (director invokes handler fns, client-side)
4. STATE SYNC via updateSyncWork (_updateWork, wire 0x12F/0x133, rate-limited)
5. NOTICE AUTH: director sends "noticeEvent" -> server ACCEPT or _onNoticeRejected
6. FINALIZE: clear content command set; despawn 0x143
SERVER ROLE: trigger directors (spawn), track _sync state, authorize notices, grant rewards.
The server does NOT run content logic -- it's all in the director's client Lua.
```
So **the widget open happens inside the director's own client Lua lifecycle**, not from a
server method call. For guildleve/quest that is `processUIInit` (fires on work-sync when
`startTime > 0`). `InstanceRaidBaseClass` has no `processUIInit`, so its open is in
`startEvent`/`reloginEvent`.

### Confirmed: Director native API is MINIMAL (5 bindings) — everything else is pure Lua
From `finding_director_master_block_located_5_registrars_complete.md`:
`_breakNotice`, `_updateWork`, `_getGroupByDisplayName`,
`_getExtendedTemporaryGroupByDisplayName`, `_waitForHamletDefenseScore`. No native binding
invokes `startEvent`. So `startEvent` is dispatched purely in Lua.

### Confirmed WHY kicking "startEvent" zombied: it is not a recognized event mode
From `finding_server_notify_family_and_notice_authorization.md` — the client's event modes
are exactly `emoteDefault1..8`, `pushDefault`, `pushCommand`, `noticeEvent`. `startEvent` is
NOT a kickable event name. The notice system is **client-initiated**: client calls
`_callServerOnCommand`/`_callServerOnTalk`/`_callServerOnPush` -> enters `noticeEvent` mode ->
server ACCEPTs/REJECTs. So we cannot reach `startEvent` by kicking it (confirmed dead).

### Confirmed: work-sync inbound `_onUpdateWork` has a special "guildleve" path, none for instanceraid
From `finding_commandupdater_inbound_handlers_onUpdateWork_callback.md`: the inbound work
handler (`CommandUpdater_invokeLua_onUpdateWork_complex`, wire 0x133) fires `_onUpdateWork`
and has a special-cased `MyPlayer + "guildleve"` branch. There is no instance-raid branch —
consistent with the InstanceRaid HUD NOT being work-sync driven.

### Confirmed: three EXE<->Lua bridge paradigms (none lets the server call an arbitrary director method)
From `finding_ui_event_dispatcher_third_lua_path.md` + `finding_invokeLua_roster_closed_80_complete.md`:
1. invokeLua_* (80): C++ fires fixed Lua hooks (`_onUpdateWork`, `_onReceiveDataPacket`,
   `_onPreEvent`, `_onInit`, ...). A CLOSED roster — `startEvent` is not among them.
2. registerLua_* (123): Lua calls C++ methods (`_executeCommand`, `_fadeIn`,
   `_getHamletDefenseScore`, ...).
3. UIEventDispatcher (timed queue): `_onUICommandEvent`/`_onUICommandRequest` only.
The server reaches the director only through the fixed invokeLua hooks (work-sync, data
packet, notice/event), NOT by naming an arbitrary Lua method.

### Hamlet specifics confirmed (`finding_hamlet_and_retainer.md`, `finding_instance_raid_system.md`)
- contentID 8/9/10 = hamletID 1/2/3 (Limsa/Gridania/Uldah). Hamlet master NPCs
  1600146/1200220/1000062. Log channel 35.
- `processUserMessage` dispatches eventType 1-28 (1-20 silent, 21-28 popup with msg ids
  1019/1091/1022/1063/1013/1018/1017/1063), via `_onReceiveDataPacket(A1=3, eventType, ...)`.
- InstanceRaid lifecycle (their 1.23b read): server "sends" startEvent / reloginEvent /
  clearEvent / failedEvent / `_onReceiveDataPacket(A1=1/2/3)` / cutSceneEvent / exitCutScene.
  Countdown tiers thresholds [60,180,300,600,1200,1800]s + halfway; messages
  52009/52092/52021/52065/52054/52010/52093. NOTE their startEvent arg list
  `(contentID, startTime, finishTime, eventType, alreadyClear)` differs from our decompiled
  client's `(cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType)` —
  patch/version difference; OUR client's Lua is authoritative for this server.

### THE resolved question + remaining gap
The widget open lives inside the director's client Lua, reached only from
`startEvent`/`reloginEvent`. Those are invoked by the client's own event/content machinery,
NOT by any server primitive we can name (kick is impossible; work-sync has no instanceraid
path; invokeLua roster is fixed). The realistic remaining unknown is the
**occupancy / content-group entry** that, on the client, drives the InstanceRaid director into
`startEvent`. The ffxivDecomp open threads flag the same: "find the Lua callsite that INVOKES
startEvent" and "find the RaidPlayers/OccupancyPlayers system". That's the last mile.

### Confirmed working lever (ours): directorWork content-command sync
Our `directorWork.contentCommand` sync (proven by the paper-icon menu) matches the decomp's
`setContentCommandVariation` content-command-set mechanism. It is a real, correct piece of the
content-director setup — just not the widget-open trigger by itself.

### Event dispatch pattern (request -> event -> accept/reject) and the start trigger
From `finding_npc_event_system.md`: the server triggers actor events by firing fixed
invokeLua hooks (`_onTalkEvent`, `_onPushEvent`, `_onEmoteEvent`) after a request/accept
handshake. These ARE in the closed invokeLua roster. The director's `startEvent` is NOT one
of these hooks. The Hamlet start handshake is: player talks to `PopulaceHamletCaptain`
(`talkInContents` returns the player's choice) -> retail server creates the InstanceRaid
director + content group -> the client self-drives. `PopulaceHamletPushEvent` is the
buff/supply NPC, not the start trigger.

### FINAL SYNTHESIS — where the wall actually is
Two independent corpora (our local 1.x client decompile + the Yokimitsuro Ghidra RE of
1.23b) agree completely on the architecture and BOTH leave the same single thread open:
**what makes the client director run `startEvent` (-> `openInformationWidget`).** It is:
- NOT a kickable event (event modes are a fixed set; `startEvent` isn't one),
- NOT a work-sync handler (no instanceraid branch in `_onUpdateWork`; `instanceRaidWork` is
  `_temp`, not server-syncable),
- NOT in the closed native invokeLua hook roster (80 hooks; `startEvent` absent),
- NOT a director native binding (only 5 exist).
The remaining possibility consistent with all evidence: the client self-drives `startEvent`
when it is placed into an instance **content group of the correct KIND** (the content-group
finding notes kinds `30001`/`30006` are special "story/raid" content types) and/or an
occupancy/`RaidPlayers` membership group — neither of which our server builds (we use
`PublicPopContentGroup`). The exact kind value and whether it triggers `startEvent` is
unresolved in BOTH corpora (the ffxivDecomp author lists "find the callsite that INVOKES
startEvent" as an open thread).

### Net position
- WORKING lever: `directorWork` content-command sync (paper-icon menu) — proves the client
  director is alive and our work-sync path is correct.
- FULLY MAPPED: the entire open/populate/data architecture.
- THE wall: the client-self-drive trigger for `startEvent`, gated on a correct instance
  content-group/occupancy setup that is itself only partially reverse-engineered anywhere.
- Realistic unblock: implement a raid/occupancy content group of the right kind (+ RaidPlayers
  membership) and observe whether the client self-drives the InstanceRaid lifecycle — OR get a
  retail capture / finish the occupancy-group RE that even the dedicated project left open.
