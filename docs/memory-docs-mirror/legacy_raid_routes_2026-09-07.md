# Darkhold, Aurum Vale, and Cutter's Cry: populated runtime pass

> **2026-09-18 Cutter ground update:** both manifests trace the annotated 1.x
> maps room by room. Aurum map-only Y values remain floor fallbacks with
> `HeightResolved: false`. Cutter's 54 provisional homes now take Y from their
> nearest node in the frozen zone-246 recording; their map-authored X/Z remains
> unchanged. Native layout anchors, sands, and hazards retain their exact XYZ.

Aurum Vale and Cutter's Cry now load default routes on ordinary entry. They no
longer require a GM to place every enemy, circle, coffer, or sand trigger. Darkhold
already had an automatic route; this pass fixes its clear ordering and reward
retries. This is an implementation candidate for live acceptance, not a claim
that every original retail position or native-client interaction has been verified.

## What runs automatically

| Dungeon | Added or completed in this pass |
| --- | --- |
| Aurum Vale | 100 route entries: the map-labelled entry and Golden Pools wasps; both stage-two routes and imperial rooms; Vale Efts and the Poisoned Peasant; Coincounter and Miser; stage-three trash; all six map-labelled regular coffers; five barrier terminals; three section transporters; Gold Lung rooms; shared fruit/root interactions; and automatic slug/imperial reward conditions. Ninety-two entries still need recorded floor heights. |
| Cutter's Cry | 70 route entries: opening packs; both first-room party branches; the converged middle rooms; Princess, late cactuars, corridor, and Chimera; six regular coffers; seven shifting-sands links; two explicit HP/MP sand hazards; and exact layout-415 sand/entrance anchors. All 70 entries now have recorded or native floor support. |
| Dzemael Darkhold | Preserve the populated route and boss mechanics. Defer clear presentation until lethal-result/death/resource packets finish; retry failed reward-coffer publication; reserve concurrent coffer publication; preserve loot when inventory space runs out. |

Both new routes feed the existing encounter managers. The Princess's timed colony
and Marshal behavior, Chimera's parts and scavenger phase, Coincounter's topple and
Animal Instinct follow-up, Miser's action family, quests, achievements, existing
reward pools, retry timers, and saved return points remain in those managers.

The existing launch-1.21 entry policy remains: Aurum/Cutter normal parties require
exactly eight eligible level-45+ adventurers. Aurum also checks Into the Dark.
Darkhold retains its existing 4–8 rule. GM test entry bypasses those party gates.
This pass does not change Aurum/Cutter to the later 1.22 party-size policy.

## Runtime and persistence

The definitions are [aurum.json](../Data/raidroutes/aurum.json) and
[cutters.json](../Data/raidroutes/cutters.json), resolved beside the configured
scripts directory. They are loaded and validated before allocating the instance.
Each instance owns a snapshot. Unknown monster keys, invalid coordinates, missing
destinations, duplicate identities/native bindings, dependency cycles, and missing
regular coffers are rejected before entry.

`LegacyRaidRuntime` publishes available actors when a landed participant approaches
(110 horizontal / 60 vertical units). The director and content group bind after
the client's landing acknowledgement. Reconnect replaces stale player membership;
native sand/circle presentation replays only for actors known to that session.
Instances with valid reconnect tickets are not failed merely because everyone
temporarily disconnected.

Objectives use authored placement identities and actual death callbacks. Missing,
failed, manually spawned, or retired enemies cannot satisfy a room-clear condition.
Aurum terminal activation retires surviving enemies assigned to that room without
giving kill credit, changes the gas state, and opens its linked recovered barrier.
Only living original participants on the same floor count toward a terminal;
GM solo tests require one participant. Boss completion retires remaining encounter
adds, including dynamically spawned Princess/Chimera/Coincounter adds.

All three managers now retain a coffer's original rolled items until every item
has been delivered. A full inventory cannot reroll a rare item; a successful first
item does not discard a blocked second item. Completed coffers remain one-shot.
Final eligibility freezes at boss death, with clear publication after the lethal
command's packet sequence or a 250 ms fallback for deaths without a player command.
Reward-coffer presentation retries during the existing 90-second loot window.

## Recovered geometry and video evidence

The older animation atlas exported local `InstanceObject` coordinates. The root
`MiscObjects/LaySettings/LaySettingsObject`, referenced at `lyb + 0x24`, supplies
the world translation at `root + 0x40`. Applying it produces:

| Layout | Root token | World translation | Parsed instances |
| --- | --- | --- | --- |
| 214 / Aurum | `roc_r0_dun04` | `(-944, 196, 1376)` | 338 |
| 415 / Cutter | `wil_w0_dun05` | `(-1216, 252, -1632)` | 310 |

The translated Aurum barrier anchors agree with the existing five SQL placements
to roughly 1–1.5 units. This provides an independent coordinate-space check.
Cutter's entry is now the exact native `in1` marker at
`(-912.118, 251.677, -1536.601)`. Client `_layout.csv` row 415 and MapNavi rows
5400–5422 join `wil_w0_dun05` to Cutter's Cry place 3123. The previous layout-413
binding came from the stale server zone name and belongs to another client map.
The main `server_zones.sql` file and optional live migration now carry the same
`wil0Dungeon05` correction.

[recover_legacy_raid_layouts.py](../tools/recover_legacy_raid_layouts.py) verifies
the serialized root type/name and exact client-file hashes before exporting both
coordinate spaces. Its outputs are the
[origin manifest](../outputs/raid-route-recovery-20260907/layout-origins.json),
[Aurum anchors](../outputs/raid-route-recovery-20260907/aurum-world-anchors.csv), and
[Cutter anchors](../outputs/raid-route-recovery-20260907/cutters-world-anchors.csv).
It does not recover server enemy spawns or destination pairing.

The native Cutter sand bindings use layout 415 and its three typed groups:

| Native instances | Owner | Alias |
| --- | --- | --- |
| 3455, 3457 | `sgrp_vfx_sand01` | `time_sand_vst1` |
| 3458–3462 | `sgrp_vfx_sand02` | `time_sand_vst2` |
| 3463–3466 | `sgrp_vfx_sand03` | `time_sand_vst3` |

The runtime binds the selected nodes through the existing DoorServer map-object
carrier, with hidden nameplates and no interaction target. The sand effect itself
is activated by proximity. Unlisted instance 3456 is deliberately not accepted
as a recovered sand owner. Simultaneous duplicate bindings are rejected.

