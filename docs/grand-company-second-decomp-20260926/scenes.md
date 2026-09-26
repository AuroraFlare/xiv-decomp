# Second-pass Grand Company scenes and dispatch

This pass recovers new semantic structure behind the 56 installed resources in the frozen whole-GC scene inventory: **3,938 native track nodes, 94 IfClips, 295 ordered branches and 348 predicates**. It also establishes exact replay-table associations for **nine of the ten resources that previously lacked a recovered caller**. These associations identify replay owners; the retail server's live dispatch remains a separate boundary.

The [scene evidence index](../../outputs/grand-company-second-decomp-20260926/scenes/README.md) links a new readable branch review and exact JSON for every resource. The [summary](../../outputs/grand-company-second-decomp-20260926/scenes/summary.json), [branch ledger](../../outputs/grand-company-second-decomp-20260926/scenes/if-branches.csv), [predicate ledger](../../outputs/grand-company-second-decomp-20260926/scenes/if-predicates.csv), and [replay ledger](../../outputs/grand-company-second-decomp-20260926/scenes/replay-bindings.csv) are machine-readable. All 102 main-SQL Grand Company quests remain in the parent scope; scene resources are shared assets, so neither 56 resources nor 79 replay rows is a count of independently implemented quests.

No old decomp output, runtime script, gameplay SQL, native asset, map binding, nav source, or placement was changed. Cinematic actor membership and local coordinates do not create battle actors or recover their homes.

## Newly recovered evidence

| Surface | Result |
|---|---:|
| Installed scenes reread and matched to frozen SHA-256 | 56 |
| CTRK records with validated acyclic ancestry | 3,938 |
| IfClips / ordered branches / predicates | 94 / 295 / 348 |
| Predicate source IDs resolving uniquely | 348 / 348 |
| Native numeric predicates, equality / inequality | 292 / 56 |
| Empty AND branches / later shadowed branches | 7 / 6 |
| Numeric-register transfer clips | 25 |
| Finite synthetic decision cases | 1,753 |
| Exact replay rows / distinct resources | 79 / 50 |
| Previously unbound resources with replay rows | 9 / 10 |
| Recovered chunks searched for those ten literal names | 2,517 |
| Literal LOADK references found for those ten names | 0 |
| Dispatch, replay, scene and skip methods disassembled | 71 |
| Fresh native functions exported with C and instruction listings | 33 |

The finite decision cases supply concrete examples for the decoded predicates. They do not establish the retail input domain, exhaustively emulate the scheduler, or prove that each serialized branch was exercised by players. The six shadowing findings instead follow directly from the ordered first-match rule and unconditional empty AND branches.

## Native evidence and serialized layouts

The existing local Ghidra project was opened with `-readOnly -noanalysis`. Every export verifies imported executable SHA-256 `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`; the builder separately requires the installed `ffxivgame.exe` to match. Five new exports retain exact function virtual addresses, bodies, C, instruction addresses, completion markers and image identity:

- [Branch execution](../../outputs/grand-company-second-decomp-20260926/scenes/native/branch-control.txt): `A28F30`, `A29690`, `A20000`, numeric comparisons, source lookup and serialized iteration.
- [Branch construction and value reads](../../outputs/grand-company-second-decomp-20260926/scenes/native/branch-layout.txt): `A291E0`, `A29390`, `A2A9A0`, `A2A950`, `DFAEC0`.
- [Track tree operations](../../outputs/grand-company-second-decomp-20260926/scenes/native/track-tree.txt): parent, child, sibling and enable storage.
- [Track loader](../../outputs/grand-company-second-decomp-20260926/scenes/native/track-loader.txt): `A26850`, `A26910`, `A26CA0`, `A2A780`, `A2A7D0`.
- [Track state and metadata readers](../../outputs/grand-company-second-decomp-20260926/scenes/native/track-state.txt): `A2A720`, `A2A7A0`, `A2A7E0`, `A2A7F0`, `A2A810`, `A26BD0`.

The first pass decoded typed actor/clip registries and every timeline record but left most control payloads opaque. This pass decodes the following fields from original installed bytes.

| IfClip field | Serialized form | Native evidence |
|---|---|---|
| +0x10 | signed16 control track/group ID | `A29690` passes it to `A20000` |
| +0x12 | unsigned8 branch count | `A291E0`, `A29390` |
| +0x13 | preserved reserved byte | No new meaning assigned |
| +0x14 onward | ordered variable-size branches | `A291E0`, `A2AA50` |
| Branch +0 | signed16 selected track ID | `A29390` stores runtime +8 |
| Branch +2 | unsigned8 predicate count | `A291E0`, `A29390` |
| Branch +3 | combiner: 0 AND, 1 OR | `A29390` stores runtime +0xC; `A28F30` evaluates |
| Predicate +0 / +1 | operation / value type | `A2A9A0` |
| Predicate +2 | signed16 source clip ID | `A2A9A0`, `A21430` |
| Predicate +4 | signed32 numeric literal, or 16-byte string field when type=1 | `A2A9A0`, `A2AA50` |

