# Forever Taken -> Lord Errant -> Of Men They Sing

## Seamless client decomp and cutscene-to-fight delivery handoff

Date: 2026-08-22
Scope: quests `110016` through `110018` only. `Futures Perfect` (`110019`)
is the downstream quest and cap boundary, but is not re-decomposed here.

This is the consolidated handoff for the three recovered main-scenario
quests. It combines the client scenario wrappers, installed cutscene packages,
journal/marker/item/reward data, server quest scripts, private-content
directors, and the shared event/warp lifecycle contract.

## Current status

The three quest implementations are present and enabled in the worktree. The
following static checks passed on 2026-08-22:

- `validate_forever_taken_man304.py`
- `validate_lord_errant_man308.py`
- `validate_of_men_they_sing_man402.py`
- `validate_man304_308_402_406_cutscene_order.py`

Static validation proves that the route constants, quest state, actors, battle
profiles, cutscene wrappers, rewards, availability cap, and GM checkpoints
agree. It does not replace watched, skipped, disconnect, or live combat UAT;
that matrix is included below.

## Quest chain

| Quest | Client code | Level | Prerequisite | Completion boundary | Delivery shape |
| --- | --- | ---: | --- | --- | --- |
| `110016` | Man304 / Forever Taken | 34 | `110015` / Toll of the Warden | `SEQ_025`; downstream quest `110017` | Crystal interaction plus private Waking Sands assembly; no fight |
| `110017` | Man308 / Lord Errant | 38 | `110016` / Forever Taken | `SEQ_020`; downstream quest `110018` | Private ritual, one-group Parley, three-enemy fight |
| `110018` | Man402 / Of Men They Sing | 42 | `110017` / Lord Errant | `SEQ_020`; downstream quest `110019` | Private Path-companion escort, two-enemy fight |

The supported main-scenario cap is `110019`, so all three quests must remain
available in order for the client to present the next MSQ step normally.

```text
Forever Taken
  accept -> five crystal interactions -> Hedyn delivery
  -> private Waking Sands assembly -> Path companion -> reward

Lord Errant
  accept -> Paglth'an gate -> private ritual
  -> one successful Parley for four captives -> three Amalj'aa
  -> ritual aftermath -> Minfilia -> reward

Of Men They Sing
  accept -> Nine Ivies -> private escort
  -> injured scout + two Bloodhounds -> Waking Sands/Tataru -> reward
```

## Shared seamless-client contract

The client-visible transition is not one state. These layers must stay
separate:

1. Event ownership: `currentEventOwner`, event name/type, delegate coroutine,
   and `EventFinish` ordering.
2. Director ownership: the client must know the quest director and its actor
   before private-area events can resolve correctly.
3. Player login director: `SetLoginDirector` must point reconnects at the
   active director.
4. Content-group membership: adding a player to a group is not the same as
   starting the group or clearing the loading presentation.
5. Content-group start: the duty roster/work envelope must be published at the
   point required by that quest's recovered client contract.
6. Map/landing readiness: the destination actor table, visibility packets,
   client `0x0007` readiness, and the first safe event dispatch are separate
   gates.

### Entry and transfer ordering

For these three quests, the safe entry pattern is:

1. Resolve the destination from the authoritative public zone, not the
   player's current private area.
2. Create the content area and director.
3. Bind `director.CurrentArea`, attach the player/director, and start the
   director.
4. Publish the content group and set the login director before the content
   actor-table transfer when the opening scene owns that duty envelope.
5. Delegate the recovered client wrapper only after allocation succeeds.
6. Queue `DoZoneChangeContent` or `DoZoneChange` without manually ending an
   after-warp event first.
7. Let the staged world transition publish `EventFinish`, settle the old event,
   rebuild the destination actor table, and complete the client fade.

`Man304`, `Man308`, and `Man402` all publish their proven destination content
envelope before the opening content transfer. Man308's GM/recovery path skips
the source movie and uses a destination `noticeEvent`/`questBaseRewardSeting`
acknowledgement instead of manufacturing a movie fade.

