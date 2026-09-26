# Infernal Nail client curve and terminal-state appendix

Snapshot: **2026-08-02**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Policy: **read/decompile and Markdown only**. No game, server, client, data, capture, or source file was changed.

This appendix preserves the exact lower-level Nail findings that support [INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md](INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md).

## Rig and attachment surface

`skl_m524b001` has exactly 12 bones:

`n_root`, `n_hara`, `n_all`, `n_toge_a`, `n_toge_b`, `n_toge_c`, `n_toge_d`, `n_toge_e`, `n_toge_f`, `n_toge_g`, `n_toge_h`, and `n_toge_top`.

The primary recovered VFX attachment is `005_n_hara`.

## WSS1 proves rise and spike growth

Outer motion `cbbm_sp_01`:

- 12 bones;
- 90 frames at 30 fps, exactly 3.000 seconds;
- MTB 1,879 bytes, SHA-256 `dd9ce2e2a0f918a3839101d40a9cb21fe9f7a12d84563727c2dcb3df138d9fd3`;
- MCB 592 bytes, SHA-256 `f0bc6fc4ee499b0d876729c4561032b9510d38bf4e47832ecb6a586025ccc0ac`.

Decoded curves directly show:

- local `n_hara` Y rises from approximately `-6.0` to `0`, with a small `+0.082535` overshoot;
- most spike X scales grow from approximately `0.302756` to `1.0`;
- most spike Y/Z scales grow from `0.5` to `1.0`;
- `n_toge_b` X begins near `0.368247`;
- `n_toge_top` X/Y/Z grows from `0.5` to `1.0`.

This is direct motion evidence that WSS1 raises the Nail from below the arena while growing its spikes. The label “spawn/growth candidate” can now be strengthened to a high-confidence rise/grow presentation. Packet ownership and retail timing remain separate questions.

The WSS1 scheduler explicitly combines:

- `cbbm_sp_01`;
- model `m524e001`;
- `cbxs_st0`, `cbxs_st0to1`, and `cbxs_st1`;
- `m524_0001_cas`;
- one `RaptureSoundClip`;
- actor binding, motion, status lock, server/client movement stops, action, and substatus-kick clip classes.

## Reversible model-state graph

The same state motions are embedded in both e001 `top_tex1` and `top_tex2`:

| State | Frames / duration | MTB SHA-256 | Interpretation |
|---|---:|---|---|
| `cbxs_st0` | 99 / 3.300 s | `a22b0b315baaa602b52e7f144984e58e259c4a84feccbf36f3dcac6e90079141` | Dormant/initial state |
| `cbxs_st0to1` | 29 / 0.967 s | `2553840dd49ad9a9b70c7203db7eca494eb348ee871dd358bae66161fd714dbd` | Dormant-to-active transition |
| `cbxs_st1` | 99 / 3.300 s | `d7459f3e933ac94c96a29cbdb8fb9d069053bb409ae12808173105fd7669a12b` | Active state |
| `cbxs_st1to0` | 9 / 0.300 s | `f9caaa6da5d357b74b267f9ac60bd176faaca796da00b0c388f0f4ea9440b5ae` | Active-to-dormant return |

This is a complete dormant -> active -> dormant model-state graph. The current entrance uses the forward transition through WSS1. The current Hellfire survivor cleanup does not explicitly use the reverse transition.

## BID activation, deactivation, and destruction curves

| Motion | Frames / duration | MCB SHA-256 | MTB SHA-256 | Decoded behavior |
|---|---:|---|---|---|
| `cbbm_activ` | 30 / 1.000 s | `c4bc7082325906d75476c1711241464cfd2a4f6db5b89adb1a94255d85fb4653` | `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` | Authored activation controller |
| `cbbm_deact` | 30 / 1.000 s | `1c28739c81f1daf1abdd6874f0d12999811b04240ccdb007a987c2042da6f1bb` | `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` | Authored deactivation controller |
| `cbbm_ded` | 30 / 1.000 s | `9b902c586cc839003aab82d8ba9578da5f32d7dc4930675c73bfb303f7da9b47` | `272d1133134b89b4f09e69871316cbf42a1d9053de063dc39acdc05ceb27f1bc` | Sink/collapse motion |
| `cbbm_dedpose` | 1 / 0.033 s | `b155896a2619d8e78904588bd34fe64aa8c18460db8bed4fd89f46e424fafff0` | `5ce8419ca34ada7417596724b9ff6be2d51a652964d2e8ba97a6661b96045b30` | Static terminal pose |
| `cbbm_msb4_1` | 1 / 0.033 s | `a2054bc2b9ca39698eb216a7dedad06554091fa3e9301bcc7d9c13a623e01b86` | `a67be74338cc330e724819cb24a7ee6b4bc4c4d1ac98db8eee9bf11b50c29ec3` | Aura-associated body pose |

