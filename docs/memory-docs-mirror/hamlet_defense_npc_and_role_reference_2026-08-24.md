# Hamlet Defense — NPC, Trade-In, Gathering, Crafting, and Role Reference

This is the detailed player/server reference for FFXIV 1.22–1.23b Hamlet Defense. It answers who the NPCs are, what can be exchanged with them, and what each discipline actually does. It distinguishes recovered retail text/data from current server shortcuts.

## Evidence labels

- **Retail text/rules:** archived 1.22/1.22a patch notes, the archived Hamlet Defense page, or mined client text.
- **Recovered data:** actor classes, names, item rows, spawn identities, and wave data recovered in this repository.
- **Current implementation:** behavior already represented by the server.
- **Gap:** behavior that still needs a native event/packet or live validation.

## 1. Named NPC roster

### Field NPCs

These are the NPCs players use outside the instance. The quartermaster is the supply/delivery NPC; the captain is the battle-registration and reward NPC.

| Hamlet | Zone / map location | Militia quartermaster | Supply actor class | Militia captain | Captain actor class |
| --- | --- | --- | ---: | --- | ---: |
| Aleport | Western La Noscea (12,23), zone 129 | B'davzzi Dzau (`B'davzzi`) | `1500433` | Rhotblaet | `1500340` |
| Hyrstmill | North Shroud (25,13), zone 152 | Dhebi Polaali | `1500320` | Rontremont | `1500342` |
| The Golden Bazaar | Eastern Thanalan (38,19), zone 171 | P'lhabgo Laha (`P'lhabgo`) | `1500434` | Carmine | `1500341` |

The 1.22a patch notes explicitly add Aleport and the Golden Bazaar and name B'davzzi/Rhotblaet and P'lhabgo/Carmine. The 1.22 notes name Dhebi Polaali/Rontremont for Hyrstmill.

The client contains an older/alternate quartermaster name pair—Jeanne and Bebetta—with display-name IDs `1100341` and `1500156`. Localized support text still mentions them, but the recovered 1.22a field roster and spawn data use the three quartermasters in the table above. Treat Jeanne/Bebetta as legacy actor/text variants until a matching retail spawn is recovered.

### Captain actor-family warning

The client has two appearance-paired captain families:

| Purpose in recovered client logic | Aleport | Golden Bazaar | Hyrstmill |
| --- | ---: | ---: | ---: |
| `Noc002` pre-defense menu branch | `1500315` | `1500317` | `1500319` |
| Named `PopulaceHamletCaptain` branch / current field spawn | `1500340` | `1500341` | `1500342` |

They resolve to the same visible names and appearances, but they are not interchangeable in the scripts. A production implementation must either spawn the correct family for each menu or deliberately route both families through the same server-owned captain service.

### Battle NPCs and objectives

The battle does not give every militia member a unique personal name. The client and current data identify them by role:

| Battle actor group | Count | Role |
| --- | ---: | --- |
| Militia Front Line Archer | 3 | Front defense line; ranged damage and special-kill gate. |
| Militia Second Line Archer | 3 | Second defense line; ranged damage and special-kill gate. |
| Militia Third Line Archer | 4 | Rear defense line; ranged damage and special-kill gate. |
| Militia Smith | 1 | Laborer/support NPC; protected by the party. |
| Militia Outfitter | 1 | Laborer/support NPC; protected by the party. |
| Militia Cook | 1 | Laborer/support NPC; protected by the party. |
| Militia Barber | 1 | Laborer/support NPC; protected by the party. |
| Supply cart/cache | 4 | The main protected objective and failure counter. |

Retail text generally calls the last four “militia laborers.” Some recovered widget/decomp notes use the generic labels Cook, Engineer, Medic, and Laborer instead. The role/category is high confidence; the final display-name mapping should follow the actor-class/text pair recovered for the target client build.

The server currently uses these actor-class bases:

| Hamlet | Laborer base / four offsets | Archer base / ten offsets |
| --- | ---: | ---: |
| Aleport | `2290054`–`2290057` | `2290066`–`2290075` |
| Hyrstmill | `2290062`–`2290065` | `2290086`–`2290095` |
| The Golden Bazaar | `2290058`–`2290061` | `2290076`–`2290085` |

### Enemy names in the recovered wave model

