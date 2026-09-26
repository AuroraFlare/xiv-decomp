# Retail m508 / Spirit-of-the-Wood appearance selector

Read-only decomp/asset pass for actor class `2105201` (`m508`, `man2g0`). No
server source, appearance packet timing, or WSS selection was changed.

## Result

The retail scenario-specific presentation is not WSS7 and does not instantiate
`RaptureCharaColorFadeClip` for the Spirit actor. The verified chain is:

```text
man2g000 SCB
  actor index 24: m508t0 / class 6000249
  block c23: 1,950,000 units (1.95 s)
  ActionClip: starts at 440,000 (0.44 s), record 0xF0FC
  RIDT index 0x210 (528)
    -> c_c23_appr01 (SEDBACB / bca, 1,016 bytes)
       -> Effect -> 3ZjARPvleafinst -> 1vgBedm508_appe leaf
          -> 0J3FJQm508_appe VEFF / ColorRGBABlink graph
```

The installed `man2g000` source file is 9,608,688 bytes, SHA-256
`c895ce29d8f28246cfe9f6238e364754c82f1e003c43fd15289ec616f8b7cc19`.

## Resource bank and timings

| item | exact retail data |
|---|---|
| ACB | `vfx\\hq_event\\man2g000\\acc\\c_c23_appr01\\bin\\c_c23_appr01`, SHA-256 `1453dbef28fff88e4e37c87acc02f749b4dbaa6d0bc96ca0f624f8b8d15d837c` |
| leaf | `chr_vfx\\m508_appear\\bin\\1vgBedm508_appe`, 926 bytes, SHA-256 `365d600ba7c504e1ad91d0f7a742b4e7668ea197bae2df7648630c62a50dfe23` |
| VEFF | `chr_vfx\\m508_appear\\bin\\0J3FJQm508_appe`, 34,428 bytes, SHA-256 `e6e20cc8814c32ea74b558494cb6dd81597dd884a6ab7f8d6524006bc8ebbf59` |
| ACB block | `0x2625A0` = 2,500,000 units (2.5 s) |
| VEFF group metadata | repeated `0x000493E0` = 300,000; using the repository's observed VEFF 100,000-units/s convention, 3.0 s authored layer envelope |
| leaf-instance raw life fields | `3ZjARPvleafinst`: `+0x350=300000`, `+0x354=150000`, `+0x358=1`; native mode-1 semantics below are required before assigning these a visible duration |

The 0.44 s SCB start, 1.95 s CBLK, 2.5 s ACB block, and 3.0 s VEFF layer
envelope are different clocks. None is a reason to delay or split the D6/D7
appearance packet.

### Native LeafLife correction

The existing retail-native QIX decomp resolves the `3Zj` tuple as a base
`LeafLife` control (class `0x387`, registry `0x01300F6C`), not as an
independent three-second timer. Its runtime fields are `+0x10` normalized
life, `+0x14` boundary/start tick, `+0x18` fade interval, `+0x1C` mode, and
`+0x1D` completion flags. The serialized mode is copied from the leaf
instance's `+0x358`; the initializer at `0x00BA4440` supplies a native
`+0x18 = 150000` fade interval and initially takes the owner boundary from
`owner+0x10/+0x44`.

For mode `1`, the value evaluator at `0x00BA42A0` checks the owner/runtime
boundary and completion state; it does not use the serialized `300000` as an
active cutoff. `LeafLifeEx` (`0x00D58910` evaluator / `0x00D589F0` update)
does the same through the owning effect's `+0x10/+0x44`. The update paths
`0x00BA4370` and `0x00D589F0` transition modes `5/6/7` into `1/2/3`, clear
flag bit 0 through `0x00BB35E0`, and call the evaluators each tick. Therefore:

- `+0x350 = 300000` is a serialized boundary-like word, not proof of a 3.0 s
  visible fade for this mode.
- `+0x354 = 150000` matches the native fade interval/default (150 ms).
- The actual mode-1 lifetime is owner/effect-bound; the VEFF group's repeated
  `300000` remains a separate authored layer envelope (3.0 s under the
  observed 100,000-units/s serialization convention).

