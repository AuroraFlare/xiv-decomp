# Decomp coverage plan — toward 100% (lawful maximum)

Date: 2026-09-27. This is the honest answer to "decomp to 100%": a literal
verbatim republication of the game binaries is not lawful, so 100% here means
**every install surface inventoried, analyzed, and published as findings**
(metadata, structure notes, open-source correlations, mappings) — never raw
code/data dumps. Prior Ghidra work (`ffxivgame.exe.c`, 9MB) stays local-only
and is cited, not extended as verbatim dumps.

## 1. Corpus baseline (counted this session)

- FF14-Decomp: 142 doc files + 60 output dirs (quests, seasonal, weather,
  city schedulers, animations, transistors).
- FF14-Memory: 486 doc files + 804 `Dat Mining` CSVs (sheet decodes).
- Install (1.x pre-SqPack, `2012.09.19.0001` / 1.23b): 5 EXEs hashed + PE/import
  analysis (`exe_metadata_2026-09-27.md`); top-level + `client/` + `data/`
  structure inventoried (`install_inventory_2026-09-27.md`).
- Weather/decor/mob: per-city matrix, Meteor lineage, 6 guide-based placements
  delivered 2026-09-27.

## 2. Surface inventory with coverage state

| Surface | Size/shape | State |
| --- | --- | --- |
| ffxivgame.exe | 16MB, PE32, .text 11MB | Metadata + imports + Ghidra C (local) DONE; per-system write-ups ongoing |
| ffxivboot.exe | 13MB | Metadata + imports DONE; no Ghidra export yet |
| ffxivconfig/login/updater | 0.4–3.5MB | Metadata + imports DONE; no Ghidra export yet |
| data/ hex tree | 75 tops, 1,344 L2, `XX/YY/00/NN.DAT` | Structure + 3 subtree samples DONE; per-top leaf census OPEN |
| data/29, data/61 | Weather/city DATs (0x29D9/0x29B0/0x615A) | Deep coverage DONE (weather/decor atlases) |
| RegionResourceData etc. | Binding tables | Decoded + documented DONE |
| client/chara | bgobj 94, mon 97, pc 17, wep 112 | Entry counts DONE; per-model notes partial |
| client/cut | 690 scene dirs | Count + 1 sample DONE; per-scene notes OPEN |
| client/script | 15 obfuscated dirs + lpb/san | Counts DONE; deobfuscation mapping OPEN |
| client/sqwt | 6 widget dirs | Tree DONE; widget/decomp notes partial |
| client/vfx | 16 dirs, numeric files | Tree + 1 sample DONE; per-group notes partial |
| Launcher (Meteor) | .NET 6, 8 files | Inventory DONE (credential redacted, never commit Settings.json) |

## 3. Work units to 100% findings coverage

1. **Per-top DAT leaf census** (75 units): bounded `data/XX` file counts +
   size histograms, one top per batch; publish as `outputs/dat-census-*/`.
   No full-tree blast; tops are independent work units for parallel agents.
2. **Leaf classification**: map each top's DATs to known tables (layout,
   weather, script, model, vfx) via headers/magic + existing 804-sheet decodes;
   new tables get their own decode notes.
3. **client/script deobfuscation map**: correlate obfuscated dir names to
   content hashes/functions; publish mapping, not script bodies.
4. **client/cut + vfx catalogs**: per-scene/per-group index rows (IDs, sizes,
   cross-refs to quests/weather), same shape as the bgobj lineage doc.
5. **Remaining EXEs**: local Ghidra analysis for boot/config/login/updater
   with findings-only publication (import/behavior notes like §3-§5 of the
   exe metadata doc).
6. **Cross-surface xrefs**: every finding links DAT key ↔ sheet row ↔ server
   struct ↔ doc (the `xrefs/` staging schema is the template).

## 4. Rules (unchanged)

- Metadata/findings only in repos; no binary dumps, no decompiled function
  bodies beyond fair-use snippets with justification.
- Every claim cites an inspected body (file + method), or is marked unresolved.
- Version-pin everything to `game.ver 2012.09.19.0001` + SHA-256; a binary
  update invalidates offsets.
- Never commit `Launcher/Settings.json` (plaintext credential — owner should
  rotate it) or memory dumps.