| Hamlet | Normal waves | Unique early foes | Leader | Late special |
| --- | --- | --- | --- | --- |
| Aleport | Kobold Ashman; Kobold Priest; Kobold Junkman | Frightened Crab; Synthetic Bomb | 11th Order Patriarch Gu Bu | Errant Soul |
| Hyrstmill | Ixali Strongbeak; Ixali Fogcaller; Ixali Sabreur | Frightened Lemur; Scout Wolf | Sazel Ciloc the Divine | Errant Soul |
| The Golden Bazaar | Amalj'aa Pugilist; Amalj'aa Thaumaturge; Amalj'aa Lancer | Frightened Cactuar; Battle Drake | Stonespike Tanadd Gah | Errant Soul |

The current wave data supplies the counts, levels, special flags, and actor classes. The exact retail spawn timing and special-death ownership remain separate validation work.

## 2. Is there a trade-in NPC?

Yes. It is an item-delivery/exchange system, not a normal shop and not player-to-player trade.

### Supply-phase exchange

During the 50-hour preparation phase, players speak with the local militia quartermaster and exchange requested items. The transaction:

1. Reads the current request list for that hamlet.
2. Validates the item, quantity, quality/HQ state, and delivery phase.
3. Removes the accepted item from the player's inventory.
4. Adds supply-stockpile points to the hamlet.
5. Adds the player's personal contribution total and updates the provisioner ranking.
6. Awards anima based on the contribution type and quality.
7. Raises supply rating when the global thresholds are crossed.

The supply NPC also exposes the current request list and the supply ranking. The mined `Noc002` text says the top contributors can be checked by speaking to the militia quartermaster and choosing the supply-status option.

Deliveries stop when the defense phase begins. The client text explicitly says that supplies are suspended while the militia changes to its defense plan.

### Battle-phase support handoff

Inside the instance, the quartermaster is not buying ordinary inventory. The player hands over an ephemeral support object:

- DoL hands over one fragile alchemical pot at a time.
- DoH hands over one completed instrument of warfare at a time.

The quartermaster immediately deploys the result as a temporary battlefield effect. These objects should be modeled as duty-owned state, not as ordinary marketable items.

### Rewards are a separate NPC flow

After a victory, the party receives the shared battle coffer/result flow. A player who qualified as a provisioner speaks with the militia captain before the reward-claim window closes to receive the contribution-based bonus. This is a reward claim, not another supply delivery.

## 3. Supply-phase gathering and crafting

### Disciples of the Land: open-world supply deliveries

The supply phase uses normal 1.0 gathering outside the instance. DoL players gather the requested items in the corresponding region, return to the hamlet, and deliver the requested quantity to its quartermaster.

| Item | Class | Gathering region | Quantity | Normal quality | High quality / `+1` |
| --- | --- | --- | ---: | ---: | ---: |
| Light Kidney Ore | Miner | Nanawa Mines | 10 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Supple Spruce Branch | Botanist | East Shroud | 10 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Young Indigo Herring | Fisher | Western La Noscea | 10 | 1,000 points / 4 anima | 10,000 points / 6 anima |

The requested table is data-driven. A player does not turn in “anything gathered”; the item and quantity must match the current request row for that hamlet.

### Disciples of the Hand: supply-phase synthesis

DoH players use ordinary 1.0 synthesis to make the requested militia supplies, then deliver one completed item per request row.

| Item | Crafting class | Quantity | Normal quality | High quality / `+1` |
| --- | --- | ---: | ---: | ---: |
| Militia Bow | Carpenter | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Sword | Blacksmith | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Helm | Armorer | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Gorget | Goldsmith | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Longboots | Leatherworker | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Leggings | Weaver | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Poultice | Alchemist | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |
| Militia Rations | Culinarian | 1 | 1,000 points / 4 anima | 10,000 points / 6 anima |

The archived page describes these as class-matched requested supplies. The exact quality column is patch/version-sensitive: the archive uses `+1`, while the current server uses the recovered item quality field and treats quality greater than 1 as high quality.

### Materia-enhanced equipment

Fully repaired materia-enhanced weapons or gear could also be turned in during the supply phase. The retail rule is clear about the 100% durability requirement, but the exact contribution/anima formula and accepted materia combinations are not recovered. Keep this transaction behind a versioned rule table and do not consume an item until the server has validated the entire transaction.

### Disciples of War and Magic during preparation

DoW/DoM are not excluded from preparation. Completing the corresponding level-45 caravan escort raises the hamlet's supply rating. The current data has the contribution baseline as 5,000 stockpile points, but the exact route/start location mapping is not yet represented in `HamletDefenseData`.

## 4. DoL inside the battle

This is not a normal Miner/Botanist/Fisher gathering mini-game. In the instance, the DoL role is a dangerous object-retrieval and delivery job.

### Step-by-step loop

