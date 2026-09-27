# The Seventh Moon's Shade / Calamity Event Archive

Source-backed implementation reference for the Final Fantasy XIV 1.x world events that led into the Seventh Umbral Calamity.

- Primary archive: [eLeMeN - `TheseventhMoon'sshade.html`](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/etc/TheseventhMoon%27sshade.html)
- Source language: Japanese
- Retrieved: 2026-07-17 (America/New_York)
- Source HTTP `Last-Modified`: 2016-01-06
- Coverage: all 22 event blocks on the page, from patch 1.17a through the post-1.23b End of an Era state

The source calls the prophecy `第七の浄化`. The surviving English client text renders its central line as “the seventh Moon's shade,” hence this document's title. English event subtitles below are working translations unless an in-game English name is independently present in the repository.

## How to read this document

- **Archive fact** means the behavior, date, coordinate, reward, or restriction is stated or pictured on the eLeMeN page.
- **Repository evidence** means a local text sheet, item/name sheet, recovered client script, SQL row, or current server implementation corroborates the archive.
- **Unknown** means the source does not provide enough information to implement the behavior faithfully. Unknown values should remain configurable or disabled rather than being invented.
- Coordinates are the source's legacy map coordinates, not reconstructed server XYZ positions.
- The page's nine `？？？` headings are given descriptive working names here, but remain explicitly marked as untitled source blocks.

The page describes these as historical special events that could no longer be replayed normally. It also warns that related GM events could begin without advance notice.

## Timeline at a glance

| # | Source window | Working event name | Primary implementation lane |
| ---: | --- | --- | --- |
| 1 | 1.17a to before 1.18 | Ominous rumors | scheduled cryers, `say`, history flag |
| 2 | 1.18 to before 1.19 | Garlean invasion warning | cryer dialogue phase, history flag |
| 3 | 1.18 to before 1.19 | Hard-won victory | three public wave battles |
| 4 | 1.18 onward | Mystery of the deaspected crystal | rare drop, Ronan exchange, history flag |
| 5 | 1.19 to before 1.20 | Northern victory | Camp Glory wave battle |
| 6 | 1.19 to before 1.20 | Victory in the forest maze | Camp Emerald Moss wave battle |
| 7 | after 1.20a, 2012-01-01, to before 1.21 | Sacrifice to Dalamud | scheduled city lure, 17-player teleport cap, private battle |
| 8 | after 1.20a, 2012-01-15, to before 1.21 | Newspaper field reporting | three item turn-ins and consumable rewards |
| 9 | after 1.20b, 2012-01-20, to before 1.23a | Wandering minstrel appears | Goobbue/minstrel event surface |
| 10 | after 1.21a, 2012-04-08, to before 1.23 | Limsa interception victory | public wave battle, rare Faded Page |
| 11 | after 1.21a, 2012-04-08, to before 1.23 | Gridania interception victory | public wave battle, rare Faded Page |
| 12 | after 1.21a, 2012-04-08, to before 1.23 | Ul'dah interception victory | public wave battle, rare Faded Page |
| 13 | after 1.21a, 2012-04-14, to before 1.23 | The true page | scheduled cryer and Urianger handoff |
| 14 | 1.23a, 2012-08-14, to before 1.23b | First fixed calamity weather | global weather phase |
| 15 | after 1.23a, 2012-08-14, onward | Bertrand and the imprisoned minstrel | triple-confirm warp/private area |
| 16 | after 1.23a, 2012-08-14, to before 1.23b | First Atomos phase | camp spawns and Deepvoid drops |
| 17 | after 1.23a, 2012-09-08, onward | Imperial elite field battles | high-level parties and rare headgear |
| 18 | 1.23b, 2012-09-13, onward | Second fixed calamity weather | global weather phase |
| 19 | 1.23b, 2012-09-13, onward | Expanded Atomos phase | Eorzea-midnight scheduler, Voidstone rewards |
| 20 | after 1.23b, 2012-09-19, onward | Cedarwood elementals | level 60/70 elemental spawns |
| 21 | after 1.23b, 2012-09-24, onward | High-level sabotenders | level 60/70 world spawns |
| 22 | after 1.23b, 2012-11-01, onward | End of an Era | final weather/BGM, invasions, `/pray`, inn-bed relics |

## Normalized event records

### 1. Ominous rumors

**Source title:** `「第七の浄化～不吉な噂～」`

**Active:** patch 1.17a through the start of patch 1.18.

- Alfgar and Roysia appeared periodically in cities or at aetherytes and used `say` to spread rumors about a suspicious Elezen identified as Urianger Augurelt, presented as a GM-controlled character.
- Alfgar appeared in Ul'dah's Merchant Strip at `(6,3)`, at the fountain near repairer Gogorano.
- Roysia appeared at Camp Bloodshore, Camp Tranquil, and Camp Horizon. The source gives no coordinates for these three appearances.
- Talking to either NPC recorded the matching Lodestone history entry.
- The history image summarizes that the player heard rumors near an aetheryte about a person predicting the destruction of the world.

