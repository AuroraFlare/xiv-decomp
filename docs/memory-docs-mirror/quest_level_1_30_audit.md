# Quest Level 1-30 Audit

Audit date: 2026-05-30.

Scope: quest rows in `Data/sql/gamedata_quests.sql` with `minLevel` from 1 through 30, matched to Lua files under `Data/scripts/quests`. This excludes `minLevel = 0` placeholder/system rows; including those raises the raw data set to 524 rows, but most of the extra rows are debug, system, or untranslated placeholders.

## Summary

| Area | Scripted | Notes |
| --- | ---: | --- |
| All level 1-30 quest rows | 103 / 219 | 116 rows do not have a matching quest Lua script. |
| Main scenario (`Man`) | 15 / 15 | Fully scripted in this range. |
| World/settlement quests (`Wld`) | 11 / 11 | Fully scripted in this range. |
| Grand Company intro/branch quests (`Com`, `Gcl`, `Gcg`, `Gcu`) | 33 / 33 | Script files exist, but several kill/instance targets are not spawnable yet. |
| Sidequests (`Etc`) | 41 / 63 | 22 missing script rows remain; several scripted kill quests also lack target mob types. |
| Class/guild/job quests | 1 / 78 | Only `Pgl200` is scripted; the rest of the level 20/30 class/guild and early job rows are missing. |
| Seasonal/special/tutorial (`Spl`, `Noc`, `Trl`) | 2 / 19 | Mostly placeholders or untranslated rows. |

## Fixed During This Pass

- Added `Player.AddGil(int quantity)` in `Map Server/Actors/Chara/Player/Player.cs`. Existing quest scripts call `player:AddGil(...)`, but the method did not exist, so those rewards would fail at runtime.
- Updated `Data/scripts/quests/man/man300.lua` to use `player:CompleteQuest(quest)` instead of `quest:Finish()`. No `Quest.Finish` API exists in the server/Lua surface.
- Added mined-data Lua scripts for the materia tutorial chain: `Etc101`, `Etc102`, `Etc103`, and `Etc104`. These now use real NPC ids, quest flags, journal variables, DAT marker ids, key-item/action rewards, and class gating where applicable.
- Kept the original 14 deferred named `Etc` scripts disabled/absent. The placeholder single-NPC versions were removed so these quests do not appear implemented until their real objective, item, UI marker, and battle/NM flows are mapped.
- Corrected the level 1-30 inventory parser to include SQL-escaped apostrophe names such as `Cutter's Cry`, `Adder's Nest Egg`, and `The Dreamer's Gospel`.

## Highest Priority Gaps

1. Scripted kill quests are the most immediately player-visible blocker. Active kill handlers reference 30 quests; only 6 are fully covered by mob type and spawn rows. A broader `BNPC_*` constant sweep still has 27 unique missing actor IDs, including `Man300` combatant references.
2. Remaining `Etc` sidequests are duplicate/untranslated rows or objective-heavy named rows and need loader/name clarification before scripting.
3. Class/guild level 20/30 quests need scripts and quest-battle/NM wiring. This includes several named NM-style enemies already staged in the NM loot file.
4. Grand Company quest scripts exist, but `Data/scripts/quests/com/gc_quest_template.lua` still calls out instance/NM placeholders for Batraal, Ifrit, Qiqirn, Myrmidon Princess, Garuda, and Nael.

## Static Correctness Pass

This first correctness pass expands the Grand Company template wrappers before checking for shared functions, so `Com5*`, `Gcl*`, `Gcg*`, and `Gcu*` are not falsely marked incomplete just because their individual files only call `InitGrandCompanyQuest(...)`.

| Check | Result | Notes |
| --- | ---: | --- |
| Raw level 1-30 SQL rows after escaped-name parsing | 219 | The previous simple parser undercounted 18 rows with apostrophes in their names. |
| Script files present | 103 | Includes the four newly implemented materia scripts. |
| Missing scripts | 116 | Includes class/job gaps, duplicate dungeon rows, seasonal rows, and the remaining deferred `Etc` scripts. |
| Scripted quests with no direct `CompleteQuest` path | 5 | Needs review; three are starter quests with private combat tutorials. |
| Scripted quests with no `getJournalMapMarkerList` hook | 2 | Both are `Trl` tutorial rows. |
| Scripted quests with no `getJournalInformation` hook | 22 | May be acceptable when no `$E8(...)` variables are needed, but should be checked against `xtx_quest.csv`. |
| Scripted quests with TODO/temp/placeholder text | 20 | Most are GC template placeholder inheritance plus a few real script warnings. |
| Scripted quests using private-content calls | 20 | These need playthrough validation, not just static checks. |

