# Recoverable object, actor, and animation findings (2026-07-21; dungeon-wide update 2026-07-22)

This is the consolidated recovery inventory for portable BG-object models, static map objects, dungeon devices and exits, treasure coffers, primal reward visuals, seasonal-event scenery, dungeon layout schedulers, and dungeon/Primal actor actions. It combines the repository's earlier focused datamines with an exhaustive pass over every installed BG-object action bank, every installed monster/actor action lane, and all 24 retained legacy dungeon layout families.

The short answer is: **yes, substantially more is recoverable than the current `b### e###` preview list suggests**. The important limitation is that the list covers only one asset lane. A complete object implementation may require a model appearance, an action bank, a map-layout instance, a script class, and a server-owned trigger/state machine; those pieces are not stored in one table.

## Confidence labels

- **Exact**: a direct SQL, client asset, Lua bytecode, native-code, cutscene-record, or current local binding proves the join.
- **Live-confirmed**: observed on the current client/server combination.
- **Asset-derived candidate**: the installed model/action resource matches, but no original retail caller or placement has been recovered.
- **Structural inference**: ordering, naming, content adjacency, or repeated geometry strongly suggests a role but does not prove it.
- **Missing**: the client retains part of the feature, but its original owner, coordinates, threshold, destination, or reward binding is absent.

## Headline findings

| Area | Strongest result | What remains missing |
| --- | --- | --- |
| BG-object coverage | 93 installed `b###` families, 224 `e###` directories, 236 model binaries, 586 official BG appearance rows, and 227 distinct model/equipment signatures | The catalog is not the static world-object inventory; 10 installed asset-slot bindings have no official appearance row |
| Magitek terminal | Live client validation identifies `1200202 / b936-e003` plus model-scheduler `extrastat` mask `0x80` as the persistent broad blue terminal sigil; powered interactive actors use `0x81` | The exact world binding/placement of the separate `b936/e004` exit transporter remains missing; e003 bank `0003` is only a short fizzle/completion effect |
| Player-count circles | The complete authored `b936/e005..e009` family is retained; September 14 exact-XYZ seam welding corrects its arc counts to 8/6/4/3/2. Occupancy minima remain separate | Numeric trigger radius, concrete world actor/placement joins, and server/director work values remain missing |
| Magic barriers/portals | `b988/e001..e003` has a 2.26 s opening/continuity effect; `b996/e001..e002` has two 0.4 s sand-warp banks | Their original world actor/exit joins are incomplete |
| Dungeon coffers | Four complete 3-variant container families survive with three action banks each; `b923/0001` is live-confirmed to open the shared coffer | Original raid/primal coffer actor IDs, placements, and most reward-owner joins are absent |
| Dungeon exits/doors | Exact current layout/instance rows survive for Toto-Rak, Dzemael, and Aurum; separate exit prompt/rectangle classes survive | The visible exit effect is often separate from the invisible exit trigger; Cutter's equivalent current map-object rows are missing |
| Dungeon-wide action scope | 1,975 installed BG-object/monster bank files across 58 lanes, plus 24 installed dungeon layout DATs with 8,373 offset-backed animation/control tokens | Most retail actor owners, state transitions, and late-join replay rules are not preserved in the current server data |
| Seasonal events | 73 installed BG variants have seasonal identity/lineage; Hatching-tide retains an exact three-city scheduler/layout contract | Most portable seasonal families have no surviving retail city coordinates or activation owner; Foundation Day has no authenticated portable model family |

## Why the `b001 ... b998` list mostly becomes `20xxx`

`b###` is an asset-family name under `client/chara/bgobj`, not a global object ID. In an actor appearance, its base is normally:

```text
appearance base = 20000 + numeric b-family
b936 -> base 20936
```

`e###` is an equipment/model slot variant. A normal top/body binding often appears as `body = variant * 1024`, so `b936/e004` is base `20936`, body `4096`. Some families instead use head or feet slots, and a few combine layers. It is therefore unsafe to interpret `e004` as “object number four.”

The installed tree is deliberately sparse: `b001..b004`, then `b900` and the later `b9xx` content families. There is no implication that `b005..b899` should exist. The `20xxx` base range is just the character-style BG appearance namespace.

### Object lanes outside the `20xxx` BG appearance range

| Lane | Identity | How it is rendered/controlled | Current recovery surface |
| --- | --- | --- | --- |
| Portable chara BG object | actor appearance base `20xxx` plus equipment slots | spawn actor, change appearance, send packed numeric animation | `!spawnbgmodel`, appearance SQL, installed `client/chara/bgobj` assets |
| Ordinary object/NPC appearance | actor appearance bases such as `10xxx` and other character categories | normal actor instantiate and script class | actor class/appearance SQL; `!testactorclass` or raw appearance preview |
| Static/client-baked MapObj | `layoutId` + `instanceId` | bind a map-object controller and send a short BG animation name | `actorclass_mapObj.csv`, placed map-object SQL, `!spawnbgobj`, `!testmapobj` |
| Layout scheduler/VFX group | scheduler and component names embedded in a zone layout | layout owner toggles show/hide/time groups | layout DAT mining; seasonal/fireworks scheduler atlases |
| Cutscene-only proxy | actor ID embedded in a replay scene | scene-owned proxy plus scene VFX | replay PWIB actor dictionaries; not a world spawn |
| Server trigger/rectangle | actor class, push/notice radius, destination/state | server/director counts occupants or moves players | recovered Lua class and current server content code; may be visually invisible |

The existing map-object index already adds a second sizeable lane: [`actorclass_mapObj.csv`](../docs/Dat%20Mining/actorclass_mapObj.csv) has 158 rows, 106 with nonzero layout/instance pairs, and the current placed-object join has 209 zone-aware rows. Even that is not the complete world-building inventory; large structures, terrain, fixtures, and many props remain baked into zone layout/model DAT chunks.

