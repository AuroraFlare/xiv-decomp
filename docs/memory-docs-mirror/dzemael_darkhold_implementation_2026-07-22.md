# Dzemael Darkhold runtime implementation

The [2026-09-07 raid pass](legacy_raid_routes_2026-09-07.md) adds deferred final-clear
presentation, reward publication retries, and persistent coffer rolls that preserve
partially delivered loot. The populated route described below remains in place.

This implementation restores a complete, automatically populated 1.x raid
runtime. It keeps reconstructed placements in the instance manager rather than
writing them to retail spawn tables, preserving a clear evidence boundary for
future live captures.

For the current code-path, SQL-to-AI, boss-phase, Lua/C#, door, diagnostics,
and placement-extension reference, see
[Dzemael Darkhold runtime and encounter guide](dzemael_darkhold_runtime_guide.md).

## Implemented

- A timed, private zone-231 runtime instance using the recovered
  `Occupancy/RaidRoc0Dungeon01` director, widget id 4102/content id 2, opening
  scene `rad0r100`, and close scene `rad0r106`.
- Normal Dyrstweitz entry for a level-45-or-higher party of 4-8 players with an
  active/completed city variant of `Into the Dark`, plus the existing Dzemael
  content timer. The retry lock is the original five minutes from entry; the
  expedition itself retains its separate 60-minute limit.
- A GM solo path that bypasses party/quest restrictions while retaining the
  real private-area, timer, director, music, widget/cutscene, clear, timeout,
  and return flow.
- The complete recovered dungeon roster: Alpgrot Orobon, Bone Nix, Chain
  Bearer, Diamond-tooth Hedgemole, Forsaken Soul, Hellsbound Warrior, four
  Imperial roles, Lava Drake, Recluse Hippogryph, Deepvoid Slave, All-seeing
  Eye, Soulgazer, Batraal, Purgatory Knight, and Purgatory Mage.
- All-seeing Eye and Soulgazer use passive, zero-detection profiles plus the
  server's permanent scripted invulnerability gate. Normal population creates
  one actor of each identity;
  later authored positions are relocation anchors, not duplicate monsters.
- Reusable NPC/enemy patrols are JSON-backed under `Data/actorroutes`, with
  navmesh movement, waits, holds, facing, and encounter-owned action hooks.
  Darkhold automatically discovers the Eye/Soulgazer route keys when those
  evidence-backed files are added; it does not ship guessed waypoint data.
- Batraal's exact recovered level-65 profile (27,489 HP / 1,206 MP), Gargoyle
  action family, three initial Purgatory Knights, the 80% two-Knight/four-ghost
  wave, the 40% three-Knight empowered wave, an opt-in shield terminal, clear
  scene, and delayed return.
- The exact recovered magitek visuals:
  - 2-player circle: `1200325`, `b936/e009`, bank `0x04009000`.
  - 4-player circle: `1200327`, `b936/e007`, bank `0x04007000`.
  - Historical six-player setting: `1200329`, `b936/e005`, bank `0x04005000`.
    September 14 geometry review corrects this asset to eight segments; e006
    has six. See `Data/raidroutes/dzemael_native_circle_review.json` and the
    current runtime guide for separate visual and provisional occupancy data.
  - Terminal: `1200228`, `b936/e004`, full bank `0x04004000`, transition
    `0x0405E000`.
- Server-owned head counting within a 3.75-yalm runtime radius and a short hold
  time. The unused-but-authored 3- and 5-person visual variants remain
  available for controlled testing, but are not claimed as retail Dzemael
  objectives.
- Progression hooks: `field2`/`deepvoid` spawns Deepvoid Slave;
  `field4`/`hellsbound` spawns ten Hellsbound Warriors; `batraalshield`
  temporarily drops Batraal's recurring barrier, inflicts Defense Down, and
  suppresses his glowing sword; `batraalwest` arrests the nearby roaming
  Ahrimans for about one minute.

## Encounter-accuracy pass (2026-08-15)

