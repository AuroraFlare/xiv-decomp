# Legends Adrift — Man1l0 (110003, Lv 8)

- Prereq: 110002. Next: Man2l0. Availability: enabled (instance).
- Accept: SEQ_ACCEPT on Baderon with return-position guard
  (`AcceptQuest` fail → reposition + EndEvent; after-warp fade contract).

## Sequence flow (verified)

ACCEPT → 0 (adv-guild echo; trigger → 10) → 10 (Baderon → 20 + public warp) →
20 (Waekbyrt → 30 + MRD private) → 30 (trigger → 40 + reposition) → 40
(trigger → LS → 50) → 50 (LS → 60) → 60 (FSH trigger → 70) → 70 (SeaFld
trigger → LS → 80) → 80 (LS → 90) → 90 (P'tahjha → 100 + ACN private) → 100
(lower trigger → 110 + reposition) → 110 (upper trigger → LS → 120) → 120
(Baderon `processEvent2002_2` chatter; LS → 122) → 122 (reward + CompleteQuest
with overkill guard + 15000 gil + 300 exp).

## Delegate events (verified): `processEvent200/210/215[_2]/400[_2..7]/
410[_2..5]/420[_2]/600/600_2/610/610_2/2000[_2..12]/2001/2002[_2]`,
`processEventComplete`, `sqrwa`.

## ENPC IDs (verified)

Baderon 1000137, Y'shtola 1000001, adv-guild adventurers 1000101–1000105,
Waekbyrt 1000003, cuda knights/pirates 1000087–1000190, N'nmulika 1000153,
Sisipu 1000156, ACN cast (P'tahjha 1000150, Merodaulyn 1000008, assessors,
pirates 1000115–1000868), triggers 1090006/1090080–1090084, fixes
Estrilda 1000273, Pfynhaemr 1000060.

## Markers (verified): 11000301–11000310 (311–320 zero-filled spares).

## Counters/flags: none.

## Journal hooks: marker list with private/public splits.

## Rewards (verified): 15000 gil + 300 exp, single CompleteQuest.

## Mob profiles / spawn evidence: none — no kills.

## Instance / scene surface

- NEEDED: adv-guild/MRD/ACN echo copies, FSH/SeaFld triggers.
- EXISTING: private-area warps; no combat director (none needed).

## Prior decomp references

- `docs/level_8_city_main_quests_decomp_2026-07-07.md`

## Open gaps

- SEQ_120→122 LS handoff relies on `StartSequenceForNpcLs`; crash-between
  recovery is LS-retry only (documented pattern, not a proven retail rule).
