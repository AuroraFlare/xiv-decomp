# Custom Gladiator Actions

This mod adds three cloned Gladiator weapon skills as a DAT overlay plus matching server rows:

| New ID | New Name | Donor ID | Donor |
| ---: | --- | ---: | --- |
| `30102` | Wasp Sting | `27150` | Fast Blade |
| `30103` | Quick Slash | `27158` | Phalanx |
| `30104` | Shadowstitch | `27151` | Flat Blade |

The DAT package is generated at:

```text
C:\Users\drime\Desktop\Actions
```

The generator reads clean source DATs from:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV
```

Run:

```powershell
python tools\actions\build_custom_gladiator_action_dats.py
```

The client overlay patches command metadata, icons, levels, and localized command text rows. The server SQL lives at:

```text
Data\sql\custom content\Custom Actions\custom_gladiator_actions.sql
```

Import the SQL after `server_battle_commands.sql`, then run `!reloadbattlecommands` in game or restart the map server.
