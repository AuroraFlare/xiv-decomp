# FF14 1.0 Conjurer class quests — decomp record

Compiled: 2026-09-26. Covers the full retail 1.0 Conjurer line:
110260 Dendrological Duties, 110261 Good Knight, Sweet Dreams,
110262 The Call of Nature. Quests 110263-110265 (Cnj400/500/506)
are unreleased stubs (proof below) and stay hidden probes.

Per-quest implementation notes live in
`cnj200_dendrological_duties_2026-09-26.md`,
`cnj300_good_knight_sweet_dreams_2026-09-26.md`, and
`cnj306_call_of_nature_2026-09-26.md`. This file is the shared
decomp evidence: actors, markers, scenes, placements, and
approximations.

## Quest list and status

| Quest | Title | Rank | Status |
|---|---|---|---|
| 110260 (Cnj200) | Dendrological Duties | 20 | Implemented (driver) |
| 110261 (Cnj300) | Good Knight, Sweet Dreams | 30 | Implemented (driver) |
| 110262 (Cnj306) | The Call of Nature | 36 | Implemented (custom script) |
| 110263 (Cnj400) | Scenario: Cnj400 | 40 | Stub: all EN text `[en]`, all markers filler, 171-byte initText-only scenario decomp |
| 110264 (Cnj500) | Scenario: Cnj500 | 50 | Stub: same proof as Cnj400 |
| 110265 (Cnj506) | Scenario: Cnj506 | 56 | Stub: same proof as Cnj400 |

## Actor identities (DAT-verified)

Display names come from `docs/Dat Mining/xtx_displayName.csv`
keyed by graphic ID; actor classes come from
`docs/Dat Mining/actorclass.csv`.

- Soileine: actor 1000234 / display 1300064.
- Telent: actor 1000504 / display 1000415.
- Ingram: actor 1000372 / display 1000141.
- Morys: actors 1000505, 1000506, 2290033 — ALL display 1000175
  "Morys". Appearance rows: 1000505 and 2290033 share bytes
  (public/content pair, Sisipu-pattern); 1000506 differs
  (distinct look). Cast: 1000505 public talks, 2290033
  duty/escort content, 1000506 young Morys in the Echo cave
  (hypothesis, documented in the Cnj306 notes).
- Yuhelmeric: actor 1000370 / display 1200022 (name-verified;
  was a candidate, now confirmed). Reuses GC spawn id 3235
  (zone 145, 2550.82 / 175.35 / 1304.72).
- Newly Outfitted Knight: actor 1000573 / display 4000470
  (name-verified).
- Rabid Coywolf 2201408/3201407, Alpha Coywolf
  2201409/3201408 (Cnj200; pre-existing).
- Aspect elementals: 2204601 fire, 2204701 ice, 2204801 wind,
  2204901 earth, 2205001 lightning, 2205101 water (display
  3204601/3204701/3204801/3204901/3205001/3205101; all plain
  "[aspect] elemental"). Families run 01-06 per aspect plus
  woodsent/special entries; 2205201/3205201 is "spirit of the
  wood" (NOT a fire elemental) and belongs to Cnj306's
  pre-Echo dressing, not the Cnj300 duty.
- Yarzon Stalker 2205506/3205506; Furline Mosstrooper
  2280158-2280163/3280157-3280162 (six same-name variants, four
  used); Hungry Dreadwolf 2201412/3201411 AND 2201423/3201422
  (two same-name variants; 2201412 used per the GC-side
  precedent).
- Generic destination trigger 1000174 / display 4000257 "???".

## Markers and zones

From `docs/Dat Mining/quest_marker.csv`, zoned via
`tools/mobspawns/map_coordinates.py` and checked against the
1.0 wiki grid squares where published:

| Marker | Spot | Zone | Map square |
|---|---|---|---|
| 11026002 | Cnj200 battle | 150 Central Shroud | (38,29) |
| 11026101 | Lifemend Stump | 150 | (23,27) |
| 11026102 | Amberscale Rock | 150 | (25,32) |
| 11026104/11026105 | Owl's Nest | 145 E. Lowlands | (61,33) |
| 11026106 | Forest border | 152 North Shroud | (15,19) |
| 11026201/207/208 | Stillglade Fane | 206 Gridania | (2,1) |
| 11026203 | Camp Emerald Moss | 152 | (20,20) |
| 11026202/204/205/206 | Amberscale area | 150 | (25,32)/(25,33) |

11026108-11026120, 11026209-11026220, and all 110263-110265
markers are filler (Sthalmann/-431/187 rows). Contaminated
ranges stay pinned in the dormant template rows. Wiki-quoted
squares are (23,27), (25,32), (38,29), and (2,1); the rest are
DAT-marker derivations (no square is published for the Owl's
Nest, forest-border, Emerald Moss, or (25,33) legs).

