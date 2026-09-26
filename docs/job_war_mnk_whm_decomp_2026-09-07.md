# Warrior, Monk, and White Mage: raw client decompilation review

This review covers all eighteen requested `0j1`–`0j6` quests: Warrior `111201`–`111206`, Monk `111221`–`111226`, and White Mage `111241`–`111246`. It recovers the client event contract and separates it from the server dispatcher, battle lifecycle, and persistent placements that the client chunks do not contain. No runtime behavior was changed for this analysis.

The most consequential corrections are:

- **War0j6 finishes its final conversation at the Silver Bazaar.** The direct journal explicitly says so. The cave marker cannot be promoted to a reward return solely because it appears first in the marker family.
- **War0j1 `processEventClearAfter` belongs to Neale.** It is the promised report to the Astalicia, not more dialogue for Curious Gorge. Automatically appending it to Gorge's reward interaction gives the wrong NPC Neale's pirate speech.
- **Mnk0j6 `processEvent020` belongs to Widargelt.** Its speaker thanks the player and “the teacher” and gives the fifth armor piece. Erik's separate methods direct the player to Widargelt at Silvertear Falls.
- **Mnk0j6's fourth pre-scene argument is type-sensitive.** Only boolean `true` selects `startFadeInCutSceneDefault`; every other Lua value selects `startFadeInCutSceneAfterWarp`. Numeric `1` is not a substitute.
- **Whm0j1 deliberately splits an open talk turn across two methods.** `Clear` opens it; `ClearNQ` fades out and closes it before the scene. A generic cleanup between those methods changes the recovered ordering.
- **Firebound Wrath has a recoverable actor identity.** Combat actor `2204610` maps to display `3204607`; the outstanding WHM50 work is its combat profile and encounter ownership, not its name/actor binding. The other three unresolved Wrath families cannot be resolved by guessing numeric suffixes.

## Evidence and completeness

Raw Lua chunks are under `tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/{war,mnk,whm}`. The newer-readable `.lua` files are not used to decide control flow: several fabricate repeated `showQuestInfomation()` calls when the bytecode actually stores one result and returns that register.

The independently reviewed subset contains **217 methods including eighteen `initText` methods, 199 other methods, 23 equality instructions, and all 46 equality edges**. Its inert evaluator records 241 distinct call/return traces using explicit branch representatives and symbolic passthrough item arguments. It never executes a game API. Every distinct ordered call sequence was compared against the parent pass's symbolic decompilation for all 199 non-init methods: **zero mismatches in PCs, receivers, or arguments**. This verifies the client call surface, not runtime quest completion.

Reproducible review outputs:

- [Review generator](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/build_review_catalog.py), [summary](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/review-summary.json), [method inventory](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/review-methods.csv), and [cross-check](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/universal-crosscheck.json).
- Each quest has a `.calls.md` containing **every method, every distinct call sequence, exact call PCs/byte offsets, returns, schedulers, waits, and referenced English dialogue**, plus `.bytecode.txt` and `.review-traces.json` alongside it. Links below lead to the full per-quest evidence.
- [Journal predicates and English entries](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/journal-contracts.md), [structured journal evidence](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/journal-contracts.json), and [43 non-placeholder quest markers](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/quest-markers.json).
- [Eight director and fifteen quest-named monster shells](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/actor-director-shells.json), their [raw disassembly](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/actor-director-shells.bytecode.txt), and the [twelve-scene review](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/scene-review.json).
- The common pass provides [initial scene placements](../outputs/job-gc-decomp-20260907/scene-placements.csv), [all-block typed SetPos clips](../outputs/job-gc-decomp-20260907/scene-timeline-placements.csv), per-scene source hashes/full actor dictionaries/typed timelines under `scenes/`, and symbolic predicate templates under `reconstructed/`. The focused [typed timeline totals](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/typed-timeline-summary.json) and [selected raw clips](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/typed-timeline-samples.json) preserve the later-track evidence discussed below.

Rebuild the call review from the repository root with:

```powershell
python outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/build_review_catalog.py
python outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/refresh_scene_review.py
```

In this report, `arg4` means Lua register `R3`, the fourth formal parameter after `quest`, `player`, and `eventOwner`. `arg5` is `R4`. These are neutral names: assigning a semantic name requires evidence from the branch or API use. The two-parameter `onJobQuestComplete*` methods contain only `quest` and `player`. “No return” means `RETURN` emits zero values. All eighteen offer methods call `showQuestInfomation()` once, test its stored result against numeric `1`, and return that same result; the non-`1` branch is not restricted to numeric zero.

The journal's `$E4($E8(1), n)` values below are **text-selection predicates**, recovered from `xtx_quest.csv`; they are not a recovered server sequence enum. The map values are DAT map-area identifiers. All marker entries lack a terrain height, facing, actor-instance ID, and dispatch owner. `4000257` is a display-name value for `???`, not a verified trigger actor class.

The [verification record](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/report-verification.json) checks the twelve original scene hashes, all 160 actor-record byte ranges, all 4,179 clip-record byte ranges, and the float payloads of all 574 SetPos clips. It also rechecks the independent 199-method comparison and every local link in this report. This validates the recorded evidence, without executing client scene-control code.

## All scene calls and fade endings

All thirteen NQ callers are listed here. `Default → scene → Default` describes only the named calls inside that method; it does not prove the surrounding server performs no transport. The scene APIs receive no numeric destination coordinates in these eighteen scenarios.

| Quest / method | Exact `startNQCutScene` arguments | Final helper | Source CALL offset |
| --- | --- | --- | --- |
| War0j3 `processEvent005(arg4)` | `("war0j310", 1, 0, arg4)` | Default | `0x769` |
| War0j6 `processEvent010` | `("war0j610", 1)` | Default | `0x758` |
| War0j6 `processEvent020` | `("war0j620", 1)` | Default | `0x8F5` |
| Mnk0j1 `processEvent010` | `("mnk0j110", 1)` | Default | `0xABD` |
| Mnk0j3 `processEventClear` | `("mnk0j310", 1)` | Default | `0xE8A` |
| Mnk0j6 `processEvent005(arg4)` | `("mnk0j610", 1)` | Default iff `arg4 == true`; otherwise AfterWarp | `0xD62` |
| Mnk0j6 `processEvent015` | `("mnk0j620", 1)` | AfterWarp | `0xE5F` |
| Whm0j1 `processEventClearNQ` | `("whm0j110", 1)` | Default | `0xEFB` |
| Whm0j2 `processEventRAYAOSENNAStart` | `("whm0j210", 1)` | Default | `0x392` |
| Whm0j4 `processEventNQ` | `("whm0j410", 1)` | Default | `0xD18` |
| Whm0j6 `processEventCutSceneBeforeBattle` | `("whm0j605", 1)` | Default | `0xA80` |
| Whm0j6 `processEventNQ` | `("whm0j610", 1)` | Default | `0x1011` |
| Whm0j6 `processEventNQ03` | `("whm0j610", 1)` | Default | `0x1825` |

