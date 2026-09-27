# DAT census batch 5 — tops 73 + 92

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 5 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 73 | 38 | 7,115 | 109,727,828 (~104.6 MiB) | .DAT only |
| 92 | 35 | 1,099 | 185,486,820 (~176.9 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (73:38, 92:35).
- All leaves are `.DAT`; no foreign extensions.
- Top 92 has the highest mean file size so far (~169 KiB).
- Running census total (batches 1–5, 10 tops): 40,575 DATs / ~1.65 GiB.

## Next batches (one top per batch, by descending L2 count)

`A9` (32), `5D` (30), `5B` (29), `75` (29), `60` (26), `AB` (23), `A7` (21),
… down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
