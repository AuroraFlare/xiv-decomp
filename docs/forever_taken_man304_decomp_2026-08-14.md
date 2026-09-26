# Forever Taken (Man304) — Decomp and Implementation Dossier

Quest `110016` (`Man304`), level 34 main scenario, prerequisite `110015` (`Man300`, Toll of the Warden).

This dossier supersedes the cautious 2026-07-07 scaffold note. The client scenario, localized quest journal, marker sheet, item data, replay data, cutscene setup packages, and reward data now agree on a complete playable route.

## Implemented route

| Sequence | Player objective | Server delivery |
| --- | --- | --- |
| Accept | Speak with Hedyn in the Ashcrown Consortium | `pES` / `man30400`; standard Path-companion tuple plus recovered personality bucket and constants `5, 10` |
| `0` | Gather five Unaspected Crystals at Silvertear Falls | Five distinct soil triggers; each confirmation consumes one Lightning Crystal, sets one durable flag, and increments counter 0 |
| `5` | Return the five crystals to Hedyn | `pE10` / `man30410`; the counter is cleared after delivery and the journal advances |
| `10` | Return to the Waking Sands and enter the main hall | South-hall doorway creates a private Waking Sands content copy and plays `pE20` / `man30420` across its after-warp fade |
| `20` | Speak with the player's Path companion | The content director spawns actor class `1070000 + SNPC skin`; speaking to it plays `pE30` / `man30430` |
| `25` | Post-scene completion state | The recovered reward window is shown, SQL auto-rewards are granted by quest completion, and the player returns to the public Waking Sands |

Sequence `25` also has a Minfilia recovery target. If the final reward handoff is interrupted after the sequence is persisted, a relog does not strand the quest.

## Crystal conversion and delivery

The selected input is Lightning Crystal `1000013`. This is supported by the client dialogue's six-element switch using argument `4`, the recovered method calls that pass the element argument, and the legacy item dependency for Forever Taken.

The output is Unaspected Crystal `11000096`. Its item row is `maxStack = 1` and `isExclusive = 1`, while journal row `214` explicitly asks the player to gather five and displays counter 0 as the quantity. Five physical copies therefore cannot be the authoritative server representation. The implementation uses the established quest-objective pattern:

- one real Lightning Crystal is removed per distinct soil point;
- counter 0 tracks `0..5` Unaspected Crystals and feeds the journal;
- the acquisition attention packet displays item `11000096` with `(current of 5)`;
- a per-point flag prevents duplicate conversion at the same soil;
- Hedyn's sequence-5 scene consumes the quest ledger by resetting the counter.

This avoids both impossible Exclusive-item stacking and free repeated progress.

## Event actors and exact marker coordinates

The five soil actors use formerly blank event actor classes `1090181` through `1090185`. The Waking Sands hall doorway uses `1090186`. All six are invisible `PopulaceStandard` push actors with a 3-yalm circle.

| Actor class | Quest marker | Zone | X | Y | Z | Rotation | Purpose |
| --- | --- | --- | ---: | ---: | ---: | ---: | --- |
| `1090181` | `11001607` | `190` Mor Dhona | `752.120` | `31.400` | `-374.220` | `-1.232` | Silvertear soil 1 |
| `1090182` | `11001608` | `190` | `722.092` | `30.969` | `-380.955` | `-1.073` | Silvertear soil 2 |
| `1090183` | `11001609` | `190` | `744.460` | `33.811` | `-307.340` | `-1.073` | Silvertear soil 3 |
| `1090184` | `11001610` | `190` | `799.600` | `44.200` | `-214.430` | `-1.073` | Silvertear soil 4 |
| `1090185` | `11001611` | `190` | `864.072` | `43.998` | `-297.140` | `-0.681` | Silvertear soil 5 |
| `1090186` | `11001606` | `181` Waking Sands | `-193.460` | `-2.000` | `-177.310` | — | Main-hall scene/recovery doorway |

The marker sheet supplied the original X/Z anchors but no world Y. The five complete Silvertear transforms above were subsequently captured in-game on traversable terrain; points 2 and 5 also include small X/Z corrections from those captures. The Waking Sands doorway uses the marker's X/Z and the existing hall/map-object floor height.

