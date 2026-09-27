# Currency-tab Tokens

This overlay exposes six existing 1.x exchange tokens in unused Currency-tab
rows and repurposes eight more unused retail rows for custom Allagan currencies.
Keeping all currencies inside the native `1000101`-`1000124` range is required:
the 1.x inventory Lua spreadsheet path asserts when an appended currency ID is
resolved. The legacy normal-item records remain present so recovered client
dialogue that embeds those IDs can still resolve its text.

## Rowena tokens

| Currency ID | Display name | Legacy text/item ID | Source |
| ---: | --- | ---: | --- |
| 1000104 | Inferno Totem | 10011151 | Ifrit Hard |
| 1000105 | Kupo Nut Charm | 10011152 | Thornmarch |
| 1000108 | Vortex Totem | 10011154 | Garuda Hard |
| 1000109 | Inferno Seal | 10011156 | Golden Bazaar Hamlet Defense |
| 1000112 | Vortex Seal | 10011157 | Hyrstmill Hamlet Defense |
| 1000124 | Tremor Seal | 10011158 | Aleport Hamlet Defense |

No balance migration is included: these reward currencies had not yet been
issued on the current server. If old normal-item tokens are later imported from
another database, migrate them explicitly rather than enabling both reward IDs.

## Allagan currencies

The source images are the supplied 64x64 RGBA runestones. They are assigned in
numeric image order; the icons are intentionally independent rather than color
variants of one shared resource.

| Currency ID | Display name | Icon ID | Source | GTEX resource |
| ---: | --- | ---: | --- | --- |
| 1000101 | Allagan Sigils | 61569 | `allagan_sigils.png` (1.png) | `data/1C/5F/06/21.DAT` |
| 1000102 | Allagan Relics | 61570 | `allagan_relics.png` (2.png) | `data/1C/5F/06/22.DAT` |
| 1000103 | Allagan Glyphs | 61571 | `allagan_glyphs.png` (3.png) | `data/1C/5F/06/23.DAT` |
| 1000106 | Allagan Prismoliths | 61572 | `allagan_prismoliths.png` (4.png) | `data/1C/5F/06/24.DAT` |
| 1000107 | Allagan Shards | 61573 | `allagan_shards.png` (5.png) | `data/1C/5F/06/25.DAT` |
| 1000110 | Allagan Crystals | 61574 | `allagan_crystals.png` (6.png) | `data/1C/5F/06/26.DAT` |
| 1000111 | Allagan Rubies | 61575 | `allagan_rubies.png` (7.png) | `data/1C/5F/06/27.DAT` |
| 1000113 | Allagan Cores | 61576 | `allagan_cores.png` (8.png) | `data/1C/5F/06/28.DAT` |

## Client patch

The patcher preserves each target row's native `Money/MoneyStandard` metadata,
replaces its text/icon without extending any sheet range, and builds each
runestone as a 64x64, one-mip DXT1 `GTEX` resource. It validates the installed
DAT layout before writing the overlay. The icons reuse the catalog-backed IDs
`61569`-`61576`, originally referenced only by Allagan Runestone items
`10004230`-`10004237`. The current live database has no instances or auction-bot
stock for those donor items. Merely placing a DAT in an unreferenced slot—even
when a retail file exists there—does not add it to the 1.x client's item-resource
index and causes the Inventory lookup to assert.

Dry run:

```powershell
python tools/currencies/patch_rowena_currency_dats.py
```

Build the deployable 17-file overlay:

```powershell
python tools/currencies/patch_rowena_currency_dats.py --output-root .codex-build/currency-overlay
```

Validate the built overlay:

```powershell
python tools/validate_allagan_currencies.py --overlay-root .codex-build/currency-overlay
```

The normal deployment target is the launcher's Windower `DatOverlay` directory;
the package does not require overwriting retail client DATs. The patcher's
`--apply` mode remains available for recovery/testing and creates timestamped
backups, but it is not the recommended installation path.
