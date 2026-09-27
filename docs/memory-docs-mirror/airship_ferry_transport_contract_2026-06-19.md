# Airship/Ferry Transport Contract - 2026-06-19

> Ferry update, 2026-09-16: both native vessel timelines and the notice/lifecycle
> protocol are now audited in [ferry_cutscenes_2026-09-16.md](ferry_cutscenes_2026-09-16.md).
> It supersedes the ferry dispatch/disabled-movie status below. The latest
> user-requested correction also replaces exterior disembarkation positions with
> the inside-dock boarding pads at both destinations; explicit gate exits remain
> separate. Both departure movies now have live acceptance. The offline
> correction still requires both-direction live playback and skip acceptance.

## Executive Summary

This pass closes the `airship_ferry` missing recovered Lua bucket at the contract level and folds in the related ferry port door surface.

| metric | value |
| --- | --- |
| sources_present | 27/29 |
| airship_ferry_backlog_rows | 10 |
| function_contracts | 89 |
| surface_parity_rows | 9 |
| actor_class_rows | 18 |
| spawn_binding_rows | 22 |
| route_rows | 12 |
| local_gaps | 6 |

## What This Found

- The recovered transport objects are mostly thin shims: ground-off actors, identity map objects, and scheduler drivers.
- Local coverage is stronger than the old batch readme suggested: `MapObjPortDoor`, `MapObjShipPort`, `MapObjShipRouteLand`, `ObjectShip`, `ObjectAirShip`, `CompanyShip`, and `PopulaceFlyingShip` all have local scripts.
- The important recovered visual contracts are the ship-port `spin`/`spot`/`stt0`/`end0` cycle and ferry route-land `fdot`/`fdin` cycle.
- Local `WorldManager` has a real route backend: route IDs, fare/consumable-pass resolution, passenger queues, departure cutscene events, arrival movement, and ferry exit/cancel support.
- City-airship passenger departure is now aligned to recovered visual cycle second `150`; the six 900-second directed routes retain their `0/300/600` edge phases. Installed SCB labels confirm the paired `zep0*` scene roles; the remaining city-airship risk is live-client playback and landing-platform presentation.

## 2026-08-24 City-Airship Completion Pass

- Layouts `131`, `321`, and `431` now invoke the recovered `stt0`/`end0` schedulers through `_runBgSchedulerFromMidstream`, including exact whole-second phase offsets. Layouts `391`/`491` and ferry layouts retain their recovered `spin`/`spot`/`fdot`/`fdin` branches.
- Routes `101-106` now carry physical installed-client scenes: origin `zep0l000`/`zep0g000`/`zep0u000`, followed by destination `zep0l010`/`zep0g010`/`zep0u010`. The installed PWIB/SEDBSCB timelines are each 9 seconds; `*000` blocks are authored as boarding/startup/departure and `*010` blocks as city arrival/port entry. This also supplies the missing Ul'dah evidence. The server sends both keys in the departure event; `PopulaceFlyingShip.lua` delegates them to the recovered `DftSrt.eventDeparture` wrapper, which fades out, awaits both NQ scenes in order, and fades in after warp. The route completes only after that delegated client call returns. The 60-second arrival timer safely exceeds the 18 authored seconds and remains a fail-safe if the client callback never returns.
- The invalid `airship_depart_*` symbolic names are no longer sent.
- `Etc3g3` and `Etc3u3` now grant their displayed airship-pass items. Routes treat those as consumable tickets, so the quest trip costs no gil and consumes the one-use pass instead of granting a permanent free-travel entitlement.
- Focused runtime contracts cover every visual boundary, the native scheduler packet, all six direction/menu/scene mappings, route phases and lock boundary, departure payload order, the `DftSrt.eventDeparture` delegate contract, both quest pass grants, exact one-use ticket resolution/removal, atomic/idempotent post-cutscene route completion, and the 60-second fallback arrival claim when the client callback is absent. The client handler now fails closed when `DftSrt` cannot be resolved: it never retries `startNQCutScene` on the wrong populace owner and leaves the passenger queued for the bounded server fail-safe. Live UAT on 2026-08-24 confirmed the delayed Gridania `stt0` platform lift, `end0` close, Gridania-to-Ul'dah paired cutscenes/landing, and Ul'dah-to-Limsa paired cutscenes/landing. Server traces showed one owner-correct `delegateEvent` call per trip and an empty passenger queue after arrival.

