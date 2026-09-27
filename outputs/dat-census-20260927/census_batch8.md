# DAT census batch 8 — tops 60 + AB

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 8 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 60 | 26 | 5,725 | 76,550,652 (~73.0 MiB) | .DAT only |
| AB | 23 | 2,929 | 80,114,365 (~76.4 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (60:26, AB:23).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–8, 16 tops): 58,575 DATs / ~2.19 GiB.

## Next batches (one top per batch, by descending L2 count)

`A7` (21), `62` (20), `1C` (18), `79` (16), `28` (12), `B0` (12), …
down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