### 2. Garlean invasion warning

**Source title:** `「第七の浄化～ガレマール帝国の襲来～」`

**Active:** patch 1.18 through the start of patch 1.19.

- Alfgar and Roysia retained their event role, but their dialogue changed to warnings about incoming Garlean soldiers.
- They still appeared periodically and spoke through `say`.
- Talking to either NPC recorded the matching Lodestone history entry.
- The history image says the Garleans must be destroyed before their assault reaches the cities.

### 3. Hard-won victory

**Source title:** `「第七の浄化～得がたき勝利～」`

**Active:** patch 1.18 through the start of patch 1.19.

- The battles were available while the city/camp cryers were actively warning of the invasion.
- A militia outrider enrolled players into each battle.

| Battle area | Entry NPC coordinate |
| --- | --- |
| Near Camp Bloodshore | La Noscea `(37,21)` |
| Near Camp Tranquil | Black Shroud `(37,48)` |
| Near Camp Horizon | Thanalan `(13,26)` |

- Winning recorded the matching Lodestone history entry.
- The history image confirms defeat of the attacking Garlean force and warns that further attacks may follow.
- The source does not give party limits, enemy compositions, levels, respawn cadence, battle duration, or failure rules.

### 4. Mystery of the deaspected crystal

**Source title:** `「第七の浄化～属性を失ったクリスタルの謎～」`

**Active:** patch 1.18 onward, with a drop-rule change at 1.18.

- Beginning in patch 1.17a, players could very rarely receive a Deaspected Crystal in place of a normal crystal.
- From patch 1.18 onward, the source says the item was obtainable only from battles related to `第七の浄化`.
- Ronan Kognan stood in Gridania at `(5,5)`.
- Exchange rates:
  - `1` Deaspected Crystal -> `10` shards. The archive uses wording that can mean each available shard choice; the recovered English client text confirms a ten-shard payout but not the selected element.
  - `30` Deaspected Crystals -> `1` Peregrine Helm.
- Receiving the Peregrine Helm recorded the matching Lodestone history entry.
- The history image says Ronan was investigating why crystals had lost their elemental aspect.
- Unknown: which shard types were offered, how the player selected one, and whether any element-specific restrictions applied.

### 5. Northern victory

**Source title:** `「第七の浄化～北方の勝利～」`

**Active:** patch 1.19 through the start of patch 1.20.

The Camp Glory battle was active while the three city cryers were speaking about the Garlean attack.

| Cryer | Source location |
| --- | --- |
| Saintrelmaux | Limsa Lominsa Upper Decks `(7,5)`, west edge of the plaza outside the Adventurers' Guild |
| Hadrian | Gridania `(7,6)`, before the slope near the Adventurers' Guild |
| Bloehyr | Ul'dah Merchant Strip `(6,3)`, fountain near Gogorano |

- Entry NPC: militia outrider, Coerthas `(53,29)`.
- Battle area: near Camp Glory.
- Winning recorded the matching Lodestone history entry.
- The history image says the Garleans were destroyed near Camp Glory and predicts intensifying attacks.

### 6. Victory in the forest maze

**Source title:** `「第七の浄化～森の迷宮における勝利～」`

**Active:** patch 1.19 through the start of patch 1.20.

- Cryers: Alfgar in Gridania `(6,5)` and Roysia in the Black Shroud `(20,20)`.
- Battle area: near Camp Emerald Moss.
- Entry NPC: militia outrider, Black Shroud `(17,20)`.
- Winning recorded the matching Lodestone history entry.
- The history image says the Garleans were destroyed near Camp Emerald Moss and predicts intensifying attacks.

### 7. Sacrifice to Dalamud

**Source title:** `「「救世神ダラガブ」への生贄」`

**Active:** after patch 1.20a on 2012-01-01 through the start of patch 1.21.

This was a scheduled city-to-private-battle event involving the Lambs of Dalamud (`最後の群民`).

**Alfgar spawn points**

| City | Coordinate and landmark |
| --- | --- |
| Limsa Lominsa Upper Decks | `(7,5)`, west edge of the plaza outside the Adventurers' Guild |
| Gridania | `(7,6)`, before the slope near the Adventurers' Guild |
| Ul'dah Merchant Strip | `(6,3)`, fountain near Gogorano |

**Aetherial node spawn points**

| City | Coordinate and landmark |
| --- | --- |
| Limsa Lominsa Lower Decks | `(7,5)`, near the Mizzenmast first-floor chocobo stables |
| Gridania | `(6,5)`, Gridania Landing |
| Ul'dah Merchant Strip | `(7,5)`, dead end south of Sapphire Avenue Exchange |

**Destination and entry flow**

- While Alfgar was present, an aetherial node appeared in the same city.
- The node sent the player to one of two destinations, which was not revealed until after the warp:
  - Mistbeard Cove `(4,5)`.
  - Copperbell Mines, Antling nesting area `(8,3)`.
