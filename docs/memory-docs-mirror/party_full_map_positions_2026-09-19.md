# Full-map party position snapshots

The user's final local screenshots distinguish a working cyan **minimap** dot
from an absent **full-map** party marker. The live 16:21:51 Map process already
logged `PartyMapMarker` delivery and `markerClearQueued=True` during subsequent
seamless crossings. This confirms that the actor marker changes were active;
it does not establish full-map rendering or general crash resolution.

## Native evidence

Client SHA-256:
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.

Run `python tools/inspect_party_full_map_packet.py .tmp/ffxivgame-ifrit.exe`.
The 16 checks read the pinned executable without changing a client process.

* The inbound dispatcher at `0x004DC690` selects `0x004DD167` for `0x018D`.
  It resolves the location's actor metadata through `0x00575550` and calls
  `0x0055CF70` with the payload and that resolver.
* `0x0055CF70` copies positions into a separate 16-entry store and calls
  `0x00671400`, the full-map `group_marker_data` renderer.
* `0x00671400` checks full-map mode, excludes the local player's ID, fills
  marker X/Y from world X/Z, uses the resolved name/layout metadata, and selects
  the `MapMarkerParty` template at `0x00671C55`.
* `_setMapMarker(1)` in `depictionjudge.lua` belongs to the separate actor marker
  path. Sending it successfully does not populate this full-map snapshot.

Payload layout, excluding the existing 0x20-byte SubPacket headers:

| Offset | Field |
| --- | --- |
| 0x00 | Location key, using the same zone header as the actor/group data |
| 0x08 | Sequence field |
| 0x10 + 0x28 * i | Actor ID |
| Row + 0x08 | Optional extended identity; zero for these player rows |
| Row + 0x14 / 0x18 / 0x1C | World X / Y / Z floats |
| 0x290 | Signed byte count; server bounds it to the 16 native slots |

The fixed payload is 0x298 bytes including zeroed padding. The current party
producer emits at most eight rows. The older external `0x18D` research note
quoted in the June content matrix has unit/offset mistakes: the count is
0x290, not 0x294; destination stride is 0x78 bytes, not 30 bytes; byte count width
does not make the native 16-slot array safe for 255 rows. The executable checks
above supersede those claims for this exact binary.

## Server behavior

`PartyPositionPacket` supplies the previously absent full-map snapshot.
`Session.RefreshPartyPositionSnapshot` runs after visibility publication and on
the player's regular `PostUpdate`, bounded to once per second. That cadence is
an implementation choice, not recovered retail timing. Periodic receipt also
updates a full map opened after both players stop moving.

Only ready, connected player members of the same exact party and area are
included. Peers must already be in the recipient's actor table so native
name/layout lookup has a published actor. Isolated areas, foreign/private areas,
loading Return peers, disconnected/replaced sessions, unknown actors and
nonfinite coordinates are excluded. Snapshot delivery uses the existing atomic
transport and actor-table generation gate. The next accepted snapshot replaces
the previous list; an empty snapshot clears old markers. A rebuilt actor table
does not inherit the previous generation's throttle.

This fixes the missing same-area full-map data path. Cross-zone full-map tracking
and native rendering still require separate client evidence. It does not claim
to fix every previously reported client crash.

## Verification and rollout

The isolated build is `.tmp/party-full-map-test/`; no running server executable
was replaced or restarted. The native evidence check and production Session
regressions cover the wire offsets, full capacity, movement, stationary updates,
throttling, Return readiness, departure, disconnect, exact-area isolation,
invalid coordinates, unknown actors and generation renewal.

Results: 16 native evidence checks, 24 full-map Session checks, 2,485 seamless
scenarios and all existing peer/login/Return/minimap checks pass. The
`--party-resolution-only`, `--teleport-handoff-only` and `--guildleve-widget-only`
production suites also pass. Builds complete with zero errors and existing
package/obsolete-API warnings. Tested isolated Map DLL SHA-256:
`96F7625750DF2629781108F0333570B9B85F04C5B800DB4103F842D343988F9B`.

After applying the rebuilt Map Server, check two party members in Gridania with
the full map open, then move, Return, cross a seam, leave/rejoin and relogin.
`[PartyMapPositions] viewer=... zone=... generation=... count=...` identifies
initial/clear/generation publication; `PartyMapPositions` / `0x018D` in transport
diagnostics identifies subsequent snapshots. Client placement and stability are
pending this test, even when the offline checks pass.
