# Ifrit Eruption, Radiant Plume, and Nail visibility decomp

Date: 2026-08-05  
Client: retail FFXIV 1.23b, `2012.09.19.0001`  
Goal: make the effects visibly execute, while keeping Eruption pre-impact, Eruption impact, Plumes, Nail spawn, and Nail defeat as separate client paths.

## Bottom line

The retail asset now supplies direct semantic and timing evidence that `m999/e001` state 5 is the missing Eruption **pre-impact ground formation**:

- its original source path is `kuroko_999/skill05/veff/ift_skleby.veff`;
- its authored layers include `地面亀裂（加算）Loop` (ground crack, additive, loop) and `予兆発生ディストーション` (telegraph-spawn distortion);
- the ground-crack layer carries the raw timing-like triplet `310000, 80000, 20000`;
- the telegraph distortion carries `255000, 0, 300000`;
- at the client convention of 100,000 units per second, those are `3.10 / 0.80 / 0.20 s` and `2.55 / 0 / 3.00 s`;
- the graph has two exact `Position3DMapBind:CoordRoot` nodes and also contains the generated-normal MapBind class;
- the client MapBind implementation performs a vertical battlefield collision query and caches the returned floor height.

This is not another explosion. The known large impact remains native `m999` WSS3 / command `23594`.

The most practical reconstructed visible sequence is:

```text
cast begins
-> snapshot the selected player's world position
-> create and instantiate an exact m999/e001 stationary helper there
-> queue opcode 0x0144 mode edge 0x00 -> 0x20
-> run a real SubStatusKick scheduler (command 23595 / native m999 WSS4 is command-backed)
-> client resolves init_msb5_1 -> msb5 -> Eruption ground-crack/telegraph VEFF
-> retain the helper and state through the approximately three-second cast
-> queue mode 0x20 -> 0x00 and run another SubStatusKick
-> client resolves init_msb5_0 and cancels the warning
-> run command 23594 / native m999 WSS3 for the large impact
-> delete the helper only after effect cleanup
```

Native WSS5 contains the same kind of SubStatusKick and can also commit the queued state if the server can invoke packed model animation 5 correctly. WSS4 is useful because retail command `23595` is a known command-backed way to obtain the kick. The queued `mode` bit selects state 5; the kick scheduler number does not have to equal the selected state number.

`!playanimation` alone cannot perform this chain. It does not populate the actor's queued model-state mode and therefore does not give `RaptureActionSubStatusSchKickClip` the state transition it needs to commit.

## Source identity

Carrier equipment package:

`client/chara/mon/m999/equ/e001/met_mdl/0001`

| Property | Value |
|---|---|
| File bytes | 616,360 |
| SHA-256 | `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105` |
| exact donor appearance | base `10999`, size `2`, BODY `1024`, HEAD `0` |

Relevant inner effects:

| State/mode | Purpose | VEFF ID | Bytes | SHA-256 |
|---|---|---|---:|---|
| state 4 / `0x10` | localized Radiant Plume | `0Xv7Tfift_eish2` | 28,908 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` |
| state 5 / `0x20` | Eruption pre-impact ground formation | `2Jckltift_skleb` | 17,952 | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` |

The earlier live `m999` probe used HEAD `1024`, not the donor's HEAD `0`, and sent `0x20` through the packet's `breakage` field rather than `mode`. That negative test never reached the state-5 resource lookup and does not exclude this asset.

## 1. Exact authored layer names and timing-like fields

The `0x38`-byte per-group records contain three large raw fields at DWORD indices 8, 9, and 10. Their exact semantic field names still require the serializer's property-name join. The values strongly behave as authored timing fields, and division by the client time scale of 100,000 gives the seconds shown below. The table deliberately retains all three raw words instead of prematurely calling them start/end/lifetime.

### Eruption state 5