- Milburh stood at the destination coordinate and enrolled players into the battle.
- Once `17` players had warped, Alfgar and the node disappeared. The page does not say whether 17 was a per-city, per-destination, per-instance, or global cap.

**Recorded real-world schedule**

- The source records clock-hour groups `11 (+12/+13)`, `22 (+23/+0)`, and `2 (+3/+4)`.
- Alfgar and the node appeared at minute `00`, `05`, or `10` in a given opportunity.
- The third opportunity sometimes did not occur.
- The city and destination remained fixed within each time block.
- The archive does not state the observer's time zone. Do not hardcode these wall-clock values without a configurable time-zone policy.

**Completion evidence**

- The Mistbeard history image names survival of the rite in Mistbeard Cove.
- The second history image names survival of the rite in the Sil'dih Aqueduct, even though the page's warp destination is Copperbell Mines. This is likely the private-area identity behind the Copperbell entrance and must not be flattened into a second Mistbeard completion.
- The prose beneath both outcomes repeats the Sil'dih title, apparently a copy/paste error; the two screenshots are the stronger discriminator.
- Unknown: enemy composition, level sync, battle timer, exact private-area IDs, wipe handling, and whether the FFXIV history flag was set on battle clear or exit.

### 8. Newspaper field reporting

**Source title:** `「雑誌編集部員として取材協力しました！」`

**Active:** after patch 1.20a on 2012-01-15 through the start of patch 1.21.

| Reporter | Location | Cost | Reward |
| --- | --- | ---: | --- |
| Petyr Winsome, The Harbor Herald | Limsa Lominsa Upper Decks `(7,4)`, north of the Adventurers' Guild | 3 Mole Meat | 20 Magicked Prisms (Harbor Herald) |
| Kipih Jakkya, The Raven | Gridania `(6,5)`, near the chocobo stables | 3 Mole Meat | 20 Magicked Prisms (The Raven) |
| Dural Tharal, The Mythril Eye | Ul'dah Merchant Strip `(6,3)`, north of Ruby Road Exchange | 3 Mole Meat | 20 Magicked Prisms (Mythril Eye) |

- Using a prism recorded the corresponding Lodestone history entry.
- Three separate histories existed, one for each publication.
- These histories were identical to ones obtainable from the items distributed during the related GM event.
- Unknown: repeatability, inventory-full behavior, whether all three histories could be earned on one character, and whether the prism was consumed on use.

### 9. Wandering minstrel appears

**Source heading:** `？？？`

**Active:** after patch 1.20b on 2012-01-20 through the start of patch 1.23a.

- The wandering minstrel appeared in La Noscea at `(36,25)`.
- The archive links this appearance to the Goobbue mount event but does not restate its level requirement, dialogue, or reward mechanics.
- Repository text independently identifies the NPC's level-30 presentation path; that is corroborating evidence, not a fact copied from this page.

### 10. Limsa Lominsa interception victory

**Source title:** `「第七の浄化～海都迎撃戦の勝利～」`

**Active:** after patch 1.21a on 2012-04-08 through the start of patch 1.23.

- Cryers: Alfgar at Limsa Lominsa Upper Decks `(7,5)` and Roysia in La Noscea `(25,29)`.
- Battle area: near Camp Bearded Rock.
- Entry NPC: militia outrider, La Noscea `(26,31)`.
- A post-battle treasure chest could rarely contain a Faded Page.
- Winning recorded the matching Lodestone history entry.

### 11. Gridania interception victory

**Source title:** `「第七の浄化～森都迎撃戦の勝利～」`

**Active:** after patch 1.21a on 2012-04-08 through the start of patch 1.23.

- Cryers: Saintrelmaux in Gridania `(7,6)` and Hadrian in the Black Shroud `(34,32)`.
- Battle area: near Camp Bentbranch.
- Entry NPC: militia outrider, Black Shroud `(25,28)`.
- A post-battle treasure chest could rarely contain a Faded Page.
- Winning recorded the matching Lodestone history entry.

### 12. Ul'dah interception victory

**Source title:** `「第七の浄化～砂都迎撃戦の勝利～」`

**Active:** after patch 1.21a on 2012-04-08 through the start of patch 1.23.

- Cryers: Bloehyr at Ul'dah Merchant Strip `(6,3)` and Elvide in Thanalan `(27,25)`.
- Battle area: near Camp Black Brush.
- Entry NPC: militia outrider, Thanalan `(25,26)`.
- A post-battle treasure chest could rarely contain a Faded Page.
- Winning recorded the matching Lodestone history entry.

### 13. The true page

**Source title:** `「第七の浄化～真実の紙片～」`

**Active:** after patch 1.21a on 2012-04-14 through the start of patch 1.23.

Ziuz Amariyo appeared in a city and used `say` to discuss an Archon warning of the Calamity. Urianger appeared in the adjacent field while Ziuz was active.

**Ziuz Amariyo spawn points**

