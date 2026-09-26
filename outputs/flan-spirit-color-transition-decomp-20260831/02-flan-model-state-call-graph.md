
# m049 flan model-state call graph

```text
opcode 0x0144 / SetActorSubState payload
  +4..+5 = mode/state word
  -> concrete CharaActor packet handler 0x00662D30
     subtype 0x3B @ 0x006638A4
     -> 0x007B4440(actor+0x1110, word)
        queues type 3; does not launch a scheduler yet

action scheduler reaches RaptureActionSubStatusSchKickClip
  -> queue drain 0x007BF2E0 (alternate drain includes 0x007BF5F8)
     -> 0x007A82F0(actor+0xB80, new mask)
        changed = old XOR new
        gate A: 0x0065BE50 -> metadata +0x35 state count
        gate B: 0x0065C550 -> metadata +0x3B supported mask
        for each changed supported bit N:
          set   -> init_msbN_1
          clear -> init_msbN_0
          lookup under active model resource root
          create scheduler and retain handle at component +0x24+4*N
```

Direct call closure also includes the immediate thunk at `0x007ABED0`, reset
path containing callsite `0x007BB8E2`, and alternate drain containing
`0x007BF5F8`. Full bodies and listings are in
`03-flan-model-state-native-decomp.txt`.

## Exact m049 states

| bit | mode mask | on scheduler | off scheduler | on ActionClip target | terminal VEFF |
|---:|---:|---|---|---|---|
| 4 | `0x10` | `init_msb4_1` | `init_msb4_0` | `msn_004_1` | `pur_mupt1` |
| 5 | `0x20` | `init_msb5_1` | `init_msb5_0` | `msn_005_1` | `pur_mupt2` |
| 6 | `0x40` | `init_msb6_1` | `init_msb6_0` | `msn_006_1` | `pur_mupt3` |

Each on scheduler is 80,000 units (0.08 s): ActionClip at 0, chant sync at
0.01 s, then sound/effect-end at 0.02 s. The nested ACB blocks are 0.15 s,
0.18 s, and 0.20 s for `pur_mupt1`, `pur_mupt2`, and `pur_mupt3`
respectively. Each off scheduler is 20,000 units (0.02 s) and cancels
chant/effect state. The terminal authored paths are:

```text
D:/gra_rapture/vfx/mon/purine_m049/0006_mahoryoku_up/pur_mupt1t.veff
D:/gra_rapture/vfx/mon/purine_m049/0007_mahoryoku_up_lv02/pur_mupt2t.veff
D:/gra_rapture/vfx/mon/purine_m049/0008_mahoryoku_up_lv03/pur_mupt3t.veff
```

`mahoryoku_up` means magic-power-up; the three resources are increasing
levels, not self-labeling elemental colors. Do not assign lightning/wind/fire
from their ordinal alone.

The terminal VEFFs instantiate `ColorRGBABlink`, `ColorRGBALeaf`/`LeafEx`,
glow, and spark controls. Those are effect-local VFX controls; they are not a
BODYGEAR dye or a material replacement on the flan model. Their complete raw
0x402 color-control records are in `07-flan-vfx-color-controls.csv`: four for
level 1, eight for level 2, and sixteen for level 3, each laid out contiguously
at the serialized 0x34-byte stride.

## Low-byte elemental material state

Opcode `0x0144` payload byte `+4` carries the state word's low byte. The
model metadata split count partitions its low bits as the `init_msn%03u`
ordinal; m049 uses three ordinal bits and provides
`init_msn000..006`, and the e001 `top_tex1` bank resolves those schedulers to
the following material-transform motions:

| state | element | neutral transition | steady motion | `multiDiffuseColor` |
|---:|---|---|---|---|
| 1 | Fire | `cbxs_st0to1` | `cbxs_st1` | `(0.75, 0.237675, 0.075)` |
| 2 | Ice | `cbxs_st0to2` | `cbxs_st2` | `(1.155, 1.535205, 1.75)` |
| 3 | Lightning | `cbxs_st0to3` | `cbxs_st3` | `(0.626487, 0.441, 0.7)` |
| 4 | Wind | `cbxs_st0to4` | `cbxs_st4` | `(0.15, 0.75, 0.3523)` |
| 5 | Earth | `cbxs_st0to5` | `cbxs_st5` | `(1.1, 0.8426, 0.242)` |
| 6 | Water | `cbxs_st0to6` | `cbxs_st6` | `(0.21, 0.512833, 1.0)` |

Every neutral transition advertises 15 frames at 30 fps, or 0.5 seconds.
These are material animations, despite the historical `cbxs` motion naming.
They are not the low-byte bit-4/5/6 `pur_mupt` packages.

## Required publication semantics

Writing `breakage` at payload byte 0 queues type 2 and cannot reach this
selector. Byte `+4` is the low state byte: metadata divides it between the
`init_msnNNN` ordinal and any remaining `init_msb` flags. Byte `+5` is the
reserved high byte and does not select m049's ordinal. A real action scheduler containing
`RaptureActionSubStatusSchKickClip` must subsequently commit the queued state.
The model must be loaded and advertise the selected state in metadata or the
selector deliberately does nothing.
