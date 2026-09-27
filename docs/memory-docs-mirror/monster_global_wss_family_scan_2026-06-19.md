# Global Client Monster WSS Family Scan

## Scope

Installed client path scanned:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\chara\mon
```

The scan extracted printable strings from action files under:

```text
act\*\wss\base\*
```

and collected embedded `vfx\mon\...` family paths. These strings are stronger evidence than the old hardcoded `AI Scripts/scan_monsters.ps1` labels, because they are inside the shipped client action/VFX data.

## High-Level Result

- Installed `m###` folders found: 96.
- Folders with WSS `vfx\mon` family strings: 77.
- Folders without WSS family strings: 19.
- A follow-up pass over the WSS-silent folders found one additional non-WSS VFX family clue: `m525` model data embeds `vfx\mon\m525_beacon/...`.
- No real installed-client `chara\mon` string hits for `tonberry`, `lamia`, `scarecrow`, or exact `dragon`.
- No real Sahagin family hit. The only `saha` substring hit was inside binary texture noise under `m852`, not a path/name.
- Raw DAT-mined `actorclass_graphic.csv` also has no `base = 10521` row for `mon/m521`; `xtx_monsterRace.csv` has no Tonberry, Sahagin, Mandragora, Lamia, Scarecrow, BeastL, or BeastM taxonomy entry.
- Real candidate-family hits found:
  - `m034`: `drake_034`
  - `m057`: `wyvern_057`
  - `m521`: `mandragora_521`

## Candidate Name Search

| Candidate token group | Result |
|---|---|
| Tonberry | No hits under installed `chara\mon` |
| Sahagin | No real path/name hits; one `saha` false positive in binary texture data |
| Lamia | No hits under installed `chara\mon` |
| Scarecrow | No hits under installed `chara\mon` |
| Mandragora | 92 hits, all under `m521` |
| Exact Dragon | No `dragon` string hits under installed `chara\mon` |
| Drake/Wyvern | Hits under `m034` and `m057` |
| BeastL/BeastM | No hits under installed `chara\mon` |

## WSS Family Map

