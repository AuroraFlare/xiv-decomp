# WAR 111201–111206 deep decomp (2026-09-27)

Job-prefixed worker file. Sources inspected (bodies, not pointers):
`Data/scripts/quests/job_quest_template.lua` (War0j1–War0j6 rows + `InitJobQuest`),
`Data/scripts/directors/Quest/QuestDirectorJobWar0j{1,2}.lua`,
`Data/scripts/directors/Quest/gc_sqb_runtime.lua`,
`Data/scripts/private_quest_battle.lua`, `Data/scripts/quests/quest_availability.lua`,
`docs/Dat Mining/{quest_marker.csv,quest.csv,quest_new_reward.csv,xtx_quest.csv,war0j1..6.csv}`,
`Data/sql/{gamedata_quests.sql,gamedata_actor_class.sql,server_battlenpc_mob_types.sql,
server_battlenpc_mob_types_loot.sql,server_battlenpc_skill_list.sql,
server_eventnpc_spawn_locations.sql}`,
`FF14-Decomp/docs/job_war_mnk_whm_decomp_2026-09-07.md`,
Gamer Escape + Fandom 1.0 walkthroughs (fetched 2026-09-27).

Global: offer NPC Neale 1000090 (eventspawn 315, zone 230 Limsa) for 111201 only;
Curious Gorge 1060028 (eventspawn 2483, zone 172 (-1115.45,53.26,285.721)) owns all
other offers/returns. Unlock gate MRD30+GLD15. Client directors/scenario chunks carry
NO counts, waves, phases, enrages, or spawn transforms (all empty subclasses).

