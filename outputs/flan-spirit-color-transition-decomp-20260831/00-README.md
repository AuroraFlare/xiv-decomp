
# Retail flan and Spirit-of-the-Wood color-transition decompilation

## Result

The two effects are not one mechanism.

1. **m049 flans** expose a real model-state material route. Opcode `0x0144`
   byte `+4` carries the state word's low byte; m049 metadata partitions its
   low three bits as the `init_msnNNN` ordinal. An action-time
   `RaptureActionSubStatusSchKickClip` commits the queued state. The installed
   `m049/e001/top_tex1` bank proves the exact steady palette: 1 Fire, 2 Ice,
   3 Lightning, 4 Wind, 5 Earth, and 6 Water. Each neutral-to-element MTB is
   15 frames at 30 fps (0.5 s). This is separate from low-byte state bits
   4/5/6 and their `pur_mupt1/2/3` magic-power-up VEFFs.

2. **Spirit of the Wood (m508)** has no color-fade clip or `init_msn` state
   graph in its installed BID/WSS banks. The scenario presentation is in the
   `man2g000` cutscene package: actor 24 (`m508t0`, class `6000249`) runs an
   ActionClip at 0.44 s that resolves `c_c23_appr01`, then
   `1vgBedm508_appe -> 0J3FJQm508_appe`. Its QIX
   `ColorRGBABlink` graph performs the actual effect-local RGBA interpolation.

3. **BODYGEAR remains atomic.** The known D6/D7 appearance path swaps one
   resource selector and does not blend old/new models. Spirit's m508 element
   BODYGEAR values are genuine retail variants, but the visible authored
   transition is a separate effect. The current WSS7/magic-counter delay is
   emulator presentation code, not the retail color-transition asset.

4. **`RaptureCharaColorFadeClip` is real but is not used by either recovered
   target chain.** Its native runtime is included because it is the obvious
   false lead: it feeds a generic four-channel renderer controller through
   `0x0065EF60`, but neither the m049 state schedulers nor `man2g000` actor 24
   instantiate it.

## Bundle map

- `01-retail-actor-and-trigger-map.md` — identities, live server trigger,
  appearance variants, and evidence boundary.
- `02-flan-model-state-call-graph.md` — complete m049 publish/queue/kick/state
  graph and asset interpretation.
- `03-flan-model-state-native-decomp.txt` — Ghidra decompilation plus raw
  listings for packet handler, queue, drain, selector, and metadata gates.
- `04-flan-state-resource-manifest.csv` — exact nested m049 state resources.
- `05-flan-state-scheduler-clips.csv` — all `init_msn000..006` and
  `init_msb4/5/6` clip rows.
- `06-flan-state-resource-edges.csv` — exact ActionClip -> ACB -> VINS -> leaf
  -> VEFF edges.
- `07-flan-vfx-color-controls.csv` — every serialized 0x402/0x34-byte color
  control record from the three terminal magic-power-up VEFFs.
- `07-flan-state-source-strings.txt` — authored purine/magic-power-up tokens.
- `08-spirit-cutscene-and-qix-report.md` — complete m508 scenario effect report.
- `09-spirit-qix-native-decomp.txt` — ActionClip, ColorRGBALeaf,
  ColorRGBABlink, LeafLife, and LeafLifeEx runtime decompilations/listings.
- `10-spirit-appearance-asset-decomp.md` — physical offsets, hashes, RGBA
  controls, and timing clocks.
- `11-spirit-color-control-records.csv` — all 47 raw 0x402/0x34-byte records.
- `11-spirit-color-control-runs.csv` — compact view of the 15 three-record
  graph runs (the raw table also retains the two records this view omits).
- `12-man2g000-actor24-scb-decomp.txt` — actor-24 scheduler and RIDT evidence.
- `13-generic-chara-colorfade-native-decomp.txt` — complete native false-lead
  closure for `RaptureCharaColorFadeClip`.
- `14-negative-results-and-boundaries.md` — what was disproved and what is
  still capture-dependent.
- `15-implementation-handoff.md` — concrete emulator implications without
  converting inference into retail fact.
- `16-source-manifest.csv` — verified primary-source hashes.
- `17-flan-material-state-palette.csv` — exact m049 state/element mapping,
  transition timing, and steady `multiDiffuseColor` values.

The earlier appearance-dirty bundle remains authoritative for the atomic
D6/D7/BODYGEAR half of the graph and is referenced instead of duplicated.
