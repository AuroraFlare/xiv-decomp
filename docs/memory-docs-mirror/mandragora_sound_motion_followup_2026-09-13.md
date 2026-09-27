# Mandragora V2: beeps, death and movement follow-up

**Historical V2 report.** The subsequent 20:41 recording confirmed rigid feet
and unsatisfactory pose behavior after V2 loaded. The
[V3 track-layout follow-up](mandragora_native_track_followup_2026-09-13.md)
now supersedes its installation. Frozen V2 outputs are preserved; current CLI
commands build/install V3.

`MandragoraAuthoredMotionV2` replaces the installed V1 experiment with twelve
model-scoped Windower overlay files. Installation and byte verification passed
on 2026-09-13. **V2 native playback is still pending user retest.**

## Evidence and causes

The user supplied recordings `20260914-0004-57.8316638.mp4` and
`20260914-0006-35.6839093.mp4`, reporting electronic beeps, absent creature/death
sounds, missing death/other animations and no movement. The second recording's
reviewed frame shows the dead actor still upright. Video frames were inspected
and audio was decoded/analyzed numerically; no claim of listening is made.

Windower's log recorded both metadata and file redirects for the V1 BID at
20:04:20 on September 13. The overlay was loaded; these were gaps in the first
implementation and native placeholder assets, not evidence of a failed install.

- Native m521 WSS SoundClip IDs `33FD0262` and `33FD0263` resolve directly to
  `data/33/FD/02/62.DAT` and `63.DAT`. Their decoded audio is the same roughly
  0.300-second, 1 kHz tone. Correlation with the first recording peaks at 0.9274
  around 1.7414 seconds. The second recording has no comparably strong match.
- Sampled native m521 actor-voice cues, including `971C0096`, are also tones
  (roughly 0.238 seconds, 535 Hz), rather than usable mandragora vocalizations.
- V1 only authored idle, walk and run. Death and damage states held the bind
  pose, and its cloned controllers retained WSS1's 0.5-second duration even
  when the new motion was longer.
- `SpawnConfiguredEnemyWithMobType` and the dynamic NPC initializer explicitly
  disable `Roams`. Passing `mobile` only avoided `NoMove`; it never enabled
  idle roaming. Mandragora also retained `DisableTurning` in that case.

`outputs/mandragora-audio-followup-20260913/audio_audit.json` records input video
and sound DAT hashes, durations, spectrum measurements and correlation results.
`analyze_audio.py` reproduces these with PyAV and numpy. The narrow MS ADPCM SCD
reader uses the documented structure in
[vgmstream's primary implementation](https://github.com/vgmstream/vgmstream/blob/master/src/meta/sqex_scd.c).
These measurements identify the beep source; they do not verify V2 in-game audio.

## Implemented changes

The BID contains 90 paired motion/controller resources bound to m521's native
24-bone skeleton. It retains the authored idle/walk/run cycles and adds:

- A 25-frame fall and matching held dead pose; the fall does not loop upright.
- A 12-frame damage reaction, including an additive version expressed as
  rotational deltas with zero translations and unit scale.
- Ready/deactivate and left/right turn gestures.
- Explicit companions for every motion referenced by the inherited transition
  tables, including normal/combat start, stop and directional movement requests.

Start/stop/directional movement states reuse the basic walk/run cycles. They are
authored substitutes, not reconstructed native curves. Controller durations and
look-at suppression windows now match each motion's 30 fps duration. Death uses
the donor's existing character-action sound trigger with the new voice table.

Thirteen SoundClip cue fields across ten WSS files now reference existing m039
Flower sounds. Every other byte in those WSS banks remains identical: body
motion, VFX, event timing, wrapper offsets and resource lengths. WSS7 has no
SoundClip changes and is not overlaid. The m521 `top_snd/0000` table uses the
installed Flower table. These are **temporary Flower sound substitutes**, not
authentic recovered mandragora audio. Shared audio DAT files are unchanged.

`audio_sources.json` pins the WSS banks, actor sound tables and selected skill
sound sources. The builder records each old/new cue ID and exact byte offset.
The audio audit also measures representative Flower voice cues; their decoded
waveforms differ from the native placeholder tone.

In `Data/scripts/commands/gm/spawnmonster.lua`, only explicit mobile mandragora
spawns (including `mandrake` and `move`/`roam` aliases) enable roaming and turning.
The base roam delay is three seconds, using the server's existing randomized
delay/pathfinding. Stationary probes and other monster families retain their
existing behavior. No positions, navigation recordings, shared NPC behavior or
SQL data are changed. Existing actors must be respawned.

The active server's 20:24:31 startup log confirms this checkout's
`Data/map_config.ini`. No script-path override is set; the command loads from
`Data/scripts` on each invocation through `LuaEngine.RunGMCommand`. No server
binary rebuild or restart is required for this Lua change.

## Validation and installed files

- Fourteen Python tests passed, covering every encoded bone channel, loop
  closure, foot contact/lift, held death pose, additive deltas, controller timing,
  complete transition references, exact WSS audio-only edits and installer safety.
- The compiled MoonSharp harness's `--mandragora-motion-only` checks passed:
  stationary defaults, movement aliases, passive/aggressive modes, turning,
  roaming modifiers and isolation from five other families.
- Encoded/decoded joint projections were rendered and inspected. They do not
  validate mesh skinning, client state selection or ground collision.
- Deterministic rebuild comparison and all twelve installed file comparisons
  passed. The final BID is 449,216 bytes, SHA-256
  `9874b047916cc59d21365d0f57ae0ede6230df962478ea0dea8db0df36a45135`.

The installed collection is:

`C:/Users/drime/source/repos/AuroraFlare/Launcher Windower/New/FFXIV Meteor Launcher/bin/x86/Release/net48/Windower/DatOverlay/MandragoraAuthoredMotionV2`

The installer preflights all twelve paths, rejects competing suffix redirects
and unknown edits, verifies the replacements, then removes only the exact
hash-verified V1 BID redirect. V1's repository output remains frozen. No original
game asset is overwritten, and unrelated overlay collections remain intact.

```powershell
python -B tools/mandragora-animation/build.py build
python -B tools/mandragora-animation/build.py check
python -B -m unittest discover -s tools/mandragora-animation -p test_animation.py -v
dotnet run --project tools/spawnmonster-tests/SpawnMonsterTests.csproj --no-restore -- --mandragora-motion-only
python -B tools/mandragora-animation/render.py
python -B tools/mandragora-animation/install.py check
```

## Next live check

Restart the game through the same Windower launcher to clear the old animation
and sound-table cache. Spawn a fresh actor on an area with working server paths:

```text
!spawnmonster mandragora 1 mobile passive
```

Watch movement and idle return, test the six TP bindings `23084` through `23089`,
then damage/defeat the actor and inspect the fall, held corpse pose and sounds.
`!mobanimation wss 1` through `11` can isolate native TP banks. Preserve separate
observations for each action and transition. A moving actor with sliding feet,
a stationary actor with animated feet and failed roaming are different defects.

No BTL auto-attack bank is added; normal auto-attacks remain disabled. Casting
and miscellaneous held states are still placeholders. Exact native animation
fidelity, stride/speed matching, TP blending and Flower cue suitability remain
unverified. The existing custom TP mechanics are unchanged.

Rollback with `python -B tools/mandragora-animation/install.py remove`, then
restart the game. It removes only verified V2 files and leaves empty directories;
native m521 will again lack its BID and contain its original placeholder sounds.
