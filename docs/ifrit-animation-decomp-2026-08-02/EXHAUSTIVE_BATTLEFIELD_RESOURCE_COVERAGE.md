# Exhaustive Bowl of Embers battlefield-resource coverage

Audit date: 2026-08-02

## Outcome

The installed client does contain an authored Bowl of Embers fire-ring object. It is not merely an inference from retail footage or weather:

- `data/61/5A/00/08.DAT` contains unit tree `sgrp_vfx_ifring`.
- Layout instance `isgrp_016280` places that unit at `(2526.596924, 248.343002, 2208.061035)` with zero rotation and unit scale.
- The unit owns exact short member aliases `show`, `hide`, `vtp1`, `sho1`, and `hid1` that point to five named timeline nodes.
- Those timeline nodes directly point to five embedded `SEDBSCB` scheduler bodies. A sixth nearby timeline, `time_vfx_fire_vtp1`, also directly points to an embedded scheduler, but it is not a member alias of `sgrp_vfx_ifring`.
- The ring package includes collision, two attribute objects, an authored VFX, an Ifrit-circle sound object, four textures, three VFX models, the VFX effect, and shared leaf/instance data.

This corrects the earlier conclusion that no arena scheduler had been recovered. What remains unresolved is the runtime owner and trigger: the current server has no recovered map-object row that binds a live `Npc` actor to this client layout instance, so the exact server call that makes the ring enter each authored state is still unknown.

The battlefield weather is a separate layer. The installed client natively maps weather ID `8028` (`wtr_smmn`) to `data/61/5A/00/20.DAT`. AuroraFlare's generated Windower weather overlay additively maps custom ID `8074` (`wtr_ifrit_af`) to that same retail payload. That payload supplies camera-bound fire, the `wildsw_ifrit_loop` atmosphere, and sky/cloud/fog/light schedulers. It is not the world-placed arena ring, Crimson Cyclone's actor-bound flame trail, Eruption, Radiant Plume, Hellfire, or a Nail lifecycle.

No literal `eruption`, `plume`, `hellfire`, `nail`, `kuroko`, `m999`, or `skill` byte sequence exists in either the arena layout root or the selected weather root. The installed action-bank candidates documented elsewhere therefore remain separate actor/helper resources whose encounter selectors are not supplied by these battlefield files.

## Confidence vocabulary

| Label | Meaning in this report |
|---|---|
| Confirmed | Read directly from an installed file, a strict node relationship, a direct timeline-to-SCB pointer, or current source. |
| Correlated | Two confirmed facts align spatially or structurally, but the client or server has not exposed the semantic join. |
| Inferred | A likely meaning derived from a name such as `show`, `hide`, or `frbg`; not a decoded runtime operation. |
| Unresolved | No installed selector, server owner, packet capture, or runtime observation proves it. |

## Source roots and immutable provenance

| Artifact | Size | SHA-256 | Role |
|---|---:|---|---|
| `data/03/C0/00/00.DAT` | 52,336 | `c04b0d998aea4c1b13ed322292a5aa5af45485c698da2315171c3c024bcb9a74` | Installed `RegionResourceData` table. |
| `data/61/5A/00/08.DAT` | 1,245,056 | `56b24e6aca53911810848baf7be254a2c20038d8c127bcc0c8603ba6b0614e7c` | `wil_w0_fld05` map-layout payload containing the placed Bowl ring and floor. |
| `data/61/5A/00/20.DAT` | 103,920 | `f5be8e1a2cd596bda078735e66e96c7f342de71238fbdc1c871c142539ce0397` | Native `wtr_smmn` weather layout; reused by the additive `wtr_ifrit_af` overlay mapping. |
| `data/61/57/00/1F.DAT` | 2,248 | `727d755a81e1a1e65a7d74ab34760e85044e4af4c7726fd9d51086ff565a0d00` | Plain-text file set for `wtr_smmn`, including `wildsw_ifrit_loop`, `vfx_cam_fire`, and `vfx_sun00001y`. |
| `data/61/5A/00/24.DAT` | 103,984 | `f6588ec0b43fc312a0236a544ad334bd1551adf8404d129f2b9a95f17c85c64f` | Native `wtr_heat` comparison payload, not the payload selected by custom server ID `8074`. |
| `data/61/57/00/23.DAT` | 2,248 | `62a52ff9690ed4b6217af008df51af9332c87d590a8ebabd5e68204cf6f9abec` | `wtr_heat` comparison file set. |

The installed region table maps client layout token `wil_w0_fld05`, child ID `405`, to key `0x615A0008`. The same child/key pair is repeated beneath parent rows `104`, `107`, `116`, `124`, `125`, `130`, `213`, and `214`. Those repetitions are regional parent bindings; no evidence makes them Normal/Hard/Extreme selectors.

The test parent `_test_r03`, child ID `904`, points to `0x61DA000A`, but `data/61/DA/00/0A.DAT` is not installed. It cannot supply a hidden alternate Ifrit battlefield in this client.

Current server zones `240` and `265` use region `104` and internal map name `wil0Field05a`; the current Ifrit manager creates zone `240`. The client token and server name are related battlefield identities, but they are not interchangeable object IDs.

## Strict map-layout decode method

The layout relationships below were decoded according to the existing `MapLayout.cpp` structure in the local Seventh Umbral archive parser, then independently checked against the raw bytes:

