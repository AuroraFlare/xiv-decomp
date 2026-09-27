# Ranged/magic battle class quests indepth decomp — ARC/LNC/THM/CNJ 200/300/306 — 2026-09-27

Pack: `ranged` (master index `docs/class-quest-ranged-arc-lnc-thm-cnj-indepth-decomp-2026-09-27.md`
is this file; machine lists under `outputs/class-quest-ranged-decomp-20260927/`).
Quests: 110160 Arc200, 110161 Arc300, 110162 Arc306, 110180 Lnc200, 110181 Lnc300,
110182 Lnc306, 110240 Thm200, 110241 Thm300, 110242 Thm306, 110260 Cnj200, 110261 Cnj300,
110262 Cnj306.

Sources: decompiled client scenarios
(`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/<fam>/<code>.lua` in FF14-Decomp),
DAT `docs/Dat Mining/quest_marker.csv`, `Data/sql/gamedata_quests.sql`,
`Data/sql/gamedata_quest_rewards.sql`, `Data/sql/server_battlenpc_mob_types.sql`,
`Data/sql/server_eventnpc_spawn_locations.sql`, `meteor-wiki-quests/quests-archive.md`
(ffxivclassic fragmenterworks walkthroughs), prior pass notes
`docs/<code>_*_2026-09-26.md`, `docs/class_job_quest_implementation_2026-08-23.md`.

Live implementation split:
- Generic driver (`InitClassQuest`, `Data/scripts/quests/class_quest_template.lua`) + thin
  `Data/scripts/quests/<fam>/<code>.lua` stubs + `QuestDirectorClass<code>.lua` wrappers over
  the shared `gc_sqb_runtime`: Arc200, Lnc200/300/306, Thm200/300/306, Cnj200/300.
- Custom scripts (driver cannot express them): `arc/arc300.lua`, `arc/arc306.lua`
  (multi-phase proximity talks, two-battle Arc306), `cnj/cnj306.lua` (escort state + two
  duties). Their template rows stay dormant metadata (`noOffer`, no live route/battle).

Edge-handling ownership (all 12): class/level gates on every quest handler; instance entry
checks in `quests/com/gc_sqb_quest.lua` (`collectEntrants`: online, same area, combat class,
alive, level, party cap, radius); death/timeout/disconnect/abandon(area-exit, quest-changed,
entry-failed, session-replaced)/retry in `directors/Quest/gc_sqb_runtime.lua`
(success→post-fight sequence, failure→retry sequence, always `UpdateENPCs`, return party,
`ContentFinished`, `EndDirector`); `onKillBNpc` in quest scripts inert so only the
content-owned director credits exact private actors; `UpdateENPCs` + `EndEvent` on all
paths; `StartPrivateQuestBattle` two-value contract (`started, cleanupOwnsEvent`) — a
staged-failure cleanup already ends the event, the caller must not end it again.
Fixes applied 2026-09-27: `cnj306.lua` echo launch and the shared `startClassBattle`
driver now propagate `cleanupOwnsEvent` (previously dropped → double `EndEvent` on staged
failure); Thm200/Thm300 proof grants (`Twisted Aldgoat Horn` 11000015, `Writ of Access`
11000030) now grant once (`HasItem` guard, Cnj306-bag precedent) so duty retries cannot
farm them. `quest_availability.lua` enablement untouched (Arc 110160–110162 enabled;
Lnc/Thm/Cnj rows stay commented).

**No chocobo usage anywhere**: zero chocobo actors, callbacks, or mounts in all 12 quest
scripts, all 14 directors, and all template rows. Chocobos exist only as DAT dialogue
text (Lnc300) and walkthrough prose. Verified by grep 2026-09-27; only `No chocobo ...`
absence notes remain.

## 110160 Arc200 — Filling the Quiver (Lv.20 Archer, offer+reward Nonolato 1000463/1400007)

- Offer: `processEventNonolatoStart`. Route: [1] Keelty briefing 1000587 @11016001
  `processEvent010`; [2] fence rendezvous generic trigger 1000174 @11016002 `processEvent020`.
- Battle: `QuestDirectorClassArc200`, preEvent `processEvent030`, markers {11016003} (-1356.24,
  -2104.54, North Shroud 103/303). 5 Yarzon Invaders wave 1: 2205503/3122 x2, 2205504/3123 x2,
  2205505/3124 x1 (all Lv.15). Win: all kills. 600s, party 3. Ixal flees, never a target.
