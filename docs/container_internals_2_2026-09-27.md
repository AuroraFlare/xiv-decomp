# Container internals II — PWIB envelope, MapLayout codec, model shaders (2026-09-27)

Method: read-only header probes (≤128 bytes) + short-identifier strings scans.
No bulk decode, no content dumps.

## 1. PWIB envelope (vfx banks + Ul'dah top 61)

96-byte headers from `vfx/wsc/0040`, `vfx/lib/0042`, `61/4E/00/00.DAT`,
`61/4E/00/01.DAT`:

| Offset | Content | Meaning |
| --- | --- | --- |
| 0–3 | `PWIB` | Envelope tag |
| 4–7 | varies (`00 08 E6 10`, `00 04 E7 50`, …) | Per-file params (open: flags+codec?) |
| 8–11 | `00 00 00 10` constant | Version/flags |
| 12–15 | varies (`…35 B0`, `…D7 50`, `…00 B0`, `…00 70`) | Per-file checksum-or-params (open) |
| 16+ | nested SEDB chunk | vfx → `SEDB RES `; Ul'dah → `SEDB txb` (texture block) → `GTEX` at ~+80 |
| ~68 (vfx) | `nib` chunk tag | Second chunk type (animation/interp block candidate) |

PWIB = envelope wrapping SEDB chunks. Same parser serves vfx banks and
Ul'dah city/weather DATs. Next: resolve 4–7/12–15 fields (checksum verify by
recompute) and the `nib` chunk grammar.

## 2. MapLayout string table — structure mapped, codec open

Region @80 in tops 25/2B/72: 16 NUL bytes, then NUL-terminated 16-char
obfuscated identifiers + 4-char block tags (`bxt`, `bhp`) + u16 counters:

- 25: `1qAlFKocn_c0_wa`, then `1uv9Reocn_c0_wa` (stable `ocn_c0_wa` suffix)
- 2B: `38gLDNocn_c0_wa`, then `35wymPocn_c0_wa` (same suffix family)
- 72: `15hMuDps0_m0__h`, then `181Bhvps0_m0_at` (shared `ps0_m0_` stem)

Template+suffix shape with per-file stems — same obfuscation convention as
`client/script/` dir names. Codec (XOR/rotate/hash-UID) NOT yet identified:
no constant single-byte XOR or Caesar shift was demonstrated; do not cite
plaintext guesses. Next: collect the full string table per file and test
position-dependent XOR against the layout record section.

## 3. bgobj models = SEDBRES + HLSL shaders + mesh (no seasonal IDs)

`b939` (fireworks launcher) and `b901` model files open with `SEDBRES ` and
embed: `.vpo`/`.fpo` shader refs (`0o_v11_hsy01_1h_000`,
`0o_v12_kado01_1h_000` pattern), full uniform lists (fogParam, PointLight*,
worldMatrix/worldViewProjMatrix, …), `isSkining` + jointMatrices, and the
toolchain stamp `Microsoft (R) HLSL Shader Compiler 9.26.952.2844`
(DirectX Feb-2010 era).

Full-file grep for 15 seasonal tokens (hlw, xmas, santa, pumpkin, ghost,
time_bg, hanabi, starlight, hallow, easter, egg, firework, lantern, tree,
snowman): ZERO hits in both models. Models are dumb geometry+shaders —
seasonal identity comes only from layout/scheduler joins. So `bNNN` seasonal
mapping must be built from the MapLayout record side, never from model bytes.