1. Read `headerSize` at file offset `0x20`.
2. Set the layout-relative base to `headerSize + 0x30`.
3. Read each node header as `(nodeId, parentNodePointer, nodeNamePointer)`.
4. For `RefObjects/UnitTree/UnitTreeObject`, read the item-array pointer and count at `u32[12]` and `u32[13]`. Each item is 48 bytes; its alias pointer is `u32[5]` and target-node pointer is `u32[6]`.
5. For `RefObjects/InstanceObject`, read position from floats `u32[8..10]`, rotation-vector pointer from `u32[11]`, scale-vector pointer from `u32[12]`, and referenced-node pointer from `u32[15]`.
6. For each `BaseObjects/TimeLine/TimeLineBaseObject` node, the installed object stores an embedded-SCB relative pointer at `u32[5]` and exact byte size at `u32[6]`. Adding the layout base produces the physical file offset. This makes the mappings below direct pointer relationships, not adjacency guesses.

For `data/61/5A/00/08.DAT`, `headerSize = 0x5420`, the layout base is `0x5450`, layout magic is `0x62796C`, layout size is `0x12AB60`, unknown-table count is `56`, and node count is `7,526`.

## Placed arena objects

### `isgrp_016280`: confirmed fire-ring instance

| Field | Decoded value |
|---|---|
| Relative node / physical offset | `0x87F30` / `0x8D380` |
| Internal node ID | `949` |
| Parent type | `RefObjects/InstanceObject` |
| Referenced unit | relative node `0x38F00`, `sgrp_vfx_ifring` |
| Position | `(2526.596924, 248.343002, 2208.061035)` |
| Rotation | `(0, 0, 0)` |
| Scale | `(1, 1, 1)` |

The reconstructed server boundary center `(2527.994, 2208.178)` is approximately `1.402` XZ units from this ring placement. That is strong spatial correlation with the Bowl, but it is not an exact shared transform and does not prove a server actor binding.

`isgrp_016280` is a client layout-instance name. It is not itself a decoded server map-object layout ID, actor-class ID, instance ID, or network actor ID. The node's internal numeric ID is `949`, not `16280`.

### `sgrp_vfx_ifring`: exact members and scheduler aliases

The referenced UnitTree node is relative `0x38F00`, physical `0x3E350`, internal node ID `1613`. Its item array is relative `0x3E180`, count `9`.

| Item | Exact unit alias | Target node | Exact target name |
|---:|---|---:|---|
| 0 | `vfx_ifuring1_001` | `0x1020D4` | `vfx_ifuring1` |
| 1 | `show` | `0x1025D4` | `time_vfx_if_ring_a_show` |
| 2 | `hide` | `0x1025FC` | `time_vfx_if_ring_a_hide` |
| 3 | `attr_w0f0_ifu_ring_a` | `0xD4E70` | `attr_w0f0_ifu_ring_a` |
| 4 | `vtp1` | `0x10264C` | `time_vfx_if_ring_vtp1` |
| 5 | `sdef_ifrit_circle` | `0x101DAC` | `sdef_ifrit_circle` |
| 6 | `attr_w0f0_ifu_ring_b` | `0xD4FD0` | `attr_w0f0_ifu_ring_b` |
| 7 | `sho1` | `0x102674` | `time_vfx_if_ring_b_show` |
| 8 | `hid1` | `0x10269C` | `time_vfx_if_ring_b_hide` |

This table confirms the short-to-long mappings. The semantic interpretation of `show`/`hide` and `sho1`/`hid1` is strongly named but still partly inferred until the SCB value payloads or a runtime capture establishes the exact on/off polarity and transition behavior.

### `isgrp_016281`: confirmed Bowl floor-chip instance, not the ring

| Field | Decoded value |
|---|---|
| Relative node / physical offset | `0x87F70` / `0x8D3C0` |
| Internal node ID | `950` |
| Parent type | `RefObjects/InstanceObject` |
| Referenced unit | relative node `0x38F50`, `sgrp_w0f5_def0_fl0_h` |
| Position | `(2528, 248, 2208)` |
| Rotation | `(0, 0, 0)` |
| Scale | `(1, 1, 1)` |

`sgrp_w0f5_def0_fl0_h` is UnitTree node ID `1859` and has exactly one member: alias `w0f5_def0_fl0_h_001` referencing node `w0f5_def0_fl0_h`. That target's parent is `BaseObjects/BG/BGChipBaseObject`, with resource token `4q7qJSw0f5_de_h`, table type `brt`, key `0x897C012D`.

The corresponding installed resource is `data/89/7C/01/2D.DAT`, 151,798 bytes, SHA-256 `47e163b9047b13ff2c1616b3846320481c2d1b85537d267dd23de56c1c5f886b`.

Shared divide-map node `Bk_isgrp_016281` is relative `0x114330`, physical `0x119780`, internal node ID `1218`, parent `RefObjects/SharedFolder/DivideMap/DivideMapFolderObject`. Its decoded bounds are:

- minimum `(2496, 246.919342, 2176)`
- maximum `(2560, 249.719254, 2240)`

The XZ bounds form a 64-by-64 terrain tile centered on `(2528, 2208)`. This, the one-member BG-chip group, and the `fl0_h` resource name distinguish `isgrp_016281` from the scheduler-bearing fire ring.

## Direct arena timeline-to-SCB map

All six relationships in this table are confirmed by the timeline node's embedded pointer and size fields.

