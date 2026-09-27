# Seasonal Quest Gap Contract - 2026-06-19

Generated: 2026-06-19T23:16:30

## Inputs

- Parity CSV: `tools\outputs\lpb\quest_scenario_parity_contract_20260619\quest_code_parity.csv`
- Recovered seasonal scripts: `tools\outputs\lpb\decomp_more_20260617\lua\quest\scenario\spl`
- Local seasonal scripts: `Data\scripts\quests\spl`
- Text join CSV: `tools\outputs\lpb\quest_cutscene_decomp_20260618\quest_event_text_join.csv`
- Actor name hints: `tools\mobspawns\actor_id_mob_name_only.csv`

## Summary

- Seasonal codes inventoried: 25
- Classification counts: complex_widget_or_reward_flow=5, implemented_cutscene_clue_driver=1, implemented_dreamer_dilemma_exchange_driver=3, implemented_dreamer_gospel_driver=3, implemented_event_item_select_bridge=1, implemented_static_dialogue_owner=1, recovered_placeholder_no_flow=11
- Priority counts: deep_widget_pass=5, done=4, done_with_caveat=5, no_action_until_more_recovery=11

## Newly Wired

- `spl0g1`: local Dreamer Gospel driver now calls recovered seasonal client methods.
- `spl0g2`: local Dreamer Dilemma driver now wires recovered offer, hint, and egg-cap exchange methods.
- `spl0i4`: local Gone with the Snow driver now calls recovered clue, cutscene, clear, and reward methods.
- `spl0l1`: local Dreamer Gospel driver now calls recovered seasonal client methods.
- `spl0l2`: local Dreamer Dilemma driver now wires recovered offer, hint, and egg-cap exchange methods.
- `spl0u1`: local Dreamer Gospel driver now calls recovered seasonal client methods.
- `spl0u2`: local Dreamer Dilemma driver now wires recovered offer, hint, and egg-cap exchange methods.
- `spl101`: local Scrambled Eggs bridge now delegates recovered initText/askEgg item-select methods without reward mutation.

## Best Next Candidates

- `spl101` existing bridge remains the safest baseline: log `askEgg` returns for cancel, accepted, zero-egg, one patterned egg, motley egg, and color-count cases; do not grant rings or remove eggs.
- `spl101_quest` is dialogue/menu-heavy and has no local gamedata quest row; bridge only display/menu functions after whitelisting and capture `askExtendWidget` return codes, especially ids `158` and `164`.
- `spl0i3` / quest `110801` is deceptively risky: it has no reward-select widget, but local SQL reward rows grant Reindeer Antlers `8012502` and Reindeer Suit `8032102` through `CompleteQuest`. Keep ask-only probes and do not complete the quest.
- `spl0i2`, `spl102`, and `spl0i1` need reward-widget return probes before any exchange logic; decompiled selector branches show constant-looking comparisons and should not be trusted as selected indexes.

## Deep Pass Queue

- `spl101_quest` (complex_widget_or_reward_flow): widgets=54, choices=0, methods=56; many `askExtendWidget` calls; no local quest id, no direct reward widget.
- `spl0i3` / quest `110801` (complex_widget_or_reward_flow): widgets=1, choices=0, methods=20; ask-only Ice Shard/Snowball surface, but completion auto-grants local Reindeer reward rows.
- `spl0i2` / quest `110800` (complex_widget_or_reward_flow): widgets=5, choices=0, methods=9; `RewardSelectWidget` for pumpkin heads `8013301-8013304`, using Pumpkin Cookie `3010417` in likely counts `3/10/50/99`.
- `spl102` / quest `110860` (complex_widget_or_reward_flow): widgets=5, choices=0, methods=17; gendered `RewardSelectWidget` for yukata/drawers/clogs/Bombard Bloom using Bombard Ash `10011253`; first list slot is decomp-fragile.
- `spl0i1` / quest `110799` (complex_widget_or_reward_flow): widgets=13, choices=0, methods=9; `RewardSelectWidget` for sparklers/fireworks `3020604-3020606` and `10012018-10012021`, using Bombard Ash `10012014-10012017`.

## Placeholder / No-Flow Recovered Scripts
- `spl0g3`
- `spl0g4`
- `spl0g5`
- `spl0i5`
- `spl0l3`
- `spl0l4`
- `spl0l5`
- `spl0u3`
- `spl0u4`
- `spl0u5`
- `spl103`

## 2026-06-20 Seasonal Deep-Pass Addendum