- Post: [20] Nonolato @11016004 `processEvent040`; reward hook `processEvent050`.
- Rewards: EXP 1760, gil 20000, Archer marks 1000106 x2000 (central), item 4070011 x1 (script).
- Markers: 11016001 (261.38,-1264.70,1100199,103/321), 02 (-1067.16,-1764.70,4000257,103/303),
  03 battle, 04 reward (232.88,-1268.94,1400007,103/321). 11016005–20 filler (rejected).
- Unbound decomp variants: 005_2–005_8, 010_2–010_5, 030_2–030_4, 040_2–040_4 (flavor, no owner).
- Sequences: 0 retry@Nonolato, 1, 2, battle 10, post 20, reward 30.

## 110161 Arc300 — The Foreboding Forest (Lv.30 Archer, offer Nonolato; custom script)

- Flow: NonolatoStart → Keelty Hold briefing `010` (seq 0) → Owl's Nest gate push
  `arc300_owl_gate` `015` (seq 5) → Vairemont 1000586 delivery `020` (seq 10) → Keelty@Owl
  `027` (seq 15) → Keelty@Owl again `030` (seq 16) → road-ambush push `arc300_ambush_trigger`
  `040` (seq 20, ask not result-gated; native duty prompt carries decline) → internal battle
  seq 21 → Keelty post-fight report `050` with Yes gate (nil/1 advances, explicit 0 holds;
  seq 25) → Nonolato reward (standard path, no recovered completion event; seq 30).
- Keelty (single class 1000587/1100199) disambiguated per phase by 60-yalm proximity to DAT
  anchors: Hold (261.38,-1264.70), Owl (2566.69,1313.25), post (-1588.56,-1913.51).
  Wrong-phase same-class talks play nothing. Unbound: 025/025_2 Pascaleret interlude (no
  recovered owner; story rides in 027/030).
- Battle: `QuestDirectorClassArc300`, markers {11016106} (-1602.12,-1854.22, Black Shroud).
  Bandit Pathfinder 2280165/32748 + Bandit Scout 2280164/32747 (both Lv.30, skill list 15).
  Both must fall. 1800s (recovered 30-min cap), party 3.
- Rewards: EXP 3420 (script + `sqrwa`), gil 30000, marks 1000106 x3000 (central). No item.
- Markers 11016101–08 (see markers.csv); 11016109–20 filler (rejected).
- Journal states (retail): 0/5/10/15/16/20 + internal 21 + 25/30.

## 110162 Arc306 — There Can Be Only One (Lv.36 Archer, offer+reward Nonolato; custom script)

- Flow: NonolatoStart → ask phase seq 0: six optional archer-informant hints
  (1000625/26, 1000829/30/31/32 → 005_2–005_7; 005_8 unbound, no seventh owner) + Sorrel Haven
  Keelty find `010` (cutscene-internal escape choice, no result gate) → escape duty seq 6 →
  return seq 7 → duel-trigger push `arc306_duel_trigger` `020` → duel seq 8 → aftermath push
  `arc306_aftermath_trigger` `030` (seq 10) → Keelty@Hold confession `040` (seq 15) →
  Nonolato `050` + EXP (seq 20; no central EXP row, granted explicitly like template path).
- Escape (`QuestDirectorClassArc306Escape`, markers {11016206} (-383.13,-542.29), boundary
  200 yalms): 4 Yarzon Stalkers 2205506/3140 (Lv.36); kills credit but never win
  (`requireAllTargets=false`, `requiredKills=999`); reaching either exit wins
  (south-Gridania / north-east-Sorrel reconstructions, 15-yalm radius). Death/backstop timer
  fails to seq 0. Retry seq 0.
- Duel (`QuestDirectorClassArc306Duel`): Siward 2289015→2289016/32749 (Lv.36) sole target;
  3 optional Yarzon Stalkers spawn on first completion tick outside the kill ledger (their
  kills never credit). Win: Siward defeat. Retry seq 7, success seq 10. 600s, party 3.
  Battle-ally candidate 2290032 never spawned (no walkthrough evidence).
- Keelty phases disambiguated by proximity (Sorrel vs Hold anchors, 60 yalms). Unbound:
  010_2, 040_2–040_8 (no recovered owners).
- Rewards: gil 36000, marks 1000106 x3600 (central), EXP 4720 (script). No item.
- Markers 11016201–06; 11016207–20 filler (rejected). Journal states (retail): 0/5/7/10/15/20.

## 110180 Lnc200 — A Wailing Welcome (Lv.20 Lancer, offer+reward Willelda 1000242/1100014)

- Offer `processEventWilleldaStart`. Route: [1] J'moldva 1000599 @11018001 `010`.
- Battle `QuestDirectorClassLnc200`, markers {11018002} (-642.01,-1060.05, Central Shroud):
  4 Orchard Chigoes 2205605/3125 (Lv.15), single wave, all kills. 600s, party 3.
