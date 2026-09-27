# Fsh306 - Polishing the Mast (110502) - VERIFIED (HOLD-gated)

- SQL (VERIFIED): `(110502, 'Polishing the Mast', 'Fsh306', 110501, 36)`.
- Availability (VERIFIED): disabled. Script HOLD `FSH306_OFFER_ENABLED`.
- Script: `Data/scripts/quests/fsh/fsh306.lua`. Bespoke timed-assignment flow.

## Sequence flow (VERIFIED, recovered numbering 0/5/10../20/25/28)

- 0 opening (push owner unresolved -> no ENPC; dev bypass exposes N'nmulika
  talk only): `processEvent010` -> 5.
- 5 assignment (N'nmulika): `processEvent015`, random 1-of-5 timed fish,
  baseline snapshot + authored 3-bell deadline -> timed state 10+selector.
- Timed (10-14, AUTHORED mapping; retail 10-19 mapping unresolved): talk
  checks deadline first (expired -> `processEvent015_2`, back to 5 for
  reassignment), then net gain of the assigned fish; sale consumes 1 fish,
  pays the fish's vendor sell price (AUTHORED interpretation), plays
  `processEvent016` -> 20.
- 20 sale done: `processEvent030` -> 25.
- 25 echoes (order-free by design): two Sisipu scenes (`processEvent040/050`,
  flags 0/1) + Maisie scene (`processEvent060`, flag 2), each gated on scene
  result; all three -> 28.
- 28 report (N'nmulika): `processEvent070`, `sqrwa`, single CompleteQuest,
  `AddExp(4720)`.
- Assigned-fish set (RECOVERED exact items): Rothlyt Oyster 3011213 (86g),
  Nautilus 3011203 (130g), Bianaq Bream 3011209 (106g), Ash Tuna 3011217
  (154g), Hammerhead Shark 3011225 (158g).
- This phase: assignment RNG seeding moved from per-roll
  `math.randomseed(os.time())` to once-at-load (same-second reassignment
  repeated the selector). Minor real fix.
- `onFinish`: nothing to clean (assigned fish is ordinary tradeable).

## Delegate events (VERIFIED)

`processEventNnmulikaStart`, `processEvent010/015/015_2/015_3/016/030/040/050/
060/070`, `sqrwa`. Echo/ask scenes gate on explicit `== 1`.

## ENPC IDs (VERIFIED)

N'nmulika 1000153 (public), Sisipu 1000155 (public row 3329 exists, same
caveat as Fsh300), Maisie 1000173 (public).

## Markers (RECOVERED)

11050201 (opening), 11050202 (sale), 11050203 (replay-only, trigger stays
N'nmulika), 11050204/05/06 (echoes), 11050207 (report). 11050208 explicitly
do-not-bind; 11050209-20 contaminated (marked in script).

## Counters/flags (VERIFIED)

Counters 0 (selector), 1 (baseline), 2-3 (deadline low/high split).
Flags 0-2 (echoes).

## Journal hooks (VERIFIED)

Timed: `(seq, min(gain,1), 0,0,1)`; echoes: `(seq, done, 0,0,3)`.

## Gather/delivery mechanics (VERIFIED)

Net-gain credit on the assigned ordinary fish; consumption + vendor-price gil
on sale (authored payout rule); no quest items granted.

## Rewards (VERIFIED)

Script EXP 4720. Central: 36000 gil + 3600 marks. No double-grant.

## Prereq chain

Fisher 36 + 110501 (enforced in-script). Terminal quest of the Fisher line.

## Kills

None.
