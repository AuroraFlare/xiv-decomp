# Mob Nameplate Hate Type Decomp

## Short answer

Red nameplate is probably not a separate enmity-color path. In the recovered client Lua, red and purple are the same `DepictionJudge.judgeNameplate` branch:

1. The mob must have `npcWork.hateType` outside the passive/hostile values.
2. The mob must have a monster party occupancy group.
3. The viewer must be a member of that occupancy group to get red. Otherwise the same claimed mob renders purple.

The easy missing local path is likely presentation claim, not raw hate. The server already builds `presentationClaimMemberIds` from attack target/engage before real positive hate has to exist, and it already sends monster-party occupancy packets. But `GetHateTypePacket` still only sends the combat-claim `hateType` when `ShouldShowCombatNameplate()` sees positive hate.

Latest easiest proof path: no new C# or Lua command should be required. Stand outside auto-attack range, attack-target a mob so opcode `0x00CD` runs `StartAttackPresentationClaim`, then run the existing marker command:

```text
!setnpctargetmarker 3 0xA0F50911
```

If that turns the mob red for the caller, the missing red data is confirmed as `npcWork.hateType = 3` plus existing presentation occupancy, not positive enmity. Standing out of range avoids the first auto-attack/hate update. `!workvalue @t npcWork.hateType npcWork/hate 3` is still a useful caller-only variant, and the cleaner no-timing proof is still a tiny temporary Lua command that calls `StartAttackPresentationClaim(player)` and then `SetNpcTargetMarker(3, 0xA0F50911, true)`.

## Recovered client path

- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/group/partygroup/monsterpartygroup.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/group/partygroup/playerpartygroup.lua`

`NpcBaseClass` syncs `npcWork.hateType` under the `npcWork/hate` tag and exposes `getHateType()` from `npcWork.hateType`.

`DepictionJudge.judgeNameplate` reads `getHateType()` and applies these mob colors:

| `hateType` | Recovered client color branch | Local meaning |
| --- | --- | --- |
| `1` | `1, 1, 0.5, 1` | Passive/yellow |
| `2` | `1, 0.7, 0.2, 1` | Hostile/orange |
| not `1` or `2`, with player in mob occupancy group | `1, 0.38, 0.44, 1` | Claimed by viewer/party, red |
| not `1` or `2`, without player in mob occupancy group | `0.6, 0.45, 0.94, 1` | Claimed by someone else/no occupancy, purple |

Use local `hateType = 3` for the combat-claim branch. The decomp branch is technically "anything except 1 or 2", so `0` would also fall into claim-color handling if sent accidentally.

Important line anchors from this pass:

- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:533` yellow/passive branch.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:541` orange/hostile branch.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:551` reads `getParty():_getOccupancyGroup()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:554` red branch when occupancy contains my player.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:561` purple fallback branch.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:80` syncs `hateType`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:104` tags it as `npcWork/hate`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:148` returns it from `getHateType()`.

## Why red currently looks enmity-based

Local code does have the right pieces, but the final nameplate packet is still gated on positive hate:

- `Map Server/Actors/Chara/Npc/BattleNpc.cs:936` builds the `npcWork/hate` packet.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:942` computes `showCombatPresentation` with `ShouldShowCombatNameplate()`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:947` sends local combat-claim `hateType`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1302` currently defines `ShouldShowCombatNameplate()` as positive hate only.

That means the occupancy packet can be ready, but the client still receives `hateType = 1` or `2` until hate exists, so it never enters the red/purple color branch.

## Easier non-enmity path

The easier path is to treat `presentationClaimMemberIds` as enough to drive the client combat-claim nameplate:

- `Map Server/PacketProcessor.cs:412` handles the client target packet.
- `Map Server/PacketProcessor.cs:417` detects an attack target.
- `Map Server/PacketProcessor.cs:430` calls `BattleNpc.StartAttackPresentationClaim(claimPlayer)` before normal engage/hate necessarily exists.
- `Map Server/Actors/Chara/Player/Player.cs:1719` and `Player.cs:1733` also call `StartAttackPresentationClaim` on engage.
- `Map Server/Actors/Chara/Player/Player.cs:1748` clears the presentation claim on disengage.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1218` builds `presentationClaimMemberIds`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1236` syncs combat claim members.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1296` already has `HasCombatClaimMembers()` as `presentationClaimMemberIds.Count > 0 || positive hate`.

So the smallest behavior change to test is:

