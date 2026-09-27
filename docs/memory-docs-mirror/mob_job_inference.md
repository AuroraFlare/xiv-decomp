# Mob Job Inference

This report assigns the closest 1.x combat class/job archetype to battle NPC rows.

## What 2.0 Data Can And Cannot Do

- ARR/2.x `BNpcName` data is useful for confirming names that survived into A Realm Reborn.
- Current public `BNpcBase` schemas expose model, behavior, battalion, rank, parts, and related fields, but not a stable monster `ClassJob` field.
- For this repo, explicit 1.x monster script paths such as `LizardmanThaumaturgeStandard` or `BirdmanGladiatorStandard` are stronger evidence than ARR name matches.
- Non-humanoid monsters are therefore marked as the closest 1.x archetype, not as dat-mined factual jobs.

## Outputs

- `tools/mobclasses/mobtype_job_inference.csv`: all current `server_battlenpc_mob_types` rows.
- `tools/mobclasses/known_1x_mob_job_inference.csv`: all known standard 1.x monster actor rows from `actor_id_mob_name_only.csv`.
- `tools/mobclasses/mobtype_current_jobs_patch.sql`: optional SQL patch for `currentJob`.

## Current Mobtype Summary

- Current mobtype rows: 70
- Known standard 1.x monster actor rows: 2646
- Inferred mobtype jobs: ARC=2, CNJ=11, GLA=7, LNC=14, MRD=12, PGL=19, THM=5
- Confidence: high=20, low=38, medium=12

## Current Mobtypes