### After-warp rule

The recovered client method `startFadeInCutSceneAfterWarp` is a loading
finalizer, not a cosmetic fade. The event that delegates it must remain owned
until the matching movement or zone transfer has been queued. This applies to
watched and skipped playback because the skip widget only calls the cutscene's
`_skip()` and returns through the ordinary delegate path.

| Quest | Wrapper and scene | Active finalizer | Paired server transition |
| --- | --- | --- | --- |
| Man304 | `pE20` / `man30420` | after-warp | Waking Sands private `DoZoneChangeContent` |
| Man304 | `pE30` / `man30430` | after-warp | public Waking Sands `DoZoneChange` |
| Man308 | `pE10(false)` / `man30810` | after-warp branch | Paglth'an private `DoZoneChangeContent` |
| Man308 | `pE30` / `man30830` | after-warp | same-area content rebase with `DoZoneChangeContent` |
| Man308 | `pE90` / `man30900` | after-warp | Waking Sands `DoZoneChange` |
| Man402 | `pE30` / `man40230` | after-warp | Waking Sands `DoZoneChange` |

The conditional `Man308 pE50(false)` branch is retained in the client
scenario, but the live ritual path passes `true`, which selects the default
fade for the chained ritual scenes and does not invent a second warp.

Do not:

- call `EndEvent` before the paired transfer;
- delegate PlayerBase native fade methods directly from a director;
- replace an omitted recovery movie with a synthetic after-warp finalizer;
- treat content-group membership as proof that `Now Loading` has cleared;
- change global E2 mode, map delays, or EventFinish ordering without a raw
  watched/skipped trace.

### Reconnect and failure invariants

- Persist the quest sequence before any post-scene transfer that changes the
  recovery target.
- Use a durable phase flag for the boundary that can be crossed during a
  disconnect: Man308 Parley complete and Man402 escort complete.
- Rebind the replacement `Player` object by character ID; never keep the stale
  session object as the director owner.
- Recreate the destination actor set idempotently by unique ID.
- Keep queued, in-progress, and completed event phases distinct so a timeout
  cannot launch a second copy while the first delegate is waiting.
- On failure, stop escort/director work, despawn temporary actors, finish the
  content area, clear only the phase state that is no longer valid, and return
  to a public retry anchor.
- Complete the quest before a final return transition only when the reward and
  recovery target are already persisted; never manually grant SQL rewards a
  second time.

## 1. Forever Taken / Man304 / quest `110016`

### Route and state

| State | Player objective | Server/client handoff |
| --- | --- | --- |
| accept | Speak with Hedyn in the Ashcrown Consortium | `pES` -> `man30400`; the recovered Path-companion tuple uses personality bucket plus arguments `5, 10` |
| `SEQ_000` | Bury five Unaspected Crystals at Silvertear Falls | Five distinct push actors; each consumes one Lightning Crystal, sets one flag, and increments counter `0` |
| `SEQ_005` | Return to Hedyn | `pE10` -> `man30410`; counter `0` is cleared only after the five-crystal requirement is satisfied |
| `SEQ_010` | Return to the Waking Sands and enter the main hall | Doorway `1090186` creates `SimpleContent30081` in zone `181`; `pE20` -> `man30420` remains owned through the content transfer |
| `SEQ_020` | Speak with the player's Path companion | Dynamic companion actor is talkable; `pE30` -> `man30430` is the final scene |
| `SEQ_025` | Reward recovery if the final handoff was interrupted | Minfilia is exposed as a recovery target; reward is shown once and completion is centralized |

Rewards are `102,000` gil and `26,500` EXP. Both authoritative SQL rows are
auto-granted; the scene opens the reward window but does not duplicate the
gil grant.

### Crystal ledger and markers

The client item row for Unaspected Crystal (`11000096`) is exclusive and
max-stack `1`, while the journal asks for five. The authoritative model is
therefore a quest counter, not five physical inventory items:

