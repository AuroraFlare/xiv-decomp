# Fade to White / Man200 Decomp - 2026-07-07

Scope: quest `110013`, code `Man200`, title `Fade to White`. This note
reconstructs the live quest route, recovered client scene calls, Path companion
selection, private content/naming section, NPC surfaces, and the "fight" status.

## Short Version

`Fade to White` is the level 18 main scenario join point after the three city
routes. It is not a combat duty in the current local implementation. The
quest-owned content launch `man20001:SimpleContent30080:Quest/QuestDirectorEventMan20001`
is companion/private-area content: it spawns the selected Path companion, lets
the player name them, marks the content finished, then returns the player to the
Waking Sands.

The current "fight backlog" classification is a false positive caused by the
presence of a private content launch. There is no local BNPC materialization, no
monster party, no kill callback, and no battle command wiring for `man200`.

This pass also patched low-risk local script/runtime issues:

| Issue | Fix |
| --- | --- |
| `pE20` return value ignored | `SEQ_005` now advances only when the client prompt returns `1` |
| Lua inequality typos | `!=` changed to `~=` in the companion selection and naming guards |
| Undefined `EVENT_DOOR_OFFICE` | Replaced with `EVENT_DOOR_OFFICE_W` / `EVENT_DOOR_OFFICE_E` |
| Duplicate quest NPC registration | Tataru/Minfilia are registered once per sequence instead of again in the ambient NPC block |
| Duplicate quest NPC engine guard | `QuestState.AddENpc` now merges same-frame duplicate registrations instead of throwing or downgrading flags |
| Content launch globals | `contentArea` and `director` are now local temporaries |
| Adjacent MSQ content globals | `man0l0`, `man0g0`, and `man0u0` also localize `contentArea` / `director` in private-content launchers |
| Quiet `SEQ_025` wait state | Tataru now has `QFLAG_TALK`, and journal markers point to Tataru/market during the wait |
| Companion content globals | `pathcompanion` is local and nil-guarded in the event director shell; `SimpleContent30080.lua` already has the same guard |
| Event director constant leak | Director-only SNPC constants are local and aligned with the live quest range |
| SNPC modulo edge | `SNpcSkin % 16 == 0` now maps to the intended Hyur female personality bucket |
| MarketEntrance repeat menu typo | The Waking Sands menu re-open path now reuses `questPlaceName` instead of undefined `questAreaName` |
| Touched Lua parser cleanup | Removed trailing semicolons after `break` in touched dispatcher/MarketEntrance/Man2 director scripts so the focused Man quest slice parses under a standard Lua parser |
| Director null membership guard | `Director.AddMember` now ignores null actors, matching `ContentGroup` and `MonsterParty` behavior after failed content spawns |

## Source Map

| Source | Evidence |
| --- | --- |
| `Data/sql/gamedata_quests.sql` | quest id/title/code/level and dependency rows |
| `Data/scripts/quests/man/man200.lua` | live server quest route |
| `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man200.lua` | recovered client methods and text ids |
| `docs/Dat Mining/man200.csv` | text sheet `man200`, loaded by client as sheet `1557` |
| `docs/Dat Mining/cutReplay.csv` | replay rows for `man20100`, `man20110`, `man20120`, `man20130`, `man20150`, `man20160` |
| `Data/scripts/content/SimpleContent30080.lua` | local content spawn: selected Path companion only |
| `Data/scripts/directors/Quest/QuestDirectorEventMan20001.lua` | local event director shell for the companion content |
| `Map Server/Actors/Chara/Player/Player.cs` | SNPC skin/personality storage and persistence boundary |
| `Data/sql/server_eventnpc_spawn_locations.sql` | Waking Sands / Quicksand / market entrance actor placements |
| `outputs/quest-fight-materialization-atlas-20260630/*` | earlier false-positive fight classification and noncombat content verdict |

## Quest Identity

| Field | Value |
| --- | --- |
| Quest id | `110013` |
| Code | `Man200` |
| Title | `Fade to White` |
| Level | `18` |
| Category | main scenario |
| Text sheet | `1557` / `man200` |
| Local script | `Data/scripts/quests/man/man200.lua` |
| Recovered script | `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man200.lua` |
| Follow-up quest | `110014` / `Man206` / `Together We Stand` |