| Layer | Original authored name | raw word 8 | raw word 9 | raw word 10 | seconds at 100,000 units/s |
|---:|---|---:|---:|---:|---|
| 1 | `Root` | `0x7fffffff` | 0 | `0x7fffffff` | sentinel / 0 / sentinel |
| 2 | `地面亀裂（加算）Loop` | 310,000 | 80,000 | 20,000 | 3.10 / 0.80 / 0.20 |
| 3 | `予兆発生ディストーション` | 255,000 | 0 | 300,000 | 2.55 / 0 / 3.00 |
| 4 | `マスター発生（頂点）` | 80,000 | 0 | 50,000 | 0.80 / 0 / 0.50 |
| 5 | `噴射プレート４` | 80,000 | 0 | 50,000 | 0.80 / 0 / 0.50 |
| 6 | `亀裂（減算）` | 115,000 | 0 | 115,000 | 1.15 / 0 / 1.15 |

English glosses:

- `地面亀裂（加算）Loop`: ground crack (additive), loop;
- `予兆発生ディストーション`: telegraph-spawn distortion;
- `マスター発生（頂点）`: master spawn (vertex);
- `噴射プレート４`: spray plate 4;
- `亀裂（減算）`: crack (subtractive).

The `3.10 s` looping ground crack and `3.00 s` telegraph distortion line up with the command's approximately three-second cast. This is direct asset evidence for a warning envelope, independent of the English command label and independent of the already-known WSS3 impact.

### Radiant Plume state 4

| Layer | Original authored name | raw word 8 | raw word 9 | raw word 10 | seconds at 100,000 units/s |
|---:|---|---:|---:|---:|---|
| 1 | `Root` | `0x7fffffff` | 0 | `0x7fffffff` | sentinel / 0 / sentinel |
| 2 | `フィールドフラッシュ` | 150,000 | 0 | 50,000 | 1.50 / 0 / 0.50 |
| 3 | `溶岩フィールド淵（ループ）` | 220,000 | 0 | 50,000 | 2.20 / 0 / 0.50 |
| 4 | `溶岩フィールド（ループ）` | 180,000 | 0 | 50,000 | 1.80 / 0 / 0.50 |
| 5 | `かげろうモドキ` | 220,000 | 0 | 300,000 | 2.20 / 0 / 3.00 |
| 6 | `黒グロウフィールド（ループ）` | 220,000 | 0 | 300,000 | 2.20 / 0 / 3.00 |
| 7 | `溶岩フィールド淵` | 265,000 | 0 | 300,000 | 2.65 / 0 / 3.00 |
| 8 | `溶岩フィールド` | 70,000 | 0 | 300,000 | 0.70 / 0 / 3.00 |
| 9 | `黒グロウフィールド` | 110,000 | 0 | 300,000 | 1.10 / 0 / 3.00 |
| 10 | `シリンダーソニック` | 110,000 | 300,000 | 130,000 | 1.10 / 3.00 / 1.30 |
| 11 | `ディストーション` | 110,000 | 0 | 300,000 | 1.10 / 0 / 3.00 |

English glosses include field flash, looping lava-field edge, looping lava field, heat-haze-like, looping black glow field, lava-field edge, lava field, black glow field, cylinder sonic, and distortion.

These are eleven internal authored visual layers in **one localized Plume package**. They are not eleven world helpers and are not an arena placement table.

## 2. Eruption terrain binding is executable-confirmed

The Eruption class table contains `Position3DMapBind:CoordRoot` and two primary graph records join to it:

| node | primary record | linked channel slice | auxiliary slice | secondary tail |
|---:|---:|---|---|---|
| 6 | `0x1364` | `0x17B8`, count 8 | `0x3D70`, count 9 | `0x2128`, count 2 |
| 18 | `0x1514` | `0x1938`, count 14 | `0x3E10`, count 9 | `0x2154`, count 2 |

The executable's fixed Qix registry record for this exact class is at `0x013180D4`:

| Registry field | Value |
|---|---|
| class string | `Application/Scene/Vfx/RaptureQixControl/QixControl/Controls/Position3DMapBind:CoordRoot` |
| base class | `AbstractPosition3D` |
| initialize | `0x00D7E200` |
| update/evaluate | `0x00D7E370` |
| output binding | `0x00D7E240` |
| diagnostic display | `0x00D7E2C0` |
| runtime object size | `0x44` |