`Whm0j4.processEventNQ` requests one return value from the NQ call, immediately overwrites its register for the fade-in, and returns no value. It does not branch on scene success. `Whm0j6.NQ` and `NQ03` have identical instruction bodies apart from file offsets; their existence is not evidence for two successive replays of `whm0j610`.

The recovered `ScenarioBaseClass` is a class-definition shell. The named fade/NQ helper bodies are not present in its local chunk; tracing their inherited/native implementation is a separate boundary. In particular, the existence of `AfterWarp` is a synchronization requirement to investigate, not a recovered destination or authorization to call a guessed zone change.

## Warrior

### 111201 — War0j1 — Pride and Duty (Will Take You from the Mountain)

[All calls, branches, dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j1.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j1.bytecode.txt)

`processEventStart(arg4)` opens Neale's talk turn. Numeric `arg4 == 1` selects text `2`; other values select `39`, then both paths converge on `3,4,37,5,6,7,38,8,9,10`. The offer's accepted branch says `12`; the other says `11`. One offer CALL at `pc77/0x3F7` supplies the returned result. `StartAfter` is Neale's travel reminder (`13`).

`processEventCurious` is the distinct Gorge handoff: `14,15,16,17,18,19,40,20,34`, with the explicit `1.5`-second pause and scheduler calls preserved in the transcript. Text `20` directs the player north to the antling nest. `CuriousAfter` repeats that instruction (`21`); it is not a battle trigger. The direct journal selects Sea `337` (find Gorge), `338` (kill antling workers; up to three helpers), and `339` (return to Gorge's cave).

`processEventClear` is Gorge's post-victory speech, including the player's `354111488` scheduler, ending the talk before world text `33`. `processEventJob(arg4)` shows item `arg4`, waits `6`, opens long text `42`, waits `8`, shows ability `(27186,1)`, and waits `6`. The chunk does not grant the item/action or select the item ID.

`processEventClearAfter`, starting `0xBD5`, speaks Neale's `35,36` about the captain and rum. The initial journal Sea `336` expressly mentions reporting back to the Astalicia. This is separate NPC ownership, not an automatic continuation on Curious Gorge. The runtime's automatic `completeAfter` hook therefore has a concrete dialogue-ownership discrepancy.

There is no NQ caller or explicit warp in this scenario. Markers `11220001/03` identify Gorge's cave, and `11220002` is the fight area. The exact Antling Worker identity is `2203001`; the client director `QuestDirectorWar0j101` is an empty SimpleQuestBattle subclass. Its chunk supplies no count, spawn transform, kill threshold, or post-battle callback. Four private copies remain adapter policy.

### 111202 — War0j2 — Embracing the Beast

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j2.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j2.bytecode.txt)

`processEventCURIOUS_GORGEStart` is the offer; it temporarily closes and restarts the talk during the animated explanation, then returns one stored offer result (`CALL pc95/0x410`). Accepted text is `17`; declined text is `16`. The `_1` method is a prerequisite/level hint (`2` and world `3`); `processEvent000` is an active-objective reminder (`18,19`). Neither is an additional objective.

The three two-parameter completion hooks are exact: `First` opens a long world-text `51119` widget; `Second` calls `showGetJobAbilityWidget(player,27187,1)`; `Third` calls `showEventBeforeNpsLS(1600318,75)`. The latter ID is Curious Gorge's display identity, not his actor class `1060028`. There is no scenario NQ scene or fade/warp helper, and no target-kill check inside these hooks.

Journal Wil `470` names Sirocco near Humblehearth and recommends **three companions, four people total**. The private adapter's three-total cap is a different policy. Marker `11220101` is map `301`, X/Z `(-414.890015,-606.409973)`. Current combat identity `2100309/3097` is useful to the adapter, but the marker gives no spawn Y, facing, or public trigger; the scenario gives no Sirocco phase algorithm.

### 111203 — War0j3 — Curious Gorge Goes to the Bazaar

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j3.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j3.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/war0j310.json)

The offer `processEventCURIOUSGORGEStart` accepts with `15` or declines with `14`. `processEvent_hint` and `processEvent000_2` are hint/reminder methods. The direct journal resolves a critical split: Wil `497` is the northern condor fight, `498` says to go to the east gate after killing those condors, and `499` describes witnessing Gorge's frenzied slaughter and returning to visit him. These are three distinct beats, not one generic battle-to-reward transition.

`processEvent005(arg4)` is the east-gate aftermath scene. It passes `arg4` unchanged as the fourth NQ API argument: `startNQCutScene("war0j310",1,0,arg4)`, CALL `pc8/0x769`. The semantic source of `arg4` is not recovered. `processEvent010` is the later conversation with Gorge, including `startFadeOut(player,1)`, `_wait(2)`, and `startFadeIn(player,1)` during its presentation; the transcript is authoritative for every wait/scheduler. `Kokuti` opens long text `34`, waits `8`, shows `(27188,1)`, and waits `6`.

Markers `11220201` and `11220202` are respectively the northern battle and east-gate aftermath destinations; `11220203` is the cave return. The scene's PC setup is `(-1342.656738,56.699459,489.328949)` at `0xA1790`, and Gorge's is `(-1363.922607,56.174923,522.639893)` at `0xA18D0`. These confirm scene staging in the hamlet; they are not spawn recipes. Its three Vulture labels use scene actor `1001084`, whose local display mapping is generic, rather than combat Canyon Condor `2201208`. Three visible scene birds do not recover the earlier fight's count. `QuestDirectorWar0j301` has no child functions.

### 111204 — War0j4 — Looking the Part

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j4.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j4.bytecode.txt)

`processEventCURIOUS_GORGE_Start` is the offer, with acceptance `13` and rejection `12`. `Hint` and `Follow` are distinct dialogue variants. Text `11` says four armor locations are marked; text `16` explicitly says retrieval order is unimportant. Journal Wil `502` lists Cutter's Cry, Natalan, Turning Leaf, and Craneperch Tower.

`processEvent_getAF_info(arg4)` starts the **event owner's** scheduler `67108910`, then calls `showGetJobItemWidget(player,arg4,0)` at `pc7/0x6F7`. It has no return value, acquisition bitset, inventory grant, item/location comparison, or fourth-piece completion branch. The four grants known from local item data are `8051403,8071403,8081803,8013503`; their order must not be assigned to markers from list order alone.

