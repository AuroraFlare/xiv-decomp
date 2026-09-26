# Ifrit ground-state and Infernal Nail death closure

Date: 2026-08-05  
Scope: retail FFXIV 1.23b `ffxivgame.exe`, native Kuroko helper (`m999/e001`), canonical Ifrit (`m852`), Infernal Nail (`m524/e002`), and the already-recovered Eruption impact (`m999` WSS3).

This addendum supersedes two earlier uncertainties:

1. `m999` WSS4 and WSS5 do **not** select Plume versus Eruption. Their functional SCB payloads are byte-identical generic `RaptureActionSubStatusSchKickClip` envelopes. The queued opcode `0x0144` **mode bit** selects the model state.
2. The Nail's normal `MAIN_STATE_DEAD` path does automatically enter the client death scheduler. That state machine searches `dead1`, then `dead2`, then `dead` on the active actor resource roots. The active Nail `e002` package has a complete `dead` scheduler, so defeat is not another WSS and does not require `!playanimation`.

The most useful visibility-first sequences are now:

```text
Plume:
stationary m999/e001 helper at plume origin
-> opcode 0x0144 mode 0x0010
-> command 23595 / native m999 WSS4 kick
-> init_msb4_1 -> msb4 Plume art
-> mode 0 + another WSS4 kick to clear

Eruption warning:
stationary m999/e001 helper at target snapshot
-> opcode 0x0144 mode 0x0020
-> command 23595 / native m999 WSS4 kick
-> init_msb5_1 -> map-bound msb5 ground formation
-> hold for cast duration
-> mode 0 + another WSS4 kick
-> command 23594 / native m999 WSS3 impact at the same helper

Infernal Nail:
spawn m524 with BODY 1024 and HEAD 2048/e002
-> opcode 0x0144 mode 0x0010 before the WSS1 state kick
-> command 23366 / m524 WSS1 spawn-rise
-> on lethal damage send opcode 0x0134 MAIN_STATE_DEAD
-> client selects e002/dead and plays the separate collapse
-> keep the corpse actor for the native scheduler/pose handoff
```

Neither helper-based ground effect needs Ifrit to be targeted. The helper is the effect owner and its world position is the placement coordinate.

## 1. WSS4 and WSS5 are equivalent kicks

Sources:

| Wrapper | DAT | whole-file SHA-256 | role |
|---|---|---|---|
| WSS4 | `client/chara/mon/m999/act/emp_emp/wss/base/0004` | `769514e370b57a5024e1f646fbe7ab05563f802c615e2f32890c51895d7a9423` | mapped by command 23595 |
| WSS5 | `client/chara/mon/m999/act/emp_emp/wss/base/0005` | `d5f262f0d06fe1fa8f1f990df3333cc8093a1c72fea22aedc507aba16baaec72` | unmapped sibling wrapper |

Recursive extraction finds two resources in each wrapper. Both functional payloads are identical:

| Payload | SHA-256 |
|---|---|
| outer main SCB | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` |
| nested model scheduler | `e7075d9e96134471ae4532f71e37d88489f5cfd660f248bf633a3bad05d54e14` |

Both contain, at time zero:

- `BindActorClip`
- `RaptureActionSubStatusSchKickClip`

Only the wrapper path/name changes from `skill04` to `skill05`. Therefore an unmapped `0x13005000` WSS5 invocation is unnecessary for the first Eruption visibility test. Mapped command `23595`, battle animation `0x13004000`, can commit either state 4 or state 5; `mode`, not WSS number, determines which scheduler `0x7A82F0` requests.

This is a confirmed client mechanism. It does not yet prove that retail encounter scripting used command 23595 as Eruption's original kick; another cast scheduler could issue the same `RaptureActionSubStatusSchKickClip`.

## 2. Exact Plume and Eruption state schedulers

Native model-state package:

`client/chara/mon/m999/equ/e001/met_mdl/0001`

### Native m999 state 4: leading Plume art

`mode = 0x0010` changes bit 4 and resolves `init_msb4_1`. Clearing the bit resolves `init_msb4_0`.

| Scheduler | SHA-256 | active envelope | entries |
|---|---|---:|---:|
| `init_msb4_1` | `cef7f840816daab125531a943ded9e2b6db6bc85b191d62ac21ab785dfd982ce` | 0.240 s | 6 |
| `init_msb4_0` | `957de5016af9321fd83e75d3ebf05d48fc875162ad9bd2a07f30630e7a76c9ec` | 0.050 s | 2 |

On-state timeline:

| time | clip |
|---:|---|
| 0.000 s | `BindActorClip` |
| 0.000 s | `RaptureSoundClip` |
| 0.000 s | `ActionClip` -> `msb4` |
| 0.020 s | `RaptureChantSyncClip` |
| 0.040 s | `RaptureEffectEndClip` targeting the `ActionClip` |
| 0.050 s | second `RaptureSoundClip` |

The off-state binds the actor and runs `RaptureCancelChantSyncClip` against `init_msb4_1` at time zero.

The actual state-4 visual resources are:

| Resource | type | bytes | SHA-256 |
|---|---|---:|---|
| `0Xv7Tfift_eish2` | VEFF | 28,908 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` |
| `3ULJ7Kvleafinst` | VINS | 878 | `1b59d53cc8221a30594146c269872ef7601a95fe39eb5b28ea43a0b242cd1dae` |
| `msb4` | ACB | 1,016 | `1251bb43d20acaa7b445028875b2c263654bee0b8365b8ee2e0391187d3e779d` |

