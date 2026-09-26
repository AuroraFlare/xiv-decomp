# Ifrit / Bowl of Embers / Infernal Nail decomp completion matrix

Audit date: **2026-08-02 (America/New_York)**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Policy: **documentation only**. This audit read files and created this Markdown report. It did not change server source, SQL, validators, client DATs, executables, captures, or gameplay data.

## Verdict

The requested finding set is covered at the installed **action-container** level: every one of the 26 `m852` action banks and both `m524` action banks is present in the reports and every reported SHA-256 was found in the live installed files. The symptom-oriented coverage is also complete as research: dash/fire, dash recovery, takeoff/landing, Eruption candidates, Plume/helper candidates, arena fire ring, Nail lifecycle, and current invocation gaps all have an evidence-backed disposition.

That does **not** mean every candidate has a proven retail selector. Three closure classes must remain separate:

- **File/content closed:** the installed bank, scheduler/controller names, motion curves, VFX references, size, and hash are directly recoverable.
- **Invocation closed for the audited server snapshot:** the current source explicitly selects the resource, or demonstrably does not.
- **Retail-semantic/runtime open:** an exact retail command/SCB edge, actor/helper owner, attachment, ordering, or in-client render capture is still missing.

The original six baseline snapshots were sufficient to prove that the principal client assets exist, but their current-state wording became stale while the live tree changed. In this final bundle, each readable baseline has a reconciliation notice, the exhaustive companion reports close the broader client/battlefield surfaces, and the final live report pins WSS7/WSS15/WSS18/WSS19, WSS8 absence, Hard Eruption/Plume helper choreography, Nail WSS1 and ordinary death plumbing, and the expanded GM probe at the newest audited hashes.

## Inputs pinned for this audit

### Historical pre-integration baseline snapshots

| Report | Bytes | SHA-256 |
|---|---:|---|
| `BATTLEFIELD_ERUPTION_AND_PLUMES.md` | 8,897 | `b66b70a7e47cae64d4a673af5b359fa3640ca9f7759e04b90a951a3631b60410` |
| `CURRENT_IMPLEMENTATION_GAP_AUDIT.md` | 11,435 | `6148f7c7f9e27a00f5284699c49f55555723f9b0ad58ccc193e9f2522886fea6` |
| `EVIDENCE_AND_REPRODUCTION.md` | 14,241 | `bf5b5f5769675dc73e612e16cb2e58bbb81b148774a9378690f8b1fb2a96f5cc` |
| `IFRIT_CLIENT_ANIMATION_BANKS.md` | 25,695 | `4d27ff78618fbd06f3141e83a08136914897e926550bac5c55087e6f12d17ec0` |
| `INFERNAL_NAIL_ANIMATIONS.md` | 15,872 | `acdf1b4cadb5da3c16e16f7d2bb075a5f55c8f08aa77d11f7920ed0c4cc1ea49` |
| `README.md` | 10,316 | `c84895792740ea0e737a481fe9f09949aaab9e486c6de3ef251aa11968f86893` |

Final current implementation reconciliation: [LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md), 17,921 bytes, SHA-256 `0856135e2f0b89e53ccde4d4bee19054b447db0678c4b8c05bca1daeffa11ad1`.

Final integrated battlefield closure: [EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md), 37,981 bytes, SHA-256 `1dbe026ac4870b5ddd1d1ae13b72bcafc26531f109059e8a191d42b960082ba8`. Its ring, weather, scheduler-transport, current selector, and expanded GM-probe wording is reconciled to the final source pins.

Final integrated client-resource closure: [EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md), 111,965 bytes, SHA-256 `b0573dc243b2036d6303c1837fed7841468081330398414a9bfdb8df2c4c5c4a`. It catalogs all 43 files under the direct `m852`/`m524` roots, all 251 live outer action-resource entries, nested control/effect resources, model states/death/orientation/aura packages, and literal external dependency boundaries.

### Live implementation drift discovered during the audit