1. Split "should enter client combat-claim branch" away from "has real positive hate".
2. Let that presentation check use `HasCombatClaimMembers()` or `presentationClaimMemberIds.Count > 0`.
3. After `StartAttackPresentationClaim()` calls `SyncCombatClaimMembers()`, also refresh/send `npcWork/hate` so the viewer gets `hateType = 3` immediately.
4. Keep clearing through `ClearAttackPresentationClaim()`/disengage so the mob falls back to passive/hostile if no real hate exists.

This should produce red without using enmity amount, because the client only needs:

- `hateType = 3` from `npcWork/hate`.
- A monster party occupancy relation that contains the local player or party.

## Occupancy packet evidence

The local occupancy implementation lines up with the decomp branch:

- `Map Server/Actors/Group/MonsterParty.cs:89` stores claim members and sends group packets.
- `Map Server/Actors/Group/MonsterParty.cs:101` sends group packets to added claim members.
- `Map Server/Actors/Group/MonsterParty.cs:107` tracks occupancy bindings per member.
- `Map Server/Packets/Send/Groups/SetOccupancyGroupPacket.cs:7` is the occupancy packet.
- `Map Server/Packets/Send/Groups/SetOccupancyGroupPacket.cs:16` writes occupied group id, group type, and occupying group id.
- `SetOccupancyGroupPacket.TYPE_MONSTER_PARTY = 10002` matches the monster-party use.

Client-side group updates also re-run `judgeNameplate`, which explains why occupancy changes can flip purple to red without changing the actor's model:

- `tools/outputs/lpb/decomp_further_20260617/lua/group/partygroup/monsterpartygroup.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/group/partygroup/playerpartygroup.lua`

## Things that look less useful

- `SetEnmityIndicatorPacket` is opcode `0x0195` and only writes a target id plus a small indicator value. That looks like enmity UI/gauge data, not the nameplate color path.
- Changing `charaWork.depictionJudge` does not appear to be the missing red flag. The normal `DepictionJudge` owns the mob color branch, and the other recovered judge classes do not expose a separate red mob nameplate path.
- `DesktopWidget.isMyPlayerOccupancy` checks the local player's party occupancy, but this is UI state around target/commands. It is not the nameplate color setter.

## Probe plan

Quick manual probes:

- Yellow/passive: `!setnpctargetmarker 1 0xA0F50911`
- Orange/hostile: `!setnpctargetmarker 2 0xA0F50911`
- Purple claim branch without occupancy: `!setnpctargetmarker 3 0xA0F50911` on an unclaimed mob.
- Red claim branch: force or trigger `StartAttackPresentationClaim`, send occupancy, then send `npcWork/hate` with `hateType = 3`.

Suggested code probe:

- Add a temporary helper or GM command that calls `StartAttackPresentationClaim(player)` on the selected `BattleNpc` and immediately sends/refreshes `npcWork/hate`.
- If that turns red before any hate entry exists, the missing data is confirmed as presentation claim plus occupancy, not enmity.

## Current hypothesis

Red is easy if we stop using positive hate as the only gate for `hateType = 3`. Enmity should still drive actual battle logic, but the nameplate presentation can come from target/engage claim state because the client already separates the color decision into:

`hateType` decides passive/hostile/claimed, then occupancy decides red versus purple.

## Continued sweep: easier than occupancy?

I kept digging for a second, simpler red source after the initial `hateType + occupancy` find. The extra sweep did not turn up a direct "red nameplate" work value, opcode, or alternate judge.

What I checked:

- All recovered `_setNameplateColor` call sites. Real mob nameplate coloring still lives in `DepictionJudge.judgeNameplate`; the other hits are base/native wrappers, debug helpers, or unrelated object visibility.
- `battleCommon.aggro`. This controls the aggro/passive icon path, not the red/purple nameplate color. In `DepictionJudge`, `getAggro()` selects icon `517` or `518`, not `_setNameplateColor`.
- `getBattalion()`. This affects target relation and player/enemy targeting checks, plus ally-style display branches. It does not directly select the red claimed-mob branch.
- `currentContentGroup`. This can re-run `judgeNameplate` for content members and has its own claimed-color variant, but it still reads `getHateType()` and still checks the mob party occupancy group before using the "owned claim" color.
- `SetEnmityIndicatorPacket`/opcode `0x0195`. Still appears to be gauge/focus indicator data only.

Extra line anchors:

- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:144` reads `getBattalion()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:148` reads `getAggro()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:155` and `:162` select icons `517`/`518`, not colors.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass_battle.lua:658` has `judgeRelation`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass_battle.lua:673` uses matching battalions as ally relation.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:871` uses battalion `1` for player-mode targeting.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:510` has a content-branch owned-claim color.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:515` has the content-branch fallback claimed color.
- `Map Server/Actors/Chara/Player/Player.cs:65` defines the synthetic solo party group flag.
- `Map Server/Actors/Chara/Player/Player.cs:7177` returns the real party group id or synthetic solo group id for client claim presentation.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1176` uses that group id for occupancy.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1183` ensures the client has the player/solo party group packet.

The content-group branch is worth noting but probably not an easier implementation path. In recovered Lua it appears around content group kinds `30001` and `30006` (`GuildleveGroup` and `SimpleContentGroup24B` locally), but the same underlying requirements remain:

- The target mob is in the relevant content group.
- The mob's `hateType` is in the claimed branch.
- The mob party occupancy group contains the viewer for the owned-claim color.

So the practical answer did not change: the easiest non-enmity route is already present locally as presentation claim. Use `StartAttackPresentationClaim` to build claim members and occupancy, then let that presentation state send `hateType = 3` immediately.

## Suggested minimal code shape

The clean test/fix shape is:

1. Add a small predicate such as `ShouldShowCombatClaimNameplate()` in `BattleNpc`.
2. Make it return `!IsDead() && HasCombatClaimMembers()` for presentation, while leaving true hate/combat logic alone.
3. Use that predicate in `GetHateTypePacket()` and `RefreshHateTypeForNearbyPlayers()` instead of `ShouldShowCombatNameplate()` for nameplate presentation.
4. After `StartAttackPresentationClaim()` calls `SyncCombatClaimMembers()`, call `RefreshHateTypeForNearbyPlayers()` or directly queue `GetHateTypePacket()` for claim viewers.

That should make red appear on attack-target/engage claim even if `hateContainer.GetPositiveHateEntryCount()` is still zero. The client will still choose purple for non-occupying viewers, which is exactly what the decomp says it should do.

## Third sweep: can we do less than MonsterParty?

I widened the search outside the first decomp folder and into local group packet code. I still do not see an easier direct "red" byte, but this pass tightened the minimum data shape.

Important client-side constraint:

`DepictionJudge` does not ask a global occupancy table for the mob. It does this:

`mob:getParty():_getOccupancyGroup():_isMember(myPlayer)`

That means a bare `SetOccupancyGroupPacket` is probably not enough by itself. If the client does not have a party object for the mob, `mob:getParty()` is nil and the red check cannot pass. The minimal route still needs a client-visible `MonsterPartyGroup` containing the mob.

Local server data shape:

- `GroupHeaderPacket` sends group type/id and member count.
- `GroupMembers*Packet` sends the actor membership list.
- `MonsterParty.SendInitWorkValues()` sends `partyGroupWork._globalTemp.nesting` and `partyGroupWork._globalTemp.owner`.
- `SetOccupancyGroupPacket` then binds the monster party group id to the player party/solo-claim group id.
- `GetHateTypePacket()` finally has to send `npcWork.hateType = 3`.

The existing code already has this exact minimum route:

- `BattleNpc.EnsureClientMonsterParty()` creates a one-mob `MonsterParty` if the mob has no party.
- `MonsterParty.AddMember(Id)` makes the mob the group member and sends group packets to recipients.
- `Player.GetClientClaimPartyGroupId()` returns the real party id or a synthetic solo party id.
- `Player.EnsureClientClaimPartyGroupPackets()` sends the synthetic solo party group when needed.
- `BattleNpc.SendOccupancyClaim()` sends clear-then-set occupancy for the monster party.

So the easier non-enmity implementation is not a new packet. It is to reuse the existing one-mob `MonsterParty` presentation path and remove the positive-hate gate from the nameplate presentation decision.

Additional non-candidates checked:

- `ConfigNamePlateWidget` only maps UI toggles/sliders to config flags/work values for nameplate visibility/options.
- `ConfigNamePlateColorWidget` is a generic `ProgressBarColorListWidget` color picker and only calls a parent widget's `processColorResult`; no mob claim path found.
- `HateForTargetStatus` and `HateForCasterStatus` only classify status ids such as `SubtleRelease`, `Warmonger`, and `SonorousBlast`; no nameplate color writes.
- `CmnHateControlItem.canUseForRelation()` only returns relation-use booleans; no nameplate or occupancy data.
- `PartyGroupBaseClass_battle` binds party owner/member work and helper methods. It does not contain an alternate claim-color path.

Third-pass conclusion:

The easiest viable red-without-enmity path is:

