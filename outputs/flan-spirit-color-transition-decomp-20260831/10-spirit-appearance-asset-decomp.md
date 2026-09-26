# m508 appearance effect / color-control extraction

## Exact launch chain

The `m508t0` actor (SCB actor index 24 in `man2g000`) has an appearance ActionClip in scheduler block `c23`:

- SCB payload: `man2g000` at PWIB physical `0x5635D8`.
- `c23` block: internal SCB offset `0xED60` (the CBLK ordinal is 24), duration `1,950,000` time units = `1.95 s`.
- ActionClip: actor 24, entry ordinal 18, internal SCB record offset `0xF0FC` (physical `0x5726D4`), record size `0x28` (40 bytes), start `440,000` = `0.44 s`; body contains RIDT index `0x210` = decimal `528`.
- RIDT index 528 is exactly `c_c23_appr01` (`bca`). The corresponding SCB body bytes are recorded by `inspect_man2g000.py`.
- `c_c23_appr01` physical payload offset is `0x541D00`, length `1016`, SHA-256 `1453dbef28fff88e4e37c87acc02f749b4dbaa6d0bc96ca0f624f8b8d15d837c`.
- Its action block `@BLK` begins at internal offset `0xD0`; serialized block duration at `+0x0C` is `0x2625A0` = `2,500,000` = `2.5 s`.
- The ACB has an `Effect` resource section at `0x318`, with leaf-instance id `3ZjARPvleafinst`, plus `Element` at `0x348`. This is a scenario-specific ACB/effect selector, not a WSS7 bank.

The same `man2g000` PWIB embeds the effect's actual appearance bank:

- VEFF `0J3FJQm508_appe`, path `chr_vfx\\m508_appear\\bin\\0J3FJQm508_appe`, payload physical offset `0x3C520`, length `34,428`, SHA-256 `e6e20cc8814c32ea74b558494cb6dd81597dd884a6ab7f8d6524006bc8ebbf59`.
- Leaf `1vgBedm508_appe`, path `chr_vfx\\m508_appear\\bin\\1vgBedm508_appe`, payload physical offset `0x4DBC0`, length `926`, SHA-256 `365d600ba7c504e1ad91d0f7a742b4e7668ea197bae2df7648630c62a50dfe23`.
- Leaf `1vgBedm508_appe` has `ActorBind`, `ColorRGBALeaf`, and `LeafLife`, and serializes child VEFF id `0J3FJQm508_appe` at internal leaf offset `0x2F8`.
- VEFF authored source string: `d:\gra_rapture\\vfx\\hq_event\\man2g000\\chr_vfx\\m508_appear\\m508_appear.veff`.

## VEFF color controls and timing

`0J3FJQm508_appe` has root offset `0x1230`, allocation table offset `0x3B4`, 84 primary/84 secondary control records, and 15 graph groups. Its instantiated class metadata includes `ColorRGBABlink:CoordRoot` (class index 3) for the m508 appearance layers. The source bank does not contain `RaptureCharaColorFadeClip`; it is a QIX/VEFF color animation.

The serialized 0x402 records at internal VEFF offset `0x48C0` are 0x34 bytes each (47 records). Their first dword is `0x00000402`; the remaining 48 bytes are 12 float32 overlays. This is the raw RGBA/control data used by the ColorRGBABlink graph. The first records, grouped in three-record runs, are:

| run | internal offsets | first float4 | second float4 | third float4 |
|---:|---|---|---|---|
| 0 | `0x48C0/0x48F4/0x4928` | `(1,0,0,1)` | `(0,0,1,0)` | `(0,1,0,0)` |
| 1 | `0x495C/0x4990/0x49C4` | `(0.5,0,0,0.35)` | `(0,0,0.1,0)` | `(0,1,0,0)` |
| 2 | `0x49F8/0x4A2C/0x4A60` | `(1,0,0,0.8)` | `(0,0,0.65,0)` | `(0,1,0,0)` |
| 3 | `0x4A94/0x4AC8/0x4AFC` | `(1,0,0,0.75)` | `(0,0,0.3,0)` | `(0,1,0,0)` |
| 4 | `0x4B64/0x4B98/0x4BCC` | `(1,0,0,1)` | `(0,0,1,0)` | `(0,1,0,0)` |
| 5 | `0x4C00/0x4C34/0x4C68` | `(1,0,0,0.4)` | `(0,0,0.1,0)` | `(0,1,0,0)` |
| 6 | `0x4C9C/0x4CD0/0x4D04` | `(0.9,0,0,1)` | `(0,0,1,0)` | `(0,1,0,0)` |
| 7 | `0x4D38/0x4D6C/0x4DA0` | `(0.5,0,0,0.3)` | `(0,0,0.1,0)` | `(0,1,0,0)` |
| 8–13 | `0x4DD4` through `0x5114` | mainly `(1,0,0,1)` | `(0,0,1,0)` | `(0,1,0,0)` |
| 14 | `0x5148/0x517C/0x51B0` | `(1,0,0,0.7)` | `(0,0,0.5,0)` | `(0,1,0,0)` |