| Input | Observation | Bytes | SHA-256 |
|---|---|---:|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` (first post-report drift) | `2026-08-02T16:30:29.3494099-04:00` | 59,890 | `e2a8e6122f0b63c17a97fffdb61e83675f0c558a82e55dc2c7b704ab7698599a` |
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` (second post-report drift) | `2026-08-02T16:39:08.3281333-04:00` | 60,619 | `6852907ba84c29ea553da693c4814199f48a8c44ee09e3c5b7e381f3c48d6eb3` |
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` (glow/Nail-ignition drift) | `2026-08-02T16:50:54.4553892-04:00` | 61,838 | `a80d658dbfe6c5e93e06e39bc7b1f2167ba5f9a9c6757803c2649a814db75aba` |
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` (helper/Nail-lifecycle drift) | `2026-08-02T17:13:38.0113900-04:00` | 68,144 | `bf848b75c5a6598ce5c539879a020c4d87074d38b08e7f59ebfe34b6c70e9401` |
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` (newest audited) | `2026-08-02T17:35:21.6575829-04:00` | 68,376 | `f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320` |
| `Data/scripts/monster_tp.lua` (newest audited) | `2026-08-02T17:14:11.9601189-04:00` | 38,493 | `c242cc166242e08133f07b6125421d0f4de8bbe283e5dc3d721b1f6df71928ec` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` (newest audited presentation API) | `2026-08-02T17:35:53.5025623-04:00` | 200,669 | `a7bc3d40e4640bd66f3db92923611ca6444c2b6269db55bce98fe7607191ad02` |
| `Map Server/Primals/IfritManager.cs` (baseline) | historical | 55,700 | `d6605e8e88c9acb860a50a4a11871aba4e0953c636286585f2d19396bdf7466c` |
| `Map Server/Primals/IfritManager.cs` (ground-probe drift) | `2026-08-02T16:44:49.0516740-04:00` | 57,455 | `249617992147f97659e99dad96ebac0f140c629b454e57ecd5319c82d8680871` |
| `Map Server/Primals/IfritManager.cs` (telemetry/replay fix) | `2026-08-02T16:56:39.4538255-04:00` | 58,078 | `e552ac8071cf23ee62466800e2922cf9f042580345399dedbece8c1792379f2d` |
| `Map Server/Primals/IfritManager.cs` (probe/glow replay) | `2026-08-02T17:00:40.0921989-04:00` | 58,116 | `a2445af01d9119382697e769f601ed35e107a6ad5ad308b2172663b70a85de9f` |
| `Map Server/Primals/IfritManager.cs` (newest audited; real GM Nail death path) | `2026-08-02T17:19:02.3344635-04:00` | 58,143 | `3e102db48214f787f780399c755f7f9a834c795ae051f060472f834e8683f4ac` |
| `Map Server/WorldManager.cs` (pre-fix draft pin) | `2026-08-02T16:45:03.1639070-04:00` | 648,235 | `8f31f600ce75a850ba80f703bba535bbb7f8e4a494052ae04b5a8fba0515b7b2` |
| `Map Server/WorldManager.cs` (newest audited) | `2026-08-02T16:56:39.4834718-04:00` | 648,302 | `04ecf1d97f35e78f4d1ae54bbfc2708b8a76dfdaac869483d8f8598325d593e0` |
| `Data/sql/server_battle_commands.sql` | unchanged from baseline | 576,173 | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |
| `tools/validate_ifrit_family.ps1` (baseline) | historical | 49,358 | `34bab73c15d90b9a741ff8b3ac60bad7d30d971ef9b1f192f047693da989f54b` |
| `tools/validate_ifrit_family.ps1` (pre-glow assertions) | `2026-08-02T16:46:31.9168350-04:00` | 54,340 | `152b1e0bf307f3cf19fa31592b1a1fc928fe0e77a53e3b71951776096bb6e902` |
| `tools/validate_ifrit_family.ps1` (glow/telemetry assertions) | `2026-08-02T16:58:31.0169691-04:00` | 55,176 | `175e4194f065c5eda9963e261c29ebd831134d0b55b59f330f1d24e56fa58537` |
| `tools/validate_ifrit_family.ps1` (pre-helper integration) | `2026-08-02T17:01:19.0681622-04:00` | 55,195 | `25d0cf2cb0c2b9651c3a5a44f5bbecd8264cdf65a22a881e90386ac830a828d8` |
| `tools/validate_ifrit_family.ps1` (pre-formation/name assertions) | `2026-08-02T17:19:02.3384649-04:00` | 56,039 | `3cce1292fa4a3bc0e2a093cf9acfb512dc79bd11e770f252efeccc4f88191c71` |
| `tools/validate_ifrit_family.ps1` (newest audited) | `2026-08-02T17:39:07.8433045-04:00` | 56,396 | `8050956b274a8515abed84e2fbf03a05aaa429adf2994ae67e7629b100b8f0d4` |

The `e2a8e612...` snapshot added raw WSS `0018`/`0019` around Hard-mode WSS `0007`/`0008`. The `6852907b...` snapshot removed WSS `0008`, changed the post-rush sequence to WSS18 plus a `3.25 s` return delay before WSS19, and added actor-bound `m524` WSS1 Nail ignition. The `a80d658d...` snapshot added WSS15 (`0x1300F000`) for Hard's half-HP `st0 -> st4` glow transition. The `bf848b75...` snapshot wired Hard Eruption and Plume through scoped `2207310` helpers and gave player-killed Nails an ordinary four-second one-shot death/fade path. The newest `f868e997...` snapshot changes Hard Cyclone from repeated sequential crossings to one one-body crossing before Hellfire/during Nails and one simultaneous three-body crossing after Hellfire. BattleNpc `a7bc3d40...` additionally blanks/restores the actor's base-name packet when combat presentation is hidden/restored **with broadcast enabled**; it still does not hide the model. Manager `3e102db4...` keeps GM Nail shatter on real damage/death. Findings about current invocation must name `f868e997...`; all earlier hashes are historical observations only. Validator `8050956b...` parses all 15 Lua files and passes its final static contract, but remains static rather than render proof.

## Exact installed action-bank census

Read-only enumeration found:

| Model root | All installed files | Installed bytes | Action containers | Non-action support files |
|---|---:|---:|---:|---:|
| `client/chara/mon/m852` | 34 | 21,080,376 | 26 | 8: six `equ`, two `skl` |
| `client/chara/mon/m524` | 9 | 2,889,204 | 2 | 7: six `equ`, one `skl` |