- input: Lightning Crystal `1000013`;
- output displayed by the attention packet: Unaspected Crystal `11000096`;
- counter: quest data counter `0`, range `0..5`;
- duplicate protection: flags `0..4`, one per soil actor;
- missing-input path: `processEvent000_22(4)`;
- successful confirmation: `processEvent000_20`, remove one input, set the
  point flag, increment counter, show `25226` progress;
- fifth completion: move to `SEQ_005` and show the quest completion attention
  message.

| Actor class | Marker | Zone | `(x, y, z, rotation)` | Purpose |
| ---: | ---: | ---: | --- | --- |
| `1090181` | `11001607` | `190` | `(752.120, 31.400, -374.220, -1.232)` | Silvertear soil 1 / flag 0 |
| `1090182` | `11001608` | `190` | `(722.092, 30.969, -380.955, -1.073)` | Silvertear soil 2 / flag 1 |
| `1090183` | `11001609` | `190` | `(744.460, 33.811, -307.340, -1.073)` | Silvertear soil 3 / flag 2 |
| `1090184` | `11001610` | `190` | `(799.600, 44.200, -214.430, -1.073)` | Silvertear soil 4 / flag 3 |
| `1090185` | `11001611` | `190` | `(864.072, 43.998, -297.140, -0.681)` | Silvertear soil 5 / flag 4 |
| `1090186` | `11001606` | `181` | `(-193.460, -2.000, -177.310, —)` | Waking Sands main-hall doorway |

The Silvertear Y values are terrain captures; the original marker sheet only
provided X/Z. The entrance pushes are owned by the quest so a ward menu or
unrelated progression state cannot redirect the route.

### Private assembly

- Public parent zone: `181` / Waking Sands.
- Content area path: `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`.
- Private area name: `SimpleContent30081`.
- Director: `Quest/QuestDirectorEventMan30401`.
- Entry: `(-193.460, -2.000, -181.000, 0.000)`.
- Dynamic companion: `1070000 + player:GetSNpcSkin()` during the assembly;
  re-entry uses the player's actual companion class and nickname.
- The director owns companion publication and starts the group after landing;
  the sequence-20 public doorway recreates the copy without replaying
  `man30420`.

The current content factory resolves content hooks by private-area name. The
Man304 route is director-driven and currently has no separate
`Data/scripts/content/SimpleContent30081.lua` hook. Its recovery is provided by
the sequence-20 doorway and skip-assembly path rather than an `onPlayerLeft`
sequence reset. If the content factory is later changed to require an `onCreate`
or `onPlayerLeft` script, add that hook and preserve the existing sequence-20
recovery behavior.

### Cutscene package inventory

All four packages decode against the installed client. Their transforms are
cinematic placements, not persistent world destinations.

| Scene | Bytes | Actor records | Spatial opcode | Role / player anchor |
| --- | ---: | ---: | ---: | --- |
| `man30400` | `294,992` | `11` | `7` | Minfilia, PC, Path companion, Hedyn, Sylph/object cast; PC `(-39.280, -0.006, -1.616, -3.142)` |
| `man30410` | `55,104` | `8` | `7` | Hedyn return and Sylph/companion cast; PC `(-33.488, -1.954, -36.533, 2.883)` |
| `man30420` | `70,832` | `12` | `5` | Waking Sands assembly; PC `(-28.064, -3.000, -48.384, -2.117)` |
| `man30430` | `116,160` | `4` | `5` | Companion/Minfilia conclusion; PC `(35.392, 1.204, -0.899, 1.561)` |

Required dialogue paths are wired for Hedyn, Cliaux, Cenmin, Memezofu, the
soil confirmation/missing-item messages, the post-turn-in direction, and the
personality-specific final companion lines. Ambient rows remain optional and
must not be made progression gates:

- `processEvent000_2..000_13` / rows `469..480`;
- `processEvent010_2..010_8` / rows `459..468`;
- additional Consortium rows `481..486`;
- post-turn-in rows `504..505`.

## 2. Lord Errant / Man308 / quest `110017`

### Route and state

