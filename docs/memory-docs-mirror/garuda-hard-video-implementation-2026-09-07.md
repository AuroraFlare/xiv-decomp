# Garuda Hard: remaining mechanics implementation, 2026-09-07

This pass implements the remaining wind behavior and fixes cast/lifecycle errors
in the original FFXIV 1.x encounter. It builds on the existing native decomp;
the [video evidence report](garuda-video-evidence-2026-09-07.md) records the three
original-game recordings actually inspected, timestamp brackets, contemporary
diagrams, and conflicting accounts. The [local-frame timing follow-up](garuda-video-timing-followup-2026-09-07.md)
supersedes its coarse timing estimates using four complete recordings.
Initial sister, plume, and stone-tower spawn positions are unchanged. The user
subsequently supplied boss/player starting transforms for both difficulties;
those authorized updates are listed below. Tornado movement and active regions are encounter
mechanics and are updated using that evidence.

## Supplied Normal and Hard starting points

These are the user's approximate in-client captures, not independently recovered
retail placement rows. Both difficulties now share them:

| Actor / entry anchor | X | Y | Z | Rotation |
|---|---:|---:|---:|---:|
| Garuda | 1524.131 | 301.768 | -252.296 | -1.552 |
| Players | 1492.302 | 302.113 | -259.210 | 1.601 |

The existing 1.75-yalm party spacing remains centered on the new entry anchor.
Boss starting coordinates are separate constants from the arena center, so this
does not move towers, plumes, later boss transitions or wind geometry.

The supplied `Data/quicknavmesh/zone_239.tsv` is a recorded navigation graph.
The user clarified that its loop was walked **inside** the arena, not along the
wall. It helps check the starts against recorded ground, but fitting that route
does not establish the physical wall, arena center, or a wind-damage boundary.
The [navmesh check](garuda-arena-navmesh-check-2026-09-07.md) records that limitation.

Raid start/relogin delivery now remembers the actual Session object and its
actor-table generation per character. `Session.id` is the character ID, not a
unique connection: the old concatenated key suppressed setup after reconnect.
A returning/rebuilt client receives `reloginEvent` once with the original start
and deadline; failed delivery remains retryable and does not restart the timer.
Four new Lua regressions cover reconnect, actor-table reset, rejected delivery
and independent readiness for mixed loading/ready party members.

## Wind behavior

- Contact is checked on every one-second director update. Each helper has its
  own two-second repeat cooldown; an empty area, busy actor, or rejected action
  does not consume another interval. This replaces a shared six-second sample
  followed by a three-second spell cast.
- Eye of the Storm, Great Whirlwind, and Thermal Tumult are immediate actions
  after the director's visible activation/arm delay. Their ordinary command
  presentation still runs through the combat engine.
- South wind uses a stationary, intermittent central column and three columns
  moving clockwise at 120-degree spacing. The preserved contemporary overview
  depicts those four regions. Reports of only three active columns may describe
  a central off-window, but that explanation remains an inference.
- Mirage keeps its four fixed regions; the two bordering the safe side pocket
  switch off together periodically, while center/far-side regions remain active.
- The west ring has a smaller, stronger final-phase variant. Both the director's
  contact check and the individual battle-command execution receive the same
  inner radius. Final potency changes only that execution copy.
- Eye of the Storm pulls toward its central origin, following the specific
  contemporary West-wind account. Great Whirlwind pushes away from its column.
  The sampled videos do not measure those displacement vectors.
- Damage and knockback use the same frozen contact point. The director
  interpolates the published movement segment before sampling contact; a later
  dash endpoint cannot move that cast's damage circle or knockback origin.
- Hiding, suppressing, or reusing a helper cancels its old wind command before
  changing presentation or position. A newly active hazard gets a visible lead
  before damage. Failed/missing helper slots are retried individually, and a
  loading/reconnected player receives the current actor state through an
  ordered, per-viewer publication path.
- Setting mode bits alone leaves a native state queued. The publisher now
  sends opcode 0x0144 followed by a real presentation-only X00 action using
  verified control-only m999 WSS16 (`0x13010000`). It commits both activation
  and deactivation without requiring anyone to enter the damage area. Unknown
  viewers spawn neutral; their current state commits after a binding lead.
  Per-viewer revisions prevent repeated effects, while session identity and
  visibility changes force a fresh current-state delivery after reconnect.
- Wind damage recipients are filtered in the production battle state, not just
  when choosing an anchor. A ready player cannot cause an unseen neighboring
  player's damage/knockback. Helper-specific readiness requires a committed
  revision, a presentation lead, exact `Session.RuntimeIdentity`, and the current
  actor-table generation. Off-states, removal and cleanup revoke readiness.
  Character IDs alone are insufficient: a replacement session can reuse that ID.