The complete BG appearance join is in [`outputs/bgobj-model-atlas-20260710/`](../outputs/bgobj-model-atlas-20260710/README.md). Important gaps there are:

- 15 distinct official signatures are available only through raw appearance IDs, not the canonical `!spawnbgmodel b### e###` table.
- 10 installed asset-slot bindings have no official appearance row: `b900/e001`; `b930/e002`, `b931/e002`, `b932/e002`, and `b964/e002` top models; `b933/e001`, `b934/e001`, and `b935/e001` feet layers; and `b998/e005` plus `b998/e007` top models.
- The generated `1299000..1299009` synthetic overlay is a test aid, not retail data. It should remain disposable until each candidate passes visual QA.

## Numeric action banks: the critical decoding rule

Chara-style animations use an 8/12/12 packed ID:

```text
(category << 24) | (middle << 12) | low
```

For category 4 (`LIB`), the **decimal middle value** selects the zero-padded action-bank filename. The low 12 bits are discarded by the base-resource lookup.

| Packed ID | Middle | Action bank |
| --- | ---: | --- |
| `0x04001000` | 1 | `0001` |
| `0x04004000` | 4 | `0004` |
| `0x0405E000` | 94 | `0094` |
| `0x04065000` | 101 | `0101` |
| `0x040C9000` | 201 | `0201` |

The dungeon-wide scan proves that the category byte also selects an action lane; it is not merely a generic animation type:

| Category | Resolved lane | Recovered evidence |
| ---: | --- | --- |
| `0x04` | `cmn/lib` | BG-object actions and the recovered raid warp/coffer callers |
| `0x13` | monster `*/wss` | packed `battleAnimation` values such as `0x13001000` selecting WSS bank `0001` |
| `0x15` | `cmn/liu` | Cutter's Cry guide fallback `0x15190000` selecting humanoid bank `0400` |

This means `0x04000201` is **not** bank `0201`; it has middle `0` and low `513`.

With the spawned object targeted, the operator command is:

```text
!anim 4 0 <middle-decimal>
```

Examples:

```text
!anim 4 0 4     # b936/e004 full bank 0004 when that model is targeted
!anim 4 0 94    # b936/e004 short bank 0094
!anim 4 0 1     # bank 0001, including the live-confirmed b923 open
!anim 4 0 201   # bank 0201 on the target's own asset family
```

The receiving actor's appearance chooses the asset family. Middle `201` is not universally “open chest”: bells, magic barriers, and interaction points also have a `0201` bank.

## Magitek terminal: the persistent powered state is recovered

### Corrected `b936/e003` terminal join

- Period Toto-Rak footage shows a broad blue floor sigil with blue perimeter flames.
- Exact replay scenes `rad0f301` and `rad0f302` instantiate actor `1200202`.
- Actor `1200202` is `/Chara/Npc/Object/RaidDungeonBarrier`.
- Its appearance is base `20936`, body `3072`: `b936/e003`.
- The model payload embeds the persistent `b936_e03v1` effect.
- Its `@CBIS` graph tests actor `extrastat` mask `0x80`. The September 15
  [terminal audit](../Data/raidroutes/dzemael_terminal_presentation_review.json)
  corrects the earlier "clear selects the kill block" shorthand: Block002 has
  a `RaptureChantSyncClip`; effect-end and kill records are in Block001.
  The power-mask behavior has the separate client test described below.
- `!spawnbgmodel b936 e003 - 0x80` live-confirmed the broad blue sigil and perimeter flames.
- LIB bank `0003` (`0x04003000`) is a separate short v2 fizzle/completion effect, not the persistent circle.
- Successful field- and boss-terminal activations play bank `0003` exactly once after changing the persistent state.

The seven current-local zone-159 actor `1200228 / b936-e004` rows remain
physical gate/map-object proxies. They are not the two reconstructed field
devices or the three boss terminals.

The 2026-07-22 client test of `e004/0004` rendered a small gold crescent effect,
directly contradicting the required blue terminal reference. That falsifies the
earlier application inference while leaving the asset decode intact: `0004`
is a real e004 bank, but it is not the desired Toto-Rak terminal-on visual.

Current local code scopes `b936/e003` to the two field devices and three
boss-activation terminals. Inactive interactive actors use extra stat `0x01`;
powered actors use `0x81` (`0x01 | 0x80`).

Opcode `0x145` is queued before appearance so the model samples the correct
bit on fresh spawns and late binds, and state transitions resend extra stat
before reloading appearance. There is no per-player looping LIB replay.

The separate exit-transporter path is confirmed as `1200203 / b936/e004`.
`!spawnbgmodel b936 e004 - 0x80` shows its persistent portal, selected by the
same model-scheduler mask `0x80`. `RaidDungeonWarp.activateWarpDevice` runs
`0x0405E000` / bank `0094`; `!spawnbgmodel b936 e004 94 0x80` layers that
one-shot activation/control transition over the persistent portal.
`RaidDungeonWarp.lua` owns the prompt plus content-return helper. Exact
post-clear world placement is still not recovered.

### Short `b936` LIB action pattern

| Variant | v2 effect bank | Duration-matched control | Immediate control | Approx. effect time |
| --- | ---: | ---: | ---: | ---: |
| `e003` | `0003` | `0013` | `0093` | 0.63 s |
| `e004` | `0004` | `0014` | `0094` | 0.56 s |
| `e005` | `0005` | `0015` | `0095` | 0.71 s |
| `e006` | `0006` | `0016` | `0096` | 0.71 s |
| `e007` | `0007` | `0017` | `0097` | 0.67 s |
| `e008` | `0008` | `0018` | `0098` | 0.59 s |
| `e009` | `0009` | `0019` | `0099` | 0.60 s |

