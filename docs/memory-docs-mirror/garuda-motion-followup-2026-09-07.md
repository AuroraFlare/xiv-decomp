# Garuda full motion recovery and Wicked Wheel correction

Follow-up: the later [named-pose comparison](garuda-pose-comparison-2026-09-07.md)
supersedes this report's candidate-only Downburst/Slipstream status and adds
Shriek/WSS5. The tables below preserve the scope of the original Wheel pass;
the current test total is 25, including full-joint, leg/dip and inversion checks.

## Result

The installed original-FFXIV animation data now has a reproducible **full-key**
decoder, beyond the previous motion-header inventory. It covers m851 Garuda
WSS1–14 and m527 plume WSS1–3: 17 banks, 20 embedded MTB occurrences, 3,704
tracks, 115,832 keys and 216 chunks. Every decoded track stays within its
declared chunk; all chunks are consumed with zero trailing bytes. Duplicate
MTB occurrences are retained, not counted as distinct named attacks.

Production private Wicked Wheel **23989** now uses m851 **WSS3**, packed
animation **0x13003000 / 318779392**, replacing the generic WSS1 throw.
Both the seed and unapplied idempotent migration set modelAnimation=3 and
battleAnimation=318779392. Cast time, potency, radius and canonical client ID
23538 are unchanged. This is a strong video/motion inference, **not** a
recovered historical server selector packet or stock-client acceptance result.

## Recovered data and provenance

See `outputs/garuda-motion-followup-20260907/`:

- Every motion preserves compressed key values, decoded values, frame indexes,
  chunk/track/key offsets, declared bounds, resource hashes and source locations.
- Both SKL skeletons retain names, array IDs, record IDs, parent joins, bind
  transforms and uninterpreted bytes. Garuda has 100 bones; the plume has five.
- `garuda_hip_spine_comparison.json` compares hip/spine rotation, root travel,
  anatomical left/right joint baselines and selected per-frame poses.
- `manifest.json` identifies installed files, executable hash, upstream source
  blob hashes, supported encodings and explicit interpretation limits.

The decoder adapts the MIT-licensed
[FFXIV Model Viewer curve loader](https://github.com/nohbdy/ffxivmodelviewer/blob/master/src/DatDigger/Sections/Animation/SpuCurveLoader.cs)
and skeleton reader. Full attribution/license is retained beside the tool.
Bone-local tracks are joined by skeleton array index; parent record IDs are
resolved separately. Quaternion interpolation/composition follows the viewer
and its SlimDX math reference. Scalar analysis deliberately uses conventional
time-based clamping/interpolation: the upstream `LinearCurve.GetValue` compares
the final clamp against Value rather than Time and reverses interpolation
weights. Raw decoded keys are unaffected by this analysis choice.

Unsupported upstream curve types 0x11–0x13 fail explicitly. None occurs in the
selected installed banks. This is not a general decoder guarantee for every
FFXIV model/version, and no native scheduler blend, actor facing/size, mesh
skinning, physics or native scalar evaluator is reproduced.

## Why WSS3 is the Wicked Wheel improvement

The [named-action video report](garuda-named-action-video-followup-2026-09-07.md)
separates newly appended Garuda ready lines from old sister/action lines.
In the [supplied 1.x recording](https://www.youtube.com/watch?v=rzVsuAo30hs&t=323s),
the new Wicked Wheel ready line appears around323.5 seconds. At326.0–326.625,
Garuda's body and wings visibly turn together in a rapid horizontal sweep.
The circular effect alone is not the identifying evidence.

| Native bank | Decoded body signature | Interpretation |
|---|---|---|
| WSS1 / cbbm_throw | Upper-spine heading span24.7°, returns to start | The old generic presentation does not match the turning body |
| WSS2 / cbbm_sp_a01 | Hip heading span~173°, upper-spine span~157°, substantial rise/dip | Candidate for the video's rearing/leg-extension Downburst; not assigned here |
| WSS3 / cbbm_sp_a02 | Hip heading span~908°, upper-spine span~910°; net~688°/~683° over80 frames | Strong match for the horizontal multi-turn Wheel body motion |
| WSS4 / cbbm_sp_b01 | Small torso-heading change, front-oriented motion | Slipstream candidate only; frontal motion alone cannot separate all magic banks |
| WSS10 / cbbm_sp_04 | One net body turn; bare motion bank with no SCB action envelope in this package | Another rotating clip, not evidence that all rotation means Wicked Wheel |
| WSS11 / cbbm_sp_b04 | Opposite-direction multi-turn rise with separate Aerial action package | Existing Aerial Blast mapping remains separate |

WSS3's hip and upper-spine projected axes retain horizontal fractions above
0.92/0.94 throughout the sampled motion. Their large heading changes are not
near-vertical projection singularities. Independent left-minus-right hip/wing
joint baselines reproduce the large net turn, and quaternion geodesic travel
exceeds1,200° in both torso joints. Do not interpret these metrics as the exact
number/sign of rotations measured in the video or as actor-world yaw.

The evidence establishes a substantially better Wheel presentation than WSS1.
It does **not** derive the original server's command-to-selector table from a
motion leaf name or WSS ordinal. Downburst, Slipstream, Mistral Song/Shriek and
plume named selectors are not upgraded to proven mappings by elimination.

## Additional findings

The full keys independently reproduce m851 WSS12 root-Y2.730110→10.000000 and
WSS13/WSS14 root-Y9.969663→2.395286, supporting the existing takeoff/landing
interpretation. The static `n_hara` rotation alone was insufficient to classify
attacks: the decisive Wheel rotation occurs in descendant hip/spine joints.

All three plume MTB payloads have the same SHA256 despite different motion
resource names. Their action/VFX schedulers differ in the earlier timeline
bundle. Bone motion therefore cannot identify Featherlance versus Thermal
Tumult by itself. Existing plume selector uncertainty remains explicit.

## Verification and reproduction

```powershell
python tools/garuda-motion-followup/build.py
python tools/garuda-motion-followup/build.py --check
python -m unittest discover -s tools/garuda-motion-followup -p test_*.py -v
```

Twenty-two tests cover compressed signs/counts/frame strides/raw offsets,
chunk truncation, unsupported types, quaternion math/composition, corrected
scalar sampling, heading singularities, corpus totals and takeoff/landing.
`--check` independently re-reads the installed sources and byte-compares all
22 generated JSON files. The battle harness separately checks both Wheel SQL
presentation fields; it failed against the old WSS1 row and passes with WSS3.

No installed client file, live database, running map server or placement was
changed in this follow-up. Native rendering and full-party behavior still need
in-game acceptance; isolated tests do not establish retail-exact parity.
