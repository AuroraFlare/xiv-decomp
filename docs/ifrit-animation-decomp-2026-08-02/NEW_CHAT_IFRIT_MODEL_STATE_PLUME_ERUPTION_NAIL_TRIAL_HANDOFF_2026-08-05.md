# New-chat handoff: corrected Ifrit model-state visibility trials

Created: **2026-08-05, America/New_York**  
Repository: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`  
Source baseline: `8603711055271d27dcd94fc03a2191dddec699b7` (`develop`, `Ifrit/Garuda Decomp`)  
Installed retail client evidence: FFXIV 1.23b `2012.09.19.0001`

## Paste this into the new chat

```text
Continue the Aurora Flare FFXIV 1.23b Ifrit visual implementation in:

C:\Users\drime\source\repos\AuroraFlare\FF14-Memory

The static decomp has now closed the invocation mistake that made the earlier
Plume and Eruption state probes silent. Implement the corrected visibility
probes, build and restart the Map Server, then give me the exact GM commands
for the first live A/B. Do not stop at another prose recommendation.

Read this handoff completely, then read these seven reports completely before
editing:

- docs/ifrit-animation-decomp-2026-08-02/IFRIT_OPCODE_0144_MODEL_STATE_GATE_AND_CALLER_CLOSURE_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_PLUME_ERUPTION_INNER_GEOMETRY_DECOMP_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_ERUPTION_PLUME_MAPBIND_LAYER_TIMING_DECOMP_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_GROUND_STATE_AND_NAIL_DEATH_CLOSURE_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/INFERNAL_NAIL_SPAWN_AND_DEFEAT_DECOMP_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_HELPER_CARRIER_CENSUS_2026-08-05.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_BOWL_ARENA_TILE_EXHAUSTIVE_INSTANCE_DECOMP_2026-08-05.md

Important safety and scope:

- Do not modify the installed client, executable, or DAT files.
- Do not rewrite canonical client-data or battle-command SQL for this trial.
- Preserve unrelated worktree changes if any appear. Do not reset, clean,
  commit, or push unless I explicitly ask.
- Keep authoritative mechanic damage separate from visual helpers. Diagnostic
  helpers must be inert, untargetable, UI-hidden, stationary, and incapable of
  duplicate damage.
- Incinerate and Hellfire already work. Do not regress or replace them while
  fixing Plumes, Eruption, or Nails.
- Infernal Nail size 4 is live-confirmed by me. Do not regress it to the
  appearance-table size 2.

The decisive correction:

Opcode 0x0144 has an eight-byte substate payload:

  +0..+3 = breakage/chant/guard/waste -> deferred queue type 2
  +4..+5 = mode word                 -> deferred queue type 3
  +6..+7 = motion pack

Only mode at +4 can select init_msbN. Receiving the packet only queues the
mode edge; a later real RaptureActionSubStatusSchKickClip consumes type 3 and
calls the model-state selector at 0x7A82F0. Native m999 WSS4, mapped command
23595 and packed animation 0x13004000, supplies that kick.

The earlier tests were not valid negatives because they wrote breakage, did
not execute the required SubStatusKick, and used HEAD 1024 on the m999 helper.
The exact m999/e001 donor is appearance 1001481:

  base 10999
  size 2
  BODY 1024
  HEAD 0

Implement in this order.

PHASE 1 - corrected single-owner visibility probes

Refactor the existing ProbeEruptionState path rather than adding another
blind animation-bank command. Preserve the current convenient syntax:

  !testifrit eruptionstate 4 m999
  !testifrit eruptionstate 5 m999

For m999, state 4 means Radiant Plume and mode 0x10. State 5 means the
Eruption warning and mode 0x20. Update help text, labels, logs, constants, and
validator contracts so they say mode rather than breakage.

Each probe must:

1. Spawn one stationary owner at the player's frozen XYZ using exact
   appearance 1001481 or the exact equivalent base/size/BODY/HEAD fields.