Numeric predicates are eight bytes; string predicates are twenty. Only numeric predicates occur in these 56 scenes. The decoder can retain a string field and validate its width, but deliberately does not emulate the native string comparator. `A2A950` exposes operation 0=true, 1=equal, 2=unequal through a 16-byte comparator call; its helper's complete string behavior is outside this pack.

`A2A8A0` implements numeric operations 0=true, 1=`==`, 2=`!=`, 3=`>`, 4=`>=`, 5=`<`, 6=`<=`, 7=nonzero bitwise AND, and 8=zero bitwise AND. Relational operations are signed. An unknown operation is false. Crucially, `A2A9A0` rejects a missing source clip **before** evaluating operation 0. These operation numbers are SCB predicate codes, not the journal text macro's E0–E5 codes.

`A28F30` short-circuits AND and OR. Empty AND is true; empty OR is false; unsupported combiner values are false. `A29690` scans branches in serialization order and stops at the first true result. If none matches it supplies -1 to `A20000`. This means `source != 9999` or `source != 99999` is a real comparison, not an unconditional fallback.

## Track ancestry makes the selected branch concrete

An IfClip selects a track container, and the actual cinematic clips often target its children. Joining only on the selected numeric ID omits those children. The new decoder consumes the native `@CTRK` table and joins each selected branch to all descendant track IDs and their typed clips.

`A26850` reads a signed parent ID from each track record. Parent -1 means no parent. `A2A780` stores the parent pointer and prepends the node to the parent's child list; native sibling order is therefore distinct from serialized index order. The record stride is `((byte3 & 31) * 2 + 7) & ~3`, following the native instruction sequence at `A268D7–A268E8`. Each record's additional signed16 entries and upper three flag bits are preserved. Byte +2 is retained as raw data; no actor meaning is assigned to it.

`A2A720` initially sets a track's own enable byte to 1. `A2A7A0` walks the parent chain and returns false if any ancestor's enable byte is zero. For a selected branch, `A20000`/`A26B20` obtains its parent, clears the parent's direct children through `A26A90`, then enables the selected child. A -1 selection clears the specified control group's direct children. Descendants inherit the disabled state through the ancestor walk, rather than requiring an individual write to every clip.

All 3,938 decoded nodes have valid, acyclic ancestry. Every clip's target track is in range; every selected branch is under its stated control group. The [per-scene JSON files](../../outputs/grand-company-second-decomp-20260926/scenes/controls) retain parent chains, raw track records, raw IfClips, predicate source clips, branch descendant membership, actor slots, timeline blocks and exact offsets. Membership does not prove execution: block activation, timing, other native controls and runtime values still matter.

### Concrete ordering discoveries

In [gc010715](../../outputs/grand-company-second-decomp-20260926/scenes/controls/gc010715.md), IfClip 854 at package offset `0x1CA6C`, block `setup_38`, controls group 5. Its six branches select tracks 6, 8, 10, 12, 14 and 16. Every branch has zero predicates and combiner AND. Branch 0 always wins when this IfClip executes; branches 1–5 are shadowed. Each shadowed branch contains eight descendant clips on two tracks. This says what this control operation selects, not that those clips are globally dead under every other possible track operation.

In [gc010820](../../outputs/grand-company-second-decomp-20260926/scenes/controls/gc010820.md), IfClip 22 at `0x860`, block literally named `etup`, selects track 8 when actor-category clip 21 equals 1. Its second branch is empty AND and selects track 10. The final `clip21 != 999` branch selecting track 12 can never win this first-match decision. Track 12 and its child 13 contain five clips. The label is preserved exactly instead of silently corrected to `setup`.

Other representative controls retain meaningful non-default sentinels:

| Scene / control offset | Source | Ordered conditions and selected tracks |
|---|---|---|
| `com0g105` / `0x4BB94` | RaptureAskClip 85 | `==1` →12; `==2` →14 |
| `gc010110` / `0xE8EA8` | RaptureAskClip 250 | `==2` →66; `!=99999` →68 |
| `gc010810` / `0x721C` | RaptureQuestInfoClip 193 | `==1` →33; `!=9999` →35 |
| `gc01u410` / `0x4A524` | RaptureAskClip 300 | `==1` →21; `!=9999` →23 |

