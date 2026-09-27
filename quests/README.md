# Normalized class-quest + parley decomp — final consolidation (2026-09-27)

Consolidates Batch A (melee PGL/GLA 200/300/306), Batch B remainder (LNC
200/300/306), and the parley/widget pack into per-quest dirs. Format follows
`outputs/class-quest-decomp-magic/` + `outputs/msq-decomp-man/` (per-quest md,
`quest_flow.csv`, `summary.json`, this README index).

Target repo `FF14-Decomp` is read-only from this pass, so the package lands
here (`/tmp/ff14-decomp-final/`); move it to
`outputs/class-quest-normalized-20260927/` on merge.

## Why these quests (gap fill, not duplication)

- EXC/ARC/THM/CNJ 200/300/306 already have per-quest files in
  `class-quest-decomp-magic/` — referenced, not recopied.
- PGL/GLA 200/300/306 had only pack-level CSVs (`class-quest-melee-decomp-20260927/`)
  + the indepth doc; Phase-3 `class-quest-decomp-melee/` references them without
  per-quest files. Written here from those CSVs (no new claims).
- LNC 200/300/306 likewise had only ranged-pack CSVs + indepth doc. Written here.
- Parley pack had widget contracts but no per-quest linkage. `man300*/` and
  `man206*/` link the contracts to their quest surface; `parley-blocked-hand/`
  normalizes the HAND quests that HOLD on the missing Parley subsystem.

## Index

| Quest | Dir |
|---|---|
| 110060 Pgl200 The House Always Wins | [quest](110060-pgl200-the-house-always-wins/quest.md) |
| 110061 Pgl300 Here There Be Pirates | [quest](110061-pgl300-here-there-be-pirates/quest.md) |
| 110062 Pgl306 Two Sides to Every Chip | [quest](110062-pgl306-two-sides-to-every-chip/quest.md) |
| 110080 Gla200 All Bark and No Bite | [quest](110080-gla200-all-bark-and-no-bite/quest.md) |
| 110081 Gla300 Unalienable Rights | [quest](110081-gla300-unalienable-rights/quest.md) |
| 110082 Gla306 Thrill of the Fight | [quest](110082-gla306-thrill-of-the-fight/quest.md) |
| 110180 Lnc200 A Wailing Welcome | [quest](110180-lnc200-a-wailing-welcome/quest.md) |
| 110181 Lnc300 Culture Shock | [quest](110181-lnc300-culture-shock/quest.md) |
| 110182 Lnc306 Necessary Evils | [quest](110182-lnc306-necessary-evils/quest.md) |
| Man300 Toll of the Warden (parley tiles) | [parley](man300-toll-of-the-warden-parley/parley.md) |
| Man206 Together We Stand (NPC linkpearl) | [linkpearl](man206-together-we-stand-linkpearl/linkpearl.md) |
| HAND parley-blocked quests | [blocks](parley-blocked-hand/parley-blocks.csv) |

Machine-readable: [quest_flow.csv](quest_flow.csv), [summary.json](summary.json).

## Legend (all per-quest files)

- VERIFIED: pack CSV row, indepth-doc section, DAT marker, SQL row, or
  validator PASS named inline. No new mining was done in this pass.
- INFERRED: batch-agent authored default (formation offsets, party caps,
  timers, Y scaffolds), carried over labeled.
- OPEN: evidence that does not exist. Nothing invented to close these.

## Sources (unchanged, read-only)

- `outputs/class-quest-melee-decomp-20260927/` (sequences, process_events,
  markers, actors, fight_waves, rewards CSVs)
- `docs/class-quest-melee-pgl-gla-exc-indepth-decomp-2026-09-27.md`
- `outputs/class-quest-ranged-decomp-20260927/` (actors, events, fights,
  markers, rewards, sequences CSVs)
- `docs/class-quest-ranged-arc-lnc-thm-cnj-indepth-decomp-2026-09-27.md`
- `outputs/parley-call-widget-decomp-20260708/` + `docs/parley_call_widget_decomp_2026-07-08.md`
- `outputs/class-quest-decomp-hand/` (README gap 1 + quest_flow.csv HOLD rows)
