# Atomos, Deepvoid aura, and aetheryte effect decomp — 2026-09-07

This pass closes the persistent Deepvoid aura, expands all installed Atomos
action/state banks, and recovers the camp aetheryte's embedded animation and
orange material variant. It supersedes the uncertain asset interpretations in
`docs/atomos_deepvoid_summoning_animation_decomp_2026-07-29.md` while retaining
that report's historical event research and server/director boundary.

## Answer

The red/black field around the Deepvoid mobs is an animated, persistent VFX,
not their skeletal activation animation. Every recovered Deepvoid appearance
selects head equipment `e005`; that package starts an `awl*_on` scheduler from
the normal/battle idle hooks, attaches the effect to `EID_BODY_DYN`, and invokes
the corresponding `awl*_off` scheduler from the death hooks. The off scheduler
explicitly cancels the on scheduler. The existing appearance data therefore
loads the aura without a separate event-side effect command.

Atomos has seven ordinary effect-bearing WSS banks, one motion/sound-only
variant, and two state-kick banks. WSS9 and WSS10 have byte-identical functional
schedulers: both consume a queued model-state change. Atomos's skeleton
metadata advertises bit 4 (`0x10`); bit-4 on resolves BID scheduler
`init_msb4_1` and skill09's two effects, while bit-4 off resolves
`init_msb4_0` and skill10's two effects. These are actor/body state effects,
not WSS9 and WSS10 hardcoding separate visuals.

WSS3 remains the strongest absorption-action candidate, but the reason is now
more precise and more limited. Its target scheduler starts `m070sk3t0` and a
`RaptureEffectAtoBClip`. Native decomp shows that the A-to-B clip contains a
list of existing ActionClip indices and applies mode `2` to the referenced
clip; it does not load a separate beam/tether resource. In WSS3 it references
target ActionClip 2. WSS2 and WSS4 also have target effects, so an actual
target-bearing live playback or packet capture is still required to identify
the historical drain/ground flare exactly.

The camp aetheryte has an embedded skeletal idle after all. `b902 e001` and
`e002` share the same 1,728-frame, 30-fps, 10-bone `cbnm_id0` motion (57.6 s)
and the same embedded crystal VFX. Their shaders and textures differ: e001 is
the normal pale/cyan crystal; e002 contains unmistakably orange crystal and
warm fuzz-ramp textures. `b902 e002` is therefore the strongest concrete
affected-crystal appearance candidate. The supplied frame with a blue crystal
and orange-white flare at its base is a separate transient effect and remains
unbound.

## Corrected event presentation map

| Visible feature | Recovered mechanism | Confidence |
|---|---|---|
| Deepvoid red/black aura | `head=5120` -> model `e005/met_mdl/0001` -> idle `awl*_on` -> `EID_BODY_DYN`; death calls `awl*_off` | Confirmed asset and appearance binding |
| Deepvoid body transition | Family `cbbm_activ/deact` motions | Confirmed normal/battle transitions; not proved summon/despawn |
| Atomos bit-4 state | queued substate `0x10` + WSS9 or WSS10 kick -> BID `init_msb4_1`; clear -> `init_msb4_0` | Confirmed client asset/control path |
| Atomos absorption action | WSS3 starts body/current caster effects and target `m070sk3t0`; A-to-B controls target ActionClip 2 | Strong candidate; historical binding unknown |
| Persistent orange crystal | `b902 e002` authored orange material/textures | Strong candidate; original director binding unknown |
| Crystal motion/glow | embedded `initf_idle` -> `cbnm_id0` + `b_902vfx1` | Confirmed |
| Orange-white ground flare in supplied screenshot | external Atomos/target/player action not isolated by the still image | Unknown |

## Important corrections to the July report

1. SQL value `5120` is `head`, not `body`. It selects equipment set e005,
   which is the Deepvoid aura carrier. The following value is `body`.
2. The aura resource is no longer unknown and does not need an invented,
   separately configured encounter attachment.