| BNPC | Actor | Name | Job | Confidence | Source | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| 1000 | 2104009 | star_marmot | PGL (2) | low | monster_family | Lemming: natural melee family fallback |
| 1001 | 2104009 | star_marmot | PGL (2) | low | monster_family | Lemming: natural melee family fallback |
| 1002 | 2105901 | forest_funguar | CNJ (23) | low | monster_family | Funguar: plant/nature family fallback |
| 1003 | 2103101 | toxic_toad | PGL (2) | low | monster_family | Gigantoad: natural melee family fallback |
| 1004 | 2106214 | sabletooth_spriggan | CNJ (23) | high | monster_family | Sprite: sprite/elemental family maps to conjury |
| 1005 | 2105601 | chigoe | LNC (8) | medium | monster_family | Chigoe: piercing stinger family |
| 1006 | 2104302 | bogy | THM (22) | high | monster_family | Petitghost: ghost/bogy spell-list family |
| 1007 | 2101404 | feral_watchdog | PGL (2) | low | monster_family | Wolf: natural bite family fallback |
| 1008 | 2102721 | toadtrap | CNJ (23) | low | monster_family | Flower: plant/nature family fallback |
| 1009 | 2102722 | pruned_roselet | CNJ (23) | low | monster_family | Flower: plant/nature family fallback |
| 1010 | 2105801 | firefly | CNJ (23) | low | monster_family | Firefly: elemental-light family fallback |
| 1011 | 2101404 | feral_watchdog | PGL (2) | low | monster_family | Wolf: natural bite family fallback |
| 1012 | 2102722 | pruned_roselet | CNJ (23) | low | monster_family | Flower: plant/nature family fallback |
| 1013 | 2102721 | toadtrap | CNJ (23) | low | monster_family | Flower: plant/nature family fallback |
| 1014 | 2104508 | aurora_angler | PGL (2) | low | monster_family | Piranha: natural bite family fallback |
| 1015 | 2110311 | goblin_headman | GLA (3) | high | 1x_script_path | model path token 'gla' |
| 1016 | 2106201 | spriggan_collector | CNJ (23) | high | monster_family | Sprite: sprite/elemental family maps to conjury |
| 1017 | 2101211 | nestling_buzzard | LNC (8) | low | monster_family | Bird: beak/talon family fallback |
| 1018 | 2105505 | yarzon_scavenger | LNC (8) | medium | monster_family | Longlegs: yarzon/longlegs piercing family |
| 1019 | 2100104 | sea_puk | LNC (8) | low | monster_family | Winglizard: winged lizard family fallback |
| 1020 | 2102003 | fat_dodo | PGL (2) | low | monster_family | Dodo: natural melee family fallback |
| 1021 | 2101211 | nestling_buzzard | LNC (8) | low | monster_family | Bird: beak/talon family fallback |
| 1022 | 2105505 | yarzon_scavenger | LNC (8) | medium | monster_family | Longlegs: yarzon/longlegs piercing family |
| 1023 | 2106601 | kobold_acolyte | CNJ (23) | high | 1x_script_path | model path token 'conjurer' |
| 1024 | 2106622 | kobold_footman | GLA (3) | medium | mob_name_role | name token 'footman' |
| 1025 | 2106613 | kobold_kirkman | CNJ (23) | medium | spell_list | spell list 'kobold_acolyte' |
| 1026 | 2102127 | corroded_coblyn | MRD (4) | low | monster_family | Orebeetle: rocky shell/heavy impact family fallback |
| 1027 | 2102127 | corroded_coblyn | MRD (4) | low | monster_family | Orebeetle: rocky shell/heavy impact family fallback |
| 1028 | 2106201 | spriggan_collector | CNJ (23) | high | monster_family | Sprite: sprite/elemental family maps to conjury |
| 1029 | 2105717 | moiling_mole | PGL (2) | low | monster_family | Mole: natural melee family fallback |
| 1030 | 2102009 | stuffed_dodo | PGL (2) | low | monster_family | Dodo: natural melee family fallback |
| 1031 | 2104021 | nutgrabber_marmot | PGL (2) | low | monster_family | Lemming: natural melee family fallback |
| 1032 | 2106403 | ixali_duelist | GLA (3) | high | 1x_script_path | model path token 'gladiator' |
| 1033 | 2106403 | ixali_duelist | GLA (3) | high | 1x_script_path | model path token 'gladiator' |
| 1034 | 2100207 | velociraptor | LNC (8) | low | monster_family | Raptor: claw/talon family fallback |
| 1035 | 2106403 | ixali_duelist | GLA (3) | high | 1x_script_path | model path token 'gladiator' |
| 1036 | 2100714 | rainbow_basilisk | MRD (4) | low | monster_family | Basilisk: large heavy reptile fallback |
| 1037 | 2100407 | hippogryph | MRD (4) | low | monster_family | Griffin: large physical beast fallback |
| 1038 | 2101503 | truffle_hog | MRD (4) | low | monster_family | Boar: charge-heavy beast fallback |
| 1039 | 2100714 | rainbow_basilisk | MRD (4) | low | monster_family | Basilisk: large heavy reptile fallback |
| 1040 | 2102504 | headrip_ogre | MRD (4) | medium | monster_family | Ogre: large swing-heavy family |
| 1041 | 2101707 | Smolenkos | THM (22) | medium | monster_family | Ahriman: voidsent/caster family |
| 1042 | 2162028 | amalj'aa_seer | THM (22) | high | 1x_script_path | model path token 'thaumaturge' |
| 1043 | 2162022 | amalj'aa_scout | PGL (2) | high | 1x_script_path | model path token 'pugilist' |
| 1044 | 2162004 | amalj'aa_ranger | ARC (7) | high | 1x_script_path | model path token 'archer' |
| 1045 | 2162013 | amalj'aa_harpooner | LNC (8) | high | 1x_script_path | model path token 'lancer' |
| 1046 | 2102313 | nannygoat | MRD (4) | low | monster_family | Yak: goat charge family fallback |
| 1047 | 2102301 | aldgoat_billy | MRD (4) | low | monster_family | Yak: goat charge family fallback |
| 1048 | 2100901 | cactuar | LNC (8) | low | monster_family | Cactus: needle/stinger family fallback |
| 1049 | 2101614 | drifting_dud | THM (22) | medium | monster_family | Bomb: fire/explosion magical family |
| 1050 | 2101111 | molting_miteling | LNC (8) | medium | monster_family | Spider: mite/spider piercing family |
| 1051 | 2104504 | mad_angler | PGL (2) | low | monster_family | Piranha: natural bite family fallback |
| 1052 | 2104504 | mad_angler | PGL (2) | low | monster_family | Piranha: natural bite family fallback |
| 1053 | 2162013 | amalj'aa_harpooner | LNC (8) | high | 1x_script_path | model path token 'lancer' |
| 1054 | 2162004 | amalj'aa_ranger | ARC (7) | high | 1x_script_path | model path token 'archer' |
| 1055 | 2162022 | amalj'aa_scout | PGL (2) | high | 1x_script_path | model path token 'pugilist' |
| 1056 | 2162028 | amalj'aa_seer | THM (22) | high | 1x_script_path | model path token 'thaumaturge' |
| 1057 | 2101111 | molting_miteling | LNC (8) | medium | monster_family | Spider: mite/spider piercing family |
| 1058 | 2162013 | amalj'aa_harpooner | LNC (8) | high | 1x_script_path | model path token 'lancer' |
| 1059 | 2162022 | amalj'aa_scout | PGL (2) | high | 1x_script_path | model path token 'pugilist' |
| 1060 | 2102313 | nannygoat | MRD (4) | low | monster_family | Yak: goat charge family fallback |
| 1061 | 2102301 | aldgoat_billy | MRD (4) | low | monster_family | Yak: goat charge family fallback |
| 1062 | 2104011 | thistletail_marmot | PGL (2) | low | monster_family | Lemming: natural melee family fallback |
| 1063 | 2102001 | dodo | PGL (2) | low | monster_family | Dodo: natural melee family fallback |
| 1064 | 2100101 | puk_hatchling | LNC (8) | low | monster_family | Winglizard: winged lizard family fallback |
| 1065 | 2107601 | giant_crab | GLA (3) | low | monster_family | Crab: defensive shell family mapped to gladiator |
| 1066 | 2180217 | black_crow_cleaver | MRD (4) | medium | mob_name_role | name token 'cleaver' |
| 1067 | 2180214 | black_crow_swashbuckler | GLA (3) | medium | mob_name_role | name token 'swashbuckler' |
| 1068 | 2106001 | lost_lamb | PGL (2) | low | monster_family | Sheep: natural melee family fallback |
| 1069 | 2106306 | qiqirn_mercenary | PGL (2) | high | 1x_script_path | model path token 'barehands' |
