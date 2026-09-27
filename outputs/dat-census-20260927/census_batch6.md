# DAT census batch 6 — tops A9 + 5D

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 6 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| A9 | 32 | 152 | 46,238,290 (~44.1 MiB) | .DAT only |
| 5D | 30 | 4,112 | 69,530,372 (~66.3 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (A9:32, 5D:30).
- All leaves are `.DAT`; no foreign extensions.
- Top A9 has the highest mean file size so far (~304 KiB over 152 files).
- Running census total (batches 1–6, 12 tops): 44,839 DATs / ~1.76 GiB.

## Next batches (one top per batch, by descending L2 count)

`5B` (29), `75` (29), `60` (26), `AB` (23), `A7` (21), `62`/`61-sampled`
(20), … down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
