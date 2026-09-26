# Ifrit Plume and Eruption inner-geometry decomp

Date: 2026-08-05  
Scope: retail FFXIV 1.23b native Kuroko model-state package, exact Plume/Eruption VFX wrappers and geometry, corrected live carrier, and the resulting private-server placement strategy. Infernal Nail spawn/defeat remains included as a separate confirmed chain.

## Result

The new binary evidence separates the two warnings cleanly:

- Native `m999/e001` **state 4 / mode `0x10`** is the localized Radiant Plume visual package. It is actor-rooted, has no terrain bind, no `GenerateMaster`, and no `ManyGenerate*` controller. One state owner therefore launches one authored Plume package at that owner's coordinate; the client data does not contain a procedural arena-ring generator.
- Native `m999/e001` **state 5 / mode `0x20`** is the Eruption pre-impact ground formation. It is attached to the current owner but contains `Position3DMapBind`, generated ground-normal binding, `GenerateMaster`, and `jLoop`. One stationary owner at the target snapshot can launch the whole localized formation and keep it frozen while the player moves.
- The outer state envelopes are nearly identical. Their meaningful distinction is the inner VEFF graph, not attachment, color, scale, or owner-lifetime policy.
- The previous negative native-helper test did not exercise the exact chain. It wrote opcode `0x0144` **`breakage` instead of `mode`**, and its forced native appearance used `base 10999 / BODY 1024 / HEAD 1024`; the installed appearance table's m999/e001 shape is `base 10999 / BODY 1024 / HEAD 0`.

This means the next visibility test is no longer “try another animation.” It is one corrected model-state test on an exact m999/e001 owner.

## 1. Source identity

Native state package:

`client/chara/mon/m999/equ/e001/met_mdl/0001`

| bytes | SHA-256 |
|---:|---|
| 616,360 | `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105` |

The Plume and Eruption chains inside this package are:

```text
state 4 / mode 0x10
-> init_msb4_1
-> ACB msb4
-> VINS 3ULJ7Kvleafinst
-> leaf 1xuk6vmsb4_k
-> VEFF 0Xv7Tfift_eish2
-> authored source skill04/veff/ift_eish2y.veffbin

state 5 / mode 0x20
-> init_msb5_1
-> ACB msb5
-> VINS 258RjYvleafinst
-> leaf 2pm3upmsb5_k
-> VEFF 2Jckltift_skleb
-> authored source skill05/veff/ift_skleby.veffbin
```

`m852` imports the same byte-identical art. On canonical Ifrit, Eruption remains state 5/mode `0x20`, while the Plume package is remapped to state 7/mode `0x80`.

## 2. Exact common VINS envelope

The two 878-byte VINS payloads differ in resource identity, but all decoded operational fields below are identical:

| field | Plume state 4 | Eruption state 5 |
|---|---:|---:|
| attachment | `EID_CURRENT` | `EID_CURRENT` |
| signed word at `0x31C` | `-5000` | `-5000` |
| scale at `0x320..0x328` | `(1, 1, 1)` | `(1, 1, 1)` |
| flags at `0x32C` | `0x10100000` | `0x10100000` |
| RGBA at `0x340..0x34C` | `(1, 1, 1, 1)` | `(1, 1, 1, 1)` |
| LeafLife word A at `0x350` | `300000` | `300000` |
| LeafLife word B at `0x354` | `150000` | `150000` |
| LeafLife mode at `0x358` | `1` | `1` |

Exact identities:

| state | VINS SHA-256 | leaf SHA-256 |
|---:|---|---|
| 4 | `1b59d53cc8221a30594146c269872ef7601a95fe39eb5b28ea43a0b242cd1dae` | `576bb47c1ec49448d56dc631cb9aa2a48488793308893078559184ce288bab1e` |
| 5 | `4858063f199829e0de9dfbde363de429806f06769d6c4f6cd8d5303570643571` | `e65157478ffe5ef5db41bde95549600883417fe2c778aa0a5e7f6c1d6fb4f253` |

