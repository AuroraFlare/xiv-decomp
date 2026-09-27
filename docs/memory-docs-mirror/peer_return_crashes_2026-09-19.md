# Peer return and movement crash follow-up

The supplied 15:21–15:22 Map Server capture shows Illusive returning from the
completed leve first. Anzyr starts the same-area camp return at 15:22:27.889.
Anzyr's init builder runs at 15:22:28.195, before SetMap at 15:22:28.427 and
again for his own staged snapshot at 15:22:30.700. Illusive disconnects at
15:22:32.540; Anzyr's final ready/movement gate opens at 15:22:34.536.

`Session.UpdateInstance` previously checked the viewing client's readiness but
not the player being constructed. Once destination coordinates were assigned,
a ready bystander's ordinary spatial refresh could construct the still-loading
returner. The explicit WorldManager arrival path already gated the returner.
The shared Session visibility predicate now also requires a connected, ready
peer session bound to that exact Player. The predicate runs inside construction
as well as during spatial selection. No new delay or timer is introduced.

The subsequent 15:24–15:25 capture ends with Illusive disconnecting in zone 150
at (-233.853, 5.767, -813.610). It contains no recorded seamless handoff;
that position is outside the checked-in zone-150 seamless boundary rectangles.
Illusive's init builder runs at 15:25:43.044, but the aggregate transport counters
do not identify its recipient. This is insufficient to establish the second
crash's cause or prove either native client crash fixed.

Low-frequency `PeerActorLifetime` logs now identify ordinary peer construction
and removal by viewer, peer, actor-table generation, zones and readiness. Spawn
logs include the peer position. Explicit WorldManager arrival construction
already logs viewer and peer through `VisibilitySync`. These distinguish actor
range changes from map transitions in a future capture without enabling full
packet dumps.

Validation uses `tools/seamless-zone-tests`: the real Session proximity path
rejects loading, not-yet-ready, disconnected and replaced-session peers; the
first ready refresh constructs the peer and repeated refresh does not recreate
it. The fixture retains production Player spawn packets and stubs only unrelated
class/hotbar init work. Existing arrival flag, known-peer and seamless boundary
regressions also run. Builds are isolated under
`tools/outputs/guildleve-arrival-test`; no running server was replaced or restarted.
Native client confirmation on the affected server remains required.

## Matching local client captures and party markers

The local Forestall reports were subsequently found under
`C:/Program Files/Forestall Launcher/Windower/Crashes/`:

- `ffxivgame-crash-20260919-152229-030-pid-20320`: actual fault time
  15:22:29.030, EIP 0x00401290. The exception-context stack again contains
  0x009D365F, 0x0075B569, 0x00744F6E, actor ID 12 and Anzyr's name. The
  retained delivered stream includes actor-12 construction/name/init before
  Anzyr's own ready gate. Unlike the earlier morning bug, its 0xCE reference
  is already zero; this capture must not be described as the old local-arrival
  sentinel defect.
- `ffxivgame-crash-20260919-152541-946-pid-69028`: actual fault time
  15:25:41.946, EIP 0x00671DE3. The final delivered batch removes actors
  0x44B00649, 0x44B00648, 0x44B000DF, 12 and 0x44B00696. The exception
  context faults reading `[eax + 0xB39]`, with EAX 0x401449F8, through
  callback return 0x0067FA03. This establishes an invalid native pointer after
  actor culling, but does not prove which removed actor owned it. The later
  server init-builder log at 15:25:43 is **after** the fault, not its trigger.

The native Lua `judge/depictionjudge` sets map marker 1 for player-party members
through `_setMapMarker`; it operates on the actor object. Server spatial culling
previously removed same-area party peers and stopped supplying their positions
outside the ordinary visibility radius. The reported missing marker and the
actor-12 removal motivate keeping same-area party player actors alive.

Session proximity refresh now adds connected members of the same exact party
and area to its visibility set. Distant members receive current position
snapshots through the existing 0xCF packet and Session gate. A known party peer
survives a same-area loading interval without receiving new loading-state work;
new peers still require readiness. Leaving the party, disconnecting, replacing
the session, entering an isolated area or changing area identity does not qualify
for retention. This is a server visibility policy, not a recovered retail range.
No cross-map coordinate projection or invented party-marker packet is used.

Six further production-path checks cover distant retention/position delivery,
loading retention, re-entry without reconstruction, area separation, disconnect
and party departure. Actual marker rendering and both crash reproductions still
require a client retest with the rebuilt Map Server.