Only middle `94` has a recovered retail caller, and that caller is the separate
`RaidDungeonWarp` exit activation. The effect and sibling banks are otherwise asset-derived candidates. `e001/e002` have v1 effects in their model payloads but no installed full banks `0001/0002`.

### Exact cutscene clues

- Toto-Rak scenes use `b936/e003`, `e004`, and `e005` proxy actors; `rad0f307` labels actor `1200203 / e004` as `GOAL`.
- Dzemael scenes use `b936/e005` and `e004`.
- Aurum Vale has a `b936/e001` Tool actor while the scene separately embeds e04 VFX.
- Cutter's Cry has a `b996/e001` Tool actor while its scene separately embeds e04 VFX.

These are exact scene records, not retail world placements. They do prove which visuals each dungeon's authored scene expected.

## Magitek circles: corrected 2/3/4/6/8 arc family

**September 14 correction:** this report previously called the five variants a
consecutive 2-through-6 family. That was incorrect. Appearance-row ordering,
raw mesh component counts and party allocations did not justify those labels.
The asset and animation-bank joins remain valid; the upper count labels change.

| Geometric arcs | Variant | Later appearance | Full bank | Duration control | Immediate control |
| ---: | --- | ---: | --- | --- | --- |
| 2 | `b936/e009` | 1200325 | `0x04009000` | `0x04013000` | `0x04063000` |
| 3 | `b936/e008` | 1200326 | `0x04008000` | `0x04012000` | `0x04062000` |
| 4 | `b936/e007` | 1200327 | `0x04007000` | `0x04011000` | `0x04061000` |
| 6 | `b936/e006` | 1200328 | `0x04006000` | `0x04010000` | `0x04060000` |
| 8 | `b936/e005` | 1200329 | `0x04005000` | `0x0400F000` | `0x0405F000` |

[`inspect_magitek_circle_vmdl.py`](../tools/inspect_magitek_circle_vmdl.py)
reads the first embedded VMDL triangle topology and a signed-short XYZ overlay.
Welding only identical position triples joins duplicated seam vertices. Raw
component counts 3/4/4/7/8 become **2/3/4/6/8 disconnected geometric arcs**.
Their welded vertex counts are 22 each for e009/e008, 16 for e007, 12 for e006
and 10 for e005. A top-down numeric projection was visually inspected; this is
not a complete native effect render or a general VMDL decompressor.
[The new native review](../Data/raidroutes/dzemael_native_circle_review.json)
pins the installed resource hashes and exact parser results.

All five still share the static WRB prop and matching texture payloads. The
variant-dependent geometry is in their VFX. Native `RaidDungeonHeadCount`
exists, but its empty client `initForEvent` supplies no server threshold,
trigger radius, eligibility, reset, objective or reward policy. e004 is the
separate terminal/warp family and is not a count-circle variant.

