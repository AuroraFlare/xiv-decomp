# Garuda plume effects: native pixels, material bounds and English names

Later update: the [Song follow-up](garuda-song-followup-2026-09-08.md) supersedes
the unresolved Song selector and combined test count below. This report's plume
explosion uncertainty remains current; its 524-check count is a prior snapshot.
The later [plume-color follow-up](garuda-plume-color-followup-2026-09-08.md)
completes the formerly unsupported eighteenth material and traces native color
composition. The 17/18 decoder result below is also a historical snapshot.

This is an original FFXIV 1.x/1.23b follow-up, not ARR. It supplements the
[completed Plumage release](garuda-plumage-followup-2026-09-07.md); it does not
claim to identify the remaining Featherlance/Thermal Tumult selectors.

## Implemented correction

The exported multilingual client display-name sheet distinguishes the Japanese
and English names:

| Display-name ID | Japanese | English singular | English plural |
|---|---|---|---|
| 3209504 | ブリストリープルーム | razor plume | razor plumes |
| 3209505 | シルキープルーム | satin plume | satin plumes |

The English names agree with the retained original footage: Razor Plumes appear
after the named [Monk Plumage release at 132–133 seconds](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=132s),
and the [same recording around 6:25](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=385s)
includes a Satin Plume defeat line. The sheet source path and SHA-256, plus both
localized rows, are retained in `plume_effects.json`. This is a verified reading
of the existing sheet export, not a new independent installed name-DAT extraction.

The director's explicit spawn labels and party text now say **Razor Plume** and
**Satin Plume**. Internal Bristle/Silky function names and unique IDs stay intact;
actor classes remain 2209510 and 2209512. This corrects server text, not the
client's existing localized display-name table. Initial placements, appearance
IDs, stats, sleep behavior and attack timings are unchanged.

An additional browser-only review of
[Garuda Pantless Win](https://www.youtube.com/watch?v=mcJvhjh9JXo) corroborates
Razor labels at approximately 225.76 seconds. At 290.91 the log shows Aerial
Blast dealing 2,000 damage to the recording player; by 300.91 Suparna and Chirada
are present. These are decoded, paused browser observations, not retained frame
files or exact transition onsets. The sparse samples do not establish that no
Song occurred between them, nor do they recover base potency or a Song selector.
No implementation timing or damage was changed from this additional recording.

## Extracted native texture evidence

The read-only extractor verifies the installed executable against the established
1.23b SHA-256 and hashes each m527 WSS1–3 bank and nested texture/material payload.
It recovers **22 GTEX mip-zero images**: 7 from WSS1, 9 from WSS2 and 6 from WSS3.
Their actual compressed pixel bytes are in the **outer PWIB shared buffer**, not
inside the nested VTEX/SEDBRES payload. GTEX supplies the format, dimensions,
mip count and relative offset. The output records preserve all of these, absolute
pixel offsets, compressed-byte hashes, PNG hashes and decoded RGBA hashes.

Three checkerboard atlases show the decoded pixels without suppressing alpha.
These include smoke, glow, aura, distortion and ring inputs. WSS2 and WSS3 both
contain a rainbow/refraction texture: that appearance is **not** sufficient to
label one of them Thermal Tumult. No tint, native particle simulation, scheduler
timing, model attachment, blending or final effect rendering is reconstructed.

## Material-reader correction

The earlier ring-specific material reader stopped the descriptor table at
`controlColor`. That assumption is invalid for several plume distortion shaders:
they append `distortionNormalPower` and `distortionModelCenter`. Applying the
ring assumption interpreted descriptor bytes as float values and shifted the
entire material buffer. Those incorrect provisional overlays were discarded.

The new plume reader takes the actual kind-6 property-name count, follows bounded
records to kind 10, and consumes one descriptor per property before reading values.
Every value is length/alignment checked against its enclosing record. Raw bytes,
type tags, descriptor/value offsets and explicitly labeled float overlays remain
available. This is a bounded supported-layout reader, not a general shader decoder.

**17 of 18 material records decode.** WSS1 `0lm6XWglo4_u4_0` has an unsupported
name-group layout and remains an explicit error rather than guessed values.
The old shared ring parser is unchanged: this correction belongs to the new plume
probe. Material fields alone do not recover the VEFF particle color evaluator or
prove a named attack-to-bank mapping.

## Reproduce and verify

```powershell
python tools/garuda-presentation-followup/inspect_plumes.py
python tools/garuda-presentation-followup/inspect_plumes.py --check
python -m unittest discover -s tools/garuda-presentation-followup -p test_*.py -v
```

Requires Pillow (this extraction records 12.2.0), the matching installed client,
the sheet export and the repository helpers. `--check` regenerates in memory and
byte-compares all **26 JSON/PNG artifacts**, without creating directories or
rewriting files. Image/library version changes may require an explicitly reviewed
regeneration. The separate README is explanatory text, not a generated artifact.

Eleven new tests cover trailing material properties, unsupported/truncated records,
name counts, value lengths, outer shared-pixel offsets, BGRA channel conversion,
PNG round-trips, non-mutating checks, localization and retained image hashes. One
new actual-Lua test asserts the English spawn labels and unchanged actor classes.

Latest verification: **364 production C# + 118 Lua/interop + 25 motion + 17 effect
tests = 524 passing checks**. The isolated Map build has zero errors, four existing
NuGet dependency advisories and one existing Blowfish signed-extension warning.
The Lua project also reports unavailable online vulnerability metadata. Static
encounter validation and deterministic command, motion, range, effect and plume
re-extraction checks pass. No live database migration, server restart or client
fight was performed; no installed client data was modified.

The remaining Song/explosion animation joins, exact retail tuning, native wind
rendering and stock-client acceptance are still open. The functioning encounter
reconstruction and passing fixtures are not a claim of complete retail parity.