- Deepvoid Slave now enters its documented enrage at 50% HP. The phase uses a
  bounded six-second TP-move floor plus modest Regain, producing the reported
  increase in TP-move frequency without reproducing the accepted 1.x bug where
  it chained moves with no delay. The threshold and qualitative acceleration
  are retail evidence; the hidden cadence/regain values remain conservative
  server policy because those numbers did not survive.
- Batraal's barrier terminal now owns a 20-point, 25-second Defense Down effect
  for exactly the barrier-down window. Ownership is reference-checked on reset,
  so a player-applied Defense Down that overwrites the terminal effect is not
  removed when the barrier reforms.
- Desolation is now preserved as the recovered 20-yalm forward box/line with a
  two-yalm width rather than being reshaped into a cone. Its final-phase
  12-second encounter schedule remains explicit and testable.
- The two recovered Desolation rows are mechanically distinct: `23354` costs
  1000 TP, while `23590` is the otherwise matching zero-TP director variant.
  Both are held out of Batraal's ordinary action selection before 40%; the final
  threshold restores and schedules only `23590`, so the directional attack does
  not leak into the earlier barrier/sword phases or stall on Batraal's TP pool.
- Purgatory Knights and Mages spawned by Batraal are encounter-owned. They are
  retired immediately when Batraal dies, together with the recurring barrier
  timer and terminal-owned Defense Down, so the five-minute reward-coffer window
  is a clean post-fight state rather than a live add wave.
- The three city variants of `Into the Dark` already use the common BNPC kill
  callback for actor class `2303501`, so Batraal's ordinary death/reward path
  advances the active quest without a duplicate dungeon-specific quest grant.

### Recovered boss action profiles

The live BNPC migration links the encounter actors to the recovered server
action lists, so these commands are executed by the ordinary battle-NPC AI and
do not need speculative per-boss copies in `DzemaelManager`:

- Deepvoid Slave uses ogre list 34: `23041`-`23046`, `23074`, and `23157`.
  The director changes only the documented 50% frequency phase.
- All-seeing Eye and Soulgazer use ahriman list 2: `23093`-`23095`, `23298`,
  `23379`, and `23380`. Archived 1.x NM pages establish that the Eye pauses to
  cast Death March (`23379`) and Soulgazer pauses to cast Death Throes (`23380`).
  The full recovered list is validated at spawn, then the other hazard's
  signature pause move is removed so they cannot swap attacks. Both remain
  passive and invulnerable; only their waypoints, sector transitions, and
  pause/cast timing are withheld pending placement evidence.
- Purgatory Knight uses wight list 58 (`23244`-`23247`, `23346`), while
  Purgatory Mage uses ghost list 32 (`23125`, `23127`-`23130`, and
  `23173`-`23177`).
- Batraal uses recovered list 66: `23350`-`23352`, `23354`, `23356`, `23357`,
  `23588`, and `23590`. The director owns only the evidence-backed encounter
  overlays: recurring barrier windows, the 80% sword/add phase, and the 40%
  Desolation/add phase.

## Auto population and rewards (2026-07-28 pass)

- Every new instance now publishes the route population automatically: entrance
  approach packs, Chocobo Stables/Gullet packs, both Magitek Circle rooms,
  Deepvoid Slave in the Feasting Hall, the three northern Lava Drakes, the
  Granary and Imperial quarters, the pre-Batraal eye pack, and Batraal.
- The room framework is exact shipped data from the zone-231 spawn table:
  `rocdun1_door_chocobostables`, `rocdun1_door_thegullet`,
  `rocdun1_door_grandhall`, and the Grand Hall, Feasting Hall, Granary,
  Captain's Quarters, and Knights' Quarters barriers. Their exact coordinates
  remain the authoritative placement anchors. The rows themselves are not
  copied into dynamic instances: live testing proved that their incomplete
  map-object metadata makes the 1.0 client fault on the unchanged actor packet
  before zone-in completes. Individual combat offsets around those anchors are
  explicitly reconstructed from the period run order and video composition;
  they are not claimed as retail coordinates.
