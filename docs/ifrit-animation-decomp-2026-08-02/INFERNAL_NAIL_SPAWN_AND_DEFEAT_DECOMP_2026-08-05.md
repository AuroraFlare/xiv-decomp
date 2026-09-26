# Infernal Nail Spawn and Defeat Decomp

Date: 2026-08-05  
Scope: retail FFXIV 1.23b Infernal Nail (`m524`) presentation  
Goal: keep the Nail's spawn/rise and defeat/collapse as two separate, native client animation paths.

## Bottom line

The Nail does have two distinct presentation chains:

1. **Spawn / rise:** native `m524` WSS1, invoked caster-side with command `23366` and battle animation `0x13001000`. It raises the Nail, starts its VFX and sound, transitions the equipment state from `cbxs_st0` to `cbxs_st1`, and contains the model-state scheduler kick.
2. **Defeat / collapse:** the Nail actor enters `MAIN_STATE_DEAD`. The active `m524/e002` equipment package contains a dedicated `dead` scheduler that cancels the persistent aura, plays `cbbm_ded`, transitions `cbxs_st1to0`, runs the death VFX/action clip, settles into `cbbm_dedpose`, and unlocks the target.

Do **not** use the spawn WSS result branch as a defeat animation. Do **not** immediately delete the Nail when it dies. The correct defeat input is the actor's death-state transition, with enough corpse lifetime for the native `dead` scheduler to finish.

One important correction to the earlier investigation: the persistent aura's `init_msb4_1` state is selected by the opcode `0x0144` **mode field** set to `0x0010`. It is not selected by setting `breakage = 0x10`.

## Confidence labels

- **Confirmed asset structure:** directly parsed from retail DAT resources.
- **Confirmed executable path:** recovered from `ffxivgame.exe` dispatch/decompilation.
- **Strong runtime reconstruction:** resource and executable paths agree, but the complete sequence has not yet been visually captured in the retail client.
- **Needs live capture:** the remaining point that should be verified with packet and scheduler breakpoints.

## Nail actor and equipment

The Infernal Nail is model `m524`, currently spawned by the server with:

- base model: `10524`
- body: `1024` (`e001`)
- head: `2048` (`e002`)
- size: `2`
- initial presentation height: `0.0`
- mature presentation height in the current workaround: `+6.0`
- one-shot death lifecycle
- current post-death lifetime: approximately 4 seconds

The head/equipment value `2048` makes `m524/e002` the strongest candidate for the active equipment state and death package. The `e001` package also contains a `dead` resource and may be an additional equipment-root dependency, but `e002` is the richer Nail-specific path and contains the aura cancellation.

---

## 1. Spawn / rise animation

### Native invocation