| City | Coordinate and landmark |
| --- | --- |
| Limsa Lominsa Upper Decks | `(7,4)`, north of the Adventurers' Guild |
| Gridania | `(6,5)`, near the chocobo stables |
| Ul'dah Merchant Strip | `(6,3)`, north of Ruby Road Exchange |

**Urianger spawn points**

| Region | Coordinate and landmark |
| --- | --- |
| La Noscea | `(22,29)`, on the cape beyond the cave at `(23,28)` |
| Black Shroud | `(30,35)`, inside a cave |
| Thanalan | `(21,23)`, inside a cave |

- Talking to Urianger while carrying a Faded Page recorded the matching Lodestone history entry.
- The history image summarizes that the player found part of a notebook dropped by Urianger and that the danger described by the Calamity-speaking Archon was drawing closer.
- Unknown: whether the Faded Page was consumed, whether Urianger's branch depended on which city was active, and the exact scheduler/despawn behavior.

### 14. First fixed calamity weather

**Source heading:** `？？？`

**Active:** patch 1.23a on 2012-08-14 through the start of patch 1.23b.

- Eorzea's weather was globally locked to the source's `weather17.png` icon, a blue/purple comet-like state.
- The source supplies an icon but no text name or numeric client weather ID.
- Current repository candidates include the historical/final special-weather resource lanes, especially `8030 / wtr_comp`, but this page alone does not prove the mapping.

### 15. Bertrand and the imprisoned minstrel

**Source heading:** `？？？`

**Active:** after patch 1.23a on 2012-08-14, with no end stated on the page.

- Bertrand replaced the wandering minstrel's field position in La Noscea `(36,25)`.
- Talking to Bertrand and choosing `Yes`, `Yes`, `Yes` sent the player to the area where the wandering minstrel was imprisoned.
- Unknown: destination/private-area ID, whether the triple confirmation had failure branches, and the exit route.

### 16. First Atomos phase

**Source heading:** `？？？`

**Active:** after patch 1.23a on 2012-08-14 through the start of patch 1.23b.

Atomos began appearing at:

- Mor Dhona: Camp Brittlebark.
- Mor Dhona: Camp Revenant's Toll.
- Coerthas: Camp Ever Lakes.
- Coerthas: Camp Glory.
- Thanalan: Camp Bluefog.

While Atomos was present, the following Deepvoid enemies could appear and rarely drop an Over-aspected Crystal:

- Deepvoid Warrior.
- Deepvoid Scamp.
- Deepvoid Soul.

The source gives no Atomos spawn hour for this first phase, no combat behavior, no despawn rule, and no drop rate.

### 17. Imperial elite field battles

**Source heading:** `？？？`

**Active:** after patch 1.23a on 2012-09-08, with no end stated on the page.

- Special battles appeared around Camp Iron Lake, Camp Dragonhead, Camp Crimson Bark, and Camp Broken Water.
- The target party was one of:
  - a Magitek Vanguard H-I party;
  - an Imperial Centurion party;
  - a party of enemies with `Elite`-prefixed names.
- Defeating one of these parties could rarely reward an Imperial Operative Tricorne or Imperial Operative Hat.
- Unknown: exact party rosters, levels, spawn positions, cadence, loot ownership, and drop rates.

### 18. Second fixed calamity weather

**Source heading:** `？？？`

**Active:** patch 1.23b on 2012-09-13, with no end stated on the page.

- Eorzea's weather was globally locked to the source's `weather18.png` icon, a red/orange Dalamud-like state.
- The page supplies no text name or numeric client weather ID.
- `8032 / wtr_xmas` is a strong final-client Dalamud-thunder lane in current repository evidence, but the icon-to-ID mapping still requires direct visual confirmation.

### 19. Expanded Atomos phase

**Source heading:** `？？？`

**Active:** patch 1.23b on 2012-09-13, with no end stated on the page.

**Additional Atomos camps**

- Coerthas: Camp Dragonhead.
- Black Shroud: Camp Emerald Moss.
- Black Shroud: Camp Crimson Bark.
- Thanalan: Camp Black Brush.
- Thanalan: Camp Horizon.

**Behavior and travel**

- Atomos at the original five camps became aggressive to nearby player characters.
- Teleport to the original five camps cost `0` anima: Brittlebark, Revenant's Toll, Ever Lakes, Glory, and Bluefog.
- Atomos appeared at Eorzea time `00:00`.

**Voidstone reward flow**

- Killing Atomos spawned a Voidstone at the death location.
- The first Atomos kill only awarded one Over-aspected Cluster when the Voidstone was examined.
- The source then describes examining the stone twice and receiving one of these outcomes:
  - `5` or `7` Over-aspected Crystals;
  - `20` or `40` anima restored;
  - Quick for `30 minutes`;
  - Heavy for `90 seconds`.
- The wording does not fully specify whether the random outcome is always the second interaction, whether the cluster consumes the first interaction, or how repeat kills behave. This needs client-script or packet confirmation.

**New Deepvoid enemies**

