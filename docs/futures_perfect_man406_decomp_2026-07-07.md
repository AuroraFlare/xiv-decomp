# Futures Perfect / Man406 Decomp Notes

## Short Version

`Futures Perfect` (`Man406`, quest `110019`) should stay in the local hidden scaffold for now. The current script exposes probe metadata/constants and helper accessors, then keeps the scaffold and custom Goobbue reward side effect; I did not wire the quest route, fight, or rewards because the recovered directors are empty and the battle/cutscene evidence is not enough to reconstruct retail behavior safely.

The strongest new evidence is the likely battle lead:

```text
server_battlenpc_mob_types_loot.sql: imperial_juggernaut, actorClass 2202401, level 50, "Mor Dhona, Futures Perfect"
```

That looks like the quest fight, but it does not prove the spawn trigger, director sequence, win condition, or cleanup.

## Helpers Added

`scenario_decomp_helpers.lua` now has helper variants for the two SNPC payload shapes this quest exposes:

```lua
helpers.getSnpcDelegateArgListWithExtras(player, ...)
helpers.getSnpcCutsceneArgListWithExtras(player, ...)
helpers.delegateSnpcCutsceneEvent(player, owner, eventName, ...)
helpers.delegateSnpcCutsceneEventAndAdvance(player, quest, eventName, nextSequence, ...)
```

Use the delegate helpers when calling recovered quest methods that themselves convert raw SNPC skin to actor class. Use the cutscene helpers only for direct `startSnpc...CutScene` style calls, or for methods that expect actor class in slot 2 already.

Latest local helper/probe additions:

- `Data/scripts/quests/man/man406.lua` now exposes actor/battle candidate constants, recovered probe lists, and Man406 helper accessors.
- `getMan406Pe01PersonalityRow(...)` / `getPlayerMan406Pe01PersonalityRow(...)` map the recovered `pE01` personality rows.
- `getMan406Pe52PersonalityRow(...)` / `getPlayerMan406Pe52PersonalityRow(...)` map the recovered `pE52` personality rows.
- `getMan406P50CutsceneArgList(player)` returns the direct SNPC cutscene tuple plus the repeated initial-town arg for `man40650` probes.
- `getMan406P60CutsceneArgList(player)` returns the direct actor-class SNPC tuple plus sexuality-skin for `man40660` probes.

## Local State

- Local script: `Data/scripts/quests/man/man406.lua`
- Quest title row: `110019, Futures Perfect, Man406, previous quest 110018, level 46`
- Current local behavior: probe metadata/constants and helper accessors, then `InitQuestScaffold("Man406")`
- Custom local side effect: completion grants Goobbue if `player.hasGoobbue == false`
- Scaffold marker: `11001902`
- Scaffold completion smoke hook: `processEvent025`

`processEvent025` is useful as a hidden smoke test because it plays the HQ `MAN40625` cutscene, but I do not have proof it is the actual retail completion event.

## SNPC Payload Rule

The raw live SNPC tuple is:

```text
nickname, skin, personality, coordinate, initialTown
```

Most recovered Man406 methods convert slot 2 from raw skin to actor class before starting the cutscene. That means these quest delegates should use `@snpc5` / `getSnpcDelegateArgList`:

- `pES`
- `pE01`
- `pE10`
- `pE15`
- `pE30`
- `pE50`
- `pE52`
- `pE61`

`pE60` is different: the recovered method passes slot 2 directly into `startSnpcNQCutScene("man40660", ...)` and computes sexuality skin separately from slot 5. Probe it first with actor class in slot 2, not raw skin.

## Cutscene Matrix

| Method | Scene | Type | Fade | Payload Notes |
| --- | --- | --- | --- | --- |
| `pES` | `man40600` | SNPC NQ | branch / mixed | Converts raw skin to actor class. Recovered Lua has a suspicious double `startSnpcNQCutScene` return. |
| `pE10` | `man40610` | SNPC NQ | default | Converts raw skin to actor class. |
| `pE15` | `man40615` | SNPC NQ | after warp | Converts raw skin to actor class. |
| `processEvent020` | `man40620` | NQ | boolean branch | Plain cutscene. `true` appears to use default fade-in; `false` uses after-warp fade. |
| `processEvent025` | `MAN40625` | HQ | default | Plain HQ cutscene. Current scaffold uses this only as a hidden smoke hook. |
| `pE30` | `man40630`, `man40635`, `man40645` | SNPC NQ, SNPC HQ, NQ | after warp | Converts raw skin. Chains three scene starts in recovered script. |
| `pE50` | `man40650` | SNPC NQ | after warp | Converts raw skin and appends initial town again as the final extra arg. |
| `pE60` | `man40660` | SNPC NQ | after warp | Does not convert slot 2; computes sexuality skin from initial town / slot 5. |

