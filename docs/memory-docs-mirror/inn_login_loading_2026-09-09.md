# Inn login loading fix

Reported symptom: logging back into an inn can remain on a black loading screen,
both after a bed logout and after an ordinary logout while standing in the room.

The September 5 inn privacy change (`b2cc0de718`) sets `Area.isIsolated` for inn
zones. It filters other players from proximity views; it does not allocate a
temporary room that needs to be restored on login. This privacy behavior remains
enabled.

## Login dependency

The recovered client `ObjectBed.initForEvent` always calls
`worldMaster:_getMyPlayer():_readyInnBed(bed)`. This initializes the inn's bed
association and can start the dream/login event. See
`tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/objectbed.lua` and
the adjacent recovered `command/system/logineventcommand.lua`.

Initial login defers actor visibility while the client applies its scene.
`Session.UpdateInstance`, including forced calls, cannot publish nearby NPCs
until that readiness gate opens. The initial snapshot previously omitted the
bed, leaving a dependency that can prevent inn initialization from finishing.
This is the suspected explanation for the reported loading screen, not a
client-verified reproduction of the report.

`CompleteInitialLoginZoneIn` now includes the current city's bed after the local
player and scene masters in its existing atomic packet batch. The bed uses normal
NPC construction and Session tracking, so the first normal visibility update does
not reconstruct it. Other guests and furniture retain their normal visibility
rules. No readiness gate or dream code is changed. Standing logouts retain dream
code zero; deliberate bed logouts retain their existing dream/wake-up behavior.

The bed classes are `1200378` (Limsa), `1200379` (Gridania), and `1200380`
(Ul'dah), using the recorded NPC placements in zone 244. Missing or failed bed
publication produces an `[InnLogin]` warning rather than choosing another city's
bed.

## Verification and deployment

Build Map Server, then run `tools/zone-mailbox-tests/ZoneMailboxTests.csproj`.
Its inn tests capture real NPC spawn/init/script binding packets with transport
suppressed and without loading a character database. They cover all three rooms,
standing login, dream codes 1/2/20/21/35, deferred furniture, other guests,
repeated publication, normal visibility after readiness, missing beds, and stale
player/session ownership. Existing inn privacy tests cover chat and emotes too.

Deploy the updated **Map Server** build and restart that service. There is no
database migration or client patch for this change. In-game confirmation remains
required:

1. Log out while standing in each inn and log back in; loading should finish
   without a wake-up animation.
2. Log out through each inn bed and log back in; waking should finish and control
   should return. Also exercise bed quit and reconnect.
3. With two guests in the same inn, confirm neither guest nor their local
   chat/emotes appear in the other's room.
4. Confirm `[InnLogin] Published ...` appears in Map logs before the client-ready
   messages, without a missing-bed warning. If loading still stalls, retain the
   session's login/progress log sequence to identify the remaining dependency.

## Follow-up: error 30002 on bed logout to character selection

The September 9 16:34:57 Map log shows the bed returning choice 3, a successful
character save at the Gridania bed, and a successful World session-end
confirmation. No cleanup exception occurred. The player's screenshot shows
server error 30002 at that logout.

A separate World transport bug was reproduced with real loopback sockets:
`ZoneServer.ProcessReceive` defers game-client flushing until the entire Map
receive buffer has been dispatched. If the client logout packet (`0x000E`) and
Map's session-end confirmation (`0x1001`) share that buffer, handling the
confirmation closes the game connection and discards the queued logout packet.
The client receives EOF without its character-selection transition. Quit
(`0x0011`) has the same ordering risk.

Normal confirmed logout now removes the exact session from the registry, drains
its outgoing packets under the send lock, and then closes the game connection
and chat channel. Waiting for the send lock also handles an already active
flusher; a nonblocking flush alone would still lose the final packet. Replacement
and invalid/stale confirmation behavior remains covered by the session suite.

The new coalesced-receive test failed with `Unexpected end of test socket` before
the fix and passes afterward. All 29 character-session regression scenarios pass,
including the competing-flusher test. Deploy/restart **World Server** for this
follow-up; keep the Map inn-login fix already deployed. No protocol or database
change is required. Client-visible return to character selection still needs an
in-game retest.

## Follow-up: waking beside the mattress

The September 9 17:19:33 login restored Gridania's sleep marker at
`157.550, 0.000, 165.050` with rotation `+1.530` and dream code 35. The earlier
bed interaction's client movement record used rotation `-1.530`; server cleanup
overwrote it with the positive value. The screenshot shows the waking character
beside the bed.

The recovered `ObjectBed.askLogout` uses these exact `_setPosDirInn` anchors:

| Inn | X | Y | Z | Rotation |
| --- | ---: | ---: | ---: | ---: |
| Limsa | -162.42 | 0 | -154.21 | -1.56 |
| Gridania | 157.55 | 0 | 165.05 | -1.53 |
| Ul'dah | -2.65 | 0 | 3.94 | -1.52 |

These are client-authored animation anchors in zone 244.
`SetActorPositionPacket` serializes rotation
directly, so changing its sign reverses the animation's facing by approximately
half a turn. `TryGetInnBedSleepPosition` now preserves the client's negative
rotations. The pre-login Lua reapplies that canonical pose only when the saved
XYZ already identifies a bed logout, repairing legacy positive-facing saves
before the player snapshot and dream event. Standing logouts are unchanged.

The regression failed on the old positive rotation and passes for all three
inns. It checks the actual spawn packet, executes `onBeginLogin` with the real
pose methods, and covers old saves, repeated preparation, and standing logouts.
The Map build and full inn/privacy/mailbox suite pass. Deploy the updated
**Map Server and `Data/scripts/player.lua`**, restart Map, and confirm both the
wake-up alignment and bed logout in-game. No database migration is needed.