`gamedata_quests.sql` has dependency rows for `110004`, `110008`, and `110012`,
so `Fade to White` is the convergence quest after the Limsa, Gridania, and
Ul'dah level 13 city-route MSQ chains.

## Runtime State Machine

| Sequence | Meaning | Primary actor/trigger | Live behavior | Recovered client surface |
| --- | --- | --- | --- | --- |
| `SEQ_000` / `0` | Enter Waking Sands and reach Minfilia | market entrance, west office door, Tataru | quest is added by `MarketEntrance.lua`; west office door moves player toward Minfilia | `pE00` / `man20100`, `pE10` / `man20110`, Tataru `processEvent000_2` |
| `SEQ_005` / `5` | Talk to Minfilia and view the Echo/Path intro | Minfilia | calls `pE20`; now only advances if client returns `1` | `pE20` / `man20120`, gated by `worldMaster:ask(..., 51030, 2)` |
| `SEQ_010` / `10` | Join the Path of the Twelve | Minfilia | calls `pE25`; if player accepts, warps to main hall and starts companion selection | `pE25` / `man20130`, `ask(430, 2)` |
| `SEQ_020` / `20` | Choose Path companion class/candidate | Tataru | calls `processSnpcSelect`; stores selected SNPC; grants NPC linkpearl id `6`; starts `SEQ_025`; sends delayed NPC LS message | `processSnpcSelect` / `man20140` |
| `SEQ_025` / `25` | Wait for linkpearl notification | Tataru / NPC LS | Tataru reminder says Minfilia is still approving the choice; NPC LS message starts `SEQ_027` | `processEvent040_2`, NPC LS text id `435` |
| `SEQ_027` / `27` before flag | Return and meet companion | Tataru, selected SNPC | Tataru starts `man20001` content; selected SNPC opens naming flow | `pE050` / `man20150`, `pEN`, `pE055` / `man20155` |
| `SEQ_027` / `27` after flag | Finish at Quicksand | Momodi | Momodi reward scene, reward widget, complete quest, gil, EXP | `pE060` / `man20160`, `sqrwa` |

`FLAG_DUTY_COMPLETE` is a slightly misleading name here. It means "companion
private-area/naming content completed", not "combat duty completed".

## Cutscene Matrix

| Method | Scene | Launcher | Payload shape | Notes |
| --- | --- | --- | --- | --- |
| `pE00` | `man20100` | `startSnpcNQCutScene(..., 1, ...)` | placeholder name plus initial town | Fired by `MarketEntrance.lua` when entering Waking Sands for the first time |
| `pE10` | `man20110` | `startSnpcNQCutScene(..., 1, ...)` | placeholder name plus initial town | Fired by west office door push during `SEQ_000`; followed by server-side warp |
| `pE20` | `man20120` | `startSnpcNQCutScene(..., 1, ...)` | placeholder name plus initial town | Minfilia intro/Echo scene; guarded by `worldMaster` prompt `51030` |
| `pE25` | `man20130` | `startSnpcNQCutScene(..., 1, ...)` | placeholder name plus SNPC-ish tuple | Join-the-Path decision; asks text id `430`; decline path says ids `29`, `30` |
| `processSnpcSelect` | `man20140` | `startNQCutScene(..., 2, five candidates, 1, classChoice)` | five random candidates from selected class bucket | Tataru class/candidate selector; returns chosen actor class id and class/personality-ish value |
| `processSnpcReselect` | `man20140` | `startNQCutScene(..., 2, five candidates, 1, classChoice)` | same selector payload | Recovered client method exists, but live local script does not call it directly |
| `pE050` | `man20150` | `startSnpcNQCutScene(..., 1, nickname, actorClassId, personality, coordinate, town)` | stored Path companion payload | Tataru intro before private content launch |
| `pEN` | none | `inputSnpcName` | personality-dependent prompt | Selected companion asks player to name them |
| `pE055` | `man20155` | `startSnpcNQCutScene(..., 1, nickname, actorClassId, personality, coordinate, town, nickname)` | includes nickname twice | Name acknowledgement and companion reveal |
| `pE050_2` | none | client talk only | stored Path companion payload | Tataru post-content reminder if player talks before reward |
| `pE060` | `man20160` | `startSnpcNQCutScene(..., 1, nickname, actorClassId, personality, coordinate, town)` | stored Path companion payload | Momodi / Quicksand finale before reward |

