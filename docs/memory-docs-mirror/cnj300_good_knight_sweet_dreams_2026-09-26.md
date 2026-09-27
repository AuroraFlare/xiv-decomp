# Cnj300 Good Knight, Sweet Dreams — implementation notes

Implemented: 2026-09-26. Conjurer 30 class quest. Supersedes the HOLD
assessment in `cnj300_cnj306_HOLD_2026-09-26.md` for Cnj300.

## Retail route (evidenced)

- Offer: Soileine (actor 1000234, display 1300064) in Stillglade Fane
  (`processEventSoileineStart`). Public spawn row exists (zone 206).
- Briefing: Morys (actor 1000505, display 1000175 "Morys") at
  Lifemend Stump (`processEvent010`, scene `cnj30010`, DAT marker
  11026101). All three Morys actors (1000505/1000506/2290033) share
  the display name; 1000505 is the public variant (see the CNJ
  overview doc). Added spawn id 3298 (zone 150). Soileine's
  linkpearl reply (`processEvent010_2`, plain talk lines) chains in
  the same interaction because the driver has no linkpearl-from-menu
  step (Arc200 afterEvents precedent).
- Duty trigger: Amberscale Rock (DAT marker 11026102, zone 150).
  Added proximity trigger id 3299 reusing the generic destination
  actor class 1000174 (display 4000257), following the PGL306/ARC200
  precedent. Retail fires on approach ("you will be prompted");
  the server fires on proximity push with no event — Morys's
  pre-battle briefing (`processEvent015_1`: "See the elementals.
  Their natures. Their aspects. Magic will serve you. ... It is up
  to you now.") runs as the battle preEvent with him present in the
  duty (Gla306 entry-scene precedent).
- Duty: six Elementals, one of each aspect, fought as a single
  group. The 1.0 walkthrough is explicit about the composition and
  that Morys is present but does not assist. Actor classes are DAT
  display-name verified: 2204601 fire, 2204701 ice, 2204801 wind,
  2204901 earth, 2205001 lightning, 2205101 water (display
  3204601/3204701/3204801/3204901/3205001/3205101). Morys (content
  variant 2290033) and the fallen knight (1000573) stage as
  non-combat duty actors; the fallen-knight aftermath
  (`processEvent020`, scene `cnj30020`) runs as the battle success
  scene (GC successEvent precedent). A prior HOLD note rejected the
  elemental families as "not Cnj300 evidence"; the walkthrough's
  one-of-each-aspect composition plus the display-name verification
  is the evidence that promotes them to a documented reconstruction
  (retail per-aspect behavior stays unrecovered and is not
  enforced). The Humblehearth/Camp Emerald Moss patrol legs have no
  DAT markers and are journal-only.
- Return: Soileine (`processEvent030`, scene `cnj30030`, marker
  11026103). Retail branches sequence 15 on journal data; the
  driver plays the same observable order linearly (duty aftermath
  first, then this return), which is the documented approximation.
- Investigation: Yuhelmeric (actor 1000370, display 1200022, name-
  verified) at Owl's Nest (`processEvent040`, scene `cnj30040`,
  marker 11026104). Reuses his GC spawn id 3235 (zone 145). The
  Plot Details transcript confirms the direct dialogue (seven
  Yuhelmeric lines ending in leave to question the knight), so
  the hamlet-edge arrival beat folds into his talk step; the
  journal marker still guides the player to the hamlet. No Morys
  spawn is needed here: Soileine's later line ("Brother Morys
  was not to be found at Owl's Nest") confirms he left before
  the player arrives.
- Echo: Newly Outfitted Knight (actor 1000573, display 4000470,
  name-verified, `processEvent050` + ask 51030 gated on result 1,
  scene `cnj30050`, marker 11026105). Added spawn id 3300 (zone
  145). Declining the Echo keeps the step open for retry, exactly
  like the client gate.
- Report: forest-border Morys (actor 1000505, `processEvent060`,
  scene `cnj30060`, marker 11026106). Added spawn id 3301 (zone
  152), at the wood's-edge path end.
- Reward: Soileine (final hook `processEvent070`, scene `cnj30070`,
  marker 11026107). Central rows grant 30,000 gil + 3,000 Conjurer
  marks; the script grants 3,420 EXP (post-1.20 level-30 maximum,
  Gla300 precedent). No item reward is evidenced, so the script
  grants no item.

## Map evidence

- Marker 11026101 (-792 / -1070) converts under the zone-150 native
  page-2000 transform to square (23,27) — exactly the wiki's
  "Lifemend Stump (23,27)". Rendered preview
  `.tmp/cnj-lifemend-map.png` shows dense nav coverage at the stump.
- Marker 11026102 (-543.79 / -511.35) converts to square (25,32) —
  exactly the wiki's "Amberscale Rock (25,32)". Rendered preview
  `.tmp/cnj-amberscale-map.png` shows the marker on the Rock's path
  corridor; no recording covers that corridor (nearest node 245
  yalms away).