There are no fades or NQ calls. Markers `11220301..04` supply four X/Z destinations but all display `4000257`; no coffer actor or unique ID is encoded there. Persisted independent acquisitions, exact interaction identity, and fourth-piece completion ownership remain server work. Gorge's `Follow` text `14` reminds the player to locate the four pieces and is not a completion method.

### 111205 — War0j5 — Proof is in the Pudding

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j5.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j5.bytecode.txt)

`processEventCURIOUS_GORGEStart` includes an ordinary fade around the conversation: out `(player,1)` at `pc15/0x29E`, a wait, then in `(player,1)` at `pc22/0x2BA`. It eventually accepts with `14` or declines with `13`. This is a local presentation cut; the method contains no NQ call or destination. `processEvent000` is Gorge's reminder (`15,16`).

Completion is split across long world text `51119`, ability `(27192,3)`, and `showEventBeforeNpsLS(1600318,77)`. Preserve the widget's final argument `3`; copying the level-35 reward's `1` would change the raw API contract. The scenario does not verify that a kill or drop has occurred.

Journal Wil `505` names Audhumbla at Iron Lake and recommends seven companions, eight total. The actor class is `2100804`, path `KujataHornedWar0j5`, display `3100804` = Audhumbla. Its recovered monster subclass is empty; no aggression phase, loot event, HP threshold, or exact combat profile follows from it. Marker `11220401` is map `104`, X/Z `(218.679993,-1771.75)`. Great Buffalo `2100801` is a different identity and cannot supply an exact missing Audhumbla profile.

### 111206 — War0j6 — How to Quit You

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j6.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/war0j6.bytecode.txt) · [entry scene](../outputs/job-gc-decomp-20260907/scenes/war0j610.json) · [aftermath scene](../outputs/job-gc-decomp-20260907/scenes/war0j620.json)

`processEventCURIOUS_GORGEStart` accepts with `13` or declines with `12`. `Hint` and `Follow` are pre-objective variants. `processEvent010` plays `war0j610`; `processEvent020` plays `war0j620`; both end with Default fade-in and neither calls AfterWarp. Do not invent an after-warp branch from the existence of a quest battle.

Journal Wil `508` sends the player to the Silver Bazaar; `509` distinguishes Broken Mountain's fight with Gorge from the player's later battle against enraged Gorge; `510` then says: **speak to Gorge once more at the Silver Bazaar**. The script reinforces this with `processEventCURIOUS_GORGE010Follow`, text `39`: the armor was not left in the cave, and the player should meet Gorge at the Bazaar. This defeats the earlier interpretation of `11220501` as a mandatory cave reward return. The journal identifies no post-fight cave journey.

`processEventClear(arg4)` is presentation only: long text `42`, wait `8`, ability `(27189,1)`, wait `6`, item `arg4`, wait `6`. The known final cuirass is `8032703`, but the raw method obtains it from the caller.

`war0j610` contains Gorge `1060028`, Broken Mountain `1001985`, and three Cliffdiver scene actors `1001982`. `war0j620` retains Gorge, Broken Mountain, and residents, but no Vulture entries. Gorge's aftermath setup is `(-1366.463745,56.164864,522.072998)` at `0x3BC84`; PC and Broken Mountain are nearby in the same Bazaar scene. That geography corroborates the journal, while still supplying no authoritative public spawn or post-scene warp transform.

Combat Gorge `2289037` and Cliffdiver `2201209` are distinct from those scene actors. `QuestDirectorWar0j601` derives from `QuestDirectorBaseClass`, has no methods, and supplies no kill predicate or choreography. The raw scene's three birds do not prove three combat adds. The actor controlling the final Bazaar talk, exact battle copies/waves, and handoff from content to that talk remain unresolved.

## Monk

### 111221 — Mnk0j1 — Brother from Another Mother

[All calls, branches, dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j1.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j1.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/mnk0j110.json)

`processEventGAGARUNAStart(arg4,arg5)` has a genuine two-input dialogue condition. At `pc48/0x384` and `pc50/0x38C`, **`arg4 == true OR arg5 == true`** chooses text `42`; otherwise it chooses `6`. Numeric `1` does not satisfy either boolean test. Both paths subsequently say `46`, call the offer once at `pc69/0x3D8`, then accept with `8` or decline with `7,37`.

`processEvent005` is Erik's handoff to Mythril Pit T-8 and the Runagate Imps. `000_1` and `005_1` are Gagaruna/Erik reminders. Wil journal `537` sends the player to Erik; `538` sends the party into the field; `539` is already the next-level notification, with no reward-NPC return objective.

`processEvent010` plays `mnk0j110` with Default fades. The two reward methods then split world `35` and `showGetJobItemWidget(player,arg4)` from long text `59` and ability `(27108,1)`. The latter methods do not establish their own actor, trigger, victory condition, or inventory mutation.

The scene dictionary contains `Mack=1060032` (Widargelt), `Emet=1060033` (Erik), and `NM_038=1001960` (a Runagate Imp scene shell). The combat actor is `2202611`, not `1001960`. PC setup is around `(1281.23,256.668,-170.937)`, but Erik's recorded setup is `(1.9052,0,-3.29266)`; these cannot all be naively interpreted as persistent world positions. `QuestDirectorMnk0j101` has no methods. Previously archived walkthrough notes supply a three-imp report; the raw chunk and scene dictionary do not recover the fight count or spawn formation.

### 111222 — Mnk0j2 — Insulted Intelligence

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j2.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j2.bytecode.txt)

`processEventERIKStart` is an extended offer with character turns, schedulers, and waits. Its accepted tail is `35,45`; declined tail is `16`; it returns the stored result of `pc149/0x527`. `ERIKStart_1` and `WIDARGELTStart_1` are availability/hint dialogue; `000` and `000_1` are active reminders. There is no NQ or fade/warp surface.

The direct journal Wil `541` requires **defeating Gluttonous Gertrude, then using the provided aetheriometer**. The order is explicit in the text. A kill-only transition to rewards omits an objective. The item is `11000552`, and `onJobQuestCompleteFirst` opens world text `(51124,11000552)`; `Second` presents `(27107,1)`; `Third` calls `showEventBeforeNpsLS(1000101,92)` for Erik's display identity.

The scenario does not itself implement use-item consumption or a location check. The current private adapter has a separate measurement boundary, which is materially closer to the journal than treating its reminder as another NPC step. Combat identity `2102010/3043` and marker `11221101` at map `101`, X/Z `(651.900024,235.089996)`, do not recover an exact public measurement trigger or battlefield placement. The journal recommends three companions, four total.

