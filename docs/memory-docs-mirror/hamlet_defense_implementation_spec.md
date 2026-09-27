# Hamlet Defense — Player Flow and Implementation Specification

Status: working implementation/recovery specification for FFXIV 1.23b.

This document turns the historical player footage, the archived Hamlet Defense rules, and the current server/client research into one implementation plan. It is intentionally split between:

- **Retail behavior** — what the player should experience.
- **Recovered data** — values found in local DAT/decompilation/code or archived 1.x documentation.
- **Current implementation** — what this repository currently does.
- **Open gap** — behavior that still needs packet capture, script recovery, or live validation.

The full score-line catalog remains in `docs/hamlet_defense_point_rules.md`. This document is the player-facing and systems-facing companion to that catalog.

For the detailed NPC roster, field trade-in flow, gathering/crafting lists, battle support loops, and discipline-by-discipline player guide, see [Hamlet Defense — NPC, Trade-In, Gathering, Crafting, and Role Reference](hamlet_defense_npc_and_role_reference_2026-08-24.md).

## 1. Source evidence

### Historical videos

The videos do not have usable YouTube transcripts, so footage and expanded descriptions were used as behavioral evidence. They are useful for party composition, role division, HUD shape, pacing, and support tactics; they should not override recovered client tables when exact numbers conflict.