- Post: [20] J'moldva @11018003 `020` (after-warp exit plays as talk callback) →
  [21] Willelda @11018004 `040` payment speech; reward hook `030`.
- Rewards: EXP 1760, gil 20000, Lancer marks 1000107 x2000 (central), item 4080406 x1.
  Wailing Barracks Linkpearl grant unbound (no evidence).
- Markers 11018001–04; 11018005–20 filler (rejected). Sequences: 0,1,10,20,21,30.

## 110181 Lnc300 — Culture Shock (Lv.30 Lancer, offer J'moldva 1000599, reward Willelda)

- Offer: J'moldva briefing (accept ask DAT 87–89 lives inside it; no `WilleldaStart` scene
  exists for lnc300). Route: [1] Gagaruna 1000862 @11018101 `020` (Platinum Mirage canvass);
  [2] Dreues 1000402 @11018107 `030` (100,000-gil ask not a gate — both answers converge);
  [3] J'moldva @11018102 `040` (caravan order); [4] rendezvous push 1000174 @11018103 `050`.
- Battle `QuestDirectorClassLnc300`, markers {11018103} (379.70,-14.30, square (34,37)):
  preEvent `060` (Garlean flyover, presentation-only); wave 1: 5 Woodsent Pterocs
  2200108/3131 (Lv.30); wave 2: 2 Woodsent Does 2200304/3132 (Lv.30). All kills. 600s,
  party 3. No escort AI / failure rule evidenced (rendezvous scene + kill-all-waves defense).
- Post: [20] broker 1000403 @11018104 `065` + afterEvent `068` (injured-moogle + merchant
  thanks, one interaction); [21] J'moldva @11018105 `070`; reward hook `075` (Willelda
  rows 85/86). Dreues confrontation scene-only (no kill step).
- Rewards: EXP 3420, gil 30000, marks 1000107 x3000 (central). No item.
- Markers 11018101–07 all live; 11018108–20 filler (rejected). Sequences: 0–4,10,20,21,30.

## 110182 Lnc306 — Necessary Evils (Lv.36 Lancer, offer+reward Willelda)

- Offer `processEventWilleldaStart` (oath). Route: [1] J'moldva @11018201 `010` (good/bad-news
  choice takes either answer, no gate); [2] south-road duty-trigger push 1000174 @11018202
  `020`.
- Battle `QuestDirectorClassLnc306`, markers {11018202} (394.23,-782.40, square (34,30)):
  Woodsent Elemental 2205202/3133 (Lv.36, THM profile). Single kill. 600s, party 3.
  (2204605 homonym is open-world fire block; 2205201/2205202 quest scenario pair.)
- Post: [20] campfire aftermath push @11018202 `030`; [21] broker @11018203 `035` Echo gate
  (51030, result 0 holds; req 1) + afterEvent `040`; [22] J'moldva @11018204 `050`;
  reward hook `060` (Willelda). Campfire talks optional flavor; moogle chase / Garlean spies
  Echo story beats, not targets; no caravan failure rule evidenced.
- Rewards: EXP 4720, gil 36000, marks 1000107 x3600 (central). No item.
- Markers 11018201–05; 11018206–20 filler (rejected). Sequences: 0–2,10,20–22,30.

## 110240 Thm200 — The Big Payback (Lv.20 Thaumaturge, offer Yayake 1000846, reward I'loofii 1000847)

- Route: [1] I'loofii @11024001 `020`; [2] Western Thanalan vengeance-trigger push 1000174
  @11024002 (no talk event in decomp — push opens the duty directly). No postBattleRoute:
  duty returns straight to reward seq 20.
- Battle `QuestDirectorClassThm200`, markers {11024002} (-1229.53,-310.29): wave 1: 4
  Nannygoats 2102313/1046 (public profile); wave 2: Nannygoat + Death-marked Billygoat
  2202303/3126 (Lv.15, lure when one herd goat left, DAT lure text); wave 3: Enraged
  Nannygoat 2202307/32741 (Lv.20). All kills. 600s, party 3. Boss credit grants Twisted
  Aldgoat Horn proof 11000015 once (HasItem guard; never consumed — report is dialogue).