Relevant raw native branch (image base `0x00400000`):

```text
00ba42a0  CALL 0x00e3a460
00ba42b3  MOVZX ECX,byte ptr [ESI + 0x1c]
00ba42ba  CMP ECX,0x7
00ba42c3  JMP dword ptr [ECX*4 + 0xba4350]
00ba4440  MOV dword ptr [ESI + 0x18],0x249f0   ; 150000
00ba4440  MOV DL,byte ptr [EAX + 0x8]          ; serialized mode
00ba4370  TEST byte ptr [ESI + 0x1d],1
00ba4370  ... mode 5/6/7 -> 1/2/3, then evaluator
00d58910  ... mode 1 reads [owner + 0x44], not [ESI + 0x14]
```

Full decompiler output and listings are in
[`native_leaf_and_actionclip_targets.cpp`](../../outputs/garuda-tornado-decomp-20260805/native_leaf_and_actionclip_targets.cpp)
and [`native_leaf_lifetime_helpers.cpp`](../../outputs/garuda-tornado-decomp-20260805/native_leaf_lifetime_helpers.cpp).

Native caller/callee map (direct edges visible in the recovered bodies):

| function | relevant reads/branches | direct callees / internal callers |
|---|---|---|
| `0x00BA4370` LeafLife update | `TEST [ESI+0x1D],1`; mode byte `[ESI+0x1C]`; writes boundary `[ESI+0x14]` | calls `0x00E3A460`, `0x00BB3BD0`, `0x00BB35D0`, `0x00BB35E0`, `0x00BA42A0`; virtual owner stop at vtable `+0x40` |
| `0x00BA42A0` LeafLife evaluator | `MOVZX [ESI+0x1C]`, switch modes `0..7`; mode 1 compares runtime tick with `[ESI+0x14]` | calls `0x00E3A460`, completion query `0x00BCCB50`; called from `0x00BA4370` |
| `0x00BA4440` LeafLife initializer | copies serialized mode `[param3+8]`; initializes `+0x18` to `150000` | calls `0x00E3A460`; error path `0x00415C90/0x00416060` |
| `0x00BA45A0` LeafLife event handler | event 1 selects modes `1/2/3/5/7`; event 2/3 overwrite `+0x14/+0x18` | calls `0x00BA4370` after every state change |
| `0x00D589F0` LeafLifeEx update | same completion/mode branches; refreshes `+0x14` from owner tick | calls `0x00E3A460`, `0x00BB3BD0`, `0x00BB35D0`, `0x00BB35E0`, `0x00D58910` |
| `0x00D58910` LeafLifeEx evaluator | mode 1 reads `[[owner+0x10]+0x44]` | calls `0x00E3A460`, `0x00BCCB50`; called from `0x00D589F0` |

This is the native lifetime/effect scheduler underneath the m508 leaf. It
does not touch the actor appearance-dirty flag or alter D6/D7 packet timing.

The ACB's embedded `FCurve0000.fcr` has `Root`, constant `TransForm`, and a
single animated `MoveRatio` channel. Its two linear keys are exactly
`(time=0,value=0)` and `(time=29,value=1)` (raw records at ACB offsets
`0x2C4` and `0x2D4`). This is the action/effect interpolation selector; it is
not a body-gear packet delay.

## RGBA/control data

The instance `3ZjARPvleafinst` serializes `ColorRGBALeaf` as
`+0x340..+0x34C = (1, 1, 1, 1)`. The VEFF then drives a 15-group
`ColorRGBABlink` graph. Each group has three 0x34-byte `0x00000402` records;
the first four floats of each record are the clean RGBA/control tuple. The
complete raw table is in [11-spirit-color-control-records.csv](11-spirit-color-control-records.csv).

The key runs are:

