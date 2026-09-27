# BG Object Spawn Model Versions

Use these with the GM preview command:

```text
!spawnbgmodel <b###|20###> [e###]
```

The command spawns a temporary preview actor at your current position, then swaps it to the matching BG object appearance. These are for visually checking the models from the `BgObj_Models` list. For client-baked map objects with `layoutId` and `instanceId`, use `!spawnbgobj` instead; see `docs/mapobj-spawn-candidates.md` for DAT-backed object rows.

If `e001` is listed, you can omit it:

```text
!spawnbgmodel b923
!spawnbgmodel b923 e002
!spawnbgmodel 20923 e003
```

For raw DAT/SQL candidates that are not yet confirmed as canonical `b### e###` mappings, spawn the appearance ID directly:

```text
!spawnbgmodel appearance 1200184
```

## Spawn Model Commands

| BgObj | Description | Spawn model versions |
| --- | --- | --- |
| `b001` | Rope | `!spawnbgmodel b001 e001` |
| `b002` | Large boat | `!spawnbgmodel b002 e001` |
| `b003` | Large boats | `!spawnbgmodel b003 e001`<br>`!spawnbgmodel b003 e002` |
| `b004` | Boat door | `!spawnbgmodel b004 e001` |
| `b900` | Two coloured cubes | Not mapped in the current spawn-model table. |
| `b901` | Variety: seasonal furnishings, mugs, plates, books, Rivenroad objects | `!spawnbgmodel b901 e001`<br>`!spawnbgmodel b901 e002`<br>`!spawnbgmodel b901 e003`<br>`!spawnbgmodel b901 e004`<br>`!spawnbgmodel b901 e005`<br>`!spawnbgmodel b901 e006`<br>`!spawnbgmodel b901 e007`<br>`!spawnbgmodel b901 e008`<br>`!spawnbgmodel b901 e009`<br>`!spawnbgmodel b901 e010`<br>`!spawnbgmodel b901 e011`<br>`!spawnbgmodel b901 e012`<br>`!spawnbgmodel b901 e013`<br>`!spawnbgmodel b901 e015`<br>`!spawnbgmodel b901 e016`<br>`!spawnbgmodel b901 e017`<br>`!spawnbgmodel b901 e018`<br>`!spawnbgmodel b901 e019`<br>`!spawnbgmodel b901 e020`<br>`!spawnbgmodel b901 e022`<br>`!spawnbgmodel b901 e023`<br>`!spawnbgmodel b901 e024`<br>`!spawnbgmodel b901 e025`<br>`!spawnbgmodel b901 e026`<br>`!spawnbgmodel b901 e030`<br>`!spawnbgmodel b901 e031` |
| `b902` | Aetheryte crystal | `!spawnbgmodel b902 e001`<br>`!spawnbgmodel b902 e002` |
| `b903` | Mini-Aetheryte crystal | `!spawnbgmodel b903 e001` |
| `b904` | Primal Aetheryte | `!spawnbgmodel b904 e001` |
| `b906` | Basket of green peas? | `!spawnbgmodel b906 e001` |
| `b907` | Square wooden crate | `!spawnbgmodel b907 e001` |
| `b908` | Square wooden crate | `!spawnbgmodel b908 e001` |
| `b909` | Aluminum bucket | `!spawnbgmodel b909 e001`<br>`!spawnbgmodel b909 e004`<br>`!spawnbgmodel b909 e005`<br>`!spawnbgmodel b909 e006` |
| `b910` | Garlean ship | `!spawnbgmodel b910 e001` |
| `b911` | Boat with Sahagin marks | `!spawnbgmodel b911 e001` |
| `b912` | Boats | `!spawnbgmodel b912 e001`<br>`!spawnbgmodel b912 e002` |
| `b913` | Big boat | `!spawnbgmodel b913 e001` |
| `b914` | Boats | `!spawnbgmodel b914 e001` |
| `b915` | Boat with red masts | `!spawnbgmodel b915 e001` |
| `b916` | Dinghy | `!spawnbgmodel b916 e001`<br>`!spawnbgmodel b916 e002` |
| `b917` | Boat with red masts | `!spawnbgmodel b917 e001` |
| `b918` | Lily light furnishing | `!spawnbgmodel b918 e001` |
| `b919` | Urns, Ixali style | `!spawnbgmodel b919 e001`<br>`!spawnbgmodel b919 e002`<br>`!spawnbgmodel b919 e003` |
| `b920` | Urns, Kobold style | `!spawnbgmodel b920 e001`<br>`!spawnbgmodel b920 e002`<br>`!spawnbgmodel b920 e003` |
| `b921` | Kobold drill with cart | `!spawnbgmodel b921 e001` |
| `b922` | Gong | `!spawnbgmodel b922 e001` |
| `b923` | Chests | `!spawnbgmodel b923 e001`<br>`!spawnbgmodel b923 e002`<br>`!spawnbgmodel b923 e003` |
| `b924` | Festival float | `!spawnbgmodel b924 e001` |
| `b925` | Aetherial gate | `!spawnbgmodel b925 e001` |
| `b926` | Kobold drill | `!spawnbgmodel b926 e001` |
| `b927` | Amal'jaa chests | `!spawnbgmodel b927 e001`<br>`!spawnbgmodel b927 e002`<br>`!spawnbgmodel b927 e003` |
| `b928` | Starlight bell set (`v11_bell` shaders) | `!spawnbgmodel b928 e001`<br>`!spawnbgmodel b928 e002`<br>`!spawnbgmodel b928 e003` |
| `b929` | Little Ladies' Day deployed wall | `!spawnbgmodel b929 e001` |
| `b930` | Cherry blossom trees | `!spawnbgmodel b930 e001` |
| `b931` | Cherry blossom trees, different size | `!spawnbgmodel b931 e001` |
| `b932` | Cherry blossom archway | `!spawnbgmodel b932 e001` |
| `b933` | Christmas tree | `!spawnbgmodel b933 e001` |
| `b934` | Christmas tree | `!spawnbgmodel b934 e001` |
| `b935` | Christmas archway | `!spawnbgmodel b935 e001` |
| `b936` | Magitek terminal | `!spawnbgmodel b936 e001`<br>`!spawnbgmodel b936 e002`<br>`!spawnbgmodel b936 e003`<br>`!spawnbgmodel b936 e004`<br>`!spawnbgmodel b936 e005`<br>`!spawnbgmodel b936 e006`<br>`!spawnbgmodel b936 e007`<br>`!spawnbgmodel b936 e008`<br>`!spawnbgmodel b936 e009` |
| `b937` | Coffin | `!spawnbgmodel b937 e001` |
| `b938` | Ironworks airship | `!spawnbgmodel b938 e001` |
| `b939` | Fireworks launcher | `!spawnbgmodel b939 e001`<br>`!spawnbgmodel b939 e002` |
| `b940` | All Saints' Wake black-and-orange photo booth (`v11_snbl` stem is misleading; native mesh and texture match 2011 Halloween footage) | `!spawnbgmodel b940 e001` |
| `b941` | Broken bricks | `!spawnbgmodel b941 e001`<br>`!spawnbgmodel b941 e002`<br>`!spawnbgmodel b941 e003` |
| `b942` | Moonfire Faire fireplace | `!spawnbgmodel b942 e001` |
| `b943` | Titan's Heart | `!spawnbgmodel b943 e001` |
| `b949` | Chocobo sign | `!spawnbgmodel b949 e001` |
| `b950` | Carriage sign | `!spawnbgmodel b950 e001` |
| `b951` | Rectangular wooden crate | `!spawnbgmodel b951 e001` |
| `b952` | Brazier | `!spawnbgmodel b952 e001` |
| `b953` | Broken stand thing | `!spawnbgmodel b953 e001` |
| `b954` | Yellow eggs | `!spawnbgmodel b954 e001` |
| `b955` | Rocks | `!spawnbgmodel b955 e001` |
| `b956` | Rock variant | `!spawnbgmodel b956 e001` |
| `b957` | Rock with flora | `!spawnbgmodel b957 e001` |
| `b958` | Retainer bell | `!spawnbgmodel b958 e001` |
| `b959` | Airship | `!spawnbgmodel b959 e001` |
| `b960` | Kobold portable furnace | `!spawnbgmodel b960 e001` |
| `b961` | Kobold carriage | `!spawnbgmodel b961 e001` |
| `b962` | Amal'jaa carriage | `!spawnbgmodel b962 e001` |
| `b963` | Armored Amal'jaa carriage | `!spawnbgmodel b963 e001` |
| `b964` | Ixali balloon platform | `!spawnbgmodel b964 e001` |
| `b965` | Sylph egg | `!spawnbgmodel b965 e001` |
| `b966` | Gathering point | `!spawnbgmodel b966 e001`<br>`!spawnbgmodel b966 e002` |
| `b967` | Gathering point | `!spawnbgmodel b967 e001` |
| `b968` | Gathering point | `!spawnbgmodel b968 e001` |
| `b969` | Swirly animation | `!spawnbgmodel b969 e001` |
| `b970` | Faint light | `!spawnbgmodel b970 e001` |
| `b971` | Fish animation | `!spawnbgmodel b971 e001` |
| `b972` | Easter balloon with egg basket | `!spawnbgmodel b972 e001`<br>`!spawnbgmodel b972 e002`<br>`!spawnbgmodel b972 e003`<br>`!spawnbgmodel b972 e004` |
| `b973` | Easter eggs | `!spawnbgmodel b973 e001`<br>`!spawnbgmodel b973 e002`<br>`!spawnbgmodel b973 e003` |
| `b974` | Firefly or wavering light | `!spawnbgmodel b974 e001` |
| `b975` | Moonfire Faire Bomb decor | `!spawnbgmodel b975 e001` |
| `b976` | Halloween-sweets basket (`v11_hlsw`; directly added by the full Oct 2011 All Saints patch) | `!spawnbgmodel b976 e001` |
| `b978` | Christmas ornament | `!spawnbgmodel b978 e001`<br>`!spawnbgmodel b978 e002` |
| `b979` | Snowman | `!spawnbgmodel b979 e001`<br>`!spawnbgmodel b979 e002`<br>`!spawnbgmodel b979 e003`<br>`!spawnbgmodel b979 e004`<br>`!spawnbgmodel b979 e005` |
| `b980` | Christmas bell | `!spawnbgmodel b980 e001`<br>`!spawnbgmodel b980 e002`<br>`!spawnbgmodel b980 e003`<br>`!spawnbgmodel b980 e004` |
| `b981` | Valentine's archway | `!spawnbgmodel b981 e001`<br>`!spawnbgmodel b981 e002`<br>`!spawnbgmodel b981 e003` |
| `b982` | Valentine's brazier | `!spawnbgmodel b982 e001`<br>`!spawnbgmodel b982 e002`<br>`!spawnbgmodel b982 e003`<br>`!spawnbgmodel b982 e004`<br>`!spawnbgmodel b982 e005`<br>`!spawnbgmodel b982 e006`<br>`!spawnbgmodel b982 e007`<br>`!spawnbgmodel b982 e008`<br>`!spawnbgmodel b982 e009` |
| `b983` | Tall wooden crate | `!spawnbgmodel b983 e001`<br>`!spawnbgmodel b983 e002`<br>`!spawnbgmodel b983 e003`<br>`!spawnbgmodel b983 e004`<br>`!spawnbgmodel b983 e005`<br>`!spawnbgmodel b983 e006`<br>`!spawnbgmodel b983 e007`<br>`!spawnbgmodel b983 e008` |
| `b984` | Easter egg shrines | `!spawnbgmodel b984 e001`<br>`!spawnbgmodel b984 e002`<br>`!spawnbgmodel b984 e003`<br>`!spawnbgmodel b984 e004`<br>`!spawnbgmodel b984 e005`<br>`!spawnbgmodel b984 e006`<br>`!spawnbgmodel b984 e007`<br>`!spawnbgmodel b984 e008`<br>`!spawnbgmodel b984 e009`<br>`!spawnbgmodel b984 e010`<br>`!spawnbgmodel b984 e011`<br>`!spawnbgmodel b984 e012`<br>`!spawnbgmodel b984 e013`<br>`!spawnbgmodel b984 e014`<br>`!spawnbgmodel b984 e015` |
| `b985` | Kobold coal cart | `!spawnbgmodel b985 e001` |
| `b986` | Invisible interaction model | `!spawnbgmodel b986 e001` |
| `b987` | Resource carts | `!spawnbgmodel b987 e001`<br>`!spawnbgmodel b987 e002`<br>`!spawnbgmodel b987 e003`<br>`!spawnbgmodel b987 e004` |
| `b988` | Magic barrier | `!spawnbgmodel b988 e001`<br>`!spawnbgmodel b988 e002`<br>`!spawnbgmodel b988 e003` |
| `b989` | Misc props with glow | `!spawnbgmodel b989 e001`<br>`!spawnbgmodel b989 e002`<br>`!spawnbgmodel b989 e003`<br>`!spawnbgmodel b989 e004` |
| `b990` | Invisible interaction model | `!spawnbgmodel b990 e001` |
| `b991` | Invisible interaction model | `!spawnbgmodel b991 e001` |
| `b992` | Moonfire Faire Bombs x4 | `!spawnbgmodel b992 e001` |
| `b993` | Rock | `!spawnbgmodel b993 e001` |
| `b996` | Sand swirl | `!spawnbgmodel b996 e001`<br>`!spawnbgmodel b996 e002` |
| `b997` | Misc interaction points | `!spawnbgmodel b997 e001` (Used for LevequestS) <br>`!spawnbgmodel b997 e002`<br>`!spawnbgmodel b997 e003`<br>`!spawnbgmodel b997 e004`<br>`!spawnbgmodel b997 e005` |
| `b998` | Misc aetherial interaction points | `!spawnbgmodel b998 e000`<br>`!spawnbgmodel b998 e001`<br>`!spawnbgmodel b998 e003`<br>`!spawnbgmodel b998 e006`<br>`!spawnbgmodel b998 e008`<br>`!spawnbgmodel b998 e010`<br>`!spawnbgmodel b998 e011`<br>`!spawnbgmodel b998 e012`<br>`!spawnbgmodel b998 e018` |

