# DAT census batch 3 — tops 9F + AD

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 3 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 9F | 41 | 1,631 | 51,793,813 (~49.4 MiB) | .DAT only |
| AD | 39 | 1,957 | 124,881,185 (~119.1 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (9F:41, AD:39).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–3, 6 tops): 18,733 DATs / ~709 MiB.

## Next batches (one top per batch, by descending L2 count)

`36` (38), `72` (38), `73` (38), `92` (35), `A9` (32), `5D` (30), `5B` (29),
`75` (29), `60` (26), … down to single-L2 tops. Each batch: counts +
histogram + known-table mapping; new tables get decode notes, never raw dumps.