| Folder | Files | WSS files | Embedded family |
|---|---:|---:|---|
| `m002` | 24 | 3 | `puk_002` |
| `m003` | 22 | 4 | `raptor_003` |
| `m004` | 23 | 3 | `antelope_004` |
| `m005` | 23 | 4 | `hippogryph_005` |
| `m006` | 22 | 4 | `mandrillus_m006` |
| `m007` | 24 | 6 | `gnat_007` |
| `m008` | 30 | 7 | `basilisk_008` |
| `m009` | 31 | 10 | `kujata_009` |
| `m011` | 27 | 6 | `sabotender_m011` |
| `m012` | 26 | 7 | `morbol_m012` |
| `m013` | 26 | 4 | `crab_m013` |
| `m017` | 30 | 6 | `kumo_m017` |
| `m020` | 24 | 6 | `vulture_m020` |
| `m021` | 29 | 9 | `salamander_021` |
| `m022` | 13 | 6 | `erimakitokage_m022` |
| `m023` | 33 | 5 | `wolf_m023` |
| `m025` | 23 | 4 | `boar_025` |
| `m028` | 31 | 11 | `bomb_028` |
| `m029` | 35 | 7 | `ahriman_029` |
| `m030` | 57 | 9 | `livingdead_030` |
| `m031` | 25 | 7 | `wight_031` |
| `m032` | 29 | 8 | `tordor_032` |
| `m033` | 26 | 2 | `nocker_033` |
| `m034` | 33 | 10 | `drake_034` |
| `m035` | 23 | 3 | `goat_035` |
| `m036` | 7 | 1 | `aw7_036` |
| `m037` | 31 | 11 | `ogre_m037` |
| `m038` | 25 | 6 | `garukimasera_m038` |
| `m039` | 26 | 8 | `hanaobake_m039` |
| `m040` | 22 | 8 | `torrent_m040` |
| `m041` | 19 | 3 | `apkallu_041` |
| `m043` | 24 | 5 | `antling_m043` |
| `m045` | 27 | 8 | `gigantoad_045` |
| `m046` | 32 | 13 | `coeurl_046` |
| `m047` | 32 | 20 | `m047_chimaira` |
| `m048` | 29 | 6 | `goobbue_048` |
| `m049` | 25 | 5 | `purine_m049` |
| `m051` | 26 | 12 | `golem_m051` |
| `m052` | 17 | 3 | `m052_killermachine` |
| `m054` | 25 | 10 | `gargoyle_054` |
| `m055` | 23 | 9 | `m055_cyclops` |
| `m057` | 16 | 8 | `wyvern_057` |
| `m070` | 16 | 10 | `m070_atmos` |
| `m091` | 10 | 2 | `m091_inseki` |
| `m501` | 20 | 2 | `beetle_m501` |
| `m502` | 31 | 4 | `lemming_502` |
| `m503` | 13 | 3 | `bat_m503` |
| `m504` | 21 | 3 | `slug_504` |
| `m505` | 24 | 5 | `ghost_505` |
| `m506` | 22 | 4 | `phurble_506` |
| `m507` | 26 | 4 | `seadevil_507` |
| `m508` | 46 | 8 | `erementar_m508` |
| `m509` | 16 | 1 | `crowd_509` |
| `m510` | 23 | 3 | `jellyfish_510` |
| `m511` | 21 | 3 | `yarzon_511` |
| `m512` | 23 | 2 | `mosquito_m512` |
| `m513` | 24 | 5 | `mole_513` |
| `m515` | 25 | 4 | `wisp_515` |
| `m516` | 25 | 7 | `funguar_m516` |
| `m518` | 24 | 9 | `sheep_m518` |
| `m520` | 64 | 15 | `spriggan_520` |
| `m521` | 16 | 11 | `mandragora_521` |
| `m524` | 9 | 1 | `anchor_524` |
| `m526` | 11 | 5 | `m526_rock` |
| `m527` | 13 | 4 | `m527_feather` |
| `m701` | 111 | 24 | `mowgli_701` |
| `m851` | 25 | 14 | `m851_garuda` |
| `m852` | 34 | 19 | `ifrit_852`, `kuroko_999` |
| `m901` | 38 | 4 | `qiqirn_901` |
| `m902` | 131 | 28 | `ixal_902` |
| `m903` | 141 | 28 | `amaljaa_m903` |
| `m904` | 108 | 18 | `kobold_904` |
| `m905` | 58 | 3 | `pixie_m905` |
| `m911` | 177 | 9 | `commander_911` |
| `m912` | 51 | 12 | `goblin_m912` |
| `m917` | 37 | 17 | `m917_siro` |
| `m999` | 29 | 20 | `ifrit_852`, `kuroko_999`, `snd_om_f_999`, `snd_ex_f_999`, `snd_ex_p_999`, `snd_ex_b_999`, `m917_siro`, `siro_999` |

## Folders Without WSS Family Strings

| Folder | Files | WSS files |
|---|---:|---:|
| `m001` | 3 | 0 |
| `m050` | 16 | 3 |
| `m056` | 14 | 0 |
| `m058` | 4 | 0 |
| `m525` | 11 | 0 |
| `m702` | 56 | 0 |
| `m703` | 14 | 0 |
| `m704` | 6 | 0 |
| `m707` | 4 | 0 |
| `m708` | 7 | 0 |
| `m709` | 7 | 0 |
| `m710` | 5 | 0 |
| `m801` | 4 | 0 |
| `m853` | 4 | 0 |
| `m854` | 10 | 0 |
| `m909` | 5 | 0 |
| `m910` | 211 | 0 |
| `m980` | 144 | 0 |
| `m998` | 2 | 0 |

## WSS-Silent Follow-Up

The WSS-silent folders were checked again by extracting non-WSS strings and joining `base = 10000 + m###` against actor appearance/class rows, display names, script correlation output, and current server mob types.

