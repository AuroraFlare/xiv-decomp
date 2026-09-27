# Hrv300 - The Grass is Always Greener (110481) - VERIFIED

- SQL (VERIFIED): `(110481, 'The Grass is Always Greener', 'Hrv300', 110480,
  30)`. Chain prereq 110480 (stub, unimplemented).
- Availability (VERIFIED): disabled (commented; listed Implemented).
- Script: `Data/scripts/quests/hrv/hrv300.lua` (bespoke, no template row, no
  shared helpers). No battle or private duty in the recovered scenario.

## Sequence flow (VERIFIED; server states mirror retail journal states)

- `SEQ_ACCEPT`: Opyltyl (1000236). NOTE (INFERRED): accepts on delegate result
  `nil OR 1` (`questAccepted == nil or questAccepted == 1`), looser than the
  land convention (`== 1`). Left as-is (offer-scene return semantics
  unverified; tightening could block legitimate accepts). Flagged, not
  changed.
- 0 Cicely assignment (1000326): `processEvent010` -> 5.
- 5 Penelope briefing (1700001): `processEvent020` -> 10.
- 10 Cicely exchange: `processEvent030` -> 11.
- 11 gather + turn in: needs Bowing Pine Branch (11000086) + Foul-smelling Nut
  (11000087); consumes both, grants Nostalgic Ink (11000085) -> 12. Gathering
  flags (counters 0-1) mirror DAT $E8(2)/$E8(3).
- 12 Penelope Parley window: intro talk stamps negotiation temp vars
  (recovered title 1301 + required ink 11000085; Man300 engine defaults
  3/12/20 difficulty/turns/time - documented defaults) and sets introduced
  flag; `onNegotiationResult` accepts a win only with ink in hand, grants
  Pirate Ship Tale (11000042), clears `negotiation.enabled`, -> 18. Ink never
  consumed by the Parley (DAT keeps it through state 19).
- 18 Cicely turn-in: consumes ink + tale, grants Meracydian Olives (11000135)
  + Letter to Nenekko (11000136) -> 20.
- 20 Nenekko delivery at Linette's marker: consumes olives only; letter
  presented but retained (DAT keeps it through 29). No delegate scene
  (INFERRED: none recovered; possession-check advance, marked) -> 25.
- 25 Nogeloix (1000597) then Linette (1000861) with the letter: order
  flag-enforced (`FLAG_NOGELOIX_DONE`, redirect message); Linette consumes
  the letter, grants Amajina Ceruleum (11000137) -> 30. ("Amajina Ceruleum is
  the miners' product, so Linette - not Nogeloix - grants it", marked.)
- 30 guild trigger push (1090046): consumes ceruleum, journal fanfare,
  -> 35. Does NOT despawn the shared MSQ actor (marked; unlike Exc300's
  dedicated valuables). ENPC flags are per-quest so the MSQ row is untouched.
- 35 Opyltyl reward: `processEvent040`, single CompleteQuest. No script EXP
  (DAT maximum 3420, scaling unresolved); gil + Botanist marks central.
- `onFinish`: empty. Abandon keeps quest items (standard behavior); chain
  must be replayed from 0 (INFERRED acceptable; matches Min200 precedent).

## Delegate events (VERIFIED)

`processEventOpyltylStart`, `processEvent010/020/030/040`. States 20/25 use
no delegate scene (marked). Parley via C# negotiation hook, not delegate.

## ENPC IDs (VERIFIED, all public spawns VERIFIED in main SQL)

Opyltyl 1000236 (row 547, zone 206), Cicely 1000326 (row 548, zone 206),
Penelope 1700001 (row 614, zone 155), Nogeloix 1000597 (row 150, zone 209),
Linette 1000861 (row 177, zone 209), guild trigger 1090046 (push, shared with
MSQ - per-quest flags only).

## Markers (RECOVERED, DAT quest_marker rows with coordinates)

11048101 (Cicely), 11048102 (Penelope), 11048104 (exchange), 11048105
(Nogeloix/olives, Ul'dah), 11048106 (letter, Ul'dah), 11048107 (guild
trigger, on the MSQ row), 11048108 (Opyltyl), 11048109 (branch area,
358.59,-697.45 Gridania), 11048110 (nut area, -193.99,-629.15). 11048103
replay-only, unbound. 11048111-20 filler.

## Counters/flags (VERIFIED)

Counters 0-1 (branch/nut obtained), flags 0 (parley introduced), 1 (Nogeloix
done).

## Journal hooks (VERIFIED, one REAL BUG fixed this phase)

- `getJournalInformation`: SEQ_011 returns live `(branch, nut, 0,0,2)`; else
  zeros. Correct.
- `getJournalMapMarkerList`: SEQ_011 and SEQ_025 returned Lua TABLES
  (`return {a, b}`). The engine path (`GetJournalMapMarkerList` ->
  `RequestQuestJournalCommand`: `unpack(mapMarkers)` +
  `filterForPlayer`/`ipairs` + `table.concat`) requires multiple return
  values; a single table return breaks qtmap for those states. FIXED to
  `return MRKR_AREA_A, MRKR_AREA_B` and
  `return MRKR_NOGELOIX, MRKR_LETTER`. Also fixed: non-qualified/unknown
  branches `return;` (nil) - tolerated by the filter (`copyMarkerList(nil)`
  -> `{}`), left as-is.

## Gather items + delivery (VERIFIED + SQL)

- Branch <- Bentbranch logging pool 20123 (zone 150, nearest node 27.5 yalms
  from area A); nut <- Humblehearth logging pool 20203 (zone 150, 115.7 yalms
  from area B, sparse corner documented). Neither item has legacy pool rows.
- Pool bindings migration-only (`live migrations/hrv300_route.sql`):
  `(20123, 11000086)`, `(20203, 11000087)` weight 100, sweetSpot NULL.
  Same main-SQL parity gap as Min200 (see min200 file). OPEN.
- Item plumbing: `grantOnce` (HasItem-guarded, no double-grant) and
  `consumeHeld` (presence-checked RemoveItem). No double-grant vs central SQL
  (central carries only gil 30000 + marks 3000). VERIFIED consistent.

## Rewards (VERIFIED)

Central: 30000 gil + 3000 Botanist marks (1000122). Script: no EXP/items.

## Prereq chain

SQL 110480 (stub). Botanist 30 enforced in-script (`CLASSID_BTN = 40`
VERIFIED in `global.lua`).

## Kills

None.
