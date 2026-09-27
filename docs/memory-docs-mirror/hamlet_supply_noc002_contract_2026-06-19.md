# Hamlet Supply / Noc002 Contract Deep Dive

Generated: 2026-06-19T22:42:21

## What changed

This pass narrows the missing Hamlet supply/captain surface into concrete bridge work. The recovered client contracts are now split into three pieces:

- `Noc002` owns the pre-defense captain and quartermaster menus: `processCaptain*`, `processSupply*`, ranking, supply feedback, and error messaging. The local server bridge is now exact-allowlist only for read-only/menu/error-feedback calls.
- `PopulaceHamletSupply` owns the `Ask/QuestDeliveryWidget` item/materia handoff plus actor-selected `itemHamletSupply` row ranges. Local Lua opens/selects/closes the recovered widget and forwards ordinary selected-item deliveries to `WorldManager:DeliverHamletSupply`; the materia branch remains preview-only pending native validation.
- `PopulaceHamletCaptain` owns in-content and after-content captain dialogue for the named captain class family.

The important mismatch is explicit: `Noc002.processCaptain*` branches on `1500315`, `1500317`, and `1500319`, while `PopulaceHamletCaptain.initForEvent` branches on `1500340`, `1500341`, and `1500342`. Those pairs have matching appearances, but SQL spawns currently mix families.

## Outputs

- [noc002_function_flow.csv](../tools/outputs/lpb/hamlet_supply_noc002_contract_20260619/noc002_function_flow.csv)
- [hamlet_actor_map.csv](../tools/outputs/lpb/hamlet_supply_noc002_contract_20260619/hamlet_actor_map.csv)
- [item_hamlet_supply_ranges.csv](../tools/outputs/lpb/hamlet_supply_noc002_contract_20260619/item_hamlet_supply_ranges.csv)
- [local_gap_summary.csv](../tools/outputs/lpb/hamlet_supply_noc002_contract_20260619/local_gap_summary.csv)
- [bridge_queue.csv](../tools/outputs/lpb/hamlet_supply_noc002_contract_20260619/bridge_queue.csv)

## 2026-06-20 Mutation Safety Update

- The recovered widget bridge is current, but its branches are not equivalent: ordinary requested-item delivery reaches the server-owned `DeliverHamletSupply` transaction, while the materia branch remains preview-only and explicitly leaves items, anima, and supply points unchanged.
- Native Noc002 mutation, tier, and ranking-rank-in functions are still not wired. Recovered targets such as `processPointUp`, `processModItem`, `processAddAnima`, and `processSupplyRinkingRankIn` remain future work for the native menu path.
- For any future mutation, require a server-owned pending delivery context with TTL, re-resolve the actor, row, item instance, quantity, HQ/materia state, capacity, anima, and supply-point destination, then commit atomically and idempotently.
- The C# Noc002 active-event probe should stay debug-only unless it mirrors the same exact Lua allowlist before direct run-function probing.
## High-Signal Functions

| qualified_function | group | actor_class_ids | ask_prompt_ids | ask_option_ids | widget_calls | item_hamlet_supply_refs | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Noc002.processCaptainAskWhat | captain_menu |  | 2 | 3; 4; 5; 7; 8 |  |  | Captain main prompt 2 returns options 3,4,5,7,8. |
| Noc002.processSupplyAskWhat | supply_menu |  | 31 | 32; 33; 34; 35; 36; 37; 38; 39 |  |  | Supply main prompt 31 returns options 32-39. |
| Noc002.processSupplyAskWhatNotSupply | supply_menu |  | 31 | 34; 35; 36; 37; 38; 39 |  |  | Supply prompt 31 omits delivery options 32 and 33. |
| Noc002.processSupplyAskWhatA04 | supply_ranking_widget |  |  |  | askHamletDefenseRankingWidget(A3_100, A4_101, A5_102, A6_103, A7_104) |  | Ranking branch opens askHamletDefenseRankingWidget with five ranking arguments. |
| PopulaceHamletSupply.getHamletSupplyCraftItemData | supply_item_data | 1500320; 1500433; 1500434 |  |  |  | itemHamletSupplySheet | Actor ID selects 110xx/120xx/130xx base, then returns itemHamletSupply columns 0 and 2. |
| PopulaceHamletSupply.getHamletSupplyGatherItemData | supply_item_data | 1500320; 1500433; 1500434 |  |  |  | itemHamletSupplySheet | Actor ID selects 110xx/120xx/130xx base, then returns itemHamletSupply columns 0 and 2. |
| PopulaceHamletCaptain.initForEvent | captain_instance_dialogue | 1500340; 1500341; 1500342 |  |  |  |  | This captain class uses named 1500340-1500342 actor IDs, separate from Noc002 1500315/0317/0319 branches. |

## Actor Map

