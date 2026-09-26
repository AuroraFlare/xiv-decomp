# City-Airship Decomp Closure — 2026-08-24

This is a fresh read-only decode of the installed FFXIV 1.23 client, performed
after live validation of the Limsa Lominsa, Gridania, and Ul'dah airship loop.
It replaces the earlier synthetic-probe assumptions with the recovered retail
execution chain.

## Reproduce

```powershell
python tools/decompile_airship_cutscene_setup.py
```

The LPB bytecode was independently decoded from the installed
`client/script` tree with `meteor-decomp-0.1.4/tools/decode_lpb.py` and
decompiled with `unluac_2015_06_13.jar`.

## Exact Cutscene Call Chain

The relevant shipped client methods compose as follows:

```text
PopulaceFlyingShip noticeEvent owner
  -> DirectorBaseClass.delegateEvent(player, DftSrt, "eventDeparture", departure, arrival)
     -> DftSrt.eventDeparture(player, invokingOwner, departure, arrival)
        -> startFadeOutCutSceneDefault(player)
        -> startNQCutScene(departure, 1)
        -> startNQCutScene(arrival, 1) when non-nil
        -> startFadeInCutSceneAfterWarp(player)
```

`DirectorBaseClass.delegateEvent` calls the selected target's `_callFunction`
with `(methodName, player, invokingOwner, ...)`. This proves the recovered
`DftSrt.eventDeparture(A0, A1, A2, A3, A4)` argument meanings:

- `A0`: `DftSrt` quest/scenario actor (`self`)
- `A1`: player
- `A2`: invoking event owner
- `A3`: departure scene key
- `A4`: optional arrival scene key

`QuestBaseClass.startNQCutScene` creates a cutscene actor for the supplied
scene key, starts type `61` in mode `1`, waits for its return, and deletes the
cutscene actor. The two calls are therefore sequential and blocking.

This also explains the failed direct implementation: `startNQCutScene` is a
`QuestBaseClass` method, while `PopulaceFlyingShip` inherits `NpcBaseClass`.
A raw `startNQCutScene` event function sent to the attendant has the wrong
client-side owner and returns without visible playback. Delegating to `DftSrt`
is the retail owner transition.

## Fade Contract

- `startFadeOutCutSceneDefault`: `_fadeOut(1)`, then `_waitForFading()`.
- `startFadeInCutSceneAfterWarp`: `_fadeInAfterWarp()` outside the client test
  zone; the test-zone fallback uses the normal map-loaded fade-in.
- `DftSrt.eventDeparture` brackets both scenes with those calls.

## Six Physical `zep0` Assets

All source files passed exact byte-size and SHA-256 checks. Every scene has one
actor dictionary, one `setup` stream, actor `1200090` labelled `Airship`, and
pilot actor `1001781` labelled `sentyou`.

| scene | city | role | actors | initial placements | all placements |
| --- | --- | --- | ---: | ---: | ---: |
| `zep0g000` | Gridania | departure | 8 | 5 | 16 |
| `zep0g010` | Gridania | arrival | 11 | 3 | 8 |
| `zep0l000` | Limsa Lominsa | departure | 14 | 6 | 14 |
| `zep0l010` | Limsa Lominsa | arrival | 14 | 3 | 10 |
| `zep0u000` | Ul'dah | departure | 15 | 4 | 15 |
| `zep0u010` | Ul'dah | arrival | 15 | 3 | 11 |

The actor dictionaries independently confirm city ownership:

- Gridania arrival includes Lionnellais `1500055` and Hida `1500056`.
- Limsa scenes include L_Nophlo `1500206` and Wineburg `1500207`.
- Ul'dah scenes include Stangyth `1500208` and Lunnie `1500209`.

The hash-anchored SCB census in the adjacent
`airship_ferry_region_resource_data_20260621/zep0_cutscene_timeline.csv`
establishes every outer scene as 9 seconds. Authored block labels identify all
`*000` scenes as boarding/startup/departure and all `*010` scenes as city
arrival/port entry. A complete trip is therefore 18 authored seconds before
loading and fade overhead.

## Dock Scheduler Finding

Fresh LPB bytecode reproduces the original `MapObjShipPort` contract:

- City layouts `131`, `321`, and `431` share the same 300-second cycle.
- `stt0` is active from cycle seconds `110..129`, with offsets `0..19`.
- `end0` is active from seconds `140..159` and is deliberately clamped to
  offset zero throughout that window.
- The call occurs from `MapObjShipPort.initForEvent` through
  `_runBgSchedulerFromMidstream`, not through a synthetic attendant event.

The stock client ignored the later server-sent event-function form during live
testing but accepted the legacy BG-animation packet. The production adapter
therefore sends the proven legacy animation first and keeps the recovered
midstream call as an optional phase correction for compatible clients.

## Fresh LPB Integrity

The following freshly decoded bytecode hashes matched the existing recovered
Lua sources exactly when decompiled with unluac:

| class | SHA-256 |
| --- | --- |
| `DftSrt` | `72762BFBE567A34AF198BCF342F42581E2CE83ABB65A46A034A5472FE35A17E7` |
| `PopulaceFlyingShip` | `702D5B7F4B3F4F5674FC6E525A442C5843B1F8EDBAA30295A80EC28776A62AEA` |
| `MapObjShipPort` | `74FF78C013CB389E77314F77F00CDB5CE8D7D065889D1F35E1B78CA55E755FB8` |
| `MapObjShipRouteLand` | `9FDBFE23FA56D493849FD09A83DCB40CFE1C121A47F20A04F703D04702BFC74E` |
| `MapObjPortDoor` | `A7179C5DF6E5B021BEB7EE5C655772C49872C1EEF6D57C1D0696C7609B286D65` |
| `QuestBaseClass_common` | `9379EE6832BDFA542273C7F43F065D7A15F9A730D9EF244BE9A565A1FAA53504` |
| `DirectorBaseClass` | `B63CD23139DC84B4E3C9D713C01278EE1D83F45A3658BA7587EEC66AF81BA93B` |
| `NpcBaseClass` | `1941C40B64CACD721D271B36E31017A24F908B8EA518F713B44DA17BB4E57627` |

## Outputs

- `scene_inventory.csv`: validated scene sources, hashes, setup offsets, and
  record counts.
- `actor_dictionary.csv`: all 77 exact cutscene actor records.
- `spatial_records.csv`: all 74 structurally valid transforms, classified as
  initial setup or later timeline placement.
- `manifest.json`: machine-readable inventory and boundary statement.
- `luac/`: the fresh installed-client LPB decodes used for the integrity pass.

These transforms belong to cutscene actors. They are not persistent world
spawn coordinates and should not be copied into server spawn tables.
