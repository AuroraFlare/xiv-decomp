# FF14 1.0 Thaumaturge class quests — line overview

Compiled: 2026-09-26. The full retail 1.0 Thaumaturge line is three
quests: 110240 The Big Payback, 110241 Revelry in Rivalry, 110242
Law and the Order. Quest 110243 (Thm400) is an unreleased stub
(proof below); Thm500/Thm506 do not exist in any source. The three
live quests were implemented and documented by a prior session;
this file only indexes them and records the stub proof plus a
cross-line verification pass.

## Quest list and status

| Quest | Title | Rank | Status |
|---|---|---|---|
| 110240 (Thm200) | The Big Payback | 20 | Implemented (driver); see `thm200_the_big_payback_2026-09-26.md` |
| 110241 (Thm300) | Revelry in Rivalry | 30 | Implemented (driver + rescue-duty director); see `thm300_revelry_in_rivalry_2026-09-26.md` |
| 110242 (Thm306) | Law and the Order | 36 | Implemented (driver); see `thm306_law_and_the_order_2026-09-26.md` |
| 110243 (Thm400) | Scenario: Thm400 | 40 | Stub: 171-byte initText-only scenario decomp, all 20 markers filler, empty quest.csv row; template row stays a hidden probe |
| Thm500/Thm506 | — | — | Absent: no template row, no scenario decomp, no quest.csv row, no markers |

Superseded planning notes: `thm300_thm306_HOLD_2026-09-26.md`.

## Stub proof (110243)

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/
  thm/thm400.lua` is 171 bytes: `_defineClass` + `initText`
  only, no events.
- All `quest_marker.csv` rows 11024301-11024320 are filler
  (`-431`/`187`/Sthalmann `1600179`).
- No `thm400.csv`/`thm500.csv`/`thm506.csv` exists under
  `docs/Dat Mining/`.
- `quest.csv` has an empty row for 110243 and no rows for
  110244/110245.

## Cross-line verification (2026-09-26)

- `validate_thm200/300/306_route.py` → PASS.
- Mob profiles 32740 (Ignis Fatuus) and 32742 (Overweening
  Thaumaturge) carry the private-encounter shape (detection 0,
  respawn 0, drop 0); the Thm300 director's `state.player` /
  `state.area` hook usage matches `gc_sqb_runtime` guarantees.
- Spawn collision audit of the new THM rows (3307-3309):
  nearest neighbors are 7.8+ yalms away (guild NPCs only).
- `validate_quest_availability.py`, `validate_class_quest_
  mob_types.py`, `validate_class_held_routes.py` → PASS.
