# Candidate Monster Decomp / Implementation Audit

## Question

Which of these candidates actually exists in the data strongly enough to decomp and implement?

- Tonberry
- Sahagin
- Mandragora
- Lamia
- Scarecrow
- Pot/Clay
- BeastL/BeastM
- Dragon

## Read Rules

The native client path already traced for Mandragora matters here too:

- `actorclass_graphic` data column 6 is copied directly to the appearance `base` model id.
- `base >= 10000` decodes to `mon/m###` by subtracting `10000`.
- Therefore a data-faithful spawn needs a real actor class row, a real appearance/base row, a matching client `mon/m###` folder, and preferably a decompiled monster script.

The old `AI Scripts/scan_monsters.ps1` labels are useful for finding folders, but they are not authoritative. They are hardcoded from wiki-style guesses:

```text
m507 = Sahagin
m508 = Tonberry
m512 = Lamia
m518 = Drake/Dragon
m520 = Scarecrow
m521 = Pot/Clay
m526 = BeastL
m527 = BeastM
m701 = Wyvern/Dragon(lg)
```

When those labels conflict with `actorclass_graphic` plus `gamedata_actor_class`, the actor data wins. A later binary-string pass over the installed client also showed that some old scan labels are simply wrong: `m507` contains `vfx/mon/seadevil_507/...`, `m508` contains `vfx/mon/erementar_m508/...`, `m512` contains `vfx/mon/mosquito_m512/...`, `m518` contains `vfx/mon/sheep_m518/...`, `m520` contains `vfx/mon/spriggan_520/...`, `m521` contains `vfx/mon/mandragora_521/...`, and `m701` contains `vfx/mon/mowgli_701/...`.

## Candidate Results

| Candidate | Client asset evidence | Actor/appearance evidence | Decomp/script evidence | Implementation read |
|---|---:|---|---|---|
| Tonberry | Old label points at `mon/m508`, but WSS strings identify it as `erementar_m508` with elemental throw/counter/berserk actions | `base = 10508` rows bind to Elemental rows, not Tonberry | Elemental scripts decompile; Tonberry TP command bucket exists but is not assigned to a server mob type | No Tonberry model/actor binding found. Commands are isolated custom data, but `m508` is Elemental, not Tonberry. |
| Sahagin | Old label points at `mon/m507`, but WSS strings identify it as `seadevil_507` | `base = 10507` rows bind to Piranha/Orobon/angler rows, not Sahagin | Piranha scripts decompile; Sahagin TP command bucket exists but is not assigned to a server mob type | No Sahagin model/actor binding found. Commands are isolated custom data, but `m507` is not a proven Sahagin asset. |
| Mandragora | `mon/m521` exists and WSS strings point at `vfx/mon/mandragora_521/...`; earlier `m009/m010` hypothesis was wrong | No `base = 10521` actor appearance rows found; `m009` rows bind to Great Buffalo/Kujata | No Mandragora actor class/display/script; seed/spoil/sough commands exist, but the current rows are Roselet/Flower-bound | Asset-proven but actor-unbound. Safe only as a custom experiment if we add an invented actor binding and a cloned skill list; not data-faithful retail spawn data yet. |
| Lamia | Old label points at `mon/m512`, but WSS strings identify it as `mosquito_m512` | `base = 10512` rows bind to Chigoe/Djigga rows | Chigoe scripts decompile; no Lamia command/actor/script evidence in this pass | Not a Lamia candidate. Implement as Chigoe/Djigga only. |
| Scarecrow | Old label points at `mon/m520`, but WSS strings identify it as `spriggan_520` | `base = 10520` rows exist, and they bind to Sprite/Spriggan rows | Sprite/Spriggan scripts decompile; no Scarecrow class/display/script | Not a Scarecrow candidate. Implement as Spriggan only. |
| Pot/Clay | Old label points at `mon/m521`, but WSS strings identify it as `mandragora_521` | No `base = 10521` actor appearance rows found | No Pot/Clay script | Old label is wrong. Use the clay golem row below for "Clay"; treat `m521` as Mandragora asset-only. |
| BeastL | `mon/m526` exists, 5 WSS files, but WSS strings identify it as `m526_rock` | `base = 10526` rows bind to Garuda Lesser and MapObj/monolith rows | Garuda/MapObj scripts decompile | Not a BeastL mob family in actor data. Treat as Garuda rock/monolith support data. |
| BeastM | `mon/m527` exists, 4 WSS files, but WSS strings identify it as `m527_feather` | `base = 10527` rows bind to Garuda and Garuda Feather/plume rows | Garuda scripts decompile | Not a BeastM mob family in actor data. Treat as Garuda/feather support data. |
| Dragon, exact display name | `base = 10907 -> mon/m907`; installed `m907` is missing | `dragon` display rows `2106801..2106804` exist, but class path is empty | No script to decompile | Not implementable as-is. Data has a name/base, but no class script and no client model folder. |
| Drake/Wyvern side of Dragon | `mon/m034` and `mon/m057` exist | Drake rows use `base = 10034`; Wyvern rows use `base = 10057` | Scalelizard and FrillLizard scripts decompile | Safe/data-faithful. Already represented in server mob type data. |
| Old `m701` Dragon/Wyvern label | `mon/m701` exists, 24 WSS files, but WSS strings identify it as `mowgli_701` | `base = 10701` rows bind to Moogle/Good King Moggle Mog data | Moogle scripts decompile | Not a Dragon/Wyvern candidate. Treat as Moogle data only. |
| Clay golem side note | `base = 10051 -> mon/m051` exists and WSS strings identify `golem_m051` | `2208903` is `clay golem` and uses Golem class data | Golem script decompiles; `skillListId 37: golem` exists but has no current server mob type owner | Implementable if the intent was clay golem, not the `m521` Pot/Clay asset label. Needs a new server mob type/spawn row. |