- Reward hook `030` (I'loofii report/reward). Rewards: EXP 1760, gil 20000, THM marks
  1000110 x2000 (central), item 5020210 x1 (script).
- Markers 11024001–03; 11024004–20 filler (rejected). Sequences: 0–2,10,20.

## 110241 Thm300 — Revelry in Rivalry (Lv.30 Thaumaturge, offer+reward Yayake 1000846/1500017)

- Route: [1] rival 1000607 @11024101 `020`; [2] Baderon 1000137 @11024102 `025`;
  [3] besieged-smith trigger push 1001008 @11024103 (no talk event — push opens the rescue
  duty, the retail Duty-Calls prompt; exact recorded ground zone-128 node 821).
- Battle `QuestDirectorClassThm300`, markers {11024103} (-496.83,-384.31, Lower La Noscea
  (20,26)): Ignis Fatuus 2201603/32740 (Lv.30, model BombLesserScenarioThmLv30) + protected
  bizarre blacksmith actor 2290023 (same display). Bomb kill wins either way; scripted
  attrition (~100s window) records smith outcome → quest counter slot 2 (5 = survived).
  Bomb credit grants Writ of Access proof 11000030 once (HasItem guard; never consumed).
  600s, party 3. Stale "8 Lemming" metadata rejected.
- Post: [20] Bodenolf 1000144 @11024104/05 counterEvent (`028` survived / `027` fallen);
  [21] Bodenolf @11024106 `030` Echo gate (51030/2, result 0 holds; 030_1 variant pairing
  unresolved); [22] Yayake @11024107 `035`; [23] rival @11024108 `040`; reward hook `050`.
- Rewards: EXP 3420, gil 30000, marks 1000110 x3000 (central). No item.
- Markers 11024101–09 all live; 11024110–20 filler (rejected). Sequences: 0–3,10,20–23,30.

## 110242 Thm306 — Law and the Order (Lv.36 Thaumaturge, offer Yayake, reward I'loofii)

- Route: [1] I'loofii @11024201 `020`; [2] wreck-site rival 1000607 @11024202 `030`;
  [3] rival @11024203 `035` Echo gate (51030/2, result 0 holds; req 1). Markers 02/03 share
  the wreck home (recorded ground zone-172 node 8267). No postBattleRoute: duel returns
  straight to reward seq 20.
- Battle `QuestDirectorClassThm306`, markers {11024203}: preEvent `040` (thm30640 handoff);
  Overweening Thaumaturge 2289015/32742 (Lv.36, skill list 14; route rival 1000607 shares
  display 4000189). Nonlethal by story: yield at ≤25% HP (completion poll, kill fallback);
  rival despawned alive; successEvent `050` (thm30650 aftermath in-instance). 600s, party 3.
  Unbound Ossuary chatter (no owner). No chocobo actor at wreck site.
- Reward hook `060` (I'loofii report/reward). Rewards: EXP 4720, gil 36000, marks 1000110
  x3600 (central). No item.
- Markers 11024201/02/03/05 live; 11024204 + 11024206–20 filler (rejected).
  Sequences: 0–3,10,20.

## 110260 Cnj200 — Dendrological Duties (Lv.20 Conjurer, offer+reward Soileine 1000234/1300064)

- Offer `processEventSoileineStart`. Route: [1] Telent 1000504 @11026001 `015`.
- Battle `QuestDirectorClassCnj200`, preEvent `020`, markers {11026002} (726,-850, Central
  Shroud): 4 Rabid Coywolves 2201408/3127 (Lv.15) waves 1–4 in sequence + Alpha Coywolf
  2201409/3128 (Lv.17) wave 5. All kills. 600s, party 3. Morys post-kill appearance unbound
  (no content-owner variant; not spawned).
- Post: [20] Telent @11026003 `030`; reward hook `040` (Soileine).
- Rewards: EXP 1760, gil 20000, CNJ marks 1000111 x2000 (central), item 5030306 x1.
- Markers 11026001–04; 11026005–20 filler (rejected). Sequences: 0,1,10,20,30.

## 110261 Cnj300 — Good Knight, Sweet Dreams (Lv.30 Conjurer, offer+reward Soileine)

- Route: [1] Lifemend Morys 1000505 @11026101 `010` + afterEvent `010_2` (linkpearl
  follow-up folded in); [2] Amberscale duty-trigger push 1000174 @11026102 (no talk event).
- Battle `QuestDirectorClassCnj300`, preEvent `015_1`, markers {11026102} (-543.79,-511.35):
  six aspect elementals wave 1 — 2204601/3134 fire, 2204701/3135 ice, 2204801/3136 wind,
  2204901/3137 earth, 2205001/3138 lightning, 2205101/3139 water (all Lv.25, curated
  elemental kit, neutral resists — retail aspect strengths unrecovered); dressed with Morys
  2290023 (present, not assisting) + fallen knight 1000573. All six kills; successEvent
  `020` (cnj30020 knight aftermath). 600s, party 3. Retail branches seq 15 on journal data;
  driver plays the linear observable order (documented approximation). Humblehearth/Camp
  Emerald Moss patrol legs have no DAT markers — route goes Lifemend → Amberscale directly.
- Post: [20] Soileine @11026103 `030`; [21] Owl's Nest Yuhelmeric 1000370 @11026104 `040`;
  [22] rescued knight @11026105 `050` Echo gate (req 1); [23] forest-border Morys @11026106
  `060`; reward hook `070` (Soileine).
- Rewards: EXP 3420, gil 30000, marks 1000111 x3000 (central). No item.
- Markers 11026101–07 all live (note 11026105 display 4000470, 11026106 reuses the Arc300
  ambush X/Z); 11026108–20 filler (rejected). Sequences: 0–2,10,20–23,30.

## 110262 Cnj306 — The Call of Nature (Lv.36 Conjurer, offer+reward Soileine; custom script)

- Flow: SoileineStart → Ingram 1000372 briefing `010` + Mysterious Leather Bag 11000101
  grant-once (seq 0→5) → Amberscale Morys 1000505 escort request `020` + ask `025`
  (result 1 advances; seq 5→15) → Camp Emerald Moss Morys `030` opens escort duty (seq 15→16;
  `checkCombatInstanceEntry` gate; entry zone 152 (-1068.248,20.293,-1764.721)) → escort
  aftermath → unconscious-Morys Echo `045` gate (result 1) + `050` warp (seq 25→30) → cave-edge
  trigger push `1000174` opens Echo defense seq 31 (preEvent `060` stages interior) →
  Ingram report `080` + bag return (consumes 1 if held; seq 40→45) → Soileine `095`
  (`sqrwa` + EXP; seq 45). Unbound dialogue variants (005_2–005_12, 010_2–010_4, 030_2–030_3,
  070_2–070_10) stay unbound — no owners.
- Escort (`QuestDirectorCnj306Escort` + `SimpleContentCnj306Escort`, route
  `Data/escortnavmesh/cnj306_morys_escort.json`, 69 authored North Shroud nodes): Yarzon
  Stalker ambushes + Furline Mosstrooper group spawning together at the clearing; Morys HP-0
  or excessive distance fails (native route semantics) → seq 15 retry; success plays vanish
  aftermath `040`/cnj30640 in-duty → seq 25. 960s backstop (900s route budget). Reconnect
  re-resolves the live Player each tick; disconnect → fail path.
- Echo defense (`QuestDirectorCnj306Echo`, markers {11026206}): exactly three Hungry
  Dreadwolves 2201412/3145 (Lv.36; 2201423 same-name alternate unresolved) + staged young
  Morys 1000506 dressing (no protect-NPC failure rule in shared runtime — win = three
  kills); successEvent `070`/cnj30670. Retry seq 30, success seq 40. 600s, party 3.
- Rewards: EXP 4720, gil 36000, marks 1000111 x3600 (central). No gear/item reward.
- Markers 11026201–08 all live; 11026209–20 filler (rejected).
- Sequences: ACCEPT, 0, 5, 15, internal 16, 25, 30, internal 31, 40, 45.

## Cross-cutting verification (2026-09-27)

- `tools/validate_arc200_route.py` PASS; `validate_arc300_route.py` PASS (after scenario-path
  fallback fix — decomp outputs moved to FF14-Decomp 2026-09-26); `validate_arc306_route.py`
  PASS (same fix); `validate_lnc200/300/306_route.py` PASS x3; `validate_thm200_route.py`
  PASS; `validate_thm300_route.py` PASS (same fix); `validate_thm306_route.py` PASS (same
  fix); `validate_cnj200/300_route.py` PASS x2; `validate_cnj306_route.py` PASS;
  `tools/validate_quest_availability.py` PASS; `tools/validate_class_quest_mob_types.py` PASS.
- Chocobo grep over all 12 quest scripts + 14 directors: no actors/callbacks (notes only).
- All 25 fight mob profiles present once in `server_battlenpc_mob_types.sql` at documented
  levels (3122–3128, 3131–3140, 3145, 32740–32742, 32747–32749, public 1046 for Thm200 wave 1).
- Gil + guild-mark rows present in `gamedata_quest_rewards.sql` for all 12
  (20k/30k/36k gil; ARC 1000106 / LNC 1000107 / THM 1000110 / CNJ 1000111 x2000/3000/3600).
- SQL quest chain: 110161←110160, 110162←110161, 110181←110180, 110182←110181,
  110261←110260, 110262←110261; 110240/110241/110242 chain 0 in SQL (server does not gate
  class-quest offers on prerequisites — documented).
- Known gaps (not fixed — need live-client/retail evidence): Owl-gate/Keelty-post/trigger Y
  scaffolds; Arc306 exit transforms + Yarzon counts; spawn offsets/party caps (rank
  defaults); Thm306 yield threshold/rival skills; Cnj300 aspect resists + seq-15 branch;
  Cnj306 escort path/mob copies; after-warp lifetimes of 010/040-class events; unbound
  flavor variants listed per quest above; Lnc200 Linkpearl; Cnj200 Morys appearance.

## Video-evidence review — 2026-09-27 (archived/YouTube footage, authorized evidence)

Evidence rules (hard): footage establishes counts, sequences, mechanics, dialogue flow,
timing, and approximate blocking only. It NEVER yields exact XYZ — no video-estimated
position is presented below as recovered retail coordinates or live-confirmed floor, and
no video pixel was calibrated into world coordinates (shared map-coordinate workflow
`docs/mob_map_coordinates.md` applies; all XYZ in this pack remain DAT/recorded-ground
values, pre-existing authored estimates stay labeled estimated, and nothing was merged
into recorded-ground layers). No position was derived from any video in this pass.
Main-SQL completeness holds: this pass makes zero data changes (doc + CSV provenance
columns only), so there is nothing to carry into main SQL and no migration-only fix.

Driver/template finality (in-flight items verified landed, no pending diffs):
`startClassBattle` in `Data/scripts/quests/class_quest_template.lua` and the
`arc300.lua` / `arc306.lua` / `cnj306.lua` echo launchers propagate the
`cleanupOwnsEvent` two-value contract; `QuestDirectorClassThm200/Thm300.lua` grant the
Twisted Aldgoat Horn (11000015) / Writ of Access (11000030) once under a `HasItem`
guard. No Lua/director/SQL change was needed in this pass: all 12 fights and edge
paths were already implemented, chocobo-free, and validator-green (see below).

Sources logged (URL + coverage timestamps; accessed 2026-09-27; upload dates are the
platforms' own and are not asserted as run dates):
- S01 `https://www.youtube.com/watch?v=1FwllHbw81Q` — "FFXIV Archived 1.0: Archer"
  (00:00 Filling the Quiver, 04:23 The Foreboding Forest, 12:24 There Can Be Only One,
  18:41 Alternate dialogue).
- S02 `https://www.youtube.com/watch?v=hRTsFtZTPp8` — "FFXIV 1.0 - Filling The Quiver"
  (Arc200 individual).
- S03 `https://www.youtube.com/watch?v=_2wtLRaKOXw` — "FFXIV 1.0 - The Foreboding
  Forest" (Arc300 individual; alternates `n7RXiAOQxjk`, `YLVFruiTBoM`, `hwfwO_hh8w8`,
  1.23b compilation `gOrGAXkNS2w` noted but not separately relied on).
- S04 `https://www.youtube.com/watch?v=uBYbi8AJ5sE` — "FFXIV 1.0 - There Can Be Only
  One" (Arc306 individual, 12:39).
- S05 `https://www.youtube.com/watch?v=fzug_RoAlbA` — "FFXIV Archived 1.0:
  Thaumaturge" (00:00 The Big Payback, 06:00 Revelry in Rivalry, 12:06 Law and the
  Order, 19:42 Alternate dialogue).
- S06 `https://www.youtube.com/watch?v=n6e7hK3KmWg` — "FFXIV 1.0 - The Big Payback"
  (Thm200 individual).
- S07 `https://www.youtube.com/watch?v=GUui5bq7qOo` — "Thaumaturge R30 - FFXIV
  Revelry In Rivalry" (bomb + protect-the-smith framing) plus
  `https://www.youtube.com/watch?v=9tB7b_cl544` (Unending Journey replay) and
  `https://www.youtube.com/watch?v=40ezVUbyQZ8` (FF Archive sidequest).
- S08 `https://www.youtube.com/watch?v=mFHVGOK7Tuk` — "FFXIV 1.0 - Law And The Order"
  (Thm306 individual).
- S09 `https://www.youtube.com/watch?v=teBSI2N4ql4` — "FFXIV Archived 1.0: Lancer Job
  Quests" (00:00 A Wailing Welcome, 04:25 Culture Shock, 17:48 Necessary Evils, 26:42
  Alternate dialogue).
