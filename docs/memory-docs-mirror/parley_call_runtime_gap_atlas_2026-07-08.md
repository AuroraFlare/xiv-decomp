# Parley/call runtime gap atlas (2026-07-08)

## Short version

- Parley's target gate is now pinned: player has ready command `29497`, player `enableNegotiation()` is true, the selected target is not a player, and the target's `isNegotiatable()` returns `isPropertyEnabled(4)`.
- Local NPCs populate `charaWork.property[i]` from actor-class `propertyFlags`; dynamic BattleNpc defaults currently force `property[4] = 1`, which is useful for testing but risky as a blanket Parley rule.
- The `call` note is an NPC Linkpearl state machine: inactive `extra=true/calling=false` -> icon `293`, active `calling=true/extra=false` -> icon `292`, alert `calling=true/extra=true` -> animated icon `291`.
- Man206 has the right NPC LS id (`6`) and message-pack route; Man300 still needs the mesa shaman actors/target state and a captured `29497` payload before a real Parley outcome can be wired.

## Generated evidence

- Parley gate contract: `outputs/parley-call-runtime-gap-atlas-20260708/parley_target_gate_contract.csv` (7 rows).
- NPC Linkpearl state machine: `outputs/parley-call-runtime-gap-atlas-20260708/npc_linkshell_state_machine.csv` (8 rows).
- Implementation gap matrix: `outputs/parley-call-runtime-gap-atlas-20260708/implementation_gap_matrix.csv` (6 rows).
- Runtime probe plan: `outputs/parley-call-runtime-gap-atlas-20260708/runtime_probe_plan.csv` (5 rows).
- Source evidence index: `outputs/parley-call-runtime-gap-atlas-20260708/source_evidence_index.csv` (15 rows).
- JSON summary: `outputs/parley-call-runtime-gap-atlas-20260708/contract_summary.json`.

## Parley Gate

| Step | Gate | Local state | Risk |
| --- | --- | --- | --- |
| 1 | Player has Parley in a ready command slot | Player.cs seeds command[14] with 0xA0F00000 \| 29497; client slot numbering is recovered as ready slot 16. | Verify EventStart payload still points at command 29497 after any custom hotbar/ready-command changes. |
| 2 | Player negotiation is enabled | BattleSave has two flags; local init and sync currently set/sync only negotiationFlag[0], leaving the second flag default false. | Need a clear local meaning for negotiationFlag[1] before adding failure/lockout states. |
| 3 | Player negotiation flag sync reaches client | Player init property packet includes charaWork.battleSave.negotiationFlag[0]. | If runtime toggles are added later, they must queue the same property update, not only mutate server memory. |
| 4 | Current target exists and is not a player | No server-only work; the target must be an actor the client can select. | Mesa/director spawning must make the intended shaman actors selectable at the right quest phase. |
| 5 | Current target is negotiatable | NPCs copy actorClass.propertyFlags into charaWork.property[i]; BattleNpc defaults also force property[4] on. | Do not globally rely on BattleNpc defaults; Man300 should prove or set property bit 4 only for intended Parley shaman targets. |
| 6 | Command is judged by NegotiationJudge | AI command row 29497 carries the Negotiation/Parley flag; local command data row keeps the same boolean slot. | The command data flag opens the judge lane, but server still needs the 29497 EventStart target payload captured. |
| 7 | Gathering-menu overlap does not steal 22009 | WorldManager allows 22009 only for Shepherd class id 42 in the gathering menu helper. | Treat 22009 as a support/open-negotiation command and 29497 as the user-visible Parley command until captures prove otherwise. |

The big new clue is the target side. Recovered `CharaBaseClass.isNegotiatable()` is just property bit `4`; local `Npc.cs` loads those bits from `actorClass.propertyFlags`. So the next Man300 probe should not start by opening `Ask/NegotiationWidget`; it should first prove which mesa actors have property bit `4`, and whether setting it quest-locally makes `29497` appear.

## NPC Linkpearl State

| State | Server flags | Tray/list result | Transition |
| --- | --- | --- | --- |
| none | calling=false; extra=false | hidden / not listed | Initial/default state. |
| inactive / owned | calling=false; extra=true | 293 visible / 293; help 75802 | Player.AddNpcLs(id) or Quest.EndOfNpcLsMsgs(). |
| active / readable | calling=true; extra=false | 292 visible / 292; help 75803 | Quest.ReadNpcLsMsg() or Quest.RepeatNpcLsMsg(). |
| alert / new call | calling=true; extra=true | 291 visible animated / 291; help 75804; animated | Quest.NewNpcLsMsg(id). |
| selection | calling must be true | n/a / selected row | Player selects a callable NPC Linkpearl row. |
| Man206 route | NPC LS id 6 | 291 first, then 292 while reading / NPC LS id 6 row | man206 SEQ_005 calls quest:NewNpcLsMsg(6). |
| client canFire | calling true | n/a / n/a | System command 24213 is requested. |
| message pack helper | quest msgStep increments until complete | read transitions active/inactive / updates through playerWork/npcLinkshellChat property sync | onNpcLS calls scenarioHelpers.sendNpcLsMessagePack. |

Recovered `PlayerBaseClass.isNpcLinkshellChatCalling(id)` returns both `calling` and `calling && extra`; the duplicate-looking decompile in `NpcLinkshellListWidget` is best read through that lens. The server `SetNpcLs` mapping is the more reliable authority for icon interpretation.

## Gaps

| Priority | Surface | Gap | Next step |
| --- | --- | --- | --- |
| P1 | Man300 Parley | No quest-side Parley target actors are defined. | Identify or spawn the Ixal/Amalj'aa shaman actors for SEQ_030 and bind them to the mesa director/quest state. |
| P1 | Man300 Parley | Target property bit 4 needs quest-scoped control. | Probe property bit 4 on intended shaman targets and add a quest-scoped setter/spawn override only if needed. |
| P1 | Man300 Parley | Command 29497 EventStart payload is not captured locally. | Add a log-only capture for owner, event name, and params when command 29497 is clicked on a test negotiatable target. |
| P2 | Parley state machine | No server-side turn/score model exists. | Implement a disposable in-memory Parley session after payload capture; use update codes 14/15/19/20/22/28/29 first. |
| P1 | Man206 call | Dirty local files imply active work; preserve current Man206 state while testing. | Test NPC LS id 6 in current dirty state before making any code edits to Man206. |
| P2 | NPC Linkpearl UI | Recovered list widget has decompiler artifacts around calling/extra checks. | Use server SetNpcLs mapping as authority for icon interpretation: inactive 293, active 292, alert 291 animated. |

## Probe Order

1. Man206 call smoke: NpcLinkshellListWidget shows NPC LS id 6 and command 24213 routes to man206 onNpcLS.
2. Man206 read progression: completedPack true advances via StartSequenceForNpcLs(SEQ_010), not before.
3. Parley target property: Parley icon 29497 appears for the intended target and not for normal quest NPCs.
4. Parley EventStart capture: Target param slot is proven before any Man300 outcome mutation is added.
5. Parley widget sandbox: No client error; gauges, timer, selected icons, and ability availability update predictably.

## Immediate Implementation Bias

- For Man206, test the NPC Linkpearl path in the current dirty worktree before editing; the quest/content files already have local changes.
- For Man300, add logging first around property bit `4` and command `29497` EventStart payload. Only after that should a quest/director Parley session mutate sequence or encounter state.
- Do not use dynamic BattleNpc `property[4] = 1` as final proof that all battle actors should be negotiatable. It is a local presentation default and may over-expose the Parley icon.