| State | Player objective | Server/client handoff |
| --- | --- | --- |
| accept | Reach the Gold Court offer | `pES`; Gold Court trigger `1090187` is in zone `209` |
| `SEQ_000` | Reach the Paglth'an gate | Trigger `1090188`; `pE01` -> `man30800` |
| `SEQ_005` | Reach the Paglth'an approach | Trigger `1090189`; create the party-capable combat-class content copy (owner + one player helper + mandatory Path companion) and delegate `pE10(false)` -> `man30810` |
| `SEQ_010` | Speak with the Path companion | `pE20` then `pE30` -> `man30830`; `pE30` owns the rebase to battle staging |
| `SEQ_015`, flag `0` clear | Parley with the captive group | Four passive named captives; one successful Parley frees the group |
| `SEQ_015`, flag `0` set | Defeat the Amalj'aa group | Replace captive presentation with three hostile BNPCs and a combat-ready Path ally |
| `SEQ_020` | Report to Minfilia | `pE80` -> `man30880` then `man30890`; public Paglth'an return, then `pE90` -> `man30900` at Minfilia |

Rewards are `114,000` gil and `32,500` EXP. The active duty timeout is `30`
minutes; event notice fallbacks use an `8` second guard.

### Content envelope and anchors

- Public parent zone: `174` / Southern Thanalan.
- Content area path: `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`.
- Private area name: `SimpleContentMan30801`.
- Director: `Quest/QuestDirectorMan30801`.
- Boundary square: X `970..1035`, Z `950..1015`.
- Initial content entry: `(995.168, 309.146, 982.116, -2.519)`.
- Battle rebase: `(1000.714, 308.565, 985.779, 1.541)`.
- Public post-fight anchor: `(1217.650, 311.707, 776.001, -0.931)`.
- Failure/retry approach anchor: `(1134.053, 312.430, 830.706, -1.649)`.

The content script adds the director and player. The director adds temporary
actors, persists the Parley flag, tracks unique IDs, and owns cleanup.

### Cutscene package inventory

| Scene | Bytes | Actors | Spatial opcode | Role / anchor |
| --- | ---: | ---: | ---: | --- |
| `man30800` | `89,312` | `4` | `1` | Paglth'an gate; PC `(1240.229, 319.338, 746.182, -0.929)` |
| `man30810` | `62,992` | `9` | `1` | Approach and battle staging; PC includes `(1134.053, 312.430, 830.706, -1.649)` and `(1000.714, 308.565, 985.779, 1.541)` |
| `man30820` | `49,056` | `11` | `9` | Orphan asset; no recovered Man308 wrapper or live call site |
| `man30830` | `16,304` | `5` | `1` | Content staging; PC `(995.168, 309.146, 982.116, -2.519)` |
| `man30850` | `4,777,472` | `15` | `2` | NQ ritual with four captives, priests, and Ifrit |
| `man40640` | `9,909,200` | `27` | `26` | HQ ritual composite chained before `man30850` |
| `man30860` | `9,360` | `3` | `2` | Three Amalj'aa ritual/combat beat |
| `man30880` | `2,358,128` | `15` | `15` | Ritual aftermath |
| `man30890` | `94,496` | `7` | `6` | Public Paglth'an return; PC `(1217.650, 311.707, 776.001, -0.931)` |
| `man30900` | `44,960` | `7` | `8` | Waking Sands report; PC `(-40.159, 0.000, -1.605, 2.209)` |

The cross-quest `man40640` reference in `pE50` and the chained
`man30880 -> man30890` completion sequence are intentional client behavior,
not decompiler noise. `man30820` remains inventory-only until a real wrapper
or replay row proves otherwise.

### Parley contract

Four passive named actors are staged:

- Tempered Elezen: class `1001336`, appearance `2289003`;
- Tempered Lalafell Maid: class `1001607`, appearance `2289001`;
- Tempered Midlander: class `1001336`, appearance `2289002`;
- Tempered Captive: class `1001607`, appearance `2289001`.