### 111223 — Mnk0j3 — The Pursuit of Power

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j3.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j3.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/mnk0j310.json)

`processEventStart` is Erik's offer, accepted tail `62`, declined tail `15`. `StartBefore` and `WidargeltHint` are availability variants. `processEventStartAfter` is a real **Widargelt** handoff at Little Ala Mhigo: the literal text says his measurements are not finished, tells the player to proceed to the Mun-Tuy Cellars, and promises he will bring his device later. It includes ordinary out/in fades of `1.5`, not a zone warp. `AfterTolk01`, `AfterTolk02`, and `WidargeltAfter` are conditional reminders, not three additional compulsory talks.

The journal is unusually explicit: Wil `544` (visit Widargelt), `545` (Prince of Pestilence), `546` (after defeating it, find a measurement point), `547` (next quest). Markers `11221202` and `11221203` are different points in map `311`; the latter cannot be discarded as a duplicate battle marker.

`processEventPoint` says `57`: an appropriate location, kill the Prince and set up the device. It does not perform either action. `processEventClear` opens ordinary widget `58`, emits `worldMaster:notify(quest,58,0)`, waits `3`, plays `mnk0j310` with Default fades, waits `1`, and emits world text `55`. This belongs to the **measurement** completion, not an arbitrary later Erik reward talk. `processEventAfget(arg4)` ignores `arg4`; it opens long `79`, waits `8`, presents `(27109,1)`, and waits `6`. Its name does not make it an armor acquisition.

The instrument `11000553` appears in text as the outdated aetheriometer. Prince of Pestilence `2100610/3081` is an exact current profile, but the measurement actor and full transform are still absent. `mnk0j310` records PC `(111.447418,0.652387,-80.126968)` twice and Widargelt nearby, quite unlike the map-marker frame; that is scene-local evidence, not a usable public coffer/point placement.

### 111224 — Mnk0j4 — Good Vibrations

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j4.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j4.bytecode.txt)

`processEventERIKStart(arg4)` never reads the extra argument. Its ordinary `(player,1)` fades occur at `pc34/0x35B` and `pc41/0x377`, well before the offer result at `pc172/0x583`. Acceptance says `17,18`; other results say `16`. `ERIKStart_1`, `WIDARGELTStart_1`, `000`, and `000_1` remain separate hint/reminder dialogue.

The exact completion contract is `openPublicInformLongDialogWidget(worldMaster,51125,11000555)`, `showGetJobAbilityWidget(player,27118,3)`, then `showEventBeforeNpsLS(2200241,93)`. The instrument is the Experimental Aetheriometer; the linkshell speaker is Widargelt, unlike the previous level's Erik callback. Do not normalize the action-widget mode `3` or substitute Erik's event `92`.

Wil `549` requires the measurement task northwest of Camp Horizon and identifies Apep as its danger; Wil `550` directs the next quest to Widargelt. The journal recommends seven companions. Apep's actor `2100723` maps to display `3100721`; its `BasiliskLesserMnk0j4` subclass is empty. Marker `11221301`, map `403`, X/Z `(-1670.089966,-1212.099976)`, is not a recovered BNPC or instrument-use transform. No NQ scene, phase threshold, drop handler, or instrument-destruction mutation is present in this scenario.

### 111225 — Mnk0j5 — Five Easy Pieces

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j5.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j5.bytecode.txt)

Widargelt's `processEvent_WIDARGELT_Start` accepts with `14,48..57` and declines with `13`. Its long acceptance tail describes the armor trial and destinations; this must not be lost by stopping immediately after the choice. `ERIK_Hint`, `WIDARGELT_Follow`, and `ERIK_Follow` are contextual conversations, not a return-NPC objective chain.

`processEvent_getAF_info(arg4)` runs scheduler `67108910` on the **event owner** and shows `(player,arg4,0)` at `pc7/0xB16`. It neither checks four acquired pieces nor completes the quest. Journal Wil `552` lists the four locations; `553` is already the next-quest message. The strongest contract is four independently persisted acquisitions followed by completion in place; an exact server dispatcher for the final acquisition is not recovered here.

The four Temple pieces are `8071402,8051402,8013502,8081802`; marker `11221401..04` destinations are Dzemael Darkhold, U'Ghamaro Mines, Turning Leaf, and the Sagolii overlook. No actor class, unique ID, terrain Y, facing, or confirmed per-marker item binding appears in the scenario/marker surface. There are no NQ scenes or fade calls to use as a placement source.

### 111226 — Mnk0j6 — Return of the King...of Ruin

[All calls, branches, dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j6.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/mnk0j6.bytecode.txt) · [entry scene](../outputs/job-gc-decomp-20260907/scenes/mnk0j610.json) · [aftermath scene](../outputs/job-gc-decomp-20260907/scenes/mnk0j620.json)

Erik's offer accepts with `59` and declines with `58,93`. The three Hint variants and `000_ERIK_Follow`/`000_WIDARGELT_Follow` are contextual dispatch surfaces. They cannot turn the existing Little Ala Mhigo Widargelt spawn into the Silvertear Falls destination.

`processEvent005(arg4)` plays `mnk0j610`, then tests **boolean true** at `pc7/0xD66`. Equality takes the Default fade-in at `pc11/0xD76`; inequality takes AfterWarp at `pc15/0xD86`. `processEvent015` plays `mnk0j620` and unconditionally calls AfterWarp at `pc9/0xE6B`. The safe caller must account for a live transition/synchronization owner; an already-completed unrelated return is not established by the scenario as equivalent.

Wil `555` sends the party to Silvertear Falls; `556` says Widargelt already annihilated Garlean soldiers and now must be subdued; `557` describes Erik's reprimand and then tells the player to comfort Widargelt. `processEvent020(arg4)` is that **Widargelt** talk: text `72` gives the fifth piece, followed by item `(player,arg4)` at `pc49/0xFCE` and a `6`-second wait. `processEventClear` separately presents long `115` and ability `(27106,1)`. `020_ERIC_Follow` (`74,75`) and `020_ERIC_PUB` (`79`) send the player to Widargelt; `WIDARGELT_PUB` (`78`) says he is at Silvertear Falls.

The `mnk0j610` dictionary includes Widargelt, Garlean scene actors, and four distinct Ala Mhigan scene shells: pikeman `1001978`, axeman `1001979`, bowman `1001980`, shaman `1001981`. That proves visual participation, not that every scene actor is a kill objective. The current private roster omits a bowman and uses its own four-target/all-kills policy. The raw director `QuestDirectorMnk0j601` is an empty **QuestDirectorBaseClass** subclass, not a SimpleQuestBattle subclass as one adapter comment states.

