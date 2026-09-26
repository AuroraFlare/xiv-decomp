# Toll of the Warden (Man300) Decomp Notes

> Superseded by `docs/toll_of_the_warden_man300_decomp_2026-08-14.md`, which
> recovers the retail route, all seven cutscene payloads, the battlefield
> placements, and the complete combat-route implementation.

Quest: `110015`, `Man300`, level 30 main scenario.

Local script: `Data/scripts/quests/man/man300.lua`
Recovered client script: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man300.lua`
Text sheet: `docs/Dat Mining/man300.csv`
Marker sheet: `docs/Dat Mining/quest_marker.csv`
Replay sheet: `docs/Dat Mining/cutReplay.csv`

## Short Version

`Man300` is a functional but simplified shell. The local script walks the player through Minfilia, Tataru, Hedyn, Shanga Meshanga, Troxia, Sahja Zhwan, Nananoby, the mesa encounter, and the return route. The recovered client script has seven main cutscenes and many talk helpers, but four SNPC cutscenes are intentionally still scene-key aliases locally because the atlas marks them as probe-only.

High-confidence fixes applied in this pass: `getJournalMapMarkerList` returned the marker table itself, and `getJournalInformation` returned row-id tables even though the client formula expects quest journal variables. Nearby main scenario scripts return marker ids and journal args as varargs, so the script now uses `scenario_decomp_helpers` for both paths.

## Runtime State Machine

| Sequence | Local status | Intended flow |
| --- | --- | --- |
| `SEQ_000` | Implemented | Talk to Minfilia, play `processEvent000`. |
| `SEQ_005` | Implemented | Talk to Tataru, play `processEvent010`. |
| `SEQ_010` | Simplified | Talk to Hedyn; local uses scene alias `man30020` instead of recovered `pE20`. |
| `SEQ_015` | Simplified | Talk to Shanga Meshanga; local also uses `man30020`. |
| `SEQ_020` | Simplified | Talk to Sahja Zhwan; local uses scene alias `man30030` instead of recovered `pE30`. |
| `SEQ_025` | Implemented delegate | Talk to Nananoby, play recovered `pE40` with SNPC tuple. |
| `SEQ_030` | Simplified | Mesa encounter placeholder; local uses `man30050` scene alias. |
| `SEQ_035` | Simplified | Return to Hedyn; local uses `man30060` scene alias. |
| `SEQ_040` | Placeholder | Return to Minfilia; no recovered `man30070` wrapper is present. |
| `SEQ_045` | Implemented | Tataru final reward/completion. |

## Cutscene Matrix

| Method | Scene | Local status | Notes |
| --- | --- | --- | --- |
| `processEvent000` | `man30000` | Implemented | Minfilia opening. |
| `processEvent010` | `man30010` | Implemented | Tataru handoff. |
| `pE20` | `man30020` | Scene alias locally | Needs SNPC payload and after-warp lifetime probe. |
| `pE30` | `man30030` | Scene alias locally | Needs SNPC payload plus extra boolean/fade behavior probe. |
| `pE40` | `man30040` | Implemented | Exact observed SNPC delegate; now uses shared helper. |
| `pE50` | `man30050` | Scene alias locally | Needs SNPC payload plus sixth extra payload value. |
| `pE60` | `man30060` | Scene alias locally | Needs SNPC payload and after-warp lifetime probe. |

The cutscene atlas puts `Man300` in `scene_alias_patch_queue`, not the safe patch queue. Keep `pE20`, `pE30`, `pE50`, and `pE60` aliased until runtime probes confirm owner, args, return values, and event lifetime.

## Journal Data Notes

`xtx_quest.csv` row `110015` selects journal text by the built-in sequence value in `$E8(1)`:

| Sequence expression | Journal row | Notes |
| --- | --- | --- |
| `$E8(1) == 0` | `207` | Minfilia sends the player to Ashcrown. |
| `$E8(1) == 10` | `208` | Arrival at Ashcrown, speak with Hedyn. |
| `$E8(1) == 15`, `$E8(2) != 5` | `209` | Hedyn escorts the player to Shanga Meshanga and Troxia. |
| `$E8(1) == 15`, `$E8(2) == 5` | `266` | Drybone linkpearl variant before the mesa step. |
| `$E8(1) == 20` | `210` | Path companion has located the mesa. |
| `$E8(1) == 25` | `211` | Nananoby/consortium negotiation in the mesa. |
| `$E8(1) == 30` | `212` | Stop both primal summons. |
| `$E8(1) == 35` | `213` | Ascian interruption and return to Hedyn. |

The local script now returns journal arguments through `scenario_decomp_helpers.getPathCompanionJournalInfo`. It keeps `$E8(2)` wired to counter `CNTR_DRYBONE_LINKPEARL`, so a future route pass can set that counter to `5` if the Drybone linkpearl variant is restored. The Path companion nickname remains available for the `[@2B($EA(6))]` substitutions used by rows `209` through `213`.

## Actors And Data

- Hedyn: actor class `1001047`, display name `1000392`.
- Shanga Meshanga: actor class `1001048`, display name `1400089`.
- Troxia: actor class `1001049`, display name `2450008`.
- Nananoby: actor class `1001050`, display name `1400008`.
- Local BNPC constants name Amalj'aa Grunt `2106537` and Ixali Warrior `2106408`, but the local script does not yet run a real encounter director.
- Text/journal data references the Ascian interruption, beast tribe negotiations, and unaspected crystal item `11000096`.

The quick SQL scan found actor class and appearance rows for the Man300 NPCs, but no named `man300` spawn shell in `server_eventnpc_spawn_locations.sql` like the Waking Sands shell used by Man206.

## Marker Matrix

The local marker choices were preserved, but are now returned as marker ids rather than a Lua table:

| Sequence | Marker |
| --- | --- |
| `SEQ_000` | `11001501` |
| `SEQ_005` | `11001502` |
| `SEQ_010` | `11001503` |
| `SEQ_020` | `11001504` |
| `SEQ_025`, `SEQ_030` | `11001505` |
| `SEQ_035` | `11001506` |
| `SEQ_040` | `11001507` |

`SEQ_015` and `SEQ_045` still have no marker in the live mapping. That matches the previous script behavior and should be reviewed with the route/spawn pass rather than changed blindly.

## Helper Support

`scenario_decomp_helpers.lua` now covers the Man300 patterns that keep appearing in scenario scripts:

- `delegateEventAndAdvance` and `delegateSnpcEventAndAdvance` keep the common "play event, then advance sequence" flow in one place.
- `getActorClassId` safely reads an NPC actor class before branching in `onTalk`.
- `getSequenceValues` / `unpackSequenceValues` back both marker lists and future sequence-keyed return helpers.
- `getQuestData`, `getQuestDataCounter`, and `getQuestDataFlag` guard old quest-data reads used by journal counters and objective flags.
- `getPathCompanionJournalInfo` provides the standard Path companion journal payload shape.
- `completeQuestWithRewards` keeps simple EXP/gil completion code consistent.

## Probe Commands

Use the existing GM delegate probe when ready:

```text
!questdelegate quest:110015 pE20 @snpc5
!questdelegate quest:110015 pE30 @snpc5 true
!questdelegate quest:110015 pE30 @snpc5 false
!questdelegate quest:110015 pE50 @snpc5 10
!questdelegate quest:110015 pE60 @snpc5
```

`pE50` is the odd one: `cutReplay.csv` and the recovered method show an extra `10` after the standard SNPC tuple.

## Fixes Applied

- Added shared `scenario_decomp_helpers` use in Man300.
- Added shared helper support for event-and-advance, safe actor class lookup, generic sequence values, Path companion journal args, and reward completion.
- Converted the exact observed `pE40` SNPC delegate to `delegateSnpcEvent`.
- Replaced the table-returning marker function with a sequence marker map and vararg marker return.
- Replaced the table-returning journal function with Path companion journal args aligned to `xtx_quest.csv`.

## Follow-Up Work

- Probe the four scene-key aliases before replacing them with recovered method delegates.
- Build a real mesa encounter/director for Amalj'aa, Ixal, Ascian appearance, and crystal recovery.
- Revisit `SEQ_015`, `SEQ_040`, and `SEQ_045` once the true route/spawn ownership is known.