Mode 1 is the same owner-coupled leaf lifetime/fade policy seen elsewhere in this client. The two integer words must not be interpreted as a self-contained three-second cast duration. The enclosing model state remains owned by the mode bit until the off edge cancels it.

## 3. Exact ACB policy and curve length

Both `msb4` and `msb5` ACBs are 1,016 bytes. Only 14 bytes differ, including the six-byte VINS resource ID and the frame-count byte. Both serialize the same persistent state-child policy:

| field | Plume `msb4` | Eruption `msb5` |
|---|---:|---:|
| `@ACT +0x0C` / file `0x9C` | `0x000000C0` | `0x000000C0` |
| file `0xA0` | `0x00000101` | `0x00000101` |
| sample rate | 30 fps | 30 fps |
| curve frames | 38 | 46 |
| raw curve length | 1.266667 s | 1.533333 s |
| ACB SHA-256 | `1251bb43d20acaa7b445028875b2c263654bee0b8365b8ee2e0391187d3e779d` | `3ef6b7dbcede758176c4bfff486e1881aa92dd40b68778deb69ea55f264cc5b0` |

The raw curve length is not the warning's required server hold time. For a roughly three-second Eruption cast, start state 5 at cast begin, leave the owner and mode active for the cast, then issue the off edge before WSS3 impact.

## 4. Inner VEFF graph: decisive difference

| property | Plume state 4 | Eruption state 5 |
|---|---|---|
| VEFF | `0Xv7Tfift_eish2` | `2Jckltift_skleb` |
| bytes | 28,908 | 17,952 |
| VEFF SHA-256 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` |
| embedded VMDL resources | 6 | 5 |
| `Default` literals | 11 | 6; five are draw blocks and one belongs to the generated section |
| root/local position controls | yes | yes |
| root/local angle controls | root | root and local |
| root scale | yes | yes |
| `Position3DMapBind` | no | yes |
| generated ground normal | no | yes |
| `GenerateMaster` | no | yes |
| `jLoop` | no | yes |
| any `ManyGenerateUnitTime` | no | no |
| any `ManyGenerateFormSphere` | no | no |
| any `ManyGenerateMotionEmission` | no | no |
| any `ManyGenerateDrawLine` | no | no |

The exact class strings include:

```text
Plume:
Position3D:CoordRoot
Angle3D:CoordRoot
Scale3D:CoordRoot
Position3D:CoordLocal