## 2026-08-25 Limsa/Thanalan Ferry Completion Pass

- Ferry-port confirmation now registers the player at the physical dock. At the scheduled departure boundary, the server moves the reservation to the appropriate end of `sea1Cruise01`, preserves it through that internal zone change, keeps the player aboard for the approximately nine-minute retail voyage, and then disembarks at the opposite dock.
- Temporary UAT override (2026-08-25): ferry passenger departures and both recovered ferry ship-port layouts (`196`/`496`) repeat every 60 seconds, remain docked for 30 seconds, and lock registration five seconds before cast-off. Restore the recovered `600`-second cycle, `180`-second boarding boundary, and `15`-second lock after testing. The playable 540-second voyage remains unchanged.
- Logout, Teleport, Return, and unrelated warps remove the ferry reservation, matching the supplied capture's passenger-list text. Only the server-owned dock-to-`sea1Cruise01` transition preserves it.
- Ferry departures no longer attempt the airship-only `DftSrt` cutscene handoff. The earlier null ferry event left reservations queued forever.
- Retail ferry NPCs Fiachre, Spiraling Path, Sylviel, Sami Gamduhla, and Gerland now use captured zone-172 dock transforms while retaining their actor classes, appearances, and recovered `DftWil` dialogue.
- Sylviel now follows her recovered entrance greeting with a ferry-registration confirmation. Accepting uses the normal free 1.0 passenger-list flow, moves the player to the captured zone-172 waiting point `(-2187.191, 14.600, -400.850, -0.047)`, and queues route `204`; the physical entrance gate uses the same handoff.
- Limsa-to-Thanalan arrivals and manual exits at the Thanalan endpoint now disembark at the captured zone-172 transform `(-2181.066, 14.600, -415.158, 3.141)`.
- Western Thanalan now has a `MapObjShipPort` owner bound to the installed-client `wil_w0_lin01` vessel (`496/456`), and the recurring visual loop includes both ferry dock zones `172` and `230`, so the temporary 60-second `spot`/`spin` cycle continues after initial spawn.
- Both onboard steersmen (actor class `1001291`) now resolve through `DftSrt.defaultTalkWithPilot_001`. The direction-matched steersman announces text row `2` after boarding and row `3` (Limsa Lominsa) or `4` (Vesper Bay) thirty seconds before automatic arrival.
- Route `204` and paired `MapObjPortDoor` actors add the previously missing Western Thanalan-to-Limsa boarding/cancel path. Routes `202/203` remain the direction-aware onboard door routes.
- `!testferryroute 201` and `!testferryroute 204` bypass only the dock wait for live UAT; the playable voyage retains its normal duration. The Western Thanalan door transforms and both outdoor arrival transforms remain explicitly marked as fallback/live-probe coordinates.

### Supplied video evidence

