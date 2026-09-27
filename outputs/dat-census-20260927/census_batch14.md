# DAT census batch 14 — tops AC + 9B + 1A + 15 + 34 + 35

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 14 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| AC | 5 | 1,080 | 14,719,266 (~14.0 MiB) | .DAT only |
| 9B | 5 | 35 | 8,873,362 (~8.5 MiB) | .DAT only |
| 1A | 4 | 68 | 4,229,050 (~4.0 MiB) | .DAT only |
| 15 | 3 | 9 | 6,169,676 (~5.9 MiB) | .DAT only |
| 34 | 2 | 282 | 22,939,844 (~21.9 MiB) | .DAT only |
| 35 | 2 | 6 | 505,470 (~0.5 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (AC:5, 9B:5, 1A:4, 15:3, 34:2, 35:2).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–14, 34 tops): 77,276 DATs / ~2.72 GiB.

## Next batches (by descending L2 count)

`03` (8), `02` (2), `05` (1), `07` (2), `08` (1), `0B` (1), `07`…, then all
remaining small tops, plus formalizing the swarm's `00`/`01` samples. Each
batch: counts + histogram + known-table mapping; new tables get decode notes,
never raw dumps.
