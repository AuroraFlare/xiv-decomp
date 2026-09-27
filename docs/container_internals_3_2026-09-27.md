# Container internals III — PWIB size solved, MapLayout stride, rle/sane, mot bank (2026-09-27)

Method: read-only probes + Python crc32/adler recomputation. No content dumps.

## 1. PWIB offset 4–7 = BE u32 total file size (SOLVED, 4/4 exact)

| File | Size | BE u32 @4 | Match |
| --- | ---: | ---: | --- |
| vfx/wsc/0040 | 583,184 | 583,184 | ✓ |
| vfx/lib/0042 | 321,360 | 321,360 | ✓ |
| 61/4E/00/00.DAT | 22,040 | 22,040 | ✓ |
| 61/4E/00/01.DAT | 8,304 | 8,304 | ✓ |

Offset 12–15 stays OPEN: not CRC32 (whole or from-16) and not Adler32
(recomputed, all mismatch). Sub-offset hypothesis tested and WEAKENED:
bytes at BE12 (0x635B0) in wsc/0040 are dense float-like binary with no
section tag. Leading candidates now: payload/data length or chunk count.
Values are BE-small and always < file size (407216, 182096, 176, 112).

## 2. MapLayout record area = 32-byte string entries + SEDBlyb section

File `25/B1/00/00.DAT` @96–320: five 32-byte entries
(`<16-char obfuscated ID>\0<3-char tag>\0<u16 counter><u16 ~0x619x><u64 02>`,
tags `bxt/bxt/btm/brt/bxt`), then at @256 a NEW subtype `SEDBlyb` with
u32 count 8 and u32 0x1A9C = 6,812 = exactly (file size − 256), i.e. the
section-length word. `@288` continues `lyb` + length + stride params
(`26 00 36 00 04 00 02 00`). Open: header counts (1, 6) vs 5 visible
entries — one entry unaccounted (DEF_BLK self-count?); `lyb` record grammar.

## 3. script/ grammars: "rle" blobs + "sane" bundle

- `.lpb` files open with `rle` + params + LE u32 payload length (verified:
  0x38 = 56 payload bytes in a 69-byte file). The two smallest `.lpb`
  (different dirs, same `89qqy5` key fragment) share identical 48-byte
  boilerplate — obfuscated-key naming correlates with content templates.
- `.san` (109 KB) opens with `sane` + version + compressed-looking data:
  a script archive/bundle. Next: entry table walk.

## 4. cut/mot = shared animation bank (3,843 files, not a cutscene)

The one giant `cut/` dir: `c001`–`c010`/`c021`–`c025` character motion sets
(~200–318 files each) + `m041`–`m912` monster/mount sets (1–203 files).
All other 689 scenes hold 1–57 files (scene blob + `DataSet/` tissue of
5-digit numeric files). Pass: scene-blob magic probe per scene is the
next cheap win; mot-bank per-set catalog after.
