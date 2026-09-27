# DAT census batch 11 — tops 28 + B0

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 11 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 28 | 12 | 895 | 81,395,018 (~77.6 MiB) | .DAT only |
| B0 | 12 | 118 | 51,416,864 (~49.0 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (28:12, B0:12).
- All leaves are `.DAT`; no foreign extensions.
- Top B0 has the highest mean file size so far (~436 KiB over 118 files).
- Running census total (batches 1–11, 22 tops): 72,065 DATs / ~2.49 GiB.

## Next batches (one top per batch, by descending L2 count)

`2A` (11), `8D` (6), `2B`/`33`/`39` (5/5/5), … down to single-L2 tops.
Each batch: counts + histogram + known-table mapping; new tables get decode
notes, never raw dumps.