## DAT-Mining Follow-Up

A local client asset and DAT/SQL audit found 93 `b###` model directories and 224 `e###` variant folders. The command table currently maps 93 BG indices and 212 normal variants.

These findings are not promoted to the main table until they are visually checked in-game. Several are `sho_mdl`/feet-slot add-ons rather than clean `top_mdl`/body variants, so the raw appearance command is the safer test path.

| BgObj | DAT/client signal | Test or status |
| --- | --- | --- |
| `b900 e001` | Client has `top_mdl` assets, but the current appearance SQL has no `base=20900` row. | Asset-only for now. |
| `b913` shoe variants | Client has `e001` and `e002` `sho_mdl` assets. SQL rows keep `body=1024` and vary `feet`. | Test `!spawnbgmodel appearance 1200190` and `!spawnbgmodel appearance 1200191`. |
| `b914` shoe variants | Client has `e001` through `e006` `sho_mdl` assets. SQL rows keep `body=1024` and vary `feet=1024..6144`. | Test `!spawnbgmodel appearance 1200184` through `!spawnbgmodel appearance 1200189`. |
| `b930 e002` | Client has an `e002 top_mdl`, but no clean `body=2048` appearance row was found. | Test related rows `1200169`, `1200175`, `1200176`, `1200177`, `1200178`. |
| `b931 e002` | Client has an `e002 top_mdl`, but no clean `body=2048` appearance row was found. | Test related row `1200171`. |
| `b932 e002` | Client has an `e002 top_mdl`, but no clean `body=2048` appearance row was found. | Test related row `1200173`. |
| `b933`-`b935` shoe layers | Each tree family has an `e001 sho_mdl`, but no official appearance row binds `feet=1024`. | Asset-only layers for now. The normal `top_mdl` appearances remain mapped. |
| `b962 e002` | Client has an `e002 sho_mdl`. Additional SQL rows exist with `feet=2048`. | Test `1200105`, `1200106`, and `1200219`; `1200142` and `1200220` appear to duplicate the existing `feet=1024` setup. |
| `b964` extra variants | Client has `e002 top_mdl` and `e002 sho_mdl`, but no clean `body=2048` appearance row was found. | Test `1200084`, `1200143`, `1200222` for `feet=1024`; test `1200111`, `1200112`, `1200221` for `feet=2048`. |
| `b976` body-only | The mapped `1001763` binds both `head=1024` and `body=1024`; official row `1200254` binds only the body. | Test `!spawnbgmodel appearance 1200254` to isolate the body layer. |
| `b998 e005` and `b998 e007` | Client has `top_mdl` folders, but no current appearance rows with `body=5120` or `body=7168`. | Asset-only for now. |
| `b956 e001` | The command maps `appearanceId=1200079` with `base=20956`, but this installed client tree did not show a `b956` folder. | Keep mapped, but re-check against patch/source data if it fails visually. |