The recovered m999/e003 model, `0x10`/`0x20` state bits, WSS18/WSS15 selectors,
and Wind element are retained. Render/culling bounds are still not treated as
gameplay collision evidence.

## Native stone sections

The [rock-state decomp](garuda-rock-state-followup-2026-09-07.md) proves that
m526 contains separately maskable upper, middle and base sections. Rocks now
retain the original appearance and scale while committing cumulative modes
`0x10`, `0x30`, and `0x70` for successive breaks, or `0x80` for complete collapse.
The native node-group handler clears the appropriate mesh pairs; these are not
guessed animation names or uniform size reductions.

Mode and the corresponding real WSS action are sent in order per viewer, with
retry and late-bind support. Existing viewers receive a break once; returning
viewers receive the current cumulative state. Shelter, damage budgets, staging
and all four original spawn locations remain unchanged.

## Plumes, casts, and phase progression

Silky pursues the existing rear-player target, arms, and performs Thermal Tumult
once. Completion triggers a short inert presentation hold and despawn. A rejected
or interrupted attempt can retry; the fallback lifetime prevents an unreachable
Silky from permanently blocking subsequent patterns. It cannot melee during its
approach or despawn hold. The 30-second Sleep status is independent from this
fallback lifetime; the latter is not recovered retail timing.

The [final source audit](garuda-final-audit-2026-09-08.md) adds failed-spawn
recovery. Missing Razor slots retry without replaying Plumage or stopping
existing detonations; missing Satin creation cannot skip Sleep. Sisters retry
individually without replacing living or killed counterparts. Delayed sister
creation defers the convergence clock, not ongoing ordinary attacks. These
failure-only policies preserve successful-spawn behavior and initial placements.

South now schedules the next pattern **62 seconds from South's start**, not
40–45 seconds after plume deaths. Both complete recordings place its consecutive
wind announcements about 62–63 seconds apart despite differing observed death
times. The director announces wind changes synchronously, so this constant
models the observed total span; it does not claim a recovered retail literal.
Unresolved adds or a busy caster still delay the transition safely. Garuda can
use ordinary specials while final-South plumes are alive, as the supplied
recording demonstrates at 07:20.

Clone phases retain a separate 40–45-second post-resolution delay as tuning.
The [clone follow-up](garuda-clone-timing-followup-2026-09-07.md) weakens that
assumption: two South transitions occur about 36–39 seconds after displayed
sister-health depletion, while a third, weaker WHM visual-removal sample before
Mirage spans about 41–43 seconds. None exposes an authoritative last-sister
death timestamp. This is an unresolved timing discrepancy, not a verified retail
40–45-second rule or evidence for a new universal 35-second replacement.
The earlier sparse-frame argument for its exact value is withdrawn; complete
footage establishes differing clone-pattern lengths but not an exact post-death
timer. Final selection avoids immediate repeats and uses the reported two-clone
limit before South. Another contemporary author contests that limit; it remains
a documented selection policy.

Bristle Featherlance now waits for the engine's completed action before removing
a rock tier or completing its wave. An interrupted/rejected attempt cannot
pretend to explode, and a killed plume cannot break a rock without completion.
The no-player, tower-only explosion is an explicit presentation fallback.
Detonating Bristles remain immobile and unable to melee through their despawn
hold. Its recovered instant cast and asynchronous completion acknowledgment are
separate concerns.

Suparna and Chirada now use explicit magic/physical damage reduction on their
resistant channel, preserving normal stats on the vulnerable channel. The old
"normal" MagicEvasion bonus made both sisters reach the same resist cap; magic
evasion also does not reduce landed spell damage. The 90% resistant-channel
reduction is named tuning, verified against the production damage functions,
not a recovered retail percentage.

Garuda and each sister retain their own queue order, but a busy caster no longer
blocks another caster at the head of the global queue. Sisters aim ordinary
specials at their own highest-enmity target. A later pattern waits for Garuda's
current cast/warp and pending outcomes instead of relocating her mid-attack.

The battle engine reports one terminal result for each director-controlled
Garuda command `23989–23996` and Thermal Tumult `23999`. Monotonic actor-local
completion/interruption counters are written after command resolution or on
interrupted cleanup. The two wind commands do not publish these counters.

- One cast-start origin/facing is used for player and tower damage; a tier is
  removed only after that cast completes. Interrupted attacks no longer break
  rocks, and later target movement cannot rotate only the player-damage cone.
- Surviving-tower shelter prevents Mistral knockback as well as damage.
- Aerial Blast aftermath requires completion. Losing the selected target or
  interrupting the cast causes a retry while retaining its phase health floor;
  a fixed six-second timer can no longer skip the attack.
