# Ifrit client animation banks (`m852`)

Snapshot date: **2026-08-02**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Installed resource: **`mon/m852`, variant `e001`, skeleton `skl_m852b001`**

This is a documentation-only inventory of the installed client. No repository source, SQL, client DAT, executable, or other binary was modified. Byte counts and SHA-256 values identify this exact installed client snapshot.

## Current invocation reconciliation

The asset inventory below remains valid. Current server invocation is pinned separately in [LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md): at Lua SHA `f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320`, Hard explicitly selects WSS `0007` for the rush, WSS `0018`/`0019` for takeoff/return, and one-time WSS `0015` at or below 50% HPP for `st0 -> st4` glow/form transition. WSS `0008` remains absent. Pre-Hellfire/Nail-phase Cyclone is one body with one crossing; post-Hellfire is one simultaneous three-body triangle crossing. Hard also stages Eruption/Plume through `2207310` helpers, but those private commands still resolve to canonical donor WSS2/WSS3/WSS1; they do not explicitly select candidate WSS4/WSS10/WSS12-14/WSS21-22. Normal and Extreme retain generic presentation routes.

For the complete support-file manifest and every live outer SCB/MCB/MTB/CIBT/CIBC/nested action-resource row, see [EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md). This document's “complete” wording refers to the 26 installed `m852` action containers; the companion report closes the broader model-root and outer-resource surface.

## Evidence boundary

The client contains 26 `m852` action-bank files across five lanes: one FID, one BID, one BTL, four byte-identical MGC banks, and 19 WSS banks. An installed bank proves that this client can load authored content for the compatible resource and lane. It does **not** by itself prove the retail encounter's command, trigger, target, attachment node, helper actor, timing, or one-to-one mechanic name.

In particular, the semantic labels below are candidates derived from motion curves, effect content, related tokens, and current command rows. They are **not proven retail WSS mappings**. Numeric suffixes in command IDs, WSS bank names, motion leaves, and VFX `skillNN` directories occupy different namespaces.

### Lane vocabulary

| Lane | Role visible in the payload |
|---|---|
| `cmn/fid` | Common/facial or idle binding. |
| `emp_emp/bid` | Base battle idle, locomotion, hit, activation, deactivation, death, and state motions. |
| `emp_emp/btl` | Basic battle attacks. |
| `emp_emp/mgc` | Magic/cast scheduler banks. In this install, `0001`-`0004` are byte-identical aliases. |
| `emp_emp/wss` | Weapon-skill/action scheduler banks selected by packed animation category `0x13`. These may combine skeletal motion, VFX, sound, state changes, fades, and helper content. |