- Marker 11026104 (2454 / 1209) converts under the zone-145 native
  page-3200 transform to square (61,33), at the hamlet's northwest
  edge; the knight marker 11026105 converts to (62,34), inside the
  recorded hamlet. No grid square is published for this leg, so
  both squares are DAT-marker derivations, not wiki quotes.
  Rendered preview `.tmp/cnj-owlsnest-map.png` shows cyan trail
  plus NPC dots there.
- Marker 11026106 (-1602.12 / -1854.22) converts under the zone-152
  native page-2200 transform to square (15,19), at the end of the
  west path corridor. Rendered preview
  `.tmp/cnj-forestborder-map.png` shows the marker just past the
  recorded corridor island.

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Cnj300` row with
  `offer = true`, route [1] (Lifemend Morys 010 + 010_2) / [2]
  (Amberscale push, no event), battle (six elementals wave 1,
  `preEvent = "processEvent015_1"`, Morys + knight duty actors,
  `requireAllTargets`), postBattleRoute [20] (Soileine 030) / [21]
  (Yuhelmeric 040) / [22] (knight 050 + Echo gate) / [23]
  (forest-border Morys 060).
- `Data/scripts/directors/Quest/QuestDirectorClassCnj300.lua`: six
  wave-1 elementals (2204601/3134 … 2205101/3139),
  `requireAllTargets`, party cap 3, 600s timeout, success scene
  `processEvent020`/`cnj30020`.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3134-3139. Stat
  shape cloned from the open-world earth elemental (39402) with the
  curated Elemental skill list 5021 and neutral resists. All tuning
  beyond the DAT identity is reconstruction policy. Private
  encounter summons only.
- `Data/sql/server_eventnpc_spawn_locations.sql` + migration
  `Data/sql/live migrations/cnj300_route.sql`: Lifemend Morys
  (3298), Amberscale trigger (3299), knight (3300), forest-border
  Morys (3301); migration mirrors the six mob profiles too.
- `tools/validate_cnj300_route.py`: static route/fight contract
  check, including a no-chocobo guard.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110261 added to `IMPLEMENTED_CLASS_IDS`;
  the Cnj300 entry removed from `tools/validate_class_held_routes.py`.

## Documented defaults (not retail claims)

- Level 25 for all six elementals follows the rank-30 duty
  precedent (Pgl300 Kraken Deckhand); single group follows the
  walkthrough; party cap 3 follows the PGL/GLA class-quest
  precedent (retail documents no limit).
- Spawn offsets are adapter formation offsets, not the duty layout.
- Aspect strengths/weaknesses are NOT implemented: resists stay
  neutral per the open-world elemental rows because retail behavior
  is unrecovered. Checked specifically: the eLeMeN Elemental
  family entry has empty weaknesses/resistances, the Gamer Escape
  Fire Elemental page is an extinct stub with no stats, and no
  DAT monster-resistance table is known. Morys's "use appropriate
  magic" line remains flavor.
- Lifemend Morys XYZ is live node 3040 (4.1 yalms from the marker;
  `Data/quicknavmesh/zone_150.tsv`). Knight XYZ is live node 3148
  (7.3 yalms; `Data/quicknavmesh/zone_145.tsv`).
- Amberscale trigger Y=5.0 is ESTIMATED from the surrounding basin
  (fireflies 4.5-5.2, hearth 6.1, recorded nodes 3.5-4.0): no
  recording covers the (25,32) corridor. Correct after a live map
  capture.
- Forest-border Morys Y=32.6 is ESTIMATED from corridor node 2567
  (63.5 yalms away; `Data/quicknavmesh/zone_152.tsv`, used because
  the marker sits at the corridor's unrecorded end). Correct after
  a live map capture. Rotations are scaffolds.
- `processEvent020/040` own after-warp fades and play as normal
  callbacks here; the event lifetime across the warp still needs
  live verification.
- No chocobo content exists anywhere in the CNJ line. No chocobo
  actor, spawn, or profile is added.

## Sources

- DAT: `docs/Dat Mining/cnj300.csv` (129 text rows),
  `quest_marker.csv` rows 11026101-11026107 (+11026108-11026120
  confirmed filler), `xtx_displayName.csv` 1000175/1200022/4000257/
  4000470/3204601/3204701/3204801/3204901/3205001/3205101,
  `quest.csv` row 110261 (no limits/conditions), client scenario
  decomp `tools/outputs/lpb/decomp_more_20260617/lua/quest/
  scenario/cnj/cnj300.lua`.
- Walkthroughs: Gamer Escape `Good_Knight_Sweet_Dreams` (route,
  Lifemend (23,27), Amberscale (25,32), six elementals single
  group, Morys non-assist, knight, Owl's Nest leg, Echo) and
  Final Fantasy Wiki `Conjurer_Quests_(version_1.0)` (journal
  states, 3,420 EXP, no item).
- Video: YouTube `Fl5tkBuF9Yc` ("Final Fantasy XIV v1.23b:
  Conjurer/White Mage Story", Good Knight Sweet Dreams at 3:10;
  page fetches return only the player shell, so composition comes
  from the walkthrough above).

## Verification

- `python -B tools/validate_cnj300_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- `python -B tools/validate_class_quest_mob_types.py` → PASS
- `python -B tools/validate_class_held_routes.py` → PASS