| Source | What it contributes |
| --- | --- |
| [FFXIV Patch 1.22 - Rank 2 Hamlet Defense Battle (Hyrstmill)](https://www.youtube.com/watch?v=Gkbm3VrAnKA) | A full Hyrstmill battle. The description identifies a party of 1 WAR, 3 BLM, 2 WHM, 1 DoH, and 1 DoL; combat jobs handle the beastmen while Hand/Land jobs apply support effects. The footage shows the party defending militia and carts through several waves before the leader. |
| [Final Fantasy XIV 1.0 - Aleport Hamlet Defense (61,000 Score & Tremor Seal Drop)](https://www.youtube.com/watch?v=E-8jiYR3PKA) | DoL perspective. The description records a practical Humour-pot rotation: red, blue, repeated red, a late blue around the last wave, then green and blue when the undead special appears. This is a strategy example, not a hard-coded retail sequence. |
| [FFXIV Limsa Hamlet r2 1.22a](https://www.youtube.com/watch?v=LeB8YcY9NYs) | Additional rank-2 Limsa/Aleport footage with the combat HUD, party roster, town defense, and late-battle behavior visible. The upload has no description. |
| [Let's Play Final Fantasy XIV [551] Hamlet - The Battle for the Golden Bazaar](https://www.youtube.com/watch?v=DXfN4OstmoM) | 2012-07-20 Golden Bazaar footage. The battle HUD and chat log visibly expose militia-archer/objective messages, support prompts, and the settlement-defense context. It is useful for reconstructing player feedback, but it does not provide a reliable score breakdown. |
| [Final Fantasy XIV Hamlet Defense 1.22a](https://www.youtube.com/watch?v=u3TOyUiTQ-U) | 2012-05-22 battle from a party that explicitly lists 1 WAR, 1 PLD, 2 BLM, 2 WHM, 1 Miner, and 1 Botanist. The uploader calls it a second attempt after the first failed because the party did not understand the event, which is strong evidence that role coordination—not just damage output—is part of the intended learning curve. |
| [FFXIV - Hamlet Defense - Battle for Aleport](https://www.youtube.com/watch?v=CHSi5tHwosU) | 2012-07-16 PLD perspective. The uploader reports that the NM does not appear until about ten minutes, that PLD spends the opening moving around to buff/cure, and that the late role becomes kiting the NM through a tunnel. This is the clearest surviving evidence for the tank's low-DPS, objective-control loop. |

For the cross-video role guide, score interpretation, and evidence confidence notes, see the [1.0 video research appendix](hamlet_defense_video_research_2026-08-24.md).

### Local research and code

- `docs/ffxiv-1.0-wiki/pages/Hamlet_Defense.html` — archived player rules, roles, supply items, support effects, score descriptions, and rewards.
- `docs/hamlet_defense_framework.md` — current server implementation status and the historical evidence used to seed it.
- `docs/hamlet_defense_point_rules.md` — complete score-line catalog with text IDs, values, and implementation status.
- `docs/hamlet_missing_data_2026-06-12.md` — client lifecycle, director, widget, and content-group findings.
- `docs/hamlet_widget_contract_2026-06-19.md` — recovered widget ownership and user-message boundaries.
- `Map Server/DataObjects/HamletDefenseData.cs` — shared rules/constants and per-battle data model.
- `Map Server/Hamlets/HamletDefenseManager.cs` — seeded hamlet definitions, supply contribution path, and test lifecycle.
- `Map Server/Actors/Director/HamletDefenseDirector.cs` — battle state, waves, support effects, score calculation, result window, and cleanup.
- `Data/scripts/directors/Hamlet/Defense.lua` — current client-director bootstrap experiments.
- `Data/sql/server_hamlet_supply.sql` — persistent supply-cycle and provisioner-contribution tables.
- `docs/hamlet_defense_npc_and_role_reference_2026-08-24.md` — named NPCs, trade-in surfaces, supply items, battle support loops, and implementation gaps.

## 2. Player-facing concept

Hamlet Defense is a server-wide, repeating defense campaign for one of three settlements. A settlement spends most of its cycle accepting supplies, then enters a limited battle window where parties can queue for instanced defenses.

The core loop is:

```text
50-hour supply phase
    -> donations raise stockpile and supply rating
    -> top contributors form the provisioner ranking
25-hour battle phase
    -> party enters an instanced battle
    -> DoW/DoM fight, DoL debuff, DoH empower militia
    -> protect four carts / militia while waves arrive
    -> defeat the leader or survive the time limit
    -> calculate score, chest tier, provisioner rewards, achievements
    -> short result/re-entry window
    -> next 75-hour cycle
```

The supply phase is global per hamlet; the battle is party-instanced. A party's battle score is determined by its battle actions and the supply rating that was active when the battle was created.

## 3. Hamlets and static identity

| Key | Battle | City State | Beast tribe | Zone | Raid/content ID | Supply captain | Quartermaster | Opening / ending scene | Seal |
| --- | --- | --- | --- | ---: | ---: | --- | --- | --- | --- |
| `aleport` | The Battle for Aleport | Limsa Lominsa | Kobold | 129 | 8 | Rhotblaet (`1500340`) | B'davzzi (`1500433`) | `ham0s201` / `ham0s202` | Tremor |
| `hyrstmill` | The Battle for Hyrstmill | Gridania | Ixal | 152 | 9 | Rontremont (`1500342`) | Dhebi Polaali (`1500320`) | `ham0f301` / `ham0f302` | Vortex |
| `goldenbazaar` | The Battle for the Golden Bazaar | Ul'dah | Amalj'aa | 171 | 10 | Carmine (`1500341`) | P'lhabgo (`1500434`) | `ham0w201` / `ham0w202` | Inferno |

The actor class IDs and scene keys above are recovered local data. Coordinates, actor placements, and exact retail entry context are still subject to live validation.

## 4. Supply phase

### 4.1 What players do

During the supply phase, players visit the hamlet's militia quartermaster and deliver requested supplies. The delivery contributes to:

1. The hamlet's global stockpile.
2. The delivering character's provisioner total for the current cycle.
3. The character's anima reward for the delivery.
4. The hamlet's supply rating once thresholds are crossed.

This is a real NPC exchange/delivery surface, not a normal shop: the quartermaster has a request list, accepts matching craft/gather items (and the separate materia-enhanced gear category), consumes accepted items, awards anima, and updates the global and personal supply ledgers. The detailed request tables and field NPC names are in the [NPC and role reference](hamlet_defense_npc_and_role_reference_2026-08-24.md).

The supply phase must reject deliveries after its deadline. Contributions from the old cycle must never leak into the new cycle, even if a player reconnects or submits a delayed request.

### 4.2 Recovered common requested supplies

The local implementation seeds the following common set:

| Type | Item | Quantity per delivery |
| --- | --- | ---: |
| Gathered | Light Kidney Ore | 10 |
| Gathered | Young Indigo Herring | 10 |
| Gathered | Supple Spruce Branch | 10 |
| Crafted | Militia Bow | 1 |
| Crafted | Militia Sword | 1 |
| Crafted | Militia Helm | 1 |
| Crafted | Militia Gorget | 1 |
| Crafted | Militia Longboots | 1 |
| Crafted | Militia Leggings | 1 |
| Crafted | Militia Poultice | 1 |
| Crafted | Militia Rations | 1 |

The archived rules describe the gathered items as coming from the appropriate gathering regions and the crafted items as being made by their matching Disciple of the Hand class. The server should treat the requested-item table as data, not as a hard-coded item-name switch.

### 4.3 Contribution values

The currently selected client-authored values are:

| Delivery quality | Stockpile points | Anima |
| --- | ---: | ---: |
| Normal quality | 1,000 | 4 |
| High quality | 10,000 | 6 |
| Caravan contribution | 5,000 | scenario-specific |

Supply rating thresholds are:

| Rating | Cumulative stockpile |
| ---: | ---: |
| 0 | below 100,000 |
| 1 | 100,000 through 2,999,999 |
| 2 | 3,000,000 or more |

Rating 2 is currently the maximum and applies the rank-2 battle-score multiplier. The contribution value, anima, and rank values should be versioned by content patch because archived community tables disagree with some client-mined values.

### 4.4 Ranking and provisioner eligibility

Each hamlet/cycle stores per-character contribution totals. At battle entry, the server snapshots the current top 20 for that hamlet and cycle. A party receives the `Provisioner Present` score line if at least one battle-start member is in that top 20.

The top three provisioners receive the priority provisioner reward pool. Ranks 4 through 20 receive the regular provisioner pool. Ranking is a cycle-scoped snapshot; do not recompute eligibility from a later cycle after the battle has started.

Required persistence shape:

```text
server_hamlet_supply_state
    hamletKey, cycleStartUtc, phase, phaseEndsAtUtc,
    stockpilePoints, supplyRating

server_hamlet_supply_contributions
    hamletKey, cycleStartUtc, characterId,
    points, deliveries, lastContributionAtUtc
```

The unique key must include `hamletKey`, `cycleStartUtc`, and `characterId`. A delivery transaction must validate the phase and item state, remove the item, award anima, and increment both global and character totals atomically.

### 4.5 Materia-enhanced equipment

The archived rules allow fully repaired materia-enhanced equipment as a supply category. The exact point/anima formula is not recovered. Keep this path disabled or preview-only until the following are known:

- accepted item and materia combinations;
- durability requirement and whether HQ matters;
- point/anima formula;
- whether a meld is consumed or merely inspected;
- duplicate-delivery and retry behavior.

The current item-delivery path is further along than the materia path: `PopulaceHamletSupply` opens the recovered delivery widget and `HamletDefenseManager.DeliverSupply` validates the item instance, phase, location, quantity, contribution, inventory removal, and anima transaction. The native Noc002 mutation/ranking UI still needs live validation.

## 5. Party entry and battle setup

### 5.1 Rules to enforce

- Party size: exactly eight members.
- Player level: 45 through 50 inclusive.
- All four disciplines may participate: War, Magic, Land, and Hand.
- Battle content is instanced and tied to one hamlet/cycle rating.
- Battle time limit: 30 minutes.
- A successful result grants a 15-minute battle re-entry/participation timer.
- A failed result grants a 5-minute retry timer.
- The post-result reward/inspection window is 5 minutes.

The historical footage demonstrates that DoL and DoH are intended members of the party, not spectators. The Hyrstmill run explicitly used one of each while the combat jobs handled the enemy waves. A second 1.22a run used a combat-heavy setup—1 WAR, 1 PLD, 2 BLM, 2 WHM, 1 Miner, and 1 Botanist—with no DoH, showing that support roles are strategic choices rather than a single mandatory party template.

The complete field/battle interaction sequence is documented in the [NPC and role reference](hamlet_defense_npc_and_role_reference_2026-08-24.md): supply-phase gathering is ordinary open-world gathering, supply-phase crafting is ordinary requested-item synthesis, and battle-phase DoL/DoH work uses duty-owned caches/crates and fragile one-at-a-time delivery objects.

### 5.2 Entry flow

The intended player flow is:

1. The party speaks to the hamlet militia captain during the battle phase.
2. The server validates party size, levels, current hamlet phase, and re-entry timers.
3. The server snapshots party classes, job-crystal state, provisioner ranking, and the active supply rating.
4. The server creates or assigns the private content area and binds the party to the Hamlet director.
5. The client plays the hamlet opening scene and opens the title/Duty Commenced/main-HUD sequence.
6. The battle timer starts when the duty is actually commenced, not when the player first talks to the captain.

The current `!testhamlet retailstart` path exercises the public lifecycle, not the final production captain/occupancy trigger. The production entry path remains an open implementation item.

## 6. Battle map and objectives

### 6.1 Defended objects

Each battle has:

- four supply carts/caches;
- three defense lines;
- ten militia archers distributed across the three lines;
- four militia support NPCs: smith, outfitter, cook, and barber;
- enemy spawn points and a central settlement area;
- a captain/quartermaster interaction point for battle support.

The current militia distribution is three archers on the front line, three on the second line, and four on the third line. The four carts are the primary loss condition and must be represented as distinct, targetable state rather than a single aggregate counter.

### 6.2 Win and loss conditions

The party wins when either:

1. the beast tribe leader is defeated; or
2. the 30-minute timer expires while at least one supply cart remains.

The party loses when all four supply carts are destroyed. A production implementation should also define behavior for an abnormal empty-wave completion, party abandonment, disconnect, instance destruction, and server restart.

### 6.3 Current seeded wave schedule

The following is the current repository schedule. It is a useful implementation baseline, but the exact retail wave timing and spawn locations still need live validation.

| Time from duty start | Aleport | Hyrstmill | Golden Bazaar |
| ---: | --- | --- | --- |
| 0s | 3 Kobold Ashmen + 1 Kobold Priest | 3 Ixali Strongbeaks + 1 Ixali Fogcaller | 3 Amalj'aa Pugilists + 1 Amalj'aa Thaumaturge |
| 20s | Frightened Crab | Frightened Lemur | Frightened Cactuar |
| 45s | 4 Kobold Junkmen + 2 Kobold Priests | 3 Ixali Sabreurs + 2 Ixali Fogcallers | 4 Amalj'aa Lancers + 2 Amalj'aa Thaumaturges |
| 90s | Synthetic Bomb | Scout Wolf | Battle Drake |
| 120s | 11th Order Patriarch Gu Bu | Sazel Ciloc the Divine | Stonespike Tanadd Gah |
| 1200s, gated | Errant Soul | Errant Soul | Errant Soul |

The leader wave is level 52 in the current data; ordinary waves use levels 45–50. The current director checks progress every two seconds and issues a leader order roughly every 30 seconds while the leader is alive.

### 6.4 Enemy targeting

Invaders should begin with hate on the nearest living cart or militia member so the battle is active immediately. Players can then intercept, tank, heal, crowd-control, or kill the enemies. Leader orders periodically reset enemy focus toward defended objects; Musked support can prevent or reset those orders.

### 6.5 Special foes

The special-foe sequence is intentionally conditional:

- the stray fauna must appear in the early battle;
- the beast of burden must appear before the leader wave;
- normal non-leader beastmen must be dead;
- the two earlier unique foes must have been killed by militia archers for the Errant Soul gate;
- Errant Soul is then eligible during the late battle window.

The exact retail death-source target and timing still need capture validation. The current server tracks the archer-kill gate explicitly so this behavior is not accidentally replaced by a simple “all enemies dead” check.

## 7. Player roles inside the battle

### 7.1 Disciples of War and Magic

Combat players are the front line. Their responsibilities are:

- intercept incoming beastmen before they reach carts or militia;
- burn down each wave without losing defense lines;
- keep the leader occupied or defeat it when the party is ready;
- protect DoL/DoH players while those players perform support actions;
- heal and recover militia-facing damage when the job kit allows it;
- avoid unnecessary deaths because the no-KO score line is valuable.

The footage and archived rules emphasize area damage, attention control, and keeping the unarmed support players and militia alive.

The added PLD footage makes the opening rhythm explicit: a tank may have little useful damage to contribute before the named monster arrives, so the player patrols the defense, helps with buffs/cures, and then takes the named monster through a controlled kite path. The server must not treat low personal DPS during this period as inactivity.

### 7.2 Disciples of the Land — Humour pots

DoL players collect alchemical Humour pots placed around the hamlet and deliver them intact to the quartermaster. A three-pot sequence produces a Warden's Justice effect:

| Pot sequence | Effect |
| --- | --- |
| red + red + red | enemy attack down |
| blue + blue + blue | enemy HP down |
| green + green + green | put enemies to sleep |
| one red + one blue + one green | reset enemy enmity/orders |

The field loop must model the original risk:

- a DoL can carry only one pot/material at a time;
- taking damage while carrying it drops it;
- the pot must reach the quartermaster intact;
- the quartermaster acknowledges partial progress and completes the effect on the third valid delivery;
- delivery can attract one or more beastmen to the support player;
- support actions should be visible in the HUD and score ledger.

The Aleport video gives one practical late-wave strategy: use attack-down early, apply HP-down around the final wave, then use the green/blue combination around the undead special to obtain the mixed support bonus. The server should expose the tools for this strategy without forcing that exact order.

### 7.3 Disciples of the Hand — instruments of warfare

DoH players take materials from a nearby crate and synthesize them into an instrument. The player then delivers the instrument to the quartermaster. The original behavior is deliberately vulnerable:

- only one material can be carried at a time;
- picking up another material drops the current one;
- taking damage while carrying or crafting drops the material;
- DoH players cannot enter active combat mode inside the defense;
- delivery can pull one or two enemies onto the crafter.

| Instrument | Militia effect |
| --- | --- |
| Spiked | increase militia archer attack |
| Blessed | grant regeneration to militia laborers/support NPCs |
| Reinforced | increase militia defense and evasion |
| Musked | reset beastmen orders and enmity |

The implementation should normalize the player-facing name as `Musked`; the current parser accepts `musked` and `enmity` as test aliases.

## 8. Score calculation

### 8.1 Formula

At result time:

```text
rawScore = sum(all triggered score rows)
finalScore = rawScore * (supplyRating >= 2 ? 2 : 1)
```

Score rows must be generated from a snapshot of battle state, not from chat text. Counted events should be idempotent: a death, support delivery, or cart loss must only increment its counter once.

### 8.2 High-value score rows

The current client-authored table selects these values where archived sources disagree:

| Category | Points |
| --- | ---: |
| Balanced party (War, Magic, Land, Hand) | 50 |
| Eight distinct classes | 30 |
| Same profession for all eight | 500 |
| Each Land member present | 100 |
| Each Hand member present | 100 |
| Provisioner in top 20 | 3,000 |
| Each normal beastman defeated | 10 |
| All normal melee units defeated | 1,000 |
| All normal caster units defeated | 1,000 |
| No normal beastmen survivors | 2,000 |
| Rank 1 leader defeated | 500 |
| Rank 2 leader defeated | 3,000 |
| All normal beastmen defeated before leader arrival | 500 |
| Stray fauna defeated | 1,500 |
| Beast of burden defeated | 1,500 |
| Errant Soul defeated | 5,000 |
| All non-beastmen foes defeated | 1,000 |
| No KO | 500 |
| Each surviving militia NPC | 100 |
| No militia casualties | 1,500 |
| Each surviving cart | 500 |
| All carts intact | 1,500 |
| Front/second/third line intact | 1,500 / 500 / 100 |
| All defense lines intact | 500 |
| Each Warden's Justice completion | 10 |
| All Warden's Justice methods used | 150 |
| Each support instrument delivered | 10 |
| Each militia defense/attack/regen effect | 30 |
| All instrument varieties used | 100 |
| Each leader order prevented | 30 |
| All leader orders prevented | 300 |

The complete table also includes weapon-level, damaged-weapon, rally/goad, reckless gathering/crafting, deserter, missing-member, materia, and captivity rows. These are cataloged but not all are evaluated locally yet; see `docs/hamlet_defense_point_rules.md`.

The [video research appendix](hamlet_defense_video_research_2026-08-24.md) explains how players should read these rows: party composition is snapshotted at entry, event counters are accumulated during the defense, preservation and support bonuses reward protecting the settlement, and rank 2 doubles the final score. The 61,000-point Aleport footage demonstrates the scale of a successful high-score run, but it is not sufficient by itself to reverse-engineer every individual trigger.

### 8.3 Conflicting values

The archived eLeMeN/Gamer Escape-derived table contains older values for some rows, including `Provisioner Present` and the rank-2 leader bonus. The repository currently uses the client-mined `hamletDefScore.csv` values and records the discrepancy in the framework docs. Do not silently mix values from different versions.

## 9. Results and rewards

### 9.1 Result flow

On victory:

1. Freeze battle counters and calculate score rows.
2. Apply the supply-rating multiplier.
3. Show the victory state and final score.
4. Spawn one party-shared coffer.
5. Keep the result/captain interaction available for five minutes.
6. Allow eligible provisioners to claim their separate reward from the militia captain.
7. Apply achievement progress and the battle re-entry timer.
8. Close the result window, despawn battle NPCs, and return players from a private area.

On failure:

1. Freeze the partial score for diagnostics/result display.
2. Show the defeat state.
3. Keep the result window available for the short failure inspection/retry period.
4. Do not award a victory coffer or provisioner victory reward.
5. Cleanly end the content instance and return the party.

### 9.2 Chest tiers

| Final score | Coffer tier |
| ---: | --- |
| 1–29,999 | Bronze |
| 30,000–49,999 | Silver |
| 50,000–59,999 | Gold |
| 60,000+ | Highest |

The Aleport footage demonstrates a 61,000-point result and a Tremor Seal outcome, which is consistent with the highest tier and Aleport's seal pool.

### 9.3 Reward ownership and idempotency

The party coffer is shared: opening it should resolve one party-level reward, not grant a separate random coffer to every member. Provisioner rewards are character-level and require a rank captured at battle start.

Reward claims must be backed by a persistent ledger before enabling production mutation. The ledger needs:

- director/content instance ID;
- character ID and party ID;
- reward surface (`coffer`, `provisioner`, `priority`, `seal`);
- resolved item/currency rows;
- claimed timestamp and expiry;
- idempotency key;
- inventory/currency transaction result;
- rollback or retry state.

The current local reward code has the correct result-window shape and recovered pools, but its in-memory claim set and approximate reward transaction are not sufficient for production disconnect/retry behavior.

### 9.4 Recovered reward pools

The per-hamlet pools are already seeded in `HamletDefenseManager.BuildHamlets()`:

- **Aleport:** Grade 5 Dark Matter, Limsa militia armor/accessories, Militia tools, Tremor Seal, and Crimson Star prism.
- **Hyrstmill:** Grade 5 Dark Matter, Gridania militia armor/accessories, Militia tools, Vortex Seal, and Indigo Star prism.
- **Golden Bazaar:** Grade 5 Dark Matter, Ul'dah militia armor/accessories, Militia tools, Inferno Seal, and Emerald Star prism.
- **Priority provisioner pools:** the hamlet seal plus its three city/tribe-specific currency pieces.

Exact random weights are not recovered. Keep item pools data-driven and do not claim retail weight parity until a drop-table or repeated-result capture closes that gap.

## 10. Client/UI contract

### 10.1 Intended retail sequence

The latest client research establishes the intended high-level order:

1. `InstanceRaidBaseClass.startEvent` processes the duty start and opening scene.
2. A scene effect opens the hamlet title widget.
3. `InstanceRaidHamletDefense.processStartEffect` opens the Duty Commenced presentation.
4. The subclass opens the main `HamletDefenseWidget` and popup surface.
5. During the battle, user-message updates refresh the live HUD.
6. The ending scene/result signal opens the score/result surface.

The main widget is a desktop/slot-15 surface. The title, Duty Commenced, main HUD, popup, score, and ranking surfaces are separate client objects; rendering one does not prove the others are wired.

### 10.2 Known data lanes

| Lane | Purpose | Current status |
| --- | --- | --- |
| `0x0137` / guildleve work sync | carts, defeated enemies, compact battle-value HUD | usable fallback/current local path |
| `0x0133` GenericData | user-message and requested-data paths | transport works; retail lifecycle gate still matters |
| `0x01A8` HamletDefenseScore | score/result rows | native compact parser path accepted locally; automatic result open not proven |
| `0x01A6` HamletSupplyRanking | top-20 ranking | native container shape is known, but non-empty field semantics remain gated |
| `0x0132` / event functions | director/client bootstrap and widget calls | accepted in some contexts; blind direct calls are unsafe and not the retail proof |

The currently recovered main-HUD user-message coverage is:

- subtype 3: reset/harvest clear;
- subtype 4: field buffs;
- subtype 5: defense-line state;
- subtype 6: goods/cart state;
- subtype 7: cargo target;
- subtype 8: boss/leader flag;
- subtype 9: battle value.

Subtypes 1 (title/timer), 2 (harvest counts), and 10 (popup notices) remain gated until their exact arguments and live behavior are validated.

### 10.3 UI implementation rule

Do not open Hamlet through a generic `WidgetOpenCommand` or by blindly creating a guessed widget-container name. The correct production path must attach the active Hamlet director/content group and allow the stock `InstanceRaidHamletDefense` lifecycle to own title, duty, HUD, and result state.

The current public test lifecycle safely proves transport and combat behavior but still falls back to a Guildleve/Behest-family HUD in some profiles. Treat a visible guildleve HUD, an accepted score packet, or a rendered isolated form as a diagnostic success only—not as retail Hamlet parity.

## 11. Server architecture

### 11.1 Data and persistence

`HamletDefenseData` should remain the single data object for one battle's static identity:

```text
identity: key, name, city, beast tribe, zone, raid id
entry: captain, quartermaster, actor classes, level/party/time rules
layout: line points, cart points, enemy points
actors: militia roles, wave mobs, special foes
client: title index, scene keys, display guildleve id
economy: requested supplies, score rules, chest/provisioner pools
achievements: per-hamlet IDs
```

The global supply service should own cycle state and contribution transactions. The battle director should receive an immutable supply snapshot at construction and never query a moving stockpile rating halfway through a fight.

### 11.2 Director state machine

Use a state model equivalent to:

```text
SUPPLY_OPEN
  -> DEFENSE_OPEN
  -> ENTRY_VALIDATING
  -> INTRO
  -> ACTIVE
       -> VICTORY
       -> DEFEAT
  -> RESULT_WINDOW
  -> CLOSED
```

Important invariants:

- only `ACTIVE` spawns waves and advances the battle timer;
- only one terminal transition is allowed;
- score rows are frozen at the first terminal transition;
- reward claims are allowed only during `RESULT_WINDOW`;
- cleanup is safe if the instance, player, or NPC has already disappeared;
- a delayed callback must verify that it still owns the same director/content area before mutating state.

### 11.3 Battle tick responsibilities

Every tick should:

1. expire support effects;
2. spawn due waves if their prerequisites are met;
3. process leader orders;
4. count deaths exactly once;
5. detect line breaches and cart losses;
6. refresh HUD state;
7. evaluate victory, defeat, and timeout;
8. persist or publish any required score/progress event.

The current director runs the expensive progress/casualty check every two seconds. That is a reasonable baseline, but the final implementation should avoid using a polling interval as the only source of truth for death or inventory transactions.

## 12. Implementation status in this checkout

| Area | Status | Notes |
| --- | --- | --- |
| Three hamlet identities | Implemented | Static IDs, actors, scenes, waves, rewards, and achievements are seeded. |
| Supply cycle persistence | Implemented/tested | 50/25-hour cycle, thresholds, contribution totals, and top-20 ranking tables exist. |
| Supply NPC UI | Partial | Preview and actor/text paths exist; production transaction/UI parity still needs validation. |
| Party composition snapshot | Implemented | Class, job crystal, and provisioner state are captured at battle start. |
| Militia/carts/waves | Implemented baseline | Server-side combat backend spawns them and tracks targets, lines, carts, special foes, and leader. |
| DoL/DoH support effects | Implemented shortcut path | Effects/counters exist; full field pickup, carry, damage-drop, and crafting loops remain. |
| Score calculation | Broad partial | Many rows are evaluated; cataloged equipment/action rows still need hooks. |
| Rank-2 multiplier | Implemented | Final score is doubled at rating 2. |
| Score packet parser/builder | Strong experimental | Native `0x01A8` compact shape is accepted locally; result-window trigger is missing. |
| Ranking packet | Gated | Empty payload is safe; non-empty field semantics are not production-ready. |
| Retail entry/occupancy | Not proven | `!testhamlet` lifecycle is a test harness, not a natural captain-to-instance path. |
| Retail title/live HUD | Not proven | Current safe profiles can fall back to Guildleve/Behest UI. |
| Result coffer/captain window | Backend baseline | Five-minute lifecycle and pools exist; reward mutation needs persistent idempotency. |
| Exact reward weights/anima | Missing | Do not claim parity. |

## 13. Recommended implementation order

### Phase A — Freeze static/data contracts

- Keep all three hamlets data-driven.
- Add schema validation for actor classes, wave definitions, spawn points, scene keys, reward pools, and score IDs.
- Add fixture tests for rating thresholds, chest tiers, supply quality values, and rank-2 multiplier.
- Add a per-hamlet data report so missing actor/table IDs fail at startup rather than during a live battle.

### Phase B — Finish the supply economy

- Implement one atomic contribution transaction.
- Enforce phase, item, quantity, HQ, durability, materia, and duplicate-request validation.
- Persist anima and contribution changes with retry-safe idempotency.
- Rebuild the top-20 ranking only from the active cycle.
- Add quartermaster result/status UI after transaction correctness is proven.

### Phase C — Finish natural entry

- Implement captain party validation.
- Create the correct content group/occupancy instance.
- Bind the party and director before teleport.
- Snapshot supply rating, cycle, provisioner ranks, party composition, and timers.
- Prove reconnect, re-entry, party leave, and instance teardown.

### Phase D — Finish the battle loop

- Replace test-only support shortcuts with field pickup and crafting actors.
- Add the carry-one-item and damage-drop rules.
- Verify cart/militia AI target priority and line-breach behavior.
- Validate wave timing and special-foe death-source gates against retail capture.
- Add deterministic battle fixtures for leader kill, timer clear, cart loss, and late special spawn.

### Phase E — Finish client parity

- Capture a native retail Hamlet start and end sequence.
- Reproduce the director/content-group event ownership and lifetime.
- Validate title, Duty Commenced, main HUD, popup, score, and ranking separately.
- Map the remaining user-message subtypes and exact arguments.
- Keep unsafe widget/director probes behind an explicit test flag and never use them as normal entry.

### Phase F — Finish results and rewards

- Add persistent coffer/provisioner claim ledger.
- Make coffer opening party-shared and retry-safe.
- Re-resolve reward item/currency rows server-side at claim time.
- Enforce inventory capacity, currency caps, duplicate claims, disconnect recovery, and rollback.
- Capture repeated retail outcomes before assigning random weights.

## 14. Acceptance tests

### Supply tests

- A delivery during `SUPPLY_OPEN` removes the correct item once, awards the correct anima, and increments the correct cycle.
- The same request ID cannot double-award.
- A delivery during `DEFENSE_OPEN` is rejected without consuming the item.
- Crossing 100,000 changes rating to 1; crossing 3,000,000 changes it to 2.
- A contribution from the previous cycle is absent from the new top-20 ranking.

### Entry tests

- Seven-member, nine-member, under-level, and over-level parties are rejected.
- Mixed War/Magic/Land/Hand parties are accepted when all other rules pass.
- A provisioner rank is captured at battle start and does not change if the global ranking changes later.
- A reconnecting player returns to the correct active/result instance or is cleanly returned.

### Battle tests

- All four carts survive to timeout: victory.
- The leader dies early: victory and no later wave can mutate the frozen score.
- All carts die: defeat and no victory reward.
- A defense line is breached once and only once.
- The same enemy death cannot increment multiple score counters.
- A three-pot sequence resolves exactly once; mixed RGB resets enmity/orders.
- A DoH instrument applies the intended militia effect and expires cleanly.
- Errant Soul cannot spawn until the normal-enemy and militia-archer prerequisites are satisfied.

### Result/reward tests

- Score bands select Bronze, Silver, Gold, and Highest at the exact boundaries.
- Rating 2 doubles the final score but does not double item quantities unless the reward table explicitly says so.
- One party member opening the shared coffer resolves one shared reward.
- A provisioner can claim exactly once; disconnect/retry does not duplicate it.
- The five-minute result window closes and cleans up every NPC, callback, and content binding.

### Client tests

- Native start opens the title and Duty Commenced surfaces in the correct order.
- Main HUD shows carts, lines, support state, leader, timer, and battle value.
- Score/result UI opens only on the actual result signal.
- Empty ranking is safe; non-empty ranking is not enabled until every field is mapped.
- A failed UI probe cannot leave movement, chat, or party controls locked.

## 15. Safe local test harness

The current controlled commands are useful for server-side verification but are not a substitute for production entry:

```text
!testhamlet hyrstmill
!testhamlet retailstart hyrstmill
!testhamlet commence
!testhamlet land rrr
!testhamlet land rainbow
!testhamlet hand reinforced
!testhamlet win
!testhamlet fail
!testhamlet status
!testhamlet cancel
```

The test command is configuration-gated and should be GM-only or disabled outside a controlled development environment. Avoid unsafe private-instance and blind-director/widget probes on a stock client unless the test specifically targets that failure boundary.

## 16. Remaining blockers

The minimum evidence still needed before calling Hamlet Defense production-complete is:

1. A clean native captain-to-instance trace, including the content-group/occupancy trigger.
2. A clean native start/end packet trace proving title, Duty Commenced, main HUD, and result ownership.
3. Exact non-empty `0x01A6` ranking field semantics.
4. Complete `0x01A8` row-code mapping for the installed client table.
5. Retail validation of wave timing, coordinates, special-foe death-source rules, and support durations.
6. Materia supply valuation and battle-clear anima formula.
7. Persistent reward claim and transaction behavior under disconnect/retry.
8. Exact reward weights and any score-dependent seal/currency rules.

Until these are closed, the safest description is: **the server-side Hamlet combat/economy framework is broad and testable, but the natural retail entry and native UI/result lifecycle are still recovery work.**
