# Min200 - A Piece of History (110460) - VERIFIED

- SQL (VERIFIED): `(110460, 'A Piece of History', 'Min200', 0, 20)`. SQL
  prerequisite is 0; the archived 110013 prerequisite is documented in the
  header as unenforced (no driver prerequisite support).
- Availability (VERIFIED): disabled (commented; listed IMPLEMENTED).
- Script: `Data/scripts/quests/min/min200.lua` + `min_quest_helpers.lua`.

## Sequence flow (VERIFIED; driver-compatible 1/2/3 route, 0 reward)

- `SEQ_ACCEPT`: Linette (1000861), Miner (class 39) 20+, delegate
  `processEventLinetteStart == 1` -> AcceptQuest.
- 1 briefing (Z'ssapa twins, 1000887): `processEvent010`, snapshots all three
  finds (counters 0-2), clears obtained flags -> 2.
- 2 item list: `processEvent015_1` + `processEvent015_2` -> 3. (017_A/B/C
  appraisal branches unbound - no selection rule recovered. Nenekko
  instance interlude 030/035/040 unbound - no spawn row. Both marked.)
- 3 mining + appraisal: scene `processEvent020` always plays; only a full
  1-of-each pack consumes and advances -> 0 (Linette reward). Partial pack
  holds with a progress message.
- 0 Linette: `processEvent050`, single CompleteQuest. No script EXP (post-1.20
  amount unresolved), no Iron Dolabra (era conflict); gil/marks central.
- `onFinish`: owned finds stay (standard item-objective behavior); re-accept
  re-snapshots. VERIFIED safe.

## Delegate events (VERIFIED)

`processEventLinetteStart`, `processEvent010`, `processEvent015_1/015_2`,
`processEvent020`, `processEvent050`.

## ENPC IDs (VERIFIED)

Linette 1000861: public row 177, zone 209 (-92.38, 195.6, 313.43). Z'ssapa
1000887: public row 2464, zone 170 (92.767, 183.826, -1030.44). Both VERIFIED.

## Markers (RECOVERED)

11046001 (brief), 11046006/07/08 (DAT areas), 11046003 (appraisal),
11046005 (reward). Multi-return form (no unpack). VERIFIED form.

## Counters/flags (VERIFIED)

Counters 0-2 baselines (engine persists slots 0-3 only); flags 0-2 obtained
booleans (DAT $E8(2..4) meaning preserved via live net-gain journal rule).

## Journal hooks (VERIFIED)

Mining state returns live `(eye, wood, ewer, 0, 3)` net-gain flags (never
stale pre-talk state). Markers switch areas/appraisal on readiness.

## Gather items + delivery (VERIFIED + SQL)

- Sheep's-eye 11000012, Petrified Wood 11000013, Ewer Fragment 11000014, one
  of each, NQ-only (quantities convention), snapshot-diff credit, traded finds
  credit like mined ones (no mining-event callback exists in C#).
- Pool bindings: migration-only (`Data/sql/live migrations/min200_route.sql`):
  all three finds in pools 30061 (Black Brush), 30071 (Drybone), 30081
  (Horizon's Edge), weight 100, sweetSpot NULL. NOT in main SQL (generator
  cannot emit them; `Data/gather.csv` lacks the items). OPEN parity gap:
  fresh databases built from main SQL only cannot supply the finds (same for
  Hrv300). Documented here; pipeline redesign out of scope.

## Rewards (VERIFIED)

Central: 20000 gil + 2000 Miners' marks (1000121). Script grants no EXP/items.
No double-grant.

## Prereq chain

Miner 20 (110013 unenforced). Feeds Min300 (stub).

## Kills

None.
