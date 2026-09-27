# Guildleve camp return: Now Loading

The supplied September 12 log identifies a same-public-area camp return:

- 13:11:37: node `0x44B00317`, `GLWP|12428|686|3|1280062`, starts
  `pushCommand` with event type `0x05`.
- 13:11:41: the client returns choice `3`; the server closes the event and
  waits 250 ms on `same-area-guildleve-completion-warp`.
- 13:11:42: `SameAreaWarp` saves zone 150 at `(292.470, 4.000, -544.592)`.
- 13:11:57 onward: movement checkpoints overwrite that with
  `(133.987, 6.649, -11.660)`. There is no staged map/readiness handshake in
  the supplied interval. The user reports remaining at Now Loading.

This establishes the shortcut and server/client position disagreement, not the
precise native loading-counter state. Healthy sockets do not establish arrival.

Completion-node returns now require the existing staged map-loading path even
within the same Area. The source-event phase disables node interactions only
for the returning viewer, cancels its Lua reply wait, and sends EventFinish with
the original talk/push type. After settling, the server finalizes that player's
node access before the reload latch, map/weather bootstrap and client-ready
barriers. The old completion-node shortcut is removed. This supersedes the
node exemption documented in `teleport_same_area_crash_2026-09-05.md`.

Finalization resolves the node's owning director as well as the player's current
director: an already-finalized participant must not globally despawn a node
still used by a peer. Rewards, destinations and placement data are unchanged.

Regression coverage lives in `tools/guildleve-completion-tests`,
`Fishing Tests/TeleportHandoffTests.cs`, and the guildleve static validator.
Deploy the rebuilt Map Server and repeat same-area solo and party returns,
then a cross-area return. Native-client loading completion remains an in-game
verification requirement; the offline harness cannot prove that UI outcome.
