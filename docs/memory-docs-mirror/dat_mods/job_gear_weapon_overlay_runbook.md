# Job Gear and Weapon DAT Overlay Runbook

This is the reusable version of the Arcanist gear/staff work. The current implementation lives in:

- `tools/arcanist/build_arcanist_mage_gear_staffs.py`
- `tools/arcanist/patch_arcanist_mage_gear_dats.py`
- `docs/dat_mods/arcanist_mage_gear_staffs/`
- `Data/sql/custom content/Custom Equipment/arcanist_mage_gear_staffs.sql`

Use this as a porting guide when adding another job to existing gear, or when cloning an existing weapon family into a new job weapon set.

## Core Idea

The client and server both need to agree on the item.

Server SQL controls the database item rows:

- `gamedata_items`
- `gamedata_items_weapon`
- `gamedata_items_equipment`
- `gamedata_items_graphics`
- `gamedata_items_graphics_extra`
- `gamedata_item_compatibility`

Client DATs control tooltip and equip display:

- `itemData`: kind, icon, main skill, required level, compatibility key, repair data.
- `weapon`: weapon stats such as damage and delay.
- `equipment`: equip slot, stat bonuses, materia/materialize data.
- `_item`: item class/category binding.
- `compatibility`: which jobs/classes can use the item.
- `xtx_itemName`: localized item names. The English clone-name DAT was the missing piece that made the Arcanist test item still show `Bone Staff`.
- `xtx_compatibility`: localized compatibility labels. If this is missing for new compatibility IDs, the binary equip data can be correct while the tooltip still shows stale source jobs such as `THM BLM`.

Do not overwrite live client DATs. Always write an overlay package first.

## Important Paths

Current source client:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV
```

Current generated package:

```text
C:\Users\drime\Desktop\New Weps and Gear
```

Current active Windower overlay package:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\Weps
```

