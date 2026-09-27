# NM Left To Do

This tracks staged notorious monster mob types that do not currently have generated spawn rows.

The complete historical category roster and eLeMeN-first/local-BNPC crosswalk is [notorious-monsters-roster.md](ffxiv-1.0-wiki/notorious-monsters-roster.md). Category membership is kept separate from spawn completion so an archived page does not create an unverified coordinate.

Sources used:

- `Data/sql/server_battlenpc_mob_types_loot.sql` for staged NM mob types and loot.
- `docs/nm_spawn_locations_from_capture.csv` for the current generated spawn seed from `C:/ServerData/nm_spawns.csv`.
- `docs/nm_spawn_capture_checklist.csv` for wiki/documentation hints, zone guesses, and implementation classification.

Current snapshot:

- Staged NM-ish mob type rows: 118
- Names represented in the generated NM spawn seed: 28
- Staged rows still without generated spawn rows: 93

Note: `docs/nm_spawn_capture_checklist.csv` predates the current generated spawn seed, so some checklist rows still say `needs_pos` even when the NM is already seeded. Treat `docs/nm_spawn_locations_from_capture.csv` as the current source of truth for "done".

## Already Seeded

Do not recapture these unless the existing position is wrong or needs a behavior correction:

`bardi`, `barometz`, `cactuar_jack`, `capricious_cassie`, `daddy_longlegs`, `dodore`, `dodore's_minion`, `elder_mosshorn`, `gluttonous_gertrude`, `goblin_bouncer`, `goblin_braggadocio`, `great_buffalo`, `guardian_of_the_grove`, `haughtpox_bloatbelly`, `jackanapes`, `kokoroon_quickfingers`, `mosshorn_billygoat`, `mosshorn_nannygoat`, `nest_commander`, `old_six_arms`, `pyrausta`, `queen_bolete`, `sirocco`, `slippery_sykes`, `spindiggle`, `spiteful`, `uraeus`, `voidtongue_ahzabb_chah`.

Implemented ecology from the eLeMeN archive and Kai guide:

- Dodore is Gloom-eligible and links with exactly three Dodore's Minions.
- Elder Mosshorn is eligible from 08:00-20:00 Eorzea time and links with two Nannies plus one Billy.
- Haughtpox Bloatbelly is eligible from 08:00-20:00 and links with two Goblin Braggadocios plus two Goblin Bouncers.
- Great Buffalo is eligible from 08:00-20:00; Uraeus is eligible from 20:00-08:00.
- All 33 archive rows described as "every few minutes" use the guide-corroborated five-minute cadence.
- Lone Coeurl's eleven-Jackal-Pup trigger and Giant Remora's seven-Remora party remain pending verified Shposhae server-space coordinates.

## Priority POS Captures

These look closest to normal static/open-world or interior NM placement work. They should be the next capture pass.

| BNPC | Name | Actor | Level | Zone hint | Notes |
| --- | --- | --- | --- | --- | --- |
| 3080 | `phaia` | 2101509 | 47 | zone 150, Central Shroud, 29-34 | Missing from user callout; likely normal static NM. |
| 3081 | `prince_of_pestilence` | 2100610 | 47 | zone 157, The Mun-Tuy Cellars | Missing from user callout; interior/cellar NM. |
| 3000 | `alux` | 2102609 | 42 | zone 157, The Mun-Tuy Cellars | Missing from user callout; source location only. |
| 3096 | `shearing_sheridan` | 2107619 | 20 | zone 235, Shposhae | Missing from user callout; wiki notes Shposhae Underground 1F, 5-4. |
| 3067 | `lone_coeurl` | 2103203 | 22 | zone 235, Shposhae | Missing from user callout; wiki notes Shposhae Underground 2F, 5-4. |
| 3109 | `unknown_soldier` | 2104321 | 47 | zone 132, Cassiopeia Hollow | Missing from user callout; teleports to top hate target, Curse resets hate. |
| 3101 | `spitfire` | 2106207 | 47 | zone 146, Coerthas | Missing from user callout; source position unavailable. |
| 3019 | `downy_dunstan` | 2106017 | 42 | zone 146, Coerthas | Missing from user callout; source location only. |
| 3007 | `bomb_baron` | 2101610 | 42 | zone 132, Cassiopeia Hollow | Needs classification, but likely direct POS work first. |
| 3008 | `buata` | 2101515 | 55 | zone 153, West Shroud, 15-40 | Open-world/location doc. |
| 3047 | `great_oak` | 2102806 | 55 | zone 153, West Shroud, 14, 42 | Open-world/location doc. |
| 3088 | `queen_gougou` | 2100519 | 55 | zone 153, West Shroud, 39-16 | Open-world/location doc. |
| 3016 | `deepvoid_slave` | 2302501 | 60 | zone 190, Mor Dhona, Camp Revenant's Toll / Camp Brittlebark | Open-world/location doc; name overlaps with Dzemael actors below. |

