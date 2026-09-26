# Requested Grand Company quests: bytecode, scene boundaries, and remaining encounter data

Date: 2026-09-07. Scope: exactly the 45 Grand Company IDs in the supplied goal, including every requested `Com0[lgu]1–7`, `Com5[lgu]0–1`, and `Gc[lgu]{101,102,301,302,304,701}`. The earlier [18-mission bytecode pass](grand_company_missions_bytecode_decomp_2026-09-04.md) is a starting point; this report adds the remaining 27 quests, rechecks the shared boundaries, and corrects several conclusions that method-name inventories alone cannot establish.

The complete extraction contains **442 locally defined non-`initText` methods and 860 symbolic call-path templates for these 45 quests**. This includes reminder/helper names such as `followEvent005` and the misspelled `menberCountUnderRange`; it is deliberately wider than a `processEvent*` filter. `Gcg101` and `Gcu101` each have zero locally defined event methods. Their omission is an observed source fact, not an extraction failure. All **23 directly referenced GC scene resources** now parse structurally: 381 complete actor slots (252 class-bound `ProxyActor` slots), 397 timeline blocks, 7,791 typed clips, and 1,700 `SetPosClip` records across those blocks.

The principal new findings are:

- Formal enlistment uses **one two-result confirmation-widget call**, then a real repeating FAQ menu. The pretty-printed Lua duplicates the widget call and mangles the loop. Rank 11 is a client presentation constant; the server transaction is separate.
- The three level-40 `G*102` encounters require **different interaction-menu devices**. The Gridania source describes defending an already fallen party while it recovers. It does not establish two moving vehicles or a player-controlled escort route.
- The six campaign `Com0*5/6` quests differ in scene ownership, fade ownership, argument types, and dialogue continuation. Their campaign-history arguments cannot be replaced uniformly by zero or the company number.
- All three `G*701` directors contain substantial UI code. The exact 1,000-point target, signed failure code, warning-time expression, and company-specific effects are recoverable; enemy placement and merit-per-kill amounts are not encoded there.
- Existing generic inventory hooks confuse a Gridanian offer with the Limsa `Gcl101` offer, and classify the middle Echo scene of `Gcu102` as completion. The generic route is currently inert, so these are implementation corrections to carry forward, not a reason to enable it.

## Evidence and how to read it

- [Full evidence pack](../outputs/job-gc-decomp-20260907/README.md), [method inventory](../outputs/job-gc-decomp-20260907/method-inventory.csv), [scene callers](../outputs/job-gc-decomp-20260907/scene-callers.csv), and [scene placements](../outputs/job-gc-decomp-20260907/scene-placements.csv).
- `outputs/job-gc-decomp-20260907/quests/<code>.json` contains typed conditions, arguments, call PCs, byte offsets, and return values. `reconstructed/<code>.md` renders those paths. `bytecode/<code>.txt` includes root registration and `initText`.
- [Independent focused raw-bytecode review](../outputs/job-gc-decomp-20260907/reviews/gc/focused-bytecode.txt): 83 specifically reviewed methods, including enrollment, campaign-history branches, Echo prompts, field-objective widgets, and promotion presentation.
- [Campaign traces](../outputs/job-gc-decomp-20260907/reviews/gc/campaign-branch-traces.json): 39 independently recorded traces over numeric enum values and Lua boolean/nil controls. [Source hashes](../outputs/job-gc-decomp-20260907/reviews/gc/focused-source-hashes.json) retain the exact input chunks.
- [Director registrations](../outputs/job-gc-decomp-20260907/reviews/gc/director-registrations.json) and [director-method bytecode](../outputs/job-gc-decomp-20260907/reviews/gc/director-method-bytecode.txt) cover 29 matching director chunks, keeping their actual paths and superclasses distinct.
- [Raw journal mechanics](../outputs/job-gc-decomp-20260907/reviews/gc/special-interaction-journals.json) retain English and Japanese text and source hashes for the newly clarified small encounters and level-40 device battles.

PCs below are **zero-based within the named Lua prototype**; hexadecimal offsets address the original `.luac` file. `a`, `b`, etc. mean arguments after the implicit `(quest, player, eventOwner)` inputs. The universal tracer names these `arg4`, `arg5`, etc. Lua boolean `true` is different from numeric `1`, and `false` is different from `0`.

Only bytecode control flow is interpreted. Client APIs are inert recording boundaries. A path template describes the condition and calls, not an executable server quest. Loops retain their back edges; the number of templates is not the number of possible menu histories. Source text supplies the meaning of dialogue and objectives, but does not manufacture the missing producer of an argument.

## Coverage: every requested quest

“Methods” counts all local non-`initText` closures, including follow/reminder helpers. Each code links to its complete readable reconstruction. A battle's absence from a scenario method does not make an instance objective dialogue-only.

### Maelstrom