1. Create or reuse the mob's one-mob `MonsterParty`.
2. Send that group to the claiming viewer(s).
3. Send/set occupancy from the monster party to the viewer's party or synthetic solo party.
4. Send `npcWork/hate` with `hateType = 3`.

Current local code already does steps 1-3 from `StartAttackPresentationClaim`. The missing presentation bit is step 4 happening immediately and without `hateContainer.GetPositiveHateEntryCount() > 0`.

## Fourth sweep: native/config/property boundaries

I did one more pass over the native-bridge inventories, config widgets, and local actor-property send points. This did not reveal a cheaper red source, but it does narrow where a fix should live.

Native bridge/correlation notes:

- `tools/outputs/lpb/native_boundary_scan_20260617/lua_native_bridge_target_summary.csv` has one `_setNameplateColor_cpp` bridge and one `_getOccupancyGroup_cpp` bridge.
- `tools/outputs/lpb/native_boundary_scan_20260617/lua_native_bridge_inventory.csv` maps `_setNameplateColor_cpp` only through `chara/charabaseclass_u.lua`.
- The same inventory maps `_getOccupancyGroup_cpp` only through `group/groupbaseclass_u.lua`.
- `tools/outputs/lpb/decomp_correlation_20260617/method_call_edges.csv` records the two final mob claim color writes in `DepictionJudge.judgeNameplate`: red at line `554`, purple at line `561`.

That makes the client path look less like a hidden enum and more like a direct Lua decision over synced actor/group state. There is no second native bridge in these inventories that looks like "set claim color" or "set red nameplate".

Config/UI notes:

- `ConfigNamePlateWidget` toggles visibility/options such as nameplate, NPC HP bar, enemy name, enemy HP bar, active icon, enemy level, and hostile display. It writes config flags/work values, not actor color state.
- `ConfigNamePlateColorWidget` is a generic `ProgressBarColorListWidget` picker. It reads button RGB values from widget control properties and sends them back to a parent widget through `processColorResult`; no mob claim/color branch was found.
- Asset manifests mention `NamePlateWidget.form`, `TargetCursorNameplate.form`, and `LockonImageNameplate.form`, but the recovered Lua still owns the runtime actor color selection.

Local property sync notes:

- `Map Server/Actors/Chara/Npc/Npc.cs` and `BattleNpc.cs` are the only local `npcWork/hate` senders found in this pass.
- `Npc.SetNpcTargetMarker()` can force `npcWork.hateType`, but it cannot force red alone because it does not build the mob party occupancy relationship.
- `BattleNpc.GetHateTypePacket()` is the real live path for battle NPCs because it sends both `charaWork.depictionJudge` and `npcWork.hateType` under the `npcWork/hate` target.

Fourth-pass conclusion:

The easiest fix should stay server-side and very small:

1. Keep using `StartAttackPresentationClaim()` to set up the one-mob `MonsterParty` and occupancy.
2. Change the presentation nameplate gate so `presentationClaimMemberIds.Count > 0` can produce `HATE_TYPE_COMBAT_CLAIM`.
3. Refresh/send `npcWork/hate` immediately after presentation claim setup.

No evidence from this pass suggests changing UI config, status effects, `depictionJudge`, or native-facing nameplate calls directly.

## Fifth sweep: no-C# proof path through Lua

This pass found an easier way to prove red is not enmity-based before changing production code.

`BattleNpc` is registered with MoonSharp:

- `Map Server/Lua/LuaEngine.cs:148` registers `Npc`.
- `Map Server/Lua/LuaEngine.cs:182` registers `BattleNpc`.
- `Map Server/Lua/LuaEngine.cs:230` registers `MonsterParty`.

The needed methods are public:

- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1218` exposes `StartAttackPresentationClaim(Character claimant)`.
- `Map Server/Actors/Chara/Npc/Npc.cs:370` exposes `SetNpcTargetMarker(byte hateType, uint depictionJudge, bool broadcast = true)`.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:57` already calls `targetActor:SetNpcTargetMarker(...)` from Lua.

So the easiest live proof should be possible as a Lua/GM probe with no C# change:

```lua
targetActor:StartAttackPresentationClaim(player)
targetActor:SetNpcTargetMarker(3, 0xA0F50911, true)
```

Why this is useful:

- `StartAttackPresentationClaim(player)` should create/reuse the one-mob `MonsterParty`, add the claiming player/party, and send the occupancy packets.
- `SetNpcTargetMarker(3, 0xA0F50911, true)` then broadcasts `npcWork/hate` with the combat-claim `hateType`.
- The client should now have both required pieces for red: mob party occupancy and `hateType = 3`.
- No positive hate entry is required for this probe.

