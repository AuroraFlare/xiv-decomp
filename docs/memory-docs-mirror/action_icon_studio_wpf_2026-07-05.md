# Action Icon Studio WPF

Date: 2026-07-05

`C:\Users\drime\source\repos\AuroraFlare\ActionIconStudio` is a C# WPF utility
for FFXIV 1.0 action icon work.

## What Works Now

- Loads installed-client `gameCommandBasic` action rows from `data/01/03`.
- Shows command IDs, names, current icon IDs, and source DAT files.
- Writes Windower `DatOverlay` files for safe icon-ID swaps.
- Copies a donor command's current icon ID onto another command.
- Reads an atlas CSV and can export/import mapped GTEX rectangles as PNG.

The PNG path is intentionally overlay-based: import writes the edited GTEX to the
configured overlay root, preserving the installed client files.

## Current Limitation

The real action/spell icon atlas is not mapped yet. The app already has the PNG
round-trip plumbing, but export/import is enabled only for icon IDs listed in:

```text
docs/dat_mods/action_icon_atlas_template.csv
```

Each atlas row needs:

```text
icon_id,gtex_rel,x,y,width,height,pixel_format,note
```

Once we identify where icon IDs such as `30086` and `30170` live, adding those
rows will make the WPF export/import flow work for those action icons.

## Run

```powershell
dotnet run --project ..\ActionIconStudio\ActionIconStudio.csproj
```

Default paths point at the local installed client,
`FF14-Memory\AI Scripts\command.csv`, the atlas template under
`FF14-Memory\docs\dat_mods`, and the Windower DatOverlay folder beside this repo.
