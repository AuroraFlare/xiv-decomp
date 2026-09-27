# Garuda Hard: local video timing follow-up, 2026-09-07

This follow-up concerns original FFXIV 1.x Garuda Hard, not ARR. Complete public
recordings were downloaded for local analysis and decoded into timestamped
frames. This supersedes the earlier browser-seek timing estimates where noted.
It is not a retail server decompilation or packet capture. No encounter code or
initial actor placement was changed by this evidence pass.

## Strongest findings

1. **Garuda uses Slipstream while South plumes are alive.** The supplied
   recording at **07:20.000** shows a newly appended `Garuda readies Slipstream.`
   after the South message, with multiple Razor Plumes present and a damaged
   Razor Plume selected. A blanket special-attack suppression for the entire
   South plume wave is contradicted by this frame. The same log remains visible
   at 07:26; that later frame is not a second cast.
2. **Two independent South patterns last approximately 62.5 seconds from one
   wind announcement to the next.** The precise observed brackets are below.
   This is considerably stronger than the previous sparse timing estimates.
3. **Column opacity is not a reliable hazard-enabled flag.** Dense WHM Mirage
   frames show short brown-sheet appearances and clear intervals while low
   wind ribbons can remain. A visually clear camera image must not be converted
   directly into a collision-off event.

The [Slipstream evidence frame](../outputs/garuda-video-timing-20260907/evidence/reference-440-slipstream-with-live-plumes.jpg)
is the most immediately implementable new observation.

## Recordings and reproducibility