| Folder | Client-side clue | Actor/script clue | Read |
|---|---|---|---|
| `m001` | Model/skeleton strings only: `m001_cmn`, `info_m001` | No `base = 10001` actor rows | Unbound/unknown tiny model folder |
| `m050` | Battle/action strings under `mon\m050\2sw_emp\...`; no VFX family name | No `base = 10050` actor rows | Unbound/unknown battle model |
| `m056` | Generic `m056` model/action strings | `base = 10056` rows are `mammet`/Dedela-style Populace rows | Not a candidate monster; likely NPC/populace mammet data |
| `m058` | Generic `m058` model strings | `base = 10058` rows are `antling` with `TermiteStandard` script | Data points to Antling/Termite variant |
| `m525` | Model data embeds `vfx\mon\m525_beacon\...` | Rows name `magitek transmitter` and `ceruleum generator`; class path empty | Beacon/generator support object, not candidate mob |
| `m702` | Chocobo-style animation set with many `m702` variants | Rows include `chocobo`, `pack chocobo`, and many `ChocoboCaravanGuard` actors | Chocobo data, not Dragon/Wyvern |
| `m703` | Generic `m703` model/action strings | Only empty-path Dedela rows | Unresolved NPC/support model |
| `m704` | Generic `m704` model/action strings | Only empty-path Dedela rows | Unresolved NPC/support model |
| `m707` | Model strings include `Happy_m707...`; no actor rows | No `base = 10707` actor rows | Unbound/unknown model |
| `m708` | Generic `m708` model/action strings | One empty-path `???` row | Unresolved NPC/support model |
| `m709` | Generic `m709` model/action strings | Empty-path `???` rows | Unresolved NPC/support model |
| `m710` | Generic `m710` model strings | One empty-path Dedela row | Unresolved NPC/support model |
| `m801` | Generic `m801` model strings | One empty-path Dedela row | Unresolved large model |
| `m853` | Generic `m853` model strings | No `base = 10853` actor rows | Unbound model |
| `m854` | Generic `m854` model/action strings | `Titan` rows exist: `TitanNormal` and `MonsterExperimentA`; scripts not decompiled | Titan data exists, but not ready as decompiled behavior |
| `m909` | Generic `m909` model/action strings | `Ascian` rows use decompiled `SpecterStandard` script | Data points to Ascian/Specter, not Dragon |
| `m910` | Many normal animation strings under `m910` | `Gaius van Baelsar` row, class path empty | Special character model, not generic monster |
| `m980` | Many equipment-part strings: `dwn`, `glv`, `met`, etc. | MapObj/Populace rows | Equipment-like support model, not battle monster |
| `m998` | Tiny model/skeleton strings only | Empty-path Dedela rows | Placeholder/support model |

No WSS-silent folder produced Tonberry, Sahagin, Lamia, Scarecrow, exact Dragon, BeastL, or BeastM evidence.

## Raw DAT Sheet Cross-Check

The raw DAT-mined `docs/Dat Mining/actorclass_graphic.csv` sheet was checked directly. `Map Server/Utils/SQLGeneration.cs` copies CSV field `7` into `gamedata_actor_appearance.base`, so these counts are a pre-SQL-import appearance binding check.

| Base | Raw row count | Read |
|---:|---:|---|
| `10051` | 12 | Golem rows, including `clay golem` |
| `10507` | 30 | Angler/Orobon/Piranha, not Sahagin |
| `10508` | 99 | Elemental, not Tonberry |
| `10512` | 30 | Chigoe/Djigga, not Lamia |
| `10518` | 38 | Sheep/Karakul, not Dragon |
| `10520` | 61 | Sprite/Spriggan, not Scarecrow |
| `10521` | 0 | No raw Mandragora actor graphic row |
| `10526` | 10 | Garuda Lesser/monolith support, not BeastL |
| `10527` | 8 | Garuda/feather support, not BeastM |
| `10701` | 23 | Moogle, not Dragon/Wyvern |
| `10907` | 4 | Dragon display rows, but empty actor class path and missing installed `m907` folder |

The raw `xtx_monsterRace.csv` taxonomy contains `Dragon`, `Drake`, `Wyvern`, `Golem`, `Spriggan`, `Elemental`, `Chigoe`, `Sheep`, `Garuda`, `Titan`, and `Ascian`, but not `Tonberry`, `Sahagin`, `Mandragora`, `Mandrake`, `Lamia`, `Scarecrow`, `BeastL`, or `BeastM`.

