# Never the Twain Shall Meet — Man2l0 (110004, Lv 13)

- Prereq: 110003. Next: Man200 (converging prereq).
- Availability: enabled (`110004 ... Man2l0`, instance).
- Accept: SEQ_ACCEPT on Baderon (EndEvent before accept; no warp — safe).

## Sequence flow (verified)

ACCEPT → 0 (Hob private-ship talk → 10 + zone 192 warp) → 10 (hold door →
15 + private) → 15 (prompt room → duty trigger) → 20 (Twain duty, below;
re-trigger completes → 35 + zone 230 warp) → 35 (Baderon → 37) → 37 (SeaFld
trigger → LS → 40) → 40 (LS → 42) → 42 (MSK push → 45) → 45 (Isaudorel → 50)
→ 50 (SeaFld push → 55 + zone 128 warp) → 55 (SeaFld3 push → 70 + zone 133
warp) → 60/65 unused flavor → 70 (Baderon reward + CompleteQuest with
overkill guard + 30000 gil + 500 exp).

## Duty: Emerick vs Merodaulyn (verified, documented BNPCs, full fight)

- Side selection (verified): counter 0 normalized to 1 (Emerick) / 2
  (Merodaulyn); completion scene takes side arg.
- Profiles (verified main SQL :553–554): `(1290, 2280114, 'nightblade', ...)`
  and `(1291, 2280120, 'venomtongue_assassin', ...)` — names/levels match
  quest constants (verified cross-match).
- Entry (verified): `startMan2l0TwainDuty` → zone 192 private type 0,
  prompt (-178.251-class coords per constants: prompt 1824.234, 11.852,
  1825.629; battle 1830.296, 16.347, 1827.331). Flags: duty-active 0,
  complete-pending 1. Stale-director cleanup on entry (verified).
- Director (verified exists): `Quest/QuestDirectorMan2l001` (side spawns,
  story actors, despawn hygiene).
- Navmesh verdict: zone 192 is **world_only, 0 recorded nodes** — no coverage.
  Heights authored/inferred. No invented ground claimed.

## Delegate events (verified): `processEvent000[_2]/010[_2..3]/011[_2..4]/
012/013/020/050[_2]/060[_2]/070/075/080/080_2/081[_2]`,
`contentsJoinAskInBasaClass`, `processEvent081_2` (reward), `sqrwa`.

## ENPC IDs (verified)

Baderon 1000137, Y'shtola 1000001, Hob 1000151, Isaudorel 1000152,
cuda knights 1000183/1000184, ship doors 1090098/1090099, triggers
1090003/1090082/1090085–1090087/1090386.

## Markers (verified): 11000401–11000409 (410–420 zero spares).

## Counters/flags: counter 0 (side); flags 0 (active), 1 (complete-pending).

## Journal hooks: static `(40,40,40)` + marker list (duty-active hides markers).

## Rewards (verified): 30000 gil + 500 exp. Whistle 2001006 commented out
(deliberate non-grant).

## Instance / scene surface

- NEEDED: ship hold/duty privates (zone 192 type 0/1), SeaFld echo (128 type 3).
- EXISTING (verified): director + static area lookup + duty test entry.

## Prior decomp references

- `docs/level_13_city_main_quests_decomp_2026-07-06.md`

## Open gaps

- Which side retail picks (and how) is unrecovered — counter normalized to
  Emerick by default (authored fallback, marked).
- SEQ_060/065 content flagged "Unused?" in-script; left as flavor, not wired.
