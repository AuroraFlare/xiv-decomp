# DAT census batch 1 — tops 29 + 61 (weather/city DATs)

Date: 2026-09-27. Method: bounded per-top recurse (`Get-ChildItem -Recurse
-File` on one top dir each). Metadata only: counts, sizes, extensions.
Work unit 1 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 29 | 11 | 126 | 58,344,878 (~55.6 MiB) | .DAT only |
| 61 | 89 | 1,170 | 201,277,766 (~191.9 MiB) | .DAT only |

## Why these tops first

- Top `29` holds the Limsa (`0x29D9…`) and Gridania (`0x29B0…`) city/weather
  DAT keys cited across the weather/decor atlases (8027/8029/8032 payloads,
  8070/8071 overlay keys `0x29D90030/31`, `0x29B00030/31`).
- Top `61` holds the Ul'dah (`0x615A…`) city/weather keys (`0x615A001D/22/23`,
  overlay `0x615A0030/31`).

## Cross-checks

- L2 counts match the install inventory scan (29:11, 61:89).
- All leaves are `.DAT`; no foreign extensions in either top.
- Combined 1,296 DATs / ~247.6 MiB for the two city-weather tops.

## Next batches (suggested order, one top per batch)

`5E` (57 L2), `83` (45), `9F` (41), `AD` (39), `36` (38), `72`/`73` (38 each),
then remaining tops by descending L2 count. Each batch: counts + histogram +
known-table mapping; new tables get decode notes, never raw dumps.