| ID / code | Methods | Recovered route boundary and implementation consequence |
|---|---:|---|
| 111401 / [Com0l1](../outputs/job-gc-decomp-20260907/reconstructed/com0l1.md) | 9 | Urianger's `processEvent_020(a)` selects the entry fade by boolean identity; `processEvent_030(a)` forwards an unproved payload into `COM0l110`. The private familiar adapter still lacks that payload's producer. |
| 111402 / [Com0l2](../outputs/job-gc-decomp-20260907/reconstructed/com0l2.md) | 2 | Accepted start opens the Storm status widget; end displays 250 points and closes it. This is the seal tutorial's display lifecycle, not the seal transaction. |
| 111403 / [Com0l3](../outputs/job-gc-decomp-20260907/reconstructed/com0l3.md) | 1 | `processEventFHILAHCTStart` is the sole Grizzly Gnat interaction; one saved quest choice, no NQ scene or warp request. |
| 111404 / [Com0l4](../outputs/job-gc-decomp-20260907/reconstructed/com0l4.md) | 10 | `processEvent_020(a)` plays `com0l410` unless numeric `a == 1`; exact finale is not the missing Garlean-wave encounter. The transceiver and Ebrelnaux handoff remain separate mechanics. |
| 111405 / [Com0l5](../outputs/job-gc-decomp-20260907/reconstructed/com0l5.md) | 16 | Pirate battle, Merlwyb/Urianger talks, and ceremony are distinct. Elevator event 1 sequences `elv0l110` then `com0l610`; event 2 only replays the elevator. An additional method literally reuses `COM0l110`; its producer/reachability must be recovered. |
| 111406 / [Com0l6](../outputs/job-gc-decomp-20260907/reconstructed/com0l6.md) | 19 | `processEvent_010(a)` forwards `a` into `com0l510` but ends with the default fade. Cid's `processEvent_015(a)` distinguishes numeric history values 1–4. Elevator warps have separate after-warp methods. |
| 111407 / [Com0l7](../outputs/job-gc-decomp-20260907/reconstructed/com0l7.md) | 2 | Guincam-spelled start performs the two-result confirmation and FAQ loop, displays company 1/rank 11, and returns numeric acceptance. End's two extra slots are unused; it resets displayed points to 0 and closes. |
| 111410 / [Com5l0](../outputs/job-gc-decomp-20260907/reconstructed/com5l0.md) | 14 | Toto-Rak briefing duration is the second extra argument to `_010`; entry `_010_01` asks once and leaves talk open on acceptance. `menberCountUnderRange(a,b,c)` is an additional recovery surface. |
| 111411 / [Com5l1](../outputs/job-gc-decomp-20260907/reconstructed/com5l1.md) | 10 | Dyrstweitz `_030_1` owns the single entry question, not the duty's scenes. The Captain's Quarters item and post-return dialogues remain distinct from Batraal's dungeon-clear scene. |
| 111416 / [Gcl101](../outputs/job-gc-decomp-20260907/reconstructed/gcl101.md) | 26 | This chunk contains **all three city offer/report variants**, six-crystal briefings, and level/history-sensitive aftermath. Methods named `_060_NQ1/2` do not play NQ scenes. Ifrit's actual content owner is absent from this scenario. |
| 111417 / [Gcl301](../outputs/job-gc-decomp-20260907/reconstructed/gcl301.md) | 3 | Clifton requests six dart slugs and supplies interaction-menu anti-venom; the return is `_010`. No local cinematic or spawn/wave implementation. |
| 111418 / [Gcl302](../outputs/job-gc-decomp-20260907/reconstructed/gcl302.md) | 7 | Hasthwab sends the player to the Bloody Executioners and kobolds; completion returns to the Astalicia. Named ally talks do not specify the kobold spawn graph. No NQ scene. |
| 111420 / [Gcl304](../outputs/job-gc-decomp-20260907/reconstructed/gcl304.md) | 8 | Lilina → Kurtz Nolan → three injections/interactions → field report. Rank-sensitive dialogue tests `isUpperRank(1,27) == true`; progress explicitly receives `(completed,total)`. No NQ scene/return warp. |
| 111427 / [Gcl102](../outputs/job-gc-decomp-20260907/reconstructed/gcl102.md) | 21 | R'ashaht Rhiki's crash-site operation requires Imperial Disruptor **11000423** to block reinforcements. `gc01l210` ends with **after-warp** fade. Final report returns to Rhiki, not a generic company officer. |
| 111428 / [Gcl701](../outputs/job-gc-decomp-20260907/reconstructed/gcl701.md) | 12 | Alain merit trial → Guincum → player salute. Completion displays the supplied old rank then rank 21. UI director profile `gcl70101` uses init/success effects 14/17. No NQ scene. |

### Order of the Twin Adder

| ID / code | Methods | Recovered route boundary and implementation consequence |
|---|---:|---|
| 111601 / [Com0g1](../outputs/job-gc-decomp-20260907/reconstructed/com0g1.md) | 9 | `processEventUrianger(a)` has the boolean entry-fade choice; `processEventUriangerMore(a)` forwards the aftermath payload. Papalymo's scene cast entry has no placement in the decoded setup block. |
| 111602 / [Com0g2](../outputs/job-gc-decomp-20260907/reconstructed/com0g2.md) | 2 | Fulke tutorial owns a status widget over start/end; accepted end displays 250 Serpent points. No NQ scene. |
| 111603 / [Com0g3](../outputs/job-gc-decomp-20260907/reconstructed/com0g3.md) | 1 | One Haurtelle shop introduction. No Clay Golem objective; that encounter belongs to `111605`. |
| 111604 / [Com0g4](../outputs/job-gc-decomp-20260907/reconstructed/com0g4.md) | 7 | Defend meditating conjurers → encrypted-letter delivery to Radulf → Fulke. Finale requires **numeric `(0,0)`** for `com0g410`; `(false,false)` selects dialogue. Movement/escort is unproved. |
| 111605 / [Com0g5](../outputs/job-gc-decomp-20260907/reconstructed/com0g5.md) | 14 | Ceremony `com0g610` is `_005`, with after-warp fade. `processEvent010/011/012` form a deliberately split talk lifecycle before the Earthbreaker/Clay Golem boundary. Papalymo and Urianger have different numeric-history branches. |
| 111606 / [Com0g6](../outputs/job-gc-decomp-20260907/reconstructed/com0g6.md) | 19 | Lewin/Pesi accept the special two-argument tuple `(1,2)`; Nine Ivies aftermath `COM0G510` ends with default fade. Cid's clear dialogue uses history enum 1–4 and resumes its talk turn. |
| 111607 / [Com0g7](../outputs/job-gc-decomp-20260907/reconstructed/com0g7.md) | 2 | One official-join widget yielding two values, recurring FAQ, company 2/rank 11 display. The player's actual enlistment is `TryJoinGrandCompany(2,111607)`, not the widget. |
| 111610 / [Com5g0](../outputs/job-gc-decomp-20260907/reconstructed/com5g0.md) | 14 | Toto-Rak duration is `_010(a)`; five `followEvent_*` methods and `menberCountUnderRange` were omitted by the older `processEvent*` filter. Follow `_000(a,b)` includes party-size text. |
| 111611 / [Com5g1](../outputs/job-gc-decomp-20260907/reconstructed/com5g1.md) | 13 | Dyrstweitz `_020_1` asks once and leaves successful entry open; the quest's Draconian Rosary objective advances separately from Batraal. No quest-local NQ scene. |
| 111616 / [Gcg101](../outputs/job-gc-decomp-20260907/reconstructed/gcg101.md) | 0 | Root registers `Gcg101 : ScenarioBaseClass`; sole `initText` is empty. The full Twin Adder narrative lives among `Gcl101`'s variants, but the client dispatch/class binding is **not established by this chunk**. |
| 111617 / [Gcg301](../outputs/job-gc-decomp-20260907/reconstructed/gcg301.md) | 3 | Dyrstbrod requests three scraps **11000401**, with interaction-menu sleeping agent **11000402** for dreadwolves. Ordinary fades bracket talks; neither those fades nor sparse methods are a recovered collection/stealth director. |
| 111618 / [Gcg302](../outputs/job-gc-decomp-20260907/reconstructed/gcg302.md) | 5 | Dhemdaeg → Rootslake beast attack → Sister Challinie → deliver Hilith's drawing. Start and Challinie each take numeric introduction flags; `processEventClear` returns the drawing with local fades, no NQ/warp. |
| 111620 / [Gcg304](../outputs/job-gc-decomp-20260907/reconstructed/gcg304.md) | 7 | Alaire → Liflin → three evidence objects. Briefing forwards company to text and checks `isUpperRank(2,27)`; progress is a no-extra talk message, unlike the Limsa/Ul'dah count widgets. |
| 111627 / [Gcg102](../outputs/job-gc-decomp-20260907/reconstructed/gcg102.md) | 27 | Defend fallen Arthur/Yellow Serpents using Mist Emitter **11000422** → speak to dying Pfrymloef → optional Echo prompt → `gc01g210` with **default** fade → airship landing report. No moving-van route is proved. |
| 111628 / [Gcg701](../outputs/job-gc-decomp-20260907/reconstructed/gcg701.md) | 12 | Vorsaile merit trial → Fulke → player salute. The old-rank slot precedes literal 21; profile `gcg70101` uses effects 15/18. Trial state is not the promotion transaction. |

