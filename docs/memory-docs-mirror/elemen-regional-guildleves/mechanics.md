# How FFXIV 1.x Regional Guildleves Work

This is a mechanics companion to the 371-record eLeMeN regional-guildleve extraction. It describes the **late FFXIV 1.x rules represented by the dated archive**, not A Realm Reborn's modern leve system.

Primary source: [eLeMeN guildleve FAQ](http://elemen.sakura.ne.jp/ff14_dated_archives/etc/playguide/faq_guildleve.html). Individual encounter flows come from the ten [regional-guildleve archive pages](http://elemen.sakura.ne.jp/ff14_dated_archives/guildleve/regional/index.html).

## The basic loop

1. Receive or spend a leve allowance at the appropriate publisher.
2. Hold the leve plate in the Journal.
3. Travel to the named camp/aetheryte or, for company leves, speak to the on-site issuing NPC.
4. Choose difficulty for an ordinary regional leve, then start the timed duty.
5. Complete the leve-specific objective: defeat packs, collect key items, inspect or gather from points, escort/protect an NPC, identify disguised enemies, or trigger scripted follow-up waves.
6. Finish within the contract time and collect gil/items/EXP; faction and company variants add their own currencies or conditions.

Failure does not automatically make the leve free to retry. The FAQ says a retry consumes **one more allowance**. A leve can also be abandoned from its Journal detail page regardless of completion/failure state.

## Allowances, inventory limits, and list refresh

- **4 allowances every 12 real-world hours**.
- **99 allowances maximum**.
- The allowance pool is shared by regional, local, faction, and company leves.
- A character may hold up to **8 regional** and **8 local** leves at once.
- At the cap, unwanted plates can be returned to a guildleve counter NPC.
- A publisher's offered-leve list refreshes when allowances are granted and when a leve succeeds or fails.

Regional publishers listed by the archive:

| City | NPC | Position |
|---|---|---|
| Limsa Lominsa | Piralnaut (`ピラルノー`) | Upper Decks X:7, Y:5 |
| Gridania | Gontrant (`ゴントラン`) | X:6, Y:6 |
| Ul'dah | Totonowa (`トトノワ`) | Merchant Strip X:6, Y:4 |

## Difficulty, enemy level, and completion EXP

- At **difficulty ★1**, leve monsters are the leve's recommended level.
- Every additional star raises monster level by **3**. Therefore `enemy level = recommended level + 3 × (stars − 1)`.
- Completion awards EXP. Higher difficulty and faster completion add EXP bonuses.
- The archive warns that changing class during the leve or completing it at **recommended level +11 or higher** reduces completion EXP.
- If the class used at completion does not match the leve's listed recruiting class, completion EXP is not awarded.
- The leve owner and a player participating through leve share do not receive identical EXP.
- A red wax seal marks a regional leve completed before.

## Leve share and leve link

If party members hold the same leve, the FAQ says they can access the aetheryte after the duty begins and use their copies together as a **leve link**, allowing linked holders to receive the success reward. For shared leves, each link adds a small amount of completion EXP, up to **7 links**.

The source distinguishes the owner from shared participants for EXP calculation. Company leves are the explicit exception: they are solo and cannot be shared or linked.

## Reading encounter and spawn flow

Each record preserves eLeMeN's exact `概要` (overview/objective) and adds an English mechanical gloss. Common source notation:

| Source notation | Meaning |
|---|---|
| `【敵1体】×3` | Three separate one-enemy targets/packs |
| `【敵2体PT】×2` | Two parties/packs, each containing two of that enemy |
| `倒すと…追加` | Defeating the stated target/pack spawns the next target or pack |
| `追加×2回` | Repeat that follow-up spawn twice |
| `N体目戦闘中に1体逃げ` | During combat with the Nth target, one flees; the following text says what is added or pursued |
| `…からアイテム3個` | Obtain three objective items from the named target/pack |
| `当たり探し` / `…に変化` | Search among decoys; the correct target reveals or transforms into the real enemy |
| `調べる` | Interact with/inspect a target or point rather than simply kill it |
| `護衛` / `保護` | Escort or protect an NPC; enemy waves may be tied to route/progress triggers |

`PT` means a linked enemy party/pack, not the player party. Multipliers apply to the bracketed unit. When a row says a pack is added “after defeating” another pack, that is a sequential spawn gate rather than an initially present group.

## Battlecraft regional leves

Battlecraft leves are the ordinary combat lane for Disciples of War and Magic. The archive covers three city-state publishers and their camp ladders. Objectives include:

- fixed packs present together;
- sequential waves spawned after kills;
- fleeing targets that lead into replacement packs;
- key-item drops from specified parties;
- decoy or transformation searches;
- defense, escort, rescue, and route-clear objectives.

The source notes that leve monsters changed in Patch 1.18 and their levels changed in Patch 1.19. A gray objective cell means eLeMeN had **not reconfirmed that overview after Patch 1.19**; those rows retain an explicit warning in this archive.

## Fieldcraft regional leves

Fieldcraft leves are regional work for **Miner, Botanist, and Fisher**. The catalog keeps each discipline as a separate table within a camp. Objectives state the requested gathering activity, number/type of gathering points or catches, and any required item. They consume the same shared allowances and count against the regional holding limit.

The client rows preserve two practical families. Fifty-four request an exact
temporary leve item, three successful points/items per leve. The other
forty-five ask the player to survey two or three mineral deposits, mature trees,
or fishing holes and explicitly do not care which ordinary result is obtained.
The source names the field area but does not publish individual world
coordinates or a separate fishing map coordinate. The server therefore places
stable private circles/actors for Miner and Botanist at existing area points or
nearby walkable coordinates. Fisher does not receive a circle or clickable
fishing actor: an ordinary free-water cast in the leve's server-resolved named
area receives the active leve's catch override. Exact leve fish have a dominant
configurable roll while ordinary regional fish remain possible bycatch. Each
player's cast transaction is private, and only members of the same intentional
leve director share its objective counter. See
[Server implementation](server-implementation.md) for the evidence split,
fieldcraft EXP policy, and the 17 remaining Iron Lake coordinate placeholders.

The eLeMeN FAQ gives the regional difficulty/link/allowance rules but does not publish a separate numeric fieldcraft scoring formula. Do not infer modern ARR gathering-leve mechanics where the 1.x source is silent.

## Faction leves

Faction leves are special regional leves purchased with faction credit:

| Tier shown by the regional index | Faction-credit cost |
|---|---:|
| Recommended level 20+ | 0 (server exemption) |
| Recommended level 30+ | 0 (server exemption) |
| Recommended level 40+ | 0 (server exemption) |
| Level-50 special-operation cards | configured source cost |

The archived retail pages list 100/200/300 credits for the standard tiers.
This server deliberately exempts those level-20/30/40 cards from the
acceptance charge; level-50 special-operation cards retain their configured
100/400-credit costs.

Completing ordinary regional leves awards faction credit from the evaluating organization and affects contribution in that region. Credit is tracked separately for:

- Brotherhood of the Broken Blade;
- Azeyma's Shields;
- Horn and Hand.

Each faction's credit is capped at **1,000**. Completing a faction leve also records a Lodestone history entry according to the archived FAQ. The faction files include the standard 100/200/300-credit tiers and the archive's named special-operation/relic-related sections; if a special section does not state a credit price, this archive does not invent one.

### Bonus treasure chests

The archived faction encounter pages repeatedly state that completing the final
objective spawns a treasure chest. Surviving secondary 1.x documentation also
describes bonus chests during battlecraft and fieldcraft leves, with a higher
appearance chance for larger parties, gil in every chest, and occasional item
or equipment rewards. The exact general spawn trigger, party curve, and complete
drop tables did not survive in the eLeMeN pages.

See [Regional Guildleve Server Implementation](server-implementation.md) for
the exact/captured chest evidence, the explicitly labeled reconstruction used
for missing rows, all observed gil values, item candidates, and the shared
Toto-Rak coffer animation path.

## Company leves

Company leves were introduced in Patch 1.19 and reward **company seals**. Unlike ordinary regional leves:

- accept them from an NPC at the field location rather than a normal city guildleve counter;
- accepting one immediately starts the duty;
- one shared leve allowance is still consumed;
- they are solo-only—no leve link or leve share;
- a provisionally assigned recruit cannot accept them.

Issuers listed by the FAQ:

| NPC | Location |
|---|---|
| Storm Sergeant Hammil / Armin Hammil (`アーミン・ハミル甲曹長`) | Cassiopeia Hollow X:7, Y:5 |
| Serpent Sergeant Cordwyk / Clarebald Cordwyk (`クレアバルド・コードウィク牙曹長`) | Mun-Tuy Cellars X:7, Y:6 |
| Flame Sergeant Byrne / Eidhart Byrne (`エイドハート・バーン闘曹長`) | Nanawa Mines X:6, Y:6 |
| Storm Sergeant Sternn / Baldavin Sternn (`バルダヴィン・スターン甲曹長`) | La Noscea X:6, Y:16 |
| Serpent Sergeant Lodall / Ditwin Lodall (`ディトウィン・ロダル牙曹長`) | The Black Shroud X:22, Y:16 |
| Flame Sergeant Dalvag / Ferrand Dalvag (`フェランド・ダルヴァグ闘曹長`) | Thanalan X:42, Y:28 |

Several company objectives use an interaction-driven reveal loop: `/poke`-style actions identify a monster containing a luminous crystal, defeating it yields the crystal, and using the crystal on nearby targets exposes the disguised or parasitic objective enemy. Each individual company-leve page preserves the full commission text and the shorter objective summary.

The extracted company tables show 15-minute contracts. Level-30 rows list a base reward of **40 seals**; level-40 rows list **90 seals**. On verified level-40 templates, keeping an escorted NPC alive or defeating twice the required enemy count is annotated `+50`, while each extra difficulty star is annotated `+20`. The level-30 equivalents are printed as `+?`, and many specialized rows are gray/unverified, so the catalog keeps those unknowns instead of extrapolating a formula.

## Leve History Evaluation

With **6 or more** completed entries displayed in Leve History, a guildleve counter can evaluate that history and issue one leve with a special completion bonus. The archived FAQ lists these inputs:

- count of particular faction-leve types;
- number of different plate designs;
- number of issuing cities represented;
- whether all 8 plates share a particular border color;
- the character's highest battle-class level;
- combinations of the above.

The bonus leve still consumes an allowance. Its Journal reward display already includes the history-evaluation bonus.

## Guild tokens in this snapshot

Patch 1.20 removed obtaining actions/godsends with guild tokens and stopped new token acquisition. Existing tokens could be exchanged for items or converted at **1 token → 4 gil**, and were slated for removal with A Realm Reborn. Older behavior—city/class-specific tokens that required completion on the matching class—is historical context only.

## Archive size

| Category | Extracted rows |
|---|---:|
| Battlecraft | 180 |
| Fieldcraft | 108 |
| Faction | 53 |
| Company | 30 |
| **Total** | **371** |

## Evidence and limits

- eLeMeN is a community-maintained dated archive. Exact source URLs and original Japanese are retained.
- Official English titles/descriptions are joined from this repository's extracted multilingual 1.x game data; the match score is shown per record.
- The count is source-table rows, not unique IDs. Several starting leves have separate main-quest/tutorial rows with different rewards or labels but share one official game-data ID; both source variants are intentionally retained.
- “Encounter/objective flow (English gloss)” is generated to make pack counts and spawn gates readable. Treat the adjacent Japanese objective as authoritative when implementing exact behavior.
- Empty reward cells and unknown (`??`) levels remain unknown. They are not filled with guesses.
- Gray eLeMeN rows retain their post-Patch-1.19 verification warning.