| runs | clean RGBA/control tuples (record 0 / 1 / 2) |
|---:|---|
| 0 | `(1,0,0,1)` / `(0,0,1,0)` / `(0,1,0,0)` |
| 1 | `(0.5,0,0,0.35)` / `(0,0,0.1,0)` / `(0,1,0,0)` |
| 2 | `(1,0,0,0.8)` / `(0,0,0.65,0)` / `(0,1,0,0)` |
| 3 | `(1,0,0,0.75)` / `(0,0,0.3,0)` / `(0,1,0,0)` |
| 4 | `(1,0,0,1)` / `(0,0,1,0)` / `(0,1,0,0)` |
| 5 | `(1,0,0,0.4)` / `(0,0,0.1,0)` / `(0,1,0,0)` |
| 6 | `(0.9,0,0,1)` / `(0,0,1,0)` / `(0,1,0,0)` |
| 7 | `(0.5,0,0,0.3)` / `(0,0,0.1,0)` / `(0,1,0,0)` |
| 8–13 | `(1,0,0,1)` / `(0,0,1,0)` / `(0,1,0,0)` |
| 14 | `(1,0,0,0.7)` / `(0,0,0.5,0)` / `(0,1,0,0)` |

These are serialized VEFF control tuples, not a single native
`fromRGBA -> toRGBA` pair. Keep the 0x34-byte records, including their curve
and tangent words, if reproducing the effect.

### Native QIX color consumer

The helper decomp now resolves the shared `ColorRGBALeaf` runtime:

- registry `0x01300BCC`, class `0x3F2`; evaluator/update `0x00BA2070`;
- serialized lane setup `0x00BA2340 -> 0x00BA2250`;
- serialized update dispatcher `0x00BA23A0`;
- output RGBA is written through `self+0x10` after component-wise float4
  multiplication of the two lanes (`+0x20..+0x2C` and `+0x30..+0x3C`);
- `ColorRGBALeafEx` is registered at `0x0130FAB4` and inherits this color
  lane behavior alongside the owner-bound LeafLifeEx timing path.

The decisive native instruction is `0x00BA2102: MULPS XMM0,XMM1`, followed by
four-float stores through `[self+0x10]`. This proves the m508 `0x402` records
are QIX RGBA graph inputs, not appearance-slot writes. The direct
`ColorRGBABlink` registry/tick implementation is recovered in the next
section; only the final material setter beyond the QIX control output remains
unresolved. Full decomp and raw windows are in
[`qix-colorblink-runtime-agent/REPORT.md`](../../tmp/qix-colorblink-runtime-agent/REPORT.md).

### Direct `ColorRGBABlink` registry/update recovery

A direct registry scan recovered both blink variants that were previously
missing from the report:

| variant | registry record | class id | key methods |
|---|---:|---:|---|
| `ColorRGBABlink:CoordPureWorld` | `0x01316DB4` | `0x2AB` | init `0x00D5F730`, tick `0x00D5F950`, output `0x00D5F810`, print `0x00D5F520` |
| `ColorRGBABlink:CoordRoot` | `0x01316CCC` | `0x3C7` | init `0x00D5F730`, tick `0x00D5F950`, output `0x00D5F810`, print `0x00D5F520` |

The tick function is the actual blink interpolator. It advances elapsed time
at `self+0x54`, selects a mode in `self+0x50`, computes a normalized factor in
`self+0x58`, and finally evaluates:

```text
lane0 = self + 0x20          lane1 = self + 0x30
delta = lane1 - lane0
rgba  = lane0 + clamp(self + 0x58, 0, 1) * delta
mask  = *(float4 **)(self + 0x60)
out   = rgba * mask
store out -> self + 0x40
```

The decisive raw branches are `0x00D5F950` (`+0x54/+0x50/+0x58` state),
`0x00D5FE21` (`SUBPS` lane delta), `0x00D5FE66` (`MULPS` by normalized
factor), `0x00D5FEA3` (`ADDPS` to lane 0), and `0x00D5FF10` (`MULPS` mask).
This is a real effect-local RGBA blend, but its output terminates in the QIX
effect control (`self+0x40`), not in the actor BODYGEAR bank. The complete raw
disassembly is in `tmp/blink-update-disasm.txt`.

The standalone native registry/tick note, with the C-like reconstruction and
raw instruction boundary, is [`colorblink-vtable-material-local.md`](../../tmp/colorblink-vtable-material-local.md).

## Native color-fade check

