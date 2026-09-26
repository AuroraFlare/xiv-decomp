# Missing Event Surface Decomp

- Created: 2026-06-19T21:41:14
- Surfaces audited: 13
- Client source inventory rows: 24
- Local bridge scan rows: 13
- Bridge evidence probes: 13
- SQL actor/spawn/map-object candidates: 87

## Bottom Line

The next missing surfaces are mostly not new cutscene assets. They are small actor/widget bridge contracts: terminal/gimmick scripts, dungeon warp devices, Caravan signup and HUD sync, Hamlet's stock InstanceRaid lifecycle, and quest-specific content-information widgets.

## Highest Priority

- **Gimmick/Magitek terminal**: Bind terminal-like dungeon/quest map objects to the local GimmickTerminal script only after TalkCommand target routing and actor/spawn identity are captured. Next: Capture TalkCommand target params and terminal actor classes, then bind read-only terminal rows without stealing stateful dungeon devices.
- **Dungeon warp device**: Dungeon terminal/warp device behavior remains unbound even though the local script/helper path exists. Next: Capture or seed the real transporter actor, validate askYesNo/activateWarpDevice, and route yes through the existing private-area return helper.
- **Chocobo Caravan manager/signup**: Retail caravan signup and cancellation are not wired to route ownership, party capacity, Grand Company eligibility, or director creation. Next: Promote PopulaceCaravanManager from harness to flow controller: question, join result, cancel, then create the retail-mode caravan director.
- **Chocobo Caravan retail HUD**: The retail work surface is seeded locally; remaining gaps are live ChocoboCaravanWidget validation, guide actor binding, and real reward grants. Next: Probe the recovered CaravanGuardDirector path in-client, then validate step/progress/status/hp/finishTime and pending guide reward results.
- **Hamlet execution widget**: The implementation can create/probe widgets, but it does not yet reliably enter the stock InstanceRaidHamletDefense lifecycle. Next: Prioritize the instance-raid start/relogin trigger, then send typed kind 3 user-message helpers instead of direct widget construction probes.
- **Hamlet supply/captain dialogue widgets**: Hamlet participation and supply-turn-in UI is not wired with the recovered Noc002 option/menu functions. Next: Implement captain and supply NPC scripts from Noc002, then connect itemHamletSupply rows and existing local supply/reward state.

## Surface Matrix

| Surface | Local Hits | Gap | Next |
| --- | ---: | --- | --- |
| Gimmick/Magitek terminal | 2 | Bind terminal-like dungeon/quest map objects to the local GimmickTerminal script only after TalkCommand target routing and actor/spawn identity are captured. | Capture TalkCommand target params and terminal actor classes, then bind read-only terminal rows without stealing stateful dungeon devices. |
| Dungeon warp device | 6 | Dungeon terminal/warp device behavior remains unbound even though the local script/helper path exists. | Capture or seed the real transporter actor, validate askYesNo/activateWarpDevice, and route yes through the existing private-area return helper. |
| Beacon Fort gate gimmick | 2 | Stronghold/dungeon gate identity can be represented locally, but the recovered scheduler/status protocol is not wired. | Validate one real BeaconFortGateGimmick binding before adding status-synced scheduler playback. |
| Chocobo Caravan retail HUD | 26 | The retail work surface is seeded locally; remaining gaps are live ChocoboCaravanWidget validation, guide actor binding, and real reward grants. | Probe the recovered CaravanGuardDirector path in-client, then validate step/progress/status/hp/finishTime and pending guide reward results. |
| Chocobo Caravan manager/signup | 13 | Retail caravan signup and cancellation are not wired to route ownership, party capacity, Grand Company eligibility, or director creation. | Promote PopulaceCaravanManager from harness to flow controller: question, join result, cancel, then create the retail-mode caravan director. |
| Chocobo Caravan guide/dialogue | 12 | Completion/failure dialogue is bridged through pending director results; remaining gaps are live guide actor binding, reward-claim persistence, and real reward grants. | Validate guide actor binding and pending result display in-client, then add claimed/expiry persistence and real reward grants. |
| Pack chocobo caravan command | 45 | Pack chocobo interaction is split between default-talk emotes and the recovered ChocoboCaravanGuard command flow. | Decide whether chocoboCommand belongs on visible 1500228/1500230 pack_chocobo actors or on spawned 22105xx ChocoboCaravanGuard actors, then bridge route/name args accordingly. |
| Hamlet execution widget | 130 | The implementation can create/probe widgets, but it does not yet reliably enter the stock InstanceRaidHamletDefense lifecycle. | Prioritize the instance-raid start/relogin trigger, then send typed kind 3 user-message helpers instead of direct widget construction probes. |
| Hamlet score widget | 33 | Functional score packets exist, but exact installed-DAT row values/visual validation should remain gated. | Keep score rows table-driven from hamlet_score_row_code_mapping.csv and run one retail visual validation before claiming exactness. |
| Hamlet ranking widget | 2 | Supply ranking can be probed, but exact 0x01A6 field-to-widget labels are not fully validated. | Use hamlet_supply_ranking_field_bridge.csv for one non-empty row probe, then promote fields that visually validate. |
| Hamlet supply/captain dialogue widgets | 3 | Hamlet participation and supply-turn-in UI is not wired with the recovered Noc002 option/menu functions. | Implement captain and supply NPC scripts from Noc002, then connect itemHamletSupply rows and existing local supply/reward state. |
| Legacy dungeon execution widget | 451 | Old dungeon HUD/cutscene wrappers need the recovered occupancy director path, not only quest delegate events. | Wire legacy occupancy directors for Toto-Rak/Dzemael style duties with eventNoticeCutScene/relogin and open/close RaidDungeonExecutionWidget behavior. |
| Quest content-information widgets | 3 | Quest-specific content widgets can be missed if only guildleve/instance HUDs are implemented. | Add a quest director content-information audit before closing quest/widget coverage; start with GCG/GCL/GCU 70101 and NMRush 01/02. |