### Immortal Flames

| ID / code | Methods | Recovered route boundary and implementation consequence |
|---|---:|---|
| 111801 / [Com0u1](../outputs/job-gc-decomp-20260907/reconstructed/com0u1.md) | 9 | `_020(a)` has the boolean entry-fade choice; `_030(a)` forwards the aftermath payload into `COM0U110`. Its two coblyn cast entries do not create extra kill objectives. |
| 111802 / [Com0u2](../outputs/job-gc-decomp-20260907/reconstructed/com0u2.md) | 2 | Aubrey's tutorial opens the Flame status widget and its end displays 250 before closing; transaction/failure cleanup remains server-owned. |
| 111803 / [Com0u3](../outputs/job-gc-decomp-20260907/reconstructed/com0u3.md) | 1 | One company-store interaction and saved answer; no NQ scene or zone transition. |
| 111804 / [Com0u4](../outputs/job-gc-decomp-20260907/reconstructed/com0u4.md) | 11 | Hellhound battle and three Limsa contracts precede `_050(a)`. Numeric `a == 1` skips the `com0u410` finale in favor of dialogue. The private Hellhound implementation does not validate other city waves. |
| 111805 / [Com0u5](../outputs/job-gc-decomp-20260907/reconstructed/com0u5.md) | 23 | Ferry-dock pirates, Thancred/Urianger talks, and Royal Promenade ceremony are separate. `_025` plays `com0u610` with after-warp fade; `_030(a)` distinguishes readiness to choose a company. |
| 111806 / [Com0u6](../outputs/job-gc-decomp-20260907/reconstructed/com0u6.md) | 22 | `_005_03(a)` forwards a scene payload into `com0u510` and requests after-warp fade. `_010(a)` has a 0–3 enum between two talk turns. Elevator methods are distinct; `_elevator_nq3F` is empty. |
| 111807 / [Com0u7](../outputs/job-gc-decomp-20260907/reconstructed/com0u7.md) | 2 | One two-result join widget, repeatable FAQ, company 3/rank 11 effect, numeric accepted return. End's two extra slots do not supply points or rank. |
| 111810 / [Com5u0](../outputs/job-gc-decomp-20260907/reconstructed/com5u0.md) | 13 | Toto-Rak duration is `_010(a)`; `_010_01` owns the one-shot entry question. `menberCountUnderRange(a,b)` is a separate party-size denial surface. |
| 111811 / [Com5u1](../outputs/job-gc-decomp-20260907/reconstructed/com5u1.md) | 8 | Norwick's sigil and Silver-winged Kabuto quest objective are not the dungeon's full clear. `_020_1` entry accepts with talk open; default duty scenes/return belong to occupancy. |
| 111816 / [Gcu101](../outputs/job-gc-decomp-20260907/reconstructed/gcu101.md) | 0 | Root registers `Gcu101 : ScenarioBaseClass` and only empty `initText`. `Gcl101` contains Aubrey's variant, including a **boolean** second-extra predicate, but no inheritance/binding to it is established here. |
| 111817 / [Gcu301](../outputs/job-gc-decomp-20260907/reconstructed/gcu301.md) | 3 | Lefchild's quest is implemented client-side under the copied name `processEventCLIFTONStart`. Journal specifies thirty coblyns, rare stone **11000405**, and lure **11000406**; local fades are presentation only. |
| 111818 / [Gcu302](../outputs/job-gc-decomp-20260907/reconstructed/gcu302.md) | 9 | Galeren → Cotter → northeast Drybone beast ambush → warn Beastcleavers → Galeren. Rank tests vary by NPC (31,11,23); they are not a generic rank-31 admission gate. No NQ scene. |
| 111820 / [Gcu304](../outputs/job-gc-decomp-20260907/reconstructed/gcu304.md) | 8 | Berthar → Fouillel → three object uses with **11000412** → report. Rank threshold is **23**, not the other cities' 27. Completion asks once; both replies continue and finish. |
| 111827 / [Gcu102](../outputs/job-gc-decomp-20260907/reconstructed/gcu102.md) | 24 | Ryder's combat requires Imperial Disruptor **11000421** to remove enemy enhancements. `_010` prompts for Echo; `_015` is `gc01u210` with **default** fade; `_020` report and `_025` landing conversation follow. |
| 111828 / [Gcu701](../outputs/job-gc-decomp-20260907/reconstructed/gcu701.md) | 12 | Swift merit trial → Aubrey → player salute. `_025(oldRank)` displays company 3/21; profile `gcu70101` uses effects 16/19. No quest NQ/warp. |