In the tables, **active schedule** is reported as `active-block seconds / active entries; timing-word seconds`. Those values are parser inferences from SCB integer fields, not a decoded retail timeline; see [Parser and SCB limits](#parser-and-scb-limits).

## Complete FID, BID, BTL, and MGC inventory

| Lane / bank | Relative client path | Bytes | SHA-256 | Motion leaves | Effect tokens | Active schedule |
|---|---|---:|---|---|---|---|
| FID `1110` | `mon/m852/act/cmn/fid/base/1110` | 86,672 | `15f1002a8c9d73dbf0bd522f27aefe9d07eb1861fd806d1957eae18053592bec` | `fxpf_idle` | none | `0.02 s / 4; 1.20, 0.01 s` |
| BID `0000` | `mon/m852/act/emp_emp/bid/base/0000` | 1,649,424 | `d628997bfead8781208960fb5c7bde0f73a57a51acc1a66e9d497c7f2deb7e50` | `cbba_add_dmg_f`; `cbba_add_dmgh_b`; `cbba_add_dmgh_f`; `cbba_add_dmgh_l`; `cbba_add_dmgh_r`; `cbbm_01f_bl`; `cbbm_01f_br`; `cbbm_01f_f_ls`; `cbbm_01f_f_rs`; `cbbm_01f_l`; `cbbm_01f_lp0`; `cbbm_01f_r`; `cbbm_01f_stp_ls`; `cbbm_02f_bl`; `cbbm_02f_br`; `cbbm_02f_f_ls`; `cbbm_02f_f_rs`; `cbbm_02f_l`; `cbbm_02f_lp0`; `cbbm_02f_r`; `cbbm_02f_stp_ls`; `cbbm_02f_stp_rs`; `cbbm_03f_lp0`; `cbbm_03f_stp_ls`; `cbbm_03f_stp_rs`; `cbbm_abl_2lp`; `cbbm_abl_3`; `cbbm_activ`; `cbbm_deact`; `cbbm_ded`; `cbbm_dedpose`; `cbbm_hitrn_bl`; `cbbm_hitrn_br`; `cbbm_hitrn_l`; `cbbm_hitrn_r`; `cbbm_id0`; `cbbm_pb06_dmg`; `cbbm_pb07_dmg`; `cbbm_sp_a_2lp`; `cbbm_sp_b_2lp`; `cbbm_trn_bl`; `cbbm_trn_br`; `cbbm_trn_l`; `cbbm_trn_r`; `cbbm_wekid_2lp`; `cbnm_01f_lp0`; `cbnm_01f_stp_ls`; `cbnm_02f_lp0`; `cbnm_02f_stp_ls`; `cbnm_02f_stp_rs`; `cbnm_03f_lp0`; `cbnm_03f_stp_ls`; `cbnm_03f_stp_rs`; `cbnm_hitrn_bl`; `cbnm_hitrn_br`; `cbnm_hitrn_l`; `cbnm_hitrn_r`; `cbnm_id0`; `cbnm_trn_bl`; `cbnm_trn_br`; `cbnm_trn_l`; `cbnm_trn_r`; `cbnm_wekid_2lp`; `cbxs_st0`; `cbxs_st4` | `skill04`; `skill05` | `0.02 s / 2; no timing words recovered` |
| BTL `0001` | `mon/m852/act/emp_emp/btl/base/0001` | 221,536 | `28d9b295136212eb08f22622f79a615d131df8e815bd774e4341d0054d4a5e5e` | `cbbm_big_atk_f1`; `cbbm_big_atk_l`; `cbbm_big_atk_r`; `cbbm_id0`; `cbbr_big_atk_l`; `cbbr_big_atk_r` | none | `12.34 s / 4; no timing words recovered` |
| MGC `0001` | `mon/m852/act/emp_emp/mgc/base/0001` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` | `cbbm_abl_2lp`; `cbbm_abl_3`; `cbbr_abl_3` | none | `1.00 s / 6; 0.30, 0.30, 0.38 s` |
| MGC `0002` | `mon/m852/act/emp_emp/mgc/base/0002` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` | `cbbm_abl_2lp`; `cbbm_abl_3`; `cbbr_abl_3` | none | `1.00 s / 6; 0.30, 0.30, 0.38 s` |
| MGC `0003` | `mon/m852/act/emp_emp/mgc/base/0003` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` | `cbbm_abl_2lp`; `cbbm_abl_3`; `cbbr_abl_3` | none | `1.00 s / 6; 0.30, 0.30, 0.38 s` |
| MGC `0004` | `mon/m852/act/emp_emp/mgc/base/0004` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` | `cbbm_abl_2lp`; `cbbm_abl_3`; `cbbr_abl_3` | none | `1.00 s / 6; 0.30, 0.30, 0.38 s` |

The unusually large `12.34 s` BTL value is retained exactly as the parser inferred it; it must not be treated as a proven attack duration without decoding that SCB.

## Complete WSS inventory

| WSS | Bytes | SHA-256 | Payload | Motion leaves | Effect tokens | Active schedule |
|---:|---:|---|---|---|---|---|
| `0001` | 423,680 | `10b6aac9583319ddde403800df8b0939ab535440cb5c9178c53a72452576c32b` | motion + effect + sound | `cbbm_sp_01` | `m852_0001`; `m852_0001_cas`; `m852_0001_ksk1`; `m852_0001_ksk2`; `m852_0001_ksk3`; `m852_0001_tar`; `skill01` | `0.80 s / 12; 0.60, 0.60, 0.16, 0.16, 0.36, 0.20, 0.16, 0.36, 0.20, 0.16, 0.36, 0.20, 0.20, 0.80, 0.60, 0.21, 0.78 s` |
| `0002` | 515,904 | `5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e` | motion + effect + sound | `cbbm_sp_02`; `cbbz` | `m852_0002`; `m852_0002_cas`; `m852_0002_tar`; `skill02` | `0.45 s / 4; 0.45, 0.45 s` |
| `0003` | 768,448 | `9b99c9ac481c0036fb6e66fec69b479599c99c4b9e3df401d97bb2127268e7b9` | motion + effect + sound | `cbbbb`; `cbbm_sp_a01`; `cbbm_sp_a_2lp`; `cbbz` | `m852_0003`; `m852_0003_cas`; `m852_0003_tar`; `skill03` | `0.80 s / 9; 0.80, 0.80, 0.13, 0.13, 0.73, 0.60, 0.16, 0.77 s` |
| `0004` | 862,880 | `581822c4e5419d02d3ba3c6e2804a58879484528351c2f6247fcc80af99416c9` | motion + effect + sound | `cbbm_sp_a02`; `cbbm_sp_a_2lp` | `m852_0004`; `m852_0004_cas`; `m852_0004_fire`; `m852_0004_tar`; `skill04` | `0.82 s / 10; 0.80, 0.80, 0.24, 0.24, 0.76, 0.52, 0.26, 0.82, 0.56, 0.30, 0.79 s` |
| `0005` | 236,096 | `2c01f01d23b873e56b870e5ff10704d70f6f12bca187a45e8a6e4d65f5d56f0f` | motion + effect + sound | `cbbm_sp_b01`; `cbbm_sp_b_2lp` | `m852_0005_cas`; `skill05` | `0.70 s / 7; 0.70, 0.70, 0.29, 0.29, 0.63, 0.34 s` |
| `0007` | 738,000 | `45f0c0abde7221e053a1b693ed6ca643676ca8871f3bfe40b0dfc2d044b6eaa7` | motion + effect + sound | `cbbm_sp_b02`; `cbbm_sp_b_2lp`; `cbbz` | `m852_0007`; `m852_0007_cas`; `m852_0007_fire`; `m852_0007_tar`; `skill07` | `0.60 s / 23; 0.10, 0.58 s` |
| `0008` | 134,308 | `b2ba7c44797e50ee6085f9d4ed0b647ce67d56445f2eccc537602db789878217` | motion + effect + sound | `cbbm_sp_b04` | `m852_0008_cas`; `skill08` | `0.41 s / 8; 0.41, 0.41, 0.32, 0.32 s` |
| `0010` | 312,128 | `9de9b7d1cfe0329e5f863ad348c553ce12ef32bfe7ad00af9d578b5932e2cf0d` | motion + effect + sound | `cbbm_abl_2lp`; `cbbm_abl_3` | `m852_0010_cas`; `skill10` | `0.70 s / 7; 0.70, 0.70, 0.22, 0.22, 0.68, 0.46 s` |
| `0012` | 1,015,088 | `e3072750c0d82ed77932c93ad620e65f66b931a7f584a9d5e2b74da83d8713d2` | motion + effect + sound | `cbbm_sp_b03`; `cbbm_sp_b_2lp` | `m852_0012`; `m852_0012_bom`; `m852_0012_cas`; `m852_0012_tar`; `skill12` | `0.60 s / 23; 0.10, 0.58 s` |
| `0013` | 1,040,224 | `6361322e500c5292ae93c05468fa3eb6d01ffa3744cb6f7be10b2b45c9079629` | motion + effect + sound | `cbbm_sp_b03`; `cbbm_sp_b_2lp` | `m852_0013`; `m852_0013_bom`; `m852_0013_cas`; `m852_0013_tar`; `skill13` | `0.60 s / 23; 0.10, 0.58 s` |
| `0014` | 1,204,256 | `46f750379dafa78f65360de3f9aca5034c94ea968d39d422bd4ed1539dfca3e4` | motion + effect + sound | `cbbm_sp_b03`; `cbbm_sp_b_2lp` | `m852_0014`; `m852_0014_bom`; `m852_0014_cas`; `m852_0014_tar`; `skill14` | `0.46 s / 4; 0.46, 0.46 s` |
| `0015` | 97,200 | `1132c275c97bf3af4a8ef0e25b2d166dade14ebb768850c22b9f91a6cea97a98` | motion + effect + sound | `cbbm_sp_03`; `cbxs_st0to4` | `m852_0015_cas`; `skill15` | `0.53 s / 9; 0.40, 0.40, 0.10, 0.10, 0.53, 0.43, 0.10, 0.40, 0.30, 0.41 s` |
| `0016` | 28,848 | `4fbf6d5b77a776f395c27fe5a69e52031c813bcdd5f5434d7fcb5949db73d414` | motion/state | `cbbm_sp_04`; `cbxs_st4to0` | `skill16` | `0.32 s / 7; 0.30, 0.30, 0.30, 0.30, 0.30 s` |
| `0017` | 304,544 | `fc11450d9c3459fb70af1e6a2b623786a3aa5ea07c9002002a3273cebe5ab8b3` | motion + effect + sound | `cbbm_sp_07` | `m852_0017_cas`; `skill17` | `0.90 s / 7; 0.90, 0.90, 0.04, 0.04, 0.83, 0.79 s` |
| `0018` | 112,788 | `05ac1317b3ae797466e9e323927ec51799ebfde1dbd0ec048c04af9575a4d469` | motion + effect + sound | `cbbm_sp_05` | `m852_0018_cas`; `skill18` | `0.41 s / 9; 0.05, 0.05, 0.41, 0.41, 0.02, 0.05 s` |
| `0019` | 131,524 | `8aa13bcd9a161966f6aee5a1b6914e86ebae9dcc43378d120cb7443bb231f4e8` | motion + effect + sound | `cbbm_sp_06` | `m852_0019_cas`; `skill19` | `0.50 s / 9; 0.30, 0.30, 0.03, 0.03, 0.44, 0.41, 0.30 s` |
| `0020` | 321,968 | `e1b6d517268dc75c595946d0d46499f65a73ffba0f703b21a8c41b723bcc7f66` | motion + effect + sound | `cbbm_sp_03` | `skill20` | `0.60 s / 23; 0.10, 0.58 s` |
| `0021` | 788,480 | `d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34` | effect + sound | none; effect-only outer bank | `m999_0002`; `m999_0002_cas`; `m999_0002_tar`; `skill02` | `0.60 s / 23; 0.10, 0.58 s` |
| `0022` | 740,448 | `035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3` | effect + sound | none; effect-only outer bank | `m999_0003`; `m999_0003_cas`; `m999_0003_tar`; `skill03` | `0.60 s / 23; 0.10, 0.58 s` |

No `m852` WSS files numbered `0006`, `0009`, or `0011` are installed. That gap is real at the `m852` path level, but related Ifrit effect content also appears in generic `m999` banks; see [m999 spillover](#m999-spillover).

## Decoded 30 fps skeletal durations

These are decoded outer skeletal motion frame counts, converted with `frames / 30`. They are not the same as the SCB active block, server action lock, cast time, telegraph duration, travel time, or total retail mechanic duration.

| WSS | Primary decoded motion | Frames | Approx. seconds at 30 fps |
|---:|---|---:|---:|
| `0001` | `cbbm_sp_01` | 60 | 2.000 |
| `0002` | `cbbm_sp_02` | 30 | 1.000 |
| `0003` | `cbbm_sp_a01` | 80 | 2.667 |
| `0004` | `cbbm_sp_a02` | 80 | 2.667 |
| `0005` | `cbbm_sp_b01` | 70 | 2.333 |
| `0007` | `cbbm_sp_b02` | 5 | 0.167 |
| `0008` | `cbbm_sp_b04` | 32 | 1.067 |
| `0010` | `cbbm_abl_3` | 70 | 2.333 |
| `0012` | `cbbm_sp_b03` | 130 | 4.333 |
| `0013` | `cbbm_sp_b03` | 130 | 4.333 |
| `0014` | `cbbm_sp_b03` | 130 | 4.333 |
| `0015` | `cbbm_sp_03` / `cbxs_st0to4` | 40 | 1.333 |
| `0016` | `cbbm_sp_04` / `cbxs_st4to0` | 30 | 1.000 |
| `0017` | `cbbm_sp_07` | 90 | 3.000 |
| `0018` | `cbbm_sp_05` | 5 | 0.167 |
| `0019` | `cbbm_sp_06` | 30 | 1.000 |
| `0020` | `cbbm_sp_03` | 40 | 1.333 |
| `0021` | no outer `m852` skeletal motion | — | — |
| `0022` | no outer `m852` skeletal motion | — | — |

## Dash and jump curve measurements

The strongest motion evidence is not based on filenames alone. The following values come from decoded translation curves at 30 fps.

| WSS / motion | Frames | Decoded local channel | Start | End | Delta | Interpretation |
|---|---:|---|---:|---:|---:|---|
| `0007` / `cbbm_sp_b02` | 5 | `hara` X | `-1.0129` | `0.6577` | `+1.6706` | Very short body displacement. |
| `0007` / `cbbm_sp_b02` | 5 | `hara` Y | `3.295` | `3.969` | `+0.674` | Minor orthogonal/height change. |
| `0007` / `cbbm_sp_b02` | 5 | `hara` Z | `0.8187` | `9.7349` | `+8.916` | Dominant forward-like displacement; strongest dash-body evidence. |
| `0008` / `cbbm_sp_b04` | 32 | `hara` Z | `-10.2650` | `-0.2758` | `+9.989` | Complementary recovery/return curve. |
| `0018` / `cbbm_sp_05` | 5 | `hara` Y | `3.910` | `15.334` | `+11.424` | Sharp takeoff/upward transition. |
| `0019` / `cbbm_sp_06` | 30 | `hara` Y | `14.824` | `3.910` | `-10.913` | Return/landing curve; sampled minimum `2.752`. |

Displayed endpoints are rounded; deltas preserve the underlying decoded-sample calculation, so a subtraction of the displayed values can differ in the last millesimal.

### Local-pelvis caveat

`hara` is a local pelvis/hip translation channel. These numbers are **not world-space actor coordinates** and are not proof that the client alone moves Ifrit by the listed yalms. World movement also depends on actor root transforms, orientation, scale, the animation engine's root-motion handling, and server movement packets. The curves establish the character of the motion—short dash body, recovery, takeoff, and landing—not the exact server endpoint. A movement packet can carry Ifrit across the arena, but it does not carry the flames, fades, or impact layers embedded in an action scheduler.

## Candidate semantics and confidence

| Bank(s) | Candidate role | Confidence | Basis and boundary |
|---|---|---|---|
| `0001`-`0004` | Named-command action pool | Confirmed as selected; low for any one-to-one name | Current SQL selects these banks for Sear, Incinerate, Eruption, and Radiant Plume, but reuses the same bank for different names. The rows prove selection, not exclusive retail semantics. |
| `0004` | Secondary Eruption / moving ground-fire candidate | Medium | Explicit `m852_0004_fire` plus a large fire-bearing scheduler. It remains one of the command-selected banks and may serve another attack or variant. |
| `0005` | Unclassified body action | Candidate only | Complete 70-frame `sp_b01` action with caster VFX, but no decisive retail selector or content signature was recovered. |
| `0007` | Crimson Cyclone dash body with fire/fade layers | High | Five-frame dominant displacement, `m852_0007_fire`, caster/target effects, and motion-emitted VFX. This is the strongest missing-dash bank. |
| `0008` | Dash recovery/return | High | Complementary 32-frame displacement and recovery-shaped curve. Pairing with `0007` is strongly supported; exact retail ordering remains unparsed. |
| `0010` | Eruption / ground burst | Medium-high | Strongest inspected rock + fire + glow + distortion content combination. No recovered command row proves that retail Eruption selected `0010`. |
| `0012`-`0014` | Radiant Plume pattern family; possible overlap with Hellfire variants | Medium | Three very large, fire-heavy layouts sharing the same 130-frame `sp_b03` body. Layout/phase/difficulty split is unresolved. |
| `0015` / `0016` | Form or phase transition pair | High for transition content; current WSS15 server selection confirmed; retail role open | Explicit `st0 -> st4` and `st4 -> st0` motions. Current AuroraFlare Hard explicitly uses WSS15 once at or below 50% HPP and intentionally does not send WSS16 during battle. The exact retail phase/event and runtime persistent-form result remain unproven. |
| `0017` | Unclassified long special | Candidate only | 90-frame `sp_07` plus caster VFX; no decisive retail mapping recovered. |
| `0018` | Jump/takeoff | High | Five-frame local-pelvis rise of `+11.424` and a dedicated caster effect. |
| `0019` | Jump return/landing | High | Thirty-frame return from the elevated local pose to `3.910`, with an undershoot to `2.752`. |
| `0020` | Phase/form or node-group-mask action | Medium | `sp_03` content and scheduler structure point to stateful presentation, but the event is unresolved. |
| `0021` / `0022` | Effect-only Kuroko helper / ground layouts | Medium | No outer Ifrit skeletal motion; references generic `m999` caster/target effects. Plausible battlefield anchors, not proven Plume or Eruption selectors. |

The practical recovery set for the reported omissions is therefore `0007` + `0008` for dash body/recovery, `0018` + `0019` for takeoff/landing, `0010` and possibly `0004` for Eruption-like ground content, and `0012`-`0014` plus `0021`-`0022` for Plume/helper investigation. This is a test queue, not a retail rename list.

## `m999` spillover

Generic Kuroko/helper resource `m999` retains Ifrit-referencing content for WSS numbers absent from `m852`. These are separate installed bank files and should not be mistaken for outer `m852` body actions.

| Resource / WSS | Bytes | SHA-256 | Payload | Motion | Effect tokens / Ifrit reference | Active schedule |
|---|---:|---|---|---|---|---|
| `m999` / `0001` | 275,472 | `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94` | effect | `cbbz` marker only | `m852_0009_cas`; `skill01`; `skill09`; VFX path identifies `vfx/mon/ifrit_852/skill09/ift_sklc9y.veff` | `0.60 s / 23; 0.10, 0.58 s` |
| `m999` / `0006` | 490,912 | `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | effect + sound | `cbbz` marker only | `m852_0002_cas`; `m999_0006`; `m999_0006_tar`; `skill06`; VFX paths `ift_sklc2y` / `ift_sklt2y` reference Ifrit skill-02 content | `0.65 s / 8; 0.10, 0.10, 0.65, 0.55, 0.17, 0.62 s` |

This spillover explains why a scan restricted to `mon/m852/act/...` cannot be treated as the complete visual dependency graph. It still does not reveal the retail helper owner or trigger.

## Infernal Nail (`m524`) cross-reference

Infernal Nails are not an `m852` variant. Actor appearances `2207306`, `2207307`, `2207313`, and `2207315` use appearance base `10524`, resolving to `mon/m524/e001`. Their two installed banks are:

| Lane / bank | Bytes | SHA-256 | Motion leaves | Effect tokens | Active schedule |
|---|---:|---|---|---|---|
| `m524` BID `0000` | 16,960 | `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17` | `cbbm_01f_lp0`; `cbbm_01f_stp_ls`; `cbbm_02f_lp0`; `cbbm_02f_stp_ls`; `cbbm_02f_stp_rs`; `cbbm_03f_lp0`; `cbbm_03f_stp_ls`; `cbbm_03f_stp_rs`; `cbbm_abl_2lp`; `cbbm_activ`; `cbbm_deact`; `cbbm_ded`; `cbbm_dedpose`; `cbbm_hitrn_bl`; `cbbm_hitrn_br`; `cbbm_hitrn_l`; `cbbm_hitrn_r`; `cbbm_id0`; `cbbm_msb4_1`; `cbbm_trn_bl`; `cbbm_trn_br`; `cbbm_trn_l`; `cbbm_trn_r`; `cbnm_01f_lp0`; `cbnm_01f_stp_ls`; `cbnm_02f_lp0`; `cbnm_02f_stp_ls`; `cbnm_02f_stp_rs`; `cbnm_03f_lp0`; `cbnm_03f_stp_ls`; `cbnm_03f_stp_rs`; `cbnm_dedpose`; `cbnm_hitrn_bl`; `cbnm_hitrn_br`; `cbnm_hitrn_l`; `cbnm_hitrn_r`; `cbnm_id0`; `cbnm_trn_bl`; `cbnm_trn_br`; `cbnm_trn_l`; `cbnm_trn_r` | none | no reliable active block recovered |
| `m524` WSS `0001` | 239,336 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` | `cbbm_sp_01`; `cbxs_st0`; `cbxs_st0to1`; `cbxs_st1` | `m524_0001_cas`; `skill01` | `0.60 s / 23; 0.10, 0.58 s` |

This is strong evidence for a Nail lifecycle—idle/activation/deactivation/death/death-pose in BID plus a special `st0 -> st1` WSS action. It does not prove the exact retail ordering or whether a Nail destroyed by a player and a Nail consumed by Hellfire share the same terminal sequence.

## Animation transport channels

The current server exposes several distinct presentation transports. They are not interchangeable:

| Channel | Opcode / encoding | What it can select | Important limitation |
|---|---|---|---|
| Raw actor animation (`Character.PlayAnimation` -> `PlayAnimationOnActorPacket`) | `0x00DA`; a 32-bit animation ID serialized in an 8-byte payload | A packed/raw actor animation on the source actor | Does not carry battle results, target geometry, or a free-standing world VFX anchor. |
| Zero-result battle action (`CommandResultX00Packet`) | `0x013C` | A packed battle scheduler with command ID and zero results | Visual/action selection only; no result target. |
| One-result battle action (`CommandResultX01Packet`) | `0x0139` | Packed battle scheduler plus command ID, target, amount/text/effect fields | Carries an actor target, not an arbitrary ground position. |
| Spawn/static motion pack (`SetActorSubStatePacket`) | `0x0144`; `motionPack` in substate slot `0x06` | Persistent actor substate/motion-pack presentation, including initial spawn state | Not a replacement for an authored WSS scheduler. |
| Main actor state (`SetActorStatePacket`) | `0x0134` | Passive/active/dead-like actor state changes | State selection alone does not prove the special VFX sequence fired. |
| Movement (`MoveActorToPositionPacket`) | `0x00CF`; X/Y/Z, rotation, move state | World translation and stop/run state | Contains no VFX ID, bone attachment, flame trail, fade, takeoff, or landing scheduler. |
| Appearance (`SetActorAppearancePacket`) | `0x00D6` | Model and appearance-slot swaps | Can change static equipped/model presentation; not a timed action scheduler. |
| Map/background animation (`PlayBGAnimation`) | `0x00D9`; at most eight ASCII bytes | Named animation on a BG/map object, per receiving player | Requires the correct map-object actor and authored eight-character name; it cannot directly select an Ifrit WSS bank. |
| Long map-object scheduler (`Npc.RunMapObjScheduler` -> `RunEventFunctionPacket`) | `0x0130`; `_runBgSchedulerFromMidstream`, 1-64 printable ASCII characters plus offset `0..3600 s` | A long named scheduler on a live map-object owner | Still requires a same-area server `Npc` with `IsMapObj()`, player instantiation, and a recovered owner/layout binding; it cannot select an actor WSS bank. |
| Status presentation | status packets `0x0177` / `0x0179`, or status fields inside command results | Status icon/state and any client-authored associated presentation | Not a generic arbitrary VFX-to-bone API. |

No generic server API was found that says “attach this arbitrary VFX resource to this bone.” For dash flames and jump/landing effects, selecting the authored action scheduler—or reproducing its helper path—is materially different from only moving the actor. The long map-object transport corrects the earlier eight-character *global* transport assumption, but it does not solve actor ownership; see [EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md).

### Packed battle-animation selector

The server and GM animation helper agree on this layout:

```text
packed = (animationType << 24) | (modelAnimation << 12) | effectAnimation
```

For monster WSS content, `animationType = 0x13`; the middle 12-bit field is the decimal WSS bank selector and the low 12-bit field is a separate effect selector. For example, a zero-low-field probe for WSS `0007` would pack as `0x13007000`, and `0018` as `0x13012000`. Those are mechanically derived probe values, **not proof that retail used those exact packed values or a zero effect selector**.

## Command-to-bank mismatch

Locally Ifrit-tagged battle-command rows select only WSS `0001`-`0004`. Every row uses category `0x13`, low effect field `0`, and an animation-duration column of `3`, yet the same bank is assigned to different command names:

| Selected WSS | Current command rows |
|---:|---|
| `0001` | `23361 sear`; `23363 incinerate`; `23367 radiant_plume`; `23374 eruption`; `23404 radiant_plume`; `23577 sear`; `23579 incinerate`; `23582 eruption`; `23592 eruption` |
| `0002` | `23364 eruption`; `23375 eruption`; `23583 radiant_plume`; `23593 radiant_plume` |
| `0003` | `23376 radiant_plume`; `23594 eruption` |
| `0004` | `23595 radiant_plume` |

Consequences:

- A command name is not an authoritative name for the selected bank: WSS `0001` is shared by Sear, Incinerate, Eruption, and Radiant Plume rows.
- WSS `0002` and `0003` also cross the Eruption/Plume name boundary.
- None of the locally tagged rows selects installed WSS `0005`, `0007`, `0008`, `0010`, or `0012`-`0022`.
- “Not selected here” means absent from this local SQL subset. It does **not** prove retail never selected the bank through director logic, private commands, helper actors, state changes, or another table.
- The mismatch is why WSS `0007`/`0008`, `0018`/`0019`, and the ground-effect candidates must not be renamed as retail mechanics until an SCB selector, retail script, or packet capture closes the join.

### Live-tree selector note

The historical Lua SHA `1d55423f...` directly emitted donor commands
`23007`/`23008` for Hard WSS7/WSS8. Current SHA `f868e997...` instead sends
movement then WSS7, uses raw WSS18/WSS19 for takeoff/landing, omits WSS8, and
uses raw WSS15 for the Hard `st0 -> st4` glow transition. It also casts Hard
Eruption/Plume mechanics through class-`2207310` helpers, but those private
commands resolve through canonical WSS2/WSS3/WSS1 donors rather than explicitly
selecting WSS4/WSS10/WSS12-14/WSS21-22. The SQL statement above concerns that
canonical Ifrit-tagged/private-command mapping surface; it does not cover the
manual dash/jump/glow director selections. Normal and Extreme still use their
ordinary presentation routes. See
[LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md).

## Parser and SCB limits

The exact inventory above combines file enumeration/hashing, printable resource/path extraction, SEDB tag recognition, scheduler integer-field heuristics, and a skeletal curve decoder. The following remain outside the current parser contract:

- `SEDBSCB` is not fully deserialized. The parser can locate SCB chunks and recognize clip-class names, but cannot yet reconstruct the complete ordered graph, branches, conditions, nested sub-schedulers, clip start/end offsets, or cancellation behavior.
- `scheduler_active_block_inferred_seconds` and timing words assume observed units of one million per second. They are useful signatures, not authoritative action durations. Repeated values can be sync fields or nested clip extents; the common `9,000,000` outer envelope is not reported as a nine-second action.
- Effect tokens and source-path hints prove referenced VFX assets. They do not establish whether an effect binds to caster, target, a specific bone, the battlefield, or a spawned helper; nor do they decode offset, rotation, scale, color, lifetime, or cleanup.
- Skeletal frame counts and local `hara` curves do not expose world-space root motion. The server may still need a movement packet and correct orientation while the scheduler supplies body motion and VFX.
- The parser does not recover the retail command/director selector that invokes the bank, the low 12-bit effect selector, late-join replay, difficulty/phase branching, or damage-application ordering.
- Effect-only WSS `0021` and `0022` legitimately have no outer `m852` skeletal clip. That is not evidence that they are empty.
- Static string matches such as `skill10`, `_fire`, `_bom`, `_cas`, and `_tar` are content clues, not mechanic names.
- Hashes, byte sizes, and extracted tokens are exact only for installed client `2012.09.19.0001`; another client build must be inventoried independently.

Until those gaps are closed, runtime probes should preserve the distinction between **confirmed bank content**, **high-confidence motion pairing**, and **candidate retail semantics**.