These appeared only at the zero-anima teleport camps while Atomos was active:

- Deepvoid Watcher.
- Deepvoid Pikeman.
- Deepvoid Wizard.
- Deepvoid Slave.
- Deepvoid Sludge.

### 20. Cedarwood elementals

**Source heading:** `？？？`

**Active:** after patch 1.23b on 2012-09-19, with no end stated on the page.

- Level-60-range and level-70-range elementals appeared in Cedarwood.
- Types: Fire, Ice, Lightning, Water, Wind, and Earth Elemental.
- Unknown: exact levels, coordinates, spawn groups, conditions, and loot.

### 21. High-level sabotenders

**Source heading:** `？？？`

**Active:** after patch 1.23b on 2012-09-24, with no end stated on the page.

- Level-60-range and level-70-range sabotenders appeared in multiple unspecified regions.
- Types: Sabotender and Sabotender del Sol.
- Unknown: regions, exact levels, coordinates, spawn groups, conditions, and loot.

### 22. End of an Era

**Source title:** `時代の終焉`

**Active:** after patch 1.23b on 2012-11-01. The page does not state the final shutdown date.

**World state from 2012-11-01**

- Eorzea's weather was globally locked to the source's `weather19.png` icon, a more intense red/orange Dalamud-like state.
- BGM changed throughout Eorzea, excluding towns, chocobo travel, and other unspecified exceptions.
- Teleport to the five additional Atomos camps cost `0` anima: Dragonhead, Emerald Moss, Crimson Bark, Black Brush, and Horizon.
- Deepvoid Butcher was added to the Atomos-associated enemy pool.
- Hostile enemies began appearing outside and inside Ul'dah.

**Maintenance-driven changes**

- 2012-11-03: enemy behavior changed after maintenance. The page does not describe the delta.
- 2012-11-05: enemy behavior changed again after maintenance. The page does not describe the delta.

**Special `/pray` behavior from 2012-11-05**

- Used on a player character: removed Weakness and reduced abilities with a 15-minute recast to a 3-minute recast.
- Used on an enemy: immediately incapacitated the praying player.
- Unknown: range, target eligibility, party restrictions, spam/recast protection, whether all Weakness variants were removed, and whether “reduced to 3 minutes” means remaining recast was clamped or the base recast was temporarily changed.

**Inn-bed relic reward from 2012-11-05**

- Log out from an inn bed for at least `30 minutes`.
- On the next login, inspect the bed and choose `Examine the bed`.
- A special item could then be received from this set:
  - Curtana.
  - Holy Shield.
  - Sphairai.
  - Bravura.
  - Gae Bolg.
  - Artemis Bow.
  - Thyrus.
  - Stardust Rod.
- Unknown: random versus selected reward, one-time versus repeatable grant, job/class eligibility, inventory-full handling, and whether the sword and shield could be paired.

## History and screenshot evidence

The archive contains 15 history/play-log images. Their implementation value is summarized here without treating the player name or blank date fields as data.

| Image | History outcome established by the image |
| --- | --- |
| `playlog1` | heard the ominous aetheryte rumor |
| `playlog2` | received warning of a Garlean assault |
| `playlog3` | defeated the attacking Garlean force |
| `playlog4` | exchanged deaspected crystals for a Peregrine Helm; Ronan is investigating |
| `playlog5` | defeated the Camp Glory Garleans |
| `playlog6` | defeated the Camp Emerald Moss Garleans |
| `playlog7` | survived the Lambs of Dalamud rite in Mistbeard Cove |
| `playlog8` | survived the Lambs of Dalamud rite in the Sil'dih Aqueduct |
| `gmevent_playlog2` | acted as Harbor Herald editorial staff |
| `gmevent_playlog1` | acted as The Raven editorial staff |
| `gmevent_playlog3` | acted as Mythril Eye editorial staff |
| `playlog9` | repelled the army advancing toward Limsa Lominsa |
| `playlog10` | repelled the army advancing toward Gridania |
| `playlog11` | repelled the army advancing toward Ul'dah |
| `playlog12` | found a page connected to Urianger and the Calamity warning |

The page also carries portraits for Alfgar, the three reporters, and an inventory tooltip for the Deaspected Crystal. See the complete media index below.

## Repository-backed actor and object names

These are `xtx_displayName.csv` sheet IDs, not guaranteed spawn actor-class IDs. They provide authoritative English spellings and a search key for implementation.