- `spl101` remains the safest seasonal probe: local and recovered scripts agree on `initText`/`askEgg`, with item-select eggs `10012001-10012004`, `10012022`, and `10012024-10012028`. Egg rings `9050058-9050062` are reward evidence only; do not grant or remove items from this bridge yet.
- `spl101_quest` is real but menu-only for now. It has 56 recovered methods and 54 `askExtendWidget` calls, mainly menu ids `158` and `164`, but no local gamedata quest row. Treat it as read-only menu/result logging, not a replacement quest.
- `spl0i1` / `110799` offers `3020604`, `3020605`, `3020606`, and `10012018-10012021` through `RewardSelectWidget`; costs use Bombard Ash `10012014-10012017`. Keep it result-logging only.
- `spl0i2` / `110800` offers pumpkin heads `8013301-8013304`; costs are Pumpkin Cookie `3010417` in counts `3/10/50/99`. Selector branches are decompile-fragile and must be logged before mapping rewards.
- `spl0i3` / `110801` is ask-only in recovered Lua around Ice Shard `1000004`, but local completion would auto-grant `8012502` and `8032102`. Avoid `CompleteQuest(110801)` during probes.
- `spl102` / `110860` offers gendered yukata/drawers/clogs/Bombard Bloom rows: likely male `8032834-8032836`, `8051521-8051523`, `8081921`, `3020613`; female `8032837-8032839`, `8051524-8051526`, `8081922`, `3020613`; cost item `10011253` with counts `1/30/50/1/30/50/5/1`.
- `spl103`, `spl0g3-5`, `spl0l3-5`, `spl0u3-5`, and `spl0i5` are recovered `initText` placeholders only. No implementation action until better recovery appears.

## 2026-06-20 Seasonal Classification Addendum

- The real seasonal lane is primarily `spl`: Hatching-tide/Dreamer, Moonfire/Bombard, All Saints, Starlight, Heavensturn, Scrambled Eggs, and Foundation Day-adjacent scripts.
- Foundation Day is event-like but mostly GC/static-event infrastructure (`spl000`, special event cryers/officers/shops), not a normal `spl` quest progression path.
- Valentione has item/storage evidence, but no dedicated runnable local or recovered seasonal script surface was found in this pass.
- Seasonal quests are config-disabled, but actor data alone does not mean visibility: normal ambient visibility still depends on server spawn/map-object rows.
- Spawn evidence is currently strongest for Foundation Day/static event actors in Ul'dah/Gridania. Normal spawn rows were not found for the checked Moonfire, All Saints, Starlight, Heavensturn, egg sprite/pod, or fireworks actor sets.
- Fireworks have recovered map-object scripts and actor-class rows, but local seasonal fireworks/weather config is disabled and no normal spawn row was found.
- False positives to avoid: generic Lua/client `event` protocol, widget `isFestival()` UI styling, `ItemSplitCommand`/`SplashEffectWidget` substring hits, and generic `bombardier` monster ability names.

## 2026-06-20 Seasonal Spawn / Bind Addendum

- Dreamer/Hatching-tide actor classes `1001584-1001595` are bound by local `spl0u1`, `spl0g1`, `spl0l1`, and `spl0*2` wrappers, but no `server_eventnpc_spawn_locations` rows were found. Their actor-class rows exist with empty class paths/flags, so they are script leads rather than currently spawned visible NPCs.
- Seasonal push/display bind ids `4000614`, `4000631`, `4000641`, and `4000643` are referenced by the generic scaffold seasonal configs, but no matching actor-class or spawn rows were found; only display-name rows were identified.
- `Spl0i4` / Waldomar is not a spawn gap: local actor `1001827` spawns as `waldomar` in North Shroud zone `152`. The remaining `spl0i4` gap is the exact Hyrstmill clue push-object mapping and the reward duplicate-risk noted below.
- `Spl000` static Foundation Day dialogue is gated by `GetSeasonalQuestsEnabled()`. Gridania 2012 actors `1002106-1002109` and Ul'dah 2012 actors `1002110-1002113` have class and spawn rows. Maelstrom 2012 cryer `1002105` and 2011 cryers `1001619`, `1001623`, and `1001627` have actor-class evidence but no spawn rows were found.
- `fireworks_enabled=false` controls forced nightly seasonal fireworks weather `8029` / `WEATHER_SEASONAL_FIREWORKS`. Normal weather pools remain SQL-driven and separate from the seasonal quest flag.

