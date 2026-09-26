# Futures Perfect / Man406 Decomp and Delivery

Status: implemented and enabled on 2026-08-14.

2026-08-22 loading-overlay finding: the destination snapshot, movie delegate,
audio, skip controls, and transport all complete while the hard-transfer
presentation remains above the scene. Directly delegating PlayerBase native
fade methods is invalid because `DirectorBaseClass.delegateEvent` appends its
event arguments; live attempts failed in `Functor::GetArguments_` and produced
client error `40000`.

The repaired entry follows the working Man0u102 lifecycle. Entrants and
reconnect replacements join the director without content-group membership. The
destination area's `onZoneIn` opens a notice which delegates the stock
`questBaseRewardSeting` wrapper. That wrapper explicitly clears Now Loading and
performs the ordinary fade. Only after it returns does Man406 close the notice,
publish/start the content group, and open `imperialsWithdraw` or
`imperialsCornered` as a separate named movie event.

Quest identity:

- Quest `110019`, code `Man406`, level `46` main scenario; prerequisite `110018` (`Of Men They Sing`).
- Offer actor: Minfilia `1000843`; final report actor: Tataru `1001046`.
- Retail reward rows: `138,000` gil and `46,000` EXP. The existing custom Goobbue grant remains in `onFinish`.
- The client journal explicitly permits the owner plus up to two party members. Entry therefore uses the all-disciplines content factory and gathers at most three nearby party players.

## Source resolution

The delivery cross-checks five independent sources:

1. The recovered `Man406` client scenario proves every dialogue/cutscene wrapper and the `pE30` scene chain.
2. Installed-client cutscene binaries prove actor dictionaries, scene sizes, spatial opcodes, and implementation-critical transforms. `tools/decompile_man406_cutscene_setup.py` re-decodes and asserts them.
3. Journal rows `226`–`232`, marker rows `11001901`–`11001906`, and the quest/reward SQL prove the six-stage objective order, party allowance, map anchors, level, prerequisite, and rewards.
4. [Retail fight footage](https://youtu.be/lLxsYEc8Fb8?t=357) resolves the empty retail director shell: the objective is to track three non-hostile imperials, then fight an Imperial juggernaut, centurion, hoplomachus, and sagittarius. Its period description also confirms the three-player battle allowance and that the party must disband before the cave/Echo aftermath.
5. Existing actor-class and Mor Dhona capture data prove the exact spawnable monster classes. The capture checklist independently labels actor `2202401` as the level-50 Futures Perfect juggernaut.

The recovered `QuestDirectorMan40601`, `QuestDirectorEventMan40601`, and `QuestDirectorEventMan40602` scripts are empty base-class declarations. Pursuit motion, runtime battle lifecycle, failure handling, party entry, and recovery are therefore server reconstruction, not recovered director instructions.

## Playable route

| Sequence | Objective | Server behavior | Scene |
| --- | --- | --- | --- |
| accept | Speak with Minfilia | Offer at the Waking Sands | `pES` → `man40600` |
| `0` | Hear the Resistance members | Seven independently persisted talk flags; Minfilia remains gated until all seven are heard | dialogue `processEvent000_1`…`000_7` |
| `5` | Decide whether to fight | Minfilia/Resistance briefing | `pE10` → `man40610` |
| `10` | Hurry to Revenant's Toll | Public trigger `1090191`; owner plus up to two nearby party members enter `SimpleContentMan40601` | `pE15` → `man40615` |
| `15`, flag `7` clear | Track the imperial centuria | `processEvent020`, then three-actor non-hostile pursuit | `man40620`, gameplay |
| `15`, flag `7` set | Defeat the imperials | `processEvent025`, then exact four-enemy encounter | `MAN40625`, gameplay |
| `20` | Investigate the cave | `pE30` chains the battle aftermath, HQ legatus/Echo movie, and cave awakening; five children plus trigger `1090192` are interactable | `man40630` + `man40635` + `man40645` |
| `25` | Report to the Waking Sands | Cave vision/Empire speech, public Mor Dhona return, then Tataru reward and completion | `pE50` → `man40650`; `pE60` → `man40660` |

The previous quest's final wrapper also uses the large `man40640` HQ asset as the narrative bridge into Futures Perfect. It is decoded here for completeness but is not replayed by the `Man406` quest route.

## Cutscene decomp

Exact installed-client metadata:

| Scene | Bytes | Actors | Spatial opcode | Role |
| --- | ---: | ---: | ---: | --- |
| `man40600` | `61,984` | `13` | `6` | Minfilia offer/Resistance audience |
| `man40610` | `77,360` | `12` | `5` | operation decision |
| `man40615` | `85,664` | `13` | `5` | departure for Mor Dhona |
| `man40620` | `197,632` | `15` | `5` | imperials withdraw/pursuit opening |
| `man40625` | `386,144` | `12` | `4` | airship arrival and fight setup |
| `man40630` | `153,264` | `14` | `5` | immediate battle aftermath |
| `man40635` | `16,254,448` | `52` | `30` | HQ legatus, mentor, explosion/Echo sequence |
| `man40640` | `9,909,200` | `27` | `26` | preceding-quest HQ narrative bridge |
| `man40645` | `56,416` | `6` | `3` | cave awakening with five children |
| `man40650` | `311,760` | `19` | `3` | enthrallment vision and Mor Dhona return |
| `man40660` | `45,296` | `9` | `0` | Tataru/Minfilia final report |

Implementation-critical transforms:

| Scene actor | Actor/appearance | Transform `(x, y, z, rotation)` | Use |
| --- | ---: | --- | --- |
| `man40600/MINFILIA` | `1000843` | `(39.330, 1.205, 0.022, -1.641)` | Waking Sands cutscene-to-public offset anchor |
| `man40620/PC` | player | `(-218.470, 18.542, -666.627, -2.817)` | private battlefield entry |
| `man40620/teikoku_hm` | `1001244` | `(-213.322, 18.826, -689.771, -1.104)` | pursuit start |
| `man40625/PC` | player | `(-70.983, 19.746, -703.104, 1.449)` | pursuit destination scene |
| `man40625/teikoku_elm` | `2207001` | `(7.057, 20.171, -704.071, 1.591)` | centurion combat position |
| `man40625/teikoku_hm` | `2280003` | `(5.713, 20.099, -705.471, 1.591)` | hoplomachus combat position |
| `man40625/teikoku_hf` | `2280006` | `(4.897, 20.049, -702.149, 1.449)` | sagittarius combat position |
| `man40645/PC` | player | `(265.470, 56.408, -799.867, -1.654)` | cave aftermath entry |
| `man40650/EmpireBoss_EM` | `1500131` | `(226.362, 62.012, -787.956, 2.381)` | cave vision speaker |
| `man40650/PC` | player | `(-205.201, 18.645, -680.202, 2.266)` | post-vision public staging |

The seven public Resistance positions are derived from the `man40600` room layout using Minfilia's cutscene/public offset. Their persistent quest actor classes are `1000477`–`1000483`; the cutscene substitutes `1001241`/`1001242` for two scene appearances.

## Pursuit and battle reconstruction

`futures_perfect_imperial_pursuit.json` carries 13 waypoints over `152.9` yalms at speed `2.0`, an estimated `76.4` seconds. Its recovered endpoints come from `man40620` and `man40625`; intermediate Silvertear-road points are bounded reconstruction guided by the footage. Rebuild/audit it with:

```text
python tools/derive_man406_imperial_pursuit.py --write
```

The pursuit formation is:

- Imperial hoplomachus `2280003` (lead)
- Imperial sagittarius `2280006`
- Imperial centurion `2207001`

They are path-companion presentation actors, not hostile allies. They wait when the owner falls behind, have no distance-failure condition, and are replaced at the destination by the battle roster:

| Enemy | Actor class | BNPC profile | Level | HP | Skill list |
| --- | ---: | ---: | ---: | ---: | ---: |
| Imperial juggernaut | `2202401` | `32716` | `50` | `14,874` | `45` |
| Imperial centurion | `2207001` | `32717` | `50` | `6,200` | `91` |
| Imperial hoplomachus | `2280003` | `32718` | `50` | `5,600` | `91` |
| Imperial sagittarius | `2280006` | `32719` | `50` | `4,800` | `87` |

Actor identities and the juggernaut's level are recovered. HP and humanoid skill-list tuning are server-side balance reconstruction and should be adjusted after live combat timing tests, not treated as exact retail stat extraction.

## Recovery and cleanup

- Quest flag `7` persists the pursuit/battle boundary. Re-entering at sequence `15` resumes the battle if the pursuit already completed; otherwise it restarts the pursuit.
- Sequence `20` can recreate the private area directly at the cave. This covers disconnects, content expiry, or an interrupted chained aftermath.
- The instance uses quest reentry policy. The owner is the only quest state advanced; accompanying players are director/content members without having their independent quest journals mutated.
- Every party helper is returned to Camp Revenant's Toll after `pE30`; only the marked content owner enters the cave. Sequence-20 recovery is owner-only, matching the retail requirement to disband before interacting with the children and continuing the Echo sequence.
- Player death, leaving the battlefield, missing owner/quest, route failure, spawn failure, or the 45-minute timeout runs one cleanup path and returns the party to the public retry location.
- Victory is determined by polling all four unique enemy IDs; the legacy kill callback is intentionally not authoritative.
- Cave children `1000957`–`1000961` and triggers `1090191`/`1090192` are delivered with talk/push-capable actor classes.

## Delivery and test surface

Implemented files:

- `Data/scripts/quests/man/man406.lua`
- `Data/scripts/content/SimpleContentMan40601.lua`
- `Data/scripts/directors/Quest/QuestDirectorMan40601.lua`
- `Data/escortnavmesh/futures_perfect_imperial_pursuit.json`
- `tools/derive_man406_imperial_pursuit.py`
- `tools/decompile_man406_cutscene_setup.py`
- `tools/validate_futures_perfect_man406.py`

SQL/runtime delivery:

- seven Resistance talk actors and public Waking Sands spawns;
- Revenant's Toll entry trigger class/spawn and private cave trigger class;
- five talk-capable child classes;
- four level-50 BNPC profiles;
- quest `110019` removed from the generic scaffold and added to the implemented allowlist;
- main-scenario cap advanced from `110018` to `110019`.

GM checkpoints:

```text
!questcomplete man406 briefing
!questcomplete man406 entry
!questcomplete man406 companion
!questcomplete man406 pursuit
!questcomplete man406 combat
!questcomplete man406 cave
!questcomplete man406 return
!questcomplete man406 turnin
```

`companion` stages sequence `10` at the public Revenant's Toll trigger so the
retail `pE15` / `man40615` Path companion departure scene owns the content
transfer. The recovered `pE15` already ends in
`QuestBaseClass.startFadeInCutSceneAfterWarp`; that source event must remain
owned until the matching hard warp is published. Sequence-`15` pursuit recovery
enters directly and does not manufacture a second destination-side finalizer.

Earlier `questBaseRewardSeting` testing ran under the wrong lifecycle and was
misdiagnosed. The `Functor::GetArguments_` trace came from direct PlayerBase
native delegation, not from proof that the stock QuestBase wrapper was invalid.
The owner-`0x0` trace came from a timeout retry after the active notice was gone.
The final path therefore calls the stock wrapper only inside the active
destination notice and never retries a movie or fade delegate without an owner.

Several 2026-08-22 live traces narrowed the persistent overlay below scene asset
loading. The quest delegate returned successfully, the client acknowledged the
destination snapshot with `0x0007`, sent movement, and played `man40620` audio,
but the `Now Loading` desktop mode stayed above the scene. Exact experiments
with E2 mode, DeleteAll/EventFinish order, a SetMap phase delay, and suppression
of an intervening type-`0x65` follow-up produced no visible change and were
reverted. They are eliminated hypotheses, not part of the current contract.

The `12:53` trace proved that assigning `charaWork.currentContentGroup` is not
itself a loading-clear operation. Comparison with the working Man0u102 duty
identified the missing order: director membership before transfer, destination
`onZoneIn` acknowledgement and loading clear, then content-group publication.
The earlier `onZoneIn` experiment failed because it reused the acknowledgement
event for movie playback instead of keeping those lifecycles separate.

Man406 now defers content-group membership through the hard transfer, clears
loading through the destination acknowledgement, and starts `man40620` later
through `imperialsWithdraw`. Since no warp follows `man40620`, its conditional
wrapper uses `processEvent020(true)` and the ordinary fade-in; `false` would arm
another after-warp reference with nothing to release it.

The 14:29 recovery trace exposed the remaining duplicate owner: sequence 15 had
skipped pE15 but still delegated `processAfterWarpFadeOutGeneral`. Unlike the
09:59 recovery trace, that run never emitted the destination type-`0x50` notice,
and `man40620` played audio beneath `Now Loading`. The synthetic wrapper is now
removed. Recovery closes the source event before `DoZoneChangeContent`; the hard
transfer owns loading, and the destination movie has only one matching reference
to release. Live visual confirmation of this combined repair is pending.

An exact one-shot suppression of the intervening type-`0x65` source-event
follow-up executed in the `12:14:06` trace and produced absolutely no visible
change. That hypothesis was therefore removed; the ordinary missing-owner
recovery path remains in force.

The same run proved that the apparent cutscene repetition was a second concrete
failure. Exiting the hidden `man40620` scene let the director start its pursuit,
but escort actor publication used a non-blocking transport gate and lost a race
with an active flush (`startFailed=publish actor=2280003`). Battlefield failure
then reset sequence 15, returned the player to the public trigger, and started a
new instance and opening scene. Critical escort startup now waits for the short
transport gate instead of failing the duty on that transient race.

Disconnect re-entry has a second timing constraint. `ReconnectPlayer` replaces
the offline `Player` object in the existing content director, but Man406's
`main()` coroutine previously retained its original object and a replacement
player's empty quest-fight timestamps were treated as immediately landed. The
director now rebinds the current member object on every loop and restarts its
landing delay. `Player.IsQuestFightLandingReady()` also requires the replacement
session to be out of zone change with actor visibility acknowledged before the
director may resume `man40620`.

Together We Stand/Man206 has a structurally similar early group-replacement
path and remains a follow-up audit candidate. This Man406 repair deliberately
does not change Man206 behavior.

Static verification:

```text
python tools/decompile_man406_cutscene_setup.py
python tools/derive_man406_imperial_pursuit.py
python tools/validate_futures_perfect_man406.py
python tools/validate_quest_availability.py
```

The decomp and static validators prove the recovered files and cross-layer wiring. Final retail parity still requires a live server/client pass through party entry, route movement, combat duration, the `pE30` HQ chain, cave interaction, and Goobbue/reward completion.
