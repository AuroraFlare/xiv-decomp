# Seasonal event decomp atlas — all events

Generated: 2026-09-26T03:22:10+00:00

This pass unifies the decompilation inventory for **every** seasonal event
client surface: all 25 recovered `spl` quest scripts (including
`spl101_quest`, which has dialogue/menus but no quest row) and all
13 seasonal populace scripts (Valentione, Moonfire summer,
Halloween, Foundation/company festival). Total recovered methods:
**397**.

## Scope and evidence boundary

- Recovered Lua lives under `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl`
  and `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace`.
- English text rows live under `docs/Dat Mining/<code>.csv`; the
  `dat_text_data_rows` column counts data rows after the two header rows.
- Quest IDs/names join `Data/sql/gamedata_quests.sql` by script class.
- `local_status` describes the current server binding only. It is not a claim
  about retail scheduling, spawn positions, drop rates, or client acceptance.
- Placeholder scripts (`spl0g3-5`, `spl0l3-5`, `spl0u3-5`, `spl0i5`, `spl103`)
  decompile to `initText` only. They have no event flow and need no server
  driver until better recovery appears.
- `PopulaceSwimSuit2011` has no dedicated base script; its 2011 mortar text is
  served through the local `PopulaceSumFes` runtime. That is a server
  compatibility choice, not a recovered retail class rename.

## Seasonal quest surfaces (spl)

| Code | Event | Methods | Text bank | DAT rows | Quest | Local binding |
|---|---|---:|---|---|---:|---|
| `spl000` | Little Ladies'/Princess Day + Foundation static dialogue | 19 | 10000/spl000 | 62 | 110858 | custom driver |
| `spl0g1` | Hatching-tide 2011 Dreamer's Gospel (Gridania) | 13 | 5603/spl0g1 | 32 | 110794 | dreamer gospel driver |
| `spl0g2` | Hatching-tide 2011 Dreamer's Dilemma (Gridania) | 15 | 5619/spl0g2 | 47 | 110795 | dreamer dilemma driver |
| `spl0g3` | Placeholder (no event flow) | 1 | / | 1 | 110796 | generic scaffold |
| `spl0g4` | Placeholder (no event flow) | 1 | / | 1 | 110797 | generic scaffold |
| `spl0g5` | Placeholder (no event flow) | 1 | / | 1 | 110798 | generic scaffold |
| `spl0i1` | Moonfire 2011 The Heat Is On | 9 | 5683/spl0i1 | 105 | 110799 | moonfire delegate driver |
| `spl0i2` | All Saints' Wake 2011 Impish Impositions | 9 | 5699/spl0i2 | 89 | 110800 | custom driver |
| `spl0i3` | Starlight 2011 Winter Is Not Coming | 20 | 5715/spl0i3 | 77 | 110801 | custom driver |
| `spl0i4` | Heavensturn Gone with the Snow | 14 | 5731/spl0i4 | 70 | 110802 | custom driver |
| `spl0i5` | Placeholder (no event flow) | 1 | / | 1 | 110803 | missing |
| `spl0l1` | Hatching-tide 2011 Dreamer's Gospel (Limsa) | 13 | 5763/spl0l1 | 30 | 110804 | dreamer gospel driver |
| `spl0l2` | Hatching-tide 2011 Dreamer's Dilemma (Limsa) | 15 | 5779/spl0l2 | 45 | 110805 | dreamer dilemma driver |
| `spl0l3` | Placeholder (no event flow) | 1 | / | 1 | 110806 | missing |
| `spl0l4` | Placeholder (no event flow) | 1 | / | 1 | 110807 | missing |
| `spl0l5` | Placeholder (no event flow) | 1 | / | 1 | 110808 | missing |
| `spl0u1` | Hatching-tide 2011 Dreamer's Gospel (Ul'dah) | 13 | 5843/spl0u1 | 32 | 110789 | dreamer gospel driver |
| `spl0u2` | Hatching-tide 2011 Dreamer's Dilemma (Ul'dah) | 15 | 5859/spl0u2 | 46 | 110790 | dreamer dilemma driver |
| `spl0u3` | Placeholder (no event flow) | 1 | / | 1 | 110791 | generic scaffold |
| `spl0u4` | Placeholder (no event flow) | 1 | / | 1 | 110792 | generic scaffold |
| `spl0u5` | Placeholder (no event flow) | 1 | / | 1 | 110793 | generic scaffold |
| `spl101` | Hatching-tide 2012 Scrambled Eggs (item-select bridge) | 2 | 10016/spl101 | 203 | 110859 | custom driver |
| `spl101_quest` | Hatching-tide 2012 Easter quest dialogue/menus (no quest row) | 56 | / | 0 |  | missing |
| `spl102` | Moonfire 2012 Bombard Backlash | 17 | 10032/spl102 | 129 | 110860 | moonfire delegate driver |
| `spl103` | Placeholder (no event flow) | 1 | / | 1 | 110861 | generic scaffold |

