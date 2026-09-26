# Garuda and Good King Moggle Mog XII: live server implementation audit

Audit date: 2026-08-02 (America/New_York)

Scope: read-only audit of the current AuroraFlare `FF14-Memory` server implementation. This document describes what the live server code actually does for both Garuda difficulties and the single Good King Moggle Mog XII encounter. It does not claim that the behavior is retail-perfect, and it does not substitute server intent for client-asset evidence.

No game data, SQL, Lua, C#, client assets, or encounter code was changed during this audit. The only authored artifact is this Markdown file.

## Executive result

The server contains two Garuda profiles—normal and hard—and one Thornmarch profile. Both encounters have complete entry, fight-loop, victory/failure, reward, and timed-reentry scaffolding. Most requested mechanics exist at a gameplay-logic level, but several presentation and synchronization gaps remain:

- Garuda's pre-Aerial-Blast shelter is an analytic 2D line test. A boss-to-player segment with squared length `<= 0.01` returns unshielded; otherwise, a surviving tower shields when its center lies between 10% and 95% of that segment and within 4.5 yalms of it. This is not a collision raycast, height test, or physical occluder (`GarudaEncounter.lua:338-364`).
- Each tower has three scripted segments and a visible size-only degradation path: runtime appearance templates `2209509 -> 2209508 -> 2209507` keep the same `m526` mesh/body but shrink from size 4 -> 3 -> 2. The code broadcasts those two appearance changes; it selects no crack mesh, damage reaction, debris, hit WSS, or break sound. At zero segments the actor is simply despawned (`GarudaEncounter.lua:273-335`; `Npc.cs:535-539,560-614`; `gamedata_actor_appearance.sql:6393-6395`; `primal_actor_action_bindings.csv:26-28`).
- Garuda's apparent jumps/warps are ordinary queued `MoveActorToPosition` updates via `SetPositionUpdate`; the director never sends a jump, takeoff, landing, or manual WSS animation. Because `SetPositionUpdate` defers the coordinate mutation until `Actor.PostUpdate`, the shelter calculation immediately following a requested relocation reads Garuda's old position (`GarudaEncounter.lua:366-404`; `Actor.cs:497-555,1073-1086`; `Actor.cs:740-751`).
- The live Garuda private commands select almost nothing from her 14-bank WSS set: every command uses WSS 1 except Mistral Shriek, which uses WSS 2. There is no explicit selector for the remaining authored Garuda actions, nor for jump/land/relocation transitions (`server_battle_commands.sql:1352-1362`).
- Thornmarch implements all seven court roles, the phase-one staggered arrival, Memento survivor scaling, a fresh seven-retainer phase-two respawn, Maximoogle, and the King's learned-art system. However, almost every ordinary Moogle command selects WSS 1. Memento uses only WSS 1/2/3, leaving WSS 4-23 and 25 unselected by the live fight (`MoogleEncounter.lua:25-77,442-597`; `server_battle_commands.sql:1169-1208`; `primal_action_gap_summary.csv:4`).
- The Moogle "revival" is not a raise animation on the original actors. The phase-one actors are despawned and seven fresh actors are spawned at full HP; the King is spawned directly, and no summon/raise/entrance WSS is emitted (`MoogleEncounter.lua:484-555`).
- Both scripts snapshot their initial `Player` objects once. Generic content reconnect replaces the player in the C# director, but it does not replace the object inside the Lua `state.players` array and does not replay the duty `startEvent`. Reconnect transport exists, but encounter targeting, alive checks, messages, rewards, and wipe logic can continue to reference the stale pre-disconnect object (`GarudaEncounter.lua:92-108,972-1006`; `MoogleEncounter.lua:83-96,697-719`; `PrivateAreaContent.cs:489-525`; `Director.cs:410-436`).
- There is no dedicated Garuda or Moogle validator/test suite in `tools/`. The available GM commands launch or inspect the encounters, and the generic `!instanceraid` command probes only the duty UI/start-event envelope (`testgaruda.lua`; `testmoogle.lua`; `instanceraid.lua:334`).

## Pinned source snapshot

The final hashes are recorded at the end of this file under **Hash manifest**. Line references in this audit refer to that pinned snapshot. The hashes pin the exact working-tree contents inspected. Pre-existing or unrelated working-tree modifications were not altered; Git cleanliness is not evidence for this audit.

## Encounter ownership and entry profiles

### Garuda

`GarudaManager` owns zone/area creation, eligibility, party transport, status, and exit for both profiles (`GarudaManager.cs:13-17,112-253`). It creates a dynamic private area in zone `239`, requires region `102`, uses music `104`, a 45-yalm circular server boundary centered on `(1492,-245)`, and replaces the generic `Instance/CircularArena128` shell director with the selected Garuda director (`GarudaManager.cs:19-26,39-45,178-243`). The zone row is `roc0Field02a`, "The Howling Eye" (`server_zones.sql:127`).

| Manager key / aliases | Difficulty passed to shared Lua | Director | Content ID | Level / party | Boss tuning | Entry requirements |
|---|---|---|---:|---|---|---|
| `garuda`; `normal`, `lesser`, `howlingeye` | `normal` | `InstanceRaidLesserGaruda` | 12 | level 40+, 4-8 players | level 50, 20,000 HP, damage 72 | leader has Vortex Catcher `11000432`; every member has reached sequence 10 in, or completed, a city-state "In for Garuda Wakening" quest |
| `garudahard`; `hard`, `hardgaruda`, `howlingeyehard` | `hard` | `InstanceRaidNormalGaruda` | 11 | level 45+, exactly 8 | explicit configured BNPC level 55, 32,767 HP, damage 95 | leader has active/completed "Taming the Tempest" `110867` and Vortex Fletchings `11000352` |

Sources: `GarudaManager.cs:50-105,255-385`; `GarudaEncounter.lua:59-86`; wrappers `InstanceRaidLesserGaruda.lua:1-10` and `InstanceRaidNormalGaruda.lua:1-10`; configured spawn path `Area.cs:1882-1949`; above-player-cap BNPC level path `BattleNpc.cs:748-757`.

Important entry/reward details beyond the requested animation work:

- Required starter items are checked but not consumed in this manager (`GarudaManager.cs:282-296`).
- Normal and hard use content-timer indices 11 and 10 respectively; clear applies 15 minutes and failure applies 5 minutes (`GarudaEncounter.lua:15-17,923-945`).
- Hard clear grants one Vortex Totem to each non-test player who personally has Vortex Fletchings, or two if the clear is within 10 minutes. A no-death sub-10-minute clear can also grant Howling Gale for active quest `110868` (`GarudaEncounter.lua:19-22,898-921`).
- `HowlingEye.lua` reasserts music 104 and weather 8072 on zone-in (`HowlingEye.lua:3-20`).

