# DAT census batch 15 — tops 02 + 03 + 05 + 07 + 08 + 0B + 23 + 24 + 25 + 27

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 15 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 02 | 2 | 16 | 126,933 (~0.1 MiB) | .DAT only |
| 03 | 8 | 11,077 | 46,654,093 (~44.5 MiB) | .DAT only |
| 05 | 1 | 4 | 540,976 (~0.5 MiB) | .DAT only |
| 07 | 2 | 535 | 284,912,304 (~271.7 MiB) | .DAT only |
| 08 | 1 | 770 | 29,161,560 (~27.8 MiB) | .DAT only |
| 0B | 1 | 2,421 | 18,183,618 (~17.3 MiB) | .DAT only |
| 23 | 1 | 7 | 13,397,018 (~12.8 MiB) | .DAT only |
| 24 | 2 | 11 | 2,892,960 (~2.8 MiB) | .DAT only |
| 25 | 1 | 12 | 1,388,492 (~1.3 MiB) | .DAT only |
| 27 | 2 | 173 | 26,849,460 (~25.6 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (02:2, 03:8, 05:1, 07:2, 08:1,
  0B:1, 23:1, 24:2, 25:1, 27:2).
- All leaves are `.DAT`; no foreign extensions.
- New records: top 03 densest (11,077 files); top 07 chunkiest (~532 KiB mean).
- Running census total (batches 1–15, 44 tops): 92,302 DATs / ~3.12 GiB.

## Next batches

Remaining 31 tops: `00`, `01` (swarm-sampled, to formalize), the four `8x`
giants (`89`, `8A`, `8B`, `8C` — own batches), then `37`, `57`, `5C`, `5F`,
`74`, `7B`, `7E`, `7F`, `84`, `91`, `93`, `97`, `99`, `9A`, `9C`, `9D`, `9E`,
`A0`, `A2`, `A3`, `A4`, `A5`, `A8`, `AE`, `AF`. Each batch: counts +
histogram + known-table mapping; new tables get decode notes, never raw dumps.
