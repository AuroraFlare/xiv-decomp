# Forever Taken (Man304) Decomp Notes

> Historical recovery note. The route was implemented on 2026-08-14; see
> `docs/forever_taken_man304_decomp_2026-08-14.md` for the resolved sequence,
> delivery model, event actors, private scene, rewards, and verification path.

Quest: `110016`, `Man304`, level 34 main scenario.

Local script: `Data/scripts/quests/man/man304.lua`
Scaffold config: `Data/scripts/quests/generic_quest_scaffold.lua`
Recovered client script: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man304.lua`
Recovered director shell: `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectoreventman30401.lua`
Text sheet: `docs/Dat Mining/man304.csv`
Marker sheet: `docs/Dat Mining/quest_marker.csv`
Replay sheet: `docs/Dat Mining/cutReplay.csv`

## Short Version

`Man304` is still a hidden generic scaffold locally. The recovered client script has four SNPC cutscene wrappers and a set of talk helpers, but no recovered quest route, item turn-in code, enemy placement, or useful director logic. The recovered `QuestDirectorEventMan30401` class is only an empty subclass of `QuestDirectorBaseClass`.

Safe fix applied in this pass: the scaffold actor was corrected from `1000392` to `1001047`. `1000392` is Hedyn's display name id and also an unrelated actor class with display `4000148` ("dark-eyed footpad"). `1001047` is the talk-capable Hedyn actor class already used by `Man300`.

Do not wire completion, rewards, objective counters, item grants/removals, or after-warp progression yet.

## Local State

`Data/scripts/quests/man/man304.lua` only calls `InitQuestScaffold("Man304")`.

The scaffold row is currently hidden because generic scaffolds require `offer = true`, and `Man304` does not set it. If someone enables it later, it now points at Hedyn actor class `1001047` instead of the display id.

Current scaffold marker remains `11001603`, which is a Waking Sands/Ashcrown marker keyed to display id `1000392`.

## Cutscene Matrix

| Method | Scene | Fade behavior | Payload notes |
| --- | --- | --- | --- |
| `pES` | `man30400` | Default fade | Standard SNPC5 plus derived personality bucket and constants `5, 10`. |
| `pE10` | `man30410` | Default fade | Says text row `306`, then SNPC5 scene. |
| `pE20` | `man30420` | After-warp fade | SNPC5 scene; keep event lifetime probe-only. |
| `pE30` | `man30430` | After-warp fade | Personality-specific companion lines, then SNPC5 scene. |

`pES` derives an extra bucket from SNPC personality:

| Personality | Extra bucket |
| --- | --- |
| `1`, `2`, `9` | `1` |
| `3`, `4` | `2` |
| `5`, `6` | `3` |
| `7` | `4` |
| `8` | `5` |
| Other | `0` |

Helper now available: `scenarioHelpers.getMan304PersonalityBucket(personality)`.

`pE30` decomp output contains invalid `break` statements, so treat those blocks as decompiler damage. The intended behavior is a mutually exclusive personality line pair before `man30430`:

| Personality | Rows |
| --- | --- |
| `1` | `369`, `378` |
| `2` | `370`, `379` |
| `3` | `371`, `380` |
| `4` | `372`, `381` |
| `5` | `373`, `382` |
| `6` | `374`, `383` |
| `7` | `376`, `385` |
| `8` | `375`, `384` |
| `9` | `377`, `386` |

## Talk Helpers

Recovered non-scene helpers include these useful anchors:

| Method group | Rows / behavior |
| --- | --- |
| `processEvent000_2` through `_13` | Rows `469` through `480`. |
| `processEvent000_20` | Ask row `490`; decomp calls the ask twice. |
| `processEvent000_22` | `worldMaster:tell` row `494` with one argument. |
| `processEvent001_2` through `_6` | Rows `304`, `481`-`488`. |
| `processEvent005_1`, `_2` | Rows `505`, `504`. |
| `processEvent010_2` through `_8` | Rows `459`-`468`. |

None of these helpers proves the retail route owner or sequence mutation by itself.

## Journal Data Notes

`xtx_quest.csv` row `110016` selects journal text by `$E8(1)`:

| Sequence expression | Journal row | Notes |
| --- | --- | --- |
| `$E8(1) == 0` | `214` | Ashcrown asks for five `11000096` items. |
| `$E8(1) == 5` | `242` | Early intermediary state. |
| `$E8(1) >= 10 and $E8(1) < 20` | `215` | Crystals delivered; return to the Waking Sands. |
| `$E8(1) == 20` | `216` | Waking Sands speech/companion state. |
| `$E8(1) == 25` | `217` | Final follow-up state. |

The same quest row adds an item display line for item `11000096` (`Unaspected Crystal`) when `0 <= $E8(1) < 10` and `$E8(2) > 0`, using `$E8(2)` as the count. Summary rows reference `251`, `242`, `215`, `252`, and `253`.

The current local scaffold returns generic `{0, 0}` journal args through `generic_quest_scaffold`; do not add real journal/item counters until the route is implemented.

## Actors And Markers

Important actor/display rows:

| Id | Meaning |
| --- | --- |
| `1001047` | Hedyn actor class, display id `1000392`, `PopulaceStandard`, talk/notice-capable. |
| `1000392` | Hedyn display name id; also an unrelated local actor class row with display `4000148`. |
| `1000968` | Actor class with display `1100161` / Wannore. |
| `1001442` | Actor class with display `1100163` / Wenefreda. |
| `1001628` | Actor class with display `1100167` / Ailith. |
| `3003109` | Retainer shell with display `1100160` / Ulaa. |

Display-name rows `1100160` through `1100169`: Ulaa, Wannore, Wantliana, Wenefreda, Ymanie, Aideen, Aileen, Ailith, Airell, Aislinn.

Marker highlights:

| Marker | Notes |
| --- | --- |
| `11001601` | Waking Sands/Ashcrown-style marker near `-193, -1408`, target `4000257`. |
| `11001602`, `11001604`, `11001612`-`11001620` | Generic map markers at `-431, 187`, target `1600179`. |
| `11001603` | Current scaffold marker near `-199.89, -162.06`, target/display `1000392`. |
| `11001605`, `11001606` | Layout `104/421`, target `4000257`; likely travel/interior markers. |
| `11001607`-`11001611` | Layout `105/501`, coordinates around `752,-374` through `864,-298`, all using icon `i11001903`. |

Patch 1.20 explicitly mentions high-level enemy placement making `Forever Taken` difficult to complete. That lines up with the Mor Dhona/Silvertear item-gathering route, not with any recovered fight director. Treat enemy/spawn changes as route-spawn work, not cutscene work.

## Replay And Debug Surfaces

`QuestBaseClassCommon` maps quest `110016` replay choices `1` through `4` to `man30400`, `man30410`, `man30420`, and `man30430`.

`PopulaceSnpcCutTestMan` also includes debug choices for `man30400`, `man30410`, `man30420`, and `man30430`.

Cutscene assets exist for all four scenes:

| Scene | Asset dir | Rough file size from inventory |
| --- | --- | --- |
| `man30400` | `client/cut/man30400` | `295280` |
| `man30410` | `client/cut/man30410` | `55314` |
| `man30420` | `client/cut/man30420` | `71329` |
| `man30430` | `client/cut/man30430` | `116423` |

Shared helper coverage for these probes:

| Helper | Use |
| --- | --- |
| `getSnpcArgList(player)` | Guarded SNPC5 payload tuple: nickname, skin, personality, coordinate, initial town. |
| `getSnpcNickname/Skin/Personality/Coordinate(player)` | Individual guarded payload reads for targeted probes. |
| `getInitialTown(player)` | Guarded starter-town read for old scenario cutscene wrappers. |
| `getSnpcActorClassIdFromSkin(skin)` | Mirrors recovered `getSnpcActorClassID`, which adds `1070000` to the SNPC skin id. |
| `getPlayerSnpcActorClassId(player)` | Convenience wrapper for spawning/probing the player's path companion actor class. |
| `getMan304PersonalityBucket(personality)` | Mirrors the `pES` personality-to-bucket mapping for `man30400`. |

## Reward Risk

Rewards are not safe to auto-grant. The sources disagree:

- `xtx_quest.csv` notes reward none in the quest metadata.
- `Data/sql/gamedata_quest_rewards.sql` has a DAT-derived `Gil` row with quantity `102000`.
- `Data/scripts/commands/gm/yolo.lua` has wiki-derived `rewardexp = 26500`.
- `quest_reward.csv` and `quest_new_reward.csv` encode old reward payloads that need widget/runtime interpretation.

Keep `Man304` reward completion disabled until the real completion event and reward widget are captured.

## Probe Commands

Use scene-only probes first, across several SNPC personalities if possible:

```text
!questdelegate quest:110016 pES @snpc5
!questdelegate quest:110016 pE10 @snpc5
!questdelegate quest:110016 pE20 @snpc5
!questdelegate quest:110016 pE30 @snpc5
```

For `pE20` and `pE30`, capture event close, scheduled warp/fade, area state, and relog behavior before adding any sequence advancement.

## Fixes Applied

- Corrected the hidden `Man304` scaffold owner from display id `1000392` to Hedyn actor class `1001047`.
- Added guarded SNPC payload helpers in `scenario_decomp_helpers.lua`, plus the recovered `Man304` personality bucket.
- Added `getPathCompanionJournalInfoFromCounter` and moved `Man300`'s Drybone journal info onto it.

## Follow-Up Work

- Build the real `Man304` sequence route after identifying the item collection, turn-in, and Waking Sands return owners.
- Probe `pES`, `pE10`, `pE20`, and `pE30` before wiring any local cutscene calls.
- Resolve the `1000392` marker/display-id mismatch before enabling the scaffold.
- Treat the Patch 1.20 high-level enemy bug as a spawn placement audit once the Mor Dhona route is known.
