# FFXIV Install Inventory (read-only, bounded scans)

- Root: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`
- Date observed: 2026-09-27 (UTC)
- Method: non-recursive top-level listings + one-level-per-dir counts + two small
  subtree samples (`data\00`, `data\01`, Depth 3). No full-tree recursive scan.
- Build identity: `boot.ver` = `2010.09.18.0000`, `game.ver` = `2012.09.19.0001`,
  `patch.ver` = `1.23b`. This is the legacy FFXIV 1.x (pre-ARR) layout:
  `client\` + `data\` + `Launcher\`, NOT the modern `game\`/`boot\` layout.
  `Test-Path game` = False, `Test-Path boot` = False (both absent).

## 1. Top level

| Name | Type | Size (bytes) |
|---|---|---|
| client | dir | — |
| data | dir | — |
| ffxiv_patches | dir (empty, 0 entries) | — |
| Launcher | dir (Project Meteor custom launcher) | — |
| boot.ver | file | 15 |
| ffxivboot.exe | file | 12,961,112 |
| ffxivconfig.exe | file | 3,471,240 |
| ffxivgame.exe | file | 15,996,808 |
| ffxivlogin.exe | file | 403,296 |
| ffxivupdater.exe | file | 640,344 |
| game.ver | file | 15 |
| patch.ver | file | 5 |
| Windowed-1920.ahk | file (AHK borderless-window helper, 4 lines) | 161 |

- Top-level EXE total: 5 files, 33,472,800 bytes (~31.9 MiB).
- No `*.sqpack` at top level (checked with `-Filter *.sqpack`, 0 hits).

## 2. `data\` — legacy hex-tree of `.DAT` files (no SqPack)

- Level-1 dirs: 75, hex-ish names:
  `00 01 02 03 04 05 07 08 0B 15 1A 1C 23 24 25 27 28 29 2A 2B 33 34 35 36 37 39 57 5B 5C 5D 5E 5F 60 61 62 72 73 74 75 79 7B 7E 7F 83 84 89 8A 8B 8C 8D 91 92 93 97 99 9A 9B 9C 9D 9E 9F A0 A2 A3 A4 A5 A7 A8 A9 AB AC AD AE AF B0`
- Zero files directly under any `data\XX` (all 75 counts = 0 files).
- Layout is 3 levels: `data\XX\YY\00\NN.DAT`.
  - Level-2 total across all 75 tops: 1,344 dirs (per-dir counts 1–130;
    largest: `8B`=130, `8C`=113, `89`=96, `61`=89, `8A`=80; see scan table below).
  - Spot-checked L2 nodes each contain a single `00` dir
    (`00\0B`, `00\0C`, `8B\09` verified).
  - Leaf files are `*.DAT` only: `data\00` subtree grouped by extension = 18 × `.DAT`, nothing else.
  - No `*.sqpack` under `data\00` (Depth-2 filter scan, 0 hits). Consistent with
    1.x pre-SqPack packaging.
- Subtree samples (Depth-3 file recurse, bounded to one top dir each):
  - `data\00`: 18 files, 32,980,443 bytes. Mix of tiny 4-byte stub DATs
    (`1B\00\00.DAT`–`07.DAT`), ~6–82 KB configs, and multi-MB blobs
    (e.g. `00\0C\00\01.DAT` = 16,674,822; `02.DAT` = 14,116,294).
  - `data\01`: 1,482 files, 9,701,935 bytes (many small files; L2 = `03`, `13`).
  - `data\8B\09\00`: 23 DATs sampled with sizes 26 KB–1.2 MB
    (e.g. `55.DAT` = 1,217,312; `AC.DAT` = 1,212,956; `52.DAT` = 1,015,328).
- Full per-top L2 counts (from bounded one-level scan):
  `00:4 01:2 02:2 03:8 04:5 05:1 07:2 08:1 0B:1 15:3 1A:4 1C:18 23:1 24:2 25:1 27:2 28:12 29:11 2A:6 2B:3 33:5 34:2 35:2 36:38 37:3 39:5 57:3 5B:29 5C:9 5D:30 5E:57 5F:2 60:26 61:89 62:20 72:38 73:38 74:1 75:29 79:16 7B:1 7E:2 7F:7 83:45 84:2 89:96 8A:80 8B:130 8C:113 8D:6 91:7 92:35 93:1 97:10 99:10 9A:9 9B:5 9C:13 9D:7 9E:3 9F:41 A0:13 A2:2 A3:11 A4:1 A5:8 A7:21 A8:13 A9:32 AB:23 AC:5 AD:39 AE:7 AF:3 B0:12`

## 3. `client\` — loose asset tree

| Subdir | Contents (bounded, top level only) |
|---|---|
| chara | 4 dirs: `bgobj` (94 entries), `mon` (97 entries: `cmn`, `m001`…), `pc` (17 entries: `c001`…), `wep` (112 entries: `w002`…) |
| cut | 690 scene dirs (`alc20010`…); sample `alc20010\` holds a `DataSet\` dir + one extensionless 754,080-byte blob |
| script | 15 dirs (obfuscated names: `0p635`, `39x569q9`…) + 4 files (`*.le.lpb`, 467–3,522 bytes; `rq9q1797qvs.san`, 108,911 bytes) |
| sqwt | 6 dirs: `boot`, `common`, `common_c`, `system`, `widget`, `widget_c` (UI/SqWT widget tree) |
| vfx | 16 dirs: `abl btl cbi cft etc gl1 gl2 gl3 itm kao lib mgc pic pop sys wsc`; sample `vfx\abl\` holds extensionless numeric files (`0501`…`0510`…) |
| chara\mon\m001 | `equ\`, `skl\` subdirs (equipment/skeleton) |

## 4. `Launcher\` — FFXIV Meteor Launcher (.NET 6)

| File | Size (bytes) |
|---|---|
| Crc32.NET.dll | 7,680 |
| FFXIV Meteor Launcher.deps.json | 1,589 |
| FFXIV Meteor Launcher.dll | 708,608 |
| FFXIV Meteor Launcher.exe | 226,816 |
| FFXIV Meteor Launcher.runtimeconfig.json | 372 |
| ICSharpCode.SharpZipLib.dll | 204,800 |
| Servers.xml | 245 |
| Settings.json | 226 |

- Launcher total: 8 files, 1,150,336 bytes.
- `runtimeconfig.json` body inspected: targets `net6.0`
  (`Microsoft.NETCore.App 6.0.0` + `Microsoft.WindowsDesktop.App 6.0.0`).
- `Servers.xml` body inspected: single server entry `Ridill XIV`
  (Address 127.0.0.1 with local login URL).
- `Settings.json` body inspected: install location, default server `Ridill XIV`,
  `WindowedFullscreen: true`, stored username + `RememberMe: true`.
  Contains a stored credential — value REDACTED here, do not copy to repo docs.
- `ffxiv_patches\`: empty (0 entries).

## 5. Delivery note

Delivered 2026-09-27 from `/tmp/ff14-staging/install-inventory/inventory.md`
(swarm scope `install-inventory`).
Lawfulness: metadata, counts, sizes, and structure notes only. No decompiled or
game-file bytes reproduced. Credential from `Settings.json` redacted.

## 6. Gaps / not scanned (by design)

- No full recursive file count or byte total for `data\` (would be a root blast;
  per-scope only L2 counts + two subtree samples taken).
- No binary parsing of `.DAT`, `.lpb`, `.san`, or extensionless client blobs.
- `.deps.json` body not transcribed (only size recorded); trivially re-readable.
