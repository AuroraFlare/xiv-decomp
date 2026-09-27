# Lnc300 Culture Shock — implementation notes

Implemented: 2026-09-26. Lancer 30 class quest. Supersedes the HOLD
assessment in `lnc300_lnc306_HOLD_2026-09-26.md` for Lnc300.

## Retail route (evidenced)

- Offer/briefing: J'moldva (actor 1000599) in the Wailing Barracks
  (`processEventJMoldvaStart`, scene `lnc30010`). The client function
  list has no `WilleldaStart` scene for lnc300; the Yes/No accept ask
  (DAT rows 87-89, decline row 9 in J'moldva's voice) lives inside her
  briefing, so the server offers at J'moldva. Willelda's DAT row-2
  redirect has no quest scene function and stays unbound. Public spawn
  row exists (zone 206, 195.04 / 27.9 / -1591.1).
- Canvass: Gagaruna (actor 1000862, `processEvent020`, scene
  `lnc30020`, DAT marker 11018101). Public spawn row exists (zone 175,
  -184.94 / 190.55 / 108.87), matching the marker X/Z.
- Test: Dreues (actor 1000402, `processEvent030`, scene `lnc30030`,
  DAT marker 11018107). The confrontation is scene-only: the
  walkthrough lists no Dreues kill step and DAT rows 48-51 resolve the
  test without a counterattack. His 100,000-gil ask (DAT rows 90-92)
  is not a gate: both answers converge on his alliance (DAT rows
  46-52). Added spawn id 3293 (zone 175).
- Report: J'moldva (`processEvent040`, scene `lnc30040`, DAT marker
  11018102). No ask gate.
- Rendezvous: south-road caravan site (DAT marker 11018103, zone 150).
  Added proximity trigger id 3294 reusing the generic destination
  actor class 1000174 (display 4000257), following the PGL306/ARC200
  precedent. Retail fires on approach ("until duty calls"); the server
  fires on proximity push and plays `processEvent050` (scene
  `lnc30050`).
- Duty: caravan defense at marker 11018103. The 1.0 walkthrough
  requires 5 Woodsent Pteroc kills, then — after a cutscene beat — 2
  Woodsent Doe kills. Actor classes 2200108/2200304 are name-verified
  as "woodsent pteroc" / "woodsent doe" in DAT display text
  (3200108/3200304). The Garlean flyover (`processEvent060`, scene
  `lnc30060`) plays as the battle preEvent and is presentation-only
  (Gla306 lead-in precedent). The merchants, cargo, and injured moogle
  are story actors, not targets: the central quest row lists no party
  limit, kill condition, or failure condition, and the walkthrough
  lists none. No escort follower AI or protected-actor failure rule is
  evidenced, so none is implemented.
- Aftermath: Brazen-faced Broker (actor 1000403, display 4000135,
  `processEvent065` + `processEvent068`, DAT marker 11018104). Added
  spawn id 3295 (zone 206). The 065 scene owns the after-warp fade;
  the merchant thanks (068) chains in the same interaction (Gla300
  040->050 precedent).
- Report/reward: J'moldva (`processEvent070`, DAT marker 11018105),
  then Willelda (final hook `processEvent075`, DAT marker 11018106).
  Central rows grant 30,000 gil + 3,000 Lancer marks; the script
  grants 3,420 EXP (post-1.20 level-30 maximum, Gla300 precedent).
  Fandom lists no item reward and DAT `quest_reward.csv` has no rows
  for 110181, so the script grants no item.

## Map evidence

- Marker 11018103 (379.7 / -14.3) converts under the zone-150 native
  page-2000 transform to square (34,37) — exactly the wiki's "spot
  (34,37) between Camp Bentbranch and Camp Tranquil". Rendered preview
  `C:/tmp/lnc300-caravan.png` shows the marker on the south road.
