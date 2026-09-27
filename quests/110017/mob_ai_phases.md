# Man308 mob AI and phases (parley phase + single combat phase)

Retail has two phases and no enrage: one successful Parley with the tempered
captives frees the group, then exactly three Amalj'aa attack. Footage
(tJrl9bfP5A8 6:38–8:11) shows one ~50s point-based Parley session
transitioning to the lancer/archer/augur trio; journal 221 ("the prisoners
are not your enemy ... without submitting them to excessive harm") and 222
(Ifrit questions the party after the fight) agree. Nothing in the recovered
scenario implies adds, phases, or an enrage; the 30:00 director timeout is
the attempt clock.

## Parley phase (all-combat-class entry; SEQ_015, flag 0)

Four passive `PopulaceStandard` captives (appearances 2289001–2289003, one
reused) spawn after `pE50`/`pE60`. Each carries a server-authored
negotiation profile: title id `1401` (`Lord Errant`,
`xtx_negotiationTable.csv`), requested-item slot `1000019`
(widget-safe presentation value only), 12 turns, 20s/turn.
`NegotiationCommand.lua` accepts these from target temp vars.
`onNegotiationResult`: a loss re-prompts in place (unlimited retries); one
win from any entrant sets the owner's flag 0, despawns the captives
(they flee), and starts combat. Captive talk turns (text 20/21) are
recovered but unwired: the footage shows direct Parley with no intro-talk
gate, so talk is a clean no-op rather than a second gate.

## Combat phase (SEQ_015, flag 1): 3 Amalj'aa

Fixed Lv.38 (`FIGHT_LEVEL`), 2500 HP each (`ENEMY_HP` director override;
mob-type base is 4200 open-world tuning). No party-count scaling — retail
balances via the companion roster (see below), matching every Man director.

| BNPC | Actor class | Label | Job / skill list |
|---|---|---|---|
| 32712 | 2206508 LizardmanLancerStandard | Amalj'aa lancer | Lancer (8) / 88 |
| 32713 | 2206512 LizardmanArcherStandard | Amalj'aa archer | Archer (7) / 87 |
| 32714 | 2206518 LizardmanThaumaturgeStandard | Amalj'aa augur | Thaumaturge (22) / 89 |

AI/staging (`configureCombatant`, engine-verified helpers):

- `AttachAI("DPS")`; AttackRange 6 (lancer) / 14 (archer, augur);
  archer+augur hold ranged position (`SetQuestFightHoldRangedPosition`).
- Hostile on spawn: `ApplyAggressionSettings(true, 0x11)`,
  `DetectionRange` 14, `LinkRadius` 18, roam off, hostile icon.
- Leash: `IgnoreSpawnLeash` 0, `SpawnLeash` 45; boundary square
  (970,950)–(1035,1015) clamps movement. Leashed mobs reset per engine AI;
  the defeat poll reads live HP so a healed mob continues the fight.
- MP fallback + `ForceQuestFightVitalSync` for client vitals.

The passive companion is replaced by a Lv.38 combat ally (3200 HP/1200 MP,
delay 9000, damage 95, `AttachPathCompanionAI`,
`AddQuestFightAllyToClaimParty` + claim-party sync). Combat never starts
without the ally: a failed ally spawn fails the attempt back to the public
retry anchor instead of an unwinnable fight. 3/3 defeated (authoritative
1 Hz poll; legacy kill callback lacks runtime unique ids) kicks
`noticeEvent battleWon` → `pE80` → SEQ_020 + party warp.

## Party model ("scaling as retail")

- Cap: owner + 1 nearby same-area helper (`GetPartyMembersInRange(40)`) +
  the owner's Path companion = the 3-person mission group journals 218–221
  describe ("up to two party members may accompany you", companion in a
  retail slot). Helpers need a combat class, not the quest.
- Mob stats are fixed; larger parties clear faster — that IS the retail
  model. No HP/damage multiplier exists in any Man director.