The VINS explicitly attaches through `EID_CURRENT`. The VEFF contains `Position3D`, `Position3D:CoordRoot`, `Position3D:CoordLocal`, and `Scale3D:CoordRoot`; it does **not** contain `Position3DMapBind`. This is actor-rooted art. A stationary helper makes that root a fixed battlefield point.

### Native m999 state 5: leading Eruption pre-impact

`mode = 0x0020` changes bit 5 and resolves `init_msb5_1`. Clearing the bit resolves `init_msb5_0`.

| Scheduler | SHA-256 | active envelope | entries |
|---|---|---:|---:|
| `init_msb5_1` | `36e2818b521fb27b258823c010605d26df41d157573d74655c54528b5499fb60` | 0.200 s | 6 |
| `init_msb5_0` | `61b73c999e996dd87cddce4cf8546e1233e89b3246693a6b375bf340da0419f8` | 0.100 s | 2 |

On-state timeline:

| time | clip |
|---:|---|
| 0.000 s | `BindActorClip` |
| 0.000 s | `RaptureSoundClip` |
| 0.000 s | `ActionClip` -> `msb5` |
| 0.020 s | `RaptureChantSyncClip` |
| 0.050 s | second `RaptureSoundClip` |
| 0.050 s | `RaptureEffectEndClip` targeting the `ActionClip` |

The actual state-5 resources are:

