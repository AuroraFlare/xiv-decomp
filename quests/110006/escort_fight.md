# 110006 escort fight: phases, mob AI, escort rules

## The 5 phases (one ambush per stop, fixed roster)

Each stop: escort halts, 1x Ankle Biter (bnpc 1365, Lv1 fixed) spawns,
route resumes only when all stop mobs die (event 101-105 start,
201-204 cleared; stop5 clear → destination events 401/402/403).
No adds beyond the stop roster, no enrage (Lv1 duty; the 30-min mission
timer is the backstop). Solo, no scaling: level roll is min==max → 1.

## Mob profile (bnpc 1365, inspected row + schema)

Hostile, speed 4, job 8, HP/MP 0 (= level-derived), str/vit/dex/int/mnd/
pie 1, att 40, acc/def/eva 1, fire/ice x0.75, wind x1.25, skill list 5013,
no spell/drop list. Retail exactness of species/counts is NOT verified —
authored (court analog uses chinchilla 1401 x1/2/2/3).

## Mob AI / aggro / leash / reset (EscortRouteDirector.cs, inspected)

- Detection: ordinary Sight + IgnoreLevelDifference, range forced to 10y,
  so Lv1 mobs notice higher-level players in range.
- Leash: `IgnoreSpawnLeash=1` — mobs chase without leashing home.
- Spawn: uniform disc r=6 around the mob point, authored Y kept.
- Reset: leaving/failing/completing despawns via ClearActiveEncounterMobs;
  retry rebuilds the route from scratch. No respawn timer inside the duty.
- Targets: player + Player-allegiance allies (the kids once spawned as
  allies). Stops sit 15-21y from mob points, outside the 10y sight range,
  so mobs aggro whoever closes in — normally the intercepting player.

## Escort follow / leash / recall / teleport

- Movement: route speed 4.0, arrival 1.0 (C# souls default), 8s start delay,
  0.75s update tick. Sansa trails Powle (lag 9.0, side -1.1).
- Owner leash: 32y; owner outside → escort WAITS (no fail;
  OwnerFailureDistance 0, court parity). Red leash ring marker (actor
  1090384) radius 32 / caution 30, owner-only.
- Recall/teleport: player recall DISABLED (CanCallBackEscort false); no
  auto-teleport; escort never skips ahead (OwnerWaitWhenAhead false).
- Stops: full halt until the stop's mobs die; destination holds actors
  (HoldEscortActorsOnCompletion) for the cutscene handoff.
- Combat: kids are Lv1 allies (hidden badge, passive). Powle (actor 0)
  HP ≤75% → warning event 301 (rows 370+371); ≤50% → fail event 302
  (rows 368+369) and duty fail. Sansa's HP is NOT engine-monitored.

## Dialogue wiring (typed escort events → man0g1 text rows)

1 ready → Powle 362; 101-105 ambush → 363; 201-204 cleared →
364/365/366/367 (stop5 clear has no line; destination lines follow).
301 → 370+371; 302 → 368+369; 401 → 372; 402 → 373; 403 → 374.
Speaking animation plays on the talking child's index.

## Presentation

Music field 52 / battle 21 (reapplied onCreate + onZoneIn). Display
leve 10826, place 1031→1030, GC flag suppressed. Entry ask scene
`contentsJoinAskInBasaClass`; completion via `pushDefault` type-2 push.
