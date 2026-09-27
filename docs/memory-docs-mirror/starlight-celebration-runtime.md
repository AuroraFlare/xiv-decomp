# Versioned 1.x winter seasonal runtime

The server exposes each surviving 1.x winter release as its own map profile.
This distinction is historical, not cosmetic:

| Config profile | Retail release | Runtime content |
|---|---|---|
| `starlight_2010_enabled` | First annual Starlight Celebration, 15–31 Dec 2010 | City dressing, bells, Smilebringer gifts, Twinklebox donations, Dream attire, and original food recipes; no quest chain |
| `starlight_2011_enabled` | Starlight Celebration / Patch 1.20, 16–31 Dec 2011 | City dressing and **Winter Is Not Coming** (`Spl0i3`, quest `110801`) |
| `heavensturn_2012_enabled` | Heavensturn 2012 follow-up | Kadomatsu, Black Rabbit representatives, and **Gone with the Snow** (`Spl0i4`, quest `110802`) |

`Gone with the Snow` is intentionally not called `starlight_2012`. Its
English story follows Winter's Knell, but its Japanese title and reward identify
it as Heavensturn. FFXIV 1.0 shut down before a December 2012 Starlight event.

## Operator configuration

Enable one release in `Data/map_config.ini` and restart the Map Server:

```ini
starlight_2010_enabled=true
starlight_2011_enabled=false
heavensturn_2012_enabled=false

starlight_event_weather_id=8071
starlight_2010_bell_interval_seconds=28800
```

The profiles are independently selectable. Running 2011 and 2012 together is
supported for development, but the server warns because Father Frost must remain
visible for the 2011 quest even though the 2012 story says he vanished.

`christmas_event_enabled=true` remains as a deprecated compatibility alias. It
enables both Starlight 2010 and Starlight 2011, never Heavensturn. The old
`christmas_event_weather_id` is also accepted as a fallback, but new configs
should use `starlight_event_weather_id`.

The 2010 and 2011 retail patches used `8032 / wtr_xmas`. The final 1.23b
client reassigned 8032 to Dalamud thunder, so the runtime accepts only restored
selector 8071. This is a compatibility substitution; 8071 is not claimed as the
retail wire id.

## Shared Starlight city presentation

Either Starlight profile activates the recovered resident-layout schedulers:

| City | Layout | Bridge instance | Show schedulers |
|---|---:|---:|---|
| Gridania | 331 | 5414 | `time_bg_crs1_show` |
| Limsa Lominsa | 131 | 7238 | `time_bg_itm0_pstr1_h_show`, `time_bg_itm0_pstr3_h_show` |
| Ul'dah | 431 | 3545 | `time_bg_xmas1_show`, `time_bg_xmas2_show` |

A private MapObj bridge is created per player once the city's actor table is
ready. The schedulers own the embedded trees, arches, lights, ornaments, bells,
and gift dressing; this avoids replacing the city-wide retail layout with a few
manually guessed props.

The 2011 ArkhamNative walkthrough shows the same presentation: a
red/green/gold arch with hanging bells, a large star-topped evergreen with
geometric yellow lights and colored bulbs, and wrapped presents stacked around
the raised city planter. Limsa uses the equivalent tree-and-gift installation.

Portable model families remain useful for inspection:

| BG family | Recovered use |
|---|---|
| `b928` | 2010 interactive Starlight bell variants |
| `b933`, `b934` | Christmas trees |
| `b935` | Christmas archway |
| `b978` | 2011 ornament variants |
| `b979` | Snowman/Father Frost variants |
| `b980` | 2011 bell variants |
| `b901/e001,e002,e009` | Heavensturn kadomatsu variants |

`!eventdecor starlight preview` uses the exact recovered appearance rows
`1200151`, `1200152`, and `1200153` for `b933/e001`, `b934/e001`, and
`b935/e001`. Use it or `!spawnbgmodel` for model QA. The preview is deliberately
separate from the automatic resident-layout schedulers so it cannot duplicate
city-wide trees and arches during normal event operation.

## Starlight 2010

### Bells and Smilebringer gifts

Twelve playable `b928` bells now cover the twelve map squares preserved by the
2010 event record. Each city uses its own recovered bell variant. The original
actor transforms do not survive, so these are **reconstructed homes**, not
retail XYZ or client-accepted clearance. Each page was calibrated and rendered
with `tools/mobspawns/map_coordinates.py`; the native maps supplied artwork for
all twelve squares, but only one selected home has exact recorded ground.
City-wide furnishings still come from the recovered schedulers.

