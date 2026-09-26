# Infernal Nail rise, return, and held-state handoff decomp

Snapshot: **2026-08-03, 11:29:29 -04:00 source pin; installed FFXIV 1.23b client data**  
Policy: **read/decompile and Markdown only**. No game DAT, server source, SQL, script, executable, packet definition, build artifact, capture, or gameplay data was changed for this report.

This report answers one narrow question: the Infernal Nail rises and then appears to go back down. Is that one animation that should be paused or split, and what should hold the Nail up afterward?

## Bottom line

**Do not treat this as one animation that reverses and needs to be paused.** The installed `m524` WSS1 body motion reaches the raised position, settles there, and holds that position through its final authored frame. The downward result comes after WSS1 releases and the actor falls back to a separate one-frame battle-idle pose whose `n_hara` Y value is approximately `-6`.

The client resources therefore form a handoff:

`buried idle -> WSS1 rise/grow -> raised hold -> persistent active Nail state`

The currently observed failure is at the final arrow. It is not an authored `up -> down` tail inside WSS1.

The present server/API surface also has no recovered pause, seek, playback-rate, or stop-at-frame control. It can select an animation or action bank, publish actor state/substate, and publish a presentation height. Splitting WSS1 or manufacturing a held frame would require client-data authoring, which is outside this read-only task and is not justified by the decomp.

## Direct proof that WSS1 does not go back down

Installed source:

- path: `client/chara/mon/m524/act/emp_emp/wss/base/0001`;
- file size: `239,336` bytes;
- SHA-256: `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df`;
- outer body motion: `cbbm_sp_01`;
- motion-transform size: `1,879` bytes;
- motion-transform SHA-256: `dd9ce2e2a0f918a3839101d40a9cb21fe9f7a12d84563727c2dcb3df138d9fd3`;
- skeleton: 12 bones;
- rate and duration: 90 frames at 30 fps, exactly 3.000 seconds.

The previously identified `n_hara` Y curve has a center of `-2.958732367` and half-range `3.041267157`. Its terminal keys decode as follows:

| Frame | Time | Quantized value | Decoded local Y |
|---:|---:|---:|---:|
| 53 | 1.7667 s | `32767` | `+0.082534790` |
| 54 | 1.8000 s | `32130` | `+0.023411673` |
| 55 | 1.8333 s | `31877` | `-0.000070507` |
| 90 | 3.0000 s | `31877` | `-0.000070507` |

Frame 53 is the small top-of-rise overshoot. By frame 55 the curve has settled essentially to zero. Frame 90 repeats the exact same quantized value as frame 55. WSS1 therefore contains an authored raised hold of approximately 35 frames, about 1.17 seconds, before the bank ends.

There is no negative terminal tail and no return-to-`-6` key in WSS1. Pausing WSS1 at frame 55 would merely freeze a pose the asset already holds until frame 90.

The same WSS motion grows the spikes toward full scale. The outer scheduler names:

- `cbbm_sp_01`;
- equipment model `m524e001`;
- `cbxs_st0`;
- `cbxs_st0to1`;
- `cbxs_st1`;
- `m524_0001_cas`;
- `MotionClip`, `RaptureStatusLockClip`, server/client movement-stop clips, `RaptureSoundClip`, `ActionClip`, and `RaptureActionSubStatusSchKickClip`.

The WSS1 bytes contain no `cbxs_st1to0`, no `cbbm_id0`, no `cbbm_deact`, and no `cbbm_msb4_1` reference. The rise package requests the forward equipment path, not an authored return.

## The actual buried fallback is in BID

Installed source:

- path: `client/chara/mon/m524/act/emp_emp/bid/base/0000`;
- file size: `16,960` bytes;
- SHA-256: `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17`.

`cbbm_id0` is a one-frame battle-idle motion. Its constant transform records include:

| Bone | Channel | Value | Meaning |
|---:|---:|---:|---|
| 1 (`n_hara`) | `0x0C` / local Y | `-5.999999523` | Buries the body approximately six units below the actor origin |
| spike bones | scale channels `0x0E`-`0x10` | commonly `0.3 x 0.5 x 0.5` | Contracted Nail geometry |
| top spike | scale channels `0x0E`-`0x10` | `0.5 x 0.5 x 0.5` | Contracted top |