This is probably the fastest validation path:

1. Target a battle NPC.
2. Run a temporary GM command that does the two calls above.
3. If the target turns red for the caller, red is confirmed as presentation claim plus occupancy, not enmity.
4. If it turns purple, occupancy did not bind or the actor was not a `BattleNpc`.
5. If nothing changes, Lua method exposure or target resolution is the next thing to inspect.

This probe is not the final production behavior because it forces `hateType` directly and needs cleanup/clear handling. It is still the best short proof found so far because it exercises the same client data path the real fix should use.

## Sixth sweep: GM command viability

I checked whether the no-C# proof path is actually callable from local Lua rather than just theoretically public C#.

Lua exposure evidence:

- `Map Server/Lua/LuaEngine.cs:148` registers `Npc` with MoonSharp.
- `Map Server/Lua/LuaEngine.cs:182` registers `BattleNpc` with MoonSharp.
- `Map Server/Lua/LuaEngine.cs:230` registers `MonsterParty` with MoonSharp.
- `Map Server/Lua/LuaScript.cs:95` wraps CLR arguments with `DynValue.FromObject`.
- `Map Server/Lua/LuaScript.cs:99` falls back to `UserData.Create(arg)`.

GM command execution evidence:

- `Map Server/Lua/LuaEngine.cs:1476` starts `RunGMCommand`.
- `Map Server/Lua/LuaEngine.cs:1492` loads scripts from `scripts/commands/gm/<command>.lua`.
- `Map Server/Lua/LuaEngine.cs:1498` loads globals before command script execution.
- `Map Server/Lua/LuaEngine.cs:1503` executes the command Lua file.
- `Map Server/Lua/LuaEngine.cs:1610` inserts the C# `player` object as the first Lua argument.
- `Map Server/Lua/LuaEngine.cs:1612` inserts the argument count.
- `Map Server/Lua/LuaEngine.cs:1620` creates the `onTrigger` coroutine.
- `Map Server/Lua/LuaEngine.cs:1621` resumes it with the converted arguments.

Target selection is already ergonomic:

- `Map Server/Actors/Chara/Player/Player.cs:710` exposes `FindCommandTarget`.
- `Map Server/Actors/Chara/Player/Player.cs:732` resolves explicit decimal/hex actor ids.
- `Map Server/Actors/Chara/Player/Player.cs:739` resolves nearby actors by name substring.
- `Map Server/Actors/Chara/Player/Player.cs:751` falls back to current target.
- `Map Server/Actors/Chara/Player/Player.cs:755` falls back to locked target.
- `Map Server/Actors/Chara/Player/Player.cs:759` falls back to current combat target.
- `Map Server/Actors/Chara/Player/Player.cs:764` scans nearby `BattleNpc`s.
- `Map Server/Actors/Chara/Player/Player.cs:778` returns the nearest battle NPC if nothing else matched.

Broadcast/send evidence:

- `Map Server/Actors/Area/Area.cs:1215` broadcasts a packet list around an actor.
- `Map Server/Actors/Area/Area.cs:1234` gates delivery through `CanReceiveActorBroadcast`.
- `Map Server/Actors/Area/Area.cs:1249` only narrows broadcast for guildleve content membership.
- `Map Server/Actors/Area/Area.cs:1252` otherwise allows nearby players.
- `Map Server/Actors/Chara/Player/Player.cs:1224` exposes `QueuePacket(SubPacket packet)`.

That makes this temporary command a reasonable next proof:

```lua
require("global");

properties = {
    permissions = 0,
    parameters = "s",
    description = "!claimnameplatered [actorIdOrName]",
}

function onTrigger(player, argc, arg1)
    local targetActor = player:FindCommandTarget(arg1) or nil;
    if targetActor == nil then
        player:SendMessage(MESSAGE_TYPE_SYSTEM, "[claimnameplatered] ", "No target found.\n");
        return;
    end

    targetActor:StartAttackPresentationClaim(player);
    targetActor:SetNpcTargetMarker(3, 0xA0F50911, true);
    player:SendMessage(MESSAGE_TYPE_SYSTEM, "[claimnameplatered] ", string.format("Forced claim nameplate for 0x%X.", targetActor.Id));
end
```

Expected results:

- Red for the caller means the decomp conclusion is confirmed: `hateType = 3` plus occupancy is enough, with no positive hate required.
- Purple means `hateType = 3` arrived but the occupancy membership did not bind for the viewer.
- No change means the selected actor was not a compatible `BattleNpc`/`Npc`, or Lua method binding rejected the call.

