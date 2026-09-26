# Grand Company enlistment event cleanup

Scope: determine whether a declined `Com0[lgu]7` enlistment choice needs a second success/ceremony method merely to dismiss the Grand Company status UI. This is a bounded client review; it does not claim a watched retail packet trace.

## Recovered client path

`PlayerBaseClass._onPostEvent` at bytecode PCs 0–14 (`0x486A..0x48A2`) performs the ordinary event teardown. In order it cancels desktop widget mode 16, calls `desktopWidget:closeAllEventModeWidget()`, unlocks target-cursor control, and unlocks the player's lock-on and movement controls.

`DesktopWidget.closeAllEventModeWidget` at PCs 2–9 (`0x1A164..0x1A180`) calls:

```text
closeWidget(4, nil)
closeWidget(5, nil)
```

The company-specific close helper independently identifies the status UI as tier 5: `closeGrandCompanyStatusWidget` at `0x2939C..0x293A8` tail-calls `closeWidget(5, "GrandCompanyStatusWidget")`. Together these methods establish that normal post-event cleanup includes the tier containing the Grand Company status widget. A declined server choice should therefore end its existing event normally; replaying the rank/enlistment success ceremony as a cleanup operation would add unsupported dialogue and reward presentation.

The NPC `_onEventCancel` method is narrower: it clears targeting and resets fades for specific default/command event names. It does not establish a separate GC-widget close command. The company officer's `eventRankUpDone` explicitly closes the GC status widget after the successful rank-up scheduler, which remains appropriate for that success path and is not evidence that a declined menu should invoke it.

## Native qualification

The bounded native slices show packet/event dispatcher case 305 (`0x0131`) forwarding through virtual callbacks, and show two client wrapper vtables containing `sub_8977B0`, the wrapper that constructs the literal `_onPostEvent` call. The available slices do not prove the complete receiver/vtable chain from this server's EndEvent packet to that exact wrapper. Live decline behavior and the packet-to-callback edge therefore remain unverified.

The implementation keeps the safe source-backed behavior: nil, boolean, zero, negative and string results do not enlist or grant rewards, and the ordinary server event is ended. It does not replay a success ceremony or invent a close-only quest method.

## Reproduction

Run:

```powershell
python -X utf8 outputs/job-gc-decomp-20260907/reviews/gc/reproduce_event_cleanup.py
```

This regenerates [the exact Lua bytecode slices](enlistment-cleanup-bytecode.txt), [the bounded native slices](enlistment-cleanup-native.txt), and [the source sizes and SHA-256 hashes](enlistment-cleanup-sources.json). The manifest covers five installed Lua bytecode sources plus the analyzed `ffxivgame.exe` assembly listing.
