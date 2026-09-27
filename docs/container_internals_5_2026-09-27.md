# Container internals V — lyb table grammar, GTEX fields, .san bytecode census (2026-09-27)

Method: read-only probes + Python struct analysis. No content dumps.

## 1. MapLayout lyb table = 54-entry mixed pointer table (file fully mapped)

File `25/B1/00/00.DAT` (7,068 B) mapped end to end:

- @96–256: five 32-byte string entries = 15-char obfuscated ID + NUL +
  3-char tag + NUL + u16 counter + u16 type (~0x619x) + u64 tail (=2).
  IDs: `1qAlFKocn_c0_wa`, `1uv9Reocn_c0_wa`, `1q0r9Do1l_c0_wa`,
  `3EoJrAo1l0_l0_s`, `3AF0Fno1l_00_00`; tags `bxt/bxt/btm/brt/bxt`.
- @288 params `26 00 36 00 04 00 02 00`: field 2 = **54 = table entry count**
  (table runs @320–532; my first parse overran into record data — corrected).
- Table targets are MIXED records, not just strings: `w_0001` + scene paths
  (`ScreenEnvObjects/Shadow/ShadowObject`, …) alongside float structs
  (0.05, 0.4, 1.8… = placement transforms/scales).
- ID↔path join status: 5 string IDs vs 54 records — IDs are section keys,
  records are per-object rows. Next: parse one full record (@3616) to find
  the ID cross-reference field, then the codec has known plaintext pairs.

## 2. GTEX 32-byte header grammar (6 samples, 4 tops)

| Offset | Content | Reading |
| --- | --- | --- |
| 0–3 | `GTEX` | Tag |
| 4–5 | `01 01` | Version |
| 6–7 | `18 04` / `04 04` / `18 02` | Format/subtype (bpp-pack differs) |
| 8–9 | `02 00` | Constant |
| 10–15 | BE u16 triples | Dims hypothesis: (128,128,1), (64,64,1), (256,256,1) |
| 16–19 | `00 00 00 18` | Constant |
| 20–23 | `00 00 00 40/30` | Full header length (64/48) |
| 24–31 | zeros + `20/40/80` | Block/mip param scaling with format |

Dedup check: the four 41,008-byte GTEX files (tops 75/89/A7/A2) share
byte-identical headers but have 4 DISTINCT SHA-256 hashes — same
format/dims template, different images. No cross-top dedup.

## 3. .san = 14-block structured bytecode (not encrypted)

109 KB stream, tiny dominant alphabet (0x5C ×10,236; 0x12 ×8,806;
0x73 ×7,300; 3,407 zeros — far from uniform-random):

| Motif | Count | Role |
| --- | ---: | --- |
| `73 73 73 5D` | 14 | Top-level record/block headers |
| `1C 1E 1E 12 1D 17` | 1,992 | Separator/terminator |
| `5C 34 12 1E 16` | 1,605 | Op prefix A |
| `5C 30 1C 1E` | 1,767 | Op prefix B |

14 blocks × ~130 micro-ops of small-int bytecode — a compiled script
(dialogue/quest/event bytecode candidate). Next: split the 14 blocks and
catalog op shapes per block.
