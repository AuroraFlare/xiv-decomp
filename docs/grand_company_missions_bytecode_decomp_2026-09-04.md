# Grand Company missions: bytecode and cutscene follow-up

Scope: the 18 requested `Com0[lgu]1–4` and `Com5[lgu]0–1` missions.

This pass disassembles the recovered Lua 5.1 chunks, evaluates their branch
instructions with recording stubs, and decodes the nine relevant retail
cutscene setup blocks. It adds evidence below the earlier scenario-source
audit, including a server argument omission that literal-call checks missed.
It does **not** establish that these quests are playable. All offers remain
disabled, and the two unresolved ambush/protection encounters remain unresolved.

## Results and reproduction

- 18 quests; 128 `processEvent*` methods and 1,542 distinct recorded call/return traces.
- All 148 outgoing `EQ` edges were exercised using the finite extra-argument
  domain `nil, 0, 1, false, true`, with independent `0/1` choice and salute returns.
- Nine scene files; 45 dictionary actors and 300 setup records, including
  51 records of the spatial `0x40` form. File hashes, actor offsets, and raw
  setup bytes are retained.
- Six exact SQB director chunks and the `EmpireConjurerQuestCom0x4` chunk
  contain no child prototypes or locally defined methods.
- Corrected all three Imperial Devices briefings to pass the configured
  60-minute duration instead of zero into the client's time-limit text.

Run from the repository root:

```powershell
python -B tools/build_gc_mission_decomp.py
python -B tools/test_gc_mission_decomp.py
python -B tools/validate_grand_company_quests.py
python -B tools/validate_quest_availability.py
```

The builder accepts `--client-root` and `--output`. Scenario bytecode comes
from `tools/outputs/lpb/decomp_more_20260617/luac`; scene bytes come from the
installed client's `client/cut/<scene>/<scene>`. It reads both without changing
them. Client APIs are recording stubs, not executed implementations. Complete
edge coverage in this small input domain does not verify server callbacks,
rendering, network order, API internals, or arbitrary input values.

[Evidence pack](../outputs/gc-mission-decomp-20260904/README.md) ·
[Builder](../tools/build_gc_mission_decomp.py) ·
[Regression checks](../tools/test_gc_mission_decomp.py)

## New event contracts

### Familiar entry: Lua boolean identity matters

| Quest | Method | Scene |
|---|---|---|
| 111401 / Com0l1 | `processEvent_020` | `COM0L105`, mode 2 |
| 111601 / Com0g1 | `processEventUrianger` | `COM0G105`, mode 2 |
| 111801 / Com0u1 | `processEvent_020` | `COM0U105`, mode 2 |

These methods select the ordinary fade only when their extra argument equals
the **boolean** `true`. Numeric `1` is not equivalent. `nil`, `0`, `1`, and
`false` select `startFadeInCutSceneAfterWarp`. The current explicit `false`
pre-fight calls select that after-warp path correctly.

### Familiar aftermath: an omitted payload, not a recovered default

All three post-fight events accept an extra argument and forward it unchanged:

```lua
-- Structural reconstruction; quest/player/owner are the implicit inputs.
startFadeOutCutSceneDefault(player)
startNQCutScene(scene, 1, 0, payload)
startFadeInCutSceneAfterWarp(player)
```

| Quest | Event | Exact scene key |
|---|---|---|
| 111401 | `processEvent_030` | `COM0l110` |
| 111601 | `processEventUriangerMore` | `COM0G110` |
| 111801 | `processEvent_030` | `COM0U110` |

`gc_sqb_runtime.lua` currently dispatches `state.config.successEvent` without
that extra argument, so the client receives `nil`. No branch in these methods
supplies a fallback. This proves missing payload forwarding; it does **not**
prove what value retail supplied or whether nil breaks a particular scene.
Do not replace it with zero or a guessed actor ID. Recover the producer and
scene consumer before implementing this parameter.

The previous audit's 47 literal dispatch checks did not cover this indirect
`state.config.successEvent` call. Consequently, its “arity verified” finding
does not close this gap. The existing event-open/return-warp order remains
distinct from proving the scene payload.

### The three level-22 finales have different predicates

| Quest | Event | Scene branch | Other branch |
|---|---|---|---|
| 111404 / Engineering Victory | `processEvent_020(a)` | `a ~= 1`: `com0l410`, mode 1, default fades | Numeric `a == 1`: dialogue rows 52–55, no scene |
| 111604 / The Mail Must Get Through | `processEventClear(a,b)` | Numeric `a == 0 and b == 0`: `com0g410`, mode 1, default fades | Any other tuple: dialogue rows 53–56, no scene |
| 111804 / Arms Race | `processEvent_050(a)` | `a ~= 1`: `com0u410`, mode 1, default fades | Numeric `a == 1`: dialogue rows 50, 51, 62, 52, no scene |

