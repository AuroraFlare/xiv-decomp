# World quest routes Wld0u2 / Wld0g2 / Wld0g3 - 2026-09-26

Completes the last three partial 1.17-1.18 world quests so all 12 named
`Wld*` rows are labeled Implemented. Offers stay disabled (commented);
this pass covers route readiness only, not offer enablement.

## Fixes

- `wld0u2` Sanguine Studies (110754)
  - Reward-screen EXP `200` did not match the SQL `Exp 2170` row; the
    screen now shows `2170`.
  - `getJournalMapMarkerList` normalized from lowercase
    `quest:getSequence()` to the canonical CLR `GetSequence()`.
- `wld0g2` Hearing Confession (110763)
  - `onTalk` and `getJournalMapMarkerList` normalized from lowercase
    `quest:getSequence()` to `GetSequence()`. Correction (same day): a
    MoonSharp 2.0.0 probe proved CLR member lookup is
    case-insensitive, so lowercase was never a runtime break — the
    earlier "invalid/unplayable" framing was wrong. Promotions rest on
    the actor/spawn/marker/decomp/reward audit, not the casing.
  - Fixed the stale `(... of 5)` comment; the `51063` call already passes
    the correct 4-soul total and matches `wld0l2`.
- `wld0g3` A Bitter Oil to Swallow (110764)
  - Removed duplicate manual `AddItem(8031227)` / `AddExp(960)` grants:
    `Player.CompleteQuest` already grants the SQL-backed item + EXP rows.
    Same pattern as the etc1 audit removals.
  - `getJournalMapMarkerList` now uses `GetSequence()`.

## Audit evidence (no retail behavior invented)

- Recovered decomp scenarios bridge fully, including the three empty
  `wld0g3` stubs (`processEvent_010_1`, `_020`, `_030`):
  `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/wld/wld0{u2,g2,g3}.lua`.
- All 7 required event NPCs have zone spawns aligned with DAT markers in
  `docs/Dat Mining/quest_marker.csv` (positions and display IDs match).
- Kill targets have mob-type profiles plus world spawns: 4 Amalj'aa
  Grunts (32708, zone 171) and 14 Oilbugs (1204, zone 154).
- Spawn heights sit on recorded quicknavmesh ground: every Oilbug within
  1.2 xz / 0.1 y of a node; Grunts match the implemented Drudge
  reference (one +4.8 y ledge vs the reference's +4.0 y outlier).
- Counter items (11000173, 11000302) and all reward rows exist in
  `gamedata_items.sql` / `gamedata_quest_rewards.sql`.

## Validation

- New static contract: `python tools/validate_wld_world_quest_routes.py`
  (actors, spawns, markers, SQL rewards, no manual grants, valid quest
  API, reward-screen EXP, decomp event coverage, availability labels).
  It failed before the fix (`wld0u2 reward-screen EXP does not match`)
  and passes now.
- `python tools/validate_quest_availability.py` passes:
  524 rows, 72 enabled, 157 Implemented, 92 Partial, 275 Not
  implemented. This pass contributes +3 (110754/110763/110764); the
  class-quest rows refreshed in the same file (110102/110161/110162/
  110460) are separate in-flight work and not part of this pass.

## Known siblings (not touched)

- None remaining in `wld`: the follow-up pass below closed every
  sibling gap. Shared-actor kill credit (e.g. 2105916 serving mobs
  1074/1207/1212) is the established by-actor-class pattern and is
  kept intentionally.

## Follow-up: sibling hardening pass (same day, 3 agents)

Three subagents (Gridania / Limsa / Ul'dah lines) audited and fixed the
other nine `wld` scripts with the same checklist; all reports verified
by diff review before integration.

- `wld0l2` had the same lowercase `getSequence()` in `onTalk` as
  `wld0g2`; normalized along with its marker callback (cosmetic per the
  MoonSharp probe, not a runtime break).
- `wld0u4` reward-screen EXP `200` corrected to SQL `1980`.
- Marker-callback `getSequence()` case fixed in `wld0g1`, `wld0g4`,
  `wld0l1`, `wld0l3`, `wld0l4`, `wld0u1`, `wld0u3`. Zero lowercase
  `:getSequence(` calls remain anywhere under `wld`.
- No other sqrwa mismatches; no manual `AddItem`/`AddExp` anywhere in
  the family. All 12 quests bridge every recovered decomp event.
- Four stale header/sequence comments corrected (`wld0l3` quest name,
  `wld0u3` quest ID, `wld0l2` soul count, `wld0l4` SEQ_000 target).
- `tools/validate_wld_world_quest_routes.py` extended from 3 to all 12
  quests (data-driven actor/spawn/marker/reward/decomp/API contract).
- Final gates: route contract PASS (12 quests);
  `validate_quest_availability.py` valid, 158 Implemented (+3 from this
  family; class-quest rows remain separate in-flight work). One
  transient stale-annotation failure mid-pass was concurrent class-quest
  editing in the shared tree, resolved without intervention; final run
  is green including the job-quest boundary contract.