The [2011 participant guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
records successful Gullet 2/6 and Grand Hall 2/2/4 allocations, not controlled
minimum tests. The earlier claim that the large screenshot independently
anchored e005 to six was not substantiated; later reviewed gate footage is
consistent with eight visible marks, including occlusion.

Darkhold now stores visual `CircleSegments` separately from `RequiredPlayers`.
The Gullet six-person reconstruction uses e006; the other existing large e005
controls preserve their provisional six-person requirements. That discrepancy
remains explicit retail work. GM circle probes accept 2, 3, 4, 6 or 8 and bind
the matching body, actor class and both animation banks. Unsupported 5/7 values
are rejected. Normal-party minima, later-patch scaling, dimensions, timing and
client acceptance remain unverified. Do not infer thresholds from artwork alone.

## Other magitek, barrier, portal, and warp candidates

| Family | Exact installed evidence | Best use | Boundary |
| --- | --- | --- | --- |
| `b988/e001..e003` | actors `1200373..1200375` have literal class label `~~~magitek???~~~`; bank `0201` is ~2.26 s and contains `conti_max`/`conti_open` effect tokens | magic barrier, continuity field, or portal-opening prototype | No retail transporter caller or placement recovered; do not replace exact `b936/e004` Toto binding with it |
| `b996/e001..e002` | sand-swirl family; banks `0001` and `0002`, each ~0.4 s; Cutter cutscene uses `e001` Tool proxy | Cutter/quicksand/exit visual or generic sand warp | Exact world destination/trigger join missing |
| `b998` | aetherial interaction-point variants; banks `0100` and `0101`; quest marker VFX in `0101` | invisible marker, aetherial prompt, quest/exit presentation | Many variants are helpers rather than visible geometry; `e005/e007` lack official appearances |
| `b997` | general interaction-point family; `0201`, `0301`, `0401` controls | leve/gimmick interaction marker, sound-bearing point | The first two are almost-instant controls; not a complete portal by themselves |
| `b925/e001` | aetherial gate model | visible gate/entry scenery | No installed chara action bank in this client tree |
| `b969/e001`, `b970/e001` | swirl and faint-light appearances | ambient warp/interaction dressing | No installed chara action banks; owner/state must be supplied separately |

## Coffers, dungeon treasure, and primal reward visuals

Four complete container families survive. Each has three model variants and the same three action-bank positions, but their timings and styling differ.

| Family | Style | `0001` | `0101` | `0201` | Content inference |
| --- | --- | ---: | ---: | ---: | --- |
| `b919/e001..e003` | Ixali urn/container (`v11_tbx3`) | ~2.00 s | ~3.14 s | ~1.50 s | likely Garuda/Ixali visual family; actor/placement unproven |
| `b920/e001..e003` | Kobold urn/container (`v11_tbx1`) | ~2.00 s | ~1.00 s | ~2.05 s | likely Titan/Kobold visual family; actor/placement unproven |
| `b923/e001..e003` | generic chest (`v11_tbx0`) | ~2.00 s | ~1.20 s | ~2.10 s | exact current shared chest family; strongest dungeon/Moogle/general candidate |
| `b927/e001..e003` | Amalj'aa chest (`v11_tbx2`) | ~2.00 s | ~3.91 s | ~2.10 s | likely Ifrit/Amalj'aa visual family; actor/placement unproven |

The tribe/primal associations are structural content inferences from the asset identity, not recovered trial spawn joins.

### What the three banks mean

- All four `0001` banks have one chest motion plus color-fade/effect/sound structure.
- All four `0101` banks have one motion plus chant-sync structure.
- All four `0201` banks have two motions plus effect/sound structure.
- **Live-confirmed:** current actor `1200161`, class `/Chara/Npc/Object/GuildleveBonusTreasureBox`, appearance `b923/e003`, visibly opens with `0x04001000` / bank `0001`.
- **Exact recovered behavior:** `RaidDungeonTreasureBox.processOpenDzemaelEpicQuestType` always sends `0x040C9000` / bank `0201` after its reward path.
- Therefore `0001` is the safest first open-animation prototype for the current shared coffer, while `0201` is the exact recovered Dzemael raid-chest behavior. The semantic role of `0101` and cross-family state meanings still need live observation.

### Missing original dungeon coffer binding

The client and repository do not recover a concrete original retail actor ID for `RaidDungeonTreasureBox`:

- `1200223..1200225` are `b923/e001..e003`, immediately adjacent to Toto-era dungeon actors, but have blank class paths and no spawns.
- `1200320..1200322` are another `b923/e001..e003` triplet adjacent to later dungeon device rows, also with blank classes and no spawns.
- An exhaustive scan of the four installed dungeon layouts, all installed cut files, raw PWIB actor records, decoded Lua, SQWT assets, and the executable found no valid actor-class/appearance/spawn join.

An original retail actor-instantiation capture could close the gap because the packet carries both numeric actor class identity and the transmitted class name. The model/action bundle alone cannot reconstruct that server-owned join.

### Current primal reward gap

The current primal implementations award directly rather than materializing a physical reward coffer:

- Ifrit Extreme directly adds the White-hot Ember objective item.
- Garuda Hard adds Vortex Totems to the loot list and directly adds the Howling Gale relic item when eligible.
- Moogle checks all five keystones, then directly adds the Kupo Nut Charm to the loot list.

That makes the missing coffer presentation real. A safe implementation should keep reward authority in the director and add a separate visual actor:

1. Director resolves victory and per-player eligibility exactly once.
2. Spawn or reveal the chosen coffer family.
3. On eligible interaction, atomically claim server-side reward state.
4. Broadcast the verified open bank and late-replay the opened state.
5. Despawn/disable only after all eligible claims or the authored timeout.

Do not let an animation packet or client widget become reward authority.

## Dungeon exits, doors, and barriers

The visible object and the exit behavior are frequently different actors.

### Chara-style visual candidates

- `b996/e001` is the strongest Cutter's Cry sand-warp/exit visual because it is an exact Cutter cutscene Tool actor and has two complete 0.4 s VFX banks.
- `b988/e001..e003` is the strongest unresolved magic-field opening family.
- `b936/e003..e009` supplies dungeon-specific magitek device/barrier effects.
- `b998` supplies aetherial markers and can dress an otherwise invisible exit trigger.

### Map-object doors and barriers

Static dungeon geometry uses `layoutId`/`instanceId`, not a `b###` appearance. Current exact local bindings include:

| Dungeon | Actor class | Layout | Instances | Role |
| --- | ---: | ---: | --- | --- |
| Toto-Rak | `1200228` (`b936/e004`) | `313` | `3580, 3583, 3585, 3587, 3589, 3591, 3593` | seven terminal/barrier rows |
| Dzemael | `5900016` (`DoorServer`) | `211` | `1486, 1493, 1494, 1495, 1496` | dungeon barrier/door controllers |
| Aurum Vale | `5900016` (`DoorServer`) | `214` | `1479, 1480, 1481, 1482, 1483` | dungeon barrier/door controllers |
| Cutter's Cry | — | — | — | no equivalent current placed map-object set recovered |

Map-object animations use short string keys such as `open`, `hide`, or `show`, not numeric LIB banks. The current packet is capped at 8 ASCII bytes. Long asset timelines such as `time_door_a1_open` are ownership clues, not necessarily directly sendable scheduler names.

Useful probes:

```text
!spawnbgobj placed <spawnLocationId> open
!testmapobj open <layoutId> <instanceId> <maxInstanceId> 5900016 2
!testmapobjmatrix <layoutId> <instanceIds> 5900001,5900015,5900016 open,hide,show 2
```

`row` mode is speculative and may be invisible outside the matching baked zone layout:

```text
!spawnbgobj row <actorClassIdFromActorclassMapObj> 5900016 open
```

### Exit trigger classes

- `RaidDungeonExit` contains text/widget behavior but no numeric visual animation call.
- `InstanceRaidExit`, `GimmickExitRect`, `objectEventDoor`, and related adapters own prompt/movement/cleanup surfaces.
- `PrivateAreaPastExit` has invisible exit/caution radii in 30/20, 40/30, 50/40, and 60/50 size pairs.

So a faithful unique dungeon exit may be a composition:

```text
visible chara VFX or static map object
        + invisible push/notice rectangle
        + director-owned destination and cleanup
```

Trying to discover the whole feature from only the visible `b###` model will miss the exit logic; trying to spawn only the exit rectangle will produce a functional but invisible exit.

## Seasonal-event recovery

The installed client retains **73** BG variants with seasonal identity or strong seasonal lineage. These are not proof that every model was simultaneously placed in the final retail layout snapshot.

| Event | Recovered portable/layout visuals | Strongest evidence | Missing boundary |
| --- | --- | --- | --- |
| Heavensturn | `b901/e001,e002,e009` | embedded `kado01..03` kadomatsu shaders; three models | coordinates and activation owner |
| Little Ladies' Day | `b929` Hina display plus `b930..b932` blossom trees/arch; 7 installed portable variants including asset-only second variants | exact Hina shaders, nine event actors/methods across three cities | retail placements and layout owner |
| Valentione | `b981/e001..e003` arches; `b982/e001..e009` brazier/torch variants | repeated three-city slot structure; 12 portable variants | exact coordinates and city/color owner binding |
| Hatching-tide | `b954`, `b972`, `b973`, `b984/e001..e015` and city layout VFX | exact 15 `vfx_egg` groups, 45 schedulers, 300 components across all three cities | portable shrine block-to-city assignment still inferred; no weather owner |
| Starlight | `b928`, `b933..b935`, `b978..b980` | direct bell/tree/arch/snow/ornament lineages across v11/v12 assets | exact event-year placements and layer bindings |
| All Saints' Wake | `b940/e001` photo booth; `b976` sweets basket; `b937` coffin is visually relevant but event identity is not direct | b940 native mesh/diffuse match 2011 footage; explicit `hlsw` Halloween shader for `b976` | booth placement/activation; coffin event ownership |
| Moonfire Faire | `b942` fireplace, `b975` Bomb decor, `b992` four Bombs | direct family identities; `b942` has a complete 4.8 s action bank | placement/activation owner |
| Foundation Day | no authenticated portable family | event modes, dialogue, actors, spawns, and seven items prove the event | city-decoration model and any weather/layout owner remain unproven |

### Important corrections and boundaries

- `b940/e001` is the black-and-orange Halloween photo booth, not winter scenery; its `snbl` stem was misleading.
- The other direct Halloween portable family is `b976`; `b937` is certainly a coffin but not event-authenticated by its binary.
- `v11` and `v12` are parallel internal lineages, not a reliable old-to-new chronology.
- All 287 installed layout DATs were scanned for the orphan Heavensturn, Little Ladies, and Valentione families. There were zero valid ASCII placements; 15 raw numeric hits were ordinary offset-table coincidences.
- Absence from the final installed layout snapshot is not proof an event never used the assets. Historical patch-era city layout revisions are the most promising remaining source.
- No recovered control surface proves that these event decorations required a weather API. Hatching's exact layout owner uses night-time scheduler groups without a weather call.

### Seasonal animations already available

| Family | Banks | Practical reading |
| --- | --- | --- |
| `b928` Starlight bells | `0101`, `0201`, `0301` | three ~3 s bell/effect presentations |
| `b930`, `b931`, `b932` blossom tree/arch | `0101` each | tiny BindActor/state controls, not proven full show/hide animations |
| `b942` Moonfire fireplace | `0001` | complete ~4.8 s bank with two VFX resources |
| `b976`, `b978..b982`, `b984`, `b992` | no installed chara action banks | likely static appearance, embedded model VFX, or layout-scheduler owned |

The detailed seasonal evidence remains in:

- [`orphan_seasonal_bgobj_datamine_2026-07-12.md`](orphan_seasonal_bgobj_datamine_2026-07-12.md)
- [`seasonal_bgobj_lineage_datamine_2026-07-12.md`](seasonal_bgobj_lineage_datamine_2026-07-12.md)
- [`decoration_only_event_matrix_datamine_2026-07-12.md`](decoration_only_event_matrix_datamine_2026-07-12.md)

## Other immediately reusable object families

| Use | Families | Notes |
| --- | --- | --- |
| Aetheryte/travel scenery | `b902`, `b903`, `b904`, `b925` | full, mini, primal aetherytes and aetherial gate; behavior/destination remains server-owned |
| Interactable lights/sounds | `b918`, `b922`, `b958`, `b971` | lily light, gong, retainer bell, fish effect; each has at least one installed action bank |
| Beastman machinery | `b921`, `b926`, `b960..b964`, `b985`, `b987` | drills, furnaces, carts, balloon platform, resource carts; useful encounter/stronghold props |
| Vehicles/large scenery | `b002..b004`, `b910..b917`, `b938`, `b959` | boats, Garlean/Ironworks ships, airship; often controller/static scenery rather than portable interactables |
| Gathering/ambient | `b966..b971` | gathering points, swirl, faint light, fish animation |
| Generic containers | `b907..b909`, `b919`, `b920`, `b923`, `b927`, `b951`, `b983` | crates, bucket, urns, chests; only the four `tbx` families have full three-bank chest suites |
| Invisible helpers | `b986`, `b990`, `b991`, parts of `b997/b998` | good presentation anchors, but they need a separate trigger and visible VFX where appropriate |

## Exhaustive installed BG-object action-bank inventory

This is every family with a file under `client/chara/bgobj/*/act/cmn/lib/base` in the installed client: **30 families, 76 banks**. Families absent from this table can still have embedded idle VFX or layout-scheduler behavior; they simply have no standalone chara action bank in this tree.

| Family | Installed banks | Reading / useful role |
| --- | --- | --- |
| `b911` | `0151` | boat/Sahagin-mark controller; tiny control |
| `b912` | `0151`, `0251` | boat controls |
| `b913` | `0151..0153` | large-boat controls |
| `b914` | `0151..0157` | multi-state boat controls |
| `b915` | `0151` | boat control |
| `b917` | `0151` | boat control |
| `b918` | `0101` | lily-light action/VFX, ~2 s |
| `b919` | `0001`, `0101`, `0201` | Ixali container suite |
| `b920` | `0001`, `0101`, `0201` | Kobold container suite |
| `b921` | `0151` | Kobold drill/cart control |
| `b922` | `0101` | gong action/sound, ~2.2 s |
| `b923` | `0001`, `0101`, `0201` | generic coffer suite |
| `b927` | `0001`, `0101`, `0201` | Amalj'aa coffer suite |
| `b928` | `0101`, `0201`, `0301` | Starlight bell effects, ~3 s |
| `b930` | `0101` | blossom-tree BindActor/state control |
| `b931` | `0101` | blossom-tree BindActor/state control |
| `b932` | `0101` | blossom-arch BindActor/state control |
| `b936` | `0003..0009`, `0013..0019`, `0093..0099` | seven full device effects plus duration-matched and instant controls |
| `b942` | `0001` | Moonfire fireplace, ~4.8 s with two VFX resources |
| `b958` | `0101` | retainer-bell action/sound, ~1.2 s |
| `b962` | `0151`, `0152` | Amalj'aa carriage action/control |
| `b964` | `0151`, `0152` | Ixali balloon-platform controls |
| `b971` | `0101`, `0102` | fish VFX, ~0.34/~0.50 s |
| `b983` | `0001` | crate-family flag/effect control, ~0.31 s |
| `b985` | `0151` | Kobold coal-cart control |
| `b988` | `0201` | magic barrier open/continuity VFX, ~2.26 s |
| `b989` | `0001` | near-instant idle/glow control |
| `b996` | `0001`, `0002` | sand-warp effects, ~0.4 s each |
| `b997` | `0201`, `0301`, `0401` | interaction-point init/init/sound controls |
| `b998` | `0100`, `0101` | aetherial init and quest-marker VFX controls |

The transport/boat-heavy `0151+` banks and many 10-20 ms bundles are state/controller clips, not necessarily visible “animations.” Prioritize banks containing Effect, Motion, and Sound clips for player-facing prototypes.

## Dungeon-wide action and layout recovery (2026-07-22)

The earlier **30 BG families / 76 banks** result is complete only for `client/chara/bgobj/*/act/cmn/lib/base`. It is not the whole dungeon animation layer. The widened deterministic inventory now covers every installed BG-object and monster/actor `act/*/*/base/*.DAT` bank plus every retained legacy dungeon layout referenced by local region data.

| Surface | Exhaustive result for this installed snapshot |
| --- | ---: |
| BG-object `cmn/lib` action-bank files | 76 |
| Monster/actor action-bank files, all lanes | 1,899 |
| Combined BG-object + monster/actor bank files | 1,975 |
| Distinct combined action lanes | 58 |
| Distinct model resources represented | 117 |
| Region-linked dungeon DAT keys | 42 |
| Installed legacy dungeon layout DATs | 24, one for every `fst/roc/sea/wil` dungeon root 01-06 |
| Offset-backed layout animation/control tokens | 8,373 |
| Current bound dungeon map objects | 140 |
| Unique current dungeon `DoorServer` scripts | 66 |
| Recovered dungeon Lua surfaces | 101 |
| Exact numeric scheduler calls in recovered raid Lua | 3 |

This is a **filesystem-complete inventory for those paths**, not a claim that every retail behavior is restored. A bank or layout timeline proves the client content exists; it does not by itself prove the original actor, target, packet, trigger, state machine, or replay rule.

### Exact recovered dungeon scheduler calls

| Content caller | Packed value | Exact resolution | Meaning |
| --- | --- | --- | --- |
| `RaidDungeonWarp.activateWarpDevice` | `0x0405E000` | `b936/cmn/lib/0094` | Short Magitek transporter activation; the receiver's `e###` appearance supplies the matching visual variant |
| `RaidDungeonTreasureBox.processOpenDzemaelEpicQuestType` | `0x040C9000` | receiver's `cmn/lib/0201` | Dzemael post-open/reward presentation; nine compatible installed resources have a bank `0201`, so the receiver is essential |
| `InstanceRaidGuideCuttersCry.createExplainSelection_` | `0x15190000` | `m910` or `m911` `cmn/liu/0400` | Cutter's Cry guide fallback after `doSalute(3, 17)` fails |

The Cutter result is especially important: an object-only `cmn/lib` search could never find it. It is proof that dungeon presentation crosses action categories and actor resource families.

### Retained dungeon layout timelines

The layout-root suffix is an **asset identity**, not always the same suffix used
by an open-world entrance script. The September 16 route review resolved the
Cutter ambiguity: `_layout.csv` row 415, MapNavi rows 5400–5422 and place 3123
join Cutter's Cry to `wil_w0_dun05`. The older `wil_w0_dun03` findings remain a
historical candidate layer and are no longer the active zone binding.

| Retained layout root | Current name where joined | High-value authored controls |
| --- | --- | --- |
| `fst_f0_dun01` | Mun-Tuy Cellars | doors `a0/a1/a2` open/close; point-light timelines |
| `fst_f0_dun02` | Tam-Tara Deepcroft | doors `a0/a1/a2/b1/b2/c1`; `gmic_a1` start/end; point lights |
| `fst_f0_dun03` | Toto-Rak | doors `d0/d1/e1/e2`; door `f1` hide/show; barrier point lights |
| `fst_f0_dun04` | no current zone-name join | doors `d0/d1/f0/f1`; split open/close phases; `gmic_b1` start/reverse/loop/end |
| `fst_f0_dun05` | no current zone-name join | doors `g0/g1/h0/h1`; point lights |
| `fst_f0_dun06` | no current zone-name join | doors `f0/f1/i0/i1`; elevator `a1` states; `gmic_b1` start/reverse/loop/end |
| `roc_r0_dun01` | Dzemael Darkhold | doors `a1/a2/e1/f1`; `f1` show/hide; switch/start/end and barrier-light groups |
| `roc_r0_dun02` | no current zone-name join | door `a1`; ceiling, bubble, and splash VFX states |
| `roc_r0_dun03` | no current zone-name join | doors `a1/a2`; four authored light groups |
| `roc_r0_dun04` | Aurum Vale | door `a2` open/close/start/end; door `b1` show/hide; barrier, smoke, and ceiling VFX |
| `roc_r0_dun05` | no current zone-name join | doors `a2/b1`; eggs show/hide/loop; bird and ray VFX |
| `roc_r0_dun06` | no current zone-name join | doors `c0/c1/c2/d1`; ceiling and ray VFX |
| `sea_s0_dun01` | Mistbeard Cove | doors `a1/b1/c1/d1/e1/e2/f1`; `gmc_a1` states; light power |
| `sea_s0_dun02` | Shposhae in current region data | doors `b1/c0/c1`; light power |
| `sea_s0_dun03` | Cassiopeia Hollow | `kai` start/end; fish and multi-state sea VFX |
| `sea_s0_dun04` | no current zone-name join | four `kai` start/end pairs; fish and multi-state sea VFX |
| `sea_s0_dun05` | no current zone-name join | doors `a1/b1/c1`; two light-power states |
| `sea_s0_dun06` | U'Ghamaro Mines | doors `a1/b1/c1`; furnace/lever `kama` body loop and head open/close; paired VFX |
| `wil_w0_dun01` | no current zone-name join | doors `a1/a2/a3/b1`; elevator `a1`; torch flicker |
| `wil_w0_dun02` | Nanawa Mines | three cart start/loop pairs, stop-block hide/show, doors, elevator, torch flicker |
| `wil_w0_dun03` | Historical candidate formerly joined to Cutter | door `c1` hide/show; normal, big, and small sand VFX timelines |
| `wil_w0_dun04` | Copperbell Mines | doors `a1/a2/a3/b1` open/close; door `c1` hide/show |
| `wil_w0_dun05` | Cutter's Cry, layout 415 / place 3123 | doors `c1/c2` and objects `a1/b1` hide/show; three sand states |
| `wil_w0_dun06` | no current zone-name join | door `c1` hide/show |

This adds recoverable dungeon props well beyond the earlier shortlist: elevators, mine carts, stop blocks, multi-phase mechanisms, furnaces, levers, eggs, fish/sea effects, bird/ray effects, light groups, boss barriers, and three authored quicksand sizes. The exact per-DAT commands, timelines, groups, offsets, sizes, and hashes are in the generated CSV inventory.

### Door, barrier, and exit coverage

The 66 current unique `DoorServer` scripts are distributed as follows:

| Script path family | Count |
| --- | ---: |
| `fst0Dungeon01` | 14 |
| `fst0Dungeon02` | 13 |
| `fst0Dungeon03` | 11 |
| `roc0Dungeon01` | 8 |
| `roc0Dungeon04` | 5 |
| `sea0Dungeon06` | 8 |
| `wil0Dungeon02` | 1 |
| `wil0Dungeon04` | 6 |

Mun-Tuy, Tam-Tara, Nanawa, and Copperbell also have current public/open-world code that explicitly sends `open`. Toto-Rak, Dzemael, Aurum, and U'Ghamaro retain exact per-instance bindings, while their state/replay behavior remains base-class or director owned.

The four `PrivateAreaPastExit` actors are exact invisible trigger-size variants, not visible dungeon-exit animations:

| Actor | Exit radius | Caution radius | Visual |
| ---: | ---: | ---: | --- |
| `1290001` | 30 | 20 | invisible `10999/e001` helper |
| `1290002` | 40 | 30 | invisible `10999/e001` helper |
| `1290003` | 50 | 40 | invisible `10999/e001` helper |
| `1290004` | 60 | 50 | invisible `10999/e001` helper |

A faithful exit therefore composes three layers: a visible chara/map object or layout VFX, one of these trigger helpers, and server/director destination plus cleanup logic.

### Full Primal and encounter actor banks

The monster action tree retains much more encounter presentation than the local content tables currently select:

| Family | Resource | Fully installed relevant banks |
| --- | --- | --- |
| Ifrit | `m852` | field idle `cmn/fid/1110`; `bid/0000`; `btl/0001`; `mgc/0001..0004`; WSS `0001,0002,0003,0004,0005,0007,0008,0010,0012..0022` |
| Ifrit support/anchor | `m524` | `bid/0000`; WSS `0001` |
| Garuda | `m851` | `bid/0000`; `btl/0001`; `mgc/0001..0004`; WSS `0001..0014` |
| Garuda feather/support | `m527` | `bid/0000`; WSS `0001..0004` |
| Good King Moggle Mog family | `m701` | field idle `cmn/fid/1098`; LIB `0710,0711,0720,0725,0726,0727,0730,0740,0750..0756,0774`; `bid/0000`; `btl/0001`; `mgc/0001..0004`; WSS `0001..0023,0025` |
| Humanoid presentation resources | `m910`, `m911` | hundreds of LIB/LIU banks, including exact Cutter guide LIU `0400`; `m911` also retains sword/shield battle, magic, and WSS lanes |

These are not empty placeholders. Representative WSS DATs contain MotionClip, EffectClip, and RaptureSoundClip payloads plus direct source identities such as `vfx/mon/ifrit_852/skill01`, `vfx/mon/m851_garuda/skill14`, and `vfx/mon/mowgli_701/skl25`.

Locally Primal-tagged battle-command rows select only WSS `0001..0004` for Ifrit and `0001..0003` for Garuda/Moogle. The additional 15 Ifrit, 11 Garuda, and 21 Moogle WSS banks form a strong recovery queue. “Not selected by these local rows” does **not** mean “unused by retail”; directors, skill tables, or missing scripts may have selected them elsewhere.

Current placed-dungeon SQL joins only 19 monster types to their installed banks, while content-labeled archive rows add 35 actors. That is an evidence limitation in the surviving server data, not a limit in the client action tree.

### Machine-readable companion and reproducibility

[`outputs/dungeon-animation-inventory-20260722/`](../outputs/dungeon-animation-inventory-20260722/README.md) contains:

The complete readable Markdown rendering starts at [`MARKDOWN_INDEX.md`](../outputs/dungeon-animation-inventory-20260722/MARKDOWN_INDEX.md).

- all 1,975 installed bank rows and lane/resource summaries;
- all 24 installed dungeon DAT summaries and 8,373 offset-backed tokens;
- every current dungeon map-object and unique door binding;
- the three exact recovered numeric scheduler calls;
- current/archive dungeon actor-to-action joins;
- Primal actor, battle-command, and unused-bank-gap tables;
- exact exit trigger sizes and a JSON count/evidence contract.

Rebuild it with [`build_dungeon_animation_inventory.py`](../tools/build_dungeon_animation_inventory.py). The generator completed twice with the same contract counts.

### What this audit still cannot honestly call complete

- Historical patch-era layouts and removed seasonal/dungeon placements are absent from this installed snapshot.
- Retail owner/target/state data is missing for many installed banks and authored layout groups.
- Some visible sequences are cutscene proxies or native/director state rather than action-bank calls.
- The player-character action tree was intentionally excluded; it is a large player combat/emote corpus, not a dungeon-owned object/monster inventory.
- Binary/compressed identifiers that do not survive as offset-backed strings need deeper format-specific decoding.
- Late-join replay, reset, wipe, destination, reward, and occupancy rules remain server-owned even when every visual asset is present.

So the answer to “are we missing nothing?” is **no**. We now have a complete enumerated installed-asset surface for the scoped BG/monster/layout paths, and a much smaller, explicit list of missing joins and historical data.

## Recommended recovery order

1. **Restore and live-validate the documented Dzemael 2/4/6 circles** using `1200325/e009`, `1200327/e007`, and `1200329/e005`. The visual size mapping is now recovered; the remaining high-value work is trigger radius, placement, director ownership, resets, and late-join state.
2. **Recover the exact Toto-Rak exit placement and owner**. The e004 persistent `0x80` state and `0094` activation are live-confirmed; the remaining work is the post-clear anchor, instance binding, and late-join state.
3. **Prototype physical primal coffers** with the tribe-matching family, beginning with bank `0001`, while keeping reward grants director-owned. Capture closed/open/claimed visuals before assigning `0101` or `0201` semantics globally.
4. **Test `b988/0201` and `b996/0001,0002`** in the intended dungeon scenes to separate magic-barrier, quicksand, and exit presentations.
5. **Probe placed MapObj rows in their real zones** with `open/hide/show`; do not judge a layout object from an out-of-zone raw spawn.
6. **Recover historical city layout revisions** for the orphan seasonal families. That is more likely to restore coordinates/owners than another scan of the unchanged final snapshot.
7. **Capture actor-instantiation and state traffic** for any original client/server session available. A capture can restore class name, actor ID, appearance, work values, scheduler, and spawn context in one join.

## Evidence and source index

- Dungeon-wide generated inventory: [`outputs/dungeon-animation-inventory-20260722/`](../outputs/dungeon-animation-inventory-20260722/README.md) and [`build_dungeon_animation_inventory.py`](../tools/build_dungeon_animation_inventory.py)
- Per-bank dungeon actor atlas: [`outputs/dungeon-actor-animation-atlas-20260719/`](../outputs/dungeon-actor-animation-atlas-20260719/contract_summary.json)
- Full BG model/appearance catalog: [`bgobj-spawn-models.md`](bgobj-spawn-models.md) and [`outputs/bgobj-model-atlas-20260710/`](../outputs/bgobj-model-atlas-20260710/README.md)
- Packed action IDs, b936, dungeon cutscenes, and b923 coffer audit: [`dungeon_actor_animation_decomp_2026-07-19.md`](dungeon_actor_animation_decomp_2026-07-19.md)
- Magitek count-mark topology probes: [inspect_magitek_circle_vmdl.py](../tools/inspect_magitek_circle_vmdl.py) and [inspect_ffxiv1_model_mesh.py](../tools/inspect_ffxiv1_model_mesh.py)
- Static door/map-object behavior: [`open_world_dungeon_doors.md`](open_world_dungeon_doors.md) and [`mapobj-spawn-candidates.md`](mapobj-spawn-candidates.md)
- Transport/exit separation: [`magitek_transporter_exit_adapter_contract_2026-06-19.md`](magitek_transporter_exit_adapter_contract_2026-06-19.md), [`raid_dungeon_warp_binding_contract_2026-06-19.md`](raid_dungeon_warp_binding_contract_2026-06-19.md), and [`dungeon_exit_rect_adapter_contract_2026-06-19.md`](dungeon_exit_rect_adapter_contract_2026-06-19.md)
- Reward authority and chest boundaries: [`reward_inventory_chest_contract_2026-06-19.md`](reward_inventory_chest_contract_2026-06-19.md) and [`relic_coffer_key_reward_contract_2026-06-19.md`](relic_coffer_key_reward_contract_2026-06-19.md)
- Seasonal portable models and lineages: [`orphan_seasonal_bgobj_datamine_2026-07-12.md`](orphan_seasonal_bgobj_datamine_2026-07-12.md), [`seasonal_bgobj_lineage_datamine_2026-07-12.md`](seasonal_bgobj_lineage_datamine_2026-07-12.md), and [`decoration_only_event_matrix_datamine_2026-07-12.md`](decoration_only_event_matrix_datamine_2026-07-12.md)

## Final boundary

The project is no longer missing the *existence* of most important visual families. It is mainly missing the joins between visual assets and retail content ownership: actor class, placement, state, threshold, destination, reward package, and late-join replay. The safest reconstruction strategy is to keep those layers explicit instead of assigning behavior from model appearance alone.
