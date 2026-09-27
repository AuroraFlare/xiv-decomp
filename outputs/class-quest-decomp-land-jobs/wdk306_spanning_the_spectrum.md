# Wdk306 - Spanning the Spectrum (110302) - VERIFIED (HOLD-gated)

- SQL (VERIFIED): `(110302, 'Spanning the Spectrum', 'Wdk306', 110301, 36)`.
- Availability (VERIFIED): disabled. Script HOLD `WDK306_OFFER_ENABLED`.
- Script: `Data/scripts/quests/wdk/wdk306.lua`. No journal/walkthrough
  archive recoverable (marked); route is metadata-only throughout.

## Sequence flow (VERIFIED, recovered numbering 0/5/10/12/13/14/15/20/25/28)

- 0 prep (Marcelloix, candidate unspawned): snapshots leaf/fetish baselines,
  `processEvent010` -> 5.
- 5 supplies: needs 10x Large Leaves (11000066, Acorn Orchard gathering -
  nodes unregistered, marked) + 10x Fairweather Fetishes (11000065, recipe
  unregistered, marked); stage-time snapshot-diff credit (marked);
  `processEvent020` -> 10.
- 10 scouting (Nonolato, 1000463, public row 699 VERIFIED): grants Petition
  (11000028), `processEvent023` -> 12.
- 12 route (Wybir, unspawned): positioned rendezvous `processEvent025` -> 13.
- 13 arrows (Wybir): HOLD - ally-shooter route has no driver (enemy
  roster/count, arrow recipe/delivery callbacks, ally-failure callbacks,
  route transforms all missing). Never advances (marked).
- 14 clear (A'naidjaa): `processEvent030` -> 15.
- 15 excursion (Marcelloix): `processEvent040` -> 20.
- 20 children: collapsed to Ryd (1000412, public row 2137 guild-side, NOT at
  the Mirror - marked positioning), `processEvent050` -> 25.
- 25 drawings (Ryd): `processEvent055` ask-gated -> 28.
- 28 artwork (Marcelloix): `processEvent060`, consumes nothing (no artwork
  item documented - marked), single CompleteQuest, AddExp(4720).
- `onFinish`: consumes leaves/fetishes/petition leftovers.

## Delegate events (VERIFIED)

`processEventMarcelloixStart`, `processEvent010/020/023/025/030/040/050/055/
060`.

## ENPC IDs (VERIFIED)

Marcelloix NONE, Nonolato public, Wybir NONE, A'naidjaa public, Ryd public
(guild-side only).

## Markers (RECOVERED)

11030201 (prep), 11030202 (supplies), 11030203 (scouting), 11030204
(route/arrows), 11030206 (clear), 11030207 (excursion + children),
11030209 (children/drawings), 11030208/10 (artwork).

## Counters/flags (VERIFIED)

Counters 0-1 (leaf/fetish baselines). No flags.

## Journal hooks (VERIFIED)

Supplies state returns fetish net gain only (`(seq, gain, 0,0,10)`); leaves
tracked in delivery gate but not journaled (INFERRED gap: single-line
journal vs two-item gate; DAT cells unrecovered so left as-is, flagged).

## Gather/craft mechanics

Snapshot-diff on leaves + fetishes at the preparation talk (marked). Leaf
nodes + fetish recipe unregistered - HOLD blockers. Recovered directors
empty (no content owner).

## Rewards (VERIFIED)

Script EXP 4720. Central: 36000 gil + 3600 marks (top variants; raw variant
rules unresolved - marked). No double-grant.

## Prereq chain

Carpenter 36 + 110301 (enforced). Terminal Carpenter quest.

## Kills

None (Wybir shoots; the player supplies arrows and kills nothing - marked).
