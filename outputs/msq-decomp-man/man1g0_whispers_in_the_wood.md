# Whispers in the Wood — Man1g0 (110007, Lv 8)

- Prereq: 110006. Next: Man2g0. Availability: enabled (instance).
- Accept: SEQ_ACCEPT gate on Miounne (`processEventMiounneStart` →
  `AcceptQuest`; EndEvent before accept — safe, no warp in onStart).

## Sequence flow (verified)

0 (Miounne→CRP) → 5 (guild echo: Zezekuta/Frances; push→10) → 10 (Fye in
Orchard → 15) → 15 (exit echo → LS → 20) → 20 (LS → 25, E-Sumi at Growery) →
25 (push → 30) → 30 (moogle private → 35) → 35 (→ 40) → 40 (Opyltyl → LS → 45)
→ 45 (LS → 50) → 50 (Nonolato → 55) → 55 (ARC push → 60 + LS) → 60 (LS → 65)
→ 65 (Miounne reward: `processEventComplete` + `sqrwa` + CompleteQuest with
overkill guard + 15000 gil + 300 exp).

## Delegate events (verified): `processEventMiounneStart/000_2/010[_2..8]/
020[_2..4]/030/040[_2]/050[_2]/060[_2]/070/080[_2..3]/090[_2..5]/100`,
`processEventComplete`, `sqrwa`, `processEvent1000_2/1000_5`. Journal texts
34–46/186 transcribed header-side (verified provenance: sheet journalxtxFst).

## ENPC IDs (verified)

Miounne 1000230, A'naidjaa 1000465, Zezekuta 1000240, Frances 1000466,
Fye 1000014, Opyltyl 1000236, Nonolato 1000463, pushes
1090170–1090175, Orchard/Amphitheatre crowds 1000622–1001489.

## Markers (verified): 11000701–11000713 (11000705 flagged X/unused in header).

## Counters/flags: none (pure sequence + LS progression).

## Journal hooks: marker list with private/public splits.

## Rewards (verified, single CompleteQuest + overkill guard): 15000 gil + 300 exp.

## Mob profiles / spawn evidence: none — dialogue/delivery/instance quest, no kills.

## Instance / scene surface

- NEEDED: CRP/BTN/ARC echo copies, moogle instance, amphitheatre staging
  (man1g000..100 series named header-side; scene bodies client-owned).
- EXISTING: private-area warps only; no dedicated combat director (none needed —
  no battle). Do NOT invent a fight.

## Prior decomp references

- `docs/level_8_city_main_quests_decomp_2026-07-07.md`

## Open gaps

- Scene-ID↔method bindings (man1g000 etc.) are header notes, not client-verified
  here; exact audience/dispatch rules unrecovered.
