# Man304 / Man308 / Man402 / Man406 cutscene-skip decomp

> **2026-09-04 follow-up:** The [five-quest bytecode pass](msq_30_46_bytecode_decomp_2026-09-04.md) adds Man300, verifies saved returns and scene arguments, and corrects Man308 `pE90` to receive a converted companion actor class. Event lifetime and payload correctness are separate requirements; the transition checks below do not establish both.

## Finding

The recovered client scenario wrappers divide into ordinary fade-ins and
`startFadeInCutSceneAfterWarp` finalizers. An after-warp wrapper must retain its
active event owner until the associated move or zone transition is queued. The
map server's staged `DoZoneChange` and `DoZoneChangeContent` paths capture and
retire the active event before actor-table teardown, with an event-finish settle
before the destination snapshot. Quest scripts must not close the event before
handing it to the paired transition.

The first audit found four live call paths which bypassed that protection:

| Quest | Wrapper | Transition | Previous ordering | Corrected ordering |
| --- | --- | --- | --- | --- |
| Man308 | `pE10` / `man30810` | Paglth'an content entry | delegate, `EndEvent`, content warp | delegate, content warp; staged transition closes event |
| Man308 | `pE90` / `man30900` | final Waking Sands return | delegate/reward, `EndEvent`, zone warp | delegate/reward, zone warp; staged transition closes event |
| Man402 | `pE30` / `man40230` | final Waking Sands return | delegate/reward, `EndEvent`, zone warp | delegate/reward, zone warp; staged transition closes event |
| Man406 | `pE30` / `man40630` + `man40635` + `man40645` | same-area cave rebase | delegate, `EndEvent`, move | delegate, move, `EndEvent` |

Skipping makes the race much easier to hit because the client reaches the fade
finalizer immediately. Closing the event first removes the only server-side
transaction that can pair the black fade with its destination movement.

## Bytecode follow-up

### Second exhaustive inventory pass

The raw Lua 5.1 chunks contain **thirteen methods capable of selecting an
after-warp fade** across these four quests:

- `man304`: `pE20`, `pE30`
- `man308`: `pE10`, `pE30`, `pE50`, `pE90`
- `man402`: `pE30`
- `man406`: `pES`, `pE15`, `processEvent020`, `pE30`, `pE50`, `pE60`

Every live after-warp branch now has a paired content transfer, public zone
change, or same-area rebase while its event is still owned. Man308's conditional
`pE50` remains on its default branch. Man406's `processEvent020` runs only after
the content warp and automatic landing notice have finished, so it uses its
recovered `true` / `startFadeInCutSceneDefault` branch.
The regression validator reads the bytecode directly and will fail if another
after-warp-capable method appears without being classified.

The raw Lua 5.1 bytecode was then checked where the source decompiler produced
damaged control flow. This established two additional Man406 contracts:

- `pES` contains exactly one `man40600` call. The apparent second call in the
  decompiled source is false reconstruction. Result `1` (the accepted branch)
  selects `startFadeInCutSceneAfterWarp` before returning that same result.
- `pE60` unconditionally selects `startFadeInCutSceneAfterWarp` after
  `man40660`.

Neither path previously supplied a move. They now perform a same-position
`DoPlayerMoveInZone` rebase while the event remains active. This is a valid
after-warp handshake, refreshes the actor table after quest phasing changes,
and does not invent a different destination absent from the recovered data.

The entry flows were hardened at the same time:

- Man308 `pE10(false)` and Man406 `pE15` are not delegated until their content
  area and director have been created successfully. Allocation failure can no
  longer strand a fade which has no possible destination.
- Man304, Man308, Man402, and Man406 publish their proven destination content envelope
  before `DoZoneChangeContent`.
- The working Man308 trace emitted an automatic type-`0x50`, argument-`false`
  landing notice after its pre-warp group bind. The deferred Man406 path omitted
  that notice. Man406 now closes the restored landing notice separately, then
  starts `man40620` through a fresh named type-`0x05` event.

## Cross-check matrix

| Quest wrapper | Client finalizer | Server transition state |
| --- | --- | --- |
| Man304 `pE20` | after warp | already retained through `DoZoneChangeContent` |
| Man304 `pE30` | after warp | already retained through public `DoZoneChange` |
| Man308 `pE10(false)` | after warp | corrected |
| Man308 `pE30` | after warp | already retained through same-content warp |
| Man308 `pE50(false)` | after warp | inactive route; live director passes `true` |
| Man308 `pE90` | after warp | corrected |
| Man402 `pE30` | after warp | corrected |
| Man406 `pE15` | after warp | already retained through `DoZoneChangeContent` |
| Man406 `processEvent020(true)` | default | named scene begins after the content landing notice has closed |
| Man406 `pE30` | after warp | corrected |
| Man406 `pE50` | after warp | already retained through public `DoZoneChange` |
| Man406 `pES` accepted result | after warp | corrected with same-position quest-phase rebase |
| Man406 `pE60` | after warp | corrected with same-position completion-phase rebase; exact retail coordinates remain capture-gated |

## Evidence used

- Recovered scenario Lua under
  `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/`.
- Cutscene packages decoded by the Man308, Man402, and Man406
  `tools/decompile_man*_cutscene_setup.py` utilities, plus the Man304 scenario
  and validator evidence. Man406 alone contains 11 scene packages, including the 16.25 MB
  `man40635` HQ scene and the chained `man40630/35/45` completion sequence.
- Current quest and director Lua under `Data/scripts/quests/man/` and
  `Data/scripts/directors/Quest/`.
- `WorldManager` staged transition ordering and `Player.EndEvent` ownership
  behavior.

