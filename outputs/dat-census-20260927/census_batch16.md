# DAT census batch 16 — tops 37 + 57 + 5C + 5F + 74 + 7B + 7E + 7F + 84 + 91

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 16 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 37 | 3 | 21 | 2,990,750 (~2.9 MiB) | .DAT only |
| 57 | 3 | 18 | 2,446,780 (~2.3 MiB) | .DAT only |
| 5C | 9 | 1,217 | 22,669,298 (~21.6 MiB) | .DAT only |
| 5F | 2 | 8 | 716,290 (~0.7 MiB) | .DAT only |
| 74 | 1 | 41 | 35,230,335 (~33.6 MiB) | .DAT only |
| 7B | 1 | 7 | 225,885 (~0.2 MiB) | .DAT only |
| 7E | 2 | 32 | 44,544 (~0.0 MiB) | .DAT only |
| 7F | 7 | 12 | 3,720,175 (~3.5 MiB) | .DAT only |
| 84 | 2 | 8 | 19,747,754 (~18.8 MiB) | .DAT only |
| 91 | 7 | 1,645 | 31,866,042 (~30.4 MiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (37:3, 57:3, 5C:9, 5F:2, 74:1,
  7B:1, 7E:2, 7F:7, 84:2, 91:7).
- All leaves are `.DAT`; no foreign extensions.
- Running census total (batches 1–16, 54 tops): 95,311 DATs / ~3.24 GiB.

## Next batches (21 tops left)

`93`, `97`, `99`, `9A`, `9C`, `9D`, `9E`, `A0`, `A2`, `A3`, `A4`, `A5`, `A8`,
`AE`, `AF` (small tops, one batch), the four `8x` giants (`89`, `8A`, `8B`,
`8C` — own batches with generous timeout), and formalizing the `00`/`01`
swarm samples. Then: leaf-classification pass (headers/magic → table mapping).