| Field | Value |
|---|---:|
| Command ID | `23366` |
| Battle animation | `318771200` / `0x13001000` |
| Native actor | the Nail itself (`m524`) |
| Branch | caster-side `X00` |
| WSS | `client/chara/mon/m524/act/emp_emp/wss/base/0001` |
| WSS file size | 239,336 bytes |
| WSS SHA-256 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` |

This presentation does not require Ifrit to be targeted. The Nail is the animation owner and should run the command on itself through the caster-side branch.

The self-target/result-side `X01` branch previously produced an immediate defeated/retract-looking tail in live testing. That branch is not the correct persistent spawn path. Keep spawn on `X00` and reserve the actor death state for actual defeat.

### WSS1 outer scheduler

- scheduler: `system/shoot_mon/main`
- size: 1,936 bytes
- SHA-256: `7da7...c0422`
- outer active envelope: approximately 0.6 seconds / 23 entries

The WSS selects the Nail model scheduler:

- resource: `vfx/mon/anchor_524/skill01/mon_main`
- size: 1,792 bytes
- SHA-256: `1c830b159dac661488133829fd9fb26387b513fd968fcf1454d5ab76536f139a`
- active envelope: 1.0 second / 11 scheduler entries

### Recovered WSS1 model-scheduler order

RIDT joins, clip-class order, and scheduler record timestamps produce the following sequence:

| Start | Scheduler work |
|---:|---|
| `0.000 s` | Start body motion `cbbm_sp_01`; select dormant equipment state `cbxs_st0`; acquire status and movement locks. |
| `0.220 s` | Play Nail spawn sound and launch action clip `m524_0001_cas`. |
| `0.610 s` | Begin equipment transition `cbxs_st0to1`. |
| `0.860 s` | Run `RaptureActionSubStatusSchKickClip`. This is the model-state commit point used by queued opcode `0x0144` mode changes. |
| `0.900 s` | Select the persistent raised equipment state `cbxs_st1`. |
| `1.000 s` | The model scheduler's active envelope ends; the authored body motion continues independently. |

The clip-to-record mapping is strongly supported by the scheduler class table, RID references, and ordering. The exact invocation should still be verified once at the scheduler-creation breakpoints.

### Body rise curve

`cbbm_sp_01` is a real authored rise, not a generic animation envelope:

- outer MCB: 592 bytes, SHA-256 `f0bc...c0ac`
- nested MCB: 528 bytes, SHA-256 `e770...6416`
- MTB: 1,879 bytes, SHA-256 `dd9ce2e2...d9fd3`
- length: 90 frames at 30 fps = 3.0 seconds
- root bone: `n_hara`
- result: the Nail rises from its buried starting transform, reaches the raised position around frame 55 (`~1.833 s`), and holds that raised transform through frame 90

There is no authored downward tail in `cbbm_sp_01`. The buried fallback comes from the idle resource `cbbm_id0`, whose root sits approximately six units below the raised state.

Equipment state progression:

```text
cbxs_st0 -> cbxs_st0to1 -> cbxs_st1
```

`cbxs_st0to1` is 29 frames, approximately 0.967 seconds.

### Spawn VFX package

- skill RES: 90,400 bytes, SHA-256 `df3decfd...ba030`
- VEFF: `0W7Ar9anc_sklc1`
- VEFF size: 25,504 bytes
- VEFF SHA-256: `d8ecaf7...a7c65`
- VFX action clip: `m524_0001_cas`
- ACB size: 1,016 bytes
- ACB SHA-256: `c6602165...a37`

The package includes fire, rock/debris, glow, distortion, and camera-shake components. It contains `Position3DMapBind:CoordRoot`, generated map binding, and `GenerateMaster`. The VFX instance uses `EID_CURRENT`, so the Nail actor—not Ifrit and not a target player—is the attachment owner.

### Persistent aura / raised state

The active Nail equipment package is:

`client/chara/mon/m524/equ/e002/met_mdl/0001`

- file size: 352,064 bytes
- SHA-256: `5a5a...84ff`

It contains:

| Resource | Purpose |
|---|---|
| `init_msb4_1` | enter the persistent Nail aura/state |
| `init_msb4_0` | leave/clear that state |
| `cbbm_msb4_1` | one-frame persistent state pose |
| `4rcIUdanc_body1` | persistent body aura VEFF |
| `m524_body_aura` | aura action/effect clip |

Important resource details:

- `init_msb4_1` RES: 59,407 bytes, SHA-256 `7462...0d55`
- nested `init_msb4_1` SCB: 1,552 bytes, SHA-256 `4682...0653`, active envelope 0.5 seconds / 8 entries
- aura VEFF `4rcIUdanc_body1`: 21,216 bytes, SHA-256 `5fe38...7b1`
- ACB `m524_body_aura`: 1,016 bytes, SHA-256 `be3618...410`
- `init_msb4_0` SCB: 1,312 bytes, SHA-256 `8948...09d`, active envelope approximately 0.04 seconds / 4 entries

### Correct opcode `0x0144` field

The executable separates three fields in the `0x0144` payload:

| Payload field | Executable route | Meaning |
|---|---|---|
| `+0`, `u32` | `0x7BF270`, queue type 2 | breakage/chant/guard/waste-style substate; does **not** directly select `init_msbN` |
| `+4`, `u16` | `0x7B4440`, queue type 3 | model-state mode bitmask consumed by `0x7A82F0` |
| `+6`, `u16` | `0x7A5260` | motion-pack change |

At `0x7A82F0`, each set/cleared bit is converted to a numbered resource request:

```text
set bit N   -> init_msbN_1
clear bit N -> init_msbN_0
```

For the Nail, state 4 is bit index 4:

```text
mode = 0x0010 -> init_msb4_1
mode = 0x0000 -> init_msb4_0, when transitioning from 0x0010
```

Setting `breakage = 0x10` is therefore the wrong byte/field. Earlier notes that called it a “breakage bit” are superseded by this executable trace.

The mode write is queued; it still needs a `RaptureActionSubStatusSchKickClip` to commit it. WSS1 supplies that kick at approximately `0.860 s`.

### Strong reconstructed spawn sequence

```text
1. Create m524 Nail with the intended e001/e002 equipment and buried/dormant presentation.
2. Instantiate it and publish ACTORSTATE_ACTIVE.
3. Run command 23366, battle animation 0x13001000, through Nail-owned X00/WSS1.
4. Queue opcode 0x0144 with mode = 0x0010 before WSS1 reaches its ~0.860 s SubStatusKick.
5. WSS1 starts cbbm_sp_01, launches the spawn VFX, transitions st0 -> st1,
   and commits init_msb4_1 at the scheduler kick.