### Good King Moggle Mog XII / Thornmarch

`MoogleManager` owns the one installed 1.x Thornmarch profile (`MoogleManager.cs:11-25,55-194`). It creates a dynamic private area in zone `238`, requires region `103`, uses music `97`, and applies a provisional 29-yalm boundary centered on `(-2350,-890)`. The source explicitly says the installed ring collision is about +/-29.62 yalms around its local origin but its layout world transform is not safely decoded (`MoogleManager.cs:35-46`). The zone row is `fst0Field04`, "Thornmarch" (`server_zones.sql:126`).

Retail entry requires exactly eight level-45+ combat characters, party leadership, active/completed "A Feast of Fools" `110816` on the leader, completion of a city-state "It Kills with Fire" by every member, and no active Thornmarch retry timer (`MoogleManager.cs:196-277`). It uses content ID 5 and timer index 4 (`MoogleEncounter.lua:17-20`).

The five enchanted keystones are not entry gates. They are checked per player only when granting the Kupo Nut Charm reward. `UNMARKED_KEYSTONE = 10011153` is declared but unused (`MoogleEncounter.lua:20-23,613-648`). Music 97 and weather 8073 are reapplied on zone-in (`Thornmarch.lua:3-20`).

## Actor, class, appearance, and BNPC joins

### Garuda-side actors used by the live fight

| Role | Actor class | Class script / display-name ID | Runtime appearance | Installed model bank | BNPC row | Director tuning |
|---|---:|---|---|---|---:|---|
| Garuda | `2209501` | `GarudaNormal`; `3209501` | template `2209501`, size 2, body 1024 | base model 10851 -> `m851`, `e001` | `3041`, job 23 (Conjurer) | normal 20,000 HP / hard 32,767 HP; configured level 50/55; damage 72/95 |
| Stone tower stages | `2209509`, `2209508`, `2209507` | all `GarudaLesser`; all `3209510` | templates equal actor IDs; sizes 4, 3, 2; body 1024 | base model 10526 -> `m526`, `e001` | none; non-combat `SpawnActor` | three integer segments; no HP or player targetability |
| Bristle Plume | `2209510` | `GarudaFeather`; `3209504` | template `2209510`, size 2, head/body 1024 | base model 10527 -> `m527`, `e001` | `3090` (`razor_plume`) | normal level45/700 HP; hard level55/1,100 HP; damage48 |
| Silky Plume | `2209512` | `GarudaFeather`; `3209505` | template `2209512`, size 2, head 2048/body 1024 | base model 10527 -> `m527`, `e001` | `32704` | level55, 2,500 HP, no auto-attack damage |
| Suparna | `2209514` | `GarudaMirageNormal`; `3209506` | template `2209514`, size 1, body 1024 | base model 10851 -> `m851`, `e001` | `32705` | level55, 6,000 HP, damage70; magic resistant |
| Chirada | `2209515` | `GarudaMirageNormal`; `3209507` | template `2209515`, size 1, body 1024 | base model 10851 -> `m851`, `e001` | `32706` | level55, 6,000 HP, damage70; physical resistant |

Sources: `GarudaEncounter.lua:241-299,406-453,668-740`; `gamedata_actor_class.sql:6360,6366-6374`; `server_battlenpc_mob_types_loot.sql:3679,3930-3932,4434`; `primal_actor_action_bindings.csv:20,26-34`.

`SpawnConfiguredEnemyWithMobType` disables random mob-skill selection, enables a 50-yalm detection range, ignores spawn leash, applies fixed HP/MP/damage, grants knockback immunity, and optionally sets `NoMove`; the directors therefore own the special rotations (`Area.cs:1882-1949`).

### Thornmarch court

All eight actor classes use base model 10701 and installed bank `m701`; role differentiation is primarily class path and runtime appearance equipment parameters. Retainers are size 5, while the King is size 6. WSS availability is the same bank for every court member (`gamedata_actor_appearance.sql:6422-6429`; `primal_actor_action_bindings.csv:39-46`).

| Court member / role | Actor class | Display-name ID; runtime appearance | BNPC / job | HP / damage | Role art |
|---|---:|---|---|---:|---|
| Whiskerwall Kupdi Koop, tanker | `2210401` | `3210401`; template `2210401`, size 5, body/hands 2048, `e002` | `3113`, Gladiator (3) | 8,500 / 62 | Whisker Bash |
| Ruffletuft Kupta Kapa, attacker | `2210402` | `3210402`; template `2210402`, size 5, body 2080/hands 3072 | `3092`, Marauder (4) | 7,000 / 68 | Moogle-Go-Round |
| Furryfoot Kupli Kipp, healer | `2210403` | `3210403`; template `2210403`, size 5, body 2112/hands 4096 | `3053`, Conjurer (23) | 5,200 / 45 | Cure IV; Healing Magic Potency 1600 |
| Woolywart Kupqu Kogi, sniper | `2210404` | `3210404`; template `2210404`, size 5, body 2144/hands 5120 | `3116`, Archer (7) | 5,000 / 55 | Eye Shot |
| Pukla Puki the Pomburner, nuker | `2210405` | `3210405`; template `2210405`, size 5, body 2176/hands 6144 | `3083`, Thaumaturge (22) | 5,000 / 58 | Pom Flare; owner flag makes its radius 50 |
| Puksi Piko the Shaggysong, buffer | `2210406` | `3210406`; template `2210406`, size 5, body 2208/hands 7168 | `3085`, Archer (7) | 5,500 / 48 | Maximoogle |
| Pukna Pako the Tailturner, debuffer | `2210407` | `3210407`; template `2210407`, size 5, body 2240/hands 8192 | `3084`, Pugilist (2) | 5,700 / 60 | alternates Mognesia and Break |
| Good King Moggle Mog XII | `2210408` | `3210408`; template `2210408`, size 6, head/body/hands 9216/2272/9216 | `3044`, Conjurer (23) | 26,000 / 105 | Mogdive plus inherited dead-retainer arts; Healing Magic Potency 2600; Stun/Bind Resistance 10000 |