## Replay Rows

`cutReplay.csv` has Man406 rows `11001901` through `11001909`:

```text
11001901 man40600 -201 -202 -203 -204 -205 -200 -200 -200
11001902 man40610 -201 -202 -203 -204 -205 -200 -200 -200
11001903 man40615 -201 -202 -203 -204 -205 -200 -200 -200
11001904 man40620 -200 -200 -200 -200 -200 -200 -200 -200
11001905 man40625 -200 -200 -200 -200 -200 -200 -200 -200
11001906 man40630 -201 -202 -203 -204 -205 -200 -200 -200
11001907 man40635 -201 -202 -203 -204 -205 -200 -200 -200
11001908 man40650 -201 -202 -203 -204 -205 -205 -200 -200
11001909 man40660 -201 -202 -203 -204 -205 -217 -200 -200
```

Important correction: the replay summary tooling labels `-202` like coordinate in a few generated docs, but for SNPC replay rows the live tuple maps as nickname, raw skin, personality, coordinate, initial town. The replay client can transform raw skin for playback; direct cutscene code usually needs actor class.

## Preview Rows

The debug SNPC preview table for quest `110019` lists:

| Index | Scene | Quality |
| --- | --- | --- |
| 1 | `man40600` | NQ |
| 2 | `man40610` | NQ |
| 3 | `man40615` | NQ |
| 4 | `man40630` | NQ |
| 5 | `man40635` | HQ |
| 6 | `man40640` | HQ |
| 7 | `man40650` | NQ |

`man40640` is a very large HQ scene and also appears as a recovered call in `Man308.pE50`, but I did not find a Man406 quest method calling it directly.

## Asset Inventory

```text
man40600  62,098
man40610  77,612
man40615  85,854
man40620  197,856
man40625  386,287
man40630  153,385
man40635  27,667,632
man40640  22,007,744
man40645  56,529
man40650  312,853
man40660  45,432
```

`MAN40625` in recovered script normalizes to the lowercase asset `man40625`.

## Personality Tables

`pE01` selects rows by SNPC personality:

| Personality | Text Row |
| --- | --- |
| 1 | 361 |
| 2 | 362 |
| 3 | 363 |
| 4 | 364 |
| 5 | 365 |
| 6 | 366 |
| 7 | 368 |
| 8 | 367 |
| 9 | 369 |

`pE52` selects rows by SNPC personality:

| Personality | Text Row |
| --- | --- |
| 1 | 347 |
| 2 | 348 |
| 3 | 349 |
| 4 | 350 |
| 5 | 351 |
| 6 | 352 |
| 7 | 354 |
| 8 | 353 |
| 9 | 355 |

Both recovered methods have invalid branch/break structure. Rebuild them with table lookups if they are ever promoted from probe notes into live script.

## Talk Rows

Recovered lightweight event rows:

```text
processEvent000_1: 240, 241
processEvent000_2: 242
processEvent000_3: 243, 244
processEvent000_4: 245, 246
processEvent000_5: 247, 248
processEvent000_6: 249, 250
processEvent000_7: 251
processEvent010_1: 19, 20
processEvent010_2: 21
processEvent010_3: 22
processEvent010_4: 252, 253
processEvent010_5: 254, 255
processEvent010_6: 256, 257
processEvent010_7: 356
processEvent010_8: 370, 371
processEvent010_9: 357
pE16: 33, 34
pE17: 35
pE18: 258, 259
processEvent015_4: 260, 261
processEvent015_5: 33, 34
processEvent045_1..5: 38, 39, 40, 41, 42
pE61: 271, 272
processEvent060_2: 273, 274
processEvent060_3: 275
processEvent060_4: 276, 277
processEvent060_5: 278, 279
processEvent060_6: 280, 281
```

