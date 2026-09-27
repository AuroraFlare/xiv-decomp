# 110262 The Call of Nature (Cnj306) — in-depth decomp

Conjurer rank 36. Offer/reward: Soileine (1000234), Stillglade Fane
zone 206 (spawn 2296). Requires CNJ + level 36; gamedata prereq
110261 (server does not gate offers on prerequisites). Custom script
`Data/scripts/quests/cnj/cnj306.lua` — the class driver has no escort
state and no second battle node, so the template `Cnj306` row stays
dormant as the decomp record. Text bank
`_loadTextDataPermanently(487, "cnj306")`.

## Sequence / flags (server: cnj306.lua; 16/31 internal duty states)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Soileine offer | `processEventSoileineStart`: rows 3-6, double `showQuestInfomation`; accept on 1/nil |
| 0 | Ingram briefing (1000372; zone 206, -346/6.82/-1705, id 3302) | `processEvent010` (`cnj30610`); grants Mysterious Leather Bag 11000101 once (`HasItem` guard + sysmsg 25246); marker 11026201. Retail stages in an instance; server plays public |
| 5 | Amberscale escort request (Morys 1000505; zone 150, -543.79/5/-511.35, id 3303) | `processEvent020` (`cnj30620`) then `processEvent025`: row 21 ("To Ishgard. I must go...") + ask 50 ("Escort Brother Morys to Ishgard?") DOUBLE-CALLED (branch + return — this is the walkthrough's "answer yes to both options"); yes (row 22) → seq 15; no (row 101) holds; marker 11026202 |
| 15 | Emerald Moss escort launch (Morys; zone 152, -1068.248/20.293/-1764.721, id 3304) | `processEvent030` (`cnj30630`) launches the private zone-152 escort copy (combat-class preflight; launch owns the event); marker 11026203 |
| 16 | Escort duty (internal) | No public ENPC; director-owned; completion → 25, fail → 15 |
| 25 | Echo on unconscious Morys (zone 150, -583/5/-440, id 3305) | `processEvent045`: Echo ask 51030 double-called (yes runs `runCharaSchedulerPastAreaIn`); yes → `processEvent050` (`cnj30650`, after-warp) → seq 30; no holds; markers 11026204/05. Three pre-Echo elementals stay scene dressing |
| 30 | Cave edge (trigger 1000174; zone 150, -580/5/-444, id 3306) | Push opens the Echo defense; `processEvent060` (`cnj30660`, after-warp) runs as duty preEvent; marker 11026206 |
| 31 | Echo defense (internal) | No public ENPC; 3 kills → 40, fail → 30 |
| 40 | Ingram report | `processEvent080` (`cnj30680`); consumes the bag if held; marker 11026207 |
| 45 | Soileine reward | `processEvent095` (`cnj30690`; 090 is the after-warp variant, not staged) + `sqrwa 4720`; marker 11026208 |

Ambient delegate events (client scenario, unowned/unbound):
005_2..005_12, 010_2..010_4, 030_2..030_3, 070_2..070_10. No counters.

## Dialogue / cutscenes (recovered client Cnj306)

cnj30610 (Ingram+bag), cnj30620 (request), cnj30630 (launch), cnj30640
(vanish, after-warp, plays in-duty on escort completion), cnj30650
(Echo warp, after-warp), cnj30660 (cave arrival, after-warp, Echo
preEvent), cnj30670 (post-fight, after-warp, Echo success scene),
cnj30680 (Ingram report), cnj30690 (reward via 095). Key DAT text:
ask-50 "Escort Brother Morys to Ishgard?", row 22 "I must prepare.
Soon, we meet again. Soon. At Camp Emerald Moss."

## Objectives / markers (DAT quest_marker; 11026209-20 filler)

11026201/07/08 Stillglade (-346,-1705) → (2,1), exactly the wiki's
"Conjurer's Guild (2,1)". 11026202/04 Amberscale (-543.79,-511.35) →
(25,32), exactly the wiki's "Amberscale Rock (25,32)". 11026203
Emerald Moss (-1067,-1765, zone 152) → (20,20); spawn/route entry
(-1068.248,20.293,-1764.721) is an exact recorded node. 11026205
(-583,-440) / 11026206 (-580,-444) → (25,33) area. Amberscale-area Y
UNRESOLVED — 0 recorded pts ≤30 ylm, nearest nodes 1077/1080 @245.9/285.8 ylm NOT borrowed per guide; needs `!quicknavmesh` capture (unrecorded corridor). Conversions via
`tools/mobspawns/map_coordinates.py`.

## Instance / territory

- Escort: private North Shroud copy (`SimpleContentCnj306Escort`,
  boundary X -1450..-1000 / Z -1850..-1650, music 52/21), entry
  (-1068.248,20.293,-1764.721). Route JSON (69 recorded nodes,
  342.7 yalms, zone_152 hash embedded) is nav-authored, not a retail
  path claim.
- Echo defense: SimpleContentQuestBattle copy `quest_sqb_cnj306echo_
  <pid>` (adapter formation, not retail layout).
- Client QuestDirectorCnj30601/02 recovered as empty class shells.

## Escort duty: Morys to the clearing (lv 36)

- Morys ally (content variant 2290033, lv 36, party-registered).
- Stop wp23 (-1150.31,15.24,-1726.72): 2x Yarzon Stalker 2205506/3140,
  lv 36, skillList 5063 (Corrosive Spit 23139/23348, Brain Spike 23140).
- Stop wp46 (-1263.68,19.97,-1730.28): 2x Yarzon Stalker (same).
- Stop wp68 clearing (-1367.38,19.73,-1726.18): 4x Furline
  Mosstrooper 2280158-2280161/3141-3144 spawning together, lv 36,
  skillList 15 (animal_instinct, godsbane, jump, wyvern_dive).
- Fail: Morys HP ≤ 0.02 ratio (near-death; exact-0
  unrepresentable) or owner > 60 yalms for 10 s (leash 32, map
  marker). Win: reach clearing + defeat Furline group → 040/cnj30640
  in-duty → return to camp, seq 25. Budget 900 s, director backstop
  960 s. Reconnect pauses/resumes the route (relog rebind).
  `canCallBackChocobo: false`, `canCallBackEscort: false`.

## Echo defense: exactly 3 Hungry Dreadwolves (lv 36)

- Hungry Dreadwolf 2201412/3145 x3, wave 1, lv 36
  (`cnj306_hungry_dreadwolf_1..3`; 2201423 stays the unresolved
  same-name alternate; 2201412 per GC-side precedent). SkillList 5062
  (canine: Midnight Howl, Threatening Growl, Foul/Sanguine Bite).
- Young Morys (1000506, distinct appearance) staged as dressing;
  win = three kills; aftermath `processEvent070`/`cnj30670` runs as
  the success scene ("defend Morys... a quick AoE spell will draw
  their attention" carried by scene + ally presence — the shared
  runtime has no protect-the-NPC rule).
- Director QuestDirectorCnj306Echo: expected 31 → success 40 →
  retry 30, requireAllTargets, party cap 3, 600 s; exact-actor kill
  reconciliation. Phases/reinforcements: none. Enmity/leash:
  standard content AI.

## Triggers / edge handling

CNJ+level gates on every handler; bag granted once (no dup on
abandon/re-accept), returned if held; ask declines hold their steps;
combat-class preflight on escort entry; failed launches revert
(15/30); escort abandonment/leave reverts 16→15 via content
`onPlayerLeft` (completion/failure set their sequence BEFORE the
return, so no double-revert); death/timeout/disconnect/area-exit via
directors (escort: MEET retry; echo: gc_sqb retry 30, teardown,
relog rebind); dismount gate at entries + private-area mount block
+ transition/per-tick force-dismount; escort chocobo callback
disabled; party leader-only, max 3, same-area/alive/combat checks.
No level sync; overlevel allowed. No lockouts beyond duty timers.

## Rewards (gamedata_quest_rewards + script)

Gil 36000 + CNJ marks 1000111x3600 (central) + Exp 4720 (script).
No item (none evidenced).

## Sources

- Client scenario decomp `.../lua/quest/scenario/cnj/cnj306.lua`
  (double-ask 025/045, after-warp fades, 090/095 variants); DAT
  `docs/Dat Mining/cnj306.csv` (105 rows), `quest_marker.csv`
  11026201-08 (+09-20 filler), display 1000141/1000175/3205506/
  3280157-62/3201411/3201422; `quest.csv` row 110262 (prereq 110261);
  item 11000101 `gamedata_items`.
- Gamer Escape `The_Call_of_Nature` (Ingram instance, White Wolf
  Gate, Amberscale (25,32), "yes to both", escort HP-0/distance
  fails, Yarzon + Furline clearing, Amberscale instance, Echo,
  3 Dreadwolves + AoE tip, Ingram instance, Soileine); FFXIV Wiki
  `Conjurer_Quests_(version_1.0)` (journal, 4720 EXP, no item).
- YouTube `nVO3Uw9XwqQ` + `Fl5tkBuF9Yc` v1.23b (17:55) + FF Archive
  playlist.
- Map conversions via `tools/mobspawns/map_coordinates.py`.

## Open gaps

- Live-client acceptance of scenes/duties/positions (escort path,
  mob copies/levels, offsets, caps, timers, after-warp lifetimes,
  public-vs-instance Ingram legs are documented reconstructions).
- Echo defense has no protect-the-NPC failure rule (runtime limit).
- Dreadwolf 2201412-vs-2201423 exact actor unresolvable from DAT.