`activ` and `deact` share sampled MTB bytes but have distinct MCBs and distinct CIBT controller entries. They are authored in separate semantic directions and must not be collapsed into one inferred state.

Decoded `cbbm_ded` curves show:

- `n_hara` sinks from approximately zero to `-5.500414`;
- spikes contract, generally to approximately `0.85`-`0.93`;
- `n_toge_h` Y/Z reaches `0.7`;
- the top spike reaches approximately `0.800787`.

The death motion is therefore a downward sink/collapse with spike contraction, not a generic humanoid fall.

## Active e002 death scheduler

The e002 death package is the strongest active-Nail terminal candidate:

| Component | Evidence |
|---|---|
| Outer `dead` RES | 55,832 bytes, SHA `33656662dce239b750b33e48e41e36aa74afb6c7fdcc58b59a8ff0f17f7b65e2` |
| `dead` SCB | 1,888 bytes, SHA `5b4b3631be6ac08e27f99efabc685893fe93e11e8146d2b73fabab1e03ea63f6`; 0.99 s / 12 active entries |
| Nested RES | 53,667 bytes, SHA `db7c182d71a182fc3f19158e0cde22884f7f9d1f23c16ac67b3b2a66e575c6ee` |
| VEFF `151rmjanc_dead1` | SHA `85745f0569c3b2f1aaa0ecf01267f586c86a2f4507b2aa64fa8e051fbc6a5278` |
| ACB `m524_ded` | 51 frames at 30 fps, SHA `1ef8ba001f98c3486633f2cf6c0ddaf52d8a98231ddacb1c0fb18c55670f89b1` |

The scheduler explicitly cancels `init_msb4_1`, runs `cbbm_ded`, applies `cbxs_st1to0`, invokes `m524_ded`, enters `cbbm_dedpose`, includes one sound, and unlocks the target. This is a complete authored active-aura-to-dead sequence.

The current server sends generic `DEAD`; static source does not prove that the client automatically chooses this e002 scheduler. That selector/render join remains open even though the package itself is complete.

The alternate e001 death package is smaller in topology:

- SCB SHA `1b6fefc74b24d052e3342ffa7f4b96a498bf553937587d615c14e963e37471e9`, 0.99 s / 10 active entries;
- VEFF SHA `04ca2bc88275ff13e30298adc2b783cbcb48a524b863b638332ba11992e56f0c`;
- `m524_ded` ACB 47 frames at 30 fps, SHA `dbb0bca727f54f111b73da2ba788f8f2fe28b3306dc2f1b4fa146f63465997df`;
- no recovered sound clip in that scheduler.

## Hit-reaction boundary

The rig/BID declares `cbbm_hitrn_l`, `cbbm_hitrn_r`, `cbbm_hitrn_bl`, and `cbbm_hitrn_br`. No physical `m524` MCB/MTB for those hit-reaction names was recovered. The same strings appear as generic declarations across many monster files.

Therefore the client surface proves hit-reaction references, not installed model-specific Nail hit animations. A server hit packet should not be documented as selecting a recovered `m524` flinch clip unless a runtime capture or another physical resource closes that edge.

## Sound boundary

`equ/e001/top_snd/0000` is 940 opaque bytes with no printable semantic event name and no normal SEDB sound-container signature. Scheduler sound-clip presence is exact, but cue IDs and human-readable meanings remain unresolved and must not be invented.

## Final boundary

The client contains every major visual phase needed for a complete Nail lifecycle: below-ground rise, spike growth, dormant/active model states, persistent aura, active-to-dormant reversal, collapse/sink, death effect, death pose, sound hooks, and target unlock. Current server source explicitly requests the entrance and aura state but does not explicitly request the installed deactivation/consume path. Automatic e002 death selection and all current render behavior still require packet-synchronized client capture.
