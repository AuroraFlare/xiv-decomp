# Quest Cutscene Bridge Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\quest_cutscene_bridge_contract_20260619`.

## High-signal findings

- The prior extractor scanned `861` quest Lua files and found `595` methods with cutscene/fade behavior.
- Direct quest scenes use desktop modes `61`/`62` for NQ/HQ, while instance raid cutscenes use mode `63`.
- There are `533` direct scene keys; `528` have client cut assets and `1` lacks an asset in the crosscheck.
- Replay coverage is the weaker side: `31` direct scene keys are missing `cutReplay` rows.
- The important runtime split is default fade-in versus after-warp fade-in. The server can already send RunEventFunction/KickEvent/EndEvent packets, but after-warp paths need stricter ordering around zone/private-area transitions.

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | NQ/HQ delegateEvent launch wrapper | Quest server scripts and RunEventFunction/KickEvent helpers |
| 2 | After-warp fade finalizer | Quest warp helpers and WorldManager zone/private-area transitions |
| 3 | Replay placeholder resolver | SetCutsceneBook/replay data and PopulaceCutScenePlayer path |
| 4 | cutReplay gap policy | cutReplay data or replay UI filtering |
| 5 | High-scene quest smoke tests | man2l0/man0g1/man0l1/man0u1/man2g0/man2u0 |
| 6 | Legacy occupancy/instance lane | Toto-Rak/Dzemael style occupancy directors |

## 2026-06-21 Owner/Lifetime Addendum

- Direct quest cutscene coverage is broad, but the safe path is still quest/director-owned. Prefer `Director.SendDirectorEventFunction` or quest-owned `delegateEvent` wrappers over raw player `RunEventFunction` when the scene changes quest, director, or private-area state.
- Non-warp direct scene probes should be scene/log only: start through the owning quest actor, confirm fade/camera/text, and avoid `CompleteQuest` or reward mutation unless the quest's server objective and reward rows are already proven.
- After-warp fade finalizers are the risky half. Validate owner type, fade packet ordering, map load, private-area entry, and event-end timing before enabling after-warp branches on real quests.
- Replay coverage is not the same as live quest ownership. `cutReplay` rows can prove a scene key exists, but replay does not prove the retail quest event lifetime, reward timing, or warp sequencing.

## Combat Instance Pre-Cutscene Rule

- Every combat-instance path must call `guardCombatInstanceEntry(player)` before its join prompt or opening cutscene and before changing quest/director/area state. Reusable start helpers must also call `checkCombatInstanceEntry(player)` as a bypass-resistant backstop.
- Rejections must use `MESSAGE_TYPE_SYSTEM` with an empty sender and this exact text: `Change to a combat job or Disciple of War or Magic class before entering this instance.` Never attach a quest/NPC prefix or emit this restriction as `MESSAGE_TYPE_SYSTEM_ERROR`.
- Keep authoritative validation at dynamic content creation and zone transfer. Static combat areas must be narrowly allowlisted in `Database.IsPartyLockedStaticInstanceArea`; cutscene-only private areas must not be classified as combat.
- Test with DoH/DoL before reviewing cutscene order: no prompt/cutscene or state mutation may occur. Then confirm DoW/DoM follows the normal scene and entry path.

## Generated Files

- `cutscene_protocol_matrix.csv` (10 rows)
- `quest_cutscene_hotspots.csv` (30 rows)
- `server_delegate_bridge_summary.csv` (40 rows)
- `quest_scene_key_gap_contract.csv` (31 rows)
- `quest_scene_key_gap_summary.csv` (2 rows)
- `cutreplay_placeholder_contract.csv` (24 rows)
- `local_runtime_bridge.csv` (5 rows)
- `bridge_queue.csv` (6 rows)
- `contract_summary.json`
- `README.md`
