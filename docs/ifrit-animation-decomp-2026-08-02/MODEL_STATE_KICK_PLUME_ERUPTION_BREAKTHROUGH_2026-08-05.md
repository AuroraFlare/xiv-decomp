# Ifrit Plume and Eruption model-state-kick breakthrough

Snapshot: 2026-08-05; installed retail FFXIV 1.23b client `2012.09.19.0001`.

This is a visibility-first addendum to `VISIBILITY_FIRST_ERUPTION_PLUME_NAIL_DECOMP_2026-08-05.md`. It supersedes that report's recommendation to probe `m852` WSS5 as floor art. Native `m999` WSS4/WSS5 and Kuroko model-state packages are now the leading paths.

No game DAT, executable, SQL, encounter script, packet definition, or gameplay source was changed during this decomp pass.

## Result

The silent live tests have a specific, confirmed cause: opcode `0x0144` packet byte `breakage` is not the model-state mask. The model-state mask is packet byte `mode`.

The old probe sent `0x20` as `breakage`, so the client queued a type-2 breakage/chant/guard/waste update. It never called `0x7A82F0`, never requested `init_msb5_1`, and therefore could not display the candidate Eruption warning.

The corrected visibility paths are:

- Radiant Plume: native `m999` WSS4 kicks queued state 4; `mode = 0x10` resolves `init_msb4_1` on native `m999/e001`.
- Eruption pre-impact: native `m999` WSS5 kicks queued state 5; `mode = 0x20` resolves `init_msb5_1` on native `m999/e001`.
- Eruption impact: command `23594`, packed action `0x13003000`, native `m999` WSS3. This final impact remains live-confirmed.

No Ifrit target is required merely to host these effects. The safest first test makes a compatible `m999/e001` helper the action source and places that helper at the desired floor origin.

## Confidence boundary

Confirmed execution facts:

- the retail command-to-WSS joins listed below;
- WSS4/WSS5 contain state-kick clips rather than visual payloads;
- opcode `0x0144` byte routing;
- the queued-substatus consumer chain;
- `0x7A82F0` resource-name construction, supported-mask gates, lookup, and scheduler creation;
- state-4 and state-5 resource contents, cancel schedulers, attachments, and persistence flags.

Still awaiting a live render or retail packet capture:

- that Kuroko state 4 is visually the exact retail Plume rather than only a command-correlated imported state;
- that Kuroko state 5 is visually the exact retail Eruption pre-impact warning;
- the retail helper model, spawn packet, owner, target list, state-set time, and clear time used by Eruption;
- the retail command or parent cast envelope that performs the WSS5 kick.

## Retail command join

The command schema places `modelAnimation` at value index 32 and `battleAnimation` at value index 34. Relevant rows are:

| Command | Label | Cast time | Model animation | Packed battle animation | Meaning |
|---:|---|---:|---:|---:|---|
| 23592 | eruption | 3000 ms | 1 | `0x13001000` | related native m999 action |
| 23593 | radiant_plume | 3000 ms | 2 | `0x13002000` | related native m999 action |
| 23594 | eruption | 3000 ms | 3 | `0x13003000` | large impact; live-confirmed |
| 23595 | radiant_plume | 3000 ms | 4 | `0x13004000` | native m999 WSS4 state kick |

The direct `23595 -> modelAnimation 4 -> WSS4` join is the strongest evidence recovered for Plume. Private-server command `23983` must remain separate because it may not be present in retail client command data.

## Native m999 WSS4 and WSS5

### WSS4

- DAT path: `client/chara/mon/m999/act/emp_emp/wss/base/0004`
- size: 3,280 bytes
- SHA-256: `769514e370b57a5024e1f646fbe7ab05563f802c615e2f32890c51895d7a9423`
- main SCB: `system/shoot_mon/main`, 1,936 bytes
- main SCB SHA-256: `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422`
- model scheduler: `mon/kuroko_999/skill04/mon_main`, 1,008 bytes
- model scheduler SHA-256: `e7075d9e96134471ae4532f71e37d88489f5cfd660f248bf633a3bad05d54e14`
- no embedded VEFF or visual RES payload
- model scheduler duration: 0.1 seconds / two entries
- entry at time zero: `RaptureActionSubStatusSchKickClip`

### WSS5