`cutReplay.csv` only lists replay rows for `man20100`, `man20110`,
`man20120`, `man20130`, `man20150`, and `man20160`. The selector and naming
scenes (`man20140`, `man20155`) are still real recovered scene launches in
`man200.lua`; they simply do not appear in the sampled replay rows.

## Companion Selection

Recovered `processSnpcSelect` has three layers:

1. Tataru introduces the pairing requirement with text ids `43` through `47`.
2. The player chooses a role bucket via ask id `77`: Gladiator, Lancer, Archer,
   Conjurer, Thaumaturge, or quit.
3. The client samples five candidate actor-class ids from that bucket and shows
   `man20140`. If the player confirms, the chosen candidate is persisted.

Bucket mapping recovered from `Man200.processSnpcSelect`:

| Ask choice | Display text | Candidate base |
| ---: | --- | ---: |
| `1` | Gladiator | `1070001` |
| `2` | Lancer | `1070017` |
| `3` | Archer | `1070033` |
| `4` | Conjurer | `1070049` |
| `5` | Thaumaturge | `1070065` |
| other | quit/cancel | returns `-1, -1` |

`QuestBaseClass.getSnpcCandidacyNumber(base)` samples five candidates from a
15-entry window starting at the selected base. The decompiler mangles one local,
but the intent is clear from the shuffled range and returned five values:
`base + randomIndex - 1`.

Candidate windows:

| Bucket | Actor-class range | Skin offsets | Notes |
| --- | --- | --- | --- |
| Gladiator | `1070001`-`1070015` | `1`-`15` | first 15 appearance variants |
| Lancer | `1070017`-`1070031` | `17`-`31` | skips skin `16` |
| Archer | `1070033`-`1070047` | `33`-`47` | skips skin `32` |
| Conjurer | `1070049`-`1070063` | `49`-`63` | skips skin `48` |
| Thaumaturge | `1070065`-`1070079` | `65`-`79` | skips skin `64` |

The skipped multiples of `16` line up with `SNpcSkin % 16`. The recovered
selector avoids modulo `0` by using five 15-entry windows; the server now also
maps modulo `0` defensively to the intended Hyur female personality bucket.

After a candidate is chosen, live server code calls:

```lua
player:SetSNpc("???", sNpcActorClassId, sNpcPersonality);
player:AddNpcLs(6);
```

Server-side persistence is in `Player.SetSNpc`:

| Stored field | Source |
| --- | --- |
| `SNpcNickname` | starts as `"???"`, later set by naming widget |
| `SNpcSkin` | `actorClassId - 1070000` |
| `SNpcPersonality` | recomputed from `SNpcSkin % 16` |
| `SNpcCoordinate` | loaded from DB/default; passed back to cutscenes |

Personality buckets in `Player.SetSNpc`:

| `SNpcSkin % 16` | Personality | Comment in server |
| --- | ---: | --- |
| `1` | `1` | Hyur male |
| `0`, `2` | `2` | Hyur female |
| `3`, `4` | `3` | Elezen male |
| `5`, `6` | `4` | Elezen female |
| `7`, `8` | `5` | Lalafell male |
| `9`, `10` | `6` | Lalafell female |
| `11`, `12` | `8` | Miqo'te |
| `13`, `14` | `7` | Roegadyn |
| `15` | `9` | Highlander |

The naming method `pEN` branches on personality ids `1` through `9`, displays a
matching introduction text (`283` through `291`, with personality 7/8 swapped
in the recovered order), then opens `inputSnpcName`. After naming, `pE055` plays
a personality-specific acknowledgement (`292` through `300`) before
`man20155`.

## Private Content / Fight Verdict

The live launch path is:

```lua
contentArea = player.CurrentArea:CreateContentArea(
  player,
  "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
  "man20001",
  "SimpleContent30080",
  "Quest/QuestDirectorEventMan20001"
);
```

`SimpleContent30080.lua` only does this:

