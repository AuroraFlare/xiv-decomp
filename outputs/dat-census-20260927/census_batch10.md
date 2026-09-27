# DAT census batch 10 — tops 1C + 79

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 10 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 1C | 18 | 9,975 | 98,687,347 (~94.1 MiB) | .DAT only |
| 79 | 16 | 393 | 20,125,870 (~19.2 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (1C:18, 79:16).
- All leaves are `.DAT`; no foreign extensions.
- Top 1C has the highest file count so far (9,975 small DATs, ~10 KiB mean).
- Running census total (batches 1–10, 20 tops): 71,052 DATs / ~2.36 GiB.

## Next batches (one top per batch, by descending L2 count)

`28` (12), `B0` (12), `2A` (11), `29-sampled`, `8D` (6), … down to
single-L2 tops. Each batch: counts + histogram + known-table mapping; new
tables get decode notes, never raw dumps.
