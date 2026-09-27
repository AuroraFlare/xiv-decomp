# Hrv300 The Grass is Always Greener — implementation notes

Implemented: 2026-09-26. Botanist 30 class quest. Fourth gathering-class
implementation; it is a bespoke script (Exc300 precedent) because the
class driver owns no Parley-result callback.

## Retail route (evidenced)

- Offer: Opyltyl (actor 1000236) at the Botanists' Guild counter
  (`processEventOpyltylStart`). Public spawn row exists (id 547, zone
  206, -205.68 / 20 / -1454.72); X/Z match DAT reward marker 11048108.
- Assignment: Cicely (actor 1000326), `processEvent010`, DAT marker
  11048101. Public spawn row exists (id 548, zone 206), X/Z exactly
  matching the marker.
- Briefing: Penelope (actor 1700001) at Carline Canopy,
  `processEvent020`, DAT marker 11048102. Public spawn row exists (id
  614, zone 155), X/Z exactly matching the marker.
- Exchange: Cicely (`processEvent030`), DAT marker 11048104, sending
  the player to gather.
- Gathering: one Bowing Pine Branch (11000086) from Bentbranch
  logging pool 20123 (zone 150, nearest node 27.5 yalms from area
  11048109; the walkthrough's "directly outside Gridania") and one
  Foul-smelling Nut (11000087) from Humblehearth logging pool 20203
  (zone 150, nearest node 115.7 yalms from area 11048110; sparse
  corner, documented). The walkthrough fixes the item-to-area
  mapping. The DAT checklist shows each item once its obtained flag
  ($E8(2)/ $E8(3), states 11 only) is set; the server writes both
  flags and the journal feed from possession.
- Ink turn-in: Cicely (`processEvent030` replay) consumes branch +
  nut and grants Nostalgic Ink (11000085, DAT-visible states 12-19).
- Parley: Penelope, title 1301 with the ink required (both
  recovered). The intro talk stamps the board temp vars (the C#
  Parley command only targets NPCs carrying `negotiation.enabled`);
  `onNegotiationResult` accepts a win only with the ink in hand and
  grants the Pirate Ship Tale (11000042, DAT-visible at state 18
  only). Difficulty/turns/turn-time are unrecovered, so the Man300
  engine defaults (3/12/20) are documented defaults. DAT keeps the
  ink through state 19, so the Parley never consumes it.
- Tale turn-in: Cicely (`processEvent030` replay) consumes ink +
  tale and grants Meracydian Olives (11000135) + Letter to Nenekko
  (11000136, DAT-visible from state 20).
- Nenekko delivery (state 20): DAT binds Linette's actor/marker
  11048106 and no Nenekko spawn row exists anywhere, so Linette
  takes the olives (DAT-visible through state 24) while the letter
  is presented but retained (DAT-visible through state 29). No
  client event is recovered for this beat, so it advances on the
  possession check alone.
- Nogeloix (actor 1000597, DAT marker 11048105; public spawn row id
  150, zone 209, X/Z exactly matching), then Linette with the
  letter: the letter is consumed and the Amajina Ceruleum (11000137,
  DAT-visible from state 30) granted. "Amajina Ceruleum" is the
  miners' product, so Linette - not Nogeloix - grants it. Order is
  flag-enforced with a redirect message. No client events are
  recovered for these talks either.
- Guild delivery (state 30): DAT marker 11048107 sits exactly on
  the pre-existing MSQ trigger row (actor 1090046 at -202.91 /
  18.09 / -1477.51, zone 206); ENPC flags are per-quest (Linette
  precedent), so the quest flags the same class without touching
  the MSQ row, consumes the ceruleum, and never despawns the
  shared actor.
- Reward: Opyltyl (final hook `processEvent040`, afterWarp).
  Central rows grant 30,000 gil + 3,000 Botanists' Guild marks
  (item 1000122); both rows predate this change.

## Server mapping

- `Data/scripts/quests/hrv/hrv300.lua`: bespoke quest script
  (Exc300 precedent: mirrored journal states, ENPC/quest/marked
  constants, QuestData flags for sub-beats, `onNegotiationResult`
  for the Parley). No template row (Exc300 precedent: removed on
  promotion), no DECOMP hooks entry.
- `Data/sql/live migrations/hrv300_route.sql`: the two quest-find
  pool entries. Weight 100 keeps each pool's uniform provisional
  convention; sweetSpot stays NULL (no gather_aim rows). The finds
  are absent from Data/gather.csv, so the migration is their only
  home (Min200 precedent).
- `tools/validate_hrv300_route.py`: static route/pool contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110481 added to `IMPLEMENTED_CLASS_IDS`;
  the `Hrv300` held-routes entry removed (promotion convention).

## Documented defaults (not retail claims)

- Finds route through normal inventory with chat-log visibility;
  the turn-in counts and consumes instead of observing logging
  events, and HQ finds do not count (quantities convention).
- The Parley board (difficulty 3, 12 turns, 20s turn time) and the
  desired-item 0 follow the Man300 engine defaults; only title
  1301 + required ink are recovered. The enabled temp var lingers
  on Penelope until overwritten (no other Penelope-Parley quest
  exists); it is cleared on an accepted win.
- The state 12-17 window collapses to one server state with
  introduced/won flags (the journal ladder names only 12); the
  state-25 double beat collapses likewise (journal names only 25).
- The letter's present-but-retained state-20 handling reconciles
  the state-20 objective text ("deliver Olives and Letter") with
  the DAT letter visibility (through state 29); if retail evidence
  shows a re-grant instead, the boundary moves without touching
  the pool/route work.
- The 030 exchange scene replays at states 10, 11, and 18 (one
  recovered exchange scene for three exchange beats).
- Post-1.20 EXP scaling is unresolved (DAT maximum 3,420), so the
  template grants none; marker 11048103 (replay-only,
  contaminated transform) stays unbound, as do the Nenekko actor
  fidelity, journal-data pins, and after-warp lifetime.