## Scene and return ownership

The following are all 27 literal NQ call sites in the requested GC methods, referring to 23 unique assets. `default` means `startFadeInCutSceneDefault`; `after-warp` means `startFadeInCutSceneAfterWarp`. All listed methods call `startFadeOutCutSceneDefault` before their scene or consecutive scene pair. Scene argument tuples are exact: omitted arguments are not padded to zero.

| Quest / method | Scene tuple and call PC/offset | Following fade |
|---|---|---|
| Com0l1 `_020(a)` | `("COM0L105",2)` — 6 / `0x92E` | `a == true`: default; otherwise after-warp |
| Com0l1 `_030(a)` | `("COM0l110",1,0,a)` — 8 / `0xE7A` | after-warp |
| Com0g1 `Urianger(a)` | `("COM0G105",2)` — 6 / `0x953` | `a == true`: default; otherwise after-warp |
| Com0g1 `UriangerMore(a)` | `("COM0G110",1,0,a)` — 8 / `0xA5C` | after-warp |
| Com0u1 `_020(a)` | `("COM0U105",2)` — 6 / `0x8B1` | `a == true`: default; otherwise after-warp |
| Com0u1 `_030(a)` | `("COM0U110",1,0,a)` — 8 / `0x9B6` | after-warp |
| Com0l4 `_020(a)` | if `a ~= 1`: `("com0l410",1)` — 44 / `0x121E` | default |
| Com0g4 `Clear(a,b)` | if `a == 0 and b == 0`: `("com0g410",1)` — 36 / `0xF91` | default |
| Com0u4 `_050(a)` | if `a ~= 1`: `("com0u410",1)` — 57 / `0xFF5` | default |
| Com0l5 `_010` | `("COM0l110",1,0)` — 7 / `0xD6C` | after-warp |
| Com0l5 `_elevator_nq1` | `("elv0l110",1,0)` — 26 / `0x1520`; then `("com0l610",1,0)` — 31 / `0x1534` | one after-warp after both |
| Com0l5 `_elevator_nq2` | `("elv0l110",1,0)` — 23 / `0x1700` | after-warp |
| Com0g5 `005` | `("com0g610",1)` — 6 / `0x847` | after-warp |
| Com0u5 `025` | `("com0u610",1)` — 6 / `0x16AA` | after-warp |
| Com0l6 `_010(a)` | `("com0l510",1,0,a)` — 8 / `0xFE2` | **default** |
| Com0g6 `Nq` | `("COM0G510",1)` — 6 / `0x1C96` | **default** |
| Com0u6 `_005_03(a)` | `("com0u510",1,0,a)` — 8 / `0xEAC` | **after-warp** |
| Com0l6 `_elevator_nq1/2` | `("elv0l01a",1,0)` — 7 / `0x1CD0`; `("elv0l02a",1,0)` — 7 / `0x1DA4` | after-warp in each |
| Com0u6 `_elevator_nq1F/2F` | `("elv0u01a",1,0)` — 7 / `0x1C5E`; `("elv0u02a",1,0)` — 7 / `0x1D32` | after-warp in each |
| Gcl102 `NQ` | `("gc01l210",1)` — 6 / `0xFCF` | **after-warp** |
| Gcg102 `PfrymloefNQ` | `("gc01g210",1)` — 6 / `0x117D` | **default**, then row 58 at display mode -1 |
| Gcu102 `015` | `("gc01u210",1)` — 6 / `0x1212` | **default** |
| Gcu102 `_elevator_nq1F/2F` | `("elv0u01a",1,0)` — 7 / `0x1EDF`; `("elv0u02a",1,0)` — 7 / `0x1FB3` | after-warp in each |

The Limsa ceremony accept path asks once, fades out once, plays both scenes consecutively, requests the after-warp fade once, and then finishes its client talk turn before returning the saved answer. Decline plays row 82 and does not enter either scene. Copying the decompiler's repeated `ask` in the return expression would create a second prompt. A server transition should not insert a fade-in or end the outer event between `elv0l110` and `com0l610`.

The `Com0l5._010` reuse of `COM0l110` is especially easy to “correct” incorrectly: its raw constant and call are certain, and it points to the familiar aftermath asset. Its presence alone does **not** establish that retail reached it after the campaign pirate battle. Preserve the exact method and investigate its event producer before assigning it to that battle's success callback.

The same precaution applies to payload-bearing scenes. `Com0l6._010(a)` and `Com0u6._005_03(a)` forward their fourth parameter unchanged. The corresponding Gridania `Nq` call has no extra payload at all. A family-wide `(scene,1,0,0)` convention changes these contracts.

### Scene-local placements are not return destinations

These are decoded initial **typed `SetPosClip`** positions and rotations, with source record offsets. The SCB class table and declared block entry counts establish their types; a byte length of `0x40` alone does not. They are **not** final scene poses, public return points, combat target spawns, or a recovered map translation. Full cast, additional positions, root records, and raw record bytes remain in each scene JSON.

Actor kind bytes also require the scene's own CATT/String registry. The installed native loader `0xA271B0` resolves each CATT entry through the String offset table, and `0xA27210` does the same for clip classes. The 252 class-bound PC/NPC records in this GC set are serialized **`ProxyActor`**, not `CharacterActor`; the remaining 129 slots include two shorter proxies, 93 common actors, 26 native `CharacterActor` stage/resource records, and 8 layout actors. The [native registry evidence](../outputs/job-gc-decomp-20260907/reviews/gc/actor-clip-registry-native.md) preserves the hash-identified C excerpt, exact VAs, and counterexamples to fixed numeric kind names.