| Sheet ID | Japanese | English |
| ---: | --- | --- |
| `1000280` | アルフガル | Alfgar |
| `1100415` | ロイシア | Roysia |
| `1400169` | ロナン・コグナン | Ronan Kognan |
| `1200222` | サントレルモ | Saintrelmaux |
| `1000133` | ハドリアン | Hadrian |
| `1600043` | ブルーヒル | Bloehyr |
| `4000612` | ミリシア偵察要員 | militia outrider |
| `1100095` | ミルブル | Milburh |
| `1000434` | ピーター・ウィンソム | Petyr Winsome |
| `1900271` | キピ・ジャッキヤ | Kipih Jakkya |
| `1400220` | デュラル・ザラル | Dural Tharal |
| `1000436` | 異邦の詩人 | wandering minstrel |
| `1300107` | エルビド | Elvide |
| `1900229` | ジュズ・アマリヨ | Ziuz Amariyo |
| `1200023`, `2700002` | ウリエンジェ | Urianger |
| `2700003` | ウリエンジェ・オギュレ | Urianger Augurelt |
| `1000052` | バートランド | Bertrand |
| `4010016` | エーテリアルノード | aetherial node |
| `3111001`-`3111004` | アトモス | Atomos |
| `4010033` | ヴォイドストーン | voidstone |

Important actor-class leads already in `gamedata_actor_class.sql` include Atomos/Animaobj classes in the `21110xx` family and Deepvoid monster classes in the `210xxxx` family. Exact spawn-class selection remains a separate audit.

## Repository-backed item IDs

| Item ID | English name | Event use on the archive page |
| ---: | --- | --- |
| `10012013` | Deaspected Crystal | Ronan exchanges; earlier Calamity battle drop |
| `8012102` | Peregrine Helm | 30-crystal exchange and history trigger |
| `3011014` | Mole Meat | reporter turn-in, 3 per reward |
| `3020607` | Magicked Prism (Harbor Herald) | reporter reward, quantity 20 |
| `3020609` | Magicked Prism (The Raven) | reporter reward, quantity 20 |
| `3020608` | Magicked Prism (Mythril Eye) | reporter reward, quantity 20 |
| `10012029` | Faded Page | rare interception chest item; Urianger possession gate |
| `8013636` | Imperial Operative Tricorne | rare imperial field-battle reward |
| `8013637` | Imperial Operative Hat | rare imperial field-battle reward |
| `3020537` | Over-aspected Crystal | Deepvoid drop and Voidstone reward |
| `3020413` | Over-aspected Cluster | first Atomos/Voidstone reward |
| `4030602` | Curtana | inn-bed End of an Era reward |
| `4100810` | Holy Shield | inn-bed End of an Era reward |
| `4020402` | Sphairai | inn-bed End of an Era reward |
| `4040502` | Bravura | inn-bed End of an Era reward |
| `4080502` | Gae Bolg | inn-bed End of an Era reward |
| `4070402` | Artemis Bow | inn-bed End of an Era reward |
| `5030402` | Thyrus | inn-bed End of an Era reward |
| `5020402` | Stardust Rod | inn-bed End of an Era reward |

## Repository-backed enemy display IDs

These display IDs corroborate the archive's English enemy names. Several have more than one actor class or variant, so do not use the display ID alone as a spawn prescription.

| Display ID | Enemy |
| ---: | --- |
| `3101910` | Deepvoid Warrior |
| `3102612` | Deepvoid Scamp |
| `3104326` | Deepvoid Soul |
| `3101714` | Deepvoid Watcher |
| `3101819` | Deepvoid Pikeman |
| `3101820` | Deepvoid Wizard |
| `3102507` | Deepvoid Slave |
| `3103405` | Deepvoid Sludge |
| `3103503` | Deepvoid Butcher |
| `3109002` | Magitek Vanguard H-I |
| `3100905`-`3100906` | Sabotender |
| `3100907`-`3100908` | Sabotender del Sol |

The elemental display-name families begin at `3104601` (fire), `3104701` (ice), `3104801` (wind), `3104901` (earth), `3105001` (lightning), and `3105101` (water), with multiple level/body variants in each family.

## Existing client and server implementation leads

The archive should be implemented against the recovered client contract rather than from prose alone.

