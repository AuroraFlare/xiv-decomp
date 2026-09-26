# Grand Company deep decomp: runtime ownership, transitions, and gaps

This is a source audit of **all 102 Grand Company rows in the main quest SQL**: 69 named quests and 33 `[en]` internal rows. It joins the recovered native scenarios to the current server wrappers and their actual owners. The companion [102-row runtime inventory](../../outputs/grand-company-deep-decomp-20260926/runtime/inventory.md) and [machine-readable records](../../outputs/grand-company-deep-decomp-20260926/runtime/quests.json) give each row's exact SQL line, availability line, wrapper, initializer, direct dependencies, native methods, template hooks, and SHA-256 source identity. This report changes no gameplay, SQL, placement, live database, or process.

## What is actually wired

| Current source category | Rows | Interpretation |
| --- | ---: | --- |
| Bespoke with an ordinary offer listed | 15 | `Com0[lgu]1–4` and `Com5[lgu]0`; player-specific eligibility still applies |
| Bespoke with ordinary offers disabled | 27 | Six campaigns, three enlistments, three Darkhold routes, six 301/302 sidequests, three 304 surveys, six rank quests |
| Named generic GC template | 27 | `Gc[lgu]101–107`, `303`, `305`; its own hard gate blocks synthetic progression |
| Internal no-offer scaffold | 28 | Reference loaders, not recovered quest routes |
| Internal missing server wrapper | 5 | `Com0g8`, `Com5u2`, `Com5u3`, `Com5u4`, `Com5u5` |

“Bespoke” means a content-specific server route exists. It does **not** mean retail behavior has been fully recovered, the main SQL has been loaded into a database, the running server uses this source, or a client has accepted it. “Listed” means the ID is uncommented in the repository availability table, not that every character can take it. Every family has open presentation or fidelity questions.

The older reports are useful evidence indexes but are not a substitute for reading current source. In particular:

- The September 17 finalization report says all eighteen opening routes were disabled at that pass. Current availability lists fifteen and disables the three Darkhold variants. The September 25 patch report's “15 rows” heading for patch 1.18 conflates its active subset with all **18** rows in that bucket.
- The active `Com0[lgu]4` wrappers use the field-battle layer and the Funditor/Bestiarius → Triarius/Speculator → Veles roster. A historical Hellhound/wolf probe is not today's Arms Race route.
- `Com0u6.lua` still contains a “hard blocker” comment, but its executable statement selects `InitGrandCompanyCampaignQuest`. Current placement and battle tables include Charledore and its dedicated director. The documented gladiator analog remains authored; the ordinary-offer block is availability, not a per-route executable hard gate.