The server's current `0`, `(0,0)`, and `0` calls always select the scenes.
Boolean `false` is **not** interchangeable with numeric zero for Gridania:
`(false,false)` selects dialogue. The text's alternate allegiances suggest a
cross-company narrative condition, but the retail producer of these flags is
not contained in these methods. Their source must still be recovered.

### Dungeon entry asks once

| Quest | Entry ask method | Quest-local text row |
|---|---|---:|
| 111410 | `processEvent_010_01` | 43 |
| 111610 | `processEvent_010_1` | 28 |
| 111810 | `processEvent_010_01` | 35 |
| 111411 | `processEvent_030_1` | 39 |
| 111611 | `processEvent_020_1` | 38 |
| 111811 | `processEvent_020_1` | 37 |

Each method calls `ask` exactly once and returns its saved result. On numeric
choice `1`, it returns without `finishCliantTalkTurn`; the successful entry
handoff must finish the event lifecycle. On the sampled decline choice `0`,
it plays the decline response and calls `finishCliantTalkTurn` before returning.
The readable decompiler repeats the `ask` expression in `return`; copying
that text literally would introduce another prompt absent from the bytecode.

For example, `Com5l1.processEvent_030_1` has its sole ask CALL at PC 13
(`0xD9F`), compares the saved R3 at PC 14, and returns R3 at PC 24 (`0xDCB`).
All quest-accept methods using `showQuestInfomation` likewise call that widget
once and return the saved result, even when the decompiler prints it twice.

### Imperial Devices duration: verified correction

The bytecode and raw English text jointly identify the duration slot:

| Quest | `processEvent_010` extra arguments | Destination text |
|---|---|---|
| 111410 | `(dialogueFlag, minutes)` | `com5l0` row 37 |
| 111610 | `(minutes)` | `com5g0` row 22 |
| 111810 | `(minutes)` | `com5u0` row 29 |

Each row describes the maximum minutes per visit. The server previously
passed `(0,0)`, `(0)`, and `(0)`. The shared helper now passes
`TOTORAK_ENTRY_DURATION_MINUTES` in the correct slot and retains Limsa's
existing dialogue flag. That setting is currently 60. This corrects the
briefing text; it changes neither the timer nor the entry requirements.

Other intermediary/accept parameters still include zero placeholders. Some
flow into party-size/level text and some choose narrative variants. Their
meaning must be mapped individually; matching arity alone is insufficient.

### Seal tutorials own an open widget across two calls

For `111402`, `111602`, and `111802`, the accepted start call opens the public
effect and Grand Company status widget and sets its points display to zero.
The closing method sets that display to the literal 250 and closes it.
Declining the start does not open the widget. These points are client display
operations, not the authoritative company-seal transaction.

The server calls the closing method only after a successful seal grant. Its
seal-cap failure path therefore lacks that explicit widget close. Whether
`EndEvent` implicitly closes this widget needs a live-client check; do not
play the 250-point closer on a failed transaction merely to close the window.
The three shop-introduction quests `111403`, `111603`, and `111803` have one
`processEvent*` method each and no NQ-scene calls.

## Retail scene setup evidence

| Scene | Dictionary actors | Setup records |
|---|---:|---:|
| com0l105 | 3 | 25 |
| com0l110 | 6 | 35 |
| com0l410 | 8 | 44 |
| com0g105 | 3 | 29 |
| com0g110 | 2 | 22 |
| com0g410 | 8 | 44 |
| com0u105 | 3 | 26 |
| com0u110 | 4 | 31 |
| com0u410 | 8 | 44 |

