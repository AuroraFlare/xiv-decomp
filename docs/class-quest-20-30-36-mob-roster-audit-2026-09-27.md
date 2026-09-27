# Class quests 20/30/36 — battle-director mob roster — 2026-09-27

Data: `outputs/class-quest-20-30-36-mob-roster-audit-20260927/director_configs.csv` (23 directors),
`mob_targets.csv` (64 unique targets: wave, actorClassId, mobTypeId, uniqueId, displayName).
Sources: `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorClass*.lua`,
`QuestDirectorCnj306Escort.lua`, `QuestDirectorCnj306Echo.lua`. All but the two bespoke
lifecycles run on the shared `gc_sqb_runtime` CONFIG frame.

## 1. Standard frame

- Party cap 3, timeout 600s everywhere except Arc300 and Arc306Escape (1800s — long ambush/escape duties).
- Retry returns to sequence 0 (restart the step) except Pgl200→30, Arc300→20, Arc306Duel→7,
  Exc306Rematch→25, Cnj306Echo→30 (retry at the door, not the quest start).
- `requireAllTargets`: true for Arc/Cnj/Exc/Lnc/Thm multi-kill duties; false/irrelevant for the
  single-target Pgl/Gla duels.

## 2. Roster shape

- Single duels (1 target): Pgl200/300/306, Gla200/300/306, Lnc306, Thm300/306, Arc306Duel.
- Packs: Arc200 (5), Arc300 (2), Arc306Escape (4), Cnj300 (6), Exc200 (8), Exc306Rematch (3: Moenskaet + both hands),
  Lnc200 (4), Lnc300 (7 over 2 waves), Cnj200 (5 over 5 waves), Cnj306Echo (3), Thm200 (7 over 3 waves).
- Proof grants on kill credit (defensive pcall, never fail the duty): Thm200 Twisted Aldgoat Horn (11000015),
  Thm300 item 11000030.

## 3. Bespoke lifecycles (no CONFIG table)

- Exc306Survival: 300-second survive-the-loss instance, scripted loss returns to the warehouse barrel step;
  death retries at the quarters door.
- Cnj306Escort: 69-node authored Morys route (`Data/escortnavmesh/cnj306_morys_escort.json`);
  Morys HP 0 and stray-too-far both fail the duty.

## 4. For the melee/ranged packs (full fights, no loopholes)

`mob_targets.csv` is the per-mob checklist: verify each actorClass/mobType level, HP, skills,
and spawn offsets against SQL profiles; confirm wave triggers; confirm the exact owner/sequence gate
in `runtime.onKill` so cross-player or wrong-sequence kills cannot credit; confirm timeout/death/
disconnect/abandon all land on the documented retry sequence with cleanup.
