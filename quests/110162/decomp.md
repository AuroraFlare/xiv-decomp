# 110162 There Can Be Only One — `Arc306` (Archer 36)

- Offer+reward: Nonolato 1000463/1400007 (Quiver's Hold, zone 206).
- Chain: follows 110161 (final arc quest of this assignment).
- Script: custom `Data/scripts/quests/arc/arc306.lua` (outside the generic
  driver — two encounters; template keeps metadata only).

## Sources

- Ranged pack `outputs/class-quest-ranged-decomp-20260927/` (Arc306 rows);
  decompiled client scenario arc306.lua (NonolatoStart, 010, 020, 030, 040,
  050, 005_2..005_8, 010_2, 040_2..040_8).
- DAT quest markers 11016201-06 live; 11016207-20 rejected filler. Duel trigger
  sits on 11016206 in the same 26-33 cell as the find.
- Video: `https://www.youtube.com/watch?v=1FwllHbw81Q` (12:24 There Can Be Only
  One) + `https://www.youtube.com/watch?v=uBYbi8AJ5sE`.
- Walkthroughs: Gamer Escape `There_Can_Be_Only_One_(1.x)` — Nonolato ->
  optional archer hints -> 26-33 west of Humblehearth -> escape Yarzons toward
  Gridania OR Sorrel Haven -> return -> Siward duel; FFXIV Wiki Archer Quests
  (1.0) journal states; "easily soloed by Rank 36", buff-up beat before the
  duel, Yarzons spawn outside aggro range.

## Sequence flow (retail journal 0/5/7/10/15/20; 6/8 internal)

- ACCEPT Nonolato `processEventNonolatoStart` -> 0 ask guild (informant flavor
  `005_2..005_7`, never advance) + Sorrel find `010` (escape choice is
  cutscene-internal, no result gate; escape duty launches unconditionally) ->
  6 internal escape -> 7 return push `020` -> 8 internal duel -> 10 Hold
  aftermath push `030` -> 15 Keelty confession `040` -> 20 Nonolato `050`
  (returns nothing; 4,720 EXP granted explicitly + `sqrwa`).
- Both Keelty talks proximity-disambiguated (Sorrel find vs Hold confession).
  005_8, 010_2, 040_2..040_8 have no recovered owners, stay unbound. Keelty
  battle-ally candidate 2290032 never spawns (not in walkthrough); M'koliwe
  1000594/1900023 is cutscene-only.

## Dialogue / cutscene IDs

`processEventNonolatoStart/005_2..005_7/010/020/030/040/050` (+ `sqrwa`). No
chocobo actor/callback anywhere.

## Objectives

Question the guild; find Keelty near Sorrel Haven; escape the Yarzon pack to
either exit; return; defeat Siward; aftermath at the Hold; Keelty's confession;
report to Nonolato.

## Instance / territory IDs

- Escape: `QuestDirectorClassArc306Escape`, 6 -> 7 / 0, party cap 3, 1800 s
  backstop (retail shows no timer), `boundaryRadius = 200` (exits past the
  default 45-yalm circle). Victory only from the exit poll (15-yalm radius);
  four Yarzon Stalkers credited-but-never-winning (`requiredKills 999`).
- Duel: `QuestDirectorClassArc306Duel`, 8 -> 10 / 7, party cap 3, 600 s.
  Siward the sole kill target at -16 (outside 10-yalm aggro, per the buff-up
  beat); three Yarzon Stalkers spawn on the first completion tick, never
  credit. Cross-aggro onto Siward is emergent hate, not scripted.
- Entry zone 150 (Central Shroud), geography marker 11016206. Mounted entrants
  refused with dismount message. Death fails escape back to the find (0), duel
  back to the return (7).

## Spawn positions (mob-map guide)

- Private encounters: adapter formation offsets (documented reconstructions):
  escape (0,-60),(-5,-120),(12,45),(27,95); duel Siward (0,-16), optionals
  (-12,-22),(12,-22),(0,-28). Per `mob_map_coordinates.md`, private zones stay
  JSON-only candidates — no public mob SQL.
- Exits reconstructed: south toward Gridania (-412.37,-600.0), north-east
  toward Sorrel Haven (-367.0,-302.0), hearth floor, 15-yalm radius.
- Public scaffolds (DAT-exact X/Z): 3324 `arc306_keelty_sorrel` zone 150
  (-412.37, Y 6.1 flagged, -445.51); 3325 `arc306_duel_trigger` zone 150
  (-383.13, Y 6.1 flagged, -542.29); 3326 `arc306_aftermath_trigger` zone 206
  (226.95, Y 13.0 Hold floor, -1265.0). No Sorrel navmesh within 200 yalms —
  both field Y values need live capture.

## Mobs (IDs / stats / abilities / AI)

- Escape/duel Yarzons: actor 2205506, live profile 3140 (Yarzon Stalker).
- Siward: battle actor 2289016 / bnpc 32749, display 1000342, level 36
  (2289017/2289018 graphic-identical alternates; cinematic Siward 1000588).
  Profile cloned from the humanoid set, skill list 15; exact retail
  jobs/skills unrecovered. Standard enmity/leash via
  `ConfigureScriptedOneShotLifecycle`.

## Triggers

Talk Nonolato (offer) -> informant talks (flavor) / talk Keelty at Sorrel
(010 + escape launch) -> reach either exit -> push duel trigger (020 + duel
launch) -> kill Siward -> push aftermath trigger (030) -> talk Keelty (040) ->
talk Nonolato (050 + reward).

## Rewards

- Central: 36,000 gil + 3,600 Archer marks (1000106). Script: 4,720 EXP
  (post-1.20 level-36 max; no central EXP row, granted explicitly). No item
  reward in DAT. Dup turn-in safe: reward once at sequence 20.

## Sync / lockouts

- No level sync (none in retail 1.0 class quests); Archer-36 floor enforced on
  every handler and both duty entries. No lockout beyond duty timers; escape
  failure -> 0, duel failure -> 7, both with visible retries.

## Edge handling (verified in `gc_sqb_runtime.lua` + `arc306.lua`)

Owner by exact id + sequence (6/8); helpers never adopted; relog rebinds same
character; escape exit poll + unreachable kill count (kills never win); duel
`isComplete` first-tick Yarzon spawn can never fail the duty (Siward alone is
the objective); failed starts owning cleanup never ended twice; `StartSequence`
+ `Save` + `UpdateENPCs` on every path.

## Open gaps

Escape exits/Yarzon counts/offsets; duel offsets; party caps; Sorrel/duel Y
need live capture; 005_8/010_2/040_2-8 owners. `validate_arc306_route.py` PASS.
