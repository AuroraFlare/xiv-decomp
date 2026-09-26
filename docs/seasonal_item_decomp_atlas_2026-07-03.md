# Seasonal Item Decomp Atlas - 2026-07-03

Generated: 2026-07-03T01:09:25Z

## Inputs

- Item SQL: `Data\sql\gamedata_items.sql`
- Seasonal quest SQL: `Data\sql\gamedata_quests.sql` / `Data\sql\gamedata_quest_rewards.sql`
- Recovered spl scripts: `tools\outputs\lpb\decomp_more_20260617\lua\quest\scenario\spl`
- Local seasonal scripts: `Data\scripts\quests\spl`
- Patch storage list: `docs\patches\Patch_1.22.md`

## Summary

- Seasonal/event item candidates inventoried: 116
- Seasonal quest rows inventoried: 24
- Unlock-state counts: auto_reward_present_keep_ask_only=2, city_state_event_or_shop_present_gated=7, event_exchange_item_present_cost_logic_unproven=2, implemented_but_duplicate_reward_risk=1, implemented_gated_by_seasonal_flag=17, item_data_only=12, item_data_present_storage_confirmed_no_flow=33, recovered_dialogue_or_display_only=10, recovered_widget_needs_probe=32
- Event bucket counts: All Saints' Wake=5, Foundation Day / city-state=6, Hatching-tide / Dreamer=29, Heavensturn=7, Moonfire Faire / Bombard=47, Princess Day / Little Ladies' Day=2, Seventh Umbral / Atomos-adjacent event=4, Starlight Celebration=4, Valentione's Day=3, celebration prism / event-adjacent=6, seasonal armoire / event-adjacent=3

## Readout

- The city-state feeling is mostly Foundation Day: `Spl000`, `PopulaceSpecialEventCryer`, `PopulaceCompanyShop`, and city default scripts carry the GC/static-event surface.
- The normal seasonal quest lane is still the `spl` bucket: Dreamer/Hatching-tide, Moonfire/Bombard, All Saints, Starlight, Heavensturn, and Scrambled Eggs.
- A lot of the gear is already in `gamedata_items`; visibility and mutation safety are separate. Broadly enabling `seasonal_quests_enabled` will expose only actors/scripts that also have spawn/bind rows.
- Reward widgets for `spl0i1`, `spl0i2`, and `spl102` are still selector-probe work. Do not grant/remove items from those until return codes, costs, inventory-full, uniqueness, and cancel paths are logged.
- `spl0i3` and `spl0i4` are completion-risky: local quest completion/reward paths can auto-grant Reindeer/Dragon Kabuto items.

## Safer / Riskier Buckets

- Implemented and gated: 8012801 Pristine Egg Cap, 8012802 Vibrant Egg Cap, 8012803 Brilliant Egg Cap, 8012804 Midnight Egg Cap, 8012805 Chocobo Egg Cap, 10012001 Archon Egg, 10012002 Colored Archon Egg, 10012003 Painted Archon Egg, 10012004 Darkened Archon Egg, 10012005 Wind Archon Egg, 10012006 Lightning Archon Egg, 10012007 Fire Archon Egg, 10012008 Earth Archon Egg, 10012009 Ice Archon Egg, 10012010 Water Archon Egg, 10012011 Astral Archon Egg ...
- Bridge/display only or needs probe: 3010417 Pumpkin Cookie, 3020604 Lominsan Sparkler, 3020605 Gridanian Sparkler, 3020606 Ul'dahn Sparkler, 3020613 Bombard Bloom, 8013301 Pumpkin Head, 8013302 Unripened Pumpkin Head, 8013303 White Pumpkin Head, 8013304 Ripened Pumpkin Head, 8032834 Lord's Yukata (Blue), 8032835 Lord's Yukata (Green), 8032836 Lord's Yukata (Grey), 8032837 Lady's Yukata (Red), 8032838 Lady's Yukata (Blue), 8032839 Lady's Yukata (Black), 8051521 Lord's Drawers (Black) ... 1000004 Ice Shard, 3020614 Magicked Prism (Maelstrom), 3020615 Magicked Prism (Twin Adder), 3020616 Magicked Prism (Immortal Flames), 10012022 Motley Egg, 10012024 Red Archon Egg, 10012025 Blue Archon Egg, 10012026 Green Archon Egg, 10012027 Yellow Archon Egg, 10012028 Violet Archon Egg
- Storage/data confirmed but no local flow: 8012605 Crimson Dragon Kabuto, 8012606 Golden Dragon Kabuto, 8012607 Black Dragon Kabuto, 8032401 Red Summer Top, 8032402 Green Summer Top, 8032403 Blue Summer Top, 8032404 Solar Summer Top, 8032405 Lunar Summer Top, 8032406 Red Summer Halter, 8032407 Green Summer Halter, 8032408 Blue Summer Halter, 8032409 Solar Summer Halter, 8032410 Lunar Summer Halter, 8051301 Red Summer Trunks, 8051302 Green Summer Trunks, 8051303 Blue Summer Trunks ...
- City-state event/shop present: 3020413 Over-aspected Cluster, 3020537 Over-aspected Crystal, 3020601 Storm Tracer, 3020602 Flame Tracer, 3020603 Serpent Tracer, 9010025 Patriot's Bracelet, 9040018 Patriot's Choker

## Output Files

- `outputs\seasonal-item-decomp-atlas-20260703\seasonal_item_atlas.csv`
- `outputs\seasonal-item-decomp-atlas-20260703\seasonal_quest_item_surface.csv`

## Notes

- `source_tags` tells why a row is included: recovered script, local script, local event/shop script, quest reward, patch armoire list, achievement text, or name/cluster evidence.
- `unlock_state` is an implementation-safety label, not a retail availability claim.
- Items included only by name/cluster are useful leads, but they need spawn/script/shop evidence before being treated as active event rewards.