## Seasonal populace surfaces

| File | Event | Methods | Text bank | DAT rows | Local binding |
|---|---|---:|---|---|---|
| `populacevalentmaster.lua` | Valentione's Day 2012 Bonds of Love | 44 | 8032/populaceValentMaster | 117 | base script present (native-method bridge) |
| `populacesumfes.lua` | Moonfire mortar/summer festival | 4 | 7216/populaceSumFes | 49 | base script present (native-method bridge) |
| `populaceswimsuit2011.lua` | Moonfire 2011 swimsuit/mortar text | 1 | 7376/populaceSwimSuit2011 | 38 | no local binding found |
| `populaceyukata.lua` | Moonfire 2012 yukata exchange | 5 | / | 34 | base script present (native-method bridge) |
| `populacehalloweentrans.lua` | All Saints' Wake pumpkin-head disguise | 8 | 7696/populaceHalloweenTrans | 751 | base script present + 1 referencing lua |
| `populacespecialeventcryer.lua` | Foundation Day recruitment speeches | 6 | 6688/populaceSpecialEventCryer | 49 | base script present + 1 referencing lua |
| `populacecompanyshop.lua` | Foundation/company festival shop (modes 8/11) | 22 | / | 140 | base script present + 1 referencing lua |
| `populacecompanybuffer.lua` | Company festival supporting role | 5 | / | 16 | base script present + 1 referencing lua |
| `populacecompanyglpublisher.lua` | Company festival supporting role | 20 | 7712/populaceCompanyGLPublisher | 42 | base script present + 1 referencing lua |
| `populacecompanyguide.lua` | Company festival supporting role | 6 | / | 71 | base script present + 1 referencing lua |
| `populacecompanyofficer.lua` | Foundation prism/exchange officer | 18 | / | 88 | base script present (native-method bridge) |
| `populacecompanysupply.lua` | Company festival supporting role | 12 | / | 6 | base script present + 2 referencing lua |
| `populacecompanywarp.lua` | Company festival supporting role | 5 | / | 97 | base script present + 1 referencing lua |

## Method-count notes

- The five deep-widget quests (`spl0i1`, `spl0i2`, `spl0i3`, `spl102`,
  `spl101_quest`) carry the reward/menu complexity documented in
  `docs/seasonal_quest_gap_contract_2026-06-19.md`. Selector branches in the
  LPB decompile are fragile; the server re-validates every cost, ownership,
  inventory, entitlement, and session check instead of trusting a client row.
- `spl0i4` (Gone with the Snow) is the cutscene/clue driver; exact Hyrstmill
  clue push-object mapping remains open and the quest advances those scenes
  from Waldomar prompts without inventing object class IDs.
- `spl101` bridges only the native `askEgg` item-select; ring rewards and item
  removal stay behind the validated seasonal exchange path.
- Company/populace scripts carry the Foundation Day mode-8/11 shop contract
  from `docs/seasonal_control_plane_decomp_2026-07-11.md`; weather/decor stays
  on the separate area-weather and layout-selector lane.

## Reproduction

```powershell
python -B tools/build_seasonal_event_decomp_atlas.py
python -B tools/build_seasonal_quest_gap_contract.py
python -B tools/validate_seasonal_event_runtime.py
python -B tools/validate_quest_availability.py
```

Outputs:

- `tools\outputs\seasonal-event-decomp-atlas-20260926\seasonal_quest_surface.csv`
- `tools\outputs\seasonal-event-decomp-atlas-20260926\seasonal_populace_surface.csv`
- `tools\outputs\seasonal-event-decomp-atlas-20260926\contract_summary.json`