| Event lane | Strongest local evidence | Current implication |
| --- | --- | --- |
| Garlean public wave battles | `docs/Dat Mining/populaceWaveAttack.csv`, `populaceWaveAttackCryer.csv`; recovered `populacewaveattack.lua` and `populacewaveattackcryer.lua` | Client methods already expose entry, accept/reject, full-member, leave, win, cryer phase, win, and lose branches. Runtime copies are not present under `Data/scripts/base/chara/npc/populace`. |
| Lambs of Dalamud teleport event | `populaceGMEventTelepoTownCryer.csv`, `TelepoLure.csv`, `TelepoReception.csv`, `TelepoGateIn.csv`, `TelepoGateOut.csv`; matching recovered Lua | The client contract separates city cryer, lure, reception/capacity, and in/out gate actors. Reception includes entry, accept/reject, standby, full-member, and debug methods. |
| Urianger/Faded Page event | `populaceGMEventSageCryer.csv`, `populaceGMEventSage.csv`; matching recovered Lua | Separate cryer and sage methods survive, including multiple Urianger talk states. |
| Newspaper reporters | `populaceGMEventTownReporter.csv`; recovered `populacegmeventtownreporter.lua` | Three reporter pairs of methods survive, matching the three publications. |
| Wandering minstrel/prison | local `PopulaceBountyPresenter.lua`, `populaceBountyPresenter.csv`, `populaceTownCryer.csv`; recovered `populacetowncryer.lua` | Bounty presenter has already-present, low-level, before/after presentation, and jail branches; the large town-crier runtime surface is still absent locally. |
| Ronan exchange | `Data/scripts/quests/dft/DftFst.lua`, `dftFst.csv` | Ronan is explicitly marked not implemented; recovered calls show normal, crystal-bearing, enough-for-helm, already-owned, and lore-hint states. |
| Bertrand route | `Data/scripts/quests/etc/etc5l1.lua` plus `populaceTownCryer.csv` | A quest Bertrand actor already exists, but the archive's post-1.23a prison warp is a distinct event state and should not be assumed to use the same actor class or destination. |
| Atomos and Deepvoid | `gamedata_actor_class.sql`, `xtx_displayName.csv`, current over-aspected item rows | Actor/model families survive. The page still leaves scheduler, camp XYZ placements, director, and Voidstone interaction semantics unresolved. |
| Atomos currency exchange | `Data/scripts/base/chara/npc/populace/PopulaceSpecialEventCryer.lua` | Local code already references item `3020537` and cluster `3020413` for the 2012 Atomos-adjacent exchange lane; validate costs, consumption, caps, and entitlement before enabling. |
| Calamity weather | `Map Server/Packets/Send/SetWeatherPacket.cs`; weather datamine documents | Current constants include `8030 / wtr_comp` and `8032 / wtr_xmas` (final-client Dalamud Thunder). The three archive icons still require a snapshot-aware visual mapping. |
| `/pray` | recovered `chara/npc/mapobj/pray12gods.lua` surface; `gamedata_actor_class.sql` row `1080136` | A client map-object surface survives, but no local runtime script currently implements the End of an Era target effects. |

Recovered client scripts referenced above are under:

`tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace/`

## Suggested implementation order

1. Add one server-side Calamity phase/config controller. It should select the active historical phase without tying behavior to the original 2011-2012 calendar.
2. Restore the generic recovered populace scripts into the runtime with safe inventory and capacity checks.
3. Implement the wave-battle director once, then data-drive the six page variants by cryer set, entry actor, battle region, history marker, and optional chest table.
4. Implement the Lambs of Dalamud teleport event as a separate capacity-limited scheduler with two private destinations.
5. Finish the Ronan exchange and reporter turn-ins with atomic cost removal, inventory preflight, one-time history state, and duplicate-reward policy.
6. Implement the Ziuz/Urianger scheduler and Faded Page possession branch.
7. Add Atomos as a camp-scoped Eorzea-time event with explicit phase-dependent aggression, Deepvoid pools, zero-anima travel, and a transactional Voidstone reward state.
8. Add the three global weather/BGM stages only after live mapping of `weather17`, `weather18`, and `weather19` to snapshot-correct client resource IDs.
9. Treat the final Ul'dah invasion, `/pray`, and inn-bed relic grant as an opt-in End of an Era phase with audit logging and one-time reward protection.

## Implementation checklist

### Shared control plane

- [ ] Add a configurable Calamity phase enum covering all 22 archive blocks.
- [ ] Allow independent enablement of history emulation, rewards, global weather, BGM, free teleport, and invasion spawns.
- [ ] Persist one-time character rewards and history outcomes.
- [ ] Make original real-world schedules time-zone configurable.
- [ ] Ensure phase changes despawn obsolete cryers, nodes, battle groups, Atomos, Voidstones, and invasion enemies.

### Public wave battles

- [ ] Restore `PopulaceWaveAttack` and `PopulaceWaveAttackCryer` runtime surfaces.
- [ ] Reconstruct legacy XYZ positions from every source map coordinate.
- [ ] Recover enemy group compositions, levels, timers, capacity, success, and failure rules.
- [ ] Add the 1.21a treasure chest and configurable Faded Page rare-drop rate.
- [ ] Keep each city history marker independent.

### Lambs of Dalamud

- [ ] Restore the five recovered teleport-event populace surfaces.
- [ ] Resolve the Mistbeard and Sil'dih/Copperbell private-area IDs and exit routes.
- [ ] Determine the exact scope of the 17-player cap.
- [ ] Confirm schedule time zone and the semantics of the optional third occurrence.
- [ ] Recover cultist groups, battle rules, and per-destination history markers.

### Exchanges and history

- [ ] Complete Ronan's Deaspected Crystal selector and atomic exchange.
- [ ] Implement all three reporter turn-ins and prism use effects.
- [ ] Implement the Faded Page possession/consumption decision from recovered sage logic.
- [ ] Decide how retired Lodestone histories are represented locally: achievement, character flag, journal record, or a dedicated legacy-history table.

### Atomos and End of an Era

