# Container internals VI — lyb string pool, nib+SCB, .san 13+1 blocks (2026-09-27)

Method: read-only probes + Python struct analysis. No content dumps.

## 1. lyb @3616 = packed C-string pool (weather-lane paths!)

First table target is not one record but a NUL-joined string pool of
short-ID + full-path pairs:

`w_0001` → `ScreenEnvObjects/Shadow/ShadowObject`,
`ColorCorrection_0001` → `ScreenEnvObjects/ColorCorrection/…`,
`VolumetricLight_0001` → `ScreenEnvObjects/VolumetricLight/…`, …

This MapLayout file IS a screen-environment (atmosphere) layout — the
file-level bridge between the layout system and weather rendering (shadow,
color correction, volumetric light objects). Other table targets hold
float structs (transforms/scales: 0.05, 0.4, 1.8, …).

Codec-join status: the 5 obfuscated 15-char string IDs (`1qAlFKocn_c0_wa`…)
do NOT literally match the short pool IDs (`w_0001`…) — different lengths,
so the join runs through a hash rendering (custom-base64-alphabet
candidate) or section-level indirection, not direct equality. Next: test
hash renderings of pool paths against the 5 IDs.

## 2. vfx PWIB = RES chunk + nib table + SCB chunk (new subtype)

`wsc/0040`: `nib\0` at 76, then u32 pairs (`04A0/02`, `09A0/02`… =
offset/count pairs), then at @172 a NEW subtype **`SEDBSCB`**
(scene block?) + counts. Grammar so far: envelope → RES resource tree →
nib index → SCB scene records. Next: SCB record stride + nib pair semantics.

## 3. .san = 13-op prologue + 108 KiB body

14 `73 73 73 5D` blocks: blocks 0–12 are 26–49 bytes (@51–561), block 13
runs @561→EOF (108,350 B). 5th byte = block opcode (90, 97, 96, 95, 94,
9b, 9a, 99, 98, 9e, 9d, 9c, 83, 82 — non-monotonic), then a common 8-byte
prologue (`5C 30 1C 1E 1E 12 1D 17`) before op-specific bytes. Shape of a
compiled event script: short setup ops, one long main body. Next: op
grammar per block id + body control-flow scan.
