# Atomos action timelines and model-state closure — 2026-09-07

This bundle independently rereads the installed client and resolves the full
scheduler → action → effect chain. No game/runtime files were changed.

## New conclusions

1. **WSS9 and WSS10 have byte-identical functional schedulers.** They contain
   the same `main` and `mon_main` payloads, packaged in opposite order. Each
   `mon_main` binds the actor and runs `RaptureActionSubStatusSchKickClip`
   at authored time zero. Neither action hardcodes its similarly numbered
   visual effect. The old apparent 600000-vs-300000 duration difference was
   caused by reading the first scheduler instead of comparing matching IDs.
2. **Skill09 and skill10 are state effects in BID0000.** `init_msb4_1`
   explicitly launches `m070sk9c0c` and `m070sk9c1c`; `init_msb4_0` launches
   `m070sk10c0c` and `m070sk10c1c`. The established native mode-state path
   in the repository maps bit 4 (`0x10`) set/clear to those names when
   supported by loaded-model metadata. The mode update must be queued and
   consumed by a real status-kick action; playing WSS9 or WSS10 alone does
   not specify which state is wanted.
3. **The c0 and c1 state effects bind differently.** The c0 instances use
   `ActorBind` with `EID_CURRENT`; c1 uses `LeafMatrixCib` with `EID_BODY_DYN`.
   This is an actor effect plus a body-associated effect, with no skeletal
   `MotionClip` in either state scheduler.
4. **WSS3 is target-dependent, but the aetheryte-drain label remains a
   candidate.** Its target scheduler `m070_0003` starts target effect clip 2
   and `RaptureEffectAtoBClip` clip 3 at zero. WSS2/4 also have target
   effects. Native handler `0x821820` reads count 1 and clip index 2 from
   this AtoB record, verifies that index 2 is an ActionClip and sets that
   existing clip's mode to 2. It loads no separate tether resource.
   A generic actor-to-actor effect clip does not by itself prove
   an energy siphon or establish that its original target was a crystal.
5. **`cbbm_activ` is not established as a spawn/materialization animation.**
   It and `cbbm_deact` are 30-frame motions at 30 fps, with only a
   `MotionCommandClip`. Their CIBT tables link normal `cbnm_id0` and battle
   `cbbm_id0`; the corresponding idle tables refer back to activ/deact.
   Those transition links support battle-ready/unready motion. There is
   no color, fade, effect, visibility or spawn instruction in either MCB.
6. **The A/B looping poses are separate from WSS2–4.** BID contains
   `cbbm_sp_a_2lp` and `cbbm_sp_b_2lp`, each 50 frames at 30 fps. CIBC
   `info_m070` slots 24 and 26 select the A loop; slot 28 selects the B
   loop. The WSS2–4 `MotionClip`s select the one-shot `b01/a01/a02`, not
   those loops. Their CIBT records explicitly cross-link `b01` to the B
   loop and `a01/a02` to the A loop, using controls `03020000`; this
   establishes a transition relationship, not an infinitely looping WSS.

## Timing convention

All scheduler starts/durations below are original integer **authored units**.
Do not divide them by one million and publish them as seconds. Paired MTB
headers provide explicit 30 fps and frame counts: for example WSS3's MCB
duration is 900000 while its MTB is 90 frames, i.e. 3.0 s of source motion.
The motion pair therefore encodes 10000 units per authored frame. This is
evidence against treating these numbers as microseconds. Scheduler clocks,
playback speed, sync stalls and packet-driven scheduling still need native
timing closure before wall-clock action timings can be asserted.

## Exact visual chain

Source paths and content hashes for every step are in `effect_bindings.csv`.

