# DAT census totals — COMPLETE 75/75 tops (2026-09-27)

Install: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`
Build: `game.ver 2012.09.19.0001` / `patch.ver 1.23b`.
Method: 19 bounded per-top recurses (batches 1–19, this directory). Metadata
only: counts, sizes, extensions. No file content was read for the census.

## Grand total

- Tops censused: 75/75 (100%)
- Leaf files: 137,580 (137,578 `.DAT` + 2 operator backups, see below)
- Bytes: 7,966,988,039 (~7.42 GiB)

## Per-batch subtotals

| Batch | Tops | Files | Bytes |
| --- | --- | ---: | ---: |
| 1 | 29, 61 | 1,296 | 259,622,644 |
| 2 | 5E, 83 | 13,849 | 284,760,418 |
| 3 | 9F, AD | 3,588 | 176,674,998 |
| 4 | 36, 72 | 13,628 | 699,170,654 |
| 5 | 73, 92 | 8,214 | 295,214,648 |
| 6 | A9, 5D | 4,264 | 115,768,662 |
| 7 | 5B, 75 | 5,082 | 297,578,923 |
| 8 | 60, AB | 8,654 | 156,665,017 |
| 9 | A7, 62 | 2,109 | 65,281,468 |
| 10 | 1C, 79 | 10,368 | 118,813,217 |
| 11 | 28, B0 | 1,013 | 132,811,882 |
| 12 | 2A, 8D, 2B | 2,213 | 91,763,461 |
| 13 | 33, 39, 04 | 1,518 | 85,515,508 |
| 14 | AC, 9B, 1A, 15, 34, 35 | 1,480 | 57,436,668 |
| 15 | 02, 03, 05, 07, 08, 0B, 23, 24, 25, 27 | 15,026 | 424,107,414 |
| 16 | 37, 57, 5C, 5F, 74, 7B, 7E, 7F, 84, 91 | 3,009 | 119,657,853 |
| 17 | 93, 97, 99, 9A, 9C, 9D, 9E, A0, A2, A3, A4, A5, A8, AE, AF | 10,513 | 223,942,499 |
| 18 | 00, 01, 89 | 16,251 | 1,762,596,205 |
| 19 | 8A, 8B, 8C | 15,505 | 2,599,605,900 |
| Total | 75 | 137,580 | 7,966,988,039 |

## Records

- Largest top: 8A (1.83 GiB). Densest top: 03 (11,077 files).
- Chunkiest mean: 07 (~532 KiB/file). Smallest non-empty: A4 (1 file).
- Empty tops (skeleton only, 0 files): 62, 04.
- Foreign (non-game, operator) files: 2 — top 01
  `.unused-dow-dom-backup-20260531-113739`, top 8A `.bak-05-12-26`.
  Contents never inspected; owner to confirm disposition.

## What "100%" means from here

The census proves WHERE every byte is. The next pass is leaf-classification
(headers/magic → known-table mapping: layouts, weather, scripts, models,
vfx), producing decode notes per table — never raw dumps. See
`docs/decomp_coverage_plan_2026-09-27.md` work units 2–6.
