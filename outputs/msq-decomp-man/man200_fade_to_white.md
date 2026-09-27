# Fade to White — Man200 (110013, Lv 18, convergence)

- Prereq: 110004 + 110008 + 110012 (verified SQL
  `gamedata_quest_prerequisite_groups`: three `(110013, 1, ...)` rows — all
  three city tracks required). Next: Man206.
- Availability: enabled (`110013 ... Man200`, instance).
- Accept: no SEQ_ACCEPT in script — entry via Market Entrance object script
  (commented block documents the move; verified present-as-comment).

## Sequence flow (verified)

0 (office door W → `pE10` → 5 + reposition) → 5 (Minfilia echo `pE20` == 1 → 10)
→ 10 (Minfilia join `pE25` == 1 → 20 + reposition) → 20 (Tataru SNPC select;
valid 80-row check → SetSNpc + LS 6 → 25; 60s re-issue guard) → 25 (Tataru
reminder; missing-LS restore) → 27 (Tataru → duty or naming; SNPC naming via
`pEN` with cancel guard (-3/nil) → duty-complete flag → 27-reward at Momodi:
whistle (HasItem-guarded) + CompleteQuest + 45000 gil + 6500 exp).

## Path Companion SNPC (verified)

- Range 1070000–1070166; only first 80 rows (5 classes × 16) valid for
  combat companions (`isValidSnpcSelection`, block math verified).
- Journal info via `scenarioHelpers.getPathCompanionJournalInfo`.

## Duty (verified)

- Content `man20001`/`SimpleContent30080`, director
  `Quest/QuestDirectorEventMan20001` (verified exists), entry (-200.262, 0,
  -159.890); `contentsJoinAskInBasaClass` gate; music 44 on entry.
- Enemies director-side; no BNPC in quest script (no kill invented here).

## Delegate events (verified): `pE00/10/20/25/050/050_2/055/060`,
`processSnpcSelect/pEN`, `processEvent000_2/020_2`, mapped talk tables
`MAN200_SEQ000/010/SHARED_TALK_EVENTS`, `contentsJoinAskInBasaClass`.

## ENPC IDs (verified)

Minfilia 1000843, Tataru 1001046, Momodi 1000841, Waking Sands cast
1001228–1001378, doors 1090160–1090162, market 1090265.

## Markers (verified): 11001301/303/305/306 (zone-gated 181 vs entrance).

## Flags: 0 (visited), 1 (Tataru talked), 2 (duty complete).

## Rewards (verified): Chocobo Whistle **2001031** (classic/unarmored —
comment explicitly forbids substituting GC whistle 2001007; verified), 45000
gil, 6500 exp. Key-item delivery failure keeps quest retryable (verified).

## Instance / scene surface

- NEEDED: Waking Sands office/hall, SNPC duty battlefield.
- EXISTING (verified): director + content + guard helper
  (`guardAnyDisciplineInstanceEntry`).

## Prior decomp references

- `docs/fade_to_white_man200_decomp_2026-07-07.md`
- `docs/msq_110012_110013_110014_in-depth_decomp_2026-08-17.md`
- `docs/msq_110020_110021_reference_decomp_2026-08-17.md` (chain context)

## Open gaps

- Market-entrance accept flow lives in the object script; its accept/decline
  contract was not re-verified in this pass.
