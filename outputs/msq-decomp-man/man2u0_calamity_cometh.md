# Calamity Cometh — Man2u0 (110012, Lv 13)

- Prereq: 110011. Next: Man200 (converging prereq).
- Availability: enabled (`110012 ... Man2u0`, instance).
- Accept: SEQ_ACCEPT on Momodi (EndEvent before accept; no warp — safe).

## Sequence flow (verified)

ACCEPT → 0 (Rururaji talk; chocobo-lender cross-script noted, no grant) →
5/10 (minemite duty, below; Ascilia re-talk or notice → finish → 15 +
zone 175 warp) → 15 (Phrontistery push → 20) → 20 (sickroom push → 25) → 25
(exit push → LS → 30 + zone 209 warp) → 30 (LS → 35) → 35 (Black Brush push →
40) → 40 (Arrzaneth push → 45 + private) → 45 (crypt push → 55 + zone 175
warp) → 50 (scene) → 55 (Momodi reward + CompleteQuest with overkill guard +
30000 gil + 500 exp).

## Duty: minemites (verified, full fight, counter-driven)

- Enemy (verified constants): actor 2202106 / display 3202106, 10 required
  (`MINEMITE_REQUIRED`), active cap 2, first set 5; roam mods 23/24.
- Entry (verified): `startMan2u0MinemiteDuty` → zone 170 private type 5,
  boundary circle r=50 at entry (-117.242, 215.653, -769.757) rot 1.442;
  counter reset, active flag set, pending cleared; stale director ended.
- Kill flow (verified): director `onKillBNpc` → `IncCounter`; completion sets
  counter=10 + pending flag; quest `onNotice` or Ascilia talk finishes →
  `processEvent030` + zone 175 warp + SEQ_015. Overkill-safe (pending flag).
- Staging (verified): Greinfarr/Niellefresne battle actors removed at setup;
  F'lhaminn wounded pose (passive + motion pack 1001); claim-party hygiene.
- Navmesh verdict: nearest recorded node 1585 at **10.6 yalms** (Y 217.23 vs
  entry 215.65, Δ1.6). Nearby support only — entry Y authored, marked inferred.
- Director (verified exists): `Quest/QuestDirectorMan2u001`.

## Delegate events (verified): `processEventMomodiStart/000_2/005[_2..7]/
030[_2]/040[_2..5]/050[_2]/060/065_2/070[_2]/080/085/SystemMessage`,
`sqrwa`.

## ENPC IDs (verified)

Momodi 1000841, Rururaji 1000840, Ascilia 1000042, F'lhaminn 1000038,
Niellefresne 1001867, Nogeloix 1000597, sickroom cast 1001207/1001210/1001277,
triggers 1090118/1090119/1090131/1090141/1090144/1090168/1090169/1090253,
fixes Gogofu 1000046/Hahayo 1000047/Rorojaru 1000374.

## Markers (verified): 11001201–11001207 (+temp Momodi 11001001).

## Counters/flags: counter 0 (minemite kills); flags 0 (active), 1 (pending).

## Journal hooks: none custom (marker list only).

## Rewards (verified): 30000 gil + 500 exp. Whistle commented out (non-grant).

## Instance / scene surface

- NEEDED: battlefield private (170/5), Phrontistery/sickroom/Arrzaneth privates.
- EXISTING (verified): director + static area + test entry + completion trigger
  constants (`noticeEvent`/ETYPE_NOTICE).

## Prior decomp references

- `docs/level_13_city_main_quests_decomp_2026-07-06.md`
- `docs/msq_110012_110013_110014_in-depth_decomp_2026-08-17.md`

## Open gaps

- Minemite combat stats/abilities director-side; no retail pull log cited.
- Rururaji coach vs lender handoff is cross-script; exact retail gating open.
