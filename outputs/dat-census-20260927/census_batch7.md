# DAT census batch 7 — tops 5B + 75

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 7 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 5B | 29 | 1,203 | 138,508,891 (~132.1 MiB) | .DAT only |
| 75 | 29 | 3,879 | 159,070,032 (~151.7 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (5B:29, 75:29).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–7, 14 tops): 49,921 DATs / ~2.04 GiB.

## Next batches (one top per batch, by descending L2 count)

`60` (26), `AB` (23), `A7` (21), `62` (20), `1C` (18), `79` (16), …
down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
