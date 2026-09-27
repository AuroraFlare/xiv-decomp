# AV/Cutter/Hamlet Instance Raid Runtime Lane - 2026-06-19

This note records static client/runtime evidence for Aurum Vale, Cutter's Cry, and Hamlet Defense. It is an evidence map only. It does not claim Aurum Vale or Cutter's Cry are launchable locally, and it does not claim Hamlet has a confirmed retail launch/widget path.

## Boundary

Static client evidence links Aurum Vale and Cutter's Cry to raid IDs `6` and `7`, guide text groups `9920` and `9936`, empty `InstanceRaidBaseClass` subclasses, and asset-backed replay rows `11082301..04/rad0r400..403` and `11082401..04/rad0w500..503`. No recovered static Lua launcher supplies those scene keys. Exact live scene selection, owner/event type, timing, rewards, coffers, and exit behavior remain server/capture/table evidence.

Hamlet Defense is a related control case. Local code has an experimental server-side combat/probe backend with content IDs, zones, cutscene keys, scoring data, and UI packet probes, but the retail launch/widget gate remains unconfirmed.

## Evidence Matrix

| Lane | Content IDs | Zone Evidence | Cutscene/Replay Evidence | Local Runtime Status |
| --- | --- | --- | --- | --- |
| Aurum Vale | `6` in `docs/Dat Mining/xtx_raidDungeon.csv` and party matching outputs | `245/252/253` in `Data/sql/server_zones.sql`; AV hazard recognizes these zones in `EnvironmentalHazardManager.cs` | `rad0r400..403` -> `11082301..04` in content cutscene joins/replay outputs | `InstanceRaidAurumVale.lua` is an identity wrapper over `InstanceRaidBaseClass`; no local launcher/guide binding is proven. |
| Cutter's Cry | `7` in `docs/Dat Mining/xtx_raidDungeon.csv` and party matching outputs | `246/254/255` in `Data/sql/server_zones.sql` | `rad0w500..503` -> `11082401..04` in content cutscene joins/replay outputs | `InstanceRaidCuttersCry.lua` is an identity wrapper over `InstanceRaidBaseClass`; no local launcher/guide binding is proven. |
| Hamlet Defense | `8/9/10` in raid dungeon/content outputs and local Hamlet data | Hamlet content/zone metadata lives in `HamletDefenseManager.cs` | `ham0s201/202`, `ham0f301/302`, `ham0w201/202` -> `11082008..13` in content cutscene joins | Experimental backend/probe lane only; live retail HUD lifecycle remains gated by `InstanceRaidBaseClass.startEvent/reloginEvent` evidence. |

## Guide Surface

Recovered Aurum Vale and Cutter's Cry guide scripts load dedicated text groups and ask/accept an entry choice, but those scripts are prompt surfaces. They do not prove duty launch ownership by themselves.

Local `InstanceRaidGuide.lua` remains generic and has the recovered `askEnterInstanceRaid` shape commented out. Local AV/Cutter quest scripts are dialogue/scaffold evidence, not launch evidence.

## Runtime Interpretation

`InstanceRaidBaseClass` owns the client lifecycle shape: `startEvent`, `reloginEvent`, clear/failure/exit cutscenes, and widget open/close. The server-side trigger that supplies owner, event type, scene key, timing, and eligibility remains dynamic and uncaptured for AV/Cutter.

For Hamlet, the useful local claim is narrower: a config-gated experimental backend/probe lane exists, with direct user-message probes and score/ranking packet experiments. The retail `InstanceRaidHamletDefense.openInformationWidget` path is still not proven as a natural launch path.

## Next Evidence Needed

1. A real instance-raid duty start capture, or a client receiver trace for `InstanceRaidBaseClass.startEvent/reloginEvent`.
2. A confirmed guide owner/actor binding for AV/Cutter entry prompts.
3. A proven mapping from guide acceptance or content command to director creation, scene selection, and timer fields.
4. Clear/fail/timeout ownership for rewards, coffers, re-entry, and exit/return behavior.
5. Hamlet live HUD validation through the stock instance-raid lifecycle, not only direct probes.

## Related Contracts

- `docs/instance_raid_director_base_contract_2026-06-19.md`
- `docs/legacy_dungeon_execution_widget_contract_2026-06-19.md`
- `docs/party_matching_content_id_contract_2026-06-19.md`
- `docs/hamlet_widget_contract_2026-06-19.md`
- `docs/hamlet_missing_data_2026-06-12.md`