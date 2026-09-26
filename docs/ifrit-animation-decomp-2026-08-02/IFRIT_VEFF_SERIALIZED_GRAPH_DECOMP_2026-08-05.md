# Ifrit Plume and Eruption VEFF serialized-graph decomp

Date: 2026-08-05  
Scope: retail FFXIV 1.23b `m999/e001` state 4 Radiant Plume and state 5 Eruption pre-impact VEFF allocation tables, paired control records, class joins, and serialized graph keys. Infernal Nail spawn/defeat remains included as a separate invocation chain.

## Result

The complete serialized graph-allocation tables for both effects are now recovered and reproducible:

- Plume state 4 has 152 valid `{data offset, count, stride}` descriptors from file offset `0x428` through `0xB47`. The next bytes at `0xB48` are the literal `RGBA`.
- Eruption state 5 has 90 valid descriptors from `0x4C0` through `0x8F7`. The next bytes at `0x8F8` are also `RGBA`.
- Every descriptor has a nonzero offset/count/stride and its computed range remains inside its VEFF payload.
- The root joins 66 primary plus 66 secondary Plume records into 12 graph groups, and 35 plus 35 Eruption records into 7 graph groups.
- The first two primary records in each pool are resource/container prefixes. The mechanically joinable control totals are therefore 64 for Plume and 33 for Eruption.
- The control-record class indices now join to known Position/Angle/Scale/MapBind/Draw class literals.
- The secondary records expose 85 exact graph-key entries across the two states. Plain keys split mechanically into high-16 group ID and low-16 port ID. The remaining high-flag keys are preserved raw.

The apparent 12-byte and 36-byte blocks are **not** simple arrays of XYZ transforms. They contain offsets, counts, class indices, tagged keys, sentinels, and shared-pool references. Treating every 12-byte row as three floats would manufacture coordinates that the file does not assert.

This pass closes the file allocation topology and most of the type join. It does not yet prove the semantic direction of every graph edge or turn every property-pool word into a named static Position/Rotation/Scale value.

## 1. Source identity

Container:

`client/chara/mon/m999/equ/e001/met_mdl/0001`

| bytes | SHA-256 |
|---:|---|
| 616,360 | `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105` |

Inner effects:

| state | purpose | VEFF | bytes | SHA-256 |
|---:|---|---|---:|---|
| 4 / mode `0x10` | localized Radiant Plume package | `0Xv7Tfift_eish2` | 28,908 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` |
| 5 / mode `0x20` | Eruption pre-impact formation | `2Jckltift_skleb` | 17,952 | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` |

## 2. Header and allocation-table boundary

Both payloads begin with `SEDBveff`. Relevant raw header values are:

| field | Plume state 4 | Eruption state 5 |
|---|---:|---:|
| payload size at `0x10` | `0x70EC` | `0x4620` |
| raw value at `0x38` | `0x0001002D` | `0x00010034` |
| raw value at `0x3C` | `0x00020004` | `0x00020004` |
| raw value at `0x40` | `0x1C` | `0x1C` |
| raw value at `0x44` | `0x18` | `0x18` |
| root object offset at `0x48` | `0x1170` | `0x1090` |

The graph-allocation descriptor table is later in the metadata region:

| state | table start | entries | bytes | last descriptor byte | following literal |
|---:|---:|---:|---:|---:|---|
| 4 | `0x428` | 152 | `0x720` | `0xB47` | `RGBA` at `0xB48` |
| 5 | `0x4C0` | 90 | `0x438` | `0x8F7` | `RGBA` at `0x8F8` |

Each descriptor is three little-endian DWORDs:

```text
DWORD data_offset
DWORD element_count
DWORD element_stride

end = data_offset + element_count * element_stride
```

The boundary checks succeed for all 242 descriptors. The tables are not heuristic scans; their entry arithmetic ends exactly at the next string section in both independently authored graphs.

## 3. Root array map

The root object's offset/count pairs give this exact high-level structure:

| root field | Plume state 4 | Eruption state 5 |
|---|---|---|
| model-resource records | `0x127C`, count 6 | `0x119C`, count 5 |
| texture-resource records | `0x130C`, count 6 | `0x1214`, count 5 |
| primary control records | `0x139C`, 66 x `0x24` | `0x128C`, 35 x `0x24` |
| secondary control records | `0x27AC`, 66 x `0x1C` | `0x1CF0`, 35 x `0x1C` |
| per-group seven-slot records | `0x3070`, 12 x `0x38` | `0x219C`, 7 x `0x38` |
| per-group 18-word records | `0x5674`, 12 x `0x48` | `0x3600`, 7 x `0x48` |
| class/type metadata records | `0x59D4`, 12 x `0x18` | `0x37F8`, 17 x `0x18` |
| root auxiliary records | `0x5AF4`, 3 x `0x18` | `0x3990`, 3 x `0x18` |
| root auxiliary record | `0x5B3C`, 1 x `0x54` | `0x39D8`, 1 x `0x54` |