## Needs Classification Before Static Seed

These have enough source hints to track, but may need custom logic, stronghold handling, quest gating, or dungeon placement rules before adding plain static spawns.

| BNPC | Name | Actor | Level | Source hint |
| --- | --- | --- | --- | --- |
| 3039 | `amaljaa_chief` | 2206528 | 59 | zone 171, Eastern Thanalan; The Battle for the Golden Bazaar. |
| 3052 | `flamefist_ahlygg_roh` | 2162051 | 59 | zone 174, Southern Thanalan; Zahar'ak. |
| 3068 | `natalan` | 2106449 | 59 | Natalan Ixal loot bucket, representative gatekeeper actor. |
| 3094 | `sazel_ciloc_the_divine` | 2206419 | 59 | The Battle for Hyrstmill. |
| 3107 | `third_order_patriarch_zu_ga` | 2106665 | 59 | zone 137, U'Ghamaro Mines. |
| 3074 | `nael_van_darnus` | 2210901 | 55 | Riversroad, To Kill a Raven, first phase. |
| 3075 | `nael_deus_darnus` | 2210902 | 55 | Riversroad, To Kill a Raven, second phase. |
| 3076 | `nael_deus_darnus` | 2210906 | 60 | Riversroad, The Raven Nevermore. |
| 3104 | `tempered_captive` | 2289001 | unknown | zone 174, Paglth'an, Lord Errant captive variant 1. |
| 3105 | `tempered_captive` | 2289002 | unknown | zone 174, Paglth'an, Lord Errant captive variant 2. |
| 3106 | `tempered_captive` | 2289003 | unknown | zone 174, Paglth'an, Lord Errant captive variant 3. |

## Dungeon And Interior Content

These are missing, but should probably be implemented with dungeon/instance behavior rather than blindly added to the open-world NM seed.

| BNPC | Name | Actor | Level | Area hint |
| --- | --- | --- | --- | --- |
| 3042 | `giant_remora` | 2104514 | 19 | zone 235, Shposhae. |
| 3091 | `remora` | 2104513 | 15 | zone 235, Shposhae. |
| 3001 | `antares` | 2301102 | 38 | zone 159, The Thousand Maws of Toto-Rak. |
| 3093 | `sargas` | 2301103 | 38 | zone 159, The Thousand Maws of Toto-Rak, Execution Chamber. |
| 3095 | `shaula` | 2301104 | 40 | zone 159, The Thousand Maws of Toto-Rak, Interrogation Chamber. |
| 3005 | `batraal` | 2303501 | unknown | zone 231, The Dzemael Darkhold. |
| 3014 | `deepvoid_slave` | 2102507 | 55 | The Dzemael Darkhold actor. |
| 3015 | `deepvoid_slave` | 2102508 | 55 | The Dzemael Darkhold alternate actor. |
| 3038 | `all_seeing_eye` | 2301701 | unknown | zone 231, The Dzemael Darkhold. |
| 3099 | `soulgazer` | 2301702 | unknown | zone 231, The Dzemael Darkhold. |
| 3073 | `myrmidon_princess` | 2303003 | 59 | zone 246, Cutter's Cry. |

## Skirmish Content

These are staged, but the source notes point at Locke's Lie or Turtleback Island skirmish behavior.

