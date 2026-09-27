# Missing Recovered Lua Surface Backlog

Generated: 2026-06-19T22:43:05

## Summary

- Raw recovered Lua files scanned: 3310
- Unique recovered surfaces after path dedupe: 2575
- Local Lua scripts indexed: 1707
- Matched recovered surfaces: 840
- Missing recovered surfaces: 1735
- High-priority uncovered surfaces in top 20: 16

This is a path/surface parity backlog, not an instruction to implement every missing client script. Widgets, native-only helpers, monsters, and some directors may already be represented by C# or packet handlers. The value is in finding the missing surfaces that deserve a focused decomp contract next.

## Top Missing Systems

| Order | System | Missing | Uncovered | Recommended next contract | Top surfaces |
| --- | --- | ---: | ---: | --- | --- |
| 1 | raid_dungeon | 48 | 45 | Instance raid director/baseclass behavior contract | area/privatearea/occupancy/raiddungeonsimple.lua; director/instanceraid/occupancyplayers/occupancyplayersbaseclass.lua; director/instanceraid/occupancyplayers/occupancyplayerstest.lua; director/instanceraid/occupancyplayers/raidplayers.lua; chara/npc/object/raiddungeonheadcount.lua; chara/npc/populace/occupancyguide/raidfst0dungeon03guide.lua; chara/npc/populace/occupancyguide/raidroc0dungeon01guide.lua; judge/instanceraidguidejudge.lua; chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua; chara/npc/populace/instanceraidguide/noquestguidebaseclass.lua; chara/npc/debug/testraiddungeonentrance.lua; chara/npc/populace/instanceraidguide/aetherytebeastchildguide.lua |
| 2 | chocobo_caravan | 11 | 7 | chocobo_caravan missing-surface contract | widget/ask/chocobonamingwidget.lua; chara/npc/object/chocobostop.lua; command/game/prog/chocoboridecommand.lua; judge/chocobojudge.lua; widget/chocoborentaltimerwidget.lua; status/chocobospeeddownstatus.lua; chara/npc/monster/chocobo/chocobobaseclass.lua; chocobocaravanwidget.lua; director/caravanguard/caravanguarddirector.lua; widget/chocobocaravanwidget.lua; caravanguarddirector.lua |
| 3 | private_area | 42 | 42 | Private-area base/content/occupancy script contract | area/privatearea/privateareamastertest.lua; area/areabaseclass.lua; area/privatearea/privateareamasterbranch.lua; area/privatearea/privateareamastermarket.lua; area/privatearea/content/privateareacontentbaseclass.lua; area/privatearea/content/privateareamasterbattlefield.lua; area/privatearea/content/privateareamasterrestrictarea.lua; area/privatearea/content/privateareamastersimplecontent.lua; area/privatearea/occupancy/privateareaoccupancybaseclass.lua; area/privatearea/privateareabaseclass.lua; area/privatearea/privateareabaseclass_u.lua; area/privatearea/privateareamastercottage.lua |
| 4 | widget | 141 | 138 | Missing ask/widget command surface contract | widget/ask/materiaremovewidget.lua; widget/ask/askwidget.lua; widget/ask/fellinginputwidget.lua; widget/ask/fishinginputwidget.lua; widget/ask/grandcompanyofficialjoinwidget.lua; widget/ask/itemstoragegetwidget.lua; widget/ask/itemstorageputwidget.lua; widget/ask/jobtutorialwidget.lua; widget/ask/marketselectwidget.lua; widget/ask/materiadialogwidget.lua; widget/ask/mininginputwidget.lua; widget/ask/negotiationabilitylistwidget.lua |
| 5 | airship_ferry | 10 | 10 | Airship/ferry transport object-mapobj-populace contract | chara/npc/object/objectairship/objectairship.lua; chara/npc/object/objectship/objectship.lua; chara/npc/mapobj/companyship/companyship.lua; chara/npc/mapobj/mapobjshipport/mapobjshipport.lua; chara/npc/mapobj/mapobjshiprouteland/mapobjshiprouteland.lua; director/shipdirector.lua; director/shipdirector/shipdirector.lua; chara/npc/populace/populaceflyingship/populaceflyingship.lua; chara/npc/savenpc/companyshipsavenpc.lua; chara/npc/savenpc/companyshipsavenpc/companyshipsavenpc.lua |
| 6 | quest | 529 | 526 | Quest scenario script parity contract | director/quest/questdirectorgcg70101.lua; director/quest/questdirectorgcl70101.lua; director/quest/questdirectorgcu70101.lua; director/quest/questdirectornmrush01.lua; director/quest/questdirectornmrush02.lua; widget/ask/questaskwidget.lua; widget/ask/questdeliverywidget.lua; director/quest/questdirectorbaseclass.lua; director/quest/simplequestbattle/simplequestbattlebaseclass.lua; director/quest/questdirectoralc20001.lua; director/quest/questdirectoralc30001.lua; director/quest/questdirectoralc30601.lua |
| 7 | general | 588 | 588 | general missing-surface contract | chara/npc/object/aetheryte/aetherytebaseclass.lua; chara/npc/object/treasurebox/animatreasurebox.lua; chara/npc/object/treasurebox/publictreasurebox.lua; group/contentgroup/contentgroupbaseclass.lua; chara/player/playerbaseclass.lua; chara/npc/object/musicchange.lua; chara/npc/object/treasurebox/treasureboxbaseclass.lua; chara/npc/mapobj/marketstand.lua; chara/npc/mapobj/pray12gods.lua; director/directorbaseclass.lua; chara/npc/populace/populaceyukata.lua; chara/npc/object/aetheryte/aetherytebeastchild.lua |
| 8 | guildleve | 56 | 2 | Guildleve request/director/widget runtime contract | requestdirector.lua; requestmanager.lua; widget/ask/guildleveselectlevelwidget.lua; widget/ask/guildlevestartwidget.lua; guildleveareaorderwidget.lua; guildlevecardorderwidget.lua; guildleveexecutionwidget.lua; guildlevehistorywidget.lua; guildleveselectlevelwidget.lua; guildlevestartwidget.lua; widget/ask/guildleveareaorderwidget.lua; widget/ask/guildlevecardorderwidget.lua |
| 9 | gimmick_object | 2 | 2 | Generic gimmick base/object implementation contract | command/system/confirmwarpcommand.lua; command/system/confirmwarpcommand_warp.lua |
| 10 | command | 116 | 116 | Missing command script bridge contract | command/system/teleportcommand.lua; command/system/logineventcommand.lua; command/game/bonuspointcommand.lua; command/system/bazaarcheckcommand.lua; command/system/itemmaterializecommand.lua; command/system/logoutcommand.lua; command/system/macrocommand.lua; command/system/tradeexecutecommand.lua; command/system/contentcommand.lua; command/autoattacktargetchangecommand.lua; command/commandbaseclass.lua; command/debuginputcommand.lua |
| 11 | hamlet | 23 | 0 | Covered by prior contract; keep as implementation backlog | director/instanceraid/instanceraidhamletdefense.lua; widget/ask/hamletdefensescorewidget.lua; instanceraidhamletdefense.lua; widget/ask/hamletdefenserankingwidget.lua; widget/ask/hamletdefensetutorialwidget.lua; widget/hamletdefensewidget.lua; widget/hamletdefensepopupwidget.lua; chara/npc/monster/birdman/birdmanconattackhamletstd.lua; chara/npc/monster/birdman/birdmangladiatorhamletstd.lua; chara/npc/monster/birdman/birdmanlancerhamletstd.lua; chara/npc/monster/bomb/bomblesserhamlet.lua; chara/npc/monster/cactus/cactuslesserhamlet.lua |
| 12 | status | 131 | 131 | status missing-surface contract | status/ability/attackmagichealhpstatus.lua; status/ability/attributejointlystatus.lua; status/ability/berserkstatus.lua; status/ability/bloodluststatus.lua; status/ability/cadencestatus.lua; status/ability/conservempstatus.lua; status/ability/coverstatus.lua; status/ability/decoystatus.lua; status/ability/defenderstatus.lua; status/ability/diversionstatus.lua; status/ability/divineattackstatus.lua; status/ability/divinebenisonstatus.lua |

