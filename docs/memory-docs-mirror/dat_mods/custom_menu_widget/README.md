# CustomMenuWidget injection and test guide

This package adds a small, versioned UI API to the client `PopulaceStandard`
class and pairs it with guarded server helpers and summonable GM test NPCs.

It reuses the native FFXIV 1.x ask and NPC dialogue widgets. It does not add a
new SQWT/form layout, grant items, or advance quests by itself.

## Injected client API

The generated LPB adds these methods:

```lua
PopulaceStandard.customMenuApiVersion() -- returns 23
PopulaceStandard.customMenuOpen()
PopulaceStandard.customMenuReset(answerCount)
PopulaceStandard.customMenuSetTitle(title)
PopulaceStandard.customMenuSetRow(index, label)
PopulaceStandard.customMenuSetPaging(answerCount)
PopulaceStandard.customMenuShow()
PopulaceStandard.customMenuPoll()
PopulaceStandard.customMenuHide()
PopulaceStandard.customMenuClose()
PopulaceStandard.customMenuAskRows(textOwner, questionRow, answerCount, ...)
PopulaceStandard.customNpcSay(textOwner, textRow, animationId, ...)
```

- API v23 uses short EventFunction phases. One server session
  calls `customMenuOpen` once, then each menu page runs
  `Reset -> SetTitle -> SetRow -> SetPaging -> Show -> Poll -> Hide`. A linear
  low-level flow can reuse that same hidden AskWidget, and `customMenuClose`
  runs once when the interaction finishes. The supported server pager does not
  reuse it: every displayed page owns and closes an independent flat session.
- Every phase independently reacquires `getWidget(4, "Ask/AskWidget")` and
  `getWidget(4, nil)` and requires them to be the same live root before it reads
  or writes the widget. API v23 stores no ownership marker, row cursor, widget
  reference, or other custom state on either the actor or the widget.
- `customMenuOpen` keeps only the native creation handshake in one bounded
  client call. Each `customMenuPoll` samples the declared `askResult` six times
  around exactly five `desktopWidget:_wait(0.1)` yields. It reacquires and
  revalidates the exact typed/generic root after every yield, returns as soon as
  a selection or cancellation appears, and otherwise returns pending `0` after
  at most 0.5 seconds. This is a bounded scheduler window, not a stock selector
  or client loop. The server uses `CustomMenu.MAX_POLL_ATTEMPTS=120` and
  `CustomMenu.POLL_INTERVAL_SECONDS=0.25`, for about 90 seconds when every
  pending Poll consumes its full window, plus EventFunction round-trip time.
  `customMenuClose` bounds deletion settling.
- `customMenuReset` resets the standard AskWidget fields and clears/collapses
  all 24 answer controls. The server therefore sends only the real rows through
  explicit `customMenuSetRow(index, label)` calls; a longer parent menu cannot
  leak labels into a shorter follow-up page. Reset restores
  `askWork.inputControlFlag=true`, matching the stock AskWidget contract.
- Preparation assigns the standard AskWidget work fields directly. In
  particular, `askPaging=false` means the widget's own PagePrevious/PageNext
  handlers change its eight-item pages; page buttons do not complete the
  selection. `customMenuSetPaging` recomputes the page count/grid and calls
  stock `AskWidget.pageChange(1)`. This recovered native path remains in the
  injected API, but lists above eight rows no longer use it in the supported
  test roster. `CustomMenu.askPaged` keeps every rendered page at eight rows or
  fewer and performs navigation on the server.
- `customMenuShow` first requires zero-argument `widget:show()` to succeed. This
  uses the stock animated root branch without child recursion. Show then
  requires `desktopWidget:changeFocusedWidget(widget, false, false)` and
  `widget:processAfterShow(false)` to succeed, in that order. Any rejected step
  returns `-107`. `customMenuHide` is unchanged and requires the stock root-only
  `widget:hide(false, false, false)` call. Poll is unchanged from API v22. The
  phases still avoid `AskWidget.ask`, `initialWidget`, `resetBaseAskResult`, and
  selector helpers.