- S10 `https://www.youtube.com/watch?v=uE_1QjgHMLg` (Culture Shock Part 5, chocobo
  caravan of Ul'dahn tradesmen) + `https://www.youtube.com/watch?v=yaDbmuyRAMo`
  (Lancer Rank 30) + FF Archive Lancer playlist `PLsnSIkqGz_BOi4WzXIXUiEVUt2Sc4exDJ`.
- S11 `https://www.youtube.com/watch?v=uvMGGOxFm94` — "FFXIV 1.0 - Necessary Evils"
  (Lnc306 individual; alternates `ukxcmnCooIU`, `4Z5aNS2hdlI` — the latter confirms
  the 36,000 gil / 3,600-mark reward band — noted).
- S12 `https://www.youtube.com/watch?v=bNofTseBId4` — "Final Fantasy XIV 1.0 -
  Conjurer Class Quest Cutscenes" + FF Archive Conjurer playlist
  `PLsnSIkqGz_BNCq_bASpHGlqXExG5A7SUs` (Dendrological Duties / Good Knight, Sweet
  Dreams / The Call of Nature entries).
- S13 `https://www.youtube.com/watch?v=Qb01veh35i8` (Good Knight, Sweet Dreams R30)
  + `https://www.youtube.com/watch?v=KDkdL7XCBPg` (Part 1) +
  `https://www.youtube.com/watch?v=GuRCH9Zw3VQ` (Part 2).
- S14 `https://www.youtube.com/watch?v=nVO3Uw9XwqQ` — "FFXIV - Conjurer Quests - The
  Call of Nature" (Unending Journey replay).
- T01 (period text, corroborating only — not footage):
  `https://www.groverwhim.com/2011/07/call-of-nature-contains-spoilers.html`
  (2011-07-19: escort-fail-at-25%-HP claim; "four wolves" Echo recollection).
- W01–W04 (walkthrough cross-checks, already-cited archive family, re-read
  2026-09-27): `https://ffxiv.gamerescape.com/wiki/The_Big_Payback`,
  `https://ffxiv.gamerescape.com/wiki/Good_Knight,_Sweet_Dreams`,
  `https://ffxiv.gamerescape.com/wiki/The_Call_of_Nature`,
  `https://ffxiv.gamerescape.com/wiki/Dendrological_Duties`.

What footage supports (all already implemented — confirmation only, no code change):
- Arc200 (S01/S02): five Yarzon Invaders in one wave with the Ixal fleeing (confirms
  the 2/2/1 three-variant composition); Nonolato → Keelty → fence → duty → Nonolato
  order.
- Arc300 (S01/S03): Nonolato → Keelty Hold briefing → Owl's Nest gate → Vairemont
  delivery → Keelty ×2 → road ambush versus exactly the Bandit Pathfinder + Bandit
  Scout pair → Keelty Yes-gated report → Nonolato reward (confirms the custom-script
  flow; the 30-minute cap is not visible and stays a documented reconstruction).
- Arc306 (S01/S04): optional informant hints → Sorrel Haven find → Yarzon escape →
  return cutscene → Siward duel with Siward as the sole required kill and nearby
  Yarzons optional → Hold aftermath → Keelty confession → Nonolato reward (confirms
  the two-battle contract and the never-spawned battle-ally handling).
- Lnc200 (S09): Willelda → J'moldva → four Orchard Chigoes → J'moldva aftermath →
  Willelda payment (confirms single-wave cull).
- Lnc300 (S09/S10): J'moldva briefing → Gagaruna canvass → Dreues scene-only test →
  J'moldva caravan order → rendezvous defense in two waves (five Woodsent Pterocs,
  then two Woodsent Does) → broker aftermath → J'moldva report → Willelda reward.
  Visible caravan chocobos are set dressing only — no chocobo actor or callback is
  spawned (notes-only), and no escort-AI / caravan-failure rule is evidenced.