Evidence: [Data/scripts/quests/quest_availability.lua:309](../../Data/scripts/quests/quest_availability.lua#L309), [Data/scripts/quests/com/com0u6.lua:4](../../Data/scripts/quests/com/com0u6.lua#L4), [Data/scripts/quests/com/gc_field_battle_placements.lua:6](../../Data/scripts/quests/com/gc_field_battle_placements.lua#L6), [docs/gc_campaign_enlistment_completion_2026-09-19.md:17](../../docs/gc_campaign_enlistment_completion_2026-09-19.md#L17).

## Dispatch and evidence boundaries

Server quest scripts are selected from `/quests/{initial}/{questName}.lua`; the Quest object retains its native `classPath`. A Lua `delegateEvent` names a method on the quest's native scenario object. A matching method in another city's file therefore does not establish that the current quest object can invoke it. This matters especially for the shared Limsa-authored story families: `Gcl101`, `Gcl104`, `Gcl105`, `Gcl106`, and `Gcl107` contain Gridania/Ul'dah branches, while the corresponding `Gcg`/`Gcu` files are `initText` loaders with **zero process-event methods**.

The inventory records both facts without manufacturing aliases. The validator explicitly slices helper configurations by quest code and compares declared event names with that same code's native methods. Native method presence proves an available presentation entry point, not the server producer of every argument, the correct NPC, a valid battle, or quest completion. Conversely an empty native method is meaningful: treating it as a complete field event would create server progression unsupported by its body.

The method index counts **685 lexical `processEvent` declarations** in the existing readable decomp tree. That is separate from the parent report's binary/prototype audit: this number includes native methods never dispatched by the server, and should not be advertised as 685 implemented steps. The JSON's `template_hooks_are_effective_runtime` disambiguates legacy template entries from bespoke ownership. For example a template entry for `Gcl701` does not own its active wrapper; `InitGrandCompanyRankQuest` does.

Evidence: [Map Server/Lua/LuaEngine.cs:86](../../Map%20Server/Lua/LuaEngine.cs#L86), [Map Server/Actors/Quest/Quest.cs:46](../../Map%20Server/Actors/Quest/Quest.cs#L46), [tools/validate_grand_company_quests.py:1002](../../tools/validate_grand_company_quests.py#L1002), [Data/scripts/quests/gcl/gcl701.lua:2](../../Data/scripts/quests/gcl/gcl701.lua#L2).

### Native return values are not interchangeable

Most accept handlers require numeric `1`; a boolean true, zero, absent return, or ordinary dialogue completion must not be treated as equivalent. Toto-Rak entry deliberately allows `1` or `true` for its recovered ask, while its accept methods still use the route's numeric confirmation. Enlistment's saved choice is set only after native confirmation and successful acceptance. Campaign bridge entry uses a returned choice to decide whether to transfer into the private Bridge. These are distinct contracts.

Argument identity also matters. `Com0l7` uses the native spelling `processEventGuincamStart`, not a guessed correction to Guincum. Gridania and Ul'dah narrative branches in `Gcl101` do not authorize installing Fulke/Aubrey methods in stub classes. The boolean branch of `Gcu305.processEventI_PAGHLOStart` cannot be reduced to a numeric membership enum without verifying how Lua truthiness applies. A numeric zero is truthy in Lua.

Scene literals are case-sensitive. The campaign code intentionally uses uppercase `COM0G510` and distinct default/after-warp paths. `story_scene.play` preserves the packed argument count, obtains a scene token, optionally owns a native invitation, delegates exactly once, and asks the native scene lifecycle whether completion succeeded. A scene name in dialogue is not a recovered world-coordinate registration or an authorization to create its cinematic actors as combatants.

Evidence: [Data/scripts/quests/com/gc_enlistment_quest.lua:33](../../Data/scripts/quests/com/gc_enlistment_quest.lua#L33), [Data/scripts/quests/com/totorak_gc_quest.lua:207](../../Data/scripts/quests/com/totorak_gc_quest.lua#L207), [Data/scripts/quests/com/gc_campaign_quest.lua:117](../../Data/scripts/quests/com/gc_campaign_quest.lua#L117), [Data/scripts/story_scene.lua:8](../../Data/scripts/story_scene.lua#L8).

## Shared server lifecycle

### Offers and accepted quest identities

`QuestStateManager.ComputeAvailable` combines completion, minimum level, prerequisites, company-rank bits, the offer allowlist, milestone rules, and opening-company exclusions. Enlistment milestones retain their SQL prerequisite check. Rank milestones have a separate special path that applies enablement, level, not-already-completed, current company/rank, and medal possession; that special path can set their availability independently of the ordinary prerequisite bit. Thus a dumped SQL edge and effective offer eligibility are separate facts. All six rank IDs remain disabled in the current allowlist.

`GrandCompanyOpeningQuestRules` applies to 24 pre-enlistment/opening/dungeon IDs. Joining one company suppresses new foreign-company duties. Within each dungeon family, having one variant active excludes the other two; completing a variant is not a permanent cross-company exclusion, and Toto-Rak and Darkhold are separate families. Existing journal quests are deliberately preserved even if old or GM-staged states conflict with the new-offer rules.

An unaccepted offer is validated against the exact currently published offer object. An accepted dialogue checks exact Quest and QuestData reference identity and sequence, plus authoritative current player/session checks. `Quest.Equals` compares a scenario ID, so value equality alone would allow an old yielded conversation to write to an abandoned-and-reaccepted journal. Campaign and sidequest helpers additionally snapshot session/area or enforce their exact step actor and location after yielding.

Evidence: [Map Server/Actors/Quest/QuestStateManager.cs:119](../../Map%20Server/Actors/Quest/QuestStateManager.cs#L119), [Map Server/Actors/Quest/QuestStateManager.cs:219](../../Map%20Server/Actors/Quest/QuestStateManager.cs#L219), [Map Server/Actors/Quest/GrandCompanyOpeningQuestRules.cs:48](../../Map%20Server/Actors/Quest/GrandCompanyOpeningQuestRules.cs#L48), [Map Server/WorldManager.GcQuests.cs:20](../../Map%20Server/WorldManager.GcQuests.cs#L20), [Map Server/WorldManager.GcQuests.cs:35](../../Map%20Server/WorldManager.GcQuests.cs#L35).

### Private squad battles

`gc_sqb_quest` is a shared launcher, not a fabricated public kill objective. It stages a private area and director, disables re-entry, allocates exact actor instances, assigns one-shot lifecycles, and registers participants before publishing entry. The default party cap is three and boundary radius is 45; individual configurations may override them. It does not permit a new public retry while the same owner-named content shell is still live.

The source movie can yield. On resumption the launcher rechecks the captured journal/data/sequence, connected participants, life/class/level, source area, transfer state, occupied event slots, and configured party radius. If allocation or pre-entry presentation fails, it unwinds its own staged state. Once the owner transfer is queued, a later helper's failed transfer does not destroy the destination under the owner. The successful caller returns without closing the NPC event again because transfer owns that event close.

`gc_sqb_runtime` binds a character owner and exact journal, maintains actual spawned targets and credit receipts, and uses a monotonic process clock. The native kill callback can supply only class ID and may be fanned out to several rewarded players. The runtime reconciles it against exact allocated actors that are dead in the current wave, so duplicate callbacks or a living same-class target do not satisfy a wave. Helpers participate in combat but do not inherit the owner's quest progression. Subsequent waves spawn only when every configured current-wave target is credited.

The result path waits for the existing two-second victory-settle interval, rechecks ownership and life, runs a native/custom aftermath, persists success or retry while the captured quest is current, despawns targets, returns participants, retires aftermath actors, finalizes content, and ends the director. Timeout, death, cancelled/replaced journal, failed entry and failed wave allocation have explicit failure paths. A final kill credited before the deadline is retained even if result handling runs later. These are implementation guarantees; the two-second interval, timeout-start policy, reconnection behavior, formations, and tuning are not all recovered retail facts.

Evidence: [Data/scripts/quests/com/gc_sqb_quest.lua:31](../../Data/scripts/quests/com/gc_sqb_quest.lua#L31), [Data/scripts/quests/com/gc_sqb_quest.lua:204](../../Data/scripts/quests/com/gc_sqb_quest.lua#L204), [Data/scripts/directors/Quest/gc_sqb_runtime.lua:250](../../Data/scripts/directors/Quest/gc_sqb_runtime.lua#L250), [Data/scripts/directors/Quest/gc_sqb_runtime.lua:330](../../Data/scripts/directors/Quest/gc_sqb_runtime.lua#L330), [Data/scripts/directors/Quest/gc_sqb_runtime.lua:400](../../Data/scripts/directors/Quest/gc_sqb_runtime.lua#L400), [Map Server/WorldManager.GcQuests.cs:15](../../Map%20Server/WorldManager.GcQuests.cs#L15).

### Rewards, item evidence, and retry limits

The shared reward checkpoint reserves persisted flag 21 for accepted choice, 22 for paid seals, and 23 for paid EXP. The SQL flags column is 24 bits, so those are the top persisted bits rather than an assumed 32-bit storage budget. A paid flag is saved before the next client coroutine yield. Seal admission occurs before evidence consumption, and completion retries can use the EXP checkpoint after evidence has already been consumed.

`GrantGCQuestSeals` requires the **entire** reward to fit the current rank's cap. It leaves the quest retryable on refusal; it does not silently discard the overflow. The once helper prevents repeated normal event retries from paying again. Currency/EXP writes and QuestData persistence are separate operations: the comments explicitly do not claim database atomicity across a process crash. `CompleteGCQuestOnce` returns true after calling the void `Player.CompleteQuest`; that return says the helper submitted completion, not that the C# routine necessarily accepted its SQL reward package. C# can return early when rewards cannot fit. The persisted manual-reward checkpoint is what keeps such a retry useful.

Item helpers verify possession after the void item-add API. Multi-item routes preserve partial delivery and retry missing items. A saved battle receipt and a held proof item are different things: the former can authorize redelivery; possession alone must not fabricate a battle clear. Rank-31 promotion uses a separate C# transaction path and does not share exactly these seal-cap semantics.

Evidence: [Data/scripts/quests/com/gc_reward_checkpoint.lua:12](../../Data/scripts/quests/com/gc_reward_checkpoint.lua#L12), [Data/scripts/quests/com/gc_reward_checkpoint.lua:79](../../Data/scripts/quests/com/gc_reward_checkpoint.lua#L79), [Data/scripts/gcseals.lua:72](../../Data/scripts/gcseals.lua#L72), [Map Server/Actors/Chara/Player/Player.cs:6087](../../Map%20Server/Actors/Chara/Player/Player.cs#L6087), [Data/scripts/quests/com/gc_quest_items.lua:5](../../Data/scripts/quests/com/gc_quest_items.lua#L5).

## Family-by-family reconstruction

The IDs below cover every named row; the inventory separately enumerates all internal rows. Native text, method bodies, scenes and bytecode evidence belong to the other deep-decomp volumes. The focus here is what those methods are connected to, what owns state, and what remains missing.

### Opening familiar: Com0l1 / Com0g1 / Com0u1

**111401 The Price of Integrity; 111601 Breaking the Seals; 111801 Career Opportunities.** These have direct wrappers with explicit NPC/sequence routing and private familiar directors. Peiste `2200708/1359`, drake `2202206/1358`, and anole `2200205/1360` distinguish actor class from combat profile; a display name alone would not establish kill credit or behavior. Native source/aftermath scenes are wrapped around the transfer lifecycle. The quest's public `onKillBNpc` is intentionally inert where the director owns the objective.

The Limsa chain is officer → Walcher → Urianger → private familiar → Walcher agreement → officer. Sequence 30 is the fight; success returns to 40; failed admission restores the visible pre-fight retry step only if that exact journal is still current. The corresponding city routes retain their native methods and different evidence items. Rewards are 1,760 / 1,541 / 1,760 EXP respectively, not a common invented payout. Open questions are exact numeric combat tuning, some history/recognition argument producers, and client admission/scene/return behavior; the code does not make them retail-confirmed.

Evidence: [Data/scripts/quests/com/com0l1.lua:69](../../Data/scripts/quests/com/com0l1.lua#L69), [Data/scripts/directors/Quest/QuestDirectorGcCom0l1.lua:7](../../Data/scripts/directors/Quest/QuestDirectorGcCom0l1.lua#L7), [Data/scripts/directors/Quest/QuestDirectorGcCom0g1.lua:5](../../Data/scripts/directors/Quest/QuestDirectorGcCom0g1.lua#L5), [Data/scripts/directors/Quest/QuestDirectorGcCom0u1.lua:5](../../Data/scripts/directors/Quest/QuestDirectorGcCom0u1.lua#L5).

### Opening seal introduction: Com0l2 / Com0g2 / Com0u2

**111402 Testing the Waters; 111602 Why Did It Have to Be Snakes; 111802 Kindling a Flame.** These are guarded officer conversations, not battles. Acceptance must return numeric 1. They accept the journal if necessary, pay 250 city seals once, invoke the separate closing native event with its explicit argument slots, then pay 1,100 EXP once and request completion. The close can yield; the accepted journal/sequence is checked again. Full-cap refusal leaves the state retryable. Native `(0,0)` arguments are current reconstruction choices where the original producers are unrecovered, not evidence that all histories are equivalent.

Evidence: [Data/scripts/quests/com/com0l2.lua:39](../../Data/scripts/quests/com/com0l2.lua#L39), [Data/scripts/quests/com/com0g2.lua:39](../../Data/scripts/quests/com/com0g2.lua#L39), [Data/scripts/quests/com/com0u2.lua:36](../../Data/scripts/quests/com/com0u2.lua#L36).

### Opening seal tutorial: Com0l3 / Com0g3 / Com0u3

**111403 Seals for the Whorl; 111603 Adder's Nest Egg; 111803 Burning a Hole in One's Pocket.** These are single native shop/introduction conversations with distinct actors and no fabricated delivery objective. Each requires its accept result and awards 1,100 EXP via the checkpoint. Limsa uses Grizzly Gnat `1500202` and the native `processEventFHILAHCTStart` name. The old marker can name a different NPC; current Limsa deliberately publishes no such false map marker. A tutorial about seals is not itself evidence of a seal reward.

Evidence: [Data/scripts/quests/com/com0l3.lua:22](../../Data/scripts/quests/com/com0l3.lua#L22), [Data/scripts/quests/com/com0g3.lua:40](../../Data/scripts/quests/com/com0g3.lua#L40), [Data/scripts/quests/com/com0u3.lua:37](../../Data/scripts/quests/com/com0u3.lua#L37).

### Opening finales: Com0l4 / Com0g4 / Com0u4

**111404 Engineering Victory; 111604 The Mail Must Get Through; 111804 Arms Race.** All enter the current private field battle at sequence 10, with three waves of five exact configured Imperial actors. Success saves sequence 20 before any proof-item delivery. The shared configuration uses 30 minutes, level 22, party cap three, 30-yalm gathering and a 45-yalm boundary. Formation/facing and numeric tuning remain authored. Frozen floor support is not recovered retail actor XYZ; this audit makes no placement edits.

Engineering saves the earned transceiver, reports to Guincum, exchanges through Ebrelnaux, and returns for 500 seals/1,541 EXP. Mail saves Imperial Letter `11000257`, reports to Fulke, exchanges through Radulf for Magitek Designs, and returns for 500/1,541. Current Mail evidence supports the enemy-wave diversion; it does not establish an allied escort actor or a health-based escort failure system. Arms Race continues from the Golden Bazaar battle to Aubrey and three separate C'ndanya/Raaka/Bamponcet contracts, then pays 500/1,760. Distinct contract possession drives the count. The historical Hellhound interpretation should not replace this current route.

Evidence: [Data/scripts/quests/com/gc_field_battles.lua:12](../../Data/scripts/quests/com/gc_field_battles.lua#L12), [Data/scripts/quests/com/com0l4.lua:59](../../Data/scripts/quests/com/com0l4.lua#L59), [Data/scripts/quests/com/com0g4.lua:60](../../Data/scripts/quests/com/com0g4.lua#L60), [Data/scripts/quests/com/com0u4.lua:65](../../Data/scripts/quests/com/com0u4.lua#L65), [docs/gc_finalization_2026-09-17.md:61](../../docs/gc_finalization_2026-09-17.md#L61).

### Campaigns: Com0l5/6, Com0g5/6, Com0u5/6

**111405 An Officer and a Wise Man.** Three owned Unruly Raiders → paired Merlwyb/Urianger conversations in either order → accepted Zanthael lift → Y'shtola audience in the private Bridge → evidence report. Two actor receipts, rather than a single talk counter, ensure the pair is complete. The Bridge handoff has explicit private-area name/type and native choice admission. Count, formation and profile tuning remain authored.

**111406 Ceruleum Shock.** Four distinct Immortal actors → Aisborgsyn → public `com0l510` presentation with payload 1/default fade → Cid at the airship landing. The history argument maps sibling Gridania/Ul'dah completions to native 1–4 branches; the branches are recovered, their server-side history producer is inferred.

**111605 Their Finest Hour.** Stillglade ceremony/address → Papalymo's three event calls and Earthbreaker → one Clay Golem → ordered Papalymo segments then Urianger. The item route binds the exact owned live golem, player/quest/sequence, physical item, range, and encounter lifetime. The reusable item policy and the 50% vulnerability are explicit authored values; they are not recovered native damage coefficients or consumption rules.

**111606 Appetite for Destruction.** Stillglade entry → Lewin introduction → three owned Diremite variants → exact `COM0G510` aftermath → Cid. It is not Toto-Rak. Scene casting supports Diremites but does not recover that exact combat count/profile; those remain authored. Cid's native 1–4 familiarity branches are preserved with an inferred sibling-completion producer.

**111805 Burning Man.** Three pirates → paired Thancred/Urianger → Aubrey → Royal Promenade ceremony `com0u610` with after-warp ownership → Thancred. Two proof items are delivered with retry handling. Count and formation are authored; the named actors and their event order are separately recovered.

**111806 Know Your Enemy.** Engineer briefing → owned Charledore `2289025/40205` → `processEvent_005_03(1)` / `com0u510` after-warp aftermath → Cid. Current main-source restoration is a scoped, documented gladiator analog for combat properties. Calling it an absent battle implementation would ignore the current route; calling the analog recovered retail tuning would overstate evidence. Its old wrapper blocker comment is stale executable-status guidance.

All six use bespoke campaign state, 30-minute private battle configurations, checked field actors and 300 seals + 1,891 EXP at report. Field interactions revalidate zone, area, actor, horizontal distance, vertical tolerance and session after yields. Native dialogue branches do not prove authored geometry or packet order. All six ordinary offers remain disabled.

Evidence: [Data/scripts/quests/com/gc_campaign_quest.lua:10](../../Data/scripts/quests/com/gc_campaign_quest.lua#L10), [Data/scripts/quests/com/gc_campaign_quest.lua:56](../../Data/scripts/quests/com/gc_campaign_quest.lua#L56), [Data/scripts/quests/com/gc_campaign_quest.lua:48](../../Data/scripts/quests/com/gc_campaign_quest.lua#L48), [Data/scripts/quests/com/gc_campaign_quest.lua:148](../../Data/scripts/quests/com/gc_campaign_quest.lua#L148), [Data/scripts/quests/com/gc_campaign_battles.lua:21](../../Data/scripts/quests/com/gc_campaign_battles.lua#L21), [Data/scripts/quests/com/gc_campaign_item_objectives.lua:4](../../Data/scripts/quests/com/gc_campaign_item_objectives.lua#L4), [docs/gc_campaign_enlistment_completion_2026-09-19.md:8](../../docs/gc_campaign_enlistment_completion_2026-09-19.md#L8).

### Enlistment: Com0l7 / Com0g7 / Com0u7

**111407 Till Sea Swallows All; 111607 Serenity, Purity, Sanctity; 111807 By Fire Reborn.** This is a separate owner from campaigns. Sequence 0/accept talks to the city officer, requires the exact native confirmation, saves acceptance, joins the company, pays 1,000 seals, plays the closing `(0,0)` event, and pays 1,080 EXP. The C# join checks the quest ID/company pair and active journal, requires no previous allegiance/ranks, updates the database under the progression lock, assigns rank 11, and refreshes client company state/availability. A same-company rank-11 retry is intentionally idempotent so an interrupted close need not enlist twice.

These are currently disabled and still chain-dependent. A client join animation does not itself modify persistent allegiance; the C# transaction does. Conversely a persisted enlistment can precede interrupted native presentation, which is why acceptance and reward checkpoints exist.

Evidence: [Data/scripts/quests/com/gc_enlistment_quest.lua:15](../../Data/scripts/quests/com/gc_enlistment_quest.lua#L15), [Map Server/Actors/Chara/Player/Player.cs:5746](../../Map%20Server/Actors/Chara/Player/Player.cs#L5746), [Map Server/Database.cs:6236](../../Map%20Server/Database.cs#L6236).

### Toto-Rak: Com5l0 / Com5g0 / Com5u0

**111410/111610/111810 Imperial Devices.** The actual wrappers call `InitTotorakGrandCompanyQuest`, not the similarly named template records. Native city-specific intermediary talks lead to Bloisirant. Entry text receives the real **60-minute** limit in the correct slot: Gridania has one explicit duration argument; Limsa/Ul'dah use the two-argument form. The recovered quest's own final ask is authoritative for that entry attempt, avoiding a second occupancy-guide confirmation.

Interior proof conversations require the actual landed private content, exact owned dungeon NPC, current quest/sequence, and current session. Merely talking to a public actor with the same class is insufficient. Limsa/Ul'dah derive the native interior route variant from the owned NPC's `field1` unique-name suffix; Gridania has its own A-Ruhn-Senna/moogle route. Proof and intermediate journals are city-specific. Reports award 1,000 seals and 2,160 EXP with saved rewards/evidence retry. An installed dungeon implementation is not proof of every GC conversation's native rendering, party entry, failure/return, or proof credit; those remain client verification work.

Evidence: [Data/scripts/quests/com/totorak_gc_quest.lua:29](../../Data/scripts/quests/com/totorak_gc_quest.lua#L29), [Data/scripts/quests/com/totorak_gc_quest.lua:194](../../Data/scripts/quests/com/totorak_gc_quest.lua#L194), [Data/scripts/quests/com/totorak_gc_quest.lua:168](../../Data/scripts/quests/com/totorak_gc_quest.lua#L168), [Map Server/WorldManager.GcQuests.cs:57](../../Map%20Server/WorldManager.GcQuests.cs#L57).

### Darkhold: Com5l1 / Com5g1 / Com5u1

**111411/111611/111811 Into the Dark.** Dedicated city state tables route through Dyrstweitz into the dungeon. Native entry presentation uses level 45, party 4–8 and 60 minutes; actual admission remains the separate Darkhold entry manager's responsibility. The quest objective is the **owned Captain's Quarters Imperial Primus Ordinarius**, not Batraal or any ambient matching actor.

The manager writes earned receipt flag 20 before proof delivery. Limsa entry 30 → report 40 uses proof `11000270` and consumes access `11000269`; Gridania entry 20 → report 40 uses `11000264`; Ul'dah entry 20 → report 30 uses `11000266` and later retires `11000265`. If proof cannot fit, Dyrstweitz can redeliver from the earned receipt. The NPC handoff saves the new sequence before consuming its items, and a later officer report retires leftovers from interrupted handoffs. Final reward is 4,000 seals and 6,231 EXP. The three offers remain disabled. This source audit does not upgrade the Darkhold scene, charging, patrol, floor or normal-party acceptance statuses documented elsewhere.

Evidence: [Data/scripts/quests/com/dzemael_gc_quest.lua:16](../../Data/scripts/quests/com/dzemael_gc_quest.lua#L16), [Data/scripts/quests/com/dzemael_gc_quest.lua:152](../../Data/scripts/quests/com/dzemael_gc_quest.lua#L152), [Map Server/DzemaelManager.cs:1433](../../Map%20Server/DzemaelManager.cs#L1433), [Data/scripts/quests/com/dzemael_gc_quest.lua:210](../../Data/scripts/quests/com/dzemael_gc_quest.lua#L210).

### Level-25 sidequests: Gcl/g/u301 and 302

These six are bespoke and disabled; they use real giver actors, not the template's three officers. Shared reward is 300 seals + 1,891 EXP. The same quest/session/area checks and private-target ownership protect their calls. Item objective ownership is a separate module from the battle's numeric kill callback.

| Quest | Implemented progression and critical distinction | Still authored/unrecovered |
| --- | --- | --- |
| 111417 Gcl301, The Cove | Clifton `1000199`; six owned dart slugs; anti-venom `11000407`; all six kills then report | Reusable representation of “several doses,” formation, tuning and exact item presentation |
| 111418 Gcl302, Saving the Stead Instead | Hasthwab `1001064`; four named pirate NPCs; kill all configured kobolds; optional pirate conversations | Four attackers and Gnole-path variant/formation are authored; named pirates are not interchangeable kill targets |
| 111617 Gcg301, Eternal Recurrence | Dyrstbrod `1001079`; sleeping agent `11000402`; three exact scrap receipts and corresponding guard sleep flags; leather `11000401` | Three guards/charges, exact hazard identities and pickup visible model; guard death alone never clears |
| 111618 Gcg302, The Pen Is Mightier Than the Spear | Dhemdaeg `1000567`; owned Fly-family fight; Challinie `1000956` sketch `11000403`; return | Exact lost native monster binding and numeric profile; the chosen compatible fly is an explicit substitute |
| 111817 Gcu301, Prying Eyes | Lefchild `1000994`; Omnomite `11000406` at the owned trigger; 29 ordinary coblyns plus one enraged carrier; Prismatic Eye `11000405` earned receipt and full-clear receipt | Five ordinary waves plus sixth carrier wave is authored pacing; not thirty Cobalt Eye rewards |
| 111818 Gcu302, Different Strokes | Galeren `1000963` → Cotter `1001685` → Hungry Dreadwolf fight → Westin `1001686` and three optional Beastcleavers → report | Four attackers and compatible Wolf variant/formation; named Beastcleavers belong to aftermath |

Gcg301 explicitly checks the exact private scrap's unique ID, current area, 5-yalm horizontal and 3-yalm vertical proximity, and its corresponding saved sleep flag. Its impossible generic kill threshold (`requiredKills=999`) is intentional: the custom six-flag objective owns completion. Gcu301 saves the exact enraged carrier's earned-eye flag before delivery but only writes the full-clear receipt once the entire battle succeeds; this prevents one early matching kill from clearing a whole wave. The current sixth-wave carrier is alone, eliminating ambiguity from surviving wave-five targets.

Evidence: [Data/scripts/quests/com/gc_sidequest.lua:13](../../Data/scripts/quests/com/gc_sidequest.lua#L13), [Data/scripts/quests/com/gc_sidequest.lua:90](../../Data/scripts/quests/com/gc_sidequest.lua#L90), [Data/scripts/quests/com/gc_sidequest.lua:263](../../Data/scripts/quests/com/gc_sidequest.lua#L263), [Data/scripts/quests/com/gc_sidequest_battles.lua:115](../../Data/scripts/quests/com/gc_sidequest_battles.lua#L115), [Data/scripts/quests/com/gc_sidequest_battles.lua:199](../../Data/scripts/quests/com/gc_sidequest_battles.lua#L199), [Data/scripts/quests/com/gc_sidequest_item_objectives.lua:2](../../Data/scripts/quests/com/gc_sidequest_item_objectives.lua#L2).

### Stronghold surveys: Gcl304 / Gcg304 / Gcu304

**111420 Kobold and the Beautiful; 111620 Gone with the Wind; 111820 When Alchemists Cry.** City giver → field briefing (sequence 0) → three distinct objects (5) → field-sergeant report (15). Lilina/Kurtz Nolan uses objectives `1090206–208` and Coblyn Choler `11000408`; Alaire/Liflin uses `1090209–211` and three separate evidence items `11000409–411`; Berthar/Fouillel uses `1090212–214` and Tears of Nymeia `11000412`. Report is 700 seals/4,450 EXP for each.

Flags 0–2 are authoritative objective receipts; the counter is derived from them. The event's numeric confirmation precedes writing a new flag. The write and final sequence transition precede the progress-dialogue yield, so reopening an already credited object does not create a fourth credit. State refresh repairs missing earned items and an interrupted all-flags sequence before publishing report. Gcl/Gcu progress methods get `(completed,total)`; Gcg has its distinct company and evidence behavior. Current offers are disabled and SQL predecessors are still preserved; direct offline staging does not demonstrate that the preceding generic 303 quest can be completed.

There is a narrow current source defect in the repeated-object repair branch, described under findings below. It does not negate the correctly saved objective receipts but needs attention before treating all partial-delivery paths as equivalent.

Evidence: [Data/scripts/quests/com/gc_field_interaction_quest.lua:20](../../Data/scripts/quests/com/gc_field_interaction_quest.lua#L20), [Data/scripts/quests/com/gc_field_interaction_quest.lua:158](../../Data/scripts/quests/com/gc_field_interaction_quest.lua#L158), [Data/scripts/quests/com/gc_field_interaction_quest.lua:324](../../Data/scripts/quests/com/gc_field_interaction_quest.lua#L324).

### Ifrit: Gcl101 / Gcg101 / Gcu101

**111416/111616/111816 It Kills with Fire.** All three wrappers still select the hard-gated generic template. `Gcl101` contains the full cross-company native narrative: three officer accepts, Louisoix briefing, six crystal/NM checks, Azab Chah gate, Ifrit event, debrief, and company-specific home reports. `Gcg101`/`Gcu101` have no native process methods. Only `Gcl101` has the template accept hook; its existence does not create a valid full route.

The template's step-two `2207301` is an Ifrit placeholder, not an owned Bowl of Embers duty. Missing implementation includes the six distinct NM/objective owners, receptacle `11000419` flow, Louisoix/Azab actor binding, party/level/readiness checks, instance timeout/lockout, actual boss clear, member-specific completion, return/failure cleanup and company/history producers. The template stores 1,000 seals but declares no EXP/gil route payout. Archives can supply candidate amounts; they cannot turn the placeholder into a completed encounter. Cross-company class binding remains a separate native-evidence problem.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:111](../../Data/scripts/quests/com/gc_quest_template.lua#L111), [Data/scripts/quests/com/gc_quest_template.lua:182](../../Data/scripts/quests/com/gc_quest_template.lua#L182), [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl101.lua:6](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl101.lua#L6).

### Device missions: Gcl102 / Gcg102 / Gcu102

**111427 Alive; 111627 Two Vans are Better than One; 111827 Like Father, Like Son.** These have richer native dialogue but remain template routes. Their objective factory is a meaningful isolated model, not a connected duty. It requires exact quest/owner/content, owned enemy identities, active authority, inventory/command admission, clock, success/failure and cleanup callbacks before it can be constructed.

- Gcl102 device `11000423` suppresses future reinforcements. Already spawned enemies remain owned objectives. Every reinforcement requires a unique spawn key, exact actor/profile and XYZ/rotation; missing callbacks or malformed spawns fail closed.
- Gcg102 device `11000422` clears configured poison and applies temporary poison protection to exact bound targets. Wounded actors must survive and reach supplied recovery timing without current poison; mist expires and cleanup removes only its owned protection. Exact status IDs, pulse timing, duration, wounded identities and recovery times are required host inputs. This still does not implement the separate two-van escort movement/path/failure contract.
- Gcu102 device `11000421` removes configured enhancements from the selected exact live owned enemy. The model does not invent an area radius or status set. Native Echo `015` is distinct from later Ryder `020` and completion `025`; the template's `report` hook has no invocation in its generic `advanceQuest`, so declaring it is not wiring that report.

The state object terminalizes before callbacks, attempts cleanup even when notification fails, rejects foreign owner/content calls, and suppresses duplicate death/kill/cancel processing. This is useful implementation scaffolding with strict requirements, but no production private encounter supplies the missing bindings. No test of this factory can validate the missing director, spawns, escort or native packet order.

Evidence: [Data/scripts/quests/com/gc_device_battle_objectives.lua:24](../../Data/scripts/quests/com/gc_device_battle_objectives.lua#L24), [Data/scripts/quests/com/gc_device_battle_objectives.lua:179](../../Data/scripts/quests/com/gc_device_battle_objectives.lua#L179), [Data/scripts/quests/com/gc_device_battle_objectives.lua:215](../../Data/scripts/quests/com/gc_device_battle_objectives.lua#L215), [Data/scripts/quests/com/gc_quest_template.lua:132](../../Data/scripts/quests/com/gc_quest_template.lua#L132), [Data/scripts/quests/com/gc_quest_template.lua:307](../../Data/scripts/quests/com/gc_quest_template.lua#L307).

### Vanguard: Gcl103 / Gcg103 / Gcu103

**111429 Deus ex Machina; 111629 Shadow of the Raven; 111829 Careless Whispers.** All three native files have real presentation methods; all three wrappers remain generic. Gcl routes Guincum → Coral Tower/Merlwyb → Aleport Vanguard → report. Gcg routes Fulke → Kan-E-Senna/Stillglade rite and Swethryk → Crimson Bark Vanguard. Gcu routes Aubrey → Eline/Raubahn → west-of-Horizon/ferry sequence → aftermath. Native body details differ: Gcg Senna has a two-by-two history branch and an extended-widget choice; Gcu Raubahn's method lacks the normal finishing call and must not be copied as an ordinary synchronous completion seam.

Current hooks only start their dialogue (`Start`, `Start/StartAfter`, or `_000_AUBREYStart`). None has a GC battle config in the template. Missing is the entire content owner: real Vanguard identity/profile, entry and completion conditions, scoped participants, timeout/defeat/retry, battlefield actor set, aftermath and return. The two cutscenes are native presentation evidence, not a combat model; their suffix numbering does not necessarily imply chronological order. Stored reward is 1,500 seals each, with no source-declared template EXP.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:113](../../Data/scripts/quests/com/gc_quest_template.lua#L113), [Data/scripts/quests/com/gc_quest_template.lua:100](../../Data/scripts/quests/com/gc_quest_template.lua#L100), [Data/scripts/quests/com/gc_quest_template.lua:133](../../Data/scripts/quests/com/gc_quest_template.lua#L133), [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcu/gcu103.lua:45](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcu/gcu103.lua#L45).

### Garuda: Gcl104 / Gcg104 / Gcu104

**111430/111630/111830 In for Garuda Wakening.** Gcl104 contains the shared rich narrative: company hints, Louisoix choices, Quarrymill/feather flow `11000431 → 11000432`, Cid and leaders, company follow-ups, Zanthael lift ask and its compound scene. Gcg/Gcu are native stubs. Current generic hooks bind only Gcl `Start/StartAfter`; all three retain a step-two Garuda `2209501` placeholder.

The existing Garuda combat system elsewhere in the repository does not by itself implement this quest's Howling Eye admission, item flow, 4–8/level-40 presentation requirements, quest readiness, boss-clear receipts, same-company/history producers, timed exit/lockout or report itinerary. The template never binds those systems. Do not infer that setting one BNPC flag starts a valid Garuda duty or that a generic kill callback can award the missing shared quest state. Stored seals are 2,000; archived EXP/bonuses are not active template payout declarations.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:118](../../Data/scripts/quests/com/gc_quest_template.lua#L118), [Data/scripts/quests/com/gc_quest_template.lua:189](../../Data/scripts/quests/com/gc_quest_template.lua#L189), [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl104.lua:127](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl104.lua#L127).

### Messenger: Gcl105 / Gcg105 / Gcu105

**111431/111631/111831 Don't Hate the Messenger.** Gcl105 holds cross-city leaders/officers, letters, Mor Dhona presentation, Cid's multi-part progression, Castrum-area soldier/container interactions, and home reports. The large method list is not a linear list of sixteen server talk objectives. Some methods are hints, choices, repeat visits, city variants or terminal presentation. Gcg/Gcu are native loaders only.

Current runtime has Gcl `StartLim` and a journal-derived generic step count, no real chain or battle placeholder. Missing are correct NPC/sequence routing, exact letter/item receipts, interaction object, three-soldier objective ownership, multiple-city transfer ownership, case-specific choices/history and final report. The stored 2,000 seals are inert behind the gate. A broad “dialogue quest implemented” claim would be particularly misleading here because the generic officer can only advance a synthetic sequence, and the hard gate intentionally stops that.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:119](../../Data/scripts/quests/com/gc_quest_template.lua#L119), [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl105.lua:8](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl105.lua#L8).

### Castrum: Gcl106 / Gcg106 / Gcu106

**111432/111632/111832 United We Stand.** The shared Gcl file contains company hints but the actual common start is Jaqis's `processEvent_CommonStart_Jakys_01`, not a generic `Start`. Vevina/nav briefings, city warps, Cid/leader instances and a Transmission Tower destruction objective belong to one content flow. Gcg/Gcu remain loader stubs.

No 106 event map is installed in the template and no valid single-BNPC shortcut is declared. Missing are the Castrum Novum party director, tower/object actors, readiness/progress checks, 4–8 player/level-45 entry policy, thirty-minute duty/lockout/loot transfer, leave/wipe/clear handling, city transfer ownership and report. An existing `CompleteRivenroad` path is a different content system and is not evidence of this Castrum quest binding. Stored seals are 5,000, not proof of a completed route.

Evidence: [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl106.lua:39](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl106.lua#L39), [Data/scripts/quests/com/gc_quest_template.lua:96](../../Data/scripts/quests/com/gc_quest_template.lua#L96), [Map Server/WorldManager.cs:18026](../../Map%20Server/WorldManager.cs#L18026).

### Raven: Gcl107 / Gcg107 / Gcu107

**111433/111633/111833 To Kill a Raven.** Gcl107 contains all company starts, council/escort choices, Cid/Enterprise stages, scholars and Scions, Nael presentation, and return scenes. Some native methods return a cutscene/choice result, and Stewart has a widget/remap loop; these cannot be flattened into unconditional officer talks. The fresh bounded-bytecode trace distinguishes Stewart option 1 exiting, option 2 returning to the menu, and options 3/-3 exiting. Its scalar helper makes nine specific text replacements only when its flag is literal boolean true; numeric 1 is not interchangeable with that predicate. See the [Gcl107 reconstructed method dossier](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl107.md) for the exact paths. Gcg/Gcu are loaders only. Runtime binds only Gcl `StartLim` and a generic step-two `2210902` placeholder.

Main SQL currently makes each 107 depend on that company's final promotion 702, while 702 depends on 106. This is a concrete graph, not proof of a bad row. The level-45/level-50 inversion needs retail evidence before any edit, and effective rank-milestone offer rules must be considered separately. Missing implementation is a full Rivenroad quest binding: entry readiness, Enterprise/scout/council transitions, owned battle clear, wipe/reset/return and final history/report. A standalone Rivenroad encounter is not sufficient. Stored seals are 6,000; the template supplies no invented EXP/gil fallback.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:120](../../Data/scripts/quests/com/gc_quest_template.lua#L120), [Data/scripts/quests/com/gc_quest_template.lua:192](../../Data/scripts/quests/com/gc_quest_template.lua#L192), [tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl107.lua:6](../../tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl107.lua#L6). Exact SQL edges appear in the 102-row JSON.

### Level-40 sidequests: Gcl303 / Gcg303 / Gcu303

**111419 It's a Piece of Cake to Bake a Poison Cake.** Native Start/StartAfter/Clear and Qiqirn field events are present; the actual giver is R'sushmo rather than the template's Guincum. The placeholder `2206305` is not a validated owned poison-cake encounter. Need field NPC/target, poison-cake evidence, encounter admission/failure and a real final report.

**111619 Woes of the Botanist.** Native Start/StartAfter/Clear is mapped but Enie/Mog/Kupo field talks are not. Need correct giver/contact/encounter ownership and the native sequence branching; no template battle contract exists to make those dialogues into content.

**111819 A Weaver and a Mummer.** Cahernaut native accept is mapped. `_000/_010` and empty later method stubs are not an implemented Imperial Centurion mesa battle or aftermath. The correct Cahernaut giver exists independently of this officer-only template, and empty stubs need text/sequence evidence rather than guessed dialogue.

All three store 1,000 seals, remain hard-gated, and lack their real objective/content owners. An existing actor spawn alone does not register it as a quest giver; the helper's `SetENpc`/dispatch configuration must agree. The 303 routes also block ordinary progression to their otherwise bespoke 304 surveys through the main SQL prerequisites.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:124](../../Data/scripts/quests/com/gc_quest_template.lua#L124), [Data/scripts/quests/com/gc_quest_template.lua:105](../../Data/scripts/quests/com/gc_quest_template.lua#L105), [Data/scripts/quests/com/gc_quest_template.lua:136](../../Data/scripts/quests/com/gc_quest_template.lua#L136), [Data/scripts/quests/com/gc_quest_template.lua:227](../../Data/scripts/quests/com/gc_quest_template.lua#L227).

### Level-50 sidequests: Gcl305 / Gcg305 / Gcu305

**111426 Oil Crisis.** Syngsmyd's native accept and forge/field scenes describe Deadly Nightshade and oil `11000429`; the template still chooses Guincum as giver, with no oil or field-battle flow. Several later native methods are empty. Need the exact Nightshade battle/quantity, giver binding, evidence receipt and forge return.

**111626 A Taste for Death.** Native Start/StartAfter/Clear plus Tall/Vevina and the vanished logging-party/Ripe Shrieker account. Only the three start/finish hooks are mapped. Giver and field actors, Shrieker content owner, sequence and item/evidence model remain unbound.

**111826 Challenge Accepted.** Native `I_PAGHLOStart` uses a boolean branch; Ryder confrontation methods carry the actual plot after a Rotting Servant encounter. Only the accept hook is mapped. Giver/Ryder actor bindings, Servant fight, aftermath ownership and report remain missing.

All three currently use **the same 2303003 step-two placeholder**, a Termite/Myrmidon Princess content identity unrelated to the three described field objectives. This is a concrete mismatch, not a candidate roster. The hard gate prevents it from serving as a normal completion route. Stored seals are 700 each, with no template EXP declaration. Main-SQL profile completeness belongs to the companion data inventory; this report does not infer it from a live migration.

Evidence: [Data/scripts/quests/com/gc_quest_template.lua:186](../../Data/scripts/quests/com/gc_quest_template.lua#L186), [Data/scripts/quests/com/gc_quest_template.lua:128](../../Data/scripts/quests/com/gc_quest_template.lua#L128), [Data/scripts/quests/com/gc_quest_template.lua:108](../../Data/scripts/quests/com/gc_quest_template.lua#L108), [Data/scripts/quests/com/gc_quest_template.lua:139](../../Data/scripts/quests/com/gc_quest_template.lua#L139).

### War Merit: Gcl701 / Gcg701 / Gcu701

**111428 The Weakest Link; 111628 You Don't Have the Rite; 111828 Gore a Lizard, Hurry.** These are bespoke open-world timed trials, not the template's old 600-second progress probe. Runtime uses 1,800 seconds, 1,000 merit and targets worth 125/150/175; the director is a content-information UI, not a private battle owner. Limsa targets `2206606–608`, Gridania `2206409–411`, Ul'dah `2206525–527`. Commanders are `1001833/1001835/1001834` respectively.

Sequence 0 briefing → 10 start admission → 20 timed kills → 30 commander report → 40 officer debrief → 50 salute reward. Starting in a party is refused. During trial, party membership, inactive receipt or elapsed deadline resets progress when kill credit is attempted; death and area exit also reset. Deadline is persisted as low/high 16-bit counters plus active state, and the UI can restore the same deadline after state refresh. Failure and voluntary cancellation use different director outcomes.

Final promotion requires the route's `emoteDefault1`, not merely talking to the reward officer. The C# rank transaction requires company, active quest, rank 17, and the company medal, then moves to 21. The code records no direct seal reward for 701. Native duration, timeout presentation and reward delivery should be assessed against this actual owner; changing a template duration would not change the trial. Current offers remain disabled. Its coroutine guard gap appears below.

Evidence: [Data/scripts/quests/com/gc_rank_quest.lua:58](../../Data/scripts/quests/com/gc_rank_quest.lua#L58), [Data/scripts/quests/com/gc_rank_quest.lua:154](../../Data/scripts/quests/com/gc_rank_quest.lua#L154), [Data/scripts/quests/com/gc_rank_quest.lua:88](../../Data/scripts/quests/com/gc_rank_quest.lua#L88), [Data/scripts/quests/com/gc_rank_quest.lua:247](../../Data/scripts/quests/com/gc_rank_quest.lua#L247), [Map Server/Actors/Chara/Player/Player.cs:5832](../../Map%20Server/Actors/Chara/Player/Player.cs#L5832).

### Final promotions: Gcl702 / Gcg702 / Gcu702

**111434 Patrol, Interrupted; 111634 Cure for the Common Pox; 111834 Mess with the Goat, Get the Horns.** These are separate from the War Merit timed path. Officer accept → exact target class kill → officer debrief → company salute → C# rank completion and native rank widget. Targets are Great Buffalo `2100801`, Big-hearted Hot Pox `2110312`, and Elder Mosshorn `2102311`. Runtime uses a public actor-class kill callback; unlike private squad battles, it has no per-instance target ownership model.

C# requires the company-specific active quest, rank 27 or already-target 31 retry state, and the final medal. Rank advancement is a compare-and-update database operation. It delivers commemorative item `10011251` if absent and up to 5,000 seals clamped to the rank-31 cap of 50,000, then removes the medal. A target-rank state without the medal is considered a completed transaction retry. Native presentation takes the previous rank 27. Main SQL completion rewards and Lua/C# manual rewards must be audited together; a native reward line is not another grant instruction.

This path has a lock and admission checks, but it is not one atomic cross-table database transaction covering rank, item, seals, medal and quest completion. Exact NM/client salute behavior and failure-injection coverage remain needed. All three offers are disabled, and the SQL 107/702 ordering remains unresolved retail evidence rather than an automatic fix.

Evidence: [Data/scripts/quests/com/gc_rank_quest.lua:291](../../Data/scripts/quests/com/gc_rank_quest.lua#L291), [Data/scripts/quests/com/gc_rank_quest.lua:75](../../Data/scripts/quests/com/gc_rank_quest.lua#L75), [Map Server/Actors/Chara/Player/Player.cs:5832](../../Map%20Server/Actors/Chara/Player/Player.cs#L5832), [Map Server/Database.cs:6275](../../Map%20Server/Database.cs#L6275).

### The 33 internal rows

For each city these are `Com0*8/9`, `Com5*2–5`, and `Gc*501/502/601/602/603`: eleven per city, all `[en]`, prerequisite zero, level zero in main SQL. Their native readable files have no process-event methods in this snapshot. Twenty-eight server wrappers select `InitQuestScaffold` with `noOffer=true`; five wrappers are absent, as listed above. They are not a hidden set of thirty-three playable missing stories whose names, NPCs or rewards can safely be filled from nearby rows.

The distinction from named native stubs matters: the ten named Gcg/Gcu shared-story variants have known SQL titles/prerequisites and a related Limsa narrative but unproved class aliases; these internal rows lack that same route identity. A loader or a text ID can establish an asset dependency without establishing a public quest. The binary/text volume may recover additional initialization detail, but that does not automatically authorize an offer, objective, scene, actor or reward.

Evidence: [Data/scripts/quests/generic_quest_scaffold.lua:19](../../Data/scripts/quests/generic_quest_scaffold.lua#L19), [full row inventory](../../outputs/grand-company-deep-decomp-20260926/runtime/quests.json).

## Concrete findings and remaining work

These are audit findings only; nothing was changed to “fix” gameplay during the decomp task.

1. **Survey repeated-object repair passes an undefined variable.** `gc_field_interaction_quest.onPush` checks `quest:GetSequence()` at entry but never assigns local `sequence`; its already-flagged/all-flags branch calls `repairQuestItems(..., sequence)`. Nil causes that helper to return before repairing the other earned evidence. The branch does ensure the currently clicked object's item first, and state refresh/report evidence repair handles other paths; therefore the precise concern is a multi-item partial-delivery state on this repeated-object path, not every survey completion. A targeted follow-up should replace the missing argument and exercise a state with all three flags and more than one missing earned item. [Data/scripts/quests/com/gc_field_interaction_quest.lua:344](../../Data/scripts/quests/com/gc_field_interaction_quest.lua#L344)

2. **Rank dialogues lack the guarded continuation pattern.** `gc_rank_quest.callQuestEvent` directly returns the native call, and its callers proceed with sequence changes and `EndEvent` after the yield without capturing/rechecking quest/data/session/area. `completePromotion` changes persistent rank, yields for the native completion event, then calls `CompleteQuest`. The opening/campaign/side helpers explicitly protect equivalent boundaries. This establishes missing local guards; a runtime regression should reproduce stale/reaccepted journal and replacement-event cases before asserting the exact observed impact. [Data/scripts/quests/com/gc_rank_quest.lua:65](../../Data/scripts/quests/com/gc_rank_quest.lua#L65), [Data/scripts/quests/com/gc_rank_quest.lua:75](../../Data/scripts/quests/com/gc_rank_quest.lua#L75)

3. **Final promotion reward persistence is not atomic across components.** The rank SQL write precedes the item/seal additions and medal removal. A failure after a component has persisted but before the medal is removed can re-enter the grant branch at target rank. Existing item-presence suppression and no-medal early success cover useful retries, but there is no separate durable seal receipt in this method. A process-crash or injected package failure around the seal/medal boundary needs its own audit. Do not label the existing lock as a database transaction or claim duplicate payment has been observed. [Map Server/Actors/Chara/Player/Player.cs:5880](../../Map%20Server/Actors/Chara/Player/Player.cs#L5880), [Map Server/Actors/Chara/Player/Player.cs:5889](../../Map%20Server/Actors/Chara/Player/Player.cs#L5889)

4. **Named generic hooks are evidence inventory, not complete event routing.** The gate returns before all synthetic advance work. If someone merely removed it, the sequencer would still talk only to the officer, not distinguish all return values, not implement native field/instance transitions, and would leave `report` undelegated. The wrong 305 target and missing cross-company aliases would remain. Implement a dedicated owner and source-backed prerequisites/objectives/reward plan instead of treating the gate as the final missing switch. [Data/scripts/quests/com/gc_quest_template.lua:94](../../Data/scripts/quests/com/gc_quest_template.lua#L94), [Data/scripts/quests/com/gc_quest_template.lua:307](../../Data/scripts/quests/com/gc_quest_template.lua#L307)

5. **Comments/docs and executable state have drifted.** The 15-versus-18 opening count, blanket disabled claims, Arms Race Hellhound description and Com0u6 blocker comment should not be repeated as current implementation facts. Every row in the machine report derives ownership and allowlist membership from source, not these old labels. The five absent internal wrappers are explicit coverage gaps, not guessed implementations.

6. **Unrecovered retail behavior remains distinct from absent implementation.** Native class aliasing for shared Gcg/Gcu stories, argument producers, precise 107/702 progression, original combat statistics, field actor rosters/homes, first-view policies, party bonuses, exact timers/lockouts, and packet choreography need evidence. Separate from those, the named generic quests concretely lack required server owners, while bespoke routes concretely have owners but lack client acceptance and some fidelity details. No quantity of static native dialogue calls alone closes those gaps.

## Reproduction and validation scope

Run `python -B tools/audit_gc_deep_runtime.py` to regenerate the inventory, then `python -B tools/audit_gc_deep_runtime.py --check` to verify the source snapshot. The tool asserts 102 unique SQL rows, 33 internal rows, 15 listed offer IDs, and same-code native presence for every declared template hook. It writes only the dated runtime output directory. SHA-256 manifests allow later source drift to be detected; no local live database was queried.

The project validators `tools/validate_grand_company_quests.py`, `tools/validate_quest_availability.py`, and `tools/validate_gc_campaign_events.py` are appropriate additional static checks. Their passing result is not a client playthrough or a regression test for the newly identified rank/survey edge cases. Full runtime encounter tests are relevant when gameplay changes are made; this read-only decomp creates no new claim about live acceptance.


### Results recorded for this pass

| Check | Result | Scope |
| --- | --- | --- |
| `audit_gc_deep_runtime.py --check` | PASS | 102 SQL rows, 33 internal, 15 listed, source hashes and generated artifacts current |
| `validate_grand_company_quests.py` | PASS | 69 named wrappers, 685 process-event methods, 187 server declarations, 41 literal arities, 42 bespoke / 27 generic |
| `validate_gc_campaign_events.py` | PASS | 32 native campaign method contracts |
| `validate_quest_availability.py` | FAIL, unrelated annotations | 110799 `Spl0i1` The Heat Is On and 110860 `Spl102` Bombard Backlash retain stale “Not implemented” annotations; no GC failure reported |

No gameplay/source fix was made for these unrelated annotation failures. The new audit is a lexical source/data index, not a runtime regression harness or live-client acceptance.

## Native per-code dossiers

Each link below opens the fresh reconstructed method/path dossier. The core binary pipeline traces 695 selected methods including scalar helpers, while this runtime index counts 685 `processEvent` declarations; those intentionally different counts are not conflicting quest totals. All 102 core SQL codes are linked, including empty native classes. [Noc001](../../outputs/grand-company-deep-decomp-20260926/reconstructed/noc001.md) is a separately analyzed adjacent quest and does not increase the 102 core count.

| Runtime family | Native dossiers |
| --- | --- |
| opening familiar | [Com0l1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l1.md), [Com0g1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g1.md), [Com0u1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u1.md) |
| opening seal introduction | [Com0l2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l2.md), [Com0g2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g2.md), [Com0u2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u2.md) |
| opening seal tutorial | [Com0l3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l3.md), [Com0g3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g3.md), [Com0u3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u3.md) |
| opening finale | [Com0l4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l4.md), [Com0g4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g4.md), [Com0u4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u4.md) |
| campaign | [Com0l5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l5.md), [Com0l6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l6.md), [Com0g5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g5.md), [Com0g6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g6.md), [Com0u5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u5.md), [Com0u6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u6.md) |
| enlistment | [Com0l7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l7.md), [Com0g7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g7.md), [Com0u7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u7.md) |
| internal | [Com0l8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l8.md), [Com0l9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l9.md), [Com5l2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l2.md), [Com5l3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l3.md), [Com5l4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l4.md), [Com5l5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l5.md), [Gcl501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl501.md), [Gcl502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl502.md), [Gcl601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl601.md), [Gcl602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl602.md), [Gcl603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl603.md), [Com0g8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g8.md), [Com0g9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g9.md), [Com5g2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g2.md), [Com5g3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g3.md), [Com5g4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g4.md), [Com5g5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g5.md), [Gcg501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg501.md), [Gcg502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg502.md), [Gcg601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg601.md), [Gcg602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg602.md), [Gcg603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg603.md), [Com0u8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u8.md), [Com0u9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u9.md), [Com5u2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u2.md), [Com5u3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u3.md), [Com5u4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u4.md), [Com5u5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u5.md), [Gcu501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu501.md), [Gcu502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu502.md), [Gcu601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu601.md), [Gcu602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu602.md), [Gcu603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu603.md) |
| Toto-Rak | [Com5l0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l0.md), [Com5g0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g0.md), [Com5u0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u0.md) |
| Dzemael | [Com5l1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l1.md), [Com5g1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g1.md), [Com5u1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u1.md) |
| Ifrit | [Gcl101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl101.md), [Gcg101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg101.md), [Gcu101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu101.md) |
| side 301 | [Gcl301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl301.md), [Gcg301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg301.md), [Gcu301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu301.md) |
| side 302 | [Gcl302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl302.md), [Gcg302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg302.md), [Gcu302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu302.md) |
| side 303 | [Gcl303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl303.md), [Gcg303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg303.md), [Gcu303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu303.md) |
| field survey | [Gcl304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl304.md), [Gcg304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg304.md), [Gcu304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu304.md) |
| side 305 | [Gcl305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl305.md), [Gcg305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg305.md), [Gcu305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu305.md) |
| device mission | [Gcl102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl102.md), [Gcg102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg102.md), [Gcu102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu102.md) |
| War Merit | [Gcl701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl701.md), [Gcg701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg701.md), [Gcu701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu701.md) |
| Magitek Vanguard | [Gcl103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl103.md), [Gcg103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg103.md), [Gcu103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu103.md) |
| Garuda | [Gcl104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl104.md), [Gcg104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg104.md), [Gcu104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu104.md) |
| Messenger | [Gcl105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl105.md), [Gcg105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg105.md), [Gcu105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu105.md) |
| Castrum Novum | [Gcl106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl106.md), [Gcg106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg106.md), [Gcu106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu106.md) |
| Raven | [Gcl107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl107.md), [Gcg107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg107.md), [Gcu107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu107.md) |
| final promotion | [Gcl702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl702.md), [Gcg702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg702.md), [Gcu702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu702.md) |
