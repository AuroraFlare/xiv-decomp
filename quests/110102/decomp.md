# 110102 Captain's Orders — `Exc306` (Marauder 36)

- Offer: Waekbyrt 1000003 (zone 230). Class MRD 36+. Follows 110101.
- No chocobo callback or actor anywhere in this quest; mounted entry to
  both instances is blocked (rematch: shared launcher gate; survival:
  quest-local gate with "Dismount before entering..." message).

## Sequence flow
Waekbyrt offer (`processEventWaekbyrtStart`) -> [0] quarters-door push
(marker 01, dedicated trigger `exc306_quarters_door` at -779.199 /
16.3 / 386.5, on the live upstairs-door trigger) -> [1] survival
instance -> [2] warehouse barrel (`processEvent020`, Kraken Register
11000132 grant; ungranted = stay for retry) -> [5] Waekbyrt warning
(`processEvent035`) -> [10] lounge push (`processEvent040`, dedicated
trigger at -772.36 / 6.8 / 387.8) -> [15] Rostnsthal deck oath
(`processEvent050`, register stays held) -> [20] Waekbyrt routing talk
(no recovered event, never result-gated) -> [25] rematch-door push
(native entry prompt is the walkthrough's "Click Yes") -> [26] rematch
instance (final kill consumes the carried register: "falls out of your
pack") -> [30] Rostnsthal report (`processEvent060`) + Echo
(`processEvent070`, ask 51030; explicit 0 holds, nil advances, never
softlocks) -> [35] Waekbyrt reward (`processEvent080`). States 1/2/26
are internal content states. 030/033/000/111/112 ambient groups stay
unbound. Markers 11010212-20 are filler; 10/11 are unbound downstairs
waypoint candidates; 04 is the shared `push_mrd` waypoint.

## Survival fight (unwinnable first attack)
Private zone-230 copy (`SimpleContentExc306Survival`,
`QuestDirectorClassExc306Survival`): `processEvent010` plays in-duty
once entry lands; level-40 Moenskaet (actor 2289004, mob 32743,
spawned 8 yalms ahead) must be survived 300 s. Early kill advances to
the same recovery beat (no retail victory branch). Death / disconnect /
abandon / area-exit / 600 s timeout fail back to the door for retry;
relog rebinds the same character. The warehouse interlude (barrel
`exc306_warehouse_barrel` beside the player) runs inside this instance
because marker 11010202 has no public ground in any Limsa frame.

## Rematch fight
`QuestDirectorClassExc306Rematch` (gc_sqb): sequences 26 -> 30 / 25,
party cap 3, 600 s timeout, all three must fall:
- Moenskaet the Honorbound, actor 2289005, mob 32744, lv 36, (0,-8).
- Right hand, actor 2280219, mob 32745, lv 34, (-4,-6).
- Left hand, actor 2280220, mob 32746, lv 34, (4,-6).
Profiles cloned from Kraken Deckhand humanoid, skill list 15 (exact
jobs/skills unrecovered). Death/timeout/disconnect/abandon retry at
the doors; overlevel allowed (MRD 36+, no sync); no lockout timer.

## Rewards
Central: 36,000 gil + 3,600 Marauder marks (1000103). Script: 4,720 EXP.
No item reward in DAT.

## Sources
Decompiled client scenario + DAT markers/actors; 1.0 walkthrough (survive
300 s, barrel ???, three-mob rematch, register falls out, Echo into
Rostnsthal's sale attempt to Commodore Reyner); Fandom journal text.
