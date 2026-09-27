# MapLayout + sheet-system internals (tops 25/2B/72, 15/27) — 2026-09-27

Method: read-only header probes (first 128 bytes) + full reads of tiny
human-readable configs (≤485 bytes). No bulk decode, no content dumps.

## 1. MapLayoutResourceData v1.1.0 header (tops 25/2B/72)

Identical 128-byte skeleton in all three sampled files:

| Offset | Bytes | Meaning |
| --- | --- | --- |
| 0–23 | `MapLayoutResourceData` + NUL pad | Format tag |
| 24–31 | `1.1.0` + NUL pad | Version string |
| 32–35 | u32: 1 (25/2B), 5824 (72) | Primary count/size — scales with file |
| 36–39 | u32: 6 (25/2B), 180 (72) | Secondary count — scales with file |
| 40–63 | zeros | Reserved |
| 64–71 | `DEF_BLK` + pad | Default-block section tag |
| ~88–103 | 16 obfuscated ASCII chars | Encoded string-table entry (same shape all three; `…c0…` fragment in 25/2B) |
| 104+ | binary records | Layout records (scheduler/mask tables live here — decode open) |

Top 72 (523 MiB of MapLayout) is the layout/decor motherlode: the resident
scheduler groups + weather selector masks from the decor atlases live inside
these records. Next step: map the record stride and the string-table codec
(XOR/rotate candidate — same-length outputs, partial plaintext fragments).

## 2. SSD sheet-definition XMLs (tops 15/27) — the sheet Rosetta Stone

Tops 15 (9 files) / 27 (173 files) hold `<ssd version="0.1">` descriptors —
the schema registry for the sheet system the 804 Dat Mining CSVs decode.

- `27/95/00/00.DAT` (293 B): sheet index — `xtx/_text_error`, `xtx/_text_ui`,
  `_text_error_type`, `key_config`, each with an `infofile` numeric ID.
- `15/AF/00/00.DAT` (485 B): full sheet def — name, `mode="client"`,
  `column_max/count`, typed columns (`str`, `bool`, `float`), index params,
  and a `<block count><file begin/count/offset/enable>` physical mapping.
- Scalar leaves: 3-byte (`01 00 00`), 8-byte (`01 00 00 00 0A 00 00 00`)
  single values/flags.
- `27/D9/*` 220-byte fixed records: 55 × 4-byte `(counter:u16, 0x5B2D:u16)`
  pairs — index/lookup tables.

Decode queue: enumerate all SSD sheet names → join each to its infofile ID →
targeted sheet decodes (priority: layout/weather/scheduler-related sheets).
