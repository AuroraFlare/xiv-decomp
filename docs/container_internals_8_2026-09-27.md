# Container internals VIII — codec verdict, vfx record grammar, .san ops (2026-09-27)

Method: read-only probes + Python analysis. No content dumps.

## 1. Codec verdict: file-local salted UIDs, NOT content hashes

Same-position entries across two layout files share template suffixes but
differ in prefix: file 25 `@96` = `1qAlFKocn_c0_wa` vs file 2B `@96` =
`38gLDNocn_c0_wa`; `@128`: `…ocn_c0_wa` both; `@160`: `…_c0_wa` both;
`@192`: `…_l0_s` both; `@224`: `…_00_00` both. The 72 file uses different
stems (`ps0_m0_…`, `ps0_00_…`) with a longer table (13+ entries).

Content-derived hashes would match-or-differ wholesale; template-same,
prefix-different = per-file UID generator over a template. The ID→record
join therefore runs through record bodies embedding these IDs, not through
hash equality. Next: search lyb record bytes for the 5 known ID substrings
(@96–224) to find the referencing field.

## 2. Universal vfx record grammar (all 16 banks)

Every bank shows a FIXED 8–9-tag suffix with IDENTICAL per-tag counts —
each effect record = ordered sub-chunks CRST, CATT, CCPT, CACT, CDPT,
CTRK, CBKT, CCNT (+CBIS in most banks). Record counts per bank: wsc 411,
mgc 349, abl 359, itm 180, lib 133, kao 50, gl2 40, btl 24, pop 10 …
CRES/RES/CBLK are outer containers (higher counts). Bank-specific tags:
UUUU (abl), ZI (btl), DG (cft), PTU/PPT (gl1). Next: per-tag payload
grammars, starting with CRES (it carries the `schedul` field).

## 3. .san op census (1,992 separators)

| Head after separator | Count | Share | Reading |
| --- | ---: | ---: | --- |
| `5C 34 12 1E` | 1,603 | 80% | Default op (+ operands) |
| `73 73 73 XX` | ~330 | 17% | Inline literal runs (4th byte = length/kind: 2b/00/2d/07/…) |
| `5C 20 0A 00` | 52 | 3% | Secondary op |
| other | ~7 | <1% | Rare/immediate forms |

Bytecode ≈ one dominant op + literal runs + one secondary op — close to a
disassembler: next is operand-length resolution per head.
