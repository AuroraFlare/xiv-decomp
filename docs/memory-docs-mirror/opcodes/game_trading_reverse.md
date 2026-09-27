# Player Trade Protocol Reverse Engineering

This note records the stock 1.23b player-to-player trade flow recovered from the
client Lua and the corresponding server implementation. The public opcode lists
are useful for naming the transport packets, but there is no dedicated player
`Trade` opcode in that list.

## Client surfaces

The relevant recovered client scripts are:

- `tools/outputs/lpb/decomp_further_20260617/lua/command/system/tradeoffercommand.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/command/system/confirmtradecommand.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/command/system/tradeexecutecommand.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/group/relationgroup/traderelationgroup.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/tradewidget.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/tradeeditwidget.lua`

`TradeRelationGroup` binds two members and exposes command variation `30001`.
The confirmation command returns accept/refuse through the ordinary event RPC
path. Once accepted, `TradeExecuteCommand` opens `TradeWidget`, polls its result,
and emits these operations:

| Value | Meaning |
| --- | --- |
| `1` | remove one offer slot |
| `2` | clear all offer slots |
| `3` | offer an item |
| `4` | offer gil |
| `11` | cancel |
| `12` | accept/fix offer |
| `13` | return to editing |

The widget has four slots per participant. Its own item-selection guard rejects
equipped items, exclusive/untradeable items, and an item already present in an
offer slot. Those checks are UI only and therefore must be repeated by the
server.

## Wire path

The trade is composed from existing packet families:

| Phase | Packets |
| --- | --- |
| Invite | group create/member packets, `0x017A` work sync, `0x0133` group-created acknowledgement |
| Accept/refuse | `0x012D` EventStart and `0x0131` EndEvent |
| Open/poll/reply | `0x012F` KickEvent and `0x0130` RunEventFunction |
| Offer sync | `0x016D`/`0x016E` inventory change wrapper, `0x0146`/`0x0147` set wrapper, `0x0148`-`0x0150` item/linked-item entries, `0x0152`-`0x0156` removals |
| Close | `0x0130` client function call, then `0x0131` EndEvent |
| Tear down | `0x0143` DeleteGroupPacket |

The accept path must end the `ConfirmTradeCommand` `commandRequest` event before
starting `TradeExecuteCommand`. The confirmation dialog and `TradeWidget` both
use event-widget slot 4; starting the new event first makes the client reject
`openWidget(4, "TradeWidget")` while the old `CommonAskWidget` still owns it.

`TradeExecuteCommand` must be kicked with event type `0`, matching ordinary
client-originated `commandContent` commands. The generic `KickEventSpecial`
helper uses type `5`; the client reports that context as `0x50`, accepts the
event, but returns an empty result from both `delegateCommand` calls without
creating `TradeWidget`. The same empty result was observed when forcing `0x08`
and `0x4C`, so those values are not valid substitutes for the command context.

The local trade package is `0x00FD`, capacity four. The owner sees linked-item
entries for their own offer; the counterparty sees normal item entries sourced
from the owner's actor id. The item packet's trading quantity is carried through
the existing temporary/dealing fields used by `_isTrading()` in the client.

## Server state machine

```text
idle
  -> invite relation group
  -> accepted / initialize two empty 0xFD offer packages
  -> delete invitation relation group
  -> editing (any edit clears both acceptance flags)
  -> both accepted
  -> validate a transfer snapshot
  -> remove all outgoing items
  -> add all incoming items
  -> close widgets and delete relation group
```

Validation is deliberately performed again after both players accept. It checks
the actor/item reference, exact source stack, quantity, duplicate references,
exclusive-item restriction, rare-item ownership, gil cap, and aggregate package
capacity. Capacity simulation first applies both players' outgoing items, so a
full inventory can still complete a balanced swap without permitting later
incoming stacks to overflow it.

Completion is serialized because both client event coroutines can observe the
two accepted flags and request completion during the same scheduler interval.
Only the first request may consume the relation group and execute the snapshot.

## Public references

- [Garlemald game opcodes](https://www.garlemaldsoftware.com/resources/game-protocol/game-opcodes/)
- [Garlemald packet headers](https://www.garlemaldsoftware.com/resources/game-protocol/packet-headers/)
- [Archived FFXIV Classic opcode wiki](http://ffxivclassic.fragmenterworks.com/wiki/index.php/Game_Opcodes)

The public tables name packet families and header fields; the trade operation
values and widget behavior above come from the recovered 1.23b client Lua.
