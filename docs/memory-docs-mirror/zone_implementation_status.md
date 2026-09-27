# Zone Implementation Status Breakdown

Based on a comparison of the server's zone database (`server_zones.sql`) and the client's dat mined parameters (`_zoneParam.csv`), here is the status of zone implementation.

## Summary

- **Total Zones in Client (`_zoneParam.csv`):** 111
- **Total Zones Implemented in Server (`server_zones.sql`):** 111
- **Zones Not Implemented:** 0 (100% of client zones are present in the server's database)

## Zone Implementation Details

| Zone ID | Zone Name | Place Name | Status |
| :---: | :--- | :--- | :---: |
| **0** | - | -- | Implemented |
| **128** | sea0Field01 | Lower La Noscea | Implemented |
| **129** | sea0Field02 | Western La Noscea | Implemented |
| **130** | sea0Field03 | Eastern La Noscea | Implemented |
| **131** | sea0Dungeon01 | Mistbeard Cove | Implemented |
| **132** | sea0Dungeon03 | Cassiopeia Hollow | Implemented |
| **133** | sea0Town01 | Limsa Lominsa | Implemented |
| **134** | sea0Market01 | Market Wards | Implemented |
| **135** | sea0Field04 | Upper La Noscea | Implemented |
| **137** | sea0Dungeon06 | U'Ghamaro Mines | Implemented |
| **138** | - | La Noscea | Implemented |
| **139** | sea0Field01a | The Cieldalaes | Implemented |
| **140** | - | Sailors Ward | Implemented |
| **141** | sea0Field01a | Lower La Noscea | Implemented |
| **143** | roc0Field01 | Coerthas Central Highlands | Implemented |
| **144** | roc0Field02 | Coerthas Eastern Highlands | Implemented |
| **145** | roc0Field03 | Coerthas Eastern Lowlands | Implemented |
| **146** | - | Coerthas | Implemented |
| **147** | roc0Field04 | Coerthas Central Lowlands | Implemented |
| **148** | roc0Field05 | Coerthas Western Highlands | Implemented |
| **150** | fst0Field01 | Central Shroud | Implemented |
| **151** | fst0Field02 | East Shroud | Implemented |
| **152** | fst0Field03 | North Shroud | Implemented |
| **153** | fst0Field04 | West Shroud | Implemented |
| **154** | fst0Field05 | South Shroud | Implemented |
| **155** | fst0Town01 | Gridania | Implemented |
| **156** | - | The Black Shroud | Implemented |
| **157** | fst0Dungeon01 | The Mun-Tuy Cellars | Implemented |
| **158** | fst0Dungeon02 | The Tam-Tara Deepcroft | Implemented |
| **159** | fst0Dungeon03 | The Thousand Maws of Toto-Rak | Implemented |
| **160** | fst0Market01 | Market Wards | Implemented |
| **161** | - | Peasants Ward | Implemented |
| **162** | fst0Field01a | Central Shroud | Implemented |
| **164** | fst0Battle01 | Central Shroud | Implemented |
| **165** | fst0Battle02 | Central Shroud | Implemented |
| **166** | fst0Battle03 | Central Shroud | Implemented |
| **167** | fst0Battle04 | Central Shroud | Implemented |
| **168** | fst0Battle05 | Central Shroud | Implemented |
| **170** | wil0Field01 | Central Thanalan | Implemented |
| **171** | wil0Field02 | Eastern Thanalan | Implemented |
| **172** | wil0Field03 | Western Thanalan | Implemented |
| **173** | wil0Field04 | Northern Thanalan | Implemented |
| **174** | wil0Field05 | Southern Thanalan | Implemented |
| **175** | wil0Town01 | Ul'dah | Implemented |
| **176** | wil0Dungeon02 | Nanawa Mines | Implemented |
| **177** | _jail | - | Implemented |
| **178** | wil0Dungeon04 | Copperbell Mines | Implemented |
| **179** | - | Thanalan | Implemented |
| **180** | wil0Market01 | Market Wards | Implemented |
| **181** | wil0Event01 | Merchants Ward | Implemented |
| **182** | - | Central Thanalan | Implemented |
| **184** | wil0Battle01 | Ul'dah | Implemented |
| **185** | wil0Battle01 | Ul'dah | Implemented |
| **186** | wil0Battle02 | Ul'dah | Implemented |
| **187** | wil0Battle03 | Ul'dah | Implemented |
| **188** | wil0Battle04 | Ul'dah | Implemented |
| **190** | lak0Field01 | Mor Dhona | Implemented |
| **192** | ocn1Battle01 | Rhotano Sea | Implemented |
| **193** | ocn0Battle02 | Rhotano Sea | Implemented |
| **194** | ocn1Battle03 | Rhotano Sea | Implemented |
| **195** | ocn1Battle04 | Rhotano Sea | Implemented |
| **196** | ocn1Battle05 | Rhotano Sea | Implemented |
| **198** | ocn1Battle06 | Rhotano Sea | Implemented |
| **200** | sea1Cruise01 | Strait of Merlthor | Implemented |
| **201** | prv0Cottage00 | - | Implemented |
| **204** | sea0Field02a | Western La Noscea | Implemented |
| **205** | sea0Field03a | Eastern La Noscea | Implemented |
| **206** | fst0Town01a | Gridania | Implemented |
| **207** | fst0Field03a | North Shroud | Implemented |
| **208** | fst0Field05a | South Shroud | Implemented |
| **209** | wil0Town01a | Ul'dah | Implemented |
| **210** | - | Eastern Thanalan | Implemented |
| **211** | - | Western Thanalan | Implemented |
| **230** | sea0Town01a | Limsa Lominsa | Implemented |
| **231** | roc0Dungeon01 | Dzemael Darkhold | Implemented |
| **232** | sea0Office01 | Maelstrom Command | Implemented |
| **233** | wil0Office01 | Hall of Flames | Implemented |
| **234** | fst0Office01 | Adders' Nest | Implemented |
| **235** | sea0Dungeon02 | Shposhae | Implemented |
| **236** | sea1Field04 | Locke's Lie | Implemented |
| **237** | sea1Field05 | Turtleback Island | Implemented |
| **238** | fst0Field04 | Thornmarch | Implemented |
| **239** | roc0Field02a | The Howling Eye | Implemented |
| **240** | wil0Field05a | The Bowl of Embers | Implemented |
| **244** | prv0Inn01 | Inn Room | Implemented |
| **245** | roc0Dungeon04 | The Aurum Vale | Implemented |
| **246** | wil0Dungeon05 | Cutter's Cry | Implemented |
| **247** | - | North Shroud | Implemented |
| **248** | - | Western La Noscea | Implemented |
| **249** | - | Eastern Thanalan | Implemented |
| **250** | roc0Field02a | The Howling Eye | Implemented |
| **251** | lak0Field01 | Transmission Tower | Implemented |
| **252** | roc0Dungeon04 | The Aurum Vale | Implemented |
| **253** | roc0Dungeon04 | The Aurum Vale | Implemented |
| **254** | wil0Dungeon05 | Cutter's Cry | Implemented |
| **255** | wil0Dungeon05 | Cutter's Cry | Implemented |
| **256** | roc0Field02a | The Howling Eye | Implemented |
| **257** | roc1Field01 | Rivenroad | Implemented |
| **258** | - | North Shroud | Implemented |
| **259** | - | North Shroud | Implemented |
| **260** | - | Western La Noscea | Implemented |
| **261** | - | Western La Noscea | Implemented |
| **262** | - | Eastern Thanalan | Implemented |
| **263** | - | Eastern Thanalan | Implemented |
| **264** | lak0Field01 | Transmission Tower | Implemented |
| **265** | wil0Field05a | The Bowl of Embers | Implemented |
| **266** | lak0Field01a | Mor Dhona | Implemented |
| **267** | roc1Field02 | Rivenroad | Implemented |
| **268** | roc1Field03 | Rivenroad | Implemented |
| **269** | sea1Field04 | Locke's Lie | Implemented |
| **270** | sea1Field05 | Turtleback Island | Implemented |