6. Keep the Nail actor alive and targetable after the rise completes.
```

The safest first live test is to queue `mode=0x0010` immediately before starting WSS1, or shortly after WSS1 begins but definitely before `~0.860 s`. The exact best placement is a live-capture boundary, not yet a visually confirmed timing claim.

The current server's `+6.0` height handoff was introduced to compensate for falling back to the buried idle. Once `init_msb4_1` is proven to hold the correct raised state, that workaround may be redundant or may double-lift the Nail. Test the state latch first, then remove or retain the height bridge based on the observed transform.

---

## 2. Separate defeat / collapse animation

### Correct semantic trigger

Defeat should be initiated by normal lethal damage and the Nail actor entering:

```text
MAIN_STATE_DEAD = 1
```

The server state packet is opcode `0x0134`. In the current actor update path, death is emitted as an ordered triplet:

1. `SetActorStatePacket(actorId, DEAD, substate=0)`
2. X00 animation `0x72000062`
3. X01 animation `0x7C000062`, command `21001`, self result

This is separate from Nail spawn command `23366` and WSS1.

The retail packet dispatcher at `0x004DC690` reads the opcode at `0x004DC71A`. Opcodes `0x012E` through `0x013D`, including `0x0134`, enter the branch at `0x004DCFFF`, resolve the actor through `0x004D9910`, and call the resolved actor virtual handler at `0x004DD01A` (`vtable + 0x24`). Opcode `0x0144` reaches the same actor-handler call through the dispatcher's other switch group.

### Active `e002` death package

Path:

`client/chara/mon/m524/equ/e002/met_mdl/0001`

The outer `dead` resource contains the complete collapse presentation:

- outer `dead` RES: 55,832 bytes
- SHA-256: `33656662dce239b750b33e48e41e36aa74afb6c7fdcc58b59a8ff0f17f7b65e2`
- `dead` SCB: 1,888 bytes
- SCB SHA-256: `5b4b3631be6ac08e27f99efabc685893fe93e11e8146d2b73fabab1e03ea63f6`
- active scheduler envelope: 0.99 seconds / 12 entries
- nested RES: 53,667 bytes, SHA-256 `db7c182...c6ee`
- death VEFF: `151rmjanc_dead1`
- VEFF size: 16,416 bytes
- VEFF SHA-256: `85745f...5278`
- leaf scheduler/effect resource: `2zJyt2m524_ded`, 942 bytes, SHA-256 `85ce35...d5c4`
- VFX ownership: `EID_CURRENT`
- ACB: `m524_ded`, 1,016 bytes, SHA-256 `1ef8ba...89b1`
- effect curve: 51 frames at 30 fps

### Recovered `e002/dead` scheduler order

| Start | Scheduler work |
|---:|---|
| `0.000 s` | Cancel `init_msb4_1`; start death sound; begin equipment transition `cbxs_st1to0`; run action clip `m524_ded`; kick substatus handling; apply movement/status locks; start body collapse motion `cbbm_ded`. |
| `0.250 s` | Run `_UnlockTarget`. |
| `0.300 s` | Select terminal body pose `cbbm_dedpose`. |
| `0.990 s` | Main `dead` scheduler envelope completes. |

The action/effect curve can continue beyond the 0.99-second scheduler envelope, so retaining the dead actor for several seconds is correct. The current approximately 4-second corpse/despawn delay is long enough for both the authored collapse and the associated death effect.

Because the `e002/dead` scheduler explicitly cancels `init_msb4_1`, a separate aura-clear animation should not be required when this resource launches normally. The outgoing death substate also resets mode to zero, providing state cleanup.

### Authored collapse curve

The base animation package is:

`client/chara/mon/m524/act/emp_emp/bid/base/0000`

- file size: 16,960 bytes
- SHA-256: `d2b276...c17`

Relevant clips:

| Clip | Length | Role |
|---|---:|---|
| `cbbm_activ` | 30 frames / 1.0 s | activation-side body state |
| `cbbm_deact` | 30 frames / 1.0 s | deactivation-side body state |
| `cbbm_ded` | 30 frames / 1.0 s | actual defeat sink/collapse |
| `cbbm_dedpose` | 1 frame | terminal defeated pose |
| `cbbm_id0` | 1 frame | buried/dormant idle fallback |

`cbbm_ded` is an authored physical collapse. Its `n_hara` root moves from approximately `0` to `-5.500414`, while the spike chains contract to roughly `0.85–0.93` of their initial scale. The remaining top height is approximately `0.800787`. This is the Nail sinking and compressing into the ground, not a generic fade or explosion.

Key hashes:

- `cbbm_ded` MCB: SHA-256 `9b902...9b47`
- `cbbm_ded` MTB: 2,599 bytes, SHA-256 `272d...f1bc`
- `cbbm_dedpose` MCB: 704 bytes, SHA-256 `b155...fff0`
- `cbbm_dedpose` MTB: 887 bytes, SHA-256 `5ce8...5b30`

Before publishing DEAD, the current server resets the Nail's temporary floating-height workaround to ground height. That is important: the native `cbbm_ded` curve is authored to sink relative to the floor. Leaving a manual `+6.0` offset active would make the collapse end above ground.

### Alternate `e001` death package

The body equipment package also contains a smaller `dead` resource:

| Property | `m524/e001` |
|---|---|
| Full equipment file size | 230,816 bytes |
| File SHA-256 | `4a044...40b8` |
| outer `dead` RES | 55,688 bytes, SHA-256 `7fb4ae...2d14` |
| `dead` SCB | 1,744 bytes, SHA-256 `1b6f...71e9` |
| active envelope | 0.99 seconds / 10 entries |
| death ACB | `m524_ded`, 1,016 bytes, SHA-256 `dbb0...97df` |
| death curve | 47 frames |

The `e001` death scheduler lacks the explicit aura cancellation and sound entries present in `e002`. It may run as an equipment-root companion, but `e002/dead` is the complete Nail-specific defeat package for the current appearance. Whether the retail actor automatically launches one or both equipment-root `dead` resources is still a live scheduler-capture question.

### Strong reconstructed defeat sequence

```text
1. Apply lethal damage through the normal Nail combat path.
2. If a temporary +6.0 presentation offset is still in use, reset it to ground level.
3. Publish opcode 0x0134 with MAIN_STATE_DEAD and zeroed substate/mode.
4. Emit the normal X00/X01 death-animation result pair used by the actor system.
5. Let m524/e002's model-native `dead` scheduler run:
      cancel init_msb4_1
      -> cbxs_st1to0
      -> m524_ded VFX/action
      -> cbbm_ded collapse
      -> cbbm_dedpose