- [ ] Recover camp XYZ spawn points for Atomos and all Deepvoid groups.
- [ ] Confirm Atomos lifetime and whether the first phase also spawned at Eorzea midnight.
- [ ] Implement phase-dependent aggression and Deepvoid pools.
- [ ] Reconstruct Voidstone first-kill and second-interaction persistence.
- [ ] Recover Imperial elite party rosters and rare headgear rates.
- [ ] Recover Cedarwood elemental and world sabotender spawn positions/levels.
- [ ] Map all three archive weather icons to snapshot-correct resource IDs.
- [ ] Recover final BGM resource/area exception rules.
- [ ] Reconstruct the 11/03 and 11/05 invasion behavior deltas.
- [ ] Implement `/pray` with explicit target and recast semantics.
- [ ] Determine inn-bed relic selection, eligibility, pairing, and repeatability.

## Source uncertainties that must remain visible

1. The archive gives map coordinates but no world XYZ positions.
2. “Rarely” is never quantified for crystals, pages, headgear, or any chest/drop.
3. The archive records real-world clock hours for the Dalamud sacrifice event without naming a time zone.
4. The Copperbell entrance versus Sil'dih history title must be resolved through private-area data, not editorial guesswork.
5. The three fixed-weather states are images without textual or numeric IDs.
6. The first-kill and second-examination Voidstone state machine is not fully specified.
7. The 2012-11-03 and 2012-11-05 enemy behavior changes are only linked to now-retired Lodestone news entries.
8. The End of an Era bed reward does not state selection, randomness, repeatability, or job eligibility.
9. The page does not define an end date for post-1.23b blocks.

## Complete source media index

The HTML points at a retired `ff14_archives` image root. The equivalent files remain available under the dated archive root used below.

### NPC and item images

- [Alfgar portrait](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_Alfgar.gif)
- [Deaspected Crystal tooltip](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_DeaspectedCrystal.gif)
- [Petyr Winsome portrait](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_PetyrWinsome.gif)
- [Kipih Jakkya portrait](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_KipihJakkya.gif)
- [Dural Tharal portrait](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_DuralTharal.gif)

### History/play-log images

- [playlog1](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog1.gif)
- [playlog2](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog2.gif)
- [playlog3](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog3.gif)
- [playlog4](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog4.gif)
- [playlog5](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog5.gif)
- [playlog6](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog6.gif)
- [playlog7 - Mistbeard](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog7.gif)
- [playlog8 - Sil'dih](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog8.gif)
- [Harbor Herald GM-event history](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/gmevent_playlog2.gif)
- [The Raven GM-event history](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/gmevent_playlog1.gif)
- [Mythril Eye GM-event history](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/gmevent_playlog3.gif)
- [playlog9 - Limsa](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog9.gif)
- [playlog10 - Gridania](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog10.gif)
- [playlog11 - Ul'dah](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog11.gif)
- [playlog12 - true page](http://elemen.sakura.ne.jp/ff14_dated_archives/img/gamecontents/etc/TheseventhMoon%27sshade_playlog12.gif)

### Weather icons

- [`weather17.png`](http://elemen.sakura.ne.jp/ff14_dated_archives/img/materials/weather17.png) - fixed from 1.23a until 1.23b.
- [`weather18.png`](http://elemen.sakura.ne.jp/ff14_dated_archives/img/materials/weather18.png) - fixed from 1.23b.
- [`weather19.png`](http://elemen.sakura.ne.jp/ff14_dated_archives/img/materials/weather19.png) - fixed for End of an Era from 2012-11-01.

## Local evidence paths

- `docs/Dat Mining/xtx_displayName.csv`
- `docs/Dat Mining/xtx_itemName.csv`
- `docs/Dat Mining/populaceWaveAttack.csv`
- `docs/Dat Mining/populaceWaveAttackCryer.csv`
- `docs/Dat Mining/populaceGMEventTelepoTownCryer.csv`
- `docs/Dat Mining/populaceGMEventTelepoLure.csv`
- `docs/Dat Mining/populaceGMEventTelepoReception.csv`
- `docs/Dat Mining/populaceGMEventTelepoGateIn.csv`
- `docs/Dat Mining/populaceGMEventTelepoGateOut.csv`
- `docs/Dat Mining/populaceGMEventSageCryer.csv`
- `docs/Dat Mining/populaceGMEventSage.csv`
- `docs/Dat Mining/populaceGMEventTownReporter.csv`
- `docs/Dat Mining/populaceTownCryer.csv`
- `docs/Dat Mining/populaceBountyPresenter.csv`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace/`
- `Data/scripts/quests/dft/DftFst.lua`
- `Data/scripts/quests/etc/etc5l1.lua`
- `Data/scripts/base/chara/npc/populace/PopulaceBountyPresenter.lua`
- `Data/scripts/base/chara/npc/populace/PopulaceSpecialEventCryer.lua`
- `Data/sql/gamedata_actor_class.sql`
- `Map Server/Packets/Send/SetWeatherPacket.cs`
- `docs/weather_deep_datamine_atlas_2026-07-08.md`
- `docs/historical_seasonal_patch_recovery_2026-07-12.md`
