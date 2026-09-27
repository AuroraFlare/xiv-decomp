# Rivenroad / Rivenroad (Hard) implementation and decomp report

Date: 2026-09-07

Client target: retail FFXIV 1.23b installed under `FINAL FANTASY XIV`

Runtime target: Project Meteor / FF14-Memory

## Result

The two empty White General raid directors now run separate, complete encounters. Normal mode starts with Nael van Darnus, transforms into Nael deus Darnus, and finishes through its low-HP Megaflare sequence. Hard mode starts with its lethal opening Megaflare, runs the 60–40% fragment escalation, the second Megaflare with eight golems, full HP reset, recurring Dalamud Dives, the ten-fragment sequence below 40%, and the final fast-fragment pressure.

The implementation also supplies real party entry, solo GM test entry, retry timers, wipe/timeout handling, reconnect start events, director cleanup, story kill credit, and the one-time White Ravens reward. The reward first records a durable quest flag, then adds the unique item and completes `The Raven, Nevermore`; an inventory-full player can claim it later from Serpent Private Dauremant.

## Evidence hierarchy

1. Installed 1.23b DATs are authoritative for command identity and scalar fields, client Lua methods, model resources, and authored layout transforms.
2. The [official patch 1.23a notes](https://forum.square-enix.com/ffxiv/threads/51545-patch-1.23a-Patch-1.23a-Notes) are authoritative for entry rules, time limits, retries, unlocks, first-clear reward, and the Fierce Ravensbeak condition fix.
3. The original 2012 [Order of the Blue Garter hard-mode guide](https://forum.square-enix.com/ffxiv/threads/51632-Rivenroad-%28Hard%29-Discussion-and-Strategies-Thread/page10) supplies the phase order, health thresholds, fragment/golem counts and positions, charge behavior, and contemporary observed damage/HP estimates.
4. Original footage was inspected directly: [Blue Garter hard clear](https://www.youtube.com/watch?v=nwvi79-qAjM), [Sylvarion normal clear](https://www.youtube.com/watch?v=1HYMo5UVniE), and [a separate normal phase-one recording](https://www.youtube.com/watch?v=RDN9H8Qxuko). It confirms the multi-level combat, upper-platform fragment duty, lower-floor Nael rotations, and the normal two-form progression.
5. Contemporary player discussion corroborates the [normal-versus-hard distinction](https://forum.square-enix.com/ffxiv/threads/55058-The-Raven-Nevermore/page4?p=839062) and the later [Dive cancellation behavior](https://forum.square-enix.com/ffxiv/threads/56384-The-Raven-Nevermore.-Guide-translated-into-chart.?p=868306&viewfull=1).
6. The [archived Rivenroad summary](https://finalfantasy.fandom.com/wiki/Rivenroad) was used only as a secondary cross-check for normal-mode details that the surviving primary hard guide does not cover.

No retail server AI survived in the client. Values described below as calibrated are explicit reconstruction, not alleged decompilation.

## Recovered client contract

`tools/build_rivenroad_decomp.py` reads the installed client without modifying it and fails if the retained typed export disagrees with any raw DAT field. Its reproducible output is `outputs/rivenroad-decomp-20260907/`:

| Artifact | Recovered result |
|---|---:|
| Native command rows | 29 |
| Client Lua chunks | 15 |
| Nael/meteor animation files | 26 |
| Layout instances | 13 |
| Nested layout members | 48 |
| Hashed installed source files | 33 |
| Parser diagnostics retained | 1 |

The one diagnostic is an honest shape mismatch in `m917/equ/e001/met_mdl/0001`: an `EffectEnd` refers to `RaptureChantSyncClip`, not an action clip. The builder records it instead of silently discarding it.

### Command rows

These values come from the raw installed command sheets. A zero cast is instant. Radius and minimum radius are in yalms.

| ID | Native name | Range / shape | Element or channel | Cast |
|---:|---|---|---|---:|
| 23596 | Megaflare | radius 50 | Fire | 0 |
| 23597–23602 | red/black meteor charge/cancel and warp helpers | non-damaging helper rows | none | 0 |
| 23603 | Thermionic Beam | range 30 | Lightning | 0 |
| 23604 | Thermionic Burst | radius 2 | Lightning | 0 |
| 23605 | Plasma Acoustics | range 25 | physical | 3.5 s |
| 23606–23607 | Dive charge/jump helpers | non-damaging helper rows | none | 0 |
| 23608 | Dalamud Dive | radius 50 | Fire | 0 |
| 23609 | interrupted Dive presentation | no damage | none | 0 |
| 23610 | local Dive strike | radius 2 | Lightning | 0 |
| 23611 | Iron Chariot | radius 12 | physical | 0 |
| 23612 | Lunar Dynamo | annulus 15–25 | Astral | 1.0 s |
| 23613 | Ravensbeak | range 8 | physical | 0 |
| 23614 | Chaos Thrust | range 8 | physical | 0 |
| 23615 | Twisting Vice | range 8 | physical | 0 |
| 23616 | lunar-fragment explosion | radius 50 | Fire | 0 |
| 23617 | Aetherial Emission | range 30 | Heal property | 0 |
| 23624–23626 | Megaflare variants | radius 50 | Fire | 0 |
| 23627 | Lunar Dynamo variant | annulus 15–25 | Astral | 3.0 s |
| 23631 | Fierce Ravensbeak | range 15 | physical | 0 |
| 23644 | meteor cleanup explosion | no damage | none | 0 |
| 23645 | meteor explosion variant | radius 50 | Fire | 0 |

The server's old SQL populated these rows with generic placeholder presentation and three-second casts. `rivenroad_actions.lua` fixes execution copies only when the caster is a director-controlled Rivenroad actor, keeping the global command cache and other monsters unchanged.

### Animation and presentation evidence

Nael uses model bank `m917`; lunar fragments use `m091`. The recovered Nael weapon-skill scheduler contains WSS banks 1–7, 9–12, and 14–19. The implementation uses the strong joins where effect resource names or the command ordering identify them:

| WSS | Use |
|---:|---|
| 1 | Megaflare wing/effect sequence |
| 5 / 6 | warp in / warp out |
| 7 | Thermionic Beam |
| 9 | Plasma Acoustics |
| 10–12 | Dive charge, resolution, and cancel sequence |
| 14 | Iron Chariot |
| 15 | Lunar Dynamo |
| 16 | Ravensbeak |
| 18 / 19 | Chaos Thrust / Twisting Vice, inferred from ordinal and Japanese weapon-skill resource names |

The recovered `WhiteGeneralMeteor.initForBattle` client Lua method calls `_setGroundOn(false)`. Fragments are therefore real airborne combat actors whose Y coordinate descends over time; they are not ground props.

### Arena layout

The installed `data/AB/F4/00/00.DAT` hashes to `8dbf9335b4f357421a6dab2dc349bcd5009d2760c7f421d9b52ffaf6c57fb830`. Its root group is rotated 30 degrees and contains two symmetric island/stair sets. The upper glyph VFX members are authored at `Y=21.204000473`. The encounter uses that recovered height for Nael's upper platform.

Exact middle-platform and stair collision coordinates are not encoded as simple instance transforms. Their current positions are video-calibrated values around the symmetric client geometry and are isolated in the `TOP`, `GOLEMS`, and `TEN` tables for capture-driven adjustment.

## Implemented fight model

### Normal: To Kill a Raven

1. Nael van Darnus spawns as actor class `2210901` / mob type `3074`, protected at 1% so a large hit cannot skip the transformation.
2. Van Darnus rotates Thermionic Beam/Burst, Iron Chariot, Ravensbeak, Chaos Thrust, and Twisting Vice. At 35%, two normal lunar fragments begin their fall.
3. At the protected floor the first actor is removed and Nael deus Darnus spawns as `2210902` / `3075` at full HP, with the native wings presentation.
4. Deus Darnus adds Plasma Acoustics and Lunar Dynamo and continues alternating north/south fragments.
5. At 5%, Nael moves to the recovered upper glyph, summons two melee-vulnerable golems, and charges Megaflare while stronger/faster fragments fall. Three landed fragments force the 9999 wipe result.
6. Sufficient damage forces the mitigatable Megaflare. Nael returns to the lower arena for the final burn.
7. A normal-mode player on the actual stair run during Nael's teleport is selected for 9999-damage Fierce Ravensbeak, matching the retail special condition rather than placing the move in a random rotation.

### Hard: The Raven, Nevermore

1. Nael deus Darnus opens already on the upper glyph and charges the first Megaflare. Alternating fragments begin southeast then northwest. About 2,500 raw damage to the heavily reduced boss forces release. Three impacts or the charge deadline produce the lethal result.
2. Nael moves downstairs at full HP. Regular fragments continue. At 60–40% they fall faster; crossing the entire band in one hit cannot skip the later phase check.
3. At 20%, Nael returns upstairs for the second Megaflare. Eight high-magic-evasion golems appear: two on each middle platform and two on each stair set. The first six fragments fall slowly; later ones accelerate.
4. A completed Megaflare despawns these charge golems, heals Nael to exactly full, and starts the second HP bar. A canceled or rejected cast retries and never advances the phase.
5. After at least 90 seconds downstairs, Nael can move upstairs to charge Dalamud Dive while one golem appears below. Damage during the charge reduces or cancels the raid-wide result. Returning at 60–75% starts the one-time timed wave of up to five golems; pushing below 60% while upstairs skips that wave.
6. Below 40%, ten independent fragments alternate between the south and north halves in the contemporary guide's high/low order. This sequence continues independently of Dive scheduling.
7. Below 20%, fast alternating fragments resume until Nael dies.

### Individual mechanics

- Thermionic Beam is a 30-yalm, five-yalm-wide calibrated line frozen at cast start. Three radius-two Thermionic Burst impacts follow its direction.
- Iron Chariot is the native 12-yalm point-blank circle and queues an eight-yalm level-two knockback only for players actually hit.
- Lunar Dynamo is the exact native 15–25-yalm annulus. It removes 15% of each hit target's maximum MP and heals Nael for post-mitigation damage actually dealt to that recipient.
- Plasma Acoustics is physical, applies 30-second Defense Down to its target and Defense Up to Nael, and retains the native 3.5-second cast.
- Ravensbeak is an eight-yalm physical attack with a five-second stun. Fierce Ravensbeak is reserved for the normal stair condition.
- Twisting Vice removes current TP only after landing.
- Fixed encounter damage still goes through Stoneskin and physical/magic damage-taken modifiers. The director sets a command ID and amount before starting a cast; the existing battle pipeline owns mitigation and the final action result.
- Every accepted cast publishes a per-actor completion or interruption counter from `MobSkillState`. Meteor impacts, Megaflare, Dive, phase changes, and cleanup wait for that acknowledgement. A queue acceptance is never treated as a hit.

## Entry, lifetime, and rewards

- Real entry requires exactly eight online, alive level-45 combat jobs/classes in the leader's area.
- Normal accepts characters at the Rivenroad step of any `To Kill a Raven` Grand Company quest, completed story variants, or completed `Living on a Prayer`.
- Hard requires completed `Living on a Prayer` for every entrant.
- Content ID 15/16 client prompts are opened through Serpent Private Hodder/Dauremant before the C# authority revalidates the party.
- Zone 257 and region 109 are checked before private-area creation. The fight uses the 30-minute retail limit and 15-minute success / 5-minute failure retry timers.
- Start and relogin events are keyed by immutable runtime session identity plus actor generation, so reconnection receives `reloginEvent` without duplicate initial starts.
- A disconnected/loading survivor pauses wipe confirmation. Five consecutive ticks with every present participant dead fail the instance.
- GM `test` entry permits one player but marks that player before the director starts. It grants no kill credit, cluster, White Ravens, quest completion, or retry timer.
- All donor mob EXP, gil, random loot, and raw kill callbacks are suppressed. The director awards the one completed encounter after victory, preventing fragments and the protected first form from creating false story credit.
- Dedicated mob-type rows `3120` and `3121` make dynamic Lunar Golem and Lunar Fragment creation valid in both a fresh database and an existing database updated with `Data/sql/live migrations/rivenroad_bnpc_mob_types_20260907.sql`.

GM commands:

```text
!gcrivenroad test normal
!gcrivenroad test hard
!gcrivenroad start normal
!gcrivenroad start hard
!gcrivenroad status normal
!gcrivenroad exit
```

## Confidence and remaining capture work

| Detail | Confidence | Basis |
|---|---|---|
| IDs, names, radius/min-radius, cast times, element/action channel | Exact client data | Raw DAT decode checked against typed CSV |
| Upper glyph Y and root symmetry | Exact client data | Map layout payload |
| Client Lua entry cutscene name and fragment ground-off behavior | Exact client data | Fresh Lua 5.1 disassembly |
| Hard phase order, thresholds, fragment/golem counts, 90-second Dive eligibility | High | 2012 primary guide plus original video |
| Normal two forms, fragment pair, 5% Megaflare, two golems, stair Fierce condition | Medium-high | Original videos, official patch condition, secondary archived guide |
| Boss/add HP, approximate hit damage, damage checks | Calibrated | Contemporary observed estimates; server numeric tables did not survive |
| Beam width, exact X/Z spawn points, descent seconds, ordinary cadence | Calibrated | Video geometry and guide descriptions |
| Cluster drop probability | Provisional | Drop is documented; retail probability is not recovered |
| Golem/fragment actor appearance | Exact client class plus compatible server row | White General client classes survive; dedicated `3120`/`3121` runtime rows supply valid server spawn metadata |

This is a playable, mechanics-complete reconstruction with exact client command geometry where the client preserves it. Calling every calibrated scalar “retail exact” would be misleading. Packet captures from a surviving 1.23b server do not exist here; live party testing in this emulator is still needed to tune the remaining calibrated values and verify the client's upper-platform collision against all ten fragment placements.

## Verification

```powershell
python tools/build_rivenroad_decomp.py
dotnet run --project tools/rivenroad-encounter-tests/RivenroadEncounterTests.csproj --no-restore
dotnet build "Map Server/Map Server.csproj" --no-restore -p:OutputPath=../outputs/rivenroad-build/ -p:UseAppHost=false
dotnet run --project tools/garuda-cast-tests/GarudaCastTests.csproj --no-restore -- "outputs/rivenroad-build/Map Server.dll"
```

Current results:

- Rivenroad simulation: 42 checks passed.
- Existing Garuda cast/geometry regression: 317 checks passed.
- Map Server: builds with zero errors; only pre-existing package advisory warnings remain.
- Reproducible client audit: 29 command rows, 15 Lua chunks, 26 animation files, 13 layout instances, 48 nested layout members, and 33 hashed source files.
