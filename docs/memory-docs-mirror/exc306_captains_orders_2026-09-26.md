# Exc306 Captain's Orders — implemented

Implemented: 2026-09-26. Marauder 36.

## Retail route

Waekbyrt (offer, Astalicia) -> captain's-quarters door -> unwinnable
first attack against Moenskaet the Honorbound (survive 300s; death
retries at the door) -> cargo-hold recovery (rum barrel, Rostnsthal,
Kraken Register grant) -> Waekbyrt warning 035 -> lounge confrontation
040 -> deck oath and register handoff 050 -> Waekbyrt routing talk ->
rematch doors ("Click Yes") -> winning rematch against Moenskaet and
his right/left hands (all three must fall; the carried register falls
out of the pack) -> Rostnsthal report 060 and Echo into his past 070
(ask 51030 result gate) -> Waekbyrt reward 080. Chain: follows Exc300
(Two-man Crew).

## Decomp evidence

- DAT markers 11010201-11 (quarters entry, cargo hold, Rostnsthal deck
  talk, guild-door waypoint, Waekbyrt, lounge trigger, rematch entry,
  Rostnsthal report, Waekbyrt reward, two downstairs-waypoint
  candidates). Markers 11010212-20 are rejected filler. 11010201/07 sit
  exactly on the live `push_mrd_outside_upstairs_door` trigger and
  11010204 on `push_mrd`; 11010210/11 sit within 0.3m of the two
  downstairs doors.
- Decompiled scenario `exc306.lua`: WaekbyrtStart, 010/exc30610
  (unwinnable attack + forced relocation), 020/exc30620 (cargo-hold
  recovery), 030/exc30630, 033 (Rostnsthal tells the player to return),
  035 (Waekbyrt warns the captain is still looking), 040/exc30640
  (lounge confrontation), 050/exc30650 (deck oath, conditional
  after-warp argument), 060/exc30660 (post-rematch report), 070/exc30670
  (Echo, ask 51030, required result 1), 080 (final report/reward).
  030/033/000/111/112 have no recovered owners and stay unbound.
- The 1.0 walkthrough fixes the mechanics the decomp leaves open: the
  first fight is survived, not won ("last the entire fight", 300s);
  the warehouse ??? check is its own step; the rematch is Moenskaet
  plus two henchmen, all killed; the register falls out of the pack
  on victory; the lounge Echo peers into Rostnsthal's attempt to sell
  the register to Commodore Reyner of the Barracudas.
- DAT display names: 1000003/1600217 Waekbyrt, 1001652/1600150
  Rostnsthal, 1000215/1600096 Hyllfyr (scene-only), 1000489/1600116
  Moenskaet (scene), 1000885/1000886 hands (scene), 2289004/2289005
  Moenskaet (battle; graphic-identical, split by encounter),
  2280219/2280220 hands (battle, displays 3280219/3280220).

## Implementation

- Custom script `Data/scripts/quests/exc/exc306.lua` (outside the
  generic driver; the template keeps metadata only): Waekbyrt offer,
  dedicated quarters-door push (marker 01/07), survival content,
  in-instance barrel push (Register grant + director-exit flag),
  Waekbyrt 035, lounge push 040, Rostnsthal deck talk 050, Waekbyrt
  routing talk (no recovered event; never result-gated), rematch-door
  push (native entry prompt is the "Click Yes"), Rostnsthal 060 + 070
  (result-gated), Waekbyrt 080 + 4,720 EXP + completion.
- Survival director `QuestDirectorClassExc306Survival` + content
  `SimpleContentExc306Survival` (private zone-230 copy, Cnj306 escort
  precedent): plays 010 in-duty once entry is ready, spawns the
  level-40 Moenskaet at the entry, polls survive-300s-or-boss-down
  (an early kill advances to the same recovery beat; retail shows no
  victory branch), then fades to the barrel interlude. Marker 11010202
  has no navmesh or catalog ground within 120 yalms in any Limsa
  frame, so the barrel spawns beside the player instead of in
  unmapped void. The quest's Register flag exits the instance.
- Rematch director `QuestDirectorClassExc306Rematch` (gc_sqb):
  sequences 26 -> 30 / 25, party cap 3, 600s timeout, all three kills
  required; the final credit consumes the carried Register
  defensively. Spawn offsets follow the documented rank-36 defaults.
- Mob profiles: new 32743 (survival, level 40), 32744 (rematch,
  level 36), 32745/32746 (hands, level 34), all cloned from the
  Kraken Deckhand humanoid with skill list 15. Exact jobs/skills are
  unrecovered.
- Rewards: 4,720 EXP in script; 36,000 gil + 3,600 Marauder marks in
  the central rows. No item reward in DAT.
- Spawn scaffolds: 3317 (`exc306_quarters_door`, zone 230, DAT X/Z,
  door-trigger floor Y 16.3) and 3318 (`exc306_lounge_trigger`,
  zone 230, DAT X/Z, sraemha floor Y 6.8). Rostnsthal reuses the
  Exc300 zone-230 spawn; Waekbyrt is public.

## Verification

`tools/validate_exc306_route.py` PASS (route, survival/barrel/Register
mechanics, rematch roster/consume, profiles, spawns, markers, rewards,
availability). `tools/validate_quest_availability.py` PASS.
`tools/validate_class_quest_mob_types.py` PASS.

## Live offers

110102 is uncommented (enabled) in `quest_availability.lua`; it has no
SQL prerequisite, so a level-36 Marauder is offered it directly. Failed
duty starts that already own event cleanup are never ended twice, and
the 070 Echo gate advances on a nil result rather than softlocking.
