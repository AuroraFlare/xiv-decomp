# Mandragora V3: native track layout and visible stepping

**V3 failed the subsequent live test:** the user reports T-pose movement and an
instant flip into the dead pose. Windower confirms the V3 BID redirect at
21:05:17.531 on September 13. The current controller correction is documented in
`mandragora_controller_followup_2026-09-13.md`; this V3 report and output remain
historical evidence. The previous numerical tests proved that our
decoder could read V2; they did not prove that the game evaluated its tracks.

## User evidence

The 13.53-second recording `20260914-0041-14.5261768.mp4` shows the unsatisfactory
rigid pose and combat/death presentation. The user specifically confirmed that
the feet did not move while walking, and suggested the existing native TP
skeletal animation as reference. Its SHA-256 is
`6664655f8e27168ff38f76bbe1cf51c5147769910d7a15f11e800a9d36e1a254`.
Extracted frames are under `outputs/mandragora-v3-review-20260913`.

Windower logged V2 voice-table and BID redirects at 20:40:45–46, and WSS3 at
20:40:59. V2 was loaded. The recording does not independently isolate every
baseline state, blend or audio cue.

## Native reference findings and changes

`inspect_references.py` records hashes and layouts from 97 native monster BID
banks. Of the 1,528 motion resources in the reviewed two-section envelope, none
populate the root group. Another 207 motion envelopes are explicitly excluded.
V2 introduced a populated root group with extra channels. V3 now preserves the
exact group and ordered channel layout from m521's working WSS1 body animation:
empty root/other groups, 26 scalar tracks and 23 bone quaternion tracks in the
body group. Unanimated components retain native defaults. All 24 bones' effective
transforms are checked, including defaults. Unsupported root travel, scaling or
new animated translation channels are rejected by the narrow writer.

The reviewed m020 `cbba_add_dmg_f` bank uses header flags `0x07`, while its normal
motion uses `0x06`. V2 wrote delta damage poses with the WSS `0x06` flag. V3
matches the donor delta convention. That mismatch is a plausible cause of the
bad pose after damage; the exact client evaluation path has not been traced.
The broader audit includes some other `cbba` banks with `0x06`, so the name alone
is not treated as proof that every damage bank has the same representation.

The root-layout mismatch is also a candidate explanation for frozen feet, not
a causally isolated live result. This update corrects both deviations and keeps
their native evidence distinct from the next client observation.

All eleven native TP banks provide decoded body/leg/foot reference curves.
WSS3's ankle excursions relative to the pelvis span about 0.1095 and 0.1436 model
units along Z. Four separate `cbbr` root-motion resources use another envelope
and remain explicitly unparsed; they are listed in `reference_audit.json`.

The authored walk now spans 0.11 units fore/aft with 0.040 units of foot lift
over 32 frames; run spans 0.15 units with 0.055 lift over 20 frames. The knee/ankle
chain uses the native skeleton and local axes. Body lowering maintains reachable
leg lengths. These are authored in-place cycles using native motion as an
anatomical/range reference, not copied TP playback or recovered retail walking.
World travel remains server-owned; foot sliding against game movement speed
still needs native tuning.

## Mesh verification

`mesh_preview.py` reads the actual m521 mesh: three mesh groups, 3,144 vertices
and native ENVD bone weights. It applies decoded animation to the mesh using
inverse-bind skinning. Weight sums and triangle indices are checked, and the
bind-to-bind transformation must reproduce the source vertices. The resulting
`mesh-preview.png` shows alternating flexion/lift on the actual feet and the
held death shape. This is an untextured CPU preview; it does not reproduce the
game's scheduler, blending, physics, terrain or shaders.

The mesh parsing and skinning reference is the MIT-licensed
[FFXIV Model Viewer](https://github.com/nohbdy/ffxivmodelviewer), particularly its
ENVD, stream decompression, AnimatedSkeleton and Bone implementations. Relevant
source snapshots and blob IDs are saved in the review output's `upstream` folder.

Eighteen Python tests pass, including the target-native group/channel sequence,
damage header convention, every effective channel, decoded ankle movement,
alternating contact/lift and preservation of TP motion/VFX bytes. Existing V2
sound substitutions and mobile-spawn behavior are retained. No SQL or navigation
data changed. Normal BTL auto-attacks remain unfinished.

## Installation and next check

The V3 BID is 277,568 bytes, SHA-256
`c19b1d50476d62cdd5e44557e2b67a489e02295a59340a3acac04014fad72b9b`.
It is installed at:

`C:/Users/drime/source/repos/AuroraFlare/Launcher Windower/New/FFXIV Meteor Launcher/bin/x86/Release/net48/Windower/DatOverlay/MandragoraAuthoredMotionV3`

The installer pins the frozen V2 manifest, preflights all targets, verifies the
new files, then removes only exact known V2 redirect files. Both older repository
outputs remain frozen. Original client assets and unrelated overlays are intact.

```powershell
python -B tools/mandragora-animation/inspect_references.py
python -B tools/mandragora-animation/build.py build
python -B tools/mandragora-animation/build.py check
python -B -m unittest discover -s tools/mandragora-animation -p test_animation.py -v
.codex-video-tools/Scripts/python.exe -B tools/mandragora-animation/mesh_preview.py
python -B tools/mandragora-animation/install.py check
```

Restart the game through Windower, then create a fresh probe:

```text
!spawnmonster mandragora 1 mobile passive
```

First observe its feet during roaming before attacking, then test TP return and
damage/death separately. This separates baseline locomotion from combat action
holds. `install.py remove` removes verified V3 files; restart afterward. Native
m521 will again lack BID and contain its original sound placeholders.
