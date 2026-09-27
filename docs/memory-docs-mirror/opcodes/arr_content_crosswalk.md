# ARR Content/Event Packet Crosswalk

This note records the "realistic path" for using public 2.x/3.x-and-later
packet data to inform the local 1.23b Hamlet Defense work.

Scope is deliberately narrow:

- Public historical/static sources only.
- No live retail packet capture.
- No claim that later opcode numbers map directly to 1.x numbers.
- Hamlet-specific packets remain 1.x-only unless a reliable historical layout
  appears.

## Sources Inspected

| Source | What it contributed | Limit |
| --- | --- | --- |
| Local 1.23b opcode catalog | Hamlet names `0x01A6` and `0x01A8`, plus 1.x event, work, group, and message families | Names without full Hamlet payload layouts |
| Sapphire `ThreePointOh` branch | Public 3.0-era emulator packet names, event wrappers, director vars, content-finder/update packets | Not ARR 2.0 and not Hamlet |
| FFXIVOpcodes `v1` tag | Later public IPC names showing stable event/director family names after opcode shuffles | 5.x-era data, not 2.0 |
| Machina `v2.0` tag | Public FFXIV bundle/message header layout and capture-library framing | No gameplay opcode table |
| Sapphire opcode reversing writeup | Method: compare handler shape/order and nested event families, not raw opcode values | Modern executable workflow, not a 1.x payload source |
| XIV Dev packet structure | Modern terminology for frame/segment/IPC header separation | ARR-side structure, not 1.x Hamlet |

Useful public links:

- https://wiki.ffxivrp.org/pages/Game_Opcodes
- https://wiki.ffxivrp.org/pages/Packet_Headers
- https://github.com/SapphireServer/Sapphire/blob/ThreePointOh/src/common/Network/PacketDef/ServerIpcs.h
- https://github.com/SapphireServer/Sapphire/blob/ThreePointOh/src/common/Network/PacketDef/Zone/ServerZoneDef.h
- https://github.com/SapphireServer/Sapphire/blob/ThreePointOh/src/world/Network/PacketWrappers/EventPlayPacket.h
- https://github.com/SapphireServer/Sapphire/blob/ThreePointOh/src/world/Event/Director.h
- https://sapphireserver.github.io/dev/2019/12/23/fixing-opcodes.html
- https://github.com/karashiiro/FFXIVOpcodes/blob/v1/FFXIVOpcodes/Ipcs.cs
- https://github.com/ravahn/machina/blob/v2.0/Machina.FFXIV/FFXIVBundleHeader.cs
- https://github.com/ravahn/machina/blob/v2.0/Machina.FFXIV/FFXIMessageHeader.cs
- https://xiv.dev/network/packet-structure

## Main Finding

The public Sapphire branch does not preserve pure ARR 2.0 packet data. It starts
at the 3.0-ish emulator line, where Hamlet Defense is already gone. That means
`0x01A6` and `0x01A8` should stay anchored to the 1.23b client and local DAT/UI
resources, not inferred from later opcode numbers.

The useful later data is the generic content plumbing:

- event start/play/finish/resume/update flows
- director ids, director sequence/flags, and director vars
- event log messages with argument-count variants
- guildleve and leve-complete packets
- content finder/update/status packets
- work/sync-tag style state propagation

## Crosswalk

