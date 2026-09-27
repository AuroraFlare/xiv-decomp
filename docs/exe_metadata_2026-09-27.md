# FFXIV 1.x EXE metadata (lawful read-only inspection)

Scope: `exe-metadata`. Install root (read-only):
`C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`
This file contains metadata only (sizes, versions, hashes, PE headers,
import-table DLL names, keyword-presence fingerprints). No decompiled or
disassembled code is reproduced.

Delivered 2026-09-27 from `/tmp/ff14-staging/exe-metadata/notes.md`
(swarm scope `exe-metadata`) to both repos: hashes pin memory offsets for
FF14-Memory and identify the exact decomp target for FF14-Decomp.

## 1. Files on disk

| File | Size (bytes) | LastWrite (UTC) | FileVersion | ProductVersion / Name | SHA-256 |
|---|---|---|---|---|---|
| ffxivboot.exe | 12961112 | 2010-09-22 20:47:44 | 1.0.00 | (blank) / SQUARE ENIX CO., LTD. | 6A18533D4C3B296CCDEDD84C81A3EB99AE5DDB47C3416DE60E3414983783EFEF |
| ffxivgame.exe | 15996808 | 2012-09-21 00:34:04 | 1.0.00 | (blank) / SQUARE ENIX CO., LTD. | 9341F2B4567440B310A4D494F5CC5599CA334BA51C8042247317FF466492F2E9 |
| ffxivconfig.exe | 3471240 | 2012-09-21 00:34:03 | 1.0.00 | (blank) / SQUARE ENIX CO., LTD. | E7646811ABE7430471E8BE2105B1A9DA9C7596A62D43DC0F382EB3CB3EE2C977 |
| ffxivlogin.exe | 403296 | 2011-03-03 23:14:01 | 2.0.0.106 | 2.0.0.106 / Final Fantasy XIV Login | 5EBCDA2E6B2CE3911DBFF67F361A27720162DAC15AFF01CEFCE814CE4E46A67A |
| ffxivupdater.exe | 640344 | 2010-09-22 20:47:44 | 1.0.00 | (blank) / SQUARE ENIX CO., LTD. | 2E83AE594382E49EC0D41748B6A000E5CD06B8F750BD33FBD7542A7C44B5D836 |

Version-marker files (exact bytes via read-only `Get-Content`):
- `boot.ver` (15 B): `2010.09.18.0000`
- `game.ver` (15 B): `2012.09.19.0001`
- `patch.ver` (5 B): `1.23b`

Method: `Get-Item` length, `[Diagnostics.FileVersionInfo]::GetVersionInfo`,
`Get-FileHash -Algorithm SHA256`. No file was executed or modified.

## 2. PE headers (parsed read-only, no execution)

Both main binaries are 32-bit PE32, x86 (`Machine=0x014C`), 6 sections each.

| EXE | Magic | Linker timestamp (UTC) |
|---|---|---|
| ffxivboot.exe | 0x010B PE32 (32-bit) | 1284637614 = 2010-09-16 11:46:54Z |
| ffxivgame.exe | 0x010B PE32 (32-bit) | 1347381023 = 2012-09-11 16:30:23Z |

ffxivgame.exe section table (name / vsize / vaddr / rawsize / rawptr):
- `.text` 0xB3B56D @0x1000, raw 0xB3C000
- `MSSMIXER` 0x6D @0xB3D000 (Miles Sound System mixer section — audio middleware fingerprint)
- `.rdata` 0x326032 @0xB3E000
- `.data` 0x117940 @0xE65000 (raw 0xBF000, zero-padded bss-style tail)
- `.tls` 0xA9 @0xF7D000
- `.rsrc` 0x1A54C @0xF7E000

No packer section names (no UPX/ASPack stubs); standard-looking MSVC layout.
Implication: static string/import analysis is representative; no unpacking step needed.

## 3. Static import tables (parsed from PE Import Directory, authoritative)

Parsed by walking `IMAGE_IMPORT_DESCRIPTOR`s via section RVA→file-offset
mapping. Order below = descriptor order in the binary.

