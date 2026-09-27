# DAT census batch 12 — tops 2A + 8D + 2B

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 12 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 2A | 6 | 654 | 44,695,924 (~42.6 MiB) | .DAT only |
| 8D | 6 | 1,410 | 21,069,162 (~20.1 MiB) | .DAT only |
| 2B | 3 | 149 | 25,998,375 (~24.8 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (2A:6, 8D:6, 2B:3).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–12, 25 tops): 74,278 DATs / ~2.58 GiB.

## Next batches (by descending L2 count)

`33` (5), `39` (5), `04` (5), `AC` (5), `00-sampled`, `01-sampled`, …
down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