## 2026-06-21 Seasonal/Event Safety Update

- Keep seasonal, special-event, primal, and job-event gates disabled by default unless a controlled probe explicitly needs them. Actor-class evidence does not imply visible spawns or safe offerability.
- `PopulaceSpecialEventCryer` is gated by seasonal/event config, but enabled branches can grant seals/items directly. Treat it as mutation-risky and probe dialogue/selector output only until cost removal, seal caps, capacity, idempotency, and event entitlement are proven.
- Fireworks weather is separate from seasonal quest enablement: `fireworks_enabled` drives forced nightly weather `8029`, while `GetSeasonalQuestsEnabled()` gates seasonal dialogue/quests. Seeing fireworks weather is not evidence that seasonal quests should be visible.
- `spl0i3` / quest `110801` must stay ask-only because local `CompleteQuest(110801)` would grant Reindeer Antlers `8012502` and Reindeer Suit `8032102` through reward rows.
- Reward/select seasonal flows (`spl0i1`, `spl0i2`, `spl102`, and `spl101_quest`) are selector captures only until server-side item-count, unique ownership, add/remove ordering, full-inventory, and cancel/no-gil behavior are validated.
- Must-remain-hidden/disabled list for broad config work: special `Etc200/110818`, `Etc201/110819`, `Etc202/110820..110824`, `Etc106/110868`, `Etc304/110869`; seasonal `Spl0u1/110789`, `Spl0u2/110790`, `Spl0g1/110794`, `Spl0g2/110795`, `Spl0i1/110799`, `Spl0i2/110800`, `Spl0i3/110801`, `Spl0i4/110802`, `Spl0l1/110804`, `Spl0l2/110805`, `Spl102/110860`, plus no-offer `Spl000/110858`, `Spl101/110859`, `Spl103/110861`; primal `Sum6a0/110627`, `Sum6m0/110816`, `Sum6g0/110867`, `Sum6w0/110870`; and job scaffold chains `111201..111326`.
- `Etc202/110820` is SQL-visible but hidden today because the local generic scaffold has no config entry for it; that is a scaffold omission, not a proven retail-safe visibility path.
- `Spl0i4` is also completion-risky because it can directly add Dragon Kabuto `8012604` before completion and then auto-reward through normal quest completion.

## Output Files

- `seasonal_script_inventory.csv`
- `seasonal_replacement_candidates.csv`

## Notes

- The Dreamer Gospel implementation intentionally does not grant event item rewards yet; local reward audits still mark those seasonal item grants as unsafe.
- `spl0i4` is wired through Waldomar until the exact Hyrstmill clue push-object actor mapping is recovered.
- `spl0*2` Dilemma scripts now use the recovered Archon egg recipes: Pristine=10012001+10012006+10012008+10012010 -> 8012801, Vibrant=10012002+10012007+10012005+10012009 -> 8012802, Brilliant=10012003+10012007+10012005+10012006+10012011 -> 8012803, Midnight=10012004+10012008+10012010+10012009+10012012 -> 8012804.
- `spl0*2` also wires the spriggan all-eggs exchange for Chocobo Egg Cap 8012805 using one of each recovered Archon egg variant 10012001-10012012.
- The `spl0*2` Bricot menu still has a client decompile caveat: its success branch was rendered as `false == true`, so local item grants are attempted only if the client returns a concrete menu choice.
- `spl101` now only bridges the recovered EventItemSelectWidget ask for eggs `10012001-10012004`, `10012022`, and `10012024-10012028`; egg ring rewards and item removal remain disabled until server-side validation is recovered.
- Quest ids are present for `spl0i1=110799`, `spl0i2=110800`, `spl0i3=110801`, `spl101=110859`, and `spl102=110860`; `spl101_quest` has no local gamedata quest row.
- `spl0i3` is not harmless even with a tiny Lua scaffold because `player:CompleteQuest(110801)` would trigger local C# auto-reward rows for Reindeer Antlers `8012502` and Reindeer Suit `8032102`.
- Recovered `RewardSelectWidget` selectors in `spl0i1`, `spl0i2`, and `spl102` have decompile-fragile constant comparisons, so selection/cancel/confirm semantics must be logged before mapping rewards.
- Do not add/remove/grant eggs, rings, ash, fireworks, pumpkin heads, yukata gear, clogs, Bombard Bloom, Ice Shards, snowballs, or Reindeer gear from these seasonal probes; keep them on disposable state and no-op logging only.
