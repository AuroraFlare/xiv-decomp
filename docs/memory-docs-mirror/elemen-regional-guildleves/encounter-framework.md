# Regional Guildleve Encounter Framework

This framework separates encounter behavior from placement data. A regional
guildleve can now describe its circle, mob packs, interaction points, and routes
in `Data/scripts/directors/Guildleve/Leves/<guildleveId>.lua` without adding a
new C# handler or editing a central ID registry.

Numeric encounter files are discovered automatically. If no file exists, the
server retains its original generated fallback behavior and spawns ordinary
objective mobs near the known map marker.

## Coverage

The reusable runtime supports:

- initial, sequential, repeated, and timed waves;
- random distinct wave selection, including “choose 3 of 4 enemy types”;
- independently randomized packs inside one objective circle;
- linked enemy parties and their hostile link presentation;
- kill-count and wave-clear triggers;
- percentage pass/fail branches, including targeted emotes such as `/poke`;
- client content-command/item-on-target branches for crystal-use mechanics;
- random objective-item progress and replacement waves;
- inspect/search interaction points;
- automatic arrival/patrol points triggered by player proximity;
- “enemy appears or the search clears” outcomes;
- decoy despawn, replacement, reveal, and hostility/targetability changes;
- tagged fleeing/chase movement;
- stealth-follow routes with configurable player-detection distance;
- escort routes, waypoint ambushes, and failure when the escorted actor dies;
- DPS, tank, and healer battle allies registered with the player's claim party;
- tagged actor HP-threshold triggers for mid-fight additions;
- timed defense/survival waves;
- objective progress, objective completion, leve completion, and failure
  actions;
- deferred completion while one event batch is spawning its follow-up actors.

All **102 ordinary level-30/40 battle leves** also have encounter configs:
48 level-30 and 54 level-40 contracts. Their builders preserve collection,
search, disguise, pursuit, Necrologos summons, patrol and defense flows.
See the [implementation and activation notes](../guildleve_level_30_40_implementation_2026-09-07.md)
for video evidence, validation, placement limits and the supplemental mob migration.

All **53 faction leves** now have runtime encounter configs. The level 50
missions retain the archived party composition, item rolls, boss phases,
allies, collection points, stealth-follow routes, and timed-arrival rules from
the three faction catalog pages. The level 20/30/40 missions deliberately use
an enemy-themed, one-pull battlefield model: each has one oversized named boss
and two to five related adds, with weaker individual adds in larger packs.
Brotherhood missions are assaults, Azeyma's Shields missions are bounty hunts,
and Horn and Hand missions are resource-guardian battles. The configs live in
`Data/scripts/directors/Guildleve/Leves/_faction_leves.lua`; numeric files for
`1001-1020`, `1101-1119`, and `1201-1214` make them discoverable through the
normal encounter loader.

The faction pages preserve named fields and camps, but not retail world
coordinates. Faction configs therefore carry
`placementStatus = "provisional_area_anchor"` and use the existing coarse
marker seed plus separated local offsets. They are functional reconstructions,
not claims of retail placement. Replace the provisional marker, mob, point,
ally, and route coordinates with `!glbuild` captures as those become
available; the archived mechanics need not be re-authored.

Exact level-20+ mob coordinates, circle centers, and terrain-safe routes are
still placement work. Their absence no longer requires inventing per-leve
server behavior. In particular, the 53 faction configs deliberately keep this
placement provenance visible until direct captures supersede it.

## Minimal two-wave file

```lua
return {
    marker = {CIRCLE_X, CIRCLE_Y, CIRCLE_Z},
    initial = {"first"},
    sequence = {{"second", 0}},

    waves = {
        first = {
            {0, 0, MOB_X, MOB_Y, MOB_Z, ROTATION, 1},
        },
        second = {
            {
                mobIndex = 1,
                objectiveIndex = 1,
                position = {MOB_X, MOB_Y, MOB_Z},
                groupId = 2,
                count = 2,
            },
        },
    },
}
```

`mobIndex` selects `mob1` through `mob4` from `gamedata_guildleves`.
`objectiveIndex` selects `aimNum1` through `aimNum4`; both are zero-based.
Mobs sharing a positive `groupId` form a linked party. `groupId=0` leaves them
unlinked.

The positional spawn format remains compatible:

```text
{mobIndex, objectiveIndex, x, y, z, rotation, groupId}
```

The named format additionally accepts:

```text
actorClassId, count, role, tag, hostile, aiPreset, deathProtected,
spawnAnimation
```