2. Publish it ACTIVE, inert, untargetable, nameless, and UI-hidden.
3. Wait for the client to load the model and active resource root.
4. Ensure a fresh mode edge by publishing mode 0 first if needed.
5. Publish opcode 0x0144 with mode 0x10 for Plume or 0x20 for Eruption.
6. Immediately send a genuine owner-side WSS4 X00 action with command 23595
   and animation 0x13004000. Do not substitute PlayAnimation or the generic
   command-21001 active-mode envelope.
7. Hold the owner and state for about three seconds.
8. Publish mode 0, then issue command 23595/WSS4 again so init_msb4_0 or
   init_msb5_0 cancels the visual.
9. Delay cleanup long enough for the off scheduler/effect tail.

Do not send damage, an X01 result, or an Ifrit/player combat target during the
first state-only visibility tests. The helper is the animation owner and its
world transform is the placement coordinate.

The expected client results are:

- eruptionstate 4 m999: one localized Radiant Plume/lava-field package appears
  at the frozen helper coordinate, remains for the hold, then clears.
- eruptionstate 5 m999: the three-second terrain-bound Eruption crack and
  telegraph appears at the frozen helper coordinate and remains behind if I
  immediately move away, then clears. This first probe intentionally has no
  impact explosion.
- No visible second Ifrit, nameplate, HP bar, target ring, enmity marker, or
  damage should appear.

Log the exact appearance fields, instantiated/known state, frozen XYZ, old and
new mode, opcode 0x0144 publication, command 23595/WSS4 kick on both edges,
and cleanup. If either probe is silent, do not try another WSS guess. Check in
this order:

  exact HEAD 0 and BODY 1024
  ACTIVE publication and client-known actor
  mode byte, not breakage byte
  fresh 0 -> bit edge
  real WSS4 SubStatusKick after the mode packet
  resource lookup at 0x007A8457
  scheduler creation/owner transform at 0x007A852C
  Eruption MapBind evaluation at 0x00D7E370 / ground query 0x00D85800

Only if exact m999/e001 fails after those checks, add the m852 comparison:

- m852 Eruption uses mode 0x20.
- m852 Plume is remapped to mode 0x80/state 7.
- actor 2207314 is a real m852 Ifrit-class carrier but visibly contains a full
  Ifrit body, so it is a diagnostic fallback rather than the preferred owner.

Stop after building/restarting and give me the two m999 commands first. Wait
for my visual observations before permanently tiling Plumes or replacing the
production Eruption sequence.

PHASE 2 - after the corrected single-owner visuals are confirmed

Eruption production sequence:

  snapshot target XYZ at cast begin
  -> stationary exact m999/e001 owner at snapshot
  -> mode 0x20 + command 23595/WSS4 kick
  -> hold through approximately three-second cast while player may move
  -> mode 0 + command 23595/WSS4 kick
  -> command 23594 / native m999 WSS3 / 0x13003000 impact on the same owner
  -> delayed despawn

Keep the warning and impact separate. WSS3/23594 is the live-confirmed large
impact; WSS2 is only a smaller impact. Retire the existing WSS17 composite:
WSS17 is not the Eruption warning. Preserve the current authoritative frozen
damage coordinates and the three-pulse mechanic, but give each pulse its own
correct fixed visual-owner lifetime so visuals cannot follow the player or
appear at Ifrit.

Radiant Plume production boundary:

- Keep real Ifrit's live-confirmed WSS2 fist-slam body presentation.
- m999/e001 state 4 is one localized actor-rooted Plume package. It has no
  MapBind, arena-wide generator, or embedded center/outer coordinate array.
- An arena pattern therefore needs one stationary owner per desired Plume
  origin. Do not assume one center helper fills the arena.
- The exact retail origin array is not recovered. After one package renders,
  work with my screenshots/footage to create the smallest server-side tiling
  that matches the center, outer, and final patterns.
- Preserve authoritative collision geometry while tuning visuals: center
  radius 16, outer donut 8..22, final donut 8..50 are current server mechanics,
  not decoded VEFF transforms.

Do not use the Bowl boundary-ring timelines for Plume. The exhaustive arena
scan proves there is only one placed boundary-ring group; it is not the
combat Plume pattern. Do not resume WSS21/WSS22/ground-bank guessing.

PHASE 3 - Infernal Nail correction after the ground-state visibility check

The Nail's spawn and defeat are separate native paths:

- Spawn: m524 WSS1, command 23366, animation 0x13001000, Nail-owned X00.
- Persistent raised/aura state: opcode 0x0144 mode 0x10, queued before WSS1's
  SubStatusKick at about 0.860 seconds.
- Defeat: normal opcode 0x0134 MAIN_STATE_DEAD, which launches the active
  m524/e002 dead scheduler. Never replay WSS1 for defeat.

Correct production spawn:

1. Keep base 10524, BODY 1024, HEAD 2048, and user-confirmed size 4.
2. Keep the Nail itself as WSS1 owner and use X00 only.
3. Queue/publish substate.mode = 0x10 immediately before WSS1 starts, so its
   0.860-second kick commits init_msb4_1.
4. For the first A/B, disable the manual +6 height bridge. A correct state
   latch may make it redundant; keeping both could double-lift the Nail.
5. If the Nail still falls only after the authored three-second rise, restore
   the +6 bridge as an explicit fallback rather than confusing it with msb4.
6. Reveal targetability only after the rise/state latch stabilizes.

Correct defeat:

- Reset any temporary floating-height bridge to zero before DEAD.
- Let the normal DEAD/substate-zero presentation run.
- m524/e002/dead cancels init_msb4_1, runs cbxs_st1to0, cbbm_ded and m524_ded,
  selects cbbm_dedpose, and finishes its scheduler around 0.990 seconds.
- Keep the existing roughly four-second corpse lifetime. Do not immediately
  delete, use DEAD2, force WSS1 X01, or call PlayAnimation as a substitute.

Nail acceptance commands after implementation:

  !testifrit hard
  # Attack Ifrit and wait for encounter start
  !testifrit hpp 29

Expected: four size-4 Nails rise once, do not immediately retract/collapse,
remain raised/lit/targetable, and do not jump or double-lift. Then run:

  !testifrit shatternails

Expected: each Nail plays exactly one native sink/compression defeat, clears
its aura, remains long enough to see the terminal pose, and despawns after the
existing cleanup. No WSS1 replay should occur during death.

Retire or rewrite these misleading paths:

- NailAuraBreakageMask and any comments calling breakage 0x10 an msb4 mask.
- !testifrit nailbreak as a model-state test. It may remain only if explicitly
  labelled as a raw type-2 diagnostic unrelated to init_msbN.
- ProbeEruptionState writes to breakage.
- The m999 probe's HEAD 1024 override.
- The WSS17 warning/composite and old ground-bank candidate language.
- Standalone PlayAnimation as a model-state commit mechanism.

Validation/build handoff state:

- Baseline Map Server build succeeds with 0 errors and existing warnings:
    dotnet build ".\Map Server\Map Server.csproj" -c Release -p:Platform=x64 --no-restore
- The Ifrit validator currently has one pre-existing failure at HEAD before
  this work: "per-owner enmity indicator suppression does not clear current UI
  and rebuild it on restore". Reconcile that HateContainer/validator mismatch
  separately or document it; do not weaken unrelated validation merely to make
  the new model-state work pass.
- Update the Ifrit validator narrowly for the corrected carrier, mode field,
  WSS4 kick ordering, off edge, Nail mode-before-WSS1 ordering, and removal of
  invalid breakage contracts.
- Rebuild, restart the Map Server hidden, verify it listens normally, and give
  me the exact first two commands plus what I should watch for.