The annotated maps in the supplied *Final Fantasy XIV 1.0 Dungeons: Maps, Loot,
and Strategy Guide Excluding Toto-Rak* establish room membership, labels, counts,
coffers, party splits, and drawn travel links. They do not contain server XYZ.
Map-local X/Z was calibrated against exact native markers. Aurum's nearby native
stage-marker Y remains temporary and unresolved. Cutter's provisional Y values
are now resolved from the exact frozen copy of `Data/quicknavmesh/zone_246.tsv`
under `Data/raidroutes/evidence/cutters-ground-20260918/`. The recording contains
2,611 unique nodes and 2,895 valid edges; its SHA-256 is
`7CFE0A041B7BAE24B5976AAA7DB428DCBCC5CCAB31C9B1255203559B1FD87DFD`.
The resolver validates the header and record format, node and edge identities,
finite coordinates, valid endpoints, and a 20-yalm maximum captured-edge limit.
Every formerly provisional entry uses the nearest frozen node within a 12-yalm
horizontal support limit. The farthest is Stage 3 `coffer-4`, 11.851033 yalms
from node 2532, so its Y is supported by nearby recorded ground rather than an
exact standing capture. The audit manifest records every old/new Y, unchanged
route X/Z, source node and distance. These values do not turn map-derived X/Z
into recovered retail actor coordinates or establish live-client acceptance.
The historical map publication is also preserved in the 2012
[Greiver map thread](https://www.ffxivpro.com/forum/topic/29608/cutters-cry-and-the-aurum-vale-maps/).

Original recordings inspected for this pass:

- [Blue Garter: Aurum Vale SR5C](https://www.youtube.com/watch?v=QI0fvbDKHxw).
  Samples around 0:44, 3:33, 10:40, and 14:14 show the entrance roster, Golden
  Pools, terminal-driven enemy/gas changes, Coincounter with slug combat messages,
  transport activation, and Miser in the final poison area.
- [Blue Garter: Cutter's Cry SR5C](https://www.youtube.com/watch?v=9bAA6Ym_fs8).
  The first-room sample around 1:45 shows Sand Bats and a Myrmidon Drone in the
  sandy pillar chamber. The existing period research supplies the boss and reward
  contracts; this sample does not establish the full sand-link topology.
- [Dzemael Darkhold five-chest run](https://www.youtube.com/watch?v=FfGVL2hUIOY).
  The sample around 18:53 shows the later route and terminal/new-wave messaging,
  consistent with the existing staged Darkhold implementation.

The earlier [Aurum research](aurum_vale_implementation_2026-07-22.md),
[Cutter research](cutters_cry_implementation_2026-07-22.md), and
[Darkhold guide](dzemael_darkhold_runtime_guide.md) retain the period-source links,
client animation contracts, and original implementation history.

## Explicit reconstruction choices

Geometry origins and listed native sand owners are recovered. Annotated enemy
counts and room membership come from the historical maps. Exact formations,
floor offsets, regular-coffer XYZ, Aurum gas radii/terminal headcounts, section
transporter destinations, and sand destination pairing are authored.
They need stock-client navigation and combat acceptance before being called retail
placements. The generated JSON keeps this provenance separate from the SQL tables.

- Aurum uses a 1.5-second terminal hold and four-player authored circles (one in a
  GM test). Its three transporters are interactable b936 markers. Their destinations
  connect the reconstructed sections; they are not claimed original warp pairs.
  Holds reset when occupancy is insufficient, no eligible players remain, or the
  terminal becomes unavailable. A backward clock or update gap over two seconds
  also starts a fresh hold; this is a server continuity guard, not a recovered
  retail timing rule. Disconnects and wipes cannot bank charging time.
- The six Aurum in-run loot pools now follow their annotated chest rooms. The
  Red Onion Helm coffer retires at Barrier B. The Explorer's Bandana secret
  coffer appears only after all four Lilies die and both it and the belt coffer
  retire at Barrier C. The Explorer's Calot and Mage's Choker coffers remain in
  Stage 2B rather than the unlabelled Stage 3 poison room. Their X/Z remains a
  map-calibrated estimate and their Y remains unresolved.
- Coincounter calls one three-Abacus-Slug wave at 50% HP. Each failed spawn slot
  retries independently. The recording supports late slugs, but not this exact
  threshold/count/cadence. These adds do not count toward the early-room slug chest.
- Cutter's first-room Drone and Sentry must die after its other authored enemies
  and within five seconds of one another. Either order works. Five seconds is the
  server's explicit interpretation of the period nearly-simultaneous condition.
- Cutter's six regular loot keys now follow the map labels: regular1-3 are the
  three Stage 2 pools, regular4 is the Pince-nez secret in Stage 3, and regular5/6
  are the Explorer's Choker and Stonewall Choker branches in Stage 4. The Stage 4
  pair appears after that corridor is cleared. The Stage 3 regular4 coffer requires
  all four cactuars represented in that lower route and permits the other local
  monsters to remain alive, matching the guide's sleep advice. The end reward
  retains the separate guide condition for the final two cactuars. Stage 4 mobs
  become available after the Princess rather than after clearing all Stage 3
  trash, so sleeping those optional monsters does not deadlock progression. Their
  former `j`-marker center was on the Stage 3 native page; the first-pass Stage 4
  center now lies on the layout-415 Stage 4 corridor between the `k` and `L` homes.
  The Room 1 pack is centered on native Stage 1 marker `a`; its former `f` center
  belongs to the Stage 2 east branch. The lower Stage 2 regular2 coffer is snapped
  onto that branch rather than the empty map space beside it. Individual homes
  still need client acceptance for their individual homes and facing; their
  floor heights now use the frozen zone-246 ground recording.
  Split-room `c1`/`c2` and converged-room `d1` packs are also Stage 1 native-map
  homes; their former Stage 2/generic page labels were metadata errors.
- Larger/smaller sand nodes are assigned HP/MP hazards by server policy. Existing
  damage ranges are 400–1700 HP and 1000–1600 MP, with a four-second contact cooldown.
  The native visual alone does not prove the original hazard outcome.
- Fruit/root grant the existing Aurum Veil II/Veil mitigation, not an ARR stack
  cleanse. Their current visible interaction objects use the generic coffer model
  and the correct names because a trustworthy original fruit/root actor-class join
  has not been established. Replacing those substitute visuals remains open.

Vale Eft and Poisoned Peasant use their exact client actor classes. Their combat
stats are family-based first-pass values. The main mob-type SQL and optional
`aurum_vale_map_roster_20260916.sql` migration contain matching rows.

Exact patrols and unproven relic-item triggers are not fabricated. The audited
native `rad0r400`-`rad0r403` and `rad0w500`-`rad0w503` scenes now have runtime
dispatch for entry, both boss introductions, and victory. Entry uses the native
InstanceRaid `startEvent` path so the duty widget opens after the scene with the
original deadline; replacement sessions use the existing relogin event. Boss and
victory triggers, audience, and first-view policy remain reconstructed rather than
recovered server values. Native scene/widget rendering, sand replay, complete
floor navigation, and boss/coffer interactions have not been tested in a running
game client in this pass. The running server process was not restarted or its
database changed during this work.

## In-game tools

Start a populated solo test with `!aurum enter`, `!cutters enter`, or the existing
`!dzemael enter`. For a normal eligible party, use the entrance NPC or `start`.
The existing `leave` commands return to the saved entrance.

```text
!aurum route status
!aurum route list
!aurum route list stage1-goldenpools
!aurum route inspect north
!aurum route goto north
!aurum route place north
!aurum route save

!cutters route list split-left
!cutters route inspect sand-split-left
!cutters route goto coffer-1
!cutters route defeat split-left
!cutters route goto sand-mid
```

`goto`, `place`, `save`, and `defeat` require a GM test instance. `defeat` only
kills already-published living enemies matching an ID or stage, through ordinary
death handling. It does not grant credit for missing actors. Let the nearby room
publish before using it. Use individual first-room mob IDs to test both passing
and failing Drone/Sentry orders.

`place` edits a separate draft, leaving live triggers and actors unchanged. `save`
writes JSON atomically and preserves a timestamped `.bak`. Re-enter to apply it.
A save fails if the source file changed since the instance loaded it, protecting
another author's newer work. Moving a native sand entry changes its server trigger;
the native geometry stays fixed at its recovered layout position. The `entry`
anchor controls subsequent initial warps and can also be captured.

The later [2026-09-26 reconstruction](legacy_raid_retail_accuracy_2026-09-26.md)
adds audited native-mesh floor support and fixes the Stage 3 map registration.
Use its current layer tools and source status when rebuilding; earlier fallback
counts in this historical guide describe the original first pass.

For Aurum height work, enter a GM test instance and walk each labelled room while
recording nav samples. Compare every `HeightResolved: false` entry with the
recording, use `route goto <id>` for visual checks, then `route place <id>` while
standing on the accepted floor. Save only after a complete stage has been checked.
Do not infer Y from the image or merge samples from another dungeon map. Cutter's
checked-in build reads only its frozen evidence copy and audit; it does not depend
on later edits to the live quicknav file.

For full-route acceptance, open all six regular coffers before the final kill;
complete Aurum's first-two-room slugs and imperial cache, or Cutter's last pair
and final cactuars. Confirm the five earned completion coffers, repeat a coffer
interaction, test a full/partially full loot pack, disconnect/reconnect mid-route,
and test a wipe and timer expiry. Verify native circles/barriers/sands after
leaving and re-entering visibility range. Use the existing Darkhold guide for its
boss/terminal drivers.

## Build and validation

```powershell
./tools/validate_legacy_raids.ps1
# Behavioral/integration checks without rebuilding the server:
./tools/validate_legacy_raids.ps1 -SkipBuild

# Read-only client extraction; defaults to the installed 1.23b client:
python tools/recover_legacy_raid_layouts.py
# Rebuild defaults into a review directory, preserving captured production JSON:
python tools/build_legacy_raid_route_defaults.py
# Verify the frozen Cutter recording, audit, and resolved route directly:
python tools/legacy_raid_ground.py check
# Reproduce the eight pinned native scene identities and roles:
python tools/inspect_legacy_raid_scenes.py check
```

The combined validator checks manager/interaction/packet integration, runs all
three existing dungeon validators and Lua parsing, executes the behavioral checks
against the shipped route and loot code, and builds Map Server. It passes with
zero build errors and zero warnings in the current isolated build.

The behavioral suite covers both complete dependency routes, six regular coffers,
optional objectives, skipped/unspawned/retired/duplicate deaths, both first-pair
orders and the five-second boundary, malformed routes, duplicate native owners,
draft isolation, atomic save backups/conflicts, stable loot rolls, and partial
delivery retries. It also covers entry/reconnect/clear/failure widget events,
session- and generation-bound boss/victory scene invitations, shared scene slots,
and combat/hazard protection while a native scene is active. It does not simulate
native rendering, physical navigation, or the full database/combat server.

Existing databases still require the previously shipped Aurum runtime contract,
Cutter BNPC/Chimera animation migrations, and Darkhold BNPC migration described in
the earlier guides. This pass adds `aurum_vale_map_roster_20260916.sql` and
`cutters_cry_layout_415.sql`; their state is also present in the main SQL files.
Ship `Data/raidroutes` alongside the scripts and the rebuilt server binary.