| BNPC | Name | Actor | Level | Source hint |
| --- | --- | --- | --- | --- |
| 3006 | `bixie` | 2208701 | 55 | zone 237, Turtleback Island. |
| 3010 | `cactuar_jaques` | 2200907 | 55 | zone 236, Locke's Lie. |
| 3022 | `elder_longhorn` | 2202310 | 55 | zone 236, Locke's Lie. |
| 3029 | `eurylochus` | 2201507 | 55 | zone 236, Locke's Lie. |
| 3030 | `aetherbound_slave` | 2202505 | 55 | zone 236, Locke's Lie skirmish. |
| 3031 | `akoman` | 2201707 | 55 | zone 236, Locke's Lie skirmish. |
| 3046 | `great_elm` | 2202805 | 55 | zone 236, Locke's Lie skirmish. |
| 3048 | `greater_buffalo` | 2200804 | 55 | zone 237, Turtleback Island skirmish. |
| 3082 | `princess_of_pestilence` | 2200611 | 55 | zone 236, Locke's Lie skirmish. |
| 3102 | `steropes` | 2210703 | 55 | zone 237, Turtleback Island skirmish. |
| 3103 | `stone_golem` | 2208905 | 55 | zone 237, Turtleback Island skirmish; highly resistant to lightning. |
| 3112 | `wadjet` | 2200711 | 55 | zone 237, Turtleback Island; spawns after Greater Buffalo or 5 minutes. |

## Guildleve, Faction, And Quest Battle Content

These should be implemented through leve/faction/quest systems, not the normal static NM seed.

| BNPC | Name | Actor | Level | Source hint |
| --- | --- | --- | --- | --- |
| 3002 | `barbatos` | 2203503 | unknown | zone 174, Southern Thanalan, 37-36; Guildleve: Always Bet on Black. |
| 3012 | `curious_gorge` | 2289037 | 55 | zone 172, Western Thanalan, The Silver Bazaar; Guildleve: How to Quit You. |
| 3020 | `earthbound_wrath` | 2204907 | 55 | zone 150, Central Shroud, Sorrel Haven; Guildleve: The Chorus of Cataclysm. |
| 3027 | `escaped_goobbue` | 2203301 | 1 | zone 175, Ul'dah; Guildleve: Flowers for All. |
| 3032 | `ala_mhigan_axeman` | 2289041 | 53 | zone 190, Mor Dhona, 11-16; Guildleve: Return of the King...of Ruin. |
| 3033 | `ala_mhigan_bladedancer` | 2289010 | 36 | zone 175, Ul'dah, 5-5; Guildleve: Thrill of the Fight. |
| 3034 | `ala_mhigan_challenger` | 2289006 | 20 | zone 175, Ul'dah, 5-5; Guildleve: All Bark and No Bite / Thrill of the Fight. |
| 3035 | `ala_mhigan_challenger` | 2289007 | 36 | zone 175, Ul'dah, 5-5; Guildleve: All Bark and No Bite / Thrill of the Fight. |
| 3036 | `ala_mhigan_pikeman` | 2289040 | 53 | zone 190, Mor Dhona, 11-16; Guildleve: Return of the King...of Ruin. |
| 3037 | `ala_mhigan_shaman` | 2289043 | 53 | zone 190, Mor Dhona, 11-16; Guildleve: Return of the King...of Ruin. |
| 3049 | `greywine` | 2202208 | unknown | zone 143, Coerthas Central Highlands; Guildleve: Into the Dragon's Maw. |
| 3050 | `guano_gnat` | 2200610 | 30-42 | zone 172, Western Thanalan, 29-19; Guildleve: Hearing Voices. |
| 3055 | `icebound_wrath` | 2204707 | 55 | zone 150, Central Shroud, Sorrel Haven; Guildleve: The Chorus of Cataclysm. |
| 3058 | `imperial_juggernaut` | 2202401 | 50 | zone 190, Mor Dhona; Guildleve: Futures Perfect. |
| 3062 | `j_moldva` | 2289009 | 30 | zone 155, Gridania, Wailing Barracks; Guildleve: Unalienable Rights. |
| 3064 | `jenlyns_straightblade` | 2289035 | 52 | zone 170, Central Thanalan; Guildleve: Parley on High Ground. |
| 3066 | `kraken_deckhand` | 2280217 | 25 | zone 133, Limsa Lominsa; Guildleve: Here There be Pirates. |
| 3069 | `manipulated_eye` | 2201706 | 55 | zone 173, Northern Thanalan, 27-14; Guildleve: Keeping the Oath. |
| 3070 | `manipulated_ogre` | 2202503 | 55 | zone 173, Northern Thanalan, 27-14; Guildleve: Keeping the Oath. |
| 3079 | `ossuary_almstaker` | 2289014 | 36 | zone 172, Western Thanalan, 12-33; Guildleve: Two Sides to Every Chip. |
| 3089 | `ragged_hippocerf` | 2200406 | 43-44 | zone 129, Western La Noscea, 4-18; Guildleve: International Relations. |
| 3108 | `toothless_gladiator` | 2289013 | 20 | zone 175, Ul'dah, 5-5; Guildleve: The House Always Wins. |
| 3114 | `whitetalon` | 2200407 | 46 | zone 129, Western La Noscea, 4-18; Guildleve: International Relations, after two Ragged Hippocerfs. |
| 3115 | `widargelt_the_watcher` | 2289039 | 55 | zone 190, Mor Dhona, 11-16; Guildleve: Return of the King...of Ruin. |
| 3117 | `yotoli_hueloc_the_austere` | 2206413 | 55 | zone 143, Coerthas Central Highlands; Guildleve: Requiem for the Fallen. |