That single idle record explains the visible return. Once WSS1 releases, ordinary battle idle restores the buried root and contracted spike pose unless another persistent state has taken ownership.

`cbbm_activ` and `cbbm_deact` are not held-raised body transforms. They are distinct 30-frame controllers, but their sampled MTB bytes are identical to one another and retain the same `n_hara Y = -5.999999523` constant and contracted scale values. Their separate MCB/CIBT semantics matter for activation and deactivation, but their MTB is not a replacement raised idle.

The authored death path is separate again:

- `cbbm_ded` sinks `n_hara` toward approximately `-5.500414` while contracting the spikes;
- `cbbm_dedpose` is the one-frame collapsed terminal pose;
- the active e002 death scheduler explicitly invokes `cbxs_st1to0`.

That downward death/deactivation family should not be confused with the unwanted post-WSS idle fallback.

## The persistent active-state candidate is another layer

The BID also contains one-frame `cbbm_msb4_1`:

- MTB size: `647` bytes;
- MTB SHA-256: `a67be74338cc330e724819cb24a7ee6b4bc4c4d1ac98db8eee9bf11b50c29ec3`;
- MCB size: `592` bytes;
- MCB SHA-256: `a2054bc2b9ca39698eb216a7dedad06554091fa3e9301bcc7d9c13a623e01b86`.

Unlike `cbbm_id0`, this pose does not carry a constant `n_hara Y = -6` record. Its recovered constant transform records are principally local-X offsets for `n_hara`/spike bones. The associated e002 package separately contains `init_msb4_1`, the `m524_body_aura` effect curve, and its persistent body visual.

This makes breakage/substate 4, serialized as raw bit `0x10`, the strongest recovered persistent-active Nail candidate. It still leaves one runtime-only ambiguity:

1. **Absolute/replacement interpretation:** `cbbm_msb4_1` replaces battle idle and missing Y resolves from the raised bind/rest pose. The correct actor presentation height would remain zero.
2. **Additive/overlay interpretation:** `cbbm_msb4_1` layers its X offsets/effect over `cbbm_id0`, leaving the base `n_hara Y = -6`. A presentation-height bridge of approximately `+6` would still be required.

The static resource graph proves the pose/effect package exists, but it does not prove which blend interpretation the live 1.23b renderer uses for this substate. One packet-synchronized capture can decide it.

## There are two independent clocks, not one monolithic clip

| Layer | Resource | Authored length | Relevant terminal behavior |
|---|---|---:|---|
| Body rise/growth | WSS1 `cbbm_sp_01` | 90 f / 3.000 s | Settles high by frame 55 and holds high through frame 90 |
| Equipment dormant | `cbxs_st0` | 99 f / 3.300 s | Dormant model state |
| Equipment transition | `cbxs_st0to1` | 29 f / 0.967 s | Dormant-to-active transition |
| Equipment active | `cbxs_st1` | 99 f / 3.300 s | Active model state |
| Equipment reverse | `cbxs_st1to0` | 9 f / 0.300 s | Exists in equipment/death content but is not named by WSS1 |
| Ordinary battle idle | `cbbm_id0` | 1 f / 0.033 s | Buried `n_hara Y = -6` fallback |
| Persistent aura pose | `cbbm_msb4_1` | 1 f / 0.033 s | Separate msb4 active-state pose; live blend semantics unproved |

Waiting for the 3.3-second equipment surface and holding the 3.0-second body root are related but not identical problems. A single wait value cannot guarantee a seamless visual handoff if the body drops to BID idle before the persistent equipment/substate state becomes authoritative.

## Current source handoff at the pinned snapshot

The repository was changing during this investigation. These statements are time-bounded to `Data/scripts/directors/InstanceRaid/IfritEncounter.lua`, 74,141 bytes, modified `2026-08-03 11:29:29.835 -04:00`, SHA-256 `893fac8e00fbd905b018743111618ba21567efb9e138610c8689d28a7bc0b217`.

At that snapshot the Nail sequence does the following after WSS1 begins:

- waits `NAIL_STABLE_SECONDS = 3.35`;
- toggles breakage index 4 / raw bit `0x10`;
- sets presentation-only floating height to `6.0`;
- marks the substate dirty;
- waits another `0.5` seconds before targetable reveal.