Each actor has a unique ID with prefix `man308_captive_` and receives the
same board parameters:

- title `1401` / Lord Errant;
- requested-item slot `1000019` for widget presentation;
- `12` turns;
- `20` seconds per turn.

Targeting any one captive and winning one Parley sets flag `0`, clears the
passive captive presentation, and starts the battle. A failed or conceded
Parley leaves the group in place and is retryable; it must not consume the
quest flag or begin combat.

### Battle contract

| Unique ID | Actor class | BNPC profile | Label | Job | Level | Skill list | HP |
| --- | ---: | ---: | --- | --- | ---: | ---: | ---: |
| `man308_amaljaa_lancer` | `2206508` | `32712` | Amalj'aa lancer | Lancer (`8`) | `38` | `88` | `2,500` |
| `man308_amaljaa_archer` | `2206512` | `32713` | Amalj'aa archer | Archer (`7`) | `38` | `87` | `2,500` |
| `man308_amaljaa_augur` | `2206518` | `32714` | Amalj'aa augur | Thaumaturge (`22`) | `38` | `89` | `2,500` |

The director sets linked aggression, a `45`-yalm spawn leash, ranged-position
holding for the archer and augur, and vital synchronization. The Path
companion becomes a level-38 DPS ally with `3,200` HP, `1,200` MP, `9,000`
delay, and `95` damage.

Completion is an authoritative unique-ID poll: an absent or dead actor counts
as defeated, and all three are required before `battleWon` is queued. The
notice event has an `8` second direct-completion fallback.

### Recovery and cleanup

- Fresh entry starts at the approach trigger and sequence `5`.
- Relog after entry but before Parley recreates the captives.
- Relog after a successful Parley uses flag `0` to skip the ritual and spawn
  combat directly.
- Player death, leaving the battlefield, timeout, missing actor spawn, or
  missing director clears flag `0`, returns to sequence `5`, despawns all
  temporary actors, finishes content, and warps to the approach anchor.
- Successful completion persists sequence `20` before `pE80`, then returns to
  public Paglth'an. Minfilia and `pE90` are the final reward/reconnect target;
  the staged public warp remains paired with the after-warp event.

## 3. Of Men They Sing / Man402 / quest `110018`

### Route and state

| State | Player objective | Server/client handoff |
| --- | --- | --- |
| accept | Speak with Tataru at the Waking Sands | `pES` -> `man40200`; Tataru actor class `1001046`, display `1500054` |
| `SEQ_000` | Reach Camp Nine Ivies | Push trigger `1090190` in East Shroud zone `151` |
| `SEQ_005`, flag `0` clear | Follow the player's Path companion | Private escort `SimpleContentMan40201`; flag `0` is the escort-complete boundary |
| `SEQ_005`, flag `0` set | Protect the injured scout | Replace escort with combat-ready ally, scout, and two Bloodhounds |
| `SEQ_015` | Return to the Waking Sands and talk to Tataru | `pE20` -> `man40220` after the fight; first Tataru talk advances to `SEQ_020`, then `pE30` -> `man40230` and the after-warp return |
| `SEQ_020` | Recover an interrupted reward handoff | Tataru repeats the reward/completion path without replaying `pE30`; public Waking Sands push remains available |

Rewards are `126,000` gil and `39,000` EXP. The active duty timeout is `30`
minutes; landing fallback is `4` seconds and event notice fallback is `8`
seconds.

### Content envelope and escort route

- Public parent zone: `151` / East Shroud.
- Content area path: `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`.
- Private area name: `SimpleContentMan40201`.
- Director: `Quest/QuestDirectorMan40201`.
- Boundary square: X `1650..2025`, Z `-1750..-820`.
- Entry: `(1690.881, 20.171, -857.553, 2.539)`.
- Safe retry point outside the push circle: `(1712.000, 20.000, -862.000, 0.573042)`.
- Scout endpoint: `(1984.491, 31.996, -1680.115, -0.302)`.

Route file: `Data/escortnavmesh/of_men_they_sing.json`.