`actorClassId` creates a non-`mob1..mob4` actor such as an escorted NPC.
`role` is normally `objective`, `enemy`, `target`, `decoy`, `ambient`,
`escort`, `protect`, or `ally`. Escort/protect deaths fail by default.
A stable `tag` lets routes and actions address that actor later.
With `role="ally"`, `aiPreset` may be `DPS`, `TANK`, or `HEALER`; the actor is
spawned through the existing ally controller and registered with the player's
claim party. Ally death does not fail by default; set
`failOnAllyDeath=true` when a particular contract requires it.

## Circles and markers

The top-level `marker` is the first objective circle. Each wave and interaction
point can replace it:

```lua
waves = {
    second = {
        marker = {NEXT_X, NEXT_Y, NEXT_Z},
        {mobIndex = 0, objectiveIndex = 0, position = {X, Y, Z}},
    },
}
```

This is the data that remains to be captured or terrain-tested for level-20+
leves.

## Kill rules and objective-item rolls

```lua
killRules = {
    [0] = {
        chance = 70,
        min = 1,
        max = 1,
    },
},
repeatWaves = {"first", "replacement"},
repeatWaveCycle = true,
```

The roll occurs when a mob assigned to objective zero dies. A successful roll
adds a random amount between `min` and `max`; a failed roll adds nothing.
`onPass` and `onFail` action lists can be added for more elaborate outcomes.

The older `itemObjectives` field remains supported as shorthand.

Set `repeatWaveCycle = true` when cleared replacement areas should wrap back
to the first wave and continue until the objective completes. Without that
flag, `repeatWaves` runs once as a finite order.

Multi-target replacement areas can set `repeatObjectiveIndexes = {0, 2}`.
The next area then waits until every living actor assigned to either counter is
gone, and stops repeating only after both counters reach their aims.

To randomize several candidate packs independently inside one circle, attach
`randomPacks` to its controller wave:

```lua
waves = {
    search_area = {
        marker = {AREA_X, AREA_Y, AREA_Z},
        randomPacks = {
            {waves = {"pair_1_false", "pair_1_disguised"}},
            {waves = {"pair_2_false", "pair_2_disguised"}},
        },
    },
}
```

Each entry rolls separately. Repeating a wave name inside `waves` weights that
outcome without adding another placement definition.

## Triggers and actions

Triggers accept `event` values:

```text
mob_kill, objective_progress, wave_clear, interact, emote, content_command,
item_use, actor_hp, elapsed, escort_death
```

Optional filters include:

```text
objectiveIndex, wave, role, tag, point, animationId, descriptionId, variation,
subVariation, hpAtMost, hpAtLeast, atLeast, atMost, complete
```

`allObjectivesComplete=true` additionally requires every nonzero DAT aim to
be satisfied. It does not check living enemies; combine it with a terminal
wave or role filter when the encounter has mandatory final enemies.

Triggers fire once unless `once=false`. `chance` defaults to 100. A failed roll
uses `elseActions`/`onFail`.
For a repeating trigger, `cooldown=N` limits it to one firing every N seconds.

For repeated emote tests across separately tagged candidates, set
`perTag=true`; the once-only gate is then tracked independently for every tag.

```lua
triggers = {
    {
        id = "ambush_or_clear",
        event = "wave_clear",
        wave = "scouts",
        chance = 35,
        actions = {
            {type = "notice", message = "An enemy appears!"},
            {type = "spawn", wave = "ambush"},
        },
        elseActions = {
            {type = "progress", objectiveIndex = 1, amount = 1},
        },
    },
}
```

## Completion after counters

Set top-level `manualCompletion=true` when filling the objective counters is
only an intermediate step, such as collecting the last Necrologos page or
reaching a defense timer. This disables the C# counter-based finish predicate
for that director. The Lua configuration must eventually execute
`{type="complete"}`; existing reward and cleanup handling still applies.

Use a final-wave `wave_clear` trigger, or a dedicated summoned-enemy role
combined with checks that all summoned waves are clear. Do not complete from
an unrestricted `mob_kill` trigger just because the page counters are full:
`mob_kill` is dispatched before `objective_progress`, so the last page-bearing
enemy's death can otherwise finish the leve before its finale is spawned.

## Inheriting a killed mob's top-hate target

A wave spawned by a kill-trigger action can set `inheritHate=true` on the wave
or on an individual spawn. Each new enemy takes the triggering mob's
highest-hate living guildleve player as its initial target and immediately
engages that player. This models revenge or ambush packs that appear at fixed
locations and then hunt the party member who held enmity on the previous mob.