Every one of the 28 installed action-file hashes occurs in `IFRIT_CLIENT_ANIMATION_BANKS.md` or `INFERNAL_NAIL_ANIMATIONS.md`; the audit result was **28 present, 0 missing**.

### `m852`: all 26 installed action containers

- FID: `1110`
- BID: `0000`
- BTL: `0001`
- MGC: `0001`, `0002`, `0003`, `0004` (byte-identical aliases)
- WSS: `0001`, `0002`, `0003`, `0004`, `0005`, `0007`, `0008`, `0010`, `0012`, `0013`, `0014`, `0015`, `0016`, `0017`, `0018`, `0019`, `0020`, `0021`, `0022`

No `m852` WSS `0006`, `0009`, or `0011` is installed. Generic `m999` WSS `0001` and `0006` retain related Ifrit/helper effect content; they are spillover dependencies, not missing `m852` body banks.

### `m524`: both installed action containers

- BID: `0000`
- WSS: `0001`

This closes the installed action-file census. The six baseline reports do **not** individually enumerate the eight `m852` and seven `m524` non-action model/equipment/skeleton support files, nor every outer `SEDBRES` row in every bank. The exhaustive client-resource report closes that broader manifest with all 43 direct-root files and 251 live outer action entries: `m852` has 224 (57 SCB, 54 MCB, 54 MTB, 22 nested RES, 36 CIBT, one CIBC), and `m524` has 27 (two SCB, nine MCB, nine MTB, one nested RES, five CIBT, one CIBC).

Its installed-tree literal scan also bounds external references: outside the two direct roots, only four m852-bound cutscene bundles, two `m999` WSS spillover files, and one ambiguous five-bone `m526` BID dependency literally name these resources. Numeric-only, hashed, or executable-generated edges remain outside what any literal scan can exclude.

## Requirement-by-requirement matrix