Current active Windower config:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\Windower.json
```

The `DatOverlay.Folder` setting must point at the package root, not just the parent overlay folder:

```json
"DatOverlay": {
  "Enabled": true,
  "Folder": "Windower\\DatOverlay\\Weps"
}
```

If it points at `Windower\\DatOverlay`, files under `Windower\\DatOverlay\\Weps\\data\\...` will not be seen by the hook.

## Job IDs

Job/class IDs come from:

```text
docs/Dat Mining/xtx_text_jobName.csv
```

Useful current IDs:

| ID | Name |
| ---: | --- |
| 2 | pugilist |
| 3 | gladiator |
| 4 | marauder |
| 7 | archer |
| 8 | lancer |
| 22 | thaumaturge |
| 23 | conjurer |
| 24 | arcanist |
| 26 | black mage |
| 27 | white mage |
| 29 | carpenter |
| 30 | blacksmith |
| 31 | armorer |
| 32 | goldsmith |
| 33 | leatherworker |
| 34 | weaver |
| 35 | alchemist |
| 36 | culinarian |
| 39 | miner |
| 40 | botanist |
| 41 | fisher |

For a new job port, change the target job constant in the build script. In the Arcanist version this is:

```python
ACN_JOB = 24
```

## Compatibility Rows

Compatibility rows are what drive the `Requires:` line in the tooltip.

For the Arcanist weapon clones, row `2159` is ACN-only:

```text
compatibility 2159: job/class 24 = 100
```

For existing gear, the generator creates new compatibility rows after the current max compatibility ID, preserving existing allowed jobs and adding the target job. In the Arcanist script:

```python
ACN_WEAPON_COMPAT = 2159
FIRST_GEAR_COMPAT = 2160
```

Rules:

- Use a new compatibility row for cloned weapons unless an existing row exactly matches the desired jobs.
- For existing gear, do not overwrite the old compatibility row. Patch the gear itemData row to point to a new row that includes the new job.
- Keep new compatibility IDs contiguous after the current max row, because the patcher extends `data\01\03\01\E6.DAT`, `E7.DAT`, and `E8.DAT`.
- Also extend the matching English `xtx_compatibility` text DATs (`data\0B\45\07\E6.DAT`, `E7.DAT`, and `E8.DAT`) for every new compatibility ID. These rows are the visible tooltip labels, while `data\01\03\01\E6/E7/E8` are the binary job-value rows.

## Item ID Range

The current combined weapon overlay uses compact IDs:

```text
5040002..5040144  Arcanist
5040145..5040156  Assassin
5040157..5040168  Fencer
5040169..5040177  Assassin endgame/augmented
```

`5040001` is left as the existing placeholder row.

For another job, pick an item ID range with an existing placeholder row if possible. That gives the client a known range/offset structure to extend. If you change the range from `504`, update all hard-coded range constants in `patch_arcanist_mage_gear_dats.py` and `tools/build_new_weps_and_gear_dat_package.py`.

Current Arcanist compact range DATs:

| Sheet | Data | Range | Offset |
| --- | --- | --- | --- |
| `itemData` | `data\01\03\01\5A.DAT` | `data\01\03\01\5B.DAT` | `data\01\03\01\5C.DAT` |
| `weapon` | `data\01\03\01\C4.DAT` | `data\01\03\01\C5.DAT` | `data\01\03\01\C6.DAT` |
| `equipment` | `data\01\03\00\CC.DAT` | `data\01\03\00\CD.DAT` | `data\01\03\00\CE.DAT` |
| `_item` | `data\01\03\02\3F.DAT` | `data\01\03\02\40.DAT` | `data\01\03\02\41.DAT` |
| English `xtx_itemName` | `data\0B\45\03\66.DAT` | `data\0B\45\03\67.DAT` | `data\0B\45\03\68.DAT` |

If you use a different item ID range, find the matching triples before writing files.

## ItemData Fields That Matter

From the client Lua:

```text
getItemKind             -> itemData column 40
getItemRarity           -> itemData column 41
getItemMainSkill        -> itemData columns 44 and 45
getItemLevelType        -> itemData column 46
getItemLevel            -> itemData column 47
getItemCompatibilityKey -> itemData column 48
```

For a weapon clone:

- Change `kind` to the target weapon kind.
- Change `mainSkill` to the target job/class ID.
- Keep level, icon, stats, repair data, graphics, and equipment data from the source item unless there is a reason to alter them.
- Change `compatibility` to the new compatibility row.

For existing gear:

- Usually only change `compatibility`.
- Do not touch AF/job-identity gear unless that is explicitly desired.

## Weapon Kinds

The Arcanist clone maps THM/CNJ weapon kinds to ACN kinds:

```python
ITEMDATA_KINDS_ONE_HAND = {5105, 5107}
ITEMDATA_KINDS_TWO_HAND = {5106, 5108}
```

and writes:

```text
5109 for one-handed Arcanist arms
5110 for two-handed Arcanist arms
```

For another job, confirm the correct kind IDs in:

```text
docs/Dat Mining/itemData.csv
docs/Dat Mining/xtx_itemKind.csv
```

Do not invent kind IDs blindly. The client can display a category name only if the kind text exists.

## Name DATs

Server SQL names are not enough for the client tooltip. The client loads item words with:

```lua
worldMaster:_loadWord("itemName", catalogID)
```

For the current `5040001+` range, English names are written here:

```text
data\0B\45\03\66.DAT
data\0B\45\03\67.DAT
data\0B\45\03\68.DAT
```

The writer currently supports the English compact text encoding used by the generated Arcanist names. If a future job name uses punctuation or characters outside the existing `TEXT_CHARMAP`, add the encoding byte after confirming it from an existing retail item name.

Symptom of missing name DAT:

```text
Tooltip still shows the old source name, such as Bone Staff.
```

Fix:

```text
Patch the matching xtx_itemName data/range/offset DAT triple for the clone ID range.
```

## Porting Checklist

1. Copy or fork the Arcanist scripts into a new tool folder, for example:

```text
tools/<job_name>/
```

2. Change the mod output names:

```python
MOD_DIR = ROOT / "docs" / "dat_mods" / "<job_name>_gear_weapons"
SQL_OUT = ROOT / "Data" / "sql" / "custom content" / "Custom Equipment" / "<job_name>_gear_weapons.sql"
```

3. Change the target job/class ID:

```python
TARGET_JOB = <job_id>
```

4. Pick weapon source families:

- Source `mainSkill` values.
- Source item kind values.
- Source item ID ranges.
- AF/job-identity exclusions.

5. Pick the new clone ID block:

- Prefer an existing placeholder range.
- Leave the placeholder row untouched.
- Keep new clone IDs compact and contiguous.

6. Pick compatibility rows:

- One row for target-job-only weapons.
- New rows for existing gear that should include the target job.
- Keep compatibility IDs contiguous after the current max row.

7. Update DAT constants in the patcher if the clone ID range is not `504`.

8. Generate SQL and staged CSV overlays:

```powershell
python "C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\tools\<job_name>\build_<job_name>_gear_weapons.py"
```

9. Build the DAT overlay package:

```powershell
python "C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\tools\<job_name>\patch_<job_name>_gear_weapons_dats.py" --client-root "C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV" --output-root "C:\Users\drime\Desktop\New Weps and Gear"
```

10. Copy the package into Windower:

```powershell
$src = "C:\Users\drime\Desktop\New Weps and Gear"
$dst = "C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\Weps"
Copy-Item -LiteralPath "$src\*" -Destination $dst -Recurse -Force
```

11. Ensure `Windower.json` points at the package root:

```json
"Folder": "Windower\\DatOverlay\\Weps"
```

12. Apply the generated SQL to the server database. Keep a copy named:

```text
zzz_file.sql
```

13. Fully relaunch the client. DAT overlays are read when the client opens the DAT files, so a live tooltip may stay stale until restart.

14. Test with:

```text
!giveitem <new_catalog_id> 1
```

## Verification Checklist

Compile the scripts:

```powershell
python -m py_compile "tools\<job_name>\build_<job_name>_gear_weapons.py" "tools\<job_name>\patch_<job_name>_gear_weapons_dats.py"
```

Check the generated manifest:

```text
C:\Users\drime\Desktop\New Weps and Gear\DAT_OUTPUT_MANIFEST.md
```

For a test item, verify:

- Tooltip name is the new name.
- Tooltip category is the new weapon category.
- `Requires:` lists the target job/class, not the old source job.
- Required/optimal level matches the planned level and uses the intended donor row's `levelType`.
- Icon/model/stats match the source item.
- The item equips only on the intended job/class.

For the Arcanist test item:

```text
!giveitem 5040021 1
```

Expected:

```text
Name: Bone Astral Staff
Kind: Arcanist's Arm
Main skill: 24
Level: 5
Compatibility: 2159
Compatibility row: only job/class 24 = 100
```

## Common Failure Modes

Tooltip still shows the old name:

- The `xtx_itemName` DAT triple was not patched.
- The overlay package path is wrong.
- The client was not relaunched.

Tooltip shows the new category but old `Requires:` jobs:

- `itemData` column 48 still points to the old compatibility row.
- The compatibility DAT row was not copied into the active overlay package.
- The English `xtx_compatibility` DAT row was not generated or copied for the new compatibility ID.
- Windower is reading the wrong overlay root.

DATs exist but nothing changes:

- `Windower.json` points at `Windower\\DatOverlay` instead of `Windower\\DatOverlay\\Weps`.
- The package files are nested one folder too deep.
- The client was already running before the DAT overlay files were copied.

Server gives the item but client display is wrong:

- SQL is correct, but DATs are incomplete.
- Check `itemData`, binary `compatibility`, `xtx_compatibility`, and `xtx_itemName` first.

Item appears correct but cannot equip:

- Server compatibility and client compatibility disagree.
- Character is not actually on the target job/class.
- Main skill and compatibility row do not match.

## Current Arcanist Reference

Current confirmed output:

```text
Weapon clones: 143
Gear compatibility updates: 483
New compatibility rows: 14
DAT files: 24
```

## Exact Arcanist Work Already Done

This is the concrete record of what was done for the Arcanist pass in this conversation.

Repository files created or updated:

```text
tools/arcanist/build_arcanist_mage_gear_staffs.py
tools/arcanist/patch_arcanist_mage_gear_dats.py
docs/dat_mods/arcanist_mage_gear_staffs/README.md
docs/dat_mods/job_gear_weapon_overlay_runbook.md
Data/sql/custom content/Custom Equipment/arcanist_mage_gear_staffs.sql
```

Generated package roots:

```text
C:\Users\drime\Desktop\New Weps and Gear
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\Weps
```

The client install at this path was used only as the DAT source and was not overwritten:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV
```