- DAT path: `client/chara/mon/m999/act/emp_emp/wss/base/0005`
- size: 3,280 bytes
- SHA-256: `d5f262f0d06fe1fa8f1f990df3333cc8093a1c72fea22aedc507aba16baaec72`
- same main and model-scheduler payload hashes as WSS4
- model scheduler path changes to `mon/kuroko_999/skill05/mon_main`
- no embedded VEFF or visual RES payload
- entry at time zero: `RaptureActionSubStatusSchKickClip`

These actions cannot become visible through `!playanimation` alone. Their job is to consume already-queued actor substatus and cause the active model package to launch its state scheduler.

## Complete state-kick runtime chain

The recovered execution path is:

```text
native m999 WSS4 or WSS5
-> RaptureActionSubStatusSchKickClip concrete function 0x829730
-> resolve actor/action context
-> 0x662C80(actor, context + 0x68)
-> actor virtual call at +0x268
-> 0x65A9E0(context + 0x68, 1)
-> 0x65A860 builds a 0x40-byte internal event
-> 0x7CE7B0 emits event type 0x5A
-> apply event to primary actor and resolved action targets
-> 0x7BF2E0 consumes queued substatus entries at or before action timestamp
-> queue type 3 calls 0x7A82F0
-> 0x7A82F0 resolves init_msbN_1 or init_msbN_0
-> resource lookup at 0x7A8455
-> scheduler creation at 0x7A852A
```

`0x65A860` reads target count at action context `+0x30`, target records at `+0x38` with stride `0x14`, resolves actors through `0x7A0150`, and consumes the substatus queue at each target actor `+0x1110`. It also consumes the primary actor's queue at `+0x1110`.

`0x7BF2E0` handles these queue types:

| Type | Action |
|---:|---|
| 1 | writes actor byte `+0xB3A` |
| 2 | calls `0x7BB740`; breakage/chant/guard/waste |
| 3 | calls `0x7A82F0`; model-state scheduler mask |
| 4 | writes actor field `+0xC20` |
| 5 | copies 40 bytes to actor `+0xB54`, then finalizes through `0x7BA190` |

## Opcode 0x0144 byte routing

The opcode dispatcher at `0x4DCFFF..0x4DD01A` resolves the actor and calls the actor's virtual packet handler at `+0x24`. The concrete character handler starts at `0x662D30`.

Subtype `0x3B` branches to `0x6638A4`, where the eight-byte substate payload is split as follows:

| Payload offset | Server field | Client call | Queue/type |
|---:|---|---|---|
| `+0..+3` | breakage, chantId, guard, waste | `0x7BF270` | type 2 |
| `+4..+5` | mode plus zero byte | `0x7B4440` | type 3 |
| `+6..+7` | motionPack | `0x7A5260` | motion pack |

The server packet `SetActorSubStatePacket` serializes:

```text
byte 0 breakage
byte 1 chantId
byte 2 guard
byte 3 waste
byte 4 mode
byte 5 unknown/zero
bytes 6-7 motionPack
```

Therefore `breakage = 0x20` and `mode = 0x20` are not interchangeable. The first never reaches the model-state scheduler; the second does.

## 0x7A82F0 model-state gates

`0x7A82F0` operates on the actor model-state component at actor `+0xB80`. Its current state mask is component `+0x4C`. It compares old and new masks and processes only changed, supported bits.

Required gates:

- a usable actor model/scheduler factory through actor `+0x114`;
- a live active-model resource root at actor `+0x12F0`;
- changed state bit is present in the model's supported-state mask;
- `0x65BE50(actor)` obtains the model metadata split-count byte at metadata `+0x35` when flag `+0x03` includes `0x80`;
- `0x65C550(actor)` obtains the supported state-mask byte at metadata `+0x3B`.

For state bits 0 through 7, setting a bit formats `init_msb%u_1`; clearing it formats `init_msb%u_0`. The format strings are stored at executable addresses `0xFE75BC` and `0xFE75CC`.

For `mode = 0x20`, changed bit 5 resolves `init_msb5_1`. Clearing back to zero resolves `init_msb5_0`.

This explains why both the tested `m999/e001` and canonical `m852` carriers appeared to ignore raw `0x20`: the server populated the wrong packet byte, so the resource gates were never even evaluated.

## Kuroko state 4: strongest Plume package

Native model package:

- path: `client/chara/mon/m999/equ/e001/met_mdl/0001`
- file size: 616,360 bytes
- SHA-256: `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105`

State 4 resources:

| Resource | Bytes | SHA-256 |
|---|---:|---|
| `init_msb4_1` SCB | 1,232 | `cef7f840816daab125531a943ded9e2b6db6bc85b191d62ac21ab785dfd982ce` |
| `init_msb4_0` SCB | 1,008 | `957de5016af9321fd83e75d3ebf05d48fc875162ad9bd2a07f30630e7a76c9ec` |
| `0Xv7Tfift_eish2` VEFF | 28,908 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` |
| `msb4` ACB | 1,016 | `1251bb43d20acaa7b445028875b2c263654bee0b8365b8ee2e0391187d3e779d` |

The VEFF uses fire, glow, distortion, and ring resources including `rg0frb02` and `fd0fib01`. Its VINS attachment is `EID_CURRENT`. Placement is actor/root-local rather than MapBind, so fixed Plumes should be hosted by stationary helpers at the authored plume origins.

The `_1` SCB starts its action clip at time zero. The `_0` SCB cancels the `_1` scheduler. Although the ACB contains 38 frames at 30 fps, its persistent-loop flags (`0x9C = 0xC0`, `0xA0 = 0x101`) mean 1.267 seconds is not the maximum visible hold time.

## Kuroko state 5: strongest Eruption pre-impact package

State 5 resources in the same native model package:

| Resource | Bytes | SHA-256 |
|---|---:|---|
| `init_msb5_1` SCB | 1,232 | `36e2818b521fb27b258823c010605d26df41d157573d74655c54528b5499fb60` |
| `init_msb5_0` SCB | 1,008 | `61b73c999e996dd87cddce4cf8546e1233e89b3246693a6b375bf340da0419f8` |
| `2Jckltift_skleb` VEFF | 17,952 | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` |
| `msb5` ACB | 1,016 | `3ef6b7dbcede758176c4bfff486e1881aa92dd40b68778deb69ea55f264cc5b0` |

The nested VEFF includes `rock_u03`, fire, glow, and aura resources plus:

- `Position3DMapBind:CoordRoot`;
- `Position3DMapBindGenerated:GendNormal:CoordLocal`;
- `GenerateMaster`;
- `EID_CURRENT` attachment.

This is a stationary rock/fire ground-formation package, not another explosion. Its `_0` scheduler cancels `_1`. The ACB contains 46 frames at 30 fps, but it has the same persistent-loop flags as state 4, so the warning may remain set for the full approximately three-second cast.

## m852 import remapping

The canonical Ifrit BID package is:

- path: `client/chara/mon/m852/act/emp_emp/bid/base/0000`
- size: 1,649,424 bytes
- SHA-256: `d628997bfead8781208960fb5c7bde0f73a57a51acc1a66e9d497c7f2deb7e50`

It imports Kuroko skill 5 unchanged as `init_msb5_*`, so canonical `m852` still uses `mode = 0x20` for that state.

It imports Kuroko skill 4 as `init_msb7_*`, not `init_msb4_*`. Therefore the same imported Plume art on canonical `m852` would require `mode = 0x80`. Native `m999/e001` requires `mode = 0x10`.

The BID `cast_mon_11` through `cast_mon_16` schedulers all include `RaptureActionSubStatusSchKickClip`, so a cast envelope can consume queued mode changes. This does not yet identify which retail cast owns the Eruption state or whether the retail client uses `m852`, a stationary `m999` proxy, or both.

## Correct visibility-first tests

### Radiant Plume

Safest native carrier test:

```text
spawn and instantiate m999/e001 at a plume origin
-> send opcode 0x0144 with mode = 0x10, not breakage = 0x10
-> run command 23595 or packed native m999 WSS4 (0x13004000)
-> WSS4 consumes queue type 3
-> 0x7A82F0 resolves init_msb4_1
-> hold for the desired warning duration
-> send opcode 0x0144 with mode = 0
-> run WSS4 or another valid substatus-kick envelope
-> 0x7A82F0 resolves init_msb4_0 and cancels the effect
```

For canonical `m852`, use `mode = 0x80` to address the imported `init_msb7_*` copy. Do not use native m999's `0x10` bit on m852 unless testing m852's unrelated native state 4.

### Eruption pre-impact and impact