| Requested area | Installed evidence | Invocation at Lua SHA `f868e997...` | Documentation verdict | Remaining evidence boundary |
|---|---|---|---|---|
| All Ifrit animation/action banks | Complete 26-file `m852` census plus exhaustive 224-entry outer resource catalog; full state/death/orientation and nested action/effect surfaces are separated from 135-bone body MTBs | Ordinary donors select WSS1-4; Hard explicitly selects WSS7, WSS15 and raw WSS18/19; WSS8 was removed; all other installed WSS remain unselected by encounter Lua | **Closed at installed file/resource-table level** | SCB branch/clip semantics, every runtime attachment, low effect selectors, and exact retail command joins remain unparsed |
| Dash body | WSS `0007`, five-frame `cbbm_sp_b02`, dominant local `hara` Z delta `+8.916`, authored caster/target/fire resources | Hard publishes active `0x00CF`, then `0x013C` WSS7. Before Hellfire and during Nails it uses one body for one crossing; after Hellfire three bodies cross separate lanes simultaneously as one triangle wave. Normal and Extreme still use generic `23984`/WSS1 | **Covered; Hard invoked** | Runtime packet/video proof on boss and every clone; retail difficulty parity |
| Dash flames/fade | WSS7's independent `m852_0007_fire` ACB is 1,016 bytes, SHA-256 `4a127445227a8ce5200c43aff3482931f16ffe62e1101d62f04ad4e97b8ebe83`, with a 61-frame three-channel effect curve; caster/target VEFF/ACBs and motion-emitted controls are separately cataloged | Same Hard WSS7 call is the only explicit current selector; movement or the five-frame body MTB alone cannot execute the flame controller | **Asset/resource path confirmed; render open** | Prove scheduler reaches the flame ACB, plus trail/fade attachments, lifetime, and clone visibility in-client |
| Dash recovery | WSS `0008`, 32-frame `cbbm_sp_b04`, complementary local Z delta `+9.989` | **Newest drift removed the call.** Hard stops, immediately raw-plays WSS18, and no longer sends command `23008`/WSS8 | **Covered asset; currently uninvoked** | Whether retail uses WSS8 in this route, runtime recovery rendering, and exact tail |
| Jump/takeoff | WSS `0018`, five-frame `cbbm_sp_05`, local Y delta `+11.424` | Hard uses raw `PlayAnimation(0x13012000)` before perimeter staging and immediately after each rush stop | **Covered; now invoked in Hard** | The source comment calls it live-confirmed, but this evidence bundle still lacks a retained packet/video capture proving rendering and retail timing |
| Return/landing | WSS `0019`, 30-frame `cbbm_sp_06`, local Y delta `-10.913`, return/footstep content | **New live drift:** Hard uses raw `PlayAnimation(0x13013000)` when bodies appear at perimeter starts and when the real boss returns to its hate target | **Covered; now invoked in Hard** | Runtime proof on boss/clones; whether raw playback reproduces every scheduler side effect; Normal/Extreme parity |
| Hard glow/form transition | WSS `0015` is the decoded 40-frame / `1.333 s` `st0 -> st4` transition; WSS `0016` is its reverse | Hard waits until HPP `<= 50`, with no Nail/Cyclone/Eruption/Plume/queue/cast active, then raw-plays WSS15 and reserves `1.33 s`; WSS16 is not sent. C# accepts/persists `hardGlowActive` and replays `0x1300F000` to a reconnecting player after the boss is instanced | **Asset, live selector, telemetry and late-client selector covered** | Successful persistent rendering and retail selector/timing remain runtime evidence boundaries |
| Ground Eruption | WSS `0010` is the strongest rock/fire/glow/distortion candidate; WSS `0004` is secondary moving-fire content | Hard now queues one three-pulse train before Hellfire and two after it. Train 1 casts from Ifrit; train 2 uses a scoped `2207310` helper at arena center. Every pulse still runs private `23983` against a player snapshot and resolves through canonical WSS2; the result packet has no world coordinate, the helper is not placed at that snapshot, and WSS4/WSS10 are not selected. Normal/Extreme remain generic | **Hard choreography/helper path invoked; visual selector open** | Prove visible ground anchoring and compatibility on `2207310`; recover the retail WSS/helper owner, telegraph/detonation timing, and cleanup |
| Radiant Plume family | WSS `0012`-`0014` share 130-frame `sp_b03` with three distinct large fire layouts; WSS `0021`/`0022` are effect-only Kuroko/helper candidates | Hard now spawns one scoped `2207310` helper per Plume. Center/outer helpers sit at arena center; the post-Hellfire final helper sits at Ifrit's current position and `monster_tp.lua` changes private `23988` to a self-origin `50`/`8` donut. Presentation still resolves through canonical donor WSS3 for center and WSS1 for outer/final; WSS12-14/WSS21-22 are not selected. Normal/Extreme remain generic | **Hard fixed-owner damage choreography invoked; authored selector open** | Runtime helper/model/effect proof, retail pattern ownership, presentation attachment, timing and cleanup |
| GM-only ground-bank probe | Asset candidates remain as above | New manager probe supports banks 2, 3, 4, 10, 12, 13, 14, 21 and 22 at the player's exact position. It uses class `2207310` for 2/3 and class `2207314` for the others, then sends the packed WSS. No encounter route calls it | **Full documented candidate probe set available; mechanic join still open** | Captures must establish actor compatibility, visible placement, effect ownership and retail timing before any combat integration |
| Battlefield / persistent fire ring | Installed `wil_w0_fld05` layout places client-named instance `isgrp_016280` -> `sgrp_vfx_ifring` at `(2526.596924, 248.343002, 2208.061035)`. The group has five exact aliases and direct member SCBs; a sixth nearby direct-mapped `time_vfx_fire_vtp1` SCB is not a group member | Server still sends no Ifrit map-object scheduler call and has no recovered zone-aware SQL binding | **Asset identity and placement closed; server trigger open** | Exact runtime initial state, live map-object owner, show/hide Boolean polarity, call order and late-join behavior |
| Infernal Nail lifecycle | Complete BID/WSS surface plus four model-state pairs, two death variants, and e002 persistent `init_msb4_1` / `m524_body_aura` package; the aura ACB is 1,016 bytes, SHA-256 `be3618152096e9121dc7e83af3eb10f52638b3a413f651c768297171095d0410` | Correct Nails are published hidden/untargetable, then after `0.1 s` receive WSS1; after `1.5 s` they become visible/targetable. Each Nail now has a four-second despawn time and scripted one-shot lifecycle. Normal cleanup preserves player-killed corpses for ordinary death/fade removal, and GM shatter now uses `AddHP` to enter `Die`; surviving Nails are still directly despawned at Hellfire. No explicit e002 aura or BID activation/stable/death/deactivation selector is sent | **WSS1 and generic player-death plumbing invoked; authored persistent/consume lifecycle open** | Runtime growth/ignite/death proof; reconcile `1.5 s` reveal with `3.0 s` body motion; determine aura/BID selection and Hellfire-consume ordering |
| Current invocation gaps | Difficulty routes, donor remapping, packet channels, helpers, validators and Nail cleanup are traced | Hard has one-body x1 pre-Hellfire/Nail Cyclones, one simultaneous three-body x1 post-Hellfire Cyclone, WSS18/19 staging, movement/WSS7, WSS18/return-delay/WSS19, WSS15 half-HP glow, Eruption volleys, and helper-owned Plumes. Normal/Extreme remain generic. Nail WSS1 and generic player-death/fade plumbing are active. Candidate Eruption/Plume WSS banks, the ring trigger, Nail aura/BID selectors, Hellfire-consume tail, and late-client Nail ignition remain uninvoked or unproven; the direct bank probe stays GM-only | **Covered, but time-bounded** | Re-pin whenever the live dirty worktree changes |
| Evidence/confidence boundaries | Reports consistently separate Confirmed, High, Medium and Candidate and warn that bank number, command ID, effect token and mechanic name are different namespaces | Current code selection proves invocation only, not retail authenticity or successful rendering | **Closed** | Do not promote candidates without SCB, retail-script, packet, or runtime capture evidence |

## Battlefield fire-ring correction

The installed layout recovery materially changes the baseline battlefield conclusion without making the ring an Eruption/Plume resource or proving any candidate action-bank selector.

Confirmed installed layout file:

| Resource | Bytes | SHA-256 | Directly recovered identity |
|---|---:|---|---|
| `data\61\5A\00\08.DAT` | 1,245,056 | `56b24e6aca53911810848baf7be254a2c20038d8c127bcc0c8603ba6b0614e7c` | `MapLayoutResourceData` for `wil_w0_fld05` / `wil0Field05a` |
| `data\89\84\00\74.DAT` | 11,676 | `f399fa88a3654a81ee8c00744c5994a063dcc785ddc9ccc868841ee5c323be39` | `f0ifuring1.veff`, the public Bowl fire-ring effect |

Strict layout decoding establishes that client instance `isgrp_016280` directly references `sgrp_vfx_ifring` at world position `(2526.596924, 248.343002, 2208.061035)`. Its internal layout node ID is `949`; the string suffix `016280` must not be converted into a server map-object/actor/layout ID. The ring unit provides exact short aliases `show`, `hide`, `vtp1`, `sho1`, and `hid1` for five member timelines.

The layout contains the ring group/VFX/collision identifiers above plus these six named timeline surfaces:

1. `time_vfx_if_ring_a_show`
2. `time_vfx_if_ring_a_hide`
3. `time_vfx_fire_vtp1`
4. `time_vfx_if_ring_vtp1`
5. `time_vfx_if_ring_b_show`
6. `time_vfx_if_ring_b_hide`

Each timeline row points directly to its embedded SCB through the timeline object's stored pointer and size fields; the map is not an ordering guess. The nearby `time_vfx_fire_vtp1` row is not a member alias of `sgrp_vfx_ifring`. The `show`/`hide` names strongly imply opposite states, but the serialized Boolean polarity and retail call order remain undecoded.

This proves that the persistent arena ring is **layout-authored**, not merely an unidentified weather effect. It does not prove that Eruption or Radiant Plume use those ring schedulers, and it does not prove how the current server should address the layout group. The accurate current statement is:

> The installed Bowl layout contains an authored fire-ring group, VFX, collision attributes, and show/hide timelines. The AuroraFlare Ifrit path does not currently issue a recovered call that selects them, and the exact server-to-layout owner/key join remains unresolved.

The transport boundary is also narrower than the baseline report implied. Opcode `0x00D9` still carries at most eight ASCII bytes, but `Npc.RunMapObjScheduler` uses `_runBgSchedulerFromMidstream` over opcode `0x0130` and accepts a 1-64-character scheduler plus an offset. Both paths still require a live server `Npc` map-object owner instantiated for the player; no such zone-240 owner has been recovered.

Weather is a separate layer: native client weather `8028` (`wtr_smmn`) selects `data/61/5A/00/20.DAT`, while AuroraFlare's generated overlay maps custom `8074` (`wtr_ifrit_af`) to that retail payload. It supplies camera-bound fire plus sky/cloud/fog/light/sound atmosphere, not the world-placed ring, dash flames, Eruption, Plumes, Hellfire, or Nail animation. Whether the generated overlay is active in the user's launch path remains a runtime boundary.

## Current Hard Cyclone presentation at `f868e997...`

The newest live source uses three distinct visual banks around authoritative movement and has removed the earlier WSS8 recovery:

1. Formation is phase-dependent but always exactly one wave: one body x one crossing before Hellfire and during Nails; three bodies x one simultaneous crossing after Hellfire. The older one-body/three-body x3 sequential sequence is historical.
2. The real boss plays raw WSS18 (`0x13012000`) for `0.45 s` before lane staging.
3. Every staged body plays raw WSS19 (`0x13013000`) for `1.0 s` at its perimeter start.
4. Private `23984` casts for `3500 ms`; the state machine waits for `CanChangeState()` so result/cast cleanup finishes before the rush.
5. Every body in the formation sends active movement first and WSS7 second, waits `0.5 s`, then sends stopped movement and immediately raw-plays WSS18. In the post-Hellfire formation, all three bodies traverse their lanes together rather than as three sequential waves.
6. The source waits `3.25 s` with bodies untargetable and combat presentation suppressed. With broadcast enabled, BattleNpc `a7bc3d40...` clears both nameplate properties, suppresses enmity indicators, and broadcasts an empty base-name packet; restore broadcasts the authored name again. None of those operations hides the model, so visible disappearance still depends on WSS18 rendering as authored. After the single wave, clones are removed and the real boss warps to the current top-hate target, plays WSS19 for `1.0 s`, and restores normal presentation.

This closes the earlier **uninvoked jump pair** finding for the current Hard path only, while reopening WSS8 recovery as an uninvoked asset. It does not close successful client rendering, retail timing authenticity, or Normal/Extreme parity.

The nominal one-wave Nail-phase path consumes about `9.7 s` before tick overhead (`0.45 + 1.0 + 3.5 + 0.5 + 3.25 + 1.0`). `HARD_NAIL_SPECIAL_COMPLETION_MARGIN` is `10 s`, leaving only roughly `0.3 s` for coroutine ticks, state gates and preparation. The path may therefore be skipped or overrun near the deadline; the remaining source comment that calls the charge “three-second” is not an accurate end-to-end timeline.

## Current Hard Eruption/Plume helper path at `f868e997...`