## Repeatable Model Atlas (2026-07-10)

[`tools/build_bgobj_model_atlas.py`](../tools/build_bgobj_model_atlas.py) now reproduces the asset/appearance join from the installed client, the DAT-exported `actorclass_graphic.csv`, the appearance SQL, and the GM command registry. Its generated atlas is in [`outputs/bgobj-model-atlas-20260710/`](../outputs/bgobj-model-atlas-20260710/README.md).

The deeper pass found:

- 586 DAT BG appearance rows and 586 SQL BG appearance rows, with zero mismatched IDs or fields.
- 227 distinct equipment/model signatures after duplicate appearance IDs and size-only duplicates are collapsed.
- 212 signatures exposed by the current command table, leaving 15 distinct official signatures available through raw appearance IDs.
- 236 installed model-slot binaries across the 224 `e###` directories.
- 14 asset-slot bindings with official appearance rows but no canonical command mapping.
- 10 asset-slot bindings with no official appearance row: `b900 e001 top_mdl`; `b930 e002`, `b931 e002`, `b932 e002`, and `b964 e002 top_mdl`; `b933 e001`, `b934 e001`, and `b935 e001 sho_mdl`; and `b998 e005` plus `b998 e007 top_mdl`.

The 15 deduplicated raw commands are listed in [`bgobj_unmapped_model_signatures.csv`](../outputs/bgobj-model-atlas-20260710/bgobj_unmapped_model_signatures.csv). The cleanest additional attachment tests are `b913` rows `1200190`-`1200191`, `b914` rows `1200184`-`1200189`, and `b962 e002` row `1200105`. They remain raw candidates until visually checked.