## Deeper Client Folder Pass

Installed client path checked:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\chara\mon
```

Full global scan details are in:

```text
docs/monster_global_wss_family_scan_2026-06-19.md
```

Raw string extraction from the candidate WSS/model folders found:

- `m034`: `vfx/mon/drake_034/...`
- `m057`: `vfx/mon/wyvern_057/...`
- `m507`: `vfx/mon/seadevil_507/skill1..4/...`
- `m508`: `vfx/mon/erementar_m508/throw_fire`, `throw_water`, `throw_rock`, `throw_elect`, `throw_ice`, `throw_blast`, `magic_counter`, `magic_berserk`
- `m512`: `vfx/mon/mosquito_m512/throw` and `funsi`
- `m518`: `vfx/mon/sheep_m518/...`
- `m520`: `vfx/mon/spriggan_520/...`
- `m521`: `vfx/mon/mandragora_521/...`
- `m526`: `vfx/mon/m526_rock/skill01..05/...`
- `m527`: `vfx/mon/m527_feather/skill01..03/...`
- `m701`: `vfx/mon/mowgli_701/skl01..25/...`
- `m010` and `m907`: missing from the installed client tree.

That changes the Mandragora read from "maybe `m009`/missing `m010`" to "definitely client asset `m521`, but no actor binding." It does not create a retail actor row, but it does make a custom Mandragora spawn technically plausible if we deliberately add:

- a new actor class row using a generic or custom monster script,
- an actor appearance/graphics row with `base = 10521`,
- a server mob type row,
- and a Mandragora-specific skill list cloned from compatible plant commands rather than relabeling the live Roselet list.

The more detailed `m521` WSS pass found 11 action files. Slots `0001` through `0006` contain `skill01` through `skill06` references under `vfx/mon/mandragora_521/...`; later slots continue through `skill11` but are less completely labeled. That is enough to believe model animation slots can resolve on `m521`, but still not enough to prove a retail actor binding.

The follow-up pass over the 19 installed folders without WSS `vfx\mon` family strings did not reveal hidden Tonberry, Sahagin, Lamia, Scarecrow, exact Dragon, BeastL, or BeastM evidence. It resolved several side identities instead: `m525` has non-WSS `m525_beacon` VFX strings; `m702` joins to Chocobo data; `m854` joins to Titan rows with non-decompiled scripts; `m909` joins to Ascian/Specter with a decompiled Specter script; and `m910` joins to Gaius van Baelsar with an empty class path.

## Raw DAT Sheet Pass

The next deeper pass checked the raw DAT-mined sheets under `docs/Dat Mining`, not just the SQL projection:

- `docs/Dat Mining/actorclass_graphic.csv`
- `docs/Dat Mining/actorclass.csv`
- `docs/Dat Mining/xtx_displayName.csv`
- `docs/Dat Mining/xtx_monsterRace.csv`

`Map Server/Utils/SQLGeneration.cs` confirms that `GenerateActorAppearance()` copies `actorclass_graphic.csv` fields starting at CSV index `7`; that first copied field is the server `gamedata_actor_appearance.base`. The raw DAT sheet therefore gives an independent check for missing `base` rows before SQL import.

Raw `actorclass_graphic.csv` counts for the candidate bases:

| Base | Raw row count | Raw actor/display read |
|---:|---:|---|
| `10034` | 42 | Drake/Biast rows, mostly `Scalelizard` scripts |
| `10057` | 4 | Wyvern rows, `FrillLizard` script |
| `10051` | 12 | Golem rows, including `clay golem` |
| `10507` | 30 | Angler/Orobon/Piranha rows |
| `10508` | 99 | Elemental rows |
| `10512` | 30 | Chigoe/Djigga rows |
| `10518` | 38 | Sheep/Karakul rows |
| `10520` | 61 | Sprite/Spriggan rows |
| `10521` | 0 | No Mandragora actor graphic row in raw DAT sheet |
| `10526` | 10 | Garuda Lesser/monolith support rows |
| `10527` | 8 | Garuda/feather/plume support rows |
| `10701` | 23 | Moogle rows |
| `10854` | 4 | Titan/Test rows |
| `10907` | 4 | `dragon` display rows, but empty actor class path |
| `10909` | 3 | Ascian/Specter rows |

The raw `xtx_monsterRace.csv` taxonomy contains `Dragon`, `Drake`, `Wyvern`, `Golem`, `Spriggan`, `Elemental`, `Chigoe`, `Sheep`, `Garuda`, `Titan`, and `Ascian`. It does not contain `Tonberry`, `Sahagin`, `Mandragora`, `Mandrake`, `Lamia`, `Scarecrow`, `BeastL`, or `BeastM`.

The raw `xtx_displayName.csv` sheet also does not expose Tonberry, Sahagin, Mandragora, Mandrake, Lamia, Scarecrow, BeastL, or BeastM as actor display names. Exact `dragon`, Drake, Wyvern, Clay/Golem, and Spriggan names do exist. Sahagin appears in quest/journal text elsewhere, but not in these actor-facing sheets.

That means the missing Mandragora binding is not just a server SQL truncation issue: the raw actor graphics sheet also has no `base = 10521` row, and the raw race/name sheets do not expose a Mandragora race/display family.

## Actor Binding Continuation Pass

The follow-up binding trace checked the tempting raw actor rows and local GM spawn aliases that looked like they might rescue blocked candidates.

- `base = 10521` still has zero raw `actorclass_graphic.csv` rows, so no hidden Mandragora actor binding surfaced.
- `base = 10526` is real, but the rows resolve to Garuda support: `2209503` and `2209506..2209509` use `/Chara/Npc/Monster/Garuda/GarudaLesser`, while `5900031..5900035` use `/Chara/Npc/MapObj/MapObjStandard`. Their shared display side resolves to `3209510` / `monolith`, and the local GM alias `monolith` points at `2209506`.
- `base = 10527` is also real, but it resolves to Garuda Lesser/Feather support: `2209502` uses `/Chara/Npc/Monster/Garuda/GarudaLesser`; `2209510..2209513` and `2209518..2209519` use `/Chara/Npc/Monster/Garuda/GarudaFeather`; display names include `3209504` / `razor plume` and `3209505` / `satin plume`. The local GM alias `plume` points at `2209502`.
- Exact Dragon remains split across incomplete data: `xtx_monsterRace.csv` has `1068` / `Dragon`, display names `3106801` and `3206801` say `dragon`, and actors `2106801..2106804` use `base = 10907`; however their actor class paths are empty and the installed `mon/m907` folder is missing.
- `Cloud dragon` and `Sephiroth dragon` are a different side path, not the exact Dragon rows. The only `base = 10022` actor appearance rows found are `2108101`, `2108102`, `2208101`, and `2208102`; they display as those names, resolve to `mon/m022` / `erimakitokage_m022`, and have empty actor class paths. No current server mob type or guildleve row owns those actors. The local GM alias `clouddragon` points at `2208101`, useful for manual visual probing but not proof of a data-faithful Dragon implementation.

## Residual Source Sweep

A wider "anything else findable?" pass checked the remaining raw DAT sheets, local wiki scrape, native/source strings, private/company leve sheets, map actor data, and local helper outputs.

- Candidate-name hits outside actor-facing sheets are mostly narrative or item text. Sahagin appears in Limsa/company leve story text, and Dragon appears heavily in Dragoon/Ishgard quest text, but those references do not carry actor ids or model bindings.
- `companyleveRescueNormal.csv` contains a Sahagin rescue/prison line, but the objective text only asks the player to slay nearby creatures; no Sahagin actor row or model path is referenced there.
- Local wiki `Mandrake` hits resolve to item/gathering/food pages, not a Mandragora/Mandrake combat actor.
- Searches across `privateGLBattle*`, `guildleve*`, `2Dmap_actor_data`, and server/gamedata spawn tables did not place the odd actor ids (`2106801..2106804`, `2108101/2108102`, `2208101/2208102`, or the Garuda support rows) as usable combat mobs. Clay Golem actor ids still remain actor/script-backed but unplaced in current server mob data.
- `Map Server/Utils/SQLGeneration.cs` and the server spawn path still collapse to the same two actor-binding sheets: `actorclass.csv` for class/display and `actorclass_graphic.csv` for appearance/model `base`. No second local model-to-actor table surfaced in this pass.
- A numeric caveat: `10907` also appears as a guildleve id (`Dropping Like Flies`) in guildleve data, unrelated to Dragon `base = 10907`.

## Lua Script / Guildleve Pass

The decompiled client monster script inventory was also checked:

```text
tools/outputs/lpb/decomp_further_20260617/summary_chara_monster.json
```

That chunk reports 705 selected monster scripts, 705 decoded, 705 decompiled, and 0 errors. Its `monster_species_summary.csv` has 82 script species.

No decompiled script species was found for:

- `tonberry`
- `sahagin`
- `mandragora` / `mandrake`
- `lamia`
- `scarecrow`
- `beastl` / `beastm`
- exact `dragon`
- literal `drake` or `wyvern`

The Dragon-adjacent script path is instead the already-known data path:

- Drake actor rows use `Scalelizard` scripts.
- Wyvern actor rows use `FrillLizard` scripts.

The old candidate labels also resolve to already-known script families:

| Old/candidate read | Script family actually present |
|---|---|
| Sahagin via `m507` | `piranha` |
| Tonberry via `m508` | `elemental` |
| Lamia via `m512` | `chigoe` |
| Drake/Dragon via `m518` | `sheep` |
| Scarecrow via `m520` | `sprite` |
| Pot/Clay via `m521` | no Mandragora/Pot script family; use `golem` only for actual clay golem rows |
| BeastL/BeastM via `m526/m527` | `garuda` support scripts |
| Dragon/Wyvern via `m701` | `moogle` |

The guildleve combat mob table was then joined back to raw `actorclass_graphic.csv`:

```text
Data/sql/gamedata_guildleve_mob_types.sql
```

It contains 253 generated guildleve/behest combat rows, and every row had a raw actor graphic binding. Candidate-relevant base counts:

| Base | Guildleve rows | Read |
|---:|---:|---|
| `10034` | 4 | Drake/Biast rows via Scalelizard scripts |
| `10039` | 6 | Roselet/Flytrap rows via Flower scripts |
| `10051` | 0 | Clay golem actor data exists, but not in current guildleve mob types |
| `10057` | 0 | Wyvern actor data exists, but not in current guildleve mob types |
| `10507` | 3 | Angler/Orobon/Piranha rows |
| `10508` | 11 | Elemental rows |
| `10512` | 6 | Chigoe/Djigga rows |
| `10518` | 4 | Sheep/Karakul rows |
| `10520` | 5 | Spriggan rows using Sprite scripts |
| `10521` | 0 | No Mandragora guildleve actor row |
| `10526` | 0 | No BeastL/rock guildleve mob row |
| `10527` | 0 | No BeastM/feather guildleve mob row |
| `10701` | 0 | No Moogle/old Dragon label guildleve row |
| `10854` | 0 | No Titan guildleve row |
| `10907` | 0 | No exact Dragon guildleve row |
| `10909` | 0 | No Ascian/Specter guildleve row |

So the script/guildleve layer does not reveal a hidden implementable Tonberry, Sahagin, Mandragora, Lamia, Scarecrow, BeastL/BeastM, or exact Dragon. It reinforces the same safe path: implement Drake/Wyvern through existing Scalelizard/FrillLizard data, and implement Clay only through existing Golem data.

## Actor / Script Join Pass

A structured join across `actorclass_graphic`, `gamedata_actor_class`, display names, script correlation output, and current server mob types gives this model identity read:

| Base | Client family strings | Actor/script identity | Current server usage |
|---:|---|---|---|
| `10507` | `seadevil_507`, 4 WSS slots | Piranha/Orobon/angler rows, decompiled Piranha scripts | Angler rows use `skillListId 85`; not Sahagin |
| `10508` | `erementar_m508`, 8 WSS slots | Elemental rows, decompiled Elemental scripts | No `skillListId 66` mob owner found; not Tonberry |
| `10512` | `mosquito_m512`, 2 WSS slots | Chigoe/Djigga rows, decompiled Chigoe scripts | `chigoe` uses `skillListId 75`; not Lamia |
| `10518` | `sheep_m518`, 9 WSS slots | Sheep/Karakul rows, decompiled Sheep scripts | `lost_lamb` uses `skillListId 74`; not Drake/Dragon |
| `10520` | `spriggan_520`, 15 WSS slots | Sprite/Spriggan rows, decompiled Sprite scripts | Several Spriggan rows use existing server mob data |
| `10521` | `mandragora_521`, 11 WSS slots | No actor/appearance row found | No server owner |
| `10526` | `m526_rock`, 5 WSS slots | Garuda Lesser plus MapObj/monolith rows | Garuda/monolith support data |
| `10527` | `m527_feather`, 4 WSS slots | Garuda/feather/plume rows | Garuda feather support data |
| `10701` | `mowgli_701`, 24 WSS slots | Moogle and Good King Moggle Mog rows | Moogle data; not Dragon/Wyvern |
| `10907` | installed `m907` missing | display name `dragon`, but actor class path is empty | No script/model to implement |

## Command / Animation Slot Pass

`server_battle_commands.modelAnimation` is the model action slot used by monster commands. The companion `battleAnimation` values line up as `0x13001000`, `0x13002000`, `0x13003000`, and so on for slots `1`, `2`, `3`, etc.

Command bucket status:

| Candidate/family | Skill list evidence | Current server owner evidence | Implementation read |
|---|---|---|---|
| Drake | `skillListId 26: drake`, slots `1..4` plus repeated slot `1` specials | Live owners: `sundrake`, `draught_drake`, `flamedrake`, `inferno_drake`, `ashdrake` | Actor-backed and implementable through existing Scalelizard data. |
| Wyvern | `skillListId 70: wyvern`, slots `1..2`; `wyvern_dive` is also in unused `skillListId 15: boss_physical` | Live owners: two `wyvern` mob rows | Actor-backed and implementable through existing FrillLizard data. |
| Mandragora-like seed moves | `skillListId 47: roselet_landtrap` has `spoil`, `seedvolley`, `germinate`, `seedspray`, `sough` in slots `2..6`; `skillListId 84: beetle` has `bombardier` in slot `1` | `47` is live Toadtrap/Roselet/Flower data. `84` is live `lightning_beetle` / Orebeetle data. | Animation-compatible with `m521` slots `1..6`, but not actor-backed Mandragora data. Clone into a new custom list only if we accept invented binding data. |
| Clay/Golem | `skillListId 37: golem` has slots `1..4`: `tender_thrust`, `caustic_blow`, `deadly_thrust`, `realm_shaker`, `backhand_blow`, `chaos_thrust` | No current server mob owner, but actor rows `2108901..2108904` and `2208901..2208908` use `base = 10051` and `/Chara/Npc/Monster/Golem/GolemLesserStandard` | Actor/script/model-backed. Spawn-safe as a new Golem/Clay Golem mob type if we create server mob/spawn rows; not evidence for the old `m521` Pot label. |
| Sahagin | `skillListId 55: sahagin`, slots `1..3` | No current mob owner. `soul_eater` is shared with `skillListId 58: wight` and its command comment says Wight. | Command-only. No matching model, actor appearance, actor class, script, or server owner found. |
| Tonberry | `skillListId 66: tonberry`, slots `1..3` | No current mob owner | Command-only. No matching model, actor appearance, actor class, script, or server owner found. |
| Lamia / Scarecrow / BeastL / BeastM / Pot | No clean named command bucket found in the current command or skill-list SQL | Old model labels resolve to Chigoe, Sprite, Garuda support, and Mandragora/Golem-adjacent data instead | Not implementable as named retail-data mobs from the checked sources. |
| Exact Dragon | Dragon display/race rows exist, and some commands mention dragon in names, but no clean generic Dragon skill list or live owner was found | `2106801..2106804` have `base = 10907` and display `dragon`, but empty actor class paths | Not spawn-safe as exact Dragon. Use Drake/Wyvern for data-backed Dragon-adjacent work. |

Current server mob type ownership guardrails:

- `skillListId 26` and `70` are live actor-backed Drake/Wyvern data.
- `skillListId 37` is an unowned Golem command bucket. Its actor/script/model chain exists through `base = 10051 -> mon/m051`, but no current `server_battlenpc_mob_types` row uses it.
- `skillListId 47` is assigned to Toadtrap/Roselet rows, so it is not an unbound Mandragora bucket.
- `skillListId 84` is assigned to `lightning_beetle`, actor `2102128`, `base = 10033`, `/Chara/Npc/Monster/Orebeetle/OrebeetleStandard`.
- `skillListId 55` and `66` are not assigned to any current `server_battlenpc_mob_types` row.
- `skillListId 93` is assigned to Bee Swarm rows, so it is also not safe as a Mandragora experiment id.
- `skillListId 74`, `75`, and `85` are assigned to Sheep, Chigoe, and Angler rows respectively.

The Sahagin and Tonberry commands select generic model animation slots `1..3`, but without a matching client family string or actor binding, those slots do not identify a shipped Sahagin or Tonberry model.

## Command Script / Behavior Pass

The next implementation-layer check joined candidate command rows to `Data/scripts/commands`. `Database.LoadGlobalBattleCommandList()` loads command scripts from `commands/{folder}/{command.name}.lua`, where `folder` is derived from `server_battle_commands.commandType`. If no exact script exists, `LuaEngine` falls back to `commands/{folder}/default.lua`.

For these monster TP rows, almost everything lands in `weaponskill/default.lua`. That default is functional for smoke tests: it sets `action.amount = skill.basePotency`, runs `action.DoAction(...)`, and then tries `skill.statusId` if one is present. However, if a row has no exact Lua and no `statusId`, it is generic damage only.

Exact script coverage:

| Family/list | Exact scripts found | Default-only commands | Behavior read |
|---|---|---|---|
| Drake / `skillListId 26` | `steel_cyclone.lua` | `caudal_spine`, `smoulder`, `surge`, `raging_horn`, `crimson_cyclone`, `ring_of_thorns` | Spawn-fight capable through defaults, but incomplete. Wiki data says `smoulder` and `surge` are elemental self-buffs; current rows have no exact script/status effect. |
| Wyvern / `skillListId 70` | None | All listed Wyvern commands | Spawn-fight capable through defaults, but behavior is generic damage only. |
| Clay/Golem / `skillListId 37` | `chaos_thrust.lua` | `tender_thrust`, `caustic_blow`, `deadly_thrust`, `realm_shaker`, `backhand_blow` | Spawn-fight capable through defaults. Some list entries are borrowed Cactuar/Diremite commands; wiki data says `tender_thrust` should knock back, `caustic_blow` should apply Defense Down, and `deadly_thrust` should poison, but current rows have no status ids. |
| Sahagin / `skillListId 55` | `stunner.lua` | Other Sahagin commands | Still command-only/no model. `stunner` can apply the shared monster TP Stun helper; the rest are generic damage if used. |
| Tonberry / `skillListId 66` | None | All Tonberry commands | Still command-only/no model. Defaults would only provide generic damage. |
| Mandragora-like Roselet/Beetle moves | None | `bombardier`, `spoil`, `seedvolley`, `germinate`, `seedspray`, `sough` | Animation-compatible for a custom `m521` experiment, but behavior is generic damage only. Notably, `Soughspeak` exists as a status id in server enums, but `sough` has no exact command script/status row. |

So the implementation tiers become:

- Drake/Wyvern: already current server mob data; can fight now, but many TP moves are behavior-light defaults.
- Clay Golem: model/actor/script/skill-list data exists; needs a new server mob type/spawn row, then can fight with mostly default TP behavior.
- Mandragora: custom actor binding plus custom skill list required; command behavior would also need Lua if we want more than generic damage.
- Tonberry/Sahagin: command rows can execute through defaults, but no actor/model binding was found.

## Behavior Feasibility Pass

The deeper behavior check separates "can animate and hit" from "can reproduce the missing TP effect." I checked the status-effect enums, `server_statuseffects.sql`, existing `Data/scripts/effects`, the shared `monster_tp.lua` helper, and the battle packet hit-effect path.

| Behavior / move | Current hook evidence | Implementation read |
|---|---|---|
| `caustic_blow` Defense Down | `StatusEffectId.DefenseDown = 223038`, a `server_statuseffects` row, and `effects/defense_down.lua` already exist. | Lua-only once we choose magnitude, duration, and landing chance. An exact `weaponskill/caustic_blow.lua` can reuse the existing status system. |
| `deadly_thrust` Poison | `StatusEffectId.Poison = 223011`, a `server_statuseffects` row, and `effects/poison.lua` already exist. | Lua-only once we choose magnitude, duration, and landing chance. |
| `stunner` Stun | `weaponskill/stunner.lua` already calls `MonsterTpApplyStatuses(... MonsterTpStatusSets.Stunner)`. | Already implemented at the command-script level. Still blocked only if the candidate family lacks actor/model data. |
| `smoulder` / `surge` self-buff behavior | `FistsofFire = 223209` has a SQL row and an effect script file, but `effects/fists_of_fire.lua` is currently empty. `Burn = 223148`, `ShockSpikes = 223132`, and `Shock = 223150` exist in enums but no SQL rows/effect scripts were found. | A visible placeholder buff is easy; faithful elemental damage/reflect/burn/shock behavior needs effect script/data work. |
| `sough` / `Soughspeak` | `Soughspeak = 223115` exists in Lua/C# status enums, but no `server_statuseffects` row or effect script was found, and `sough` has no exact command script. | Needs status data plus an effect script before it is more than generic damage. |
| `tender_thrust` knockback | `hiteffect.lua` and C# both expose `KnockbackLv1..5`; packets serialize `CommandResult.effectId`. Lua can also call raw actor `SetPos`, and GM scripts use it for manual repositioning. No existing Lua combat command sets knockback, no battle-safe displacement helper was found, and `KnockbackImmune` is only used by the `tempered_will` effect. | Visual knockback may be Lua-only by overriding `action.effectId` after `DoAction`; faithful combat knockback needs a helper that handles direction, distance, immunity, landed/missed hits, and movement packets. |
| `bombardier`, `spoil`, `seedvolley`, `germinate`, `seedspray` | No exact command scripts and no move-specific status wiring were found. | Generic hit today. Move flavor would need custom Lua, but not necessarily engine work unless it requires a missing mechanic. |

So the next practical implementation tier is:

- Ready Lua work: `caustic_blow`, `deadly_thrust`, and similar direct enfeeble moves.
- Data/script work first: `sough`, Burn/Shock/Shock Spikes-style effects, and real Fists-style elemental buffs.
- Helper design/verification first: knockback that must actually move actors, not just play the client recoil effect.

## Clay Golem Command Pass

The deeper Clay/Pot check splits the old label into two different reads:

- `m521` is Mandragora asset evidence, not Pot/Clay.
- Real Clay Golem data is `base = 10051 -> mon/m051`, with WSS strings identifying `golem_m051`.

The actor rows are usable:

| Actor id | Display | Base | Script path |
|---:|---:|---:|---|
| `2108904` | `3108903` / `Number 126` | `10051` | `/Chara/Npc/Monster/Golem/GolemLesserStandard` |
| `2208903` | `3208903` / `clay golem` | `10051` | `/Chara/Npc/Monster/Golem/GolemLesserStandard` |

`skillListId 37: golem` currently has no live server mob type owner, but it does contain a usable Golem command bucket:

| Command | Name | Model animation slot | Comment caveat |
|---:|---|---:|---|
| `23148` | `tender_thrust` | `1` | Comment says Cactuar |
| `23288` | `caustic_blow` | `1` | Comment says Diremite |
| `23289` | `deadly_thrust` | `2` | Comment says Diremite |
| `23290` | `realm_shaker` | `3` | Comment says Golem |
| `23291` | `deadly_thrust` | `4` | Comment says Diremite |
| `23445` | `backhand_blow` | `1` | Comment says Golem |
| `23614` | `chaos_thrust` | `1` | Comment says Golem |

So Clay Golem is not already placed in current server mob data, but it is much stronger than Mandragora/Tonberry/Sahagin: model, actor appearance, actor class, decompiled script family, display name, and skill list all exist. The implementation task would be to add a server mob type/spawn using an existing Golem actor row and `skillListId 37`, not to invent a model binding.

## Mandragora / Roselet Command Pass

The deeper check corrected one important point: `skillListId 47` is not an unused Mandragora list. It is assigned to `pruned_roselet` mob type rows, which use actor `2102722`, display `3102722`, `base = 10039 -> mon/m039`, and `/Chara/Npc/Monster/Flower/FlowerPoisonousStandard`.

The relevant server battle commands are still useful for a custom Mandragora experiment because they select model animation slots:

| Command | Name | Model animation slot | Existing owner |
|---:|---|---:|---|
| `23084` | `bombardier` | `1` | `skillListId 84` / `lightning_beetle`; command comment says Roselet |
| `23085` | `spoil` | `2` | `skillListId 47` / `pruned_roselet` |
| `23086` | `seedvolley` | `3` | `skillListId 47` / `pruned_roselet` |
| `23087` | `germinate` | `4` | `skillListId 47` / `pruned_roselet` |
| `23088` | `seedspray` | `5` | `skillListId 47` / `pruned_roselet` |
| `23089` | `sough` | `6` | `skillListId 47` / `pruned_roselet` |

So the safe implementation read is: do not change Roselet or Beetle ownership, but a custom Mandragora actor using `base = 10521` could clone `23084..23089` into a new unused Mandragora-specific skill list and likely drive `m521` WSS slots `0001` through `0006`.

## Verdict

Safe to implement now from current server mob type data:

- Drake and Wyvern, using the existing Scalelizard/FrillLizard actor data.

Safe to add as an actor/script-backed server mob type:

- Clay golem, if that is what "Clay" meant, using existing Golem actor data, `base = 10051 -> mon/m051`, `/Chara/Npc/Monster/Golem/GolemLesserStandard`, and `skillListId 37`.

Safe to implement as custom/unbound, if we explicitly accept invented binding data:

- Mandragora as `mon/m521`, because the client asset is real and Mandragora-labeled, but the actor-class/appearance rows are missing. Use a cloned/custom skill list if reusing Roselet/Beetle command rows; do not treat `skillListId 47`, `84`, or `93` as unbound.

Not safe as data-faithful spawns yet:

- Tonberry
- Sahagin
- Mandragora
- Lamia
- Scarecrow
- Pot/Clay as `m521`
- BeastL/BeastM
- Exact display-name Dragon

Those candidates have some mixture of client assets or TP-style commands, but the missing piece is the actor-class/appearance/script binding that would make them real retail-data mobs rather than invented custom spawns.
