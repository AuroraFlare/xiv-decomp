# Brd0j5 deep decomp: Pieces of the Past (111305, Lv45)

JOB BRD, 2026-09-27. Dialogue/delivery quest: four unordered AF coffers.

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111305 section)
- `marker-evidence.json`: 11225401-04 (X/Z only; no Y/rotation/actors)
- `docs/Dat Mining/brd0j5.csv`; AF item rows in `gamedata_items.sql`
- Fandom 1.0 journal: Cutter's Cry west of Camp Bluefog; Zahar'ak east
  of Camp Broken Water; Turning Leaf; cave south of Camp Iron Lake
- Repo docs: Iron Lake = zone 135; Turning Leaf = zone 153 (West Shroud)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jehantel (`processEvent_JEHANTEL_Start`, EQ pc139/0x445; ordinary 1s fade, no warp) | NPC |
| 6 | Four independent coffer talks (`processEvent_getAF_info(item)`) | World |
| done | Fourth coffer completes (EXP 5340; no return movie recovered) | - |

Persisted: flags 0-3 (one per coffer), counter 0 (opened count).
`_JEHANTEL_Follow` reiterates the places (reminder, not a stage).

## Coffers (map_coordinates placements)

| # | Destination | Marker/X/Z | Zone | Y | Confidence |
| --- | --- | --- | --- | --- | --- |
| 1 | Cutter's Cry | 11225401 28.74/-1674.01 | 173 Northern Thanalan | 280.4 | MEDIUM (node 4578 ~105u; outside zone-246 texture) |
| 2 | Zahar'ak | 11225402 2179.07/1022.85 | 174 Southern Thanalan | 296.1 | HIGH (47 recorded pts in selection) |
| 3 | Turning Leaf | 11225403 -1432.88/127.03 | 153 West Shroud | 0.1 | LOW-MED (zone certain; ground ~1.1km) |
| 4 | Iron Lake cave | 11225404 -477.06/-1557.28 | 135 Upper La Noscea | 80.0 | MEDIUM (zone certain; ground ~460u) |

All use standard coffer actor 1200161 (talkDefault; no push
conditions, so the engine uses talk + zone/proximity resolution).
Marker-to-item zip (Tights/Ringbands/Sandals/Chapeau in marker order)
is adapter policy: DAT proves the sets, not the pairing.

## Anti-loophole rules (implemented)

Zone + 25-unit proximity binding per objective (a random public coffer
cannot credit); per-coffer persisted flags (no double-open);
grant-before-persist with inventory-full retry (no lost items);
duplicate-safe completion (eligibility + completed checks).

## Implementation

Standalone `brd0j5.lua` + 4 spawn rows (3262-3265) in the BRD migration.
m3/m4 Y flagged VERIFY (GM nudge + UPDATE if needed; logic unaffected).
Shared template row stays HOLD (untouched).