- The one-minute convergence starts surviving Shrieks together when possible.
  Rejected/interrupted casters retry individually, without replaying successful
  casts. Ordinary rotation pauses until convergence outcomes are resolved.
- Mistral Shriek can select an anchor within 50 yalms while retaining its
  22-yalm damage radius, so target validation does not prevent an otherwise
  correctly placed self-centered attack.
- The private cone rows now use the target finder's fraction-of-PI unit:
  `0.5` is a 90-degree full cone. Their old `1.5708` value was interpreted as
  approximately 283 degrees. Private Garuda commands opt into exact cone/ring
  checks that handle cardinal headings, angle wrap, and the safe center of an
  annulus; unrelated commands retain their existing geometry path.

## Reconstruction values

These are named constants or isolated command settings, not retail-exact claims.

| Setting | Current value | Evidence boundary |
|---|---:|---|
| Wind repeat damage | 2 seconds | Contemporary repeated-hit account; sampled video does not establish a universal clock |
| Wind activation lead | 1 second | Server publication/presentation policy |
| Small-column damage radius | 12 yalms | Canonical Great Whirlwind range field |
| South orbit | Radius 20, period 40 seconds, 2-second movement segments | Clockwise motion and layout supported; speed/radius remain tuning |
| Central/Mirage-side pulse | 4 seconds on, 4 seconds off | Off-windows supported; exact interval and synchronized side windows are reconstruction |
| West radii | Outer 44; safe eye 30 initially, 12 in final | Canonical Eye range/minimum are 44/12; initial override and final-phase assignment remain reconstruction |
| Final west potency | 150% of initial command potency | Stronger final storm supported; multiplier remains tuning |
| South displacement | Existing 4-yalm push | Conservative engine policy; distance not measured |
| Silky arm / fallback lifetime | 3 / 30 seconds | Early threat and self-destruction described; exact timing unobserved |
| Silky completed-effect hold | 3 seconds | Presentation policy |
| South pattern total span | 62 seconds from onset, subject to safe transition guards | Two videos show 62–63 seconds between announcements; not a recovered server timer |
| Clone resistant channel | 90% damage reduction | Strong resistance source-backed; exact percentage is tuning |

## Further native-data recovery

The [command audit](garuda-command-audit-2026-09-07.md) verifies cast, range,
attribute and element values directly against installed DAT rows and retained
Lua field accessors. Private commands now publish real client action IDs;
Wicked Wheel/Downburst are blunt physical, damaging wind moves are Wind magic,
and Thermal Tumult is non-damaging status metadata. Aerial Blast is three seconds,
Featherlance is instant, and other selected canonical cast times replace generic
donor defaults. Radius corrections also cover Wicked Wheel (10), Thermal Tumult
(5), and Mistral Song (30), with matching director contact/rock checks. A broad
selected-player anchor remains separate from the damage radius.

Reproducible derived-data packages accompany the code:

- `outputs/garuda-command-decomp-20260907`: 31 commands / 62 typed DAT rows,
  raw row bytes, field schemas, source hashes and private presentation joins.
- `outputs/garuda-action-timeline-decomp-20260907`: 33 containers, 889 resources,
  959 authored scheduler clips and 89 motion headers, including complete Garuda,
  plume and stone action banks plus the wind state-commit scheduler.
- `outputs/garuda-motion-followup-20260907`: full keys from 17 Garuda/plume
  banks, 3,704 tracks and 115,832 keys, with verified skeleton joins and
  separately labeled derived pose analysis.

These do not prove the retail phase assignment of duplicate command names or
all named-ability-to-WSS joins. The [motion follow-up](garuda-motion-followup-2026-09-07.md)
cross-matches Wicked Wheel's named video body spin to WSS3 and replaces its
generic WSS1 presentation in the seed/migration. This is a strong visual/motion
inference, not a recovered selector packet. Other ordinary WSS fallbacks remain
identified as unproven rather than relabeled as exact animations.