All court members are level 50 with 2,500 MP in the director (`MoogleEncounter.lua:41-77,172-240`). SQL role rows are at `server_battlenpc_mob_types_loot.sql:3682,3691,4174-4176,4436,4698,4701`; actor mappings are `gamedata_actor_class.sql:6395-6402`.

## How action animations are selected on this server

The directors normally call `ForceScriptedMobSkill`. A successful action sends the command's client presentation ID and its packed `battleAnimation`. Monster spells are a special case: the server constructs `0x13000000 | (modelAnimation << 12)` (`BattleNpc.cs:1847-1860`; `Character.cs:572-581,3399-3447`). For these encounters there is no Garuda/Moogle presentation-alias table: `BattleCommand.GetClientPresentationId` only aliases private Ifrit IDs `23980-23988`, so Garuda `23989-23999` and Moogle commands are transmitted as themselves (`BattleCommand.cs:448-467`).

Packed values used here are:

- `318771200 = 0x13001000` -> actor WSS 1.
- `318775296 = 0x13002000` -> actor WSS 2.
- `318779392 = 0x13003000` -> actor WSS 3.

No live Garuda or Moogle encounter file calls `PlayAnimationOnActorPacket`, queues a manual WSS, or owns a dedicated spawn/jump/land/raise scheduler.

## Garuda: exact live mechanics

### Basic rotation shared by normal and hard

The boss begins engaged and uses only director-controlled mob skills (`GarudaEncounter.lua:241-270`). Specials are nominally considered every eight seconds, but a plume wave, Aerial preparation, or any queued action blocks the next rotation step (`GarudaEncounter.lua:626-666`). Before Aerial Blast the five-step pattern is:

1. next basic art in `Wicked Wheel -> Slipstream -> Downburst`;
2. next basic art;
3. next basic art;
4. Mistral mechanic—normal always Song, hard alternates Song and Shriek;
5. six-plume pre-blast wave, then repeat.

Every command has a three-second SQL cast and the single global queue starts only one caster action at a time. Multi-player Song/Shriek/Whirlwind applications are serialized as separate casts, not one simultaneous mechanic packet (`GarudaEncounter.lua:188-239`; `server_battle_commands.sql:1352-1362`).

### Garuda action table and current WSS selectors

| ID | Action | Live targeting/effect | Selector |
|---:|---|---|---|
| `23989` | Wicked Wheel | 8-yalm caster circle; damage + knockback | WSS 1 |
| `23990` | Slipstream | 10-yalm, 1.5708-radian/90-degree caster cone; damage, knockback, 5s Stun | WSS 1 |
| `23991` | Downburst | 10-yalm, 90-degree caster cone; damage | WSS 1 |
| `23992` | Mistral Song, pre-blast | single target selected only after director shelter filtering; damage + knockback | WSS 1 |
| `23993` | Mistral Shriek | single target selected by director radius/shelter filtering; damage + knockback | WSS 2 |
| `23994` | Mistral Song, post-blast | 50-yalm, 90-degree caster cone; damage + knockback | WSS 1 |
| `23995` | Feather Lance | 8-yalm caster circle; damage; tower segment loss is separate Lua state mutation | WSS 1 on `m527` plume |
| `23996` | Aerial Blast | 50-yalm caster circle; exact director-supplied fixed damage | WSS 1 |
| `23997` | Eye of the Storm | caster annulus from 30 to 45 yalms; damage + draw-in | WSS 1 |
| `23998` | Great Whirlwind | director-filtered single targets; damage + knockback | WSS 1 |
| `23999` | Thermal Tumult | 8-yalm caster circle; no damage; 30s Sleep | WSS 1 on `m527` Silky Plume |

Sources: SQL `server_battle_commands.sql:1352-1362`; behavior `monster_tp.lua:568-625`; exact Aerial damage bridge `BattleUtils.cs:1390-1406,1465-1476`.

The installed Garuda bank exposes WSS `0001-0014`; the fight selects only 1 and 2. A separate static inventory notes legacy Garuda-tagged DB commands selecting 1-3, but the live director does not call those legacy `2348x/235xx` commands (`primal_action_gap_summary.csv:3`; `primal_battle_command_animations.csv:22-28`).

### Stone towers and progressive destruction

Four towers are placed north/east/south/west at a radius of 14 yalms from arena center. Each record starts with `segments = 3`, for a total of 12 (`GarudaEncounter.lua:45-50,282-307`). They are ordinary spawned NPC actors, not BattleNpcs: there is no HP, hate, combat target, death state, or player-damage callback.

The intended stage ladder is:

| Logical segments | Requested actor class / appearance template | Installed appearance | Observable server operation |
|---:|---:|---:|---|
| 3 | `2209509` | `m526`, size 4, body 1024 | initial spawn |
| 2 | `2209508` | `m526`, size 3, body 1024 | `ChangeNpcAppearance`, broadcasts appearance packet |
| 1 | `2209507` | `m526`, size 2, body 1024 | `ChangeNpcAppearance`, broadcasts appearance packet |
| 0 | none | none | `DespawnActor` |

`ChangeNpcAppearance` loads `gamedata_actor_appearance` by the supplied ID and broadcasts a `SetActorAppearance` packet (`Npc.cs:535-539,560-614`). The size decrease is therefore visible, but all three stages retain the same base model and body; there is no distinct crack mesh or material state in these rows. The director also sends no tower WSS, damage reaction, debris effect, map-object scheduler, or break sound. Final destruction is a direct actor despawn.

Tower segment loss occurs in four places:

- Pre-blast Mistral Song: one segment from the current cardinal-index tower (`GarudaEncounter.lua:366-380`).
- Pre-blast Mistral Shriek: one segment from two adjacent towers (`GarudaEncounter.lua:397-404`).
- Any pre-blast plume that survives 25 seconds: one segment from its cyclically assigned tower (`GarudaEncounter.lua:503-528`).
- Aerial Blast resolution: all remaining towers are force-set to zero and despawned (`GarudaEncounter.lua:586-600`).

There is no partial HP. A one-segment tower shelters exactly as well as a three-segment tower. A failed tower actor spawn still leaves a logical record with three segments, so invisible shelter and Aerial mitigation can exist (`GarudaEncounter.lua:282-299`).

Plume/tower synchronization is not atomic: the tower loses its segment as soon as the plume timer expires, before Feather Lance successfully starts. Stationary plumes choose a random living player rather than a player known to be inside eight yalms; if the selected player is out of command range, the queue deliberately discards the action, but the tower has already broken (`GarudaEncounter.lua:219-232,518-528`). This can produce tower loss without a matching attack animation or player hit.

