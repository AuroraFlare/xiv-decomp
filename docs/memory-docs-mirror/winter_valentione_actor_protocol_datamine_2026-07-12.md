# Winter crossover and Valentione actor-protocol datamine (2026-07-12)

## Result

`spl0i4` / *Gone with the Snow* is genuine Heavensturn content: its Japanese quest title is `降神祭/消えた雪人`, explicitly prefixed `降神祭` (Heavensturn), and its direct reward is Dragon Kabuto (`8012604`). Its story is deliberately a handoff from Starlight Celebration / Winter's Knell, explaining why the English dialogue looks like Starlight evidence.

This proves an all-city Heavensturn quest surface, but not an independent Heavensturn city-decoration or weather controller.

## Heavensturn's three-city handoff

`processEventHin` has three city branches, and `processEventClearAfterItem` repeats the same three-way split for post-clear thanks. Three empty-path event actor-class rows clone the named Black Rabbit representatives, while an otherwise orphaned `115008` marker family independently maps those representatives to all three city maps and Waldomar to Hyrstmill.

| Branch | City | Representative | Event actor class | Marker | Zone/map |
|---:|---|---|---:|---:|---|
| 1 | Limsa Lominsa | Ninipu | 1001824 | 11500801 | 101/121 |
| 2 | Gridania | Hastridie | 1001825 | 11500802 | 103/321 |
| 3 | Ul'dah | Wysskoen | 1001826 | 11500803 | 104/421 |

The recovered quest has **14 methods**, **33 character-scheduler calls**, one NQ cutscene, and four Dragon Kabuto variants in the item family. Only `8012604` has a direct surviving quest-reward link. BG scheduler calls: **0**. Weather calls: **0**. `SpecialEventWork` calls: **0**.

The ten `115008xx` marker rows have no matching quest-sheet row, so they are treated as an orphan/historical marker spine rather than a live quest ID. The first three rows are nevertheless exact all-city Black Rabbit representative placements.

## Valentione's exact actor topology

The nine `PopulaceValentMaster` actors form three roles in every city. `getTownMasterType` hard-codes the city mapping by actor class ID; this is stronger than inferring city coverage from names or item text.

| City | Family | Role | Actor class | Name |
|---|---|---|---:|---|
| Limsa Lominsa | A | certifier / daily chocolate | 1001841 | Nicolaa |
| Gridania | A | certifier / daily chocolate | 1001842 | Olyffe |
| Ul'dah | A | certifier / daily chocolate | 1001843 | Ophellia |
| Limsa Lominsa | B | Glory of Love attendant | 1001844 | Rhela Nbolo |
| Gridania | B | Glory of Love attendant | 1001845 | Doyoh Lihzeh |
| Ul'dah | B | Glory of Love attendant | 1001846 | Qhom Jinjhal |
| Limsa Lominsa | C | party matchmaker | 1001847 | Loloju |
| Gridania | C | party matchmaker | 1001848 | Momoga |
| Ul'dah | C | party matchmaker | 1001849 | Popoka |

The recovered class contains **44 methods**, **30 character-scheduler calls**, and **10 dialogue widgets**. It implements city-by-city bond certification, Glory-of-Love scoring/chocolate distribution, and party matchmaking. All nine actor classes have appearances and the common Valentione actor script, but this SQL snapshot has **0** spawn rows for them.

BG scheduler calls: **0**. Weather calls: **0**. `SpecialEventWork` calls: **0**. Valentione therefore has a complete all-city social-event protocol, but no recovered decoration/weather lane.

## Interpretation

- Heavensturn is no longer merely an item-cluster inference: quest title, reward, three-city actor branches, and route markers identify it directly.
- Its English narrative intentionally continues Starlight, so winter-event evidence must be classified by control surface rather than by dialogue keywords alone.
- Valentione is a symmetrical 3-city × 3-role actor system. The missing piece is seasonal spawning/placement, not event logic.
- Neither event supplies a BG scheduler, weather API, or `SpecialEventWork` route that could own city decorations.

## Reproduction

```powershell
python tools/build_winter_valentione_actor_protocol_atlas.py
```

Generated evidence lives in `outputs/winter-valentione-actor-protocol-atlas-20260712/`.