The familiar introduction assets use `6500033` (Limsa's `Mons`), `6500029`
(Gridania's `MON`), and `6500035` (Ul'dah's `Anole`). All three actor-class SQL
rows have empty class paths and property flags zero. They are scene dictionary
identities, not replacements for the combat targets `2200708`, `2202206`, and
`2200205`. Limsa/Ul'dah's scene and combat IDs share their respective display-name
IDs; Gridania's scene ID points to `3102217`, distinct from combat `3202206`.

Selected decoded scene-local placements (radians for rotation):

| Scene / actor | Class | Position | Rotation |
|---|---:|---|---:|
| com0l105 / PC | 0 | `(1518.3621, 55.5981, -1299.5845)` | -1.760842 |
| com0l105 / Urianger | 1060009 | `(1486.1979, 55.6182, -1307.4973)` | 1.353507 |
| com0l105 / Mons | 6500033 | `(1504.7986, 55.2694, -1302.5044)` | 1.260310 |
| com0g105 / PC | 0 | `(1193.9956, -0.0541, 1092.7208)` | 1.415041 |
| com0u105 / Anole | 6500035 | `(-1726.4153, 56.8311, 101.5638)` | 0 |

No map-to-world transform or persistent combat spawn is inferred here. The
Gridania monster and Papalimo dictionary entries have no `0x40` placement in
the decoded setup block; that absence is not proof the actor is invisible or
never positioned later. Limsa's aftermath has five differently labelled
Y'shtola entries using class `1000001`; Ul'dah's has Thancred `1000185` and two
coblyn entries using `2202106`. These are scene cast entries, not a recovered
five-NPC encounter or an extra two-mob kill objective.

All three `410` scenes include Cid `1001572` and Ebrelnaux `1060011`, alongside
the relevant officer and company cast. Thus Ebrelnaux's presence in the
Gridania/Ul'dah finale is directly recoverable even though he is not those
quests' public delivery NPC. The finale scenes provide no ambush wave list.

## Remaining battle boundary

The six `QuestDirectorCom0[lgu][14]01` chunks contain only the class/parent
registration. This is verified from their root instructions and absence of
child prototypes, not merely inferred from the two-line decompiled files.
Likewise, `EmpireConjurerQuestCom0x4` establishes an inherited class name but
does not supply a wave, target count, or escort route.

For Engineering Victory, the existing Elemen ledger supplies the three-wave
encounter names, but these chunks do not bind them to authoritative actor
classes, placements, triggers, or success/retry ownership. For The Mail Must
Get Through, the local dialogue describes defending meditating conjurers;
it does not itself establish a moving escort or waypoint route. Preserve the
protection/escort distinction as unresolved until the encounter data proves it.

The following are still necessary: encounter start trigger/region, actual
actor identities and wave counts, protected actors and failure predicates,
proof-item ownership, success callback, party rules, and cleanup/re-entry.
The current familiar adapter's player-relative spawn and 600-second timeout
also remain server choices; these scene coordinates do not validate them.

## Coverage of the requested list

“Methods” counts bytecode-defined `processEvent*` methods, including reminders.

| ID | Code / quest | Methods | Result from this pass / remaining gate |
|---:|---|---:|---|
| 111401 | Com0l1 / The Price of Integrity | 9 | Boolean fade, post-fight payload and two scene setups recovered; payload producer/live SQB remain |
| 111402 | Com0l2 / Testing the Waters | 2 | Single-choice and two-call widget lifecycle verified; seal-cap UI cleanup remains |
| 111403 | Com0l3 / Seals for the Whorl | 1 | Single interaction, saved choice, no NQ scene; live interaction remains |
| 111404 | Com0l4 / Engineering Victory | 10 | Finale predicate/cast and empty director confirmed; three-wave encounter remains |
| 111410 | Com5l0 / Imperial Devices | 13 | Saved entry choice and duration slot verified/corrected; item/variant/content flow still needs verification |
| 111411 | Com5l1 / Into the Dark | 10 | Single entry prompt and decline-close behavior verified; dungeon objective/return remains live-gated |
| 111601 | Com0g1 / Breaking the Seals | 9 | Boolean fade, post-fight payload and two scene setups recovered; payload producer/live SQB remain |
| 111602 | Com0g2 / Why Did It Have to Be Snakes | 2 | Single-choice and two-call widget lifecycle verified; seal-cap UI cleanup remains |
| 111603 | Com0g3 / Adder's Nest Egg | 1 | Single interaction, saved choice, no NQ scene; live interaction remains |
| 111604 | Com0g4 / The Mail Must Get Through | 7 | Two-flag finale and cast recovered; conjurer protection/escort mechanics remain |
| 111610 | Com5g0 / Imperial Devices | 8 | Saved entry choice and duration slot verified/corrected; item/content flow still needs verification |
| 111611 | Com5g1 / Into the Dark | 13 | Single entry prompt and decline-close behavior verified; dungeon objective/return remains live-gated |
| 111801 | Com0u1 / Career Opportunities | 9 | Boolean fade, post-fight payload and two scene setups recovered; payload producer/live SQB remain |
| 111802 | Com0u2 / Kindling a Flame | 2 | Single-choice and two-call widget lifecycle verified; seal-cap UI cleanup remains |
| 111803 | Com0u3 / Burning a Hole in One's Pocket | 1 | Single interaction, saved choice, no NQ scene; live interaction remains |
| 111804 | Com0u4 / Arms Race | 11 | Finale predicate/cast recovered; contract reminder methods inventoried; private Hellhound still needs live proof |
| 111810 | Com5u0 / Imperial Devices | 12 | Saved entry choice and duration slot verified/corrected; intermediary argument semantics remain partly unresolved |
| 111811 | Com5u1 / Into the Dark | 8 | Single entry prompt and decline-close behavior verified; dungeon objective/return remains live-gated |

The bytecode/scene work is reproducible independently of the Lua decompiler's
pretty-printed control flow. No availability, spawn table, reward quantity,
or unresolved battle implementation was changed by this pass.

## Validation performed

The builder completed with the counts above. Eight regression tests passed,
covering Lua boolean equality, the three familiar fade/payload paths, finale
predicates, all six single-entry prompts, saved quest-accept choices, all three
duration-to-text bindings, and empty director closures. The Grand Company
validator passed for all 102 rows and 69 named routes; the availability
validator passed for all 524 rows. `git diff --check` passed. No live-client
playthrough was performed.
