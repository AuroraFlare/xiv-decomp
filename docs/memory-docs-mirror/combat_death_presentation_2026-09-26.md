# Repeated-kill animation degradation, 2026-09-26

The user reports animations progressively failing after mob kills, eventually
including player weapon sheathing. Restarting the map server restores operation.
The precise affected command, mob and first failing client packet are not yet
identified. No live reproduction or client acceptance is claimed by this fix.

## Confirmed timing defect

`Character` delays HP=0 and DEAD publication for the larger of
`battle_death_visual_delay_ms` and the killing command's animation duration.
Previously, `DeathState` nevertheless started its corpse timer at server death.
The impact hold therefore consumed part of the client's corpse lifetime.

The local September 25 map log contains this example for
`fireflyNorm_sea0Fld03_4c@08200`, actor 1141899529:

| Event | Local log time |
| --- | --- |
| Server death, configured corpse lifetime 19 seconds | 18:01:50.754 |
| DEAD publication | 18:01:53.881 |
| Removal | 18:02:10.908 |

Only 17.027 seconds elapsed between DEAD publication and removal, less than the
configured 19-second corpse window plus 750-ms removal grace. The regression
reproduced the same defect with deterministic timestamps: a three-second impact
hold left sixteen seconds before the despawn transition.

This proves premature server retirement relative to its own presentation
contract. It does not prove that premature retirement is the sole cause of the
reported client-wide animation failure or establish native renderer behavior.

## Correction

BattleNpc death states now wait for `PostUpdate` to serialize DEAD before starting
the configured corpse lifetime. Repeated state publication cannot restart that
lifetime. Removal grace and respawn delay follow their existing separate states.
Player auto-disengagement still waits only for the killing animation and DEAD
publication, not the corpse's entire lifetime. Non-mob death timing is unchanged.

The Lua-facing remaining-time getter now reads the actual death/despawn state
instead of a second deadline established at server death. Calamity Cometh's
cleanup rechecks that value after waiting and preserves a finite fallback on
older runtimes. Already retired actors report zero.

No map timer values, SQL, placements, combat damage or animation IDs were changed.
The tested assemblies are isolated under `.codex-build/combat-death-20260926`;
the standard server output and running processes were not replaced or restarted.

## Validation

- Focused production/Lua regression: 576 checks passed, including 150 successive
  death lifetimes. Its original timer test failed before the correction.
- Darkhold production encounter harness: 8,038 checks passed.
- Darkhold traversal: 84 checks passed.
- Garuda cast/outcome/geometry harness: 368 checks passed.
- Shared combat, resource packets, weapon-draw timing, detection range,
  aggro/hitbox behavior and NM respawn/visibility suites passed; dungeon aggro
  includes 244 checks.
- Shared coordinates and map registry: 34 tests passed outside the sandbox,
  where Python could create its temporary test directories.
- The full Darkhold static validator reaches the existing placement suite and
  fails 15 historical-provenance cases for `mob.feasting_chain_c`. These tests
  read placement files and Python builders untouched by this change. The log is
  `.codex-build/combat-death-20260926/darkhold-validator.log`. Initial sandbox
  execution additionally failed temporary-file access; the 15 provenance errors
  persist outside it. Do not describe the complete static validator as passing.

For client acceptance, use the corrected build during a safe restart, repeat
ordinary kills with both auto-attacks and longer spell/skill animations, and
check weapon sheathing and subsequent actions across many kills and respawns.
If degradation persists, preserve the first failing run's server log and client
packet capture before restarting, so the pending command/state can be identified.