### Initialization at `0x00D7E200`

The object initializes:

```text
dirty flag (+0x2C) |= 1
output XYZ (+0x10,+0x14,+0x18) = 0,0,0
output W   (+0x1C) = 1.0
cached fields (+0x20,+0x24,+0x28) = 0
```

### Evaluation at `0x00D7E370`

The update path:

1. reads the linked position input through object field `+0x30`;
2. obtains the owner/world transform;
3. transforms the source point into the owner's world space;
4. when its dirty flag is set, raises the sample origin by `+2.0` Y and performs the battlefield ground query;
5. if that query misses, raises it by another `+2.0` and retries;
6. caches the returned ground-height adjustment at object `+0x24` and clears the dirty bit;
7. combines that cached adjustment with the owner transform and linked input to publish the final output position.

This explains why a compatible instantiated owner and a valid battlefield collision scene are required. The node is not merely an always-visible 2D overlay.

### Battlefield query at `0x00D85800`

The exact ground query used by MapBind:

- fails cleanly when the scene query manager is unavailable;
- holds X and Z fixed at the supplied point;
- starts its vertical segment at supplied `Y + 0.01`;
- ends the segment at supplied `Y - 200.0`;
- uses collision/query channel or tag `0x1E`;
- returns the hit result and world position through its output structure.

Combined with the caller's `+2.0` origin lift and one `+2.0` retry, this is a genuine terrain-conforming floor effect. It is exactly the kind of implementation required for Eruption art to sit on uneven battlefield geometry without being part of the battlefield model itself.

The VEFF also contains `Position3DMapBindGenerated:GendNormal:CoordLocal`. Its runtime object is `0x74` bytes, retains generated trajectory vectors, advances animation time, performs a dirty terrain query, and publishes the generated position. The presence of both fixed MapBind and generated-normal MapBind is consistent with stationary ground cracks plus emitted rock/fire elements.

## 3. Static Position, Angle, and Scale runtime layouts

The retail Qix base functions establish the correct defaults and linked-input behavior:

| Control | init function | default output XYZ/W | linked input | evaluation behavior |
|---|---:|---|---|---|
| `AbstractPosition3D` | `0x00BA4C10` | `0,0,0,1` | pointer at `+0x20` | copies linked float3; optional transform at `+0x24` |
| `AbstractAngle3D` | `0x00BA5500` | `0,0,0,1` | pointer at `+0x20` | copies linked float3; optional angle transform at `+0x24` |
| `AbstractScale3D` | `0x00BA5DF0` | `1,1,1,1` | pointer at `+0x20` | copies linked float3; optional transform at `+0x24` |

The pure-world Position variant initializes its cached base vector to `-1` sentinels, obtains the actor/world base position on first evaluation, and adds the linked float3. This proves that an all-zero serialized vector has different meaning for Position/Angle than for Scale; Scale's identity is `(1,1,1)`.

The nested serialized property pools contain a mixture of:

- actual floats such as `0.75`, `0.25`, `1.0`, `1.10`, and uniform `1.29`/`1.295` triples;
- an exact `0.017453292` value (one degree in radians);
- small signed values and animation coefficients;
- time-domain integers such as `20,000`, `60,000`, `80,000`, `115,000`, `255,000`, and `310,000`;
- file-relative offsets and serializer tags such as `0x100`, `0x200`, `0x300`, `0x301`, and `0x302`.

Therefore the `0x0C` pools cannot be decoded as an array of float3 positions. The new recursive extraction follows exact offset/count relationships and emits every leaf as raw DWORD, signed integer, and float, but leaves the record's first word untyped until the remaining runtime-property join is proven.

## 4. Radiant Plume placement conclusion

Plume state 4 contains Position, Angle, Scale, Draw, color, lava-field, glow, heat-haze, and distortion controls. It does **not** contain:

- `Position3DMapBind`;
- `ManyGenerateUnitTime`;
- `ManyGenerateFormSphere`;
- `ManyGenerateMotionEmission`;
- `ManyGenerateDrawLine`;
- an arena-wide authored helper-placement list.

One `m999/e001` state-4 owner therefore produces one localized authored Plume package around that owner's transform. The retail floor pattern must come from multiple stationary origins or from a higher-level battlefield/cast scheduler that creates those origins. No such higher-level arena coordinate array has yet been confirmed in the state-4 VEFF itself.

Reconstructed native-helper invocation:

```text
create exact m999/e001 helper at one plume origin
-> instantiate and publish ACTIVE
-> opcode 0x0144 mode edge 0x00 -> 0x10
-> command 23595 / native m999 WSS4 SubStatusKick
-> init_msb4_1 -> msb4 -> localized Plume VEFF
-> hold through telegraph interval
-> mode edge 0x10 -> 0x00
-> another SubStatusKick -> init_msb4_0 cancellation
-> delayed helper cleanup
```

No Ifrit target is required. The helper is the owner. For an arena pattern, repeat this with one helper per required plume origin while keeping the command's combat target logic separate from VFX ownership.

## 5. Eruption warning versus impact

Keep these resources separate:

| Phase | Owner/resource | Purpose |
|---|---|---|
| warning begins | `m999/e001`, mode `0x20`, committed by SubStatusKick | terrain-bound ground crack and telegraph distortion |
| warning persists | `init_msb5_1` / `msb5` state | approximately three-second pre-impact formation |
| warning clears | mode `0`, committed by SubStatusKick | `init_msb5_0` cancels state-5 scheduler |
| damage/impact | command `23594`, packed `0x13003000`, native m999 WSS3 | live-confirmed large Eruption impact |

Native m999 WSS2 remains a smaller impact package. It is not the requested three-second warning.

A stationary target versus immediately moving target test should behave as follows:

- if the warning is owned by a stationary snapshot helper, it remains at cast-start coordinates;
- if it is owned directly by the target player, the owner transform can continue to move even though MapBind caches its terrain adjustment;
- if the client creates an internal frozen proxy, scheduler/actor creation logs will expose a separate owner or world transform.

The file and runtime decomp prove that a stationary helper can provide the required frozen placement. They do not yet prove the exact retail helper spawn packet/model used by Square Enix.

## 6. Infernal Nail: separate spawn and defeat animations

The Nail uses model `m524`, not either m999 ground-state effect.

### Spawn / rise

Exact appearance and owner:

```text
model m524
base 10524
BODY 1024 / e001
HEAD 2048 / e002
ACTIVE
Nail is its own animation owner
```

Invocation:

```text
queue opcode 0x0144 mode 0x10 on the Nail
-> command 23366 / battle animation 0x13001000
-> native m524 WSS1, caster-side X00
-> cbbm_sp_01 starts at 0.000 s
-> m524_0001_cas VFX and sound start at about 0.220 s
-> cbxs_st0to1 starts at about 0.610 s
-> SubStatusKick commits init_msb4_1 at about 0.860 s
-> cbxs_st1 selected at about 0.900 s
-> authored rise reaches raised position around frame 55 / 1.833 s
-> raised transform holds through frame 90 / 3.000 s
```

Do not target Ifrit for this. The Nail should own and cast the animation on itself. Do not use the self-result X01 branch as a replacement for the persistent spawn chain.

### Defeat / collapse

Defeat is not WSS1 and is not an immediate delete:

```text
lethal damage
-> opcode 0x0134 MAIN_STATE_DEAD
-> normal actor death animation-result pair
-> active m524/e002 model package selects native dead scheduler
-> cancel init_msb4_1 aura
-> cbxs_st1to0
-> m524_ded VFX/action and cbbm_ded collapse
-> target unlock at about 0.250 s
-> cbbm_dedpose selected at about 0.300 s
-> scheduler envelope ends about 0.990 s
-> keep corpse for effect completion; approximately four seconds is sufficient
-> despawn
```

