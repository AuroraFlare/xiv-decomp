# 110320 An Ear for Quality (Bsm200) — decomp

- Class quest, Blacksmith (30) / Armorer (31), level 20. Type: Non-Combat.
- Offer: Bodenolf 1000144 (public, zone 230). Branch locks at accept; the
  locked branch selects recipes, recipe-giver NPCs, markers, and marks.
- Prerequisite: none (chain head; unlocks 110321 per archive A1).

## Sources (all inspected)

- DAT `docs/Dat Mining/bsm200.csv` (89 text rows; EN dialogue + branch
  `$E4($E8(1),1)` switches + `@SHEET(itemData,...)` refs) — briefing,
  per-piece tasks, recipe-giver names (Iofa row 64, Trinne row 71,
  Syngsmyd DE row 73), material vendors (Smydhaemr/Joellaut rows 56/89).
- DAT `quest.csv` row 110320 (level 20); `quest_marker.csv` 11032001-20
  (01-09 MapMarkerQuest, 10-20 filler at -431,187).
- DAT `actorclass.csv` col 6 = displayId; `xtx_displayName.csv` names;
  `xtx_itemName.csv` quest-item names; `xtx_negotiationTable.csv` (no
  Bsm200 titles — no Parley, correct).
- Archive A1 `docs/ffxiv-1.0-wiki/pages/An_Ear_for_Quality.html`
  (2013-01-26 snapshot): Non-Combat, ~20,000 gil, ~2,000 EXP, Naldiq &
  Vymelli's Linkpearl, Bodenolf issuer, guild-instance note, branch
  recipe split, wrong-branch craft does not trigger (1.22c).
- GamerEscape live page (same lineage; obsolete-quest category).
- YouTube V3 `https://www.youtube.com/watch?v=E2SgM_weO2I` (1.23b BSM/ARM
  cutscenes) — flow reference only, never positions/actors.

## Sequence flow (recovered numbering 0/5/7/8/9)

- ACCEPT at Bodenolf (`processEventBodenolfStart`; DAT rows 30-32 join
  prompt). Branch = current class locks.
- 0 briefing: Mimidoa (`processEvent005`? NO — 005 is the first handoff;
  the briefing advances bare). Baseline snapshot at accept.
- 5 case: forge branch case → Mimidoa turn-in plays `processEvent005`
  (first crafting handoff) → 7.
- 7 trembler: branch giver talk (Iofa BSM / Trinne ARM, bare, sets recipe
  flag 0) → forge → Mimidoa turn-in, bare advance (no scene maps 7→8) → 8.
- 8 coil: giver (Colson BSM / Syngsmyd ARM, flag 1) → forge → Mimidoa
  turn-in plays `processEvent010` (instrument test) → 9.
- 9 horn + report: giver (Sosoze BSM / Hihine ARM, flag 2) → forge →
  Mimidoa with ALL FOUR parts plays `processEvent020` (final reward):
  consume 4, branch marks 2000, EXP 2000, gil central. Complete.

Parts are kept until the finale (commission delivery; walkthrough shows
a single completion talk). Traded parts credit (snapshot-diff +
possession double-check; etc-delivery precedent). Wrong-branch crafts
never credit (branch-locked part IDs; A1 corroborates).

## NPCs (display→actor via actorclass col 6; spawns verified in SQL)

| NPC | Actor | Display | Zone | XYZ | Spawn row |
|---|---|---|---|---|---|
| Bodenolf (offer) | 1000144 | 2200064 | 230 public | -500.06, 42.8, 416.06 | id 306 |
| Mimidoa (brief/all turn-ins/finale) | 1000176 | 1400012 | 230 public (NEW id 3382) | -483.67, 44.5, 404.51 | markers 01/02/03 DAT-exact |
| Iofa (BSM trembler recipe) | 1000135 | 1100138 | 230 public | -490.59, 42.8, 420.71 | id 304 = marker 04 |
| Colson (BSM coil recipe) | 1000266 | 1000073 | 230 public | -479.56, 41.5, 437.14 | id 373 = marker 05 |
| Sosoze (BSM horn recipe) | 1000265 | 1500071 | 230 public | -476.17, 41.5, 436.86 | id 372 = marker 06 |
| Trinne (ARM trembler recipe) | 1000268 | 1300093 | 230 public | -474.72, 41.51, 431.37 | id 375 = marker 07 |
| Syngsmyd (ARM coil recipe) | 1000177 | 1600195 | 230 public | -502.44, 42.5, 436.76 | id 332 = marker 08 |
| Hihine (ARM horn recipe) | 1000267 | 1500052 | 230 public | -475.29, 41.5, 436.08 | id 374 = marker 09 |
| Smydhaemr (BSM materials vendor) | 1001458 | 1600172 | 230 public | -482.08, 44.5, 403.33 | id 377 (ambient) |
| Joellaut (ARM materials vendor) | 1000163 | 1200058 | 230 public | -482.91, 41.53, 438.15 | id 329 (ambient) |

Branch giver chains (positional by marker order 04/05/06 + 07/08/09,
gld200 precedent; marked authored): BSM Iofa→Colson→Sosoze,
ARM Trinne→Syngsmyd→Hihine. DAT names Iofa/Trinne/Syngs directly;
Colson/Sosoze/Hihine bind by marker display + position.

## Markers (DAT wounds, branch-aware use marked authored)

- 01 offer/brief, 02+03 case (all Mimidoa) — returned as recovered.
- 04-09 giver markers — returned branch-aware (one giver + 02 Mimidoa
  turn-in per stage). Filler 10-20 never sent.

## Objectives / journal

- States 0/5/7/8/9; `getJournalInformation` returns (seq, min(gain,1),
  0, 0, 1) on craft stages (shape kept; DAT checklist mapping unknown).
- Recipe flags 0/1/2 gate turn-ins (must visit giver); cleared on
  re-accept (Hrv300 precedent). Counters: 0 rolling baseline, 1 branch.

## Instance / territory / spawns (guide-used)

- Retail runs a guild-area instance (A1 walkthrough). No Bsm200 private
  area/SQB is recovered, so the server routes all talks to public zone
  230 spawns (Tan200/Cul200 precedent; marked).
- `map_coordinates.py locate --zone 230 --page 900 --world -483.6 404.42`:
  map (7.32, 7.24) = archive "Limsa Lominsa (7-7)"; 139 recorded points
  in 30 ylm; node 436 (-482.63, 44.50, 405.12) 1.2 ylm off at balcony
  height → public Mimidoa Y=44.5 grounded ("above the stairs" ✓).
- No chocobo handling needed: zero mount APIs in quest files (validator
  enforced); engine `IsMountRestrictedArea` covers private areas.

## Mobs / triggers / sync / lockouts

- None. Zero `KillBNpc|SpawnMonster|onKill` (crafting-pack audit).
  No level sync (non-combat; min-level gate only). No lockout, no
  timeout; one-time quest (completion bit gates 110321).

## Rewards

- Gil 20000 central (lowest of the 26000/23000/20000 DAT variants;
  archive corroborates ~20,000). Marks 2000 branch-correct script-side
  (central Currency rows autoGrant=0 — central cannot branch).
  EXP 2000 script-side (post-1.20 maximum, A1 corroborated).
- NOT granted: Crowsbeak Hammer / Iron Raising Hammer (era unresolved),
  Naldiq & Vymelli's Linkpearl (no item ID in xtx_itemName — gap).

## Gaps (all minor; quest enables)

- Linkpearl reward ID unrecoverable (no grant; documented).
- Marker↔sequence binding is range-only (branch-aware use authored).
- Retail instance presentation (server routes public; marked).