## Generated Files

- `event_surface_matrix.csv`
- `client_function_inventory.csv`
- `local_bridge_hits.csv`
- `bridge_evidence.csv`
- `actor_class_candidates.csv`
- `summary.json`

## Bridge Evidence Highlights

| Surface | Evidence Hits | Interpretation |
| --- | ---: | --- |
| Gimmick/Magitek terminal | 39 | Local GimmickTerminal.lua now exists as a generic read-only prompt leaf; Toto-Rak terminal behavior remains split across dedicated light/barrier/poster objects with worldMaster photocell messages. |
| Dungeon warp device | 7 | RaidDungeonWarp has a recovered yes/no plus scheduler contract and a local script/helper path; the remaining gap is exact actor/spawn binding and destination validation. |
| Beacon Fort gate gimmick | 24 | Beacon Fort gate is a status-synced map object that drives show/hide BG schedulers from mapStat. |
| Chocobo Caravan retail HUD | 104 | Client retail HUD expects CaravanGuardDirector work arrays; local director now seeds the recovered RegionalCaravan/CaravanGuardDirector lane while retaining guildleve-compatible fallback fields. |
| Chocobo Caravan manager/signup | 26 | Signup NPC class exists in SQL and local script, but only the entry prompt is exercised locally. |
| Chocobo Caravan guide/dialogue | 22 | Guide reward/failure branches are recovered and now called from pending completion/failure results after the caravan director ends; reward persistence and live actor validation remain open. |
| Pack chocobo caravan command | 36 | Visible pack_chocobo spawns are default-talk PopulaceStandard actors; the ChocoboCaravanGuard actor family and local init script exist, but no route command bridge is wired. |
| Hamlet execution widget | 172 | Local probes can open Hamlet widgets, but the stock InstanceRaidBaseClass start/relogin lifecycle remains the key bridge. |
| Hamlet score widget | 28 | Score packet and row contracts are largely recovered; exact installed-DAT value validation remains the main risk. |
| Hamlet ranking widget | 4 | Ranking packet shell exists locally, but a non-empty row visual probe is still needed before field labels are locked. |
| Hamlet supply/captain dialogue widgets | 72 | Client Noc002 and PopulaceHamletSupply expose the supply/captain menus; local Noc002 is still only a scaffold. |
| Legacy dungeon execution widget | 22 | Legacy occupancy directors recover Toto-Rak/Dzemael widget open/close IDs; local Totorak currently only triggers instance-raid state. |
| Quest content-information widgets | 17 | Several recovered quest directors use the content-information widget lane outside guildleve/caravan paths. |

## SQL Candidate Counts

| Surface | Candidates |
| --- | ---: |
| Chocobo Caravan manager/signup | 8 |
| Dungeon warp device | 3 |
| Gimmick/Magitek terminal | 45 |
| Hamlet supply/captain dialogue widgets | 6 |
| Pack chocobo caravan command | 25 |

## Bucket Counts

- Ready-ish/static contract rows: 12
- Local absent rows: 0
- Partial/below-confidence rows: 1
