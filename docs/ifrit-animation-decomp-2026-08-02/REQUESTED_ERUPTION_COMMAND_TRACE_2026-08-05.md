# Requested Eruption command-ID trace

Snapshot: 2026-08-05; retail FFXIV 1.23b client `2012.09.19.0001` plus the recovered `server_battle_commands` rows.

This companion note traces command IDs `23364`, `23374`, `23582`, and `23594` far enough to separate their result actions from the missing pre-impact floor warning.

## Command mapping

All four rows use a 3,000 ms cast. Their recovered animation fields are:

| Command | Name | Model animation | Packed battle animation | Native m999 bank | Recovered role |
|---:|---|---:|---:|---|---|
| 23364 | eruption | 2 | `0x13002000` | WSS2 | smaller impact package |
| 23374 | eruption | 1 | `0x13001000` | WSS1 | actor-root Ifrit skill09 glow/smoke/blur |
| 23582 | eruption | 1 | `0x13001000` | WSS1 | same actor-root Ifrit skill09 package |
| 23594 | eruption | 3 | `0x13003000` | WSS3 | large impact; live-confirmed |

Decimal-to-packed joins:

- `318771200 = 0x13001000`;
- `318775296 = 0x13002000`;
- `318779392 = 0x13003000`.

Commands `23374` and `23582` select the exact same battle animation. Their database rows differ in gameplay range data, not in the client WSS selector. Command `23364` selects WSS2, and `23594` selects WSS3.

## WSS1 decomp

Native WSS1:

- path: `client/chara/mon/m999/act/emp_emp/wss/base/0001`;
- size: 275,472 bytes;
- SHA-256: `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94`;
- outer scheduler: `system/shoot_mon/main`, 1,936 bytes, SHA-256 `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422`;
- imported resource branch: `mon/ifrit_852/skill09/mon_main/sch_effect_data/skill01`;
- imported model scheduler: `mon/ifrit_852/skill09/mon_main`, 1,008 bytes;
- model scheduler SHA-256: `c0cdc65c918f24923e7e00f25068ae64f9dcf6eb68d21d5e82aab3a91ce7eb47`;
- VEFF source name: `vfx/mon/ifrit_852/skill09/ift_sklc9y.veff`;
- VEFF size: 11,772 bytes;
- VEFF SHA-256: `6aabafcbbc408faf5463891bb6179665b6fd6ca154cd359f78029b46772cca99`;
- VINS attachment: `EID_CURRENT`;
- placement controls: `Position3D:CoordRoot` and `Position3D:CoordLocal`;
- visual vocabulary: glow, smoke, blur;
- no `Position3DMapBind` and no target-snapshot placement control.

WSS1 is therefore an actor-owned Ifrit effect, not evidence for a frozen ground formation under the targeted player.

## Action-result pipeline

The confirmed common result path is:

```text
action result supplies packed battleAnimation
-> system/shoot_mon/main
-> RaptureActionSelectClip selects the authored action branch
-> RaptureCasterManagedSchClip owns/cancels the action scheduler
-> native m999 skillNN/mon_main
```

For WSS1, the model scheduler launches the actor-root `m852_0009_cas` / `ift_sklc9y.veff` branch.

For native WSS2 and WSS3, the banks contain direct caster and target visual branches. Their target schedulers include `RaptureActionSelectDamageMccClip`, so result/damage data selects the authored target impact branch. WSS2 is the smaller impact family; WSS3 is the large impact family.

Native WSS1, WSS2, and WSS3 do not use `RaptureActionSubStatusSchKickClip`. They cannot consume the queued `mode` state needed by `init_msb4_*` or `init_msb5_*`.

## Consequence for the pre-impact warning

None of these four result selectors contains the missing approximately three-second, target-ground Eruption formation:

- `23374` and `23582` select actor-root skill09 art;
- `23364` selects the smaller impact;
- `23594` selects the live-confirmed large impact.

The pre-impact warning must therefore arrive through a parallel or earlier path: a helper/proxy model state, a cast scheduler with `RaptureActionSubStatusSchKickClip`, or another pre-result scheduler. The recovered Kuroko state-5 path is:

```text
opcode 0x0144 queues mode = 0x20 on the helper
-> native m999 WSS5 or a cast envelope kicks queued substatus
-> queue type 3 calls 0x7A82F0
-> init_msb5_1 launches persistent rock/fire/MapBind art
-> mode = 0 plus another kick resolves init_msb5_0
-> command 23594 / WSS3 performs the impact
```

This is why tracing only command `23594` can recover the explosion but cannot recover the formation that appears during the cast.

Private-server command `23983` remains outside this retail command trace because it may not exist in retail client command data.