The `cbbm_ded` root sinks about `-5.500414` and the spike chains contract to roughly `0.85–0.93` scale, making it a real authored collapse into the ground. If a temporary server-side `+6.0` height workaround is active, reset it before death or the native sink can finish above the floor.

## 7. Schema correction to the previous graph report

The earlier graph report correctly recovered the VEFF's allocation boundaries, class-string joins, node counts, and graph keys. Its executable-side type proof needs one correction:

- executable RTTI structures with serialized strides `0x18` and `0x24` exist elsewhere in the VFX resource system;
- matching a stride alone does **not** prove that the VEFF `0x18` class table is `ResourceID` or that the VEFF `0x24` graph rows are `ModelChunkInfo`;
- the graph rows are supported as class metadata and control rows by their own contents: exact Qix class-string references, valid class indices, paired control-record counts, channel slices, and graph keys;
- the model-attribute and instance-attribute RTTI structures describe nested VFX resource formats and must not be used as type aliases for these graph arrays merely because their byte sizes coincide.

This correction changes no invocation conclusion. It tightens the evidence boundary and prevents an unrelated serializer structure from being mistaken for a graph-node schema.

## 8. Confirmed, strongly reconstructed, and unresolved

Confirmed from retail assets and executable:

- state 5's Eruption-specific authored layer names;
- the `3.10 s` ground-crack and `3.00 s` telegraph timing-scale match;
- two state-5 `Position3DMapBind:CoordRoot` graph records;
- the MapBind runtime object layout and vertical battlefield query;
- state 4's Plume-specific lava-field/glow/distortion layer names;
- the absence of MapBind and `ManyGenerate*` classes in Plume state 4;
- Position/Angle/Scale runtime defaults;
- m999 mode `0x10` / state 4 and mode `0x20` / state 5 resource selection;
- command `23594` / WSS3 as the live large Eruption impact;
- Nail WSS1 spawn and model-native DEAD defeat as separate paths.

Strong reconstructed implementation, awaiting a rendered validation frame:

- exact-appearance stationary `m999/e001` helper plus mode `0x20` and a real SubStatusKick visibly produces Eruption warning;
- the same helper plus mode `0x10` visibly produces one localized Plume;
- clearing mode and kicking again cancels each state at the intended time.

Still unresolved:

- the exact retail helper/proxy model and spawn packet, if different from the compatible m999/e001 donor;
- the retail scheduler parent that snapshots the Eruption target coordinate;
- final semantic names/order for timing-like DWORDs 8–10;
- final join of every sparse numeric property leaf to a named Position/Angle/Scale control;
- retail Plume helper count and arena coordinate list;
- a live screenshot/capture from the corrected `mode`, correct HEAD `0`, and genuine SubStatusKick probe.

## 9. Reproducible artifacts

Correct authored-layer extraction:

- `tools/extract_ifrit_veff_layer_timing_v2.py`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_layer_timing_v2.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_layer_value_descriptors_v2.csv`

Interpretation-neutral recursive property walk:

- `tools/extract_ifrit_veff_property_chains_v2.py`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_property_descriptor_chains_v2.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_property_leaf_values_v2.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_property_chain_summary_v2.json`

Graph topology and class joins:

- `tools/extract_ifrit_veff_serialized_graph.py`
- `tools/extract_ifrit_veff_link_keys.py`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_allocation_table.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_node_records.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_class_records.csv`

Executable evidence was decompiled from these retail addresses:

- MapBind registry `0x013180D4`;
- MapBind functions `0x00D7E200`, `0x00D7E240`, `0x00D7E2C0`, `0x00D7E370`;
- ground query `0x00D85800`;
- Position base functions `0x00BA4C10` through `0x00BA4D60`;
- Angle base functions `0x00BA5500` through `0x00BA55A0`;
- Scale base functions `0x00BA5DF0` through `0x00BA5E90`.

The preliminary non-v2 timing CSV and property-chain CSV headings are superseded by the `v2` outputs named above.

No game DAT, executable, server source, encounter script, database, or packet definition was modified by this decomp pass.
