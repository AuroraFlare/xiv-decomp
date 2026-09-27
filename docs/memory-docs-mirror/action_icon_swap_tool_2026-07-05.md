# Action Icon Swap Tool

Date: 2026-07-05

## Finding

Ability and spell icons are easy to swap when we reuse an existing icon ID. The
client action rows expose the icon as command CSV column `37`, and the installed
DAT source for that field is the first little-endian `u32` in the corresponding
`gameCommandBasic` row.

Example: Fast Blade `27150` has icon `30086`, and its
`gameCommandBasic` row begins with `86 75 00 00`.

The visible action surfaces use that same command metadata:

- `ActionSettingWidget` renders action-list rows through command data and
  `desktopWidget:getSkillIcon(commandId)`.
- `ActionMenuWidget` places live hotbar icons through
  `desktopWidget:getPlayerActionCommandData(command, 36)` into `IconDatas`.

## Tool

Builder:

```text
tools/actions/build_action_icon_swap_overlay.py
```

Example manifest:

```text
docs/dat_mods/action_icon_swaps_example.csv
```

The tool writes a Windower `DatOverlay` pack and does not overwrite the installed
game files. For each patched `gameCommandBasic` table it writes the edited data
DAT plus the matching range/offset DATs, so the overlay package is self-contained.
Its default output is:

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\ActionIconSwaps
```

Examples:

```powershell
python tools/actions/build_action_icon_swap_overlay.py --list 27150 --list 22106
python tools/actions/build_action_icon_swap_overlay.py --set 22106=30086
python tools/actions/build_action_icon_swap_overlay.py --copy-icon 22308=28592
python tools/actions/build_action_icon_swap_overlay.py --swaps-csv docs/dat_mods/action_icon_swaps_example.csv
```

## Scope

This solves quick icon reuse and swap work. It can patch installed-client rows or
staged custom DAT rows as long as the source root contains the matching
`gameCommandBasic` data/range/offset triple.

True new icon art is a second pass. For that we need to identify the 1.0 icon
texture/resource DATs and either replace an unused icon asset or append a new
asset plus any required index rows. The Windower DAT overlay can redirect those
files once the resource path and format are known.

The likely resource family is the client SQWT/GTEX UI layer. `*.gtex` files start
with `GTEX` and appear to be a 32-byte header followed by 32-bit raw image data:
for example `client/sqwt/common/equip.win32.gtex` decodes as a 512x512 UI
texture. That file is an equipment/silhouette texture, not the action icon atlas,
so the remaining custom-art work is finding the specific atlas or native table
that maps icon ids such as `30086` to texture coordinates.
