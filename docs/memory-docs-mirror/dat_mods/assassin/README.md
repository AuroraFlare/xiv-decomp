# Assassin Client Overlay

This folder stages the native class-13 Assassin icon and its verified overlay
outputs. It does not overwrite the installed client.

The universal level-one Quickstride action (`27415`, used as Sprint by every
class, job, crafter, and gatherer) has its own supplied 64x64 action icon. The
action overlay reserves unused action-icon ID `30998`, writes it to
`action_overlay/data/1C/5C/03/E6.DAT`, and points only Quickstride at it.
Assassin's Flee remains unchanged.

Shade Shift also has its own supplied 64x64 action icon. The action overlay
reserves unused action-icon ID `30999` and writes it to
`action_overlay/data/1C/5C/03/E7.DAT`; no retail icon resource is replaced.

The combined command overlay also owns hidden presentation row `29772`, named
`a Trust`. It clones Raise's casting visuals, advertises the Trust system's
three-second cast, and has a zero-second recast. The server sends this row only
for the Trust summon castbar; it is never learned or placed on a hotbar.

- `icons/assassin.png` is the exact 64x64 source selected for Assassin.
- `icons/assassin_32.png` is the exact 32x32 RGB preview encoded in GTEX.
- `icons/quickstride.png` is the exact 64x64 source selected for the universal
  Quickstride/Sprint action.
- `icon_overlay/data/1C/59/04/80.DAT` is icon handle `1152`
  (`0x1C590480`).
- `icon_overlay/client/script/n1635q/65rzqvun1635q_1q5x65q91y.le.lpb`
  maps native Assassin class `13` to handle `1152` in DesktopWidget.
- `icon_overlay/decoded/desktopwidget_itemdetail.class_icons.luac` is the
  decoded patched Lua 5.1 chunk retained for inspection.

Rebuild the assets with:

```powershell
python tools/actions/build_newjobs_assassin_icon_dat.py `
  --output-dat docs/dat_mods/assassin/icon_overlay/data/1C/59/04/80.DAT

python tools/actions/build_newjobs_class_icon_overlay.py `
  --output-lpb docs/dat_mods/assassin/icon_overlay/client/script/n1635q/65rzqvun1635q_1q5x65q91y.le.lpb `
  --decoded-out docs/dat_mods/assassin/icon_overlay/decoded/desktopwidget_itemdetail.class_icons.luac
```

The image is intentionally low contrast at native size: a muted green field,
light sage inset frame, and a deeper assassin-green crossed-dagger shadow.