- Marker 11018104 (187.48 / -1583.96) converts under the zone-206
  page-2800 transform to square (7,2) — exactly Fandom's "Wailing
  Barracks (7,2)".

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Lnc300` row with
  `offer = true`, route [1] (Gagaruna) / [2] (Dreues) / [3] (J'moldva)
  / [4] (caravan push), battle (5+2 across two waves, `preEvent =
  "processEvent060"`), postBattleRoute [20] (broker 065+068) / [21]
  (J'moldva 070).
- `Data/scripts/directors/Quest/QuestDirectorClassLnc300.lua`: wave 1
  of 5 Woodsent Pterocs (2200108/3131), wave 2 of 2 Woodsent Does
  (2200304/3132), `requireAllTargets`, party cap 3, 600s timeout.
  Later waves spawn through the verified `gc_sqb_runtime` wave
  support (Cnj200 precedent).
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3131/3132. Actor
  classes are DAT-backed; stat shapes cloned from `saltspray_pteroc`
  (1129) and `migrating_doe` (1382) with the curated Pteroc skill
  list 5047 and Antelope skill list 5003. All tuning beyond the DAT
  identity is reconstruction policy. Private encounter summons only.
- `Data/sql/server_eventnpc_spawn_locations.sql` + migration
  `Data/sql/live migrations/lnc300_lnc306_route.sql`: Dreues (3293),
  caravan trigger (3294), broker (3295).
- `tools/validate_lnc300_route.py`: static route/fight contract check,
  including a no-chocobo-actor guard.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110181 added to `IMPLEMENTED_CLASS_IDS`;
  the Lnc300 entry removed from `tools/validate_class_held_routes.py`.

## Documented defaults (not retail claims)

- Level 30 for both waves follows the quest-level default (Gla300
  precedent); two waves preserve the walkthrough order; party cap 3
  follows the PGL/GLA class-quest precedent (retail documents no
  limit).
- Spawn offsets are adapter formation offsets, not the duty layout.
- The wiki's mid-duty cutscene beat is preserved as the wave-one to
  wave-two transition; no mid-battle scene is invented (the runtime
  has no between-wave scene hook) and the flyover stays at duty entry
  per the journal order.
- Dreues Y=190.55 follows Gagaruna's catalog floor (14.8 yalms away);
  rotation is a scaffold: correct both after a live map capture.
- Trigger Y=6.188 is premerge node 7514 (2.08 yalms from the marker;
  `Data/quicknavmesh-evidence/premerge-20260909/zone_150.tsv`, sha256
  `a5cbaac491a293c0d4b3bd85f4ccddee564b36d6d1c81d262b7537b74cc3e871`),
  used because the live recording has no node within 30 yalms.
- Broker Y=27.5 follows the adjacent catalog floor (Dhemdaeg 7.2
  yalms away); rotation is a scaffold.
- `processEvent020/050/065/070` own after-warp fades and play as
  normal talk callbacks here; retail stages the Mirage negotiation
  and the Barracks aftermath in instances, which the class driver
  cannot stage — positions are DAT-exact, instancing is not.
- Chocobos are DAT dialogue only (lnc300 row 64: resting caravan
  chocobos). No chocobo actor, spawn, or profile is added anywhere
  in this quest.

## Sources

- DAT: `docs/Dat Mining/lnc300.csv` (164 text rows),
  `quest_marker.csv` rows 11018101-11018107 (+11018108-11018120
  confirmed filler), `xtx_displayName.csv` 3200108/3200304/1400019/
  2200071/4000135, `quest.csv` row 110181 (no limits/conditions).
- Walkthroughs: Gamer Escape `Culture_Shock` (route, (34,37), 5
  pterocs + 2 does, broker/J'moldva instance talks) and Final Fantasy
  Wiki `Lancer_Quests_(version_1.0)` (journal states, 3,420 EXP, no
  item, Wailing Barracks (7,2)). eLeMeN archives and the classic
  Fragmenterworks wiki were unreachable (403/connection refused).
- Video (manual-review corroboration; page fetches return only the
  player shell, so counts come from the walkthroughs above):
  YouTube `sa2Xrr3KMfo` ("Culture Shock" Part 7).

## Verification

- `python -B tools/validate_lnc300_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- `python -B tools/validate_class_quest_mob_types.py` → PASS
- `python -B tools/validate_class_held_routes.py` → Lnc300 clean
  (remaining Cnj306/Thm306 failures are pre-existing/concurrent work,
  untouched by this change)