The body motion ends at 3.000 seconds, while this combined aura/height handoff is requested at 3.350 seconds. That leaves a nominal 0.350-second interval in which the client can restore buried `cbbm_id0`. Network and render-tick timing can make the dip shorter or longer, but the static schedule does not make it impossible.

`Actor.PostUpdate` serializes a dirty position before a dirty substate in the same update pass. At this snapshot the client is therefore expected to receive the height-bearing position update before the `0x0144` substate update when both are flushed together. That ordering is exact current-server evidence; whether the renderer applies both before one visible frame is not.

The current `SetFloatingHeight(6.0)` attempt is a presentation-origin compensation for the separate `-6` idle root. It is not an animation pause. It leaves authoritative XYZ, combat range, navigation, and floor position unchanged.

## Why the current API cannot pause or split it

`PlayAnimationOnActorPacket` is opcode `0x00DA`. Its builder receives only:

- source actor ID in the subpacket envelope;
- one `animationID`, serialized into an eight-byte payload.

There is no frame index, elapsed time, speed, loop count, pause flag, stop flag, or blend target.

The Nail uses self-targeted X01 through `DoSelfTargetedBattleAction(23366, 0x13001000)`. `CommandResultX01Packet` contains the source, packed animation ID, command ID, explicit target, and result fields. It likewise has no pause/seek/stop control.

A repository-wide read of the current Map Server found no general animation pause, seek, playback-rate, or stop API. That does not prove the original retail protocol had no undocumented control, but no such control is implemented or evidenced here. Inventing a packet without a retail capture would be speculation.

## Ranked ways to hold the Nail up

These are findings and experiment priorities, not source changes performed by this report.

### 1. Handoff to the persistent raised state during WSS1's existing hold window

This is the cleanest conceptual solution. WSS1 naturally holds raised from approximately 1.833 to 3.000 seconds. Publish the persistent msb4/equipment state early enough that it owns the Nail before WSS1 releases, then let WSS1 finish normally.

Advantages:

- no animation pause is needed;
- no repeated fire/growth replay;
- no modified client bank;
- late-join reconstruction can use stable actor substate rather than an in-progress one-shot.

Unknown: the WSS scheduler's status/model locks may defer or overwrite a substate change made before the action completes. A capture must show whether raw `0x10` becomes visually authoritative during the terminal hold.

### 2. Bridge the 3.000-to-3.300/3.350-second boundary with presentation height

If the action must fully release before msb4 is accepted, split the responsibilities conceptually:

- apply the approximately `+6` presentation-height compensation at the body-motion release boundary, so `actor origin +6` cancels `cbbm_id0 n_hara Y -6`;
- latch the persistent aura/equipment state separately after its safe scheduler boundary;
- determine from capture whether msb4 is additive or replacement before deciding whether height should remain `+6` or return to `0` after the latch.

This avoids a deliberate 0.35-second buried interval. It is still a handoff, not a paused animation, and exact values/timing remain capture-dependent.

### 3. Use a dedicated held-pose bank only if retail evidence requires it

A one-frame raised BID idle or a held WSS overlay could technically eliminate fallback, but producing either would author or patch client data. It would also need correct equipment state, aura ownership, death transition, and late-join behavior. No such asset was created, and this decomp does not justify changing the installed data.

### Rejected approaches

- **Pause WSS1 at frame 55:** unsupported by the current packet/API and redundant because WSS1 already holds that value through frame 90.
- **Stop WSS1 early:** no stop control exists; interruption risks leaving scheduler locks, VFX, sound, and equipment state unresolved.
- **Replay WSS1 repeatedly:** restarts the rise, rock/fire/glow, spike growth, action envelope, and sound instead of producing a stable Nail.
- **Use `cbbm_activ` as the held body:** its sampled transform retains the same buried root and contracted scales as idle.
- **Use `deact`, `ded`, or `st1to0`:** these are reverse/terminal paths and intentionally move away from a live mature Nail.
- **Move authoritative world Y:** changes combat/floor semantics and is unnecessary when a presentation-only height field already exists.
- **Split or patch the DAT now:** violates the no-data-change boundary and skips the unresolved msb4 blend question.

## Decisive no-change capture checklist