| Scene / actor | Actor class ID | Scene-local `(x,y,z)` | Rotation radians | Record |
|---|---:|---|---:|---|
| com0l510 / PC | 0 | `(-177.802994,214.715134,-722.641724)` | -2.318452 | `0x2D60` |
| com0l510 / CID | 1001572 | `(-179.289398,215.342056,-734.675476)` | 0 | `0x2C04` |
| com0g510 / PC | 0 | `(1524.698364,20.760344,-807.666748)` | -0.026127 | `0x2EBA0` |
| com0u510 / PC | 0 | `(-1618.417847,59.446037,249.021927)` | -2.043638 | `0x5BC` |
| com0u510 / Cid | 1001572 | `(-1611.940308,57.414310,245.160095)` | -1.388716 | `0x57C` |
| com0l610 / PC | 0 | `(0,0.007107,12.666786)` | 3.080063 | `0x62D68` |
| com0g610 / PC | 0 | `(-132.625824,-1.216111,-319.288849)` | 3.133597 | `0xA80C4` |
| com0u610 / PC | 0 | `(-15.008632,36.007217,56.048107)` | -0.207693 | `0x8EF60` |
| elv0l110 / PC | 0 | `(5.224273,21.012917,-14.644963)` | 2.139870 | `0x5FC` |
| elv0l01a / PC | 0 | `(-0.121225,19,28)` | 1.570796 | `0x714` |
| elv0l02a / PC | 0 | `(-0.121225,40.011650,28)` | 1.570796 | `0x714` |
| elv0u01a / PC | 0 | `(-20.942423,10.000978,-43.152626)` | -0.331739 | `0x5E0` |
| elv0u02a / PC | 0 | `(-20.547846,34.006306,-44.985310)` | -0.253988 | `0x5BC` |
| gc01l210 / PC | 0 | `(-816.020813,47.913006,-2403.700439)` | 1.075550 | `0x116BAC` |
| gc01g210 / PC | 0 | `(-229.603165,16.545729,311.278931)` | 1.881125 | `0xB7D7C` |
| gc01u210 / PC | 0 | `(-619.577148,-27.355757,219.687958)` | 1.892061 | `0x17D134` |

The two Limsa elevator placements differ vertically by about 21.01165; Ul'dah's differ in horizontal position and rotation as well as height. These asset facts identify distinct staging, but cannot authorize a server warp to either coordinate tuple without the area's world transform and destination-owner evidence. The `gc01*210` scenes also stage different locations; “same numbered GC quest” does not imply a shared scene map.

`com0g610` previously failed the narrow setup scanner because its initial block is named **`header`**, not `setup`. The structural parser recovers that block at payload `0xA6FB0`, its 415 declared clips, the 54 class-bound `ProxyActor` entries among 60 actor slots, and the PC placement above. Searching for a literal lowercase word would have left all of that staging unrecovered.

The all-block pass also supplies positive evidence where an initial block is silent. In `gc01l210`, Cid and the airship have no initial proxy placement. The airship is positioned later in block3 at `0x116EC8`: `(-856.7377,225.6673,-2414.4446)`, rotation -1.4573. Cid is positioned in block7 at `0x1178A0`: `(-831.3279,40.4751,-2390.8040)`, rotation2.2930, and continues through many later placements. These are authored cinematic tracks, not missing persistent NPC spawns.

| Scene / later player staging | Position and rotation | Typed record |
|---|---|---|
| com0l510 / block18, `c17` | `(-183.1184,215.8901,-726.7758)`, -2.1761 | `0x6C70` |
| com0l510 / block21, `c20` | `(-188.7166,215.7827,-735.4616)`, -2.2427 | `0x73A0` |
| com0g510 / block21, `c25` | `(1474.1805,22.0029,-805.9285)`, -0.9527 | `0x33030` |
| com0g510 / block23, `c07` | `(1507.3685,21.1240,-822.1562)`, -1.1079 | `0x336FC` |
| com0u510 / block17, `c16` | `(-1619.6973,59.5293,248.9158)`, -1.9004; start units300000 | `0x2BD4` |

These examples explain why “last position in the file” is not a valid return-point algorithm: block order can differ from named narrative order, and several actor clips can share the same start time. For example, `com0g610` block5 has multiple PC placements at start0. The [all-block placement CSV](../outputs/job-gc-decomp-20260907/scene-timeline-placements.csv) retains block, track, flags, clip ID, and timing so that future control/selection analysis can resolve the applicable track instead of applying all positions sequentially.

Two GC-specific false positives from the old size-only rule are now explicitly rejected: `com0u105` at `0x522DC` and `gc01u210` at `0x17D394` are camera **`IfClip`** records, despite being64 bytes. See [rejected size-only placements](../outputs/job-gc-decomp-20260907/rejected-size-only-placements.csv). Duplicate shortened labels in ceremony dictionaries are preserved by actor index and dictionary offset; a label-keyed map can lose cast members.

## Campaign flags and continued dialogue

The opaque arguments below are **not** recovered as company numbers, quest sequences, or actor IDs. Text gives useful narrative meaning, but their retail producers remain missing.