### Shelter geometry: exact analytic test

For each alive player, the server builds the 2D X/Z segment from `bossPos` to `playerPos`. For each tower with at least one segment:

1. If `|player-boss|^2 <= 0.01`, return unshielded before testing any tower.
2. Compute projection `t = dot(tower-boss, player-boss) / |player-boss|^2`.
3. Require `0.10 < t < 0.95`; towers too close to Garuda, behind Garuda, at/behind the player, or in the last 5% of the line do not count.
4. Compute the closest point on the Garuda-player segment.
5. Shield if the tower center is within `4.5` yalms of that closest point.

Source: `GarudaEncounter.lua:338-364`.

The check ignores Y/height, tower orientation, tower stage/width, world collision, other objects, and whether the tower model is actually instantiated. It is used only for pre-blast Mistral Song and pre-blast Mistral Shriek. Aerial Blast, plume explosions, basic attacks, post-blast Mistral, and wind hazards ignore towers (`GarudaEncounter.lua:366-404,568-600`).

Critically, `startPreBlastMistralSong` requests a move and then performs the shelter test in the same Lua call (`GarudaEncounter.lua:366-379`). `SetPositionUpdate` only queues a coordinate consumed later by `Actor.PostUpdate`; `GetPos` returns current `positionX/Y/Z` (`Actor.cs:740-751,497-555,1073-1086`). Therefore the victim snapshot is calculated from Garuda's pre-move position, not the cardinal destination just requested. Shriek has the same center-move ordering (`GarudaEncounter.lua:397-403`).

Another edge: each exposed player is enqueued separately. If that recorded target dies/leaves before execution, `chooseQueuedTarget` substitutes an arbitrary living player without re-running the shelter test, so a previously sheltered player may become the fallback victim (`GarudaEncounter.lua:196-201`).

### Garuda movement, jumps, and warps

Every encounter relocation uses `SetPositionUpdate`:

- pre-blast Song to one of four cardinal points 34 yalms from center (`GarudaEncounter.lua:366-370`);
- pre-blast Shriek back to center (`GarudaEncounter.lua:397-400`);
- Aerial queue/resolve to center (`GarudaEncounter.lua:568-598`);
- post-blast hard Shriek to a cardinal (`GarudaEncounter.lua:609-615`);
- post-blast Song to `target.x-8,target.z-8`, not a heading-relative point behind the target (`GarudaEncounter.lua:616-622`);
- wind-mode placement to center or center+24 X (`GarudaEncounter.lua:743-754`);
- clone convergence at center +/-4 X (`GarudaEncounter.lua:795-805`).

`SetPositionUpdate` becomes `MoveActorToPositionPacket`, not `SetActorPosition` warp-light, and carries the actor's current move state (`Actor.cs:213-216,497-555`). A separate `WarpToPosition` implementation exists and broadcasts a warp-light packet, but the Garuda/Moogle scripts do not use it (`Actor.cs:874-908`). No takeoff, aerial loop, dive, landing, disappear/reappear, or destination-facing animation is selected. This is the current answer to the requested Garuda jump data: gameplay relocation exists, authored jump presentation does not.

### Plume phases and Aerial Blast

Pre-blast waves use immobile Bristle Plumes near towers; post-blast waves use mobile plumes on a 25-yalm outer ring (`GarudaEncounter.lua:406-453`). Spawns are paced at two per second (`GarudaEncounter.lua:503-516`). Alive plumes detonate after the configured delay, queue Feather Lance, and are scheduled for despawn five seconds later (`GarudaEncounter.lua:518-528`). Killed plumes do not detonate or damage a tower.

At or below 50% HP normal / 60% HP hard, any current wave and boss queue are cleared and the Aerial-preparation wave begins: 12 plumes normal or 18 hard, each with a 25-second survival timer (`GarudaEncounter.lua:555-565`). Five seconds after the wave fully resolves, Aerial Blast is queued (`GarudaEncounter.lua:545-550`).

Aerial damage is:

`clamp(2000 + floor((12 - remainingSegments) / 12 * 7999), 2000, 9999)`

| Remaining tower tiers | 12 | 11 | 10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Fixed damage | 2000 | 2666 | 3333 | 3999 | 4666 | 5332 | 5999 | 6666 | 7332 | 7999 | 8665 | 9332 | 9999 |

The value is put in `garuda.aerial_blast.damage`; `BattleUtils` uses it per target without splitting. Four seconds after the action begins, all towers are despawned and post-blast wind starts (`GarudaEncounter.lua:568-600`; `BattleUtils.cs:1395-1405`).

### Post-blast and hard final phase

Normal remains in west-wind mode after Aerial Blast. Its five-step post-blast rotation is three basic arts, one Mistral Song, and one six-plume wave with a 15-second detonation delay (`GarudaEncounter.lua:609-666`).

Hard alternates post-blast Song and Shriek until Aerial is done and Garuda reaches 40% HP. It then enters hard final, chooses west or south wind, immediately spawns Suparna/Chirada, and limits Garuda's own rotation to basic arts (`GarudaEncounter.lua:650-653,756-763,1061-1063`).

- Suparna: Defense 550, Magic Evasion 10000—magic resistant.
- Chirada: Defense 10000, Magic Evasion 550—physical resistant.
- Both use the same Wicked Wheel/Slipstream/Downburst loop every 10 seconds. At 60 seconds they move to center +/-4 and each surviving clone queues Mistral Shriek. The pair must both die before the pattern completes (`GarudaEncounter.lua:668-710,773-807`).
- Subsequent final patterns begin after a random 40-45 seconds and randomly choose west clones, south clones, or south Silky Plume (`GarudaEncounter.lua:765-771,824-839`).
- Silky pattern spawns one stationary Silky Plume and six Bristle Plumes. Silky casts non-damaging 30-second-sleep Thermal Tumult every eight seconds beginning after five seconds. The pattern remains until the plume wave resolves and Silky dies (`GarudaEncounter.lua:712-741,809-821`).

Wind hazards tick every six seconds when not suppressed (`GarudaEncounter.lua:862-886`):

- West: if any player is at least 30 yalms from arena center, Garuda queues Eye of the Storm. The command itself is a 30-45-yalm caster-centered annulus and draws in.
- South: players inside any of four scripted nine-yalm storm circles receive separate Great Whirlwind casts. During Silky, the center plus two of the three outer circles are active and the omitted outer sector rotates every 10 seconds (`GarudaEncounter.lua:842-860`).

