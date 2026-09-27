# FF14-Memory server installer

The supported installer is `tools/install_server.ps1`. It uses PowerShell 5.1+
because this server, its firewall, and its configuration are Windows-native.
Keeping the orchestration in PowerShell also avoids requiring a separate Python
runtime before the server can be installed.

## Public live-server setup

Open PowerShell in the repository. For the current public address and the
existing blank-password development database configuration:

```powershell
.\tools\install_server.ps1 `
  -DatabaseMode Auto `
  -NetworkProfile Public `
  -AdvertisedAddress 75.88.41.23 `
  -ServerName Ridill `
  -AllowEmptyDatabasePassword
```

For a password-protected database, omit `-AllowEmptyDatabasePassword` and the
installer prompts securely. Automation can pass a `SecureString` through
`-DatabasePassword` or set `FF14_DB_PASSWORD` for that process. The password is
never put on a MySQL command line.

The public profile deliberately separates public and private traffic:

| Connection | Address/port | Exposure |
|---|---|---|
| Client to lobby | `75.88.41.23:54994` TCP | Forward/open |
| Client to world | `75.88.41.23:54992` TCP | Forward/open |
| World to map | `127.0.0.1:1989` TCP | Local only |
| Servers to MySQL | `127.0.0.1:3308` TCP | Local only |

Forward TCP 54994 and TCP 54992 on the router to the server machine's stable
LAN address. Do not forward 1989 or 3308. `-ConfigureFirewall` creates/enables
only the two Windows inbound rules and requires an Administrator PowerShell.
Router/NAT configuration still has to be done on the router. If the ISP changes
the public IP, rerun the installer with the new `-AdvertisedAddress`.

Use `-DatabaseMode ConfigureOnly` when only the address, server name, ports, or
credentials need to change. It takes a full backup, updates only the database's
world/zone addressing, and does not run schema or content SQL. Use
`-DatabaseMode FilesOnly` to prepare only the ignored local files without
connecting to or changing a database. Add `-SkipBuild` if the binaries do not
need to be rebuilt. `-DryRun` validates and prints the plan without changing
anything.

## Database modes and backups

`Auto` is the normal choice. An empty/missing database becomes a fresh install;
a database containing tables becomes an upgrade.

- A fresh install creates the selected database without dropping any existing
  database and imports the complete current baseline.
- An upgrade refuses to start while a Lobby, World, or Map server process is
  running or while an InnoDB transaction remains open. Commit or roll back work
  in tools such as HeidiSQL first. Before the first SQL change it must
  successfully create a complete `mysqldump`/`mariadb-dump` under
  `C:\FF14-Server-Backups\<database>\`.
- Each backup has a timestamped `.sql` file and a neighboring `.json` record
  containing its SHA-256 checksum and installer choices. Empty or failed dumps
  stop the upgrade. A partial dump is renamed with `.failed`.
- Forcing `Fresh` against a database that already has tables is rejected. An
  upgrade against an empty database is also rejected.

To make a verified full backup without changing configuration or applying SQL:

```powershell
.\tools\install_server.ps1 -DatabaseMode BackupOnly -AllowEmptyDatabasePassword
```

The default upgrade mode is `RefreshCore`: additive player schemas are applied,
checked-in game catalogs are refreshed, live migrations run, and selected
custom packages are reapplied. This preserves accounts, characters, inventory,
equipment, retainers, social data, sessions, and other runtime/player state.
Operator edits made directly inside authoritative game catalog tables can be
replaced by the checked-in version; the mandatory backup is the recovery point.

Use `-UpgradeContentMode MigrationsOnly` when an operator intentionally maintains
local edits in core catalog tables. It applies additive schemas plus compatibility
and live migrations, but skips the normal core catalog refresh.

A typical restore is performed only with all three servers stopped:

```powershell
mysql.exe --host=127.0.0.1 --port=3308 --user=root --password < C:\FF14-Server-Backups\ffxiv_server\ffxiv_server-YYYYMMDD-HHMMSS.sql
```

Use the matching MariaDB/MySQL client and credentials for the actual server.

## How SQL is classified

The installer validates every top-level SQL file against
`tools/server_installer_manifest.psd1` before doing work. An unclassified file,
a duplicate classification, or destructive DML added to a protected schema
file makes the installer stop.

| Category | Fresh | Upgrade | Meaning |
|---|---:|---:|---|
| Preserved-data schemas | Yes | Yes | Additive `CREATE TABLE IF NOT EXISTS` definitions for user/runtime data; no data-changing statements allowed |
| Core content | Yes | `RefreshCore` | Authoritative game/server catalogs that can be regenerated from source |
| Runtime schema updates | Yes | Yes | Repeatable compatibility transformations for databases created by older revisions |
| Live migrations | Yes | Yes | Idempotent existing-database transformations, tracked by filename and SHA-256 |
| Manual repairs | No | No | Targeted operator/player repairs that must never run globally |
| Custom content | Opt-in | Reapplied if selected | Non-baseline gameplay additions requiring the matching client assets |

The three files raised during the installer review have different roles:

- `characters_refresh_state.sql` is an additive player/runtime table definition.
  It belongs in the normal baseline and is safe to run on upgrades; it is not a
  one-off migration.
- `runtime_schema_updates.sql` is intentionally a repeatable compatibility
  bundle. It belongs after the baseline schema/content and runs on every install
  or upgrade.
- `gamedata_retainer_candidates.sql` is the authoritative retainer candidate
  catalog. It now upserts rows instead of dropping its table. The companion
  `live migrations/retainer_candidates_existing_db_update.sql` transforms old
  `server_retainers` rows after the catalog exists.

Four repeatable patches that were previously under `manual patches` are now live
migrations because old databases need them even though their final state is
already folded into a fresh baseline. The remaining manual files change a
specific character/GM state or repair a particular custom-class save and remain
manual-only.

Three live migrations intentionally touch protected runtime data and are named
in the manifest: the Allagan currency migration remaps issued item IDs without
discarding the items, the Quickstride migration removes saved references to
obsolete commands, and the retainer migration normalizes the candidate offset.
The validator rejects protected-table DML from any other live migration until it
is explicitly reviewed and allowed. All three run only after the upgrade backup
has succeeded.

## Custom content policy

No custom content is installed by default. Selections are stored in the ignored
`Data/local/server-installer-state.json`, so a later upgrade without an explicit
`-CustomContent` argument reapplies the same selection.

| Profile | Included |
|---|---|
| `UnreleasedClasses` | Complete unreleased-class schema, Arcanist gear, Fencer/Red Mage gear, and playable-class activation |
| `Assassin` | Assassin schema, actions, traits, and weapons |
| `NmEquipment` | Custom NM equipment |
| `All` | The three gameplay profiles above |
| `DeveloperTests` | Test-only custom Gladiator action; never included by `All` |
| `None` | Core server only (default) |

The older Arcanist `01`, `02`, and `12` patch scripts are superseded by the
complete `10`/`11` package and are never automatically combined with it.

Every non-`None` profile requires `-AcknowledgeClientPatchRequired`. This is a
deliberate stop: the SQL can add IDs that an unpatched 1.23b client cannot render
or use. Apply the matching DAT/client overlay to every connecting client before
acknowledging it. Example:

```powershell
.\tools\install_server.ps1 `
  -DatabaseMode Auto `
  -NetworkProfile Public `
  -AdvertisedAddress 75.88.41.23 `
  -CustomContent UnreleasedClasses,Assassin,NmEquipment `
  -AcknowledgeClientPatchRequired
```

## Server configuration

The only server INI files are `Data/lobby_config.ini`, `Data/world_config.ini`,
and `Data/map_config.ini`. The installer updates them in place and preserves
unrelated tuning. These files are tracked; review local credential and address
changes before committing. Builds and publishes do not copy them to output folders.

Servers locate the owning checkout from the executable directory, then the
working directory, and load only its root `Data` file. A standalone deployment
must retain `Data/scripts` at its root. A missing required INI stops startup;
local overrides, executable-adjacent INIs, and nested build copies are ignored.
Restart the affected server after editing its INI.

Before updating configuration, the installer archives the three current INIs
in a timestamped ZIP under `Data/local/config-backups`. Archives are never read
as configuration. Installer state and the login site's
`Data/www/login/settings.local.php` remain private and ignored by Git. The
tracked PHP settings file loads that local PHP override when present.

Run the installer regression checks with:

```powershell
.\tools\server-installer\Test-ServerInstaller.ps1
dotnet run --project tools/server-config-tests/ServerConfigTests.csproj
```