| capture | implementation evidence |
| --- | --- |
| [FFXIV boat ride](https://www.youtube.com/watch?v=WIv-2rg9e1U) | Free movement on deck, live rain/lightning, steersman presence, and retail passenger-list rules shown in system text. |
| [Firefall Faire Ferry Ride](https://www.youtube.com/watch?v=45gbgPScC8E) | Supplemental ride capture for event-era onboard presentation. |
| [Thunderstorm Ship Ride](https://www.youtube.com/watch?v=ELXSbTC7MC0) | Confirms that normal zone weather remains visible during the voyage. |
| [Limsa Lominsa to Ul'dah](https://www.youtube.com/watch?v=scHMpuM0Brk) | Outbound playable deck and coastline approach corroborate the Limsa-to-Thanalan direction. |
| [I'm on a Boat](https://www.youtube.com/watch?v=JsHAsry1clA) | Longer supplemental capture used to check that the ride is a playable zone, not one continuous cutscene. |
| [Thanalan to Limsa Lominsa](https://www.youtube.com/watch?v=hcF_aTvDMtU) | Physical dock wait, loading transition at departure, playable cruise, approaching Limsa coastline, and automatic disembark; the description places the ride at about nine minutes. |
| [Infinite BOT Ship Glitch](https://www.youtube.com/watch?v=YMWvCoYdbZI) | Failure-mode evidence that cruise visuals can continue without a successful server-owned arrival transition. |

## Top Backlog Rows

| normalized | priority | category | classes | status |
| --- | --- | --- | --- | --- |
| chara/npc/object/objectairship/objectairship.lua | 75 | chara/npc/object | ObjectAirShip | covered_this_pass_contract |
| chara/npc/object/objectship/objectship.lua | 75 | chara/npc/object | ObjectShip | covered_this_pass_contract |
| chara/npc/mapobj/companyship/companyship.lua | 71 | chara/npc/mapobj | CompanyShip | covered_this_pass_contract |
| chara/npc/mapobj/mapobjshipport/mapobjshipport.lua | 71 | chara/npc/mapobj | MapObjShipPort | covered_this_pass_contract |
| chara/npc/mapobj/mapobjshiprouteland/mapobjshiprouteland.lua | 71 | chara/npc/mapobj | MapObjShipRouteLand | covered_this_pass_contract |
| director/shipdirector.lua | 63 | director/shipdirector.lua | ShipDirector | covered_this_pass_contract |
| director/shipdirector/shipdirector.lua | 63 | director/shipdirector | ShipDirector | covered_this_pass_contract |
| chara/npc/populace/populaceflyingship/populaceflyingship.lua | 55 | chara/npc/populace | PopulaceFlyingShip | covered_this_pass_contract |
| chara/npc/savenpc/companyshipsavenpc.lua | 55 | chara/npc/savenpc | CompanyShipSaveNpc | covered_this_pass_contract |
| chara/npc/savenpc/companyshipsavenpc/companyshipsavenpc.lua | 55 | chara/npc/savenpc | CompanyShipSaveNpc | covered_this_pass_contract |

## Surface Parity

| surface | localExists | localStatus | parity |
| --- | --- | --- | --- |
| ObjectAirShip | True | present_thin | Recovered only turns ground off; local has a no-op event shell. Verify bind init return flags cover non-ground behavior. |
| ObjectShip | True | present_partial_visual | Recovered runs chara scheduler 67731456 for actor classes 1200020/1200021; local plays map-object animation 'ship'. |
| CompanyShip | True | present_identity | Recovered initForEvent is empty; local no-op mapobj identity is enough unless later args are found. |
| MapObjPortDoor | True | present_adapter | Recovered eventIn/eventOut return booleans; local calls the client functions and dispatches WorldManager ferry routes. |
| MapObjShipPort | True | present_visual_midstream | Local reproduces layout-driven spin/spot/stt0/end0 selection and sends the recovered whole-second midstream offsets through `RunMapObjScheduler`. |
| MapObjShipRouteLand | True | present_visual_midstream | Local reproduces layout 5145 fdot and other fdin selection with the recovered whole-second midstream offsets. |
| PopulaceFlyingShip | True | present_route_adapter | Local delegates recovered client functions and adds WorldManager route, quest, fare, ticket, and departure support. |
| CompanyShipSaveNpc | False | missing_identity | Recovered only calls SaveNpcBaseClass._onInit; add a tiny identity shim if class-path binding appears in local SQL/spawns. |
| ShipDirector | False | missing_identity | Recovered init is empty; local route backend currently bypasses this director identity. |

## Actor/Class Binding Summary

| actorClassId | classPath | localScriptExists | spawnCount | mapObjBindingCount |
| --- | --- | --- | --- | --- |
| 1200020 | /Chara/Npc/Object/ObjectShip | True | 0 | 0 |
| 1200021 | /Chara/Npc/Object/ObjectShip | True | 0 | 0 |
| 1500003 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1500055 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1500056 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1500207 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1500208 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1500209 | /Chara/Npc/Populace/PopulaceFlyingShip | True | 1 | 0 |
| 1001291 | /Chara/Npc/Populace/PopulaceStandard | True | 2 | 0 |
| 5000106 | /Chara/Npc/MapObj/CompanyShip | True | 0 | 0 |
| 5000107 | /Chara/Npc/MapObj/CompanyShip | True | 0 | 0 |
| 5000108 | /Chara/Npc/MapObj/CompanyShip | True | 0 | 0 |
| 5000109 | /Chara/Npc/MapObj/CompanyShip | True | 0 | 0 |
| 5900010 | /Chara/Npc/MapObj/MapObjPortDoor | True | 3 | 2 |
| 5900011 | /Chara/Npc/MapObj/MapObjShipPort | True | 6 | 6 |
| 5900012 | /Chara/Npc/MapObj/MapObjPortDoor | True | 3 | 2 |
| 5900013 | /Chara/Npc/MapObj/MapObjShipRouteLand | True | 1 | 1 |
| 5900014 | /Chara/Npc/MapObj/MapObjShipRouteLand | True | 1 | 1 |

## Scheduler Contract

| surface | status | recovered_rule | local_rule | gap |
| --- | --- | --- | --- | --- |
| ObjectShip | partial_probe_needed | If actorClassId is 1200020 or 1200021, run chara scheduler 67731456. | If actorClassId is 1200020 or 1200021, play map-object animation 'ship' on spawn/event. | Numeric chara scheduler is approximated by a named BG animation; visual equivalence still needs a live probe. |
| MapObjShipPort 131/321/431 | implemented_runtime_probe_pending | 300-second cycle. Around half-cycle -40..-20 play stt0 from midstream; around -10..+10 play end0. | Same windows call `RunMapObjScheduler`; stt0 carries elapsed seconds 0..19 and end0 retains the recovered frame-zero clamp. | Executable Lua contract passes for Limsa, Gridania, and Ul'dah; visible client playback still needs an in-game observation. |
| MapObjShipPort 196/496 | implemented_runtime_probe_pending | 600-second cycle. First half spot, second half spin. | Same layout/cycle rule with phase-preserving offsets 0..299; ferry passenger departures use the same 600-second period. | Exact retail departure phase remains a live-client observation. |
| MapObjShipPort default | implemented_runtime_probe_pending | 300-second cycle. First half spin, second half spot. | Same default selection with phase-preserving offsets 0..149. | Executable Lua contract covers checked-in Gridania/Ul'dah layouts 391/491; visible client playback remains to be observed. |
| MapObjShipRouteLand layout 5145 | implemented_runtime_probe_pending | 600-second cycle. Before second 240 run fdot from midstream with remaining offset. | Calls `RunMapObjScheduler("fdot", 240 - cycleSecond)`. | Executable Lua boundary contract passes; visible client playback remains to be observed. |
| MapObjShipRouteLand other layouts | implemented_runtime_probe_pending | 600-second cycle. From second 360 onward run fdin from midstream. | Calls `RunMapObjScheduler("fdin", cycleSecond - 360)`. | Executable Lua boundary contract passes; visible client playback remains to be observed. |
| PopulaceFlyingShip service branch | covered_by_client_function_delegate | When explaining services at actorClassId 1500208, run chara scheduler 70795264 and say text 9. | Server delegates eventIn to client PopulaceFlyingShip; recovered client owns this branch. | Verify the client function path receives the actual NPC actor so class-specific branch can fire. |

## Route Contract

| routeId | mode | origin | destination | phaseOffsetSeconds | status |
| --- | --- | --- | --- | --- | --- |
| 101 | Airship | Limsa Lominsa zone 133 actor 1500003 | Gridania zone 155 choice 2 | 0 | implemented_fallback_coords |
| 102 | Airship | Limsa Lominsa zone 133 actor 1500003 | Ul'dah zone 209 choice 3 | 300 | implemented_fallback_coords |
| 103 | Airship | Gridania zone 155 actor 1500055 | Limsa Lominsa zone 133 choice 1 | 0 | implemented_fallback_coords |
| 104 | Airship | Gridania zone 155 actor 1500055 | Ul'dah zone 209 choice 3 | 600 | implemented_fallback_coords |
| 105 | Airship | Ul'dah zone 209 actor 1500208 | Limsa Lominsa zone 133 choice 1 | 300 | implemented_fallback_coords |
| 106 | Airship | Ul'dah zone 209 actor 1500208 | Gridania zone 155 choice 2 | 600 | implemented_fallback_coords |
| 201 | Ferry | Limsa ferry dock zone 230 | Thanalan ferry dock zone 172 | 0 | implemented_fallback_coords |
| 202 | Ferry | sea1Cruise01 zone 200 noscea-to-thanalan door | Thanalan ferry dock zone 172 | 0 | implemented_fallback_coords |
| 203 | Ferry | sea1Cruise01 zone 200 thanalan-to-noscea door | Limsa ferry dock zone 230 | 0 | implemented_fallback_coords |
| 204 | Ferry | Western Thanalan ferry dock zone 172 | Limsa ferry dock zone 230 | 0 | implemented_fallback_coords |
| 301 | Ferry | ocn0Cruise01 ship_route_1 | unrecovered |  | blocked_unrecovered |
| 302 | Ferry | ocn0Cruise01 ship_route_2 | unrecovered |  | blocked_unrecovered |

## Local Gaps

| priority | gap | implementation_contract |
| --- | --- | --- |
| P1 | Ferry and airship coordinates are marked fallback | Probe exact retail boarding/arrival coordinates before treating route endpoints as final. |
| P2 | ObjectShip numeric scheduler is approximate | Probe actor classes 1200020/1200021 and keep the local alias only if it matches the visible ship animation. |
| P2 | CompanyShipSaveNpc and ShipDirector local identity shims are absent | Add no-op identity shims only when a spawn/class path or content script actually binds to them. |
| P3 | Ocean cruise routes remain unresolved | Recover ocn0Cruise01 ship_route_1/2 endpoints before enabling those routes. |
| P3 | PopulaceFlyingShip ticket edge cases need runtime confirmation | Test no-gil, free-pass, paid, cancel, and eventOut(30010) paths against the client dialog. |

## 2026-06-21 Open-Question Sync

- Real transport owner adapters are still `PopulaceFlyingShip.eventIn/eventOut` for airships and `MapObjPortDoor.eventIn/eventOut` for ferry doors. Visual classes such as `MapObjShipPort`, `MapObjShipRouteLand`, `ObjectShip`, and `ObjectAirShip` are scheduler/animation surfaces, not route-selection or cutscene authority.
- Recovered `PopulaceFlyingShip.eventIn` returns only the selected destination choice. Payment, route id mapping, queueing, and departure authority are local `WorldManager` behavior today, not recovered retail route rows.
- Airship route selection requires attendant actor class, origin zone, and returned city choice. Current route ids `101-106` are local `WorldManager` mappings with fallback coordinates; retail boarding and arrival coordinates remain open.
- Ferry route selection is contextual: zone `230` boards route `201`; zone `200` door side maps to `202/203`. Route id `200` is a zone/content identifier (`sea1Cruise01`), not a travel route.
- City-airship routes now use the installed `zep0*` departure/arrival family and are contract-tested. Hash-anchored SCB timeline labels confirm the `*000` departure / `*010` arrival interpretation for Limsa, Gridania, and Ul'dah; only visible playback and transitions remain live-client probe-gated. `DftSrt.eventDeparture(A3, A4)` remains a separate ferry question whose caller and concrete args are missing, so keep ferry cutscene wiring blocked except for a guarded `defaultTalkWithPilot_001` probe.
- No separate `PopulaceFerry` or `ShipDoor` surface was found in this pass. Ferry access is `MapObjPortDoor`; ferry steersman talk remains separate `PopulaceStandard`/`DftSrt` default-talk territory.
- Ocean/Rhotano routes `301/302` remain blocked until `ocn0Cruise01` `ship_route_1/2` endpoints are recovered. BG/layout tokens such as `art_*`, `srt_o0*`, and `ocn_o0_sip01` prove resources, not usable route endpoints.
- Use `!testbgscheduler` only against live instantiated map-object owners when checking visual ship/port phases; do not apply scheduler probes to attendants or actor-class ids.

## Implementation Contract

| order | area | action | acceptance |
| --- | --- | --- | --- |
| 1 | Visual schedule | Implemented and packet-tested; observe ObjectShip, MapObjShipPort, and MapObjShipRouteLand in a live client. | Animations visibly play the expected ship/port/ferry route visuals at the correct phase. |
| 2 | Transport schedule | Implemented: city airships retain their recovered schedule; ferries use the recovered 600-second visual period and a 540-second playable voyage. | Live departure/arrival behavior remains synchronized with visible ship movement. |
| 3 | Route endpoints | Replace fallback_marker coordinates as retail points are confirmed. | Airship/ferry board, exit, and arrival coordinates no longer depend on fallback notes. |
| 4 | Identity shims | Add CompanyShipSaveNpc/ShipDirector no-op scripts if class-path bindings are discovered. | No class-path fallback or script-load miss for ship save/director actors. |
| 5 | Ocean cruise | Recover/confirm ship_route_1 and ship_route_2 endpoints before enabling route IDs 301/302. | Cruise routes pass CanUseTransportRoute without unrecovered coordinates. |

## Probe Queue

| probe | setup | expectation |
| --- | --- | --- |
| Airship attendant paid route | Talk to Faezbroes/Lionnellais/Stangyth with enough gil and choose a non-current city. | eventIn returns destination choice, StartTransportRoute queues passenger, departure noticeEvent fires, then arrival warps. |
| Airship no-funds branch | Use an attendant with less than 5000 gil and no free pass. | Recovered eventIn nil ticketState path shows insufficient-funds text and no route starts. |
| Airship pass branch | Start `Etc3g3` or `Etc3u3`, then take its GRD-LMS or ULD-LMS route. | Quest grants item 11000208/11000209; ticketState true path displays pass confirmation, consumes the pass, and removes no gil. |
| Ferry port doors | Use zone 200 and zone 230 MapObjPortDoor actors 5900010/5900012. | Door1 boards/queues route; door2 exits/cancels and moves to current endpoint. |
| Ship port map-object phase | Observe layout IDs 131, 196, 321, 431, 496 through mapobj spawns. | spin/spot/stt0/end0 match recovered phase rules; note any midstream mismatch. |
| Ferry route-land phase | Observe layout 5144/5145 in sea1Cruise01 zone 200. | 5145 plays fdot before second 240; other direction plays fdin after second 360. |

## Generated Files

- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/README.md`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/contract_summary.json`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/airship_ferry_backlog_closure.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/high_value_airship_ferry_backlog.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/surface_parity_matrix.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/scheduler_contract.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/populace_flying_ship_contract.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/local_transport_api_surface.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/transport_route_contract.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/actor_class_summary.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/spawn_binding_matrix.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/stale_gap_supersession.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/airship_ferry_transport_contract_20260619/source_term_hits.csv`

## 2026-06-21 Owner/Visual Split Addendum

| Surface | Current read | Missing |
| --- | --- | --- |
| `PopulaceFlyingShip` | Real local owner adapter for airship attendant menu, route request, and paired `zep0*` scene launch; installed SCB labels confirm the departure/arrival interpretation. | Live-client proof that both scenes visibly play in order and transition cleanly to the destination. |
| Airship route ids | Local server ids `101-106`; payment/queue/departure owned by `WorldManager`. | Retail id mapping, exact cutscene args, and free-pass/no-gil edge captures. |
| `MapObjPortDoor` | Real ferry board/disembark prompt owner. | Full ferry steersman/default-talk bridge and route endpoint validation. |
| `DftSrt.eventDeparture` | Recovered ferry-cutscene-shaped helper. | No local caller, actor binding, or concrete `A3/A4` scene args; keep inert. |
| `MapObjShipPort`, `MapObjShipRouteLand`, `ObjectShip`, `ObjectAirShip` | Visual/animation/identity surfaces. | Do not treat as travel authority. |
| `CompanyShip` | Identity-only locally and recovered. | No transport behavior to wire. |
| `PopulaceCompanyWarp` | Distinct owner-routed company/aethernet warp surface. | Pass/eligibility needs server-owned checks; not airship/ferry evidence. |

Route ids `301/302`, `ocn0Cruise01`, `ship_route_1`, and `ship_route_2` remain blocked/unrecovered. Zone/layout/resource numbers such as `200`, `201`, and `252` are layout/resource facts, not transport route ids.

`CompanyShip` should stay identity-only unless a new binding appears. Current transport authority is `PopulaceFlyingShip` plus the route backend, not the company ship map-object script.
