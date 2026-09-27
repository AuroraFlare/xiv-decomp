# Blacksmith local guildleves

Source: [eLeMeN dated archive](http://elemen.sakura.ne.jp/ff14_dated_archives/guildleve/local/Blacksmith.html)

- Commissions: **19**
- Displayed variants: **76**
- Source SHA-256: `b9dcbf5209bb3047bb3fb4fa3e21e2fbdc3cdeb096b5baa1500fc20c8d249b14`
- IDs and English item names are joined from the local 1.x client/server data.

## Limsa Lominsa

### `120005` — Baderon's New Sword

- Japanese title: `駆け出し鍛冶師向けの仕事`
- Leve location ID: `1014`
- Delivery display-name ID: `1400065`
- Plate/border: `20033` / `20005`

「溺れた海豚亭」のマスターが新しい剣を欲しがっている。壁面に飾るオーナメント用で、切れ味にはこだわらないそうだ。駆け出しの鍛冶師でもいい。引き受ける気があるなら、キャンプ・ビアデッドロックに赴き、ディディワイから余剰素材を受け取って、その場で剣を鍛えたあと、彼に渡してくれ。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 1 | レベル 1-10 | Bronze Gladius ×2 (`4030001`) | 4 | Bronze Cross-pein Hammer ×1 (`6020004`) |
| 2 | 1 | レベル 1-10 | Bronze Gladius ×3 (`4030001`) | 5 | Hempen Kurta ×1 (`8032501`) |
| 3 | 1 | レベル 1-10 | Bronze Gladius ×4 (`4030001`) | 6 | Hempen Halfgloves ×1 (`8070320`) |
| 4 | 1 | レベル 1-10 | Bronze Gladius ×5 (`4030001`) | 7 | Sheepskin Shoes ×1 (`8080615`) |

### `120013` — Got Ingots

- Japanese title: `製作依頼：輸出用インゴット`
- Leve location ID: `1510`
- Delivery display-name ID: `1400104`
- Plate/border: `20033` / `20005`

グリダニア向けの輸出用金属塊が不足している。堅実な仕事を好む鍛冶師は、バンゴ・ザンゴの下を訪ね、来週の商会の船便に間に合うように、彼の指定する金属塊を鋳造するのを手伝ってもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 10 | レベル 11-20 | Iron Ingot ×2 (`10002012`) | 4 | Iron Ore ×9 (`10001004`) |
| 2 | 20 | レベル 21-30 | Steel Ingot ×3 (`10002013`) | 5 | Iron Ore ×9 (`10001004`) |
| 3 | 30 | レベル 31-40 | Mythril Ingot ×4 (`10003015`) | 6 | Mythril Ore ×9 (`10001010`) |
| 4 | 35 | レベル 31-40 | Cobalt Ingot ×5 (`10002015`) | 7 | Cobalt Ore ×9 (`10001013`) |

### `120014` — Ship Shape

- Japanese title: `製作依頼：ガレオン船の補修材`
- Leve location ID: `1509`
- Delivery display-name ID: `1900094`
- Plate/border: `20033` / `20005`

｢アイスプリンセス｣号の出港準備を進めているが、いまだ船体の補修材が不足している。腕に自信のある鍛冶師は、ハ・ランボロ船長を訪ね、必要とされている補修材を作り、渡してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 15 | レベル 11-20 | Iron Rivets ×6 (`10002072`) | 4 | Iron Ingot ×3 (`10002012`) |
| 2 | 25 | レベル 21-30 | Steel Rivets ×9 (`10002073`) | 5 | Steel Ingot ×3 (`10002013`) |
| 3 | 35 | レベル 31-40 | Mythril Rivets ×12 (`10003074`) | 6 | Mythril Ingot ×3 (`10003015`) |
| 4 | 40 | レベル 41-50 | Cobalt Rivets ×15 (`10002074`) | 7 | Cobalt Ingot ×3 (`10002015`) |

### `120015` — A Want of Weapons

- Japanese title: `急募！ 製作依頼：商船隊の陸土用武器`
- Leve location ID: `1509`
- Delivery display-name ID: `1000333`
- Plate/border: `20033` / `20004`

勢力を増す海賊への備えとして、商船隊に搭乗する陸士の武装強化が進められている。やる気のある鍛冶師は、レヴェリッジ陸士長を訪ね、命じられた武器を揃えてもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 15 | レベル 11-20 | Iron Labrys ×2 (`4040106`) | 4 | Iron Ingot ×3 (`10002012`) |
| 2 | 25 | レベル 21-30 | Steel Baselard ×3 (`4030115`) | 5 | Steel Ingot ×3 (`10002013`) |
| 3 | 45 | レベル 41-50 | Mythril Bhuj ×4 (`4040206`) | 6 | Mythril Ingot ×3 (`10003015`) |
| 4 | 50 | レベル 41-50 | Cobalt Shamshir ×5 (`4030506`) | 7 | Cobalt Ingot ×3 (`10002015`) |

Archive/client differences (runtime retains the client SQL value):

- Variant 2: objective quantity: archive `72`; client SQL `3`

### `120035` — Skull Valley Delivery

- Japanese title: `キャンプ・スカルバレー：鍛冶製品納入`
- Leve location ID: `1018`
- Delivery display-name ID: `1900056`
- Plate/border: `20034` / `20005`

キャンプ・スカルバレーから、ある鍛冶製品を納品してほしい、との依頼がきている。我が社で材料はそろえたものの、職人の手配がつかなかった。腕に覚えのある鍛冶師は、これを製作。同キャンプの輜重担当エ・パトルミ陸兵に届けてもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 5 | レベル 1-10 | Bronze Saw ×2 (`6010009`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 10 | レベル 11-20 | Bronze Scythe ×3 (`7020104`) | 5 | Bronze Ingot ×3 (`10002011`) |
| 3 | 35 | レベル 31-40 | Crosscut Saw ×4 (`6010013`) | 6 | Steel Ingot ×3 (`10002013`) |
| 4 | 45 | レベル 41-50 | Mythril Scythe ×5 (`7020107`) | 7 | Mythril Ingot ×3 (`10003015`) |

### `120043` — Fruit's of a Vintner's Whinings

- Japanese title: `キャンプ・ブラッドショア：戦備納品`
- Leve location ID: `1022`
- Delivery display-name ID: `1400076`
- Plate/border: `20034` / `20005`

昨今、海賊「海蛇の舌」がワインポートを狙っている、との噂が絶えず、近隣のキャンプ・ブラッドショアでは戦備を増強しつつある。腕自慢の鍛冶師は、指定の品を製作。同キャンプの輜重担当ココムイ陸兵まで届けてもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 15 | レベル 11-20 | Iron War Axe ×2 (`4040009`) | 4 | Iron Ingot ×3 (`10002012`) |
| 2 | 25 | レベル 21-30 | Iron Bill ×3 (`4040405`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 30 | レベル 31-40 | Steel Claws ×4 (`4020302`) | 6 | Steel Ingot ×3 (`10002013`) |
| 4 | 45 | レベル 41-50 | Cobalt Cavalry Bow ×5 (`4070107`) | 7 | Cobalt Ingot ×3 (`10002015`) |

### `120051` — Premiums Paid

- Japanese title: `キャンプ・バルドノール：損害補償品納品`
- Leve location ID: `1020`
- Delivery display-name ID: `1300073`
- Plate/border: `20034` / `20005`

キャンプ・バルドノールが、またもや盗賊団の襲撃を受けた。トリトン社は速やかに略奪された物品の代替品を用意しなければならないが、手が足りない。腕に覚えのある鍛冶師は、至急、指定の品を製作し、同キャンプの輜重担当ザビニー陸兵宛てに配達してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 40 | レベル 41-50 | Spiked Mythril Labrys ×2 (`4040108`) | 4 | Steel Ingot ×3 (`10002013`) |
| 2 | 40 | レベル 41-50 | Mythril Hatchet ×3 (`7020014`) | 5 | Mythril Ingot ×3 (`10003015`) |
| 3 | 50 | レベル 51-60 | Electrum Lapidary Hammer ×4 (`6040015`) | 6 | Cobalt Ingot ×3 (`10002015`) |
| 4 | 50 | レベル 51-60 | Cobalt Claws ×5 (`4020309`) | 7 | Cobalt Ingot ×3 (`10002015`) |

### `120059` — Training and Trading

- Japanese title: `キャンプ・ビアデッドロック：新兵装備納品`
- Leve location ID: `1014`
- Delivery display-name ID: `1600125`
- Plate/border: `20034` / `20005`

現在、キャンプ・ビアデッドロックでは、入隊したばかりの陸兵や工兵の調練が行われている。腕に自信のある鍛冶師は、彼らに誂え向きの取り回しのよい武器や道具を製作し、同キャンプの輜重担当ナクトアール陸兵に渡してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 5 | レベル 1-10 | Bronze Cross-pein Hammer ×2 (`6020004`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 10 | レベル 11-20 | Bronze Spatha ×3 (`4030004`) | 5 | Bronze Ingot ×3 (`10002011`) |
| 3 | 15 | レベル 11-20 | Bronze Raising Hammer ×4 (`6030010`) | 6 | Bronze Ingot ×3 (`10002011`) |
| 4 | 35 | レベル 31-40 | Steel Longsword ×5 (`4030405`) | 7 | Steel Ingot ×3 (`10002013`) |

### `120067` — Waiting on Weapons

- Japanese title: `キャンプ・アイアンレイク：兵装納品`
- Leve location ID: `1026`
- Delivery display-name ID: `2200258`
- Plate/border: `20034` / `20005`

キャンプ・アイアンレイクへ向けて出発した補給隊が、また消息を絶った。同キャンプはコボルド族が実効支配するオ・ゴモロに近く、このまま補給を絶やしているのは非常に危険だ。腕と勇気のある鍛冶師は、なんとか兵士の武装だけでも新たに製作し、補給隊に代わって同キャンプ輜重担当ワイマー陸兵の元に送り届けてもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 40 | レベル 41-50 | Mythril Knife ×2 (`4030116`) | 4 | Mythril Ingot ×3 (`10003015`) |
| 2 | 45 | レベル 41-50 | Cobalt Knuckles ×3 (`4020209`) | 5 | Cobalt Ingot ×3 (`10002015`) |
| 3 | 45 | レベル 41-50 | Buccaneer's Bardiche ×4 (`4040305`) | 6 | Cobalt Ingot ×3 (`10002015`) |
| 4 | 50 | レベル 51-60 | Cobalt Winglet ×5 (`4030406`) | 7 | Cobalt Ingot ×3 (`10002015`) |

## Gridania

### `120201` — A Mother's Metallurgy

- Japanese title: `初級鍛冶師向けの仕事`
- Leve location ID: `2017`
- Delivery display-name ID: `1300085`
- Plate/border: `20033` / `20005`

「カーラインカフェ」のマスターが調理設備の補修部品を欲しがっている。初級の鍛冶師でもいい。引き受ける気があるなら、キャンプ・ベントブランチに赴き、マニヌから余剰素材を受け取って、その場で補修部品をこしらえたあと、彼女に渡してくれ。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 1 | レベル 1-10 | Bronze Ingot ×2 (`10002011`) | 4 | Bronze Cross-pein Hammer ×1 (`6020004`) |
| 2 | 1 | レベル 1-10 | Bronze Ingot ×3 (`10002011`) | 5 | Hempen Kurta ×1 (`8032501`) |
| 3 | 1 | レベル 1-10 | Bronze Ingot ×4 (`10002011`) | 6 | Hempen Halfgloves ×1 (`8070320`) |
| 4 | 1 | レベル 1-10 | Bronze Ingot ×5 (`10002011`) | 7 | Sheepskin Shoes ×1 (`8080615`) |

### `120209` — It's All in the File

- Japanese title: `製作依頼：槍研ぎ用のファイル`
- Leve location ID: `2001`
- Delivery display-name ID: `1100374`
- Plate/border: `20033` / `20005`

鬼哭隊が、損耗激しい槍の穂先を研ぐためのファイルを欲している。作ることができる鍛冶師は、納品を一任されている商人マイセンタの下を訪ね、来週の大規模パトロールに間に合うように、ファイルを揃えるのを手伝ってもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 10 | レベル 11-20 | Bronze File ×2 (`6021003`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 20 | レベル 21-30 | Iron File ×3 (`6021004`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 35 | レベル 31-40 | Steel File ×4 (`6021005`) | 6 | Steel Ingot ×3 (`10002013`) |
| 4 | 45 | レベル 41-50 | Mythril File ×5 (`6021007`) | 7 | Mythril Ingot ×3 (`10003015`) |

### `120221` — Training in Bentbranch

- Japanese title: `キャンプ・ベントブランチ：鍛冶製品納品`
- Leve location ID: `2017`
- Delivery display-name ID: `1100050`
- Plate/border: `20034` / `20005`

キャンプ・ベントブランチでは、近々の大規模な訓練実施に伴い、ある鍛冶製品を必要としている。しかし、予想していたより発注量が多く、我が社の力だけでは必要な製品数を確保する見込みすらたっていないのが現状だ。我こそはと思う鍛冶師は、指定の品を製作。同キャンプの輜重担当アイレドに配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 5 | レベル 1-10 | Bronze Pickaxe ×2 (`7010004`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 30 | レベル 21-30 | Iron Head Knife ×3 (`6050012`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 25 | レベル 21-30 | Iron Dolabra ×4 (`7010010`) | 6 | Iron Ingot ×3 (`10002012`) |
| 4 | 40 | レベル 41-50 | Mythril Head Knife ×5 (`6050014`) | 7 | Mythril Ingot ×3 (`10003015`) |

### `120231` — Re-crating the Scene

- Japanese title: `キャンプ・ナインアイビー：鍛冶製品納品`
- Leve location ID: `2021`
- Delivery display-name ID: `1600205`
- Plate/border: `20034` / `20005`

キャンプ・ナインアイビーでは、近々の大規模な訓練実施に伴い、ある鍛冶製品を必要としている。しかし、予想していたより発注量が多く、我が社の力だけでは必要な製品数を確保する見込みすらたっていないのが現状だ。我こそはと思う鍛冶師は、指定の品を製作。同キャンプの輜重担当トルーグムールに配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 40 | レベル 41-50 | Steel Cross-pein Hammer ×2 (`6020012`) | 4 | Steel Ingot ×3 (`10002013`) |
| 2 | 40 | レベル 41-50 | Mythril Saw ×3 (`6010014`) | 5 | Mythril Ingot ×3 (`10003015`) |
| 3 | 50 | レベル 51-60 | Cobalt Dolabra ×4 (`7010013`) | 6 | Cobalt Ingot ×3 (`10002015`) |
| 4 | 50 | レベル 51-60 | Bas-relief Cobalt Saw ×5 (`6010015`) | 7 | Cobalt Ingot ×3 (`10002015`) |

### `120239` — Training in Emerald Moss

- Japanese title: `キャンプ・エメラルドモス：鍛冶製品納品`
- Leve location ID: `2025`
- Delivery display-name ID: `1400069`
- Plate/border: `20034` / `20005`

キャンプ・エメラルドモスでは、近々の大規模な訓練実施に伴い、ある鍛冶製品を必要としている。しかし、予想していたより発注量が多く、我が社の力だけでは必要な製品数を確保する見込みすらたっていないのが現状だ。我こそはと思う鍛冶師は、指定の品を製作。同キャンプの輜重担当ブブナッカに配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 10 | レベル 11-20 | Bronze Labrys ×2 (`4040103`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 30 | レベル 31-40 | Steel Bardiche ×3 (`4040304`) | 5 | Steel Ingot ×3 (`10002013`) |
| 3 | 40 | レベル 41-50 | Mythril Claws ×4 (`4020307`) | 6 | Mythril Ingot ×3 (`10003015`) |
| 4 | 50 | レベル 51-60 | Demilune Bhuj ×5 (`4040207`) | 7 | Cobalt Ingot ×3 (`10002015`) |

## Ul'dah

### `120401` — Momodi's Dancing Daggers

- Japanese title: `新米鍛冶師向けの仕事`
- Leve location ID: `3011`
- Delivery display-name ID: `1200106`
- Plate/border: `20033` / `20005`

「クイックサンド」のマスターが冒険者に売る短剣を欲しがっている。新米鍛冶師でもいい。引き受ける気があるなら、キャンプ・ブラックブラッシュに赴き、ルドブランから余剰素材を受け取って、その場で短剣を鍛えたあと、彼に渡してくれ。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 1 | レベル 1-10 | Bronze Dagger ×2 (`4030110`) | 4 | Bronze Cross-pein Hammer ×1 (`6020004`) |
| 2 | 1 | レベル 1-10 | Bronze Dagger ×3 (`4030110`) | 5 | Hempen Kurta ×1 (`8032501`) |
| 3 | 1 | レベル 1-10 | Bronze Dagger ×4 (`4030110`) | 6 | Hempen Halfgloves ×1 (`8070320`) |
| 4 | 1 | レベル 1-10 | Bronze Dagger ×5 (`4030110`) | 7 | Sheepskin Shoes ×1 (`8080615`) |

### `120409` — Pointy Props

- Japanese title: `製作依頼：剣闘試合用の剣`
- Leve location ID: `3509`
- Delivery display-name ID: `1600214`
- Plate/border: `20033` / `20005`

コロセウムのショーを盛り上げるために、試合中追加される剣が不足している。腕に覚えのある鍛冶師は、ウヴィルシングの下を訪ね、来週の試合に間に合うよう、指定の剣を鍛えてもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 20 | レベル 21-30 | Iron Shortsword ×2 (`4030203`) | 4 | Iron Ingot ×3 (`10002012`) |
| 2 | 25 | レベル 21-30 | Iron Spatha ×3 (`4030008`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 30 | レベル 31-40 | Steel Falchion ×4 (`4030304`) | 6 | Steel Ingot ×3 (`10002013`) |
| 4 | 45 | レベル 41-50 | Cobalt Katzbalger ×5 (`4030204`) | 7 | Cobalt Ingot ×3 (`10002015`) |

### `120423` — Hammering the Point

- Japanese title: `キャンプ・ブラックブラッシュ：鍛冶製品納品`
- Leve location ID: `3011`
- Delivery display-name ID: `1500060`
- Plate/border: `20034` / `20005`

キャンプ・ブラックブラッシュから、ある鍛冶製品を納品してほしい、との緊急依頼が舞い込んだ。しかし、納期まで日がなく、我が社単独で必要な製品数を確保できる見込みがたたない。もし、腕自慢の鍛冶師がこれを読んでいたら、至急、指定の製品を製作。同キャンプの輜重担当ミミナ陸兵に配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 5 | レベル 1-10 | Bronze Hatchet ×2 (`7020009`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 20 | レベル 21-30 | Iron Culinary Knife ×3 (`6081005`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 30 | レベル 31-40 | Steel Mortar ×4 (`6071006`) | 6 | Steel Ingot ×3 (`10002013`) |
| 4 | 45 | レベル 41-50 | Mythril Culinary Knife ×5 (`6081007`) | 7 | Mythril Ingot ×3 (`10003015`) |

### `120434` — Molten Metal

- Japanese title: `キャンプ・ドライボーン：鍛冶製品納品`
- Leve location ID: `3014`
- Delivery display-name ID: `1100072`
- Plate/border: `20034` / `20005`

キャンプ・ドライボーンから、ある鍛冶製品を納品してほしい、との緊急依頼が舞い込んだ。しかし、納期まで日がなく、我が社単独で必要な製品数を確保できる見込みがたたない。もし、腕自慢の鍛冶師がこれを読んでいたら、至急、指定の製品を製作。同キャンプの輜重担当フレディスィサ陸兵に配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 10 | レベル 11-20 | Bronze Knuckles ×2 (`4020206`) | 4 | Bronze Ingot ×3 (`10002011`) |
| 2 | 20 | レベル 21-30 | Iron Sledgehammer ×3 (`7010104`) | 5 | Iron Ingot ×3 (`10002012`) |
| 3 | 25 | レベル 21-30 | Spiked Knuckles ×4 (`4020208`) | 6 | Iron Ingot ×3 (`10002012`) |
| 4 | 45 | レベル 41-50 | Mythril Sledgehammer ×5 (`7010107`) | 7 | Mythril Ingot ×3 (`10003015`) |

### `120442` — Looking to Horizon

- Japanese title: `キャンプ・ホライズン：鍛冶製品納品`
- Leve location ID: `3018`
- Delivery display-name ID: `1600028`
- Plate/border: `20034` / `20005`

キャンプ・ホライズンから、ある鍛冶製品を納品してほしい、との緊急依頼が舞い込んだ。しかし、納期まで日がなく、我が社単独で必要な製品数を確保できる見込みがたたない。もし、腕自慢の鍛冶師がこれを読んでいたら、至急、指定の製品を製作。同キャンプの輜重担当アイストラッハ陸兵に配送してもらいたい。

| Variant | Level | Source band | Requested product | Attempts | Success reward |
|---:|---:|---|---|---:|---|
| 1 | 20 | レベル 11-20 | Iron Awl ×2 (`6051005`) | 4 | Iron Ingot ×3 (`10002012`) |
| 2 | 35 | レベル 31-40 | Steel Pliers ×3 (`6031006`) | 5 | Steel Ingot ×3 (`10002013`) |
| 3 | 45 | レベル 41-50 | Mythril Awl ×4 (`6051007`) | 6 | Mythril Ingot ×3 (`10003015`) |
| 4 | 50 | レベル 51-60 | Cobalt Raising Hammer ×5 (`6030015`) | 7 | Cobalt Ingot ×3 (`10002015`) |