```lua
local pathcompanion = contentArea:SpawnPathCompanion(
  1070000 + player:GetSNpcSkin(),
  "pathcompanion",
  -203.470, 0, -159.578, 1.552,
  0, 0,
  player:GetSNpcNickname()
);
director:AddMember(director);
if (pathcompanion ~= nil) then
  director:AddMember(pathcompanion);
end
director:StartContentGroup();
```

The companion is then exposed in `SEQ_027` as:

```lua
quest:SetENpc(SNPC_START + player:GetSNpcSkin());
```

Talking to that SNPC runs `pEN`, sets the chosen name, plays `pE055`, calls
`player.CurrentArea:ContentFinished()`, warps the player back to zone `181`, and
sets `FLAG_DUTY_COMPLETE`.

No combat evidence was found:

| Combat surface | Result |
| --- | --- |
| BNPC spawn in `SimpleContent30080.lua` | none |
| Monster party setup | none |
| Director kill callback | none |
| Battle command/action hook | none |
| Reward on kill | none |
| Completion trigger | talk/naming SNPC, not kill |

So this should be documented and implemented as a noncombat companion/private
content route. The only "fight" language belongs to dialogue about future Path
work and to the broader system expectation that walkers travel in pairs.

## NPC And Object Surfaces

### Primary Quest Actors

| Constant | Actor class | Role |
| --- | ---: | --- |
| `MINFILIA` | `1000843` | Path leader, Echo/Path explanation, join decision |
| `TATARU` | `1001046` | Waking Sands greeter, annals keeper, companion selector, linkpearl source |
| `MOMODI` | `1000841` | Quicksand finale/reward owner |
| `MARKET_ENTRANCE` | `1090265` | Ul'dah market/Waking Sands entrance trigger |
| `EVENT_DOOR_EXIT` | `1090160` | Waking Sands exit door |
| `EVENT_DOOR_OFFICE_W` | `1090161` | west office door, initial push into Minfilia route |
| `EVENT_DOOR_OFFICE_E` | `1090162` | east office door, back out from office |
| `SNPC_START` | `1070000` | selected companion actor class base |

### Ambient Waking Sands Actors

These actors are set on every state by `onStateChange`, with different text
families before and after the player joins the Path.

| Actor | Class id | `SEQ < 10` method | `SEQ >= 10` method | Narrative surface |
| --- | ---: | --- | --- | --- |
| Seranelien | `1001378` | `processEvent000_3` | `processEvent020_3` | Minfilia protector / Fall of the Keeper |
| Sahja Zhwan | `1001373` | `processEvent000_4` | `processEvent020_4` | Path public front vs true purpose |
| Nenekani | `1001374` | `processEvent000_5` | `processEvent020_5` | languages / beast tribe language aptitude |
| Godfrey | `1001375` | `processEvent000_6` | `processEvent020_6` | Path unity and walkers |
| Fenana | `1001376` | `processEvent000_7` | `processEvent020_7` | starshower/Echo trauma |
| Loam-scented Lady | `1001281` | `processEvent000_11` | `processEvent020_8` | Echo/starshower variants |
| Softhearted Septuagenarian | `1001279` | `processEvent000_12` | `processEvent020_9` | desperate poor man / mercy request |
| Indigo-eyed Archer | `1001280` | `processEvent000_13` | `processEvent020_10` | impatient archer and assigned companion |
| Barratrous Buccaneer | `1001278` | `processEvent000_14` | `processEvent020_11` | distrust and assigned companion |
| Uncomfortable Brute | `1001282` | `processEvent000_15` | `processEvent020_12` | child abandonment story |
| Red-shoed Rascal | `1001275` | `processEvent000_16` | `processEvent020_13` | child response |
| Abstracted Gladiator | `1001276` | `processEvent000_17` | `processEvent020_14` | unwoken Ala Mhigan survivor |

These actors ignore the sequence split and always use the same method:

| Actor | Class id | Method | Surface |
| --- | ---: | --- | --- |
| Nonoru | `1001377` | `processEvent000_8` | influx of newly woken adventurers |
| Chapeaued Chap | `1001277` | `processEvent000_9` | Waking Sands as refuge |
| Rough-spoken Fellow | `1001274` | `processEvent000_10` | new recruit warning |
| Satzfloh | `1001228` | `processEvent000_18` | hostile gatekeeping |
| Percevains | `1001229` | `processEvent000_19` | talents and arrogance |
| Una Tayuun | `1001230` | `processEvent000_20` | keep out of trouble |

