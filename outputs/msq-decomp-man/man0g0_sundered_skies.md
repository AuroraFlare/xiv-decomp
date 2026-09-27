# Sundered Skies — Man0g0 (110005, Lv 1, Gridania opening)

- Prereq: none (granted on character creation). Next: Man0g1 (ReplaceQuest at adv-guild push).
- Availability: enabled (`110005 ... Man0g0`).

## Sequence flow (verified from Lua)

| Seq | Trigger | Effect |
|-----|---------|--------|
| 0 | onStart | Yda/Papalymo intro. Flags 0 (Yda talked), 1 (Papalymo), 2 (Yda again), 3 (target-started). Yda push → `processTtrNomal002`; talk → `processTtrNomal003`; then Papalymo `processEvent000_2`; Yda again → combat tutorial. |
| 5 | Yda 3rd talk | Combat tutorial instance (see below); quest data cleared. |
| 10 | Post-combat | Gridania section; adv-guild push → `ReplaceQuest(Man0g1)`. T'kebbe optional (flag 0). |

## Delegate events (verified): `processTtrNomal001withHQ/002/003`,
`processEvent000_2/3`, `processEvent010_1`, `processEvent020_2..6`, `processTtrBlkNml001`.

## ENPC IDs (verified)

Yda 1000009, Papalymo 1000010, combat copies 2290006/2290005 (referenced, not
spawned here), Farrimond 1000017, Cecilia 1000683, Swethyna 1000680,
T'kebbe 1000876, Lonsygg 1000951, pushes 1099046/1099047, 14 guild bystanders
1000427–1001184 + 1700001.

## Markers (verified): 11000502 (Yda), 11000503 (Papalymo), 11000504 (guild).
11000501 obsolete pre-1.19 (comment states).

## Counters/flags: flags 0–3 only.

## Journal hooks: marker list only.

## Rewards: none.

## Mob profiles / spawn evidence: none in script; combat tutorial owned by director.

## Instance / scene surface

- NEEDED: intro staging, combat tutorial battlefield, Gridania phase.
- EXISTING (verified): `Quest/QuestDirectorMan0g001` via `...("man0g01",
  "SimpleContent30010", ...)`, entry (362.4087, 4, -703.8168) rot 1.5419.

## Prior decomp references

- `docs/starter_city_opening_quests_decomp_2026-07-05.md`

## Open gaps

- Combat-tutorial enemy roster unrecovered (director-side). No battle invented here.