| Bank | Scheduler | Clip | Start units | ACB | Effect | Binding |
|---|---|---:|---:|---|---|---|
| BID0000 | `init_msb4_0` | 2 | 0 | `init_msb4_0` | `m070sk10c0c.veffbin` | `EID_CURRENT` |
| BID0000 | `init_msb4_0` | 3 | 0 | `init_msb4_0_2` | `m070sk10c1c.veffbin` | `EID_BODY_DYN` |
| BID0000 | `init_msb4_1` | 2 | 0 | `init_msb4_1` | `m070sk9c0c.veffbin` | `EID_CURRENT` |
| BID0000 | `init_msb4_1` | 3 | 0 | `init_msb4_1_2` | `m070sk9c1c.veffbin` | `EID_BODY_DYN` |
| WSS0001 | `mon_main` | 8 | 300000 | `m070_0001_cas1` | `m070sk1c0c.veffbin` | `EID_CHEST` |
| WSS0001 | `mon_main` | 9 | 450000 | `m070_0001_cas2` | `m070sk1m0c.veffbin` | `EID_CURRENT` |
| WSS0001 | `m070_0001` | 2 | 0 | `m070_0001_tar` | `m070sk1t0c.veffbin` | `EID_BODY_STA` |
| WSS0002 | `mon_main` | 6 | 370000 | `m070_0002cas` | `m070sk2c0c.veffbin` | `EID_CURRENT` |
| WSS0002 | `m070_0002` | 2 | 0 | `m070_0002tar` | `m070sk2t0c.veffbin` | `EID_CURRENT` |
| WSS0003 | `mon_main` | 3 | 0 | `m070_0003cas2` | `m070sk3c1c.veffbin` | `EID_BODY_STA` |
| WSS0003 | `mon_main` | 7 | 100000 | `m070_0003cas1` | `m070sk3c0c.veffbin` | `EID_CURRENT` |
| WSS0003 | `m070_0003` | 2 | 0 | `m070_0003tar` | `m070sk3t0c.veffbin` | `EID_BODY_STA` |
| WSS0004 | `mon_main` | 6 | 30000 | `m070_0004cas2` | `m070sk4c1c.veffbin` | `EID_CHEST` |
| WSS0004 | `mon_main` | 7 | 100000 | `m070_0004cas` | `m070sk4c0c.veffbin` | `EID_CURRENT` |
| WSS0004 | `m070_0004` | 2 | 0 | `m070_0004tar` | `m070sk4t0c.veffbin` | `EID_BODY_STA` |
| WSS0005 | `m070_0005` | 2 | 0 | `m070_0005tar1` | `m070sk5c0c.veffbin` | `EID_CURRENT` |
| WSS0005 | `m070_0005` | 4 | 100000 | `m070_0005tar2` | `m070sk5c1c.veffbin` | `EID_BODY_STA` |
| WSS0006 | `mon_main` | 6 | 300000 | `m070_0006cas` | `m070sk6c0c.veffbin` | `EID_BODY_STA` |
| WSS0006 | `m070_0006` | 2 | 0 | `m070_0006tar` | `m070sk6t0c.veffbin` | `EID_BODY_STA` |
| WSS0007 | `mon_main` | 3 | 0 | `m070_0007tar` | `m070sk7c0c.veffbin` | `EID_CHEST` |
| WSS0007 | `m070_0007` | 2 | 0 | `m070_0001_tar` | `m070sk1t0c.veffbin` | `EID_BODY_STA` |

## Actual source motion durations

These seconds come only from the MTB's explicit frame count / fps.

| Bank | Motion | Frames | FPS | Source seconds | MCB units |
|---|---|---:|---:|---:|---:|
| BID0000 | `cbbm_deact` | 30 | 30 | 1 | 300000 |
| BID0000 | `cbbm_activ` | 30 | 30 | 1 | 300000 |
| BID0000 | `cbbm_sp_a_2lp` | 50 | 30 | 1.66667 | 500000 |
| BID0000 | `cbbm_sp_b_2lp` | 50 | 30 | 1.66667 | 500000 |
| BID0000 | `cbbm_ft_ded_1` | 40 | 30 | 1.33333 | 400000 |
| BID0000 | `cbbm_ft_ded_2lp` | 2 | 30 | 0.0666667 | 20000 |
| BID0000 | `cbbm_ft_ded_3` | 118 | 30 | 3.93333 | 1180000 |
| WSS0001 | `cbbm_sp_01` | 83 | 30 | 2.76667 | 830000 |
| WSS0002 | `cbbm_sp_b01` | 90 | 30 | 3 | 900000 |
| WSS0003 | `cbbm_sp_a01` | 90 | 30 | 3 | 900000 |
| WSS0004 | `cbbm_sp_a02` | 83 | 30 | 2.76667 | 830000 |
| WSS0005 | `cbbm_sp_02` | 90 | 30 | 3 | 900000 |
| WSS0006 | `cbbm_sp_03` | 90 | 30 | 3 | 900000 |
| WSS0007 | `cbbm_sp_04` | 90 | 30 | 3 | 900000 |
| WSS0008 | `cbbm_sp_04` | 90 | 30 | 3 | 900000 |

## Scheduler phases

For WSS1–10 the shared `main` requests `sht00` at zero, then `mon_main`
at 100000, with `ClipSyncClip` at 580000. Its authored block is 600000.
`sht00` is not embedded in these m070 banks, so external scheduler loading
and packet-selected owner/targets remain part of the full runtime path.

The following rows are local to each scheduler. Parent and child numbers
must not be added as wall-clock times without resolving the sync behavior.

