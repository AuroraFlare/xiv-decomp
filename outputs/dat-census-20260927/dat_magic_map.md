# DAT magic/content-type map — all 75 tops sampled (2026-09-27)

Method: first 16 bytes of the first 2 `.DAT` files per top (148 samples),
read-only via FileStream. No content decoded beyond magic identification.
Companion to the census (`CENSUS_TOTALS.md`: 137,580 files / 7.42 GiB).

## Magic lexicon (ASCII-decoded)

| Magic (hex) | ASCII | Meaning | Tops sampled |
| --- | --- | --- | --- |
| `53 45 44 42 53 53 43 46` | SEDB SSCF v2/v3 | Square Enix container (dominant: models, scenes, scripts, weather payloads) | 03, 05, 07, 08, 1A, 23, 24, 28, 29, 2A, 33–39, 57, 5B, 5C, 5E–60, 73, 74, 83, 84, 8A, 8C, 8D, 91, 93, 97, 99–9B, 9C–9F, A0, A3–A5, A8, A9, AB–AF, B0 |
| `47 54 45 58` | GTEX | GPU texture blobs | 1C, 75, 79, 89, A2, A7 |
| `56 45 52 53 … 47 54 45 58` | VERS→GTEX | Versioned container wrapping textures | 00, 27 |
| `4D 61 70 4C 61 79 6F 75 74…` | MapLayoutResourc… | MAP LAYOUT resources — zone layout/decor tables | 25, 2B, 72 |
| `53 45 44 42 76 6D 64 6C` | SEDB vmdl | Versioned models (chara/creature) | 5D |
| `53 45 44 42 6D 74 62 00` | SEDB mtb | Material/motion table | 7B |
| `53 45 44 42 50 48 42 00` | SEDB PHB | (Physics/hitbox block — decode open) | 7E |
| `53 45 44 42 52 45 53 20` | SEDB RES | Resource container | 7F, 8B, 92 |
| `50 57 49 42` | PWIB | World/instance binary (Ul'dah top) | 61 |
| `EF BB BF 3C 3F 78 6D 6C` | BOM `<?xml` | Plain XML configs | 15, 27 |
| `D0 CF 11 E0` | OLE2 | OLE compound document | 02 |
| high-entropy, no magic | — | Encrypted/compressed blobs | 01, 0B |
| `83 82 …` | Shift-JIS | Japanese text blobs | 02 (2nd sample) |
| `00 00 00 00 3F …` | — | Headerless/index block | 00 (1st sample) |

## Findings that matter for weather/decor/mobs

- Weather city DATs (top 29: `0x29D9`/`0x29B0`, top 61: `0x615A`) sit in
  SSCF v3 (Limsa/Gridania) vs PWIB (Ul'dah) — the per-city payload difference
  is visible at the container layer, matching the matrix's Gridania-vs-rest
  asymmetry story.
- MapLayoutResource tops (25, 2B, 72 — top 72 alone is 523 MiB) are where
  resident scheduler groups + selector masks live. Priority decode target #1.
- GTEX tops (1C, 75, 79, 89, A2, A7) are pure texture storage — lowest
  decode priority for gameplay systems.
- XML tops (15, 27) are human-readable configs — decode priority #2 (cheap wins).
- Encrypted tops (01, 0B) need key/format research before any decode attempt.
- Tops 04 and 62 confirmed EMPTY again (no samples).

## Next: per-top decode queue (by gameplay value)

1. MapLayoutResource tops 25/2B/72 (decor/scheduler/weather masks).
2. XML tops 15/27 (config semantics).
3. SSCF weather keys in top 29/61 (payload field map).
4. SEDB vmdl/mtb/PHB/RES subtypes (model/material/physics).
5. Encrypted 01/0B (format research). 6. GTEX (texture tooling, lowest).
