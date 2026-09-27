# Foundation Day visual-owner audit (2026-07-12)

## Result

Foundation Day remains a proven 1.x event, but the installed client still does **not** authenticate a Foundation decoration layout. This pass closes the only substantial false-positive risk: Gridania's `gcflag0..4` bank is Grand Company flag infrastructure, but nothing binds it to Foundation event mode 11.

## The gcflag bank

Across **287** installed layout DATs, `gcflag` appears in exactly **1** layout: Gridania's `fst_f0_twn01`. It contains **30** raw occurrences / **27** unique strings: **6** scheduler-group rows and **24** mesh/attribute rows across `gcflag0..4`.

What it does not contain is decisive:

- `time_bg_gcflag*`: **0**
- `gcflag*show` / `gcflag*hide`: **0**
- Limsa Lominsa counterpart: **0**
- Ul'dah counterpart: **0**

The bank sits among ordinary Gridania gate/guild groups and immediately before the authenticated `hlw*` Halloween scheduler block. Byte proximity is not an owner edge. Unlike Halloween, `gcflag` has no recovered `time_bg_*` activation namespace.

## Event-mode and method audit

`SpecialEventWork` mode 11 has exactly **1** recovered client consumer: `PopulaceCompanyShop`. It sets shop `eventFlag = 11`, retaining the three tracer fireworks and adding Patriot's Choker to the Maelstrom, Twin Adder, and Immortal Flames shops. It calls no BG scheduler or weather API.

The nine `Spl000` Foundation methods contain character schedulers and salute presentation, but BG scheduler calls: **0**; weather calls: **0**. The seasonal BG shader-lineage scan likewise found zero Foundation-owned portable families.

## Conclusion

The strongest defensible classification is:

- Foundation event: **proven**
- all-three-company actor/shop/item protocol: **proven**
- Foundation weather: **not found**
- Foundation decorations: **historically plausible, but not present in the recovered owner graph**
- Gridania `gcflag0..4`: **exclude as proof unless a historical event-to-layout binding is recovered**

## Reproduction

```powershell
python tools/build_foundation_visual_owner_audit.py
```

Generated evidence lives in `outputs/foundation-visual-owner-audit-20260712/`.
