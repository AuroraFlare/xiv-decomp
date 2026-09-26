# Ifrit, Bowl of Embers, and Infernal Nail animation decomp

Documentation snapshot: **2026-08-02 (America/New_York)**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Scope: **all directly installed Ifrit/Nail animation resources, their recovered dependencies and state surfaces, the Bowl battlefield resources, and the current AuroraFlare invocation paths**  
Change policy: **viewing and Markdown only**. This research changed no server code, SQL, validator, client DAT, executable, capture, or gameplay asset.

## Result

The missing presentation is not one animation. It spans actor motion, actor-bound effect schedulers, battlefield layout content, generic helpers, state controllers, and server choreography.

The installed surface is now exhaustively documented at the directly decoded roots:

| Surface | Closed inventory |
|---|---:|
| `m852` Ifrit root | 34 files, 21,080,376 bytes: 26 action, 6 equipment/model, 2 skeleton |
| `m524` Infernal Nail root | 9 files, 2,889,204 bytes: 2 action, 6 equipment/model, 1 skeleton |
| Direct action containers | **28/28**: 26 Ifrit and 2 Nail |
| Live outer action-resource entries | **251/251**: 59 SCB, 63 MCB, 63 MTB, 23 RES, 41 CIBT, 2 CIBC |
| Literal external-reference sweep | 51,111 client files, about 5.09 GiB; four `m852` cutscene bundles, `m999` WSS1/WSS6, and one `m526` boundary dependency recovered |

“Exhaustive” here means the complete direct `m852`/`m524` model-root manifests, every live outer entry in their 28 action containers, and every external file found by the full literal-reference sweep. It does not invent numeric/hashed-only runtime edges, undecoded SCB branches, or retail selectors that are not present in the evidence.

## Findings by reported symptom

| Requested area | Installed finding | Current invocation at Lua SHA `f868e997...` | Remaining boundary |
|---|---|---|---|
| Ifrit dash body | WSS `0007`; five-frame `cbbm_sp_b02`; dominant local `hara` Z delta `+8.916` | Hard sends authoritative active movement, then WSS7 for each rush | Runtime capture on the boss/clones and retail timing parity |
| Dash flames/fade | WSS7 includes separately hashed ACB `m852_0007_fire`, caster/target VFX, motion-emitted VFX, fade, and color controls | Hard's WSS7 request is the only explicit custom selector; movement opcode `0x00CF` has no flame field | Prove every authored layer renders and attaches correctly |
| Dash recovery | WSS `0008`; 32-frame `cbbm_sp_b04`; recovery/fade/footstep content | The latest source no longer calls WSS8; an earlier live snapshot did | Whether retail needs WSS8 here and its exact tail timing |
| Jump/takeoff | WSS `0018`; five-frame `cbbm_sp_05`; local Y delta `+11.424` | Hard now raw-plays WSS18 before staging and immediately after each rush stop | Runtime rendering and Normal/Extreme parity |
| Return/landing | WSS `0019`; 30-frame `cbbm_sp_06`; local Y delta `-10.913` | Hard now raw-plays WSS19 at perimeter appearance and final return | Runtime rendering and scheduler side effects |
| Hard glow/form transition | WSS `0015`; 40-frame/1.333-second `cbbm_sp_03` plus `cbxs_st0to4`, caster effect; WSS16 is the `st4 -> st0` reverse | Hard plays WSS15 once at or below 50% HPP when idle/safe; WSS16 is intentionally not sent in battle. Current manager state replays WSS15 to late joiners after glow activation | Retail phase/event parity and persistent-form rendering |
| Ground Eruption | WSS `0010` is the strongest rock/fire/glow/distortion candidate; WSS `0004` is a secondary moving-fire candidate | Hard now runs three-pulse Eruption trains: the first casts from Ifrit; a second post-Hellfire train casts from class `2207310` at arena center. Every pulse snapshots its target's current point for damage, but presentation remains private `23983`/canonical donor WSS2; WSS4/WSS10/WSS21/22 are not selected | Prove target-ground rendering despite the source/target packet boundary; exact retail selector/owner/timing |
| Radiant Plumes | WSS `0012`-`0014` form the strongest three-layout fire family; effect-only WSS `0021`/`0022` are helper candidates | Hard now spawns class `2207310` at arena center for center/outer Plumes, or Ifrit's current position for the final 50/8 donut, then casts private `23987`/`23988` through canonical WSS3/WSS1 donors. WSS12-14/WSS21-22 remain unselected. Normal/Extreme stay generic | Runtime proof that the helper/model donors render the intended layouts; retail bank/owner/pattern parity |
| Infernal Nail spawn | WSS `0001`; three-second `sp_01`, `st0 -> st1`, actor-bound fire/rock/glow/distortion | Nail is published hidden/untargetable, waits `0.1 s`, receives WSS1, waits `1.5 s`, then becomes visible/targetable | In-client growth/ignite proof and late-join behavior |
| Nail stable/death/consume | BID `activ`, `deact`, `ded`, `dedpose`, `id0`, `msb4_1`; e002 `m524_body_aura`; distinct e001/e002 death packages | No explicit BID selector. Killed Nails now follow ordinary `DEAD`, a four-second configured corpse/fade path, and permanent one-shot removal; ordinary Hellfire cleanup preserves them. Surviving Nails are still directly despawned without a consume tail. The GM shatter helper now uses normal damage | Exact `ded`/`dedpose` rendering, stable aura/state selection, Hellfire-consume tail |
| Persistent arena fire ring | Installed Bowl layout instance `isgrp_016280` references group `sgrp_vfx_ifring`; five group-owned timeline SCBs, one separate nearby fire SCB, VFX/collision/attributes, and dependencies are recovered | No recovered live server map-object owner/call addresses the client layout group | Runtime initial state, owner, show/hide polarity/order, wipe/late-join reconstruction |
| Battlefield atmosphere | Native weather `8028` maps to `wtr_smmn`; AuroraFlare's additive overlay maps custom `8074` to the same payload | Zone-in sends `8074` | Confirm that the generated overlay is active in the launched client path |