| Recording | Local decoded media | Evidence use |
|---|---|---|
| [Supplied Garuda Hard clear](https://www.youtube.com/watch?v=rzVsuAo30hs) | 1280x720, 23.976024 fps, 560.185 s | South timing, specials during plumes, plume deaths, West transition |
| [Garuda - Hard mode (Monk POV)](https://www.youtube.com/watch?v=4PPUsXfjWRM) | 1280x720, 25 fps, 481.280 s | Independent South timing, clone combat, Mirage transition |
| [Garuda WHM pov](https://www.youtube.com/watch?v=V-fCnnk7ZYg) | 1280x720, 25 fps, 516.640 s | Near-stationary Mirage view, dense visual-opacity samples |
| [Garuda Win, Scorchy Worchy](https://www.youtube.com/watch?v=8H1uExJUUXM) | 1280x720, 29.970030 fps, 461.261 s | Independent South plume and wind visuals; no readable wind-announcement channel |

The first two are June/July 2012 recordings identified in the earlier report.
The Scorchy Worchy upload is dated 2012-07-20 in public video metadata. The WHM
recording visibly uses the original game's UI; no unverified upload date is
assigned here. The original bodies and modern site recommendations were not
used interchangeably.

The [artifact README](../outputs/garuda-video-timing-20260907/README.md) includes
source hashes, successful download options, the extraction script and selected
commands. Full recordings and bulk frame grids are git-ignored local caches.
Only a small curated evidence set is intended for version control. Frames are
unmodified except JPEG encoding; contact sheets resize/crop copies and add time
labels. Decisive text was checked again in full-resolution individual frames,
not accepted solely from downscaled contact sheets.

## Measured announcement intervals

`(a, b]` means the message was absent at a and present at b. These are decoded
video presentation times, not exact server timestamps. Log-entry scrolling,
rendering and network delay limit interpretation beyond the displayed bracket.

| Recording / event | Absent / present video seconds | Corresponding time |
|---|---|---|
| Supplied: South announcement | (418.000, 418.500] | 06:58.000–06:58.500 |
| Supplied: following West announcement | (480.750, 481.000] | 08:00.750–08:01.000 |
| Monk: South announcement | (368.250, 368.500] | 06:08.250–06:08.500 |
| Monk: following Mirage announcement | (430.500, 431.000] | 07:10.500–07:11.000 |

Consequently:

- Supplied South-to-West announcement interval: **62.25–63.00 seconds**.
- Monk South-to-Mirage announcement interval: **62.00–62.75 seconds**.
- Their common supported range is **62.25–62.75 seconds**.

Selected [supplied onset](../outputs/garuda-video-timing-20260907/evidence/reference-south-onset-log-grid.jpg),
[supplied next West](../outputs/garuda-video-timing-20260907/evidence/reference-west-onset-log-grid.jpg),
[Monk onset](../outputs/garuda-video-timing-20260907/evidence/monk-south-onset-log-grid.jpg)
and [Monk next Mirage](../outputs/garuda-video-timing-20260907/evidence/monk-mirage-onset-log-grid.jpg)
grids preserve the brackets. Full-resolution after-frames are alongside them.

### Scheduling interpretation, explicitly an inference

A **60-second South dwell plus approximately 2.5 seconds of transition** is a
reasonable implementation reconstruction. The measurable target is the
62–63-second announcement-to-announcement behavior, not a recovered literal
`60` in original server code. If an implementation announces both patterns
immediately with no intervening animation delay, a bare 60-second timer is not
the same measured behavior. Do not add transition time twice.

**Chosen current-engine reconstruction:** the present `setWindMode` changes
position and announces the pattern synchronously. Use a named **62-second South
duration from `windPatternStartedAt`**, with the one-second director update
yielding the observed approximately 62–63-second range, and no new 40-second
post-plume wait. Continue honoring accepted casts/queue readiness and safe add
resolution; those safeguards are not a claim that the original server used the
same dependency rules. If a real departure/arrival sequence is subsequently
added, recalibrate against the announcement interval rather than retaining both
62 seconds and extra transition time automatically.

Prefer counting South duration from its start over starting a fresh 40–45-second
delay when every plume dies. In the supplied recording, two final observed
Razor defeat messages appear around 447.25 and 448.00 seconds, and the next
wind announcement arrives by 481.00 seconds. The latter defeat to next message
gap is approximately **33 seconds**, not 40–45. In the Monk recording, multiple
Razor defeat messages are appended around 392–393 seconds, with the next
announcement at about 431 seconds. These are **last observed deaths**, not
omniscient proof that every off-camera actor has vanished. Successful clears
alone cannot prove what retail did if plumes were deliberately left alive.

The supplied death sequence was checked in full resolution: Chelerin's defeat
line starts scrolling into view at 447.25; Solef's later defeat line is absent
at 447.75 and present at 448.00. The
[448-second frame](../outputs/garuda-video-timing-20260907/evidence/reference-448-last-observed-plume-deaths.jpg)
contains both. Do not confuse an enemy's lingering nameplate or queued combat
result with a still-living actor.

### Clone patterns are not the same measured interval

The relevant West announcement immediately preceding clones is a *new* message;
the supplied run also has an earlier post-Aerial West announcement.

| Recording | Clone-pattern West announcement | Following South | Message-to-message span |
|---|---|---|---|
| Supplied | (344, 345] s | (418, 418.5] s | 73.0–74.5 s |
| Monk | (283, 284] s | (368.25, 368.5] s | 84.25–85.5 s |

The longer and differing clone intervals do not support applying the measured
South interval globally. Retaining a separate clone-completion policy is
appropriate pending cleaner last-sister death and convergence evidence. This
pass does **not** establish an exact 35-second or 40-second post-clone timer.
An intermediate small-contact-sheet reading mistook a Garuda damage line for a
Suparna defeat; full-resolution checking rejected that reading. It is not used
as evidence here.

## Tornado pulse and orbit checks

Inspected dense sequences include:

- Supplied South 438–482 seconds at 0.5-second spacing, plus 440–454 at one second.
- WHM Mirage 378–410 at one second and 392–398 at 0.25 second.
- Monk South 365–405 and Mirage 430–474 at two seconds.
- Scorchy Worchy 340–380 at two seconds, plus broader phase overviews.

The [WHM quarter-second visual grid](../outputs/garuda-video-timing-20260907/evidence/whm-mirage-392-398-visual-opacity-grid.jpg)
is instructive: substantial brown wind at 393.000 gives way to a clearer view at
393.500; additional short brown appearances occur around 394.250 and 395.000.
There is a longer clearer stretch before brown wind returns around 397.500.
Ground ribbons, animated sheets, slight camera turns, bodies and spell effects
prevent treating this sequence as a binary hazard trace. It is evidence against
**that measurement method**, not proof that damage is enabled for 0.5 seconds
or disabled for a particular interval.

Neither 4 seconds on / 4 seconds off nor a 40-second full orbit is newly proven
or conclusively rejected by this footage. Both remain tunable assumptions.
The relative phase of the two Mirage side columns was not measured: both
origins were not continuously visible. South central-column activity could not
be separated confidently from orbiting-column occlusion. Minimap/player motion
was inspected but was not equated with tornado angular speed.

The earlier source-backed center-plus-three-outer reconstruction remains an
explicit choice based on the preserved contemporary diagram, not a new claim
that four origins were counted in these recordings. The earlier report's
conflicting firsthand count and uncertainty still apply.

## Other observations and limits

- At supplied 318.000 seconds, Aerial Blast is already executing, and its ready
  message is visible. At 324 seconds, the first post-Aerial West and Wicked
  Wheel ready messages are already present. Earlier browser-seek estimates of
  Aerial at 5:36 or first West at 5:46 were late; do not use them as calibration.
- The earlier Monk 7:13 Mirage sample was a valid *already-present* message,
  not its onset. Local decoding puts onset near 7:10.5–7:11.0.
- The supplied South message is near 6:58.5, not the much later 7:18/7:22 samples
  in which it remains in the log. Persistent chat text must not date a phase.
- Supplied South log shows another Slipstream ready message by 466 seconds and
  Downburst by 478 seconds. These do not establish a fixed universal rotation;
  the earlier Slipstream text persists for many seconds without a new action.
- No reliable pre-Aerial special-during-plume conclusion was recovered. In the
  relevant supplied segment the player switches the log channel away from the
  useful General messages, and player VFX alone do not identify the boss skill.
- Satin/Silky is defeated by players in the successful Monk/WHM sequences.
  No naturally completed Thermal Tumult-to-self-destruction sequence was
  identified. The guide's 30 seconds still describes sleep duration, not a
  video-measured lifetime.

The [earlier evidence report](garuda-video-evidence-2026-09-07.md) remains the
source for contemporary guide/diagram provenance. Its broad mechanics evidence
survives; this follow-up supersedes its coarse timing interpretations where
the more precise observations above differ.
