# Ifrit VEFF QIX static-link direction closure

Date: 2026-08-05  
Client: retail FFXIV 1.23b, `2012.09.19.0001`  
Scope: resolve the direction and bit layout of the serialized static-link keys in the `m999/e001` Radiant Plume state 4 and Eruption pre-impact state 5 VEFF graphs.

## Result

The retail client resolves the keys in two named functions:

| Function | retail VA | role |
|---|---:|---|
| `SQEX::CDev::Engine::Vfx::Qix::Control::ControlNode::ResolveStaticLink` | `0x00BDBF10` | replaces each serialized key owned by a control with the resolved source pointer |
| `SQEX::CDev::Engine::Vfx::Qix::Control::ControlNode::GetControlModuleOfStaticLink` | `0x00BDC520` | returns the control module selected by one static-link entry |

This closes the earlier direction ambiguity:

```text
serialized control that owns the key = consumer
plain key bits 16..27             = producer instance selector
plain key bits 0..15              = producer output/control slot
resolved edge                     = consumer input -> producer output
```

The previous description of the high 16 bits as a generic “group ID,” and the description of `0x10000000` as an unconditional unbound/default sentinel, are superseded by this runtime proof.

## 1. Exact 32-bit key layout

The resolver first computes:

```c
link_class = key & 0xF0000000;
selector12 = (key >> 16) & 0x0FFF;
selector16 = key & 0xFFFF;
```

The four implemented branches are:

| top nibble | runtime behavior | recovered meaning |
|---:|---|---|
| `0x0` | select instance `selector12` at stride `0x34`; select its output/control slot `selector16` at stride `0x24`; store source pointer `+0x10` | ordinary producer-instance output link |
| `0x1` | select control-module registry record `selector12` at stride `0xE8`; search loaded providers and their `+0xE0` inheritance chain; otherwise call a fallback or use the first `+0xD8` fallback pointer | registry/control-module provider link; diagnostic branch is named `CODE_NULL` |
| `0x2` | search the current external/context list for an entry whose 16-bit field at `+0x14` equals `selector16`; if absent, fall back through the class-1 path selected by `selector12` | fixed external/resource-instance link; diagnostic branch is named `CODE_FIXED` |
| `0x3` | emit the unsupported-code diagnostic and return/leave null | invalid or unsupported resolution code |

The retail diagnostic strings at this code are:

- `not resolve expression-link.`
- `not resolve static-link code.`
- `not resolve static-link CODE_NULL.`
- `not resolve CODE_FIXED static-link. change CODE_NULL.`
- `not resolve static-link.`
- `[vfx] この StaticLink 解決コードには対応していない`

The last message means the static-link resolution code is unsupported.

### Important class-1 nuance

`0x10000000` is not globally equivalent to “no link.” In the ordinary input resolver it requests registry/module selector 0 and follows the loaded-provider/fallback logic. In a second self-local/expression-link destination array, the resolver intentionally stores null for class-1 keys. The serialized tail-array location has not yet been joined to those two runtime destination arrays, so the v2 extraction preserves both possible class-1 behaviors instead of guessing which destination array each row occupies.

`0x100A0000` is correspondingly class 1 with registry/module selector `0xA` and slot bits 0. The `0xA` is a runtime control-module registry selector; it is **not** VEFF class-table index 10 and must not be renamed `AbstractScale3D` merely because that happens to occupy serialized class-table row 10.

## 2. Recovered Ifrit key populations

The source container remains:

`client/chara/mon/m999/equ/e001/met_mdl/0001`

SHA-256:

`c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105`

| state | semantic | total tail keys | class 0 ordinary | class 1 registry/module | class 2 | class 3 |
|---:|---|---:|---:|---:|---:|---:|
| 4 / mode `0x10` | localized Radiant Plume | 53 | 41 | 12 | 0 | 0 |
| 5 / mode `0x20` | Eruption pre-impact ground formation | 32 | 18 | 14 | 0 | 0 |

Plume's class-1 population consists of twelve `0x10000000` keys. Eruption has twelve `0x10000000` keys and two `0x100A0000` keys.

