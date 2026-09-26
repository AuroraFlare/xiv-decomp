# Infernal Nail animations

Documentation-only recovery of the installed `m524` Infernal Nail animation surface and the current AuroraFlare invocation gaps. No code, SQL, client resource, or gameplay asset was changed.

## Current invocation reconciliation

The installed asset findings below remain valid, but current invocation changed after this report's first snapshot. At Lua SHA `f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320`, each Nail is published hidden/untargetable, waits `0.1 s`, receives `DoBattleAction(0, 0x13001000)` for `m524` WSS `0001`, waits `1.5 s`, and is then shown/target-enabled. Each Nail also receives a four-second death-presentation timeout and scripted one-shot lifecycle ownership. Statements later in this report that the encounter “never explicitly selects” a Nail action bank or directly removes already-dead Nails are historical and are superseded by this reconciliation.

The remaining gap is narrower but still important: no explicit BID `activ`, `deact`, `ded`, `dedpose`, `id0`, or `msb4_1` selector was recovered. Player-killed and GM-shattered Nails now follow the ordinary BattleNpc `DEAD` lifecycle, remain through the configured corpse/fade window, and are permanently removed by the one-shot lifecycle. Whether `DEAD` automatically renders the exact `m524` `ded`/`dedpose` packages is still unproven. Surviving Nails are directly removed at Hellfire cleanup, so a Hellfire-consume/deactivation tail is still absent. [EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md) inventories the `m524_body_aura` controller, e001/e002 death packages, and every outer Nail resource row.

## Evidence and confidence

| Label | Meaning in this document |
|---|---|
| **Confirmed** | Directly decoded from an installed 1.23b resource or read from current server source/SQL. |
| **High** | Exact asset data plus a strong motion/state interpretation, but no retail selector packet. |
| **Medium** | Retail-frame behavior agrees with the asset, but the responsible bank or ordering is unresolved. |
| **Candidate** | A safe runtime probe, not a claim that retail invoked it at that point. |

The installed bank inventory proves client capability. It does not, by itself, prove which server packet selected a bank, which state transition retail used, or whether a named clip was automatic client behavior.

## Current actor bindings

All four current Nail actors bind the correct Nail script and the same `m524` appearance family. This is an invocation gap, not a missing/blank class-path problem.

| Duty role | Actor class | BNPC/mob type | Class path | Class binding | Appearance | Model | Current level / HP |
|---|---:|---:|---|---:|---:|---:|---:|
| Normal Nail | `2207306` | `3060` | `/Chara/Npc/Monster/Ifrit/IfritAnchor` | `3207303`, notice event `23` | `2207306` | `10524` | 35 / 2,500 |
| Hard Nail | `2207307` | `3061` | `/Chara/Npc/Monster/Ifrit/IfritAnchor` | `3207303`, notice event `23` | `2207307` | `10524` | 58 / 2,000 |
| Extreme inner Nail | `2207313` | `32702` | `/Chara/Npc/Monster/Ifrit/IfritAnchor` | `3207303`, notice event `23` | `2207313` | `10524` | 58 / 2,500 |
| Extreme outer Nail | `2207315` | `32703` | `/Chara/Npc/Monster/Ifrit/IfritAnchor` | `3207303`, notice event `23` | `2207315` | `10524` | 58 / 2,500 |

Sources: `gamedata_actor_class.sql:6320-6321,6327,6329`, `gamedata_actor_appearance.sql:6347-6348,6354,6356`, `server_battlenpc_mob_types_loot.sql:3910-3911,3927-3928`, and the `PROFILES` table in current `IfritEncounter.lua`.

Every appearance row uses base model `10524`, size/variant field `2`, and the Nail selector pair represented by `2048`/`1024` in the appearance table. The current `spawnNailWave` call independently supplies base model `10524`, size `2`, body gear `1024`, and head gear `2048`; parameter meanings are defined by `Area.SpawnConfiguredEnemyWithMobType`.

The current class init tuple is exactly:

```lua
return true, true, 10, 0, 1, true,
       false, false, false, false, false, false, false, 0
```