This newest path closes part of the server-owner/choreography gap for **Hard only**, without proving the recovered retail animation candidates:

- `spawnMechanicHelper` creates class/appearance `2207310` (`IfritHotAir`) at a scoped position, makes it invulnerable, nonaggressive, auto-attack-disabled and untargetable, and records it for cleanup. Its pre-instantiation `SetEncounterCombatPresentationVisible(false, false)` changes server presentation state and enmity suppression but, because `broadcast=false`, sends neither the explicit property-zero packet nor the new empty-name packet. It also does not hide the model. Helper name/model/UI behavior therefore still requires runtime capture.
- A Hard Eruption volley owns three pulses per train. Before Hellfire it uses one train cast by Ifrit; after Hellfire it uses two, with the second cast by a helper placed at arena center. Each `23983` cast snapshots the selected player's position for server damage, but its presentation remains canonical WSS2 and the result packet carries no ground coordinate. The center helper is not a proxy at each snapshot.
- Hard center and outer Plumes use one helper at the captured arena center. The final post-Hellfire Plume places its helper at Ifrit's current position and sets `ifrit.plume.full_floor`; `monster_tp.lua` consumes that flag only for `23988`, changing its execution copy to a self-origin `50`-yalm outer radius with an `8`-yalm safe center. Center presentation still resolves to canonical WSS3; outer/final presentation resolves to canonical WSS1.
- Active Eruption/Plume phases gate rotation, Nail start, Hard glow/Sear, center warp and Hellfire. Helpers are cleaned on phase completion, Hellfire staging, or encounter finish.

No Hard helper branch explicitly requests candidate WSS4, WSS10, WSS12-14, or WSS21-22. WSS4 remains an ordinary Extreme Plume-outer donor, not a verified Eruption selector. No combat branch calls the GM bank probe, `PlayBGAnimation`, the Bowl ring schedulers, or a recovered map-object owner. Runtime capture must still establish whether the `2207310` helper/model can visibly render the canonical donor effects and whether those donors reproduce the retail Eruption/Plume layouts.

## Current Nail publication and death sequence at `f868e997...`

The newest source explicitly requests Nail WSS1 and now supplies ordinary player-kill death/fade plumbing, but it does not close the authored BID/aura or Hellfire-consume lifecycle:

1. Each correct `m524` Nail is configured at floating presentation height `5.5`, made combat-inert, assigned a four-second despawn time and scripted one-shot lifecycle, and registered hidden/untargetable.
2. The full actor train is instantiated for ready players.
3. After a `0.1 s` lead, each living Nail receives `DoBattleAction(0, 0x13001000)`.
4. After another `1.5 s`, each living Nail becomes presentation-visible and targetable.

The selected bank contains a decoded 90-frame / `3.0 s` skeletal motion, so the source's `1.5 s` “stable” wait is not independently proven to mark motion completion. The SCB active blocks, visibility flags, VFX persistence, and client packet queue may produce a different visible boundary. Runtime capture is still required.

The exhaustive resource graph adds another distinct missing layer: e002 contains `init_msb4_1`, VEFF `4rcIUdanc_body1`, and the 46-frame effect-curve ACB `m524_body_aura`. WSS1 selection does not by itself prove that this persistent state/aura package is entered.

Player damage continues to enter the ordinary `DeathState`; the newest configuration makes normal Nail cleanup skip already-dead actors so their four-second corpse/fade window can complete and the scripted one-shot lifecycle can permanently remove them without ending the director. Manager `3e102db4...` also changes GM shatter from direct numeric `HP = 0` to `AddHP(-Math.Max(1, (int)nail.HP))`, which calls `Die`. This proves a server death-state path, not that the client selects the recovered `ded` or `dedpose` controller; runtime capture remains required. No explicit BID `activ`, `id0`, `msb4_1`, `ded`, `dedpose`, or `deact` selection was added, Hellfire survivors are still directly removed without a consume tail, and no late-client path replays WSS1 ignition.

## Contradictions and stale claims to correct

The following rows preserve the audit trail from the pre-integration inputs.
The final README, reconciliation notices, exhaustive companions, and canonical
live snapshot already apply these corrections; they are not an outstanding
editing checklist.

