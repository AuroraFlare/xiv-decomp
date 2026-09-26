# Ifrit visibility-first Eruption, Plume, and Nail decomp

Snapshot: 2026-08-05; installed retail FFXIV 1.23b client `2012.09.19.0001`.

Scope: installed Ifrit (`m852`), Kuroko/helper (`m999`), Infernal Nail (`m524`), Bowl layout data, and the 1.23b executable VFX-control implementation. This pass changed no game DAT, executable, SQL, encounter script, packet definition, or gameplay source.

## Outcome

The visibility problem is now narrower:

1. `m852` WSS21 is an import wrapper around native `m999` WSS2, the live-confirmed smaller Eruption impact.
2. `m852` WSS22 is an import wrapper around native `m999` WSS3, the live-confirmed large Eruption impact.
3. They are impact packages, not leading Plume or pre-impact-warning candidates.
4. Of every installed `m852` and `m999` WSS action bank, only `m852` WSS17 contains a real `Position3DMapBind`. Live testing identifies WSS17 as a paw/hand-offset fire ring, not Eruption.
5. The remaining Eruption/Plume candidates use actor-relative or generated local/root placement. A warning that stays at the cast-start point therefore needs a stationary actor/helper at that point unless another non-WSS scheduler is recovered.
6. `m852` WSS5 is now the first untested Plume/pre-warning probe: it is a generated ring/fire/glow package, lasts about 2.333 seconds at the body-motion layer, is caster-owned, and was absent from the previous GM ground-bank queue.
7. `m852` WSS12-WSS14 remain large three-branch fire packages, but their shared 130-frame major-special body and escalating effect layers make a Hellfire-family interpretation at least as plausible as Plumes. They must not be renamed Plume without a live render or retail selector.
8. Infernal Nail WSS1 is different: it contains genuine map-bound controls, a confirmed three-second rise/growth motion, and an authored raised hold. Its current failure is the post-WSS persistent-state handoff, not a missing rise animation.

The confirmed retail-shaped Eruption chain remains:

```text
cast begins
-> generic m852 BID cast_mon_11 envelope
-> missing/unidentified target-ground warning for about 3 seconds
-> result command 23594 / native m999 WSS3
-> large impact
```

No static decomp currently proves what fills the middle line.

## Exact WSS21/WSS22 correction

Recursive PWIB/SEDB comparison produces these results:

| Pair | Resource entries in each bank | Byte-identical entries | Only differing embedded entry |
|---|---:|---:|---|
| `m852` WSS21 vs `m999` WSS2 | 40 / 40 | 39 | outer action `SEDBSCB` |
| `m852` WSS22 vs `m999` WSS3 | 43 / 43 | 42 | outer action `SEDBSCB` |

Counting each top-level `SEDBRES` container as a chunk gives the equivalent totals `39/41` and `42/44`: the top-level wrapper and one outer scheduler differ; the effect payloads do not.

| Source-only scheduler | Bytes | SHA-256 |
|---|---:|---|
| m852 WSS21 outer SCB | 1,264 | `b6c2e38807d63d26638c2edf528391e3d2b61489fd780c26e9efbc738fe140cf` |
| m999 WSS2 outer SCB | 1,472 | `c5d54f3b042a7f9104882213083b5094c184573625ab24f82d8aac4829eceb78` |
| m852 WSS22 outer SCB | 1,264 | `6767a41944e9b244c533a32376be7f28c5a5c24e8baf064cc3a04d5d6a056a86` |
| m999 WSS3 outer SCB | 1,472 | `187dd860499fe16953f1faaf991172993e754f45c62b5527922caa539f8a0bf4` |

The meaningful string-level scheduler delta is:

- m852 wrappers contain `RaptureActionSubStatusSchKickClip`;
- native m999 banks contain `m999_0002.sch.pkl` or `m999_0003.sch.pkl`.

All caster/target VEFFs, ACBs, textures, models, leaves, and nested effect resources are otherwise shared. WSS21/22 can still be useful compatibility wrappers, but their visual content is the already-known impact family.

Source hashes:

| File | Bytes | SHA-256 |
|---|---:|---|
| m852 WSS21 | 788,480 | `d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34` |
| m999 WSS2 | 788,688 | `495d76a562dbe2bebfb2698468dd114cd2aa024e6f22004b9fd0520ddd72cfc1` |
| m852 WSS22 | 740,448 | `035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3` |
| m999 WSS3 | 740,656 | `0ddecf22508dcd151e302c7484981932b52db02f8ca926c3a114c65168046ac6` |

## Ground-placement control inventory

A complete literal scan of every installed `m852` and `m999` WSS bank found:

