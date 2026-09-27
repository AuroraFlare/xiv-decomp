# Dungeon Exit Rect Adapter Contract

Generated: 2026-06-19T22:23:34

## Summary

- Recovered exits split into dedicated `RaidDungeonExit`, concrete `InstanceRaidExit`, generic `GimmickExitRect`/`GimmickExit`, marker/range-only `PrivateAreaPastExit` or `ContentPrivateAreaRange`, and a shared `GimmickNpcBaseClass.askExit` helper.
- The local tree has `PrivateAreaPastExit.lua` and `RaidDungeonExit.lua`; static exits stay behind `CanExitPrivateArea()` and runtime exits prefer captured return points.
- Runtime content has return-point data and a local `InstanceRaidExit.lua`/`WorldManager.ExitCurrentContentToReturnPoint` path; live prompt and cleanup behavior still need validation.
- 2026-06-20 helper pass found no local SQL binding for `RaidDungeonExit` or `InstanceRaidExit`; only `PrivateAreaPastExit` actor classes were concrete. Treat those exit scripts as dormant until DAT/spawn evidence or controlled seeded test objects prove placement.
- Runtime return/re-entry cleanup is real in C#: `PrivateAreaContent` stores return points, `DoZoneChange` clears DB re-entry when leaving runtime content, and content entry saves the re-entry row. Validate packet/order behavior live before production binding.
- Actor class rows `1290001`-`1290004` are concrete `PrivateAreaPastExit` radius variants. The output found 41 static private-area exit spawn rows and 12/59 static private-area table rows with `canExitArea = 1`.

## Source Coverage

- Sources present: 33
- Sources missing: 0
- Output directory: `tools\outputs\lpb\dungeon_exit_rect_adapter_contract_20260619`

## Recovered Surface Contracts

| Surface | Text surface | Local status | Adapter contract | Confidence |
| --- | --- | --- | --- | --- |
| RaidDungeonExit | 6736/raidDungeonExit rows 1-9 | Present at Data/scripts/base/chara/npc/object/RaidDungeonExit.lua; asks recovered raidDungeonExit prompt and exits through content-return/static-private helpers only on yes. | Keep as a dedicated object script. It is separate from InstanceRaidExit and GimmickExitRect because the prompt API and text bank are different; actor binding remains evidence-gated. | high for text bank/default confirm path; medium for the type 3 branch due decompiler branch damage |
| InstanceRaidExit | worldMaster rows 52042/52043/52044 | Present at Data/scripts/base/chara/npc/object/InstanceRaidExit.lua; asks recovered duty-end prompt with WorldManager.GetCurrentContentRaidDungeonId and calls WorldManager.ExitCurrentContentToReturnPoint on yes. | Use for duty exits keyed by raidDungeonId. The move should prefer live PrivateAreaContent return points when the area is runtime content. | high |
| GimmickNpcBaseClass | worldMaster rows 52042/52043/52044 for askExit | Present at Data/scripts/base/chara/npc/gimmick/GimmickNpcBaseClass.lua as a local generic-gimmick helper; binding and exact askForEventMode parity remain unproven. | Add a shared generic-gimmick helper so GimmickExit and other gimmicks can reuse talkRange and askExit without duplicating duty-exit prompt logic. | high |
| GimmickExitRect | 10064/gimmickExitRect rows 1-6 | Present at Data/scripts/base/chara/npc/gimmick/GimmickExitRect.lua with explicit placeNameId/private-area gating; actor binding and destination policy remain unproven. | Generic exit rectangle prompt. Requires placeNameId binding plus a destination/return helper; prompt alone should not decide movement. | high |
| GimmickExit | none observed | Present at Data/scripts/base/chara/npc/gimmick/GimmickExit.lua as a no-op trigger shell; bindings remain unproven. | Treat as an invisible shell/companion for trigger-only exit behavior. Do not add a prompt unless bound through GimmickExitRect or a specific object. | medium |
| PrivateAreaPastExit | worldMaster rows 34109/34110 in local script | Present; the allowed exit branch sends 34110 and calls WarpToPublicArea(player) behind CanExitPrivateArea(). | For static private areas, respect PrivateArea.CanExitPrivateArea(). On allowed exit, send 34110 and warp to public area. On not allowed, keep warning/repel behavior explicit. | high |
| ContentPrivateAreaRange | none observed | Present at Data/scripts/base/chara/npc/object/ContentPrivateAreaRange.lua as marker-only exit/caution range shim; movement remains owned by a separate content-return helper. | Likely marker/range companion for runtime content exits. Movement should use content return points, not static WarpToPublicArea coordinates. | medium |