- Selection results from `customMenuPoll` are:

  | Result | Meaning |
  | --- | --- |
  | `1..answerCount` | Selected answer index |
  | `0` | Selection is still pending |
  | `-3` | Player canceled |

  Phase diagnostics are stable:

  | Result | Methods | Meaning |
  | --- | --- | --- |
  | `-101` | Open | Slot 4 was already occupied |
  | `-102` | Open | Global widget-create command was busy |
  | `-103` | Open | `openWidget` rejected the request |
  | `-104` | Open | Creation did not settle within ten waits |
  | `-105` | Open and all later phases | Typed AskWidget was missing |
  | `-106` | Open and all later phases | Typed widget was not the generic slot-4 root |
  | `-107` | Show or Hide | Animated Show, focus, after-show, or root Hide was rejected |
  | `-108` | Close | `closeWidgetDirect` rejected the exact root |
  | `-109` | Close | Slot 4/create state did not settle within ten waits |

  The server requires the integer result `1` from every mutating phase and
  reports both the failing method name and returned code. Poll accepts only
  pending `0`, cancel `-3`, or a choice in the active range; any other value or
  non-integer is reported as a Poll phase error. `finish` clears the server
  session bit even when Close reports an error.

- `customMenuAskRows` uses normal client text-sheet rows and is the preferred
  path for localized content.
- `customNpcSay` displays a text-sheet row through the native NPC dialogue
  panel (`NpcSayWidget`). Consecutive calls create click-through story pages.
- `CustomMenu.askPaged(player, title, options)` is a server helper rather than
  another injected client method. Lists of up to eight choices use the proven
  single-page literal path directly. Longer lists use five content rows per
  server page plus applicable `Previous`, `Next`, and `Close` rows. Each page
  is an independent literal session containing at most eight rows.

The reference Lua is in
`client_lua/PopulaceStandard_customMenuAsk.lua`. The game loads the generated
compiled LPB, not that loose source file.

## Build and install the injection

From the repository root:

```powershell
python tools/actions/build_custom_menu_populacestandard_overlay.py
```

The builder:

1. Rebuilds the recovered stock LUAC and requires it to match the installed
   FFXIV 1.x client LPB byte-for-byte.
2. Appends the twelve API methods without changing the original methods.
3. Writes and decodes the output again to verify the wrapper.
4. Installs the result under the launcher's `Windower/DatOverlay/CustomMenuWidget`
   collection.