## Actor Binding Continuation

A follow-up actor binding trace checked the raw identities behind the most tempting non-candidate bases:

- `base = 10521` remains absent from raw actor graphics, so `m521` is still Mandragora asset evidence without actor binding.
- `base = 10526` rows are Garuda Lesser or MapObj/monolith support rows, including `2209503`, `2209506..2209509`, and `5900031..5900035`; this does not rescue BeastL.
- `base = 10527` rows are Garuda Lesser/Feather/plume support rows, including `2209502`, `2209510..2209513`, and `2209518..2209519`; this does not rescue BeastM.
- Exact Dragon rows exist as `2106801..2106804` with `base = 10907` and display `dragon`, but they have empty actor class paths and no installed `m907` folder.
- `Cloud dragon` / `Sephiroth dragon` display rows exist at `2108101`, `2108102`, `2208101`, and `2208102`, and those are the only `base = 10022` actor appearance rows found. They use `base = 10022 -> mon/m022`, not `base = 10907`; that lines up with the `m022` WSS family `erimakitokage_m022`, but their actor class paths are empty and no current server mob type or guildleve row owns them.
- Local GM aliases confirm this split: `plume` and `monolith` point at Garuda support rows, while `clouddragon` points at empty-path actor `2208101`.

## Residual Source Sweep

The remaining raw DAT sheets and local support files add context, but no new implementation-ready candidate:

- Sahagin and Dragon hits outside actor-facing sheets are mostly quest/leve/lore strings, not actor/model bindings.
- `companyleveRescueNormal.csv` mentions a character captured by Sahagin, but does not expose a Sahagin battle actor.
- Local wiki `Mandrake` hits are item/gathering/food references, not Mandragora combat data.
- Searches across raw private/company leve sheets, `2Dmap_actor_data`, and spawn/guildleve SQL did not place exact Dragon, Cloud/Sephiroth dragon, or Garuda support rows as normal combat mobs.
- Source/generation code still points to `actorclass.csv` plus `actorclass_graphic.csv` as the local actor/display/appearance source chain; no alternate monster model binding table surfaced.

## Lua Script / Guildleve Cross-Check

The decompiled monster Lua inventory at `tools/outputs/lpb/decomp_further_20260617/summary_chara_monster.json` reports 705 selected, 705 decoded, 705 decompiled, and 0 errors.

Its species summary has no `tonberry`, `sahagin`, `mandragora`, `mandrake`, `lamia`, `scarecrow`, `beastl`, `beastm`, exact `dragon`, literal `drake`, or literal `wyvern` species. The data-backed Dragon-adjacent scripts are named `scalelizard` and `frilllizard`.

Joining current `gamedata_guildleve_mob_types` actor IDs back to raw `actorclass_graphic.csv` also found no guildleve rows for `base = 10051` Golem/Clay, `10521` Mandragora, `10907` exact Dragon, `10526/10527` BeastL/BeastM support rows, `10701` old Dragon/Moogle label, `10854` Titan, or `10909` Ascian/Specter. Guildleve rows do exist for the already-resolved families: `10507` Angler/Orobon, `10508` Elemental, `10512` Chigoe, `10518` Sheep, `10520` Spriggan/Sprite, `10039` Flower/Roselet, and `10034` Drake/Scalelizard.

## Current Server Ownership Snapshot

A join from current `server_battlenpc_mob_types` -> `gamedata_actor_appearance.base` -> installed `mon/m###` folders found 41 installed monster model folders already owned by current server mob type rows.

Candidate-relevant rows:

| Folder | Client family | Current server owner | Skill list |
|---|---|---|---:|
| `m034` | `drake_034` | `sundrake`, `draught_drake`, `flamedrake`, `inferno_drake`, `drake` | `26` |
| `m039` | `hanaobake_m039` | `toadtrap`, `pruned_roselet` | `47` |
| `m057` | `wyvern_057` | `wyvern` | `70` |
| `m507` | `seadevil_507` | `aurora_angler`, `mad_angler`, `angler` | `85` |
| `m509` | `crowd_509` | `emerald_bee_swarm`, `honeybee_swarm` | `93` |
| `m512` | `mosquito_m512` | `chigoe` | `75` |
| `m518` | `sheep_m518` | `lost_lamb` | `74` |
| `m520` | `spriggan_520` | `sabletooth_spriggan`, `spriggan_collector` | `1` |