## Local Gap Matrix

| Gap | Impact | Recommended next step |
| --- | --- | --- |
| Dedicated old raid exit script exists but binding/type-3 behavior is unvalidated | Old raid/dungeon exit prompts can now be represented locally, but no production actor binding has proven the prompt args or movement policy; no current SQL binding was found. | Trigger a controlled RaidDungeonExit actor/probe and validate default/type-3 askYesNo rows plus accepted movement cleanup. |
| InstanceRaidExit script exists but live return movement is unvalidated | Runtime content exits now have a prompt surface, but live client prompt behavior and return cleanup still need validation; no current SQL binding was found. | Trigger InstanceRaidExit inside runtime content through a controlled test object and verify current area, saved location, participant removal, and cleared re-entry ticket after yes. |
| Runtime content exit/return handling is implemented but unproven | Static PrivateAreaPastExit movement is repaired and runtime content has a return helper, but live prompt/zone-change parity is not validated. | Validate allowed/disallowed static exits and one runtime content exit using the captured return-point helper; include DB `characters_content_reentry` deletion and participant unregister checks. |
| Generic exit rectangle binding/destination policy remains unproven | Row-driven GimmickExitRect prompts can be represented locally, but production bindings need a verified placeNameId and destination/return source. | Find or probe a real GimmickExitRect binding before expanding movement beyond explicit private-area gating. |
| Generic gimmick base binding/parity remains unproven | The local helper avoids duplicate prompt glue, but recovered base-class inheritance and askForEventMode parity still need validation. | Validate one bound generic gimmick actor against the recovered talkRange/initForGimmick shape before adding behavior. |
| Content return helper exists as a live API but needs runtime validation | The custom glue exists, but it still needs a live content exit test to prove packet order and re-entry cleanup. | Run a runtime-content exit smoke and compare area, DB location, and re-entry rows before/after the prompt. |

## 2026-06-21 Exit Object Inventory Update

- `RaidDungeonExit`, `InstanceRaidExit`, and `RaidDungeonRect` have local script evidence, but exits still lack production SQL binding proof. Treat them as controlled probes until DAT/spawn rows or seeded test objects prove placement.
- `RaidDungeonRect` is no-op/marker-only locally. It can support owner/binding inventory, but it should not move players or stand in for `RaidDungeonExit`, `InstanceRaidExit`, or `GimmickExitRect`.
- `GimmickExitRect` should be validated cancel-first and double-yes-last. Movement only becomes safe after a real binding proves `placeNameId`, destination/return source, and content/static-private-area policy.
- Runtime exits should prefer captured `PrivateAreaContent` return points and must prove participant unregister, DB re-entry cleanup, zone-change packet order, and relog behavior before production use.
- `InstanceRaidExit` remains blocked for AV/Cutter/trials until a content-area-to-raid-id registry exists; the current lookup is Toto-Rak-oriented and can return `0` for modern runtime content.
- Treasure and headcount are separate missing lanes. Do not use exit object validation as evidence for `RaidDungeonTreasureBox`, `InstanceRaidTreasureBox`, or `RaidDungeonHeadCount`.

## Actor Binding Notes

- `PrivateAreaPastExit` actor classes use paired push circles named `exit` and `caution`; those names match the recovered marker range contract.
- `OpeningStoperW0B1` and `OpeningStoperF0B1` are reference scripts for boundary pushes, but they move within the same zone and should not be treated as generic private-area exits.
- Static private areas must respect `canExitArea`; many rows are intentionally non-exitable because quest scripts manage their own progression exits.