The atlas also generates an opt-in [`bgobj_synthetic_appearance_candidates.sql`](../outputs/bgobj-model-atlas-20260710/bgobj_synthetic_appearance_candidates.sql) overlay for the 10 asset-only bindings. These `1299000`-`1299009` rows are inferred, not official DAT records. Use only in a disposable/test database, restart the map server after import, test them through the raw appearance command, and do not promote them without visual QA.

The model binaries are PWIB-wrapped or direct SEDB resources. Embedded strings expose skeleton references, resource names, and shader stems. This independently supports the personal rock identifications: `b901 e010` contains `rock02a`, `b901 e019` contains `rock1`, and `b955 e001` contains `rock01a`/`rock01b`. Other useful clues include `b906`'s `bask01`, `b953`'s `cho3_metl`/`cho3_mtwd`/`cho3_wood` family, and `b996_idol` inside the sand-swirl family. The decompiled native resource-reader spine begins around `FUN_00a22180`/`FUN_00a22230` and its sibling readers, which validate `@RES`/`RIDTBL` records before walking resource chunks.

## Notes

- Some wiki variants do not have a matching appearance row in the current database dump, so they are not listed here yet.
- `e000` on `b998` is an internal/body-zero entry. It may be blank or behave like a helper/interaction placeholder.
- These preview spawns last until the actor is removed, the zone reloads, or the server restarts.



My Stuff:

!spawnbgmodel b901 e010 <-- giant rock
!spawnbgmodel b955 e001 <-- red rock
!spawnbgmodel b957 e001 <-- rock with flora
!spawnbgmodel b901 e019 <-- another rock
