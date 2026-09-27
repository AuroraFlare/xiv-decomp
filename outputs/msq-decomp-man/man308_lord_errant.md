# Lord Errant — Man308 (110017, Lv 38)

- Prereq: 110016. Next: Man402. Availability: enabled (instance).
- Accept: market push → Gold Court warp; court trigger `pES` accept
  (`isQuestInfoAccepted`).

## Sequence flow (verified)

ACCEPT → 0 (Paglth'an gate trigger `pE01` → 5) → 5 (approach trigger → combat
content) → 10 (companion talk → `pE20` + `pE30` → 15 + battle staging move) →
15 (parley/battle per flag, director-side) → 20 (Minfilia `pE90` + reward
window 32500 exp + CompleteQuest + Waking Sands warp).

## Encounter (verified header + code; numbers director-side)

- Design: one successful Parley with tempered captives releases the group and
  starts the three-enemy Amalj'aa battle; director owns temp actors + parley
  boundary persisted in quest data (flag 0).
- Entry (verified): content `man30801` zone 174 (public-area source),
  boundary (970,950)-(1035,1015), owner temp var, `PrepareQuestEntry` +
  `commitQuestEntry` gates; `pE10` after-warp fade deferred until destination
  valid (verified). Entry (995.168, 309.146, 982.116); battle staging
  (1000.714, 308.565, 985.779); public return (1217.650, 311.707, 776.001).
- Party: owner + 1 helper + Path companion (verified cap comment).
- Recovery: SEQ_010/015 re-entry, cave-style pending-notice flag for GM path.
- Navmesh verdict: nearest recorded node 5248 at **142.8 yalms**. **No
  coverage (ritual-site interior).** Heights authored.
- Director (verified exists): `Quest/QuestDirectorMan30801`.

## Delegate events (verified): `pES/pE01/pE10/pE20/pE30/pE90`, reward window.

## ENPC IDs (verified)

Minfilia 1000843, market 1090265, court/gate/approach triggers
1090187/1090188/1090189.

## Markers (verified): gate 11001701, approach 11001702, Waking Sands 11001703,
market 11001704, ritual 11001705, captives 11001706/707, Amalj'aa 11001708
(parley-gated).

## Flags: 0 (parley complete). Journal: parley state + SNPC nickname.

## Rewards (verified): 32500 exp award, single CompleteQuest.

## Instance / scene surface

- NEEDED: Gold Court, Paglth'an approach/ritual battlefield.
- EXISTING (verified): content + director + pursuit/parley/combat test entries
  + companion-advance helper.

## Prior decomp references

- `docs/lord_errant_man308_decomp_2026-07-07.md`
- `docs/lord_errant_man308_decomp_2026-08-14.md`
- `docs/msq_man304_308_402_406_in-depth_decomp_2026-08-17.md`
- `docs/msq_110016_110017_110018_110019_in-depth_decomp_2026_08_17.md`
- `docs/msq_man304_308_402_seamless_client_decomp_2026-08-22.md`
- `tools/decompile_man308_cutscene_setup.py`

## Open gaps

- Parley table contents and Amalj'aa stats are director/negotiation-side;
  quest records only the boundary + flag contract.
