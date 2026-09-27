# 111225 Five Easy Pieces (Mnk0j5) — in-depth decomp

Monk 45, quest 5/6. Offer: Widargelt (1060032) at Little Ala Mhigo, Eastern
Thanalan zone 171 (1213.70, 251.528, 106.977, rot -0.128; spawn id 2484).
Requires MNK job + level 45 + PGL secondary 15 gate + completed 111224.
Optional non-advancing pre-talk with Erik (1060033, zone 175 spawn 2466).

Widargelt offers the war garb of the Fist of Rhalgr as a trial: four
temple-garb pieces hidden in chakra-sensing chests at four dangerous sites.
A fifth piece is withheld by tradition until the four are claimed. No battle,
no instance, no cutscene.

## Sequence / flags (server: job_quest_template.lua `Mnk0j5`)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Widargelt offer | `processEvent_WIDARGELT_Start`: talks 4-12 + 42-48; accept 14 + full armor-trial tail 48-57 / decline 13 |
| 0 | Briefing boundary | No route steps → `startGameplayBoundary` initializes flags/counter → seq 6 (offer currently closed: capture gate) |
| 6 | Four independent unordered coffer acquisitions | Each push: `getInteractionObjective` by actor 1200161 + uniqueId → grant-then-persist → `processEvent_getAF_info(item)` (event-owner scheduler + item widget; server selects the item) → set saved bit + recompute counter. Fourth acquisition completes in place (`completionOwner = "interaction"`; NO return to Widargelt — contrast Whm0j5) |

Saved flags 0-3 (one bit per coffer) + counter 0; order-free. Journal: Wil
552 (four destinations) / 553 next notice (Erik 50).

## Dialogue (recovered DAT mnk0j5.csv, EN)

- Offer 9-12: "I have traveled far and wide. ... You have a gift." / "Help
  us reclaim our home." / "Look upon my garments. This is the war garb of
  the monkhood." / "It attunes to its wearer. It empowers the chakra."
- 49/50 (destinations): "Dzemael Darkhold, south and west of Camp Dragonhead
  ... The U'Ghamaro Mines, north and east of Camp Iron Lake ..." /
  "Turning Leaf, south of Camp Crimson Bark ... Cape Deadwind, south and
  east of the city of Ul'dah."
- 51/52: "I have hidden your garb in these places. ... There are great
  dangers. This is to be your test." / "Each garment rests within a chest.
  These are no ordinary chests. They sense the chakra of man. At the coming
  of a worthy soul, they will open."
- 53/54: "This trial will yield but four pieces. There is a fifth. I hold
  it." / "Only after the four are taken can the fifth be given."
- Erik pre-talk 2,3,32,33,38,39,59: contextual only (no advancement).

## Objectives / markers (DAT quest_marker; all display 4000257 = area)

| Marker | Zone | X/Z | Destination |
|---|---|---|---|
| 11221401 | 231 Dzemael Darkhold | -74.510002 / 392.070007 | Darkhold, SW of Camp Dragonhead |
| 11221402 | 137 U'Ghamaro Mines | 96.959999 / -2692.709961 | Mines, NE of Camp Iron Lake |
| 11221403 | 153 West Shroud | -1528.0 / 280.01001 | Turning Leaf, S of Camp Crimson Bark |
| 11221404 | 174 Southern Thanalan | 118.059998 / 542.619995 | Cape Deadwind, SE of Ul'dah |

Marker→item binding is NOT in the client (server selects the item). Adopted
server-policy mapping, corroborated by 1.0 walkthrough reconstruction (NOT
list-order-derived, NOT retail-authoritative): Darkhold 8071402 Temple
Gloves / U'Ghamaro 8051402 Temple Gaskins / Turning Leaf 8013502 Temple
Circlet / Deadwind 8081802 Temple Boots. All four item IDs verified in
gamedata_items.sql.

## Positions (coord guide; all four sites UNRECORDED — capture gate)

`locate` per guide "Agent workflow" + "All-zone interface" (explicit `--page`
in multi-page zones; `--recording` selects exactly one source):

| Site | Live in-selection | Nearest recorded | Premerge/frozen |
|---|---|---|---|
| 231 p2900 (-74.51, 392.07), map (4.85, 7.76) | 0 | `!pos 231 -63.883 200.462 306.256` (~86u) | Dzemael frozen snapshot: 0 (~89u) |
| 137 (96.96, -2692.71), map (6.39, 7.95) | 0 | ~98u | n/a (no premerge 137) |
| 153 (-1528.0, 280.01), map (15.76, 40.88) | 0 | ~1241u | n/a |
| 174 (118.06, 542.62), map (28.05, 36.15) | 0 | ~1115u | premerge 174: 0 (~1115u) |

Per guide ("Generate placements": the planner "never expands" a selection
and "never invents ground XYZ"; "locate keeps center Y unresolved"): NO
public Y/rotation may be authored from these distances. Eventnpc rows
3383-3386 carry exact X/Z with Y=0.0/rot 0.0 placeholders explicitly marked
CAPTURE-GATED, and the template row has objectives + `completionOwner` but
NO `offer` until live `!pos` capture fills them. Darkhold coffer additionally
needs quest-visibility inside the Darkhold content (follow-up with
DzemaelManager; do NOT attach to regular/relic chests). Capture checklist:
stand each marker, `!quicknavmesh start/sample/stop/save`, record Y/rot.

## Coffers (private adapter)

- Only coffer actor class in gamedata is 1200161
  (`/Chara/Npc/Object/GuildleveBonusTreasureBox`). All four objectives share
  it → template matches by uniqueId (`mnk0j5_darkhold_coffer`,
  `mnk0j5_ughamaro_coffer`, `mnk0j5_turning_leaf_coffer`,
  `mnk0j5_deadwind_coffer`; SQL uniqueIds identical).
- No public-spawn credit risk: pushes require eligibility + seq 6 + exact
  uniqueId + unclaimed bit; all other pushes `EndEvent` with no effect.

## Triggers / edge handling

Eligibility gates (offer + MNK45 + prereq 111224 + PGL15) on
offer/state/push/journal. Grant-before-persist (inventory-full failure
retries without consuming the bit). Repeat push suppressed (bit check).
Unknown uniqueId / wrong actor (incl. display 4000257) / wrong sequence
rejected. Preowned item not duplicated (HasItem short-circuit). Counter
recomputed from persisted bits (stale counters ignored). Abandon wipes
flags with the quest (re-run safe). Party members cannot claim each other's
bits (Player-owned quest data). No instance, no chocobo surface (no content
entry exists), no sync (interactions only). No cutscene (no skip surface).

## Rewards

Four Temple pieces via the coffers themselves (no separate grant) + Exp
5340 (template-standard). Fifth piece (Temple Cyclas 8032702) is the 111226
finale reward, not this quest.

## Sources

DAT mnk0j5.csv dialogue; DAT quest_marker rows 11221401-04;
gamedata_actor_class row 1200161; gamedata_items rows 8013502/8051402/
8071402/8081802; Erik/Widargelt spawn rows 2466/2484; 1.0 quest page (Five
Easy Pieces objectives/rewards); Garlemald issue #130 reconstruction
(item↔location binding); map_coordinates locate 231/137/153/174 (+ premerge
174, Dzemael frozen 231).
Validator `tools/validate_job_mnk0j5_route.py` PASS.
