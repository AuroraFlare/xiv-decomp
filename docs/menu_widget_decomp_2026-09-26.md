# Gear, actions & traits, and surrounding menus — decomp run

Generated: 2026-09-26T03:35:44+00:00

Re-extracted and re-decompiled 13 menu scripts from the installed
1.x client: the gear/equipment menu, the actions menu family, the shared
actions & traits setting menu, status menus, and the repair menus around
them. There is no standalone trait script in the client manifest; traits are
served through `widget/actionsettingwidget`. `widget/actionequipwidget`
decompiles to a single stub line.

All 13/13 targets reproduce their frozen 2026-06-17
artifacts exactly: installed LPB decode matches the frozen LUAC, fresh unluac
output matches the frozen Lua, and text-parsed methods match the bytecode
method map.

| Logical path | Role | Methods | Text bank | Status |
|---|---|---:|---|---|
| `widget/equipwidget` | gear/equipment menu | 146 |  | identical |
| `widget/actionmenuwidget` | actions menu | 67 |  | identical |
| `widget/actionsettingwidget` | actions & traits setting menu | 41 |  | identical |
| `widget/actionequipwidget` | action equip (stub) | 0 |  | identical |
| `widget/actiongaugewidget` | action gauge | 9 |  | identical |
| `widget/statuswidget` | character status menu | 86 |  | identical |
| `widget/statuseffectwidget` | status effects | 18 |  | identical |
| `widget/grandcompanystatuswidget` | grand company status | 15 |  | identical |
| `widget/repairequipmentwidget` | equipment repair menu | 37 |  | identical |
| `widget/repairequipmentdialogwidget` | equipment repair dialog | 6 |  | identical |
| `command/system/repairequipmentscommand` | repair command | 2 |  | identical |
| `command/system/repairordercommand` | repair order command | 1 |  | identical |
| `status/equipmentweaknessstatus` | equipment weakness status | 3 |  | identical |

## Reproduction

```powershell
python -B tools/rerun_menu_widget_decomp.py
```

Outputs:

- `tools\outputs\menu-widget-decomp-20260926\menu_widget_report.csv`
- `tools\outputs\menu-widget-decomp-20260926\summary.json`
