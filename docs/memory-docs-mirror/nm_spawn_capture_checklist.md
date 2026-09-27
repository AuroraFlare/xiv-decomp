# NM Spawn Capture Checklist

Generated from staged NM SQL, archived region/location rows, and the full Notorious Monsters category page.

## Files

- Capture list: `docs/nm_spawn_capture_checklist.csv`
- Region Notorious rows without staged BNPC match: `docs/nm_spawn_capture_unmatched_locations.csv`
- Category Notorious names without staged/location match: `docs/nm_spawn_capture_unmatched_wiki_category.csv`

## How To Use

Fill `capturePosX`, `capturePosY`, `capturePosZ`, and optional `captureRot`. Keep `bnpcId` and `suggestedZoneId` unless your in-game capture proves the zone differs. `placementType=static_candidate` is safest for static spawn implementation; scripted/instance rows should be reviewed before adding ambient spawns.

## First Static Batch

These rows have direct region wiki hints and look like the best first capture pass.

| BNPC | Name | Zone ID | Zone | Map/Grid Hint | Level | Behavior |
| ---: | --- | ---: | --- | --- | --- | --- |
| 3043 | `gluttonous_gertrude` | 128 | Lower La Noscea | 31,32 | 42-42 | Passive |
| 3078 | `old_six_arms` | 128 | Lower La Noscea | 31-33 | 47-47 | Passive |
| 3045 | `great_buffalo` | 129 | Western La Noscea | 6-11, 7-14 | 65-65 | Aggressive |
| 3004 | `barometz` | 130 | Eastern La Noscea | 35-17 | 36-36 | Aggressive |
| 3098 | `slippery_sykes` | 130 | Eastern La Noscea | 38-25 | 36-36 | Passive |
| 3110 | `uraeus` | 145 | Coerthas Eastern Lowlands | 54-36 | 62-65 | Aggressive |
| 3080 | `phaia` | 150 | Central Shroud | 29-34 | 47-47 | Aggressive |
| 3097 | `sirocco` | 150 | Central Shroud | 27-31 | 42-42 | Passive |
| 3054 | `haughtpox_bloatbelly` | 152 | North Shroud | 20-13,27-15 | 60-60 | Aggressive |
| 3008 | `buata` | 153 | West Shroud | 15-40 | 55-55 | Aggressive |
| 3011 | `capricious_cassie` | 153 | West Shroud | 41-15 | 55-55 | Aggressive |
| 3047 | `great_oak` | 153 | West Shroud | 14, 42 | 55-55 | Aggressive |
| 3051 | `guardian_of_the_grove` | 153 | West Shroud | Turning Leaf | unknown | Aggressive |
| 3088 | `queen_gougou` | 153 | West Shroud | 39-16 | 55-55 | Passive |
| 3100 | `spiteful` | 153 | West Shroud | Turning Leaf | 55-55 | Aggressive |
| 3063 | `jackanapes` | 154 | South Shroud | 45-51 | 36-36 | Passive |
| 3087 | `queen_bolete` | 154 | South Shroud | 36-50 | 36-36 | Passive |
| 3009 | `cactuar_jack` | 172 | Western Thanalan | 18-30 | 47-47 | Passive |
| 3013 | `daddy_longlegs` | 172 | Western Thanalan | 16-34, 18-30 | 42-42 | Aggressive |
| 3021 | `elder_mosshorn` | 172 | Western Thanalan | Between 17-33 and 19-36 | 60-60 | Aggressive |
| 3077 | `nest_commander` | 172 | Western Thanalan | 11-25 | 36-36 | Aggressive |
| 3086 | `pyrausta` | 172 | Western Thanalan | 7/8-30/31 | 36-36 |  |
| 3111 | `voidtongue_ahzabb_chah` | 172 | Western Thanalan | 18-37 | 30-30 | Aggressive |
| 3003 | `bardi` | 176 | Nanawa Mines | 3-5 | 42-42 | Aggressive |
| 3065 | `kokoroon_quickfingers` | 176 | Nanawa Mines | 9-5 | 49-50 | Passive |
| 3016 | `deepvoid_slave` | 190 | Mor Dhona | Camp Revenant's Toll | 60-60 | Aggressive |
| 3016 | `deepvoid_slave` | 190 | Mor Dhona | Camp Brittlebark | 60-60 | Aggressive |
| 3017 | `dodore` | 190 | Mor Dhona | Brittlebark | 60-60 | Aggressive |