```lua
waves = {
    revenge = {
        inheritHate = true,
        {0, 0, 0.0, 0.0, 0.0, 0.0, 1},
        {0, 0, 2.0, 0.0, 0.0, 0.0, 1},
        {0, 0, -2.0, 0.0, 0.0, 0.0, 1},
    },
}
triggers = {
    {
        event = "objective_progress",
        objectiveIndex = 0,
        atLeast = 7,
        atMost = 7,
        actions = {
            {type = "notice", message = "The enemy appears!"},
            {type = "spawn", wave = "revenge"},
        },
    },
}
```

The standard enemy-appearance notice uses client attention text 50045, matching
the centered retail banner rather than an ordinary chat line.

## Targeted emotes and luminous-crystal searches

The standard emote command now notifies the active guildleve director when its
target is a tagged encounter actor. `/poke` uses animation ID 28:

```lua
triggers = {
    {
        id = "poke_for_crystal",
        event = "emote",
        animationId = 28,
        role = "crystal_candidate",
        perTag = true,
        chance = 35,
        actions = {
            {type = "notice", message = "The creature's belly begins to glow!"},
            {type = "progress", objectiveIndex = 1, amount = 1},
        },
        elseActions = {
            {type = "notice", message = "Nothing happens."},
        },
    },
}
```

This provides the company-leve framework for probing animals and finding a
luminous crystal.

For the following "use the crystal on a target" step, arm the client content
command and filter its target by role or tag:

```lua
contentCommand = {
    variation = 40000,
    subVariation = 0,
},
triggers = {
    {
        id = "use_crystal",
        event = "item_use",
        variation = 40000,
        role = "crystal_target",
        perTag = true,
        actions = {
            {type = "despawn", tag = "crystal_target_1"},
            {type = "spawn", wave = "revealed_target"},
            {type = "clear_command"},
        },
    },
}
```

Use the client-recovered variation for the particular leve. Variations
`10000-19999` accept no target, `20000-29999` accept an optional target, and
`40000-49999` require an NPC target. The server validates the band again,
routes the command only to the owning active director, and exposes target
objective/wave/role/tag metadata to the trigger. This models a reveal into a
burble, devilet, or disguised eye without a per-leve C# handler.

Supported action types:

| Action | Important fields |
|---|---|
| `spawn` / `spawn_wave` | `wave` or `waves` |
| `spawn_random` / `random_wave` | `waves`, `count`, `unique` |
| `spawn_point` | `point` or `points` |
| `progress` | `objectiveIndex`, `amount` or `min`/`max` |
| `complete_objective` | `objectiveIndex` |
| `complete` / `complete_leve` | none |
| `fail` / `fail_leve` | none |
| `notice` | `message` |
| `marker` | `position` |
| `despawn` | `tag` |
| `hostile` | `tag`, `value` |
| `targetable` | `tag`, `value` |
| `release` / `release_movement` | `tag`, `hostile` |
| `arm_command` / `content_command` | `variation`, `subVariation` |
| `clear_command` | none |

## Random enemy selections and HP phases

Company rows that select three types from four can be expressed without a
custom script:

```lua
initialActions = {
    {
        type = "spawn_random",
        waves = {"type_1", "type_2", "type_3", "type_4"},
        count = 3,
        unique = true,
    },
}
```

Mid-fight additions use a tagged actor and an HP trigger:

```lua
triggers = {
    {
        id = "half_health_add",
        event = "actor_hp",
        tag = "boss",
        hpAtMost = 50,
        actions = {{type = "spawn", wave = "adds"}},
    },
}
```

HP triggers are once-only by default. Repeating phases must explicitly set
`once=false` and should set a `cooldown`.

## Search point: mob or clear

This is the direct representation for the chance branch discussed in the
regional descriptions:

```lua
points = {
    search_1 = {
        position = {POINT_X, POINT_Y, POINT_Z},
        objectiveIndex = 0,
        uses = 1,
        chance = 50,
        onPass = {
            {type = "spawn", wave = "hidden_enemy"},
        },
        onFail = {
            {type = "progress", objectiveIndex = 0, amount = 1},
        },
    },
},
initialPoints = {"search_1"},
```

`actorClassId=0` uses the standard guildleve interaction point and
`pushCommandId=0` uses its standard push command. The server bridges these
dynamic points directly to the active guildleve director, so their behavior
does not depend on the selected actor class having a special Lua script.