| Resource | type | bytes | SHA-256 |
|---|---|---:|---|
| `2Jckltift_skleb` | VEFF | 17,952 | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` |
| `258RjYvleafinst` | VINS | 878 | `4858063f199829e0de9dfbde363de429806f06769d6c4f6cd8d5303570643571` |
| `msb5` | ACB | 1,016 | `3ef6b7dbcede758176c4bfff486e1881aa92dd40b68778deb69ea55f264cc5b0` |

The VINS also uses `EID_CURRENT`, but the VEFF contains the ground-placement controls absent from state 4:

- `Position3DMapBind:CoordRoot`
- `Position3DMapBindGenerated:GendNormal:CoordLocal`
- `GenerateMaster`
- `Position3D:CoordRoot`
- `Position3D:CoordLocal`
- `Scale3D:CoordRoot`
- serialized `jLoop`

This is the strongest structural reason state 5 matches the Eruption formation: it is attached to the current helper yet projects/binds its generated content to the terrain. Its ACB has persistent flags, so the 0.200-second launch SCB is not the visible lifetime; the state remains until the mode bit is cleared and the off scheduler cancels it.

### Canonical m852 imports

`client/chara/mon/m852/act/emp_emp/bid/base/0000` contains byte-identical imported Kuroko art:

- Eruption stays `init_msb5_*`, so canonical `m852` also uses `mode = 0x0020`.
- Plume state 4 is remapped to `init_msb7_*`, so canonical `m852` uses `mode = 0x0080` for the identical Plume payload.
- `m852 init_msb7_1` and native `m999 init_msb4_1` have the same SHA-256, duration, clip order, `msb4` ACB, VEFF, and VINS.
- `m852 init_msb5_1/_0` are byte-identical to native `m999 init_msb5_1/_0`.

This also explains why raw `0x20` tests on both carriers showed nothing: those tests populated opcode `0x0144` `breakage`, not `mode`, so the client queued the wrong update type and never reached `0x7A82F0`.

## 3. Nail death dispatch is now statically closed

### Packet and state transition

Server packet `SetActorStatePacket` uses opcode `0x0134`. Its first payload byte is `mainState & 0xFF`; the next byte is substate.

The client command pipeline contains:

| address | recovered role |
|---|---|
| `0x0058D319` | opcode `0x0134` case in the application dispatcher |
| `0x00588BA0` | consumes/tracks the low-byte main-state value and emits the corresponding state event |
| `0x007C0E10` | actor main-state transition dispatcher |
| `0x007AC7F0` | initializes the generic death scheduler machine |
| `0x007C2C27` | per-frame call into the death scheduler update |
| `0x007BADE0` | generic `dead1` / `dead2` / `dead` scheduler state machine |

The actor controller fields recovered from `0x007C0E10` and `0x007AC7F0` are:

| controller offset | role |
|---:|---|
| `+0x5A8` | current main state |
| `+0x5A9` | previous main state |
| `+0x5AA` | requested main state |
| `+0x5AC` | internal death-scheduler phase |

When the requested state is `1` (`MAIN_STATE_DEAD`) or `3` (`DEAD2`), `0x007C0E10` commits the transition and calls `0x007AC7F0`. That function cleans the old presentation handles and sets the death-scheduler phase at `+0x5AC` to `1`.

### Generic death resource selection

At phase 1, `0x007BADE0` constructs and probes the following SCB names in order:

| order | resource-name VA | name | next internal phase on success |
|---:|---:|---|---:|
| 1 | `0x00FE73B8` | `dead1` | 2 |
| 2 | `0x00FE73C0` | `dead2` | 3 |
| 3 | `0x00FE73C8` | `dead` | 4 |

The lookup requests type `scb` through the actor's active resource lookup and scheduler factory. If `dead1` exists, the machine chains it into `dead2`, then `dead`. If the earlier names are absent but `dead` exists, it launches `dead` directly. If none exists, it advances to the terminal cleanup phase.

Near the end of `dead`, the client releases the death scheduler handles and requests the terminal pose family. The embedded strings at `0x00FE73E0` through `0x00FE7450` are repeated `cbbm_dedpose` and `cbnm_dedpose` alternatives selected through the actor/model branch and flag `+0x5B4 & 0x4000`.

### The active Nail `e002/dead` scheduler

Package:

`client/chara/mon/m524/equ/e002/met_mdl/0001`

| Resource | type | bytes | SHA-256 |
|---|---|---:|---|
| `dead` | SCB | 1,888 | `5b4b3631be6ac08e27f99efabc685893fe93e11e8146d2b73fabab1e03ea63f6` |
| `151rmjanc_dead1` | VEFF | 16,416 | `85745f0569c3b2f1aaa0ecf01267f586c86a2f4507b2aa64fa8e051fbc6a5278` |

The `dead` SCB lasts 0.990 seconds and contains 12 entries:

| time | clip / effect |
|---:|---|
| 0.000 s | bind actor |
| 0.000 s | death sound |
| 0.000 s | cancel chant/state sync, including the active aura handoff |
| 0.000 s | collapse/equipment motion clips |
| 0.000 s | `ActionClip` -> `m524_ded` |
| 0.000 s | `RaptureActionSubStatusSchKickClip` |
| 0.000 s | client and server move-stop clips |
| 0.000 s | status/target lock clip |
| 0.250 s | `RaptureActionSelectClip` |
| 0.300 s | final motion stage |

Together with the package's embedded motion/resource names, this is the separate Nail defeat presentation: cancel `init_msb4_1`, play `cbbm_ded`, transition equipment `cbxs_st1to0`, run `m524_ded`, then settle into the client's `cbbm_dedpose` terminal path.

The static invocation chain is therefore:

```text
opcode 0x0134, mainState = 1
-> requested actor main state +0x5AA
-> 0x007C0E10
-> 0x007AC7F0 sets death phase +0x5AC = 1
-> per-frame 0x007C2C27
-> 0x007BADE0 probes dead1, dead2, dead
-> active m524/e002 dead SCB
-> native collapse/VFX
-> cbbm_dedpose/cbnm_dedpose terminal selection
```

No defeat WSS command or Ifrit target is required. Do not replay Nail WSS1 and do not delete the actor immediately on lethal damage. A corpse lifetime of at least the 0.990-second `dead` scheduler plus pose/cleanup margin is required; the existing four-second corpse window is sufficient.

The only remaining live detail is active-root precedence if both `m524/e001` and `m524/e002` expose a `dead` resource simultaneously. The configured Nail appearance uses HEAD `2048`, making `e002` the intended rich Nail path, but a breakpoint at scheduler creation should record which root wins in the live actor.

## 4. Updated implementation probes

### Plume, native helper

1. Instantiate an `m999/e001` helper at the desired floor origin.
2. Send opcode `0x0144` with `mode = 0x0010`, not `breakage = 0x10`.
3. Run command `23595` or packed battle animation `0x13004000` on the helper, using the caster/self branch.
4. The WSS4 SubStatusKick commits state 4 and launches `init_msb4_1 -> msb4`.
5. To clear it, send `mode = 0`, then issue another WSS4 kick.

### Eruption warning and impact, native helper

1. Snapshot the target's position when the cast begins.
2. Instantiate a stationary `m999/e001` helper at that coordinate.
3. Send opcode `0x0144` with `mode = 0x0020`.
4. Run command `23595` / WSS4 on the helper to commit state 5.
5. Hold the helper still for the approximately three-second cast. The state-5 VEFF map-binds generated particles to terrain under `EID_CURRENT`.
6. Just before resolution, send `mode = 0` and issue another WSS4 kick to launch `init_msb5_0`.
7. Run command `23594` / native WSS3 on the same helper for the live-confirmed impact.
8. Despawn after the impact cleanup window.

This construction naturally gives a frozen target snapshot. If the player moves 8–10 yalms, the warning remains at the helper. An effect attached directly to the player would move instead.

### Nail spawn and defeat

1. Spawn the `m524` Nail with base model `10524`, BODY `1024`, HEAD `2048`, ACTIVE.
2. Queue opcode `0x0144 mode = 0x0010` before WSS1's approximately 0.860-second SubStatusKick.
3. Run command `23366` / WSS1 on the Nail itself through the caster/X00 branch.
4. Leave the Nail actor alive and targetable after the rise.
5. On lethal damage, send the normal opcode `0x0134 MAIN_STATE_DEAD` transition.
6. Preserve the actor for at least the native death scheduler and pose handoff; do not substitute the WSS1 result tail.

## 5. Confirmed versus still requiring one live capture

Confirmed statically or already live-confirmed:

- command `23594` / native `m999` WSS3 is the large Eruption impact;
- command `23595` maps to native `m999` WSS4;
- WSS4 and WSS5 functional resources are byte-identical SubStatusKick envelopes;
- opcode `0x0144 mode`, not `breakage`, feeds model-state queue type 3 and `0x7A82F0`;
- native `m999 mode 0x10` selects `init_msb4_*`; native/canonical state 5 uses `mode 0x20`;
- canonical `m852` remaps the imported Plume art to state 7 / `mode 0x80`;
- state 4 and state 5 use byte-identical art across native `m999` and canonical `m852` imports;
- state 4 is attached through `EID_CURRENT` and actor/root coordinates;
- state 5 is attached through `EID_CURRENT` and contains `Position3DMapBind`, generated terrain-normal binding, `GenerateMaster`, and loop data;
- opcode `0x0134 MAIN_STATE_DEAD` enters the generic client death scheduler;
- that scheduler automatically probes `dead1`, `dead2`, and `dead` and then requests the terminal death pose;
- active Nail `e002/dead` is a complete 0.990-second defeat scheduler, separate from WSS1 spawn.

Still requiring visual/runtime confirmation:

- one successful live render of native `m999/e001 mode 0x10 + WSS4` to visually certify the state-4 art as the exact retail Plume;
- one successful live render of `mode 0x20 + WSS4` to visually certify state 5 as the exact Eruption warning;
- whether retail used command 23595, a `cast_mon_11..16` scheduler, or another parent solely as the original Eruption SubStatusKick;
- exact live helper spawn packet and owner chosen by retail;
- `m524/e001` versus `m524/e002` root precedence when the Nail enters `dead`.

Those boundaries no longer block a visibility test or a private-server implementation probe.

## 6. Reproducible artifacts

Focused extractor:

`tools/build_ifrit_model_state_decomp.py`

Exact scheduler graph and attachment extractor:

`tools/build_ifrit_state_scheduler_graph.py`

Generated data:

- `tools/outputs/ifrit-model-state-decomp-20260805/sources.csv`
- `tools/outputs/ifrit-model-state-decomp-20260805/resources.csv`
- `tools/outputs/ifrit-model-state-decomp-20260805/veff_controls.csv`
- `tools/outputs/ifrit-model-state-decomp-20260805/m999_m852_shared_state_resources.csv`
- `tools/outputs/ifrit-model-state-decomp-20260805/wss04_wss05_equivalence.json`
- `tools/outputs/ifrit-model-state-decomp-20260805/scheduler_graph.csv`
- `tools/outputs/ifrit-model-state-decomp-20260805/attachment_and_lifetime_tokens.csv`

Executable decomp artifacts:

- `tools/outputs/ifrit-ground-vfx-decomp-20260805/opcode_0134_application_handler.cpp`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/actor_main_state_to_death_scheduler.cpp`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/actor_death_scheduler_state_machine.cpp`

The installed client was read only. No DAT, executable, packet definition, database row, encounter script, or gameplay source was modified by this pass.
