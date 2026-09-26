# Deepvoid persistent aura: exact appearance and effect graph

Recovered 2026-09-07 from the installed 1.x client. Client files and server
runtime were not modified. This closes the earlier report's missing aura
resource binding; it does not claim a new live screenshot comparison.

## Result and a correction to the July report

The Deepvoid aura is an **equipment-attached VFX package**, automatically wired
to idle initialization and death. It is not the monster's `cbbm_activ` body
animation, and the recovered aura graph does not require a bespoke Animaobj
Lua wrapper or a newly invented event effect.

The July report mislabeled adjacent appearance columns. Parsing the actual
`CREATE TABLE` schema establishes that **5120 is `head`, not `body`**. For
Deepvoid Soul `2104328/2104329`, the exact row is:

```text
base = 10505; size = 7; head = 5120; body = 1056; legs = 0
head 5120 = 0x1400 = equipment 5, low variant bits 0
  -> m505/equ/e005/met_mdl/0001       [aura carrier]
body 1056 = 0x0420 = equipment 1, low variant bits 32
  -> m505/equ/e001/top_*             [ordinary monster appearance]
```

`Npc.cs:857` reads SQL `head` into `HEADGEAR`, whose appearance-table index is
12 (`Character.cs:171`). `Npc.cs:858` reads `body` into `BODYGEAR` index 13.
The existing graphic packing code in `Player.cs:3165–3167` uses 10-bit
equipment IDs at bits 10–19. The compact appearance packet identifies the
head field as `HEADGEAR + 1 = 13` on the wire; changing the body field instead
would select a different resource lane. This is a data interpretation
correction, not a proposed packet or server change.

All 18 named Deepvoid rows select `head=5120`; `appearance_bindings.csv`
preserves their actual schema-named values. It is unnecessary to infer the
aura from the A/B Lua class names: the existing appearance rows already select
the VFX-bearing head package, including rows bound to ordinary Standard Lua
classes. The semantic distinction between Animaobj and AnimaobjB remains
unresolved separately.

## Exact Soul/Watcher/Warrior/Scamp chain

`m029`, `m031`, `m038`, and `m505` have byte-identical 175,200-byte e005
packages, SHA-256
`b247660782ecde4dec732b2a819028a0761a8b5114e1b5ad4c7806e86334ed76`.

```text
equ/e005/met_mdl/0001
  2nitf_idle / 2nitb_idle [SCB]
    RaptureCasterManagedSchClip: awl0_on
      awl0_on [SCB] -> ActionClip RIDT[1]: awl0_on [ACB]
        Effect typed reference at ACB +0x330 -> 0KhhHLvleafinst [VINS]
          typed reference at VINS +0x2E4 -> 0TSgkPawl00_on [LEAF]
            typed reference at LEAF +0x30C -> 1ZER9jmon_awl0 [VEFF]
            authored path: D:/gra_rapture/vfx/mon/mon_awl/veff/mon_awl0.veffbin
          attachment at VINS +0x4C2: EID_BODY_DYN

  2ms2f_dead / 2ms2b_dead [SCB]
    RaptureCasterManagedSchClip: awl0_off
      RaptureCancelChantSyncClip: awl0_on
```

The effect is attached to the dynamic body attachment point (`EID_BODY_DYN`),
which explains why it follows the mob even though the selecting equipment
slot is named head. The VFX includes geometry/material resources using
distortion shaders, UV scrolling, a generator, and leaf color/lifetime
controls. Its visual motion is effect animation; it is separate from the
monster's skeletal motion. The package carries a directly identified effect
graph, not merely a filename containing a suggestive word.

| Resource | Bytes | SHA-256 |
|---|---:|---|
| `awl0_on` SCB | 1,104 | `ad1b8d23f921a986cc5aed2c6d4d01c484e1663f94e6a25f3378fb9f1ae7ff08` |
| `awl0_off` SCB | 1,008 | `0518a01f3a2fa894e4913f75c74d1c81734896b15840e9800e9c7b92864fd9dc` |
| `awl0_on` ACB | 1,016 | `054c7c4aac5598f2b74cd2c293b280e50f27cc37bfb78be2fbf6ccc793f21118` |
| `0KhhHLvleafinst` VINS | 1,231 | `ff0b9a36ec5cb2f005b47ee6bc2523f946b00ef71f0955068373749754ed2375` |
| `0TSgkPawl00_on` LEAF | 1,198 | `7ba385aae709c2ef5b7a48ae832010398faaf6a6271d63c1653d1a7daddb2d97` |
| `1ZER9jmon_awl0` VEFF | 17,840 | `a2f395ce0d447c040641d9ac6577785b07015f223ef778158a5b299305e9904b` |