The aftermath dictionary is PC/Widargelt/Erik. Widargelt setup `(-138.751999,18.069799,353.735992)` at `0x8ACFC` is not the same X/Z as marker `11221502` `(-138.759995,345.190002)`; Erik's setup is all zero. Neither supplies a verified public Widargelt transform. The adapter's Erik return and three-total cap are explicit policy deviations from the destination-owned dialogue and seven-helper journal recommendation.

## White Mage

### 111241 — Whm0j1 — Seeds of Initiative

[All calls, branches, dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j1.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j1.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/whm0j110.json)

Soileine's `processEventStart` accepts with `6` or declines with `5`; `StartAfter` is her reminder (`7`). `processEventRayao(arg4)` checks numeric `arg4 == 1` at `pc4/0x6B5`: equal selects the returning-acquaintance greeting `9`; otherwise the first-meeting greeting `8`. Both continue through the same task explanation. This argument affects dialogue, not battle authorization.

The journal Fst `413/414/415` specifies Soileine → Raya's lakeside cave → Mun-Tuy thieves → recover Nirvana `11000551` → return to Raya. The Moogle `A/B00`, `A/B01`, `A/B02` variants and misspelled `RyaoAfter` are alternate conversations keyed to progress, not additional required talks. The moogle methods use `startCliantTalkTurnNoWait(1,player)`, which should not be silently changed to ordinary type-2 turns.

`processEventClear` opens Raya's talk and says `23,24`, then returns **without finishing the turn** (`pc17/0xE3C`). `processEventClearNQ` calls Default fade-out, finishes `eventOwner`'s turn at `pc4/0xEDF`, waits `1`, plays `whm0j110`, then Default fade-in. Keep that deliberate handoff intact. `processEventJob(arg4)` emits world `38`, shows the caller's item, waits `6`, opens long `52`, and waits `8`. `processEventKokuti(arg4)` ignores its extra argument and presents `(27344,1)` with a `6`-second wait.

The scene uses Raya `1001570`, Oha-Sok `1060030`, Pukni Pakk `1001937`, Kupcha Kupa `1001938`, and staff/prop `1200318`. PC and Raya share the same setup coordinates `(-1541,6.58,-1588.300049)`; Oha-Sok and both moogles also share one setup point. This is strong evidence **against** copying these entries directly into persistent spawn rows. The staff has no decoded spatial setup record. Combat Diremite/Miteling classes `2201115/2201114` are independent of those scene actors; the empty `QuestDirectorWhm0j101` does not recover their profiles, copies, loot transition, or spawn ownership.

### 111242 — Whm0j2 — When Sheep Attack

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j2.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j2.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/whm0j210.json)

`processEventRAYAOSENNAStart` opens a talk turn, plays `whm0j210` with Default fades, continues the offer speech, and only then calls the quest choice (`pc77/0x49E`). Both accepted and declined offers therefore play the scene. Acceptance says `14`; decline says `13`. `RAYAOSENNAStart_1`, Moogle `Start_1` variants, and `000/000_1/000_2` are availability and active reminders.

`processEvent005` is the full post-Downy-Dunstan report, not a simple ability callback. It waits for Raya's scheduler `79597568`, says `39..41`, runs the player's scheduler `67108919`, waits `3`, then calls `quest:sayFreeDisplayName(2600009,quest,42)` and the corresponding text `43` for **Oha-Sok**. This proves a free-speaker text path, not a required spawned Oha-Sok battle ally. It later opens long text `52`, waits `8`, shows `(27358,2)`, waits `6`, says `46` and world `47`, and closes the talk. `005_1/005_2` are the moogles' return comments.

`onJobQuestCompleteFirst/Second` are shorter alternate widget surfaces (ordinary text `52`, then `(27358,2)`). Appending them to the full `005` duplicates the ability presentation. The full method is the current adapter's completion hook.

Direct journal Fst `418` is the sheep objective, `465` is the return, and an additional selector **11** references Fst `463`, a linkpearl return instruction. Do not equate the two return journal variants with two mandatory chats. The scene dictionary has Raya/Oha-Sok/moogles, but **zero initial spatial placements**; later blocks contain 42 SetPos clips for actors bound to actor-class IDs, including cave staging detailed below. Marker `11222101` locates the public objective; no sheep spawn transform or public kill trigger follows from it. Current combat identity `2106017/3019`, with display `3106019` and skill list `6010`, is an exact adapter input, not a recovered field placement. [Current combat contract](../Data/scripts/directors/Quest/QuestDirectorJobWhm0j2.lua)

### 111243 — Whm0j3 — Lost in Rage

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j3.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j3.bytecode.txt)

`processEventRAYAOSENNAStart` accepts with `16`, declines with `15`, and returns the single result from `pc65/0x41B`. There is **no NQ scene or fade call** anywhere in this quest. The `Start_1` and `000_*` methods are Raya/moogle variants, not additional objectives.

Fst journal `421` names Cactuar Jack east of Camp Horizon; `464` says return to the cave after subduing it. `processEvent005` is Raya's report and reward presentation: dialogue `24,25,26,27`, long widget `31`, wait `8`, ability `(27357,2)`, wait `6`, `28,29`, world `30`, and talk closure. `005_1/005_2` are moogle comments. Unlike Whm0j2, there are no separate `onJobQuestCompleteFirst/Second` functions here to imitate.

The absence of an elemental manifestation is explicit in text `24`; it must not be translated into an extra spawned elemental objective. The exact current Cactuar Jack combat identity is `2100910/3009`. Marker `11222201` is map `403`, X/Z `(-881.289978,2.4)`, and `11222202` marks Raya's return cave. Public trigger actor, terrain placement, and any NM phase remain outside this client event library.

### 111244 — Whm0j4 — The Wheel of Disaster

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j4.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j4.bytecode.txt) · [scene](../outputs/job-gc-decomp-20260907/scenes/whm0j410.json)

`processEventStart` accepts with `15,48` or declines with `14`. `StartBeforeRaya/MogA/MogB`, `RyaoAfter`, and the Moogle `A/B00/01` methods are availability or progress conversations. Fst `424` identifies a bandit and minions at the land bridge south of Camp Bearded Rock, with up to seven helpers. Fst `425` then says the bandits are freed, Oha-Sok departs after an ominous warning, and the player must report to Raya.

`processEventNQ` is that **post-battle, pre-return** `whm0j410` scene. It uses Default fades; its NQ return register is ignored. `processEventLS` and `processEventLS2` independently call `showEventBeforeNpsLS(2700007,38)` and `(2700007,63)`. The script does not call one from the other or recover the dispatcher condition choosing them. Treat them as available linkpearl surfaces, not a proven serial pair.