The subsequent [pose comparison](garuda-pose-comparison-2026-09-07.md) also joins
Downburst/WSS2, Slipstream/WSS4 and Shriek/WSS5 as labeled video/motion inferences.
Hard pre-Aerial jumps now consistently use sheltered Shriek from the existing
cardinal ring: the Monk footage positively names the first two jumps Shriek.
Normal's policy and all initial placements are unaffected by that correction.
Plume explosion selectors remain explicit fallbacks. The newer
[Plumage follow-up](garuda-plumage-followup-2026-09-07.md) combines feather-mesh
topology with the named video/motion to implement a WSS9 release. Every batch
waits for its completed private action, with retry/cancellation and a genuine
source-only packet for this non-damaging action. Native visual parity is unproven.
The latest [plume-effects follow-up](garuda-plume-effects-followup-2026-09-07.md)
recovers 22 native texture images and 17 bounded material records, retaining one
unsupported layout explicitly. English server labels now match the client's
Razor/Satin localization. These inputs do not prove the explosion selectors;
initial placements and internal actor IDs remain unchanged.
The [Song follow-up](garuda-song-followup-2026-09-08.md) now replaces Song's WSS1
placeholder with WSS6's rise/recoil/return, cross-matched to named original Normal
footage of the shared model. This is an inference, not a recovered Hard packet.
It changes only the two private commands' animation fields, with a separate
incremental migration; no mechanics or placements change.
The subsequent [plume-color follow-up](garuda-plume-color-followup-2026-09-08.md)
completes the eighteenth material, fixes leading dynamic-property handling, and
traces native RGBA composition. The remaining per-node runtime inputs and named
plume selector joins are explicit; identical stored color defaults do not settle them.

The observed Great Whirlwind hit of 1,176 damage at
[Monk 6:25](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=385s) is a result on one
player, not recovered base potency. The existing base damage remains intact.
The final West multiplier is an explicit exception described above.

## Validation and application

Verification on 2026-09-08: the isolated Map build passed with zero errors;
the production C# harness passed 368 checks. The Lua harness passed 129 checks
(108 encounter cases, 20 wind-publication cases, one actual CLR interop probe).
The static encounter contract and scoped diff checks also pass.
The full-motion decoder has 26 passing synthetic/math/corpus tests and its
22 JSON outputs pass deterministic re-extraction from the installed client.
The effect/material/texture inventory has 21 passing tests (544 combined checks).
Deterministic plume re-extraction verifies all 26 JSON/PNG artifacts without writes.
The latest incremental build reports four existing NuGet advisories; the prior
full build also reports the existing Blowfish signed-extension warning. Online
vulnerability metadata has been unavailable for the Lua project.
No live client fight was run.

The [runtime follow-up](garuda-runtime-followup-2026-09-07.md) adds 32 real-engine
regressions: admission, interruption, and final targeting all use the same
frozen visible wind position/facing. The old admission path could reject a
player touching a moving tornado because it tested the carrier's unreached
movement endpoint. Resource, allegiance, range, height, floor, and status guards
remain enforced; unrelated commands do not opt into this snapshot behavior.
The later Mistral fix separates its 50-yalm hostile command anchor from actual
damage discovery. An anchor outside Shriek's circle or behind Song's cone no
longer stalls the release; the damage footprint is not widened. Only private
director-controlled 23992–23994 receive this exemption, with real range, floor,
allegiance, status, resources and recast guards still enforced.

Run the static contract and actual-Lua behavioral harness:

```powershell
python tools/validate_garuda_encounter.py
dotnet run --no-restore --project tools/garuda-encounter-tests/GarudaEncounterTests.csproj
```

The behavioral harness loads the live encounter and archive-effect Lua with
MoonSharp, appending test exports without modifying production scripts. It
checks commands, geometry, cooldowns, phase progression, cancellations, shelter,
and cleanup with actor/area doubles. Its simulated full director run includes
Aerial Blast, all final choices, and victory/exit. It does not reproduce native
client graphics or replace an in-game integration run.

The separate `tools/garuda-cast-tests` console checks the production C# outcome
publisher and frozen displacement queue against the newly built Map assembly:

```powershell
dotnet run --no-restore --project tools/garuda-cast-tests/GarudaCastTests.csproj -- '.codex-build/garuda-poses-20260907/map/Map Server.dll'
```

An existing database needs the idempotent migration
`Data/sql/live migrations/garuda_hard_contact_20260907.sql` for private command
casts, attributes, radii, Shriek's anchor, cone widths, and the Wheel/Downburst/
Slipstream/Shriek presentation corrections. The full seed SQL has
the same updates. The Lua changes, C# assembly, and
database migration must be deployed together; cast acknowledgments require the
updated engine. This work does not apply the migration to a running database or
restart a live map server.

Two compile-only compatibility adjustments were needed in the concurrently
added `Map Server/Dungeons/LegacyRaidRuntime.cs`: its missing Chara namespace
import and an explicit integer cast for `Math.Max(1, (int)mob.HP)`. Other raid
implementation work was preserved; those are not Garuda mechanics changes.

Before claiming retail-exact parity, an in-game client check should verify
native wind presentation, contact/displacement, continuous South motion, Mirage
off-windows, suppressed/resumed wind, and reconnect visibility. Exact retail
potency, pulse timing, some ordinary animation selectors, the reward chest
packet sequence, and the remaining native VFX evaluator joins are still open.
