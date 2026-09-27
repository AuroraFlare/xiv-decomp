# Coerthas and Mor Dhona zonelines

Set these keys under `[General]` in the active map configuration, then restart
Map Server:

```ini
zone_lines_coerthas_enabled = true
zone_lines_mor_dhona_enabled = true
```

Use `false` to disable a region's incoming hard zonelines and `true` to enable
them. Both default to `true` when absent. Set them in `Data/map_config.ini`,
the only recognized map server configuration.

The Coerthas switch covers destinations 143, 144, 145, 147 and 148. The Mor Dhona
switch covers 190 and the alternate field 266. Each switch applies to every
matching row loaded from `server_zone_lines`, regardless of how many entrances
the database contains. The row's existing `enabled` flag must also be on.

Disabled triggers do not initiate a zone change; they do not create a collision
wall. Exits to other destinations, seamless travel within a region, teleports,
Return, and quest/GM warps keep their existing behavior.

The checked-in `server_zone_lines.sql` currently defines the South Shroud /
Eastern Thanalan crossing and three Grand Company office exits. It does not
define the Coerthas / Mor Dhona entrances, so their count must be checked against
the database used by the server. This change does not add or replace entrance
coordinates or require a SQL migration.

To list the affected rows in that database:

```sql
SELECT id, sourceZoneId, destinationZoneId, enabled
FROM server_zone_lines
WHERE destinationZoneId IN (143, 144, 145, 147, 148, 190, 266)
ORDER BY destinationZoneId, sourceZoneId, id;
```