| Location in audited inputs | Stale or ambiguous claim | Correct disposition |
|---|---|---|
| `README.md`, executive finding 12 and unresolved list | Arena fire ring may be layout, weather, or unknown eight-character BG animation; zone-layout owner/name unresolved | **Stale after layout decomp.** Ring content is layout-authored and its group/VFX/collision/timeline names are recovered. Only the server owner/key/trigger and runtime initial state remain unresolved. |
| `BATTLEFIELD_ERUPTION_AND_PLUMES.md`, opening result | “not currently driven through a recovered background/map-object scheduler” can read as if no scheduler was recovered | **Needs split wording.** No server call drives it, but the installed layout contains recovered ring schedulers. Eruption/Plume still lack a proven command-to-resource link. |
| `EVIDENCE_AND_REPRODUCTION.md`, installed manifest and limitations | Omits the installed `wil_w0_fld05` layout DAT and can imply no client-authored battlefield surface was found | **Incomplete for battlefield resources.** Preserve the no-zone-aware-server-row finding, but add the layout/fire-ring DATs and timeline evidence. |
| Baseline scheduler-transport discussion | Frames the arena path only through eight-byte opcode `0x00D9` | **Incomplete, though its `0x00D9` limit is correct.** `RunMapObjScheduler`/`0x0130` carries long names and offsets, but still needs the unrecovered live map-object owner. |
| All six baseline reports plus the `16:20` live snapshot | WSS18/WSS19 are wholly uninvoked | **Stale no later than Lua SHA `a80d658d...`; still corrected at `f868e997...`.** Hard explicitly plays both through raw actor-animation calls. Normal/Extreme remain uninvoked. |
| README/current gap/live snapshot Hard sequence | WSS8 is the current post-stop recovery bank | **Stale no later than `a80d658d...`; still corrected at `f868e997...`.** Current source omits command `23008`/WSS8 and instead plays WSS18 immediately after STOPPED, followed by a `3.25 s` return delay before WSS19. |
| All baseline Nail invocation sections and the `16:20` live snapshot | No Nail WSS/action bank is explicitly requested at spawn | **Stale no later than `a80d658d...`.** At `f868e997...`, spawn still orders publication -> `0.1 s` -> WSS1 (`0x13001000`) -> `1.5 s` -> visible/targetable, and configures an ordinary one-shot death/fade path. BID/persistent/consume selectors remain absent. |
| Baseline and `16:20` current-invocation summaries | WSS15/WSS16 remain only uninvoked transition candidates | **Stale no later than `a80d658d...` for WSS15; still corrected at `f868e997...`.** Hard raw-plays WSS15 once at/below 50% when presentation is idle; WSS16 remains uninvoked. |
| `CURRENT_IMPLEMENTATION_GAP_AUDIT.md`, Hard sequence step 3 | Calls private `23984` a three-second cast | **Stale/inexact.** SQL is `3500 ms`; the current state machine's `CanChangeState()` gate, not the provisional `+3 s` stage time, protects ordering. |
| Historical `16:20` implementation snapshot (superseded before final integration) | Treated older staging hashes and `README.final.md` as final, and described the then-current WSS7/WSS8 sequence | **Historical only.** The canonical final live report now pins `f868e997...` plus current BattleNpc/manager/world/validator hashes. |
| `tools/validate_ifrit_family.ps1` at SHA `34bab73c...` | Baseline audit says it asserts WSS7/WSS8 and the old post-stop recovery sequence | **Historical.** It was superseded by `152b1e0b...`, `175e4194...`, `25d0cf2c...`, `3cce1292...`, and current `8050956b...`; this documentation audit did not modify them. |
| Intermediate validator SHA `152b1e0b...` | Covered newer Cyclone/Nail/ground-probe literals but had no WSS15/HARD_GLOW or telemetry-arity assertion | **Historical by `16:58:31`.** Current `8050956b...` retains WSS15/telemetry/replay/probe checks and adds Hard helper, full-floor Plume, Nail one-shot lifecycle, real GM death, teardown, final Cyclone formation, and base-name blank/restore contracts. |
| Current validator SHA `8050956b...` | Parses all 15 Lua files and statically checks the expanded ground-probe set, WSS15/18/19 and WSS8 absence, Hard Eruption/Plume helpers, full-floor Plume geometry, Nail one-shot/death calls, one-body x1 and simultaneous three-body x1 Cyclones, base-name blank/restore packets, and cleanup | **Passes, but remains literal/regex coverage.** It cannot prove client rendering, retail bank ownership, helper/model compatibility, BID death selection, actual model disappearance, or the approximately `0.3 s` Cyclone-margin sufficiency. It also forbids only the exact `CYCLONE_LANDING_COMMAND = 23008` declaration rather than every equivalent spelling. |
| Historical `16:54` implementation draft (not part of the final bundle), telemetry mismatch | Its pins showed Lua passing ten runtime-state arguments while then-current C# accepted nine | **Historical by `16:56:39`.** Current WorldManager and IfritManager accept/pass/persist the tenth argument, current manager replays WSS15 to reconnecting clients, and validator `8050956b...` asserts that bridge. |
| Reports pinned at Lua `a80d658d...`, Eruption/Plume current state | Said combat had no helper spawn and all Eruption/Plume routes were generic source-body casts | **Historical at `bf848b75...`; helper behavior is unchanged at `f868e997...`.** Hard owns scoped `2207310` helper choreography. The recovered candidate WSS banks remain unselected, and Normal/Extreme remain generic. |
| Reports pinned at Lua `a80d658d...` / Manager `a2445af0...`, Nail terminal state | Said normal cleanup directly removed killed Nails and GM shatter only assigned numeric `HP = 0` | **Historical at Lua `bf848b75...` / Manager `3e102db4...`; unchanged at `f868e997...`.** Normal cleanup preserves already-dead Nails for a four-second scripted one-shot fade/removal, and GM shatter uses `AddHP` to enter `Die`. Surviving-Nail Hellfire consume presentation is still absent. |
| Lua `bf848b75...`, Hard post-Hellfire Cyclone formation | Used three sequential waves, each with three simultaneous bodies; the pre-Hellfire low-HP pattern used three sequential one-body waves | **Historical at `f868e997...`.** Current Hard uses exactly one one-body wave before Hellfire/during Nails and exactly one simultaneous three-body triangle wave after Hellfire. |
| BattleNpc presentation before `a7bc3d40...` | Clearing the two nameplate properties and enmity indicators could leave the legacy grey base name visible during a scheduler | **Corrected only when `broadcast=true`.** Current hide sends an empty actor-name packet and current restore sends `CreateNamePacket()`; `false, false` pre-instantiation helper calls do not broadcast either packet, and no form of this API hides the model. |
| Baseline “complete installed `m852`/`m524` inventory” wording | Can be read as every file under both model roots | **Baseline scope was action containers only.** The exhaustive client-resource report now closes all 43 direct-root files and 251 live outer action entries and documents state/death/orientation/aura/cutscene/helper boundaries. |
| Pre-integration exhaustive battlefield report, current-selector rows | Said WSS8 remained current, WSS18/19 were unselected, and Nail WSS1 was uninvoked | **Corrected in the final integrated report.** Its current rows now use `f868e997...`, include WSS15/18/19, final Cyclone formation, Hard helper choreography, and Nail WSS1/death plumbing, and keep WSS8 absent. |
| Historical `16:54` implementation draft, GM probe rows | Limited the probe to 2/3/21/22 and said WSS10/12-14 were omitted | **Historical by Manager `a2445af0...`; unchanged by `3e102db4...`.** The current GM-only probe includes WSS4/10/12/13/14 as well. It remains diagnostic and separate from live combat helpers. |