Travel markers are `11001601` (Gridania market/Ashcrown route), `11001603` (Hedyn), and `11001605` (Ul'dah market/Waking Sands route). The quest owns those entrance pushes so the route remains deterministic instead of depending on a ward menu's unrelated progression inference.

## Recovered client event surface

| Wrapper | Scene | Fade | Important payload |
| --- | --- | --- | --- |
| `pES` | `man30400` | normal | SNPC tuple, personality bucket, `5`, `10`; returns the quest-info choice |
| `pE10` | `man30410` | normal | SNPC tuple; pre-line row `306` is inside the client wrapper |
| `pE20` | `man30420` | after warp | Waking Sands assembly; the event stays alive through `DoZoneChangeContent` |
| `pE30` | `man30430` | after warp | Personality-specific companion lines and the final Minfilia conversation |

Recovered non-cutscene methods wired by the implementation:

- `processEvent000_20` — “Bury a crystal here?” confirmation;
- `processEvent000_22(4)` — missing Lightning Crystal message;
- `processEvent001_2` — Hedyn's accepted-quest reminder;
- `processEvent001_3(4)` — Memezofu's explanation of Unaspected Crystals and the Silvertear conversion;
- `processEvent001_5` — Cenmin's Unaspected Crystal commentary;
- `processEvent001_6(4)` — Cliaux's instructions to bury Lightning Crystals at Silvertear Lake;
- `processEvent005_1` — Hedyn's post-turn-in direction to Minfilia;
- `processEvent005_2` — Cenmin's post-turn-in Silvertear research commentary;
- `sqrwa(26500, 1, 1, 2)` — final reward window.

Dialogue rows `469..480`, `483..486`, and `459..468` remain available in the client scenario for ambient speakers, but none are required to advance the recovered journal route. Memezofu now exposes rows `481..482` from his in-game captured Ashcrown position, and Cliaux exposes rows `487..488` from an in-game verified placement; together they explain the Lightning Crystal conversion mechanic requested by journal row `214`. Rows `504..505`, formerly unattributed in the classic quest-function atlas, are exposed as optional post-turn-in chatter through Cenmin and Hedyn. Cenmin's ownership is supported by his repeated claim to mastery of beast-tribe dialects; Hedyn's line provides the transition back to Minfilia. These ownerships are evidence-backed reconstructions rather than labels preserved by the client method names themselves.

## Cutscene actor packages

All four installed cutscene packages are valid and were cross-checked against replay metadata.

- `man30400`: Minfilia, player, Path companion, Hedyn, Sylph representatives, Ashcrown object actors, Nyxia, Gonaxia, and Pannixia.
- `man30410`: player, Path companion, Consortium staff, and Sylph representatives.
- `man30420`: Minfilia, player, Path companion, and the Waking Sands assembly cast.
- `man30430`: Minfilia, player, Path companion, and staff used by the final conversation.

The recovered director bytecode is an empty quest-director subclass, so the server director only supplies what runtime progression needs: the player's actual Path-companion actor and content-group membership. Scene dressing remains client/cutscene-owned. Content creation is anchored to public zone `181`, including direct GM entry, so it cannot accidentally clone whichever zone the tester currently occupies. It uses the normal content group with an all-disciplines entry policy, matching the quest's “All classes” metadata instead of rejecting a crafter or gatherer at a dialogue-only scene.

## Journal proof

The `xtx_quest` formula selects these exact journal rows:

- sequence `0` → row `214` (gather five at Silvertear Falls);
- sequence `5` → row `242` (return to Hedyn);
- `10 <= sequence < 20` → row `215` (return to the Waking Sands with the Paragon information);
- sequence `20` → row `216` (ask the Path companion after Minfilia's assembly);
- sequence `25` → row `217` (Minfilia has revealed her intent to negotiate with the tribes).

The same formula displays item `11000096 × counter0` only while the sequence is below 10.

## Rewards

The authoritative SQL reward rows are:

- `102,000 gil` (`dat-new`);
- `26,500 EXP` (`wiki`).

Both are `autoGrant = 1`. The quest script opens the recovered reward window and calls the central completion path; it does not manually duplicate either reward.

## Recovery and verification

Named GM checkpoints:

```text
!questcomplete man304 soil
!questcomplete man304 turnin
!questcomplete man304 assembly
!questcomplete man304 companion
!questcomplete man304 reward
```

For a full soil pass, give the test character five Lightning Crystals with the normal GM item command, then visit each of the five visible quest markers.

Static cross-layer validation:

```text
python tools/validate_forever_taken_man304.py
python tools/validate_quest_availability.py
```

These checks cover the sequence/event route, five flags and markers, actor classes and spawns, private companion director, item constraint, SQL rewards, runtime MSQ cap, availability classification, and test checkpoints.

## Source inventory

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man304.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectoreventman30401.lua`
- `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_asset_crosscheck.csv`
- `docs/Dat Mining/man304.csv`
- `docs/Dat Mining/xtx_quest.csv`
- `docs/Dat Mining/xtx_journalxtxWil.csv`
- `docs/Dat Mining/quest_marker.csv`
- `docs/Dat Mining/cutReplay.csv`
- `docs/Dat Mining/quest_reward.csv`
- `Data/sql/gamedata_items.sql`
- `Data/sql/gamedata_quest_rewards.sql`

External cross-checks used during recovery:

- Gamer Escape's Lightning Crystal record associates the item with the obsolete quest Forever Taken: <https://ffxiv.gamerescape.com/wiki/Lightning_Crystal>
- Square Enix's patch 1.20 notes explicitly mention enemy-placement adjustments affecting Forever Taken: <https://forum.square-enix.com/ffxiv/threads/32606-patch1.20-Patch-1.20-Notes?p=476416&viewfull=1>
