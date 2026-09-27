# 110008 escort + fail edges + branch audit

## "Escort" (SEQ_003): staging talk, NO follow AI — retail-equivalent

Journal says "escort Brother O-App-Pesi to the scene", but retail mechanics are:
talk to O-App in staging private 206/9 -> yes/no prompt (`processEvent007_2`) ->
HQ cutscene man2g000 -> zone into 153/1. O-App never paths in staging or arena
(stationary at coords in actors_positions.md; arena copy is the ward vendor).
No follow/teleport/aggro rules to implement; "no" branch replays prompt with no
state change. Documented, not a gap.

## Fail-edge matrix (all handled, SEQ_004 retained on every fail)

| Edge | Behavior | Re-entry |
|---|---|---|
| Death in arena | playerDead: cleanup + KO-warp outside Quiver's Hold (retail note) | Nonolato (public 206) or O-App (staging) talk |
| Disconnect/crash | login director + per-tick rebind; fight persists; relog in arena continues | automatic; if outside, talk re-entry |
| Timeout 30:00 | cleanup + recovery warp | talk re-entry |
| Teleport/Return/walk-out | leftBattlefield cleanup, no warp (exit respected) | talk re-entry |
| Quest abandon | actor cleanup + EndDirector, no warp; wards via onFinish | re-accept quest |
| Spawn failure (BNPC missing) | spawnFailed message, fail | retry after DB fix |
| Entry decline / wrong class / mounted | EndDirector/EndEvent, no state change | fix + retry |
| Win | SEQ_005 + processEvent010 + recovery warp | n/a (A'naidjaa next) |

Double-director impossible: entry ends existing `QuestDirectorMan2g001` first.
Win race: completed/failed flags guard onKillBNpc; simultaneous death still counts
win (warped KO'd body at SEQ_005, can raise + continue — no stuck state).

## SEQ/event branch audit (no loopholes found)

- ACCEPT/Miounne: talk -> AcceptQuest. SEQ_000/Nonolato: scene -> SEQ_003 + staging warp.
- SEQ_003: O-App -> full entry; Nonolato -> re-stage (crash recovery).
- SEQ_004: arena O-App -> ward prompt; non-arena O-App -> direct re-entry; public O-App
  -> full entry w/ cutscene; Nonolato -> re-stage. Invalid ward selection: no item, EndEvent.
- SEQ_005: A'naidjaa -> scene + SEQ_010 + LS; Miounne -> flavor. SEQ_010/030: LS-only
  (in-person talk safely no-ops to EndEvent). SEQ_015: Soileine -> SEQ_020 + private 10.
- SEQ_020: 8 ambient talks + Soileine re-warp; push -> SEQ_025 + private 11.
- SEQ_025: Fye flag gating (045 vs 045_2), O-App gated (040_4 vs 050 -> SEQ_030 + LS +
  public warp); Soileine backstop to SEQ_020.
- SEQ_035: Miounne flavor; push -> SEQ_040 + private 12. SEQ_040: Fye -> SEQ_045 +
  zone 153/2; 20 crowd talks; push re-warps (idempotent).
- SEQ_045: Yda/Papalymo flavor; PSHSEQ045 -> SEQ_060 + zone 155; amphitheatre push
  backstop to SEQ_040. SEQ_050/055: amphitheatre backstop only (unreachable but safe).
- SEQ_060/Miounne: 080_01 + sqrwa widget + CompleteQuest guard (aborts if not
  SEQ_COMPLETE — overkill-safe) + 30000 gil + 500 EXP.
- Journal markers: every SEQ returns correct private/public split; LS/cutscene SEQs
  correctly return none. Every talk/push path ends with EndEvent + UpdateENPCs or
  an explicit early return after warp/sequence.

## Concrete residual gaps (unrecovered retail data, not code holes)

1. Ward exact mitigation numbers / resistance formula — mechanic shape only.
2. Spirit auto-attack/AI tuning is authored balance (mods documented in fight_director.md).
3. Staging-private mount policy unrecovered — gate applied to combat entry only.