- generated local/root/world placement in many action banks;
- `Position3DMapBind:CoordRoot` in exactly one action bank: `m852` WSS17;
- no `Position3DMapBind` in any native `m999` WSS bank.

Outside WSS action banks, exact MapBind strings occur in only these inspected Ifrit-family packages:

| Package | Map-bound role |
|---|---|
| `m852/act/emp_emp/bid/base/0000` | imported Kuroko bit-5 model-state package |
| `m999/equ/e001/met_mdl/0001` | native Kuroko bit-5 model-state package |
| `m524/act/emp_emp/wss/base/0001` | Infernal Nail rise/ignite action |
| `m852/act/emp_emp/wss/base/0017` | Ifrit paw/hand-offset ring; live-negative for Eruption |

This separates three placement concepts that were previously being conflated:

- `Position3D` / `Position3DGenerated`: actor-relative or generated motion;
- `Position3DWorld`: explicit world-coordinate control;
- `Position3DMapBind`: terrain-height projection from an owning/root coordinate.

An effect can look like a ground overlay while still being actor-owned. MapBind does not prove a battlefield layout object and it does not supply a target snapshot by itself.

## Executable VFX-control decomp

The serialized VEFF class IDs match the executable control registry exactly.

| Control | Class ID | Registry | Main recovered handlers |
|---|---:|---:|---|
| `ManyGenerateUnitTime` | `0x31C` | `0x01313DC4` | `0x00D79B70`, `0x00D79B90`, `0x00D79BB0` |
| `ManyGenerateFormSphere` | `0x058` | `0x0131376C` | `0x00D798C0`, `0x00D79920` |
| `ManyGenerateMotionEmission` | `0x397` | `0x01313A24` | `0x00D79A20`, `0x00D79AC0` |
| `ManyGenerateDrawLine` | `0x1E5` | `0x01312E5C` | `0x00D730B0`, `0x00D73900`, `0x00D73F70` |
| `Position3DMapBind` | `0x033` | `0x01314EFC` | `0x00D7E200`, `0x00D7E370` |
| `Position3DMapBind:CoordRoot` | `0x0F3` | `0x013180D4` | same MapBind implementation |
| `Position3DMapBindGenerated:GendNormal:CoordRoot` | `0x291` | `0x01318474` | `0x00D80A30`, `0x00D80AC0`, `0x00D80CE0` |
| `GenerateMaster` | `0x175` | `0x0131254C` | `0x00D6ACA0`, `0x00D6AD50` |

### Confirmed runtime field behavior

`ManyGenerateUnitTime`:

- runtime `+0x14`: committed generation count;
- `+0x18`: initialized/enabled byte;
- `+0x1A`: pending signed-short generation count;
- `+0x20`: pointer to a scalar probability/rate input;
- `0xD79BB0` draws a random scalar and increments the pending count when it passes that input;
- `0xD79B90` commits pending count to `+0x14` and clears the pending counter on the relevant update edge.

`ManyGenerateFormSphere`:

- copies source words `+0x00..+0x08` into runtime vector `+0x30..+0x38`;
- copies source words `+0x0C..+0x10` into runtime `+0x3C..+0x40`;
- copies the source mode byte at `+0x1C` and flag bit at `+0x1D`;
- later copies two connected three-vectors into runtime `+0x10..+0x18` and `+0x20..+0x28`.

Those fields are consistent with sphere center/range and generated point/direction outputs. Exact labels such as inner radius, outer radius, arc, or angle remain unproved until the SEDB instance-value table is fully mapped.

`ManyGenerateMotionEmission`:

- copies a `0x58`-byte source definition;
- source mode byte `+0x54` selects a `0x28`- or `0x4C`-sized working path;
- unsupported mode `2` enters the executable's assertion/error path;
- a reset/update handler reinitializes the definition on event type `1`.

`ManyGenerateDrawLine`:

- allocates separate vertex and index buffers;
- derives buffer counts from the source draw resource and segment/mode bytes;
- advances time, rebuilds line geometry, and submits the resulting draw buffers.

It is the renderer/path stage; it does not decide target-ground ownership.

`Position3DMapBind` and its generated variant:

- mark terrain projection dirty on construction;
- take an owner/root transform plus a connected local/generated offset;
- call map query `0x00D85800` at the candidate point;
- retry with a small positive Y adjustment when the first query misses;
- cache the projected terrain height;
- produce the final output transform from projected Y plus local offset;
- the generated variant integrates generated motion before performing the same projection.

`GenerateMaster`:

- tracks previous/current positions and traveled distance;
- accumulates distance at runtime `+0x3C`;
- evaluates connected source scalars for emission count, base interval, interval variance, and probability-like gating;
- emits child units while the accumulated distance exceeds the next interval, with a hard safety cap of `0x65` iterations per update.