Rows `34`, `259`, and `271` pass sexuality skin. Rows `34` and `35` also pass the SNPC companion nickname.

## Journal And Markers

Active journal rows in `xtx_quest.csv` key off `$E8(1)`:

| Sequence | Journal Row |
| --- | --- |
| 0 | 226 |
| 5 | 227 |
| 10 | 228 |
| 15 | 229 |
| 20 | 231 |
| 25 | 232 |

Summary rows:

```text
260, 227, 261, 262, 263, 264
```

Marker highlights:

| Marker | Position | Target | Layout |
| --- | --- | --- | --- |
| `11001901` | `-235, 51` | `4000257` | `104 / 421` |
| `11001902` | `-123.389999, -162.419998` | `1000126` | `104 / 421` |
| `11001903` | `-219, -680` | `4000257` | `105 / 501` |
| `11001904` | `227.759995, -788.859985` | `4000257` | `105 / 501` |
| `11001905` | `-199.559998, -162.350006` | `1500054` | `104 / 421` |
| `11001906` | `173.429993, -641.26001` | `4000257` | `105 / 501` |
| `11001907..20` | `-431, 187` | `1600179` | `101 / 121` |

The marker spread suggests more route structure than the current hidden scaffold knows about.

## NPC Leads

Quest-local display names:

```text
1100190 Finnea
1100191 Fionnuala
1100192 Gallia
1100193 Genevieve
1100194 Genna
1100195 Glynnis
1100196 Ianna
1100197 Isleen
1100198 Keaira
1100199 Keelty
```

Actor-class leads with those display names:

| Actor Class | Type | Display |
| --- | --- | --- |
| `1000459` | PopulaceGuildShop | `1100192` / Gallia |
| `1001431` | PopulaceStandard | `1100194` / Genna |
| `1500006` | Chocobo lender | `1100197` / Isleen |
| `1500146` | Shop salesman | `1100198` / Keaira |
| `3001106` | Retainer | `1100191` / Fionnuala |
| `1000587`, `1700028`, `2290032` | blank / lower confidence | `1100199` / Keelty |

These are NPC leads only, not confirmed interaction route.

## Battle Lead

Likely fight row:

```sql
(3058, 2202401, 'imperial_juggernaut', 4, 50, 50, 14874, 2389, 0, 0, 'none', 45, 0, 'Mor Dhona, Futures Perfect')
```

This is strong enough to preserve as the combat candidate, but not strong enough to script:

- no confirmed spawn actor or layout trigger
- no quest director sequence data
- no recovered win/fail handler
- no cleanup/leave instance proof
- no connection to the Goobbue custom reward side effect

## Reward Risk

`xtx_quest.csv` marks no standard reward, while SQL reward tables list `138000` gil and `46000` EXP for quest `110019`. Because the local script has a custom Goobbue grant and the recovered completion event is uncertain, do not wire standard rewards until completion UI or packet behavior is verified.

## Probe Commands

Recommended probe order:

```text
!questdelegate quest:110019 pES @snpc5
!questdelegate quest:110019 pE01 @snpc5
!questdelegate quest:110019 pE10 @snpc5
!questdelegate quest:110019 pE15 @snpc5
!questdelegate quest:110019 processEvent020 true
!questdelegate quest:110019 processEvent020 false
!questdelegate quest:110019 processEvent025
!questdelegate quest:110019 pE30 @snpc5
!questdelegate quest:110019 pE50 @snpc5
!questdelegate quest:110019 pE52 @snpc5
!questdelegate quest:110019 pE60 @snpcnickname @snpcactorclass @snpcpersonality @snpccoordinate @initialtown
!questdelegate quest:110019 pE61 @snpc5
```

Negative probe, only after the actor-class version:

```text
!questdelegate quest:110019 pE60 @snpc5
```

If `pE60 @snpc5` renders the wrong companion model while the actor-class version works, that confirms the direct-cutscene payload expectation.

## Follow-Up

- Keep `Man406` hidden until route and battle proof are stronger.
- Preserve the Goobbue completion hook unless a retail packet/reward capture proves otherwise.
- If promoting any Man406 methods, rebuild personality branches as table lookups rather than copying recovered invalid `break` flow.
- Do not attach `imperial_juggernaut` to a live sequence without director/spawn/win-condition evidence.