### Spawn Placements

Important static placements from `server_eventnpc_spawn_locations.sql`:

| Actor | Zone/private area | Position |
| --- | --- | --- |
| Minfilia | `181`, public | `-123.998, 1.2, -162.07`, rot `-0.784` |
| Tataru | `181`, public | `-199.563, 0, -162.347`, rot `-1.5` |
| Waking Sands exit door | `181`, public | `-209, 0, -160` |
| West office door | `181`, public | `-137, 1, -160` |
| East office door | `181`, public | `-134.5, 1, -160` |
| Market entrance | `175`, public | `-235, 189, 50.5` |
| Momodi | `175`, public | `-74.91, 195.45, 81.14`, rot `2.88` |
| Momodi private row | `175`, `PrivateAreaMasterPast`, type `4` | `-73.33, 195, 78.531`, rot `-1.404` |

### Quest Markers

DAT marker rows exist for ids `11001301` through `11001320`, but the live quest
uses only four constants. The unused rows mostly point at a generic Ul'dah
marker location and look like retail/replay scaffolding rather than active
server logic.

| Constant/use | Marker id | DAT target | Live use |
| --- | ---: | --- | --- |
| `MRKR_MINFILIA` | `11001301` | Minfilia / `1100449`, Waking Sands map group `104/421` | `SEQ_000`, `SEQ_005`, `SEQ_010` while in zone `181` |
| duplicate Minfilia row | `11001302` | same Minfilia location | not referenced by live script |
| `MRKR_TATARU` | `11001303` | Tataru / `1500054`, Waking Sands map group `104/421` | `SEQ_020`, now also `SEQ_025`, and `SEQ_027` before content completion |
| generic/unused | `11001304` | generic Ul'dah coords `-431,187` | not referenced by live script |
| `MRKR_MARKETENTRANCE` | `11001305` | market entrance actor target, Ul'dah map group `104/421` | fallback marker when not in zone `181` |
| `MRKR_MOMODI` | `11001306` | Momodi / `1500014`, Ul'dah map group `104/421` | reward marker after `FLAG_DUTY_COMPLETE` |
| unused generic rows | `11001307`-`11001320` | generic Ul'dah marker rows, map group `101/121` | not referenced by live script |

## Dialogue And Text Owner Summary

The text sheet is large, so this section groups by method and text-id ranges
rather than duplicating full dialogue.

| Method/range | Text ids | Owner | Purpose |
| --- | --- | --- | --- |
| `pE00` / starter-city variants | `1`, `3`-`5`, `417`-`429` | prior city-route contact and Minfilia | entry variants depending on initial town / prior route |
| `processEvent000_2` | `74`-`76` | Tataru | Waking Sands greeting and direction to Minfilia |
| `pE20` | scene plus ids `6`-`24` inside scene data | Minfilia | introduction to the Path, Echo, starshowers, and invitation to consider joining |
| `pE25` | `28`-`30`, ask `430`/`431`/`432` | Minfilia | final join decision; decline warning |
| join acceptance continuation | `31`-`42` | Minfilia/Tataru | deeper Echo explanation, returned walkers, paperwork handoff |
| companion selection intro | `43`-`47` | Tataru | List of Walkers and required companion pairing |
| companion selector labels | `77`-`83`, `409`-`414`, `449`-`455` | Tataru/UI | choose class, confirm candidate, reconsider, receive linkpearl |
| companion profile blurbs | `440`-`448` | Tataru | personality/race/class blurbs for the nine personality buckets |
| companion arrival/naming | `264`-`282`, `283`-`300`, `301`-`309` | companion/Tataru | arrival, ask for name, name acknowledgement |
| companion first conversation | `310`-`408` | companion | post-naming personality-specific conversation and "meet at Quicksand" leadout |
| NPC LS | `435` | Tataru display name `1500054` | return to Waking Sands; companion approved |
| Tataru post-content | `437`, `438` | Tataru | send player and companion to Momodi / Quicksand |

## Rewards And Progression

Completion path in live script:

```lua
callClientFunction(player, "delegateEvent", player, quest, "pE060", ...);
callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
player:CompleteQuest(quest);
player:AddItem(1000001, 45000);
player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 45000);
player:AddExp(70000, player:GetCurrentClassOrJobId(), 0);
```

