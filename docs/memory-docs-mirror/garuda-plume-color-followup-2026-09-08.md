# Garuda plume material completion and native color composition

This follow-up completes the previously unsupported plume material and traces
the native color-root evaluator. It does **not** assign Featherlance or Thermal
Tumult to a new WSS bank. No encounter mechanics, damage, timers, placements or
SQL definitions change in this pass; the preceding Song change remains intact.

## All 18 plume materials now decode

The WSS1 resource `0lm6XWglo4_u4_0` was not corrupt. Its kind-6 name record starts
at `0x2EC` with 22 properties, but `ambientColor` is ninth, not first. The first
properties are `viewProjMatrix`, `depthOffSetWVPMatrix`, and `controlColor`.
The two matrix entries have zero-byte value descriptors, rather than stored
matrix floats. Their precise runtime binding is not established by this parser.

The corrected reader locates a unique bounded name record containing the required
property names. It no longer derives the record start from `ambientColor`.
All 18 retained kind-10 records have a one-instance header, a repeated property
count at `+0x14`, and their descriptor table at `+0x30`. Those constraints are
checked before consuming any values; unsupported or ambiguous layouts fail closed.
The glow's kind-10 record starts at `0x4AC`, descriptors at `0x4DC`, values at
`0x58C`. Its stored `controlColor` is `(1,1,1,1)`.

The earlier search for ambientColor's descriptor signature would have skipped
leading entries, shifting every property/value association. It could also be
fooled by that byte pattern in another header field. The new parser uses the
bounded table position and independent count, not a signature search.

Four added regressions cover leading zero-byte entries, mismatched count or
multiple instances, a decoy descriptor signature, and ambiguous name groups.
These failed against the old implementation before the parser correction.
The retained-corpus test now checks all 18 materials and the glow's leading
properties. Existing truncated-buffer, trailing-distortion-field, image-integrity
and non-mutating-check tests continue to pass. Texture pixels are unchanged.

This is a **bounded supported-layout reader**, not a universal material loader.
Type tags and original value bytes remain preserved; zero-byte matrices are not
fabricated, and arbitrary shader semantics are not inferred from float overlays.

## Native color computation: why white defaults are not an attack identity

The verified installed executable's `ColorRGBARoot:CoordRoot` registry is at
`0x01302D54`, class ID `0x79`. Its update pointer at registry `+0x54` is
`0x00BA64D0`; `0x00BA65E0` is a forwarding wrapper. The traced code performs:

1. Copy the four floats addressed by control `+0x20` into output `+0x10..+0x1C`.
2. If control `+0x24` is nonzero, add that modifier's four output values through
   `0x00BA4B50`.
3. Multiply all four channels by the runtime vector obtained through `0x00E39F60`.

The additive helper uses double-precision addition followed by float conversion;
the final component-wise multiplication is `MULPS`. Neither recovered routine
clamps channels to 0–1. This does not establish what subsequent shaders do.
The multiplier accessor uses an indirect runtime virtual call at slot `+0x54`;
its concrete implementation is **not** recovered here.

All 18 materials store `(1,1,1,1)` for `controlColor`, across all three WSS banks.
That does not mean the rendered effects are white, nor does it prove those defaults
are the color-root evaluator's input at runtime. The six VEFF graphs have these
mechanically joined ColorRGBARoot primary-record counts:

| Bank | Caster graph | Target graph |
|---|---:|---:|
| WSS1 | 0 | 7 |
| WSS2 | 2 | 2 |
| WSS3 | 11 | 9 |

The WSS1 caster graph includes class metadata without a matching instantiated
primary record. A class string alone is therefore insufficient evidence of use.
The serialized primary words are preserved as links/control data, **not decoded
as literal RGBA**. Per-node base values, modifiers, time inputs and runtime
multiplier targets are unresolved. No final effect rendering is claimed.

This narrows the remaining investigation: identify the actual per-node runtime
inputs or obtain a named visual match that distinguishes the full effect. Both
WSS2 and WSS3 already have rainbow texture inputs, so a rainbow appearance alone
does not justify changing Thermal Tumult's selector.

## Reproducible evidence

`outputs/garuda-plume-color-followup-20260908/` contains three native C/listing
exports (nine requested function addresses) and `color_contract.json`. The JSON
records the native registry, exact bytes/hashes for the updater/additive/accessor
routines, six VEFF graph joins, 18 material color defaults, input/helper hashes
and explicit interpretation limits.

The new Ghidra exporter checks the imported program's executable SHA-256 before
exporting, matching the independently checked installed executable:
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
The PowerShell wrapper uses the existing project read-only, no analysis/save,
rejects unsafe output filenames and requires a freshly completed output file.

```powershell
& tools/garuda-presentation-followup/decompile_color.ps1
& tools/garuda-presentation-followup/decompile_color.ps1 -OutputName native-color-evaluator.cpp -Addresses 00ba64d0
& tools/garuda-presentation-followup/decompile_color.ps1 -OutputName native-color-bind.cpp -Addresses 00ba6470,00e39f60,00ba4b50
python -B tools/garuda-presentation-followup/inspect_plumes.py --check
python -B tools/garuda-presentation-followup/inspect_color.py --check
python -B -m unittest discover -s tools/garuda-presentation-followup -p test_*.py -v
```

Omit `--check` to regenerate the corresponding JSON/image artifacts. The color
probe requires the completed native exports. Ghidra/Java/client paths in the
wrapper are local prerequisites, not bundled executables or installation steps.
The material extractor requires Pillow; it still checks all 26 generated
JSON/PNG artifacts without writes in check mode.

Combined regression count is now **368 C# + 118 Lua/interop + 26 motion + 21
effect/material tests = 533 checks**. These checks and native data establish the
documented implementation contracts, not full retail fidelity or client rendering
acceptance. No database migration, live fight, server restart, installed-client
edit or additional placement change was performed.
