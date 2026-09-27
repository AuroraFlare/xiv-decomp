# Flowers for All — Man0u0 (110009, Lv 1, Ul'dah opening)

- Prereq: none (granted on character creation). Next: Man0u1 (ReplaceQuest at exit).
- Availability: enabled (`110009 ... Man0u0`).

## Sequence flow (verified from Lua)

| Seq | Trigger | Effect |
|-----|---------|--------|
| 0 | onStart | Merchant Strip tutorial. Flags 0 (Ascilia push), 1 (Ascilia talk), 2 (Farmhand), 3 (Mistress), 4 (target-started). Exit trigger push gated on flags 1+2+3; else blocker redirect. |
| 5 | Exit trigger | Combat instance on Sapphire Ave Exchange (below); data cleared. |
| 10 | Post-combat | Adv-guild area; Yayatoki optional flag; exit push → `ReplaceQuest(Man0u1)`. |

## Delegate events (verified): `processTtrNomal001withHQ/002/003`,
`processTtrMini001/002_first/002/003_first/003`, `processEvent000_*`,
`processEvent020_*`, `processEtc001/002/003`, `processTtrBlkNml001/002/003`.

## ENPC IDs (verified)

Ascilia 1000042, Warburton 1000186, Rururaji 1000840, crowd 1001490–1001496,
1001644, exit 1090372, stopper 1090373; SEQ_010: 1000401/1001042/1001044/
1001112/1001645/1001646/1001647, Yayatoki 1500129, exit 1099046.

## Markers (verified): 11000901–11000906.

## Counters/flags: flags 0–4 only.

## Journal hooks: marker list only.

## Rewards: none.

## Mob profiles / spawn evidence: none in script.

## Instance / scene surface

- NEEDED: Merchant Strip staging, Exchange combat tutorial, adv-guild phase.
- EXISTING (verified): `Quest/QuestDirectorMan0u001` via `...("man0u01",
  "SimpleContent30079", ...)`, entry (-17.7, 192, 37.7) rot 0.93.

## Prior decomp references

- `docs/starter_city_opening_quests_decomp_2026-07-05.md`

## Open gaps

- Rururaji chocobo-lender overlap noted in header (`PopulaceChocoboLender.lua`);
  no chocobo granted here (verified: no AddItem of any whistle).
