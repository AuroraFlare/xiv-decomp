# 110321 Song of the Sirens (Bsm300) — decomp

- Class quest, Blacksmith (30) / Armorer (31), level 30. Type: Non-Combat.
- Prerequisite: 110320. Offer: Bodenolf 1000144 (linkpearl call DAT row 1
  routes to the forge; offer scene `processEventBodenolfStart`).

## Sources (all inspected)

- DAT `docs/Dat Mining/bsm300.csv` (158 text rows) — full retail flow:
  Bodenolf call (1) → Mimidoa briefing (6-14: sirens, windwheel
  11000022, Amajina contract) → Ul'dah denial (15-16) → Mimidoa
  linkpearl (17-21: Nanawa parley for Seastone 11000023; DE row 20 also
  names Reverberating Steel 11000024) → Nanawa cave-in rescue (22-25,
  45-49: talk-to-calm, ore granted row 49) → supplies handoff (26-28) →
  Mimidoa gives windwheel (29) → ferry captain delivery + ride (30-39)
  → report + reward (40-44).
- DAT `quest_marker.csv` 11032101-20 (01-12 MapMarkerQuest, 13-20
  filler): 01/04/06 guild Mimidoa; 02 Linette/Ul'dah; 03 Z'ssapa/Nanawa
  entrance; 05 ferry captain/docks; 07/08 Nanawa interior (display ???);
  09 Limsa (display ???); 10/11/12 Nanawa miners.
- DAT `xtx_negotiationTable.csv`: SIX titles carry "Song of the Sirens":
  4201/4302/4401/4601/4702/4901 (six miners, three stages each per
  template `documentedParleys`).
- DAT `actorclass.csv` + `xtx_displayName.csv` identifications (see
  NPC table). Walkthroughs: Allakhazam (Nanawa/ferry beats; page fetch
  timed out, search snippet corroborates), GamerEscape 1.0 lineage,
  garlemald-server #88 (third-party plan only, not evidence).
- YouTube V3 (1.23b cutscenes) — flow only.

## Sequence flow (recovered numbering)

- ACCEPT Bodenolf → 0 Mimidoa briefing (bare) → 5 Linette/Ul'dah:
  denial (bare; no scene recovered) + linkpearl beat (NpcLS surface id
  unrecovered → authored message advance, marked) → 10/15 miner legs.
- 5/10/15 Nanawa miners: six opponents × three Parley stages = 18 win
  flags (0-17). Talk stamps board idempotently (Hrv300 pattern:
  `negotiation.*` temp vars + `SetNegotiatable`); `onNegotiationResult`
  self-filters (class/level/prereq, window seq, introduced flag, exact
  miner, stage order); loss → infinite retry message (retail rule);
  win → next stage re-stamp; miner complete → board cleared.
  Miner→title binding is positional by marker order (gld200 precedent,
  marked): Z'ssapa→4201, ???→4302, ???→4401, melancholy→4601,
  tear-struck→4702, disconcerted→4901. Pair completion advances
  5→10→15 (marked: DAT has no stage↔seq map).
- 20-24 Parley results → 25 material lead → 30 material choice
  (Seastone 11000023 vs Reverberating Steel 11000024; DE row 20 proves
  the alternative) → 35-39 second path → 40 windwheel → 45 report.
- CORRECTION (DAT rows 28-29): the player does NOT synthesize the
  windwheel — Mimidoa forges it and hands it over for delivery to the
  ferry captain. No windwheel recipe exists or is needed; the prior
  "recipe unrecovered" blocker is dissolved (grant-in-scene model).

## NPCs (display→actor via actorclass col 6)

