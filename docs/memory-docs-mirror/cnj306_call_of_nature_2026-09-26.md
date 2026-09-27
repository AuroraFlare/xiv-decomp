# Cnj306 The Call of Nature — implementation notes

Implemented: 2026-09-26. Conjurer 36 class quest. Supersedes the HOLD
assessment in `cnj300_cnj306_HOLD_2026-09-26.md` for Cnj306. The
generic class driver has no escort state and no second battle node,
so the live quest is a custom script; the template `Cnj306` row stays
dormant as the decomp record.

## Retail route (evidenced)

- Offer: Soileine (actor 1000234) in Stillglade Fane
  (`processEventSoileineStart`). Public spawn row exists.
- Briefing: Ingram (actor 1000372, display 1000141 "Ingram",
  name-verified, `processEvent010`, scene `cnj30610`, DAT marker
  11026201). Grants the Mysterious Leather Bag (item 11000101,
  `gamedata_items` row exists). Added public spawn id 3302 (zone
  206); retail stages this in an instance, the driver plays it
  public (Lnc300 Barracks precedent).
- Request: Morys (actor 1000505) at Amberscale Rock
  (`processEvent020`, scene `cnj30620`, then `processEvent025` ask
  50 gated on result 1, DAT marker 11026202). Added spawn id 3303
  (zone 150).
- Escort duty: Camp Emerald Moss (DAT marker 11026203, zone 152).
  Morys talk (`processEvent030`, scene `cnj30630`) launches a
  private North Shroud copy running escort route
  `cnj306_morys_escort`: Yarzon Stalker ambushes along the path, a
  Furline Mosstrooper group spawning together at the clearing,
  Morys-at-HP-0 fails, excessive owner distance fails, and
  reaching the clearing plus defeating the Furline group wins.
  Yarzon Stalker (2205506/3205506), Furline Mosstrooper
  (2280158-2280163/3280157-3280162), and Hungry Dreadwolf
  (2201412/2201423, both display "hungry dreadwolf") are DAT
  display-name verified. Completion plays the Morys-vanish
  aftermath (`processEvent040`, scene `cnj30640`) in the duty
  (Man0l101 completion-cutscene pattern), then returns the player
  to the camp. Failure or abandonment returns to the launch step.
- Echo: unconscious Morys (actor 1000505, `processEvent045` ask
  51030 gated on result 1, then `processEvent050`, scene
  `cnj30650`, DAT markers 11026204/11026205). Added spawn id 3305
  (zone 150). The three pre-Echo elementals stay scene dressing:
  no safe public spawn for them is evidenced.
- Cave duty: cave edge (DAT marker 11026206, zone 150). Added
  proximity trigger id 3306 reusing generic actor 1000174. The
  cave-arrival scene (`processEvent060`, scene `cnj30660`) runs as
  the duty preEvent; the duty defends young Morys (actor 1000506,
  the distinct Morys appearance, staged as dressing) against
  exactly three Hungry Dreadwolves (2201412 — the GC-side quest
  uses this same actor; 2201423 stays the unresolved same-name
  alternate). The shared battle runtime has no protect-the-NPC
  failure rule, so the win condition is the three kills and the
  post-fight aftermath (`processEvent070`, scene `cnj30670`) runs
  as the battle success scene. Retry returns to the cave step.
- Report: Ingram (`processEvent080`, scene `cnj30680`, marker
  11026207), returning the bag. Reuses spawn 3302.
- Reward: Soileine (final hook `processEvent095`, scene `cnj30690`,
  marker 11026208; the `processEvent090` after-warp variant is not
  staged). Central rows grant 36,000 gil + 3,600 Conjurer marks;
  the script grants 4,720 EXP (1.0 walkthrough value, Pgl306 peer
  precedent). No item reward is evidenced, so the script grants no
  item.

## Map evidence

- Marker 11026201/11026207 (-346 / -1705) converts under the
  zone-206 native page-2800 transform to square (2,1) — exactly
  the wiki's "Conjurer's Guild (2,1)".
- Marker 11026203 (-1067 / -1765) converts under the zone-152
  native page-2200 transform to square (20,20), at Camp Emerald
  Moss. Rendered preview `.tmp/cnj-emerald-map.png` shows dense
  nav plus the NPC cluster there. The escort route runs 342.7
  yalms west from camp node 6241 to frontier node 3612 along 69
  recorded nodes; no recorded edge continues to the border, so
  the endpoint is the farthest nav-connected ground toward it.
- Markers 11026202/11026204 (Amberscale) and 11026205/11026206
  (25,33) sit in the unrecorded corridor shown in
  `.tmp/cnj-amberscale-map.png` (nearest node 245+ yalms away).

## Server mapping

- `Data/scripts/quests/cnj/cnj306.lua`: custom quest (retail
  sequences 0/5/15/25/30/40/45 plus internal duty states 16/31),
  ask gates, bag grant/return with ownership guards, escort launch
  (private zone-152 copy), Echo-dive launch, marker lists, and the
  4,720-EXP reward.
- `Data/escortnavmesh/cnj306_morys_escort.json`: the escort route
  (Morys 2290033 ally level 36, 2+2 Yarzon stops, 4-Furline
  clearing, HP-ratio 0.02, owner fail 60 yalms/10s, leash 32,
  final-clear completion, both callbacks disabled).