An interactive point can require a participant's temporary leve resource:

```lua
requiredResource = {
    resource = "bait",
    amount = 1,
    consume = false,
    missingMessage = "You need bait to investigate this location.",
},
```

The check runs before the outcome roll or any action. Without the resource,
the point remains available and no use is spent. `consume=false` checks stock
without paying; `consume=true` pays the amount on each accepted interaction.
`showInDetectWidget=true` updates the shared resource display on payment.
Use this field on clicked points: automatic proximity points have no
interacting player and cannot satisfy a per-player resource requirement.

For an archived patrol/arrival glow that triggers when approached rather than
clicked, set `autoRadius` (or `triggerRadius`):

```lua
points = {
    patrol_1 = {
        position = {POINT_X, POINT_Y, POINT_Z},
        autoRadius = 3.0,
        actions = {{type = "spawn", wave = "patrol_ambush"}},
    },
},
initialPoints = {"patrol_1"},
```

The point consumes its configured `uses` and despawns through the same point
lifecycle after the proximity outcome runs.

## Decoy, reveal, and transformation

Spawn a decoy with a stable tag and no automatic objective progress:

```lua
waves = {
    decoys = {
        {
            mobIndex = 0,
            objectiveIndex = -1,
            position = {DECOY_X, DECOY_Y, DECOY_Z},
            role = "decoy",
            tag = "decoy_1",
            hostile = false,
        },
    },
    real_enemy = {
        {mobIndex = 1, objectiveIndex = 0, position = {REAL_X, REAL_Y, REAL_Z}},
    },
}
```

An interaction or trigger can reveal the real enemy:

```lua
onPass = {
    {type = "despawn", tag = "decoy_1"},
    {type = "spawn", wave = "real_enemy"},
}
```

For an in-place reveal, use `hostile` and `targetable` actions instead.

For a reveal caused by striking a disguised actor, set a stable tag and
`deathProtected=true`. An `actor_hp` trigger can then despawn every member of
the disguise together and spawn the replacement safely even when the first hit
would otherwise have killed the decoy. `spawnAnimation` plays a packed native
actor animation immediately after the replacement appears. The existing
`0x04000000` reveal probe decodes to `cmn/lib/base/0000`, but none of the 18
Guildleve transformation resources has that bank. Their exact activation and
deactivation motions instead live in `emp_emp/bid/base/0000`. Installed-client
disassembly proves that opcode `0x0134`, PASSIVE state `0` to ACTIVE state `2`,
waits for/checks `cbbm_activ` and falls back to `cbbm_id0`. The reverse ACTIVE
state `2` to PASSIVE state `0` edge enqueues transition ID `0x1E`, which maps
exactly to `cbbm_deact`. Actor flag `0x40` selects the `cbbp_u_activ` or
`cbbp_u_deact` upper-body lane instead. Do not send a packed spawn animation for
either transition. Inherited hate can publish ACTIVE immediately, so preserve
reveal ordering and validate combat/nameplate timing; see
`outputs/guildleve-transformation-animation-atlas-20260810`.

```lua
waves = {
    disguised = {
        {mobIndex=1, objectiveIndex=0, position={A_X,A_Y,A_Z},
         role="decoy", tag="pair_a", hostile=true, deathProtected=true},
        {mobIndex=1, objectiveIndex=2, position={B_X,B_Y,B_Z},
         role="decoy", tag="pair_b", hostile=true, deathProtected=true},
    },
    revealed = {
        {mobIndex=0, objectiveIndex=0, position={A_X,A_Y,A_Z},
         groupId=1}, -- PASSIVE -> ACTIVE drives native BID activation
        {mobIndex=2, objectiveIndex=2, position={B_X,B_Y,B_Z},
         groupId=1}, -- no packed animation selector
    },
}
```

## Escort and protect

```lua
initial = {"escort_start"},
waves = {
    escort_start = {
        {
            actorClassId = ESCORT_ACTOR_CLASS,
            objectiveIndex = -1,
            position = {START_X, START_Y, START_Z},
            role = "escort",
            tag = "escort",
            hostile = false,
        },
    },
    ambush = {
        {mobIndex = 0, objectiveIndex = 1, position = {AMBUSH_X, AMBUSH_Y, AMBUSH_Z}},
    },
},
routes = {
    safe_route = {
        {position = {ROUTE_X, ROUTE_Y, ROUTE_Z}},
        {
            position = {ROUTE_X, ROUTE_Y, ROUTE_Z},
            actions = {{type = "spawn", wave = "ambush"}},
            waitForWaves = {"ambush"},
        },
    },
},
escort = {
    tag = "escort",
    route = "safe_route",
    objectiveIndex = 0,
    failOnDeath = true,
}
```

