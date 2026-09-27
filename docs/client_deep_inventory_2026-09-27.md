# client/ deep inventory — full file/byte census (2026-09-27)

Method: bounded per-subtree recurse (same method as the DAT census).
Metadata only. Complements `docs/install_inventory_2026-09-27.md` (which had
top-level counts only). Grand total: **51,111 files / ~5.47 GiB**.

## Top level

| Subtree | Top dirs | Files | Bytes |
| --- | ---: | ---: | ---: |
| chara | 4 | 37,045 | 4,433,698,512 (~4.13 GiB) |
| cut | 690 | 9,593 | 720,340,590 (~687 MiB) |
| script | 15 | 2,518 | 5,433,903 (~5.2 MiB) |
| sqwt | 6 | 1,127 | 154,503,018 (~147 MiB) |
| vfx | 16 | 828 | 146,857,660 (~140 MiB) |

## chara/ breakdown (models + equipment)

| Dir | Files | Bytes | Note |
| --- | ---: | ---: | --- |
| bgobj | 799 | 544,664,628 (~519 MiB) | Background objects — seasonal decor + fireworks-launcher models live here |
| mon | 3,086 | 845,672,302 (~806 MiB) | Creature models (`m001`… + `equ`/`skl`) |
| pc | 30,462 | 2,817,159,116 (~2.62 GiB) | Player models/gear — largest subtree in the install |
| wep | 2,698 | 226,202,466 (~216 MiB) | Weapons |

## vfx/ breakdown (effects — weather/fireworks relevant)

| Dir | Files | Bytes | Note |
| --- | ---: | ---: | --- |
| abl | 178 | 36,074,392 | Ability effects |
| btl | 24 | 2,088,160 | Battle effects |
| cbi/cft/etc/gl1/gl3/pic/sys | 2–11 each | small | Minor banks |
| gl2 | 40 | 4,174,768 | |
| itm | 63 | 9,628,760 | Item effects |
| kao | 50 | 63,200 | Tiny (overlays?) |
| lib | 118 | 10,550,792 | **Shared lib — hanabi/fireworks banks (`vfx_hanabi1..9`) per model mapping** |
| mgc | 181 | 36,559,080 | Magic effects (largest count) |
| pop | 10 | 1,188,720 | Pop effects |
| wsc | 137 | 43,576,640 | Largest bytes — weather/sky-control candidate; decode priority |

## Decode priorities (gameplay value)

1. `vfx/lib` + `vfx/wsc` (fireworks banks, weather control) + `chara/bgobj`
   seasonal models — the visual half of the weather↔decor matrix.
2. `script/` obfuscated dirs (2,518 files, only 5.4 MiB — cheap to map).
3. `chara/mon` (mob appearances for placement records).
4. `cut/` (690 scenes — quest/cutscene data, large but low systems value).
5. `chara/pc` (2.6 GiB player gear — lowest priority).