Scripted quests with no direct completion path:

| Quest | Level | Note |
| --- | ---: | --- |
| `Man0l0` Shapeless Melody | 1 | Starts `SimpleContent30002`, but no static `CompleteQuest` call was found. |
| `Man0g0` Sundered Skies | 1 | Starts `SimpleContent30010`, but no static `CompleteQuest` call was found. |
| `Man0u0` Flowers for All | 1 | Starts `SimpleContent30079` for `escaped_goobbue`, but no static `CompleteQuest` call was found. |
| `Trl0l1` Getting Started | 20 | Tutorial row has no map marker hook and no direct completion path. |
| `Trl0g1` Getting Started | 30 | Tutorial row has no map marker hook and no direct completion path. |

Rows recovered by escaped-name parsing:

| Quest | Level | Name | Script state |
| --- | ---: | --- | --- |
| `Gld300` | 30 | F'lhaminn's Flower | Missing script. |
| `Etc2g5` | 25 | Losing One's Thread | Missing script. |
| `Wld0l2` | 10 | Letting Out Orion's Belt | Script exists. |
| `Spl0u1` | 5 | The Dreamer's Gospel (Ul'dah) | Missing script. |
| `Spl0u2` | 5 | The Dreamer's Dilemma (Ul'dah) | Missing script. |
| `Spl0g1` | 5 | The Dreamer's Gospel (Gridania) | Missing script. |
| `Spl0g2` | 5 | The Dreamer's Dilemma (Gridania) | Missing script. |
| `Spl0l1` | 5 | The Dreamer's Gospel (Limsa Lominsa) | Missing script. |
| `Spl0l2` | 5 | The Dreamer's Dilemma (Limsa Lominsa) | Missing script. |
| `Etc202` | 1 | Cutter's Cry | Missing script and shares duplicate `Etc202` loader name. |
| `Pld0j1` | 15 | Paladin's Pledge | Missing script. |
| `Brd0j2` | 15 | The Archer's Anthem | Missing script. |
| `Brd0j3` | 15 | Bard's-Eye View | Missing script. |
| `Drg0j6` | 15 | Into the Dragon's Maw | Missing script. |
| `Com0g3` | 22 | Adder's Nest Egg | Script exists. |
| `Com0u3` | 22 | Burning a Hole in One's Pocket | Script exists. |
| `Com5u0` | 25 | Imperial Devices (Ul'dah) | Script exists through GC template. |
| `Gcu101` | 30 | It Kills with Fire (Ul'dah) | Script exists through GC template. |

## Scripted Kill Target Coverage

The level 1-30 scripted quests reference 33 unique BNPC actor IDs through `BNPC_*` constants.

| Coverage | Count |
| --- | ---: |
| Actor IDs with mob type and spawn rows | 6 |
| Actor IDs missing mob type rows | 27 |
| Actor IDs with mob type but no spawn rows | 0 |

Covered kill targets:

| Quest | Actor ID | Spawn rows |
| --- | ---: | ---: |
| `Etc1g4` The Penultimate Prank | 2104508 | 10 |
| `Etc1u1` Sleepless in Eorzea | 2104021 | 12 |
| `Etc1u5` An Inconvenient Dodo | 2102009 | 22 |
| `Etc1u6` Besmitten and Besmirched | 2105717 | 21 |
| `Etc2l0` Fishing for Answers | 2107601 | 11 |
| `Wld0g1` In the Name of Science | 2106214 | 7 |

Missing mob type rows for scripted kill targets:

| Quest | Actor IDs |
| --- | --- |
| `Man300` Toll of the Warden | 2106408, 2106537 |
| `Wld0g3` A Bitter Oil to Swallow | 2103910 |
| `Wld0g4` Spores on the Brain | 2105916 |
| `Wld0u2` Sanguine Studies | 2106537 |
| `Wld0u4` Rustproof | 2106542 |
| `Com0l1` The Price of Integrity | 2200708 |
| `Com0g1` Breaking the Seals | 2202206 |
| `Com0u1` Career Opportunities | 2200205 |
| `Com0u4` Arms Race | 2109801 |
| `Com0u6` Know Your Enemy | 2289025 |
| `Etc1l0` Assessing the Damage | 2105409 |
| `Etc1l1` Bridging the Gap | 2100113 |
| `Etc1l5` Till Death Do Us Part | 2102717 |
| `Etc1l6` Beryl Overboard | 2107613 |
| `Etc1l7` Have You Seen My Son | 2101609 |
| `Etc1g2` A Well-Balanced Diet | 2100509 |
| `Etc1g5` The Search for Sicksa | 2104022 |
| `Etc1g8` Say it with Wolf Tails | 2100609 |
| `Etc1g9` Embarrassing Excerpts | 2100503 |
| `Etc2g0` A Forbidden Love | 2102708 |
| `Etc2g2` Stone Deaf | 2100502 |
| `Etc1u4` The Customer Comes First | 2180210, 2180211, 2180212 |
| `Etc2u2` Ore for an Ore | 2102105 |
| `Etc2i0` Counting Sheep | 2101403 |
| `Etc2i1` A Hypocritical Oath | 2100314 |

## Deferred `Etc` Implementation Pass

These 15 quests are intentionally left without active Lua scripts. Placeholder single-NPC scripts were removed because they would make the server accept/complete quests without proving the real client-facing flow: journal objective text, NPC/map markers, quest item prompts, objective counters, and private-area or NM battle transitions. `Etc2g5` was surfaced by the escaped-name parser correction.

| Quest | Level | Name | Work still needed |
| --- | ---: | --- | --- |
| `Etc1l9` | 20 | Seashells by the Seashore | Collect 4 Conch Shells (`11000174`), likely beach interactables or loot, then return to Fupepe. |
| `Etc2l1` | 20 | Moonstruck | Build the kill or quest-battle path for violent creatures between Wineport and Bloodshore; identify BNPC/private content IDs. |
| `Etc1g0` | 10 | Proceed with Caution | Give or use Ceruleum Compound (`11000140`) at 3 watchers, then return to Sandre. |
| `Etc1g1` | 15 | Playing with Fire | Use quest item `11000141` at 3 extinguished hearth/bonfire objectives, then return to Maroile. |
| `Etc2g3` | 24 | Hunting the Hunters | Kill Ixal near Quarrymill; identify BNPC/private content and completion trigger. |
| `Etc2g5` | 25 | Losing One's Thread | Recover item `11000221` from goblins east of Camp Tranquil, then return to the quest giver. |
| `Etc1u9` | 10 | Best Flower Ever | Kill dodos southeast of Golden Bazaar, then return to Sasapano. |
| `Etc2u0` | 20 | The Unheard Horizon | Kill monsters near Camp Horizon, then return to Gegeissa. |
| `Etc2u5` | 15 | No Other Dodo Will Do | Obtain item `11000219` from clever dodos north of Camp Drybone, then return to Hildie. |
| `Etc3u1` | 15 | Quid Pro Quo | Map the multi-step donation/item handoff using quest item `11000172`. |
| `Etc3u2` | 21 | There Might Be Blood | Map journal rows `410`, `411`, `413`, and `414`, actors, items, and possible private content. |
| `Etc3g1` | 15 | Scrubbing the Soul | Visit Gridanian guilds, relay Nuala's message, inspect scarred tree, fight Garleans/private content, then report to Mestonnaux. |
| `Etc3g2` | 21 | Disorganized Crime | Wire Lifemend Stump trigger, Redbelly Wasp fight, Colbert interrogation, item `11000204`, Raya-O-Senna/Echo beat, and Biddy turn-in. |
| `Etc3l1` | 15 | Winds of Change | Deliver 5 Arrest Warrants (`11000175`), wire the Bearded Rock cave battle, follow-up NPCs, and Zanthael turn-in. |
| `Etc3l2` | 21 | Shot Through the Heart | Wire beach search east of Cassiopeia Hollow, deepsea angler fight, Malin/Echo beat, item `11000203`, and Mynadaeg turn-in. |

## Implemented Materia Chain Pass

These four quests now have active scripts using mined UI data. They are no longer in the deferred/missing set, but the actual materia gameplay systems are still shallow.

| Quest | Implemented now | Still missing |
| --- | --- | --- |
| `Etc101` Risky Business | Confirmed blue/important Aistan offer marker, fossil-fused dark matter (`11000210`) delivery to Mutamix, marker `11211001`, 780 EXP, Leather Leggings (`8081120`) and 1000 gil rewards; uses known-good Aistan/Mutamix default dialogue and the standard reward confirmation as a safe staging fallback. | Exact quest-specific client event functions still need recovery; materia gameplay remains deferred to the follow-up tutorial quests. |
| `Etc102` Forging the Spirit | Confirmed blue/important Swynbroes offer marker, reward flag, marker `11211101`, 780 EXP, Materia Assimilator (`2001001`) key item reward, and standard reward confirmation. | Real gear-to-materia conversion detection is not wired, so completion is NPC-driven for now. |
| `Etc103` Joining the Spirit | Confirmed blue/important Kokosamu offer marker, Land-class gating, 780 EXP, Fingerprints of the Gods (`29742`) hotbar grant, catalyst-area marker `11211202`, return marker `11211201`, and standard reward confirmation. | Gathering catalysts with Fingerprints is not hooked into the gathering command, so the gather check is not real yet. |
| `Etc104` Waking the Spirit | Confirmed blue/important F'hobhas offer marker, Hand-class gating excluding Culinarian, marker `11211301`, 780 EXP, Materia Melder (`2001002`) key item reward, and standard reward confirmation. | Real materia melding detection is not wired, so completion is NPC-driven for now. |

## Mined Data Available for the UI Pass

The client-facing quest UI does not need to be guessed from scratch. The repo already has mined DAT CSVs under `docs/Dat Mining`, and the server already has Lua hooks for the key UI paths.

Server UI hooks to use:

- `quest:SetENpc(actorClassId, QFLAG_*)` drives NPC/object quest icons and interaction state. Use `QFLAG_TALK`, `QFLAG_PUSH`, `QFLAG_REWARD`, and `QFLAG_MAPONLY` deliberately instead of marking every actor as a generic talk target.
- `getJournalInformation(player, quest)` feeds `RequestQuestJournalCommand.lua` and sends `requestedData`, `qtdata`, quest id, sequence, and the returned values. These become the client's `$E8(...)` journal variables.
- `getJournalMapMarkerList(player, quest)` sends `requestedData`, `qtmap`, quest id, and baked marker ids from `quest_marker.csv`. The packet only sends ids; marker coordinates, text, icon, class, and radius come from the DAT row.
- Quest scripts should still call the real client event functions with `callClientFunction(..., "delegateEvent", ...)` where existing scripts or client data identify them. The per-quest CSVs preserve text and variables, but they do not by themselves prove every event function name.

Useful mined sources:

| File | Use |
| --- | --- |
| `docs/Dat Mining/<questClass>.csv` | Quest dialogue text, item references, value macros, and rough objective wording. All 19 named `Etc` candidates in this pass have these files. |
| `docs/Dat Mining/xtx_quest.csv` | Journal text templates and `$E8(...)` variable patterns for `getJournalInformation`. |
| `docs/Dat Mining/quest_marker.csv` | Full-map marker ids, baked coordinates, display names, marker class, icon, and visibility. |
| `docs/Dat Mining/quest.csv` | Quest row metadata and default reward row pointer. |
| `docs/Dat Mining/quest_reward.csv` and `docs/Dat Mining/quest_new_reward.csv` | Reward UI data: item/gil/action ids, quantities, and display ids. |
| `docs/Dat Mining/actorclass.csv`, `populace.csv`, and `Data/sql/server_eventnpc_spawn_locations.sql` | Actor class ids, NPC/object identities, and spawn coverage for markers and quest flags. |

Known marker coverage for the 19 named `Etc` candidates:

| Quest | Quest ID | Baked `quest_marker.csv` rows found | UI note |
| --- | ---: | --- | --- |
| `Etc1l9` | 110642 | `11064201`, `11064202` | Has offer/turn-in and Bloodshore objective markers. |
| `Etc2l1` | 110644 | `11064401`, `11064402` | Has Wineport/Bloodshore markers; battle target still needs BNPC/private content mapping. |
| `Etc1g0` | 110654 | `11065401`-`11065404` | Has multiple objective markers for the watcher/item-use flow. |
| `Etc1g1` | 110655 | `11065501`-`11065504` | Has multiple objective markers for the hearth/bonfire item-use flow. |
| `Etc2g3` | 110667 | `11066701`, `11066702` | Has Quarrymill/Ixal objective markers; needs BNPC/private content mapping. |
| `Etc2g5` | 110669 | `11066901`-`11066920` | Has Camp Tranquil/goblin objective markers; needs goblin target and item drop/source mapping. |
| `Etc1u9` | 110684 | `11068401`, `11068402` | Has Golden Bazaar/dodo objective markers; needs dodo target mapping. |
| `Etc2u0` | 110685 | `11068501`, `11068502` | Has Camp Horizon/monster objective markers; needs target mapping. |
| `Etc2u5` | 110690 | `11069001`, `11069002` | Has Drybone/dodo objective markers; needs item drop/source mapping. |
| `Etc3u1` | 110726 | none found | `quest.csv` points at reward row `11072601`; journal/dialogue data exists, but map markers need actor/trigger reconstruction. |
| `Etc3u2` | 110727 | none found | Uses generic quest marker pointer in `quest.csv`; likely private-content/story flow. |
| `Etc3g1` | 110735 | none found | `quest.csv` points at reward row `11073501`; journal/dialogue data exists, but map markers need actor/trigger reconstruction. |
| `Etc3g2` | 110736 | none found | Uses generic quest marker pointer in `quest.csv`; likely private-content/story flow. |
| `Etc3l1` | 110744 | none found | `quest.csv` points at reward row `11074401`; journal/dialogue data exists, but map markers need actor/trigger reconstruction. |
| `Etc3l2` | 110745 | none found | Uses generic quest marker pointer in `quest.csv`; likely private-content/story flow. |
| `Etc101` | 110811 | `11211001` | Mutamix camp marker; implemented in `etc101.lua`. |
| `Etc102` | 110812 | `11211101` | Swynbroes marker; implemented in `etc102.lua`. |
| `Etc103` | 110813 | `11211201`, `11211202` | Kokosamu and catalyst-area markers; implemented in `etc103.lua`. |
| `Etc104` | 110814 | `11211301` | F'hobhas marker; implemented in `etc104.lua`. |

Practical rule for implementation: start each quest by mining `xtx_quest.csv` for the journal sequence values, `quest_marker.csv` for any baked map ids, and the quest-specific CSV for item/value macros. Only then wire the Lua sequence, `SetENpc` flags, `getJournalInformation`, and `getJournalMapMarkerList`. For NM-like steps, use the `escaped_goobbue` private-content approach only when the mined data points to a quest battle or trigger instead of a normal static spawn.

## Private Content Correlation

There is no single DAT boolean that proves a quest is instanced. Treat this as a confidence pass, not final truth.

Use these signals when choosing the implementation path:

- Confirmed private content: an existing quest script calls `CreateContentArea`, `WarpToPrivateArea`, or `DoZoneChange(..., "PrivateAreaMasterPast", ...)`, or `Data/sql/server_zones_privateareas.sql` has a matching quest comment.
- Probable private content: quest text mentions a triggered fight, party/battle restrictions, failure conditions, Echo/story staging, or an NM source note says quest battle, and normal `quest_marker.csv` rows are absent.
- Probable public/static flow: `quest_marker.csv` has normal objective markers and the quest text describes open-world kill, collect, delivery, or item-use objectives.
- Unknown: duplicate/untranslated quest rows, missing marker rows, or text that does not clearly identify public targets versus private triggers.

Deferred `Etc` correlation:

| Quest | Current correlation | Confidence | Why |
| --- | --- | --- | --- |
| `Etc1l9` Seashells by the Seashore | Public collect/object or loot flow | High | Marker ids `11064201` and `11064202`; text asks for 4 Conch Shells (`11000174`) from Bloodshore. |
| `Etc2l1` Moonstruck | Public kill flow, possible small quest battle | Medium | Marker ids `11064401` and `11064402`; text says to clear frenzied creatures on the road to Bloodshore, but target BNPC/private content is not mapped. |
| `Etc1g0` Proceed with Caution | Public object or NPC item-use flow | High | Marker ids `11065401`-`11065404`; text points to a three-watcher Ceruleum Compound (`11000140`) objective. |
| `Etc1g1` Playing with Fire | Public object item-use flow | High | Marker ids `11065501`-`11065504`; text points to three extinguished hearth/bonfire objectives with quest item `11000141`. |
| `Etc2g3` Hunting the Hunters | Public kill flow, possible triggered quest battle | Medium | Marker ids `11066701` and `11066702`; text says fleeing Ixal near Quarrymill were tracked by scouts, but the exact target wiring is unknown. |
| `Etc2g5` Losing One's Thread | Public kill/drop flow | High | Marker ids `11066901`-`11066920`; text says goblins east of Camp Tranquil hold item `11000221`. |
| `Etc1u9` Best Flower Ever | Public kill flow | High | Marker ids `11068401` and `11068402`; text explicitly sends the player southeast to kill dodos. |
| `Etc2u0` The Unheard Horizon | Public kill flow | High | Marker ids `11068501` and `11068502`; text asks the player to fell beasts near Camp Horizon. |
| `Etc2u5` No Other Dodo Will Do | Public kill/drop flow | High | Marker ids `11069001` and `11069002`; text and item data point to clever dodos and quest item `11000219`. |
| `Etc3u1` Quid Pro Quo | Public handoff plus likely public combat near wreckage | Medium | No marker rows found; `etc3u1.csv` mentions the crash site northwest of Ul'dah, bandits, and item `11000172`, so trigger reconstruction is needed. |
| `Etc3u2` There Might Be Blood | Story/private flow possible | Low-medium | No marker rows found; journal rows `410`, `411`, `413`, and `414` are mapped, but the arena/Raubahn story flow needs actor and trigger confirmation. |
| `Etc3g1` Scrubbing the Soul | Private-content or triggered quest battle likely | High | No marker rows found; text points from guild visits to a scarred tree and a Garlean/bright-creature fight, which reads like a staged Echo/story battle. |
| `Etc3g2` Disorganized Crime | Private-content or triggered quest battle likely | High | No marker rows found; text has a Lifemend Stump trigger, Redbelly Wasp fight, Colbert interrogation, item `11000204`, and Raya-O-Senna/Echo beat. |
| `Etc3l1` Winds of Change | Private-content or triggered quest battle likely | High | No marker rows found; text has a Bearded Rock cave encounter with imperial operatives after the Arrest Warrant (`11000175`) handoff. |
| `Etc3l2` Shot Through the Heart | Private-content or staged story battle likely | High | No marker rows found; text has beach evidence recovery, a deepsea angler fight, Malin/Echo story, and item `11000203`. |

Class/NM quest-battle correlation:

| Quest | Correlation | Confidence | Why |
| --- | --- | --- | --- |
| `Pgl200` The House Always Wins | Confirmed incomplete private duty flow | High | Script exists and has a temporary `WarpToPrivateArea` path; NM row `3108` is `toothless_gladiator`. |
| `Gla200` All Bark and No Bite | Quest battle or private encounter likely | High | NM row `3034` is `ala_mhigan_challenger` with source note for this quest. |
| `Gla300` Unalienable Rights | Quest battle or private encounter likely | High | NM row `3062` is `j_moldva` with source note for this quest. |
| `Pgl300` Here There Be Pirates | Quest battle or private encounter likely | High | NM row `3066` is `kraken_deckhand` with source note for this quest. |
| `Man300` Toll of the Warden | Encounter spawning incomplete | Medium-high | Script exists, but comments still call for Nananoby/Sylph and Amalj'aa/Ixal combatant spawning. |

How to use this on the next pass:

1. Implement the high-confidence public `Etc` quests first with `quest:SetENpc`, `getJournalInformation`, `getJournalMapMarkerList`, `onPush`, delivery checks, and `onKillBNpc` where needed.
2. For high-confidence private candidates, do not add static world spawns first. Trace the trigger/director/private-area path and model battle spawning after `Man0u0`/`escaped_goobbue`, `Man0g0`, or `Man0l0`.
3. For medium-confidence quests, inspect `<questClass>.csv`, `xtx_quest.csv`, and any content/director rows before deciding. If there is normal marker coverage and no story-battle language, use public flow.

## Remaining Missing `Etc` Scripts

| Quest | Level | Name |
| --- | ---: | --- |
| `Etc1l9` | 20 | Seashells by the Seashore |
| `Etc2l1` | 20 | Moonstruck |
| `Etc1g0` | 10 | Proceed with Caution |
| `Etc1g1` | 15 | Playing with Fire |
| `Etc2g3` | 24 | Hunting the Hunters |
| `Etc2g5` | 25 | Losing One's Thread |
| `Etc1u9` | 10 | Best Flower Ever |
| `Etc2u0` | 20 | The Unheard Horizon |
| `Etc2u5` | 15 | No Other Dodo Will Do |
| `Etc3u1` | 15 | Quid Pro Quo |
| `Etc3u2` | 21 | There Might Be Blood |
| `Etc3g1` | 15 | Scrubbing the Soul |
| `Etc3g2` | 21 | Disorganized Crime |
| `Etc3l1` | 15 | Winds of Change |
| `Etc3l2` | 21 | Shot Through the Heart |
| `Etc202` | 1 | [en] |
| `Etc202` | 1 | the Thousand Maws of Toto-Rak |
| `Etc202` | 1 | Dzemael Darkhold |
| `Etc202` | 1 | Aurum Vale |
| `Etc202` | 1 | Cutter's Cry |
| `Etc5u2` | 1 | [en] |
| `Etc5u3` | 1 | [en] |

Notes:

- `Etc202` appears multiple times with the same class name. That means only one `etc202.lua` script can exist unless the quest loader has additional ID-specific routing.
- Several `[en]` rows likely need name recovery before implementation.

## Missing Class/Guild/Job Scripts

Only `Pgl200` exists in the level 1-30 class/guild/job set. The missing set is 77 scripts:

- DoW/DoM level 20/30 class quests: `Gla200`, `Gla300`, `Exc200`, `Exc300`, `Arc200`, `Arc300`, `Lnc200`, `Lnc300`, `Thm200`, `Thm300`, `Cnj200`, `Cnj300`, `Pgl300`, `Acn200`, `Acn300`.
- DoH/DoL level 20/30 guild quests: `Bsm200`, `Bsm300`, `Gld200`, `Gld300`, `Tan200`, `Tan300`, `Wvr200`, `Wvr300`, `Alc200`, `Alc300`, `Cul200`, `Cul300`, `Min200`, `Min300`, `Hrv200`, `Hrv300`, `Fsh200`, `Fsh300`, `Wdk200`, `Wdk300`.
- Job quest rows in this range: `War0j1`-`War0j6`, `Mnk0j1`-`Mnk0j6`, `Whm0j1`-`Whm0j6`, `Blm0j1`-`Blm0j6`, `Pld0j1`-`Pld0j6`, `Brd0j1`-`Brd0j6`, `Drg0j1`-`Drg0j6`.

## Missing Seasonal/Special/Tutorial Scripts

| Quest | Level | Name |
| --- | ---: | --- |
| `Noc002` | 1 | Hamlet Defense |
| `Noc003` | 1 | Class is in Session |
| `Spl000` | 1 | Seasonal Event |
| `Spl0i1` | 1 | The Heat Is On |
| `Spl0i2` | 1 | Impish Impositions |
| `Spl0i3` | 1 | Winter Is Not Coming |
| `Spl0i4` | 1 | Gone with the Snow |
| `Spl0u1` | 5 | The Dreamer's Gospel (Ul'dah) |
| `Spl0u2` | 5 | The Dreamer's Dilemma (Ul'dah) |
| `Spl0g1` | 5 | The Dreamer's Gospel (Gridania) |
| `Spl0g2` | 5 | The Dreamer's Dilemma (Gridania) |
| `Spl0l1` | 5 | The Dreamer's Gospel (Limsa Lominsa) |
| `Spl0l2` | 5 | The Dreamer's Dilemma (Limsa Lominsa) |
| `Spl101` | 1 | Scrambled Eggs |
| `Spl102` | 1 | Bombard Backlash |
| `Spl103` | 1 | Seasonal Event (All City-states) |
| `Trl0l2` | 20 | [en] |

