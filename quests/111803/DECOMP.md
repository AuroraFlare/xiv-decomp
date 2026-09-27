# Quest 111803 (com0u3.lua) — Burning a Hole in One's Pocket

Source: FF14-Memory/Data/scripts/quests/com/com0u3.lua (full body read)
Guide: GamerEscape "Burning a Hole in One's Pocket" (fetched 2026-09-27, HTTP 200);
forum.square-enix.com Toto-Rak thread (fetched 2026-09-27, HTTP 200, chain context).
Fandom 1.0 Immortal Flames page and BlueGartr GC thread unreachable from this
environment (403/timeout); journal text recovered from GamerEscape instead.

Identity: quest 111803, code Com0u3, Story Lv 22, Immortal Flames (Ul'dah).
Prereq: 111802 Kindling a Flame (gamedata_quests row verified).
Unlocks: 111804 Arms Race; 111810 Imperial Devices (Ul'dah) lists 111803 as
prereq in gamedata_quests.sql. Class: all classes.

## Quest flow

Single public-zone conversation. No instance, no private area, no combat, no
items handed in or out, no seals granted. Talk to Flame Sergeant First Class
Rahz in the Hall of Flames; accept the shop-introduction dialogue; receive
1,100 EXP; quest completes. The journal's "purchase a vial of onyx tears, then
speak with First Flame Lieutenant Aubrey" is guidance for spending the seals
earned in 111802 and leads into 111804 (owned by Aubrey) — the recovered
client scenario gates nothing on a purchase or a second NPC.

Retail journal (GamerEscape, obsolete-quest entry):

> Flame Sergeant First Class Rahz has informed you of your limited options as
> an interim recruit, but has assured you that more will be made available
> upon official enlistment into the Immortal Flames. She has also suggested
> that you use the seals currently in your possession to purchase a vial of
> onyx tears, which will be of use to you on your missions. Speak with First
> Flame Lieutenant Aubrey once you have done so.

## Stages (SEQ)

```
SEQ_ACCEPT  (engine)  -- offer state; Rahz shows QFLAG_TALK.
SEQ_000 = 0           -- single conversation; Rahz shows QFLAG_REWARD.
```

No further sequences. onStart starts SEQ_000; onStateChange flags Rahz for
both SEQ_ACCEPT and SEQ_000.

## NPCs/Actors

```
RAHZ = 1500201;  -- Flame Sergeant First Class Rahz (flame_rahz)
```

Public spawn, server_eventnpc_spawn_locations row id 2816 (main SQL read):

```
zone 233 (Hall of Flames), X=169, Y=0, Z=-177.3, rot=-1.5, no private area
```

No quest-owned NPCs: gc_opening_npcs.json carries only restored/owned actors
for other quests in this chain (Ailith, C'ndanya, Raaka Maaka, Bamponcet,
Ebrelnaux, Quiliane, Yuhelmeric, Vairemont, Urianger copies) — Rahz needs no
entry because her public row already spawns her at the conversation point.

## Markers

```
MRKR_RAHZ = 11170201;  -- journal map marker for SEQ_000
```

Unlike the Limsa/Gridania sister quests (111403/111603 return {} because their
native rows are Sthalmann placeholders), this quest returns a live marker.

## Journal

getJournalInformation returns {343} on SEQ_000. No other journal branches.

## Flags/Counters

No quest-local flags/counters. Reward checkpointing reuses the shared GC
helper bits in characters_quest_scenario.flags (24 persisted bits):
EXP_PAID_FLAG=23 via GrantGCQuestExpOnce; ACCEPTED/SEALS bits unused here
(no seals on this quest). Fits the 4-counter/24-flag engine contract.

## Dialog branches / handlers

```
function onStart(player, quest)
function onFinish(player, quest)              -- empty, convention
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)           -- Rahz-only branch
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

onTalk flow:

1. sequence must be SEQ_ACCEPT or SEQ_000 and actor class 1500201.
2. Snapshot QuestData + sequence, then delegateEvent "processEventUSANZIStart".
   (Recovered client function name; conversation owner is Rahz per actor flag,
   spawn row, and retail journal. The USANZI name origin is unverified.)
3. CanContinueGrandCompanyQuestDialogue guard: a death, timeout, disconnect,
   zone change, or quest-state change during the client coroutine aborts
   without paying; the player retries by talking again.
4. accepted == 1: AcceptQuest on SEQ_ACCEPT (accept failure stops, no pay),
   then CompleteGCQuestOnce(player, quest, 1100).
5. Decline (accepted != 1): no state change; offer stays available.
6. player:EndEvent() always runs.

## Cutscenes / processEvents

```
processEventUSANZIStart   -- the Rahz shop-introduction conversation
```

No cutscene, no scene transfer, no widget handoff in the recovered scenario.

## Instance layout / bounds

None. The conversation runs in public zone 233 (Hall of Flames). No private
area, no squad battle, no boundary radius, no entry/exit rules, no level sync,
no mount/dismount gate, no party requirement. Chocobo-companion exclusion is
vacuous here: there is no instance or squad battle to enter.

## Mob roster (coordinate-guide application)

EMPTY — this is a dialogue-only quest with no battle director, no BNPCs, no
waves, no leash/aggro tuning, and no abilities. Per docs/mob_map_coordinates.md
(read fully, 438 lines): map pages select artwork/transforms, never floors or
proof of spawns, and no candidates may be invented. With no encounter there
are no mob positions to derive; the only position this quest needs is Rahz's,
taken directly from the authoritative main-SQL spawn row quoted above, not
from map art. No server_battlenpc rows, no placement manifest, no SQL change.

## Rewards

- 1,100 EXP, script-paid once via CompleteGCQuestOnce (checkpoint flag 23,
  QuestData.Save before CompleteQuest; crash/relog between manual pay and
  completion retries without double-paying).
- No seals, no gil, no items. gamedata_quest_rewards.sql correctly has no
  111803 row (same as 111802/111403/111603 — all script-paid).

## Fail / retry / re-entry rules

- Decline dialogue: nothing persisted; re-talk retries.
- Disconnect/death/timeout/zone-out mid-dialogue: dialogue guard aborts;
  EXP checkpoint prevents double-pay on retry.
- Relog after EXP paid but before completion: HasGCQuestExpRewardCheckpoint
  short-circuits evidence and pay; completion finalizes.
- Abandon: standard engine reset; QuestData (including flag 23) is dropped
  with the quest, so re-accept starts clean; chain prereq re-applies.
- Full inventory / seal cap: not applicable (no items, no seals).
- Leaving bounds: not applicable (public zone, no arena).
- Repeats: non-repeatable; completion unlocks 111804/111810 via quest DB.
- Prerequisite break (111802 reset): offer gating re-applies from
  gamedata_quests/quest_availability; in-flight progress cannot skip ahead
  because there is only SEQ_000 and completion is the only transition.
- Party/helper interference: none possible; solo public conversation, no
  shared objective state.