No separate wind-helper actor, ground VFX scheduler, persistent hazard actor, or arena map-object command is spawned by this director.

## Good King Moggle Mog XII: exact live mechanics

### Phase one

Whiskerwall spawns on the eastern edge at center+25 X with aggression disabled. The duty timer/start event does not begin until Whiskerwall has a hate target or dies (`MoogleEncounter.lua:732-764`). Because `state.elapsed` stays zero before engagement, the outer `while elapsed < 1800` loop permits an unlimited pre-pull wait.

The other six definitions are shuffled and arrive one at a time every random 40-50 seconds. Each newcomer is explicitly engaged on a random player (`MoogleEncounter.lua:707-709,768-784`). Phase one ends only after all seven have spawned and died, or at 330 elapsed fight seconds (`MoogleEncounter.lua:462-482,484-521,786-792`).

Each living retainer attempts an art every random 9-13 seconds, alternating its role art and Mogdive. Tailturner's odd role turns alternate Mognesia and Break. Furryfoot substitutes Mogdive when nobody is below 100% HP (`MoogleEncounter.lua:442-459`). All retainers share one global serialized action queue.

### Moogle action/effect table

| ID | Art | Lesser behavior | King-inherited difference | Current selector |
|---:|---|---|---|---|
| `23414` | Mogdive | ordinary single-target damaging mob skill, range 6 | same | WSS 1 |
| `23415` | Whisker Bash | damage + unresistable 12s Pacification | Pacification 18s | WSS 1 |
| `23417` | Moogle-Go-Round | damaging 8-yalm caster circle | same explicit effect/range | WSS 1 |
| `29013` | Cure IV | 2s spell cast on lowest-HP living court member; only queued below 100% | King can inherit it; same spell | monster-spell WSS 1 from `modelAnimation=1` |
| `23420` | Eye Shot | system-message mark, 3s director delay, then 3s command cast; exact 1,400 damage | exact 2,200 damage | WSS 1 |
| `23421` | Pom Flare | Pukla flag makes a 50-yalm caster circle; 5s cast | King lacks Pukla flag, so inherited version is 12 yalms | WSS 1 |
| `23422` | Maximoogle | support-cast branch, 3s cast; target is another living court member | stronger auto-attack bonus | WSS 1 |
| `23423` | Mognesia | non-damaging 20-yalm caster circle; drains up to 1,000 MP | drains up to 1,600 MP | WSS 1 |
| `23438` | Break | non-damaging single target; unresistable 10s Petrification | 15s Petrification | WSS 1 |
| `23424` | Memento, zero survivor | 50-yalm caster circle; exact 450 damage | not learnable | WSS 2 |
| `23451` | Memento, one survivor | exact 1,800 damage | not learnable | WSS 1 |
| `23452` | Memento, two survivors | exact 3,500 damage | not learnable | WSS 2 |
| `23453` | Memento, 3-7 survivors | exact 9,999 damage | not learnable | WSS 3 |

Sources: director `MoogleEncounter.lua:25-39,273-372`; archive effects `monster_tp.lua:47-79,200-240,504-567`; command rows `server_battle_commands.sql:555,1169-1208`; fixed damage `BattleUtils.cs:1408-1429,1465-1476`.

The Eye Shot system message marks the originally chosen target, but target validation occurs again at execution. If the target is no longer alive/in-area, a random player is substituted without a new mark (`MoogleEncounter.lua:302-315,339-370`).

### Maximoogle

Shaggysong selects a random other living lesser; in the final phase the King is also eligible (`MoogleEncounter.lua:260-270,293-299`). The director marks the cast as support so `monster_tp.lua` changes its copied command to an ally-only, no-AOE command. A landed result sets a pending flag on the target (`monster_tp.lua:71-79,232-240`).

On the next encounter update, the target:

- has its AI reset and re-engages a random player;
- gains `moogle.maximoogle.invulnerable=1` and `DamageTakenDown +100`;
- gains AutoAttackDamage +75 for Shaggysong or +125 for the King's inherited cast;
- grows by two appearance-size steps, capped at seven;
- remains buffed for 30 seconds (`MoogleEncounter.lua:388-436`).

Both physical and spell damage explicitly consult the scripted invulnerability temp variable (`BattleUtils.cs:1483-1493,1558-1563,1587-1593`). The size change is only a broadcast appearance-packet mutation; there is no grow/shrink WSS (`Character.cs:269-304`). Recasting on an already active target refreshes expiry but does not replace the bonus.

A Maximoogle-active actor does not schedule role/King skills. If an already queued action from that actor reaches the head of the single global queue, `executeQueue` returns without advancing anything until the buff ends, potentially stalling every court member's queued skill for up to 30 seconds (`MoogleEncounter.lua:318-337,438-459,571-597`).

### Memento ritual and phase transition

At ritual start the global queue is cleared. The server snapshots how many phase-one retainers remain alive, resets their AI, requests that survivors move to a six-yalm ring around center, spawns the King at center, and gives the King `DamageTakenDown +100` (`MoogleEncounter.lua:484-503`). It then selects the fixed damage and WSS variant from the survivor count shown above, queues Memento, and schedules phase two five seconds later (`MoogleEncounter.lua:504-521`).

`DamageTakenDown +100` is not the explicit scripted-immunity temp flag used by Maximoogle. In the physical-damage function, a post-mitigation zero is clamped back to a small level-based physical floor (`BattleUtils.cs:1505-1516`), so the ritual King is strongly mitigated but not categorically immune to physical damage.

At the five-second transition:

1. all active Maximoogle buffs are ended;
2. every phase-one actor still present in the area—dead or alive—is directly despawned;
3. seven new full-HP actors are spawned with `moogle_<role>` IDs at their authored positions and immediately aggressive;
4. the King loses the +100 DamageTakenDown modifier and engages;
5. King action and hate-reset timers begin (`MoogleEncounter.lua:524-555`).

There is no resurrection of the original object, rise-from-death state, raise WSS, summon WSS, entrance movement, or synchronized court animation. It is a despawn/spawn replacement.

### King's inheritance and final victory

When a phase-two retainer dies, each role art in its definition is appended once to `kingSkills` (`MoogleEncounter.lua:558-569`). Tailturner contributes both Mognesia and Break, so all seven deaths produce eight possible learned entries.

The King acts every random 7-10 seconds. Starting with `kingRotation=1`, it alternates a random learned art (when any exist) and Mogdive (`MoogleEncounter.lua:571-597,713-716`). The inherited-power flag only strengthens the explicitly coded secondary mechanics:

- Eye Shot 1,400 -> 2,200 fixed damage;
- Whisker Bash Pacification 12s -> 18s;
- Break Petrification 10s -> 15s;
- Mognesia MP drain 1,000 -> 1,600;
- Maximoogle AutoAttackDamage bonus +75 -> +125.

It does not apply a general damage multiplier to Moogle-Go-Round, Pom Flare, Mogdive, or other inherited damage. Inherited Pom Flare is smaller than Pukla's because only Pukla receives `moogle.pukla=1` (`MoogleEncounter.lua:193-198,352-355`; `monster_tp.lua:64-69,200-217,292-301`).

Every random 22-28 seconds, the King clears all hate and engages a random living player (`MoogleEncounter.lua:577-585`). Victory requires both the King and every phase-two retainer to be dead; killing the King alone does not end the encounter (`MoogleEncounter.lua:599-601,798-806`).

## Animation and presentation gaps by requested feature

| Requested surface | Gameplay logic present | Presentation actually emitted | Current gap |
|---|---|---|---|
| Garuda abilities | yes, 11 private skills | WSS 1 for ten skills, WSS 2 for Shriek | WSS 3-14 not selected by live director; many distinct arts visually collapse |
| Garuda jumps/warps | destination changes at all mechanic points | ordinary `MoveActorToPosition` update | no takeoff/jump/air/land/vanish animation; shelter snapshots pre-update position |
| Garuda slowly breaking rocks | integer 3->2->1->0 | size 4->3->2 appearance packets, despawn at 0 | same mesh/body throughout; no crack/debris/hit WSS |
| Garuda destroys rocks | scripted segment loss and post-Aerial force removal | direct despawn | no destruction animation/scheduler; tower may break before/without Feather Lance cast |
| Players safe behind rocks | analytic victim exclusion for pre-blast Song/Shriek | no shield status or immunity packet | not physical LOS; only selected attacks; fallback retarget can hit a sheltered player |
| Garuda plumes | spawn, kill check, timed tower damage, Feather Lance, cleanup | plume WSS 1 when skill successfully starts | stationary random target may be out of range; rock damage occurs even if animation is discarded |
| Aerial Blast | fixed damage from 12 logical tiers | Garuda WSS 1 | no dedicated selected high-bank Aerial animation in live private row |
| Moogle role abilities | yes | almost all WSS 1 | distinct authored action banks largely unused |
| Maximoogle | full mechanical buff and size change | WSS 1 + appearance size packet | no distinct grow/shrink/empower transition selected |
| Memento scaling | yes, four thresholds | WSS 2/1/2/3 | only three banks, no ritual ensemble choreography |
| Court resurrection | seven fresh actors at full HP | direct old despawn/new spawn | no raise animation or continuity of actor/death state |
| King inheritance | yes | inherited command's same WSS selector | no acquisition/learning animation; only system message |
| Court arrivals | shuffled timers and spawn points | direct actor instantiate | no entrance animation/path/formation motion |

## Queueing, packets, damage geometry, and synchronization

Both fights use one Lua queue and only attempt its first item per one-second encounter iteration. `CanChangeState` and command range can defer it. This makes nominally simultaneous mechanics serial and lets unrelated casters block each other (`GarudaEncounter.lua:203-239`; `MoogleEncounter.lua:318-372`).

Target geometry is resolved by command execution copies:

- Garuda private command rows define circles/cones/annuli where appropriate; Song/Shriek/Great Whirlwind rely on prior Lua filtering and remain single-target.
- Moogle-Go-Round, Pom Flare, Maximoogle, Mognesia, and Memento receive dynamic execution-copy shapes in `MonsterTpPrepareArchiveEffects`, so global command cache state is not mutated (`monster_tp.lua:47-79`).
- Exact Aerial, Eye Shot, and Memento damage is read from caster temp variables in `BattleUtils` (`BattleUtils.cs:1390-1429`).

Start/clear/fail UI uses the recovered InstanceRaid event helpers. Garuda content IDs are 12 normal / 11 hard; Thornmarch is 5. All use scene `none` and a 30-minute finish timestamp (`GarudaEncounter.lua:888-895`; `MoogleEncounter.lua:603-610`). No encounter-specific cutscene is launched.

## Reconnect, late join, wipe, and cleanup

### What exists

- Both managers call `EnableInstanceRaidBind`, set a 30-minute timed reentry expiry, add the initial entrants to the director, and transport them into the dynamic area (`GarudaManager.cs:192-243`; `MoogleManager.cs:135-185`).
- Entry saves return points and DB reentry tickets (`WorldManager.cs:10650-10688`). On login, `Database` finds the live private area and calls `PrivateAreaContent.ReconnectPlayer`, which replaces the stale player in the C# director (`Database.cs:3519-3545`; `PrivateAreaContent.cs:489-525`; `Director.cs:410-436`).
- Content `onZoneIn` replays music/weather to the reconnecting player (`WorldManager.cs:11010`; `HowlingEye.lua:16-21`; `Thornmarch.lua:16-21`).
- Completion sends clear/fail only to connected players still in the area, applies 15/5-minute cooldown policy, waits eight seconds, exits present players to saved return points, marks content finished, ends the director, and calls `CheckDestroy` (`GarudaEncounter.lua:923-959`; `MoogleEncounter.lua:650-685`).

### Current gaps

- There is no active-instance registry or manager method for a new late party member to join an existing Garuda/Thornmarch duty. Only an already registered participant can reconnect.
- The Lua `state.players` arrays are one-time snapshots. C# reconnect swaps director membership, not those arrays. The replacement player can receive the actor snapshot/music/weather but is absent from Lua alive/target/message/reward logic; the stale object may cause false wipe evaluation.
- The duty `startEvent` is sent only once by the Lua loop and is not explicitly replayed to reconnecting clients.
- Wipe confirmation is one sampled second. If no original snapshot player is alive, connected, and in the area for one loop, the duty fails (`GarudaEncounter.lua:14-15,1037-1051`; `MoogleEncounter.lua:12-14,743-755`).
- Neither fight supports an in-instance reset/retry. Failure terminates the duty and applies the five-minute timer.
- Encounter completion does not explicitly despawn/reset every boss/add/tower/buff before ending. It relies on player exit and private-area teardown. Moogle does not explicitly call `endMaximoogle` for every active buff on victory/failure; those NPCs are expected to disappear with the area.
- Garuda towers are not director members. They are area actors and appear in normal actor snapshots, but there is no encounter-specific per-player replay of a break animation or prior stage transition.

