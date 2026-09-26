# Lord Errant (Man308) Decomp Notes

> Superseded by `lord_errant_man308_decomp_2026-08-14.md`, which incorporates
> the supplied period footage, corrected installed-client asset sizes, the
> recovered battlefield transforms, and the completed quest delivery.

Quest: `110017`, `Man308`, level 38 main scenario.

Local script: `Data/scripts/quests/man/man308.lua`
Scaffold config: `Data/scripts/quests/generic_quest_scaffold.lua`
Recovered client script: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man308.lua`
Recovered director shells:

- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectoreventman30801.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectoreventman30802.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman30801.lua`

Text sheet: `docs/Dat Mining/man308.csv`
Marker sheet: `docs/Dat Mining/quest_marker.csv`
Replay sheet: `docs/Dat Mining/cutReplay.csv`

## Short Version

`Man308` is still a hidden generic scaffold locally. The recovered scenario script is rich, but the recovered directors are empty subclasses of `QuestDirectorBaseClass`, so there is no local proof for route sequencing, fight orchestration, negotiation state, reward selection, or instance cleanup.

Safe fixes applied in this pass:

- Corrected the hidden `Man308` scaffold owner from Minfilia display id `1100449` to Minfilia actor class `1000843`.
- Corrected the same display-id bug for the hidden `Man402` and `Man406` scaffolds, because they were adjacent main-scenario rows with the same owner id.
- Added shared personality-row helpers and recovered SNPC sexuality-to-skin bucketing in `scenario_decomp_helpers.lua`.
- Added shared quest-info accept/decline helpers, guarded quest-data counter tuple helpers, and a cut-replay SNPC argument helper.
- Added local Man308 probe metadata/constants plus shared Man308 row helpers for the recovered personality branches.

Do not wire completion, rewards, negotiation, captive mobs, or after-warp sequence advancement yet.

## Local State

`Data/scripts/quests/man/man308.lua` exposes recovered probe metadata, actor/mob constants, and helper accessors, then calls `InitQuestScaffold("Man308")`.

The scaffold remains hidden because generic scaffolds require `offer = true`, and `Man308` does not set it. If someone enables it later, it now points at Minfilia actor class `1000843` instead of display id `1100449`.

`generic_quest_scaffold.lua` also has `Man308 = { complete = "processEvent090" }`. Treat this as a scaffold smoke hook for probing `man30890`, not proof of the retail completion route or reward handoff.

## Cutscene Matrix

| Method | Scene | Fade behavior | Payload notes |
| --- | --- | --- | --- |
| `pES` | None | Talk/quest-info only | Personality-specific opening rows, then `showQuestInfomation`; if accepted, another personality-specific row triplet. |
| `pE00` | None | Talk only | Replays the accepted `pES` personality row triplets. |
| `pE01` | `man30800` | Default fade | SNPC5 scene. |
| `pE10` | `man30810` | Default or after-warp | SNPC5 scene; boolean arg selects default fade when true, after-warp fade otherwise. |
| `pE20` | None | Talk only | One personality-specific companion row. |
| `pE30` | `man30830` | After-warp fade | SNPC5 scene. |
| `pE50` | `man40640`, then `man30850` | Default or after-warp | Starts an SNPC HQ cutscene for `man40640`, then an SNPC NQ cutscene for `man30850`; boolean arg controls fade-in branch. |
| `pE60` | `man30860` | Default fade | SNPC5 scene. |
| `pE80` | `man30880`, then `man30890` | Default fade | Two SNPC NQ scenes in one wrapper. |
| `processEvent090` | `man30890` | Default fade | Non-SNPC scene route for replay/standalone use. |
| `pE90` | `man30900` | After-warp fade | SNPC5 scene; belongs to the handoff into the next scenario surface. |

Replay rows `11001701` through `11001709` map to `man30800`, `man30810`, `man30830`, `man40640`, `man30850`, `man30860`, `man30880`, `man30890`, and `man30900`.

`man40640` is unusual here: it appears under `Lord Errant` replay id `11001704` and inside `Man308.pE50`, even though the scene key looks like a later `Man406` asset.

Scene inventory adds one orphan caveat: `man30820` exists as a client cutscene asset, but there is no recovered `Man308` wrapper method and no `cutReplay` row for it. Keep it asset-only until runtime proof shows where it belongs.

Asset inventory sizes:

| Scene | Asset size |
| --- | ---: |
| `man30800` | `89462` |
| `man30810` | `63239` |
| `man30820` | `49074` |
| `man30830` | `16367` |
| `man40640` | `22007744` |
| `man30850` | `4778207` |
| `man30860` | `9422` |
| `man30880` | `2358350` |
| `man30890` | `94781` |
| `man30900` | `45045` |

Cut-replay SNPC placeholders use the same raw SNPC tuple as live `delegateSnpcEvent` calls and the cutscene-book packet: nickname, skin, personality, coordinate, initial town. The replay client converts placeholder `-202` from raw skin to actor class before direct SNPC scene playback.

## Personality Rows

`pES` first says a personality-specific opening triplet. The decomp output contains invalid `break` statements, so treat this as mutually exclusive branch damage:

| Personality | Rows |
| --- | --- |
| `1` | `330`, `339`, `348` |
| `2` | `331`, `340`, `349` |
| `3` | `332`, `341`, `350` |
| `4` | `333`, `342`, `351` |
| `5` | `334`, `343`, `352` |
| `6` | `335`, `344`, `353` |
| `7` | `337`, `346`, `355` |
| `8` | `336`, `345`, `354` |
| `9` | `338`, `347`, `356` |

If quest information returns accepted, `pES` uses the same triplets as `pE00`:

| Personality | Rows |
| --- | --- |
| `1` | `357`, `366`, `375` |
| `2` | `358`, `367`, `376` |
| `3` | `359`, `368`, `377` |
| `4` | `360`, `369`, `378` |
| `5` | `361`, `370`, `379` |
| `6` | `362`, `371`, `380` |
| `7` | `364`, `373`, `382` |
| `8` | `363`, `372`, `381` |
| `9` | `365`, `374`, `383` |

`pE20` uses a single personality-specific line:

| Personality | Row |
| --- | --- |
| `1` | `624` |
| `2` | `625` |
| `3` | `626` |
| `4` | `627` |
| `5` | `628` |
| `6` | `629` |
| `7` | `631` |
| `8` | `630` |
| `9` | `632` |

Shared helpers now available for this pattern:

| Helper | Use |
| --- | --- |
| `getPersonalityRows(personality, rowsByPersonality, defaultRows)` | Maps a personality id to a row or row list. |
| `getPlayerSnpcPersonalityRows(player, rowsByPersonality, defaultRows)` | Same lookup using the player's SNPC personality. |
| `unpackPersonalityRows(personality, rowsByPersonality, defaultRows)` | Convenience unpacker for cutscene/talk calls. |
| `getSnpcSexualityToSkin(personality)` | Mirrors recovered `QuestBaseClass.getSnpcSexualityToSkin`: odd personalities map to `1`, even personalities to `2`, default `1`. |
| `getSnpcReplayArgList(player)` | Returns the raw cut-replay SNPC tuple: nickname, skin, personality, coordinate, initial town. |
| `getSnpcCutsceneArgList(player)` | Returns the direct SNPC scene tuple with slot 2 already converted from skin to actor class id. |
| `isQuestInfoAccepted(result)` / `isQuestInfoDeclined(result)` | Normalizes old `showQuestInfomation` returns for accept/decline branches. |
| `delegateEventAndAdvanceIfAccepted(player, quest, eventName, nextSequence, ...)` | Delegates an event, then advances only when the quest-info result is accepted. |
| `getQuestDataCounters(quest, count, defaultValue)` / `unpackQuestDataCounters(...)` | Reads guarded `$E8`-style counter tuples for journal reconstruction. |
| `getMan308OpeningRows(...)` / `getPlayerMan308OpeningRows(...)` | Maps SNPC personality to the `pES` opening row triplets. |
| `getMan308AcceptedRows(...)` / `getPlayerMan308AcceptedRows(...)` | Maps SNPC personality to the `pES` accepted / `pE00` row triplets. |
| `getMan308Pe20PersonalityRow(...)` / `getPlayerMan308Pe20PersonalityRow(...)` | Maps SNPC personality to the recovered `pE20` single-row branch. |
| `delegateSnpcEventAndAdvanceIfAccepted(...)` | SNPC variant of the accepted-only advancement helper; keep unused until a route owner is proven. |

## Talk Helpers

Recovered non-scene helpers:

| Method | Rows / behavior |
| --- | --- |
| `processEvent020_1` | Says row `20`. |
| `processEvent020_2` | Says row `21`. |
| `processEvent090_1` | Says row `600`. |
| `processEvent090_2` | Says rows `601`, `602`. |
| `processEvent090_3` | Says rows `603`, `604`. |
| `processEvent090_4` | Says rows `605`, `606`. |
| `processEvent090_5` | Says rows `607`, `608`. |
| `processEvent090_6` | Says row `620`. |
| `processEvent090_7` | Says row `621`. |
| `processEvent090_8` | Says row `622`. |
| `processEvent090_9` | Talk-turn rows `609`, `610`. |
| `processEvent090_10` | Talk-turn row `611`. |
| `processEvent090_11` | Talk-turn rows `612`, `613`. |
| `processEvent090_12` | Talk-turn rows `614`, `615`. |
| `processEvent090_13` | Talk-turn rows `616`, `617`. |
| `processEvent090_14` | Talk-turn rows `618`, `619`. |

None of these helpers proves the retail sequence owner by itself.

## Journal Data Notes

`xtx_quest.csv` row `110017` selects journal text by `$E8(1)`, with one split on `$E8(3)`:

| Sequence expression | Journal row | Notes |
| --- | --- | --- |
| `$E8(1) == 0` | `218` | Opening state. |
| `$E8(1) == 5` | `219` | Early intermediary state. |
| `10 <= $E8(1) < 20` and `$E8(3) != 1` | `220` | Main mid-quest state. |
| `10 <= $E8(1) < 20` and `$E8(3) == 1` | `221` | Variant mid-quest state. |
| `$E8(1) == 20` | `222` | Final journal state. |