| Method | Exact branch behavior | Raw evidence |
|---|---|---|
| Com0l5 `_015(a)` | `a == 1`: row 59; otherwise rows 64,69,70; both continue through row 60. The latter text directs the player to the other city leaders. | Full bytecode and symbolic paths under the named method. |
| Com0g5 `020(a)` | `a == 0`: 41–43; `a == 1`: 44–46; anything else: 47. This is three-way Papalymo dialogue, not two boolean states. | [Recorded traces](../outputs/job-gc-decomp-20260907/reviews/gc/campaign-branch-traces.json). |
| Com0g5 `030(a)` | `a == 1`: 82,83; otherwise 60–62; **all paths then give row 84 and finish the talk**. Pretty-printed `break` statements obscure this common suffix. | Same trace file; raw methods in [focused bytecode](../outputs/job-gc-decomp-20260907/reviews/gc/focused-bytecode.txt). |
| Com0u5 `030(a)` | `a == 1`: rows 65,66 say the decision to join is now the player's; otherwise 91,92,67 say learn more of the other nations first. Both resume the common ending. | Method's exact `EQ` and calls. |
| Com0l6 `_015(a)` | At `a == 3`, rows 65/76/82/83 replace 109/75/80/81. Numeric 1 or 2 select 69; 4 selects 70; otherwise 71. Every variant reaches row 72 and the remaining conversation, including 106 and 88. | `EQ` PCs 7,39,51,63,75,114,159; first `EQ` at `0x1728`; branch arms converge at PC96 / `0x188C`; final talk finish PC234 / `0x1AB4`. |
| Com0g6 `Lewin(a,b)` and `Pesi(a,b)` | Special introduction requires numeric `a == 1` **and** `b == 2`; all other combinations use the alternate introduction. | Both complete raw prototypes retained; no coercion of booleans. |
| Com0g6 `Clear(a)` | 1/2/4 select introduction row46; all others row74. Later: 1→53, 2→54, 4→55, otherwise52. All paths resume `startCliantTalkTurn(1)`, wait for it, and deliver rows56,76,57,58,78. | Numeric-domain recorded traces establish the shared suffix despite decompiler `break`s. |
| Com0u6 `_010(a)` | Numeric 0→52, 1→53–54, 2→55–56, 3→57–58,68; any other type/value omits that middle commentary. All paths start/wait a second talk turn and reach59,60,61,69. | 9 recorded argument cases; raw `.luac` per-method PCs retained. |

`Com0g5.processEvent010` starts the talk and stops after row63 without closing it. `011` supplies two worldMaster notices, and `012` runs the response animation, says row81, and finishes the talk. These are explicit authored multi-call phases. Ending the outer event immediately after `010` would discard the intended continuation; moving the `012` closer into `010` changes the recovered ordering.

`Com0u6._010` also explicitly finishes the first turn, plays the rank/history-dependent aside, waits, starts turn mode1, waits for that turn, and resumes. Treating the first `finishCliantTalkTurn` as method completion would truncate the encounter aftermath. The actual Lua method does not return there.

## Enlistment: one widget call, two results, a repeating FAQ

The three `Com0*7` starts share this control structure. This is structural pseudocode; names such as `widgetSucceeded` explain the two tested results, not undocumented widget internals.

```lua
openGrandCompanyStatusWidgetYield(company)
local accepted = nil
if officer:ask(quest, questionRow, 2) == 1 then
    local widgetSucceeded, answer = desktopWidget:askEventModeWidgetYield(
        "Ask/GrandCompanyOfficialJoinWidget", 1, company)
    if widgetSucceeded == true then
        if answer == 1 then
            accepted = 1
            closeStatus(); wait(0.7)
            openJoinEffect(company, 11); wait(4.7)
            openStatus(company); wait(2)
            setJoinStatus(11); wait(2)
            -- Accepted dialogue, company-salute animation, and FAQ follow.
            -- FAQ answers 1..4 display their response and ask again.
            -- Answer 5 (or an unrecognized answer) exits the menu.
            closeStatus()
            officer:finishCliantTalkTurn()
            return 1
        else
            accepted = 0
            -- Widget-decline dialogue.
        end
    end
else
    -- Initial-decline dialogue; accepted stays nil.
end
officer:finishCliantTalkTurn()
return accepted
```

| Quest | Official widget `CALL` | Result tests | Join-effect call | FAQ `CALL` |
|---|---|---|---|---|
| Com0l7 / 111407 | PC94 / `0x318`, `CALL R6 5 3` | R6 `== true` at95; R7 `== 1` at97 | PC110 / `0x358`: `(1,11)` | PC185 / `0x484`: row25, five options |
| Com0g7 / 111607 | PC99 / `0x328` | Independent first/second return predicates in the full trace | PC115 / `0x368`: `(2,11)` | PC195 / `0x4A8`: row24, five options |
| Com0u7 / 111807 | PC86 / `0x2F6` | Independent first/second return predicates in the full trace | PC102 / `0x336`: `(3,11)` | PC177 / `0x462`: row25, five options |

For Limsa, the FAQ loop guard is PC177 / `0x464`; reply1 returns to it at197, reply2 at208, reply3 at219, reply4 at230. Answer5 returns through the guard and exits; an unrecognized answer is converted to5 at234. PC236 replaces the menu variable with numeric1 for the final accepted return at278 / `0x5F8`. The decompiler's apparent infinite `while true` and repeated official-widget expression are not faithful source.

The decline/cancellation paths do not explicitly close the status widget that opened before the first question. Accepted paths do close it. The ending method, called separately by the current server only after a successful reward grant, sets displayed points to literal0 and closes. This is a live-client cleanup question; it is not evidence to run the success ceremony or grant seals after a cancellation.

The server already separates presentation from authority in [the three enrollment scripts](../Data/scripts/quests/com/com0l7.lua) and `Player.TryJoinGrandCompany` (`Map Server/Actors/Chara/Player/Player.cs`). The C# method guards quest identity, company, existing rank, and persistence, and accepts an already-joined-at-initial-rank retry. Rank11's appearance in a scene/widget is not sufficient to replace that transaction. A full seal cap can leave rank11 already applied while the quest remains retryable; this requires a presentation/reward retry check, not a guessed rollback.

## It Kills with Fire: shared narrative is not proven class inheritance

`Gcl101` contains Guincum, Fulke, and Aubrey accept methods. Its text loader points to `gcl101`; its branch variants include all three company officers and all three report variants. `Gcg101` and `Gcu101` instead register directly against `ScenarioBaseClass` at root PC6 / `0x38` and install **only** the empty `initText` closure atPC9 / `0x44`. Neither root imports or inherits `Gcl101`.

Consequently, this pass inventories the Gridania and Ul'dah narrative under its actual source class and does not assign those methods to the empty chunks. A separate spreadsheet/native/server dispatch may provide the binding, but it has not been recovered here. This is a specific next recovery target.

Important `Gcl101` conditions:

- `processEventAubreyStart(a,b)` selects rows114–115 only when **`b == true`**. Its first extra is unused. A numeric1 in the second slot selects the other introduction.
- `_000(a)` distinguishes numeric1, numeric2, and the remaining case.
- `_010(a)` forwards its argument into rows39 and42, which select the named companion. Preserve this substitution parameter rather than filling it with zero based only on arity.
- `_070(a,b)` adds row88 if `a` is1 or3, row89 only if1, and selects94–95 if numeric `b >= 45`, otherwise92. Ordered comparison requires a compatible numeric value; nil is not a valid placeholder for the level slot.
- `_050`, `_050_1`, `_050_2`, `_050_3`, `_050_6` constitute another split briefing/talk lifecycle. `_050_3` supplies a literal30 in its time-limit text. Neither `_060_NQ1` nor `_060_NQ2` contains a `startNQCutScene`: each only opens/closes a talk turn. An “NQ” suffix alone is not evidence of scene ownership.

The inert generic inventory currently associates `Gcl101.accept` with `processEventFulkeStart`. This passes name validation because that method genuinely exists, but it plays the Twin Adder officer's version. A proper Limsa implementation must select `processEventGuincumStart` and honor its four-parameter signature. The correct class routing for the other two IDs must be proved separately.

## Level-40 encounters: devices, Echo, and the escort correction

The raw journals make the mandatory mechanics much more precise than the earlier “instance/escort” label:

| Quest | Combat instruction | End of combat and next boundary |
|---|---|---|
| 111427 / Alive | Sea318: secure the crash-site route, defeat imperial operatives, and use **Imperial Disruptor 11000423 from the interaction menu to prevent reinforcements**. Up to two companions. | Sea319 describes the final operative's defeat and the ensuing Gaius/Cid scene. Sea320 sends the player back to R'ashaht Rhiki. `processEventNQ` requests after-warp fade. |
| 111627 / Two Vans are Better than One | Fst385: Arthur and the Yellow Serpents are already down after a gas attack. Secure the area while they recover; use **Mist Emitter 11000422 from the interaction menu to counter specified Garlean attacks**. Up to two companions. | Fst386: all Garleans defeated, return to the party. Fst387: Echo of Pfrymloef. Fst388–389: airship-landing report. `PfrymloefNQ` has default fade. |
| 111827 / Like Father, Like Son | Wil449: patrol the cave route and use **Imperial Disruptor 11000421 from the interaction menu to remove enemy enhanced status**. Up to two companions. | Wil450: defeated troops leave a surviving Garlean to question. Wil451: Echo; report to Ryder. Wil452: Cid is safe at the Ul'dah airship landing. `015` has default fade; `020` and `025` follow. |

IDs11000421 and11000423 share an English item name in `xtx_itemName.csv`; their quest IDs, usage contexts, and specified effects are distinct. Neither item is a generic proof drop. The current generic shells have no implementation of these interaction mechanics.

The earlier [implementation matrix](grand_company_quests_decomp_2026-08-22.md) says to implement “two-van movement” for `Gcg102`. That exceeds the recovered evidence. Fst383–384 and dialogue row7 say Arthur **departed with an escort before the player arrives**. Fst385 and dialogue26–30 describe the player's area-defense task after that party falls. No waypoint list, wagon actor pair, movement trigger, or moving-escort failure condition has been recovered. The correct gate is the imperial battle, recovery/protection behavior actually supported by encounter data, device use, Echo, and aftermath—not an invented two-vehicle mission. The same caution applies to calling `Gcu102` a player escort quest; its journal describes a combat patrol with a status-removal device.

Echo prompting is a separate call. `Gcg102.PfrymloefNQF` calls `worldMaster:ask(quest,worldMaster,51030,2)` once atPC11 / `0x1090`; only numeric1 executes `runCharaSchedulerPastAreaIn(player)` atPC16 / `0x10A4`. It returns the saved answer atPC17 or24. `Gcu102.010` has the equivalent ask atPC11 / `0x114A` and scheduler atPC16 / `0x115E`. `runCharaSchedulerPastAreaIn` is a player animation helper, not a recovered server coordinate/warp API. The actual NQ method is invoked separately.

The generic `Gcu102.complete = "processEvent015"` inventory points to the middle Echo scene. It must not become the final reward handler: the journals and later methods explicitly continue through the Ryder report and landing conversation. The current generic gate prevents execution, so this is an exact future implementation correction, not an applied gameplay change.

## Small instance objectives and field surveys

The six `301/302` quests have no local NQ-scene calls. Their sparse dialogue methods should not be mistaken for full encounters. Newly retained journal evidence gives these specific requirements:

- **Gcl301:** six dart slugs, poison handling through provided anti-venom, up to two helpers, Clifton's dive/experiment, and return to the Fishermen's Guild. The bytecode does not supply dart-slug placement or a dive-to-return callback.
- **Gcg301:** three leather scraps11000401, sleeping agent11000402 against dreadwolves through the interaction menu, return to Dyrstbrod. Sleeping wolves and recovering scraps are different success conditions; a generic kill tally loses that distinction.
- **Gcu301:** thirty coblyns, lure11000406, obtaining rare stone11000405 and returning to Lefchild. The literal `CLIFTONStart` name is copied naming, not proof that Clifton is the Ul'dah quest giver.
- **Gcl302:** meet Bloody Executioners in the caverns northeast of Bloodshore, defeat the kobolds, report to Hasthwab. Ally talk methods do not reveal wave counts.
- **Gcg302:** find Hilith, survive the forest beast attack, speak with Sister Challinie, deliver the sketch to Dhemdaeg. The delivery follows the fight; it is not one officer-only completion.
- **Gcu302:** pass the plan to Cotter, endure the Drybone ambush, convey the warning to the Beastcleavers, report to Galeren. `isUpperRank` calls affect individual speaker dialogue, not whether the beast encounter exists.

The three `304` routes already have a dedicated shared server helper. Raw confirmation supports its important city distinctions: Limsa/Ul'dah progress methods forward `(completed,total)` into `openPublicInformDialogWidget`; Gridania's progress method takes no extras. All three interaction questions call `ask` once and return its saved result. Limsa/Adder rank tests use27, Flames uses23. `Gcu304._015` asks another one-time narrative question and returns that result only after both reply branches resume the full completion dialogue; a “no” reply does not by itself prove a failed turn-in.

