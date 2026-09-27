# War0j4 deep decomp: Looking the Part (111204, Lv45)

JOB WAR war-b, 2026-09-27. Dialogue/delivery quest: four unordered AF coffers.

## Sources

- `war0j1-war0j6_deep_decomp_2026-09-27.md` (War0j4 HOLD section)
- `marker-evidence`: 11220301-04 (X/Z + map regions/areas only; every
  display is 4000257 = ??? with no actor class, Y, or rotation)
- `docs/Dat Mining/war0j4.csv`; AF item rows in `gamedata_items.sql`
  (8051403 Breeches, 8071403 Gauntlets, 8081803 Jackboots,
  8013503 Burgeonet)
- Fandom 1.0 journal: Cutter's Cry in northern Thanalan; Natalan in
  the Coerthas central highlands; Turning Leaf in the West Shroud;
  Craneperch Tower in lower La Noscea; ~5,340 EXP (Marauder);
  requires WAR45 + GLA15; fourth coffer completes in place
- Repo docs: Natalan = zone 143; Turning Leaf = zone 153 (West
  Shroud); Lower La Noscea = zone 128; Cutter's spot = zone 173

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Curious Gorge (`processEventCURIOUS_GORGE_Start`, ordinary fade, no warp) | NPC |
| 6 | Four independent coffer talks (`processEvent_getAF_info(item)`) | World |
| done | Fourth coffer completes (EXP 5340; no return state recovered) | - |

Persisted: flags 0-3 (one per coffer), counter 0 (opened count).

## Coffers (map_coordinates placements)

| # | Destination | Marker/X/Z | Zone | Y | Confidence |
| --- | --- | --- | --- | --- | --- |
| 1 | Cutter's Cry | 11220301 28.74/-1674.01 | 173 Northern Thanalan | 280.4 | MEDIUM (node 4578 ~104u; identical X/Z to BRD's authored spot) |
| 2 | Natalan | 11220302 546.49/-154.67 | 143 Coerthas Central Highlands | 301.6 | HIGH (87 recorded pts in selection; node 8066 1.6u) |
| 3 | Turning Leaf | 11220303 -1596.22/162.98 | 153 West Shroud | 0.1 | LOW (zone certain; ground ~1.1km; VERIFY) |
| 4 | Craneperch Tower | 11220304 681.90/553.73 | 128 Lower La Noscea | 45.4 | HIGH (42 recorded pts in selection; node 1411 4.9u; 0 pts in 129/130) |

All use standard coffer actor 1200161 (GuildleveBonusTreasureBox,
talkDefault; no push conditions, so the engine uses talk + zone/
proximity resolution). Marker-to-item zip (Breeches/Gauntlets/
Jackboots/Burgeonet in marker order) is adapter policy: DAT proves
the sets, not the pairing.

## Anti-loophole rules (implemented)

Zone + 25-unit proximity binding per objective (a random public coffer
cannot credit); per-coffer persisted flags (no double-open);
grant-before-persist with inventory-full retry (no lost items);
duplicate-safe completion (eligibility + completed checks); push can
never advance; abandoned/reacquired quests reset flags while kept
pieces re-credit without duplication.

## Implementation

Standalone `war0j4.lua` + `war_standalone_engine.lua` + 4 spawn rows
(3266-3269, verified free in base + all live migrations) in the WAR
migration. m1/m3 Y flagged VERIFY (GM nudge + UPDATE if needed;
logic uses 2D proximity only). Shared template row stays HOLD
(untouched); availability annotation upgraded to Implemented.
