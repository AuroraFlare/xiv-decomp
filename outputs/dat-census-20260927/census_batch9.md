# DAT census batch 9 — tops A7 + 62

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 9 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| A7 | 21 | 2,109 | 65,281,468 (~62.3 MiB) | .DAT only |
| 62 | 20 | 0 | 0 | (empty — 20 L2 dirs, no leaf files) |

## Cross-checks

- L2 counts match the install inventory scan (A7:21, 62:20).
- Top 62 is the first EMPTY top found: directory skeleton present, zero files.
  Probable reserved/stub top; flagged for the leaf-classification pass (no
  content to classify unless a patch fills it).
- Running census total (batches 1–9, 18 tops): 60,684 DATs / ~2.25 GiB.

## Next batches (one top per batch, by descending L2 count)

`1C` (18), `79` (16), `28` (12), `B0` (12), `29-sampled`/`2A` (11/6), …
down to single-L2 tops. Each batch: counts + histogram + known-table
mapping; new tables get decode notes, never raw dumps.