## NM State

`Data/sql/server_battlenpc_mob_types_loot.sql` stages 118 NM mob type/loot rows and sets `isNotorious = 1` for those inserts. `Data/sql/server_battlenpc_spawn_locations.sql` currently has 1,062 spawn rows with `bnpcId` values from 1000 through 1069, and 0 spawn rows for the staged NM IDs (`3000+`).

That means most low-level NMs may have mob type and loot data, but still need spawn locations or quest/private-area battle spawning. One important exception is `escaped_goobbue`: the Ul'dah starter quest already creates it through private content rather than through the static NM spawn table.

Low-level or source-level-unknown NM rows that matter for the level 1-30 audit:

| BNPC | Name | Level | Drops | Source note |
| ---: | --- | --- | ---: | --- |
| 3027 | escaped_goobbue | 1-1 | 1 | Already spawned by `Man0u0` via `SimpleContent30079`; static NM row is not the active path |
| 3034 | ala_mhigan_challenger | 20-20 | 0 | `Gla200` All Bark and No Bite |
| 3042 | giant_remora | 19-19 | 6 | Shposhae |
| 3050 | guano_gnat | 30-42 | 1 | Western Thanalan and Mun-Tuy Cellars |
| 3062 | j_moldva | 30-30 | 0 | `Gla300` Unalienable Rights |
| 3066 | kraken_deckhand | 25-25 | 1 | `Pgl300` Here There Be Pirates |
| 3067 | lone_coeurl | 22-22 | 1 | Shposhae |
| 3091 | remora | 15-15 | 5 | Shposhae |
| 3096 | shearing_sheridan | 20-20 | 3 | Shposhae |
| 3108 | toothless_gladiator | 20-20 | 0 | `Pgl200` The House Always Wins |
| 3111 | voidtongue_ahzabb_chah | 30-30 | 0 | Western Thanalan cave |
| 3002 | barbatos | unknown | 0 | Southern Thanalan |
| 3005 | batraal | unknown | 0 | Dzemael Darkhold |
| 3028 | estinien_wyrmblood | unknown | 0 | Coerthas quest battle |
| 3038 | all_seeing_eye | unknown | 0 | Dzemael Darkhold |
| 3041 | garuda | unknown | 0 | The Howling Eye |
| 3049 | greywine | unknown | 0 | Coerthas Central Highlands |
| 3051 | guardian_of_the_grove | unknown | 0 | West Shroud |
| 3090 | razor_plume | unknown | 0 | The Howling Eye |
| 3099 | soulgazer | unknown | 0 | Dzemael Darkhold |
| 3104-3106 | tempered_captive | unknown | 0 | Paglth'an / Lord Errant |

## Suggested Implementation Order

1. Add the 27 missing mob type rows for scripted level 1-30 kill targets, then seed static or private-area spawn rows where appropriate.
2. Implement the 15 remaining deferred named `Etc` scripts above using real objective logic. Handle NM-like portions with the same private-content style used by `escaped_goobbue` where the mined data points to a quest battle or trigger.
3. Resolve the remaining duplicate/untranslated `Etc` rows, especially `Etc202`, where multiple quest rows map to the same script filename.
4. Implement level 20/30 class/guild quests in batches by city, because their NPC and battlefield references overlap heavily.
5. Wire quest battle spawning for the low-level NM rows listed above, especially `Pgl200`, `Gla200`, `Gla300`, and `Pgl300`.
6. Revisit `gc_quest_template.lua` after the private-area/instance spawn flow is solid; the template is already structured, but its key battles are placeholder-driven.