| City / native page | Event map square | Authored world XYZ | Ground basis |
|---|---|---|---|
| Limsa Upper Decks / 914 | (7,3) | `(-457, 40, 32)` | Offset from `seventhsage_west` static Y; estimated at bell X/Z |
| Limsa Upper Decks / 914 | (7,7) | `(-469.72, 41.51, 431.37)` | Offset from Trinne static Y; estimated at bell X/Z |
| Limsa Lower Decks / 900 | (5,5) | `(-678.9, 16.2, 229.5)` | Offset from Sysley static Y; estimated at bell X/Z |
| Limsa Lower Decks / 900 | (7,5) | `(-489, 20, 190)` | Offset from Aergwynt static Y; estimated at bell X/Z. The zone's Y=40 nav samples here belong to a different visible path and were not used. |
| Gridania / 2800 | (4,4) | `(-176.49332, 22.124018, -1408.7863)` | Exact frozen zone-206 nav node 587 |
| Gridania / 2800 | (6,1) | `(55.5, 28.32, -1651)` | Near Ylessa static placement; estimated floor |
| Gridania / 2800 | (6,5) | `(19.8, 10.3, -1305.9)` | Existing reconstructed event-hub home, retained |
| Gridania / 2800 | (7,4) | `(119, 20, -1392)` | Near Animuili static placement; estimated floor |
| Ul'dah Merchant Strip / 1800 | (5,3) | `(-197.1, 196, 43.8)` | Existing reconstructed event-hub home, retained; nav samples show another nearby floor |
| Ul'dah Merchant Strip / 1800 | (7,3) | `(-17, 192.95, 27)` | Near Ococo static placement; estimated floor |
| Ul'dah Merchant Strip / 1800 | (7,5) | `(15.9, 196, 182.33)` | Near Wenefreda static placement; estimated floor |
| Ul'dah Hustings Strip / 1850 | (5,5) | `(-174, 190, 195)` | Map-walkway X/Z; Y is a weak estimate from Melisie outside the square, with no local recorded ground |

All four Limsa and four Gridania homes use zone 230/206 respectively, and the
four Ul'dah homes use public zone 175. The source-local nav snapshots used to
inspect candidate floors were SHA-256 `300ab7ad4751a858dcb84bcd59970bb92b9d325c4b92ba228a933e9ed3d6a833`
(230), `688b482a9073389de26f7a32adce3f8bbe7b4c660e640bedc7c01aa7314eb63b`
(206), and `1bfcd152001155204c9853bd690e254a9c9adf5e52fd462c9f56bcd0d9d4f317`
(175). Page choice did not assign heights or floor membership. Check all
twelve bell models for ground contact, NPC overlap, path clearance, and
interaction range in the client before calling the layout accepted.

Ringing a bell grants one server-selected item from the exact retail table:

- Powdered Sugar `3011540`
- Young Dodo Roaster `3011018`
- Dodo Stuffing `3011544`
- Dream Hat Materials `10005030`
- Dream Tunic Materials `10005031`
- Dream Boots Materials `10005032`
- Twinklebox `10011121`

One gift is initially available. Further gifts accrue every eight Earth hours,
with at most six waiting, matching the retail description. The default interval
is 28,800 seconds; operators may lower
`starlight_2010_bell_interval_seconds` for local testing. Inventory mutation
is authoritative and a full inventory does not consume the waiting gift.

The waiting-gift clock and pending count are persisted per character in main
SQL `Data/sql/characters_starlight_bell_gifts.sql`. The Map Server lazily
ensures the same table for existing installations; row locking serializes
accrual and reservations across processes, so a restart does not create a
fresh present. A gift is reserved before inventory mutation, and a normal
inventory rejection refunds it. A crash in the narrow interval between the
durable reservation and inventory write can still lose a present; the server
logs an unexpected inventory exception for manual reconciliation rather than
risk a duplicate. This is a server-authored persistence table, not a recovered
retail schema field.

### Twinklebox donations

All six historical donation NPCs are active only under the 2010 profile:

| Hamlet | NPC / class | Placement |
|---|---|---|
| Aleport | Tsimh Panipahr / `1500011` | Authenticated static row |
| Wineport | Eyriguht / `1500012` | Authenticated static row |
| Hyrstmill | Blavier / `1500062` | Reconstructed from the surviving Hyrstmill actor cluster |
| Quarrymill | Imailie / `1500063` | Reconstructed from the surviving Quarrymill actor cluster |
| Gold Bazaar | Adeldreda / `1500064` | Authenticated static row |
| Silver Bazaar | Gaganji / `1500065` | Authenticated static row |

One Twinklebox may be donated for one already-crafted piece of Dream attire:
Dream Hat `8012501`, Dream Tunic `8032101`, or Dream Boots `8081501`.
The transaction preflights inventory capacity and restores the Twinklebox if
the reward add fails.

The original crafting route also remains intact in local recipe data:

