# Charm, Pet, Party, and Nameplate Decomp Notes

## Summary

Charm is present in the recovered/local status data as status `228031`, but the current local behavior is generic control-lock status handling, not ownership transfer.

Evidence points to:

- `228031` is the Charm status.
- Charm's server status flags are `0x0FC00015` / `264241173`.
- Those flags decode to `LoseOnDeath`, `LoseOnEsuna`, `LoseOnLogout`, `PreventSpell`, `PreventWeaponSkill`, `PreventAbility`, `PreventAttack`, `PreventMovement`, and `PreventTurn`.
- The local effect script `Data/scripts/effects/charm.lua` only requires the default effect script, so it does not currently change allegiance, controller, party membership, pet master, or nameplate state.
- The recovered client Lua has no dedicated `charmstatus.lua` and no direct `228031` branch found in the recovered Lua pass. It does have generic control/status classes such as `HijackStatus`, `CommandControlStatus`, `MovingControlStatus`, and `TargetControlStatus`, but no recovered special Charm ownership flow.

## Nameplate Path

Charm itself does not appear to be a nameplate color path.

Normal mob nameplate color is driven by `npcWork.hateType` plus party/monster-party occupancy:

- `NpcBaseClass` syncs `npcWork.hateType` under the `npcWork/hate` tag and exposes it through `getHateType()`.
- `DepictionJudge.judgeNameplate(actor)` reads `getHateType()`.
- `hateType == 1` is the passive/yellow branch.
- `hateType == 2` is the hostile/orange branch.
- Other claimed values, locally `3`, enter the claimed branch.
- In the claimed branch, `actor:getParty():_getOccupancyGroup():_isMember(myPlayer)` decides owned-claim red versus unowned-claim purple.

Local server code matches that:

- `Npc.SetNpcTargetMarker(hateType, depictionJudge, broadcast)` writes `npcWork.hateType` and `charaWork.depictionJudge`, then broadcasts them under `npcWork/hate`.
- `BattleNpc.GetHateTypePacket(player)` emits the same two properties under `npcWork/hate`.
- `MonsterParty` is the local group type used for mob-side occupancy/claim presentation.

So if a charmed mob needs a different nameplate, it probably should not be implemented as a special status icon rule. It should be implemented by changing the actor's relation/presentation data: allegiance, targetability, and possibly claim/occupancy/nameplate packets.

## Pet and Party Slot Model

There are two different "party slot" meanings in this codebase:

1. World-server player party membership.
2. Client-visible party-group roster entries.

The recovered client Lua does not show a separate pet/companion party list. The group classes recovered under `lua/group` are:

- `PlayerPartyGroup`
- `MonsterPartyGroup`
- content groups such as `GuildleveGroup`, `PublicPopGroup`, and `SimpleContentGroup`
- relation groups such as invitation, trade, and bazaar groups
- community/company-style groups

The server group type constants line up with that list: player party `10001`, monster party `10002`, content groups `300xx`, relation groups `500xx`, company `20002`, and retainer `80001`. No pet group type was found in the local server constants or recovered client group classes.

The current pet model is separate from world-server player party membership.

World-server party state is only a list of character actor ids:

- `World Server/PartyManager.cs` maps `uint charaId -> Party`.
- `World Server/DataObjects/Group/Party.cs` stores `List<uint> members`.
- `World Server/Packets/WorldPackets/Send/Group/PartySyncPacket.cs` writes party group id, leader id, member count, then each member actor id.

There is no pet-specific field in that party sync packet.

Map-server pets are modeled as independent actors:

- `Pet : BattleNpc`.
- `Pet` gets a `PetController`.
- `PetController.SetPetMaster(master)` stores the master and sets allegiance to player-side when the master is a `Player`.
- `TargetFind.TryGetMasterTarget()` treats player-owned pets as their master for target validity.
- `BattleNpc.ResolveClaimPlayer()` maps a pet attacker back to its player master for claim/presentation.
- `BattleNpc.Die()` maps a pet last-attacker back to the player master for rewards.
- `LuaEngine.CallLuaBattleFunction()` skips unique NPC battle scripts for player-owned pets.

