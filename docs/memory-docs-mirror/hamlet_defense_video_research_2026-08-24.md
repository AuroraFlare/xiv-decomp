# Hamlet Defense — 1.0 Video Research Appendix

This appendix records what additional pre-2.0 footage contributes to the implementation model. It separates direct observations from uploader descriptions and from archived player reports. None of the videos has a usable transcript, so video evidence should explain behavior and UI—not override recovered client score tables.

For the authoritative NPC names, supply-phase item exchange, exact gathering/crafting request lists, and current implementation gaps, see the [NPC, Trade-In, Gathering, Crafting, and Role Reference](hamlet_defense_npc_and_role_reference_2026-08-24.md).

## Video set

| Video | Date / perspective | Implementation value |
| --- | --- | --- |
| [Hyrstmill rank 2 battle](https://www.youtube.com/watch?v=Gkbm3VrAnKA) | 2012-era; 1 WAR, 3 BLM, 2 WHM, 1 DoH, 1 DoL | Mixed-discipline party; combat waves, support work, militia and carts. |
| [Aleport 61,000 score](https://www.youtube.com/watch?v=E-8jiYR3PKA) | 2012-era; DoL perspective | Humour-pot sequencing and a high-score result. |
| [Limsa/Aleport rank 2](https://www.youtube.com/watch?v=LeB8YcY9NYs) | 2012-era; combat HUD and town defense | Rank-2 pacing, roster/HUD shape, and late-battle behavior. |
| [Golden Bazaar battle](https://www.youtube.com/watch?v=DXfN4OstmoM) | 2012-07-20; WotgAshiee | Militia-archer messages, settlement-defense feedback, and support prompts in the battle UI. |
| [Hamlet Defense 1.22a](https://www.youtube.com/watch?v=u3TOyUiTQ-U) | 2012-05-22; 1 WAR, 1 PLD, 2 BLM, 2 WHM, 1 Miner, 1 Botanist | A second-attempt learning curve and a combat-heavy party with two Land players. |
| [Aleport PLD perspective](https://www.youtube.com/watch?v=CHSi5tHwosU) | 2012-07-16; Paladin | The tank's low-DPS opening, patrol/buff/cure work, and late named-monster kite. |
| [Hyrstmill 62,000 Miner run](https://www.youtube.com/watch?v=mElPsC7x13E) | 2012-05-21; Miner | A second Land-focused view with the full battle HUD, militia-line state, and late result positioning. |
| [Golden Bazaar 66,000 Miner run](https://www.youtube.com/watch?v=Xm8OS8FEbKQ) | 2012-era; Miner | Gate-breach announcement, quartermaster-area movement, objective HUD, and late regroup near militia. |
| [Hyrstmill 65,000 mixed run](https://www.youtube.com/watch?v=xi9NlNB8t5M) | 2012-era; 1 WAR, 2 WHM, 2 DoH, 3 DoL | Visible attack-down/defense-up broadcasts, WHM healing of militia archers, named-monster entry, and target-range feedback. |
| [Aleport Weaver Let's Play](https://www.youtube.com/watch?v=xHdHPDaqdUA) | 2012-era; level 50 Weaver | The clearest visible DoH sequence: pre-entry timer, battle crate, synthesis panel, progress/durability state, and return toward the quartermaster. |
| [Hamlet Defense 1 PLD / 3 WHM / 2 DoH / 2 DoL](https://www.youtube.com/watch?v=TRA22qbB2jE) | 2012-era; uploader-stated composition | An additional composition reference showing that the intended party was not a single fixed eight-job template. |
| [Hyrstmill Botanist run](https://www.youtube.com/watch?v=JUkcuYkq-KE) | 2012-era; DoL Botanist | A dedicated Land perspective for comparing gathering movement and support delivery against the combat HUD. |

## What the footage says players actually do

Hamlet Defense is a coordination scenario with five overlapping jobs. “Kill the boss” is only the final action; the party is rewarded for preserving the settlement and completing support objectives while it waits for the named monster.

| Role | Player loop | What the server must model |
| --- | --- | --- |
| Tank / attention control | Patrol the defense, intercept threats, keep enemies away from carts and militia, then hold or kite the named monster when it appears. | Hate, protected-object targeting, leader orders, kite/defense state, and participation that is not based only on damage. |
| Black Mage / area damage | Clear clustered waves quickly, especially when several enemies threaten one line or cart. | Wave membership, melee/caster kill counters, area damage, and the ability to kill without stealing the objective gates that belong to militia. |
| White Mage / sustain | Cure and stabilize the party, militia-facing damage, and support players; recover from the movement and attrition of a long defense. | Player/NPC healing, KO state, militia survival, and no-casualty scoring. |
| Disciple of the Land | Pick up one Humour pot, carry it to the quartermaster, and complete three-pot sequences. Red/red/red lowers attack, blue/blue/blue lowers HP, green/green/green sleeps, and red/blue/green resets orders/enmity. | Carry/drop rules, delivery validation, sequence progress, support effects, and dropped-pot penalties. |
| Disciple of the Hand | Carry one material at a time, synthesize an instrument, and deliver it to empower militia. Spiked raises attack, Blessed grants regeneration, Reinforced raises defense/evasion, and Musked resets orders/enmity. | Material loss on damage/overlap, crafting inside the duty, delivery, militia buffs, and instrument counters. |

The PLD video is especially important: the uploader describes the first roughly ten minutes as mostly patrol, buff, and cure work because the NM has not spawned and PLD damage is poor against the encounter's area counterattack. The implementation must not mark that player idle merely because the damage meter is low. The 1.22a party video also shows that there was no single mandatory composition: one successful-looking setup carried two Land players and no Hand player, while the Hyrstmill footage carried one of each.

## Directly observed video sequences

These are visual observations from the footage, not guesses about hidden server state. The timestamps are video timestamps and are useful as manual QA checkpoints when rebuilding the event.

### Hyrstmill mixed run — `xi9NlNB8t5M`

- Around **1:01**, the screen has already established the duty title, a visible battle timer, a minimap with settlement markers, a full eight-person party list, and named militia archers in the field. The chat feed announces entry through Captain Rontremont and then announces that the beastmen have breached the gates.
- Around **5:02**, a large center-screen message announces that all enemies have decreased attack. The chat also shows a White Mage casting Cure on a militia second-line archer and the archer recovering HP. This confirms that militia are active heal targets, not merely decorative scenery.
- Around **10:01**, the named enemy Sazel Ciloc the Divine joins the fray. The same period shows a Regen cast, the attack-down broadcast, and an allied-defense broadcast. Named-monster arrival is therefore a phase change layered on top of ongoing support and sustain work.
- Around **15:02**, the chat reports remaining time, repeats the attack-down and defense-up states, and shows a “target is too far away” failure. Range and target validity need to be represented in the support/combat action path.
- Around **19:01**, the party is still operating around militia and the named-wave area rather than standing in a single boss arena. The player HUD continues to show settlement/objective icons while the enemy wave is being burned down.

### Golden Bazaar Miner run — `Xm8OS8FEbKQ`

- Around **1:01**, the event opens with a prominent “beastmen have breached the hamlet gates” announcement. The player is a level 50 Miner, but the battle screen still exposes the same settlement HUD, party list, map, and support/status icons used by combat perspectives.
- Around **7:01**, the Miner is moving through the settlement near Quartermaster P’lhabgo while the event HUD remains active. The Land player is not placed in a separate gathering instance; the gathering-support work happens in the same defended space as the combat party.
- Around **20:00**, the player is still navigating the settlement late in the run, with the party list and battle HUD visible. This is consistent with a loop of moving between support locations and the defense area rather than a one-time opening interaction.
- Around **23:41**, the group has regrouped beside militia after the main action. This is a useful end-state checkpoint for NPC placement, result/reward dialogue, and post-battle cleanup.

### Aleport Weaver run — `xHdHPDaqdUA`

- Around **10:02**, the Weaver is still in a pre-entry assembly state near Quartermaster B’davzzi with other party members visible and an approximately one-minute countdown shown in the footage. The duty needs a real registration/commence state rather than teleporting the party directly into combat.
- Around **20:01**, the battle HUD is visible and a physical crate is present in the field. The Weaver is positioned near the crate/quartermaster side of the settlement, showing that the DoH objective has a world-space interaction point.
- Around **22:02**, the synthesis panel is visible. It gives explicit instructions to synthesize rapidly with a focus on progress and exposes progress, durability, quality/success information, and failure consequences. This is a real duty-specific synthesis interaction, not ordinary inventory crafting performed before entry.
- Around **23:01**, the Weaver has left the synthesis position and is moving back toward the quartermaster. That movement is the missing middle of many textual summaries: craft first, then physically deliver the completed instrument.
- Around **25:02**, the synthesis panel is again visible with progress and durability values. The server therefore needs a per-attempt craft state, interruption/failure handling, and a successful completion result that can become a delivery object.

## Composition evidence from the videos

The footage contains several different eight-person patterns:

| Composition | Source | What it tells us |
| --- | --- | --- |
| 1 WAR / 3 BLM / 2 WHM / 1 DoH / 1 DoL | `Gkbm3VrAnKA` description | A combat-heavy party can still reserve one Hand and one Land slot. |
| 1 WAR / 2 WHM / 2 DoH / 3 DoL | `xi9NlNB8t5M` description | A support-heavy party can carry three Land and two Hand players while retaining one tank. |
| 1 WAR / 1 PLD / 2 BLM / 2 WHM / 1 Miner / 1 Botanist | `u3TOyUiTQ-U` description | Two tanks, two casters, two healers, and two Land players were a documented setup; the uploader describes a second attempt after a failed first run. |
| 1 PLD / 3 WHM / 2 DoH / 2 DoL | `xQWBYvDDN-k` description | Another support-heavy party with only one direct tank. |
| 1 PLD / 3 WHM / 2 DoH / 2 DoL | `TRA22qbB2jE` title | The same broad support-heavy pattern appears in another upload. |

These are evidence of historical party practice, not a claim that every composition was equally efficient or that the server hard-coded these exact roles. The implementation should validate the eight-class/party rules recovered from the client while allowing the role mix to be data-driven.

## Video-derived state machine

The observed flow can be expressed as:

```text
registered party
  -> timed pre-entry assembly near captain/quartermaster
  -> battle entry with jobs/weapons locked
  -> gates breached / wave announcements
  -> combat party protects militia, carts, and support players
  -> DoL carries one pot at a time and returns for delivery
  -> DoH uses the duty crate, completes synthesis, and returns for delivery
  -> support effects broadcast to enemies/allied militia
  -> named enemy joins the fray
  -> remaining time / cart / militia state determines the result
  -> party regroups at the settlement for score and captain reward handling
```

This sequence should drive implementation tests. In particular, it prevents a common shortcut in which DoL/DoH contributions are accepted as pre-battle inventory turn-ins but never exist as interruptible, world-space actions during the defense.

## What video evidence cannot establish by itself

- The exact score value of a hidden row, whether a row is mutually exclusive with another row, or whether a score table changed between 1.22, 1.22a, 1.22b, and 1.22c.
- The precise spawn time and coordinates for every wave, cart, support crate, pot cache, captain, and quartermaster.
- Whether a visible effect was caused by a complete three-pot sequence, a Hand instrument, a player ability, or a pre-existing status unless the chat/UI identifies it.
- The authoritative server transaction for item removal, anima, ranking, and reward ownership.

Use the footage to reproduce player-visible timing and interaction shape; use the recovered client/server data to implement authority, exact values, and versioned rules.

## Player-readable points model

The result screen is best implemented as a ledger of independently triggered rows. At result time:

```text
rawScore  = sum(triggered rows)
finalScore = rawScore * (supplyRating >= 2 ? 2 : 1)
```

The main score groups are:

| Group | Examples from the recovered client table | Typical implementation trigger |
| --- | --- | --- |
| Party setup | Balanced party 50; eight classes 30; each Land/Hand member 100; top-20 provisioner 3,000 | Snapshot the eight members at battle start. |
| Enemy progress | 10 per normal beastman; all melee 1,000; all magic 1,000; no normal survivors 2,000 | Idempotent enemy-death counters, split by role/type. |
| Named and special enemies | Rank-1 leader 500; rank-2 leader 3,000; stray fauna 1,500; burden 1,500; Errant Soul 5,000; all non-beastmen 1,000 | Named-wave state plus the militia-archer gate for the late undead special. |
| DoL support | 10 per completed Warden's Justice; 30 per attack/HP/sleep method; 150 for all methods; 100 for no dropped pots | Valid three-pot deliveries and drop tracking. |
| DoH support | 10 per instrument; 30 per attack/defense/regen effect; 100 for all varieties; 300 for all leader orders prevented | Valid synthesis/delivery and order-prevention counters. |
| Preservation | 100 per militia survivor; 1,500 no militia casualties; 500 per cart; 1,500 all carts; line bonuses | Freeze militia, line, and cart state at result. |
| Clean run / special behavior | 500 no KO; captivity, weapon condition, reckless gathering/crafting, rally/goad, deserter and missing-member rows | Add hooks for events that are currently only cataloged. |

Rows are not all mutually exclusive. For example, a party can earn per-enemy points, an all-melee completion row, no-survivor, named-enemy, cart-preservation, support, and no-KO rows in the same run. Composition rows are evaluated against the battle-start snapshot; action rows are evaluated from the battle ledger; result rows are evaluated from the final objective state.

The chest bands used by the current implementation are:

| Final score | Result |
| ---: | --- |
| 1–29,999 | Bronze coffer |
| 30,000–49,999 | Silver coffer |
| 50,000–59,999 | Gold coffer |
| 60,000+ | Highest coffer |

The 61,000-point Aleport video proves that the Highest band was attainable in practice. It does not prove that every row listed above fired in that particular run. The score table and the video should therefore be used together: the video validates the shape of play and the achievable result, while the recovered client rows provide the exact candidate values.

## Implementation consequences

The additional footage makes these acceptance requirements non-optional:

1. A battle must have a visible objective state: carts, defense lines, militia, support NPCs, wave status, and named-monster timing.
2. DoL and DoH actions must be real battle actions with interruption, delivery, effect, and score state—not cosmetic emotes or pre-battle-only contributions.
3. Combat participation must include tanking, kiting, healing, and protection; damage alone is not a valid activity test.
4. The result ledger must preserve the battle-start party snapshot, each support delivery, each special-enemy death source, each KO, and final cart/militia state.
5. Rank 2 must be applied once to the final raw score, and chest selection must use the multiplied score.
6. Score rows must be versioned. The repository uses the client-mined `hamletDefScore.csv` values where archived community tables disagree.

## Evidence confidence

- **High:** video title, upload date, uploader-stated party composition, visible HUD/objective messages, and the existence of a 61,000-point result.
- **Medium:** exact role priorities inferred from repeated footage and descriptions, such as the PLD patrol/kite loop and DoL support timing.
- **Low / needs validation:** exact spawn timestamps, which actor receives every support effect, death-source details for the Errant Soul gate, and whether every archived score row is available in every 1.22/1.22a patch variant.