| Result | Item | Craft / rank band |
|---|---:|---|
| Dream Hat | 8012501 | Weaver 34, 11–20 |
| Dream Tunic | 8032101 | Weaver 34, 11–20 |
| Dream Boots | 8081501 | Leatherworker 33, 11–20 |
| Princess Pudding | 3010408 | Culinarian 36, 1–10 |
| Ore Fruitcake | 3010411 | Culinarian 36, 1–10 |
| Snowflake Peak | 3010410 | Culinarian 36, 11–20 |
| Roast Dodo | 3010013 | Culinarian 36, 21–30 |
| Starlight Log | 3010409 | Culinarian 36, 31–40 |

## Starlight 2011: Winter Is Not Coming

Actors:

| Actor | Class | Placement provenance |
|---|---:|---|
| Ninipu | 1001824 | Limsa zone 230, recovered city handoff marker |
| Hastridie | 1001825 | Gridania zone 206, recovered city handoff marker |
| Wysskoen | 1001826 | Ul'dah zone 175, recovered city handoff marker |
| Waldomar | 1001827 | Hyrstmill zone 152, authenticated spawn row 2127 |
| Father Frost | 1200265 | Hyrstmill, marker 11080108 translated from Waldomar's authenticated marker/spawn pair |

Quest flow in `Data/scripts/quests/spl/spl0i3.lua`:

1. Accept the city-specific Black Rabbit scene.
2. Deliver exactly 30 Ice Shards `1000004`.
3. Receive five Ensorcelled Snowball objective charges `11000217`.
4. Speak to Waldomar at Hyrstmill.
5. Target Father Frost and use Snowball or `/snowball` five times.
6. Report to Waldomar. `CompleteQuest(110801)` grants the SQL-authored
   Reindeer Antlers `8012502` and Reindeer Suit `8032102` once.

The client owns the recovered retail dialogue and item widget. The server owns
the shard check, counter, target/emote validation, completion, and rewards. The
full English text survives in `docs/Dat Mining/spl0i3.csv` and
`xtx_journalxtxRoc.csv`.

## Heavensturn 2012: Gone with the Snow

This profile spawns the three Black Rabbit representatives and one recovered
kadomatsu variant at each representative hub. The model identities are exact;
their coordinates are reconstructed because no retail placement owner survives.
It does not apply Starlight weather or city schedulers and does not spawn Father
Frost.

The representatives use native `processEventHin` dialogue, with different
wording depending on whether the character completed the 2011 quest. Waldomar
owns `Gone with the Snow` (`110802`):

1. Learn that Father Frost vanished without even a puddle.
2. Search the former site: depression, giant footprint, then tracks leaving the
   hamlet.
3. Play the recovered Ice Elemental Incarnate/Heart of Winter cutscene.
4. Return the dimmed Heart of Winter and complete the quest.
5. `CompleteQuest(110802)` grants the SQL-authored Dragon Kabuto `8012604`
   exactly once; the previous duplicate manual grant has been removed.

The exact three Hyrstmill clue push-object actor rows are not present in the
surviving client/server data. Until authenticated, the quest advances the three
native clue scenes from repeated Waldomar investigation prompts. This keeps the
retail sequence and cutscene intact without inventing object class IDs or
claiming guessed footprints are decompiled placements.

## Source anchors

- 2010 event and map-grid locations:
  <https://ffxiv.consolegameswiki.com/wiki/Starlight_Celebration_%282010%29>
- 2011 event:
  <https://ffxiv.consolegameswiki.com/wiki/Starlight_Celebration_%282011%29>
- 2011 primary walkthrough:
  <https://www.youtube.com/watch?v=dFUkRNwBGJw>
- 2010 primary short footage:
  <https://www.youtube.com/watch?v=QuCgiMnLsEo>
- Gone with the Snow footage:
  <https://www.youtube.com/watch?v=7lNAEkZMFd4>
- Local furnishing decomp:
  `docs/citystate_seasonal_furnishing_decomp_atlas_2026-07-03.md`
- Local patch/weather chronology:
  `docs/late_seasonal_patch_timeline_2026-07-12.md`
- Local item/actor/quest text:
  `Data/sql/gamedata_items.sql`, `Data/sql/gamedata_actor_class.sql`,
  `docs/Dat Mining/spl0i3.csv`, and `docs/Dat Mining/spl0i4.csv`

## Verification

- `dotnet build "Map Server/Map Server.csproj" --no-restore`
- Parse the changed Lua sources with the repository's MoonSharp assembly.
- Start each profile alone and confirm only its actors/quest path are present.
- 2010: visit all twelve mapped bells on their documented native pages;
  inspect ground contact, model orientation, neighboring NPCs and paths,
  and interaction range. Claim a gift, verify the interval blocks an immediate
  second claim, restart Map Server to confirm the same saved wait/count, test
  a full inventory, and exchange a Twinklebox at all six hamlets.
- 2011: test insufficient/exact 30-shard delivery, five targeted snowballs, and
  one copy each of the two SQL rewards.
- 2012: confirm no Starlight weather/Father Frost, inspect the three kadomatsu,
  run all three clue scenes, and verify one Dragon Kabuto.