| NPC | Actor | Display | Zone | XYZ | Spawn |
|---|---|---|---|---|---|
| Bodenolf | 1000144 | 2200064 | 230 public | -500.06, 42.8, 416.06 | id 306 |
| Mimidoa | 1000176 | 1400012 | 230 public (NEW id 3382, shared Bsm200) | -483.67, 44.5, 404.51 | markers 01/04/06 |
| Linette (Amajina & Sons) | 1000861 | 1100016 | 209 public (Ul'dah) | -92.38, 195.6, 313.43 | id 177 = marker 02 EXACT |
| Z'ssapa (Nanawa foreman) | 1000887 | 1900018 | 170 public (C. Thanalan) | 92.767, 183.826, -1030.44 | id 2464 ≈ marker 03 |
| melancholy miner | 1000697 | 4000209 | 176 (marker, NO spawn) | 305.45, ~167.6, -1247.18 | marker 10; gld200 Ul'dah row exists (other quest) |
| tear-struck miner | 1000692 | 4000204 | 176 (marker, NO spawn) | 306.73, ~167.6, -1222.86 | marker 11; NO spawn anywhere |
| disconcerted miner | 1000693 | 4000205 | 176 (marker, NO spawn) | 292.65, ~167.6, -1228.44 | marker 12; gld200 Ul'dah row exists |
| sprightly miner (alt display) | 1000698 | 4000210 | — | — | gld200 Ul'dah row; NO Nanawa link (not used) |
| full-maned ferry captain | 1000539 | 4000212 | 230 docks (marker, NO spawn) | -823.76, ?, 191.84 | marker 05; NO spawn anywhere |
| miner ??? (marker 07) | UNKNOWN | 4000257 | 176 (302, -1228) | — | display ???; actor unidentified |
| miner ??? (marker 08) | UNKNOWN | 4000257 | 176 (303.67, -1181.87) | — | display ???; actor unidentified |
| ??? (marker 09) | UNKNOWN | 4000257 | 230 (-807.66, 234.42) | — | likely ferry/exit trigger |

## Objectives / journal / markers

- Journal states 0/5/10/15/20/25/30/35/40/45; markers 01-12 as above
  (filler 13-20 never sent). Counter 0: windwheel baseline at seq 40
  (delivery check — kept items model). Flags 0-17 parley wins.
- Material legs advance on possession (Seastone→path A, Steel→path B;
  authored, marked). Cave-in rescue (rows 22-25/45-49) has no trigger
  actor binding → unwired (gap).

## Instance / territory / spawns (guide-used)

- Zones: 230 Limsa (guild + docks), 209 Ul'dah (Amajina), 170 C.
  Thanalan (Nanawa entrance), 176 Nanawa Mines (interior, layout 412),
  ferry ride Limsa↔Vesper Bay (no content owner recovered).
- `locate --zone 176 --page 1600 --world 305 -1230`: 26 recorded
  points; nearest (303.44, 167.58, -1228.0) → miner Y≈167.6 (4
  existing mobs in 30 ylm — placements need care; NOT placed: quest
  still HOLD).
- No mounts: zero spawn APIs (validator enforced); ferry ride is NPC
  travel dialogue, no player mount involved.

## Mobs / sync / lockouts

- None (Non-Combat). No sync, no lockout, no timeout; one-time.

## Rewards

- Gil 30000 central. Marks 3000 script-side by CURRENT class at
  completion (no branch content to lock; marked). EXP 3000 script-side
  (post-1.20 L30 maximum). No tool (era unresolved).

## Gaps (quest stays HOLD-gated; narrowed by this pass)

1. Miners for markers 07/08 (display ???) unidentified.
2. Ferry captain 1000539 has no spawn (docks marker ungrounded).
3. Cave-in trigger actors/mechanics unbound (DAT dialogue only).
4. Linkpearl NpcLS id/messages unrecovered (authored message stands in).
5. Ferry-ride content owner unrecovered.
6. Nanawa miner spawns (markers 10/11/12) spec'd but NOT placed until
   gaps 1-3 close (no decorative world edits for a HOLD quest).
- CLOSED this pass: 6 DAT parley titles; Linette=1000861;
  Z'ssapa=1000887; 3 named-miner actors; ferry captain=1000539;
  windwheel grant-in-scene (no recipe); Mimidoa public spawn (Bsm200).