## Family variations

| Mob(s) | Model | Head / body / legs | On / off scheduler | Effect action and terminal VEFF |
|---|---|---|---|---|
| Watcher | m029 | 5120 / 1056 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Pikeman | m030 | 5120 / 1024 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Wizard | m030 | 5120 / 1056 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Warrior | m031 | 5120 / 1024 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Slave | m037 | 5120 / 2048 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Scamp | m038 | 5120 / 1056 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |
| Sludge | m049 | 5120 / 1024 / 0 | `awl1_on` / `awl1_off` | `awl01_on` -> `mon_awl1` |
| Butcher | m054 | 5120 / 1056 / 0 | `awl2_on` / `awl2_off` | `awl02_on` -> `mon_awl0` |
| Soul | m505 | 5120 / 1056 / 0 | `awl0_on` / `awl0_off` | `awl0_on` -> `mon_awl0` |

All variants attach to `EID_BODY_DYN`. Sludge uses a different 17,840-byte
terminal VEFF, `1ZER8Omon_awl1`, SHA-256
`f3e72b3f237255a97ae16466b85fbc33e11f55a69639d9cd89ad64de61abed2d`.
Butcher uses a distinct ACB/leaf-instance/leaf wrapper around the same
`mon_awl0` VEFF as Soul. Do not collapse the three scheduler names into one
manually attached effect if preserving the original per-model setup.

Slave uses differently named lifecycle entry resources: `initf_idle`,
`initb_idle`, `ams2f_dead`, `ams2b_dead`. Their payload hashes match the
corresponding Soul hooks. Living Dead m030 additionally contains `MotionClip`
references to material/state motion `cbxs_st0` in the idle/dead initialization
hooks; its aura ACB/VEFF are unchanged. The m030 package therefore should not
be described as containing only effect resources.

## Persistent lifecycle, without a guessed aura duration

Each on scheduler launches its effect ActionClip at raw tick 0, encounters
`RaptureChantSyncClip` at 30,000, and has `RaptureEffectEndClip` at 50,000
targeting that action. Each corresponding off scheduler explicitly cancels
the named on scheduler at tick 0. The initialization/death hooks request the
appropriate on/off scheduler at tick 10,000.

All eight aura ACBs have flags `+0x9C=0xC0`, `+0xA0=0x101`, matching the
existing repository's persistent-effect pattern. `action_flags.csv` records
the raw values. The managed on/off pairing, chant synchronization, idle hook,
and death cancellation together establish the intended maintained aura
lifecycle. The 300,000-unit on-scheduler envelope is **not** an asserted
visible aura duration. Exported scheduler timing remains in raw units, and
the exact native clock/pause transitions were not newly decompiled here.

This evidence supersedes the July report's recommendation to invent an
additional configurable event aura while its resource remained unknown.
The first faithful rendering check is the recovered appearance with
`HEADGEAR=5120`, followed by ordinary initialization and death. Live rendering
is still needed to verify that a reconstructed client's appearance/rebuild
path actually loads these resources correctly and to compare the screenshot's
exact red/black appearance. Raw color-control records are retained without
claiming they are direct RGB samples or a complete visual renderer.

## Additional reused carrier

The installed `m028/equ/e005/met_mdl/0001` Bomb carrier is byte-identical to
Soul's. SQL rows `2201611/2201612` select it, but their actor classes are
`BombEventSummer2011` / `BombEventSummer2012`. This demonstrates generic
event reuse; it is not evidence of an additional Deepvoid species. The scan
finds nine model carriers and twenty matching SQL appearances in total.

## Reproduction and evidence

From the repository root:

```powershell
python tools/decompile_deepvoid_aura.py
```

Optional `--client` and `--output` arguments allow a different installed
client and evidence directory. The script reads the installed files, checks
the schema/appearance invariants, validates managed scheduler targets and
typed effect references, and exports 122 resources, 152 scheduler records,
and 24 typed effect edges for eight Deepvoid models. It does not patch or
render the client. `sources.csv` hashes whole installed packages, including
their appended texture data; `resources.csv` inventories the parsed nested
resource tables. No full proprietary package copies are written.

Other outputs: `appearance_bindings.csv`, `lifecycle_hooks.csv`,
`typed_effect_edges.csv`, `attachment_and_control_tokens.csv`,
`raw_color_records.csv`, `action_flags.csv`, `input_sources.csv`,
`all_installed_e005_awl_carriers.csv`, `all_sql_e005_awl_bindings.csv`,
`summary.json`. All source/helper files used for the extraction are hashed.