Eruption:
Position3DMapBind:CoordRoot
Position3DMapBindGenerated:GendNormal:CoordLocal
GenerateMaster
Position3D:CoordRoot
Angle3D:CoordRoot
Angle3D:CoordLocal
Scale3D:CoordRoot
Position3D:CoordLocal
jLoop
```

The serialized VEFF-root bounds are also different:

| state | raw root min | raw root max | total extent |
|---:|---|---|---|
| Plume 4 | `(-10, -10, -10)` | `(10, 10, 10)` | `(20, 20, 20)` |
| Eruption 5 | `(-8.5, -8.5, -8.5)` | `(8.5, 8.5, 8.5)` | `(17, 17, 17)` |

These are local VEFF root/culling bounds. They are not proven collision radii and should not be labelled yalms without a rendered calibration.

## 5. Embedded model-local bounds

Each `SEDBvmdl` contains one documented `kind=14, size=68, live=1` bounds record. The values below are before VEFF node transforms, actor transform, and Eruption terrain projection.

### Plume state 4

| model | min | max | extent |
|---|---|---|---|
| `0EWK25pl0glo06y` | `(-0.5000, -0.5000, 0.0000)` | `(0.5000, 0.5000, 0.0000)` | `(1.0000, 1.0000, 0.0000)` |
| `1FdiYYrg0frb02y` | `(-0.9351, 0.0000, -0.9393)` | `(0.9581, 0.0000, 0.9117)` | `(1.8931, 0.0000, 1.8510)` |
| `3HisQ2fd0fib01y` | `(-2.9472, -2.9472, 0.7458)` | `(2.9472, 2.9472, 2.8773)` | `(5.8944, 5.8944, 2.1315)` |
| `4AihAGcy0snc01y` | `(-0.9808, -0.5000, -1.0000)` | `(0.9808, 0.5000, 1.0000)` | `(1.9616, 1.0000, 2.0000)` |
| `1MOOwhpl0glo08y` | `(-0.5000, -0.5000, 0.0000)` | `(0.5000, 0.5000, 0.0000)` | `(1.0000, 1.0000, 0.0000)` |
| `3l3ecDsp0dis02y` | `(-0.9957, -0.5561, -0.8228)` | `(0.9930, 1.7835, 0.8139)` | `(1.9887, 2.3396, 1.6367)` |

### Eruption state 5

| model | min | max | extent |
|---|---|---|---|
| `3vgVLAds0jwr02y` | `(-5.6451, 0.0000, -5.6725)` | `(5.6725, 0.3659, 5.6725)` | `(11.3176, 0.3659, 11.3449)` |
| `1i2RCRsp1glw02y` | `(-0.9511, -0.9511, 0.4682)` | `(0.9511, 0.9511, 1.0000)` | `(1.9021, 1.9021, 0.5318)` |
| `4bAjnKge0mon01y` | `(-5.0621, 0.0000, -5.1441)` | `(4.1205, 0.0000, 4.3444)` | `(9.1826, 0.0000, 9.4885)` |
| `1Y9HX2pl0tex03y` | `(-0.4650, -0.2968, -0.0501)` | `(0.4650, 1.2414, 0.0492)` | `(0.9301, 1.5382, 0.0992)` |
| `0aZQigpl0mzl01y` | `(-0.2278, 0.0000, -0.2278)` | `(0.2278, 1.0000, 0.2278)` | `(0.4557, 1.0000, 0.4557)` |

The two broad, nearly flat Eruption meshes are exactly what a ground-warning formation needs: one spans about `11.3 x 11.3` model-local units and another about `9.2 x 9.5`, with generated rock/fire layers above them.

Plume's largest source mesh spans about `5.9 x 5.9` model-local units. The VEFF contains 11 authored visual layers but no procedural replication controller. Eleven layers do not mean eleven separately placeable plume cells; they are render/effect layers inside one local package.

## 6. Corrected helper multiplicity

### Eruption

Use one stationary helper per targeted Eruption snapshot:

```text
cast begins
-> snapshot target world XYZ
-> instantiate exact m999/e001 helper at that XYZ
-> opcode 0x0144 mode edge 0 -> 0x20
-> command 23595 / native WSS4 SubStatusKick on helper
-> init_msb5_1 -> msb5 -> map-bound generated ground formation
-> hold helper and state for cast duration
-> opcode 0x0144 mode edge 0x20 -> 0
-> command 23595 / WSS4 kick to run init_msb5_0
-> command 23594 / native m999 WSS3 impact at same helper
-> delayed despawn
```

No Ifrit target is required. The helper is the owner and placement coordinate. A player who moves after snapshot should leave the warning behind.

### Radiant Plume

First prove one plume cell/package:

```text
stationary exact m999/e001 helper at a floor coordinate
-> opcode 0x0144 mode edge 0 -> 0x10
-> command 23595 / native WSS4 SubStatusKick
-> init_msb4_1 -> msb4 -> local Plume package
-> hold for telegraph interval
-> mode 0 + WSS4 kick to clear
```

For a multi-cell/ring layout, instantiate one helper for each authored plume origin and kick state 4 on all owners. The installed state-4 graph has no generator that can be relied upon to expand one center helper into the server's current center/outer/final collision layouts.

The present private-server mechanics describe center radius `16`, outer donut `8..22`, and final donut `8..50`. Those collision numbers are custom server geometry; they are not visual transforms recovered from the VEFF. The state-4 root extent is only 20 local units. Therefore the existing single center helper must not be assumed to render an entire outer or final floor pattern.

Exact retail plume-origin coordinates remain a runtime/capture item. A packet capture should enumerate every stationary helper created at Plume cast start; alternatively, a successful single-cell render can be tiled against retail footage and collision geometry.

## 7. Corrected live carrier

The appearance table proves these relevant rows:

| appearance | base | size | head | body | meaning |
|---:|---:|---:|---:|---:|---|
| `1001481` | `10999` | `2` | `0` | `1024` | exact available native m999/e001 donor; many duplicate rows share this shape |
| `2207310` | `1255` | `2` | `1024` | `0` | actor-class default `IfritHotAir`; not m999/e001 |
| `2207314` | `10852` | `2` | `2048` | `1024` | canonical m852 Ifrit dummy |

The previous native state probe explicitly forced:

```text
base=10999, BODY=1024, HEAD=1024
```

The exact native shape is:

```text
base=10999, size=2, BODY=1024, HEAD=0
```

The safest next probe is appearance `1001481` without direct appearance overrides, or an explicit packet with exactly the same base/size/body/head fields. Then write opcode `0x0144` **mode**, not `breakage`, and use WSS4 to commit the pending model state.

This explains the negative live result without discarding `init_msb4`/`init_msb5`: the test used the wrong state field and a noncanonical equipment combination.

## 8. Infernal Nail remains a separate spawn and defeat pair

Nothing in this inner-geometry pass changes the Nail result:

```text
spawn presentation
m524 active Nail, BODY 1024, HEAD 2048/e002
-> opcode 0x0144 mode 0x10 before the state kick
-> command 23366 / m524 WSS1
-> native rise/ignite presentation

