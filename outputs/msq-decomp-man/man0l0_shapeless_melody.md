# Shapeless Melody — Man0l0 (110001, Lv 1, Limsa opening)

- Prereq: none (granted on character creation). Next: Man0l1 (ReplaceQuest from Hob).
- Availability: enabled (`110001 ... Man0l0` in quest_availability.lua main_scenario).

## Sequence flow (verified from Lua)

| Seq | Trigger | Effect |
|-----|---------|--------|
| 0 | onStart | Boat-interior basics tutorial. Flags 0–3 (talk minituts) + flag 4 (target-started). Rostnsthal push → `processTtrNomal002`; talk → `processTtrNomal003`; mini talks 1–3. Exit door push gated on flags 1+2+3. |
| 5 | Exit door accept | Combat tutorial instance (see below). Quest data cleared first. |
| 10 | Post-combat | Limsa port. Hob talk choice 1 → `ReplaceQuest(Man0l1)`. |

## Delegate / cutscene events (verified names)

`processTtrNomal001withHQ`, `002`, `003`, `processTtrMini001/002/003`,
`processEvent000_4..17`, `processEvent000_2` (exit confirm), `processEventNewRectAsk`,
`processEvent020_2/3/5/6/7/8/9/10/11`. No voice/scene IDs recovered — client method names only.

## ENPC IDs (verified)

1000438–1000451 (passengers), Rostnsthal 1001652, exit 1090025, Hob 1000151,
Gert 1500004, Lorhzant 1500005, deckhand 1000261, porter 1000260, privarea 1290002.

## Markers (verified): 11000202 (Hob), 11000203/204/205 (tutorial), 11000206 (door).

## Counters/flags: flags 0–4 only (fit engine contract; quest-counter-slots PASS).

## Journal hooks: `getJournalMapMarkerList` only; no `getJournalInformation`.

## Rewards: none (chain handoff quest).

## Mob profiles / spawn evidence: none — no kills. Combat tutorial mobs (if any)
are owned by the director below, not this script.

## Instance / scene surface

- NEEDED: boat-interior staging (SEQ_000, public/private ship area), combat
  tutorial battlefield, Limsa port phase.
- EXISTING (verified): `Quest/QuestDirectorMan0l001` via
  `CreateContentAreaForAllDisciplines(..., "man0l01", "SimpleContent30002", ...)`,
  entry `!pos`-style (-4.8, 16.35, 8.1) rot 0.2. No new surface invented.

## Prior decomp references (not duplicated)

- `docs/starter_city_opening_quests_decomp_2026-07-05.md`
- `outputs/starter-city-opening-quests-decomp-20260705/`

## Open gaps

- Tutorial client-method bodies (`processTtr*`) are client-owned; server only
  delegates. No retail verification of tutorial ordering beyond flag gating.
