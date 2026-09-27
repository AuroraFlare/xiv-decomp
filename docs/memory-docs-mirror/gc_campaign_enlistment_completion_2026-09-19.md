# Grand Company campaign and enlistment completion

This pass implements the six requested level-25 Grand Company campaigns and
the three following enlistment quests. It deliberately skips the three Ifrit
quests (111416/111616/111816), keeps every offer disabled, and does not update a
live database or restart a server.

## Offline route status

| ID / code | Route now implemented | Evidence boundary |
|---|---|---|
| 111405 / Com0l5 | Three owned Unruly Raiders; Merlwyb and Urianger in either order; Zanthael's accepted lift; Bridge audience with Y'shtola; proof-item completion | Pirate identity, named owners, method order, compound elevator scene, Bridge layout and proof item are recovered. Three actors, formation, neutral facing and combat tuning are authored. |
| 111406 / Com0l6 | Four exact Immortal actors; Aisborgsyn; public `com0l510` scene with payload 1/default fade; Cid at the airship landing | Roster, owners, marker X/Z, scene payload and dialogue branches are recovered. Formation and numeric tuning are authored; the history producer is inferred from completed sibling campaigns. |
| 111605 / Com0g5 | Gridanian ceremony/address; Papalymo's three-part Earthbreaker briefing; one Clay Golem; item-menu weakening; Papalymo's three field segments followed by Urianger | One golem, Earthbreaker item/menu use, dialogue order and exact method arity are recovered. The reusable item policy and 50% vulnerability are authored because consumption, strength and duration were not recovered. |
| 111606 / Com0g6 | Stillglade entry; Lewin baseline introduction; three owned Diremites; exact uppercase `COM0G510` aftermath/default fade; Cid report | The quest's native scene casts identify Diremites, but the combat roster itself was not recovered. Ordinary variants, count, formation and tuning are explicitly authored. Native Cid branches are exact; their sibling-completion producer is inferred. |
| 111805 / Com0u5 | Three owned pirates; Thancred and Urianger in either order; Aubrey; Royal Promenade `com0u610` ceremony/after-warp handoff; Thancred proof-item completion | Pirate identity, owners, order, two proof items and scenes are recovered. Count, formation, neutral facing and combat tuning are authored. |
| 111806 / Com0u6 | Engineer briefing; owned Charledore battle; `com0u510` payload 1/after-warp aftermath; Cid report | Charledore's unique native class/name and director support the scoped restoration. Its server profile uses a documented gladiator analog; exact historical stats are not recovered. |
| 111407 / Com0l7 | Numeric confirmation, saved acceptance, Maelstrom join, finish widget, 1,000 seals and 1,080 EXP | Exact client start/end methods and company transaction are used. |
| 111607 / Com0g7 | Numeric confirmation, saved acceptance, Twin Adder join, finish widget, 1,000 seals and 1,080 EXP | Exact client start/end methods and company transaction are used. The copied Baderon marker is not published as Fulke. |
| 111807 / Com0u7 | Numeric confirmation, saved acceptance, Immortal Flames join, finish widget, 1,000 seals and 1,080 EXP | Exact client start/end methods and company transaction are used. |

Campaign field-NPC and trigger progression handoffs bind quest data, sequence,
player session, actor, area, zone and floor before accepting a continuation.
Offer calls bind quest data, sequence and player session. A stale coroutine
cannot advance or close a replacement event. Named private rooms have explicit
entry and return paths. The Bridge exit remains available after abandonment or
completion by using the native `ObjectEventDoor` client class and native fallback ask.
Reward/item checkpoints allow inventory or completion retries without paying
currency or EXP twice.

Earthbreaker is bound to the exact owned, living RootsLake golem through actor
temporary state written by the persistent quest-battle director. The item path
also checks owner, current quest/sequence, connected battle session, area,
unique actor lookup, range and physical item possession. The effect is removed
with the owned actor at encounter cleanup; it does not alter shared golems.

## Placement evidence

The accepted Limsa and Gridania standing captures, capture-log excerpt, raw
zone 130/154 snapshots, hashes and rejected temporary-height samples are frozen
under `Data/quest_npcs/evidence/gc-campaign-floor-20260919/`. `review.json`
records all ten selected snapshot-local nodes, authored X/Z, transferred Y and
nearest horizontal distance. The SQL builder recalculates those selections,
checks both snapshot hashes, rejects the manifest-listed bad nodes, and verifies
that every reviewed SQL spawn or Lua target still uses the selected floor.

- Com0l5 keeps native public X/Z. Its battle entry is supported 0.094 yalm from
  node 4074; the farthest of its three authored enemy homes is 2.289 yalms from
  its selected node. Named field contacts use individual nearby node Y values.
- Com0g5 keeps native public X/Z and the user's corrected 0.124968 standing Y;
  the rejected upper-floor pass is excluded. The golem uses node 3710 Y at
  0.625 yalm, and both field contacts use individual nearest-node Y values.
- Com0l6 and Com0g6 use nearby recorded support already present at their native
  anchors; the widest current enemy-support distances are about 7.644 and 7.207
  yalms respectively.
- Com0u5 places its three pirates directly on recorded nodes 8618, 8620 and
  8622. Com0u6 places Charledore on recorded node 6763, 9.263 yalms from the
  retained native entry marker.
- Airship landing heights come from the existing lift destinations. The Bridge
  Y is derived from the recovered `prv_s0_hal01` layout root. These are not
  recovered retail NPC or enemy XYZ, facing, or client acceptance.

Captured player rotation is never imported as enemy facing. All campaign enemy
rotations remain neutral authored values pending client review.

## Main data and runtime artifacts

`tools/build_gc_campaign_encounters.py` owns the reproducible main-SQL layer:
native actor-class restorations, scoped trigger classes, appearances, authored
mob profiles, public/private spawn rows and the Bridge private-area host. It
repairs canonical actor tuples directly so the Python updater sees the complete
state. Urianger's existing opening-quest visibility and native event envelope
are preserved while the new routes are merged.

`gc_campaign_quest.lua`, `gc_campaign_battles.lua` and the six dedicated
directors own the route and battle lifecycle. `gc_campaign_item_objectives.lua`
owns the Earthbreaker check. `gc_enlistment_quest.lua` owns the three join
transactions. `validate_gc_campaign_events.py` checks every configured native
method name and payload arity against the recovered decompilation and separately
checks the case-sensitive private-story scene literals.

## Validation

```powershell
python tools/build_gc_campaign_encounters.py check
python tools/validate_gc_campaign_events.py
dotnet run --project tools/gc-campaign-runtime-tests/GcCampaignRuntimeTests.csproj -p:NuGetAudit=false --no-restore
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj -p:NuGetAudit=false --no-restore
```

The focused suite currently passes 53 assertions across all six battle
contracts, all six dialogue routes, pair ordering, private/public handoffs,
history payloads, proof-item rewards, stale-session rejection, Earthbreaker and
enlistment retry. The combined Grand Company runtime suite passes 2,541
assertions. The only focused-run diagnostic is the cached NU1900 advisory-feed
warning while the network source is unavailable.

This is an offline implementation result. Offers remain disabled, no live SQL
was applied, and no client playthrough has accepted combat balance, scenes,
NPC visibility, room navigation, items or final presentation.