## 111201 War0j1 Pride and Duty (Lv30) — Implemented
- Flow: Neale `processEventStart` (offer 12/decline 11) → Gorge cave
  `processEventCurious` (texts 14–20; 20 = nest north) → kill Antling Workers →
  Gorge `processEventClear` + `processEventJob` (item arg, ability 27186) →
  Neale `processEventClearAfter` (texts 35–36, Astalicia report; NOT Gorge's).
- Markers: 11220001/03 cave (-1116.04,285.49,map 403), 11220002 fight (-1090.64,43.22).
- Mobs: 4x Antling Worker 2203001/TermiteStandard/3203001, mob 32730 (private),
  skill list 3 (23226,23227,23229,23560). Four-copy count = adapter tuning.
- Rewards: EXP 2661, action 27186, keyitem 2000203, item 3020410 (soul crystal).
- Director: QuestDirectorJobWar0j1 (gc_sqb_runtime, seq 5→10, retry 0, party ≤4,
  900s timeout). Journal Sea 336/337/338/339.

## 111202 War0j2 Embracing the Beast (Lv35) — Implemented
- Flow: Gorge `processEventCURIOUS_GORGEStart` (offer 17/decline 16) → kill Sirocco
  west of Humblehearth → completion hooks First (world text 51119), Second
  (ability 27187), Third (`showEventBeforeNpsLS(1600318,75)`).
- Marker: 11220101 (-414.89,-606.41,map 301 Central Shroud). No Y/facing/trigger.
- Mob: Sirocco 2100309/SerowFemaleNM/3100311, mob 3097 (lv42), skill list 4
  (23078,23079,23166,23196). Journal: 3 companions, 4 total (adapter uses 4).
- Rewards: EXP 3360, action 27187 (no item).
- Director: QuestDirectorJobWar0j2 (same runtime contract as War0j1).

## 111203 War0j3 Curious Gorge Goes to Bazaar (Lv40) — NEW private adapter
- Flow: Gorge `processEventCURIOUSGORGEStart` (15/14) → northern condor fight
  (marker 11220201 (-1343.82,364.39) = map (13.43,34.36): matches Gamer Escape
  "13-34 Western Thanalan" instance) → east-gate aftermath `processEvent005(arg4)`
  → NQ `war0j310` (args `"war0j310",1,0,arg4`; arg4 source unrecovered) →
  `processEvent010` (Gorge talk, 1.5s fades) → `processEventKokuti` (ability 27188)
  → cave return marker 11220203. Journal Wil 497/498/499 = three distinct beats.
- Scene war0j310: PC (-1342.66,56.70,489.33), Gorge (-1363.92,56.17,522.64);
  three Vulture scene actors 1001084 ≠ combat actor. Scene birds prove no count.
- Mobs (adapter): 5x Canyon Condor 2201208/BirdStandard/3201208, NEW private mob
  32750 lv43 (Gamer Escape: "Canyon Condors (Level 43)"; five per archived
  transcript), skillListId 0 (no recovered retail list; melee-only, no invented
  skills). Single wave; `QuestDirectorWar0j301` empty (no wave metadata).
- Ground (map_coordinates, zone 172): 34 recorded pts at battle marker
  (e.g. (-1334.99,56.86,365.59)); 12 pts at east gate (e.g. (-1341.12,56.11,463.29)).
- Rewards: EXP 4260, action 27188 (Collusion). Party ≤4 (journal silent; small cap).
- Director: NEW `QuestDirectorJobWar0j3.lua` (seq 5→10, retry 0, 900s).

## 111204 War0j4 Looking the Part (Lv45) — HOLD (unimplementable without live capture)
- Flow: Gorge `processEventCURIOUS_GORGE_Start` (13/12) → 4 unordered coffers
  (text 11 marks locations; text 16 order unimportant) → `processEvent_getAF_info`
  per coffer (scheduler 67108910 on event owner + `showGetJobItemWidget`) →
  complete in place (no return objective; journal Wil 502).
- Markers (all display 4000257 = ???, no actor): 11220301 Cutter's Cry
  (28.74,-1674.01,map 404); 11220302 Natalan (546.49,-154.67,map 201);
  11220303 Turning Leaf (-1596.22,162.98,map 304); 11220304 Craneperch Tower
  (681.90,553.73,map 101). No Y/rotation/coffer actor/marker→item binding.
- Items: 8051403 Breeches, 8071403 Gauntlets, 8081803 Jackboots, 8013503 Burgeonet.
  Order→marker alignment is a CANDIDATE only; template hard-stops (no objectives).
- No EXP/action reward row. Blocker: coffer actor classes + full transforms must be
  captured live; nothing in client data recovers them.

## 111205 War0j5 Proof is in Pudding (Lv45) — NEW private adapter
- Flow: Gorge `processEventCURIOUS_GORGEStart` (14/13; ordinary fade, no NQ) →
  slay Audhumbla in Iron Lake cave → completion First (51119), Second
  (ability 27192 mode **3**, not 1), Third (`showEventBeforeNpsLS(1600318,77)`).
- Marker: 11220401 (218.68,-1771.75,map 104 Upper La Noscea zone 135). NO recorded
  ground in any live recording (nearest zone-135 node (86.2,57.6,-2208.7) ~460u
  away); Y unresolved — capture required before any public placement.
- Mob (adapter): 1x Audhumbla 2100804/KujataHornedWar0j5/3100804, NEW private mob
  32751 lv52 (tuning: quest45+7 per Sirocco precedent), skillListId 0. Great
  Buffalo 2100801/3045 is a DIFFERENT NM and is never substituted.
- Journal Wil 505: 7 companions, 8 total → party ≤8. Rewards: EXP 5340, 27192.
- Director: NEW `QuestDirectorJobWar0j5.lua` (seq 5→10, retry 0, 900s, party ≤8).

## 111206 War0j6 How to Quit You (Lv50) — NEW private adapter
- Flow: Gorge offer (13/12) → Silver Bazaar `processEvent010` → NQ `war0j610`
  (entry; Gorge+Broken Mountain 1001985+3 Cliffdiver scene actors 1001982) →
  fight frenzied Gorge + Cliffdivers → `processEvent020` → NQ `war0j620`
  (aftermath; Gorge setup (-1366.46,56.16,522.07)) → FINAL TALK AT SILVER BAZAAR
  (journal Wil 510 + text 39; cave marker 11220501 is reminder-only, NOT reward) →
  `processEventClear` (long 42, ability 27189, item arg = 8032703 cuirass).
- Markers: 11220501 cave reminder; 11220502 Bazaar battle+reward (-1343.12,480.08).
- Mobs: 1x Curious Gorge 2289037 mob 3012 lv55 skill list 15 (23484,23490,23493,
  23494) — EXACT recovered profile; Cliffdiver 2201209/BirdNormalWar0j6/3201209
  lv53 (documented) with NEW private mob 32752, skillListId 0. Scene shows 3
  birds; combat copies unrecovered → adapter: 3 copies single-wave (tuning,
  labeled). `QuestDirectorWar0j601` empty (QuestDirectorBaseClass, no methods).
- Journal Wil 508/509/510; party ≤8. Rewards: action 27189, item 8032703.
- Director: NEW `QuestDirectorJobWar0j6.lua` (seq 5→10, retry 0, 1200s, party ≤8,
  successEvent `processEvent020`/`war0j620`). Gap: Bazaar reward-talk actor binding
  unrecovered → reward owner stays Gorge-public-spawn + private-aftermath pattern
  (see reg file); destination-owned Bazaar talk needs live capture.

## Template patch required (shared file; owner applies — NOT edited here)
In `JOB_QUESTS`: War0j3/5/6 add `offer=true`, `directorScript`, `targets`
(actor/mob/uniqueId per this doc), `partySizeEvidence`; War0j6 add
`privateAftermath=true`, `rewardActor=1060028`. In `quest_availability.lua`:
flip 111203/111205/111206 to Implemented private-adapter annotations.
War0j4 stays Partial until coffer capture.