| Bank | Scheduler | Duration units | Meaningful phase starts |
|---|---|---:|---|
| BID0000 | `init_msb4_0` | 1200000 | 0: ActionClip `init_msb4_0`; 0: ActionClip `init_msb4_0_2` |
| BID0000 | `init_msb4_1` | 300000 | 0: ActionClip `init_msb4_1`; 0: ActionClip `init_msb4_1_2`; 30000: RaptureChantSyncClip ``; 60000: RaptureEffectEndClip `2`; 60000: RaptureEffectEndClip `3` |
| BID0000 | `dead1` | 400000 | 0: MotionClip `cbbm_ft_ded_1` |
| BID0000 | `dead2` | 300000 | 0: MotionClip `cbbm_ft_ded_2lp` |
| BID0000 | `dead` | 1180000 | 0: MotionClip `cbbm_ft_ded_3` |
| WSS0001 | `mon_main` | 1100000 | 0: MotionClip `cbbm_sp_01`; 300000: ActionClip `m070_0001_cas1`; 450000: ActionClip `m070_0001_cas2`; 550000: RaptureCasterSchClip `m070_0001`; 1090000: ClipSyncClip `` |
| WSS0001 | `m070_0001` | 510000 | 0: ActionClip `m070_0001_tar`; 40000: RaptureActionSelectDamageMccClip `` |
| WSS0002 | `mon_main` | 1000000 | 0: MotionClip `cbbm_sp_b01`; 370000: ActionClip `m070_0002cas`; 490000: RaptureCasterSchClip `m070_0002`; 980000: ClipSyncClip `` |
| WSS0002 | `m070_0002` | 320000 | 0: ActionClip `m070_0002tar`; 30000: RaptureActionSelectDamageMccClip `` |
| WSS0003 | `mon_main` | 1100000 | 0: MotionClip `cbbm_sp_a01`; 0: ActionClip `m070_0003cas2`; 100000: ActionClip `m070_0003cas1`; 300000: RaptureCasterSchClip `m070_0003`; 1090000: ClipSyncClip `` |
| WSS0003 | `m070_0003` | 310000 | 0: ActionClip `m070_0003tar`; 0: RaptureEffectAtoBClip ``; 30000: RaptureActionSelectDamageMccClip `` |
| WSS0004 | `mon_main` | 1200000 | 0: MotionClip `cbbm_sp_a02`; 30000: ActionClip `m070_0004cas2`; 100000: ActionClip `m070_0004cas`; 430000: RaptureCasterSchClip `m070_0004`; 1180000: ClipSyncClip `` |
| WSS0004 | `m070_0004` | 510000 | 0: ActionClip `m070_0004tar`; 30000: RaptureActionSelectDamageMccClip `` |
| WSS0005 | `mon_main` | 1010000 | 0: MotionClip `cbbm_sp_02`; 0: RaptureCasterSchClip `m070_0005`; 990000: ClipSyncClip `` |
| WSS0005 | `m070_0005` | 1200000 | 0: ActionClip `m070_0005tar1`; 30000: RaptureActionSelectDamageMccClip ``; 100000: ActionClip `m070_0005tar2` |
| WSS0006 | `mon_main` | 1000000 | 0: MotionClip `cbbm_sp_03`; 300000: ActionClip `m070_0006cas`; 370000: RaptureCasterSchClip `m070_0006`; 980000: ClipSyncClip `` |
| WSS0006 | `m070_0006` | 400000 | 0: ActionClip `m070_0006tar`; 40000: RaptureActionSelectDamageMccClip `` |
| WSS0007 | `mon_main` | 1000000 | 0: MotionClip `cbbm_sp_04`; 0: ActionClip `m070_0007tar`; 350000: RaptureCasterSchClip `m070_0007`; 980000: ClipSyncClip `` |
| WSS0007 | `m070_0007` | 930000 | 0: ActionClip `m070_0001_tar`; 30000: RaptureActionSelectDamageMccClip `` |
| WSS0008 | `mon_main` | 1120000 | 0: MotionClip `cbbm_sp_04` |
| WSS0009 | `mon_main` | 300000 | 0: RaptureActionSubStatusSchKickClip `` |
| WSS0010 | `mon_main` | 300000 | 0: RaptureActionSubStatusSchKickClip `` |

## State lifecycle and lifetime limits

`init_msb4_1` starts two ActionClips at zero, reaches a chant-sync clip at
30000, and has explicit EffectEnd clips for action IDs 2 and 3 at 60000.
`init_msb4_0` starts its two skill10 actions at zero without matching
EffectEnd clips. A chant-sync instruction can stall the timeline; therefore
the short encoded times are not proof that the state-on effect lasts only
a fixed fraction of a second. Whether its lifetime tracks mode, chant or
another status must be checked in native or live playback.