- Lnc306 (S09/S11): Willelda oath → J'moldva briefing → trigger → single Woodsent
  Elemental → campfire aftermath → broker Echo gate → J'moldva report → Willelda
  reward (confirms; moogle-chase / Garlean-spy beats are story, not targets).
- Thm200 (S05/S06 + W01): Yayake → I'loofii → Western Thanalan trigger → herd duty
  (five Nannygoats with the Death-marked Billygoat lured when one herd goat is left,
  Horn proof, then the Enraged Nannygoat) → I'loofii report (confirms the three-wave
  structure; the 4+1 wave split stays the documented technical workaround and the
  trigger Y stays a scaffold).
- Thm300 (S05/S07): Yayake → rival → Baderon → smith trigger → single Ignis Fatuus
  versus the protected bizarre blacksmith (bomb kill wins either way; smith outcome
  selects the 027/028 Bodenolf report) → Echo → Yayake → rival → Yayake reward
  (confirms; scripted attrition rate stays authored).
- Thm306 (S05/S08): Yayake → I'loofii → wreck-site rival talk → Echo → nonlethal
  duel with yield (confirms the yield mechanic; the exact 25% HP threshold stays
  authored — an HP-bar pixel reading is approximate, never an exact retail number —
  and rival skills stay unrecovered).