## Highest-Priority Missing Surfaces

| Priority | Surface | System | Category | Covered by prior contract |
| ---: | --- | --- | --- | --- |
| 84 | `area/privatearea/occupancy/raiddungeonsimple.lua` | raid_dungeon | area/privatearea | no |
| 83 | `director/instanceraid/occupancyplayers/occupancyplayersbaseclass.lua` | raid_dungeon | director/instanceraid | no |
| 83 | `director/instanceraid/occupancyplayers/occupancyplayerstest.lua` | raid_dungeon | director/instanceraid | no |
| 83 | `director/instanceraid/occupancyplayers/raidplayers.lua` | raid_dungeon | director/instanceraid | no |
| 82 | `widget/ask/chocobonamingwidget.lua` | chocobo_caravan | widget/ask | no |
| 81 | `area/privatearea/privateareamastertest.lua` | private_area | area/privatearea | no |
| 81 | `director/instanceraid/instanceraidhamletdefense.lua` | hamlet | director/instanceraid | docs/hamlet_user_message_adapter_contract_2026-06-19.md |
| 80 | `chara/npc/object/raiddungeonheadcount.lua` | raid_dungeon | chara/npc/object | no |
| 79 | `widget/ask/materiaremovewidget.lua` | widget | widget/ask | no |
| 75 | `area/areabaseclass.lua` | private_area | area/areabaseclass.lua | no |
| 75 | `chara/npc/object/objectairship/objectairship.lua` | airship_ferry | chara/npc/object | no |
| 75 | `chara/npc/object/objectship/objectship.lua` | airship_ferry | chara/npc/object | no |
| 75 | `widget/ask/guildleveselectlevelwidget.lua` | guildleve | widget/ask | docs/guildleve_content_widget_article_contract_deeper_20260618.md |
| 75 | `widget/ask/guildlevestartwidget.lua` | guildleve | widget/ask | docs/guildleve_content_widget_article_contract_deeper_20260618.md |
| 74 | `area/privatearea/privateareamasterbranch.lua` | private_area | area/privatearea | no |
| 74 | `area/privatearea/privateareamastermarket.lua` | private_area | area/privatearea | no |
| 74 | `chocobocaravanwidget.lua` | chocobo_caravan | root_widget | docs/chocobo_caravan_hud_adapter_contract_2026-06-19.md |
| 73 | `area/privatearea/content/privateareacontentbaseclass.lua` | private_area | area/privatearea | no |
| 73 | `area/privatearea/content/privateareamasterbattlefield.lua` | private_area | area/privatearea | no |
| 73 | `area/privatearea/content/privateareamasterrestrictarea.lua` | private_area | area/privatearea | no |