At completion, report every file changed, validation/build results, server PID,
and the visual questions that still require my client observation.
```

## Why this handoff is different from the 2026-08-04 handoff

The old handoff ranked WSS candidates and treated `breakage` bits as possible
model-state selectors. The new executable trace closes that uncertainty:

```text
0x0144 payload +4 mode
-> 0x7B4440 deferred queue type 3
-> action-time RaptureActionSubStatusSchKickClip
-> 0x7BF2E0
-> 0x7A82F0
-> init_msbN_1 / init_msbN_0 lookup and scheduler creation
```

Consequently, the old raw clear/set/clear results are not asset negatives.
They used payload byte `+0` (`breakage`), which queues type 2, and did not run
the action-time state kick.

## Evidence matrix

| Mechanic | Confirmed client path | First server trial | Still open |
|---|---|---|---|
| Radiant Plume ground art | m999/e001 mode `0x10` -> `init_msb4_1` -> `msb4`; one localized actor-rooted package | exact appearance `1001481`, mode edge, command `23595` WSS4 kick | retail helper identity and arena origin array |
| Eruption warning | m999/e001 mode `0x20` -> `init_msb5_1` -> `msb5`; MapBind ground crack/telegraph | exact stationary helper at frozen player XYZ, three-second hold | retail helper identity/parent scheduler |
| Eruption impact | command `23594`, native m999 WSS3, `0x13003000` | same helper and origin after warning off edge | final production pulse scheduling |
| Nail spawn | m524 WSS1 command `23366`; mode `0x10` committed by WSS1 kick around `0.860 s` | queue mode before Nail-owned X00 WSS1; initially omit +6 bridge | whether correct msb4 latch fully replaces height bridge |
| Nail defeat | opcode `0x0134` DEAD -> generic `dead1/dead2/dead` lookup -> m524/e002 `dead` | normal lethal transition and four-second corpse | live e001/e002 root precedence |

## Important visual/resource facts

- Exact native helper package:
  `client/chara/mon/m999/equ/e001/met_mdl/0001`, SHA-256
  `c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105`.
- Exact donor appearance `1001481`: base `10999`, size `2`, HEAD `0`, BODY
  `1024`. It is resource-compatible but not proved to be Square Enix's retail
  Ifrit helper actor class.
- Plume VEFF `0Xv7Tfift_eish2`, SHA-256
  `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6`.
  It has no MapBind or arena generator.
- Eruption warning VEFF `2Jckltift_skleb`, SHA-256
  `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e`.
  It has two `Position3DMapBind:CoordRoot` nodes, generated-normal MapBind,
  `GenerateMaster`, and loop data.
- Eruption authored timing-like values include a `3.10 s` looping ground crack
  and `3.00 s` telegraph distortion at the client's 100,000-unit time scale.
- The Bowl layout has no Plume array, Eruption rig, or Nail marker set. The one
  placed ring is the arena boundary, not Plume.

## Current source audit at handoff

The receiving chat must inspect current source rather than restoring an older
snapshot.

- `ProbeEruptionState` currently writes `substate.breakage`, not `mode`.
- Its native helper currently forces base `10999`, BODY `1024`, HEAD `1024`.
- It publishes clear/set/clear without command `23595` WSS4 kicks.
- `CommitActivePresentationSubState` uses command `21001`/active-mode packets;
  that is not the proved m999 WSS4 SubStatusKick route.
- The old composite still plays m852 WSS17 before WSS3 impact.
- Production Nails currently clear `breakage`, start correct Nail-owned WSS1
  X00, then apply a `+6` floating-height bridge at `2.75 s`; they do not queue
  `mode=0x10` before WSS1's kick.
- Production Nail size is already `4`; preserve it.
- Production death already resets the opted-in temporary height before the
  normal terminal-state presentation and retains a roughly four-second actor
  lifetime. Preserve those useful pieces.
- Real Ifrit's Plume body presentation already uses live-confirmed m852 WSS2
  fist slam. Ground art remains separate.
- Incinerate uses live-confirmed m852 WSS4 (`0x13004000`) and Hellfire is
  working; keep them out of the model-state refactor.

## Source pins

These hashes are from clean HEAD `86037110` before this Markdown file was
added.

| File | Bytes | SHA-256 |
|---|---:|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | 78,470 | `363e4f1019fe0e48d0c03cbd2bed408c4b3c0275e964127675e937d44cba5b15` |
| `Data/scripts/commands/gm/testifrit.lua` | 5,412 | `bd9176ecb994663c95766c07b2feca3923aa6afea525ab0b8aec9fcd7016337e` |
| `Data/scripts/monster_tp.lua` | 40,312 | `6d0538dd94002c8fdfcecb2b069e360919af1fefe108ecadf8cfeae7d6cdcab1` |
| `Data/sql/server_battle_commands.sql` | 573,963 | `b23a79dbe990d8b71b04b70e0eceb5b7d051e8678e8ce326c852feb9a4c65670` |
| `Map Server/Primals/IfritManager.cs` | 110,114 | `8f641b9ec18cdb127d95b5b83c9aed900fd0f1e602199cb36885d305b3138875` |
| `Map Server/WorldManager.cs` | 669,008 | `ac2bc041da3507b38040241aa084e018ac577f5549dfd49f0870b5f28aa6f297` |
| `Map Server/Actors/Chara/Character.cs` | 181,029 | `d0ef25cf027403a76ddc5e0dedfd4dfd3cdf9a3aec0bc08c9c0d8bacf39b12a7` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | 197,044 | `634969fe03ba181ef028684a0877733576590fc0a3c820edab021c84c74e6a3c` |
| `Map Server/Actors/Chara/SubState.cs` | 2,108 | `341a61950202d46f5bd70eeaca03ee94f3f7cb2619caa779af8d674a41aece70` |
| `Map Server/Actors/Chara/Ai/BattleCommand.cs` | 21,682 | `d18aa0c2a929fb2f1610172c04353199ee339f31d93d45eb80b7fcf3ab669088` |
| `Map Server/Actors/Chara/Ai/HateContainer.cs` | 28,619 | `fc203832aa9d7bfb2844438299ecd55b9f9c5c699ff49169a90b9ad256f3371d` |
| `Map Server/Packets/Send/Actor/SetActorSubStatePacket.cs` | 2,660 | `338eb00932c318c5d6c3e3e8afd6a7548982536c9bef0ef343291a437491f4c9` |
| `tools/validate_ifrit_family.ps1` | 91,043 | `7f0b87b04984ca35fd4a0534a9393fa9e677071de088d3b50b7f107b7ffa755c` |

## Core report pins

| Report | SHA-256 |
|---|---|
| `IFRIT_OPCODE_0144_MODEL_STATE_GATE_AND_CALLER_CLOSURE_2026-08-05.md` | `b55aaefcbd832e02247df1711dea613c0789fae84a255d5820d4cc3b721732fc` |
| `IFRIT_PLUME_ERUPTION_INNER_GEOMETRY_DECOMP_2026-08-05.md` | `bf3dd8bc958c6019be539a315e4ebd4b64ae7841c5fa70bdf836c102e7c14796` |
| `IFRIT_ERUPTION_PLUME_MAPBIND_LAYER_TIMING_DECOMP_2026-08-05.md` | `6939e8d6d5758915a49d2b66b8a6f3fececab2b2e01f6115b856d90bf31054b9` |
| `IFRIT_GROUND_STATE_AND_NAIL_DEATH_CLOSURE_2026-08-05.md` | `957a21470af4efe4ca976139b06e06ccee98eb7266e669daf2061c0bcf93fef2` |
| `INFERNAL_NAIL_SPAWN_AND_DEFEAT_DECOMP_2026-08-05.md` | `7a4d94ab45444cc5b341fdba0fb299edd44503702f0806197a760adf94626142` |
| `IFRIT_HELPER_CARRIER_CENSUS_2026-08-05.md` | `d326344201a4a366f6bc1135498c0d1cb37f22b2dbef5568de8c11e6e8d3ecfb` |
| `IFRIT_BOWL_ARENA_TILE_EXHAUSTIVE_INSTANCE_DECOMP_2026-08-05.md` | `4177742d7fcab0b7597f076b40862be93727ce6673b546dd6020aa5c55bdcc26` |

## Validation and runtime state

- `dotnet build ".\Map Server\Map Server.csproj" -c Release -p:Platform=x64 --no-restore`
  succeeded on 2026-08-05 with **0 errors and 52 existing warnings**.
- `powershell -ExecutionPolicy Bypass -File .\tools\validate_ifrit_family.ps1`
  failed at clean HEAD with the pre-existing HateContainer contract:
  `per-owner enmity indicator suppression does not clear current UI and rebuild it on restore`.
- The build's generated untracked `exports/garuda-ai-handoff-20260805` bundle
  was removed after the baseline build.
- No Map Server process was running when this handoff was created.
- The worktree was clean before adding this file.

## Handoff safety check

This handoff adds only this Markdown file. It does not change server code, Lua,
SQL, packet definitions, client data, DATs, or the installed executable.