- Cnj200 (S12 + W04): Soileine → Telent → four Rabid Coywolves in sequence + Alpha
  Coywolf → Telent report → Soileine reward, with the journal/walkthrough Morys
  post-kill appearance beat confirmed as story (see still-HOLD below).
- Cnj300 (S12/S13 + W02): Soileine → Lifemend Morys (+ linkpearl follow-up) →
  Amberscale duty with all six aspect elementals as a single group, Morys present
  but not assisting, knight aftermath → Soileine → Owl's Nest Yuhelmeric →
  rescued-knight Echo gate → forest-border Morys → Soileine reward. The walkthrough
  patrol legs (Humblehearth / Camp Emerald Moss) have no DAT markers, so the direct
  Lifemend → Amberscale route stands; Linkpearl duty-exit lines are presentation
  (standard content return is the reconstruction).
- Cnj306 (S12/S14 + W03): Soileine → Ingram briefing + bag → Amberscale escort
  request → Camp Emerald Moss escort (Yarzon Stalker ambushes plus the Furline
  Mosstrooper group spawning together at the clearing; HP-0/distance fail per the
  walkthrough) → Echo gate → cave-edge defense versus exactly three Hungry
  Dreadwolves with young Morys dressing → Ingram report + bag return → Soileine
  reward (confirms; T01's "four wolves" is a conflicting single-observer
  recollection against the walkthrough's explicit three — the three-wolf
  implementation stands).

