# Player auto-attack admission repair

The reported symptom is weapon drawn, selected enemy, working hotbar skills,
and incoming attacks/parries, but no outgoing auto-attacks. The supplied log
records a successful Fire hit, not an auto-attack rejection reason. Its slow
scheduler frames do not establish navmesh as the cause. No navmesh, scheduler,
placement, SQL, attack range, floor tolerance or weapon-delay changes are made.

## Reproduced faults

1. `AttackState` creates command 22104 at runtime. With cross-class restrictions
   enabled, player authorization tries to look up its nonexistent SQL command
   row and rejects it with 32556 before reaching the existing auto-attack hotbar
   exemption. The exemption now applies to exactly 22104 + `AutoAttack` before
   learned-action validation, preserving all subsequent target/resource checks.
2. A missing hotbar command returns `commandBorder + 30`. `GetHotbarTimer`
   treated that sentinel as array entry 30 and could reject a basic attack with
   32535 if that unrelated entry held a future cooldown. The read now uses the
   same missing-slot guard as `UpdateHotbarTimer`; actual visible cooldowns
   continue to apply.

Both failures were observed against the unmodified production admission path in
the new headless fixture. The canonical configuration currently disables
cross-class restrictions; the first fault is conditional, and the original
session's entry-30 timer was not captured. These are confirmed code defects,
not proof of which gate blocked the user's live session.

Previously, auto-attack admission supplied no error result and silently dropped
the attack. A player-only `[AutoAttackBlocked]` warning now records a failed
admission's message ID, target, horizontal distance, vertical difference, range
and area identity, throttled to once per ten seconds per attack state. Normal
out-of-range/facing checks occur earlier and do not emit this warning.

## Verification

Build and run without starting the server or opening a database connection:

```powershell
dotnet build tools/combat-death-tests/CombatDeathTests.csproj -c Release -m:1 -p:UseSharedCompilation=false -p:NuGetAudit=false -o .codex-build/player-autoattack-20260926/fixed
dotnet .codex-build/player-autoattack-20260926/fixed/CombatDeathTests.dll
```

`--auto-attack-only` runs just the new checks. The fixture uses the production
`AttackState.Update` and `Player.CanUse`, intercepting the command after admission
to avoid Lua, damage and transport. It does not simulate a live client swing.

- 780 auto-attack checks pass across 15 combat class/job IDs, both restriction
  settings and both clean/stale unused cooldowns. Negative checks retain range,
  floor, area, death, acquisition, hotbar and genuine cooldown gates.
- 576 combat death/disengagement checks pass.
- Shared end-of-patch combat, resource packets and weapon-draw checks pass.
- Detection range, aggro/hitbox and ranged auto-attack exception checks pass;
  dungeon aggro includes 244 checks.
- Garuda cast/outcome/geometry: 368 checks pass.
- Dzemael encounter: 8,038 checks pass.

The isolated fixed Map Server DLL hashes to
`C32C51B4859152432D69B82DD280F5A94BA675F31CB7A37CF21DC76887D9E023`.
It includes the concurrent workspace's level-delta grace edits, which this task
did not author or revert. No standard server output was replaced and no process
was restarted. Use the corrected build at a safe restart, test a selected nearby
enemy with the weapon drawn, and retain any `AutoAttackBlocked` warning if the
symptom remains. Live acceptance is still pending.