No capture was made in this read-only pass. A future test should timestamp the following against the same Nail actor ID:

| Evidence | What to record | What it decides |
|---|---|---|
| X01 action | command `23366`, animation `0x13001000`, source and self-target | Confirms WSS1 start time |
| Video frames | 60 fps or higher from 1.7 through 3.6 seconds | Finds exact overshoot, settle, release, dip, and recovery frames |
| Position packet | opcode `0x00CF`, floating height, arrival time | Shows whether `+6` arrives before or after the visible fallback |
| Substate packet | opcode `0x0144`, raw breakage byte containing `0x10` | Shows when msb4 is requested |
| Post-substate pose | actor origin/visible base immediately after `0x10` | Distinguishes additive from replacement msb4 behavior |
| Late join | fresh instantiation after the one-shot has ended | Proves whether stable height/substate reconstructs without replaying WSS1 |

Interpretation guide:

- a dip beginning at approximately 3.000 seconds before the position packet means BID fallback won the handoff;
- a lift only when the position packet arrives means the `+6` compensation is active but late;
- an extra six-unit lift after `0x10` means msb4 likely restores raised/bind Y and the retained height is double compensation;
- a stable floor-level Nail after `0x10` with height still `+6` supports additive msb4 over buried idle;
- no visible response to a received height packet would move the problem to client consumption of the position field.

## Evidence pins

Installed immutable client files:

| File | Bytes | SHA-256 |
|---|---:|---|
| `m524/act/emp_emp/wss/base/0001` | 239,336 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` |
| `m524/act/emp_emp/bid/base/0000` | 16,960 | `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17` |
| `m524/equ/e001/top_tex1/0000` | 398,688 | `66a02509a91af1fe6712021039e0a9dabc547aa50fca773fd6e981037dd19f84` |
| `m524/equ/e001/top_tex2/0000` | 1,578,336 | `d05fab52feff84056b9213fd8b19cbcf80fb740cdc451b805be03c5041d2d509` |
| `m524/equ/e002/met_mdl/0001` | 352,064 | `5a5a4414c7327ca5dd0f04d78677e76827d535126b8db3edd5633a7ea24784ff` |

Current server surfaces inspected at the source pin:

| File | SHA-256 | Relevant evidence |
|---|---|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | `893fac8e00fbd905b018743111618ba21567efb9e138610c8689d28a7bc0b217` | WSS1 request, 3.35-second handoff, raw `0x10`, height `6.0` |
| `Map Server/Actors/Actor.cs` | `d31e8509b88485a0e5611b358e360030819706ff88bb9019fed49b74a500f2c7` | Floating-height clamp/dirty flag and position-before-substate update ordering |
| `Map Server/Actors/Chara/Character.cs` | `eb205f8697c914f5390e081fd052f6bd4446ebb83abbf7f064930d423722a660` | Animation and battle-action send surface |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | `94193b75d2fec46c7f7decc9b17700f664390029634200399014f49ed7c6db20` | Self-targeted X01 wrapper |
| `Map Server/Packets/Send/Actor/PlayAnimationOnActorPacket.cs` | `54752b5824193f021e69cbb4499fb2999abe468b10cdada4bd0eb28e4a730e89` | Animation-ID-only opcode `0x00DA` payload |
| `Map Server/Packets/Send/Actor/Battle/CommandResultX01Packet.cs` | `67a4ad972c25d036969fa702abb7e407604da2d670627ee9c32f5c84c956cb23` | X01 fields; no pause/seek/stop control |

## Final conclusion

The Nail's rise is already complete and correctly held inside WSS1. The apparent return is the client restoring a different resource: one-frame `cbbm_id0`, with `n_hara Y` authored at approximately `-6`. The correct engineering model is therefore **finish WSS1 and hand off to a persistent raised state**, not **pause one animation halfway through**.

The strongest recovered persistent state is breakage/substate 4 / raw `0x10` with `cbbm_msb4_1` and `m524_body_aura`. The remaining question is whether that state replaces buried idle or overlays it. Until a timestamped render/packet capture answers that, the safe conclusions are: do not loop, stop, or split WSS1; avoid the 3.000-to-3.350-second ownership gap; and treat presentation height only as a bridge whose post-msb4 value must be verified.