## Multi-Camp Event Content

These are event rows and probably need event scheduling or leve/event hooks rather than static spawn rows.

| BNPC | Name | Actor | Level | Source hint |
| --- | --- | --- | --- | --- |
| 3023 | `elite_funditor` | 2280032 | 50 | Imperial Invasion event; Lower La Noscea 26-31, Central Shroud 25-28, Central Thanalan 25-26. |
| 3024 | `elite_speculator` | 2280033 | 50 | Imperial Invasion event; Lower La Noscea 26-31, Central Shroud 25-28, Central Thanalan 25-26. |
| 3025 | `elite_funditor` | 2280048 | 50 | Imperial Invasion event alternate actor. |
| 3026 | `elite_speculator` | 2280049 | 50 | Imperial Invasion event alternate actor. |
| 3059 | `imperial_pilus_prior` | 2207005 | 50 | Imperial Invasion event; source positions unavailable. |
| 3040 | `atomos` | 2111001 | 60 | Multi-camp event: Dragonhead, Glory, Ever Lakes, Emerald Moss, Crimson Bark, Black Brush, Horizon, Bluefog, Revenant's Toll, Brittlebark. |

## Trials And Private/Scripted Encounters

These should be handled by trial/private area scripts or boss encounter logic.

| BNPC | Name | Actor | Level | Source hint |
| --- | --- | --- | --- | --- |
| 3028 | `estinien_wyrmblood` | 2289038 | unknown | zone 146, Coerthas quest battle. |
| 3041 | `garuda` | 2209501 | unknown | zone 239, The Howling Eye. |
| 3090 | `razor_plume` | 2209510 | unknown | zone 239, The Howling Eye. |
| 3056 | `ifrit` | 2207301 | 35 | zone 240, The Bowl of Embers, It Kills with Fire. |
| 3057 | `ifrit` | 2207302 | 55 | zone 240, The Bowl of Embers, Ifrit Bleeds We Can Kill It. |
| 3060 | `infernal_nail` | 2207306 | 35 | zone 240, The Bowl of Embers, It Kills with Fire. |
| 3061 | `infernal_nail` | 2207307 | 55 | zone 240, The Bowl of Embers, Ifrit Bleeds We Can Kill It. |
| 3044 | `good_king_moggle_mog_xii` | 2210408 | 55 | zone 238, Thornmarch, A Feast of Fools. |
| 3053 | `furryfoot_kupli_kipp` | 2210403 | 50 | zone 238, Thornmarch. |
| 3083 | `pukla_puki_the_pomburner` | 2210405 | 50 | zone 238, Thornmarch. |
| 3084 | `pukna_pako_the_tailturner` | 2210407 | 50 | zone 238, Thornmarch. |
| 3085 | `puksi_piko_the_shaggysong` | 2210406 | 50 | zone 238, Thornmarch. |
| 3092 | `ruffletuft_kupta_kapa` | 2210402 | 50 | zone 238, Thornmarch. |
| 3113 | `whiskerwall_kupdi_koop` | 2210401 | 50 | zone 238, Thornmarch; grants Good King Whisker Bash. |
| 3116 | `woolywart_kupqu_kogi` | 2210404 | 50 | zone 238, Thornmarch; grants Good King Moogle Eye Shot. |

## Suggested Next Capture Batch

Capture these first because they are directly useful for the next static/interior spawn SQL pass:

1. `phaia`
2. `prince_of_pestilence`
3. `alux`
4. `shearing_sheridan`
5. `lone_coeurl`
6. `unknown_soldier`
7. `spitfire`
8. `downy_dunstan`
9. `bomb_baron`
10. `buata`
11. `great_oak`
12. `queen_gougou`
13. `deepvoid_slave` Mor Dhona variants