- Four separately recovered ordinary DoorServer objects—layout 211 instances
  `1410`, `1411`, `1412`, and `1418`—now publish before zone transition with
  their exact transforms. They use the shared closed-initialization, proximity
  open, delayed close, and late-join replay path. They do not yet stand in for
  the older objective barriers, and the first live acceptance run must smoke
  test each one in the private actor snapshot.
- Three original named DoorServer bindings—Chocobo Stables `1406`, The Gullet
  `1408`, and Grand Hall `1409`—are now available to the same one-door GM probe
  with their exact static transforms. They remain excluded from normal atomic
  startup until stock-client private-area acceptance is proven.
- Five reward-counting Magitek Circles reproduce the documented 2/6 first-room
  split and 2/2/4 second-room split. GM solo instances retain the correct circle
  visuals but scale activation head-count to one player for testability.
- Completing every circle in either route section now despawns its surviving
  authored enemies without awarding kill credit, matching the period account
  that remaining enemies withdrew when a section's rings opened its seal. The
  All-seeing Eye remains invulnerable and exactly one live Eye is published.
  `grandhall_eye` is retained as a relocation-only anchor; its exact
  inter-section path stays placement-bound and is not guessed here. Soulgazer
  follows the same single-actor rule with `final_gazer` reserved as its later
  relocation anchor.
- Four interactive route coffers use the archived item families: Warlock's
  Pattens, Bladedancer's Jackboots, Revolutionary's Bliaud, and Alpine War
  Jacket. Deepvoid Slave and the three Lava Drakes publish the separate Solid
  Scale Mail and Warlock's Buckler objective coffers. A conservative
  reconstructed route roll awards the named piece at one-in-six. The 2026-09-15
  item audit expands its common fallback to Grade 5 Dark Matter or Vampire Plant;
  equal weights and one-unit quantities remain authored. The base red Batraal
  coffer now permits the guide's zero-to-two equipment count. Gil and exact
  drop-table combinations/probabilities remain unrecovered; see the current
  runtime guide and `Data/raidroutes/dzemael_coffer_loot_review.json`.
- Batraal publishes the fixed reward coffer plus the historically documented
  conditional coffers for the northwestern Alpgrot Orobon, every Magitek Circle,
  a clear within 25 minutes, and all six numbered regular coffers. The latter
  correctly includes the Deepvoid fourth coffer and three-Lava-Drake fifth
  coffer as well as the four freely placed route coffers. Their archived item
  pools are encoded directly, including Verdant/Canopus/Astaroth/Templar gear.
- Dynamic `DZEMAEL_ROUTE|...` and `DZEMAEL_REWARD|...` actors use the shared
  recovered coffer substitute (`1200161`), a direct late-event bridge, open
  animation, duplicate-open protection, party loot assignment, and delayed
  despawn. The substitute actor binding is known non-original because the exact
  Dzemael treasure actor class did not survive locally.
- Objective state now records the northwestern Orobon, Deepvoid Slave, the
  three Lava Drakes, all circles, all six regular coffers, and the
  under-25-minute snapshot.
  Reward eligibility is frozen at Batraal's death, and earned coffers remain
  available for five minutes before the instance returns the party, corrected
  on 2026-09-15 from the original video's post-kill countdown announcement.

## Live migration and diagnostics (2026-07-28 pass)

- `Data/sql/live migrations/dzemael_bnpc_mob_types.sql` idempotently seeds the
  18 recovered BNPC profiles into databases created before the main mob-type
  seed gained Darkhold. This includes the correct action-list links for Batraal,
  Deepvoid Slave, All-seeing Eye, Soulgazer, every route mob, and both boss adds.
- The migration was applied to the active test database before Map Server
  startup. The server loaded 446 BNPC mob types with the Darkhold profiles
  available to runtime population.
- Structured log families now cover diagnostics, devices, objectives, route and
  reward coffers, Batraal waves, clear/reward capture, test drivers, and instance
  finish reasons.
- `diag` sections expose summary, doors, hazards, devices, objectives, boss,
  rewards, and lifecycle state. Hazard diagnostics include live actor counts,
  invulnerability, and the actor-specific Death March/Death Throes binding. The
  lifecycle view includes live players, retained participants, reconnectable
  tickets, empty-grace timing, and the pending finish reason.
