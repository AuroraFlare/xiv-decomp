# Arc306 There Can Be Only One — implemented

Implemented: 2026-09-26. Archer 36.

## Retail route

Nonolato (offer, Quiver's Hold) -> optional archer-informant hints
(005_2..005_7; never advance) + Sorrel Haven find 010 (the escape
choice is cutscene-internal, no result gate) -> Yarzon escape duty
toward Gridania OR Sorrel Haven (no kills required; reaching either
exit wins) -> return cutscene 020 -> Siward duel (only Siward's
defeat ends the fight; nearby Yarzons optional, may turn on him) ->
Quiver's Hold aftermath 030 -> Keelty confession 040 -> Nonolato
reward 050. Chain: follows Arc300. Retail journal states are
0/5/7/10/15/20; sequences 6/8 below are internal content states.

## Decomp evidence

- DAT markers 11016201-06 (find, return, aftermath, Keelty
  confession, Nonolato reward, escape/duel geography). Markers
  11016207-20 are rejected filler. The duel trigger sits on 11016206
  in the same 26-33 cell as the find, matching the walkthrough's
  "return to 26-33".
- Decompiled scenario `arc306.lua`: NonolatoStart, 010, 020, 030,
  040, 050, 005_2..005_8, 010_2, 040_2..040_8. The six informants map
  to 005_2..005_7 in recovered-candidate order; 005_8, 010_2, and
  040_2..040_8 have no recovered owners and stay unbound.
- The 1.0 walkthrough fixes both encounters: escape by running to
  either exit ("once the instance ends"); Yarzons and Siward spawn
  outside aggro range ("prepare for the fight"); kill Siward only;
  "easily soloed by Rank 36". Keelty's battle-ally candidate
  (2290032) never appears in the walkthrough and is not spawned;
  M'koliwe (1000594/1900023) is cutscene-only.
- DAT display names: 1000463/1400007 Nonolato, 1000587/1100199 Keelty,
  1000588/1000342 cinematic Siward, 2289016/1000342 battle Siward
  (2289017/2289018 are graphic-identical alternates).

## Implementation

- Custom script `Data/scripts/quests/arc/arc306.lua` (outside the
  generic driver; the template keeps metadata only). Informant talks
  play flavor without advancing; both Keelty talks are proximity
  disambiguated (Sorrel find vs Hold confession).
- Escape director `QuestDirectorClassArc306Escape` (gc_sqb):
  sequences 6 -> 7 / 0, party cap 3, 1800s backstop (retail shows no
  timer), four Yarzon Stalkers (live profile 3140) as credited-but-
  never-winning targets (requiredKills 999), victory only from the
  exit poll (15-yalm radius). Exits are documented reconstructions
  (south toward Gridania, north-east toward Sorrel Haven, hearth
  floor). Death fails back to the find.
- Duel director `QuestDirectorClassArc306Duel` (gc_sqb): sequences
  8 -> 10 / 7, party cap 3, 600s timeout, Siward the sole kill
  target at -16 (outside the 10-yalm aggro range, per the buff-up
  beat); three Yarzon Stalkers spawn on the first completion tick
  and never credit. Cross-aggro onto Siward is emergent hate
  behavior, not scripted.
- Mob profiles: new 32749 (Siward, level 36, humanoid skill list
  15); escape/duel Yarzons reuse live profile 3140.
- Rewards: 4,720 EXP in script; 36,000 gil + 3,600 Archer marks in
  the central rows. No item reward in DAT.
- Spawn scaffolds: 3324 (`arc306_keelty_sorrel`, zone 150, DAT X/Z,
  hearth floor Y 6.1, 39 yalms out, flagged), 3325
  (`arc306_duel_trigger`, zone 150, DAT X/Z, hearth floor Y 6.1,
  105 yalms out, flagged), 3326 (`arc306_aftermath_trigger`, zone
  206, DAT X/Z, Hold floor Y 13.0). No Sorrel navmesh exists within
  200 yalms; both field Y values need live capture.

## Verification

`tools/validate_arc306_route.py` PASS (route, informants, escape/exit
mechanics, duel roster/optionals, profiles, spawns, markers, rewards,
availability). `tools/validate_quest_availability.py` PASS.
`tools/validate_class_quest_mob_types.py` PASS.

## Live offers

110162 is uncommented (enabled) in `quest_availability.lua`; its SQL
prerequisite is 110161, satisfied by completing Arc300 live in the
same pass. The escape battle carries `boundaryRadius = 200` because
both exits sit past the launcher's default 45-yalm circle. Failed
duty starts that already own event cleanup are never ended twice.