Recovered local behavior:

| Reward | Value |
| --- | ---: |
| Gil/currency item `1000001` | `45000` |
| EXP | `70000` |
| Reward widget | `sqrwa(300, 1, 1, 2)` |
| Post-completion cap notice | `>MSQ Quests after this point are still under development` |

`Map Server/Actors/Quest/Quest.cs` also defines
`FADE_TO_WHITE_QUEST_ID = 110013`, and config has a "post-Fade to White cap"
option. That matches the live completion message and current progression cap.

## Implementation Notes / Risks

| Area | Finding | Recommendation |
| --- | --- | --- |
| `pE20` gating | Recovered client returns prompt result; live script previously ignored it | Patched: only start `SEQ_010` on result `1` |
| Selector re-entry | `processSnpcReselect` exists in recovered client but live script simply reruns `processSnpcSelect` on a new Tataru talk | Acceptable for now; use exact `processSnpcReselect` only if runtime captures prove the client expects it |
| `SEQ_025` resilience | NPC LS is scheduled after `wait(60)` while the quest is at `SEQ_025` | Patched: Tataru has `QFLAG_TALK`, and map markers point to Tataru/market during the wait |
| modulo-16 SNPC edge | `Player.SetSNpc` had an unreachable `case 16` under `SNpcSkin % 16`; selector already avoids multiples of `16` | Patched: modulo `0` now lands in the Hyur female personality bucket |
| Content engine | `Zone.CreateContentArea` has a `contentScript` argument that is not obviously used in the C# body, but older private duties use the same calling convention | Do not change only for `man200`; audit engine-wide with a runtime repro |
| Fight classification | Older atlases list `bespoke private-content/fight validation` because content launch was overbroadly treated as a fight | Reclassify `man200` as noncombat companion content |
| Replay coverage | `man20140` and `man20155` are scene launches but absent from `cutReplay.csv` rows sampled here | Keep direct decomp method evidence as source of truth for those scenes |

## Validation

Current local checks:

| Check | Result |
| --- | --- |
| Focused Lua parser sweep | `45` Man quest/content/quest-director scripts parsed with `0` errors after BOM-stripped temp copies |
| Operator/parser scan | No `!=`, `&&`, `||`, or `break;` remain in the focused Man quest/content/director slice |
| `git diff --check` | Clean aside from existing Git CRLF normalization warnings |
| `dotnet build Meteor.sln` | Succeeded with `0` errors; warnings are existing framework/reference/unused-field noise |

## Probe Recipes

Useful scene-only smoke commands from the existing push atlas:

| Target | Command |
| --- | --- |
| Entrance scene | `!testcutscene man20100 delegate 1` |
| Office scene | `!testcutscene man20110 delegate 1` |
| Minfilia intro | `!testcutscene man20120 delegate 1` |
| Join Path | `!testcutscene man20130 delegate 1` |
| Companion selector | `!testcutscene man20140 delegate 2` |
| Companion arrival | `!testcutscene man20150 delegate 1` |
| Name reveal | `!testcutscene man20155 delegate 1` |
| Finale | `!testcutscene man20160 delegate 1` |

For route validation, prefer live quest probes over scene-only smoke:

1. Enter from Ul'dah market entrance choice `3095`; verify quest added and
   `pE00` route enters zone `181`.
2. Push west office door in `SEQ_000`; verify `pE10` and warp to
   `-126.2, 1.2, -160`.
3. Talk Minfilia in `SEQ_005`; decline prompt once and verify sequence stays
   `5`, then accept and verify `SEQ_010`.
4. Join through `pE25`; verify `SEQ_020`.
5. Select companion; verify `characters_snpc` row has nickname `"???"`, skin
   offset, personality, and NPC linkpearl `6`.
6. Read NPC LS; verify `SEQ_027`.
7. Talk Tataru; verify `SimpleContent30080` creates only selected
   `pathcompanion`.
8. Talk companion; name them; verify `ContentFinished`, `FLAG_DUTY_COMPLETE`,
   and zone return.
9. Talk Momodi; verify `pE060`, `sqrwa`, completion, `45000` gil/currency, and
   `70000` EXP.
