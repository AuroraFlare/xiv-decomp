# Party relogin and seamless marker lifetime

Status: server corrections and offline regressions complete; native rendering and
crash resolution require a fresh client run. No server was restarted or deployed.

## Latest evidence

The 16:04–16:06 log supplied in attachment
`08b17286-eee2-45b4-ab9e-3ebdcf535592` shows both players bootstrapping party
`0x8000000000000020` with two members. It also contains the marker-delivery and
Return-refresh diagnostics from the preceding changes. This is a test of those
changes, not merely another older crash report.

At 16:06:05.079, Illusive crosses from public zone 152 to 150. The server removes
Anzyr from Illusive's actor table at 16:06:07.072. Forestall's delivered-byte log
records the actor-12 `0x00CB` at 16:06:07.8150144 EDT. All 25,488 retained incoming
bytes parse completely; no `_setMapMarker` call appears in that retained window.

The matching Forestall report/dump is
`ffxivgame-crash-20260919-160612-793-pid-80940` in
`C:/Program Files/Forestall Launcher/Windower/Crashes/`. Its actual exception is
an access violation at `0x004CFE4A`, reading `[edi + 0x98]` with EDI `0x3F800000`.
The stack includes `0x00680AFA`, the return from marker position traversal, and
`common/mapMarker.le.spk`. The earlier 15:58:31 dump, PID 33644, faults at the
same instruction with EDI `0xC225978F`.

This is a different native fault from the earlier peer-name fatal handler.
It supports investigating a stale marker/position reference after actor culling.
The available dump memory does **not** identify the marker's actor, prove that
Anzyr's removal caused the corruption, or establish successful execution of a
server-issued marker-clear call. The last movement packet alone is not proof of
the cause. Raw dumps and packet logs remain outside the repository.

## Corrections

Map's login constructor used synchronized online presence as the native party-row
enable byte. World's existing implementation keeps retained party rows enabled.
World skips its constructor when Map acknowledges that group ID, so a member
offline during the first login could remain hidden in that client's roster.
Map now matches World's enabled rows, including unresolved/remote members and
the initial login constructor. Synchronized transport presence remains separate;
membership, offline action eligibility and World persistence are unchanged.

Before a known Player actor is culled, Session now queues `_setMapMarker(nil)`
before `0x00CB` inside the existing packet-state gate. Cleanup also covers native
DepictionJudge markers without an explicit server marker token. It does not
depend on the departing player's readiness or current area, and it is not sent
to an already-removed actor. Actor-table resets discard marker delivery tokens.
The peer removal diagnostic includes `markerClearQueued=True`; that records
queue admission, not a client acknowledgement.

The corrected roster is relevant to native party classification and icons, but
neither this nor the earlier explicit marker setter proves visible icons in the
client. Keep both rendering and the boundary crash open until retested.

## Verification

- Isolated Map/test build succeeds with zero errors.
- Real login constructor packets: eight checks cover both recipients, two rows,
  recipient-first ordering, enabled offline-member rows and one constructor.
- Player marker/lifetime fixture: eighteen checks, including clear-before-cull,
  cross-area/loading departure, explicit nil, no callback to an absent actor,
  native-only marker cleanup and fresh marker publication on re-entry.
- Seamless boundary suite: 2,485 scenarios pass. Existing peer arrival/readiness
  and retained Return baseline checks pass.
- Party area/presence, teleport handoff/private-scene retirement, guildleve
  widget, Return and relogin/arrival suites pass.
- The party fixture's unrelated Trust source assertion was stale after the
  earlier departure-phase refactor. It now checks the existing `departureArea`
  call before visibility closes and handles a missing search token as an
  assertion failure rather than throwing from `IndexOf`. No Trust runtime
  behavior changed.

The isolated artifacts are in `.tmp/party-login-marker-lifetime-test/`.
`Map Server.dll` SHA-256:
`656B79ED9BC15AD41B43AC7D79D5FF7A1BC007DFFCFE1EE55064C1CE882EF582`.
No SQL change is required.

Client retest: log back in while the other party member is offline, then have
that member connect. Check the roster and map/minimap while both are at Emerald
Moss. Cross the same 152/150 boundary, then cross back; also check Return after
finishing a guildleve. A new dump is still needed if the crash repeats.