Production note:

The command above is a probe, not the fix. The production fix should not permanently force `Npc.SetNpcTargetMarker`. It should instead let `BattleNpc.GetHateTypePacket()` send `NpcWork.HATE_TYPE_COMBAT_CLAIM` when presentation claim members exist.

Exact local production gap:

- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1218` creates the presentation claim.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1234` stores `presentationClaimMemberIds`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1236` syncs combat claim members/occupancy.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1296` already has `HasCombatClaimMembers()`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1302` still defines `ShouldShowCombatNameplate()` as positive hate only.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1333` still uses `ShouldShowCombatNameplate()` for refresh-time presentation.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1342` queues `GetHateTypePacket(player)`.

So the final fix remains small: use presentation claim membership for nameplate presentation, then refresh `npcWork/hate` right after `StartAttackPresentationClaim()` establishes occupancy.

## Seventh sweep: no-new-command proof with existing `workvalue`

I found an even lower-friction live probe than adding a temporary GM Lua command. The existing `!workvalue` command can probably send the one missing client update after the normal attack-target path has already created presentation occupancy.

Existing command evidence:

- `Data/scripts/commands/gm/workvalue.lua:3` defines a generic work-value command.
- `Data/scripts/commands/gm/workvalue.lua:24` supports `@t` by using `player.currentTarget`.
- `Data/scripts/commands/gm/workvalue.lua:34` calls `targetActor:SetWorkValue(player, workName, uiFunc, tonumber(value))`.
- `Map Server/Actors/Actor.cs:643` implements `SetWorkValue`.
- `Map Server/Actors/Actor.cs:648` allows `work`, `charaWork`, `playerWork`, and `npcWork`.
- `Map Server/Actors/Actor.cs:711` creates `SetActorPropetyPacket(uiFunc)`.
- `Map Server/Actors/Actor.cs:712` adds the requested property name.
- `Map Server/Actors/Actor.cs:714` builds the packet for the caller.
- `Map Server/Actors/Actor.cs:715` queues it only to that caller.

Client tag evidence:

- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:101` starts the `hate` tag.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:104` maps the tag to `hateType`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:147` defines `getHateType`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:148` returns `npcWork.hateType`.
- `Map Server/Actors/Chara/CharaWork.cs:54` defaults `charaWork.depictionJudge` to `0xa0f50911`, so most normal battle NPCs should not need a separate depiction-judge update for this probe.

Attack-target occupancy evidence:

- `Map Server/Packets/Receive/SetTargetPacket.cs:30` reads `actorID`.
- `Map Server/Packets/Receive/SetTargetPacket.cs:31` reads `attackTarget`.
- `Map Server/PacketProcessor.cs:412` handles opcode `0x00CD`.
- `Map Server/PacketProcessor.cs:416` stores `actor.currentTarget`.
- `Map Server/PacketProcessor.cs:417` treats non-`0xE0000000` `attackTarget` as attack-target selection.
- `Map Server/PacketProcessor.cs:426` resolves the selected `BattleNpc`.
- `Map Server/PacketProcessor.cs:430` calls `StartAttackPresentationClaim(claimPlayer)`.
- `Map Server/PacketProcessor.cs:442` then enters normal engage flow for attack targets.

Why this can still prove "not enmity":

- `Map Server/Actors/Chara/Ai/AIContainer.cs:349` starts `InternalEngage`.
- `Map Server/Actors/Chara/Ai/AIContainer.cs:363` marks the actor engaged.
- `Map Server/Actors/Chara/Ai/AIContainer.cs:364` enters `AttackState`.
- `Map Server/Actors/Chara/Ai/State/AttackState.cs:42` delays the first auto-attack by half the attack delay.
- `Map Server/Actors/Chara/Ai/Utils/BattleUtils.cs:1124` is where damage actually updates mob hate.
- `Map Server/Actors/Chara/Ai/HateContainer.cs:226` creates a hate entry.
- `Map Server/Actors/Chara/Ai/HateContainer.cs:228` creates it with zero cumulative enmity.
- `Map Server/Actors/Chara/Ai/HateContainer.cs:387` starts `GetPositiveHateEntryCount`.
- `Map Server/Actors/Chara/Ai/HateContainer.cs:393` only counts entries with total enmity greater than zero.
- `Map Server/Actors/Chara/Ai/HateContainer.cs:503` returns total enmity from cumulative enmity.

So, before the first damage event, the client can have presentation claim/occupancy while the current server-side positive-hate gate still reads zero.

No-new-code probe:

1. Select a battle NPC as an attack target in the client, just long enough for opcode `0x00CD` to run `StartAttackPresentationClaim`.
2. Before any hit lands, run:

```text
!workvalue @t npcWork.hateType npcWork/hate 3
```

Expected result:

- Red means the existing attack-target presentation path already supplied occupancy, and the only missing value was `npcWork.hateType = 3`.
- Purple means the `npcWork/hate` update landed but the monster-party occupancy relationship did not.
- No change means the command did not target the expected actor, `uiFunc` did not trigger the client tag, or the actor's depiction judge/path is not the normal mob nameplate path.

This is now the easiest manual proof because it needs no new file and no C# patch. It is slightly less clean than the two-call Lua probe because attack-target selection also enters `AttackState`; if the first auto-attack lands, real positive hate can appear. The cleaner proof is still the temporary Lua command from the sixth sweep:

```lua
targetActor:StartAttackPresentationClaim(player)
targetActor:SetNpcTargetMarker(3, 0xA0F50911, true)
```

But for fast live validation, the existing command route is probably enough:

```text
attack-target mob -> !workvalue @t npcWork.hateType npcWork/hate 3
```

## Eighth sweep: easier than `workvalue`

The seventh sweep found a generic existing command. This pass found that an even simpler existing command should already send the exact packet shape we want.

`!setnpctargetmarker` evidence:

- `Data/scripts/commands/gm/setnpctargetmarker.lua:3` defines the command.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:4` currently has `permissions = 0`.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:9` accepts `<hateType> <depictionJudge>`.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:11` documents `3+` as combat claim red/purple.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:51` resolves the target through `player:FindCommandTarget`.
- `Data/scripts/commands/gm/setnpctargetmarker.lua:57` calls `targetActor:SetNpcTargetMarker(hateType, depictionJudge, true)`.

`SetNpcTargetMarker` evidence:

- `Map Server/Actors/Chara/Npc/Npc.cs:370` exposes `SetNpcTargetMarker`.
- `Map Server/Actors/Chara/Npc/Npc.cs:372` sets `npcWork.hateType`.
- `Map Server/Actors/Chara/Npc/Npc.cs:373` sets `charaWork.depictionJudge`.
- `Map Server/Actors/Chara/Npc/Npc.cs:378` creates an `ActorPropertyPacketUtil("npcWork/hate", this)`.
- `Map Server/Actors/Chara/Npc/Npc.cs:379` adds `charaWork.depictionJudge`.
- `Map Server/Actors/Chara/Npc/Npc.cs:380` adds `npcWork.hateType`.
- `Map Server/Actors/Chara/Npc/Npc.cs:381` broadcasts the packet around the actor.

So this command is more exact than `!workvalue` for the proof because it uses the same helper shape as the local NPC marker path: both `depictionJudge` and `hateType` under `npcWork/hate`.

Cleanest no-new-code proof:

1. Stand outside auto-attack range.
2. Attack-target the mob. This makes opcode `0x00CD` call `StartAttackPresentationClaim`, which should create/send the one-mob monster party and occupancy.
3. Run:

```text
!setnpctargetmarker 3 0xA0F50911
```

Why standing out of range helps keep it non-enmity:

- `Map Server/PacketProcessor.cs:430` calls `StartAttackPresentationClaim` before damage can happen.
- `Map Server/Actors/Chara/Ai/State/AttackState.cs:42` delays the first auto-attack by half the attack delay.
- `Map Server/Actors/Chara/Ai/State/AttackState.cs:230` reads the attack range.
- `Map Server/Actors/Chara/Ai/State/AttackState.cs:232` rejects auto-attack if XZ distance is greater than range.
- `Map Server/Actors/Chara/Ai/State/AttackState.cs:237` returns without attacking.
- `Map Server/Actors/Chara/Player/Player.cs:10572` starts the player auto-attack range override.
- `Map Server/Actors/Chara/Player/Player.cs:10574` uses `7.0f` for melee.
- `Map Server/Actors/Chara/Player/Player.cs:10575` uses `8.0f` for lance.
- `Map Server/Actors/Chara/Player/Player.cs:10576` uses `20.0f` for ranged weapons.

Expected result:

- Red for the caller means the attack-target presentation path supplied occupancy, and the marker command supplied `hateType = 3`.
- Purple means `hateType = 3` landed, but occupancy did not bind the caller's player/party to the mob party.
- Yellow/orange/no change means either the marker packet did not land, the target was not the intended NPC, or another refresh replaced the forced value.

Current easiest ranking:

1. Existing, clean-ish manual proof: stand out of range, attack-target the mob, run `!setnpctargetmarker 3 0xA0F50911`.
2. Existing, caller-only variant: stand out of range, attack-target the mob, run `!workvalue @t npcWork.hateType npcWork/hate 3`.
3. Cleanest no-timing probe but needs a temporary command: call `StartAttackPresentationClaim(player)` then `SetNpcTargetMarker(3, 0xA0F50911, true)`.
4. Production fix: let presentation claim membership drive `HATE_TYPE_COMBAT_CLAIM` in `GetHateTypePacket`, then refresh `npcWork/hate` after occupancy setup.

## Ninth sweep: linked monster parties are not easier

I checked whether spawn/link-group monster parties could make the proof even simpler. The thought was: if a mob already has a server-side `MonsterParty`, maybe `!setnpctargetmarker 3 0xA0F50911` alone could become red without first attack-targeting.

Client-side constraint:

- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua:21` defines `getParty`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua:23` calls `_getExtendedTemporaryGroup`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua:24` first checks player-party group type `10001`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua:26` falls back to monster-party group type `10002`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:21` defines `getMonsterParty`.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:22` also reads extended temporary group `10002`.

So client red needs the player's client to know an extended temporary monster-party group for the mob. A server-side `currentParty` field by itself is not enough.

Server link-group evidence:

- `Map Server/WorldManager.cs:1079` loads `spawnGroup` and `linkGroup` from `server_battlenpc_spawn_locations`.
- `Map Server/WorldManager.cs:1089` creates a `linkGroups` dictionary.
- `Map Server/WorldManager.cs:1190` reads `linkGroup`.
- `Map Server/WorldManager.cs:1194` reuses an existing `MonsterParty` for that zone/link key.
- `Map Server/WorldManager.cs:1196` creates a new `MonsterParty` when needed.
- `Map Server/WorldManager.cs:1200` assigns `battleNpc.currentParty = monsterParty`.
- `Map Server/WorldManager.cs:1202` only calls `monsterParty.AddMember(battleNpc.Id)` immediately when there is no spawn-pool key.
- `Map Server/Actors/Area/Area.cs:537` also calls `monsterParty.AddMember(battleNpc.Id)` when a conditional spawn candidate becomes active.

Recipient/send evidence:

- `Map Server/Actors/Group/MonsterParty.cs:55` starts `AddMember(uint memberId)`.
- `Map Server/Actors/Group/MonsterParty.cs:62` sends group packets to `GetClientRecipientIds()`.
- `Map Server/Actors/Group/MonsterParty.cs:189` starts `GetClientRecipientIds`.
- `Map Server/Actors/Group/MonsterParty.cs:193` adds monster member ids.
- `Map Server/Actors/Group/MonsterParty.cs:199` adds claim member ids.
- `Map Server/Actors/Group/Group.cs:95` starts `SendGroupPacketsAll`.
- `Map Server/Actors/Group/Group.cs:99` resolves a real player `Session` for each id.
- `Map Server/Actors/Group/Group.cs:101` only sends when a session exists.

That means a monster-only link group usually has no player session recipient. The group may exist server-side, but the viewer's client still will not have the monster-party group unless the player is added as a claim member or otherwise receives the group packets.

Presentation-claim path remains the useful bridge:

- `Map Server/Actors/Chara/Npc/BattleNpc.cs:961` starts `SyncCombatClaimMembers`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:969` builds claim member ids.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:976` ensures the mob has a client monster party.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:984` sets claim members on the monster party.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:991` sends the occupancy claim.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1165` starts `SendOccupancyClaim`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1183` ensures the player's real/synthetic party group packets exist.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1190` sends the monster-party occupancy binding to the player's party group.
- `Map Server/Actors/Chara/Player/Player.cs:7177` returns the real party group id or synthetic solo claim group id.
- `Map Server/Actors/Chara/Player/Player.cs:7203` starts `EnsureClientClaimPartyGroupPackets`.
- `Map Server/Actors/Chara/Player/Player.cs:7221` sends the synthetic solo party group when needed.

Ninth-pass conclusion:

Spawn/link monster parties are not an easier red path by themselves. They may reduce the need to create a new `MonsterParty`, but they do not replace the need to send group packets and occupancy to the player. The easiest no-code proof therefore stays:

```text
stand outside auto-attack range -> attack-target mob -> !setnpctargetmarker 3 0xA0F50911
```

The attack-target step is still doing the important non-enmity work: it invokes `StartAttackPresentationClaim`, which adds the viewer/party as claim recipients and sends the occupancy relation the client needs for red instead of purple.