This creates two useful guardrails:

- `skillListId 93` is not a safe custom Mandragora id; it is currently Bee Swarm.
- The old candidate model labels for `m507`, `m512`, `m518`, and `m520` conflict with live server ownership and should not be repurposed.

Other installed folders with current server ownership:

| Folder | Client family | Example current server owner(s) |
|---|---|---|
| `m002` | `puk_002` | `sea_puk`, `puk_hatchling` |
| `m003` | `raptor_003` | `velociraptor` |
| `m005` | `hippogryph_005` | `hippogryph` |
| `m006` | `mandrillus_m006` | `curious_galago` |
| `m008` | `basilisk_008` | `rainbow_basilisk` |
| `m011` | `sabotender_m011` | `cactuar` |
| `m013` | `crab_m013` | `giant_crab`, `delta_crab`, `molting_megalocrab` |
| `m017` | `kumo_m017` | `molting_miteling`, `dwarf_diremite` |
| `m020` | `vulture_m020` | `nestling_buzzard` |
| `m023` | `wolf_m023` | `feral_watchdog`, `lone_wolf` |
| `m025` | `boar_025` | `truffle_hog`, `wild_hog` |
| `m028` | `bomb_028` | `drifting_dud` |
| `m029` | `ahriman_029` | `Smolenkos` |
| `m032` | `tordor_032` | `fat_dodo`, `stuffed_dodo`, `dodo` |
| `m033` | `nocker_033` | `corroded_coblyn`, `iron_coblyn`, `lightning_beetle` |
| `m035` | `goat_035` | `nannygoat`, `aldgoat_billy` |
| `m037` | `ogre_m037` | `headrip_ogre` |
| `m041` | `apkallu_041` | `fledgling_apkallu`, `little_apkallu`, `apkallu`, `king_apkallu` |
| `m045` | `gigantoad_045` | `toxic_toad` |
| `m502` | `lemming_502` | `star_marmot`, `nutgrabber_marmot`, `thistletail_marmot` |
| `m503` | `bat_m503` | `cave_bat` |
| `m504` | `slug_504` | `giant_slug` |
| `m505` | `ghost_505` | `bogy` |
| `m510` | `jellyfish_510` | `drifting_anemone` |
| `m511` | `yarzon_511` | `yarzon_scavenger`, `yarzon_bleeder` |
| `m513` | `mole_513` | `moiling_mole`, `shroud_shrew` |
| `m515` | `wisp_515` | `firefly` |
| `m516` | `funguar_m516` | `forest_funguar`, `mature_funguar` |
| `m901` | `qiqirn_901` | `qiqirn_mercenary` |
| `m902` | `ixal_902` | Ixal combat rows |
| `m903` | `amaljaa_m903` | Amalj'aa combat rows |
| `m904` | `kobold_904` | `kobold_acolyte`, `kobold_footman`, `kobold_kirkman` |
| `m912` | `goblin_m912` | `goblin_headman`, `goblin_braggadocio`, `goblin_freesword`, `goblin_bouncer` |

## Command Bucket Cross-Check

The command/skill-list layer agrees with the model and actor-data split:

| Bucket | Command evidence | Current owner read |
|---|---|---|
| Drake | `skillListId 26`, slots `1..4`, command comments say Drake | Live server owners: `sundrake`, `draught_drake`, `flamedrake`, `inferno_drake`, `ashdrake`. |
| Wyvern | `skillListId 70`, slots `1..2`, plus shared `wyvern_dive` | Live server owners: two `wyvern` rows. |
| Clay/Golem | `skillListId 37`, slots `1..4`, with `realm_shaker`, `backhand_blow`, and `chaos_thrust` commented as Golem | No current server mob type owner, but `m051` is `golem_m051` and actor rows such as `2208903` bind `base = 10051` to `/Chara/Npc/Monster/Golem/GolemLesserStandard`. |
| Mandragora-like seed moves | `spoil`, `seedvolley`, `germinate`, `seedspray`, `sough` use slots `2..6` in `skillListId 47`; `bombardier` uses slot `1` in `skillListId 84` | `47` is live Flower/Roselet data. `84` is live `lightning_beetle` / Orebeetle data. Animation-compatible with `m521`, but not a retail Mandragora binding. |
| Sahagin | `skillListId 55`, slots `1..3` | No current server owner, no verified model family, no actor binding. `soul_eater` is shared with Wight data. |
| Tonberry | `skillListId 66`, slots `1..3` | No current server owner, no verified model family, no actor binding. |
| Lamia / Scarecrow / BeastL / BeastM / Pot | No clean named command bucket found | Old labels still resolve to other families in the model/actor/script layers. |
| Exact Dragon | Race/display rows exist, but no clean generic Dragon command bucket or live mob owner was found | `2106801..2106804` have `base = 10907` and display `dragon`, but empty actor class paths. |

This makes the command data useful but bounded: it can supply move rows for custom experiments, while actor-backed implementation still requires a model/appearance/class/script chain.

## Command Script Coverage

The server can execute missing per-command Lua through folder defaults:

- `weaponskill/default.lua` performs a basic potency hit and applies `skill.statusId` if present.
- `ability/default.lua` performs a basic potency hit.

Candidate command script coverage is thin:

| Family/list | Exact script coverage | Practical effect |
|---|---|---|
| Drake / `skillListId 26` | Only `steel_cyclone.lua` exists | Current Drake rows can animate and hit, but `smoulder` and `surge` are missing their elemental self-buff behavior. |
| Wyvern / `skillListId 70` | No exact Wyvern command scripts found | Current Wyvern rows can animate and hit through defaults. |
| Clay/Golem / `skillListId 37` | `chaos_thrust.lua` exists; the rest use defaults | A new Clay/Golem mob can fight through defaults, but `tender_thrust`, `caustic_blow`, and `deadly_thrust` are missing their knockback/Defense Down/poison behavior. |
| Mandragora-like Roselet/Beetle moves | No exact scripts found | A custom `m521` experiment would animate and hit, but `sough`/seed behavior would need Lua work. |
| Sahagin / Tonberry | Sahagin has `stunner.lua`; otherwise mostly defaults | Still blocked by missing actor/model bindings, not command execution. |

## Behavior Feasibility

The behavior layer is less blocked than the actor layer, but only for some moves:

- Lua-only candidates: Clay/Golem `caustic_blow` can use the existing `DefenseDown` status row/script, and `deadly_thrust` can use the existing `Poison` row/script.
- Already wired: Sahagin `stunner` has an exact script and uses the shared monster TP Stun helper, though Sahagin itself is still actor/model-blocked.
- Needs status data/script first: `sough` has only the `Soughspeak` enum, with no SQL row/effect script found; `Burn`, `Shock`, and `ShockSpikes` are also enum-only in this pass.
- Needs helper design/verification first: knockback effects exist as packet hit-effect flags, and raw actor `SetPos` is Lua-callable, but no Lua combat command precedent or battle-safe displacement helper was found.

## Implementation Read

The global scan strengthens the current candidate verdict:

- `m521` is the only installed monster folder in this candidate set with direct Mandragora strings.
- `m034` and `m057` remain the data-faithful Dragon-adjacent implementation path: Drake and Wyvern.
- `m051` plus `base = 10051` is the data-faithful Clay/Golem path. It is actor/script/model-backed but needs a new server mob type/spawn because current mob types do not own `skillListId 37`.
- `m507`, `m508`, `m512`, `m518`, `m520`, and `m701` should not be used for their old helper labels; their embedded WSS family strings identify different shipped monster families.
- Tonberry and Sahagin remain command-bucket-only in the current server data, not verified client model families.
- The WSS-silent folder pass does not rescue any rejected candidate; its notable non-candidate identities are Chocobo (`m702`), Titan (`m854`), Ascian/Specter (`m909`), and Gaius (`m910`).