Default client source:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\script\729s9\wu7\uvupy975\uvupy975rq9w69s6.le.lpb
```

Default overlay target:

```text
..\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\CustomMenuWidget\client\script\729s9\wu7\uvupy975\uvupy975rq9w69s6.le.lpb
```

Every API version change must be loaded on both sides: build/install the
overlay and restart the client, then rebuild and restart the map server before
using `!custommenutest`. The command also uses the C# `SpawnNamedActor` method,
so reloading Lua alone is not enough for the first installation. Later changes
limited strictly to server Lua can use the normal Lua reload path.

Do not use `--skip-source-lpb-verify` for a live installation. That option is
only for offline fixture work where the installed client is unavailable.

## Summon the test NPCs

After the overlay is installed, log in as a GM and run:

```text
!custommenutest spawn
```

This explicitly opts the current player into API v23 and spawns six named,
owner-only NPCs in front of the player. Other players cannot see or interact
with them:

1. `Native: Story Bubble` — only the inherited native NPC dialogue path, using
   existing `Sum6m0` row 93.
2. `Native: DAT Choices` — only the inherited stock DAT-row Ask path, using
   existing `Sum6m0` row 98 with two answers.
3. `Literal: Yes or No` — one literal two-choice confirmation.
4. `Literal: Four Choices` — one literal four-answer page with no paging or
   follow-up menu.
5. `Literal: Server Paging` — eighteen literal choices split into independent
   flat pages with server-handled `Previous`, `Next`, and `Close` rows.
6. `Literal: Keystone Flow` — one keystone list followed linearly by one
   confirmation. It has no story bubble and changes no items or quest state.

The two Native probes deliberately bypass `CustomMenu.begin`; `askRows` and
`sayRow` own independent stock widget lifecycles and must not first open the
reusable literal AskWidget. The four Literal probes use the normal API v23
literal session.

API v23 keeps setup and visibility calls short and lets each
`customMenuPoll` provide up to five 0.1-second client scheduler yields while
the player chooses. Poll takes six result samples and revalidates the exact
AskWidget after every yield. Show uses the stock animated root branch, then
explicitly completes focus and after-show processing. Do not start another
Talk while an interaction is still active.

Test the NPCs in the numbered left-to-right order. After each successful
interaction has fully returned control, immediately talk to that same NPC a
second time before moving to the next probe. For `Literal: Server Paging`, use
this live route on the first Talk: `Next`, `Next`, `Previous`, `Next`, `Next`,
then `Test option 18`. It must report absolute option 18 and return control. On
the second Talk, use `Next`, `Previous`, then `Test option 04`; it must report
absolute option 4. For `Literal Keystone Flow`, complete the list and its single
confirmation.

`Menu: Nested` is intentionally excluded from the summon roster and is not a
supported API v23 test. Repeating that multi-page looping interaction under API
v22 produced a repeatable softlock. The flat probes above isolate native
dialogue, native DAT choices, one-page literal selection, server paging, and
one linear confirmation without using category/submenu/Back loops.

If any probe freezes, softlocks, or reports a phase/client error, stop the test
order immediately. Use `!endevent` if the client still accepts commands, then
restart the client before retrying that probe or testing another NPC.
Continuing after a failed interaction could let residual slot-4 state
contaminate the next result.

Other commands:

```text
!custommenutest status
!custommenutest clear
```

After a successful capability probe, `status` should report cached client
version 23. An interaction error such as `server=23 client=22` means the old
overlay is still loaded; install the new LPB and restart the client.

`clear` removes the current GM's six actors and disables the API opt-in for
that player.

### Coordinated event recovery

If a test interaction waits indefinitely, run:

```text
!endevent
```

Recovery is deliberately ordered. The command first cancels the server's
event-function waiter, waits 1.25 seconds for an in-flight bounded client
function to retire, clears `customMenu.sessionActive`, and only then sends
`EndEvent`. Do not send another teardown during that delay. Immediate teardown
had been observed only about 3.5 milliseconds after waiter cancellation and
raced the still-running client function, producing a client access violation;
the coordinated delay avoids that race.

An unpatched client cannot answer an injected method. After recovery, install
the overlay and restart the client before opting in again. The server helpers
do not call an injected method until `CustomMenu.setEnabled(player, true)` has
been set; the GM spawn command performs that deliberate opt-in.

## Server usage

Literal menu:

```lua
require("custom_menu")

local choice, menuError = CustomMenu.ask(player, "Choose a keystone", {
    "Blossom",
    "Bud",
    "Bough",
    "Leaf",
    "Trunk",
})
```

Server-paged literal menu:

```lua
local labels = {}
for index = 1, 18 do
    labels[index] = string.format("Test option %02d", index)
end

