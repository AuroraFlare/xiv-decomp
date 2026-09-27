# DAT census batch 4 — tops 36 + 72

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 4 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 36 | 38 | 8,472 | 150,447,336 (~143.5 MiB) | .DAT only |
| 72 | 38 | 5,156 | 548,723,318 (~523.3 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (36:38, 72:38).
- All leaves are `.DAT`; no foreign extensions.
- Top 72 is the largest top censused so far (523 MiB, ~106 KiB mean file).
- Running census total (batches 1–4, 8 tops): 32,361 DATs / ~1.37 GiB.

## Next batches (one top per batch, by descending L2 count)

`73` (38), `92` (35), `A9` (32), `5D` (30), `5B` (29), `75` (29), `60` (26),
… down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