## Test and validation surface

Discovered read-only test surfaces:

- `!testgaruda <normal|hard>` launches a solo test; `retail` uses real party validation; `status` and `exit` inspect/leave (`testgaruda.lua:3-42`).
- `!testmoogle` launches a solo test; `retail`, `status`, and `exit` are available (`testmoogle.lua:3-42`).
- `!instanceraid probe garuda|garudahard|moogle` sends only `_setInstanceRaid/startEvent` from a temporary director. Its own status text says it does not create duty content, rewards, or quest progress (`instanceraid.lua:49-75,252-302,318-356`).
- `build_dungeon_animation_inventory.py` and the generated `outputs/dungeon-animation-inventory-20260722` join actors, appearances, models, and packed action selectors; they do not execute fight logic (`build_dungeon_animation_inventory.py:459,543,988-1026`).

No dedicated `validate_garuda*`, `validate_moogle*`, encounter simulation, shelter-geometry regression, WSS-coverage assertion, Memento threshold test, King-inheritance test, phase-reset test, or reconnect-state test exists in `tools/` in the pinned tree. No build or validator was run because this task was explicitly read-only/Markdown-only and the repository has no dedicated non-writing validator for these two encounters.

## Additional mechanics the original request did not name

Garuda also needs coverage for:

- normal vs hard profile divergence and the 50%/60% Aerial thresholds;
- pre-blast Plumage waves and the separate Aerial-preparation plume wave;
- exact tower-tier/Aerial damage scaling;
- post-blast west annulus and south fixed/rotating whirlwind fields;
- hard-only Suparna/Chirada resistances, convergence, and Shriek;
- hard-only Silky Plume, Thermal Tumult sleep, and rotating south-wind pattern;
- post-blast Song vs Shriek alternation;
- victory timers, Vortex Totem quantity, no-death relic item, music/weather, boundary, and reconnect behavior.

Thornmarch also needs coverage for:

- the indefinite pre-pull state and shuffled 40-50-second arrivals;
- each retainer's role appearance and alternating Mogdive cadence;
- Cure IV target selection;
- Eye Shot mark-delay-retarget behavior;
- Pukla full-arena Pom Flare vs the King's smaller inherited version;
- Maximoogle invulnerability, growth, auto-attack bonus, expiry/refresh, and global-queue stall;
- Memento's 0/1/2/3+ survivor branches;
- direct despawn/fresh-spawn "revival" rather than a raise;
- learned-art accumulation, inherited secondary-effect scaling, hate resets, and all-eight victory gate;
- keystone-gated Kupo Nut Charm reward, quest notice, timer, music/weather, arena transform uncertainty, and reconnect behavior.

## Recommended evidence priorities for the broader client decomp

This audit does not prescribe code changes, but it identifies the evidence needed to complete the user's animation catalogue:

1. Map every Garuda `m851` WSS 1-14 by motion, VFX, sound, root motion, duration, and likely mechanic; specifically identify takeoff, displacement/air loop, landing, Mistral Song/Shriek, Plumage, Aerial Blast, Eye of the Storm, and clone-compatible actions.
2. Map `m526` tower BID/WSS/map-object resources and determine whether retail slow-break used size-only stages plus cracks, material/visibility states, schedulers, or effects. The current server stages only shrink the same mesh/body.
3. Map `m527` Bristle/Silky Plume banks and the Feather Lance/death/detonation sequence.
4. Map every `m701` WSS 1-23 and 25, plus BID/BTL/MGC/FID/LIB banks, across the eight appearance/body variants. Current command rows collapse most roles to WSS 1.
5. Identify retail Thornmarch summon, Memento ensemble, growth/shrink, learned-art, court entrance, death, and resurrection choreography, including whether those transitions are WSS, library animations, director schedulers, or cutscene resources.
6. Decode the Howling Eye and Thornmarch battlefield layouts/map-object groups separately from actor action banks; neither live director currently drives layout schedulers for the requested rock/ring/persistent-wind presentation.

## Hash manifest

Pinned after the final stability check at 2026-08-02T18:24:02-04:00. Hashes cover the exact source/data snapshots cited above; this Markdown file is intentionally not self-hashed.