`processEventClear` is the later Raya report. It includes an ordinary `1.5` fade during the explanation, then long `64`, wait `8`, `(27359,2)`, wait `6`, final dialogue and turn closure. Moving `NQ` into this reward-NPC interaction collapses the documented travel boundary.

The scene has only PC and Oha-Sok; both setup transforms are zero, but later typed clips place them at the Bearded Rock encounter location. It contains **no bandit roster** and does not prove Oha-Sok was a combat ally. Nearby actor classes `2289031..34` are still unjoined candidates. `QuestDirectorWhm0j401` is an empty SimpleQuestBattle subclass; the battle count, AI, exact trigger, victory owner, linkpearl selection, and gameplay placement remain unrecovered.

### 111245 — Whm0j5 — In Search of Succor

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j5.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j5.bytecode.txt)

`processEvent_RAYA_offer` accepts with `14,24,38..43` and declines with `13`. The accepted text identifies four enchanted chests that only a worthy white mage can perceive. `OTOMO_A/B_before`, `OTOMO_A/B_follow`, and `OTOMO_A/B_cfollow` are moogle variants. `RAYA_O_follow` has an unusual but literal order: scheduler and texts `17,44,21` occur **before** `startCliantTalkTurn`, then text `22` and closure. Preserve it in the decomp instead of “fixing” method order.

`processEvent_getAF_info(arg4)` opens long text `25`, waits `8`, runs the **event owner's** scheduler `67108910`, and shows `(player,arg4,0)` at `pc15/0xD6C`. It has no item-grant or four-piece test. Fst journal `428` lists Dzemael Darkhold, Zahar'ak, Turning Leaf, and Tiger Helm Island; `466` expressly requires a **return to Raya after all four are acquired**. `processEvent_RAYA_O_clear` says `47..52`, emits world `53`, and closes the turn; it does not show another armor item or ability.

This distinguishes WHM's coffer route from Monk's completion-in-place evidence. Marker `11222405` independently identifies the cave return. The four item IDs `8051406,8071406,8081806,8013506` do not establish marker-to-item identity, and no quest-owned coffer actor/Y/rotation is recovered. There are no NQ scenes or fades to fill those gaps.

### 111246 — Whm0j6 — The Chorus of Cataclysm

[All calls and dialogue](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j6.calls.md) · [bytecode](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j6.bytecode.txt) · [pre-battle scene](../outputs/job-gc-decomp-20260907/scenes/whm0j605.json) · [post-battle scene](../outputs/job-gc-decomp-20260907/scenes/whm0j610.json)

`processEventStart` accepts with `19`, declines with `18`. Its three availability methods, `RyaoAfter`, and Moogle `A/B00/01` variants are contextual dialogue. `processEventCutSceneBeforeBattle` explicitly plays `whm0j605`; `processEventNQ` and `NQ03` are identical wrappers for `whm0j610`. All end Default; there is no AfterWarp call in this scenario.

The direct journal distinguishes Fst `431` (quell the elementals southwest of Camp Bentbranch) from `432` (Oha-Sok rescues the player, becomes the final artifact, then return to Raya). Consequently, the post-battle scene and robe presentation precede the later cave report. `processEvent_getAF_info` is **not parameterized**: wait `.5`, long widget `(quest,49,8032706)`, wait `8`, item `(player,8032706)`, wait `6`. `processEventClear` opens Raya's turn, discusses the robe, includes an ordinary `1.5` fade, then long `50`, wait `8`, ability `(27345,1)`, wait `6`, and closes after the remaining dialogue/schedulers.

`processEventAfget(arg4)` is a separate presentation surface: wait `6`, `(27345,1)`, wait `6`, ordinary widget `(quest,49,arg4)`, wait `6`. It contains **no `showGetJobItemWidget`**. It cannot simply be appended to `getAF_info + Clear`; doing so repeats the ability presentation and changes widget ordering. Likewise, `NQ` and `NQ03` should not both be replayed merely because both exist.

The two scenes establish six elemental **scene roles**: Fire `1001966`, Ice `1001967`, Wind `1001968`, Earth `1001969`, Light `1001970`, Water `1001971`; the post-scene adds Oha-Sok `1060030`. `whm0j605` has no initial SetPos clips; all nine initial `whm0j610` positions are zero. Their later typed clips nevertheless recover substantial authored staging: 33 and 57 SetPos clips respectively for actors bound to actor-class IDs, including the six-elemental formation and the player's battlefield coordinates. These are detailed below. They do not establish six combat spawn points, count/wave rules, or a final victory predicate.

The local actor/name join recovers Firebound Wrath `2204610 → 3204607` in addition to Icebound `2204707 → 3204706` and Earthbound `2204907 → 3204906`. Only Ice/Earth currently have exact local mob profiles `3055/3020`; no Fire profile was found. Named wind/lightning/water displays `3204807/3205007/3205107` exist, but the tempting actor suffixes `2204807/2205007/2205107` currently map to **generic** displays `3204801/3205001/3205101`. The quest-named `21046xx`–`21050xx` script resources likewise carry generic elemental names. None of those numeric patterns proves the missing Wrath binding. [Recorded identity candidates](../outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/whm0j6-wrath-identity-candidates.json)

`QuestDirectorWhm0j601` is an empty QuestDirectorBaseClass subclass. A one-Icebound fight or six copies inferred from the six labels would remain an invented encounter. The pending contract includes three remaining exact actor bindings, four missing profiles including Fire, every multiplicity and wave/kill rule, private/public entry ownership, after-battle scene/robe timing, and Raya's verified public spawn.

## Placement and actor boundaries that survive this pass

The twelve referenced resources decode **160 full CACT slots, 99 actor-class entries, 222 blocks, 4,179 typed clips, and 574 SetPos clips**. Of the latter, 564 target an actor-class-bound slot, including PC class `0`. The initial-placement CSV contains 71 such rows. `mnk0j610` additionally has a stage `bg` actor without a class ID, whose zero SetPos at `0x6DD88` is excluded from that CSV. Bound-slot counts use an actor-index join to the explicit class-binding table, not a hardcoded numeric CACT kind. These counts describe cutscenes only. Identity and placement have to be tracked separately:

| Evidence | What is recoverable | What it does not establish |
| --- | --- | --- |
| Scenario Lua CALL | Exact method, receiver, argument ordering, branch condition, fade helper, return behavior | Server call order, authorization, target death, inventory mutation, content destination |
| Direct journal predicate | Text selected by a particular journal predicate; required narrative progression and stated helper recommendation | Full sequence dispatcher, timer, unique actor, auto-trigger implementation |
| Marker `1122xxxx` | Map-area ID, X/Z, visual/name hint | Actor class `4000257`, spawn Y/facing, coffer identity, kill or push callback |
| Cutscene actor dictionary | Scene alias/index, actor class reference, dictionary offset | Combat NPC class equivalence, battle objective, count of live enemies |
| Typed `SetPosClip` | XYZ/rotation, scene actor index, block, track, start value, flags, and byte offset | Runtime branch selection, binding/restoration semantics, persistent world placement or post-cutscene warp destination |
| Empty director/monster subclass | Class name and inheritance boundary | Server quest state machine, HP phases, waves, counts, loot, retry/cleanup lifecycle |

Mixed-frame and overlapping examples make the limitation concrete. Erik has a near-origin setup while the Mnk0j110 PC is around `(1281,257,-171)`; Erik is zero in Mnk0j620. WHM30's PC and Raya overlap, and its moogles overlap Oha-Sok. WHM45 and WHM50 contain zero-valued initial positions followed by nonzero positions in later blocks. WAR's multiple Vulture scene slots use scene classes different from the actual target classes. Recovering a usable gameplay position requires runtime branch/binding/restoration context or a separately verified world spawn.

## Later scene tracks: before battle, aftermath, and the position that survives

The final decoder resolves each clip through the scene's own class registry; record size alone is not the type. Actor kinds likewise use the String-pool/CATT registry, with actor-class bindings carried by the `ProxyActor` layout. The same numeric kind is not universal across scenes. [Native registry-loader evidence](../outputs/job-gc-decomp-20260907/reviews/gc/actor-clip-registry-native.md) identifies the CATT/CCPT consumers. None of the four size-only false positives found across the full 51-scene pack occurs in this twelve-scene subset, but the typed check is still required. Raw clip bytes, actor kinds, block/track IDs, flags, and start values are retained in each scene JSON. Offsets below refer to the original `client/cut/<scene>/<scene>` resource named and hashed there. Coordinates are `(X,Y,Z)` and angles are the decoded yaw in radians, rounded to six decimals for readability.

| Scene | Full actor slots / class entries | Blocks / typed clips | All SetPos / class-bound SetPos | Initial class-bound SetPos |
| --- | ---: | ---: | ---: | ---: |
| `war0j310` | 20 / 15 | 15 / 313 | 56 / 55 | 15 |
| `war0j610` | 21 / 16 | 24 / 429 | 59 / 58 | 16 |
| `war0j620` | 18 / 13 | 24 / 319 | 37 / 36 | 13 |
| `mnk0j110` | 10 / 4 | 6 / 336 | 22 / 21 | 4 |
| `mnk0j310` | 8 / 2 | 4 / 207 | 14 / 13 | 3 |
| `mnk0j610` | 19 / 14 | 41 / 680 | 156 / 155 | 1; classless `bg` excluded |
| `mnk0j620` | 9 / 3 | 6 / 402 | 25 / 24 | 3 |
| `whm0j110` | 12 / 7 | 28 / 444 | 65 / 64 | 5 |
| `whm0j210` | 11 / 6 | 27 / 421 | 43 / 42 | 0 |
| `whm0j410` | 6 / 2 | 10 / 91 | 6 / 6 | 2, both zero |
| `whm0j605` | 13 / 8 | 16 / 213 | 34 / 33 | 0 |
| `whm0j610` | 13 / 9 | 21 / 324 | 57 / 57 | 9, all zero |

### Warrior: Bazaar staging is recoverable; combat entry and return transforms are not

`war0j610` moves the PC from initial `(-1342.656738,55.812466,478.676086)` to block `c16`'s `(-1355.275513,55.917233,519.657166)`, yaw `-1.146015`, at `0x7FA14` (track 17, start 0, flags `0x00A0`). The same block places Vulture01 at `(-1370.322388,56.847866,522.267273)` / `0x7F900`, Vulture02 at `(-1364.703735,61.897221,526.299866)` / `0x7F854`, and Vulture03 at `(-1369.445435,60.799435,513.579346)` / `0x7F894`. The latter two use different flags, `0x007F` and `0x008F`; treating these flying scene actors as three stationary combat spawn rows loses that distinction.

`war0j620` similarly has later PC `(-1365.139160,56.179775,520.561646)`, yaw `-0.729006`, in `c07a` at `0x3E3E8`; Curious Gorge `(-1369.035278,56.119781,523.805420)`, yaw `-0.880008`, in `c12c` at `0x3E8C4`; and Brother `(-1350.943359,55.711998,517.578796)`, yaw `-0.721790`, in `c14` at `0x3DBA0`. These support a Bazaar aftermath together with the direct journal. They do not by themselves select the public Gorge spawn or prove which pose survives NQ teardown. The file stores `c14` before `c12c`; choosing the last file offset is not a valid final-pose algorithm. [Entry timeline](../outputs/job-gc-decomp-20260907/scenes/war0j610.json), [aftermath timeline](../outputs/job-gc-decomp-20260907/scenes/war0j620.json)

### Monk: measurement staging and an AfterWarp scene with several end-block positions

`mnk0j310` demonstrates why even repeated initial positions cannot settle the answer. In block `n_01-15`, PC is `(74.386353,-0.174532,-87.218788)`, yaw `-2.152410`, at `0xA00` (track 31, flags `0x0096`), and Mack/Widargelt starts at `(80.346603,-0.065230,-96.759903)` / `0xA98`. Later in the same block, Widargelt is `(75.163300,-0.176000,-89.280197)` at `0x1328`, with start value 8,400,000 and flags `0x009E`. Another block gives the original PC `(111.447418,0.652387,-80.126968)` again at `0x2480`. This is an authored measurement vignette with multiple tracks; its Default helper does not encode a public measurement-point warp.

`mnk0j610` has PC `(-170.253006,16.042200,398.024994)` / yaw `-2.476797` in `01x` at `0x6E130`, and `(-139.235992,18.527999,345.428009)` / yaw `-0.406005` in `15y` at `0x74CB0`. Widargelt's `04z` position `(-151.039001,18.611601,350.553040)` at `0x6F13C` uses flags `0x0064`; his `14z` position `(-141.826126,18.516100,348.932892)` at `0x75034` uses `0x00A0`. The PC and camera each have `IfClip` records in setup (`0x6DE00`, `0x6DE7C`), while Widargelt has another at `0x6DF64`. Their raw expressions remain unexecuted; the `x/y/z` blocks cannot be collapsed into one unconditional sequence or used to count battle actors.

