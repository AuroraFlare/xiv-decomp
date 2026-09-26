# Ifrit QIX control-module registry decomp

Date: 2026-08-05  
Client: retail FFXIV 1.23b, `2012.09.19.0001`  
Scope: determine what Eruption static-link selector `0xA` indexes and prevent a false static-table name join.

## Result

The selector in `0x100A0000` indexes a **runtime QIX Context control-module array**, not a fixed executable address and not the VEFF's 17-row serialized class table.

The decisive client routines are:

| Function | retail VA | result |
|---|---:|---|
| `SQEX::CDev::Engine::Vfx::Qix::Context::Context` | `0x00BAD5D0` | initializes the context; module base at `Context+0x04` and module count at `Context+0x14` begin as zero |
| `SQEX::CDev::Engine::Vfx::Qix::Context::SetControlModules_` | `0x00BADE00` | appends supplied control-module templates into a runtime array of `0xE8`-byte records, rebuilds its map, assigns indices, and patches inheritance links |
| `ControlNode::ResolveStaticLink` | `0x00BDBF10` | resolves class-1 selector `N` as `Context.module_base + N * 0xE8` |
| `ControlNode::GetControlModuleOfStaticLink` | `0x00BDC520` | returns the same selected runtime module record |

Consequently:

```text
0x100A0000
  top nibble 1  = CODE_NULL / module-provider resolution path
  bits 16..27   = runtime module index 10
  low 16 bits   = 0
```

The identity of runtime module 10 depends on the exact template append order used to initialize this client context. That order is not encoded in the key itself.

## 1. QIX Context layout proved by constructor

The constructor at `0x00BAD5D0` initializes these fields:

| Context offset | initial value | role |
|---:|---:|---|
| `+0x04` | `0` | runtime control-module array base |
| `+0x14` | `0` | runtime module count |
| `+0x0C` | `0x01304350` | family-control information table |
| `+0x10` | `0x01304F50` | related family/control table |
| `+0x1C` | `0x40` | family/control entry count |
| `+0xAC` | `0` | per-control scratch storage, allocated after modules are installed |
| `+0x114` | `0` | control-module lookup map |

This joins directly to the resolver. `ResolveStaticLink` follows its owner to the QIX Context and reads the pointer at Context `+0x04` before applying the `0xE8` selector stride.

## 2. Exact `SetControlModules_` behavior

`0x00BADE00` takes the existing Context, a source template block, and a source module count. It performs:

```text
new_count = old_count + source_count
new_base = allocate(new_count * 0xE8)
copy new_base[0 .. old_count) from old_base
free old_base
copy new_base[old_count .. new_count) from supplied templates
Context.module_base = new_base
Context.module_count = new_count
destroy/recreate Context module lookup map
for each runtime module:
    module.runtime_index (+0xE4) = array index
    insert key at module +0x5C into the lookup map
allocate Context scratch storage using max(module field +0x2C - 0x10)
for each runtime module with a parent/reference key at +0x64:
    look the referenced module up in the map
    patch module inheritance/provider pointer at +0xE0
```

This explains the resolver's behavior at `0x00BDBF10`: its `+0xE0` walk is traversing pointers that were patched after the template blocks were appended. Small values found at `+0xE0` in the on-disk executable templates are not live pointers and must not be interpreted as the final runtime chain.

## 3. Why static address arithmetic is insufficient

The executable contains multiple valid `0xE8`-stride template runs.

One core-engine run begins at `0x013002BC` and contains 55 contiguous controls before its first non-control record:

| local index | template |
|---:|---|
| 0 | `AbstractPosition3D` |
| 1 | `AbstractAngle3D` |
| 2 | `AbstractScale3D` |
| 3 | `AbstractMatrix3D` |
| 4 | `AbstractColorRGB` |
| 5 | `AbstractColorRGBA` |
| 10 / `0xA` | `ColorRGBALeaf` |

An Application control run contains, among many others:

| static address | template |
|---:|---|
| `0x01316204` | `ForGenerateReferenceGenerateMaster` |
| `0x01316B14` | `Position3DBound:GendNormal:CoordPureWorld` |
| `0x013180D4` | `Position3DMapBind:CoordRoot` |

Using `0x01316204` as an assumed base would make local index `0xA` look like `Position3DBound:GendNormal:CoordPureWorld`. Using the core run's true local base would make index `0xA` look like `ColorRGBALeaf`. Both calculations are internally aligned, but neither establishes that its chosen block occupies runtime Context slots 0 through 10.

`SetControlModules_` can append more than one template block. The runtime index is the concatenated append index. The caller-provided append order therefore has to be recovered or captured before selector 10 can be named.

This explicitly rejects three unsafe labels for `0x100A0000`:

- it is not automatically VEFF serialized class-table row 10 (`AbstractScale3D`);
- it is not automatically Application-block local row 10 (`Position3DBound:GendNormal:CoordPureWorld`);
- it is not automatically core-block local row 10 (`ColorRGBALeaf`).

## 4. What remains confirmed for Eruption

The correction does not weaken the recovered effect path.

Eruption state 5 still contains two exact `Position3DMapBind:CoordRoot` consumers. Their serialized static-link rows remain:

| consumer | input | key | confirmed resolution class |
|---:|---:|---|---|
| MapBind record 6 | 0 | `0x10000000` | runtime module-provider index 0 |
| MapBind record 6 | 1 | `0x10000000` | runtime module-provider index 0 |
| MapBind record 18 | 0 | `0x100A0000` | runtime module-provider index 10 |
| MapBind record 18 | 1 | `0x00010000` | producer instance 1, output slot 0 |

`Position3DMapBind` itself is executable-confirmed to transform its linked source, lift the query origin by `+2.0` Y, perform a vertical battlefield collision query, retry once after another `+2.0` lift on a miss, cache the floor adjustment, and publish the terrain-conformed world position.

Thus the visible sequence remains:

```text
stationary exact m999/e001 owner at target snapshot
-> mode 0x20 plus a real SubStatusKick
-> init_msb5_1 / state-5 Eruption warning VEFF
-> runtime static-link resolution
-> terrain-conforming MapBind evaluation
-> warning held through the approximately three-second cast
-> mode clear plus kick
-> command 23594 / m999 WSS3 impact
```

Plume remains mode `0x10` on one stationary m999/e001 owner per desired origin. Infernal Nail remains m524 WSS1 for spawn and model-native DEAD scheduling for defeat.

## 5. Exact breakpoint that closes module 10

No broad packet capture is required to name this one field. On one state-5 scheduler creation, break at `0x00BDBF10` when the raw key equals `0x100A0000` and record:

```text
ControlNode
QIX Context pointer
Context +0x04 module_base
Context +0x14 module_count
module10 = module_base + 0xA * 0xE8
module10 +0x00 class/name pointer
module10 +0x08 base-class pointer/name
module10 +0x5C lookup key
module10 +0x64 parent/reference key
module10 +0xD8 fallback/provider
module10 +0xE0 patched inheritance pointer
resolved source pointer written into the consumer
```

The class string at `*(module10 + 0x00)` will identify the provider immediately. Logging whether the destination is the resolver's `+0x34` ordinary-static-link array or `+0x3C` self-local/expression-link array will also close the class-1 null-versus-provider behavior for these exact Eruption rows.

## Evidence files

- `C:/tmp/ifrit_qix_context_registry_decomp.txt`
- `C:/tmp/ifrit_qix_static_link_decomp.txt`
- `C:/tmp/ifrit_core_registry_0_10.txt`
- `C:/tmp/ifrit_application_registry_selector10.txt`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_static_links_v2.csv`

The temporary decompiler listings are evidence inputs; the durable conclusion is this Markdown report and the v2 decoded-link CSV.