| File | Bytes | Last write (local) | SHA-256 |
|---|---:|---|---|
| `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua` | 34734 | 2026-07-18T11:46:43-04:00 | `daf3f3d7cb9780a1d1ef1dd57e105ec200e60bdb789e8662dc4a0f27b0182c32` |
| `Data/scripts/directors/InstanceRaid/InstanceRaidNormalGaruda.lua` | 209 | 2026-07-17T22:38:26-04:00 | `2e09ab960808eef1b78e8485df29558178fd09237039c2227b508849d0631d33` |
| `Data/scripts/directors/InstanceRaid/InstanceRaidLesserGaruda.lua` | 211 | 2026-07-17T22:38:26-04:00 | `ced0011c7abaecea2112b6ec7858dc02d929a4d4c071a586d0b8419e9a60a5cb` |
| `Map Server/Primals/GarudaManager.cs` | 16079 | 2026-07-19T17:01:47-04:00 | `9e3483597f9b3f72f4967391f57848325bb6061d9ecb2a0a8e71e6b3a2aad4c8` |
| `Data/scripts/directors/InstanceRaid/MoogleEncounter.lua` | 26967 | 2026-07-18T11:46:43-04:00 | `729c5ba5da4b501536e83fba1ceb2aa97fad89f0e64512d7627f7998f201918e` |
| `Data/scripts/directors/InstanceRaid/InstanceRaidDarkMoogle.lua` | 199 | 2026-07-18T09:55:03-04:00 | `962a748d566ccd64d05666441ffaf6060041be162457290ff429cdbcabe9a2e8` |
| `Map Server/Primals/MoogleManager.cs` | 11566 | 2026-07-19T17:01:47-04:00 | `90045b8ed8d4f451a52463770e1fe1b768c4844407f56c515ae60422f5e8c505` |
| `Data/scripts/monster_tp.lua` | 38493 | 2026-08-02T17:14:11-04:00 | `c242cc166242e08133f07b6125421d0f4de8bbe283e5dc3d721b1f6df71928ec` |
| `Map Server/Actors/Chara/Ai/Utils/BattleUtils.cs` | 140595 | 2026-08-02T10:43:07-04:00 | `e56cd2d0e5568216da52afaf3e7d296162e9fb86af7dec849341014d376f82c4` |
| `Map Server/Actors/Chara/Ai/BattleCommand.cs` | 20678 | 2026-08-02T15:12:00-04:00 | `273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30` |
| `Map Server/Actors/Chara/Character.cs` | 175551 | 2026-08-02T15:37:44-04:00 | `e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b` |
| `Map Server/Actors/Actor.cs` | 43695 | 2026-08-02T14:39:28-04:00 | `d31e8509b88485a0e5611b358e360030819706ff88bb9019fed49b74a500f2c7` |
| `Map Server/Actors/Chara/Npc/Npc.cs` | 43300 | 2026-07-30T22:19:42-04:00 | `3c8537abf994cc169b1021ecf8b63d4e6945ac07cfd43565ebdd46ba8c3017f9` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | 200669 | 2026-08-02T17:35:53-04:00 | `a7bc3d40e4640bd66f3db92923611ca6444c2b6269db55bce98fe7607191ad02` |
| `Map Server/Actors/Area/Area.cs` | 90795 | 2026-08-02T11:56:01-04:00 | `9fc6b49891411fb02f24152580c66194a7681a41800bb12cecfb4dd88a87efa6` |
| `Map Server/Actors/Area/PrivateAreaContent.cs` | 128368 | 2026-07-24T22:01:15-04:00 | `d3be41edf9c0ee77ea50018fa6b0a9eb417d7d9415bd3425c57e470edd46705a` |
| `Map Server/Actors/Director/Director.cs` | 25872 | 2026-07-31T21:50:40-04:00 | `79590526f756dadf1752a3d527a0c6ad80604d1ca5e32975b4d8cbb74f969eb8` |
| `Map Server/Database.cs` | 460371 | 2026-08-01T22:58:20-04:00 | `d3fcc67b0da4f3cc857dbd7ff58b6843ee05e908c615c40454643748f8d0f405` |
| `Map Server/WorldManager.cs` | 648482 | 2026-08-02T18:13:30-04:00 | `5c82b87448ca85ad54d7c02dbefcd9dd776c96638f39ec4adc6bc5532225b26c` |
| `Data/sql/server_battle_commands.sql` | 576173 | 2026-08-02T14:34:53-04:00 | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |
| `Data/sql/gamedata_actor_class.sql` | 1628685 | 2026-07-26T13:27:51-04:00 | `a981149eb3f00997b7c4df09dc60cba59e76685d6a732367bae9b82c14c489c5` |
| `Data/sql/gamedata_actor_appearance.sql` | 1216707 | 2026-07-07T19:59:48-04:00 | `bf46cc9438b1a2ea1850b0b856519a952b00058973661453a30e06028e21c015` |
| `Data/sql/server_battlenpc_mob_types_loot.sql` | 383271 | 2026-08-02T10:13:35-04:00 | `40d993aa213a27fb0db8f12b458495bdadb6fd5d34111bbd772896d6cde2b27a` |
| `Data/sql/server_zones.sql` | 16295 | 2026-07-27T20:46:11-04:00 | `c44aa3a7ac83130f04050061212db50a1bda0ba924f5cdf295a883f97a01d446` |
| `Data/scripts/content/HowlingEye.lua` | 555 | 2026-07-26T00:16:51-04:00 | `3f5b41a92bfeb671761e95e0723938de3cfe7240380785bf7909741f3475fce0` |
| `Data/scripts/content/Thornmarch.lua` | 595 | 2026-07-26T00:16:51-04:00 | `5cd8e31d4e8d5dd19310f43ec0c3c4fab3b177df1268c56ab2f88fac4bd85629` |
| `Data/scripts/commands/gm/testgaruda.lua` | 1120 | 2026-07-18T11:23:07-04:00 | `a69dd29c62f82b19e164a44067c96b4742d1e5a75adac59331c4c66ce38e6b68` |
| `Data/scripts/commands/gm/testmoogle.lua` | 1071 | 2026-07-18T09:55:03-04:00 | `3a6dc9ffc5e8b9f30bfb2d323dbd35799e22d85461786079c95f1f479d9a7352` |
| `Data/scripts/commands/gm/instanceraid.lua` | 12471 | 2026-07-22T22:32:43-04:00 | `959e41e466b81b1b46f86bd13c023f4ffed8b40b079832c876532867287d38a0` |
| `outputs/dungeon-animation-inventory-20260722/primal_actor_action_bindings.csv` | 9626 | 2026-07-22T12:29:59-04:00 | `8210ffc58fafb99836325ef881aee957a569eefa663a4e58501846f15001cefa` |
| `outputs/dungeon-animation-inventory-20260722/primal_battle_command_animations.csv` | 6361 | 2026-07-22T12:29:59-04:00 | `fdb54304f660eda00b2ff91ceb26f51e20b2790b8024434ebdb19a56a3aabb5f` |
| `outputs/dungeon-animation-inventory-20260722/primal_action_gap_summary.csv` | 1278 | 2026-07-22T12:29:59-04:00 | `8e52ab13f17448a219945b12ce1569dbad15141b192aa5833cd80e4dc3657f78` |

## Post-pin working-tree drift reconciliation

Final read-only QA after the 18:24 pin found that shared combat files continued to change in the working tree. The original manifest and its numeric line citations are intentionally preserved above as the reproducible evidence base for this audit.

Read-only semantic review of the observed post-pin deltas—including changes in `monster_tp.lua`, `BattleUtils.cs`, `BattleNpc.cs`, and `AIContainer.cs`—showed ongoing Ifrit-specific integration: private `23984` Crimson Cyclone Burn/damage handling, Ifrit Nail self-target activation, and encounter-skill cancellation/teardown. No observed delta touched Garuda commands `23989-23999`, Moogle `234xx` behavior, or coffer code/data, so this report's conclusions remain valid.

Subsequent 2026-08-05 implementation work supersedes the historical Garuda gap findings without altering the pinned snapshot above: the live director now emits staged rock-break banks, Garuda takeoff/landing and Aerial presentation candidates, helper-owned persistent wind presentation/damage, the three recovered hard-final branches, reconnect-aware player refresh and start replay, recovery-aware wipe checks, and deterministic encounter-actor cleanup. Exact ordinary-skill WSS mappings, initial retail placement, capture-derived wind tuning, and the concrete retail reward-coffer join remain unresolved rather than inferred.

Because that working tree remained active, this bundle deliberately does not assert a second “current” hash manifest. The pinned table above is the stable snapshot.