- Empty-instance cleanup now waits five seconds and checks retained reconnect
  eligibility before destroying the instance, so a transient disconnect does
  not race the content re-entry path.

## Live placement and aggro pass (2026-07-28)

- The first full-client run exposed a systemic dungeon-spacing problem: the
  player remained at the entrance (`-100.352, 228.411, 252.876`), but the first
  four reconstructed enemies were all inside the configured 50-yalm detection
  range and ignored their spawn leash. Bone Nix and Alpgrot Orobon consequently
  crossed the opening chamber, stacked on the player, and clipped into the
  entrance wall.
- Darkhold mobs now use an 18-yalm detection range and a 24-yalm spawn leash.
  This keeps the route pullable room by room and prevents an engaged pack from
  chasing indefinitely through narrow cave geometry.
- Exact shipped door/barrier anchors were used to remove reconstructed
  near-overlaps: the Grand Hall eye, Circle Hall Chain Bearers and large circle,
  Feasting Hall Deepvoid/coffers, northern Lava Drake, Granary Soulgazer,
  Captain's Quarters Primus/coffer, pre-Batraal souls, and both Batraal
  terminals were moved farther from interactables or room thresholds.
- A player `!pos` capture fixed the first-room six-player circle floor position
  at `(69.994, 178.620, 142.770)`; its actor placement keeps the recovered
  `+2.63` visual offset at `Y=181.250`.
- SIFT registration of the period two-terminal minimap against the live zone
  map moved the Batraal west/Ahriman terminal to `(131, 172.9, -151)` and the
  shield/Defense Down terminal to `(156, 172.9, -177)`. The registration used
  68/71 RANSAC inliers and an observed scale of about one map pixel per world
  unit. Both positions retain a documented `±4`-unit live-probe tolerance.
- A surviving live zone-231 position sample places the descending upper
  corridor near `Y=220`, roughly eight yalms below the instance entrance.
  The first four mobs now use that captured floor height instead of inheriting
  the entrance's `Y=228`; the value remains a capture-backed reconstruction
  pending exact per-actor retail rows.
- Dynamic encounter rings were widened as well: terminal-spawned enemies no
  longer appear directly on the device, and Batraal's add waves now use
  8/10/12-yalm rings instead of 4/5/6-yalm rings.