defeat presentation
lethal damage
-> opcode 0x0134 MAIN_STATE_DEAD
-> generic client death dispatcher
-> probes dead1, dead2, dead
-> active m524/e002 dead SCB
-> separate collapse/death VFX
-> cbbm_dedpose/cbnm_dedpose terminal pose
```

Do not replay WSS1 for defeat and do not immediately delete the Nail actor. Its `dead` scheduler lasts 0.990 seconds before the terminal pose/cleanup handoff; the existing four-second corpse window is sufficient.

## 9. Confirmed and still open

Confirmed:

- exact state 4 and state 5 resource chains, hashes, wrappers, and attachment;
- identical VINS scale/color/lifetime policy;
- 30-fps ACB frame counts and raw curve lengths;
- state 4 lacks MapBind, GenerateMaster, and all requested ManyGenerate controls;
- state 5 contains MapBind, generated ground normal, GenerateMaster, and loop data;
- exact VEFF-root bounds and all 11 embedded VMDL bounds;
- exact native m999/e001 appearance shape and both errors in the earlier live test;
- Eruption can be frozen at one stationary helper coordinate;
- Plume is a local authored package, not a proven one-owner arena-layout generator;
- Nail WSS1 spawn and MAIN_STATE_DEAD defeat are separate paths.

Still open:

- a rendered frame from the corrected m999/e001 `mode + WSS4` chain;
- the exact numeric joins for every internal Position3D/Angle3D/Scale3D instance. Their class inventory and resource topology are recovered, but the VEFF relocation/property tables still need a full type-schema decoder before each value can be labelled safely;
- retail Plume helper count and world-coordinate array;
- the exact retail parent that emitted the state kick during cast, if it was not command 23595;
- live scheduler-creation/root lookup at `0x007A8457` and `0x007A852C` after the corrected carrier is used.

## 10. Reproducible artifacts

Scripts:

- `tools/build_ifrit_state_geometry_decomp.py`
- `tools/extract_ifrit_veff_root_bounds.py`

Generated output:

- `tools/outputs/ifrit-state-geometry-decomp-20260805/state_wrappers.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_structure.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/model_bounds.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_root_bounds.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/msb4_msb5_acb_byte_diff.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/summary.json`

No client DAT, executable, encounter script, server code, packet definition, or database row was modified by this decomp pass.
