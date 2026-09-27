# Wdk200 - The Mouths of Babes (110300) - VERIFIED (HOLD-gated)

- SQL (VERIFIED): `(110300, 'The Mouths of Babes', 'Wdk200', 0, 20)`.
- Availability (VERIFIED): disabled. Script HOLD `WDK200_OFFER_ENABLED`.
- Script: `Data/scripts/quests/wdk/wdk200.lua` + `wdk_quest_helpers.lua`.

## Sequence flow (VERIFIED, recovered numbering 0/5/10/12/15/20)

- 0 lesson (A'naidjaa, 1000465): grants Vibrant Arrows (11000026) if not held,
  `processEvent010` -> 5.
- 5 arrows (Wybir, 1000556, candidate - NO public spawn, VERIFIED zero rows):
  bare advance on delivery (no recovered scene, marked): consumes arrows,
  grants Splintered Bow (11000061) -> 10.
- 10 branch search: NO ENPC (three ??? objects have no callbacks). Branch art:
  Blooming 11000062 / Supple 11000063 / Sturdy 11000064 (all RECOVERED).
  Discovery accounting: held branches -> persisted engine counters 2/3
  (blooming/supple) + sturdy flag (recovered DAT slots 4/5 exceed the four
  persisted counters 0-3, so flags mirror them; value mapping unresolved -
  marked).
- 12 repair (Wybir): discoveries derived from held branches; suitable repair
  is the BLOOMING branch/bow (walkthrough-confirmed: Wybir accepts Blooming,
  rejects Sturdy/Supple - RECOVERED). Wrong-bow talks hold with refusal, never
  advance. Bow recipes + slot-5 outcome mapping unresolved (marked). Bows are
  held-count (not snapshot-diff): documented work slots leave no free baseline
  slots and the bows are quest-only (marked). Suitable repair:
  `processEvent020` ask-accepted -> consume Blooming Branch, set suitable flag,
  `processEvent025` -> 15.
- 15 showing (Wybir): consume Blooming Bow (11000058), `processEvent030`
  -> 20.
- 20 report (A'naidjaa): `processEvent040`, single CompleteQuest,
  `AddExp(1760)`. No Iron Saw (era unresolved). Marcelloix meeting is
  scene-internal to 040 (marked).
- `onFinish`: consumes all leftover quest items (arrows, splintered/bows,
  branches). After-warp scenes (wdk20010/20) wired as plain delegate scenes
  (no private-area owner - marked).

## Delegate events (VERIFIED)

`processEventANaidjaaStart`, `processEvent010/020/025/030/040`.

## ENPC IDs (VERIFIED)

A'naidjaa 1000465 (public row 675, zone 206). Wybir 1000556: NO spawn rows
(VERIFIED) - states 5/10/12/15 cannot resolve; core HOLD blocker.

## Markers (RECOVERED)

11030001 (lesson), 11030002 (arrows), 11030003 (search/repair), 11030004
(showing), 11030005/06 (report).

## Counters/flags (VERIFIED)

Counters 2/3 (blooming/supple discoveries), flags 0 (sturdy discovery),
1 (suitable repair).

## Journal hooks (VERIFIED)

Search: `(seq, branchesHeld, 0,0,3)`; repair: `(seq, bloomingBowHeld, 0,0,1)`.

## Gather/craft mechanics (VERIFIED design)

Branches are quest-only items (no recipe); bows likewise. Bow-repair recipes
unregistered - HOLD blocker. No gathering nodes; synthesis credit design
(snapshot-diff) documented in helpers but Wdk200 bows use held-count
(marked exception).

## Rewards (VERIFIED)

Script EXP 1760. Central: 20000 gil (dat-old) + 2000 Carpenter marks
(1000113). No double-grant.

## Prereq chain

Carpenter 20, no chain. Feeds Wdk300.

## Kills

None.
