# New Weps and Gear Combined Package Runbook

This builds the Desktop DAT/SQL package from the installed Final Fantasy XIV 1.0 client DATs.

## Source and Output

- Source client DAT root: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`
- Output package root: `C:\Users\drime\Desktop\New Weps and Gear`
- Builder: `tools/build_new_weps_and_gear_dat_package.py`

The builder copies from the source client root and writes patched overlay files into the output package root. It does not directly modify the installed client DATs.

## Build Command

```powershell
python tools/build_new_weps_and_gear_dat_package.py `
  --client-root "C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV" `
  --output-root "C:\Users\drime\Desktop\New Weps and Gear"
```

## Included Work

- Arcanist mage gear/staff overlay from `docs/dat_mods/arcanist_mage_gear_staffs`
- Assassin dagger overlay from `docs/dat_mods/assassin_daggers_gear`
- Fencer red mage sword/dagger overlay from `docs/dat_mods/fencer_red_mage_swords_daggers_gear`

## Output SQL

The package writes these files into the output root:

- `arcanist_mage_gear_staffs.sql`
- `assassin_daggers_gear.sql`
- `fencer_red_mage_swords_daggers_gear.sql`
- `11_unreleased_custom_classes_playable.sql`
- `zzz_file.sql`

`zzz_file.sql` is the combined apply file containing the item/gear SQL and the playable custom-class action SQL in order.

## DAT Tables Patched

- Existing gear `itemData` compatibility rows
- Shared 504 weapon `itemData`, `weapon`, `equipment`, `_item`, and English `xtx_itemName` rows:
  Arcanist `5040002..5040144`, Assassin `5040145..5040156` plus `5040169..5040177`, and Fencer `5040157..5040168`
- `compatibility` rows
- English `xtx_compatibility` rows, so the tooltip text for the new compatibility IDs shows `Requires: ACN`, `Requires: ASN`, and `Requires: FNC` instead of stale source-job text.

The combined 504 `_item` output uses variable row-boundary offsets. Arcanist rows are cloned from their staff donors, while Assassin/Fencer rows are cloned from their Gladiator sword/dagger visual donors.

Assassin and Fencer weapon clones keep their planned level values and inherit `levelType` from their source rows. Assassin now preserves authentic source damage/delay and equipment bonuses; Fencer retains its separately scaled combat donors.

## Verification

After a successful build, check:

- `C:\Users\drime\Desktop\New Weps and Gear\DAT_OUTPUT_MANIFEST.md`
- The manifest should show 27 DAT files.
- 504 weapon ranges should include `(5040001, 168)`.
- Compatibility ranges should include the new custom rows through `2206`, with `2173` left unused.
- English compatibility text ranges should also include rows through `2206`, and sample rows should decode as `2159 -> Requires: ACN`, `2174 -> Requires: ASN`, and `2186 -> Requires: FNC`.