local choice, menuError = CustomMenu.askPaged(
    player,
    "Eighteen server-paged choices",
    labels
)
```

For more than eight choices, `askPaged` prebuilds pages containing five source
options and then appends navigation rows. A first page has `Next` and `Close`;
a middle page has `Previous`, `Next`, and `Close`; and a final page has
`Previous` and `Close`. This produces no more than eight rows on any page. Each
page title includes `(Page N/M)`, and every page is passed to a standalone
`CustomMenu.ask`, so its Open/Show/Poll/Hide/Close settles before another page
opens.

Content choices map back to their absolute source index. With five content
rows per page, local content choice `c` on page `p` returns
`((p - 1) * 5) + c`. `Previous` and `Next` open the adjacent independent page;
explicit `Close` and client cancellation both return `nil, nil` for the whole
pager. A validation, client-phase, Poll, Close, or impossible navigation result
returns `nil, error` immediately and opens no later page. The helper must own a
new flat session and rejects calls made while a literal session is active.
Navigation is bounded to 32 displayed pages; exceeding that guard returns an
explicit page-view-limit error.

For the eighteen-option test, page 1 places options 1-5 at local rows 1-5,
`Next` at 6, and `Close` at 7. Pages 2 and 3 place their five options at 1-5,
`Previous` at 6, `Next` at 7, and `Close` at 8. Page 4 places options 16-18 at
1-3, `Previous` at 4, and `Close` at 5.

Yes/No:

```lua
local accepted, menuError = CustomMenu.yesNo(
    player,
    "Hand over the materials?",
    "Yes",
    "No"
)
```

DAT-row menu:

```lua
local quest = GetStaticActor("Sum6m0")
local choice, menuError = CustomMenu.askRows(player, quest, 98, 2)
```

Native NPC dialogue panel:

```lua
local quest = GetStaticActor("Sum6m0")
local shown, sayError = CustomMenu.sayRow(player, quest, 93, 0)
```

`CustomMenu.begin` opens one reusable AskWidget and `CustomMenu.finish` closes
it once. Each `CustomMenu.ask` resets and hides that widget around one page. A
standalone `CustomMenu.ask` automatically begins and finishes its own session.
The keystone list/confirmation and every `askPaged` page deliberately use
sequential standalone sessions: the previous Close settles before the next
Open.
Looping category/submenu/Back nesting is not supported by the current live API
v23 contract. The session bit is server state only; API v23 adds no custom
client state. Never start two asks for the same player concurrently.

`CustomMenu.askRows` and `CustomMenu.sayRow` use independent stock widget
lifecycles. They finish any active literal-menu session before calling
`customMenuAskRows` or `customNpcSay`.

```lua
local started, beginError = CustomMenu.begin(player)
if started then
    local ok, runError = pcall(function()
        local keystone = CustomMenu.ask(player, "Choose a keystone", {
            "Blossom", "Bud", "Bough", "Leaf", "Trunk", "Cancel"
        })
        if keystone ~= nil and keystone <= 5 then
            CustomMenu.yesNo(player, "Confirm this keystone?")
        end
    end)
    CustomMenu.finish(player) -- close once before EndEvent