Still HOLD (with reason — none blocks the current enabled/disabled split):
- Owl-gate / Keelty-post / trigger Y scaffolds: Y is XYZ; footage never yields exact
  XYZ → scaffolds stay.
- Arc306 exit transforms + Yarzon counts: transforms are XYZ → stay; counts stay
  authored (footage blocking is approximate; route validators pin the 4-escape /
  3-duel split).
- Spawn offsets / party caps: offsets are XYZ → stay; caps are rank defaults —
  footage party size never proves a cap → stay.
- Thm306 25% yield threshold + rival skills: threshold exactness needs client data;
  skills unrecovered → stay authored.
- Cnj300 aspect resists + seq-15 branch: resists need damage-table recovery;
  footage damage numbers are approximate; the journal-data branch mapping is
  unresolved → the neutral-resist linear-order approximation stays, documented.
- Cnj306 escort path / mob copies / levels / young-Morys casting: path is XYZ →
  stays authored (69-node North Shroud route, provenance-labeled); copies/levels stay
  validator-pinned reconstructions.
- Cnj306 escort fail-threshold conflict: T01 claims fail at Morys ≤25% HP while W03
  says HP 0. Single 2011-07 observer recollection versus walkthrough + native route
  semantics — unresolvable without client data → HP-0 + distance implementation
  retained, conflict documented here.
- After-warp lifetimes (010/040-class events): engine lifecycle; footage shows fades,
  not server event ownership → stay as documented (preEvent vs talk-callback split).
- Unbound flavor variants (Arc 005_8/010_2/040_2–8, Lnc none beyond Linkpearl,
  Cnj306 005_2–005_12/010_2–010_4/030_2–030_3/070_2–070_10, etc.): no footage segment
  binds them to owners; story rides in the bound events → stay unbound.
- Lnc200 Linkpearl: dialogue mention ≠ item-transaction ownership; no grant
  event/owner recovered → stays unbound (Thm200's Yayake-linkpearl line is the same
  category and likewise unspawned).
- Cnj200 Morys appearance: beat confirmed by journal/W04/S12, but no content-owner
  variant is recovered — spawning the route actor inside the duty would invent
  ownership (Cnj300's present-but-not-assisting Morys has an explicit content
  variant 2290033; Cnj200 has none) → stays unspawned HOLD.
- Enablement unchanged: Arc 110160–110162 stay enabled; Lnc/Thm/Cnj stay disabled.
  Per the task gate (every gap closed AND route validator green AND
  `EXPECTED_ENABLED` + availability annotation updated together), footage confirms
  but does not close the XYZ/numeric/ownership gaps above, so no quest changes
  enablement in this pass.

Machine outputs: `outputs/class-quest-ranged-decomp-20260927/*.csv` gained two
appended provenance columns (`video_source_url`, `video_evidence_note`) per row;
all pre-existing columns/rows are byte-identical in content (no evidence rewritten).
