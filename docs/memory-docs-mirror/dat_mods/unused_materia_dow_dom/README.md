# Unused DoW/DoM Materia Patch

This patch turns a small set of unused combat materia into server-backed DoW/DoM utility materia while leaving the remaining unused names open for later balancing.

## Client DATs

The stock client points the unused materia item records at materia row `56`, which is `Chocobo Down` / `Heavy Resistance`. That is why the unused items show `Heavy Resistance: +1` and only the feet icon as meldable.

Touched files:

| File | Purpose |
| --- | --- |
| `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\01\03\05\83.DAT` | materia stat rows, 142 bytes per row |
| `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\01\03\05\84.DAT` | materia logical row ranges |
| `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\01\03\05\85.DAT` | materia logical row end offsets |
| `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\01\03\05\89.DAT` | itemData rows for materia items, 95 bytes per row |

Patch tools:

| Tool | Purpose |
| --- | --- |
| `tools\materia\patch_unused_dow_dom_materia.py --apply` | backs up and patches the client DATs |
| `tools\materia\patch_unused_dow_dom_materia.py --dat-dir C:\Users\drime\Desktop\Maeria\01\03\05 --apply` | backs up and patches an extracted DAT folder |
| `tools\materia\restore_unused_dow_dom_materia.py --apply` | restores the latest backups from the patch tool |
| `tools\materia\apply_unused_dow_dom_materia_client_patch.ps1` | elevated wrapper for installs under `Program Files` |
| `tools\materia\restore_unused_dow_dom_materia_client_patch.ps1` | elevated wrapper for restoring installs under `Program Files` |

The patcher writes backups beside the original DATs using `.unused-dow-dom-backup-YYYYMMDD-HHMMSS` and writes a hash manifest in this folder.

Hovering a repointed materia can crash the client if `83.DAT`/`89.DAT` are patched without the matching `84.DAT`/`85.DAT` index updates. Re-run the apply wrapper to hotfix those index files; it backs up any DAT it changes before writing.

## Tooltip Colors

The white icons in the materia tooltip are the equipment types that can accept that materia. Dark red/brown icons are not compatible. The first six meld flags map to:

| Flag | Gear |
| --- | --- |
| `meldable1` | Head |
| `meldable2` | Body |
| `meldable3` | Hands |
| `meldable4` | Legs |
| `meldable5` | Feet |
| `meldable6` | Waist |

This patch sets the selected new materia to hands and feet only: `meldable3=true`, `meldable5=true`.

## Enabled Materia

| Type | Items | New stat | Client param | Server modifier | Grade values | Gear |
| --- | --- | --- | --- | --- | --- | --- |
| `34` | Sagacious Aim I-IV | Magic Critical Hit Rating | `15036` | `MagicCriticalHitRating` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |
| `58` | Bloodflow I-IV | Regen | `15049` | `Regen` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |
| `59` | Manaflow I-IV | Refresh | `15050` | `Refresh` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |
| `60` | Mettleflow I-IV | Regain | `15128` | `Regain` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |
| `65` | Sorcerer's Step I-IV | Fastcast | `15061` | `Fastcast` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |
| `66` | Sprinter's Step I-IV | Haste | `15054` | `Haste` | `1,1,1,1 / 2,2,2,2 / 3,3,3,3 / 4,4,4,4` | Hands, Feet |

Notes:

- Critical Hit Rate already exists as `Savage Aim`, so this patch does not duplicate it.
- Ability Recast- is left open because the server has only specific recast reduction modifiers, not a generic all-ability recast modifier.
- Regain is server-backed as `Modifier.Regain`. The stock `xtx_text_paramName` sheet does not have a named `15128` row, so this is the one client display risk to test in game first.

## Reserved Unused Materia

These remain intentionally open or no-op for future design:

| Type | Materia |
| --- | --- |
| `46` | Manawall |
| `57` | Ahriman Gaze |
| `63` | Everspike |
| `64` | Soldier's Step |
| `67` | Savant's Step |
| `69-74` | Breath of Fire, Ice, Wind, Earth, Lightning, Water |
| `75-77` | Bloodbringer, Manabringer, Mettlebringer |
| `78-79` | Mana Martyr, Mettle Martyr |
| `80` | Byregot's Hammer |
| `81` | Menphina's Whisper |