The route contains `51` waypoints over about `942.1` yalms at speed `7.0`.
It starts at the cutscene companion anchor `(1694.418, 19.997, -861.227)` and
passes the recovered search marker `(1917.460, 31.500, -1627.580)` before
ending at the scout. The owner-failure contract is `40` yalms with a `6`
second grace window; the escort does not wait indefinitely outside its leash.

The quick-navmesh audit is not continuous near the objective, so the
intermediate forest turns are bounded reconstruction from the cutscene
anchors and period footage. Do not present unrelated quick-navmesh samples as
retail route proof.

The escort uses the player's actual Path-companion class and nickname. On
completion, the escort director is stopped and the same identity is recreated
as the combat ally; this prevents a visible identity/model swap.

### Cutscene package inventory

| Scene | Bytes | Actors | Spatial opcode | Role / anchor |
| --- | ---: | ---: | ---: | --- |
| `man40200` | `31,216` | `8` | `2` | Tataru/Minfilia distress-call offer; Tataru `1001046` at `(-38.994, 0.000, -2.514, -0.808)` |
| `man40210` | `287,456` | `17` | `7` | Nine Ivies briefing, escort, scout, and Bloodhound staging; PC `(1690.881, 20.171, -857.553, 2.539)` |
| `man40220` | `20,976` | `6` | `7` | Post-fight rescued scout/companion scene; PC `(1870.347, 19.690, -1731.395, 1.457)` |
| `man40230` | `67,648` | `8` | `2` | Final Tataru/Path-companion report; Tataru `1001046` at `(-38.994, 0.000, -2.514, -0.808)` |

The `man40210` package stores both Bloodhounds as appearance `1001370` and
the scout as appearance `1001239`. The runtime combat class is not inferred
from the cinematic appearance: it is explicitly `2201417` with BNPC profile
`32715`.

### Escort and battle contract

Escort phase:

- route key: `of_men_they_sing`;
- runtime unique ID: `man402_path_companion_escort`;
- ally presentation: `SpawnEscortAsAlly = true`, not registered as a combat
  party member until the battle replacement;
- failure: route failure, deletion, owner leash failure, or companion defeat;
- success: set durable flag `0`, update ENPCs, stop the escort director, and
  start combat immediately.

Battle staging:

- scout class `2290016`, appearance `1001239`, unique ID
  `man402_resistance_scout`, HP is non-objective staging state;
- Path ally at `(1982.600, 31.996, -1683.000, -0.300)`, level `42`, `4,200`
  HP, `1,400` MP, `9,000` delay, `110` damage;
- two Bloodhounds, both level `42`, `3,200` HP, skill list `5062`:

| Unique ID | Actor class | BNPC profile | Cutscene anchor | Label |
| --- | ---: | ---: | --- | --- |
| `man402_bloodhound_1` | `2201417` | `32715` | `(1987.319, 32.733, -1713.693, -0.339)` | Bloodhound |
| `man402_bloodhound_2` | `2201417` | `32715` | `(1989.393, 32.656, -1714.478, -0.339)` | Bloodhound |

The director polls both unique IDs rather than trusting a legacy kill callback
alone. Player death, companion death, leaving the private area, route failure,
spawn failure, and timeout all clean up and return to the Nine Ivies retry
anchor. Successful completion persists `SEQ_015`, plays `pE20`, finishes the
private copy, and returns to public zone `151` before the Tataru `pE30` reward
handoff.

### Recovery behavior

- Relog before reaching the scout: flag `0` is clear, so the escort restarts
  from the safe content entry.
- Relog after the escort reaches the scout: flag `0` is set, so the director
  starts the Bloodhound fight without replaying the route.
- Relog after the fight: sequence `15`/`20` exposes Tataru and the Waking Sands
  marker; `SEQ_020` is the interrupted-reward recovery state.
- Completion uses the same Path-companion nickname/class data as the escort,
  avoiding a cutscene-to-fight actor identity mismatch.

## Client wrapper matrix