Source: `Data/scripts/base/chara/npc/monster/Ifrit/IfritAnchor.lua:3-5`. Recovered retail Lua only defines `IfritAnchor` as an `IfritBaseClass` subclass; it does not expose the animation timeline. The timeline must therefore be recovered from client banks, state/packet captures, or both.

## Complete installed `m524` bank inventory

Only two installed action containers exist for `m524`: baseline BID `0000` and weapon-skill WSS `0001`.

| Lane / bank | Installed path | Bytes | SHA-256 | Payload class |
|---|---|---:|---|---|
| `emp_emp/bid 0000` | `client/chara/mon/m524/act/emp_emp/bid/base/0000` | 16,960 | `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17` | motion/state baseline |
| `emp_emp/wss 0001` | `client/chara/mon/m524/act/emp_emp/wss/base/0001` | 239,336 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` | motion/effect/sound action |

Inventory source: `outputs/dungeon-animation-inventory-20260722/installed_action_banks.csv:1037-1038`.

## BID `0000`: baseline lifecycle and state motions

The BID declares `MotionCommandClip`, `RaptureCharaActionSoundClip`, `RaptureFacialPoseForMccClip`, and `RapturePhysicsIgnoreLookAtClip`; skeleton/resource tokens are `b001;m524`. Its exact resource counts are `SEDBRES:1`, `SEDBMCB:8`, and `SEDBmtb:8`.

### Full declared motion-name surface

Battle-mode names:

`cbbm_01f_lp0`, `cbbm_01f_stp_ls`, `cbbm_02f_lp0`, `cbbm_02f_stp_ls`, `cbbm_02f_stp_rs`, `cbbm_03f_lp0`, `cbbm_03f_stp_ls`, `cbbm_03f_stp_rs`, `cbbm_abl_2lp`, `cbbm_activ`, `cbbm_deact`, `cbbm_ded`, `cbbm_dedpose`, `cbbm_hitrn_bl`, `cbbm_hitrn_br`, `cbbm_hitrn_l`, `cbbm_hitrn_r`, `cbbm_id0`, `cbbm_msb4_1`, `cbbm_trn_bl`, `cbbm_trn_br`, `cbbm_trn_l`, `cbbm_trn_r`.

Normal-mode names:

`cbnm_01f_lp0`, `cbnm_01f_stp_ls`, `cbnm_02f_lp0`, `cbnm_02f_stp_ls`, `cbnm_02f_stp_rs`, `cbnm_03f_lp0`, `cbnm_03f_stp_ls`, `cbnm_03f_stp_rs`, `cbnm_dedpose`, `cbnm_hitrn_bl`, `cbnm_hitrn_br`, `cbnm_hitrn_l`, `cbnm_hitrn_r`, `cbnm_id0`, `cbnm_trn_bl`, `cbnm_trn_br`, `cbnm_trn_l`, `cbnm_trn_r`.

The names above are scheduler/controller references. The BID physically embeds transform/controller payloads for the lifecycle/pose subset below.

### Decoded embedded resources

All transforms are 30 FPS with 12 bones.

| Motion | Transform bytes / SHA-256 | Frames | Decoded duration | Controller bytes / SHA-256 | Additional control resource |
|---|---|---:|---:|---|---|
| `cbbm_activ` | 855 / `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` | 30 | 1.0 s | 528 / `c4bc7082325906d75476c1711241464cfd2a4f6db5b89adb1a94255d85fb4653` | 64 / `11b6f476782c95ac2d293e83c80c31fac84d242fff7edebf846439a7c7cd7d59` |
| `cbbm_deact` | 855 / `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` | 30 | 1.0 s | 528 / `1c28739c81f1daf1abdd6874f0d12999811b04240ccdb007a987c2042da6f1bb` | 64 / `35e18aa12e0119b6284cc991cb9436b204186b460f0445b132319c409710f98f` |
| `cbbm_ded` | 2,599 / `272d1133134b89b4f09e69871316cbf42a1d9053de063dc39acdc05ceb27f1bc` | 30 | 1.0 s | 760 / `9b902c586cc839003aab82d8ba9578da5f32d7dc4930675c73bfb303f7da9b47` | 44 / `bc0d20eb89a7615397ca08515ba7e1b78e30410a92b8796341785a0a5a1e1878` |
| `cbbm_dedpose` | 887 / `5ce8419ca34ada7417596724c9ff6be2d51a652964d2e8ba97a6661b96045b30` | 1 | static pose | 704 / `b155896a2619d8e78904588bd34fe64aa8c18460db8bed4fd89f46e424fafff0` | — |
| `cbbm_msb4_1` | 647 / `a67be74338cc330e724819cb24a7ee6b4bc4c4d1ac98db8eee9bf11b50c29ec3` | 1 | static pose | 592 / `a2054bc2b9ca39698eb216a7dedad06554091fa3e9301bcc7d9c13a623e01b86` | — |
| `cbbm_id0` | 855 / `f6570a520c987a0718234d6ada56ae083ddfbc919d273e25a6b20ece01567011` | 1 | static pose | 528 / `77f722cabb566ccbd8176dffa452343dbdd27534f20ad1e5e4d295e20b240136` | 384 / `e3dda03c640c830b2f1d0af7420b499fec5c6187bfb9da2120070c89089cf7ad` |
| `cbnm_dedpose` | 887 / `5ce8419ca34ada7417596724c9ff6be2d51a652964d2e8ba97a6661b96045b30` | 1 | static pose | 704 / `fda2aa6289dfd8505e6ecc2fb48c5c2acb75af83b3be7e1ba5c60cb8c738aa33` | — |
| `cbnm_id0` | 855 / `f6570a520c987a0718234d6ada56ae083ddfbc919d273e25a6b20ece01567011` | 1 | static pose | 528 / `d170e8694888c6c1cceea7383e70a89e2d2ebd9a1c8417101fd0eb05476855cb` | 384 / `df758668496fc218964f63abc54b0d6f2a0018197e9ddb128ea41c5b4a99fc9a` |

`activ` and `deact` deliberately share the same transform bytes but have different controllers/control resources. They may traverse the same authored curve with different controller semantics or direction; identical transform hashes do not make them interchangeable. The one-frame entries are poses, not one-frame visible effects.

Semantic confidence: `activ`, `deact`, and `ded` as activation, deactivation, and death are **High** from exact names and distinct controllers. Their exact retail packet/state selectors and transition order remain unresolved.

## WSS `0001`: three-second skill and state/VFX package

WSS1 declares:

- Skeleton/resources: `b001`, `b5555`, `m524`, `m524e001`.
- Scheduler resources: `skl_c001b001`, `skl_m524b001`.
- Motion/state labels: `cbbm_sp_01`, `cbxs_st0`, `cbxs_st0to1`, `cbxs_st1`.
- Effect labels: `m524_0001_cas`, `skill01`.
- VFX path: `D:/gra_rapture/vfx/mon/anchor_524/skill01/anc_sklc1y.veffbin` and source-form token `d:/gra_rapture/vfx/mon/anchor_524/skill01/anc_sklc1y.veff`.

Its clip-class surface is `ActionClip`, `BindActorClip`, `ClipSyncClip`, `EffectClip`, `MotionClip`, `MotionCommandClip`, `RaptureActionSelectClip`, `RaptureActionSubStatusSchKickClip`, `RaptureCancelChantSyncClip`, `RaptureCasterManagedSchClip`, `RaptureClientMoveStopClip`, `RapturePhysicsIgnoreLookAtClip`, `RaptureServerMoveStopClip`, `RaptureSoundClip`, and `RaptureStatusLockClip`.

### Root resources and timing

| Resource | Bytes | SHA-256 | Exact decode |
|---|---:|---|---|
| `main` SCB | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | 9,000,000-unit outer envelope; 600,000-unit active block; 23 entries; aligned timing words 100,000 and 580,000 |
| `mon_main` SCB | 1,792 | `1c830b159dac661488133829fd9fb26387b513fd968fcf1454d5ab76536f139a` | 9,000,000-unit outer envelope; 1,000,000-unit active block; 11 entries |
| `cbbm_sp_01` controller | 592 | `f0bc6fc4ee499b0d876729c4561032b9510d38bf4e47832ecb6a586025ccc0ac` | motion controller |
| `cbbm_sp_01` transform | 1,879 | `dd9ce2e2a0f918a3839101d40a9cb21fe9f7a12d84563727c2dcb3df138d9fd3` | 30 FPS, 90 frames, 12 bones: exactly 3.0 s |
| `skill01` effect package | 90,400 | `df3decfd64af98b6c28a9e2414e31e5e819ef18f959215206c6357587f8ba030` | `anc_sklc1y` actor-bound effect package |

Interpreting scheduler integer units as microseconds gives `main` approximately 0.6 seconds active and `mon_main` approximately 1.0 second active. That unit conversion is an inference; the integer fields and entry counts are exact. These active blocks are not the same thing as the skeletal motion length: `sp_01` is independently and exactly 90 frames / 3.0 seconds.

The effect package contains explicit fire, rock, glow, muzzle-like, camera-shake, and distortion evidence, including `fire_u04y.dds`, `fire_u16y.dds`, `rock_u04y.dds`, `glow_f01y.dds`, `cy0fir01y`, `mzle_f10y.dds`, a distortion shader path, `CameraShake`, and attachment token `005_n_hara`. This confirms a substantial Nail effect exists; it does not establish whether retail used WSS1 for spawning, pulsing, Hellfire charging, destruction, or more than one of those phases.

## Retail-frame observation

The retained Hard-mode frame sequence `hardlong_416..428` shows a clear presentation progression: an ember/thin rise, growth into a tall burning spike, then a persistent/pulsing Nail. This visually agrees with the presence of `activ`, a stable pose/state, `st0 -> st1`, and fire-heavy WSS1 content.

Confidence is **Medium**, not Confirmed, for the bank assignment. The frames do not expose the packet selector and do not isolate whether the one-second BID activation, WSS1's state transition/VFX, or both are responsible. No reviewed capture cleanly proves the exact `deact` versus `ded` ordering for player destruction or Hellfire consumption.

## Current server lifecycle and remaining gaps

### Spawn

At Lua SHA `f868e997...`, `spawnNailWave` creates each Nail with the correct class/BNPC and `m524` direct model fields. The success path then performs:

1. Preserve authoritative ground Y, set floating presentation height `5.5`, and make the Nail combat-inert.
2. Hide combat presentation/nameplate and targetability before publication.
3. Set a four-second death-presentation timeout and bind the Nail to the director's scripted one-shot lifecycle.
4. Register the Nail and instantiate the full actor train for ready players.
5. Wait `0.1 s`, then send `DoBattleAction(0, 0x13001000)` on the `m524` owner, selecting Nail WSS1.
6. Wait `1.5 s`, then show combat presentation and enable targetability.

This intentionally drives the recovered WSS1 rise/ignite candidate, but it does not explicitly select BID `activ`, persistent `id0`/`msb4_1`/`m524_body_aura`, or terminal states. The WSS body motion is exactly `3.0 s`, so the `1.5 s` reveal point is also not proof that every authored layer completed. Living Nails are re-instantiated for newly ready clients during the Nail phase, but WSS1 is not replayed per late client. The initial hide call uses `broadcast=false` before publication: it sets the two nameplate properties but does not emit the newer blank actor-name packet, so a retail-client capture must also check whether a grey base name leaks during the hidden ignition.

### Damage and player destruction

Nails are valid damage objectives, but the encounter does not explicitly request `hitrn_*`, `ded`, or `dedpose`. Ordinary damage now enters the normal BattleNpc death path: `DEAD` state, the Nail's configured four-second corpse interval, the standard fade/removal grace, and permanent one-shot removal from the director and zone. Whether that client state automatically selects `m524`'s `ded`/`dedpose` controllers must be captured; the source proves the lifecycle state and retention, not the model-specific rendered bank.

The message “The last Infernal Nail shatters” is emitted when `updateNailPhase` sees all expected Nails in `IsDead()`, but it is text, not a shatter animation call.

### Hellfire cleanup

After Hellfire resolution, `cleanupNails(state, phase, false)` directly removes only Nails that are not dead. A player-killed Nail is deliberately left alone so its `DEAD` corpse/fade and one-shot permanent-removal path can finish. A surviving Nail is still removed immediately without `deact`, WSS1, a consume effect, or an effect-complete delay. Administrative encounter cleanup passes `true` and can directly remove either state.

### GM shatter helper

`IfritManager.ShatterTestNails` now finds live Nail actors and calls `nail.AddHP(-Math.Max(1, (int)nail.HP))` (`IfritManager.cs:701-716` at the current pin). That follows the normal damage/death route rather than merely setting the numeric HP field, so it can drive the encounter's `IsDead()` checks and the ordinary `DEAD` lifecycle. It still does not explicitly select or prove visible `m524` `ded`/`dedpose` playback.

## Most defensible probe matrix

These are capture targets, not implementation prescriptions:

| Phase to capture | Asset/state candidates | Required evidence |
|---|---|---|
| Spawn publication | no action versus BID `activ` versus WSS1 `st0 -> st1` | Actor spawn-complete time, first scheduler/action packet, model-state change, VFX start, time to stable spike |
| Stable active Nail | `id0`, `msb4_1`, `st1`, WSS1 effect persistence | Loop/state selector, pulse period, whether VFX remains actor-bound |
| Hit reaction | `hitrn_bl/br/l/r` | Damage packet and any following raw/state animation selector |
| Player-killed shatter | `ded` then `dedpose`, or WSS1 plus death | AI death transition, animation/bank, effect, one-second motion completion, fade/despawn tail |
| Hellfire consumption | `deact`, WSS1, helper effect, or direct removal | Pre-Hellfire state, survivor-only packet sequence, effect duration, exact removal time |
| Rejoin during Nail phase | current state plus any persistent VFX replay | Full spawn/state train received by late client and whether flames/pulse reconstruct |

For each capture, record actor class/appearance, BNPC, opcode channel, command ID, packed animation, model/effect bank, actor main/substate, motion pack, result effect ID, world transform, packet offset from spawn/damage/Hellfire, and despawn tail.

## What remains unresolved

- The packed/raw selector for BID `activ`, `deact`, `ded`, `dedpose`, `id0`, and `msb4_1` on `m524`.
- Whether client `MAIN_STATE_DEAD` automatically selects the model-specific `ded` controller and then `dedpose`.
- Current AuroraFlare uses WSS1 as spawn ignition/growth; whether retail used it there, as a recurring action, for Hellfire charge/destruction, or in multiple roles remains unresolved.
- Exact ordering between actor publication, one-second `activ`, `st0 -> st1`, the three-second `sp_01`, and the stable burning pose.
- Exact ordering for player destruction versus Hellfire consumption, including whether `deact` and `ded` are mutually exclusive paths.
- Spawn lead time needed before an action is safe for every ready client, plus late-join state/VFX replay.
- The exact client-visible corpse/fade timing inside the configured four-second server hold plus removal grace.

## Bottom line

The installed client contains a complete, coherent Infernal Nail presentation surface: one-second activation, deactivation, and death motions; stable idle/death/special poses; a three-second state-changing WSS action; and an actor-bound fire/rock/glow/distortion effect. Current actor IDs, class paths, appearances, and init tuple are correct. At Lua SHA `f868e997...`, the encounter explicitly selects WSS1 during hidden spawn staging, configures a short normal death/fade and permanent one-shot removal path, preserves already-dead Nails during ordinary Hellfire cleanup, and makes the GM shatter route use normal damage. It still does not explicitly select the BID activation/stable/death/deactivation banks, and surviving Nails still disappear directly after Hellfire. The missing work is exact model-specific selector/timeline choreography and runtime proof, not asset reconstruction or class rebinding.