The decomp confirms the algorithm and runtime offsets. It does not yet authorize assigning every serialized WSS float to radius, lifetime, velocity, or spread. The raw SEDB node descriptors are recovered, but the instance-value-to-input-port join is still open.

Full decompiler output is stored in `tools/outputs/ifrit-ground-vfx-decomp-20260805`.

## Candidate packages after the correction

| Bank | Exact VEFF evidence | Placement | Current interpretation |
|---|---|---|---|
| m852 WSS5 | one 15,356-byte VEFF; UnitTime + Sphere + MotionEmission + DrawLine; `rg0fire06/07`, fire, glow, distortion | caster/root relative | first untested radial Plume/pre-warning probe |
| m852 WSS12 | three VEFFs, 65,852 / 19,233 / 28,236 bytes; caster/bom/target branches | generated local/root | large special; Plume or Hellfire candidate only |
| m852 WSS13 | three VEFFs, 65,852 / 19,233 / 40,592 bytes | generated local/root | related larger special variant |
| m852 WSS14 | three VEFFs, 84,684 / 19,425 / 46,124 bytes; extra smoke/rings/planes | generated local/root | most elaborate related special variant |
| m852 WSS17 | one 24,556-byte VEFF with true MapBind | terrain-projected from caster/root | paw/hand ring; excluded by live observation |
| m852 WSS21 | byte-identical visual resources to m999 WSS2 | actor caster/target | smaller impact wrapper |
| m852 WSS22 | byte-identical visual resources to m999 WSS3 | actor caster/target | large impact wrapper |

WSS5 source: `vfx/mon/ifrit_852/skill05/ift_sklc5y.veff`; VEFF SHA-256 `3133849a5de75ac17aee97d1b6ada4eaaf8f5a8892fe450c9359ebc939336b97`.

WSS17 source: `vfx/mon/ifrit_852/skill17/ift_sklchy.veff`; VEFF SHA-256 `c4261c0b3b5260e65468fbc8aa36594778da947eb3ab519bcdf3695a4b9ee2e9`.

## Visibility-first invocation matrix

`!playanimation` is not the correct validation route for these authored action packages. The packed WSS selector is:

```text
packed = 0x13000000 | (WSS << 12)
```

| Probe | Packed value | Required source/owner | Target requirement |
|---|---:|---|---|
| m852 WSS5 | `0x13005000` | instantiated m852-compatible actor at desired origin | caster-owned; no Ifrit target required |
| m852 WSS12 | `0x1300C000` | m852-compatible actor/helper | self plus authored bom/target branches; target actor matters |
| m852 WSS13 | `0x1300D000` | m852-compatible actor/helper | same |
| m852 WSS14 | `0x1300E000` | m852-compatible actor/helper | same |
| m852 WSS17 | `0x13011000` | m852-compatible actor | caster/root; already excluded for Eruption |
| m852 WSS21 | `0x13015000` | m852 wrapper-compatible actor | impact comparison |
| m852 WSS22 | `0x13016000` | m852 wrapper-compatible actor | impact comparison |
| native m999 WSS2 | `0x13002000` | m999-compatible actor | smaller impact |
| native m999 WSS3 | `0x13003000` | m999-compatible actor | large impact |
| Nail m524 WSS1 | `0x13001000` | m524 Nail actor | self-targeted action is the known route |

For a frozen Eruption warning, the source/target must not be the moving player if the selected branch follows its actor. Spawn or move a presentation-only compatible helper to the cast-start snapshot, instantiate it for clients, run the candidate scheduler on that helper, and remove/cancel it at impact. A moving-target A/B test distinguishes this immediately.

The first minimal visual test should be:

```text
spawn m852-compatible helper at GM/player snapshot
-> confirm helper instantiated and caller known
-> send packed WSS5 (0x13005000) on the helper
-> observe for 3 seconds
-> despawn helper
```

This is a reconstruction probe, not a claimed retail Eruption chain. If WSS5 is the wrong art, repeat with WSS12-WSS14 while recording caster, bom, and target ownership separately. Do not spend another test on WSS21/22 as pre-warnings; they duplicate the known impacts.

## Eruption implementation boundary

The server can already snapshot damage geometry. The missing visual coordinate is not present in the normal actor-target result packet. Therefore the most direct implementation model is:

```text
cast start
-> snapshot target XYZ
-> create client-visible, combat-inert effect helper at snapshot
-> run confirmed warning scheduler on helper
-> keep helper stationary if target moves
-> cancel/despawn warning at cast resolution
-> run native m999 WSS3 impact / command 23594
```

