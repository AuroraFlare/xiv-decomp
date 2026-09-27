# DAT census batch 19 (FINAL) — tops 8A + 8B + 8C

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 19 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 8A | 80 | 10,077 | 1,962,375,766 (~1.83 GiB) | .DAT ×10076 + 1 foreign file (below) |
| 8B | 130 | 2,314 | 501,955,196 (~478.7 MiB) | .DAT only |
| 8C | 113 | 3,114 | 135,274,938 (~129.0 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (8A:80, 8B:130, 8C:113).
- Top 8A is the largest top in the install (1.83 GiB).
- SECOND FOREIGN FILE: top 8A contains one `.bak-05-12-26` file (operator
  backup, May 2026 vintage — same family as the top-01 backup flagged in
  batch 18). Content not inspected; owner to confirm safe to ignore.

## CENSUS COMPLETE — 75/75 tops

Full totals in `CENSUS_TOTALS.md` (this directory).
