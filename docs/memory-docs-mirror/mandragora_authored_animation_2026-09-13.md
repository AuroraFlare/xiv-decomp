# Mandragora authored animation overlay, first client probe

**Historical V1 report.** Subsequent user recordings exposed electronic sound
placeholders, missing death/damage states and disabled roaming. Windower's log
confirmed V1 loaded. V2 now supersedes this installation; see
[the sound and motion follow-up](mandragora_sound_motion_followup_2026-09-13.md)
for current tools, installed hashes, validation and remaining limitations.
The sections below describe the original V1 pass; current CLI commands build V2.

This pass creates `MandragoraAuthoredMotionV1`: one Windower DAT overlay file at
`client/chara/mon/m521/act/emp_emp/bid/base/0000`. It is **experimental and has not
been observed in the native client**. Numerical checks do not establish that the
client accepts this newly encoded motion format or blends it correctly.

Mandragora already has its native 24-bone skeleton and eleven WSS banks. Missing
BID idle/locomotion data is a different problem from missing bones. Ziz/Vulture
`m020` has a complete baseline bank; Dullahan `m050` and Wyvern `m057` have their
own previously documented gaps. The older failed mandragora probes remain frozen.

## What is authored

The new narrow MTB/SPU writer uses the existing independently implemented strict
decoder from `tools/garuda-motion-followup`. It encodes actual new quaternion48,
scalar16 and constant curves against the native skeleton's array indices. It
does not rename donor bone tracks or hold a previously rejected special-action
frame. All 24 bones receive rotation, translation and scale channels.

- Idle: four seconds, small chest/head/arm/foliage motion, fixed feet/root.
- Walk: 1.6 seconds, alternating steps using two-link inverse kinematics.
- Run: one second, a wider/faster step cycle. This first candidate has no flight
  phase; its visual character and cadence need native review.
- Other baseline states: held native bind/rest placeholders. Additive damage
  motion is neutral instead of adding absolute rest transforms a second time.

The skeleton's bind posture is the authored starting point, **not a recovered
retail rest animation**. Feet contact an authored model-space plane. These are
not world placements, terrain samples, or collision claims. Actor displacement
remains server-owned; the in-place stride/cadence will need speed matching.

The previously accepted m020 BID container topology is retained and retargeted
to `skl_m521b001`. Its 21 motion resources are replaced; four explicit normal/
third-speed loops bring the total to 25. Each motion controller uses the m521
WSS1 motion-only controller with its own fixed-width resource ID, retaining its
look-at suppression. No WSS effect resource is copied into a new motion.
Inherited controller timing, CIBT transitions and state selection remain native
test questions. The existing donor baseline scheduler is still present; this
pass does not claim to reconstruct death, hurt, casting or turning behavior.

## Isolation and validation

The installed client, skeleton, mesh, all eleven WSS banks, server files and
main SQL are unchanged. Existing custom skill list 7200 and the GM commands are
reused. This does not add a BTL auto-attack bank or authentic mandragora TP
mechanics; existing command behaviors remain as documented previously.

`outputs/mandragora-authored-animation-20260913/manifest.json` records source and
output hashes, source-code hashes, motion bindings and decode checks. The three
construction inputs are pinned to exact hashes. The writer rejects other MTB
envelopes, unsupported sizes, nonfinite values and unreachable foot targets.

Nine tests cover quaternion quantization (including signs/octants), every
encoded frame/channel, exact authored loop closure, root drift, fixed idle feet,
alternating contact/lift, resource bindings, TP-bank isolation, malformed input,
and overlay conflicts. The original decoder supplies independent parsing and
pose reconstruction. `joint-preview.png` displays the encoded/decoded joints,
not native meshes or physics.

```powershell
python -B tools/mandragora-animation/build.py build
python -B tools/mandragora-animation/build.py check
python -B -m unittest discover -s tools/mandragora-animation -p test_animation.py -v
python -B tools/mandragora-animation/render.py
```

## Windower installation and first live test

The installer defaults to the existing development launcher:
`../Launcher Windower/New/FFXIV Meteor Launcher/bin/x86/Release/net48/Windower/DatOverlay`.
`--overlay-root` accepts another existing Windower `DatOverlay` directory.
It checks for competing redirects, refuses to overwrite a different file, and
installs only the exact generated BID file. Other collections remain intact.

On 2026-09-13 this pack was installed and hash-verified in that default development
launcher directory. The BID is 122,160 bytes; SHA-256:
`5cdc37db6e42e4e2d8f2a482231f71af198b9db907547f1a29a5719f0df96a80`.
No game process was available for a live playback check during this pass.

```powershell
python -B tools/mandragora-animation/install.py install
python -B tools/mandragora-animation/install.py check
```

Start the game through that Windower launcher with a fresh animation cache.
`/dat status` and `/dat trace` can confirm the overlay is enabled and the m521
path is redirected. A full game restart is preferable to relying on `/dat reload`
for an already cached monster animation bank.

1. Spawn a stationary probe: `!spawnmonster mandragora 1 stationary passive`.
2. Target it, run `!mobidle off`, and watch several four-second cycles. Check
   head orientation, feet, foliage, loop seams, and camera-relative appearance.
3. Run `!mobanimation wss 1`, then other banks through 11 individually. Check
   that each action can return to the authored idle without a retained pose.
4. Run `!usemobskill 23084` through `23089` individually for the existing
   six command/animation bindings. These commands can apply damage/effects.
5. Spawn `!spawnmonster mandragora 1 mobile passive` for normal roaming, then
   a `mobile aggressive` probe for approach/combat movement where appropriate.
   The existing GM profile suppresses turn/look-at and auto-attacks; native
   heading/turning and actual speed selection need a subsequent scoped pass.

Client acceptance, mesh deformation, continuous playback, idle-to-movement,
movement-to-idle, and each TP-to-idle transition must be recorded separately.
No live success is asserted by this document or the Python tests.

Rollback removes only the hash-verified file belonging to this pack (and leaves
empty directories and all unrelated overlays intact); then restart the game:

```powershell
python -B tools/mandragora-animation/install.py remove
```