The native class is registered globally, but the m508 scene does not use it:

- `0x00636633`: registers `RaptureCharaColorFadeClip` (`0x00FBCEB8`) with creator `0x0063B010`.
- `0x0063B010`: allocates a 0x40-byte clip and constructs via `0x008261E0`.
- `0x008262A0`: virtual update; reads actor index `+0x03`, frame count `+0x14`, mask `+0x18`, source RGBA `+0x1C..+0x28`, destination RGBA `+0x2C..+0x38`, then calls `0x0065EF60`.
- `0x0065EF60 -> 0x008422E0`: generic four-channel RGBA interpolation controller.
- Direct E8 edges are creator construction (`0x0063B077 -> 0x008261E0`), constructor/base paths, and restart/stop helpers around `0x0082641D/0x0082643A`; there is no direct scenario caller of `0x008262A0` and no branch on actor `2105201`, `m508`, or `man2g0`.

The full native trace, raw disassembly, and caller/callee notes are in
[FINAL_NATIVE_COLORFADE_LAUNCH.md](../../tmp/native-colorfade-launch-agent/FINAL_NATIVE_COLORFADE_LAUNCH.md).

## Appearance-dirty consumer cross-check

The parallel actor-side decomp confirms that the ordinary BODYGEAR swap is
still a deferred atomic replacement, not a hidden blend:

```text
actor +0xB20 read: 0x00585DD8 (FUN_00585D70)
  -> event 8, actor +0xAAC, 0x74 bytes
  -> 0x006623F0 copies 29 dwords to renderer +0x13C8
  -> 0x0065D730 arms renderer +0x2B70 low nibble = 1
  -> 0x00666720 submits/polls one bank
  -> 0x00665E40 -> vfunc +0x64 = 0x006B7840
  -> BODYGEAR bank dword 14 (+0x38) -> helper +0x9C
  -> 0x006B6850 builds one part resource ID
```

The first eligible renderer tick decrements phase `1 -> 0`; no delta-time,
blend weight, old/new model pair, or alpha ramp is read. BODYGEAR is logical
slot 13 but native bank dword 14 because dword 0 is the base-model field.
The only genuine `actor+0xB20` read is the `CMP byte ptr [EBP+0B20h],0` at
`0x00585DD8`; the remaining executable displacement hits are writes or
non-actor coincidences. Actor `+0xB1C` bits 0/1/2 are consumed downstream as
equipment/model flags, attachment fan-out, and `%s9998.bin` supplemental
resource selection—not as fade controls.

This means the m508 VEFF is a separate visual mask/effect scheduled around the
scenario ActionClip. It does not change the packet-to-appearance state machine.
The exhaustive actor-side report is
[`00-README.md`](../../outputs/appearance-dirty-retail-decomp-20260812/00-README.md),
with the focused renderer state machine in
[`10-renderer-state-machine-report.md`](../../outputs/appearance-dirty-retail-decomp-20260812/10-renderer-state-machine-report.md).
The fresh helper audit, including raw B20/B1C windows and the mechanical
`00586870` slot arithmetic, is
[`appearance-dirty-followup-agent/REPORT.md`](../../tmp/appearance-dirty-followup-agent/REPORT.md).

## Implementation handoff

Keep the atomic BODYGEAR element mapping and existing D6/D7 packet timing.
Replace the guessed WSS7 presentation with a separate m508 appearance-effect
presentation modeled on `c_c23_appr01 -> 1vgBedm508_appe ->
0J3FJQm508_appe`. Do not treat the 230 ms WSS7 delay, the WSS7 clip ID, or the
VEFF/ACB clocks as proof that the appearance packet itself should be delayed.

Supporting raw scans:

- [m508_appearance_effect_report.md](10-spirit-appearance-asset-decomp.md)
- [m508_colorfade_raw.txt](../../tmp/m508_colorfade_raw.txt) — every installed m508 WSS/action bank has zero `RaptureCharaColorFadeClip` rows.
- [scenario-trace.md](../../tmp/scenario-2105201-agent/scenario-trace.md) — local gameplay trigger is elemental-profile change only; WSS7 timing is emulator-authored.
