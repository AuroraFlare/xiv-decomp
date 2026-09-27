# 110402 A Fruitful Murder (Wvr306) — decomp

Weaver rank-36 quest. After the royal ball (Chuchumu fled at midnight
leaving a single glove), Ul'dah ladies order lookalike gloves and
Deaustie commissions ten pairs of Luxurious Gloves. Chuchumu reveals
they need Thanalan spider silk: meet her entangled in webs at the
Copperbell Mines entrance, peel silk strand by strand, synthesize ten
gloves on site, free her, deliver to Deaustie, witness the Gold Court
denouement (the prince, the dowry, the Echo's poisoned-apple reveal),
and report back. NON-COMBAT throughout: the "instance" is an open-
world on-site synthesis, not a dungeon.

Sources: `Data/scripts/quests/wvr/wvr306.lua` (full body read),
`wvr_quest_helpers.lua`, gamedata/recipe/spawn rows (inspected),
[GamerEscape](https://ffxiv.gamerescape.com/wiki/A_Fruitful_Murder),
[Weaver Quests 1.0](https://finalfantasy.fandom.com/wiki/Weaver_Quests_(version_1.0)),
legacy forum threads (recipe: 10 velveteen + 10 cotton yarn on site).

## Sequence / flags / counters

| Seq | Name | Talk | Effect |
|-----|------|------|--------|
| accept | offer | Deaustie 1000293 | delegateEvent processEventDeaustieStart; accept -> 0 |
| 0 | order | Deaustie | processEvent010 -> 5 |
| 5 | brief | Chuchumu | bare advance; snapshot glove count -> 10 |
| 10 | copperbell | Chuchumu | gloves 10/10 held -> processEvent020 -> 15; else grant 1 silk (cap 10 total, verified) + processEvent008 |
| 15 | freeing | Chuchumu | held 10/10 -> 20; else processEvent008_2 + msg |
| 20 | gloves home | Deaustie | consume 10x gloves (verified) -> 25; else msg |
| 25 | gold court | Chuchumu (balcony) | bare advance -> 30 (no recovered scene/Echo owner) |
| 30 | return | Deaustie | processEvent030; CompleteQuest; AddExp 3720 |

Counters: 0 = glove baseline, 1 = silk granted tally (cap 10, no
dupes). Flags: none. Journal: seq 10 net-gain/10; seq 15/20 held/10.
Gates: Weaver + true level >= 36 + 110401 completed, every guard.

## NPCs / spawns

- Deaustie 1000293: row 149, zone 209 (38.84, 195.59, 257.89).
- Chuchumu 1000905: row 3354 zone 171 Bazaar (briefing talks);
  row 3355 zone 172 Copperbell gate (-625.000, 112.000, -122.000)
  (gate-anchor height; no recorded ground within 74u, verify);
  row 3356 zone 209 Gold Court balcony (-140.404, 272.000, 156.426)
  EXACT recorded ground (live node 73).
- Prince/dowry, Ouvielle, stepsisters: unresolved, unspawned.

## Dialogue / cutscene IDs

processEventDeaustieStart, processEvent010, processEvent008 (silk/
progress), processEvent008_2 (short), processEvent020, processEvent030
(finale; Gold Court-vs-return split unresolved, plays once at 30).
No Echo owner recovered; no S001-S005 removal responses in engine.

## Objectives / markers

11040204 Deaustie position (order/gloves-home/return; no dedicated
accept marker), 11040205 brief, 11040201+11040202 copperbell,
11040206 freeing, 11040203 gold court.

## Instance / territory / sync / lockout

Retail used a NON-COMBAT private SQB here: the decomp template
recovers `QuestDirectorWvr30601` (+ a SimpleQuestBattleBaseClass
director) for the silk-removal/on-site-synthesis lifecycle, and the
fight-setting audit tags this quest Instanced — hence the retained
`instance` availability label. No trigger owners or geometry were
recovered, so the quest is served fully in the open world (zones
209/171/172): no private content at runtime (nothing to
enter/retry/timeout), no zone changes, no party, no timer, no level
sync, no lockout, nothing to unsummon.
On-site/beside-Chuchumu synthesis proximity is NOT enforced (no
engine owner); gloves crafted anywhere during seq 10 credit.

## Mobs

None. No spiders spawned, no kills tracked: no BNPCs, no abilities,
no AI, no enmity, no leash, no reinforcements, no death/wipe path.

## Synthesis

Recipe 5401 (job F WVR36, kind CC, no crystals): 11000057 Thanalan
Spider Silk + 10005015 Undyed Velveteen + 10005302 Cotton Yarn ->
11000056 Luxurious Gloves x1. Repeat x10. Bring 10 velveteen + 10
yarn (wiki); silk comes from the capped talk loop. Credit is a
snapshot-diff probe (NQ+HQ, traded gloves credit).

## Rewards

Gil 36000 + Weaver marks 1000118 x3600 (central, autoGrant) + EXP
3720 script-side (stated post-1.20 maximum, NOT the usual 4720).

## Edge handling

- Class/level/chain gates on every guard; strict sequence matching.
- Silk grants verified + counter-capped (inv-full retries, no dupes).
- Glove delivery re-checks held 10/10 then consume-verifies.
- onFinish consume-all (silk + gloves) on complete AND abandon.
- Logout/DC: baseline + tally persist; re-talk resumes the loop.
- No sequence breaks: freeing/delivery/return each re-validate held
  counts; Gold Court talk only advances seq 25.
