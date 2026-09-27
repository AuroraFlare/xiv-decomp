# Wdk300 - Hide and Seek Shenanigans (110301) - VERIFIED (HOLD-gated)

- SQL (VERIFIED): `(110301, 'Hide and Seek Shenanigans', 'Wdk300', 110300,
  30)`.
- Availability (VERIFIED): disabled. Script HOLD `WDK300_OFFER_ENABLED`.
- Script: `Data/scripts/quests/wdk/wdk300.lua`.

## Sequence flow (VERIFIED, recovered numbering 0/5/10/14/15/20/25/30/35)

- 0 watch + 5 supervise (A'naidjaa): `processEvent010` -> `processEvent020`
  -> 10.
- 10 hide-and-seek (Willelda 1000242 route contact, public row 712 VERIFIED):
  HOLD - three child Parleys (Nicoliaux, Ryd, Elyn) with no Parley subsystem
  server-side. Talk holds ("children are still hiding"), never advances.
  Win flags 0-2 await a future Parley result hook (newly assigned - marked).
  Fourth event/title variant unmapped (marked).
- 14 Aunillie (A'naidjaa): `processEvent025_2` -> 15.
- 15 gather (A'naidjaa): grants Colorful Building Blocks (11000029) ->
  `processEvent030` -> 20.
- 20 blocks (Nogeloix, 1000597, public row 150 VERIFIED): consume blocks,
  `processEvent040` -> 25.
- 25 package (Nogeloix): grants Sable Salve (11000027), `processEvent050`
  -> 30.
- 30 Roost (Marcelloix, 1000596, candidate - NO spawn rows, VERIFIED):
  `processEvent055` ask-gated (late private scene, marked) -> 35.
- 35 cure + reward: V'korolon (1000458, public row 576 VERIFIED) consumes
  salve (`processEvent060`, sets cured flag); A'naidjaa finale
  (`processEvent070`) requires cured flag, single CompleteQuest, AddExp(3420).
- `onFinish`: consumes leftover blocks/salve. Six route scenes play in
  numeric order across talkable states (marked).

## Delegate events (VERIFIED)

`processEventANaidjaaStart`, `processEvent010/020/025_2/030/040/050/055/060/
070`.

## ENPC IDs (VERIFIED)

A'naidjaa (public), Willelda (public), Nogeloix (public), Marcelloix NONE,
V'korolon (public). Youngling actors all unresolved (marked).

## Markers (RECOVERED)

11030101/03 (watch/supervise), 11030105/06/07 (hide), 11030104 (Aunillie),
11030108 (gather), 11030109/10 (blocks), 11030110 (package), 11030111
(roost), 11030112/13 (cure).

## Counters/flags (VERIFIED)

Flags 0-2 (Parley wins, newly assigned), 3 (cured). No counters.

## Journal hooks (VERIFIED)

Hide state: `(seq, parleysWon, 0,0,3)`; else zeros.

## Delivery mechanics (VERIFIED)

Blocks/salve verified grants, consumption gates, cure-then-finale ordering.
No gathering nodes (blocks granted by A'naidjaa).

## Rewards (VERIFIED)

Script EXP 3420. Central: 30000 gil + 3000 marks. No Sugarloaf Hat (era
unresolved). No double-grant.

## Prereq chain

Carpenter 30 + 110300 (enforced). Feeds Wdk306.

## Kills

None.