The scheduler in the third line is still unconfirmed. WSS5 is the next evidence-driven probe. Imported `init_msb5_1` is lower priority because it is command-unlinked, only 1.533 seconds at its recovered ACB layer, and raw bit `0x20` was live-negative on every tested carrier.

## Plume implementation boundary

Plumes need visible floor art at fixed arena positions or fixed radii. Current evidence supports two possible authored models:

- one radial scheduler on a center helper; or
- multiple actor-relative schedulers on stationary helpers placed at each plume origin.

WSS5 should be tested first because it is a compact generated radial ring package and was omitted from earlier probes. WSS12-WSS14 should follow as comparison renders, not as pre-labeled Plumes. Their size, common 130-frame `cbbm_sp_b03`, camera shake, and escalating layers are compatible with a major Hellfire family.

## Infernal Nail animation

Nail WSS1 is confirmed, not speculative:

- file: `m524/act/emp_emp/wss/base/0001`;
- 239,336 bytes; SHA-256 `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df`;
- `cbbm_sp_01`, 90 frames / exactly 3.000 seconds;
- `cbxs_st0 -> cbxs_st0to1 -> cbxs_st1` equipment-state vocabulary;
- MapBind and generated MapBind controls in VEFF `0W7Ar9anc_sklc1`;
- rises, settles by frame 55, and holds raised through frame 90.

The visible drop after WSS1 is the separate one-frame BID idle `cbbm_id0`, whose root Y is approximately `-6`. The correct choreography is a persistent-state handoff during the authored raised hold, not pausing or looping WSS1. Raw bit `0x10` / `cbbm_msb4_1` remains the strongest persistent Nail state candidate; its live blend behavior still needs capture.

The BID and active-model packages also preserve the rest of the Nail lifecycle:

| Motion/state | Frames / duration | Confirmed role |
|---|---:|---|
| `cbbm_activ` | 30 / 1.000 s | activation controller |
| `cbbm_deact` | 30 / 1.000 s | deactivation controller; distinct controller, shared sampled MTB with `activ` |
| `cbbm_ded` | 30 / 1.000 s | sink/collapse motion |
| `cbbm_dedpose` | 1 / 0.033 s | static terminal pose |
| `cbbm_msb4_1` | 1 / 0.033 s | aura-associated persistent body pose |

The active e002 death scheduler is a complete authored chain: cancel `init_msb4_1`, run `cbbm_ded`, reverse equipment with `cbxs_st1to0`, invoke `m524_ded`, enter `cbbm_dedpose`, play sound, and unlock the target. The remaining uncertainty is whether generic server `DEAD` automatically selects that model-specific scheduler.

## Bowl battlefield data

The Bowl layout remains separate from Eruption and Plumes:

- `data/61/5A/00/08.DAT`, 1,245,056 bytes;
- SHA-256 `56b24e6aca53911810848baf7be254a2c20038d8c127bcc0c8603ba6b0614e7c`;
- instance `isgrp_016280` -> unit `sgrp_vfx_ifring`;
- position `(2526.596924, 248.343002, 2208.061035)`;
- callable aliases `show`, `hide`, `vtp1`, `sho1`, `hid1`;
- VFX/sound/collision timelines for the persistent arena boundary.

The layout has no Eruption or Plume attribution and accepts no arbitrary target coordinate. It should be implemented as the boundary ring once its live map-object owner is recovered, not reused as a mechanic warning.

## Remaining decisive data

Static decomp has reached the ownership boundary. The next capture should record:

1. WSS5 on an instantiated m852-compatible helper at a fixed point;
2. WSS12-WSS14 with caster, bom, and target branches observed separately;
3. stationary-target and moving-target Eruption casts;
4. every actor create/move/state/action/delete packet from 500 ms before cast start to one second after WSS3 impact;
5. every SCB/RES/VEFF created between `cast_mon_11` and impact;
6. breakpoints `0x004DD01A`, `0x007A82F0`, `0x007A8457`, and `0x007A852C` for the bit-5 state candidate.

Until one candidate visibly renders, the implementation should not promote a semantic filename to retail fact. The immediate success criterion is simpler: obtain the correct visible floor art, prove whether it follows a helper or target, then wire its cast-start/clear/impact timing.

## Reproducible artifacts

- `tools/build_ifrit_ground_vfx_decomp.py`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/sources.csv`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/resources.csv`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/veff_controls.csv`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/scheduler_tokens.csv`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/pair_equivalence.csv`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/pair_equivalence_detail.json`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/veff_control_functions.cpp`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/veff_control_helpers.cpp`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/veff_resource_file.cpp`

The extractor verifies all listed source hashes before producing output. The Ghidra files are address-targeted decompilation of the installed 1.23b executable and retain generated `FUN_` names where no authoritative symbol exists.