The current GM-only `ground`/`bank` diagnostic can spawn banks `2`, `3`, `4`, `10`, `12`, `13`, `14`, `21`, or `22` at the GM's exact position on scoped helper/dummy actors. It covers the full Eruption/Plume candidate matrix in this bundle, but it is separate from Hard's new private-command helper choreography: no encounter route calls the GM probe itself, and a successful diagnostic render would not prove the retail bank, owner, placement, or timing.

## What “the dash is almost there but flames are missing” means

The body transport and the authored flame controller are separate surfaces:

1. `0x00CF` moves the actor using position, rotation, movement state, and floating height.
2. WSS `0007` supplies the short dash pose and actor-bound presentation scheduler.
3. `m852_0007_fire` is a distinct embedded controller inside WSS7; moving the body or playing only a skeletal pose cannot execute it.
4. The current Hard path requests WSS7 after publishing movement, which is the correct resource family to test, but source inspection alone cannot prove every flame/trail/fade layer renders.

WSS `0008` remains a real complementary recovery asset, but it is not selected in the latest audited source. WSS `0018` and `0019` are now used for the Hard takeoff/absence/return sequence. WSS `0015` is a separate Hard form/glow transition rather than part of the dash.

## Battlefield correction

The persistent Bowl fire ring is no longer an unidentified background effect. Installed layout `data\61\5A\00\08.DAT` (`wil_w0_fld05` / `wil0Field05a`) contains:

- group `sgrp_vfx_ifring`;
- VFX `vfx_ifuring1_001`;
- attributes `attr_w0f0_ifu_ring_a` and `attr_w0f0_ifu_ring_b`;
- sound definition `sdef_ifrit_circle`;
- collision `coll_ifu_ring`;
- member aliases `show`, `hide`, `vtp1`, `sho1`, and `hid1`;
- client layout-instance name `isgrp_016280`, internal node ID `949` (not a decoded server ID `16280`); the adjacent `isgrp_016281` is terrain;
- five group-owned, directly mapped timeline scheduler bodies:
  `time_vfx_if_ring_a_show`, `time_vfx_if_ring_a_hide`,
  `time_vfx_if_ring_vtp1`, `time_vfx_if_ring_b_show`, and
  `time_vfx_if_ring_b_hide`;
- a sixth directly mapped nearby scheduler, `time_vfx_fire_vtp1`, which is
  **not** a member of `sgrp_vfx_ifring`.

The exact live server actor that owns or addresses client layout instance `isgrp_016280` was not recovered, so no server layout ID, trigger name, or packet target is guessed. The ring is also not evidence for Eruption or Plume: no named Eruption/Plume timeline exists in the layout. Hard now creates separate `2207310` mechanic helpers, but their canonical donor playback and retail ownership still require runtime proof.

Weather is a separate camera/sky/sound layer. Native RegionResourceData maps `8028` to `data\61\5A\00\20.DAT`; the AuroraFlare overlay defines `8074` as an additive alias to that payload. It includes `vfx_cam_fire`, `wildsw_ifrit_loop`, sky/cloud/environment schedulers, and sound—not the actor-bound WSS7 flame trail or the world-placed boundary ring.