Claims that remain valid and must **not** be removed while correcting the ring finding:

- No current Ifrit server script calls `PlayBGAnimation` or a verified map-object helper.
- No recovered server zone-aware SQL row binds the Bowl ring to an addressable map-object actor.
- No decoded ring timeline is evidence that Eruption or Plume uses the same resource.
- Eruption's cast-start coordinate is used for damage selection but is absent from battle-result packet payloads.
- WSS `0010`, `0012`-`0014`, and `0021`/`0022` remain candidates rather than safe mechanic renames.
- Correct Nail class/model binding alone does not invoke the authored lifecycle; current source adds WSS1 spawn ignition and generic one-shot death/fade plumbing, while the e002 aura/BID selectors and surviving-Nail Hellfire-consume tail remain separate and uninvoked.

## Coverage closure checklist

| Closure test | Result |
|---|---|
| Every installed `m852` action path enumerated | **Pass: 26/26** |
| Every installed `m524` action path enumerated | **Pass: 2/2** |
| Every installed action-file hash represented in the baseline asset reports | **Pass: 28/28** |
| Dash body, authored flames/fade, recovery separated from movement transport | **Pass** |
| Takeoff and return/landing curves identified | **Pass** |
| New Hard WSS15/WSS18/WSS19 invocation and WSS8 removal reconciled | **Pass at `f868e997...`** |
| Hard one-body x1 pre-Hellfire/Nail and simultaneous three-body x1 post-Hellfire Cyclone formations separated from historical x3 waves | **Pass at `f868e997...`** |
| Broadcast nameplate/enmity/base-name suppression separated from still-visible model and nonbroadcast helper initialization | **Pass at BattleNpc `a7bc3d40...`** |
| Hard Eruption helper choreography separated from canonical WSS2 presentation and WSS4/WSS10 not selected by that mechanic | **Pass at `f868e997...`** |
| Hard Plume helper/full-floor damage ownership separated from canonical WSS3/WSS1 presentation and still-unselected WSS12-14/WSS21-22 candidates | **Pass at `f868e997...` / `c242cc16...`** |
| Arena fire ring distinguished from Eruption/Plume and tied by direct layout pointers | **Pass via exhaustive battlefield report** |
| Nail WSS1 and generic player-death/fade plumbing separated from still-missing BID/aura/Hellfire-consume presentation | **Pass at Lua `f868e997...` / Manager `3e102db4...`** |
| Normal, Hard and Extreme invocation differences recorded | **Pass** |
| Evidence and confidence boundaries explicit | **Pass** |
| Complete non-action model-root manifest and all live outer resource rows | **Pass via exhaustive client-resource report: 43 files / 251 entries** |
| Exact retail selector/timeline graph and runtime render proof | **Open evidence boundary; must not be invented** |

## Completion standard

For a documentation-only task, unresolved retail selectors are not a reason to fabricate a mapping. The research bundle is complete only when it does all of the following:

1. inventories every installed action bank and clearly scopes any support-file/resource-table manifest;
2. records each requested symptom's strongest asset evidence and its current invocation state;
3. incorporates the Bowl layout fire-ring recovery;
4. pins the latest live implementation snapshot or labels older snapshots historical;
5. preserves candidate/confidence boundaries where the SCB/retail/runtime join is not recoverable;
6. contains only Markdown changes.

At this audit point, all six documentation criteria are satisfied by the combined reports and this matrix. Item 3 is closed by the exhaustive battlefield-resource report, which supersedes the stale ring wording without inventing a server owner. The broader installed file/resource-table claim is closed by the exhaustive client-resource report. Exact SCB branch semantics and runtime/retail selectors remain explicitly open evidence boundaries rather than undocumented omissions.
