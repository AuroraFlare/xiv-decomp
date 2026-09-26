# Ifrit QIX ControlInstance and Dual-Link-Vector Decomp

Date: 2026-08-05  
Client: retail FFXIV 1.23b  
Source asset: `client/chara/mon/m999/equ/e001/met_mdl/0001`  
SHA-256: `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105`

## Outcome

The retail loader proves that each ordinary serialized `0x24` control record
is paired by index with one serialized `0x1C` link/control-instance record.
This is no longer only a mechanical same-count join.

The `0x1C` side contains two valid QIX-key vectors:

- head vector: pointer/count at record offsets `+0x00/+0x04`
- tail vector: pointer/count at record offsets `+0x14/+0x18`

The earlier v2 extraction exported only the tail vector. The complete source
inventory is 150 keys, not 85.

| State | Package | Paired controls | Head keys | Tail keys | Total |
|---:|---|---:|---:|---:|---:|
| 4 | localized Radiant Plume | 64 | 44 | 53 | 97 |
| 5 | Eruption pre-impact | 33 | 21 | 32 | 53 |

The exact source vector is now preserved in:

- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_static_link_vectors_v4.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_static_link_vectors_v4_summary.json`

Reproducer:

- `tools/extract_ifrit_veff_link_vectors_v4.py`

## Retail construction chain

### `Data::ControlInstance`

`ffxivgame.exe` `0x00BD20C0` initializes the relocatable control-instance
wrapper:

```text
+0x00 relocatable/static-link-data pointer
+0x04 pointer-fixup flag (byte)
+0x08 control-data pointer
+0x0C control-node work-buffer offset, initially zero
+0x10 random-extension work-buffer offset, initially zero
+0x14 serialized 16-bit selector/ordinal
```

The unique pointer fixup is `0x00BD20F0`. Its only direct call is at
`0x00BD2E06`, inside the relocation pass beginning at `0x00BD2D90`. That pass
walks the control-instance array in `0x1C`-byte steps and adds the resource
base to the relocatable pointer.

Accessors/setters recovered:

| Address | Operation |
|---|---|
| `0x00BD2100` | get control-data pointer (`+0x08`) |
| `0x00BD21C0` | get control-node work-buffer offset (`+0x0C`) |
| `0x00BD2220` | set control-node work-buffer offset |
| `0x00BD2290` | get random-extension work-buffer offset (`+0x10`) |
| `0x00BD22F0` | set random-extension work-buffer offset |

The compiler construction thunk is `0x00BAC620`. Its direct construction
sites are `0x00BD175D` and `0x00BD453C`.

### `Data::UnitData`

The main loader is `0x00BD2660`; the compiler thunk is `0x00BAC670`.
The loader constructs two independent graph-module lists and records their
work-buffer placements. It distinguishes them with a final type argument of
`0` versus `1` to `0x00BE7D50`.

The loader also validates the module against the two context registries:

| Registry path | Count accessor | Base accessor |
|---|---|---|
| first module family | `0x00BAC8D0` (`Context+0x1C`) | `0x00BAC930` (`Context+0x0C`) |
| second module family | `0x00BAC8E0` (`Context+0x1C`) | `0x00BAC940` (`Context+0x10`) |

The retail diagnostic is `[Data::UnitData] unknown random graph module.`

### Lockstep pairing proof

The builder beginning at `0x00BD13B0` uses one shared control count for both
tables:

- first construction loop advances `0x24` bytes per control
- second construction loop advances `0x1C` bytes per control
- the later `ControlInstance` construction loop advances the `0x1C` table and
  its per-control source table together

Therefore control record `N` on the `0x24` side owns/control-pairs with record
`N` on the `0x1C` side. Records 0 and 1 remain resource/container prefixes;
ordinary controls begin at record 2.

## Resolver relationship

`ControlNode::ResolveStaticLink` is `0x00BDBF10`.
`ControlNode::GetControlModuleOfStaticLink` is `0x00BDC520`.

The established key encoding remains:

| Top nibble | Meaning |
|---:|---|
| `0` | producer instance in bits 16..27, producer output slot in bits 0..15 |
| `1` | context control-module/provider lookup; the alternate local branch can resolve null |
| `2` | external/context lookup with class-1 fallback |
| `3` | invalid/unhandled error path |

The loader compacts the two serialized source vectors before the resolver
writes resolved pointers into the control work buffer at class metadata
offsets `+0x34` and `+0x3C`. The last unresolved type-name question is which
serialized vector becomes which runtime destination. The v4 dump deliberately
labels them `head_00_04` and `tail_14_18` instead of guessing
"ordinary" versus "expression."

This remaining naming issue does **not** block the Eruption MapBind wiring:
both MapBind controls have no head vector at all.

## Exact Eruption MapBind inputs

State 5 contains two controls of class:

```text
Application/Scene/Vfx/RaptureQixControl/QixControl/Controls/
Position3DMapBind:CoordRoot
```

### Paired control record 6

```text
head_00_04: absent
tail_14_18[0]: 0x10000000
tail_14_18[1]: 0x10000000
```

Both inputs use the class-1 control-module/provider branch with selector 0.

### Paired control record 18

```text
head_00_04: absent
tail_14_18[0]: 0x100A0000
tail_14_18[1]: 0x00010000
```

- input 0 uses the class-1 control-module/provider branch, selector `0xA`
- input 1 selects producer instance 1, output slot 0

Selector `0xA` indexes the dynamic `Context` module array assembled by
`Context::SetControlModules_`; it must not be assigned a semantic class name
from static PE table order alone.

The MapBind runtime itself remains confirmed:

- X and Z are retained
- the floor query begins at input Y + `0.01`
- it traces downward 200 units using channel/tag `0x1E`
- its caller raises the probe by 2 units and retries after a miss

That behavior explains why Eruption's warning conforms to the battlefield
floor even when its owner/helper is slightly above it.

## Visibility consequence

These are model-state packages, not `!playanimation` clips.

### Eruption

The visible pre-impact chain to reproduce is:

```text
snapshot targeted player's world position
-> create/position stationary m999/e001 helper at that snapshot
-> send model-state mode edge 0x00 -> 0x20
-> retain state for the cast window (about 3 seconds)
-> clear mode to 0x00
-> launch native m999 WSS3 / command 23594 impact at the same snapshot
-> despawn helper after cleanup
```

The packet field must be the model-state `mode` field. Writing `breakage`
does not trigger the package. The exact m999 carrier appearance already
recovered is base `10999`, size `2`, BODY `1024`, HEAD `0` (appearance
`1001481`).

The owner should be a stationary helper at the frozen target coordinate. The
target does not need to be Ifrit, and the warning should not be attached to a
moving player if retail snapshot behavior is desired.

### Radiant Plume

State 4 uses mode `0x10` on the same m999/e001 carrier. One owner produces one
localized plume package. The full arena pattern therefore requires multiple
stationary helpers/placements, each receiving its own `0x00 -> 0x10` edge.
State 4 has no `Position3DMapBind`; placement height should be snapped by the
server/helper placement path before the edge is sent.

The player does not need to target Ifrit. The helper owns the ground visual.

### Infernal Nail

Nail remains a separate model/state path:

- carrier: m524, BODY `1024`, HEAD `2048` / e002
- spawn/presentation: mode `0x10` plus WSS1 / command `23366`
- defeat: opcode `0x0134` dead-state transition, followed by the model-native
  dead scheduler

Spawn and defeat must be sent as separate transitions; replaying WSS1 is not
the defeat animation.

## What is still needed

For implementation, the asset identity and visible state edges are sufficient
to build the first live test for Eruption, localized Plume, and Nail
spawn/defeat. The main remaining work is empirical timing/cleanup validation,
not finding a different animation:

1. verify helper creation and m999/e001 appearance are accepted by the live
   client
2. log `0x00BD20F0`, `0x00BDBF10`, and scheduler creation while mode `0x20`
   is applied
3. compare a stationary target with a target moving 8-10 yalms to confirm the
   helper remains at the snapshot
4. tune helper clear/despawn timing around command `23594`
5. repeat mode `0x10` with several helpers to confirm the arena Plume layout

Do not spend more time trying `!playanimation` for these ground formations.
That command addresses WSS animation selection, while the packages being
recovered here are model-state-driven QIX VFX graphs.