```text
cast begins; snapshot targeted player's world XYZ
-> spawn/instantiate stationary m999/e001 helper at the snapshot
-> send opcode 0x0144 with mode = 0x20, not breakage = 0x20
-> run packed native m999 WSS5 (0x13005000)
-> state kick resolves persistent init_msb5_1 rock/fire/MapBind warning
-> keep helper stationary and hold state for the cast
-> before impact, send opcode 0x0144 with mode = 0
-> run WSS5 or another valid substatus-kick envelope
-> init_msb5_0 clears the warning
-> execute command 23594 / packed native m999 WSS3 (0x13003000)
-> large Eruption impact
-> despawn helper after cleanup
```

This test deliberately uses a stationary helper. Attaching the state to the moving targeted player would make the warning follow the player unless the client freezes its world transform elsewhere.

No Ifrit target is required for either native helper test. The `m999/e001` helper should be the source/primary actor. The action context can also fan the substatus kick to its target list, so keep the first probe self-contained to avoid setting states on Ifrit or the player by accident.

## Corrected m852 WSS attachments

Earlier ranking of `m852` WSS5 as the first floor-warning candidate was wrong:

| Action | Attachment/placement | Current interpretation |
|---|---|---|
| m852 WSS5 | `EID_R_HAND` | right-hand Ifrit effect; not leading floor candidate |
| m852 WSS17 | `EID_L_HAND` plus MapBind content | left-hand/paw fire ring; live-excluded for Eruption |
| m852 WSS4 | target generated sphere, `EID_V03` | generated target effect; diagnostic only |
| m852 WSS7 | target generated sphere, `EID_V03` | generated target effect; diagnostic only |
| m852 WSS12-WSS14 | large three-branch special packages | more consistent with Hellfire-family comparison than a named Plume claim |

## Infernal Nail status

Nail WSS1 remains independently confirmed:

- path: `client/chara/mon/m524/act/emp_emp/wss/base/0001`;
- size: 239,336 bytes;
- SHA-256: `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df`;
- `cbbm_sp_01`, 90 frames / exactly 3.000 seconds;
- `cbxs_st0 -> cbxs_st0to1 -> cbxs_st1` equipment-state sequence;
- MapBind and generated MapBind in VEFF `0W7Ar9anc_sklc1`;
- the Nail rises, settles by frame 55, and holds raised through frame 90.

Its visible drop after WSS1 is a persistent-state handoff issue. The one-frame BID idle `cbbm_id0` places root Y near `-6`. The correct route is to enter the authored raised state during WSS1's hold, not pause or loop WSS1. The opcode analysis above also means any Nail model-state test must populate `mode`, not `breakage`.

## Next decisive capture

Run the corrected native helper probes before searching more assets. If either art renders, capture:

1. every inbound actor create, move, state, action, result, and delete packet from 500 ms before cast start through one second after command 23594;
2. breakpoint `0x004DD01A`: resolved opcode `0x0144` handler, actor ID, and all eight payload bytes;
3. breakpoint `0x007A82F0`: actor, old/new model-state masks, supported mask, and active model-resource root;
4. breakpoint `0x007A8457`: requested `init_msb*` name and resource lookup return value;
5. breakpoint `0x007A852C`: scheduler creation result, owner, and world transform;
6. every SCB/RES/VEFF scheduler created between `cast_mon_11` and native m999 WSS3;
7. one stationary target and one target moving 8-10 yalms immediately after cast start.

The moving-target comparison distinguishes a frozen snapshot/helper from an effect attached to the moving actor.

## Reproducible decomp artifacts

Output folder: `tools/outputs/ifrit-ground-vfx-decomp-20260805`

New runtime artifacts:

- `action_substatus_actor_event.cpp` (`0x7BF2E0`);
- `action_substatus_instruction_trace.txt` (`0x65A860`, `0x7BF2E0`);
- `actor_model_state_apply.cpp` (`0x7A82F0`);
- `actor_model_state_gates.cpp` (`0x65BE50`, `0x65C550`);
- `opcode_0144_handler.cpp`;
- `opcode_0144_queue_chain.cpp`;
- `action_substatus_kick_clip.cpp`;
- `action_substatus_kick_chain.cpp`;
- `action_substatus_scheduler_kick.cpp`;
- `action_substatus_event_5a.cpp`;
- `veff_instance_value_format.cpp`;
- `veff_instance_libraries.cpp`;
- `veff_format_constructors.cpp`;
- `veff_index_name_format.cpp`.

The earlier report and extractor outputs retain the complete VEFF control decomp, WSS21/WSS22 byte-equivalence proof, battlefield boundary-ring data, and Nail resource analysis.
