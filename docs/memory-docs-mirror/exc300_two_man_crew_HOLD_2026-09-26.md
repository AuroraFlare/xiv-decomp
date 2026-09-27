# Exc300 Two-man Crew — HOLD assessment (RESOLVED)

Assessed: 2026-09-26. Marauder 30 class quest. IMPLEMENTED as a
bespoke five-pickup script (`Data/scripts/quests/exc/exc300.lua`,
covered by `tools/validate_exc300_route.py`).

Known conflict, documented 2026-09-26: the 1.0 walkthrough describes
a Sailors' Ward instance version (3 chests + crate pirate, creak
fails, lemming) while the decompiled client scenario has five
pickups and no private duty. Zone 140 (Sailors' Ward) has no
navmesh or geometry in this repo, so the instance version is
unplaceable; the DAT-pure collection stands until interior data or
a version ruling lands.

## Why HOLD (not provable)

Two-man Crew is a bespoke collection quest: steal five distinct
valuables from the Krakens' den (single area marker 11010102, no
per-object transforms), with collection states 7-11, a sale state,
and trial-object variants {1, 2, 3} whose mapping is unrecovered.
The den marker sits on map layer 50 with zero recorded navmesh nodes
within 40 yalms (nearest 79+ away), so the den's accessibility, entry
mechanism, and floor height are all unknown. The Pgl200 coin-pickup
pattern proves the server *can* stage five uniquely-keyed pickups,
but placing five objective objects from one area marker plus an
unknown entry would be fabrication of the quest's core objective.

## Resolved pieces (for a future implementation)

- Rostnsthal variant: BOTH 1000005 and 1001652 map to display 1600150.
  1001652 is the public Rostnsthal (zone 193, Rhotano Sea). 1000005
  has no spawn row anywhere and is the quest-variant candidate for
  markers 11010101/04 (-784.81 / 386.61, zone-230 frame near
  Waekbyrt). Nearest navmesh is 127+ yalms away; nearest catalog
  floor is Waekbyrt/Nunuba at y≈7.4 (33 yalms).
- Rorojaru (1000374) exists in zone 175 at (28.93, 192, 109.69),
  matching marker 11010105 exactly.
- Waekbyrt offer/final (1000003) and markers 01/04/05/06 all check
  out; only 02 (den) and 03 (purpose unknown) block.
- Theft items verified in DAT: Mirage Token 11000032, Deep-red Ruby
  11000033, Skull Island 11000034, Aged Rum 11000035, Far Eastern
  Sourleaf 11000036, Pirate Ship Funds 11000131.
- Client events recovered: 020 (Rostnsthal cutscene, conditional
  after-warp), 022 (follow-up talk), 025 (Rorojaru sale talk), 030
  (final cutscene), trialObject(variant 1/2/3 flavor).

## What would unblock it

1. Krakens' den entry + interior layout (live capture or video with
   map frames): area, trigger, five object transforms.
2. Trial-variant to valuable mapping (which object grants which item).
3. Collection/sale state machine owner (bespoke script following
   `pgl200.lua`'s pickup/counter pattern).
4. Marker 11010103 purpose; intermediate dialogue owners.
5. 1000005 placement confirmation (live position of quest Rostnsthal).