| Timeline | Unit alias membership | Timeline node (relative / physical) | SCB offset / size | SCB SHA-256 | Embedded actor targets | Clip classes |
|---|---|---|---|---|---|---|
| `time_vfx_if_ring_a_show` | exact alias `show` | `0x1025D4` / `0x107A24` | `0x12EB60` / `0x330` | `a69ae40e20691ebfa882a2ade184241ae2365a7d0c05274354bd17db40ed3f96` | `coll_ifu_ring` | `LayUnitMemberActor`, `LayCollisionOnOffClip` |
| `time_vfx_if_ring_a_hide` | exact alias `hide` | `0x1025FC` / `0x107A4C` | `0x12EE90` / `0x330` | `2fef1d2a2fde43848c0c3397e987bb2f2e75e49f9049fd4f5b3400a70572fd05` | `coll_ifu_ring` | `LayUnitMemberActor`, `LayCollisionOnOffClip` |
| `time_vfx_fire_vtp1` | **not present as an alias in `sgrp_vfx_ifring`** | `0x102624` / `0x107A74` | `0x12F1C0` / `0x3E0` | `4d108bb2edf80099e2c01fac4120cb6d2145948818b3be48c9f555b8521ebffc` | `vfx_fire002_003`, `vfx_fire0f2_005`, `sdef_0006_007_0` | `LayUnitMemberActor`, `LaySEFadeOutClip`, `LayRaptureEffectFadeOutClip` |
| `time_vfx_if_ring_vtp1` | exact alias `vtp1` | `0x10264C` / `0x107A9C` | `0x12F5A0` / `0x380` | `f2e96b1463fe9cbbc5e8ee0477a1ebb26ea3f3df1538bf40b82e9e67883552b1` | stored 16-byte tokens `vfx_ifuring1_00`, `sdef_ifrit_circ` | `LayUnitMemberActor`, `LaySEClip`, `LayVFXClip` |
| `time_vfx_if_ring_b_show` | exact alias `sho1` | `0x102674` / `0x107AC4` | `0x12F920` / `0x330` | `166489c34a706ab412012a4689bd76b037e7f036fae0ab5bf21cd2f66a937341` | stored token `attr_w0f0_ifu_r` | `LayUnitMemberActor`, `LayCollisionOnOffClip` |
| `time_vfx_if_ring_b_hide` | exact alias `hid1` | `0x10269C` / `0x107AEC` | `0x12FC50` / `0x330` | `8654871ea8f48f13c4f2813fb7f8440b0c6e3513ee2ffe1062a58db987a2fc24` | stored token `attr_w0f0_ifu_r` | `LayUnitMemberActor`, `LayCollisionOnOffClip` |

Important boundaries:

- The direct SCB map is confirmed. It no longer depends on the six SCBs merely appearing sequentially.
- The SCB string fields truncate long target names to their stored width. `vfx_ifuring1_00` correlates with member `vfx_ifuring1_001`, `sdef_ifrit_circ` with `sdef_ifrit_circle`, and `attr_w0f0_ifu_r` with the named ring attributes, but the truncated token alone does not distinguish attribute A from B.
- The names `show` and `hide` strongly imply opposite collision states. The actual Boolean/value payload was not semantically decoded, so this report does not claim which serialized value means on or off.
- `time_vfx_fire_vtp1` is a fade-out scheduler for two generic layout fire actors and a sound actor. It is not a member alias of the ring group, and nothing in the installed bytes calls it Eruption, Plume, Hellfire, or Crimson Cyclone flames.

## Fire-ring resource dependency closure

The following entries occur in the `vfx_ifuring1` resource group in `data/61/5A/00/08.DAT`, with the two ring collision resources separately present in the same layout table.

