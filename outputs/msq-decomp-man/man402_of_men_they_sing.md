# Of Men They Sing — Man402 (110018, Lv 42)

- Prereq: 110017. Next: Man406. Availability: enabled (instance).
- Accept: SEQ_ACCEPT on Tataru (`pES` + `isQuestInfoAccepted`).

## Sequence flow (verified)

ACCEPT → 0 (Nine Ivies trigger → escort content) → 5 (escort/fight,
director-side boundary) → 15 (Tataru: SEQ_020 recovery folds to 15; `pE30`
once per `MAN402_FLAG_REWARD_SCENE_STARTED` → reward window 39000 exp +
CompleteQuest + Waking Sands warp) → 20 (legacy Tataru recovery state).

## Escort + fight (verified header + code)

- Player's own Path companion leads to injured Ala Mhigan scout + two
  Bloodhounds; director persists escort/fight boundary for relog recovery.
- Entry (verified): content `man40201`/`SimpleContentMan40201` zone 151,
  boundary (1650,-1750)-(2025,-820), entry (1690.881, 20.171, -857.553);
  safe-return override (1712.0, 20.0, -862.0) avoids trigger recapture
  (verified comment + code). Force-combat test flag path for GMs.
- Public return (verified): (1870.347, 19.690, -1731.395).
- Navmesh verdict: nearest recorded node 4610 at **7.9 yalms** (Y 20.23 vs
  20.171, Δ0.06). Strong nearby support — still authored Y, marked inferred
  (not triangle-contained).
- Director (verified exists): `Quest/QuestDirectorMan40201`.

## Delegate events (verified): `pES/pE10/pE30`, reward window.

## ENPC IDs (verified)

Tataru 1001046, market 1090265, Nine Ivies trigger 1090190.

## Markers (verified): offer 11001801, Nine Ivies 11001802, Waking Sands
11001803, Tataru reward 11001804, scout search 11001805 (content-gated).

## Flags: 0 (escort complete), 1 (reward scene started — checkpoint, not
journal advance; verified comment).

## Journal: sequence + escort flag + SNPC nickname.

## Rewards (verified): 39000 exp award, single CompleteQuest.

## Instance / scene surface

- NEEDED: Nine Ivies camp, escort trail, scout site.
- EXISTING (verified): content + director + escort/combat/test entries.

## Prior decomp references

- `docs/of_men_they_sing_man402_decomp_2026-07-07.md`
- `docs/of_men_they_sing_man402_decomp_2026-08-14.md`
- `docs/man402_man406_decomp_2026-07-07.md`
- `docs/msq_man304_308_402_406_in-depth_decomp_2026-08-17.md`
- `docs/msq_110016_110017_110018_110019_in-depth_decomp_2026_08_17.md`
- `tools/decompile_man402_cutscene_setup.py`

## Open gaps

- Bloodhound stats and scout identity are director-side; escort timing/route
  unrecovered numerically.