- Historical visual comparison used
  [Sylvarion Ryulong's 1.0 15-minute run](https://www.youtube.com/watch?v=WmJxkVbowSI)
  and [Victoria Cat's original Darkhold opening recording](https://www.youtube.com/watch?v=QPwUwhj3tRw).
  Both show navigable opening space and room-scale pulls rather than a pack
  collapsing into the entrance before the party advances.

## Test commands

```text
!dzemael goto
!dzemael start
!dzemael enter cs
!dzemael enterempty
!dzemael status
!dzemael diag summary
!dzemael diag doors
!dzemael diag hazards
!dzemael diag devices
!dzemael diag objectives
!dzemael diag boss
!dzemael diag rewards
!dzemael diag lifecycle
!dzemael defeat allobjectives
!dzemael boss 99
!dzemael boss 80
!dzemael boss 40
!dzemael cleanup
!dzemael roster
!dzemael mob batraal
!dzemael mob deepvoid 1
!dzemael circle 2 field2
!dzemael circle 4 field4
!dzemael circle 6 firstroomlarge
!dzemael terminal 3 batraalshield
!dzemael terminal 3 batraalwest
!dzemael door 1410
!dzemael doorlock 1410 on
!dzemael doorlock 1410 off
!dzemael leave
```

Normal/test entry now auto-populates the dungeon. The `mob`, `circle`, and
`terminal` commands remain as player-relative diagnostic overrides for live
capture and encounter testing.

## Evidence and remaining boundary

The archived 1.x Dzemael page supplies the party/time requirements and roster.
The [official 2011 speed-run guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
anchors the first-room 2/6 split and later 2/2/4 split. The local recovered
client data anchors the director, scenes, widget, model variants, and animation
banks. The [official patch 1.18 notes](https://forum.square-enix.com/ffxiv/threads/17007-patch1.18-Patch-1.18-Notes?p=241517&viewfull=1)
anchor the 60-minute limit and five-minute retry, while the
[patch 1.19 notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes)
anchor the later 4-8-player party rule and reconnect behavior. The archived
Japanese encounter guide anchors terminals 6/8, Deepvoid Slave, ten Hellsbound
Warriors, and the Batraal waves.

### Additional video evidence audit (2026-09-01)

The 2011 [Dzemael Darkhold speed-run guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
links a [full run](https://www.youtube.com/watch?v=SYWtisRBS-0) and a
[five-chest run](https://www.youtube.com/watch?v=FfGVL2hUIOY). Its route notes
confirm the first-room 2/6 assignment, the later 2/2/4 three-circle split, the
optional first Warlock's Pattens chest on the speed route, and the Deepvoid /
Batraal progression. A contemporary [Batraal strategy thread](https://forum.square-enix.com/ffxiv/threads/18175)
links a [Batraal kill](https://www.youtube.com/watch?v=ywGn_2VBW_U) and records
the 80% and 40% waves, Sword Terminal use, and the directional final attack.
These sources validate mechanics already wired in the manager; they do not
recover retail world coordinates, Eye/ghost patrol waypoints, hidden Deepvoid
cadence, exact coffer actor identity, or drop probabilities. The retrospective
[Dzemael recording](https://www.youtube.com/watch?v=u-OWLkzFfzQ) is useful
context for upper/lower ghost placement and Batraal ring debuffs, but is not
strong enough to promote those details to static data.

The later native-door recovery supplies the four ordinary DoorServer rows above
with complete layout 211 map-object bindings. Their automatic proximity behavior
is proven in public zone 231; this pass also wires them into Darkhold's pre-zone
private population without bulk-copying the older incomplete rows. Because the
private actor snapshot has previously exposed 1.0 client faults, live acceptance
still needs to exercise each door one at a time—appearance/binding, initial
closed frame, open/close schedulers, late join, and client exception capture.
Use `!dzemael enterempty` followed by `!dzemael door 1406` (then `1408`,
`1409`, `1410`, `1411`, `1412`, and `1418` in fresh empty instances) for that
controlled probe.
`!dzemael doorlock 1410 on` forces the published door closed, while
`!dzemael doorlock 1410 off` releases it back to the ordinary proximity state
machine. This per-door override is the tested control seam future route
objectives can call without disabling automatic doors for all of zone 231.
Objective-locked barriers remain deferred until that smoke test is clean.

The targeted decomp recheck found Darkhold-specific Ahriman, Gargoyle,
Petitghost, Skeleton, and Imperial class names, but their recovered Lua files
are inheritance-only stubs with no thresholds, timers, or placement data.
`AhrimanNormalR0D1Raid01` inheriting `AhrimanPatrolBaseClass` corroborates
the patrol architecture without recovering the path. The separate
`RaidDungeonTreasureBox.processOpenDzemaelEpicQuestType` path belongs to A
Relic Reborn quest `110868`, item `10011244`, and missing drop sheets; it is
not evidence for the ordinary route/reward coffer tables and is not guessed
into this runtime.

Still intentionally labelled as reconstruction: individual mob/device/coffer
offsets, Eye/Soulgazer waypoints, sector transitions and pause/cast timing,
Deepvoid's hidden enrage cadence, Batraal's hidden numeric timing, the
route-coffer probability, and the exact retail coffer actor. Permanent
Eye/Soulgazer invulnerability is now evidence-backed; there is no 1.x
vulnerability-release phase to recover. Ahriman command `23096` (Tail Whip)
exists in the command table but has no recovered link to skill list 2, so it is
not injected into these actors without encounter evidence. Static room anchors,
roster, objective conditions, and item pools remain evidence-backed.
Live capture should refine the offsets without changing the public spawn tables
until the retail joins are proven.

Run `tools/validate_dzemael_darkhold.ps1` after changes. The Map Server project
must also build cleanly (warnings from the legacy dependency set are expected).
