# DAT census batch 13 — tops 33 + 39 + 04

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 13 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 33 | 5 | 1,476 | 82,468,268 (~78.6 MiB) | .DAT only |
| 39 | 5 | 42 | 3,047,240 (~2.9 MiB) | .DAT only |
| 04 | 5 | 0 | 0 | (empty — second stub top) |

## Cross-checks

- L2 counts match the install inventory scan (33:5, 39:5, 04:5).
- All leaves are `.DAT`; no foreign extensions.
- Top 04 is the second EMPTY top (04, 62): skeleton present, zero files.
- Running census total (batches 1–13, 28 tops): 75,796 DATs / ~2.66 GiB.

## Next batches (by descending L2 count)

`AC` (5), `9B` (5), `00-sampled`, `01-sampled`, `15` (3), `1A` (4), …
down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
