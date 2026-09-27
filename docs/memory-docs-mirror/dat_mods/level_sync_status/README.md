# Level Sync Status Overlay

This additive Windower `DatOverlay` package gives AuroraFlare's party and GM
level sync a native status-bar presentation:

- status name: `Level Sync`
- status help: `You are under a level sync.`
- server status: `223995`
- client presentation row: `230013` (`Gear Change`), an enabled retail slot
- icon: the supplied pink/green double-arrow image
- icon handle: `10147`, the installed icon owned by that retail slot

The indirection is intentional. Enabling disabled row `223995` caused the 1.x
client to dereference a null resource while processing status packet `0x0177`.

The server owns the status lifetime. It appears only while a player's party or
GM level sync is actually effective, has no countdown, and disappears on
desync. It is silent in the battle log and is never saved to the character
database.

## Build and install

Close the game client, then run from the repository root:

```powershell
python tools/actions/build_level_sync_status_overlay.py
```

The default output is installed into:

```text
..\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\LevelSync
```

The builder embeds the exact supplied 32x32 RGBA PNG and emits a copy at
`source/level_sync.png`. It DXT5-compresses the icon into
`data/1C/5A/00/93.DAT`, replacing only the existing icon resource owned by
client row `230013` inside the overlay.

The package creates whole-file overlay copies only for the English status-text
data/offset pair and that existing icon:

```text
data/0B/45/05/34.DAT
data/0B/45/05/36.DAT
data/1C/5A/00/93.DAT
```

It never changes an enabled-row index or asks the client to load a new resource
handle. No file beneath the retail game installation is changed.

## Verify

1. Fully restart the game client.
2. Run `//windower dat status` and confirm the `LevelSync` collection is active.
3. Use `!gmlevelsync <level>` while solo, or enable normal party sync with
   `!levelsync`.
4. Confirm the icon appears with no timer and its help reads
   `You are under a level sync.`
5. Use `!gmlevelsync off`, leave range/zone for normal party sync, or disable
   normal sync and confirm the icon disappears.

Automated builder validation:

```powershell
python -m unittest tools.actions.tests.test_build_level_sync_status_overlay
```

## Revert

Move the entire `LevelSync` directory outside `Windower/DatOverlay`, then fully
restart the client. The base DATs do not need restoration because they were
never modified.
