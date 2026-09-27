# Container internals IV — PWIB solved, lyb paths, cut PWIB + mot (2026-09-27)

Method: read-only probes + arithmetic verification. No content dumps.

## 1. PWIB fully solved (20+4 samples)

| Offset | Field | Rule |
| --- | --- | --- |
| 0–3 | `PWIB` | Envelope tag |
| 4–7 | BE u32 | Total file size (24/24 exact incl. 20 cut blobs) |
| 8–11 | `00 00 00 10` | Constant version/flags |
| 12–15 | BE u32 | **Primary-chunk end offset** (header-run length) |
| 16+ | nested SEDB chunk(s) | `RES` (vfx/cut), `txb→GTEX` (textures), `nib` (vfx 2nd chunk) |

Proof for 12–15: file `61/4E/00/01.DAT` (8,304 B) reads 112 =
16 (PWIB hdr) + 64 (SEDB txb hdr) + 32 (GTEX hdr); bytes @112+ are
pixel payload (verified by dump). Sibling `00.DAT` reads 176 = 16+64+96
(bigger GTEX header: mip-count field `08` vs `01`). Cut blobs usually read
size (single chunk to EOF); three exceptions fit the same rule with trailing
data (alc30610: −128 B; arc20030: −142,688 B; arc30025: −262,144 B exactly).
vfx `wsc/0040`: primary RES chunk 407,216 of 583,184 bytes.

## 2. lyb section = u32 offset table → plaintext scene paths

- Table confirmed extending past @512 (values ascending, all < file size).
- First target (0x0E20 = 3616): `w_0001\0ScreenEnvObjects/Shadow/
  ShadowObject\0ColorCorrection_0001…` — PLAINTEXT scene-graph paths.
- Decoder bridge: the 32-byte string-table entries (obfuscated 16-char IDs)
  and these plaintext paths describe the SAME entities — the ID↔path join
  is the key to cracking the obfuscation codec. Next: enumerate all table
  targets and pair each with its string-table entry.

## 3. cut/ = PWIB scene blobs + DataSet tissue + mot bank

- All 20 sampled scene blobs are PWIB (naming `alcNNNNN`/`arcNNNNN`, sizes
  30 KiB–1.2 MiB). PWIB is the universal envelope: vfx, textures, cutscenes,
  Ul'dah DATs.
- Per-scene `DataSet/` tissue: 5-digit numeric files, bytes-to-hundreds of
  bytes (params/flags per scene).
- `cut/mot` (3,843 files) = shared animation bank: `c001`–`c010`/`c021`–`c025`
  character motion sets + `m041`–`m912` monster/mount sets.

## 4. .san = bytecode stream (entry-table hypothesis REJECTED)

`sane` + version, then dense motif-structured stream
(`1C 1E 1E 12 1D 17` separators, `73 73 73 5D 9X` record headers) — a
compiled script bytecode, not an entry-tabled archive. Next: opcode-motif
catalog from the 109 KiB stream.
