# Red Mob Nameplate Instance/NPC Decomp Addendum

## Scope

This is an addendum to `docs/mob_nameplate_hate_type_decomp_2026-07-02.md`.
The earlier note still looks right: the normal red mob nameplate is not a
separate red byte. The client chooses red from:

1. `npcWork.hateType` in the claimed branch, locally `3`.
2. A mob party on the actor.
3. A mob-party occupancy group containing the viewing player or party.

The new instance/NPC finding is that local private-content guards can prevent
that route before the client ever receives a claimed `hateType`.

## Recovered Client Path

Primary recovered Lua:

- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua`

`NpcBaseClass` syncs `npcWork.hateType` under the `npcWork/hate` tag and
`getHateType()` returns `npcWork.hateType`.

`DepictionJudge.judgeNameplate(actor)` has the normal mob branch:

- `hateType == 1`: yellow/passive.
- `hateType == 2`: orange/hostile.
- otherwise: claimed branch.

In the claimed branch, it checks:

```text
actor:getParty():_getOccupancyGroup():_isMember(myPlayer)
```

If that membership check passes, the client sets the owned-claim color
`(1, 0.38, 0.44, 1)`. If it fails, the same claimed mob falls back to the
other-claim/purple color `(0.6, 0.45, 0.94, 1)`.

The content-group path earlier in `DepictionJudge` still follows the same data
shape: it reads `getHateType()`, then consults `actor:getParty()` and the
party occupancy group. I did not find a separate instance-only red source.

## Local Server Gate

The local live packet path is:

- `Map Server/Actors/Chara/Npc/BattleNpc.cs:1299` builds `GetHateTypePacket`.
- `BattleNpc.cs:1305` computes `showCombatPresentation` with
  `ShouldUseClientCombatClaimPresentation() && ShouldShowCombatClaimNameplate()`.
- `BattleNpc.cs:1308` only sends `HATE_TYPE_ENGAGED` when
  `ShouldSendCombatClaimNameplateTo(...)` passes.
- `BattleNpc.cs:1717` still defines `ShouldShowCombatClaimNameplate()` as
  positive combat hate only.

So even though `StartAttackPresentationClaim()` now calls
`RefreshHateTypeForNearbyPlayers()` at `BattleNpc.cs:1641`, the refresh can
still send `hateType = 1` or `2` if positive hate is not present yet.

## Instance Suppression

Private content adds another gate before the positive-hate issue:

- `BattleNpc.cs:269` defines
  `IsScriptedPrivateContentClaimPresentationSuppressed()`.
- It returns true for allies.
- It returns true for private content unless the director is a
  `GuildleveDirector` or `BehestDirector`.
- `BattleNpc.cs:287` makes `ShouldUseClientCombatClaimPresentation()` false
  when that suppression applies, except for the current court-fight special case.
- `BattleNpc.cs:300` lets `ShouldSuppressScriptedPrivateCombatPresentation()`
  clear combat-claim members in most suppressed private-content cases.

That means many scripted instance mobs cannot reach the client combat-claim
nameplate route at all, even if `StartAttackPresentationClaim()` is called.

## Minemite-Specific Finding

The Calamity Cometh Minemite duty has an additional explicit suppression:

- `Data/scripts/directors/Quest/QuestDirectorMan2u001.lua:297` spawns Minemites
  with `area:SpawnEnemy(...)`.
- `QuestDirectorMan2u001.lua:275` calls
  `mob:SetQuestFightSuppressClaimPresentation(true)`.
- `BattleNpc.cs:930` stores that flag.
- `BattleNpc.cs:287` then refuses client combat-claim presentation when
  `questFightSuppressClaimPresentation` is true.

So Minemites are valid battle NPCs, but their script currently disables the
same presentation path that the red nameplate needs. This explains why the
issue is especially visible in this instance: the client needs `hateType = 3`
plus occupancy, while the local instance guard and the Minemite script both
push the mob away from that path.

## NPC Caveat

`Npc.SetNpcTargetMarker(hateType, depictionJudge, broadcast)` can force
`npcWork.hateType`, but it does not create a monster party or occupancy group.
That makes it useful for proving yellow/orange/claimed-branch behavior, but it
cannot force owned red by itself.

Plain event NPCs are poor red-nameplate proof targets because they normally
lack the `BattleNpc`/`MonsterParty` path. `Ally` inherits `BattleNpc`, but local
private-content suppression treats allies as suppressed for combat-claim
presentation. The clean proof target is still a real hostile `BattleNpc`
spawned through `SpawnEnemy` with claim presentation enabled.

## Current Hypothesis

There are two separate blockers:

1. Normal mobs: `ShouldShowCombatClaimNameplate()` is still tied to positive
   hate, so presentation claim/occupancy can be ready while `hateType = 3` is
   not sent.
2. Scripted private instances: `ShouldUseClientCombatClaimPresentation()` can
   be false before that positive-hate gate is reached. Minemites also set
   `questFightSuppressClaimPresentation = true` from Lua.

No new client red flag has shown up. The client still wants claimed `hateType`
plus party occupancy.

## Implementation Update (2026-07-17)

The production path now uses the normal client combat-claim presentation for
hostile battle NPCs in private content instead of applying a blanket private-
content suppression. Positive hate still controls when `hateType = 3` is sent.

Allied NPCs remain forbidden from owning a hostile monster-party claim. When an
enemy has positive hate for an ally, `BuildCombatClaimMemberIds()` resolves only
the attached player/party/content-group player IDs; it never adds the ally actor
to the monster party. This preserves ally-driven red nameplates without the
unsafe ally-as-monster-party representation.

The explicit Minemite claim-presentation suppression was removed. Scripted
neutral presentation, explicit per-mob suppression, and the known Beckon fight
client-crash guard remain available as narrow opt-outs.

Runtime testing then showed that selecting a Skirmish enemy could crash the
client. The packet log placed two `0x0187` occupancy updates in the same first-
combat cluster as the command result. Private content therefore no longer
creates a speculative presentation claim at target/lock time. Its first claim
sync is driven by positive hate.

A follow-up runtime screenshot showed the mob turning purple immediately before
the crash. That proves the claimed `hateType` arrived, but the instance content-
group ID was being interpreted as a foreign claim owner. Content groups describe
encounter membership; they are not a substitute for the player's claim party.
Private-content monster parties now use the same real or synthetic player-party
occupancy ID as overworld mobs. This should produce owned red while retaining the
positive-hate timing guard that prevents the original target-time crash.

The next packet log isolated a second, lower-level instance difference. The
claim debug line created `monsterParty=0x3000000000000003`, even though the group
header type was `10002` (`MonsterPartyGroup`). The `0x3...` high nibble belongs to
simple content groups. `WorldManager.groupIndexId` retains that prefix after an
instance content group is allocated, and `MonsterParty.CreateMonsterParty()` was
using the contaminated value unchanged. Overworld monster parties created before
content allocation instead had ordinary sequence IDs. Dynamic monster-party
allocation now masks off the content namespace nibble, preventing a group object
that simultaneously identifies as simple-content by ID and monster-party by type.

With the corrected ID, runtime testing stopped crashing and transitioned from
purple to red. The remaining purple flash was ordering: the first positive-hate
refresh created the monster party, bound occupancy, and sent claimed `hateType`
in one burst, while the client finished group construction asynchronously.
Skirmish now primes the monster-party membership and occupancy immediately after
each participant's actor-spawn packets are queued. The mob remains hostile/orange
because `hateType = 3` is still gated on positive hate; the first enmity update
can therefore rejudge an already-owned mob directly as red.

## Runtime Validation Checklist

1. Pick an ordinary private-content hostile `BattleNpc`, including a Minemite.
2. Give the enemy positive hate first from the player, then in a separate run
   from an allied NPC attached to that player's party or content group.
3. Confirm the normal claim sync sends `npcWork/hate` with `hateType = 3`.
4. If the actor is red for the claimant, the instance path is confirmed as the
   same `hateType + occupancy` path.
5. If it is purple, the claimed `hateType` arrived but occupancy did not bind
   the viewer.
6. If nothing changes, the actor is probably outside the `BattleNpc`/normal
   depiction path or claim presentation is still suppressed.

The likely production fix should not invent a new packet. It should split
"client claim presentation is allowed" from "real positive hate exists", then
decide which scripted private content mobs are safe to allow through the client
combat-claim presentation path.