3. `cbbm_activ/deact` contain only one-second, 30-fps motion transitions
   between normal and battle states. They do not establish materialization.
4. The aetheryte has no external `/act/` bank, but its model embeds a long idle
   motion and VFX scheduler. "No external bank" did not mean "no animation."
5. Scheduler/MCB integers must remain authored units. Every recovered Atomos
   MCB/MTB pair uses 10,000 units per source frame; mechanically dividing by
   one million produces false durations. Seconds in this bundle are derived
   only from explicit MTB frame counts and fps.
6. WSS3's A-to-B clip is generic control over a referenced target ActionClip,
   not evidence of a standalone tether asset.

## Atomos action inventory

| Bank | Source motion | Explicit source duration | VFX/control summary |
|---|---|---:|---|
| WSS1 | `cbbm_sp_01` | 83 frames / 2.767 s | chest caster, middle/current, body-static target |
| WSS2 | `cbbm_sp_b01` | 90 frames / 3.0 s | current caster and current target; transition link to B loop |
| WSS3 | `cbbm_sp_a01` | 90 frames / 3.0 s | current/body-static caster, body-static target, A-to-B target control; transition link to A loop |
| WSS4 | `cbbm_sp_a02` | 83 frames / 2.767 s | chest/current caster and body-static target; transition link to A loop |
| WSS5 | `cbbm_sp_02` | 90 frames / 3.0 s | two effect actions, no separately named target suffix |
| WSS6 | `cbbm_sp_03` | 90 frames / 3.0 s | body-static caster and target |
| WSS7 | `cbbm_sp_04` | 90 frames / 3.0 s | chest skill07 effect plus reused skill01 target effect |
| WSS8 | `cbbm_sp_04` | 90 frames / 3.0 s | motion and sound, no ActionClip VFX |
| WSS9 | none | — | substatus/model-state kick; functionally identical to WSS10 |
| WSS10 | none | — | substatus/model-state kick; functionally identical to WSS9 |

`cbbm_sp_a_2lp` and `cbbm_sp_b_2lp` are both 50 frames at 30 fps. They are
separate BID cast-loop motions selected through CIBC slots, while transition
tables connect the WSS2/3/4 one-shots to the corresponding loop family.

## Deepvoid family variations

| Deepvoid family | Model | Scheduler | Terminal effect |
|---|---|---|---|
| Watcher, Pikeman, Wizard, Warrior, Slave, Scamp, Soul | m029/m030/m031/m037/m038/m505 | `awl0_on/off` | `mon_awl0` |
| Sludge | m049 | `awl1_on/off` | `mon_awl1` |
| Butcher | m054 | `awl2_on/off` | distinct wrapper around `mon_awl0` |

All variants use `EID_BODY_DYN`. The on ACBs carry the recovered persistent
pattern flags `+0x9C=0xC0` and `+0xA0=0x101`; the short scheduler envelope is
not the visible aura duration.

## Reproduction and evidence

Run from the repository root:

```powershell
python tools/decompile_deepvoid_aura.py
python tools/decompile_atomos_action_timelines.py
python tools/decompile_atomos_aetheryte_effects.py
```

- `deepvoid-aura/README.md` contains the exact appearance/equipment/lifecycle
  proof, 122 resources, 152 scheduler clips, and 24 typed effect edges.
- `atomos-actions/REPORT.md` contains all 11 action-bank timelines, 395
  scheduler clips, 23 motions, and 21 exact effect chains.
- `aetheryte-effects/REPORT.md` contains the embedded-motion/VFX graph, all
  decoded textures, and the e001/e002 comparison.
- `native/` contains the native `RaptureEffectAtoBClip` factory, handler,
  ActionClip application path, and supporting decompilation.

The extraction is complete for the installed asset graph. Exact server event
timing, spawn coordinates/waves, the original action ID used for absorption,
and the screenshot's transient ground flare require live playback or an
original packet capture; the assets alone do not encode those bindings.
