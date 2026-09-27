# vfx + bgobj catalog — weather/fireworks/decor visuals (2026-09-27)

Method: bounded listings + 16-byte header probes. Metadata only.

## vfx/ banks (828 files / 147 MiB, flat numeric names, no extensions)

| Bank | Files | Largest | Note |
| --- | ---: | --- | --- |
| wsc | 137 | 0040 (583 KiB) | Weather/sky-control bank; dense 10xx cluster (440–490 KiB each) |
| lib | 118 | 0042 (321 KiB) | Shared lib — hanabi/fireworks banks (`vfx_hanabi1..9`) |
| mgc | 181 | 0677 (504 KiB) | Magic effects, 05xx/06xx/07xx/10xx numbering |
| abl | 178 | — | Ability effects |
| itm | 63 | — | Item effects |
| kao | 50 | 63 KiB total | Tiny overlays |
| gl2 | 40 | — | |
| btl/pop/etc | ≤24 each | small | Minor banks |

Magic: sampled `wsc/0040`, `wsc/1047`, `lib/0042` all open with `PWIB`
(`50 57 49 42`) — the SAME container as Ul'dah top 61 DATs. PWIB is the
shared effect/world-binary container; Ul'dah's city/weather payloads and
the vfx banks share the format (cross-decode leverage: one PWIB parser
serves both).

## chara/bgobj/ (799 files / 545 MiB, 94 model dirs `b001`–`b998` + `cmn`)

Richest dirs: `b901` (79 files), `b936` (49), `b984` (46), `b982` (28),
`b983` (26). Standard layout per model: `equ/eNNN/top_mdl/` +
`top_tex1/` + `top_tex2/` + `skl/` (skeleton).

Fireworks-launcher confirmation: `b939/equ/e001/` exists with model
(134,144 B) + two textures (131,960 / 525,128 B) + `e002` variant +
6,000 B skeleton — exactly the independent garlemald mapping
(b939/e001 = fireworks launcher, Moonfire Faire). Combined with the
`vfx/lib` hanabi banks and the `MapObjFireworks` server lane, the
Moonfire visual chain is now traced end to end: weather ID 8029 →
hanabi banks → launcher model → sky effect.

## Decode queue

1. PWIB container spec (serves vfx banks + Ul'dah DATs together).
2. bgobj seasonal-model identification (which `bNNN` = Halloween/Starlight
   props — join against the 60 scheduler-group names).
3. wsc 10xx-cluster semantics (weather-state effects).
