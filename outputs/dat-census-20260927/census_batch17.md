# DAT census batch 17 — tops 93 + 97 + 99 + 9A + 9C + 9D + 9E + A0 + A2 + A3 + A4 + A5 + A8 + AE + AF

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 17 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 93 | 1 | 140 | 2,761,320 (~2.6 MiB) | .DAT only |
| 97 | 10 | 2,255 | 28,133,460 (~26.8 MiB) | .DAT only |
| 99 | 10 | 985 | 18,586,004 (~17.7 MiB) | .DAT only |
| 9A | 9 | 32 | 6,831,940 (~6.5 MiB) | .DAT only |
| 9C | 13 | 135 | 8,547,166 (~8.2 MiB) | .DAT only |
| 9D | 7 | 1,221 | 27,340,388 (~26.1 MiB) | .DAT only |
| 9E | 3 | 705 | 11,820,516 (~11.3 MiB) | .DAT only |
| A0 | 13 | 99 | 11,299,329 (~10.8 MiB) | .DAT only |
| A2 | 2 | 25 | 4,270,296 (~4.1 MiB) | .DAT only |
| A3 | 11 | 1,149 | 29,388,194 (~28.0 MiB) | .DAT only |
| A4 | 1 | 1 | 605,268 (~0.6 MiB) | .DAT only |
| A5 | 8 | 1,880 | 20,094,298 (~19.2 MiB) | .DAT only |
| A8 | 13 | 1,124 | 22,514,294 (~21.5 MiB) | .DAT only |
| AE | 7 | 57 | 23,116,708 (~22.0 MiB) | .DAT only |
| AF | 3 | 705 | 8,633,318 (~8.2 MiB) | .DAT only |

## Cross-checks

- All 15 L2 counts match the install inventory scan.
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–17, 69 tops): 105,824 DATs / ~3.45 GiB.

## Next: final 6 tops

`00`, `01` (formalize the swarm's samples with full recounts), and the four
`8x` giants (`89`:96 L2, `8A`:80, `8B`:130, `8C`:113 — own batches with
generous timeout). Then the census is COMPLETE at 75/75 tops and the
leaf-classification pass (headers/magic → table mapping) begins.