end
```

API v2 used the debug-script-only `debug:_ask` primitive. Retail clients do
not expose that method, so the first literal menu (including Yes/No) failed
before any selection or nesting occurred. The intermediate API v3 reached the
stock `AskWidget`, but that widget prefixes answer values with `@` for DAT-row
lookup. API v4 kept the stock open/select/result/close lifecycle and replaced
each answer's `Content` with the validated raw label before selection. Live
testing showed that a dead entry could remain in event-mode root slot 4 after
the first menu: paging worked, but a later Yes/No or nested menu waited forever
before it was drawn. API v5 safely swept dead slot-4 entries and used a
fail-fast open, but its stock `waitWidgetCreateYield` could still loop forever
when the client's create-command state remained active after a prior close.
API v6 bounded widget creation/deletion, which made a failed transition safe
but could not make a second server-driven open reliable. API v7 introduced
one slot-4 AskWidget for the whole custom-menu session. It verifies ownership
by exact object identity, resets and hides that widget between selections, and
closes it once before `EndEvent`. This mirrors the stock reusable-selector
lifecycle and removes the close/recreate race. An unrelated live root or an
already-active global widget-create command returns cancel without being
modified. API v8 moved the creation retry counter away from `SELF`'s adjacent
receiver register, but a Lua call at `R4` can also use and overwrite every
register above `R4`; the counter at `R14` was therefore still unsafe. API v9
emits ten fixed polls with no live numeric counter across `getWidget`, and
reserves 32 stack registers so all 24 vararg labels fit before `SETLIST`. API
v11 performs the bounded native-readiness phase before fetching the AskWidget,
matching the stock `openWidgetYield` order and avoiding any retained root from
the native creation interval. API v12 also mirrors `selectWidgetYield`'s child
and root show sequence but waits through `selectWidgetTimerYield` for at most
10 seconds. This experimental safety deadline was intended to return a normal
cancel result if a live selector stayed invisible or could not receive input.
Each reuse also clears the paging strip before `AskWidget.ask` enables it when
needed, preventing a paged parent from leaking its controls into a short child.
Live testing showed that the timed selector itself could remain inside the
client call, so its nominal deadline did not release the server event. API v13
therefore split literal selection into prepare, raw show, and non-blocking poll
calls. In the live API v13 run, however, `customMenuAsk` itself never returned:
the server received no event update and never sent `customMenuShow`. Windows
also recorded the client as an AppHang rather than an in-process crash. That
narrows the failure to API v13's combined open/readiness/reset/`AskWidget.ask`/
row-write phase, not its raw-show method.

API v14 decomposed that phase into thirteen total methods. Opening no longer
yielded in the client; the server performed bounded acquisition polling. Reset
was direct Lua work-state assignment, and title, each of 24 rows, and paging
were separate acknowledged calls. It did not invoke `AskWidget.ask`,
`initialWidget`, `resetBaseAskResult`, client `_wait`, stock show/hide animation,
or stock focus. Raw show wrote visibility before enabling input; polling
returned the choice before a separate raw hide. Live API v14 evidence narrowed
the remaining failure further: `customMenuOpen` returned `1`, then
`customMenuAcquire` returned `-1` about 350 ms later, without a client crash.
The open request was therefore accepted, but the later server call could not
adopt the expected widget after the creation command ended.

API v15 kept the thirteen small methods and the low-risk reset, row, paging,
raw-show, poll, and raw-hide phases, but corrected the creation ordering inside
one `customMenuOpen` call. It performed `openWidget`, at most ten 0.1-second
waits for the create command, typed lookup, and exact root/typed identity
adoption before returning. Only that bounded creation handshake waited in the
client. Riskier Ask/init/reset/show/select helpers remained separate or absent,
and `customMenuAcquire` became ownership validation only. In the live API v15
run, `customMenuOpen` returned `1` but the following `customMenuAcquire`
returned `-1`. Because Open could return success only after adopting the exact
typed root into actor `self.work`, the separate call did not observe that
actor-side session field.

Recovered client structure suggests, but does not conclusively prove, that
actor work should persist here: `RunEventFunction` resolves the owner actor and
dispatches the method with that actor as `self`, while NPC work is initialized
when the actor is initialized. The receiver path does not prove Lua `self.work`
table identity across separate `0x0130` calls. Widget persistence has stronger
direct evidence: `desktopWidget.work.rootWidget[4]` retains the exact live
widget object, and stock widget callbacks repeatedly read and update that
object's `work` until widget finalization.

API v16 therefore removes all custom session state from the client actor. Open
marks the acquired object with `widget.work.customMenuOwned` and initializes
`widget.work.customMenuRowCursor`. Acquire and every later literal-menu phase
independently fetch the generic and typed slot-4 objects, require exact identity
and the ownership marker, and only then read or mutate the widget. Close clears
the marker before closing that exact root. This retains API v15's bounded
creation ordering while removing cross-`RunEventFunction` actor-state
dependence.

In the latest live API v16 trace, `customMenuOpen` returned `1` and the next
`customMenuAcquire` returned `-3`. In that API, Acquire `-3` meant the exact
AskWidget still existed but its `widget.work.customMenuOwned` marker was no
longer true. This proved that arbitrary custom widget fields, like custom actor
fields in v15, do not reliably persist across separate EventFunction calls. It
also explained why splitting one selection into many client calls remained
unsafe for nested, Yes/No, and repeated Talk flows.

API v17 replaces the ten literal-menu phase methods with one
`customMenuSelect` call. The method keeps the exact widget in local state, uses
`askPaging=false` for native internal pages, waits on `askWork.askResult` with
bounded `_wait(0.1)` yields, performs raw hide and exact close, and then waits
for typed root, generic root, and create-command state to clear. It returns no
choice or cancel result before that deletion-settle check succeeds. Because all
state is local to one invocation, neither actor nor widget receives persistent
custom fields that could leak into the next Talk.

The first live API v17 Nested test returned client code `-100` before widget
creation. The Map Server trace showed the correct packet arguments in order:
the title, count `4`, and exactly four string labels. The installed client also
reported API version 17, ruling out stale server serialization or an overlay
mismatch. API v17's generated bytecode had replaced the stock `{...}` capture
with a fixed 24-register `VARARG B=25` plus `SETLIST B=24`, followed by an
extra-label guard. That unproven capture was the only new argument-path behavior
and could expose unused registers as extra or invalid labels in the retail
client VM.

API v18 retains API v17's single-call widget lifecycle but restores the stock
Lua 5.1 `{...}` capture (`VARARG B=0`, `SETLIST B=0`) and removes the redundant
client-side extra-label guard. Server validation remains authoritative: it
sends exactly `answerCount` labels and rejects more than 24 choices or an
oversized packet before invoking the client.

The live API v18 Nested test still returned `-100`. Its Map Server trace again
showed the correct title, count `4`, and four labels, while the client reported
version 18 and was running the restored stock vararg sequence. This ruled out
both serialization and vararg materialization. It proves that at least one
redundant client argument guard rejects these runtime EventFunction values,
despite the server having already validated them for their normal widget
operations.

API v19 therefore materializes `labels = {...}` and proceeds directly to the
hard widget-lifecycle checks. It removes the redundant client title, count,
range, integrality, and label-type checks, along with result `-100`. The Map
Server remains the authority for all of those input rules before it serializes
the call. Client results `-101` through `-110` remain reserved for slot
ownership, creation, identity, cleanup, and result-integrity failures.

The live API v19 trace reported client version 19 and showed the server sending
`customMenuSelect("Custom content test hub", 4, "Keystones", "Quest
information", "Utilities", "Close")` at 18:49:24.576. No EventUpdate, result,
or cleanup followed. Transport stayed healthy while traffic fell to zero, and
the first Nested menu never visibly drew. Windows recorded AppHangB1/Event 1002
at 18:49:50.377, 25.801 seconds after the call, with no exception, fault module,
or dump. This localizes the failure inside the long client selection call; it
does not implicate the packet arguments or server transport.

API v20 removes that long call. It returns to short, acknowledged phases but
does not repeat API v15/v16's persistent actor/widget fields. Every phase
reacquires the same live typed AskWidget and proves that it is also the generic
slot-4 root. The server owns the session, reuses one hidden widget across
nested pages, polls without a client-side yield, and closes the widget once.
This keeps creation and deletion bounded while moving the selection deadline
out of the client coroutine that produced the API v19 AppHang.

Live API v20 did not crash or produce another AppHang. Open, setup, and Show
returned successfully, and Poll returned pending `0` repeatedly at roughly
0.3-second intervals, but the first Nested interaction softlocked. API v20's
raw visibility path had skipped BeforeLuaShow, `processAfterShow`, templated
focus assignment, and AfterLuaShow. The widget object remained available to
Poll, but it had never entered the complete stock interaction lifecycle.

API v21 keeps API v20's short phases and exact root reacquisition, but Reset
restores `inputControlFlag=true`. Show and Hide now use stock root-only
`show(false, false, false)` and `hide(false, false, false)`, restoring lifecycle
callbacks and focus without traversing child widgets. Server polling moves to
0.25-second intervals. A rejected stock Show or Hide returns diagnostic `-107`.

Live API v21 was tested after rebuilding and installing the API v21 overlay
and fully restarting the client. Open, setup, and stock root-only Show returned
successfully. The client and EventFunction transport remained responsive, but
`customMenuPoll` stayed pending at `0` approximately every 0.31 seconds. The
first Nested interaction therefore softlocked while the repeated immediate
Poll calls flooded the server log. Because Poll returned `0` rather than
`-105` or `-106`, the same live typed/generic AskWidget remained reacquirable;
because Show returned success, the stock lifecycle call was not rejected. The
failure was narrowed to post-Show input/result progression: immediate
EventFunction calls provided no stock-like client scheduler window in which UI
command events could update `askResult`.

API v22 retains API v21's exact reacquisition and stock root Show/Hide, but
turns Poll into a bounded scheduler probe. It samples `askResult` once before
waiting and once after each of exactly five 0.1-second desktop yields, for six
samples and at most 0.5 seconds per call. After every yield it reacquires the
typed AskWidget, requires it still to be the generic slot-4 root, and only then
reads the next sample. A choice or cancellation returns immediately; a fully
pending window returns `0`. The server bounds this with
`CustomMenu.MAX_POLL_ATTEMPTS=120` and
`CustomMenu.POLL_INTERVAL_SECONDS=0.25`, reducing log churn while avoiding API
v19's long client selection call.

Live API v22 testing still produced a repeatable softlock when the looping
`Menu: Nested` interaction was started again. That test combined parent pages,
submenus, Back transitions, confirmations, and repeated page reuse, so it could
not identify which transition retained bad state. Nested is therefore excluded
from subsequent supported summon rosters.

API v23 leaves API v22's Hide and bounded six-sample Poll unchanged. Show now
requires zero-argument `widget:show()`, selecting the stock animated root branch
without child recursion. It then requires
`desktopWidget:changeFocusedWidget(widget, false, false)` and
`widget:processAfterShow(false)` in that exact order. Any false result from
Show, focus assignment, or after-show processing returns `-107`. The six
ordered flat probes are the API v23 live roster, with server-driven flat pages
for the fifth probe and only the final keystone test performing one linear
list-to-confirmation transition.

In the first API v23 roster run, the other five probes worked, but the former
18-row native-paging probe was canceled while the server was still sending
`customMenuSetRow(17, ...)`. The trace contained no SetRow 18, SetPaging, or
Show call. The menu therefore never reached native paging or even became
visible; the apparent stall was hidden setup latency from the sequence of
per-row EventFunction calls, not evidence that the native page controls had
failed. Native paging is nevertheless retired from the supported test roster.
`Literal: Server Paging` now uses `CustomMenu.askPaged`, five content rows plus
server navigation, and a fully closed independent session for every page.

Event recovery is also coordinated for API v23 testing. The observed immediate
path canceled the waiter and reached event teardown about 3.5 milliseconds
later while a bounded client function could still be running, correlating with
a client access violation. `!endevent` now cancels the waiter, waits 1.25
seconds, clears `customMenu.sessionActive`, and then sends `EndEvent` so client
execution can retire before server ownership is torn down.

`NpcSayWidget` queues its message and returns before the bubble is dismissed.
Keep `CustomMenu.sayRow` terminal in a server-driven interaction unless a
future client bridge explicitly waits for or dismisses that bubble. Opening a
custom AskWidget immediately after `sayRow` can leave the menu behind the
dialogue panel with no usable focus.
The server also recognizes the client's chunked `0x012D` Lua-error envelope;
it logs the complete error, cancels the orphaned wait, and closes the original
event once instead of routing each chunk as a new missing-owner event.

## Limits and authority rules

- Literal strings are serialized by the server as ASCII. Use client DAT text
  rows for accented or non-English content.
- The server helper permits 1-24 choices and caps the encoded literal payload
  at 560 bytes as a conservative aggregate content policy. API v23 sends the
  count, title, and real rows in separate short `0x0130` calls. Each signed
  32-bit count/index costs five bytes (one type byte plus four value bytes), and
  each string costs its type byte, ASCII bytes, and NUL terminator; every packet
  also ends with a parameter terminator.
- `CustomMenu.askPaged` retains the same aggregate 1-24 choice and 560-byte
  policy. Lists above eight choices are prevalidated as final server pages
  before the first client call, use five content rows per page, and permit at
  most 32 displayed page views in one interaction.
- DAT-row/dialogue substitution values are also bounded to 24 arguments and
  the same 560-byte packet budget. Invalid inputs are rejected before the
  client capability probe or any UI call.
- A whole-file LPB override does not merge with another overlay targeting the
  same `PopulaceStandard` LPB. Combine such patches in one builder if needed.
- The API result is untrusted client input. Before granting/removing a
  keystone, currency, reward, or quest state, re-check the active server
  context, selected option, prerequisites, quantities, and inventory capacity.
- The test NPCs intentionally perform no gameplay mutations.

## Verification

Run the focused injector tests:

```powershell
python -m unittest tools.actions.tests.test_build_custom_menu_populacestandard_overlay
dotnet run --project tools/custom-menu-tests/CustomMenuTests.csproj
```

The tests verify stock-bytecode round-tripping, all twelve injected methods,
exact typed/generic reacquisition in every phase, no custom persistence fields,
bounded creation/deletion, stock root-only show/hide lifecycle, Reset restoring
input control and clearing all 24 rows, explicit indexed row writes, stock
internal paging bytecode, bounded Poll/cancel/error handling, LPB decoding,
client-Lua error-envelope parsing, server-side
bounds/ASCII checks, GM spawning/cleanup, and the Talk-only event route. They
also execute the isolated native story and DAT-choice paths, literal Yes/No and
four-choice menus, eighteen-choice server paging with forward/back/Close and
absolute-index mapping, and the linear keystone list-to-confirmation flow.