| 1.23b family | Later public family | Confidence | Notes for Hamlet work |
| --- | --- | --- | --- |
| `0x01A6` `HamletSupplyRanking` | No direct later family found | `likely_dead` | Hamlet did not carry forward. Keep non-empty ranking payloads disabled unless a 1.x capture/client layout is recovered. |
| `0x01A8` `HamletDefenseScore` | No direct later family found | `likely_dead` | Treat as a dedicated 1.x score UI packet. Later content packets can help with bootstrap/flow, not the row layout itself. |
| `0x012D` event start | Sapphire client `StartTalkEvent`, `StartEmoteEvent`, `StartWithinRangeEvent`, `StartUIEvent`; modern `EventStart` | strong family match | Later clients split event-start triggers. Match actor/handler/event args, not numeric opcode. |
| `0x012F` kick/work-sync request | Sapphire `PushEventState`, actor-control director init/clear, director-event flow | medium | Likely part of event/director bootstrap. Do not assume it opens Hamlet score by itself. |
| `0x0130` run event function | Sapphire `EventPlayHeader`, `EventPlay2/4/8/16/32/64/128/255`, update/resume scene variants | medium | Later event packets carry actor id, event id, scene id, flags, param count, and uint32 params. Good shape reference for 1.x UI bootstrap probes. |
| `0x0131` end event | Sapphire `PopEventState`; modern `EventFinish` | strong family match | Later finish packets carry handler id, event/result byte, and event arg. |
| `0x0133` generic `requestedData` | Sapphire `UpdateContent`, `UpdateFindContent`, `NotifyFindContentStatus`, content clear/attain flags | medium | ARR-era content state is more specialized. For 1.x Hamlet, keep probing `requestedData` keys and client data requests rather than inventing a modern equivalent. |
| `0x0137` actor/work property sync | Sapphire `SyncTag32..3072`, `DirectorVars`, actor/player update packets, `FatePcWork`, `FateContextWork` | strong concept match | Work sync survives as state propagation but not as one stable opcode. Keep Hamlet HUD/state values on `0x0137` locally. |
| `0x0157-0x016A` game text/messages | Sapphire `EventLogMessageHeader/2/4/8/16/32`, `GameLog`, `LogText`, `LogMessage`, `Text` | strong family match | Use handler/director id, message id, arg-count variants as the later shape reference for Hamlet battle notices. |
| `0x017C-0x0186` group/content member list | Sapphire party/update packets plus `UpdateContent`/content finder status | weak to medium | Member list concepts persist, but later content membership is not a clean numeric continuation of the 1.x group chunk range. |
| `0x0196` special event work | Sapphire `DirectorVars`, `FatePcWork`, `FateContextWork` | medium | Best candidate for duty/director-local state alongside `0x0137`. Useful when Hamlet needs objective/timer variables. |
| Guildleve/leve state around Hamlet-like objectives | Sapphire `Guildleves`, `Guildleve`, `LeveCompleteFlags`, `LeveCompleteFlag` | strong family match | This is the best later reference for leve-like objective lists, completion flags, and shared "content but not instance dungeon" plumbing. |

## ARR-Style Shape Anchors

These later public structures are useful as matching anchors:

| Later family | Durable fields |
| --- | --- |
| Event play variants | actor id, event id, scene id, scene flags, param count, repeated uint32 params |
| Event start/finish | target/handler id, event byte, flags/result byte, event arg |
| Event log messages | director/handler id, message id, arg count, repeated uint32 args |
| Director vars | director id, sequence, flags, 10 one-byte vars |
| Update content | territory type, kind, value1, value2 |
| Update find content | territory type, kind, value1-value4 |
| Notify find content status | territory type, status, role counts, matching time |

## Practical Next Steps

1. Keep `0x01A6` and `0x01A8` treated as 1.x-only dedicated packets. Empty or
   very small debug probes are fine; guessed non-empty payloads should stay
   behind explicit debug commands.
2. Use later EventPlay/EventFinish/DirectorVars shapes when designing Hamlet UI
   bootstrap probes around `0x012F`, `0x0130`, `0x0131`, `0x0133`, `0x0137`, and
   `0x0196`.
3. Log and compare local packet sequences by family:
   `event-start -> event-play/run-function -> requestedData/work-sync ->
   score/ranking -> end-event`.
4. For score UI specifically, prioritize local 1.x artifacts:
   `HamletDefenseScoreWidget`, `HamletDefenseRankingWidget`,
   `hamletDefScore.csv`, `xtx_hamletDefScore.csv`, and client/decomp strings
   such as `_getHamletDefenseScore` and `_getHamletDefenseScoreAll`.
5. For objective/timer/member state, borrow the ARR shape vocabulary:
   director id, sequence/flags, small director vars, territory/content id, kind,
   and repeated uint32 args.

## Bottom Line

Later ARR-style public data cannot recover Hamlet packet layouts directly, but
it does tell us where not to look. Hamlet score/ranking probably live in
dedicated 1.x packets, while the surrounding UI and duty flow should be hunted
through event, work-sync, director, generic-data, text-message, group, and
guildleve-like packet families.