| Key | Layout token / type | Installed file | Size | SHA-256 | Confirmed or bounded role |
|---|---|---|---:|---|---|
| `0x89800419` | `06rodMw0f0_ifu_` / `bhp` | `data/89/80/04/19.DAT` | 2,896 | `bf7cb4ba0448d4359c87ac9b717147c7cd88e4fa5ab60e9e486b2a5454854ecf` | `SEDBPHB` collision resource associated with the Ifrit ring layout. Inner/outer polarity is unresolved. |
| `0x89800442` | `2vfk74w0f0_ifu_` / `bhp` | `data/89/80/04/42.DAT` | 2,896 | `616f3359644aaf0da902d190262379ad151c044c62bcc23939ad097eebab0df7` | Second `SEDBPHB` collision resource. Inner/outer polarity is unresolved. |
| `0x8988007E` | `2czcVRif_gdbn1y` / `xetv` | `data/89/88/00/7E.DAT` | 16,564 | `7205567783dbc483b89d1e576783efc3daab0738a73876a98d279891e2ce1c67` | VFX texture; model dependency name `if_gdbn1y.dds`. |
| `0x89880080` | `3gWzIwifu_tfr1y` / `xetv` | `data/89/88/00/80.DAT` | 65,716 | `4ce40937ea7865503419920d8e362c017233a5e54c4441c1a421a4929a675dde` | VFX texture `ifu_tfr1y`. |
| `0x8988007F` | `00mAdsifu_frmsy` / `xetv` | `data/89/88/00/7F.DAT` | 16,564 | `06c751fcce2a1f6aa8537e87a1d87049c36b53d2aeb280747f8f1981139bb20f` | VFX texture `ifu_frmsy`. |
| `0x8988007D` | `2tOsCdif_frds2y` / `xetv` | `data/89/88/00/7D.DAT` | 8,372 | `2b0f70daf3636adfcee739abc0230c7d7ae9af738e79fbf807972a506feaeddd` | VFX texture; model dependency name `if_frds2y.dds`. |
| `0x898700BD` | `462n4Dif_gdbn1y` / `ldmv` | `data/89/87/00/BD.DAT` | 10,388 | `100de7e1c03357c070b8aa6b2718549275ac9fd0914f902864dd85c1c4f9b35d` | VFX model referencing `if_gdbn1y.dds`. Any “ground-burn” expansion of the abbreviated name is inference. |
| `0x898700BB` | `1KZ4liif_frbg1y` / `ldmv` | `data/89/87/00/BB.DAT` | 10,976 | `63f328984620e27cf83b1ce0f95ec9fd8221572d71572ac345bd22305902fa1d` | VFX model referencing `ifu_tfr1y.dds`, `ifu_frmsy.dds`, and `if_frds2y.dds`. |
| `0x898700BC` | `3BdVCrif_frsm1y` / `ldmv` | `data/89/87/00/BC.DAT` | 16,780 | `fb11a0f5a3bb195be41fa95e0fb76c9e39fbe7a095d9e33064ab43e9595f01ca` | Second flame VFX model referencing the same three textures. |
| `0x89840074` | `39mAd9f0ifuring` / `ffev` | `data/89/84/00/74.DAT` | 11,676 | `f399fa88a3654a81ee8c00744c5994a063dcc785ddc9ccc868841ee5c323be39` | `SEDBveff`; source path `d:\gra_rapture\bg\public\wil_w0\vfx\veff\f0ifuring1.veff`; includes distortion controls. |
| `0x89860004` | `3HF1I4f0_map` / `fael` | `data/89/86/00/04.DAT` | 26,608 | `83893ef457192d4af46fb8d39f4e0c7d1e595790e7b54bd1fe8ddb3662d078a0` | Shared layout VFX leaf archive. It contains compiled entries for many `wil_w0` effects, including `f0ifuring1.veffbin`; it is not ring-exclusive. |
| `0x89850007` | `28zG92vleafinst` / `sniv` | `data/89/85/00/07.DAT` | 170,944 | `aa9a83412b99ae3571796d288e4c0c1f1302dd240664b2d965c628527d86f3a8` | Shared VFX-instance package repeatedly used by layout groups; not ring-exclusive. |

This closure proves that the client has authored ring geometry/VFX/sound/collision content. It does not prove the initial state, auto-start policy, exact transition ordering, or server-side owner.

## Weather and arena atmosphere

### Native ID versus AuroraFlare custom ID

Installed `RegionResourceData` contains native weather ID `8028`, token `wtr_smmn`, under `wil_w0`, pointing to `0x615A0020`. It contains no native row for ID `8074`.

AuroraFlare's `tools/build_windower_seasonal_weather_overlay.py` defines:

`8074: (0x615A0020, "wtr_ifrit_af", "Ifrit primal atmosphere", "retail Thanalan 8028")`

The generated `outputs/windower-weather-v9-precipitation-20260718` manifest binds that additive variant across 48 weather-capable parents. Current `BowlOfEmbers.lua` sends weather `8074`, so successful resolution to this payload depends on the generated overlay being active. The existence of the overlay output does not, by itself, prove that a given client launch loaded it.

Native weather ID `8014`, `wtr_heat`, points to `0x615A0024`. It uses a closely related camera-fire family and a different VINS key (`0x8985001A`, SHA-256 `5caecd83899f655f6da0b3692ce3ee3cc100656f38c0809c2729c92366256d2a`). No recovered encounter selector chooses `8014`; it is a comparison, not a fallback asserted by this report.

### Camera-fire placement

In `0x615A0020`, instance `cbind_fire` is a `RefObjects/InstanceObject` at `(0,0,0)`, rotation `(0,0,0)`, scale `(1,1,1)`, referencing VFX node `vfx_cam_fire`. The effect source is:

`d:\gra_rapture\bg\public\wil_w0\wtr\wtr_smmn\vfx\veff\fire0001o.veff`

Its compiled controls include `Position3DCameraBind:CoordWorld`. This is direct evidence for camera-bound atmospheric fire. It should not be repurposed as a world-positioned Eruption/Plume anchor or an Ifrit-bone-bound Cyclone trail.

Unit tree `sgrp_dwev_se` has two members:

| Exact alias | Exact target |
|---|---|
| `time_smmn_se` | timeline node `time_dwev_se` |
| `sdef_ifrit` | sound node `sdef_ifrit` |

Thus `time_smmn_se` is an exact UnitTree alias, while the underlying timeline node is named `time_dwev_se`.

### Weather dependency closure