The ordinary keys are now decoded as producer-instance/output pairs rather than groups/ports:

```text
0x00030004 -> producer instance 3, output/control slot 4
0x00010000 -> producer instance 1, output/control slot 0
```

## 3. Eruption MapBind input topology

Joining the decoded rows back to their owning controls exposes these exact Eruption entries:

| serialized consumer record | consumer class | input index | key | resolved selector |
|---:|---|---:|---|---|
| 6 | `Position3DMapBind:CoordRoot` | 0 | `0x10000000` | registry/module 0 |
| 6 | `Position3DMapBind:CoordRoot` | 1 | `0x10000000` | registry/module 0 |
| 18 | `Position3DMapBind:CoordRoot` | 0 | `0x100A0000` | registry/module `0xA` |
| 18 | `Position3DMapBind:CoordRoot` | 1 | `0x00010000` | producer instance 1, output slot 0 |

Another Eruption control record, serialized record 24, also owns `0x100A0000`; its serialized class join is presently unnamed, so no semantic class name is assigned to it.

This strengthens the terrain-placement reconstruction without overclaiming the remaining registry identity:

1. Eruption's two MapBind controls are real consumers with two resolved input positions each.
2. One MapBind explicitly consumes an ordinary producer output at instance 1 / slot 0.
3. The other inputs use runtime control-module providers, including the Eruption-only module selector `0xA`.
4. `Position3DMapBind` then performs the already-decompiled vertical battlefield query and publishes the floor-adjusted world position.

The runtime provider behind module selector `0xA` still requires a live resolver snapshot or a decomp of the dynamic control-module registry construction. Calling it a target snapshot, actor transform, or generated normal before that join would be semantic guesswork.

## 4. Visibility consequence

The static-link proof does not change the visible invocation chain already recovered:

```text
Eruption warning:
stationary exact m999/e001 owner at target snapshot
-> opcode 0x0144 mode 0 -> 0x20
-> real SubStatusKick (native m999 WSS4 / command 23595 is command-backed)
-> init_msb5_1 -> state-5 VEFF
-> static links resolve the input/provider graph
-> Position3DMapBind conforms the formation to battlefield collision
-> hold for the approximately three-second cast
-> mode 0 plus clear kick
-> native m999 WSS3 / command 23594 impact

Radiant Plume:
one stationary exact m999/e001 owner per required plume origin
-> opcode 0x0144 mode 0 -> 0x10
-> real SubStatusKick
-> init_msb4_1 -> one localized Plume VEFF
```

Neither effect needs Ifrit to be the animation target. The owner supplying the world transform is what matters. Plume still has no MapBind or arena-wide `ManyGenerate*` placement controller inside state 4, so the arena pattern still needs multiple stationary origins unless a higher-level battlefield scheduler is later found.

Infernal Nail remains separate: `m524` WSS1 for spawn/rise, and the model-native DEAD scheduler for defeat/collapse.

## 5. Exact next live breakpoint payload

The most useful live capture is now smaller and more specific. At `0x00BDBF10`, log for every state-5 control:

```text
owner/control pointer
serialized consumer record or ordinal
destination-array base (+0x34 path versus +0x3C path)
raw key
link class
selector12 and selector16
resolved source pointer
resolved provider/module pointer
unresolved-bit mask at ControlNode +0x1F
owner world transform at scheduler creation
```

For `0x100A0000`, additionally log the registry base, the selected `base + 0xA * 0xE8` record, its inheritance chain through `+0xE0`, and the final `+0xD8` provider/fallback. That will name the last unknown input provider and distinguish target snapshot, owner position, and generated placement without another blind animation command test.

## 6. Reproducible artifacts

- `tools/extract_ifrit_veff_link_keys_v2.py`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_static_links_v2.csv`
- `tools/outputs/ifrit-state-geometry-decomp-20260805/veff_static_link_summary_v2.json`

The v2 CSV supersedes only the interpretation columns in `veff_secondary_tail_keys.csv`. The older file remains the mechanical extraction source.
