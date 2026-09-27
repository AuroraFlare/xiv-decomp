# 110421 Alc300 — The Boy and the Dragon Gay (Alchemist Lv.30)

Class quest. Prereq: Alc200 (110420) completed + Alchemist 30.
Source of truth for runtime: `FF14-Memory/Data/scripts/quests/alc/alc300.lua`
(full body read). Client text: `docs/Dat Mining/alc300.csv` (IDs 1, 3-28,
31-111; 2/29/30 absent, full body read). Status: HOLD-GATED (offer off,
availability commented; validators enforce the HOLD).

## Sequence / flags / counters

| Seq | Name | Talk | Event | Effect |
|---|---|---|---|---|
| ACCEPT | offer | Nogeloix 1000597 | processEventNogeloixStart | nil-or-1 accept + AcceptQuest |
| 0 | damielliot | any of {1000853,1000854,1001516} | processEvent003 | bare advance |
| 5 | children | sickly child 1001035 | processEvent005 | bare advance |
| 10 | briefing | Nogeloix | processEvent007 | grant Frondale's Funds 11000037 x1 |
| 15 | penelope | Penelope 1700001 | processEvent008 | bare advance (meeting) |
| 20 | parley | Penelope | board stamp (no scene) | win in onNegotiationResult grants Starfall Grass 11000041, advances |
| 25 | grass | Nogeloix | processEvent015 | consume 1 grass |
| 30 | ward | S'lyhhia 1000932 | processEvent020 (scene alc30020, final) | CompleteQuest + 3420 EXP |

Flags: 0 = parley introduced (board stamped). Counters: none used (template
work slots 2/3/4 + memo items documented but never granted: the funds/memo
source transaction is unresolved, so no silent memo inventing). Journal:
`(seq,0,0,0,0)` throughout (no craft objective).

## NPCs / positions

Public spawns verified in SQL: Nogeloix 1000597 (display 1200017), zone 209,
(-211.67, 229.6, 279.04); Penelope 1700001 (display 1100404), zone 155
(Gridania Adventurers' Guild), (58.08, 3.8, -1183.33), rot 2.93; S'lyhhia
1000932 (display 1900021), zone 209, (-215.88, 229.5, 300.48), row 3327.
Miounne 1000230 (display 1300018), zone 155, (55.94, 4, -1196.44) exists
for the 008_3 info beat (unwired: second info NPC unresolved).
UNSPAWNED (the offer HOLD): Damielliot candidates 1000853/1000854/1001516
(all display 1200030 per actorclass.csv; shared appearance, accept-any) and
sickly child 1001035 (display 4000330; walkthrough name-lead "Soft-spoken
Schoolgirl" is not an identity). Sickroom sits in the guild-back-door
instance ("second left"); interior has no recorded navmesh and no retail
coordinates, so no spawn rows are authored here.

## Dialogue / cutscene IDs (DAT text IDs, EN verified)

1 (Nogeloix linkpearl summons), 3-6 (ward access, sickroom pointer), 7-11
(children), 12-20 (Damielliot dragon murmurs + tale fragment), 21-24 +
74-84 (briefing: starfall grass, Gridania pointer, parley hint 75/79),
25-28 + 98-111 (Gridania info NPCs; paid-info asks 99-101; Roost 106-111),
31-39 + 64 + 86-89 (Penelope: refusal, tale exchange "the Boy and the
Dragon Gay", Ishgard heresy warning), 40-44 + 96-97 (grass delivery,
S'lyhhia handoff), 45-56 (finale: story choice 60-63 — correct = 63 "The
Boy and the Dragon Gay"; wrong picks 47-49; reward 56). Offer asks 57-59.

## Parley

Mandatory at seq 20. Server negotiation engine
(`Data/scripts/negotiation_game.lua`, Hrv300-precedent temp-var board):
title 1302 (1303/1304 unresolved same-window variants), difficulty 3,
12 turns, 20s/turn, no required/desired item. Talk stamps the board
idempotently + sets flag 0; `onNegotiationResult` self-filters on
Penelope + seq 20 + flag, clears the shared board on win, and uses
grant-before-advance (full inventory holds at 20, re-talk re-stamps).
Penelope is shared with Hrv300; each quest re-stamps on talk.

## Objectives / instances / mobs / sync / lockout

Visit Damielliot -> question children -> briefing/Funds -> meet Penelope ->
win Parley -> deliver grass -> ward finale. Retail ward legs are
guild-instance scenes; server runs them as public talks + client scenes
(no warp, no private area). No mobs, stats, abilities, AI, phases,
enmity, leash, sync, or lockouts (non-combat). No chocobo handling needed
(no server instance entered). Zones: 209, 155.

## Items / rewards

11000037 Funds (grant), 11000038/11000039 memos (never granted), 11000041
Starfall Grass (Parley-win grant, consumed at delivery). Rewards: EXP 3420
script; gil 30000 + marks 3000 central. Single CompleteQuest.

## Edge cases (verified in script body)

Inv-full: grant-verify at briefing and Parley win (win holds at 20 on
failure). Dup turn-in: consume-verify; missing grass announces. Abandon/
completion: onFinish sweeps all four items NQ+HQ multi-copy. Parley loss:
announce + retry (no state change). Cross-quest board: result handler
self-filters; foreign wins ignored. Class/level/prereq on every talk.
Death/logout/re-enter: no instance; flags persist via QuestData save.
Unwired by design: paid-info scenes 008_3-008_6 + post-Parley 010 grant
scene (plays bare), finale story-choice result binding (single-talk
completion; DAT choice IDs recorded above for a future binding).
