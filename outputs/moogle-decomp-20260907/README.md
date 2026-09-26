# Thornmarch evidence bundle

See `docs/thornmarch-retail-research-2026-09-07.md` for observations, implemented
behavior, references, validation and confidence boundaries.

From the repository root:

```powershell
python tools/build_moogle_decomp.py --lua-jar '.codex-tmp/Sapphire-speed-audit/src/tools/quest_parser/unluac_2015_06_13.jar'
.codex-video-tools\Scripts\python.exe tools/build_moogle_video_evidence.py
```

The first command reads the installed 1.23b DATs, retained typed CSVs and eleven
previously extracted client Lua chunks. It requires the already-present unluac
JAR and Java; omit `--lua-jar` to reproduce only command and action-bank evidence.
Use `--client-root`, `--luac-root` or `--output` to select other local paths.
Output must remain in a dedicated repository `outputs` subdirectory.

The second command reads the already-retained 1280x720 recording at
`.codex-moogle-footage/moogle.f136.mp4`. It requires OpenCV, available in that venv.
It has no download step. Video extracts are locally reproducible and ignored by Git.

| File | Contents |
|---|---|
| `commands.json` | 28 command IDs, 56 verified typed rows, raw bytes, offsets, field schema, source hashes |
| `action_manifest.json` | 47 installed action-bank paths, sizes and hashes |
| `action_summary.json` | Resource/clip counts, decoded motion durations and effect references |
| `action_diagnostics.json` | Parse diagnostics; empty on the successful run |
| `cmn_*.json`, `emp_*.json` | Per-bank decoded scheduler and resource evidence |
| `lua_manifest.json`, `lua/` | Input/tool/output hashes and freshly decompiled retained client class stubs |
| `footage_manifest.json` | Original local video hash, dimensions, FPS and extraction positions |
| `footage-*.jpg` | Selected overview and log crops; video time is not encounter time |

The scripts write derived output only. They do not modify installed client files,
start the server, connect a database or recover original server-side AI.
