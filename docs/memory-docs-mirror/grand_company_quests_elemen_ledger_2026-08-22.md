# Grand Company Quest Elemen-First Ledger

Date: 2026-08-22
Scope: the 69 named Maelstrom, Order of the Twin Adder, and Immortal Flames quests in the 1.0 quest table.

This is the source-data companion to [`grand_company_quests_decomp_2026-08-22.md`](grand_company_quests_decomp_2026-08-22.md). It records the route order, NPC handoffs, encounter names, locations, time limits, evidence items, and rewards recovered from the dated Elemen pages. It is an evidence ledger, not an instruction to expose every row: a route remains gated until its server actor, content director, kill/escort callback, cleanup, and reward seam are verified.

## Source precedence

Elemen is the first source for legacy Grand Company facts, per the project request. English names and route order are used from the repository quest table and the archived GamerEscape pages only where the Elemen page is Japanese or omits an English identifier.

- [Elemen Grand Company overview](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/TheGrandCompanies/index.html)
- [Elemen Maelstrom archive](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheMaelstrom.html)
- [Elemen Twin Adder archive](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheOrderoftheTwinAdder.html)
- [Elemen Immortal Flames archive](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheImmortalFlames.html)
- [archived GamerEscape Immortal Flames](https://web.archive.org/web/20121024205500/http://ffxiv.gamerescape.com/wiki/The_Immortal_Flames)
- [archived GamerEscape Maelstrom](https://web.archive.org/web/20130118133643/http://ffxiv.gamerescape.com/wiki/The_Maelstrom)

Where a GamerEscape value conflicts with Elemen, this ledger keeps the Elemen value and calls out the correction in the implementation matrix. In particular, this applies to the Flames `Arms Race` reward and the active Ul'dah field-survey reward.

## Opening, combat, and formal-assignment branches

These are the level-22 through level-25 branches that precede the shared Toto-Rak, primal, rank, and 1.20-era families below. They are listed separately because the three companies reuse the shape of the chain but not the location, NPC handoff, encounter, item, or cutscene contract.

| ID / code | Elemen route, handoff, and encounter data | Reward evidence |
| ---: | --- | --- |
| `111401` / `Com0l1` | The Price of Integrity. Guincum → Walcher → Urianger; La Noscea `(40,17)`, 30-minute private content, Peiste Familiar; return with Walcher's signed agreement `11000254`. | No direct Storm Seal row + 1,760 EXP |
| `111402` / `Com0l2` | Testing the Waters. Guincum report/dialogue step; immediate, non-combat completion. | 250 Storm Seals + 1,100 EXP |
| `111403` / `Com0l3` | Seals for the Whorl. Grizzly Gnat report/dialogue step; non-combat and no direct seal payout. | No direct Storm Seal row + 1,100 EXP |
| `111404` / `Com0l4` | Engineering Victory. Guincum → three Eastern La Noscea waves at `(35,14)`—Funditor/Bestiarius, Speculator/Triarius, then Veles—→ Magitek transceiver `11000259` → Ebrelnaux at Millers' Glade → Guincum. | 500 Storm Seals + 1,541 EXP |
| `111405` / `Com0l5` | An Officer and a Wise Man. Guincum → 30-minute rough-pirate content in Eastern La Noscea `(31,24)` → Merlwyb/Urianger → Zanthael ceremony → Y'shtola; the route returns through the magitek-accumulator handoff. | 300 Storm Seals + 1,891 EXP |
| `111406` / `Com0l6` | Ceruleum Shock. Guincum → ferry-dock Imperial fight—Speardancer, Bladedancer, Shadowspinner, and Lightspinner—→ Aisborgsyn → Central Thanalan `(24,23)` → Cid. | 300 Storm Seals + 1,891 EXP |
| `111407` / `Com0l7` | Till Sea Swallows All. Guincum formal-assignment dialogue; pledge to the Maelstrom through the officer checkbox, then close the route with the company completion scene. | 1,000 Storm Seals + 1,080 EXP |
| `111601` / `Com0g1` | Breaking the Seals. Fulke → Ailith at the Black Shroud/Quarrymill route `(42,48)` → Urianger; 30-minute Drake Familiar content; return with Ailith's oath `11000251`. | No direct Serpent Seal row + 1,541 EXP |
| `111602` / `Com0g2` | Why Did It Have to Be Snakes. Fulke report/dialogue step; immediate, non-combat completion. | 250 Serpent Seals + 1,100 EXP |
| `111603` / `Com0g3` | Adder's Nest Egg. Haurtelle report/dialogue step; non-combat and no direct seal payout. The Clay Golem belongs to `111605`, not this row. | No direct Serpent Seal row + 1,100 EXP |
| `111604` / `Com0g4` | The Mail Must Get Through. Fulke → 30-minute Imperial-soldier protection content near `(24,17)` → encrypted-letter/magitek-design handoff `11000258` to Radulf at Little Ala Mhigo → Fulke. | 500 Serpent Seals + 1,541 EXP |
| `111605` / `Com0g5` | Their Finest Hour. Fulke → Mih Khetto/Papalymo ceremony → Rootslake `(47,50)` → Earthbreaker → 30-minute Clay Golem content → Urianger. | 300 Serpent Seals + 1,891 EXP |
| `111606` / `Com0g6` | Appetite for Destruction. Fulke → Bowlord Lewin at Stillglade → clearing west of Nine Ivies → Arthur/Cid attack → Cid at Stillglade. Recovered journals 340–342 and `processEventNq` / `COM0G510` disprove the earlier Toto-Rak assignment. | 300 Serpent Seals + 1,891 EXP |
| `111607` / `Com0g7` | Serenity, Purity, Sanctity. Syro formal-assignment dialogue; pledge to the Twin Adder through the officer checkbox, then close the route with the company completion scene. | 1,000 Serpent Seals + 1,080 EXP |
| `111801` / `Com0u1` | Career Opportunities. Aubrey → Taylor at the Camp Horizon/ferry-dock route in Western Thanalan `(9,31)` → Urianger; 30-minute Anole Familiar content; return with Taylor's letter `11000252`. | No direct Flame Seal row + 1,760 EXP |
| `111802` / `Com0u2` | Kindling a Flame. Aubrey report/dialogue step; immediate, non-combat completion. | 250 Flame Seals + 1,100 EXP |
| `111803` / `Com0u3` | Burning a Hole in One's Pocket. Rahz report/dialogue step; non-combat and no direct seal payout. | No direct Flame Seal row + 1,100 EXP |
| `111804` / `Com0u4` | Arms Race. Aubrey → 30-minute Hellhound troop content near the Golden Bazaar → Aubrey → C'ndanya, Raaka Maaka, and Bamponcet contracts; the server pair is actor `2109801` / mob type `1361`, and the three evidence items are `11000256`, `11000255`, and `11000253`. | 500 Flame Seals + 1,760 EXP |
| `111805` / `Com0u5` | Burning Man. Aubrey → 30-minute pirate content west of Camp Horizon → Thancred/Urianger → Raubahn ceremony → Thancred; the post-fight evidence includes the Shattered Gauntlet `11000261` and Magitek Cooling Plate `11000262`. | 300 Flame Seals + 1,891 EXP |
| `111806` / `Com0u6` | Know Your Enemy. Aubrey → Cid/Ironworks → Charledore pursuit → hostile confrontation → Cid → Aubrey. Client actor `2289025` remains blank/property-zero, so the server encounter and completion path are intentionally unresolved. | 300 raw Flame Seals in client evidence; not granted while the actor is blocked |
| `111807` / `Com0u7` | By Fire Reborn. Aubrey formal-assignment dialogue; pledge to the Immortal Flames through the officer checkbox, then close the route with the company completion scene. | 1,000 Flame Seals + 1,080 EXP |

## Shared route families

The same content family appears once in each company branch. Replace `*` with `l` (Limsa/Maelstrom), `g` (Gridania/Twin Adder), or `u` (Ul'dah/Immortal Flames); the company currency follows the branch.

| Codes / IDs | Elemen route | Exact source data | Reward evidence |
| --- | --- | --- | --- |
| `Com5*0` / `111410`, `111610`, `111810` | Imperial Devices / Toto-Rak | Level 25. Survey/application in the home city, a cross-city briefing, then a Toto-Rak Moogle/object route. The recorded Limsa path uses Zerig at Gridania `(2,1)`, Broazilan in the Black Shroud `(39,44)`, and Moogle points around `(5,6)` and `(6,4)`; the branch variants use the corresponding city NPCs and evidence plates. | 1,000 company seals + 2,160 EXP |
| `Com5*1` / `111411`, `111611`, `111811` | Into the Dark / Dzemael Stronghold | Level 45. Home-company officer → Coerthas Aurnest briefing → Dzemael instance. The Maelstrom record calls out Hastrofwab `(4,7)`, Aurnest `(61,33)`, Kyria `(62,34)`, Dilstveitz `(36,25)`, and an Imperial Primio Denarius on map 2 around `(7,5)`. | 4,000 company seals + 6,231 EXP |
| `G*101` / `111416`, `111616`, `111816` | It Kills with Fire / Ifrit | Level 30. Louisoix at Gridania `(6,2)` sends the player through six resonant-crystal NM checks: Barometz, Slippery Sykes, Nest Commander, Pyrausta, Queen Bolito, and Jackanapes; the Azab Chah briefing leads into the Ifrit battle. The record also tracks four same-company completions before the assignment step. | 1,000 company seals + 3,040 EXP; Elemen lists a 1,500 EXP bonus |
| `G*104` / `111430`, `111630`, `111830` | In for Garuda Wakening | Level 45. Louisoix briefing, Quarymill item handoff, Garuda battle around Coerthas `(48,18)` for the Limsa record, then the home-city Cid/leader scene. | 2,000 company seals + 6,231 EXP; Elemen lists a 2,500 EXP bonus |
| `G*106` / `111432`, `111632`, `111832` | United We Stand / Victory March | Level 45. Cross-city preparation feeds the Mor Dhona → Castrum Novum route. The Limsa record names Jaqis Rider `(9,13)`, Castrum Novum `(5,10)`, and a 30-minute Transmission Tower destruction objective. | 5,000 company seals + 6,231 EXP; Elemen lists a 6,000 EXP bonus |
| `G*107` / `111433`, `111633`, `111833` | To Kill a Raven / Moonlit Battle | Level 45. The final shared battle is the Enterprise/Nael van Darnus sequence. It is a fight-content route, not a normal officer-dialogue completion. | 6,000 company seals + 5,340 EXP; Elemen lists a 7,000 EXP bonus |
| `G*701` / `111428`, `111628`, `111828` | First promotion trial | Promotion route after the initial enlistment tier. Exchange 2,500 seals for the trial badge, then earn 1,000 War Merit from the company-specific beastman targets before saluting the company officer. | 6,231 EXP; promotion/merit route, no direct seal reward |
| `G*702` / `111434`, `111634`, `111834` | Final NM/promotion trial | Level 50. Defeat the company-specific NM. The record awards a commemorative coin in addition to the company seals; the city Qiqirn exchanges the coin for 25,000 company seals. | 5,000 company seals + 6,600 EXP + commemorative coin |

The shared families are deliberately not treated as interchangeable server templates. Each branch still needs its own actor IDs, event arguments, map entry, return position, and company-specific completion history.

## Maelstrom / Limsa Lominsa

| ID / code | Elemen route and fight seam | Reward |
| ---: | --- | ---: |
| `111410` / `Com5l0` | Toto-Rak Imperial Devices route; the Moogle inspects the magitek field points and returns a black thunder plate for the Limsa report. | 1,000 Storm Seals + 2,160 EXP |
| `111411` / `Com5l1` | Dzemael Stronghold route; Aurnest/Kyria briefing, Dilstveitz handoff, then Imperial Primio Denarius evidence in the dungeon. | 4,000 Storm Seals + 6,231 EXP |
| `111416` / `Gcl101` | Ifrit route described in the shared family ledger. The six NM crystal checks precede the Bowl of Embers battle and the rank-assignment history. | 1,000 Storm Seals + 3,040 EXP; 1,500 EXP bonus |
| `111417` / `Gcl301` | `アワアワ大作戦` / The Cove. Clifton in the Lower Deck `(5,6)` sends the player to La Noscea `(8,21)` for a 30-minute Dirt Slug fight. | 300 Storm Seals + 1,891 EXP |
| `111418` / `Gcl302` | `荒ぶる海賊たち` / Saving the Stead Instead. Hastrofwab `(4,7)` starts the route; a Philirskiff scene around `(40,18)` leads to a 30-minute Kobold battle at the same location. | 300 Storm Seals + 1,891 EXP |
| `111419` / `Gcl303` | `スウィートビスケット騒動` / It’s a Piece of Cake to Bake a Poison Cake. Le Suceemo in the Upper Deck `(7,3)` sends the player to La Noscea `(33,32)` for a 30-minute Gluttonous Qiqirn fight and aftermath scene. | 1,000 Storm Seals + 4,260 EXP |
| `111420` / `Gcl304` | `地底の秘境` / Kobold and the Beautiful. Lilina `(4,5)` → Kurtz Nolan `(22,7)` → three U'Ghamaro points around `(5–6,5)`. The three object interactions are the field-survey contract, not a kill quest. | 700 Storm Seals + 4,450 EXP |
| `111426` / `Gcl305` | `一流を支えるもの` / Oil Crisis. Singsmid in the Upper Deck `(7,7)` sends the player to La Noscea `(25,8)` for a 30-minute Deadly Nightshade fight and item return. | 700 Storm Seals + 6,600 EXP |
| `111427` / `Gcl102` | `王狼へのはなむけ` / Alive. After formal assignment, Guincum's La Noscea scene around `(22,7)` leads to a 30-minute Imperial Hoplomachus battle at `(20,5)`, followed by Cid, Ebrelnaux, and Jijina around `(17,6)`. | 1,000 Storm Seals + 4,971 EXP |
| `111428` / `Gcl701` | `「コボルド軍野営」疲弊作戦` / The Weakest Link promotion trial. Aleine Brooks `(32,13)` starts the merit scoring; the targets are Kobold Cragsman, Kobold Roundsman, and Kobold Bedesman. | 6,231 EXP; 1,000 merit; 2,500-seal badge cost |
| `111429` / `Gcl103` | `開かれた血路` / Deus ex Machina. Guincum → Limsa gunner-guild Merlwyb scene → 30-minute Magitek Vanguard battle around `(12,23)` → report. | 1,500 Storm Seals + 5,340 EXP |
| `111430` / `Gcl104` | `盟主ルイゾワの導き（リムサ）` / In for Garuda Wakening. Louisoix and Quarymill item setup lead to the Garuda route. | 2,000 Storm Seals + 6,231 EXP; 2,500 EXP bonus |
| `111431` / `Gcl105` | `リムサ・ロミンサの岐路` / Don't Hate the Messenger. Cross-city letters lead to a Mor Dhona scene around `(16,21)`, three VII Legion kills near `(7,17)`, an object inspection, and the Limsa report. | 2,000 Storm Seals + 6,231 EXP |
| `111432` / `Gcl106` | `勝利への行進（リムサ）` / United We Stand. Mor Dhona Jaqis Rider `(9,13)` → Castrum Novum `(5,10)` → 30-minute Transmission Tower destruction. | 5,000 Storm Seals + 6,231 EXP; 6,000 EXP bonus |
| `111433` / `Gcl107` | `月下の闘い（リムサ）` / To Kill a Raven. Enterprise/Nael van Darnus battle route after the shared cross-company history. | 6,000 Storm Seals + 5,340 EXP; 7,000 EXP bonus |
| `111434` / `Gcl702` | `「グレートバッファロー」討伐作戦` / Patrol, Interrupted. Level-50 Great Buffalo NM kill, commemorative coin, and city exchange for 25,000 Storm Seals. | 5,000 Storm Seals + 6,600 EXP + coin |

## Order of the Twin Adder / Gridania

| ID / code | Elemen route and fight seam | Reward |
| ---: | --- | ---: |
| `111610` / `Com5g0` | Twin Adder Toto-Rak Imperial Devices route; the branch uses Broazilan `(39,44)` and the Moogle/object sequence before the Gridania report. | 1,000 Serpent Seals + 2,160 EXP |
| `111611` / `Com5g1` | Twin Adder Dzemael Stronghold route; Aurnest/Juhelmeric briefing and the Imperial soldier/item handoff. | 4,000 Serpent Seals + 6,231 EXP |
| `111616` / `Gcg101` | Twin Adder Ifrit route described in the shared family ledger. | 1,000 Serpent Seals + 3,040 EXP; 1,500 EXP bonus |
| `111617` / `Gcg301` | `遥かなる循環` / Eternal Recurrence. Dilstbroda `(7,3)` sends the player to the Black Shroud `(17,16)` for a 30-minute Dreadwolf fight. | 300 Serpent Seals + 1,891 EXP |
| `111618` / `Gcg302` | `護国にかける決意` / The Pen Is Mightier Than the Spear. Demuldeg `(7,2)` and a `(47,50)` Nut battle lead to Sharini and an art/evidence handoff. | 300 Serpent Seals + 1,891 EXP |
| `111619` / `Gcg303` | `ひらめきの種` / Woes of the Botanist. Enni `(4,3)` sends the player to the Black Shroud `(31,33)` for a 30-minute Migrating Doo fight, followed by Kuplu Kopo/Enni scenes. | 1,000 Serpent Seals + 4,260 EXP |
| `111620` / `Gcg304` | `烈風の要塞` / Gone with the Wind. Allaire `(8,5)` sends the player to Natalan `(42,19)` to inspect three stronghold objects. | 700 Serpent Seals + 4,450 EXP |
| `111626` / `Gcg305` | `骸を喰らう者` / A Taste for Death. Zuzupojah `(6,5)` sends the player to the Black Shroud `(38,44)` for a 30-minute Ripe Shrieker fight. | 700 Serpent Seals + 6,600 EXP |
| `111627` / `Gcg102` | `凶鳥の舞` / Two Vans are Better than One. Fulke → Kankrol instance around `(46,32)` → 30-minute Imperial Equites battle → Frimlroof/Kankrol/Tholl aftermath → Landing scene with Ebrelnaux and Bald. | 1,000 Serpent Seals + 4,971 EXP |
| `111628` / `Gcg701` | `「イクサル軍伐採所」急襲作戦` / You Don't Have the Rite promotion trial. Borsel `(22,13)` starts the merit scoring against Ixali Rim Cutter, Soil Seer, and Cloud Walker. | 6,231 EXP; 1,000 merit; 2,500-seal badge cost |
| `111629` / `Gcg103` | `心をひとつに` / Shadow of the Raven. Conjurer-guild scene `(2,1)` with Kan-E leads to a 30-minute Magitek Vanguard battle at `(17,35)`. | 1,500 Serpent Seals + 5,340 EXP |
| `111630` / `Gcg104` | Twin Adder Garuda route from the shared family ledger. | 2,000 Serpent Seals + 6,231 EXP; 2,500 EXP bonus |
| `111631` / `Gcg105` | Gridania crossroads / messenger route: cross-city letters, Mor Dhona scene, VII Legion objective, and report. | 2,000 Serpent Seals + 6,231 EXP |
| `111632` / `Gcg106` | Gridania victory march / Castrum Novum Transmission Tower route. | 5,000 Serpent Seals + 6,231 EXP; 6,000 EXP bonus |
| `111633` / `Gcg107` | Twin Adder Nael van Darnus / Moonlit Battle route. | 6,000 Serpent Seals + 5,340 EXP; 7,000 EXP bonus |
| `111634` / `Gcg702` | Cure for the Common Pox final NM record. The Elemen record names Big-hearted Hot Pox, plus the commemorative-coin exchange. | 5,000 Serpent Seals + 6,600 EXP + coin |

## Immortal Flames / Ul'dah

| ID / code | Elemen route and fight seam | Reward |
| ---: | --- | ---: |
| `111810` / `Com5u0` | Immortal Flames Toto-Rak Imperial Devices route; Nuala/Bloisirant briefing, Moogle/object checks, and gauntlet/cooling-plate evidence. | 1,000 Flame Seals + 2,160 EXP |
| `111811` / `Com5u1` | Immortal Flames Dzemael Stronghold route; Volmont and the Coerthas/Dzemael Imperial soldier handoff. | 4,000 Flame Seals + 6,231 EXP |
| `111816` / `Gcu101` | Immortal Flames Ifrit route described in the shared family ledger. | 1,000 Flame Seals + 3,040 EXP; 1,500 EXP bonus |
| `111817` / `Gcu301` | `エシュテムの新製品` / Prying Eyes. Refchild `(6,6)` sends the player to Thanalan `(15,29)` for a 30-minute Red Coblyn fight; the enraged level-26 Red Coblyn yields the Prism Eye. | 300 Flame Seals + 1,891 EXP |
| `111818` / `Gcu302` | `確執の果て` / Different Strokes. Galeren `(5,5)` and Adalbert Cotter `(7,4)` lead to Thanalan `(45,21)` for a 30-minute Hungry Dreadwolf fight and Lennard aftermath. | 300 Flame Seals + 1,891 EXP |
| `111819` / `Gcu303` | `すべては隊士様のために` / A Weaver and a Mummer. Kahelno `(7,5)` sends the player to Thanalan `(19,33)` for a 30-minute Imperial Centurion fight. | 1,000 Flame Seals + 4,260 EXP |
| `111820` / `Gcu304` | `灼熱の聖域` / When Alchemists Cry. Berthal `(5,6)` sends the player to Zahar'ak `(47–48,40–41)` to inspect three stronghold objects. | 700 Flame Seals + 4,450 EXP |
| `111826` / `Gcu305` | `裏の裏` / Challenge Accepted. I Pagglo `(5,4)` sends the player to Thanalan `(39,30)` for a 30-minute Rotting Servant fight and Jaqis aftermath. | 700 Flame Seals + 6,600 EXP |
| `111827` / `Gcu102` | `ふたりの機工師` / Like Father, Like Son. Aubrey → Jaqis scene `(27,25)` → item → 30-minute Imperial Hoplomachus battle `(24,23)` → Imperial Centurion scene → Wellhead/Cid return. | 1,000 Flame Seals + 4,971 EXP |
| `111828` / `Gcu701` | `「アマルジャ軍祭場」補給断絶作戦` / Gore a Lizard, Hurry promotion trial. Rudold `(40,32)`/Aleine start the merit scoring against Amalj'aa Pennoncier, Captain, and High Divinator. | 6,231 EXP; 1,000 merit; 2,500-seal badge cost |
| `111829` / `Gcu103` | `決断の狼煙` / Careless Whispers. Aubrey → Royal Promenade `(6,5)` Raubahn scene → 30-minute Magitek Vanguard battle at `(7,27)` → fallen-sergeant/ferry-dog aftermath around `(5,26)`. | 1,500 Flame Seals + 5,340 EXP |
| `111830` / `Gcu104` | Immortal Flames Garuda route from the shared family ledger. | 2,000 Flame Seals + 6,231 EXP; 2,500 EXP bonus |
| `111831` / `Gcu105` | Ul'dah crossroads / messenger route: cross-city letters, Mor Dhona scene, VII Legion objective, and report. | 2,000 Flame Seals + 6,231 EXP |
| `111832` / `Gcu106` | Ul'dah victory march / Castrum Novum Transmission Tower route. | 5,000 Flame Seals + 6,231 EXP; 6,000 EXP bonus |
| `111833` / `Gcu107` | Immortal Flames Nael van Darnus / Moonlit Battle route. | 6,000 Flame Seals + 5,340 EXP; 7,000 EXP bonus |
| `111834` / `Gcu702` | Immortal Flames final NM record; Elemen names Elder Mosshorn and the commemorative-coin exchange. | 5,000 Flame Seals + 6,600 EXP + coin |

## Formal-assignment and implementation gating notes

Elemen describes the formal-assignment officer checkbox as the point at which the player becomes a Second Storm/Serpent/Flame Private and the other-company choice is closed. Each formal row pays 1,000 company seals and 1,080 EXP; the Flames script now uses that source-backed value instead of its old 5,000 EXP placeholder.

The opening table is the source inventory, not an enablement list. As of the 2026-08-31 audit all named Grand Company rows are disabled. `111404`, `111405`, `111406`, `111604`, `111605`, `111606`, and `111805` remain gated until their wave, escort, pirate, Clay Golem, Nine Ivies, ceremony, and cleanup owners are recovered. The copied Toto-Rak shells formerly attached to `111405`, `111406`, `111605`, `111606`, and `111805` were removed. `111806` remains blocked by actor `2289025`; a client cutscene alone does not authorize inventing a server mob row or reward path.

## Internal rows

The 33 `[en]` rows (`Com0*8/9`, `Com5*2–5`, and `G*501–603`) have no title, prerequisite, or level in `gamedata_quests.sql`. They are inventory evidence only. No Elemen route is attached to them until a client title/event/actor mapping is recovered.