| Key | File | Size | SHA-256 | Role |
|---|---|---:|---|---|
| `0x8982008C` | `data/89/82/00/8C.DAT` | 6,039,540 | `733337acd4bc59947567158a5b2d62134469f1d6f66b881e18b98f0f08017f42` | Sound container selected by resource token `0b3niawildsw_if`; file-set path is `../sci/wildsw_ifrit_loop.win32.scd`. |
| `0x89880077` | `data/89/88/00/77.DAT` | 692 | `a170107ad9ca7e4353fcfb14d9e1b9980b69adad4857578777b15847a6377b33` | `fire0102o` VFX texture. |
| `0x89880075` | `data/89/88/00/75.DAT` | 4,276 | `a783be391420a8d63abb4fa94b5490473da03d8a65a936f3bb042d765660bbdc` | `fire0101o` VFX texture. |
| `0x898700A4` | `data/89/87/00/A4.DAT` | 5,408 | `796b9992ca96f2609065e71753334e94685d8e88e228db20dc9cf0c76d17c53f` | `fire0102o` VFX model. |
| `0x898700A2` | `data/89/87/00/A2.DAT` | 5,076 | `f3d620e57bb76341182ef2515b2433babf57dfa31661e7755560ef6a2680890f` | `fire0101o` VFX model. |
| `0x89840068` | `data/89/84/00/68.DAT` | 17,216 | `f1ec5a6d017eb8ae1a251e92c758493b7351458636c74eda55d336eebca47dcf` | `fire0001o` camera-bound effect. |
| `0x89860014` | `data/89/86/00/14.DAT` | 1,093 | `c39a609bc0f77a7e0cd2e18cf836f509feb45193d3c71ebfe800a79a1d017577` | `cam_fire` leaf. |
| `0x89850018` | `data/89/85/00/18.DAT` | 1,632 | `78cce5449bef9a3689d38f31449c7e5b4d957d5d0616a0b01aa9ed2f9d7702a9` | `wtr_smmn` VFX-instance package. |
| `0x898700A6` | `data/89/87/00/A6.DAT` | 39,392 | `73e3783507ef438c4bb332bdc8984fe73ea0dce22526eabcebddcee65a1309f2` | `sun00001y` VFX model. |
| `0x898700A8` | `data/89/87/00/A8.DAT` | 7,024 | `9973e788c4280f5642857aff856df74e6c92b5cf4ad35d7d31d0704390512b6c` | `sun00002y` VFX model. |
| `0x8984006B` | `data/89/84/00/6B.DAT` | 5,888 | `bf669137387fed7443dcb75e307b4d03a54a88926985824706e9fbbfd3283098` | `sun00001y` VFX effect. |

### Direct weather timeline-to-SCB inventory

As with the arena file, every row below is a direct timeline pointer/size relationship. `time_sky_00` also exists as a timeline node but has zero SCB pointer and zero size, so it is not counted among the 13 embedded scheduler bodies.

