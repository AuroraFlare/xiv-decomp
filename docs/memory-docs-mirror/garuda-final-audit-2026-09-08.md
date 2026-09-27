# Garuda 1.x: final source audit, 2026-09-08

The encounter implementation and source handoff are ready for integration.
This is original FFXIV 1.x/1.23b Garuda, not ARR. This audit closes concrete
add-lifecycle defects found after the motion, wind, rock and plume decomp work.
It does **not** certify retail-exact timings or native client playback.

Start with the [implementation report](garuda-hard-video-implementation-2026-09-07.md)
and [evidence index](garuda-ai-handoff-2026-09-07.md). All initial placements
remain as previously implemented, including the user's shared Normal/Hard
boss/player starts. The interior navigation route is not used as an arena wall.

## Final code corrections

Failed actor creation previously had three distinct gameplay consequences:

| Actor | Old failure behavior | Corrected behavior |
|---|---|---|
| Razor Plume | Advanced past the failed spawn slot, silently reducing the wave | Retries that slot without replaying completed Plumage; later pairs retain their cadence after recovery |
| Satin Plume | Treated a missing actor like a defeated plume and could skip the sleep mechanic | Retries creation without restarting South or its Razor wave; the three-second arm and thirty-second fallback lifetime begin at actual appearance |
| Suparna / Chirada | A missing sister counted as defeated; one or both could disappear from the phase | Retries each missing slot independently; keeps existing actors, health, attacks and deaths intact |

Previously released Razors continue processing Featherlance attempts and
completion acknowledgments while a later spawn is unavailable. Recovery does
not reset their individual lifetimes or repeat their rock damage. A delayed
spawn rebases only the remaining release schedule, preventing an overdue wave
from appearing all at once.

Sister recovery preserves the wind layout and queued ordinary attacks. The
sixty-second convergence clock begins once both creation slots have succeeded,
so a late sister is not immediately teleported into Shriek. A legitimately
killed sister is never recreated, including when its counterpart is still
awaiting creation. Cleanup cancels every pending retry and removes live adds.

These are defensive server-failure policies, not newly recovered retail timers.
Successful initial creation retains the existing commands, stats, placements
and timings. Persistent creation failure leaves the mechanic pending instead
of awarding its resolution; normal victory, wipe and duty timeout still end
the encounter and cancel retries.

## Test-first evidence and final verification

The six new plume regressions all failed before their implementation fix.
Four sister regressions likewise exposed missing-spawn failures before the
sister fix; a fifth confirms cleanup remains safe. All eleven now pass against
the actual encounter Lua loaded by the server's MoonSharp engine.

Final verification on 2026-09-08:

- 108 encounter behavior cases, 20 wind-publication cases and one real CLR
  session-identity probe: **129 Lua/interop checks**.
- **368 production C# checks** for outcomes, geometry, command metadata,
  displacement and presentation readiness, using the newly checked Map output.
- **26 motion tests** and **21 effect/material/texture tests**.
- **544 combined checks passed**. This count excludes static/deterministic
  extraction checks rather than counting them as additional test cases.
- Isolated Map build: zero errors, four existing dependency advisories. A prior
  full compilation also reports the existing Blowfish signed-extension warning.
- Static encounter contract and whitespace diff checks passed.
- Deterministic checks passed for command rows, motion keys, Song comparison,
  range-method evidence, effect resources, plume textures/materials and native
  color composition. The retained 18 material records all decode; the final
  native per-node color input joins are still explicitly unresolved.

The behavioral suite includes a simulated director run through Aerial Blast,
each possible final branch, victory, result events, exit and cleanup. Actor
doubles are not a substitute for native rendering or an in-game integration run.

Run the commands in the evidence index to reproduce the checks. The updated
`tools/garuda-ai-handoff/package.ps1` creates a new timestamped sharing archive
and verifies every included source file against its SHA-256 manifest.

## What is implemented versus what remains unverified

The code includes the damaging outer wind ring and small tornadoes, South
movement, intermittent wind windows, per-viewer model-state publication,
reconnect readiness, contact displacement, staged rock destruction and shelter,
Plumage releases, Razor/Satin behavior, sister resistance and convergence,
Aerial Blast progression, final branches, results and cleanup.

The remaining uncertainty is evidence/acceptance work, not a claim that these
mechanics are absent:

- Featherlance and Thermal Tumult still use the documented WSS1 presentation
  fallback. Shared bone motion and overlapping video effects do not establish
  their exact named-action-to-effect mapping. No selector was guessed here.
- Several ordinary attack animations, including Song/WSS6 and Plumage/WSS9,
  are labeled video/native-data inferences, not recovered retail packets.
- Exact damage tuning, pulse/orbit clocks, some phase policies, arena bounds
  and reward fidelity remain subject to the limitations in the evidence index.
- Native wind/rock playback, movement-contact alignment and reconnect visuals
  have automated server-side coverage but no stock-client acceptance run.

## Deployment boundary

No live server/client was started or restarted, no database was changed, and no
commit or push was made. Deploy the matching engine, Lua and private command
definitions together. For an existing database, the reviewed order is:

1. `Data/sql/live migrations/garuda_hard_contact_20260907.sql`.
2. `Data/sql/live migrations/garuda_song_animation_20260908.sql`.

These migrations remain unapplied here. The archive is source/evidence context,
not a standalone server release or permission to overwrite unrelated files.