The first record of each run is the clean value tuple; the second/third records contain the same values plus tiny curve/tangent overlays (for example run 1 second record has `-0.0250813` and `0.000280492` in its final two float slots). Keep the full raw `0x34` records when implementing; do not reduce them to a guessed single RGBA color.

Native QIX color runtime confirmation is in
`tmp/qix-colorblink-runtime-agent/REPORT.md`. `ColorRGBALeaf` (registry
`0x01300BCC`, class `0x3F2`) evaluates the graph at `0x00BA2070`; its
serialized lane setup `0x00BA2340 -> 0x00BA2250` and update dispatcher
`0x00BA23A0` feed two four-float lanes, multiply them component-wise, and
write the resulting RGBA through `self+0x10`. The m508 `0x402` records are
therefore graph color inputs, not writes to an actor appearance slot. The
Rapture-side `ColorRGBABlink` registry and tick implementation are now
resolved below; only the final renderer/material consumer beyond the QIX
control output remains outside this pass.

Direct registry recovery now identifies the Rapture blink controls themselves:

- `ColorRGBABlink:CoordPureWorld`: record `0x01316DB4`, class `0x2AB`.
- `ColorRGBABlink:CoordRoot`: record `0x01316CCC`, class `0x3C7`.
- Both use initializer `0x00D5F730`, tick/interpolator `0x00D5F950`, output
  evaluator `0x00D5F810`, and diagnostic printer `0x00D5F520`.

`0x00D5F950` advances `self+0x54`, derives normalized factor `self+0x58`,
interpolates `self+0x20` toward `self+0x30`, multiplies by the RGBA mask
pointer at `self+0x60`, and stores the effect-local result at `self+0x40`.
This proves the m508 graph has a native effect-local color blend while still
not touching the actor BODYGEAR bank. Raw instructions are in
`tmp/blink-update-disasm.txt`; the standalone reconstruction is in
`tmp/colorblink-vtable-material-local.md`.

The per-group metadata at internal VEFF offset `0x6704` carries a repeated `0x000493E0` word (decimal `300,000`) for the active appearance layers. Existing retail VEFF timing extractions use the observed 100,000-units-per-second convention for this metadata field, so this is a `3.0 s` authored layer lifetime/time envelope. The enclosing ActionClip/ACB remain `1.95 s`/`2.5 s`, respectively; these are not the color-layer lifetime.

There is an important native-runtime qualification for the leaf's separate
`3ZjARPvleafinst` tuple (`+0x350=300000`, `+0x354=150000`, `+0x358=1`). The
retail QIX `LeafLife` initializer (`0x00BA4440`) sets runtime `+0x18` to
`150000` and copies the serialized mode. In mode 1, the evaluator
(`0x00BA42A0`) uses the owning-effect boundary/completion state; it does not
interpret serialized word A as an active cutoff. The `LeafLifeEx` evaluator
(`0x00D58910`) likewise reads the owner boundary at `owner+0x44`. Thus the
`300000` VEFF metadata is a 3.0 s authored layer envelope, while leaf word B
matches the native 150 ms fade interval/default. Do not call either value a
body-gear transition delay without the owner scheduler's runtime boundary.

Physical offsets for the main raw color records are `0x3C520 + 0x48C0 = 0x40DE0` for run 0 and `0x3C520 + 0x5148 = 0x41168` for run 14. The full physical VEFF interval is `0x3C520..0x44B9B` (exclusive end `0x44B9C`).

## Interpretation boundary

The exact retail presentation is therefore `man2g000 SCB ActionClip -> c_c23_appr01 ACB Effect -> 1vgBedm508_appe leaf -> 0J3FJQm508_appe VEFF ColorRGBABlink/LeafLife`, not `RaptureCharaColorFadeClip` and not WSS7. The float4 table is serialized effect-control data; the safest emulator mapping is to preserve the atomic BODYGEAR appearance packet and schedule the separate m508 appearance VEFF presentation around the ACB's scenario timing. Do not alter appearance packet timing based solely on the authored 3.0-s VEFF layer envelope or the leaf's raw `300000` word.
