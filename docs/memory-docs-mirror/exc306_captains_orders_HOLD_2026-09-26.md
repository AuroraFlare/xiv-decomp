# Exc306 Captain's Orders — HOLD assessment (RESOLVED)

Assessed: 2026-09-26. Marauder 36 class quest. IMPLEMENTED the same
day; see [exc306_captains_orders_2026-09-26.md](exc306_captains_orders_2026-09-26.md).

## How the blockers resolved

- Lose-to-advance is a survive-300s poll, not a new driver state: the
  1.0 walkthrough says to last the fight without dying, which the
  existing victory/failure/retry runtime already models (death fails,
  timer wins). Custom director `QuestDirectorClassExc306Survival`.
- Boss variants resolved from DAT: 2289004 (survival) / 2289005
  (rematch), both display 1600116 with identical graphic rows;
  2280219/2280220 hands (displays 3280219/3280220). New profiles
  32743-32746.
- Register transaction resolved from the walkthrough: granted at the
  warehouse barrel (11000132), consumed on the rematch's final kill
  ("falls out of your pack").
- Markers 11010210/11 stay unbound downstairs-waypoint candidates;
  11010204 is the shared `push_mrd` waypoint; the quest binds
  dedicated triggers instead of the live guild doors.
- Warehouse marker 11010202 has no public ground in any Limsa frame,
  so the barrel interlude runs inside the survival instance.
- Rewards: 4,720 EXP explicit + 36,000 gil / 3,600 marks central.
