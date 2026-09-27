# 110400 Hoodwinked (Wvr200) — decomp

Weaver rank-20 initiation. Accept from Deaustie at Sunsilk Tapestries
(Ul'dah, zone 209); meet mentor Chuchumu at the Golden Bazaar (Eastern
Thanalan, zone 171); repair her Ripped Riding Hood via synthesis;
deliver it; return for reward. Little Red Riding Hood pastiche:
Chuchumu's heirloom hood was shredded by a feral beast and her
stepmother Lady Ouvielle demands a replacement.

Sources: `Data/scripts/quests/wvr/wvr200.lua` (full body read),
`wvr_quest_helpers.lua` (full body read), gamedata_quests /
gamedata_quest_rewards / gamedata_recipes / gamedata_items /
gamedata_actor_class / server_eventnpc_spawn_locations rows (inspected),
[GamerEscape Hoodwinked](https://ffxiv.gamerescape.com/wiki/Hoodwinked),
[Weaver Quests 1.0](https://finalfantasy.fandom.com/wiki/Weaver_Quests_(version_1.0)).

## Sequence / flags / counters

| Seq | Name | Talk | Effect |
|-----|------|------|--------|
| accept | offer | Deaustie 1000293 | delegateEvent processEventDeaustieStart; accept -> 0 |
| 0 | meet | Chuchumu 1000905/1000906 | verify-grant Ripped Hood 11000055; processEvent010 -> 5 |
| 5 | report | Deaustie | processEvent005_2 (variant rule unrecovered); snapshot hood count -> 6 |
| 6 | repair | Deaustie | bare verify: net-gain hood >= 1 and held >= 1 -> 8, else progress msg |
| 8 | deliver | Chuchumu | consume 1x Red Hood 11000054 (verified); processEvent020 -> 10 |
| 10 | reward | Deaustie | processEvent030; CompleteQuest; AddExp 0 |

Counters: 0 = hood baseline. Flags: none. Journal: seq 6 shows
min(net-gain,1)/1. Class gate: Weaver (34) + true level >= 20 on every
guard (offer, statechange, talk).

## NPCs / spawns

- Deaustie 1000293: row 149, zone 209 (38.84, 195.59, 257.89).
- Chuchumu 1000905 (candidate picked; 1000906 identical, both display
  1500042; script accepts either): row 3354, zone 171, Golden Bazaar
  hamlet (1122.500, 312.200, -1118.500). Hamlet-floor height (6.9u
  from rammbroes); no recorded navmesh within 76u — verify in game.
- Ouvielle: referenced in dialogue only; no actor recovered, unspawned.

## Dialogue / cutscene IDs

processEventDeaustieStart, processEvent010, processEvent005_2 (of the
005_2..005_8 family; selection rule unrecovered), processEvent020,
processEvent030. No ask/Echo gates on this quest.

## Objectives / markers

Journal marker ids referenced: 11040001 (meet), 11040002 (deliver),
11040004 (Deaustie position; reused for report/repair/reward — no
dedicated guild markers recovered). Bazaar boundary 03 unmapped.

## Instance / territory / sync / lockout

None. Open world only (zones 209/171). No private content, no zone
changes, no party, no timer, no level sync, no lockout, no chocobo
handling (no instance to unsummon in).

## Mobs

None. Non-combat craft/delivery quest: no BNPCs, no abilities, no AI,
no enmity, no leash, no reinforcements, no death/wipe handling.

## Synthesis

Recipe 5400 (job F WVR20, kind CC, no crystals): 11000055 Ripped
Riding Hood + 10005005 Undyed Cotton Cloth + 10010719 All-purpose Red
Dye + 10005302 Cotton Yarn -> 11000054 Red Riding Hood. Matches the
wiki walkthrough exactly. Credit is a snapshot-diff probe (NQ+HQ,
traded outputs credit); no synthesis callback exists in the engine.

## Rewards

Gil 20000 + Weaver marks 1000118 x2000 (central, autoGrant) + EXP 0
(post-1.20 amount unreported; Bsm306 precedent). NO Brass Needle
(rejected: absent from archive and central table). Linkpearl grant
skipped (item id unrecovered; Alc200 precedent).

## Edge handling

- Class/level gates on offer, statechange, talk.
- Verified grants (inv-full safe, retryable) and verified consumes
  (no dup turn-ins; delivery re-checks held count first).
- onFinish consume-all fires on complete AND abandon (no leftovers).
- Logout/DC: counters persist in quest data; synthesis baseline
  survives; re-talk resumes.