`mnk0j620` has nonzero later Erik positions despite his zero initial position. Its `w_out` block puts Widargelt at `(-138.751999,18.150499,351.339996)` / yaw `2.658020` at `0x8E61C`, Erik at `(-128.149994,19.499201,371.882996)` / yaw `-2.702014` at `0x8E69C`, and PC at `(-138.751999,18.293600,349.001007)` / yaw `0` at `0x8E75C`. These are track IDs 49, 52, and 46, all start 0 with flags `0x00A0`. The `fo` block has a `RaptureBlackFadeClip` at `0x8E914`. This is useful evidence for aftermath staging and fade presentation, but the scenario's subsequent AfterWarp helper still receives no destination. It does not establish a warp to Erik's Ul'dah workshop or authorize moving the Widargelt reward there. [Measurement](../outputs/job-gc-decomp-20260907/scenes/mnk0j310.json), [entry](../outputs/job-gc-decomp-20260907/scenes/mnk0j610.json), [aftermath](../outputs/job-gc-decomp-20260907/scenes/mnk0j620.json)

### White Mage: zero initial positions conceal useful later spatial evidence

`whm0j210` does contain cave coordinates: PC `(-1542.324219,6.560837,-1590.938477)` / yaw `-0.959931` in `c01` at `0x238D0`; Raya `(-1544,6.515493,-1590)` / yaw `-0.785398` at `0x23CD8`; PC `(-1542.793213,6.547682,-1591.235474)` / yaw `-0.785398` in `c24` at `0x27BF4`. This is evidence for the scene's cave staging, although its initial block has no positions. It is not a sheep battlefield placement or a verified permanent Raya spawn. `whm0j410` supplies PC `(222.649994,43.549999,441.561340)` / yaw `0` at `0x15828`, and Oha-Sok `(222.649994,44.484501,443.579010)` / yaw `-3.141593` at `0x15868`, both in `c01x`. `c06x` repeats the PC position at `0x15F04`. This fits the post-bandit scene near marker `11222301`, not the later cave report. [WHM35 timeline](../outputs/job-gc-decomp-20260907/scenes/whm0j210.json), [WHM45 timeline](../outputs/job-gc-decomp-20260907/scenes/whm0j410.json)

`whm0j605` stages PC at `(-373.125885,-22.320572,50.550343)` / yaw `-0.785398` in `c06` at `0x4A600` (track 21). Later scene-role positions include the following; all listed clips have start 0, flags `0x00A0`, and yaw `2.356194`. They establish a six-role cinematic formation, without establishing encounter multiplicity or transforming these event actors into combat Wraths.

| Scene role | Block / track | XYZ | SetPos offset |
| --- | --- | --- | --- |
| Fire | `c10` / 30 | `(-378.221039,-19.776684,55.516205)` | `0x4B2AC` |
| Earth | `c10` / 36 | `(-379.122864,-20.050133,54.031342)` | `0x4B2EC` |
| Wind | `c10` / 39 | `(-379.639191,-19.126724,55.113171)` | `0x4B36C` |
| Light | `c10` / 27 | `(-377.849670,-20.116928,56.641357)` | `0x4B3AC` |
| Ice | `c10` / 24 | `(-376.974548,-19.786612,56.828773)` | `0x4B440` |
| Water | `c09` / 33 | `(-379.466797,-20.433714,55.519958)` | `0x4AF00` |

The post-battle `whm0j610` has PC `(-371.5,-22.209999,53.759998)` / yaw `-0.890118` both in `c02x` at `0xC252C` and `c11x` at `0xC3FE4`. Oha-Sok has `(-370.591003,-19.654406,53.023998)` in `c06x` at `0xC2E14`, then `(-372.867004,-21.275499,54.867001)` / yaw `2.251474` in `c16x` at `0xC49B0`. These give authored locations for the rescue and robe sequence near the battlefield.

A particularly misleading group occurs in `c12x`: **all six elemental roles share `(-1540.480347,7.440000,-1587.945801)`, yaw `-2.792527`**, which numerically resembles the cave staging. The offsets are Earth `0xC40BC`, Wind `0xC40FC`, Ice `0xC413C`, Light `0xC417C`, Water `0xC4214`, and Fire `0xC4254`. Each starts at 0 with flags `0x00A0`. In the preceding `c11x` block, six `UnbindActorClip` records at `0xC3EAC` through `0xC3EFC` target those same roles; the PC's `c11x` SetPos still uses the battlefield coordinates. This establishes neither a player warp to the cave nor six persistent elemental spawns there. The full binding payload/runtime restoration semantics must be resolved before explaining why those non-PC coordinates are authored. [Pre-battle timeline](../outputs/job-gc-decomp-20260907/scenes/whm0j605.json), [post-battle timeline](../outputs/job-gc-decomp-20260907/scenes/whm0j610.json)

Across this subset, the class registry identifies 100 BindActor clips, six UnbindActor clips, fourteen If clips, and 94 Kill clips. `whm0j610` alone has 24 Kill clips despite six elemental roles; clip count cannot be interpreted as an encounter kill requirement. These are scene-control operations, and their presence is another reason the last coordinate or the number of visual actors cannot settle runtime quest state.

## Specific next decomp targets

1. Trace the common NQ/fade helper and event synchronization path, especially Mnk0j6's AfterWarp branch, while keeping the event that requested it alive through the matching content transition. No scenario here supplies the transport destination.
2. Recover the destination-owned post-battle conversations: Gorge at the Silver Bazaar, Widargelt at Silvertear Falls, WHM45's automatic `whm0j410` before Raya's report, and WHM50's scene/robe acquisition before Raya's report. The exact methods are recovered; their server owners are not.
3. Resolve the remaining scene-control semantics: IfClip predicates, actor binding/unbinding, track selection, restoration, and the surviving player/event-owner transform. Typed all-block positions are now recovered; `mnk0j610`'s branching and `whm0j610`'s six cave-like elemental positions are especially useful validation cases.
4. Preserve Mnk0j3's separate measurement-point objective and all independent armor-coffer acquisitions. The widget methods do not implement their gameplay checks.
5. Join combat profiles by exact actor/display identity. Firebound Wrath is a new exact actor lead; wind/lightning/water remain ambiguous. Never substitute a same-family monster or a scene actor as if it were the retail combat identity.
6. Correct the identified documentation/runtime contracts only within their evidence: Neale's War0j1 followup owner; Widargelt's Mnk0j6 reward speaker; War0j6's Bazaar final talk; QuestDirectorMnk0j601's actual base class; and companion recommendations versus adapter party limits.

The executable client surface is now fully enumerated for these eighteen quests. Retail battle behavior and persistent placements are still bounded by the explicitly missing server/content data above; complete client decompilation does not make those absent contracts recoverable by inference.
