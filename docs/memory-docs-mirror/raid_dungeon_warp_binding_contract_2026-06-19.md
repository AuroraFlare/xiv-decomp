# RaidDungeonWarp binding contract (2026-06-19)

## Executive findings

- `RaidDungeonWarp` now has a small local script; actor/spawn binding and destination validation remain missing.
- Recovered client behavior is tiny and specific: load text `6781/raidDungeonWarp`, run scheduler `67493888`, then use `askExtendWidget(self, 2, 2, 1, 2)` when enabled.
- Actor classes `1200373`-`1200375` remain the best current binding leads, but the SQL snapshot only proves class/appearance/GM bg-model group `988`, not live spawn placement.
- Destination behavior should use a content return/exit helper after actor placement is confirmed; do not wire free-form coordinates from the script alone.
- Regression risk is sibling-object hijack: Toto-Rak Light/Barrier/Poster are stateful scripts and should stay separate from generic magitek/transporter work.

## 2026-06-20 Object Route Audit

- Presence split is now clearer: `GimmickTerminal`, `GimmickWarp`, `GimmickExitRect`, `RaidDungeonWarp`, `RaidDungeonLight`, `RaidDungeonBarrier`, `RaidDungeonPoster`, `RaidDungeonExit`, `InstanceRaidExit`, `PrivateAreaPastExit`, and `RaidDungeonRect` exist locally, but only Toto-Rak photocells/barriers and `PrivateAreaPastExit` have strong binding proof today.
- `TalkCommand` must not generic-route Toto-Rak `RaidDungeonLight`, `RaidDungeonBarrier`, or `RaidDungeonPoster` into `GimmickTerminal`; those are object-owned state machines with photocell count, barrier animation, and poster row behavior.
- `RaidDungeonWarp` is not `GimmickWarp` or `GimmickTerminal`: it has text bank `6781/raidDungeonWarp`, scheduler `67493888`, prompt shape `askExtendWidget(self, 2, 2, 1, 2)`, and a content-return helper.
- `GimmickWarp` stays separate for generic warp/quicksand prompts: text bank `10112/gimmickWarp`, mode rows `1-3`, `4-6`, `7-9`, and quicksand message `52067`.
- Exit rectangles are push/notice/rect-owned, not talk-owned by default: `PrivateAreaPastExit`, `GimmickExitRect`, `RaidDungeonExit`, and `InstanceRaidExit` need separate movement/cleanup validation.
- Recovered but locally absent adjacent raid objects remain `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, and `InstanceRaidTreasureBox`; keep treasure/headcount work out of generic terminal routing.

## 2026-06-21 Dungeon Object Inventory Update

- Recovered and local-present raid object scripts: `RaidDungeonBarrier.lua`, `RaidDungeonLight.lua`, `RaidDungeonPoster.lua`, `RaidDungeonWarp.lua`, `RaidDungeonExit.lua`, `RaidDungeonRect.lua`, and `InstanceRaidExit.lua`.
- Recovered but still locally absent: `RaidDungeonHeadCount.lua`, `RaidDungeonTreasureBox.lua`, and `treasurebox/InstanceRaidTreasureBox.lua`. Generic `GimmickTreasureBox.lua` is not a substitute for recovered raid drop-table and quest-item logic.
- `RaidDungeonWarp` probing should start disabled/prompt-only, then a controlled content-return path after actor binding and destination are proven. Keep `RaidDungeonWarp` distinct from `GimmickWarp`, `GimmickTerminal`, and Toto-Rak state objects.
- `UseRaidDungeonWarp` fallback movement to the Toto-Rak entrance must not count as successful transporter proof. A valid transporter probe has to prove the bound object, enabled/disabled prompt, intended destination/return source, and content/re-entry cleanup.
- `RaidDungeonRect` is marker/rect evidence only in local form; do not use it as movement or exit authority without a separate destination/content policy.
- Safe order for this family: passive actor/spawn inventory, Toto-Rak poster/light/barrier cancel/no/yes, `RaidDungeonWarp` prompt, `RaidDungeonExit`/`InstanceRaidExit` cancel before yes, and treasure/headcount only after package, duplicate, capacity, and quest gating are server-validated.

## Actor Binding Leads

- `1200373` `~~~magitek???~~~`: Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988.
- `1200374` `~~~magitek???~~~`: Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988.
- `1200375` `~~~magitek???~~~`: Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988.

## Local Script Status

- `RaidDungeonWarp` -> `Data/scripts/base/chara/npc/object/RaidDungeonWarp.lua`: implemented; binding unresolved
- `RaidDungeonLight` -> `Data/scripts/base/chara/npc/object/RaidDungeonLight.lua`: implemented
- `RaidDungeonBarrier` -> `Data/scripts/base/chara/npc/object/RaidDungeonBarrier.lua`: implemented
- `RaidDungeonPoster` -> `Data/scripts/base/chara/npc/object/RaidDungeonPoster.lua`: implemented

## Implementation Contract

1. `Data/scripts/base/chara/npc/object/RaidDungeonWarp.lua`: Mirror recovered initForEvent, activateWarpDevice, and askYesNo(true/false); disabled path says text row 1 and returns nil.
2. `Actor class binding`: Bind only confirmed transporter actor classes, with 1200373-1200375 as current leads.
3. `Destination/return behavior`: On yes choice, route through a content return/exit helper, not arbitrary teleport coordinates.
4. `Regression separation`: Keep RaidDungeonLight/Barrier/Poster object scripts on their existing bindings.

## Probe Queue

1. Actor binding capture: Confirms whether owner class is 1200373, 1200374, 1200375, or another class.
2. Prompt behavior: Enabled returns askExtend choice 1/2; disabled says row 1 and returns nil.
3. Scheduler visual: Scheduler 67493888 plays without blocking or crashing the stock client.
4. Return helper choice: Player lands at intended entrance/exit and content/reentry timers remain correct.
5. Sibling object regression: Existing stateful object scripts still receive their own EventStart and prompt functions.
6. Absence guard: Do not fake `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, or `InstanceRaidTreasureBox` until recovered owner/event/package behavior is captured.

## Generated artifacts

- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/recovered_function_contracts.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/actor_binding_candidates.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/transition_helper_matrix.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/transporter_text_mentions.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/raid_dungeon_warp_binding_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 24 / 24
- Source term hits: 366
- Function contracts: 73
- Actor binding rows: 12
- Local gap rows: 4
- Transition helper rows: 40
- Transporter text mentions: 11
- Probe rows: 5

## 2026-06-21 Object/Reward Absence Addendum

- `RaidDungeonWarp` remains a prompt/destination helper with unresolved binding. `UseRaidDungeonWarp` can fall back to the Toto-Rak public entrance, so movement through that helper is not proof of magitek transporter parity.
- `GimmickTerminal` and `RaidDungeonWarp` should stay split: terminal read-only/message behavior is not the same as transporter movement.
- `RaidDungeonTreasureBox`, `RaidDungeonHeadCount`, `InstanceRaidTreasureBox`, and `TreasureBoxBaseClass` are still absent locally. Recovered treasure/headcount scripts should not be faked until owner, event, drop package, inventory-capacity, and duty-exit behavior are captured.
- The 1200373..1200375 magitek actor-class rows remain visual/identity leads only.
- AV/Cutter/Beacon identity scripts do not prove lifecycle or transporter binding; keep their object probes GM/debug only.