## Scenes and mechanics (client scenario decomp)

Source: `tools/outputs/lpb/decomp_more_20260617/lua/quest/
scenario/cnj/cnj{200,300,306}.lua`, cross-read with the EN text
in `docs/Dat Mining/cnj{200,300,306}.csv`.

- Cnj300: SoileineStart (offer) → 010/cnj30010 (Lifemend) →
  010_2 (linkpearl reply, plain talk) → 015_1 (Morys duty
  briefing) → duty → 020/cnj30020 (aftermath, AfterWarp) →
  030/cnj30030 (Soileine) → 040/cnj30040 (Owl's Nest, AfterWarp)
  → 050/cnj30050 + ask 51030 result-1 gate (Echo) →
  060/cnj30060 (forest border) → 070/cnj30070 (reward).
- Cnj306: SoileineStart (offer) → 010/cnj30610 (Ingram + bag)
  → 020/cnj30620 → 025/ask-50 result-1 gate (escort request)
  → 030/cnj30630 (escort launch) → duty → 040/cnj30640
  (vanish, AfterWarp) → 045/ask-51030 result-1 gate (Echo) →
  050/cnj30650 (AfterWarp) → 060/cnj30660 (cave, AfterWarp) →
  duty → 070/cnj30670 (AfterWarp) → 080/cnj30680 (Ingram,
  bag return) → 095/cnj30690 (reward; 090 is the AfterWarp
  variant and is not staged).
- Unbound ambient events (005_x, 010_x, 020_x, 030_x, 040_x,
  050_x, 070_x families) have no owners and stay unbound, per
  the pinned lists in the dormant template rows.

## Video and wiki sources

- Gamer Escape (archived 1.0 pages): `Dendrological_Duties`,
  `Good_Knight_Sweet_Dreams` (+ walkthrough: six elementals as
  one group, Morys non-assist, linkpearl exit, Owl's Nest leg,
  Echo), `The_Call_of_Nature` (+ walkthrough: Ingram
  instance, escort HP-0/distance fails, Yarzon + Furline
  clearing, three Dreadwolves, bag).
- Final Fantasy Wiki `Conjurer_Quests_(version_1.0)`: journal
  states and reward maxima (1,760 / 3,420 / 4,720 EXP).
- YouTube `Fl5tkBuF9Yc` ("Final Fantasy XIV v1.23b:
  Conjurer/White Mage Story"): Dendrological Duties 0:00, Good
  Knight Sweet Dreams 3:10, The Call of Nature 17:55. Page
  fetches return only the player shell, so fight composition
  comes from the walkthroughs above; the video corroborates
  cutscene order.
- garlemald-server issues #79/#80 carry Mirke-transcript
  quest drafts (sequence shapes match the DAT states).

## Approximations (all documented in the per-quest notes)

- Retail instances (Stillglade briefing rooms, duty exits)
  play public except the two private duties per quest; DAT
  positions are exact, instancing is not.
- Cnj300's sequence-15 journal-data branch plays linearly
  (same observable order).
- Aspect strengths/weaknesses are not enforced (unrecovered).
- Cnj306's escort path is nav-authored, not a live capture
  and not a retail-path claim; the Echo defense has no
  protect-Morys failure rule (runtime limitation).
- Mob levels/copies/skill kits are reconstruction policy from
  the nearest implemented precedents, pinned in the validators.
- Estimated heights (Amberscale Y=5.0, forest-border Y=32.6)
  and all new-spawn rotations are scaffolds: correct after a
  live map capture. A 15-yalm collision audit of spawns
  3298-3306 found no conflicts (nearest neighbors are other
  quests' invisible triggers, same-floor guild NPCs, or the
  documented Arc200 fence-trigger adjacency).
- Retail gates the first quest behind plot quest Fade to White
  (110013) per the archive category page, but SQL prerequisites
  are 0 and the server does not gate class offers (Hrv200
  precedent), so none is enforced here.
- Seeds of Initiative (Soileine, 30) is the White Mage unlock
  (Whm0j1/111241, job-quest side), not a CNJ class quest.
- No chocobo content exists anywhere in the CNJ line: no
  chocobo actor, spawn, profile, or escort callback is added,
  machine-checked by the route validators.

## Verification

- `python -B tools/validate_cnj200_route.py` → PASS
- `python -B tools/validate_cnj300_route.py` → PASS
- `python -B tools/validate_cnj306_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- `python -B tools/validate_class_quest_mob_types.py` → PASS
- `python -B tools/validate_class_held_routes.py` → PASS