1. Talk to the quartermaster and choose the support/objective explanation.
2. Locate an alchemical supply cache around the hamlet. Retail text describes caches as pots, barrels, or similar containers.
3. Target the cache to obtain one pot of humours. Only one pot can be carried at a time.
4. Avoid beastmen and return to the quartermaster.
5. If attacked while carrying the pot, it falls and is permanently lost.
6. Deliver three valid pots. Three identical colours or one of each colour completes Warden's Justice.
7. Repeat when the front line needs another enfeeblement.

### Pot effects

| Delivery sequence | Retail effect | Server state/counter |
| --- | --- | --- |
| Red + red + red | Lower enemy physical attack | `AttackDown`; `Times Enemy Attack Lowered` |
| Blue + blue + blue | Lower enemy HP | `HpDown`; `Times Enemy HP Lowered` |
| Green + green + green | Put some enemies to sleep | `Sleep`; `Alchemic Sleep Induced` |
| Red + blue + green | Reset DoL/DoH enmity, redirect enemy focus, and prevent leader orders | `EnmityReset` / `EnemyOrdersReset`; order-prevention counter |

The order within the three-pot mixed sequence is not the important part; the set of one red, one blue, and one green is. Three pots are required before the effect fires. Each valid completion can award Warden's Justice points, and dropped pots can disqualify the no-drop rows.

DoL cannot enter active combat mode during the defense. The combat party must protect the gatherer, and the gatherer must communicate which effect the front line needs. The Aleport footage shows this as deliberate timing rather than background automation.

## 5. DoH inside the battle

This is also not ordinary inventory crafting. The instance supplies the material and the DoH converts it into a temporary battlefield instrument.

### Step-by-step loop

1. Talk to the quartermaster and choose the desired militia effect.
2. Go to the nearby supply crate. The client marks it with a crate icon on the minimap.
3. Select an effect/material type: Spiked, Blessed, Reinforced, or Musked.
4. Carry the material to a safe spot and synthesize the instrument.
5. Deliver the completed instrument to the quartermaster.
6. The quartermaster distributes it to the militia; the effect is temporary.
7. If attacked while carrying the material, crafting, or carrying the completed instrument, the item is destroyed and must be reacquired.

Only one material or completed instrument can be carried at a time. Picking up another material drops the current one. Retail text and the wiki also report that delivery can draw one or two beastmen onto the crafter.

### Instrument effects

| Instrument | Retail target/effect | Server state/counter |
| --- | --- | --- |
| Spiked | Increase attack of all militia archers | `MilitiaAttackUp`; attack-increase counter |
| Blessed | Grant Regen to the four militia laborers | `MilitiaRegen`; regen counter |
| Reinforced | Increase defense and evasion of all militia personnel | `MilitiaDefenseEvasionUp`; defense/evasion counter |
| Musked | Reset DoL/DoH enmity and prevent/redirect enemy leader orders | `EnemyOrdersReset`; leader-order counter |

DoH cannot enter active combat mode and cannot perform offensive actions inside the defense. A crafter is therefore a mobile objective/support player, not a weak combat job.

## 6. DoW and DoM inside the battle

DoW/DoM are the direct-combat layer. They are allowed to use active combat mode and normal battle actions, but weapon and soul-crystal changes are locked once the duty begins.

### Shared responsibilities

- intercept enemies before they reach carts, defense lines, militia, or support players;
- draw and control enemy attention so DoL/DoH can complete their deliveries;
- clear normal waves without losing the settlement objective;
- keep the leader controlled while the party completes the high-value late-wave objectives;
- protect militia and carts rather than measuring success only by personal damage;
- recover from KOs and prevent unnecessary deaths because no-KO and militia-preservation rows are valuable.

### Practical combat subroles

| Combat subrole | What the player does | Why it matters |
| --- | --- | --- |
| Tank / attention control | Patrol the defense, intercept threats, hold or kite the named leader, and keep enemies away from carts and laborers. | The leader changes enemy focus through orders; a controlled kite can preserve the settlement and allow militia archers to finish normal enemies. |
| Melee damage | Kill or peel normal soldiers, answer breaches, and protect the support route. | Normal soldier counters, all-melee rows, and line preservation depend on active interception. |
| Black Mage / area damage | Burn clustered waves and casters quickly, especially when several enemies threaten one line. | Wave completion and no-survivor bonuses require fast, controlled clearing. |
| White Mage / sustain | Cure party members and stabilize the defense while movement, aggro, and attrition continue. | The party must survive long enough to finish support and late-special objectives; KOs remove clean-run value. |

The Paladin footage is useful because it shows that a tank can spend the first part of the battle patrolling, buffing, and curing rather than producing high damage. The named monster appears later, at which point the tank's job becomes controlled holding/kiting. Do not implement a damage-only participation check.

