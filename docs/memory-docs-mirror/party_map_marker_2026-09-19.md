# Party marker follow-up

Latest local screenshots confirm the cyan dot on the minimap, while the full
map remains empty. See `party_full_map_positions_2026-09-19.md`: full-map markers
use a separate `0x018D` position snapshot, now implemented for ready same-area
party members and pending a client retest.

Follow-up: the user's 16:06 test still lacked a visible icon and crashed in native
marker position traversal. See `party_login_marker_lifetime_2026-09-19.md` for
the login-row correction and clear-before-cull change. This earlier setter's
queue diagnostics do not establish successful native rendering.

The user's Emerald Moss screenshots show Anzyr's party-list row but no identifiable
party map/minimap marker. Their 15:39–15:44 Map log confirms the previous retention
build is active: at 15:42:30.946 viewer 1 constructs ready peer 12 in zone 152;
the reverse construction follows at 15:42:31.037. These observations show that
retaining actors/positions alone did not establish live marker rendering.

The recovered client `judge/depictionjudge.lua` calls `_setMapMarker(1)` for
player-party members. This pass explicitly refreshes that existing native marker
after a ready peer is known to the viewing client's actor table. It uses the
existing `noticeEvent`/RunEventFunction envelope already used for escort marker
refreshes. The refresh does not replace/recreate the party roster or actor.
An initial actor-work callback can precede final party membership; this is a
possible explanation, not a proven native failure in the supplied capture.

Session tracks marker delivery by peer object and actor-table generation. Normal
visibility refresh retries when the client gate is busy; after accepted delivery
it does not resend on every tick. Loading/unknown peers cannot receive the call.
Leaving the same-area party clears an explicitly installed marker with nil if
the actor remains visible; actor removal invalidates tracking. A new actor-table
generation requires fresh delivery. Existing distant-party position updates and
isolation/area/session checks remain in place.

Production Session tests cover late membership, explicit type-1 payload and
viewer/owner addressing, loading suppression, repeated-refresh suppression,
generation renewal and explicit nil removal. The seamless suite passes 2,485
scenarios. This verifies server packet behavior only; successful native rendering
of this player-targeted call still requires a client retest.

The isolated build is under `tools/outputs/party-marker-test/`. No running server
was replaced or restarted. The new `[PartyMapMarker] viewer=1 peer=12 ...
enabled=True` log identifies delivery admission on the affected server.