The route runner moves the tagged actor, confirms each endpoint, optionally
spawns waypoint ambushes, waits for configured waves to clear, and completes
the selected objective at the destination. Missing routes are reported rather
than replaced with unsafe straight-line terrain guesses.

## Fleeing and moving mobs

```lua
routes = {
    chase_route = {
        {position = {ROUTE_X, ROUTE_Y, ROUTE_Z}},
        {position = {ROUTE_X, ROUTE_Y, ROUTE_Z}},
    },
},
movements = {
    {
        tag = "fleeing_target",
        route = "chase_route",
        objectiveIndex = 0,
        startAtProgress = 3,
        hostileAtEnd = true,
    },
}
```

`startWhenWaveClear` can replace `startAtProgress`. The actor is neutralized
while following the route, then its original movement speed is restored and
its configured aggression resumes at the destination.

When the fleeing actor is whichever objective mob survives, use the last-live
objective form instead of a fixed tag:

```lua
afterBattle = true,
afterBattleObjectiveIndex = 0,
afterBattleFleeAt = 5,
afterBattleFleeHpAtMost = 50,
afterBattleFleeRoute = "escape",
afterBattleFinalWave = "final",
```

The engine waits for the configured progress, watches the remaining mob until
the HP threshold, protects that survivor during its run, follows the captured
route, spawns the final wave, and restores the runner as a hostile participant.

For the archived “follow without being seen” faction objectives, add
`detectionRange` to the movement. The leve fails when an active participant is
within that distance:

```lua
movements = {
    {
        tag = "tracked_target",
        route = "stealth_route",
        detectionRange = 8.0,
        failOnDetection = true,
    },
}
```

Detection is checked at each movement segment. Use shorter route segments (or a
smaller `maxSegmentDistance`) where terrain requires finer detection.

## Survival and timed waves

```lua
survival = {
    duration = 180,
    objectiveIndex = 0,
    timeline = {
        {at = 0, actions = {{type = "spawn", wave = "first"}}},
        {at = 60, actions = {{type = "spawn", wave = "second"}}},
        {at = 120, actions = {{type = "spawn", wave = "final"}}},
    },
}
```

When the timer expires, the selected objective completes. `completionActions`
can replace that default. General `timeline` and `elapsed` triggers are also
available outside survival mode.

The level-40 defense configs opt into a destination requirement:

```lua
survival = {
    duration = 300,
    destination = {position = {X, Y, Z}, radius = 30.0},
    timeline = {...},
}
```

The defense clock and wave schedule start when a living participant enters
the destination. With nobody present, they pause and the party receives a
return-to-destination notice. The overall leve deadline continues running.
The radius and pause policy are configurable reconstruction choices; the
available footage does not establish immediate failure on leaving. Omitting
`destination` retains the legacy timeline measured from leve initiation.

Defense actors use `engageNearestPlayer=true` on their wave (also accepted per
spawn) to acquire a living participant explicitly. This is necessary for
timed arrivals with no triggering player and for combat profiles whose
passive detection range is zero. The native Survival director's `work/info`
fields `surviveTime`, `surviveStartTime` and `surviveStop` display the remaining
defense time; `surviveStartTime` is an offset from the overall leve start.

## Existing behavior and fallback

The 48 placed level-1/10 encounter files continue using their existing schema.
All standard regional battle director families now invoke this same engine,
including Orb and Survive directors that previously stopped without a real
implementation.

An invalid or absent numeric encounter file does not suppress the old runtime
fallback. This preserves current guildleve behavior while level-20+ placement
data is added incrementally.

## Validation

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate_guildleve_encounter_framework.ps1
python tools/validate_guildleve_chests_and_rewards.py
dotnet build "Map Server/Map Server.csproj" --no-restore
```

The encounter validator compiles the Lua with MoonSharp, confirms all 53
faction IDs resolve to runtime configs with provisional placement provenance,
confirms every standard director family invokes the engine, verifies the C# event bridge, and
executes waves/links and random selection, random progress, interaction,
content-command and HP branches, allies, survival, escort, and stealth/tagged
route scenarios against a fake director.

The complete copyable data template is
`Data/scripts/directors/Guildleve/Leves/_encounter_template.lua`.
