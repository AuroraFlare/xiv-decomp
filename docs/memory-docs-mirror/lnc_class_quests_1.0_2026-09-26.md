# FF14 1.0 Lancer class quests — line overview

Compiled: 2026-09-26. The full retail 1.0 Lancer line is three
quests: 110180 A Wailing Welcome, 110181 Culture Shock, 110182
Necessary Evils. Quests 110183-110185 (Lnc400/500/506) are
unreleased stubs (proof below) and stay hidden probes. The three
live quests were implemented and documented by a prior session;
this file only indexes them and records the stub proof plus a
cross-line verification pass.

## Quest list and status

| Quest | Title | Rank | Status |
|---|---|---|---|
| 110180 (Lnc200) | A Wailing Welcome | 20 | Implemented (driver); see `lnc200_a_wailing_welcome_2026-09-26.md` |
| 110181 (Lnc300) | Culture Shock | 30 | Implemented (driver, two-wave defense); see `lnc300_culture_shock_2026-09-26.md` |
| 110182 (Lnc306) | Necessary Evils | 36 | Implemented (driver); see `lnc306_necessary_evils_2026-09-26.md` |
| 110183 (Lnc400) | Scenario: Lnc400 | 40 | Stub: 171-byte initText-only scenario decomp, all markers filler; template row stays a hidden probe |
| 110184 (Lnc500) | Scenario: Lnc500 | 50 | Stub: same proof as Lnc400 |
| 110185 (Lnc506) | Scenario: Lnc506 | 56 | Stub: same proof as Lnc400 |

Superseded planning notes: `lnc300_lnc306_HOLD_2026-09-26.md`.

## Stub proof (110183-110185)

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/
  lnc/lnc400.lua`, `lnc500.lua`, and `lnc506.lua` are each 171
  bytes: `_defineClass` + `initText` only, no events.
- All `quest_marker.csv` rows 11018301-11018320,
  11018401-11018420, and 11018501-11018520 are filler
  (`-431`/`187`/Sthalmann `1600179`).
- No `lnc400.csv`/`lnc500.csv`/`lnc506.csv` exists under
  `docs/Dat Mining/`.
- `quest.csv` rows for 110183-110185 are empty.

## Cross-line verification (2026-09-26)

- `validate_lnc200/300/306_route.py` → PASS.
- Mob profiles 3131-3133 resolve via the shared mob-types
  validator; spawn rows 3293-3297 sit clear (nearest neighbors
  are other quests' invisible triggers/exits or same-floor
  NPCs 2.6+ yalms away).
- `validate_quest_availability.py`, `validate_class_quest_
  mob_types.py`, `validate_class_held_routes.py` → PASS.