6. Keep the actor present for at least the full effect/collapse lifetime.
7. Despawn only after the death presentation has completed; the current ~4 s delay is sufficient.
```

Avoid these incorrect substitutions:

- do not replay WSS1 as the defeat animation;
- do not force the WSS1 X01/self-result branch merely because it looks like retraction;
- do not use `DEAD2`—that state is a recovery/get-up path;
- do not delete the Nail immediately on HP reaching zero;
- do not depend on `!playanimation`, which bypasses the model-state and equipment scheduler inputs needed here.

---

## 3. Current implementation audit

The current Lua Nail spawn path already does several useful things:

```text
spawn m524 -> instantiate -> ACTIVE -> command 23366 / 0x13001000 via X00
-> wait for authored rise -> apply +6.0 height workaround -> reveal/target
```

Current timing constants are:

| Constant | Value |
|---|---:|
| publication lead | 0.5 s |
| activation-state lead | 0.2 s |
| dormant-state settle | 0.2 s |
| height handoff | 2.75 s |
| activation settle | 3.85 s |

The missing/corrective work is:

1. Stop using `substate.breakage` as the selector for `init_msb4_1`.
2. Add or expose an opcode `0x0144` model-state **mode** write with `mode=0x0010`.
3. Queue that mode before WSS1's `~0.860 s` `RaptureActionSubStatusSchKickClip`.
4. Determine whether a successful `init_msb4_1` latch eliminates the manual `+6.0` height handoff.
5. Ensure defeat uses the generic `MAIN_STATE_DEAD` path and does not despawn the actor before the model-native `dead` scheduler and death VEFF complete.

The current server method and comments that describe `breakage=0x10` as an “msb4 mask” should be treated as incorrect until rewritten around the actual `mode` field.

## 4. Remaining live-capture boundary

The assets and invocation split are now clear. One short retail capture should close the last runtime questions. Log:

- `0x004DD01A`: actor virtual handler for inbound `0x0134` and `0x0144`
- `0x007A82F0`: old/new model-state masks and active resource root
- `0x007A8457`: requested SCB name and resource lookup return
- `0x007A852C`: scheduler creation result, owner, and world transform

For spawn, the expected trace is:

```text
0x0144 mode 0x0000 -> 0x0010
WSS1 SubStatusKick
0x7A82F0 requests init_msb4_1
successful scheduler creation on the Nail/e002 resource root
```

For defeat, the expected trace is:

```text
0x0134 MAIN_STATE_DEAD
model/equipment state handler requests dead
e002/dead scheduler creation
init_msb4_1 cancellation
cbbm_ded + m524_ded + cbxs_st1to0
cbbm_dedpose
actor deletion several seconds later
```

Capture scheduler ownership for both `m524/e001` and `m524/e002` to settle whether both equipment roots contribute to the death presentation.

## 5. Confirmed versus pending

### Confirmed

- Spawn and defeat are different native packages.
- WSS1 contains the Nail rise, spawn VFX, state transition, and a SubStatusKick.
- `cbbm_sp_01` rises and holds; it does not contain a defeat tail.
- The persistent aura is `init_msb4_1` under the `e002` resource root.
- Opcode `0x0144` `mode=0x0010`, not `breakage=0x10`, selects model-state bit 4.
- The `e002/dead` scheduler cancels the aura and contains the real defeat chain.
- `cbbm_ded` is a one-second sink/collapse followed by `cbbm_dedpose`.
- Immediate deletion would bypass or truncate the defeat presentation.

### Pending one live confirmation

- The exact most reliable point, before `0.860 s`, to queue `mode=0x0010` relative to WSS1 start.
- Whether correct `init_msb4_1` eliminates the current manual `+6.0` height bridge.
- Whether actor death automatically launches only `e002/dead` or both `e001/dead` and `e002/dead`.
- The exact internal function that maps `MAIN_STATE_DEAD` to the equipment resource name `dead`.

## 6. Related generated artifacts

Decompiler and dispatcher evidence used in this update:

- `tools/outputs/ifrit-ground-vfx-decomp-20260805/actor_main_state_handlers.cpp`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/actor_packet_dispatcher_range.txt`
- `tools/outputs/ifrit-ground-vfx-decomp-20260805/actor_packet_dispatcher_instructions.txt`

This report intentionally separates confirmed resource contents from the few remaining runtime launch assumptions. The immediate implementation target is now specific: add the correct Nail-owned model-state mode write to the spawn chain, and let the actor's normal DEAD state launch the separate model-native defeat package.
