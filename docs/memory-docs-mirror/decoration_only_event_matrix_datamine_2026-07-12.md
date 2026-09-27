# Decoration-only seasonal event matrix (2026-07-12)

## Result

Foundation Day is unquestionably a real 1.x event. It is not currently proven to have a weather lane, and its city decorations are not yet authenticated. Hatching-tide remains the only event in this follow-up set with an intact, all-three-city visual layout contract.

| Event | Event proven | City visual layout proven | Weather proven | Best surviving evidence |
|---|---:|---:|---:|---|
| Hatching-tide / Easter | yes | yes | no | 15 vfx_egg groups; 45 schedulers; 300 components |
| Little Ladies' Day / Princess Day | yes | portable models yes; city placement no | no | b929 Hina display + six blossom tree/arch variants; 9 actors/methods; 30 character schedulers |
| Foundation Day | yes | no; Gridania gcflag bank audited unbound | no | SpecialEventWork modes 8/11; 9 dialogue methods; 12 actor-class leads; 8 spawns; 7 items |
| Valentione's Day | yes | portable models yes; city placement no | no | b981 has 3 vbln arch variants; b982 has 9 vtrc brazier variants; 9 actors form 3 cities x 3 roles |
| Heavensturn | yes | portable models yes; city placement no | no | 3 b901 kado/kadomatsu variants; Japanese spl0i4 title says Heavensturn; three city representatives; Dragon Kabuto |

The portable-model evidence and the Little Ladies' Day actor topology are expanded in `docs/orphan_seasonal_bgobj_datamine_2026-07-12.md` and `outputs/orphan-seasonal-bgobj-atlas-20260712/`.

## Hatching-tide / Easter

This is the strongest decoration-only recovery: **15** `vfx_egg_001..005` groups, **45** `time_vfx_egg_*` schedulers, and **300** component entries across Gridania, Limsa Lominsa, and Ul'dah. `MapObjFireworks` generates the matching `v_l#`, `v_c#`, and `v_r#` scheduler suffixes at night. None of the recovered control surfaces calls a weather API.

The broad word scan hits fourteen installed layouts, but eleven are unrelated egg vocabulary. The three authenticated positives are exactly the three city root layouts above.

## Little Ladies' Day / Princess Day

`Spl000` contains nine dedicated methods—three per city—with **30** character-scheduler calls, **16** scheduler waits, and **3** dialogue widgets. The English sheet explicitly names Little Ladies' Day and describes peach blossoms decorating the cities. The item atlas retains Princess Pudding (`3010408`) and Peach Blossom (`9030053`).

That proves the all-city event and its animated NPC presentation, but not a surviving city layout switch. The installed-layout token scan produces only unrelated words such as evacuation/shelter names, Menphina, dungeon dolls, or room names. Weather calls in the nine methods: **0**.

## Foundation Day

The evidence is unusually strong:

- `SpecialEventWork` mode **8** exposes the three company tracer fireworks; mode **11** retains them and adds Patriot's Choker to all three Grand Company shops.
- `Spl000` contains nine dedicated Foundation methods, three per company, with **12** character-scheduler calls and **9** salute branches.
- The methods surface all three company Magicked Prisms (`3020614..3020616`). Together with the tracers and Patriot's Choker, that is seven distinct event items.
- Twelve relevant actor-class leads survive, including three older `PopulaceSpecialEventCryer` rows; eight of the newer actors have local spawn rows.
- The localized company-guide and `worldMaster` sheets explicitly name Foundation Day and its increased company-seal rewards.

Weather calls in these methods: **0**. A dedicated owner audit found 30 raw `gcflag` occurrences / 27 unique strings in Gridania's `fst_f0_twn01`, including six scheduler-group rows. It found zero `time_bg_gcflag` strings, zero show/hide strings, no Limsa or Ul'dah counterpart, and no mode-11 visual consumer. The bank is real Grand Company flag infrastructure, but it must be excluded as Foundation proof unless a historical event-to-layout binding is recovered. See `docs/foundation_visual_owner_audit_2026-07-12.md`.

## Valentione and Heavensturn

Valentione has **9** `PopulaceValentMaster` actor classes arranged as three roles in each city. The installed BG-object archive also retains three `b981` `vbln` balloon/arch variants and nine `b982` `vtrc` torch/brazier variants. Heavensturn is directly identified by the Japanese `spl0i4` title (`降神祭/消えた雪人`), its Dragon Kabuto reward, three `processEventHin` city branches, three Black Rabbit representative markers, and three `b901` `kado`/kadomatsu models. Both events therefore retain portable decoration geometry, but not retail city placement or activation owners.

## What is still missing

We have not found everything. The final installed client is a mixed historical snapshot, while 1.x city decorations could be replaced by patch rather than accumulated. The largest remaining target is historical client layout revisions for Little Ladies' Day, Foundation Day, Valentione, and Heavensturn. Without those revisions—or a recovered event-to-layout owner table—absence from this snapshot is not proof that retail never displayed decorations.

## Reproduction

Run:

```powershell
python tools/build_decoration_only_event_matrix.py
```

Generated evidence lives in `outputs/decoration-only-event-matrix-20260712/`.
