# Seasonal BG-object lineage datamine (2026-07-12)

## Result

The installed client retains **73** BG-object variants with seasonal identity or strong seasonal lineage across Heavensturn, Little Ladies' Day, Valentione, Hatching-tide, Starlight, All Saints' Wake, and Moonfire. These are asset assignments, not proof of simultaneous retail placement. Foundation Day still has no authenticated portable family.

## Valentione city-copy structure

`b981 e001..e003` is one arch copied three times. The texture payloads are byte-identical; the model files differ by only three embedded identity bytes. `b982` contains three brazier geometries, and each geometry is copied into a three-way slot group: `e001..e003`, `e004..e006`, and `e007..e009`. Their textures are byte-identical and their model payloads differ by only 6–8 identity/animation-record bytes.

The event script independently defines city type **1 = Limsa Lominsa**, **2 = Gridania**, and **3 = Ul'dah**. Aligning that exact 1/2/3 convention with each three-way model group gives the strongest current city assignment:

| Slot | Candidate city | Arch | Brazier geometries |
|---:|---|---|---|
| 1 | Limsa Lominsa | e001 | e001, e004, e007 |
| 2 | Gridania | e002 | e002, e005, e008 |
| 3 | Ul'dah | e003 | e003, e006, e009 |

This is a high-confidence structural inference, but it does **not** recover coordinates or a retail placement owner.

Patch chronology now independently supports the event grouping: b981/b982 are added in the 14 December 2011 patch, revised on 23 December, and revised/carried through all three January 2012 patches without changing a seasonal weather payload key. They are future-event preloads, not Starlight decorations.

## Hatching-tide's 15 shrine variants

`b984 e001..e015` is not fifteen unrelated decorations. It is three consecutive blocks of five shapes:

- block 1: `e001..e005`
- block 2: `e006..e010`
- block 3: `e011..e015`

Shapes repeat at `1/6/11`, `2/7/12`, `3/8/13`, `4/9/14`, and `5/10/15`, with matching model-size and shader signatures and mostly identity-only model differences. The standard seasonal city ordinal makes Limsa/Gridania/Ul'dah the leading block interpretation, but that label remains medium-confidence until a placement table binds it.

## Parallel internal asset namespaces

Starlight and Hatching-tide both preserve `v11` and `v12` shader families. Starlight retains `v11` bells, decorated trees, and arches alongside `v12` snowballs, emitters, snow figures, and bells. Hatching retains `v11` egg/balloon models alongside `v12` balloons and the 15 egg pedestals.

Historical patch recovery corrects the chronology assumption: the 13 December 2010 patch already contains the `v12`-named b929-b932 Little Ladies assets, while the full 4 October 2011 patch adds both `v11_hlsw` b976 Halloween sweets and `v11_snbl` b940 Halloween booth. `v11` and `v12` are therefore useful parallel lineage namespaces, but **not a trustworthy older-to-later calendar sequence**.

## Catalogue correction: b940

`b940/e001` is the tall, open-front All Saints' Wake photo booth visible beside Mudede in [2011 event footage](https://www.youtube.com/watch?v=Yn8L_t8sCTk). The native mesh and decoded diffuse texture show the same black pointed frame, red upper slits, orange backdrop, and pumpkin figures. Actor class `1200253` binds appearance `20940`, and the GM command is `!spawnbgmodel b940 e001`. Its `v11_snbl01..04` shaders were previously mistaken for proof of winter ownership; `b978` also uses `snbl`, but that shared stem cannot override the actual model imagery. The October 2011 patch added b940 alongside b976 Halloween sweets. Retail placement coordinates and live scheduler activation remain unverified.

Another direct portable Halloween model is `b976`, whose shaders are explicitly `hlsw01/02` (Halloween sweets). `b937` is certainly a coffin from `cofn01a/01b`, but the binary does not itself name the event.

## Boundary

Asset lineage explains model generations and duplicate slots, not seasonal activation. Hatching, Little Ladies, Heavensturn, and Valentione still expose no authenticated event-to-weather call or binding; Little Ladies' pre-existing all-city 8031 lead remains only a star/cloud atmosphere candidate. Retail coordinates and enable/disable owners remain absent for the orphan portable families.

## Reproduction

```powershell
python tools/build_seasonal_bgobj_lineage_atlas.py
```

Generated evidence lives in `outputs/seasonal-bgobj-lineage-atlas-20260712/`.
