# DAT census batch 2 — tops 5E + 83

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 2 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 5E | 57 | 8,024 | 144,211,170 (~137.5 MiB) | .DAT only |
| 83 | 45 | 5,825 | 140,549,248 (~134.0 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (5E:57, 83:45).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–2, 4 tops): 15,145 DATs / ~532 MiB.

## Next batches (one top per batch, by descending L2 count)

`9F` (41), `AD` (39), `36` (38), `72` (38), `73` (38), `92` (35), `A9` (32),
`5D` (30), `5B` (29), `75` (29), … down to single-L2 tops. Each batch: counts
+ histogram + known-table mapping; new tables get decode notes, never raw dumps.
