# Container internals VII — codec hash tests, SCB tags, .san entropy map (2026-09-27)

Method: read-only probes + Python analysis. No content dumps.

## 1. Obfuscation codec: hash-render hypothesis TESTED, not confirmed

Tested pool paths/IDs (`w_0001`, `ScreenEnvObjects/…`, …) against CRC32,
DJB2, FNV-1a, MD5, SHA-1: no digest (hex prefix or otherwise) matches any
substring of the 5 obfuscated IDs. Verdict: NOT a plain standard-hash hex
rendering.

New structural facts constraining the next attack:

- Fixed 15-char length; restricted 24-symbol alphabet
  (`0139ADEFJKR_acelnoqrsuvw`) — missing most letters, so not standard
  base32/64; consistent with a custom hash-name generator.
- Suffix families: `ocn_c0_wa` ×2, `_c0_wa`, `_l0_s`, `_00_00` — shared
  6–8-char tails suggest ECB-style block structure (identical plaintext
  block → identical tail) with post-encryption custom rendering.
- Decisive next test: compare IDs for the SAME entity across DIFFERENT
  MapLayout files — identical means content-derived hash, different means
  salted/file-local UID. (Requires parsing a second layout file's table.)

## 2. SCB chunk = @-tagged stream with `schedul` plaintext

`wsc/0040` @172: `SEDBSCB\0` + counts, then `@CRST`, `@CRES`, `@CATT`
tagged records with u16/u32 count fields — and ASCII `schedul` inside the
CRES record. The vfx SCB chunk carries scheduler-adjacent data: another
concrete vfx↔scheduler link (with the hanabi banks + `MapObjFireworks`
lane). Next: `@`-tag inventory across all vfx banks + CRES record grammar.

## 3. .san body = uniform low-entropy bytecode (108,350 B)

14 windows @8 KiB: entropy 4.45–5.08 bits/byte (structured; compressed or
encrypted data would read ~8.0), zero `00 00 00 00` runs, and the prologue
motifs continue throughout (`737373` ×1,647, separators ×1,964 in-body).
No embedded high-entropy spans → no compressed assets inside; the whole
file is one dense small-int bytecode. Next: op-boundary segmentation using
the `5C 30`/`5C 34` prefixes (2,605+ in-body hits) as candidate op starts.
