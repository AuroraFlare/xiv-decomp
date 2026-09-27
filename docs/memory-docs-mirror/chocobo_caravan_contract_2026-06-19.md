# Chocobo Caravan Contract - 2026-06-19

This pass turns the caravan evidence into a reproducible bridge contract. Outputs
live in `tools\outputs\lpb\chocobo_caravan_contract_20260619`.

## High-signal findings

- `PopulaceCaravanManager` is the retail signup/cancel surface: text bank
  `7520/populaceCaravanManager`, prompts `16`, `23`, `4`, and `55`. The local
  manager script now maps the four static sergeants to GC/location metadata,
  runs recovered signup/join/cancel branches, and starts the caravan route
  director with provisional forward waypoints.
- `PopulaceCaravanGuide` owns the active escort/reward side: offer, thanks,
  cancel, success, failure, reward, fail reward, no reward, and bonus reward.
  The local guide now reads active `ChocoboCaravanDirector` state when present
  and falls back to offer/ignore when no director or actor binding is available.
- `PopulaceCaravanAdviser` is a separate advice/sales side NPC. Retail uses
  text bank `7536`, item `3011317`, and gil currency `1000001`; the local script
  already bridges the purchase flow and item/currency mutation.
- `ChocoboCaravanGuard.chocoboCommand` loads text bank `7680`, uses
  `askRestrictChoices(..., 1, ...)`, optionally asks row `6`, and returns a
  choice pair. The local guard now bridges this menu from `onEventStarted` and
  pulls feed/recall metadata from the active caravan director.
- The local `ChocoboCaravanDirector` is not empty: it validates routes, spawns a
  route-spawned 22105xx guard actor, moves it along waypoints, sends actors, fails on finishTime timeout, and updates progress.
  It now instantiates the recovered `CaravanGuardDirector` client class and
  syncs `work.step`, `work.progressPer`, `work.finishTime`,
  `work.chocoboStatus[3]`, `work.chocoboHPStatus[3]`, and marker arrays.

## 2026-06-20 Route/Reward Follow-up

- `CaravanGuardDirector` is the retail HUD authority: `getKindContentsInformation() == 2`, open payload `finishTime, town, placeStart, placeEnd, name1, name2, name3`, update ids `1` progress, `2` status, and `3` HP.
- Step contract remains `30` marker reset, `40` departure effects `14/15/16`, `70` active `ChocoboCaravanWidget`, `80` success effects `17/18/19`, `90` failure/special effect `20`, and unfinished finalize effect `13`.
- `ChocoboCaravanWidget` status values are `1` Walk, `2` Stop, `3` Flight, `4` Escaped, `5` Return; HP values are `1` Normal, `2` Caution, `3` Danger.
- Local route backend is real but provisional: manager/guide/adviser/guard scripts exist, `RegionalCaravan` returns the retail director path, and C# moves a spawned `22105xx` path companion. Exact six-route retail data, party eligibility, contribution, cargo loss, and reward grants are still missing.

## Actor Map

- Manager classes: `1500213`, `1500214`, `1500215`, `1500284`; static spawns
  include `storm_friont`, `serpent_sergeant_marquaile`, `flame_sergeant_mourelz`,
  and `storm_sergeant_larille`.
- Adviser classes: `1500216`, `1500217`, `1500218`, `1500287`, `1500289`; static
  spawns include `arlth`, `belmont`, `gwayne`, `randwulf`, and `raulin`.
- Visible pack chocobo classes: `1500228`, `1500229`, `1500230`; these are
  `PopulaceStandard` actors named `pack_chocobo` in static spawns.
- Command-capable recovered guard family: `2210501`-`2210518`,
  `/Chara/Npc/Monster/Chocobo/ChocoboCaravanGuard`; manager/test routes now use
  the first guard actor of each known route trio. No static spawn rows were found
  for this family in this pass.

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Retail HUD director adapter probe | `Map Server/Actors/Director/ChocoboCaravanDirector.cs` plus `Data/scripts/directors/ChocoboCaravan/RegionalCaravan.lua` |
| 2 | Guide lifecycle and reward dialogue | `Data/scripts/base/chara/npc/populace/PopulaceCaravanGuide.lua` plus director completion/failure hooks |
| 3 | Caravan guard command probe | `Data/scripts/base/chara/npc/monster/Chocobo/ChocoboCaravanGuard.lua` and route-spawned 22105xx guard actors |
| 4 | Adviser and gysahl sales polish | `Data/scripts/base/chara/npc/populace/PopulaceCaravanAdviser.lua` |
| 5 | Retail effects and map markers | public effects `13`-`20`, map/minimap marker updates |
| 6 | Manager route polish | `Data/scripts/base/chara/npc/populace/PopulaceCaravanManager.lua` |

## Generated Files

- `caravan_function_contracts.csv` (138 rows)
- `caravan_actor_map.csv` (44 rows)
- `director_gap_summary.csv` (12 rows)
- `local_gap_summary.csv` (11 rows)
- `text_widget_contract.csv` (5 rows)
- `bridge_queue.csv` (6 rows)
- `contract_summary.json`
- `README.md`

## 2026-06-21 Reward Boundary

- Caravan completion currently records an in-memory pending result for guide dialogue. It does not implement retail reward authority.
- Missing before rewards: exact retail route eligibility, party matching, contribution/cargo/kill formula, guard effect state, feed-item consumption, seal/item grant rules, cap checks, rollback, and persistent one-claim ledger.
- Keep guide reward probes as dialogue/logging only until the transaction contract exists.