| Timeline node | Unit alias note | Physical SCB / size | SHA-256 | Actor targets | Clip families |
|---|---|---|---|---|---|
| `time_sqnc_24` | exact member of `sgrp_sqnc_24` | `0x91D0` / `0x1740` | `087b12fffa5c3e82f600165f28cfb4dd5b5d5b955ed16421b2dd5588d70b72cc` | `winesv_00`, `occclr_00`, `occclr_01`, `sdwclr_00`, `entmdl_00`, `sdwmap_00`, `litclr_00`, `litmap_00`, `litesv_00`, `entmdl_20` | system/material clips |
| `time_dwev_se` | exact alias `time_smmn_se` in `sgrp_dwev_se` | `0xA910` / `0x360` | `f782fc3a865219236d2f1371ec6992e0f5252ae1a99cf28638fbc8e0e3819d99` | `sdef_ifrit` | environment-sound clip |
| `time_dwev_sky` | exact member of `sgrp_dwev_sky` | `0xAC70` / `0x1760` | `e4848d84f33b07c52563ea5aece759dd2b8ee28866d71edb7ecf77ae87ca962b` | sky sphere, two lights, stars, sun, moon, moon child, sky fog | celestial sphere, directional light, alpha, sun/moon |
| `time_dwev_cld` | exact member of `sgrp_dwev_cld` | `0xC3D0` / `0x1580` | `e85aad60759992cdad932e0b263ae3005b71171da8d9a804d4945b9b9fa5bb6d` | cloud main/sub/ambient lights and fog | directional/ambient light, fog, sun/moon |
| `time_dwev_00` | exact member of `sgrp_dwev_00` | `0xD950` / `0x1530` | `7d028d5fc9425631faffd20267a43568fd62eeca0aa42076be4bc940e3568f63` | `*_00` lights, fog, envmap, glare, vertical fog | directional/ambient light, fog, vertical fog, env map, screen glare |
| `time_dwev_10` | exact member of `sgrp_dwev_10` | `0xEE80` / `0x15D0` | `3bc7e8ef7ee88851a01ba6a507bc63072a762b2794a439323a84a275a4503fc9` | `*_10` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_20` | exact member of `sgrp_dwev_20` | `0x10450` / `0x13C0` | `592eef982f65eb4188ed4be3c53c2f86df8def10a7b65ff7ab5d202d940eef69` | `*_20` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_11` | exact member of `sgrp_dwev_11` | `0x11810` / `0x10E0` | `bd3bf4099293b5c1de3fb6819bb2cc190061504f2156289703e847a379d777c9` | `*_11` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_21` | exact member of `sgrp_dwev_21` | `0x128F0` / `0x13C0` | `2357e418b7b3ee7b1f98ae73ed3bcc267b4a526f37dc777cd5c01c5d76644f43` | `*_21` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_12` | exact member of `sgrp_dwev_12` | `0x13CB0` / `0x10E0` | `870bd2565c9a69089e6e97631af16e6514e1081453301ab2a0bf225a7920c730` | `*_12` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_22` | exact member of `sgrp_dwev_22` | `0x14D90` / `0x13C0` | `f827619f169ef51cbdcce459fa33cb9c4d2517260e93f4a1b043b388337850c6` | `*_22` fog/lights/glare | directional/ambient light, fog, screen glare |
| `time_dwev_13` | exact member of `sgrp_dwev_13` | `0x16150` / `0x1A50` | `6b83e399bac0be2d0e97a1a3de6afd699d279da0731d8d36f0f3406670d99bac` | `*_13` lights/fog/glare | directional/ambient light, fog, screen glare |
| `time_dwev_14` | exact member of `sgrp_dwev_14` | `0x17BA0` / `0x1A50` | `f8d6f8f7d93254d4b444cd5031202b149e78a8006981620a1c203742f438b9a6` | `*_14` lights/fog/glare | directional/ambient light, fog, screen glare |

The scheduler content confirms an atmospheric material/sound/sky/cloud/light/fog system. It supplies no world-coordinate mechanic actor and no Ifrit skeletal action.

## Literal-name boundary

Case-insensitive byte counts in the two relevant roots are:

| Token | `0x615A0008` arena | `0x615A0020` weather |
|---|---:|---:|
| `eruption` | 0 | 0 |
| `plume` | 0 | 0 |
| `hellfire` | 0 | 0 |
| `kuroko` | 0 | 0 |
| `m999` | 0 | 0 |
| `skill` | 0 | 0 |
| `nail` | 0 | 0 |
| `ifrit` | 2 | 2 |
| `ifu` | 18 | 1 |
| `ring` | 52 | 13 |
| `fire` | 46 | 12 |

Absence of a literal mechanic name does not prove the mechanic cannot use an opaque scheduler. Here it sets a strict attribution boundary: the recovered ring/weather resources cannot be renamed as Eruption, Plume, Nail, Hellfire, or dash-flame resources solely because they contain fire.

## Ifrit helper-class surface

The recovered client Lua directory `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/monster/ifrit` contains 13 scripts:

- `IfritBaseClass`, `IfritNormal`, `IfritDummy`, `IfritDummy001`, `IfritDummy002`, `IfritHotAir`, `IfritAid`, and `IfritAnchor`
- `IfritHyperBaseClass`, `IfritHyper`, `IfritHyperAid`, `IfritHyperAnchor`, and `IfritHyperDummy`

Every file is inheritance/identity plumbing only. `IfritDummy`, `IfritHotAir`, `IfritAid`, `IfritHyperAid`, `IfritHyperAnchor`, and `IfritHyperDummy` additionally return `false` from `isMapMarkerVisibleForTalkable`. None calls an animation, action bank, effect, spawn, map-object scheduler, or mechanic function.

Current SQL binds only the recovered Normal/Dummy/HotAir/Anchor subset across actor classes `2207301..2207315`. The recovered Aid, Dummy001, Dummy002, and Hyper-family surface does not have a current actor-class binding in the inspected server data. At Lua SHA `f868e997...`, Hard combat does spawn class `2207310` (`IfritHotAir`) as a managed helper for every Plume and for the second post-Hellfire Eruption train. Normal and Extreme retain their ordinary command queues.

The latest GM-only diagnostic does provide an explicit probe path. In a solo Ifrit test, `ProbeGroundBank` accepts banks `2`, `3`, `4`, `10`, `12`, `13`, `14`, `21`, or `22`; it uses class `2207310` (`IfritHotAir`) for banks 2/3 and class `2207314` (`IfritDummy`, full `m852`) for the others, spawns at the GM's exact position, instantiates the actor, and sends packed WSS `0x13000000 | (bank << 12)`. This is a controlled research owner, not evidence that retail or any combat rotation uses that class/bank/placement combination.

The unusual current class `2207314` uses `IfritDummy` while retaining full Ifrit appearance base `10852` (`m852`), and `2207310` uses `IfritHotAir` with helper/invisible appearance base `1255`. Class `2207310` is therefore a confirmed current Hard server caster as well as a GM probe owner; that is not proof of retail ownership or successful client rendering. `SetEncounterCombatPresentationVisible(false, false)` suppresses combat presentation/UI, not the actor model, and its pre-instantiation `broadcast=false` call does not emit the newer blank actor-name packet. Appearance base `1255` must not be equated with client resource family `m999` without a selector or appearance-resolution join.

## Generic `m999` helper spillover

The installed generic Kuroko bank root `client/chara/mon/m999/act/emp_emp/wss/base` contains banks `0001..0020`. The Ifrit-relevant installed files are:

| Bank | Size | SHA-256 | Direct content boundary |
|---|---:|---|---|
| `0001` | 275,472 | `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94` | References `ifrit_852/skill09`, `ift_sklc9y.veff`, and `m852_0009_cas`. |
| `0002` | 788,688 | `495d76a562dbe2bebfb2698468dd114cd2aa024e6f22004b9fd0520ddd72cfc1` | Kuroko `skill02`; fire/glow/ring-like bomb/distortion content. No recovered `rock_*` resource string in this bank. |
| `0003` | 740,656 | `0ddecf22508dcd151e302c7484981932b52db02f8ca926c3a114c65168046ac6` | Kuroko `skill03`; fire, rock, glow, and distortion content. |
| `0006` | 490,912 | `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | Kuroko `skill06` plus `m852_0002_cas`/Ifrit skill-2 references. |

Outer Ifrit WSS `0021` and `0022` reference Kuroko helper content corresponding to generic skills `02` and `03`. This is why they remain credible ground/helper probes. It does not establish which actor owns them, where an effect is placed, or that skill `02` is a rock effect; the rock evidence begins in skill `03`.