## Nail correction

The current Nail path is no longer completely animation-free: WSS `0001` is explicitly requested during hidden spawn staging. Killed Nails also now enter ordinary BattleNpc `DEAD`, remain through a configured four-second corpse/fade path, and are permanently removed through a scripted one-shot lifecycle. The normal Hellfire cleanup leaves already-dead Nails to finish that path, while surviving Nails are still removed directly. The GM shatter helper now applies lethal damage instead of only assigning numeric HP. None of this explicitly identifies which `m524` BID death resource the client renders.

The broader installed Nail presentation includes:

- base states `st0`, `st1`, `st0to1`, and `st1to0`;
- BID activation, deactivation, idle, special, death, and death-pose motions;
- WSS1's state-changing fire/rock/glow/distortion action;
- e002 `init_msb4_0`, `init_msb4_1`, VEFF `4rcIUdanc_body1`, and persistent controller `m524_body_aura`;
- distinct e001/e002 death packages, including `m524_ded` and `anchor_524/ded/anc_dead1y.veff`.

The open Nail work is therefore exact model-specific state/render choreography and the surviving-Nail Hellfire-consume tail—not missing model/class bindings or missing client assets.

## Difficulty split in the current source

| Difficulty | Crimson Cyclone presentation |
|---|---|
| Normal | Generic private command `23984`; no custom perimeter/lane state machine |
| Hard | Custom WSS18 takeoff, WSS19 perimeter/start landing, private cast, movement plus WSS7 rush, WSS18 absence, and WSS19 final landing; one-time WSS15 `st0 -> st4` glow at or below 50% HPP |
| Extreme | Repeated generic `23984`; no custom Hard lane choreography |

Only Hard closes the server-invocation side for WSS7/WSS15/WSS18/WSS19. This does not prove retail authenticity or successful rendering.

At current SHA `f868e997...`, pre-Hellfire and Nail-phase Hard Cyclone use one body for one crossing. Post-Hellfire uses three bodies at separate perimeter starts in one simultaneous triangle crossing—not three sequential waves. The presentation API clears both nameplate properties and enmity UI and, when broadcast for an already-known actor, blanks/restores the actor-name packet. It does not hide the model. Calls made with `broadcast=false` before first instantiation (clones, mechanic helpers, and Nails) do not send that extra blank-name packet, so runtime capture must check for a residual grey base name.

Hard is also now the only difficulty with custom Eruption/Plume helper phases: three-pulse Eruption trains and center/outer/final Plume owners. Normal and Extreme retain their ordinary private-command queues. Those Hard helpers provide server-side source positions and cleanup, but they still select canonical WSS2/WSS3/WSS1 donors rather than the stronger decomp candidates, and Eruption's battle-result presentation still has no arbitrary ground coordinate field.

## Evidence status

| Status | Meaning |
|---|---|
| **Confirmed** | Direct installed bytes, decoded curve/resource, current source/SQL, packet structure, or recovered layout pointer |
| **High** | Multiple direct signals agree, but the final retail selector or runtime capture is missing |
| **Medium** | Strong content/capture correlation with a meaningful alternative still open |
| **Candidate** | Safe probe target only; not a mechanic rename or numeric substitution |

Command IDs, packed `battleAnimation` values, WSS numbers, scheduler names, VFX tokens, state controllers, BG keys, and mechanic names are different namespaces. This bundle does not equate them without a recovered join.

## Document index

Recommended reading order:

