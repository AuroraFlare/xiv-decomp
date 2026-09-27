# Forever Taken — Man304 (110016, Lv 34)

- Prereq: 110015. Next: Man308. Availability: enabled
  (dialogue/delivery/interaction).
- Accept: SEQ_ACCEPT on Hedyn (`pES` + personality bucket + `isQuestInfoAccepted`);
  market-entrance push shared ACCEPT/005.

## Sequence flow (verified)

ACCEPT → 0 (5 soil points, below; 5th → 5 + attention msgs) → 5 (Hedyn:
incomplete → reminder; complete → `pE10`, counter reset → 10) → 10 (hall
trigger → assembly content `pE20` → 20) → 20 (companion `pE30` → 25 + reward
window 26500 exp + CompleteQuest + content finish + public warp) → 25
(Minfilia recovery: reward window + CompleteQuest; crash-safe duplicate path).

## Delivery mechanic (verified, no kills)

- Soil points 1090181–1090185 (flags 0–4, markers 11001607–11001611).
- Each: confirm `processEvent000_20` → require Lightning Crystal 1000013
  (missing → `processEvent000_22`) → consume 1 → set flag → IncCounter →
  progress message (item 11000096 Unaspected Crystal, count/5).
- Quest item 11000096 is Exclusive/stack-1 in gamedata (header) — counter is
  the ledger (verified design, do not "fix" into 5 physical stacks).

## Delegate events (verified): `pES/pE10/pE20/pE30`,
`processEvent000_20/000_22/001_2/001_3/001_5/001_6/005_1/005_2`, reward window.

## ENPC IDs (verified)

Hedyn 1001047, Minfilia 1000843, Cliaux 1001381, Cenmin 1001382,
Memezofu 1001384, market/hall triggers 1090264/1090265/1090186.

## Markers (verified): 11001601/103/105/106 + 11001301 (Minfilia reuse) + soils.

## Counters: 0 (Unaspected ledger). Journal via
`getPathCompanionJournalInfoFromCounter`.

## Rewards (verified): 26500 exp award. Single logical completion; SEQ_025 path
is crash recovery, not a double-grant (verified: no staged gil/items).

## Instance / scene surface

- NEEDED: Ashcrown staging, Silvertear soils (public), Waking Sands assembly.
- EXISTING (verified): `Quest/QuestDirectorEventMan30401`, content `man30401`/
  `SimpleContent30081` entry (-193.460, -2.0, -181.0), assembly + test entries.

## Prior decomp references

- `docs/forever_taken_man304_decomp_2026-07-07.md`
- `docs/forever_taken_man304_decomp_2026-08-14.md`
- `docs/msq_man304_308_402_406_in-depth_decomp_2026-08-17.md`
- `docs/msq_110016_110017_110018_110019_in-depth_decomp_2026_08_17.md`
- `docs/msq_man304_308_402_406_cutscene_skip_decomp_2026-08-21.md`
- `tools/decompile_man304_cutscene_setup.py`

## Open gaps

- Soil-point retail positions vs trigger placements uncompared; native
  scene-ID↔method bindings per cutscene-setup tool, not re-verified here.