The source taxonomy counts predicates, not distinct source clips: 171 read RaptureGetActorCategoryClip, 140 RaptureGetActorNumberClip, 29 NumberClip, six RaptureAskClip and two RaptureQuestInfoClip. Enum values from category/number getters remain numeric; no race, sex, company, success or failure label is invented from frequency alone. NumberClip literals are annotated separately from runtime writes. For example, `DFAEC0` proves GetNumberRegisterClip reads register +0x12 and writes the target clip identified at +0x10; its occurrence can supersede a NumberClip's serialized default.

## Nine previously unbound resources now have exact replay owners

The [cross-reference record](../../outputs/grand-company-second-decomp-20260926/scenes/previously-unbound.json) joins `docs/Dat Mining/cutReplay.csv`, `xtx_cutReplay.csv` and main quest SQL. These are exact row joins backed by the replay widget's arithmetic, not associations inferred from adjacent scene names.

| Resource | Exact replay row(s) | Main-SQL owner |
|---|---|---|
| `gc010110` | 11141603, 11161603, 11181603 | Gcl101 / Gcg101 / Gcu101, *It Kills with Fire* |
| `gc010420` | 11143003, 11163003, 11183003 | Gcl104 / Gcg104 / Gcu104, *In for Garuda Wakening* |
| `gc010430` | 11086702 | Sum6g0, *Taming the Tempest*; auxiliary scope |
| `gc010720` | 11143305, 11163305, 11183305 | Gcl107 / Gcg107 / Gcu107, *To Kill a Raven* |
| `gc010730` | 11143306, 11163306, 11183306 | Same three quest owners |
| `gc010740` | 11143307, 11163307, 11183307 | Same three quest owners |
| `gc03l410` | 11082001 | Etc202, SQL title `[en]`; auxiliary scope |
| `gc03g410` | 11082002 | Etc202 |
| `gc03u410` | 11082003 | Etc202 |
| `gc010440` | None in this sheet | Still unresolved |

ReplayCutsceneSelectWidget.createList considers `questID*100+1` through `questID*100+30`, adding rows only when the sheet confirms they exist. PopulaceCutScenePlayer.processCutScenePlay derives the quest ID with `floor(replayRow/100)`, gets the quest actor for replay, reads the exact scene string from column 0, and processes eight selectors from columns 8–15. Column 6 equal to 2 chooses HQ; other values choose NQ. The eight selectors are retained unmodified in the ledger.

The generic path delegates selectors to `getCutSceneReplayData`; selector -202 has the explicit SNPC conversion path, -206 explicitly checks main skill 41, and -207 uses initial town. Those code paths do not give an arbitrary scene's selectors new meanings. Native/helper behavior that is absent from recovered local method bodies remains unresolved.

After each played selection the replay actor hides widget 14, fades in, clears `saveQuestId`, deletes the temporary quest actor, restores music and unloads the row. `_onFinalize` separately checks a nonzero saved quest ID and the existence of its static actor before deletion. This is replay-specific ownership and cleanup, not evidence that live quest scenes use the same dispatch.

The [whole-corpus search](../../outputs/grand-company-second-decomp-20260926/scenes/whole-corpus-literal-search.json) hashes all 2,517 recovered Lua chunks and finds no literal LOADK of any of the ten resource names. It does not rule out constructed names, native resource references, unrecovered scripts or server-supplied event arguments. In particular, the absence for `gc010440` is bounded evidence, not proof that the asset was unused.

## WhiteGeneral dynamic dispatch and native scene ownership

The [WhiteGeneral bytecode](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/director__instanceraid__instanceraidlesserwhitegeneral.txt) proves two separate paths:

1. `processStartEvent(owner)` calls `executeCutScene("gc010715", owner, true)` at PC4 / `0x163`.
2. `processCutSceneEvent(scene, owner, weather)` fades out for 1, waits for fading, sets the supplied weather with transition 0 at `0x1E2`, calls `executeCutScene` with the supplied scene and owner at PC16 / `0x1F6`, fades in for 1, then waits 1.

The second path contains no literal scene name. Its weather and scene parameters are event inputs, not recovered values for a particular quest stage. The known gc010715 opening does not bind gc010720/730/740 to this method; the new replay rows likewise do not recover those event packets.

The [instance-raid base bytecode](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/director__instanceraid__instanceraidbaseclass.txt) gives the broader lifecycle. `startEvent` stores content/event IDs, clears the clear flag, sets the countdown, calls processLogin(false), and forwards varargs to processStartEvent at `0xC9A`. It can then play an independently supplied scene unless the scene key is exactly `"none"`. It fades in, optionally emits the start effect for eventType 0, opens the information widget and only then sets initFlag=true at `0xD12`.

The base `_onReceiveDataPacket` returns early when initFlag equals false. Packet selector 1 sets clearFlag and updates countdown before closing the information widget; selector 2 sets clearFlag, zeros countdownStatus and closes it; selector 3 forwards to processUserMessage. There is no scene-name selection in these recovered packet branches. WhiteGeneral's processDummy and the inherited processUserMessage are empty local methods.