| actor_id | name | role | actor_path | model_id | spawn_id | unique_id | zone_id | position | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1500315 | Militia Captain Rhotblaet | Noc002 captain branch / Aleport-looking captain | /Chara/Npc/Populace/PopulaceHamletBreeder | 1600146 | 2829 | militia_captain_rhotblaet | 129 | -1269.5,3.794,-621.8 | Noc002 captain branch / Aleport-looking captain; Noc002 processCaptain*; Appearance matches 1500340: yes. |
| 1500317 | Militia Captain Carmine | Noc002 captain branch / Golden Bazaar-looking captain |  | 1000062 |  |  |  |  | Noc002 captain branch / Golden Bazaar-looking captain; Noc002 processCaptain*; Appearance matches 1500341: yes.; Actor class pa... |
| 1500319 | Militia Captain Rontremont | Noc002 captain branch / Hyrstmill-looking captain |  | 1200220 |  |  |  |  | Noc002 captain branch / Hyrstmill-looking captain; Noc002 processCaptain*; Appearance matches 1500342: yes.; Actor class path i... |
| 1500320 | Militia Quartermaster Dhebi Polaali | PopulaceHamletSupply / Hyrstmill supply base 110xx | /Chara/Npc/Populace/PopulaceHamletSupply | 1900236 | 2834 | militia_quartermaster_dhebipolaali | 152 | -599.47,4.8,-2483.3 | PopulaceHamletSupply / Hyrstmill supply base 110xx; PopulaceHamletSupply item base selection |
| 1500340 | Militia Captain Rhotblaet | PopulaceHamletCaptain class / Aleport text | /Chara/Npc/Populace/PopulaceHamletCaptain | 1600146 |  |  |  |  | PopulaceHamletCaptain class / Aleport text; PopulaceHamletCaptain.initForEvent; Appearance matches 1500315: yes.; Named captain... |
| 1500341 | Militia Captain Carmine | PopulaceHamletCaptain class / Golden Bazaar text | /Chara/Npc/Populace/PopulaceHamletCaptain | 1000062 | 2836 | militia_captain_carmine | 171 | 1128.7,312.2,-1108.3 | PopulaceHamletCaptain class / Golden Bazaar text; PopulaceHamletCaptain.initForEvent; Appearance matches 1500317: yes.; Named c... |
| 1500342 | Militia Captain Rontremont | PopulaceHamletCaptain class / Hyrstmill text | /Chara/Npc/Populace/PopulaceHamletCaptain | 1200220 | 2833 | militia_captain_rontremont | 152 | -601.5,4.47,-2484 | PopulaceHamletCaptain class / Hyrstmill text; PopulaceHamletCaptain.initForEvent; Appearance matches 1500319: yes.; Named capta... |
| 1500433 | Militia Quartermaster B'davzzi | PopulaceHamletSupply / Aleport supply base 120xx | /Chara/Npc/Populace/PopulaceHamletSupply | 1900198 | 2830 | militia_quartermaster_bdavzzi | 129 | -1268.7,3.794,-623.3 | PopulaceHamletSupply / Aleport supply base 120xx; PopulaceHamletSupply item base selection |
| 1500434 | Militia Quartermaster P'lhabgo | PopulaceHamletSupply / Golden Bazaar supply base 130xx | /Chara/Npc/Populace/PopulaceHamletSupply | 1900200 | 2837 | militia_quartermaster_plhabgo | 171 | 1127.6,312.2,-1107.8 | PopulaceHamletSupply / Golden Bazaar supply base 130xx; PopulaceHamletSupply item base selection |

## Supply Ranges

| actor_id | hamlet | category | row_start | row_end | item_ids | column_2_values | anima_min | anima_max |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1500433 | Aleport | craft | 12001 | 12008 | 10011200; 10011201; 10011202; 10011203; 10011204; 10011205; 10011206; 10011207 | 1 | 4 | 6 |
| 1500433 | Aleport | gather | 12009 | 12011 | 10011197; 10011198; 10011199 | 10 | 4 | 6 |
| 1500320 | Hyrstmill | craft | 11001 | 11008 | 10011200; 10011201; 10011202; 10011203; 10011204; 10011205; 10011206; 10011207 | 1 | 4 | 6 |
| 1500320 | Hyrstmill | gather | 11009 | 11011 | 10011197; 10011198; 10011199 | 10 | 4 | 6 |
| 1500434 | Golden Bazaar | craft | 13001 | 13008 | 10011200; 10011201; 10011202; 10011203; 10011204; 10011205; 10011206; 10011207 | 1 | 4 | 6 |
| 1500434 | Golden Bazaar | gather | 13009 | 13011 | 10011197; 10011198; 10011199 | 10 | 4 | 6 |

## Local Gap