No SQL or combat encounter path recovered in this audit binds a retail live helper owner to these `m999` files. Current Hard helpers use class `2207310` but cast private Eruption/Plume commands through canonical WSS2/WSS3/WSS1 donors; they do not select WSS21/WSS22 or prove an appearance-`1255` to `m999` mapping. The GM probe can exercise outer Ifrit WSS21/WSS22 on class `2207314`, whose packages reference generic `m999` skills 02/03, but that diagnostic join does not prove retail ownership. The files remain installed resource candidates, not battlefield-layout schedulers.

## Server transport and owner gap

Two current server transports are relevant and must not be conflated:

| Path | Protocol behavior | Important limit |
|---|---|---|
| `Npc.PlayMapObjAnimation` -> `PlayBGAnimation` | opcode `0x00D9`; packet body contains only the animation bytes | truncates to 8 ASCII bytes |
| `Npc.RunMapObjScheduler` -> `RunEventFunctionPacket` | opcode `0x0130`; invokes `_runBgSchedulerFromMidstream(scheduler, offsetSeconds)` | accepts 1-64 printable ASCII characters; offset `0..3600` seconds |

`RunMapObjScheduler` is capable of carrying a full long timeline name, although the ring already exposes exact short aliases. It also enforces runtime ownership requirements: the owner must be a live server `Npc`, `IsMapObj()` must be true, the player must be in the same area, and the actor must exist in that player's instanced-actor table before the event call is queued.

No inspected SQL/source row contains `isgrp_016280`, `isgrp_016281`, `sgrp_vfx_ifring`, `16280`, or `16281` as a Bowl map-object binding. No zone-240 map-object row was recovered. Therefore:

- The client layout group and its timelines are confirmed.
- A usable server network owner is not confirmed.
- Treating string suffix `016280` as `MapObjLayoutId = 16280`, actor-class `16280`, or a spawn identifier would be an unsupported conversion.
- Synthesizing an arbitrary map-object actor solely to call these schedulers is not safe until class/layout/instance ownership is captured or recovered.

The existence of a long scheduler transport corrects the earlier statement that the server is limited to eight-character arena names. The eight-character limit applies to opcode `0x00D9`, not to `_runBgSchedulerFromMidstream`.

## What this resolves for each reported omission

| Reported layer | Battlefield-resource result | Current selector/choreography boundary |
|---|---|---|
| Persistent arena flames | **Resource recovered.** World-placed `sgrp_vfx_ifring`, its five callable member aliases and five member timeline SCBs, plus the separate nearby `time_vfx_fire_vtp1` SCB, VFX/sound/collision/attribute objects, and dependency closure are confirmed. | Initial state, runtime owner, exact call ordering, late-join reconstruction, and show/hide polarity still need capture. |
| Crimson Cyclone dash flames | The arena ring and camera weather fire are the wrong ownership classes: one is world-placed boundary content; the other is camera-bound atmosphere. | At Lua SHA `f868e997...`, Hard requests Ifrit WSS `0007` for each rush. WSS `0008` remains absent. Pre-Hellfire/Nail-phase uses one body/one crossing; post-Hellfire uses one simultaneous three-body triangle crossing. Runtime capture must show whether every WSS7 fire/fade layer renders; Normal/Extreme still use generic `23984`. |
| Ifrit jump/takeoff/landing | No battlefield layout or weather scheduler selects an Ifrit skeletal jump. | At Lua SHA `f868e997...`, Hard explicitly plays WSS `0018` for takeoff/absence and WSS `0019` for perimeter/final landing. That closes server invocation for Hard, but not in-client rendering or Normal/Extreme parity. |
| Hard glow/form transition | No battlefield layout or weather scheduler selects an Ifrit skeletal form state. | At Lua SHA `f868e997...`, Hard explicitly plays WSS `0015` once at or below 50% HPP to enter `st0 -> st4`; WSS16 reversal is not sent during battle. Runtime persistent-form proof remains open. |
| Eruption ground burst | No arena/weather token, group, or scheduler is attributable to Eruption. `time_vfx_fire_vtp1` is a generic layout-fire fade-out and has no ring-group alias. | Hard runs three-pulse trains through private `23983`: train one casts from Ifrit; a second post-Hellfire train casts from a `2207310` helper at center. Each pulse snapshots its target's current point for damage, but the result packet carries no arbitrary coordinate and no helper is placed at that point. Canonical WSS2 is selected, not WSS4/WSS10/WSS21/22. |
| Radiant Plumes | No arena/weather token, group, or radial scheduler is attributable to Plume. | Hard now places a `2207310` caster at arena center for center/outer Plumes or at Ifrit's current point for the final 50/8 donut. Private `23987`/`23988` select canonical WSS3/WSS1, not the stronger WSS12-14 or WSS21/22 candidates. Normal/Extreme remain generic. |
| Hellfire | Weather supplies atmosphere and the ring supplies a boundary, but neither is identified as Hellfire. | Current Hellfire uses generic donor WSS `0001`, applies mechanics, and directly cleans surviving Nails without a recovered large-fire/helper tail. |
| Infernal Nails | No Nail resource is owned by the battlefield layout/weather. Nails remain separate `m524` actors. | At Lua SHA `f868e997...`, spawn requests `m524` WSS `0001`, configures a four-second ordinary death/fade plus permanent one-shot removal, and preserves dead Nails at normal Hellfire cleanup. Exact automatic `ded`/`dedpose` rendering and surviving-Nail consume presentation remain open. |