The SQL was generated in the repo and copied into both overlay/output package roots as:

```text
zzz_file.sql
```

The Windower overlay config was changed here:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\Windower.json
```

The important fix was making the active overlay folder point directly at the `Weps` package:

```json
"DatOverlay": {
  "Enabled": true,
  "Folder": "Windower\\DatOverlay\\Weps"
}
```

Before that, the package was under `DatOverlay\Weps`, but the config pointed at `DatOverlay`, so the hook could miss the nested `data\...` files.

DAT files generated and copied into the active `Weps` package:

```text
data\01\03\01\5A.DAT
data\01\03\01\5B.DAT
data\01\03\01\5C.DAT
data\01\03\01\C4.DAT
data\01\03\01\C5.DAT
data\01\03\01\C6.DAT
data\01\03\00\CC.DAT
data\01\03\00\CD.DAT
data\01\03\00\CE.DAT
data\01\03\02\3F.DAT
data\01\03\02\40.DAT
data\01\03\02\41.DAT
data\01\03\01\E6.DAT
data\01\03\01\E7.DAT
data\01\03\01\E8.DAT
data\01\03\01\60.DAT
data\01\03\03\F2.DAT
data\01\03\03\F5.DAT
data\01\03\03\F8.DAT
data\01\03\03\FB.DAT
data\01\03\03\FE.DAT
data\0B\45\03\66.DAT
data\0B\45\03\67.DAT
data\0B\45\03\68.DAT
```

The English `xtx_itemName` DAT triple was added after the first in-game test still showed the source name `Bone Staff`. That was the missing client-side name data. After patching it, the decoded test item name was:

```text
Bone Astral Staff
bone astral staff
bone astral staves
```

The Arcanist test item decoded as:

```text
catalog ID: 5040021
name: Bone Astral Staff
kind: 5110
mainSkill: 24
subSkill: 0
levelType: 1
level: 5
compatibility: 2159
```

Compatibility row `2159` decoded as ACN-only:

```text
job/class 24 = 100
all other job/class slots = 0
```

Validation performed:

```powershell
python -m py_compile tools/arcanist/build_arcanist_mage_gear_staffs.py tools/arcanist/patch_arcanist_mage_gear_dats.py
```

Additional checks performed:

```text
Compared generated output package against active Windower Weps package.
Confirmed Windower.json parses.
Confirmed Windower.json resolves to the existing DatOverlay\Weps folder.
Confirmed sample overlay DAT files exist in the active package.
Decoded 5040021 from itemData, compatibility, and English itemName DATs.
Decoded a punctuation-heavy generated name, Chiran Zabran's Canticle, to confirm the text charmap handled apostrophes and Z/z.
```

Current in-game smoke test command:

```text
!giveitem 5040021 1
```

Expected in-game result after a full client relaunch:

```text
Name: Bone Astral Staff
Category: Arcanist's Arm
Requires: ACN
Required Level: 5
Icon/model/stats: same as the source Bone Staff
```

Important Arcanist files:

```text
C:\Users\drime\Desktop\New Weps and Gear\zzz_file.sql
C:\Users\drime\Desktop\New Weps and Gear\data\01\03\01\5A.DAT
C:\Users\drime\Desktop\New Weps and Gear\data\01\03\01\E6.DAT
C:\Users\drime\Desktop\New Weps and Gear\data\0B\45\03\66.DAT
```

Known-good test:

```text
!giveitem 5040021 1
```

Expected decoded client rows:

```text
5040021 name: Bone Astral Staff
itemData kind: 5110
itemData mainSkill: 24
itemData levelType: 1
itemData level: 5
itemData compatibility: 2159
compatibility 2159: job/class 24 = 100
```
