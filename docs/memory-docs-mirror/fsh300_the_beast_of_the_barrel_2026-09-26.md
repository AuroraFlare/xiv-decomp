# Fsh300 The Beast of the Barrel — implementation notes

Implemented: 2026-09-26. Fisher 30 class quest. Fifth gathering-class
implementation; it is a driver route (delivery + grant + inspect +
requiredResult + push), reusing the Fsh306 `anyOf` form and Sisipu
scaffold.

## Retail route (evidenced)

- Offer: N'nmulika (actor 1000153) in the Fishermen's Guild
  (`processEventNnmulikaStart`). Public spawn row exists (id 325,
  zone 230).
- Feed handoff: Sisipu (`processEvent010`), DAT marker 11050101,
  granting the Barrel Feed (11000025). The marker X/Z exactly match
  the Fsh306 Sisipu scaffold row (id 3329), which is reused.
- Ferry out: Rerenasu (`processEvent020` then the boat ask
  `processEvent010_1001`, gated on result 1), DAT marker 11050102.
  Public spawn row exists (id 348, zone 230); X/Z within 1.2 yalms
  of the marker. The ask plays; the dinghy travel is unbound (no
  ferry-travel owner).
- Feeding: Barrel push (events 025 + 030), DAT markers 11050103/04,
  consuming the feed and granting the Wawalago Message (11000133).
  The Barrel is the offshore fishery "spread out before the guild"
  (DAT dialogue); its four trigger X/Z are DAT-exact in zone 230
  (new rows 3330-3333 reusing generic actor 1000174; Y 1.0 follows
  Rerenasu's dock waterline, rotation scaffolded). The lalafell
  appearance plays inside the push scenes.
- Subligar trade: Rorojaru in Ul'dah (`processEvent040`), DAT
  marker 11050105, consuming the message and granting the
  Star-Spangled Subligar (8050521, retained). Public spawn row
  exists (id 43, zone 175); X/Z exactly matching the marker. The
  decomp state order (15 before 22) plus the journal text place
  the trade before the dance rounds; the numbered walkthrough's
  looser ordering is not followed.
- Dance rounds: four sequential pushes, one DAT marker each
  (11050103/04/112/113 in x-order), each gated on subligar
  possession (inspect). No scenes are recovered for the rounds;
  the emote binding (/dance + clue + feedback per round) has no
  engine owner, so the pushes advance silently. This is the
  largest deviation in the route.
- Catch: Barrel push with the `anyOf` gate over the three
  DAT-named Barrel species - Saber Sardine 3011201 (pool 10071),
  Tiger Cod 3011205 (pools 10051/10061/10511/30081), Coral
  Butterfly 3011208 (pool 10061) - consuming one on a full pack.
  No scene is recovered for the turn-in; the lalafell reaction
  plays nowhere. The Barrel has no pool of its own, so the named
  species swim at their normal pools (documented stand-in);
  "species unrestricted" narrows to the three evidenced names and
  any owned fish counts (fresh-catch rule unbound, Fsh306
  precedent).
- Ferry back: Rerenasu return ask (`processEvent010_1002`, gated
  on result 1), bound to his docks spawn with no markers (the ask
  has no retail state; placement reconstructed between the catch
  and the Sisipu return). Travel unbound.
- Talks: Sisipu (`processEvent050`/`060`), DAT markers
  11050109/10, 23 yalms from the shared scaffold (she moves
  during the quest; the server has no phasing, so one row serves
  all three Sisipu spots - documented offset).
- Echo: Sisipu (`processEvent070`, requiredResult 1), DAT marker
  11050108, 4.7 yalms from the scaffold; the marker's 1400010
  display mismatches the Sisipu actor (same display/actor pattern
  as Fsh306's Maisie marker, documented).
- Reward: N'nmulika (final hook `processEvent075`). Central rows
  grant 30,000 gil + 3,000 Fishermen's Guild marks (item 1000123);
  both rows predate this change.

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Fsh300` row with
  `offer = true`, route [1] (Sisipu 010 + feed grant) / [2]
  (Rerenasu 020 + ferry ask) / [3] (Barrel feed push 025/030 +
  feed delivery + message grant) / [4] (Rorojaru 040 + message
  delivery + subligar grant) / [5]-[8] (four inspected round
  pushes) / [9] (catch push + anyOf) / [10] (return ask) /
  [11]-[12] (Sisipu 050/060) / [13] (Sisipu Echo 070), no battle.
  Prerequisite 110500 (Fsh200) documented, unenforced (no driver
  prerequisite support, same as existing class chains).
- `Data/sql/server_eventnpc_spawn_locations.sql` + mirror
  `Data/sql/live migrations/fsh300_route.sql`: the four Barrel
  trigger rows. No fishing SQL: all three catch species already
  swim with recovered depths.
- `tools/validate_fsh300_route.py`: static route/pool contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110501 added to `IMPLEMENTED_CLASS_IDS`;
  the `Fsh300` held-routes entry removed (promotion convention).

## Documented defaults (not retail claims)

- Finds and quest items route through normal inventory with
  chat-log visibility; gates count and consume instead of
  observing world events, and HQ items do not count (quantities
  convention).
- The subligar check is possession, not equipped (no equipment
  validation in the engine).
- The ferry asks play and gate, but no zone movement happens;
  Rerenasu's return ask placement (step 10, no markers) is
  reconstructed.
- The four round pushes and the catch push play no scene (none
  recovered) and advance silently on their gates.
- Post-1.20 EXP scaling is unresolved (DAT maximum 3,420), so the
  template grants none; markers 11050106/07 (replay-only,
  contaminated transforms) stay unbound, as does WawalagoGuild
  1000154 (display only, no route state).