### The leader and high-score timing

The leader periodically issues orders that redirect the beastmen toward defended objects. A mixed DoL pot or Musked instrument can prevent/reset those orders. A common high-score strategy, corroborated by player reports but not fully proven by footage, is to hold or kite the leader while militia archers and the party finish normal waves and special-enemy conditions, then kill the leader near the end. This preserves the objective while enabling the normal-enemy score rows.

## 7. Complete player-to-NPC flow

```text
Open-world gathering/crafting/caravan escort
        -> field quartermaster: exchange requested supplies
        -> global stockpile, personal provisioner ranking, anima
        -> battle phase opens
        -> captain: register a full eight-person party
        -> private defense instance
        -> quartermaster: assign DoL/DoH support and receive pots/instruments
        -> DoW/DoM protect carts, militia, and support routes
        -> leader defeated or timer survives with a cart
        -> score/coffer result
        -> captain: provisioner reward claim before the short deadline
```

| NPC/surface | Supply phase | Battle phase | Result |
| --- | --- | --- | --- |
| Militia quartermaster | Request list, item/materia delivery, supply total, ranking | Objectives, pot/instrument delivery, temporary effects | May explain support state; not the normal coffer claim. |
| Militia captain | Enlists the party when defense is open; captain dialogue | Entry/withdrawal context | Gives payment/provisioner reward dialogue after victory. |
| Supply crate/cache | Not used for the normal global request exchange | DoL pot caches and DoH material crate | Duty-owned interactable object; not a market item. |
| Militia archers/laborers | Not the normal trade target | Defended NPC population and effect targets | Survival, line, and order-gate state. |
| Supply cart/cache | Global supply concept | Four protected battlefield objectives | All four lost means defeat. |

## 8. Current implementation map

| Behavior | Current repository state |
| --- | --- |
| Named hamlet/captain/quartermaster data | Seeded in `HamletDefenseManager.BuildHamlets`; actor-family mismatch remains documented above. |
| Supply item delivery | `PopulaceHamletSupply` opens the recovered delivery widget and calls `WorldManager:DeliverHamletSupply`; `HamletDefenseManager.DeliverSupply` validates the selected item, phase, distance, quantity, and item instance, then records contribution, removes the item, and awards anima. |
| Materia delivery | Widget path is still preview-only; no item/anima/supply mutation is committed. |
| Supply ranking/status menus | Noc002 read-only menu bridge and server ranking data exist; native retail ranking widget parity is not proven. |
| Battle DoL/DoH object interactions | Not yet native. `!testhamlet land ...` and `!testhamlet hand ...` are debug shortcuts that exercise the effect/state backend. |
| Battle DoL/DoH effects and counters | Broad server backend exists: effects, expiry, aggro pull, order prevention, support counters, and score rows. |
| DoW/DoM waves, carts, militia, leader | Server-side baseline exists; natural retail captain-to-instance occupancy and some AI/targeting details remain recovery work. |
| Captain reward claim | Captain dialogue calls the server claim path; reward/coffer timing and native result UI still need live validation. |

## 9. Remaining implementation gaps

1. Resolve the two captain actor families without breaking either `Noc002` menus or named captain dialogue.
2. Recover the real battle-quartermaster event flow for selecting objectives, picking up pots/materials, crafting in the duty, dropping/breaking carried objects, and delivering them.
3. Replace debug support aliases with server-owned, target-validated duty objects.
4. Recover the exact materia-enhanced supply formula and mutation packet flow.
5. Resolve whether the final laborer display names are Smith/Outfitter/Cook/Barber or the alternate Engineer/Medic/Laborer text family for the target client build.
6. Validate caravan escort start/route mappings and the exact supply contribution value per route.
7. Capture native captain registration, battle start, quartermaster support, and result/reward events before calling the content retail-complete.

## Source files

- `docs/patches/Patch_1.22.md`
- `docs/patches/Patch_1.22a.md`
- `docs/ffxiv-1.0-wiki/pages/Hamlet_Defense.html`
- `docs/Dat Mining/populaceHamletPushEvent.csv`
- `docs/Dat Mining/populaceHamletSupply.csv`
- `docs/Dat Mining/xtx_displayName.csv`
- `docs/Dat Mining/noc002.csv`
- `docs/hamlet_supply_noc002_contract_2026-06-19.md`
- `Map Server/DataObjects/HamletDefenseData.cs`
- `Map Server/Hamlets/HamletDefenseManager.cs`
- `Map Server/Actors/Director/HamletDefenseDirector.cs`
