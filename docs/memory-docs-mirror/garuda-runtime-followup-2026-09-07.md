# Garuda runtime follow-up — 2026-09-07

Later correction: [the pose/Mistral follow-up](garuda-pose-comparison-2026-09-07.md)
adds a narrowly scoped 23992–23994 anchor exemption, allowing an avoided Mistral
to release with zero recipients. Its actual-range recomputation also applies
without a snapshot. The latest C# total is 341; the historical snapshot-only
counts and scope below describe the earlier pass. Use the newer report's fresh
`.codex-build/garuda-poses-20260907/map/Map Server.dll` reproduction path.

## Scope and result

Adversarial review of the production combat path, independently of the Lua director mocks. This pass found and fixed a real mismatch between the director's frozen hazard position and combat admission/revalidation. It does not alter arena coordinates, actors' movement endpoints, imported non-Garuda behavior, or encounter tuning.

The isolated Map Server build succeeds (0 errors; existing dependency-vulnerability warnings). The production-assembly C# harness passes **316 checks** after this change, including **32 new snapshot-admission checks**. These checks do not start the server, connect to the database, or claim native-client visual acceptance.

## Fixed: visible contact could fail at the invisible carrier endpoint

`Actor.DashToPosition` stores its destination immediately. Garuda's director separately interpolates that published movement segment and supplies a frozen contact point through `ForceScriptedMobSkillAtPosition`. Previously that point was used only at completion:

1. `BattleNpcController.TryUseScriptedMobSkill` admitted the command through `BattleNpc.CanUse` using the actor's current stored endpoint.
2. `MobSkillState` repeated the same endpoint-based check when constructing the cast and on `TryInterrupt`.
3. Only `OnComplete` used the explicit frozen position/facing for target discovery and wind displacement.

For a radius-12 tornado with visible center X=0, stored destination X=6, and player-side target X=-11, the visible-circle test accepts the target but endpoint-based `TargetFind` rejects it (distance 17). The reverse target X=17 is inside the endpoint circle but outside the visible circle.

The regression calls **actual `BattleNpc.CanUse`**. With the snapshot absent, the trailing-edge case fails specifically at `TargetFind`'s valid-target shape check. Installing origin (0,0,0) on the otherwise identical command makes it succeed; the converse case remains rejected. The test fixtures use distinct actor IDs and clear the default duel target; this prevents an uninitialized-object fixture artifact from masquerading as the geometry failure.

### Implementation boundary

- `BattleCommand` carries an execution-only copied Garuda origin/facing and applies it when configuring `TargetFind`.
- Only director-controlled private commands **23989–23999 with an explicit snapshot** opt in. Autonomous casters, commands without snapshots, and unrelated command IDs preserve current-origin behavior.
- The controller prepares an isolated command profile before admission, so phase-dependent Eye inner-radius overrides also agree with completion. It does not write into the command cache.
- `MobSkillState` copies the supplied ground transform and installs it on its own execution command before constructor validation; later interruption checks reuse it.
- `BattleNpc` evaluates maximum/minimum range, optional quest cap, and height relative to that same source. `TargetFind`'s existing player-side floor guard also uses the override source, rather than bypassing the floor guard.
- The actors themselves are not moved to make a validation test pass. Existing frozen player-damage geometry, tower-damage geometry, and wind displacement use the same transform.

### New executable coverage

The harness exercises real admission, `MobSkillState.TryInterrupt`, and `TargetFind.FindWithinAreaAtPosition`, including:

- trailing-edge acceptance, endpoint-only rejection, and ordinary endpoint behavior;
- carrier advancement without spurious interruption, while leaving the frozen footprint still interrupts;
- caster weapon-skill-prevention status still interrupts;
- frozen cone facing and completion-recipient agreement after caster rotation;
- prepared Eye annulus inner/outer boundaries matching admission and final recipient discovery;
- dead/departed/friendly targets, MP/TP, recast, minimum/maximum range, height, and player-side floor separation;
- unrelated-command/autonomous-caster exclusion, mutable-vector copying, and cached-command isolation.

The test uses a real player-side `Ally` target for floor/geometry validation and separately tests real `Player` recipients/session readiness in the existing wind suite. Packet transmission and complete world startup are intentionally not part of this fixture.

## Other reviewed paths

### Wind readiness is applied to actual recipients

`FilterGarudaWindTargets` removes entries from the production `TargetFind.GetTargets()` list, not a copied typed list. It requires the helper-specific readiness flag, the current immutable `Session.RuntimeIdentity`, and the current `ActorInstanceGeneration`. A ready anchor cannot thereby admit an unready player, a replacement session with the same character ID, or an actor-table reset. Existing C# and Lua tests cover these cases.

### An empty wind result is not refilled by the legacy fallback

`Character.DoBattleCommand` may invoke `ResolveLegacyMobCommandTargets` for an empty list. That fallback is restricted to self-origin enemy commands whose AOE type is **None**. Garuda's Circle/Cone commands therefore cannot reacquire an excluded player through it. A normally resolved command with zero recipients may still present its action and count as completed; that is distinct from rejection/interruption and intentional for encounter sequencing.

### Neutral construction and per-viewer commits have separate roles

`Npc.CreateSpawnSubStatePacket` sends mode zero for the explicitly deferred actors without changing their desired stored mode. The shared director publisher waits for binding, queues the desired substate before the X00 SubStatus kick, and marks the revision committed only when both publication methods return true. Its viewer identity includes actual Player/Session objects and actor-table generation; unseen or reset viewers must commit again. Wind damage additionally waits the configured post-commit lead and checks readiness again on the final C# recipient list.

This establishes server ordering/readiness, not proof that a stock client has completed asynchronous resource loading. The one-second model-bind/post-commit leads remain reconstruction policy and require a live-client late-join/reconnect acceptance pass.

## Boundaries and residual risks

- `GetLegacySelfOriginOffensiveMobSkillValidationFailure` has a pre-existing non-Garuda quirk: its optional quest-cap helper overwrites the distance output with zero when the cap is disabled. This patch explicitly recomputes distance only for the new snapshot path; correcting all imported mob commands is outside this task.
- `Character.DoBattleCommand` catches internal execution exceptions, whereas the caller's Garuda completion telemetry currently has no success/failure return value. A caught runtime exception could therefore be indistinguishable from successful execution to the caller. No such exception was reproduced in the normal Garuda path in this pass; this is a failure-reporting limitation, not a newly demonstrated encounter failure.
- Native model loading, actual packet delivery/rendering, exact retail damage amounts, and runtime behavior under a full live party remain acceptance work. Green isolated tests should not be described as proof of those outcomes.

## Reproduction

```powershell
dotnet build 'Map Server/Map Server.csproj' --no-restore --no-dependencies --nologo -v:q -p:OutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-20260907/map/ -p:IntermediateOutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-20260907/obj/map/
dotnet run --no-restore --project tools/garuda-cast-tests/GarudaCastTests.csproj -- '.codex-build/garuda-20260907/map/Map Server.dll'
```

Use the fresh isolated assembly, not the potentially stale default `Map Server/bin/Debug` output.