The paired primary/secondary counts and the equal group-array counts are independent consistency checks. The graph is serialized in parallel record pools rather than as one pointer-rich runtime object per node.

## 4. Control-record class joins

The second DWORD in a meaningful `0x24` primary record is a class/type-table index. Joining it to the `0x18` metadata table recovers these directly identifiable control populations.

### Plume state 4

| class/type literal | control records |
|---|---:|
| `DrawResource` | 11 |
| `AbstractColorRGBA` | 10 |
| `AbstractPosition3D` | 9 |
| `AbstractAngle3D` | 11 |
| `AbstractScale3D` | 11 |
| `Position3D:CoordRoot` | 2 |
| unnamed/special table index 0 | 10 |
| **total** | **64** |

This is consistent with the 11 `Default` draw literals already found in the Plume graph. It also makes the distinction important: 11 draw/control layers are internal to one authored Plume VEFF; they are not 11 network-spawned world helpers.

### Eruption state 5

The identifiable records include:

| class/type literal | control records |
|---|---:|
| `ColorRGBARoot:CoordRoot` | 6 |
| `Position3DMapBind:CoordRoot` | 2 |
| `AbstractPosition3D` | 4 |
| `DrawResource` | 3 |
| `AbstractColorRGBA` | 2 |
| `AbstractMatrix3D` | 4 |
| `Position3D:CoordRoot` | 1 |
| `Angle3D:CoordLocal` | 1 |

The remaining ten records use special, unnamed, or source-path-bearing metadata entries and are preserved raw. The full VEFF literal inventory still independently contains `Position3DMapBindGenerated:GendNormal:CoordLocal`, `GenerateMaster`, and `jLoop`.

The two serialized `Position3DMapBind:CoordRoot` records are new structural confirmation that Eruption is a terrain-aware formation. Plume has no MapBind class or literal.

## 5. Serialized graph keys

The secondary `0x1C` records contain a tail offset/count pair in words 5 and 6. Following every nonzero pair recovers exact 32-bit keys.

### Plume

Plume has 53 secondary tail keys:

- 41 plain group/port keys;
- 12 `0x10000000` unbound/default sentinels;
- no other high-flagged key in these tail arrays.

The plain keys cover:

| group | observed ports |
|---:|---|
| 1 through 8 | `0,1,2,3,4` for each group |
| 9 | `1` in the secondary tail array |

The first `0x38` group-slot record additionally contains group 9 ports `0` and `4`, plus groups 10 and 11 ports `0,1,2,3,4`. That closes the later part of the authored group topology without inventing world placement coordinates.

### Eruption

Eruption has 32 secondary tail keys:

- 18 plain group/port keys;
- 12 `0x10000000` unbound/default sentinels;
- two exact `0x100A0000` special flagged keys.

The plain keys cover:

| group | observed ports |
|---:|---|
| 1 through 3 | `0,1,2,3,4` for each group |
| 4 | `1,2,3` in the secondary tail array |

The first group-slot record adds group 4 ports `0` and `4`, group 5 ports `0,1,2,3,4`, group 6 ports `0,1,2,3`, and another `0x100A0000` occurrence in that record.

For an ordinary key such as `0x00030004`, the split is mechanically:

```text
group = 0x0003
port  = 0x0004
```

The key direction is still unresolved. The CSV therefore says `direction=unresolved` rather than labelling a key parent or child without the runtime access-function proof. The graph membership and port identities themselves are exact.

## 6. Correction to the 12-byte pools

Two allocation-table entries in each state have stride `0x0C`:

| state | pool A | pool B | total rows |
|---:|---|---|---:|
| Plume 4 | `0x3400`, 72 rows | `0x3760`, 154 rows | 226 |
| Eruption 5 | `0x23A4`, 33 rows | `0x2530`, 73 rows | 106 |

These are mixed/shared serialized record pools, not proven float3 arrays. Their contents include repeated tagged values such as `0xFF010000`, file-relative offsets, counts, duration-like integers, and group/port-shaped keys. Interpreting their bits as IEEE floats produces extreme values around `-1.7e38`, which are tag encodings, not positions.

`veff_12byte_record_pools.csv` emits every row both as raw DWORDs and as floats so later schema work is reproducible, but it assigns no coordinate semantics.

## 7. Executable-side schema evidence

The retail executable's serializer/deserializer family explains why the file has this layout:

- `0x00C06940`: `FileInfo` serialized size `0x10`.
- `0x00C06A10`: `ChunkInfo` serialized size `0x08`.
- `0x00C06F70` / `0x00C07030`: `InstanceValue` serialization/deserialization. The runtime object contains seven float3 triples plus a variable `Index` object.
- `0x00C06EB0`: endian conversion touches all 21 runtime floats.
- `0x00C07310` / `0x00C07420`: `IndexGroupValue` serialization/deserialization. It stores a count, an `Index`, and six structure-of-arrays DWORD pools.
- `0x00C07940` / `0x00C07980` / `0x00C07A20`: 14-count/14-offset chunk metadata and a variable tail pool.
- `0x00C077C0`: group IDs 1 through 14 select serialized libraries at fixed offsets in the instance-attribute object.

The important distinction is that `InstanceValue` has 21 floats **after the client has deserialized it into a runtime object**. The on-disk VEFF does not expose every instance as one adjacent 84-byte float block. Its offsets, keys, and sparse arrays must first be joined through the appropriate index schema.

## 8. Visibility and implementation consequence

This deeper file work does not change the corrected native invocation chains.

### Eruption warning and impact

```text
snapshot target world XYZ
-> spawn stationary exact m999/e001 owner at that coordinate
-> opcode 0x0144 mode edge 0 -> 0x20
-> native m999 WSS4 / command 23595 state kick
-> init_msb5_1 -> msb5 -> terrain-aware Eruption formation
-> hold owner and mode for the approximately three-second cast
-> mode edge 0x20 -> 0 plus WSS4 clear kick
-> native m999 WSS3 / command 23594 large impact
-> delayed helper cleanup
```

No Ifrit target is required. The helper owns the state and supplies the frozen world placement.

### Radiant Plume

```text
spawn exact m999/e001 owner at a desired plume origin
-> opcode 0x0144 mode edge 0 -> 0x10
-> native m999 WSS4 / command 23595 state kick
-> init_msb4_1 -> msb4 -> one authored local Plume VEFF
-> hold for telegraph interval
-> mode 0 plus WSS4 clear kick
```

The 12 internal graph groups and 11 draws are not a hidden arena-wide `ManyGenerate` controller. The VEFF still contains no `ManyGenerateUnitTime`, `ManyGenerateFormSphere`, `ManyGenerateMotionEmission`, or `ManyGenerateDrawLine`. A retail ring/floor pattern therefore still needs the correct array of stationary helper origins unless a higher-level battlefield scheduler is found to create them.

### Infernal Nail spawn and defeat

Nail remains a separate pair:

```text
spawn:
m524, BODY 1024, HEAD 2048/e002, ACTIVE
-> opcode 0x0144 mode 0x10
-> command 23366 / m524 WSS1
-> rise and ignite presentation

defeat:
lethal damage
-> opcode 0x0134 MAIN_STATE_DEAD
-> generic dead scheduler selection
-> m524/e002 dead SCB collapse/death VFX
-> cbbm_dedpose/cbnm_dedpose terminal pose
-> delayed deletion
```

Do not use WSS1 as the Nail defeat animation and do not delete the Nail immediately on lethal damage.

## 9. Confirmed and unresolved

Confirmed in this pass:

- exact allocation-table offsets, counts, strides, table boundaries, and all 242 array ranges;
- root array offsets and counts for both graphs;
- 64 meaningful Plume and 33 meaningful Eruption control records;
- exact class-index joins for the known position/angle/scale/draw/MapBind controls;
- 12 Plume graph groups and 7 Eruption graph groups;
- 53 Plume and 32 Eruption secondary tail keys;
- plain high-16 group/low-16 port decomposition;
- two Eruption `0x100A0000` special tail keys;
- the 12-byte pools are not safe to label as XYZ arrays.

Still unresolved:

- semantic parent-to-child direction for each recovered graph key;
- the final sparse-index join that assigns every static numeric Position/Angle/Scale value to a named control instance;
- retail Plume world-helper origin coordinates and helper count;
- a rendered frame from the corrected exact-appearance `mode + WSS4` live probe;
- the exact retail scheduler parent that issued the mode-state kick, if it was not command 23595.

## 10. Reproducible artifacts

Scripts:

- `tools/extract_ifrit_veff_serialized_graph.py`
- `tools/extract_ifrit_veff_link_keys.py`
- `tools/build_ifrit_state_geometry_decomp.py`
- `tools/extract_ifrit_veff_root_bounds.py`

New generated files:

- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_allocation_table.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_root_array_map.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_class_records.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_class_record_counts.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_node_records.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_group_slot_records.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_secondary_tail_keys.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_12byte_record_pools.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_serialized_graph_summary.json`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_link_key_summary.json`

No client DAT, executable, encounter script, server code, packet definition, or database row was modified by this decomp pass.