This is the complete active wrapper chain for the three requested quests.
Talk/UI wrappers are included because their result and argument shape controls
the first client event; only named scene wrappers are counted as cutscene
packages.

| Quest | Wrapper | Scene(s) | Fade branch used by the live route | Server owner/transition |
| --- | --- | --- | --- | --- |
| Man304 | `pES` | `man30400` | default | Hedyn offer |
| Man304 | `pE10` | `man30410` | default | Hedyn delivery |
| Man304 | `pE20` | `man30420` | after-warp | Waking Sands content entry |
| Man304 | `pE30` | `man30430` | after-warp | final public return |
| Man308 | `pES` | talk/UI | — | Gold Court offer |
| Man308 | `pE01` | `man30800` | default | Paglth'an gate |
| Man308 | `pE10(false)` | `man30810` | after-warp | private battlefield entry |
| Man308 | `pE20` | talk/UI | — | companion personality line |
| Man308 | `pE30` | `man30830` | after-warp | same-area battle rebase |
| Man308 | `pE50(true)` | `man40640`, `man30850` | default | ritual + four-captive presentation |
| Man308 | `pE60` | `man30860` | default | Amalj'aa ritual beat |
| Man308 | `pE80` | `man30880`, `man30890` | default | post-fight aftermath + public anchor |
| Man308 | `pE90` | `man30900` | after-warp | Minfilia completion return |
| Man402 | `pES` | `man40200` | default | Tataru offer |
| Man402 | `pE10` | `man40210` | default | Nine Ivies content entry |
| Man402 | `pE20` | `man40220` | default | post-fight public return |
| Man402 | `pE30` | `man40230` | after-warp | Tataru reward/public return |

## Implementation and evidence inventory

### Runtime files

| Surface | Files |
| --- | --- |
| Quest routes | `Data/scripts/quests/man/man304.lua`, `man308.lua`, `man402.lua` |
| Private directors | `Data/scripts/directors/Quest/QuestDirectorEventMan30401.lua`, `QuestDirectorMan30801.lua`, `QuestDirectorMan40201.lua` |
| Content lifecycle | `Data/scripts/content/SimpleContentMan30801.lua`, `SimpleContentMan40201.lua`; Man304 is director-driven in private area `SimpleContent30081` with no local content hook |
| Escort | `Data/escortnavmesh/of_men_they_sing.json`, `tools/derive_man402_escort_route.py` |
| Cutscene decoders | `tools/decompile_man304_cutscene_setup.py`, `tools/decompile_man308_cutscene_setup.py`, `tools/decompile_man402_cutscene_setup.py` |
| Validators | `tools/validate_forever_taken_man304.py`, `tools/validate_lord_errant_man308.py`, `tools/validate_of_men_they_sing_man402.py`, `tools/validate_man304_308_402_406_cutscene_order.py` |
| Shared client/runtime seam | `docs/content_cutscene_lifecycle_contract.md`, `Map Server/WorldManager.cs`, `Map Server/Actors/Area/PrivateAreaContent.cs`, `Map Server/Actors/Area/Area.cs` |

