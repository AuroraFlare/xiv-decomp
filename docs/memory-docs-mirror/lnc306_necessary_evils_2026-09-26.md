# Lnc306 Necessary Evils — implementation notes

Implemented: 2026-09-26. Lancer 36 class quest. Supersedes the HOLD
assessment in `lnc300_lnc306_HOLD_2026-09-26.md` for Lnc306.

## Retail route (evidenced)

- Offer: Willelda (actor 1000242) in the Wailing Barracks
  (`processEventWilleldaStart`, including the give-your-life oath ask,
  DAT rows 68-72). Public spawn row exists (zone 206, 179.15 / 27.5 /
  -1580.59).
- Briefing: J'moldva (actor 1000599), `processEvent010`, scene
  `lnc30610`, DAT marker 11018201. Both briefing choices advance: the
  good/bad-news choice takes either answer and Q2's No has no quest
  effect per the walkthrough, so the step carries no result gate.
  Public spawn row exists (zone 206, 195.04 / 27.9 / -1591.1).
- Duty trigger: south-road caravan site (DAT marker 11018202, zone
  150). Added proximity trigger id 3296 reusing the generic
  destination actor class 1000174 (display 4000257), following the
  PGL306/ARC200 precedent. Retail fires on approach ("go south until
  duty calls"); the server fires on proximity push and plays
  `processEvent020` (scene `lnc30620`).
- Duty: caravan defense at marker 11018202. The 1.0 walkthrough
  requires killing 1 Woodsent Elemental. Actor class 2205202 is
  name-verified as "woodsent elemental" in DAT display text
  (3205202). Identity disambiguation: the 2204605 homonym sits inside
  the open-world fire-elemental block (3204601-3204604/3204606 are
  plain fire elementals), while 2205201/2205202 form the quest
  scenario pair (2205201 is DAT-verified as CNJ306's "spirit of the
  wood"). The merchants, Wailers, moogle, and Echo-story Garlean
  spies are not targets; the central quest row lists no party limit,
  kill condition, or failure condition, and the walkthrough lists
  none.
- Aftermath: campfire scene (`processEvent030`, scene `lnc30630`,
  DAT marker 11018202) at the duty trigger. The merchants'/Wailers'
  campfire talks are optional flavor with no quest scene function
  (absent from the recovered function list) and stay unbound.
- Echo: Brazen-faced Broker (actor 1000403, display 4000135,
  `processEvent035` + `processEvent040`, DAT marker 11018203, at
  Camp Bentbranch). Added spawn id 3297 (zone 150). The 51030 ask
  gate requires result 1 (Pgl306 precedent); the `lnc30640` Echo
  scene chains in the same interaction (Gla300 040->050 precedent).
- Report/reward: J'moldva (`processEvent050`, DAT marker 11018204),
  then Willelda (final hook `processEvent060`, DAT marker 11018205).
  Central rows grant 36,000 gil + 3,600 Lancer marks; the script
  grants 4,720 EXP (archived 1.0 walkthrough value, Pgl306 peer
  precedent). The 6,231 post-1.20 maximum is documented, not granted.
  Fandom lists no item reward and DAT `quest_reward.csv` has no rows
  for 110182, so the script grants no item.

## Map evidence

- Marker 11018202 (394.23 / -782.4) converts under the zone-150 native
  page-2000 transform to square (34,30) — exactly the wiki's "duty
  calls at (34,30)". 39 live navmesh nodes fall within 30 yalms.
- Marker 11018203 (299.32 / -539.69) converts to square (34,32), at
  Camp Bentbranch (battlewarden 4.4 yalms, aetheryte 12 yalms). 222
  live navmesh nodes fall within 30 yalms.

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Lnc306` row with
  `offer = true`, route [1] (J'moldva briefing) / [2] (duty push),
  battle (1 target), postBattleRoute [20] (campfire aftermath push) /
  [21] (broker Echo gate + scene) / [22] (J'moldva report).
- `Data/scripts/directors/Quest/QuestDirectorClassLnc306.lua`: single
  Woodsent Elemental (2205202/3133), `requireAllTargets`, party cap
  3, 600s timeout.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcId 3133. The actor
  class is DAT-backed; stat shape cloned from `lightning_elemental`
  (39407) with the curated Elemental skill list 5021. All tuning
  beyond the DAT identity is reconstruction policy. Private encounter
  summon only.
- `Data/sql/server_eventnpc_spawn_locations.sql` + migration
  `Data/sql/live migrations/lnc300_lnc306_route.sql`: duty trigger
  (3296), Echo broker (3297).
- `tools/validate_lnc306_route.py`: static route/fight contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110182 added to `IMPLEMENTED_CLASS_IDS`;
  the Lnc306 entry removed from `tools/validate_class_held_routes.py`.

## Documented defaults (not retail claims)

- Level 36 follows the quest-level default (Pgl306/Gla306 peer
  precedent; the walkthrough notes the fight is easily soloed by a
  36 LNC); single wave; party cap 3 follows the PGL/GLA class-quest
  precedent (retail documents no limit).
- Spawn offset is an adapter formation offset, not the duty layout.
- Trigger Y=5.455 is live navmesh node 4883 (2.37 yalms from the
  marker; `Data/quicknavmesh/zone_150.tsv`, sha256
  `c2388186a236d69911708286e44359d88e413bf559fa78deae4df6ea189eb2d9`).
- Broker Y=4.346 is live navmesh node 6224 (1.74 yalms); rotation is
  a scaffold: correct it after a live map capture.
- `processEvent010/020/030/040/050` own after-warp fades and play as
  normal talk callbacks here; retail stages the J'moldva briefing in
  an instance, which the class driver cannot stage — positions are
  DAT-exact, instancing is not.
- The surviving-merchant identity resolves to the public
  Brazen-faced Broker (1000403); instance-only candidates 2290024/
  2290028 stay documented alternates for the Echo broker if live
  capture contradicts the public placement.

## Sources

- DAT: `docs/Dat Mining/lnc306.csv` (112 text rows),
  `quest_marker.csv` rows 11018201-11018205 (+11018206-11018220
  confirmed filler), `xtx_displayName.csv` 3205202/3204605/3205201/
  4000135, `quest.csv` row 110182 (no limits/conditions),
  `actorclass.csv` scenario-block pairing.
- Walkthroughs: Gamer Escape `Necessary_Evils` (route, (34,30), 1
  elemental, optional campfire talks, broker Echo gate) and Final
  Fantasy Wiki `Lancer_Quests_(version_1.0)` (journal states, 4,720
  EXP, no item). eLeMeN archives and the classic Fragmenterworks
  wiki were unreachable (403/connection refused).
- Video (manual-review corroboration; page fetches return only the
  player shell, so counts come from the walkthroughs above):
  YouTube `YujVm-l0l68` ("Necessary Evils" Part 1) and `rVLQ6smILTk`
  ("Necessary Evils" Ending).

## Verification

- `python -B tools/validate_lnc306_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- `python -B tools/validate_class_quest_mob_types.py` → PASS
- `python -B tools/validate_class_held_routes.py` → Lnc306 clean
  (remaining Cnj306/Thm306 failures are pre-existing/concurrent work,
  untouched by this change)