Summary rows reference `254`, `255`, `256`, `257`, and `258`.

The local scaffold currently returns generic `{0, 0}` journal args through `generic_quest_scaffold`; do not add real journal counters until the route is implemented.

`getQuestDataCounters(quest, 4, 0)` now covers the common `$E8(1)` through `$E8(4)` journal tuple shape, but Lord Errant should keep the scaffold default until the actual route starts setting those counters.

## Combat And Negotiation Notes

External data points say this is combat content:

- Wiki archive rows classify the main-scenario `Lord Errant` entry as `Combat` with giver `Path Companion`.
- `xtx_negotiationTable.csv` has repeated `Lord Errant` parley/concede rows.
- `server_battlenpc_mob_types_loot.sql` contains `tempered_captive` mob types `2289001`, `2289002`, and `2289003`, labelled `Paglth'an, Lord Errant, Thaumaturge captive variant 1/2/3`.

Those are strong hints, not route proof. The recovered Man308 directors are empty, so spawning captives, negotiation state, success/fail conditions, and post-fight cutscenes still need runtime capture.

## Actors And Markers

Important actor/display rows:

| Id | Meaning |
| --- | --- |
| `1100449` | Minfilia display name id. |
| `1000843` | Minfilia actor class used by existing local main-scenario scripts. |
| `1000844` | Alternate Minfilia actor class, also display id `1100449`. |
| `1100170`-`1100179` | Display-name range: Allene, Ardara, Avalbane, Bidelia, Brianna, Caelan, Cailean, Caitlyn, Catriona, Ceana. |
| `1001336` | Talk-capable actor class with display id `1100178` / Catriona. |
| `1001607` | Talk-capable actor class with display id `1100174` / Brianna. |
| `2289001`-`2289003` | Tempered captive actor classes / mob types used by the Lord Errant combat data. |

Marker highlights:

| Marker | Notes |
| --- | --- |
| `11001701` | Quest marker at `1239, 746`, target `4000257`, layout `104/405`. |
| `11001702` | Quest marker at `1140.66, 831.79`, target `4000257`, layout `104/405`. |
| `11001703` | Current scaffold marker at `-431, 187`, target `1600179`, layout `101/121`. |
| `11001704` | Quest marker at `-235, 51`, target `4000257`, layout `104/421`. |
| `11001705` | Quest marker at `991.84, 962.52`, target `4000257`, layout `104/405`. |
| `11001706` | Quest marker at `1001.88, 982`, target `4000550`, layout `104/405`. |
| `11001707` | Quest marker at `1004.17, 982.16`, target `4000551`, layout `104/405`. |
| `11001708` | Quest marker at `992.24, 979.31`, target `4000257`, layout `104/405`. |
| `11001709`-`11001720` | Generic marker rows at `-431, 187`, target `1600179`, shared icon `i11000101`. |

## Reward Risk

Rewards are not safe to auto-grant yet:

- `xtx_quest.csv` notes reward none in the quest metadata.
- `Data/sql/gamedata_quest_rewards.sql` has DAT-derived `114000` gil plus wiki-derived `32500` EXP.
- `docs/Dat Mining/quest_new_reward.csv` and `quest_reward.csv` encode older reward payloads that need widget/runtime interpretation.
- `Data/scripts/shop_prices.lua` contains a `110017` lightning-crystal shop row, but that is not proof of a completion reward.

Keep `Man308` reward completion disabled until the real completion event and reward widget are captured.

## Probe Commands

Use scene-only probes first, across several SNPC personalities if possible:

```text
!questdelegate quest:110017 pES @snpc5
!questdelegate quest:110017 pE00 @snpc5
!questdelegate quest:110017 pE01 @snpc5
!questdelegate quest:110017 pE10 @snpc5 true
!questdelegate quest:110017 pE10 @snpc5 false
!questdelegate quest:110017 pE20 @snpc5
!questdelegate quest:110017 pE30 @snpc5
!questdelegate quest:110017 pE50 @snpc5 true
!questdelegate quest:110017 pE50 @snpc5 false
!questdelegate quest:110017 pE60 @snpc5
!questdelegate quest:110017 pE80 @snpc5
!questdelegate quest:110017 processEvent090
!questdelegate quest:110017 pE90 @snpc5
```

For `pE10`, `pE30`, `pE50`, and `pE90`, capture event close, scheduled warp/fade, area state, and relog behavior before adding any sequence advancement.

## Follow-Up Work

- Recover the real route owner for the Path Companion offer and Minfilia handoff.
- Capture the negotiation table entry and determine whether parley/concede gates quest data, fight state, or both.
- Identify where `tempered_captive` actors spawn and which success/fail conditions advance the quest.
- Probe the `man40640` plus `man30850` pair before wiring `pE50`; the scene pairing is unusual and easy to mis-sequence.
- Resolve whether `pE90` / `man30900` is still part of `Lord Errant` completion or a hard handoff into the next scenario surface.
