# Quest Instanced Unresolved Recovery Targets - 2026-07-02

This pass converts the remaining instanced-content unknowns into concrete recovery targets. It is deliberately conservative: recovered shells and monster-family hints are evidence, not launch permission.

## Findings

- The six GC tails all have recovered `SimpleQuestBattleBaseClass` shells, but none has a safe `GC_BATTLES` row yet.
- `gcl301` and `gcg302` have the strongest monster hints (`SlugLesserQuestGcl301` and `FlyLesserQuestGcg302`), but those class names are not bound to SQL actor/mob rows in this repo.
- Missing `GC_BATTLES` metadata is actively risky: the current template routes active steps through city officers, so wrong or absent battle rows can create an officer-talk bypass.
- Toto-Rak quest entry currently defaults to safe-solo debug content, while the real party/timer/reentry lifecycle lives in `WorldManager.StartTotorakInstance` and `Occupancy/RaidFst0Dungeon03`.
- Toto-Rak clear is now a concrete lifecycle path: Shaula actor class `2301104` triggers `HandleTotorakBattleNpcDeath`, which sends the legacy clear cutscene (`rad0f306`) once.
- Both Bloisirant entry and `InstanceRaidExit` have a double-EndEvent hazard after zone-changing helpers succeed.

## Recovery Priority

1. Keep GC tails blocked until exact battle metadata is recovered; do not use family analogs.
2. Test Toto-Rak safe-solo quest entry separately from the real occupancy route.
3. Patch or guard zone-changing entry/exit tails only after confirming the client event lifetime behavior.
4. For Toto-Rak, recover the sequence-20 investigation/aftermath owner instead of treating Bloisirant fallback as retail.
5. Use boss probes to prove Shaula clear cutscene dispatch, not quest completion/reward.

## Generated Files

- `outputs\quest-instanced-unresolved-recovery-targets-20260702\gc_tail_recovery_rows.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\gc_tail_recovered_scenario_methods.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\gc_tail_monster_hint_rows.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\totorak_lifecycle_rows.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\totorak_quest_sequence_rows.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\totorak_probe_surface_rows.csv`
- `outputs\quest-instanced-unresolved-recovery-targets-20260702\unresolved_gate_rows.csv`