`executeCutScene` creates a scene with the provided owner, defaulting only a nil owner to the director. Its mode is 1 unless its boolean argument is exactly false, in which case it is 2. It calls `startCutScene(1, 63, mode, ...)` at `0x1979`, then calls `_delete` at `0x1981` without testing the return value. The mode argument is not a recovered party-size or first-view predicate.

## Skip, native boundary, and cleanup differences

The [shared facade](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/gamedata__cutscene_common.txt) selects `_play` for first argument 1 and `_replay` otherwise. `_play` returns two values at `0x20BD`; `_replay` does so at `0x20D5`. `showCutSceneSkip(self)` occurs only on the `_play` path with third argument exactly 1. On return, third argument 1 hides the skip widget. Desktop mode cancellation additionally follows the first returned value being true and its internal preservation flag being false. These are bytecode conditions, not a universal promise that every scene finishes through the same cleanup route.

[CutScene U bindings](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/gamedata__cutscene_u.txt) expose `_play_cpp`, `_replay_cpp` and `_skip_cpp` through inline facade descriptors. `_loadCutScene` is a one-instruction RETURN body in the recovered chunk. A shell or inline descriptor does not establish the underlying engine as a no-op; the C++ playback, skip acknowledgement and abort behavior remain native boundaries beyond the decoded SCB control primitives.

The [skip widget](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/widget__cutsceneskipwidget.txt) opens the confirmation dialog for Button_CutSceneSkip. It invokes its argument actor's `_skip` only when the selected result equals 1 and the actor is not nil (`processAskResult`, call `0x2F8`), then clears that actor and hides. `skipDirect` sends the same UI operation at `0x389`; it is not a bypass around this confirmation code. `clear` closes an existing CommonAskWidget, clears its actor reference, and hides.

The [quest wrappers](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/quest__questbaseclass_common.txt) have deliberately different cleanup contracts:

| Wrapper | Envelope | Cleanup shown by raw instructions |
|---|---:|---|
| startNQCutScene | 61 | Deletes only when first return is true; returns second value |
| startHQCutScene | 62 | Deletes after return without checking first value; returns second value |
| InstanceRaidBaseClass.executeCutScene | 63 | Deletes after return; discards returned values |
| replayNQCutScene | 61, first argument 2 | Uses pending actor; `_delete` at `0x877`, then another `_delete` at `0x887` when first return is true |

The two replay deletion instructions are present in recovered bytecode, not a pretty-printer duplication. Their native idempotence, stale-reference behavior and live execution are not established here. They must not be silently simplified into the normal NQ cleanup branch.

[CutScene._onFinalize](../../outputs/grand-company-second-decomp-20260926/scenes/dispatch/gamedata__cutscene.txt) deletes its actorclass spreadsheet at `0x256`, then clears both textOwner and actorclassSheet. None of these ownership operations supplies missing retail battle state, quest completion credit or stage transitions.

## Reproduction and validation

From the repository root:

```powershell
python -B tools/build_gc_second_scenes.py
python -B -m unittest discover -s tools -p test_gc_second_scenes.py -v
python -B tools/build_gc_second_scenes.py --check
```

The normal build rereads installed SCB packages, recovered manifest bytecode, CSV sheets and main SQL, requires the five verified native exports, and writes only `outputs/grand-company-second-decomp-20260926/scenes/`. `--check` performs read-only byte-length and SHA-256 comparisons for every pinned source and emitted artifact; it does not rerun Ghidra or claim a live client test.

To reproduce the fresh native C/listing exports before the build:

```powershell
python -B tools/build_gc_second_scenes.py --native-export
```

This optional step requires the existing local `ghidra-projects/ghidra-ifrit-targeted` project and imported `/ffxivgame-ifrit.exe`, Ghidra at `C:/Users/drime/Downloads/ghidra_12.1_PUBLIC/support/analyzeHeadless.bat`, and Java at `C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot`. Paths are explicit in the builder. It uses the existing `tools/ghidra/DecompileGarudaVerifiedTargets.java`, requests read-only/no-analysis mode, and redirects Ghidra's application cache/logs into this new output's native directory. It installs nothing and does not save changes to the imported program. Both normal and bundled Python lack Capstone here; the instruction listings come from Ghidra instead.

All **14 regressions pass**. They cover native numeric truth tables and signed inputs, missing sources, empty/invalid combiners, first-match ordering, sentinel comparisons, variable-width/truncated records, the two actual shadowing cases, all 56 installed track trees and raw IfClip bytes, unique predicate-source resolution, selected-track ancestry, invalid/cyclic parents, and exact replay row owners. No visual or gameplay acceptance is claimed.
