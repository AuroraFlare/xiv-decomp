# DAT census batch 18 — tops 00 + 01 + 89

Date: 2026-09-27. Method: bounded per-top recurse. Metadata only.
Work unit 18 of the coverage plan (`docs/decomp_coverage_plan_2026-09-27.md`).

## Results

| Top | L2 dirs | Leaf files | Bytes | Extensions |
| --- | ---: | ---: | ---: | --- |
| 00 | 4 | 18 | 32,980,443 (~31.5 MiB) | .DAT only |
| 01 | 2 | 1,482 | 9,701,935 (~9.3 MiB) | .DAT ×1481 + 1 foreign file (see below) |
| 89 | 96 | 14,751 | 1,719,913,827 (~1.60 GiB) | .DAT only |

## Cross-checks

- L2 counts match the install inventory scan (00:4, 01:2, 89:96).
- Tops 00/01 recounts exactly confirm the swarm's earlier samples (00: 18
  files / 32,980,443 bytes; 01: 1,482 files / 9,701,935 bytes).
- FIRST FOREIGN EXTENSION IN THE CENSUS: top 01 contains one
  `.unused-dow-dom-backup-20260531-113739` file (operator backup from May
  2026, not game content). Content not inspected; flagged for the owner to
  confirm it is safe to ignore. All other 122,074 censused leaves are `.DAT`.
- Top 89 is the first GB-scale top (1.60 GiB, ~117 KiB mean).
- Running census total (batches 1–18, 72 tops): 122,075 files / ~5.21 GiB.

## Next: final 3 tops

`8A` (80 L2), `8B` (130 L2, largest), `8C` (113 L2) — own batch with generous
timeout. Then the census is COMPLETE at 75/75 and leaf-classification begins.