### Data sources

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man304.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man308.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man402.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman40201.lua`
- `docs/Dat Mining/xtx_quest.csv`
- `docs/Dat Mining/xtx_journalxtxWil.csv`
- `docs/Dat Mining/quest_marker.csv`
- `docs/Dat Mining/cutReplay.csv`
- `docs/Dat Mining/xtx_negotiationTable.csv`
- `Data/sql/gamedata_actor_class.sql`
- `Data/sql/server_eventnpc_spawn_locations.sql`
- `Data/sql/server_battlenpc_mob_types.sql`
- `Data/sql/gamedata_items.sql`
- `Data/sql/gamedata_quest_rewards.sql`

The individual dossier files remain useful for provenance and detailed source
notes:

- `docs/forever_taken_man304_decomp_2026-08-14.md`
- `docs/lord_errant_man308_decomp_2026-08-14.md`
- `docs/of_men_they_sing_man402_decomp_2026-08-14.md`

## Verification matrix

### Static and binary checks

Run from the repository root:

```text
python tools/decompile_man304_cutscene_setup.py
python tools/decompile_man308_cutscene_setup.py
python tools/decompile_man402_cutscene_setup.py
python tools/derive_man402_escort_route.py
python tools/validate_forever_taken_man304.py
python tools/validate_lord_errant_man308.py
python tools/validate_of_men_they_sing_man402.py
python tools/validate_man304_308_402_406_cutscene_order.py
python tools/validate_quest_availability.py
```

### Client UAT gates

Run each test with a fresh character or a named GM checkpoint and record
`EventStart`, `EventUpdate`, `EventFinish`, map/position packets, actor
publication, loading presentation, quest sequence, flags, and reward rows.

#### Forever Taken

- Accept from Hedyn with each Path-companion personality bucket.
- Confirm missing Lightning Crystal feedback; confirm and cancel the soil
  dialog; verify each soil flag prevents duplicate credit.
- Complete exactly five conversions and verify the journal counter, attention
  item presentation, and Hedyn `pE10` handoff.
- Watch and skip `pE20` during the Waking Sands content transfer.
- Disconnect before landing, during `man30420`, after landing before the
  companion talk, and during `pE30`.
- Re-enter through the sequence-20 doorway without replaying `man30420`.
- Complete through the Minfilia recovery target and prove gil/EXP are granted
  once.

#### Lord Errant

- Watch and skip `pE10(false)` and verify no black screen/audio-under-loading
  state remains.
- Verify `pE20 -> pE30` stages the correct companion and rebase position.
- Target each captive; prove one successful Parley frees the whole group.
- Fail/concede Parley and prove the captives remain retryable with flag `0`
  clear.
- Verify all three exact Amalj'aa labels, jobs, HP, aggression, ranged
  positioning, and Path ally identity.
- Disconnect before Parley, after Parley, during combat, during `pE80`, and
  before Minfilia `pE90`; prove the persisted phase is resumed safely.
- Kill all three, watch/skip the chained aftermath, return to Minfilia, and
  prove rewards are not duplicated on recovery.

#### Of Men They Sing

- Watch and skip `pE10`; verify the destination loads before the scene begins.
- Verify the dynamic Path-companion model, nickname, map marker, 51-waypoint
  route, and leash warning/failure behavior.
- Disconnect before the scout, after flag `0` is set, during Bloodhound combat,
  and after `pE20` before the Tataru handoff.
- Verify the escort replacement uses the same companion identity as the
  combat ally.
- Verify the scout appearance `1001239`, two Bloodhounds using profile `32715`,
  unique-ID kill polling, companion-death failure, and public retry anchor.
- Watch/skip `pE30` and verify the staged public return closes the after-warp
  event before the old map is torn down.
- Complete at Tataru and prove `39,000` EXP and `126,000` gil are granted once.

## Known non-goals and evidence boundaries

- Client-declared but currently dormant ambient branches are not progression
  requirements. Do not expose them as required server steps without a replay
  row, actor owner, and watched/skipped trace.
- `man30820` is an orphan asset with no recovered Man308 wrapper/call site.
- Cutscene transforms are staging evidence. They do not automatically become
  persistent spawn or warp locations.
- The Man402 route's start/end anchors are recovered; intermediate forest
  turns are bounded reconstruction because the quick-navmesh is not continuous
  at the objective.
- SQL reward rows remain authoritative. Quest-side reward-window calls are
  presentation and completion handoff, not a second grant path.
- The shared lifecycle contract is duty-specific. Man406's deferred
  destination acknowledgement pattern must not be copied into these three
  quests without matching client evidence.

## Done definition

This handoff is complete when the static checks remain green and the runtime
UAT proves the following for each quest: the correct actor dictionary is
visible, watched and skipped scenes use the same event path, every after-warp
scene is paired with its real transfer, every reconnect resumes the persisted
phase, every failure returns to a deterministic retry anchor, and completion
opens the right reward once without leaving `Now Loading`, stale actors, or a
stranded director behind.
