# Humanoid BNPC Implementation Notes

Last updated: 2026-06-21

Use this note when adding or repairing humanoid battle NPCs. Fresh Codex chats should not rely on conversation memory for this behavior; search this file before wiring humanoid mobs.

## Crash Pattern

Humanoid mobs can crash the client/server when their `server_battlenpc_mob_types.actorId` points at a `gamedata_actor_class` row with an empty `classPath` and `property = 0`.

For humanoid fighter-style mobs, the actor class row needs a real fighter model path and `property = 23`. Do not leave the actor class blank just because the display name exists.

Known fixed actor class rows:

| actorId | classPath | displayNameId | property | Known use |
| --- | --- | --- | --- | --- |
| `2180102` | `/Chara/Npc/Monster/Fighter/FighterEnemyPugilistStandard` | `3180102` | `23` | `westroad_footpad` |
| `2180116` | `/Chara/Npc/Monster/Fighter/FighterEnemyPugilistStandard` | `3180116` | `23` | `toad_poacher` |
| `2180214` | `/Chara/Npc/Monster/Fighter/FighterEnemyGladiatorStandard` | `3180220` | `23` | humanoid gladiator fallback |
| `2180215` | `/Chara/Npc/Monster/Fighter/FighterEnemyArcherStandard` | `3180221` | `23` | `black_crow_archer` |
| `2180216` | `/Chara/Npc/Monster/Fighter/FighterEnemyArcherStandard` | `3180221` | `23` | `black_crow_archer` |
| `2180217` | `/Chara/Npc/Monster/Fighter/FighterEnemyMarauderStandard` | `3180222` | `23` | humanoid marauder fallback |

## SQL Wiring Checklist

When implementing a humanoid mob, check these tables in this order:

1. `Data/sql/gamedata_actor_class.sql`
   Ensure the `actorId` has a non-empty `/Chara/Npc/Monster/Fighter/...` class path and `property = 23`.

2. `Data/sql/server_battlenpc_mob_types.sql`
   Point `actorId` at the fixed actor class. Set `currentJob`, `min_lvl`, `max_lvl`, `skillListId`, `spellListId`, and `dropListId`.

3. `Data/sql/server_battlenpc_skill_list.sql`
   Ensure the `skillListId` exists and links to valid battle command IDs.

4. `Data/sql/server_battle_commands.sql`
   Ensure each ability command used by the skill list exists.

5. `Data/sql/server_battlenpc_mob_types_loot.sql`
   Ensure drops cover the new `dropListId`, either by explicit range or by `displayName`.

6. `Data/sql/server_battlenpc_spawn_locations.sql`
   Add or uncomment spawns only after the mob type and actor class are safe.

## Toad Poacher Reference

`toad_poacher` is the current known-good humanoid reference.

Mob type rows:

| bnpcId | actorId | level | currentJob | skillListId | spellListId | dropListId |
| --- | --- | --- | --- | --- | --- | --- |
| `1142` | `2180116` | `53-57` | `2` | `86` | `0` | `1142` |
| `1168` | `2180116` | `45-50` | `2` | `86` | `0` | `1168` |
| `1183` | `2180116` | `45-49` | `2` | `86` | `0` | `1183` |

Skill list `86` is the pugilist/humanoid fallback:

| skillId | ability |
| --- | --- |
| `27110` | `pummel` |
| `27111` | `concussive_blow` |
| `27114` | `pounce` |
| `27119` | `haymaker` |

`spellListId = 0` is intentional for the toad poacher rows because these are weapon/ability mobs, not caster mobs.

Toad poacher drops are already covered by `displayName = 'toad_poacher'` in `server_battlenpc_mob_types_loot.sql`, so all nonzero toad poacher drop lists receive the same item set.

## Spawn SQL Notes

Be careful when uncommenting rows inside a large `INSERT ... VALUES` batch. If the surrounding active batch already ended with `;`, add a new `INSERT` block for restored rows instead of blindly removing `--`.

Watch for:

- Missing semicolon on the last row of a new `INSERT` block.
- A comma on the last row of a block.
- Duplicate active spawn `id` values.
- Restoring unrelated commented rows near the target rows.
- Adding static spawn IDs higher than existing static rows before the NM auto-ID seed. The NM block uses `MAX(id)`, so this is safe when intentional.

Use base SQL files for durable data. Use `zzz_*` SQL only for temporary live updates or when explicitly requested.

## Validation Commands

Run a formatting check:

```powershell
git diff --check -- Data/sql/gamedata_actor_class.sql Data/sql/server_battlenpc_spawn_locations.sql Data/sql/server_battlenpc_mob_types.sql Data/sql/server_battlenpc_mob_types_loot.sql Data/sql/server_battlenpc_skill_list.sql Data/sql/server_battle_commands.sql
```

Check humanoid actor class rows:

```powershell
rg -n "2180102|2180116|2180214|2180215|2180216|2180217|FighterEnemy.*Standard" Data/sql/gamedata_actor_class.sql
```

Check toad poacher wiring:

```powershell
rg -n "toad_poacher|skillListId 86|VALUES \(86," Data/sql/server_battlenpc_mob_types.sql Data/sql/server_battlenpc_skill_list.sql Data/sql/server_battlenpc_mob_types_loot.sql
```

Check active spawn duplicate IDs:

```powershell
$path='Data\sql\server_battlenpc_spawn_locations.sql'
$rows = foreach ($line in Get-Content $path) {
  if ($line -notmatch '^\s*--' -and $line -match '^\s*\((\d+),\s*(\d+),\s*''([^'']+)'',\s*''([^'']+)'',\s*(\d+),') {
    [pscustomobject]@{Id=[int]$matches[1]; BnpcId=[int]$matches[2]; UniqueId=$matches[3]; MobName=$matches[4]; ZoneId=[int]$matches[5]}
  }
}
$rows | Group-Object Id | Where-Object Count -gt 1
```
