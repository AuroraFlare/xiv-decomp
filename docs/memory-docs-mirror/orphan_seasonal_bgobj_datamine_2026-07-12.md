# Orphan seasonal BG-object datamine (2026-07-12)

## Result

The missing placement/controller data does **not** mean the decoration models are absent. The installed client retains direct portable decoration families for Heavensturn, Little Ladies' Day, and Valentione's Day.

| Event | BG families | Variants | City placement recovered | Result |
|---|---:|---:|---:|---|
| Heavensturn | 1 | 3 | no | models recovered; retail city coordinates/owner missing |
| Little Ladies' Day | 4 | 7 | no | models recovered; retail city coordinates/owner missing |
| Valentione's Day | 2 | 12 | no | models recovered; retail city coordinates/owner missing |
| Foundation Day | 0 | 0 | no | no positive portable model candidate |

## Heavensturn: kadomatsu recovered

`b901 e001`, `e002`, and `e009` embed `0o_v12_kado01..03` shaders. `kado` is the internal kadomatsu/New Year decoration family, giving Heavensturn three directly identified model variants in addition to its quest, actors, markers, and Dragon Kabuto reward.

These models are previewable with `!spawnbgmodel b901 e001`, `e002`, and `e009`. No installed layout DAT contains an ASCII `b901` placement reference for these variants.

## Little Ladies' Day: Hina display and blossom scenery

`b929 e001` embeds `0o_v12_hina01_1h` and `hina02_ch`; this is direct Hina/Doll Festival identity. The adjacent `b930`, `b931`, and `b932` families are the blossom-tree and arch cluster already visually cataloged by the BG-object preview work. They retain two variants each, for **7 portable variants** across four families.

The event's speaking cast is also now resolved:

| City | Role | NPC | Event actor class | Client method |
|---|---|---|---:|---|
| Limsa Lominsa | Little Lady of the Town | Q'kholbeh | 1001986 | processEvent_PRINCESSDAY_LIM_HIME |
| Limsa Lominsa | royal seneschal | Reinholdt | 1001987 | processEvent_PRINCESSDAY_LIM_SHITSU |
| Limsa Lominsa | chief lady-in-waiting | Bijiji | 1001988 | processEvent_PRINCESSDAY_LIM_JIJO |
| Gridania | Little Lady of the Town | Yda | 1002000 | processEvent_PRINCESSDAY_YDA |
| Gridania | royal seneschal | Larsonient | 1001989 | processEvent_PRINCESSDAY_GRI_SHITSU |
| Gridania | chief lady-in-waiting | Seda Garanjy | 1001990 | processEvent_PRINCESSDAY_GRI_JIJO |
| Ul'dah | Little Lady of the Town | Ququmi | 1001991 | processEvent_PRINCESSDAY_UL_HIME |
| Ul'dah | royal seneschal | Weeping Hill | 1001992 | processEvent_PRINCESSDAY_UL_SHITSU |
| Ul'dah | chief lady-in-waiting | Meredithe | 1001993 | processEvent_PRINCESSDAY_UL_JIJO |

All nine actor classes have event appearances. All nine lack a useful event script path, and all nine have zero local spawn rows. The archived 1.x city rosters independently place the non-Yda cast in the same cities; Yda is directly named by `processEvent_PRINCESSDAY_YDA`.

## Valentione: complete portable decoration set

`b981 e001..e003` embeds the `vbln` family and corresponds to three Valentione balloon/arch variants. `b982 e001..e009` embeds `vtrc` and corresponds to nine animated torch/brazier variants arranged as three groups of three. The exact city/color assignment remains unbound, although the grouping matches the recovered 3-city × 3-role Valentione actor topology.

## Placement scan

All **287** installed layout DATs were scanned for `b901`, `b929..b932`, `b981`, and `b982`, plus their official BG appearance IDs. ASCII placement references: **0**. Raw numeric hits: **15**; every one is inside a regular u32 offset table and is therefore a false positive.

The defensible boundary is now:

- event model existence: proven;
- model variants and preview appearances: proven;
- all-city event actors: proven;
- retail city coordinates, spawn rows, and activation owner: still missing;
- weather relationship: none recovered.

Foundation Day remains the exception in this group: its event/shop/NPC contract is strong, but no portable BG model family has yet been authenticated.

## Reproduction

```powershell
python tools/build_orphan_seasonal_bgobj_atlas.py
```

Generated evidence lives in `outputs/orphan-seasonal-bgobj-atlas-20260712/`.
