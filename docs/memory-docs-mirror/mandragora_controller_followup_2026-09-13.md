# Mandragora V4: controller clock, repeating motion and ground death

V4 is installed in Windower and all twelve installed files are verified.
**Live V4 playback is unverified.** V3 failed: the user reports T-pose movement
and an instant flip into the corpse pose. The Windower log confirms the V3 BID
was redirected at `2026-09-13 21:05:17.531 -04:00`, so the observed failure was
not explained by an old overlay still being selected.

## Concrete controller errors

The previous builder treated MCB timeline integers as microseconds. They are
10,000 units per animation frame. The native client function `0x00DE7B40`
(`MotionCommandClip` update, reached through factory `0x00A4DA30` and constructor
`0x00DE7BD0`) divides the current timeline integer by the double `10000.0` stored
at `0x00FE0570`, then passes the result to the motion player. The reviewed and
installed executable SHA-256 is
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
The read-only Ghidra export is
`outputs/mandragora-controller-review-20260913/motion-command-vtable.txt`.
`inspect_controllers.py` independently verifies the executable hash and divisor.

Native m020 walk uses 40 MTB frames and 400,000 controller units; run uses
20/200,000; idle uses 68/680,000; normal idle uses 80/800,000. V3's 32-frame walk
had a controller duration of 1,066,667 units, corresponding to 106.6667 frames.
V4 uses 320,000 units. Idle changes from 4,000,000 to 1,200,000; the 25-frame
collapse changes from 833,333 to 250,000. Look-at suppression windows use the
same corrected frame clock. The older general scheduler parser's generated
`duration_seconds` fields assume microseconds; this correction uses its raw
unit fields only and does not propagate those seconds labels as evidence.

V3 also copied the WSS one-shot LayerActor setting (`0x80`) to every controller.
Every reviewed native m020 idle/movement loop uses `0xC0` at `@ACT+0x14`; its
one-shots use `0x80`. V4 restores that native distinction: idle, `_lp0` and
`_2lp` states repeat, while starts/stops, turns, hurt and collapse remain
one-shots. The byte convention is supported by native fixtures. Actual live
selection and blending of these states have not been traced.

These are confirmed format/controller mismatches. They are not a claim that
each live symptom has been causally isolated or that all playback now works.
Previous tests repeated the incorrect microsecond assumption and checked mesh
poses outside the native controller. That verification gap is now covered by
native controller fixtures and client code evidence.

## Ground death sequence

The inherited flying m020 graph includes `dead1`, `dead2`, then `dead`. Its
original 40/6/84-frame motions and scheduler playback ranges did not match our
authored 25-frame fall and one-frame corpse pose. The native client death
state machine at `0x007BADE0` tries those scheduler names in that order, then
uses `cbnm_dedpose` or `cbbm_dedpose` for the held corpse.

V4 follows the native ground-monster shape used by m039, m032 and m055: a single
`dead` scheduler referencing `cbbm_ded`, followed by the held corpse. The m039
BID is pinned to SHA-256
`6c0db0c0992706967d51e00e46bbac062299fa50ecd49b37213ebd4b1825395c`.
Only its death scheduler is used, with m521 model/skeleton bindings. Its block,
MotionClip duration and source frame range all cover the complete 25-frame
authored fall. Both move-stop windows are 25 frames; the scheduler's sound cue
timing scales with that duration. The old `dead1`/`dead2` schedulers are omitted
from this experimental m521 bank. All unrelated schedulers retain their exact
V3 payloads. No donor bone transforms are copied.

## Scope and checks

All eleven authored MTB payloads are byte-for-byte V3. The native mesh and
skeleton, sound substitutions, TP motion/VFX bytes, and mobile-spawn behavior
are unchanged. This pass changes the controller clock, repeating setting and
death routing. No SQL, navigation data, server binaries or original client
assets were modified. The Lua command's help text now names V4.

Twenty-two tests pass. New regressions compare controller timing/flags with
native fixture bytes, verify the whole ground-collapse range and its companion,
preserve unrelated schedulers, require exact V3 motion/audio bytes, and reject
modified V3 files during upgrade. Native rendering, movement speed, TP return
blending and audible death presentation still need in-game observation.

```powershell
python -B -m unittest discover -s tools/mandragora-animation -p test_animation.py -v
python -B tools/mandragora-animation/build.py build
python -B tools/mandragora-animation/build.py check
python -B tools/mandragora-animation/inspect_controllers.py
python -B tools/mandragora-animation/install.py check
```

The installed BID is 274,928 bytes, SHA-256
`4c97b0cd883f04e0c3e7da074604a287ffd81e9b423900f7b4728f0e14b2b181`.
It is under
`C:/Users/drime/source/repos/AuroraFlare/Launcher Windower/New/FFXIV Meteor Launcher/bin/x86/Release/net48/Windower/DatOverlay/MandragoraAuthoredMotionV4`.
The installer verified all twelve new files before removing only exact known
V3 redirect files. Frozen V1/V2/V3 outputs remain available in the repository.

Restart through Windower, then create a fresh probe with
`!spawnmonster mandragora 1 mobile passive`. Observe several walking cycles
before attacking, then the fall into the corpse pose. V4 is an installed
controller correction awaiting that live test, not a completed animation
restoration. Normal BTL auto-attacks remain outside this overlay.