| Actor class | Class path | Push conditions |
| --- | --- | --- |
| 1090373 | `/Chara/Npc/Object/OpeningStoperW0B1` | exit radius=4.0 outwards=false; caution radius=5.0 outwards=false |
| 1090384 | `/Chara/Npc/Object/OpeningStoperF0B1` | exit radius=40.0 outwards=true; caution radius=30.0 outwards=true |
| 1090385 | `/Chara/Npc/Object/OpeningStoperW0B1` | exit radius=40.0 outwards=true; caution radius=30.0 outwards=true |
| 1290001 | `/Chara/Npc/Object/PrivateAreaPastExit` | exit radius=30.0 outwards=true; caution radius=20.0 outwards=true |
| 1290002 | `/Chara/Npc/Object/PrivateAreaPastExit` | exit radius=40.0 outwards=true; caution radius=30.0 outwards=true |
| 1290003 | `/Chara/Npc/Object/PrivateAreaPastExit` | exit radius=50.0 outwards=true; caution radius=40.0 outwards=true |
| 1290004 | `/Chara/Npc/Object/PrivateAreaPastExit` | exit radius=60.0 outwards=true; caution radius=50.0 outwards=true |

## Implementation Order

| Order | Task | Acceptance | Risk |
| --- | --- | --- | --- |
| 1 | Validate static PrivateAreaPastExit movement | Caution sends 34109; exit sends 34110 and moves only when CanExitPrivateArea() is true. | Medium: parent-zone coordinates may be invalid for some static private areas if reused blindly. |
| 2 | Validate live content exit-to-return helper | When CurrentArea is PrivateAreaContent, yes exit uses TryGetReturnPoint, clears re-entry through DoZoneChange cleanup, unregisters participant, and zone-changes to the captured area. | High: packets/location persistence must mirror DoZoneChange behavior. |
| 3 | Validate InstanceRaidExit.lua | askExit(current content raidDungeonId) opens 52042 with yes/no rows and calls the content helper only on yes. | Medium: needs correct bridge from Lua askForEventMode to local client widgets. |
| 4 | Validate generic GimmickNpcBaseClass helper binding | A bound generic gimmick actor preserves talkRange, calls child initForGimmick, and reuses askExit over worldMaster 52042/52043/52044. | Medium: local Lua inheritance conventions may not mirror recovered _defineBaseClass exactly. |
| 5 | Validate GimmickExitRect binding and destination policy | Two-stage 10064 prompt returns true only on double yes; no movement occurs without a mapped destination/return policy. | Medium: placeNameId and destination source are spawn-specific. |
| 6 | Validate RaidDungeonExit.lua | Default and type 3 askYesNo paths match raidDungeonExit rows; accepted movement uses content return points or allowed static private-area exits only. | Medium: unluac branch damage around askYesNo type 3. |

## Probe Queue

| Probe | Method | Expected | Blocks |
| --- | --- | --- | --- |
| RaidDungeonExit type 3 branch | Find a retail caller or actor arg that invokes askYesNo(3, ...), or seed a controlled object after binding proof. | Confirm whether row 7 is simple ask-only or still flows into row 4. | Perfect RaidDungeonExit.lua behavior. |
| InstanceRaidExit return movement | Trigger a runtime content exit in a live local instance and compare current area, DB location, participant membership, and re-entry ticket after yes. | Player returns to captured return point, participant is unregistered, and no stale re-entry ticket remains. | Safe content exit helper implementation. |
| Static PrivateAreaPastExit allowed rows | Test a canExitArea=1 static private area and a canExitArea=0 one with the same script. | Allowed areas leave; disallowed areas warn/repel without breaking quest exits. | Live validation of allowed and disallowed static private-area exit rows. |
| GimmickExitRect binding source | Search actor unique ids and map object bindings for placeNameId/destination args. | A row or trigger arg identifies placeNameId and move target. | Movement after double-confirm for generic exit rectangles. |

## Output Files

- `source_inventory.csv` - all consulted sources and missing local scripts.
- `source_term_hits.csv` - targeted term hits for exits, prompts, and return helpers.
- `extracted_function_index.csv` - recovered/local functions relevant to exit movement.
- `function_contracts.csv` - curated function-level behavior contracts.
- `exit_surface_contract.csv` - surface-by-surface adapter decisions.
- `prompt_text_rows.csv` - DAT/worldMaster rows used by exit prompts.
- `actor_class_exit_radii.csv` - actor class radius and push-condition rows.
- `spawn_binding_rows.csv` - concrete exit/stopper spawn bindings.
- `private_area_exit_flags.csv` - static private-area `canExitArea` flags.
- `local_gap_matrix.csv` - missing or half-wired local surfaces.
- `implementation_contract.csv` - recommended implementation sequence.
- `probe_queue.csv` - remaining live/decomp probes.
- `contract_summary.json` - machine-readable summary.