The two state-on ACBs have `+0x9C=0xC0, +0xA0=0x101`; the two state-off
ACBs have `0x80, 0x1`. This matches the persistent-on versus ordinary/off
wrapper pattern already recovered for Garuda's model-state VFX. These
flags strengthen the sustained-state interpretation of skill09, with
skill10 as the transition out; they do not establish the historical
event trigger or identify the rendered appearance without playback.

WSS9/10 supply a kick, not a distinct pair of hardcoded toggles. Both are
valid candidate dispatch envelopes after queueing the desired mode. The
historical event's original skill ID, mode sequencing and target choices
are not recovered by this asset-only pass.

## Corrected reading of WSS5/7/8

WSS5 launches `m070_0005` through `RaptureCasterSchClip` at zero and its
child scheduler selects ACBs `m070_0005tar1` and `m070_0005tar2`, even though
their terminal VFX are named caster `c0/c1`. Consequently a c/t suffix
alone cannot establish runtime actor ownership. WSS7's `mon_main` starts
ACB `m070_0007tar` at zero (terminal skill07 caster VFX), then launches a
child using the skill01 target effect. WSS8 has the same source motion as
WSS7 but no ActionClip, and retains a sound clip at 310000. It is not
strictly a silent motion-only bank.

## Reproduce and inspect

```powershell
python tools/decompile_atomos_action_timelines.py
```

- `source_manifest.csv`: byte counts and SHA-256 for all 11 input banks.
- `scheduler_clips.csv`: every clip, actor index, flags, raw record and offset.
- `effect_bindings.csv`: exact ACB/VINS/leaf/VEFF identity and attachment tokens.
- `motion_metrics.csv`, `motion_command_clips.csv`: MTB metrics and all MCB commands.
- `cibt_transitions.csv`, `cibc_slots.csv`: normal/battle transitions and cast loop slots.
- `wss9_wss10_equality.csv`: byte-for-byte functional scheduler comparison.
- `action_wrapper_fields.csv`: authored wrapper lifetimes/flags without inferred semantics.

This extraction does not recover server spawn/wave logic, exact event-state
bindings, a semantic attack-name mapping, or the proprietary effect renderer.

Native mechanism reference: `outputs/flan-spirit-color-transition-decomp-20260831/`
and `docs/ifrit-animation-decomp-2026-08-02/MODEL_STATE_KICK_PLUME_ERUPTION_BREAKTHROUGH_2026-08-05.md`.
The independently decompiled AtoB handler is in sibling `../native/effect-atob-native.txt`.

## Installed model metadata and loader closure

The installed Atomos skeleton bank **does advertise bit 4**, so the asset
gate is now confirmed rather than conditional:

| Field | Recovered value |
|---|---|
| Source | `client/chara/mon/m070/skl/0001` |
| Source size / SHA-256 | `11392` / `54325160e1cf992afacffa08b76f1c0d8b6582bee7e1e545ae93f5edc660b95f` |
| Metadata resource | `info_m070`, `cib\cibb\mon\info_m070` |
| Metadata size / SHA-256 | `84 (0x54)` / `3f06549fb94e77ed9974b164746a1661e7c483775073d1c9000952a0ca23d5e0` |
| Version byte `+0` | `1` |
| Serialized flags byte `+3` | `0x00` |
| Ordinal split byte `+0x35` | `4` |
| Supported-state mask byte `+0x3B` | `0x10` |
| Derived ordinal / independent-bit partitions | `0x0F` / `0xF0` |

The raw `+3=0` byte is expected. Retail Cibb constructor `0x852120`
installs vtable `0x10409F4`, stores its resource pointer, and calls initializer
`0x850C10`. That initializer accepts version 1 records of at least `0x54`
bytes, then sets `record[3] |= 0x80`. This exact installed record therefore
passes validation and acquires the runtime-ready flag consumed by
`0x65BE50` / `0x65C550`. Raw bytes, function hashes and disassembly are saved
in `model_state_metadata.json` and `cibb_loader_native.txt`.

**Correction to older gate descriptions:** `0x7A82F0` uses the low mask
`(1 << split) - 1` for `init_msnNNN`, and its eight-bit complement for
independent `init_msbN_*` on/off states. The older Ifrit report's statement
that bit 4 requires a split count of at least 5 is incorrect. Atomos's
split 4 leaves bit 4 in the independent-state partition. Its supported
mask `0x10` advertises precisely that bit. Thus, with the model loaded,
the desired mode transition and a consumed status kick, `0 -> 0x10`
reaches `init_msb4_1` and `0x10 -> 0` reaches `init_msb4_0`.

This closes the installed client state gate; it still does not establish
which original event phase requested that mode or what its effects look
like in a faithful live render.
