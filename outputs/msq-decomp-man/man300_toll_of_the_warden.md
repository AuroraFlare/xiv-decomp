# Toll of the Warden — Man300 (110015, Lv 30)

- Prereq: 110014. Next: Man304. Availability: enabled (instance).
- Accept: two-step SEQ_ACCEPT (Minfilia briefing → temp flag; Tataru `pEStart`
  accept with `isQuestInfoAccepted`; rebase-in-place after warp).

## Sequence flow (verified)

ACCEPT → 0 (market entrance → 10 + Peasants Ward warp) → 10 (Hedyn `pE20` →
15 + corridor reposition) → 15 (Drybone trigger: counter=5 + Path LS 6 → 20)
→ 20 (mesa trigger → battlefield, below) → 25 (landing → `pE40` chain) → 30
(Nananoby `processEvent040_2`; dual solution below) → 35 (Hedyn `pE60` +
reward window 19000 exp + Ashcrown LS 7 + CompleteQuest + corridor warp).

## Encounter: dual route (verified header + code)

- Combat route: director-owned cave encounter; every combatant breaks at 15% HP
  and despawns instead of dying (header-recovered battle solution; director
  `Quest/QuestDirectorMan30001` verified to exist).
- Parley route: available from both peaceful representatives (director-side
  negotiation; quest exposes `startMan300ParleyTest` checkpoint).
- Entry (verified): static private 171/past/1, boundary (930,-350)-(1120,-150),
  up-to-3 entrants (Path companions excluded from cap — verified comment),
  owner temp var, entry scene `pE30` result-gated.
- Entry coords (verified): (1001.755, 252.750, -280.197); return
  (1034.830, 251.660, -269.040).
- Navmesh verdict: nearest recorded node 9364 at **17.1 yalms** (Y 250.87 vs
  252.75, Δ1.9). Nearby support only — authored Y, marked inferred.

## Delegate events (verified): `processEvent000/005_8/010[_2..5]/020[_2..7]/
022_1/040_2/050[_3..12]`, `pE20/pE30/pE40/pE60/pEStart`, reward window.

## ENPC IDs (verified)

Minfilia 1000843, Tataru 1001046, Hedyn 1001047, Shanga Meshanga 1001048,
Troxia 1001049, Nananoby 1001050, sylphs 1001085/1001086, Consortium crowd
1001381/1001382/1001384/1001178/1001179/1001387 (ownership mapped in comments,
verified against archive notes), triggers 1090178/1090241/1090264.

## Markers (verified, code table): 11001501–11001507 (LS-gated splits).

## Counters/flags: counter 0 (Drybone LS); LS packs 6 (Path) / 7 (Ashcrown).

## Journal hooks: `getPathCompanionJournalInfoFromCounter` + unpacked markers.

## Rewards (verified): 19000 exp award + Ashcrown linkshell 7. Gil via
director/retail path (none in quest script — verified absence, not an omission
to "fix": do not invent a gil grant).

## Instance / scene surface

- NEEDED: Peasants Ward corridor, Camp Drybone, mesa battlefield, cave.
- EXISTING (verified): static content + director + battle/parley test entries.

## Prior decomp references

- `docs/toll_of_the_warden_man300_decomp_2026-07-07.md`
- `docs/toll_of_the_warden_man300_decomp_2026-08-14.md`
- `docs/msq_110015_in-depth_decomp_2026-08-17.md`
- `docs/msq_30_46_bytecode_decomp_2026-09-04.md`
- `tools/decompile_man300_cutscene_setup.py` (FF14-Decomp tools)

## Open gaps

- 15%-retreat rule and Parley table are director/bytecode-side; quest script
  only stages entry — numeric tuning not verified here.
