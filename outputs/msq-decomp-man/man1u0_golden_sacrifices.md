# Golden Sacrifices — Man1u0 (110011, Lv 8)

- Prereq: 110010 (header; SQL prereq column should read 110010 — verified SQL
  row `(110011, 'Golden Sacrifices', 'Man1u0', 110010, 8)`). Next: Man2u0.
- Availability: enabled (instance).
- Accept: SEQ_ACCEPT on Momodi with return-position guard (private warp in
  onStart, same contract as Man1l0).

## Sequence flow (verified)

ACCEPT → 0 (Quicksand private; Momodi → 5) → 5 (Gagaruna → 10) → 10
(gambling-hall/room triggers; room → 15) → 15 (Thancred → 25 + zone 175 warp +
LS) → 25 (Deaustie → 28) → 28 (Flhammin trigger → 30) → 30 (north trigger →
35 + private) → 35 (Ascilia → 40 + LS + zone 170 warp) → 40 (Yayake/Gegeissa →
50 + THM private) → 45 (same) → 50 (hall triggers → 55) → 55 (Niellefresne →
60) → 60 (hall trigger → 70 + LS + zone 209 warp) → 65 (LS) → 70 (Momodi
reward + CompleteQuest with overkill guard + 15000 gil + 300 exp).

## Delegate events (verified): `processEventMomodiStart/000_2..7/010[_2..4]/
015[_2..8]/020[_2..8]/021[_2]/025_2/028[_2]/030/040[_2]/050/055_2/060/070[_2..7]/
080[_2]/090[_2]/100/1000_4`, `processEventComplete`, `sqrwa`.

## ENPC IDs (verified)

Momodi 1000841, Gagaruna 1000862, Thancred 1000948, Niellefresne 1001867,
F'lhaminn 1000038, Greinfarr 1000039, Deaustie 1000293, Ascilia 1000042,
Yayake 1000846, Gegeissa 1001424, Thaumaturge-hall cast 1000887–1001216,
triggers 1090045/1090047/1090075/1090077/1090114/1090283.

## Markers (verified): 11001101–11001111.

## Counters/flags: none.

## Journal hooks: none custom (marker list only).

## Rewards (verified): 15000 gil + 300 exp, single CompleteQuest.

## Mob profiles / spawn evidence: none — no kills (SEQ_028/030 travel warnings
are dialogue-only; verified non-mutating).

## Instance / scene surface

- NEEDED: Quicksand/Mirage/N.Thanalan/THM echo copies (zones 175/170/209/181).
- EXISTING: private-area warps; no combat director (none needed).

## Prior decomp references

- `docs/level_8_city_main_quests_decomp_2026-07-07.md`

## Open gaps

- Several reminder methods flagged "needs investigating for retail accuracy"
  in-script (021_2, 025_2, 1000_4) — carried over honestly, not resolved here.