ffxivboot.exe (18):
KERNEL32.dll, USER32.dll, GDI32.dll, ADVAPI32.dll, SHELL32.dll, ole32.dll,
IMM32.dll, WINMM.dll, WS2_32.dll, d3d9.dll, d3dx9_41.dll, OLEAUT32.dll,
WINHTTP.dll, iphlpapi.dll, VERSION.dll, COMCTL32.dll, DINPUT8.dll, XINPUT1_3.dll

ffxivgame.exe (20 = boot's 18 + WINTRUST.dll + CRYPT32.dll, minus nothing):
KERNEL32.dll, USER32.dll, GDI32.dll, ADVAPI32.dll, SHELL32.dll, ole32.dll,
WINTRUST.dll, CRYPT32.dll, VERSION.dll, IMM32.dll, WINMM.dll, WS2_32.dll,
d3d9.dll, d3dx9_41.dll, WINHTTP.dll, iphlpapi.dll, COMCTL32.dll, DINPUT8.dll,
XINPUT1_3.dll, OLEAUT32.dll

ffxivconfig.exe (11):
KERNEL32.dll, USER32.dll, GDI32.dll, ADVAPI32.dll, SHELL32.dll, ole32.dll,
OLEAUT32.dll, COMCTL32.dll, XINPUT1_3.dll, WINMM.dll, PSAPI.DLL

ffxivlogin.exe (14):
KERNEL32.dll, USER32.dll, GDI32.dll, COMDLG32.dll, WINSPOOL.DRV, ADVAPI32.dll,
SHELL32.dll, COMCTL32.dll, SHLWAPI.dll, oledlg.dll, ole32.dll, OLEAUT32.dll,
urlmon.dll, IPHLPAPI.DLL

ffxivupdater.exe (9):
VERSION.dll, KERNEL32.dll, USER32.dll, ADVAPI32.dll, SHELL32.dll, ole32.dll,
OLEAUT32.dll, COMCTL32.dll, WS2_32.dll

No dumpbin/llvm/objdump present on PATH (all `where.exe` lookups missed), so
the tables above come from the hand-rolled descriptor walk, cross-checked
against a regex string scan.

## 4. String-scan-only DLL names (NOT static imports — dynamic/delay-load or noise)

These matched `*.dll` in a Latin-1 string scan but are absent from the import
directories above; treat as `LoadLibrary`/delay-load candidates or false hits:

- `mscoree.dll` (all 5 EXEs): CLR shim string; suggests a managed-code probe,
  not a static dependency.
- `XAudio2_0.dll` (boot+game strings only): XAudio2 loaded dynamically
  (typical `CoCreateInstance`/explicit load; `CoCreateInstance` string present).
- `NETAPI32.DLL` (boot+game strings only): likely delay-loaded net APIs.
- `nvapi.dll` + `nvapi_QueryInterface` adjacent strings (boot+game):
  NVIDIA API resolved dynamically at runtime; string context shows the
  `nvapi.dll` / `nvapi_QueryInterface` pair, consistent with `LoadLibrary` +
  `GetProcAddress`, but that call sequence was NOT traced (see dynamic plan).
- `OLEACC.dll`, `RICHED20.DLL`, `COMDLG32.dll`, `SHLWAPI.dll`, `urlmon.dll`,
  `oledlg.dll`, `WINSPOOL.DRV`-adjacent UI strings (login/config): standard
  dialog/common-control surface.
- FALSE POSITIVES confirmed by surrounding-bytes inspection (do not record as
  dependencies):
  - `loadall.dll` = Lua `package` default searcher fragment
    (`?.dll;!?.dll;!loadall.dll`, `LUA_PATH`/`LUA_CPATH` nearby) → embedded Lua evidence.
  - `s.dll` = OpenSSL `%s.dll` format fragment inside a `dso_win32.c` path string.

## 5. Middleware / library fingerprints (keyword presence only, ffxivgame.exe)

Present as strings: `Lua` (+`init.lua`, `LUA_PATH`), `FMOD`, `zlib`,
`OpenSSL` (+`crypto/...` source paths), `Direct3DCreate9`, `CoCreateInstance`,
`nvapi_QueryInterface`. Section `MSSMIXER` corroborates Miles Sound System.
Absent: `Bink`, `SpeedTree`, `Havok`, `SQLite`, `PhysX`, `Scaleform`.
Caveat: presence = the token occurs in the binary; it does not prove which
library actually drives audio/rendering (Miles section vs FMOD strings needs
dynamic confirmation). No string payloads beyond short identifiers are quoted here.

## 6. Adjacent (non-Square) files observed read-only

- `Launcher/` holds a third-party `FFXIV Meteor Launcher` (.NET: exe+dll+
  deps.json+runtimeconfig) plus `Crc32.NET.dll`, `ICSharpCode.SharpZipLib.dll`,
  `Servers.xml`, `Settings.json`. `Servers.xml` defines one server entry
  pointing at loopback (private-server tooling; open-source correlation is a
  separate scope's job).
- SECURITY NOTE: `Launcher\Settings.json` contains a stored plaintext
  username/password with `RememberMe:true`. Values are deliberately NOT quoted
  here. Recommend the owner rotate that credential and exclude the file from
  any repo copy.
- Root also contains `client/` (chara/cut/script/sqwt/vfx), `data/` (numbered
  asset dirs), `ffxiv_patches/` (empty at read time), `Windowed-1920.ahk`.

## 7. Lawful dynamic-analysis plan (no decompilation, no cracking)

Principles: observe the running program's *own* behavior with OS tooling;
do not bypass protections, do not patch binaries, do not redistribute code.
1. Baseline (Process Monitor + ETW): launch via the Meteor launcher against
   loopback; capture file/registry/network events. Confirm which §4 DLL names
   are really `LoadLibrary`'d and which directories the game reads (`data/`,
   `client/`).
2. Import/behavior confirmation (Dependencies.exe / API Monitor, read-only):
   snapshot loaded modules at the title screen vs in-world; resolve
   XAudio2/nvapi/mscoree/NETAPI32 as loaded-or-not per state.
3. Network observation (Wireshark/loopback capture + private-server logs):
   record ports/hosts the client contacts; correlate with WINHTTP/WS2_32
   imports. Server side is the operator's own Meteor instance.
4. Audio/render path (no hooks into game code): toggle in-game audio settings
   and GPU vendor (NVIDIA vs other) and watch module loads — decides
   Miles-vs-FMOD and nvapi-optional questions from §5.
5. Memory observation for FF14-Memory (documented offsets only): use
   Cheat Engine / WinDbg *read-only* scans to locate weather/time/NPC values
   already known from the open-source Meteor server structs; record
   addresses as version-pinned notes (game 2012.09.19.0001), never dump code.
6. Hygiene: keep dynamic notes keyed by the SHA-256 hashes in §1; any binary
   update invalidates offsets. Never commit `Settings.json` or memory dumps
   containing credentials.

## 8. Evidence log (every claim inspected, not search-only)

- §1 sizes/dates: `Get-ChildItem` of install root (this session).
- §1 versions/company: `[FileVersionInfo]::GetVersionInfo` per EXE.
- §1 hashes: `Get-FileHash -Algorithm SHA256` per EXE.
- §1 ver strings: `Get-Content` of `boot.ver`/`game.ver`/`patch.ver`.
- §2: PE header parse (`e_lfanew`, Machine, section count, timestamp, magic).
- §3: `IMAGE_IMPORT_DESCRIPTOR` walk (authoritative DLL lists).
- §4: Latin-1 regex `*.dll` scan + surrounding-byte context for
  `loadall.dll`/`s.dll`/`nvapi.dll`.
- §5: section-name dump + case-insensitive keyword presence checks.
- §6: `Get-ChildItem` of `client/`, `Launcher/`, `data/`, `ffxiv_patches/`;
  `Get-Content` of `Servers.xml`/`Settings.json` (credentials withheld).