| local_path | line_count | call_client_functions | probe_hooks | contains_noc002_flow | contains_quest_delivery_widget | gap |
| --- | --- | --- | --- | --- | --- | --- |
| Data\scripts\quests\noc\noc002.lua | 78 | delegateEvent |  | True | False | allowlisted read-only/error-feedback bridge |
| Data\scripts\base\chara\npc\populace\PopulaceHamletSupply.lua | item delivery + materia preview | eventQuestItemMenuOpen/Select/Close; eventQuestMateriaMenuOpen/Select/Close | `GetWorldManager():DeliverHamletSupply` for ordinary items | False | True | ordinary item delivery is server-backed; materia/native ranking path remains preview-only |
| Data\scripts\base\chara\npc\populace\PopulaceHamletCaptain.lua | 11 | getAleportText |  | False | False | stub/probe only |
| Map Server\Hamlets\HamletDefenseManager.cs | 2728 |  | SendNoc002Probe; NormalizeNoc002FunctionName; SendHamletCaptainTextProbe | False | False | probe hook only |
| Map Server\WorldManager.cs | 6072 |  | SendHamletDefenseNoc002Probe; SendNoc002Probe; SendHamletDefenseCaptainTextProbe; SendHamletCaptainTextProbe | False | False | probe hook only |

## Bridge Queue

| priority | surface | target | local_gap | implementation_note |
| --- | --- | --- | --- | --- |
| 1 | Captain actor mapping | Data/sql/gamedata_actor_class.sql and captain spawn ownership | Static spawns mix the two families: Aleport uses 1500315, Hyrstmill uses 1500342, Golden Bazaar uses 1500341. | Decide whether to move all three field captains to 1500315/0317/0319 for Noc002 pre-defense menus, add aliases, or route both I... |
| 2 | Read-only captain menu | Data/scripts/quests/noc/noc002.lua plus PopulaceHamletCaptain local bridge | Local Noc002 now uses exact read-only/error-feedback allowlists; local PopulaceHamletCaptain still calls getAleportText only. | Keep the exact allowlist: processCaptain*/processSupply* menu calls and supply error feedback only; mutation functions remain b... |
| 3 | Read-only supply menu | Data/scripts/quests/noc/noc002.lua plus PopulaceHamletSupply local bridge | Local Noc002 covers read-only supply menu/error functions; PopulaceHamletSupply covers the widget handoff and ordinary item transaction. | Keep prompt 31 menu functions in the Noc002 allowlist; use the supply actor bridge for the delivery window and leave native ranking mutation gated. |
| 4 | Supply item and materia widgets | Data/scripts/base/chara/npc/populace/PopulaceHamletSupply.lua | Ordinary item selection reaches `DeliverHamletSupply`; materia selection remains preview-only. | Live-test ordinary item delivery and separately validate the native materia/ranking path before enabling it. |
| 5 | Mutation and feedback | HamletDefenseManager/WorldManager state plus Noc002 feedback functions | Local Noc002 allowlist intentionally blocks mutation functions; Hamlet probes do not yet own supply point/anima/item mutation. | Keep after read-only menu and widget coverage so state mutations are not guessed behind a missing UI path. |

## Implementation Notes

1. Start with the actor mapping decision. The three captain-looking Noc002 branch IDs and the three named `PopulaceHamletCaptain` IDs are appearance-paired, but they are not interchangeable in recovered logic.
2. Implement read-only captain/supply dialogue before mutating inventory, anima, or Hamlet supply points.
3. Keep `Ask/QuestDeliveryWidget` as the widget boundary for item/materia donation. `itemHamletSupply` rows only tell us requested item and quantity/value columns, not the whole mutation lifecycle. Ordinary item deliveries now use the server-owned `DeliverHamletSupply` path; native materia/ranking mutation remains separate.
4. Treat `processSupplyRinkingRankIn` as a typo preserved from the client name; local bridge names should accept that exact recovered symbol.

## 2026-06-21 Preview vs Mutation Boundary

- `PopulaceHamletSupply` is not one uniform preview surface. Its ordinary requested-item branch opens the item delivery menu and calls the server-owned `DeliverHamletSupply` transaction; its materia branch may open the materia menu but remains preview-only.
- Recovered `populacehamletsupply` and `Noc002` include mutation flows, but local code should keep exact read-only/error-feedback allowlists until package/slot/item/count/HQ/materia/anima values are re-resolved server-side.
- `QuestDeliveryWidget` returns selectors and package/slot metadata, not authority. Any future supply mutation needs a contribution ledger, item-instance validation, full-inventory/partial-stack handling, rollback, and idempotency.
- GC supply and Hamlet supply share the delivery-widget pattern but use different sheets and authority contexts; do not reuse either transaction path as proof for the other.

## 2026-08-24 Current-code clarification

The earlier preview wording applied to the recovered widget/probe boundary and to materia/native Noc002 mutation; it should not be read as saying that ordinary requested-item deliveries are still non-mutating. The current local path is:

```text
PopulaceHamletSupply item selection
  -> WorldManager:DeliverHamletSupply
  -> HamletDefenseManager.DeliverSupply
  -> validate quartermaster, hamlet zone, distance, selected item instance,
     requested row, quantity, phase, contribution ownership
  -> record contribution, remove item, award anima, return rank/rating
```

The remaining separation is intentional. The ordinary item path is server-backed and should be tested as a real inventory transaction. The materia menu and native Noc002 ranking/mutation functions still require live validation and must not be inferred from the preview widget alone.