| Document | Purpose |
|---|---|
| [VISIBILITY_FIRST_ERUPTION_PLUME_NAIL_DECOMP_2026-08-05.md](VISIBILITY_FIRST_ERUPTION_PLUME_NAIL_DECOMP_2026-08-05.md) | Latest visibility-first correction: WSS21/22 impact equivalence, complete MapBind scan, executable VEFF-control decomp, WSS5 probe priority, and Nail/Bowl separation |
| [COMPLETE_COVERAGE_MATRIX.md](COMPLETE_COVERAGE_MATRIX.md) | Requirement-by-requirement closure matrix, contradictions, and final audit checklist |
| [LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md) | Exact latest Normal/Hard/Extreme and Nail invocation snapshot, file hashes, and validator drift |
| [EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md) | Complete 43-file direct manifest, all 251 outer resource rows, state/death/aura surfaces, nested resources, cutscene and helper spillover |
| [IFRIT_CLIENT_ANIMATION_BANKS.md](IFRIT_CLIENT_ANIMATION_BANKS.md) | Readable 26-bank Ifrit action inventory, motion curves, VFX candidates, and packet/bank distinctions |
| [INFERNAL_NAIL_ANIMATIONS.md](INFERNAL_NAIL_ANIMATIONS.md) | Readable `m524` BID/WSS lifecycle decomp and server-binding analysis |
| [EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md) | Exact Bowl ring/layout/weather scheduler pointers, hashes, dependencies, transport limits, and helper ownership boundary |
| [BATTLEFIELD_ERUPTION_AND_PLUMES.md](BATTLEFIELD_ERUPTION_AND_PLUMES.md) | Eruption/Plume geometry, candidates, helper surface, and presentation-owner gap |
| [CURRENT_IMPLEMENTATION_GAP_AUDIT.md](CURRENT_IMPLEMENTATION_GAP_AUDIT.md) | Historical implementation snapshot retained to document live worktree drift; its top notice points to the superseding live report |
| [EVIDENCE_AND_REPRODUCTION.md](EVIDENCE_AND_REPRODUCTION.md) | Evidence inputs, hashes, decoding method, retail-frame observations, and reproducibility boundaries |

## Current snapshot anchor

The live repository was dirty and changed independently during the investigation. The current-state reports pin their claims to:

| Input | Last write | Bytes | SHA-256 |
|---|---:|---:|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | `2026-08-02T17:35:21.6575829-04:00` | 68,376 | `f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320` |
| `Data/scripts/monster_tp.lua` | `2026-08-02T17:14:11.9601189-04:00` | 38,493 | `c242cc166242e08133f07b6125421d0f4de8bbe283e5dc3d721b1f6df71928ec` |
| `Map Server/Primals/IfritManager.cs` | `2026-08-02T17:19:02.3344635-04:00` | 58,143 | `3e102db48214f787f780399c755f7f9a834c795ae051f060472f834e8683f4ac` |
| `Map Server/WorldManager.cs` | `2026-08-02T16:56:39.4834718-04:00` | 648,302 | `04ecf1d97f35e78f4d1ae54bbfc2708b8a76dfdaac869483d8f8598325d593e0` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | `2026-08-02T17:35:53.5025623-04:00` | 200,669 | `a7bc3d40e4640bd66f3db92923611ca6444c2b6269db55bce98fe7607191ad02` |
| `Data/scripts/commands/gm/testifrit.lua` | `2026-08-02T17:00:40.0987058-04:00` | 1,936 | `2efb705fc52d4fe39f9b472e7015f886252be028bbe9cdbde09e2e2fe81e8c95` |
| `tools/validate_ifrit_family.ps1` | `2026-08-02T17:39:07.8433045-04:00` | 56,396 | `8050956b274a8515abed84e2fbf03a05aaa429adf2994ae67e7629b100b8f0d4` |

Older `87360bbe...`, `ba369568...`, `1d55423f...`, `e2a8e612...`, `6852907b...`, `a80d658d...`, and `bf848b75...` observations are retained as history because they show when dash/jump/Nail/glow, Hard ground-helper choreography, and finally simultaneous post-Hellfire Cyclone batching changed. They are not labeled as the latest state. A brief `a80d658d...` telemetry-arity mismatch was corrected before helper integration. The current validator passes and asserts the major selectors, state bridge, helper lifecycle, single-wave Cyclone batching, nameplate/name-packet presentation API, expanded probe list, and old WSS8-constant absence; none of those static checks is runtime render proof.

## Genuinely unresolved after the exhaustive pass

- Successful in-client rendering, attachment, fade, persistent-state, and late-join proof for current Hard WSS7/WSS15/WSS18/WSS19 and Nail WSS1 requests.
- The full ordered/conditional actor-action SCB graph and exact retail command-to-bank joins.
- Runtime proof and retail parity for Hard's new Eruption/Plume helper owners: Eruption target-ground presentation, helper-model donor compatibility, exact offsets/rotations, effect lifetimes, and visual cleanup. Normal/Extreme still lack the Hard helper path.
- Plume-versus-Hellfire attribution for WSS `0012`-`0014` and exact use of WSS `0021`/`0022` or `m999` helpers.
- Nail stable aura, explicit BID state selection, exact `ded`/`dedpose` rendering under automatic `DEAD`, Hellfire consumption for surviving Nails, and measured fade/despawn timing.
- The live Bowl layout map-object owner, ring initial state, show/hide polarity, call order, wipe reset, and late-join reconstruction.
- Confirmation that the generated `8074` weather overlay is active in the actual launch path.

These are explicitly bounded runtime/selector questions. They do not erase the confirmed asset inventory or justify inventing mappings.
