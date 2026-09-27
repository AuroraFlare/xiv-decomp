# Man502 / Man504 (110020 / 110021, Lv 52 / 54) — reference-only

- SQL (verified `gamedata_quests.sql:52-53`): `(110020, '[en]', 'Man502', 0, 52)`,
  `(110021, '[en]', 'Man504', 0, 54)`. Names unrecovered (`[en]` placeholder);
  prereq 0 — **chain break after 110019** (no retail prereq link in this data).
- Availability: both commented OUT (verified quest_availability.lua) — not
  implemented, do not enable (out of scope for this pass).
- Scripts (verified): `generic_quest_scaffold` only; text sheets 1648/man502 and
  1661/man504 via `scenarioHelpers` reference-only getters; SNPC preview scenes
  only. No sequences, ENPCs, markers, rewards, directors, or battles exist.

## Instance / scene surface

- NEEDED: everything (no owner/objective route recovered).
- EXISTING: none. Scaffold stays hidden until a retail route exists (verified
  comments). Do NOT invent battles or cutscenes.

## Prior decomp references

- `docs/man502_man504_reference_decomp_2026-07-08.md`
- `docs/msq_110020_110021_followup_decomp_2026-08-17.md`
- `docs/msq_110020_110021_in-depth_decomp_2026_08_17.md`
- `docs/msq_110020_110021_reference_decomp_2026-08-17.md`

## Open gaps

- Full implementation blocked on retail owner/objective/seq recovery. The
  110019→110020 story link is unrecovered in this data (SQL prereq 0).