That strongly suggests a normal pet should be a separate actor, not a world-server player party member.

Important caveat: the map-server `Party` class can add NPC `Character` members for scripted combat ally presentation via `Party.AddMember(Character)`. That path absolutely increases the client-visible party group member count and can show NPCs in the party UI. Existing content scripts use this through `Player.AddQuestFightAllyToClaimParty(ally)`, so scripted allies such as Greinfarr/Niellefresne do appear as party-list rows and count against the visible `n/8` roster. It is useful for escort/quest allies, but it is not the same as world-server-managed player membership and should not be assumed for normal pets.

## Party UI and Party-Blue Nameplates

The recovered party UI is tied directly to `myPlayer:getPlayerParty()`:

- `CharaBaseClass.getPlayerParty()` returns extended temporary group `10001`.
- `PartyParameterWidget.updateMemberList()` reads `worldMaster:_getMyPlayer():getPlayerParty()` and then `_countMember()`.
- `PartyManagerWidget.updateMemberList()` does the same for the party window/list.
- `DesktopWidget.countPartyMember()`, `getPartyMemberActor()`, `getPartyMemberDisplayName()`, and related helpers all read `worldMaster:_getMyPlayer():getPlayerParty()`.

The exact light-blue/cyan party nameplate path is also tied to the same client group membership. In `DepictionJudge.judgeNameplate(actor)`, non-player actors get the full party color branch only when `myPlayer:getPlayerParty():_isMember(actor)` is true. `PlayerPartyGroup._onUpdateMember()` also re-judges the actor nameplate when membership changes, which is why adding an NPC ally to the party group immediately gives the expected party-style presentation.

So the native behavior appears to be:

- If the charmed mob is placed in `PlayerPartyGroup` to get the exact party nameplate color, it will also appear in the party UI and count in the visible roster.
- If the charmed mob is kept out of `PlayerPartyGroup`, it can avoid the party slot, but it will not naturally hit the exact same party-blue branch.

There is one weaker visual alternative in the client decomp: for non-party actors, `DepictionJudge` has a branch for `actor:isPropertyEnabled(3)` and `actor:getBattalion() == 1` that sets a similar cyan-ish color with alpha `0.5`. Existing ally fighter client classes such as Greinfarr and Niellefresne override `getBattalion()` to return `1`, while base `CharaBaseClass.getBattalion()` returns `0`. That branch may be useful for scripted ally-style actors, but it is not a generic charmed-monster pet list, and a normal mob would not hit it without an ally-like client class or a client rule change.

## Practical Implementation Read

If the goal is retail-like "Charm disables the player/mob's freedom of action," the current status row already has the right lock flags. The missing work is mostly duration/application/removal tuning and any resist rules.

If the goal is "Charm turns a mob into a temporary pet," the current status alone is not enough. A proper implementation would need to:

1. Preserve the original controller/allegiance/party state.
2. On Charm gain, change the actor to a player-owned/pet-like relation, probably via a temporary pet/charm controller rather than adding it to the player party.
3. Set the charmed actor's allegiance to player-side.
4. Make target selection treat it as a player-side ally/pet.
5. On Charm loss/death/logout/zoning, restore original controller, allegiance, target, and mob party state.
6. Send nameplate/claim updates through existing `npcWork/hate` and group occupancy paths if the client presentation needs to change.

Do not add a charmed pet to `World Server` party membership. If a visible party-style NPC slot is deliberately wanted for an instance ally, use the existing map-side NPC party member path intentionally and clean it up afterward. If the goal is a pet/charmed mob that does not occupy the visible party list, avoid `AddQuestFightAllyToClaimParty` / `Party.AddMember(Character)` and keep it on a separate pet-style relation path.

For a no-slot charmed pet, the server-side implementation looks possible without inventing a party slot:

1. Add charm gain/loss hooks or a dedicated charm effect script/backend handler.
2. Store the charmed actor's original controller, allegiance, `currentParty`, target, hate, and claim state.
3. Swap to a temporary charm/pet controller or adapt `PetController` to accept a `BattleNpc` being temporarily mastered.
4. Set the charmed actor's master to the player and set `allegiance = Player`.
5. Keep the actor out of `PlayerPartyGroup` and avoid `AddQuestFightAllyToClaimParty`.
6. Update target/claim/reward paths the same way existing pet handling already maps a `Pet` attacker back to the player master.
7. On charm expiration, death, logout, zone transition, or dispel, restore the original state and resend presentation updates.

The hard part is not avoiding the slot. The hard part is getting the exact party-blue nameplate while avoiding the slot. Based on this decomp pass, exact party-blue without a party row probably needs one of:

- a client Lua patch/injection in `DepictionJudge` that treats "charmed by my player" as party-colored;
- a new or repurposed server-synced actor property that causes a non-party actor to use an existing friendly color branch;
- accepting the existing non-party ally/battalion cyan-ish branch if the actor can be made to hit it.

## Key Local Evidence

- `Map Server/Actors/Chara/Ai/StatusEffect.cs`: `Charm = 228031`; status flags include the prevent-action/movement/turn bits.
- `Data/sql/server_statuseffects.sql`: Charm row `228031,'charm',264241173,2,0,0,0,0,30335,30338`.
- `docs/Dat Mining/xtx_status.csv`: Charm text says enemy charms prevent execution of actions.
- `Data/scripts/effects/charm.lua`: only requires `effects/default`.
- `Map Server/Actors/Chara/Npc/Npc.cs`: `SetNpcTargetMarker()` sends `charaWork.depictionJudge` and `npcWork.hateType` under `npcWork/hate`.
- `Map Server/Actors/Chara/Npc/BattleNpc.cs`: claim/nameplate presentation uses `MonsterParty` occupancy and `npcWork.hateType`.
- `Map Server/Actors/Chara/Npc/Pet.cs`: pet is a `BattleNpc` with `PetController`.
- `Map Server/Actors/Chara/Ai/Controllers/PetController.cs`: pet master controls allegiance.
- `Map Server/Actors/Chara/Ai/Helpers/TargetFind.cs`: player-owned pets are treated as player-side through their master.
- `Map Server/Actors/Chara/Player/Player.cs`: `AddQuestFightAllyToClaimParty()` adds NPC allies to the active/client solo party group for visible party presentation.
- `Map Server/Actors/Group/Group.cs`: group constants include player party, monster party, content, relation, company, and retainer groups; no pet group constant.
- `Map Server/Actors/Group/Party.cs`: `GetTypeId()` returns `PlayerPartyGroup`, `GetMemberCount()` returns `members.Count`, and `AddMember(Character)` adds NPC characters to the same visible member list.
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua`: `getPlayerParty()` returns group `10001`; `getParty()` falls back from `10001` to monster party `10002`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/partyparameterwidget.lua`: party HUD uses `myPlayer:getPlayerParty():_countMember()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/partymanagerwidget.lua`: party manager/list uses `myPlayer:getPlayerParty():_countMember()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua`: party member helpers read `myPlayer:getPlayerParty()`.
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua`: exact non-player party color checks `myPlayer:getPlayerParty():_isMember(actor)`.
- `tools/outputs/lpb/decomp_further_20260617/lua/group/partygroup/playerpartygroup.lua`: member updates refresh desktop party info and re-run nameplate judgment.
- `Data/scripts/content/SimpleContent30002.lua`, `SimpleContent30010.lua`, `SimpleContent30079.lua`: existing scripted allies call `AddQuestFightAllyToClaimParty`.
- `World Server/Packets/WorldPackets/Send/Group/PartySyncPacket.cs`: party sync has only member actor ids, no pet field.