## Confirmed, correlated, inferred, and unresolved summary

### Confirmed

- Physical `wil_w0_fld05` layout key `0x615A0008` and exact file hash.
- Placed ring instance `isgrp_016280` with strict transform and direct reference to `sgrp_vfx_ifring`.
- Placed floor instance `isgrp_016281`, its one-member BG-chip group, and 64-by-64 divide-map bound.
- Nine exact ring UnitTree members and five exact short scheduler aliases.
- Six direct timeline-to-SCB pointer/size maps with exact hashes, actor tokens, and clip classes.
- Ring dependency keys `0x89800419`, `0x89800442`, `0x8988007D..80`, `0x898700BB..BD`, `0x89840074`, `0x89860004`, and `0x89850007`.
- Native weather `8028 -> wtr_smmn -> 0x615A0020` and additive overlay `8074 -> wtr_ifrit_af -> same retail payload` definition.
- Camera-bound atmospheric fire, Ifrit ambient sound alias, weather dependency closure, and 13 direct weather SCB bodies.
- Absence of literal mechanic/helper names from the two battlefield roots.
- Helper Lua classes contain no presentation logic.
- Current Hard combat uses class `2207310` helpers for its Eruption/Plume choreography, independently of the battlefield layout.
- Current server has both an eight-byte BG-animation packet and a 64-character map-object scheduler call.

### Correlated

- Ring placement is approximately 1.402 XZ units from the reconstructed server boundary center.
- `vfx_ifuring1_00`, `sdef_ifrit_circ`, and `attr_w0f0_ifu_r` stored SCB tokens correlate with longer UnitTree member names.
- Custom server weather `8074` is intended to use the retail `wtr_smmn` payload when the generated overlay is active.

### Inferred, not decoded semantics

- `show` versus `hide` and `sho1` versus `hid1` represent opposite collision/attribute transitions.
- Abbreviated model tokens such as `gdbn`, `frbg`, and `frsm` describe particular ground/flame visual layers.
- The ring's authored timelines are used in the retail Bowl in a particular phase/order rather than only auto-starting with the layout.

### Unresolved

- Live network actor/class/layout/instance ownership for `isgrp_016280`.
- Whether the ring auto-starts on layout load, weather application, content entry, or an event call.
- The exact initial ring state and calls for `show`, `hide`, `vtp1`, `sho1`, and `hid1`, including late joins and wipes.
- Whether the generated `8074` overlay is active in the user's actual launch path.
- Retail selector and owner for WSS `0010`, `0012..0014`, `0021..0022`, and generic `m999` helpers; retail-authentic timing/runtime proof for the now-invoked Hard WSS `0018..0019` pair.
- Eruption/Plume fixed-ground anchor, packet order, offsets, rotations, scale, lifetimes, and cleanup.
- Nail activation/deactivation/death/consume ordering.

## Highest-value next captures

1. Enumerate live zone-240 map-object actors after client instantiation and record network actor ID, actor class, `MapObjLayoutId`, `MapObjInstanceId`, unique identifier, and position. Match by transform before attempting a scheduler.
2. If a real ring owner is found, capture one scheduler at a time in a disposable instance: `show`, `hide`, `vtp1`, `sho1`, then `hid1`. Record collision, visible VFX, sound, persistence, and what a late-joining client receives.
3. Trace which `RegionResourceData` table the launched client loads when server weather `8074` arrives. This separates “overlay output exists” from “overlay is active.”
4. Capture Hard Cyclone at Lua SHA `f868e997...` with WSS `0007`, `0018`, and `0019` enabled; capture both the one-body crossing and the simultaneous three-body triangle crossing, distinguish actor-bound trail/fade/takeoff/landing effects from the static ring and camera weather, and determine whether WSS `0008` is actually needed for retail recovery. Capture the separate WSS15 Hard glow transition as well.
5. Capture Hard Eruption and each Plume variant with source, target, class-`2207310` helper visibility, action packets, snapshot point, rendered effect position, and cleanup. The remaining join is from the confirmed server caster/geometry to the actual client ground art.
6. Capture the currently selected Nail WSS `0001` spawn, stable state, automatic `DEAD` collapse/pose/fade, surviving-Nail Hellfire consumption, GM damage path, and late join to determine how the remaining `m524` BID resources are selected.

## Bottom line

The Bowl's persistent fire ring is no longer an unknown asset: its installed world placement, group members, short aliases, five member timeline scheduler bodies, the separate nearby `time_vfx_fire_vtp1` scheduler, and dependency closure are recovered at byte-level confidence. The adjacent `isgrp_016281` is terrain, not an alternate ring or helper. The Ifrit weather payload is also fully bounded as camera/sky/sound atmosphere, with custom ID `8074` depending on an additive overlay over native ID `8028`.

Those findings narrow, rather than erase, the remaining gaps. Dash flames still belong to the Ifrit action/helper path; Hard selects WSS `0015`, `0018`, and `0019` for form/takeoff/landing presentation; Hard Eruption/Plume server helpers are now wired but their exact client ground-art join remains unverified; and Nails select WSS `0001` plus an automatic death/fade lifecycle while exact BID rendering and surviving-Nail consumption remain open. For the ring itself, the outstanding work is now specifically the live map-object owner and runtime timeline order—not discovery of the client assets.
