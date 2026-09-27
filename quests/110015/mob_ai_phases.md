# Man300 mob AI and phases (single-phase encounter)

Retail has one phase, no adds, no enrage: weaken all four warriors to ~15% HP
(nonlethal) OR win Parley against both representatives. Quest text row 67 and
the recorded battle agree; nothing in the recovered scenario implies phases.

## Battle route: 4 warriors

Fixed Lv.30, 1800 HP each (`FIGHT_LEVEL`/`FIGHT_HP`; no party-count scaling —
retail balances via the companion roster instead, see below). Mob-type rows
supply stats/AI where present (bnpc 1392/1341); the bowyer (2106515, no local
mob-type row) uses the actor-class fallback with identical configuration.

AI/staging (`configureCombatant`, engine-verified helpers):

- `AttachAI("DPS")`, `AttackRange` 6, roam off, `LinkRadius` 0 (no linking).
- Yellow-name/passive staging: `ApplyAggressionSettings(false, 0)` +
  `DetectionRange` 0 + `showHostilePresentation` — engage only when attacked,
  so DoH/DoL can walk to Parley targets unmolested.
- Leash: `IgnoreSpawnLeash` 0, `SpawnLeash` 55. Leashed mobs reset per engine
  AI; the 15% check polls live HP so a healed mob simply continues the fight.

## Nonlethal completion (engine + director)

1. Engine floor: `battlefield.damage_floor_hpp=15` →
   `BattleUtils.ApplyScriptedDamageFloor` clamps every hit (incl. periodic and
   secondary AoE paths, which share the clamp call) to leave
   `ceil(MaxHP*15%)`; `battlefield.invulnerable` grants full immunity.
2. Director `updateWithdrawals` (1 Hz): HP ≤ floor (or dead/removed actor) →
   `withdrawCombatant`: set invulnerable, tribe message "have lost the will
   to fight" to all members, force current target to disengage, flee-move
   5 yalms away from the player at 4.5 speed (`BeginQuestFightFlee` /
   `MoveQuestFightFleeToward`, ~1s hold), then despawn + `weakened[id]=true`.
3. 4/4 weakened → kick `noticeEvent` `beastTribesSubdued` (5s direct-cutscene
   fallback) → `completeBattlefield`: SEQ_035, `pE50`, warp party to public
   mesa. Static exit cleanup retires the director.

## Parley route (all-discipline entry; DoH/DoL use this)

Talk to either representative → world-master messages 51034 + 51050,
`SetNegotiatable(true)`, close talk. Player targets NPC, uses ready command
29497 (Parley) → three-widget handshake (topic list → 3-star confirm → tile
board). Titles 5001 (Ixal) / 5101 (Amalj'aa), Desired/Required blank,
difficulty 3, 12 turns, 20s/turn. Wins against BOTH (either order, any member;
state is director-owned, owner's journal advances) queue the same `pE50`
completion. Negotiation requests accepted only for targets carrying runtime
`negotiation.enabled`. Tile values use the server generic deterministic board:
quest-specific tiles are not in local data (open capture item).

## Party model ("scaling as retail")

- Cap 3 humans (`GetPartyMembersInRange(40)`, same-area only). Companions count
  toward the 3-person mission group per the period video: 1 human → owner's
  companion; 2 → owner's companion shared; 3 → none. Lv.30 allies
  (2400 HP/900 MP, delay 9000, damage 75, `AttachPathCompanionAI`,
  `AddQuestFightAllyToClaimParty` + claim-party sync).
- Mob stats are fixed; larger parties clear faster — that IS the retail model.
  No HP/damage multiplier exists in any Man director.
