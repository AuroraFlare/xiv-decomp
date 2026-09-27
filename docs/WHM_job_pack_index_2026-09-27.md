# WHM job pack: White Mage 111241-111246 deep decomp + implementation index (2026-09-27)

Pack worker: JOB WHM. All pack files are `WHM_`-prefixed (Decomp docs, reg JSON,
migration SQL, contract test) or live under the existing `whm/` quest namespace
(bespoke quest scripts, `whm_guards.lua`) and `QuestDirectorJobWhm0j*` directors,
so parallel job packs cannot collide. No shared template/allowlist file is edited;
the 6-line allowlist enablement is quoted in the reg file for the integrator.

## Status after this pack

| Quest | Title | Lv | Before | After |
| --- | --- | --- | --- | --- |
| 111241 Whm0j1 | Seeds of Initiative | 30 | Partial (HOLD) | Implemented, bespoke private adapter |
| 111242 Whm0j2 | When Sheep Attack | 35 | Implemented | Implemented, verified unchanged |
| 111243 Whm0j3 | Lost in Rage | 40 | Implemented | Implemented, verified unchanged |
| 111244 Whm0j4 | The Wheel of Disaster | 45 | Partial (HOLD) | Implemented, bespoke private adapter |
| 111245 Whm0j5 | In Search of Succor | 45 | Partial (HOLD) | Implemented, bespoke coffer adapter |
| 111246 Whm0j6 | The Chorus of Cataclysm | 50 | Partial (HOLD) | Implemented, bespoke private adapter |

Whm0j2/Whm0j3 keep their template-driven scripts and directors; this pack only
audits them (chocobo/API scan, marker + mob + skill re-verification).

## Why bespoke scripts instead of template rows

`Data/scripts/quests/job_quest_template.lua` is shared by every job pack, so this
pack does not edit it. The four remaining quests are FULL bespoke scripts in
`Data/scripts/quests/whm/` following the proven `pgl200.lua` precedent (own SEQ
consts, eligibility gates on every handler, `StartPrivateQuestBattle` launches,
uniqueId-aware pushes, `getJournalMapMarkerList`). Shared engine pieces reused
unchanged: `gc_sqb_quest.lua` launcher (party/level/transfer/proximity gates,
boundary circle, fail-closed preEvent), `gc_sqb_runtime.lua` director runtime
(waves, kill reconciliation, wipe/timeout/disconnect/abandon/retrigger guards),
`IsMountRestrictedArea` (chocobo ban in every private area).

## Global WHM chocobo + fight-surface audit (this pack)

- Mount-spawn API scan (`IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount|Goobbue`)
  over `Data/scripts/quests/whm/*.lua` + `QuestDirectorJobWhm*.lua`: **0 hits**.
  All four new fights run in private content areas where the engine denies mounts.
- No `CreateContentArea` bypasses; every battle goes through
  `StartPrivateQuestBattle` with `minimumLevel`, `maxPartySize`, `partyRadius`,
  `boundaryRadius`, and `timeoutSeconds`.
- Counter slots stay in 0-3, flag bits in 0-23 (`quest-counter-slots` suite).
- Enrage: no retail enrage data exists for any of these six fights. Enrage is
  modeled as the director timeout (fail to the visible retry NPC), documented
  per quest. No invented damage-boost phases.
- Level sync: the 1.x engine has no sync-down. Minimum levels are enforced for
  the owner AND every entrant at launch and re-checked after the entry movie.
  Over-level entry is allowed (era-accurate); under-level entry is impossible.

## Per-quest docs (same directory)

- `WHM_whm0j1_seeds_of_initiative_decomp_2026-09-27.md`
- `WHM_whm0j2_when_sheep_attack_decomp_2026-09-27.md`
- `WHM_whm0j3_lost_in_rage_decomp_2026-09-27.md`
- `WHM_whm0j4_wheel_of_disaster_decomp_2026-09-27.md`
- `WHM_whm0j5_in_search_of_succor_decomp_2026-09-27.md`
- `WHM_whm0j6_chorus_of_cataclysm_decomp_2026-09-27.md`

## Memory-side deliverables (FF14-Memory)

- `Data/quest_npcs/WHM_whm_quest_registry.json` (NPC/coffer/marker registry)
- `Data/sql/migrations/WHM_whm_quest_mobs.sql` (11 idempotent adapter mob rows)
- `Data/scripts/quests/whm/whm0j1.lua`, `whm0j4.lua`, `whm0j5.lua`, `whm0j6.lua`
- `Data/scripts/quests/whm/whm_guards.lua` (shared eligibility/launch guards)
- `Data/scripts/directors/Quest/QuestDirectorJobWhm0j1.lua`
- `Data/scripts/directors/Quest/QuestDirectorJobWhm0j4.lua`
- `Data/scripts/directors/Quest/QuestDirectorJobWhm0j6.lua`
- `tools/WHM_whm_quest_contract.py` (pack contract test, run directly)

## Standing caveats (all packs share these)

1. Raya-O-Senna (1001570), Oha-Sok (1060030), and the moogles have no reviewed
   public spawn rows; Soileine (1000234) does (Gridania 206). The registry marks
   proposed placements UNREVIEWED: no spawn SQL is emitted until an in-game
   capture review, same policy as `gc_opening_npcs.json`.
2. Marker X/Z pins the public journal destination only. Private-battle spawns
   are placed relative to the entrant inside the content boundary (verified with
   `map_coordinates.py`: no recorded ground exists at the Mun-Tuy marker center,
   so a public placement there would be ungrounded).
3. `quest_availability.lua` still comments out 111241-111246 (shared file, not
   touched). Uncomment those six lines to offer the line.
