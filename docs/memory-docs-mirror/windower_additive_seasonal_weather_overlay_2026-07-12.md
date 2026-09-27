# Additive Seasonal Weather Overlay - 2026-07-12

## Result

AuroraFlare can now expose the authenticated retail Halloween and Starlight
weather payloads at the same time without replacing any final-client weather
binding.

Runtime testing rejected the initial experimental IDs `8101`/`8102`: the
client resolved their DAT files but did not activate visuals above its authored
weather range, which ends at `8081`. The corrected IDs `8070`/`8071` are unused
in the final RegionResourceData table and remain inside that native range.

| weather ID | command alias | result |
| ---: | --- | --- |
| `8070` | `halloween` | restored 2011 All Saints' Wake atmosphere in Limsa Lominsa, Gridania, and Ul'dah |
| `8071` | `starlight` | restored 2011 Starlight atmosphere in all three cities |
| `8027` | `seasonal` | preserved final-client combined seasonal binding |
| `8029` | `moonfire` | preserved final-client Moonfire binding |
| `8032` | `dalamudthunder` | preserved final-client Dalamud thunder binding |

The installed client is not edited. Windower redirects read-only DAT opens to
the files below and falls back to the installed client for every missing file.

## Overlay location

```text
C:\Users\drime\source\repos\AuroraFlare\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\Weather
```

The overlay contains:

- `data/03/C0/00/00.DAT`: the final RegionResourceData table with 34 additive
  rows, two rows in each of the 17 repeated `sea_s0`, `fst_f0`, and `wil_w0`
  parent blocks.
- `data/29/D9/00/30.DAT` and `31.DAT`: Limsa Starlight and Halloween.
- `data/29/B0/00/30.DAT` and `31.DAT`: Gridania Starlight and Halloween.
- `data/61/5A/00/30.DAT` and `31.DAT`: Ul'dah Starlight and Halloween.
- `manifest.json`: source patches, source and destination keys, sizes, hashes,
  dependency counts, and every inserted binding.

The six destination keys were unused by the installed client. Existing rows
and payload keys, including `8027`, `8029`, `8030`, `8031`, and `8032`, remain
unchanged.

## Starlight runtime controller correction

Live testing showed that the December 2011 Starlight wrappers still loaded but
produced only their black/clouded sky layer. Their historical leaf entries
pointed at three VINS instance-controller keys that the final client had later
repurposed for Dalamud thunder. The original 1,632-byte `SEDBvins` controllers
were recovered exactly from `D2010.11.25.0002.patch`:

| city | retail controller | private overlay key |
| --- | --- | --- |
| Limsa Lominsa | `0x898C000E` | `0x898C00FE` |
| Gridania | `0x5D200014` | `0x5D2000FE` |
| Ul'dah | `0x89850014` | `0x898500FE` |

Each `8071` wrapper has exactly two four-byte references redirected to its
private controller. The restored controllers name the surviving city-specific
Xmas cloud and camera-snow leaves directly. This keeps the active final-client
controllers at their original keys for `8032` Dalamud thunder.

## Retail payload provenance

Halloween comes from `D2011.10.04.0000`:

| family | retail source key | additive key |
| --- | --- | --- |
| Limsa `sea_s0` | `0x29D9001F` | `0x29D90031` |
| Gridania `fst_f0` | `0x29B00020` | `0x29B00031` |
| Ul'dah `wil_w0` | `0x615A0023` | `0x615A0031` |

Starlight comes from `D2011.12.14.0000`:

| family | retail source key | additive key |
| --- | --- | --- |
| Limsa `sea_s0` | `0x29D9001A` | `0x29D90030` |
| Gridania `fst_f0` | `0x29B0001A` | `0x29B00030` |
| Ul'dah `wil_w0` | `0x615A001D` | `0x615A0030` |

## Server control

The weather registry and GM command accept the new named aliases:

```text
!weather halloween 0 1
!weather starlight 0 1
!weather dalamudthunder 0 1
!weather moonfire 0 1
!weather seasonal 0 1
!weather reset 0 1
```

The numeric IDs `8070` and `8071` are also accepted in the three mapped city
families. `wtr_xmas_legacy` remains an explicit alias for final-client `8032`.

Restart the client through the rebuilt Windower before testing, because the
RegionResourceData table may be loaded early. `//windower dat trace` can be
used to confirm that `data/03/C0/00/00.DAT` and the selected city payload are
being redirected.

## Validation

The builder and validators establish:

- 61 parent blocks parse before and after the patch.
- 17 city-family parent blocks receive exactly two additive rows each.
- 34 total binding rows are added.
- 6 retail wrappers are installed under unused keys; Halloween remains
  byte-exact and each Starlight wrapper changes only two controller keys.
- 3 exact retail Starlight VINS controllers are restored under private keys.
- 6 Starlight wrapper controller references are redirected to those copies.
- 205 historical component references resolve in the final client.
- 0 existing RegionResourceData child rows change.
- 0 destination-key collisions exist.
- 0 original client files are modified.
- Lua registry and command aliases resolve `8070`, `8071`, `8027`, `8029`, and
  `8032` as intended.
- Map Server builds with zero errors.

Rebuild and validation commands:

```powershell
python tools/build_windower_seasonal_weather_overlay.py
python tools/validate_windower_seasonal_weather_overlay.py
powershell -ExecutionPolicy Bypass -File tools/validate_additive_seasonal_weather_server.ps1
dotnet build "Map Server/Map Server.csproj" --no-restore
```

## Scope and restoration

This overlay restores the weather/atmosphere resource binding. City decoration
scheduler groups are a separate client layout layer and are not remapped to
`8070` or `8071` by this patch. Their synchronization needs a separate layout
selector patch or decoration controller.

To restore the untouched final-client behavior, disable, rename, or remove the
`DatOverlay/Weather` organization folder and restart the client. The installed
FFXIV files require no restoration because they were never overwritten.

A live in-client visual smoke test in each city is the remaining runtime check.