The dedicated server's `nextCount` and objective flags are authoritative state; the text widgets merely display them. The three initial setup/cinematic patterns, ordinary fades, and rank-dependent courtesy animations do not imply a zone return or need for an instanced content shell.

## Merit trials and promotions

All three `G*701` scenario completion methods take one extra argument and display it **before** literal21. The current server passes `config.previousRank == 17`, which matches the intended rank17→21 presentation. The argument is not a reward count, company, or new-rank slot.

| Method | Effect | Old-rank display | New-rank display |
|---|---|---|---|
| Gcl701 `processEventClear(a)` | `(1,21)` PC12 / `0x12A9` | `set...JoinStatus(a)` PC23 / `0x12D5` | 21 atPC30 / `0x12F1` |
| Gcg701 `processEventFULKEend(a)` | `(2,21)` PC12 / `0x13D0` | PC23 / `0x13FC` | 21 atPC30 / `0x1418` |
| Gcu701 `processEvent025(a)` | `(3,21)` PC8 / `0x1607` | PC19 / `0x1633` | 21 atPC26 / `0x164F` |

These methods contain no NQ scene, no positional operation, and no database rank mutation. The server's `emoteDefault1` route in [gc_rank_quest.lua](../Data/scripts/quests/com/gc_rank_quest.lua) performs `TryCompleteGrandCompanyRankQuest` only at the proper officer/sequence before the client ceremony. Keep trial completion, commander report, officer debrief, and salute-driven promotion separate.

Unlike the empty encounter directors, each matching `QuestDirectorGc*70101` defines **11 methods**. Raw `initAsQuestDirector` declares `directNumber:integer8`, `point:integer16`, and `limitTime:integer32`, with `direct` synchronizing the first two and `time` synchronizing the deadline. This proves wire/UI field structure, not that the client calculates merit for kills.

| Profile | Initialization effect | `directNumber == 20` effect | Title text | Article item token |
|---|---:|---:|---:|---:|
| gcl70101 | 14 | 17 | 51113 | 11000426 |
| gcg70101 | 15 | 18 | 51112 | 11000425 |
| gcu70101 | 16 | 19 | 51114 | 11000427 |

All three share instruction51115 and article format33621. The article uses current point, literal target1000, and changes its completion-state token from1 to2 at `point >= 1000`. For Limsa, that `LE` is PC8 / `0x8EA`, and the ten-value article tuple returns atPC24 / `0x92A`. The item token is a contents-display input; its appearance alone is not an instruction to add that item to inventory on every kill.

`getTimeDataOnGuildleveInfo` returns `(limitTime,limitTime - 60)`: Limsa `SUB` PC2 / `0x812`, two-result return PC5 / `0x81E`. That60 is the warning threshold relative to the deadline, not the trial's duration. The 30-minute trial duration remains a distinct journal/server contract.

`processUIUpdate` gives terminal codes precedence over time/update handling:20 plays the city-specific success effect and exits; -1 plays effect20 and exits. Otherwise tag`time` starts contents information; another tag updates it only if `limitTime > 0`. Limsa branch PCs2,10,18,28 appear at`0x484`,`0x4A4`,`0x4C4`,`0x4EC`. `processUIFinalize` always cancels the contents display and plays effect13 only when `directNumber == 0`.

The server currently uses `CancelProbe()` (direct0) for all merit resets, including timeout/death/area exit as well as explicit abandonment. That reaches cancellation presentation; `FinishProbe(false)` would select the distinct failure presentation. The distinction is proved; which retail reset cause should choose which presentation still requires producer evidence or a live reference. The exact 125/150/175 per-kill values and enemy spawns are not recovered from these director UI methods.

## The remaining server boundary

The 29 matching director chunks divide into24 registration-only shells, two one-method quest-ID binders, and three eleven-method merit UI directors. Both `/Director/Quest/...` and `/Director/Quest/SimpleQuestBattle/...` copies exist for some identically named301/302 classes. Their parent classes differ and their paths are retained; class-name matching alone must not merge their ownership.

`QuestDirectorCom0l601.getOwnClientQuestIdAsSimple` returns111406 atPC1 / `0x129` after loading that constant atPC0 / `0x125`. `QuestDirectorCom0u501` similarly returns111805. These binders are useful evidence that their SQB shell belongs to the specific campaign; neither defines a target list, spawn layout, protected NPC condition, victory trigger, or return placement.

For the familiar adapters, [gc_sqb_runtime.lua](../Data/scripts/directors/Quest/gc_sqb_runtime.lua) still dispatches `state.config.successEvent` with no extra payload. The client aftermath methods all accept and forward one. Their correct default cannot be inferred from nil/zero permissiveness, scene cast labels, or the current battle actor. The player-relative spawn offsets, short settling waits, and timeout are also server decisions, not values justified by these scene placements.

Existing quest examples provide reusable **ordering** ideas: create/validate content ownership; keep a successful scene-bearing event alive through its authored continuation; select the correct default versus after-warp fade; queue return packets when that path requires them; then release the outer event and clean up the private actors/director. They do not justify copying another quest's arena, target list, timeout, payload, or failure policy. Default-fade Echo/campaign paths should not automatically be assigned the familiar adapter's after-warp return sequence.

For each missing encounter the next executable specification still needs: the actual start trigger, participants, target class/instance identities, exact spawn/wave/interaction graph, protected-actor state when applicable, success/failure/retry producer, device interaction behavior, owner-only progression, and return destination/cleanup. This report recovers the client contracts around those gaps without supplying fictional mechanics.

## Reproduction and validation

```powershell
python -B tools/build_job_gc_decomp.py
python -B outputs/job-gc-decomp-20260907/reviews/gc/reproduce_focus.py
```

The focused pass parses each entire input chunk and checks that the reader consumes all bytes. It writes83 method slices,29 director registrations and their defined methods,39 conservative campaign traces, and35 source journal rows. The complete pack independently reconstructs every local non-init method for all45 GC quests. The two empty101 classes and registration-only encounter shells are retained as positive evidence of the limit of the recovered code.

No quest availability, runtime dispatch, rewards, spawn tables, or rank transactions were changed by this GC review. No live-client playthrough, cutscene-skip test, device interaction, or server return-warp verification is claimed.