- `Data/scripts/directors/Quest/QuestDirectorCnj306Escort.lua`:
  route runner with the Man0l101 landing/timeout/fail structure;
  completion plays 040 then sequences to the Echo step.
- `Data/scripts/directors/Quest/QuestDirectorCnj306Echo.lua`:
  three wave-1 Dreadwolves, `requireAllTargets`, party cap 3,
  600s timeout, success scene `processEvent070`/`cnj30670`.
- `Data/scripts/content/SimpleContentCnj306Escort.lua`: private
  area (route-covering boundary, Gridania-region escort music
  52/21 per the Souls Gone Wild precedent, abandonment back to
  the launch step).
- `Data/scripts/quests/class_quest_template.lua`: `Cnj306` row
  stays dormant (`noOffer`, documented decomp blocks kept) with
  its comment/todo repointed at the custom script.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3140 (Yarzon
  Stalker, Yarzon list 5063), 3141-3144 (four Mosstrooper
  variants, quest-humanoid list 15), 3145 (Hungry Dreadwolf,
  canine list 5062). Stat shapes cloned from the curated family
  profiles. All tuning beyond the DAT identity is reconstruction
  policy. Private encounter summons only.
- `Data/sql/server_eventnpc_spawn_locations.sql` + migration
  `Data/sql/live migrations/cnj306_route.sql`: Ingram (3302),
  Amberscale Morys (3303), Emerald Moss Morys (3304),
  unconscious Morys (3305), cave trigger (3306); migration
  mirrors the six mob profiles too.
- `tools/validate_cnj306_route.py`: static route/duty contract
  check (parsed route JSON, both directors, quest script,
  dormant-row guard, no-chocobo guards).
- `tools/validate_class_quest_mob_types.py`: extended with the
  bespoke Cnj306 pairs (Echo battle + escort route mobs).
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110262 added to `IMPLEMENTED_CLASS_IDS`;
  the Cnj306 entry removed from `tools/validate_class_held_routes.py`.

## Documented defaults (not retail claims)

- Escort path/endpoint: nav-authored from recorded nodes (provenance
  embedded in the route JSON with the zone_152.tsv hash), NOT a live
  escortb capture and NOT a retail-path claim. Mob copies (2+2
  Yarzon, 4 Furline), level 36 (Gla306 at-level precedent), Morys
  ally level 36, HP-ratio 0.02 (near-death; exact-0 is
  unrepresentable), owner fail 60 yalms/10s, leash 32, speed 4.0,
  and the 900s budget are reconstruction policy.
- Dreadwolf actor 2201412 over same-name 2201423 follows the
  GC-side quest precedent. Level 36 follows the rank-36 duty
  precedent.
- Young Morys (1000506) in the Echo cave is a casting hypothesis
  from the distinct appearance row; retail never names the actor.
- The Echo defense does not fail if Morys is attacked: the shared
  runtime cannot express protect-the-NPC, so the three kills are
  the win condition and "defend Morys" is carried by the scene
  plus his ally presence.
- Ingram Y=6.82 follows zerig's adjacent catalog floor (4.2 yalms
  away). Emerald Moss Morys XYZ is live node 6241 (1.3 yalms from
  the marker; `Data/quicknavmesh/zone_152.tsv`); it stands ~1 yalm
  from the Arc200 fence trigger, which is a different actor for a
  different quest and does not conflict.
- Amberscale-area Y=5.0 (three spawns) is ESTIMATED from the
  surrounding basin, as in Cnj300. Correct after a live map
  capture. Rotations are scaffolds.
- `processEvent040/050/060/070` own after-warp fades and play as
  normal callbacks here; event lifetimes across the warps still
  need live verification. The retail Ingram instance legs play
  public.
- No chocobo callbacks (`canCallBackChocobo: false`,
  machine-checked) and no chocobo actor, spawn, or profile
  anywhere in this quest.

## Sources

- DAT: `docs/Dat Mining/cnj306.csv` (105 text rows),
  `quest_marker.csv` rows 11026201-11026208 (+11026209-11026220
  confirmed filler), `xtx_displayName.csv` 1000141/1000175/
  3205506/3280157-3280162/3201411/3201422/3205201,
  `quest.csv` row 110262 (no limits/conditions), client scenario
  decomp `tools/outputs/lpb/decomp_more_20260617/lua/quest/
  scenario/cnj/cnj306.lua`, item 11000101 in `gamedata_items`.
- Walkthroughs: Gamer Escape `The_Call_of_Nature` (route, Ingram
  instance, escort rules, Yarzon/Mosstrooper beats, three
  Dreadwolves, bag) and Final Fantasy Wiki
  `Conjurer_Quests_(version_1.0)` (journal states, 4,720 EXP, no
  item).
- Video: YouTube `Fl5tkBuF9Yc` ("Final Fantasy XIV v1.23b:
  Conjurer/White Mage Story", The Call of Nature at 17:55; page
  fetches return only the player shell, so beats come from the
  walkthrough above).

## Verification

- `python -B tools/validate_cnj306_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- `python -B tools/validate_class_quest_mob_types.py` → PASS
- `python -B tools/validate_class_held_routes.py` → PASS