## Category Counts

| Category | Missing | Uncovered | Max priority | Top surfaces |
| --- | ---: | ---: | ---: | --- |
| chara/npc/monster | 395 | 379 | 39 | chara/npc/monster/ifrit/ifrithyperaid.lua; chara/npc/monster/piranha/piranhaboggypublicdungeonnm01.lua; chara/npc/monster/piranha/piranhaboggypublicdungeonpet01.lua; chara/npc/monster/chocobo/chocobobaseclass.lua; chara/npc/monster/bird/birdlessermooglef0f4.lua; chara/npc/monster/garuda/garudabaseclass.lua; chara/npc/monster/ifrit/ifritaid.lua; chara/npc/monster/ifrit/ifritbaseclass.lua |
| quest/scenario | 315 | 315 | 29 | quest/scenario/bsm/bsm400.lua; quest/scenario/defaulttalk/dftsrt.lua; quest/scenario/test/scealphaa.lua; quest/scenario/spl/spl101_quest.lua; quest/scenario/cul/cul400.lua; quest/scenario/exc/exc400.lua; quest/scenario/fsh/fsh400.lua; quest/scenario/test/scecuttest.lua |
| director/quest | 171 | 171 | 73 | director/quest/questdirectorgcg70101.lua; director/quest/questdirectorgcl70101.lua; director/quest/questdirectorgcu70101.lua; director/quest/questdirectornmrush01.lua; director/quest/questdirectornmrush02.lua; director/quest/questdirectorbaseclass.lua; director/quest/simplequestbattle/simplequestbattlebaseclass.lua; director/quest/questdirectoralc20001.lua |
| command | 135 | 126 | 65 | command/game/prog/chocoboridecommand.lua; command/system/confirmwarpcommand.lua; command/system/confirmwarpcommand_warp.lua; command/game/basic/garudaothers.lua; command/game/weaponskill/garudaattackweaponskill.lua; command/game/weaponskill/ifritattackweaponskill.lua; command/game/weaponskill/ifritsubstatweaponskill.lua; command/system/widgetopencommand.lua |
| status | 133 | 133 | 44 | status/chocobospeeddownstatus.lua; status/dotaurumstatus.lua; status/ability/attackmagichealhpstatus.lua; status/ability/attributejointlystatus.lua; status/ability/berserkstatus.lua; status/ability/bloodluststatus.lua; status/ability/cadencestatus.lua; status/ability/conservempstatus.lua |
| widget/ask | 53 | 31 | 82 | widget/ask/chocobonamingwidget.lua; widget/ask/materiaremovewidget.lua; widget/ask/guildleveselectlevelwidget.lua; widget/ask/guildlevestartwidget.lua; widget/ask/askwidget.lua; widget/ask/fellinginputwidget.lua; widget/ask/fishinginputwidget.lua; widget/ask/grandcompanyofficialjoinwidget.lua |
| chara/npc/object | 47 | 40 | 80 | chara/npc/object/raiddungeonheadcount.lua; chara/npc/object/objectairship/objectairship.lua; chara/npc/object/objectship/objectship.lua; chara/npc/object/chocobostop.lua; chara/npc/object/raiddungeontreasurebox.lua; chara/npc/object/treasurebox/instanceraidtreasurebox.lua; chara/npc/object/guildleveareanotice.lua; chara/npc/object/guildleveguidepoint.lua |
| chara/npc/populace | 41 | 40 | 68 | chara/npc/populace/occupancyguide/raidfst0dungeon03guide.lua; chara/npc/populace/occupancyguide/raidroc0dungeon01guide.lua; chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua; chara/npc/populace/instanceraidguide/noquestguidebaseclass.lua; chara/npc/populace/populaceguildlevetester.lua; chara/npc/populace/populaceflyingship/populaceflyingship.lua; chara/npc/populace/instanceraidguide/aetherytebeastchildguide.lua; chara/npc/populace/instanceraidguide/hasquestguidebaseclass.lua |
| area/zone | 26 | 26 | 42 | area/zone/zonebaseclass.lua; area/zone/zonebaseclass_u.lua; area/zone/zonemasterbattlefstf0.lua; area/zone/zonemasterbattleocno0.lua; area/zone/zonemasterbattleocno1.lua; area/zone/zonemasterbattlewilw0.lua; area/zone/zonemastercottageprv00.lua; area/zone/zonemastercruiseocno2.lua |
| item | 26 | 26 | 18 | item/normal/normalitembaseclass.lua; item/important/importantitembaseclass.lua; item/important/importantitemstandard.lua; item/itembaseclass.lua; item/itembaseclass_common.lua; item/itembaseclass_u.lua; item/money/moneyitembaseclass.lua; item/money/moneystandard.lua |
| group | 25 | 21 | 55 | group/contentgroup/guildlevegroup.lua; group/contentgroup/contentgroupbaseclass.lua; group/communitygroup/companygroup.lua; group/partygroup/partygroupbaseclass.lua; group/partygroup/playerpartygroup.lua; group/relationgroup/groupinvitationrelationgroup.lua; group/relationgroup/traderelationgroup.lua; group/contentgroup/publicpopgroup.lua |
| director/guildleve | 24 | 0 | 61 | director/guildleve/companylevedetectemote.lua; director/guildleve/companyleverescuenormal.lua; director/guildleve/guildlevebaseclass.lua; director/guildleve/privateglbattlesweepepicescort.lua; director/guildleve/privateglbattlesweepescort.lua; director/guildleve/privateglfreegonormal.lua; director/guildleve/requestdirector.lua; director/guildleve/privateglfreegathertown.lua |
| judge | 23 | 22 | 63 | judge/instanceraidguidejudge.lua; judge/chocobojudge.lua; judge/preface/cutsceneoncebeaconprefacejudge.lua; judge/craft/craftjudge.lua; judge/harvest/harvestjudge.lua; judge/negotiation/negotiationjudge.lua; judge/depictionjudge.lua; judge/preface/musicchangeprefacebaseclass.lua |
| director/monster | 15 | 15 | 40 | director/monster/monsterdirectordarkmoogle.lua; director/monster/monsterdirectorgaruda.lua; director/monster/monsterdirectorifrit.lua; director/monster/monsterdirectorifrithyper.lua; director/monster/monsterdirectormooglef0f4.lua; director/monster/monsterdirectoranimaobj.lua; director/monster/monsterdirectorbaseclass.lua; director/monster/monsterdirectorcyclops.lua |
| area/privatearea | 14 | 14 | 84 | area/privatearea/occupancy/raiddungeonsimple.lua; area/privatearea/privateareamastertest.lua; area/privatearea/privateareamasterbranch.lua; area/privatearea/privateareamastermarket.lua; area/privatearea/content/privateareacontentbaseclass.lua; area/privatearea/content/privateareamasterbattlefield.lua; area/privatearea/content/privateareamasterrestrictarea.lua; area/privatearea/content/privateareamastersimplecontent.lua |
| root_class | 13 | 7 | 59 | instanceraidhamletdefense.lua; requestmanager.lua; guildleveareanotice.lua; guildlevebaseclass.lua; guildleveguidepoint.lua; guildlevehiddenpoint.lua; guildlevesearchpoint.lua; occupancyplayers__occupancyplayerstest.lua |

## Read This As

- `airship_ferry` is the cleanest uncovered next target: ship directors, map objects, ship/airship objects, flying ship populace, and save NPC are all missing locally.
- `guildleve` still has a broader missing band beyond the caravan HUD: request manager/director and multiple guildleve widgets/classes.
- `private_area` and `raid_dungeon` have many missing base/director scripts, but some runtime behavior may already live in C#.
- `widget` has many missing client widgets; these should be tied back to command/packet surfaces before implementation.
- `quest` remains large even after path normalization, but it is lower priority unless a specific quest or cutscene path is being restored.

## Output Files

- `source_root_summary.csv` - recovered output roots and counts.
- `normalized_recovered_surfaces.csv` - all deduped recovered surfaces.
- `missing_recovered_surfaces.csv` - all unmatched recovered surfaces.
- `matched_recovered_surfaces.csv` - recovered surfaces with local Lua matches.
- `high_value_missing_surfaces.csv` - missing surfaces sorted by priority.
- `category_summary.csv` - missing counts by path category.
- `system_summary.csv` - missing counts by inferred system.
- `duplicate_surface_sources.csv` - repeated recovered surfaces across output roots.
- `recommended_backlog.csv` - system-level next-contract queue.
- `contract_summary.json` - machine-readable summary.
