# City NPC warp loading follow-up

`PopulaceCompanyWarp` is shared by Limsa, Gridania and Ul'dah. The user reports
two successful warps followed by a third that stays at Now Loading. The menu
accepts a destination, but movement never completes. Earlier Lua handoff/fade
changes did **not** resolve the report.

The 16:43 Gridania excerpt starts at `talkDefault`, owner `0x46700080`, player
4. Its only EventUpdate is empty, type `0x65`, val1 `1`. It contains neither
a numeric destination reply nor an `[AethernetWarp]` handoff. The saved
coordinates `(166.516, 25.033, -1553.932)` are the **source**, not arrival.
Earlier saved Limsa coordinates likewise must not be treated as proof of
arrival. Healthy sockets and empty queues only establish transport activity.

The supplied 12.992-second recording shows Serpent Private White's menu,
farewell and then black/Now Loading, with no visible arrival before it ends.
The recording and the Kirk log are separate attempts.

The cities use multiple seamless public Areas. `ExecuteReservedZoneChangeAsync`
already calls `ResolveSeamlessZoneChain` with the target coordinates before
comparing Areas. These captures do not establish an incorrect destination ID.

## Client evidence

Recovered `PopulaceCompanyWarp.eventAfterWarpOtherZone` calls `_fadeOut(1)`,
`_waitForFading()`, then `_fadeInAfterWarp()`. This is an explicit loading-state
operation, not merely a cosmetic NPC farewell. The menu itself contains the
farewell scheduler/dialogue before returning its choice.

The local IDA export `../IDA Free/ffxivgame.exe_20260527205729.asm` shows:

- `0x00732250` registers `_fadeInAfterWarp` through `0x006DE7B0`, vtable offset
  `+0x100`; the player table at `0x00FD795C` points to `0x006E3260`.
- `0x006E3260` calls `0x0075B500` (opens loading through `0x004D6FE0(0, 0)`),
  calls `0x0075B300` (locks input), and sets player byte `+0x166`.
- Loading helper `0x0056A5F0` increments the NowLoading counter at `+0x21C`.
- Arrival setup `0x0058ADC0` selects the native loading path (`+0xE8 & 0x80`)
  for spawn type 10. The state machine `0x0058A090` starts and finishes that
  loading path itself. Its begin call uses the existing-loading guard, so an
  extra Lua call is not by itself proof of two counter increments on every hop.
- Native post-warp `0x008A44D0` also handles the Lua `+0x166` input-lock flag.
  This is a separate lifecycle from ordinary event closure.

The arrival functions are also preserved in
`outputs/consumable-return-animation-decomp-20260904/native-verified-targets.txt`.

## Change and verification boundary

`Player.UpdateEvent` previously discarded the packet metadata and passed only
Lua parameters to `LuaEngine.OnEventUpdate`. That method unconditionally
removed the current wait, including explicit EventStart waits. An unrelated
empty reply could therefore resume the destination menu with nil, closing
the event without requesting movement.

The handler now receives the full packet. Waits snapshot event type, owner
and name; only a valid reply for this player and matching type, while that
event context is still active, can claim the exact wait. Mismatches preserve
it. Matching empty replies still resume cancellation/void-returning functions.
The packet contains no NPC owner/function/sequence identifier, so this does
not fully correlate delayed callbacks of the same event type.

Native `0x00894AB0` obtains the return selector from its event context through
`0x00892550`, then sends through `0x00894090` / `0x0075E670`. Treating every
`0x012E` payload as the active talk's result loses that distinction.

`RequiresStagedSameAreaTravel` now includes NPC arrival type 10. Those hops
use the existing event teardown, map/weather readiness and actor bootstrap
barriers even when the destination is the same Area. Previously they took
the immediate warp/weather/EventFinish shortcut.

`PopulaceCompanyWarp.lua` now hands the accepted destination directly to
`DoZoneChange` with arrival type `0x0A`. It does not invoke
`eventAfterWarpOtherZone`, create a separate Lua after-warp loading owner, or
wait for an additional client fade reply. The shared handler still owns event
closure, same-area movement, and cross-area transitions. Other quest/cutscene
after-warp wrappers are unchanged.

Diagnostic sequence:

1. `[AethernetWarp] menu` identifies the source NPC and Area.
2. `[LuaEventReply] Ignored unmatched callback` records rejected metadata
   without consuming the destination wait.
3. `[AethernetWarp] native-loading handoff` records the accepted choice and
   requested Area. `menu ended without destination` identifies cancel/invalid
   returns instead.
4. `[ZoneTravelStage] ... spawnType=10` identifies same-area staging; existing
   `[ZoneTransition]` logs track readiness afterward.

Run `dotnet run --project tools/company-warp-tests/CompanyWarpTests.csproj`.
The executable uses production Lua coroutine helpers and checks the logged
Limsa route, every Gridania destination, other-city routing, cancellation,
invalid replies, and 20 consecutive Limsa handoffs. It rejects the prior script
when that script invokes the extra loading helper.

`Fishing Tests/CompanyWarpReplyTests.cs` also exercises the real packet parser,
Player handler, LuaEngine registry and MoonSharp coroutine. It interleaves
the captured empty `0x65` callback, notice callbacks, malformed packets and
another player's reply before each of 20 valid destination replies. It also
checks matching empty replies and explicit EventStart waits. Run it with the
teleport transport/staging regressions:

```powershell
dotnet build 'Fishing Tests/Fishing Tests.csproj' --no-restore -m:1 -nr:false -p:UseSharedCompilation=false
dotnet 'Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll' --teleport-handoff-only
```

These fix demonstrable server behaviors, but do not prove which caused each
reported native-client hang. No automated test runs the game's loading UI.
Deploy the rebuilt Map Server **and** updated Lua script; a Lua-only update
cannot apply the C# corrections. Repeat several same-area NPC hops, then
destinations crossing seamless boundaries. If it hangs again, preserve logs
from the menu marker onward to distinguish selection, admission and readiness.
