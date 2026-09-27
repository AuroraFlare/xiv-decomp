# Regional battlecraft guildleve audit — 2026-09-25

## Scope

The older [`all_guildleves_by_zone.md`](all_guildleves_by_zone.md) file is a
historical extraction and retains its original `marker: pending` annotations.
Those annotations are not the current implementation ledger; the manifest and
validation commands below are authoritative for this scoped audit.

This audit covers the current ordinary regional battlecraft catalog at
recommended levels 30 and 40:

- level 30: 48 contracts across Cedarwood, Cassiopeia Hollow, Nophica's
  Wells, Nanawa Mines, Humblehearth, and the Mun-Tuy Cellars;
- level 40: 54 contracts across Bald Knoll, Iron Lake, Halatali, Broken
  Water, Nine Ivies, and Treespeak.

The repository deliberately excludes faction-credit Operation/Wanted rows,
retired duplicate/placeholder rows, Company leves, and fieldcraft leves from
this regional battlecraft catalog. Those systems have separate source,
runtime, and validation paths. There is no ordinary base-level-50 or
base-level-60 regional battlecraft set in the current main SQL; the level-50
combat rows are faction-credit contracts, while higher enemy levels come from
difficulty stars rather than additional ordinary regional contract tiers.

## Current result

All 102 in-scope contracts are implemented as executable encounter
reconstructions. Every contract has a main SQL row, a publisher offer, a
numeric encounter definition, registered target/combat data, and an
ID-specific placement overlay. The implementation is functionally complete in
the offline harness, but it is not yet retail-certified: the archive and
footage establish objective families more strongly than exact probabilities,
terrain, client presentation, or balance.

This pass closed six safe flow gaps:

1. A failed regional leve selected again at its publisher now reaches the
   native `askRetryRegionalleve` decision. Retry consumes one allowance;
   choosing the second branch returns/removes the failed journal entry.
2. The parent-aetheryte start path now rejects a client-supplied leve unless
   it is owned and unfinished and its recorded aetheryte is one of that
   parent's child gates. The child path already enforced the corresponding
   gate and ownership checks.
3. The completion reward path now requires the recovered ContentRewardWidget
   confirm result (`1`) before granting or finalizing. Cancel, close, nil, and
   malformed responses leave the completion node open for a later retry.
4. Completion claims include the live director run identity, so two legitimate
   runs with the same leve, difficulty, and elapsed-second value cannot collide.
5. Director-backed reward claims are now closed until the leve has actually
   ended successfully; a no-director payload must point at a completed journal
   entry rather than merely any held or failed entry.
6. Multi-item completion rewards are aggregate-prechecked and batch-added per
   inventory package. A delivery failure releases the claim and keeps the
   node retryable instead of silently retiring it.

The generated authoring target catalog was also brought current; its check now
reports 276 target rows with no stale entries.

## Verification completed

The following checks pass against the current worktree:

- 48 level-30 encounter runs, including chase arrival/cancellation,
  replenishment, protected targets, search/disguise payment, and finale gates;
- 54 level-40 contracts / 324 complete runs, plus defense timing, pause/resume,
  separated circles, patrol ambushes, disguise assignments, and replenishment;
- all 102 placement overlays and 2,732 spatial leaves;
- all 24 underground level-30 initiation/gate cases;
- all 54 level-40 publisher-card reachability cases;
- all 102 catalog rows, 86 referenced combat actors, and 13 supplemental
  regional combat profiles;
- reward-node confirm/cancel/failed-delivery/reopen cases, including the
  production Lua entry point;
- chest/reward coverage, login/wiki display, MoonSharp encounter syntax, the
  compiled Map Server, the compiled director behavior suite, and the compiled
  placement-editor suite.

The simulations prove runtime wiring and progression contracts. They do not
prove that a retail client accepts every packet, that a placement is on the
retail collision surface, or that an inferred tuning value matches the
original server.

## Remaining retail-evidence work

These items remain intentionally visible rather than being replaced with
unsupported guesses:

- `11704` has five authored spawn slots but four objective credits: the archive
  describes three initial peistes, with the third fleeing, followed by two
  reinforcements, while the DAT-derived counter is four. The current runtime
  preserves the five spawned actors and caps objective progress at four; retail
  evidence is still needed to determine whether the escaped actor remains
  killable after the reinforcement wave or is retired from the objective.
- Some item rewards and supplemental enemy variants are inferred from nearby
  or faction data. They need a source-backed reward capture before changing
  main SQL. Any database correction must update the main SQL and matching
  optional migration together.
- Level-30 drop/search/chase values and level-40 drop/search/disguise/defense
  values are documented reconstruction tuning, not measured retail
  probabilities or thresholds.
- Placement coordinates are frozen recorded-ground or map/video estimates;
  inferred links, collision, route presentation, and live combat positions
  still need client acceptance. Broken Water reuse and Cassiopeia inferred
  links are the clearest placement follow-ups.
- Completion EXP class-change/overlevel behavior, exact reward-item allocation,
  and normal live aetheryte/client presentation still need a
  disposable-character client pass. The server now retries a timeout delivery
  failure, but the client's timeout/reconnect presentation is still unverified.

## Next validation order

1. Build/restart the current Map Server and run a simple elimination leve at
   each of the 12 camps, then one underground level-30 leve at Nanawa and
   Mun-Tuy. Confirm circle, spawn floor, objective count, completion, reward,
   and return warp.
2. Exercise one representative of each family: collection, search,
   disguise/reveal, chase, Necrologos, patrol ambush, and timed defense. Record
   client packets/logs for exact retry, reward-confirm, HUD, and completion
   behavior.
3. Resolve `11704`, inferred reward rows, and any placement failures only from
   captured retail evidence. Do not turn map estimates into recovered retail
   XYZ.
4. Rerun the full catalog, encounter, gate, reward, placement, and compiled
   suites after each evidence-backed change; keep faction, Company, and
   fieldcraft validation separate.

Primary implementation notes remain in
[`guildleve_level_30_40_implementation_2026-09-07.md`](guildleve_level_30_40_implementation_2026-09-07.md),
[`guildleve_level30_implementation_2026-09-07.md`](guildleve_level30_implementation_2026-09-07.md),
[`guildleve_level40_implementation_2026-09-07.md`](guildleve_level40_implementation_2026-09-07.md),
and [`guildleve_individual_placements_2026-09-09.md`](guildleve_individual_placements_2026-09-09.md).