## Shared skip protocol pass

The shared client machinery was decompiled below the four quest scripts:

- `CutSceneSkipWidget.processAskResult(1)` calls only the bound cutscene
  actor's `_skip()`, clears that actor, and hides the widget. It does not send a
  distinct quest-level skip operation.
- `CutScene.startCutScene` returns skipped playback through the ordinary
  `_play()` delegate path, so watched and skipped scenes must satisfy the same
  server event/warp ordering.
- `startFadeInCutSceneDefault` waits for the map, fades in, and waits for the
  fade. `startFadeInCutSceneAfterWarp` instead invokes the native
  `_fadeInAfterWarp()` finalizer immediately; this explains why prematurely
  ending the owning event is especially visible on skip.
- Same-zone `DoPlayerMoveInZone` publishes the rebase packets atomically but
  does not close the event. Cross-zone/content transitions capture the active
  event, close it before actor-table teardown, and settle EventFinish before
  continuing the destination rebuild.

## General content-cutscene lifecycle rule

The Man406 `Now Loading` investigation established a reusable review contract
for other missions. Director ownership, `Player_work` login-director binding,
content-group membership, content-group start, event ownership, and client
landing readiness are separate layers and must be audited independently.

The characteristic Man406 failure—cutscene audio playing while `Now Loading`
covered the screen—proved the scene asset and delegate were functioning. The
12:53 trace showed that group membership alone was not a direct loading clear.
The decisive comparison was the working Man308 entry: its pre-warp content
envelope caused a separate type-`0x50`/`false` landing notice. Deferred Man406
membership suppressed that notice, while the later `onZoneIn` experiment
incorrectly merged landing and movie ownership and still failed.

A later trace isolated a second, independent lifecycle error in the Man406
sequence-15 recovery branch. Recovery skipped `man40615` but called
`processAfterWarpFadeOutGeneral`, manufacturing the omitted movie's
`_fadeInAfterWarp` loading owner. The hard content transfer then supplied its
own loading owner, while `man40620` could release only one when its movie began.
The result was a fully running, audible scene hidden by the remaining loading
desktop. Recovery now closes the source event instead; only a real pE15 delegate
is allowed to arm pE15's after-warp finalizer.

The full reusable contract, reconnect matrix, diagnostic fingerprints, and
review checklist are recorded in
`docs/content_cutscene_lifecycle_contract.md`. This is required reading for
private-content opening, mid-duty, completion, skipped, and reconnectable
cutscenes. It is not a blanket instruction to defer every content group:
InstanceRaid/Occupancy clients may require their duty envelope before a scene,
so recovered client inheritance and event arguments remain authoritative.

The server also contains a narrowly scoped classifier for a same-owner,
same-name EventStart whose type changes to `0x4D` and whose only argument is
boolean `false`. It preserves the previous event while a coroutine is waiting.
No historical map log currently contains that classifier marker, an
`eventType=0x4D`, or an EventUpdate `Step: 0x4D`, including the available Man304,
Man402, and Man406 runs from 2026-08-21. Because the old probe notes describe
`0x4D` as an EventUpdate while the current handler receives EventStart, its
exact packet form remains capture-gated. The runtime was deliberately not
changed without a raw watched/skipped trace.

The validator now freezes both sides of the proven contract: the raw skip and
fade bytecode signatures, all thirteen quest after-warp methods, transition
ordering, and the existing conservative `0x4D(false)` classifier.

## Third scene-package and caller pass

A further audit classified all **24 cinematic wrappers**, including ordinary,
conditional, after-warp, and chained wrappers. Every wrapper has a fade-in
finalizer in raw bytecode. Two chains which are easy to miss are now explicit
regression contracts:

- Man308 `pE50` genuinely plays HQ `man40640` followed by NQ `man30850`; the
  cross-quest scene name is present in raw Lua bytecode and is not decompiler
  damage.
- Man308 `pE80` plays `man30880` followed by `man30890` before the director's
  public Paglth'an return. Its live completion caller was present and correctly
  uses the default fade branch.

The four Man304 binary scene packages were also decoded directly. Their actor
dictionaries contain the expected Minfilia, player, Path companion, Hedyn, and
Sylph records, and all four expose stable player spatial anchors. The new
`tools/decompile_man304_cutscene_setup.py` keeps those file sizes, actor counts,
spatial opcodes, actor identities, and anchors reproducible alongside the
existing Man308/402/406 decoders.

Scene spatial records are cinematic placements, not authoritative persistent
destinations. This matters for Man406 `pE60`: its player staging point is local
to the Waking Sands cutscene set, while the live event already occurs beside
Tataru at the persistent spawn. It does not justify inventing a different
post-scene warp, so the same-position rebase remains the supported result.

## Remaining runtime capture

The functional `man40660` fade is no longer blocked: it uses a same-position
rebase. The exact retail post-scene coordinates remain unknown because neither
the wrapper bytecode nor the cutscene package encodes a different world
destination. Capture this scene both watched and skipped with
`!questevent on man406_pE60 180`; record `EventStart`, every `EventUpdate`, the
type-`0x4D` false follow-up (if present), `EventFinish`, map and position
packets, and the quest sequence. Replace the neutral rebase only if that trace
proves a different destination.

The `0x4D false` event is not emitted by the skip widget itself. The recovered
widget simply invokes `CutScene:_skip()`, after which `_play()` returns through
the ordinary delegate path. The current server handler for the same-owner
`0x4D false` follow-up therefore remains unchanged until a watched-versus-
skipped trace proves that it must resume rather than preserve the active wait.

The static regression check is
`tools/validate_man304_308_402_406_cutscene_order.py`.
