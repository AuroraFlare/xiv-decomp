# client/script/ obfuscated-dir map (2026-09-27)

Method: bounded per-dir recurse. Metadata only (names, counts, sizes).
Total: 15 dirs, 2,518 files (2,517 `.lpb` + 1 `.san`), ~5.4 MiB.

## Directory table (by bytes)

| Dir | Files | Bytes | Avg/file |
| --- | ---: | ---: | ---: |
| tp5rq | 629 | 2,033,042 | ~3.2 KiB |
| n1635q | 179 | 1,841,448 | ~10.3 KiB |
| 729s9 | 991 | 745,150 | ~752 B (most numerous, tiny) |
| 7vxx9w6658p335s | 5 | 167,999 | ~33.6 KiB |
| 61s57qvs | 293 | 159,462 | ~544 B |
| 7vxx9w6 | 139 | 133,244 | ~959 B |
| rq9qpr | 133 | 47,634 | ~358 B |
| 3svpu | 25 | 32,078 | ~1.3 KiB |
| rlrq5x | 10 | 30,634 | ~3.1 KiB |
| 0p635 | 23 | 27,849 | ~1.2 KiB |
| 9s59 | 43 | 17,096 | ~398 B |
| 39x569q9 | 6 | 12,432 | ~2.1 KiB |
| 1q5x | 26 | 59,794 | ~2.3 KiB |
| nvsy6 | 7 | 7,483 | ~1.1 KiB |
| 658p3 | 5 | 4,203 | ~841 B |

## Structural findings

- Names are 4–12 char lowercase alnum — hash-derived (unresolved which hash).
- COMPOSITE namespace proven: `7vxx9w6658p335s` = `7vxx9w6` + `658p3` + `35s`
  (exact concatenation of two sibling dir names + suffix). Deobfuscation must
  handle composite keys, not just atomic hashes.
- Size bimodality: two dirs hold 72% of bytes (tp5rq + n1635q); 729s9 holds
  39% of files at sub-KB sizes (config/flag scripts candidate).
- The single `.san` (108,911 B, `rq9q1797qvs.san` per inventory) is the
  outlier — likely an archive/bundle; header probe is the next step.
- `.lpb` grammar is the decode target; start with the smallest files in
  729s9 (shortest grammar surface).
