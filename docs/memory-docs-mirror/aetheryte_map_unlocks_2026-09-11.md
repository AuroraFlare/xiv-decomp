# Aetheryte map unlock synchronization

The reported character could teleport to Gridania, Camp Bentbranch and Camp
Tranquil, but the map menu showed Nine Ivies. Teleport availability is checked
server-side by actor-class ID; the map menu reads the client's synchronized
`work.event_achieve_aetheryte` array.

## Confirmed indexing contract

- Recovered `chara/player/player_work.lua`, `getAchieveAetheryte`, reads Lua
  `work.event_achieve_aetheryte[id - 1280000]`. The array has 512 entries.
- Recovered `widget/desktopwidget_connector.lua`, `updateAchieveAetheryte`,
  requests Lua indexes 61..87 for the Black Shroud map list.
- The installed client's native `_updateWork` bindings convert both supplied
  endpoints to zero-based indexes. The binding at `0x0073EB40` registers
  `0x006E7670`; instructions `0x006E77CF` and `0x006E77D5` subtract one from the
  two endpoints before calling the indexed-target constructor at `0x0070AAA0`.
  The bindings at `0x006E85E0` and `0x006E8890` make the same conversion.
- Executable checked: local retail `ffxivgame.exe`, SHA-256
  `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
  This native evidence came from PE disassembly of that executable, rather than
  assuming addresses in the separate older C decompilation matched it.
- `docs/Dat Mining/aetheryte_2Dmap.csv` maps the following actor-class IDs to
  distinct map pages. The server must store and transmit `id - 1280001`.

| Location | Actor-class ID | Lua array index | Server/wire bit | Map page |
| --- | ---: | ---: | ---: | ---: |
| Gridania | 1280061 | 61 | 60 | 2700, 30 |
| Bentbranch | 1280062 | 62 | 61 | 2000 |
| Nine Ivies | 1280063 | 63 | 62 | 2100 |
| Tranquil | 1280066 | 66 | 65 | 2400 |

The old server subtracted 1280000, shifting the published achievements to other
client entries. Loading, unlocking, teleport eligibility and favored-location
validation now share the corrected index conversion.

## Packed range correction

`Bitstream.GetSlice` also had independent defects: its size calculation omitted
the inclusive endpoint for lengths 8n+1, and its zero-byte shortcut advanced the
loop nine bits while resetting source alignment and advancing a whole output
byte. Single-bit responses could consist only of the `0x03` terminator; sparse
or unaligned ranges could shift or lose flags. The replacement packs every bit
relative to the requested start and reserves a separate terminator byte.
Quest-completion synchronization uses this helper too, so its packet behavior
is covered by the regression harness.

## Verification and rollout

The new harness failed all five scenarios against the previous implementation.
It exercises production aetheryte loading, server teleport checks, work-sync
packet generation and decoding, one-location regional profiles, full and partial
updates, reloads, unlock-all mode, and quest-completion packets. It also compares
every inclusive subrange of four 512-bit patterns with .NET `BitArray` packing.
After the fix, all five scenarios pass: 586,474 checks, zero failures. The Map
Server and harness build succeeded; the build reported only the existing
`Blowfish.cs` CS0675 warning.

```powershell
dotnet build tools/aetheryte-map-tests/AetheryteMapTests.csproj --artifacts-path .codex-tmp/aetheryte-map-build -p:NuGetAudit=false -m:1 -nr:false
dotnet '.codex-tmp/aetheryte-map-build/bin/AetheryteMapTests/debug/AetheryteMapTests.dll'
```

Deploy the rebuilt Map Server and `Meteor.Common.dll` together and restart the
Map Server. Existing character attunements remain stored as actor-class IDs in
`characters_aetherytes`; there is no data migration or need to touch each crystal
again. A fresh login reloads the corrected flags. In-client acceptance remains:
use a character with Gridania/Bentbranch/Tranquil only, verify those map entries,
verify Nine Ivies stays hidden, then attune to Nine Ivies and verify it appears.
The packet tests do not constitute a live-client visual check.
