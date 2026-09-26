# 111805 com0u5: reconstructed client path templates

## processEventAubreyHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x480]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x48C]
eventOwner:say(quest, 93.0, 0.0)  [pc 11, 0x4A0]
eventOwner:say(quest, 94.0, 0.0)  [pc 16, 0x4B4]
eventOwner:_runCharaScheduler(354082816.0)  [pc 19, 0x4C0]
eventOwner:say(quest, 95.0, 0.0)  [pc 24, 0x4D4]
eventOwner:say(quest, 96.0, 0.0)  [pc 29, 0x4E8]
eventOwner:say(quest, 97.0, 0.0)  [pc 34, 0x4FC]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x504]
return 
```

## processEventAubreyStart — 3 parameters
### Path 1

```text
require (call36.1.return1 == 1.0) is true  [pc 37, 0x66D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5E5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x5F1]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x605]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x619]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x62D]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0x639]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x64D]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x661]
call36.1.return1 = quest:showQuestInfomation()  [pc 36, 0x669]
eventOwner:_runCharaScheduler(353968128.0)  [pc 41, 0x67D]
eventOwner:say(quest, 8.0, 0.0)  [pc 46, 0x691]
eventOwner:finishCliantTalkTurn()  [pc 57, 0x6BD]
return call36.1.return1
```

### Path 2

```text
require (call36.1.return1 == 1.0) is false  [pc 37, 0x66D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5E5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x5F1]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x605]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x619]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x62D]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0x639]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x64D]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x661]
call36.1.return1 = quest:showQuestInfomation()  [pc 36, 0x669]
eventOwner:_runCharaScheduler(353959936.0)  [pc 50, 0x6A1]
eventOwner:say(quest, 7.0, 0.0)  [pc 55, 0x6B5]
eventOwner:finishCliantTalkTurn()  [pc 57, 0x6BD]
return call36.1.return1
```

## processEvent000_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7D6]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x7E2]
eventOwner:say(quest, 9.0, 0.0)  [pc 11, 0x7F6]
eventOwner:say(quest, 10.0, 0.0)  [pc 16, 0x80A]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x812]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x8CF]
eventOwner:_runCharaScheduler(69197824.0)  [pc 6, 0x8DB]
eventOwner:say(quest, 12.0, 0.0)  [pc 11, 0x8EF]
eventOwner:say(quest, 75.0, 0.0)  [pc 16, 0x903]
eventOwner:say(quest, 13.0, 0.0)  [pc 21, 0x917]
eventOwner:_runCharaScheduler(353968128.0)  [pc 24, 0x923]
eventOwner:say(quest, 14.0, 0.0)  [pc 29, 0x937]
eventOwner:say(quest, 15.0, 0.0)  [pc 34, 0x94B]
eventOwner:say(quest, 79.0, 0.0)  [pc 39, 0x95F]
eventOwner:_runCharaScheduler(354050048.0)  [pc 42, 0x96B]
eventOwner:say(quest, 16.0, 0.0)  [pc 47, 0x97F]
eventOwner:finishCliantTalkTurn()  [pc 49, 0x987]
return 
```

## processEvent010_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA83]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0xA8F]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0xAA3]
eventOwner:say(quest, 80.0, 0.0)  [pc 16, 0xAB7]
eventOwner:say(quest, 18.0, 0.0)  [pc 21, 0xACB]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xAD3]
return 
```

## processEvent010_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB99]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xBA5]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0xBB9]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xBC1]
return 
```

## processEvent010_4 — 3 parameters
### Path 1

```text
eventOwner:say(quest, 78.0, 0.0)  [pc 4, 0xC79]
return 
```

## processEvent010_5 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCD0]
eventOwner:say(quest, 76.0, 0.0)  [pc 8, 0xCE4]
eventOwner:finishCliantTalkTurn()  [pc 10, 0xCEC]
return 
```

## processEvent010_6 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD7F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xD8B]
eventOwner:say(quest, 77.0, 0.0)  [pc 11, 0xD9F]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xDA7]
return 
```

## processEvent015 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE5B]
eventOwner:say(quest, 20.0, 0.0)  [pc 8, 0xE6F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 11, 0xE7B]
eventOwner:say(quest, 21.0, 0.0)  [pc 16, 0xE8F]
eventOwner:say(quest, 22.0, 0.0)  [pc 21, 0xEA3]
eventOwner:say(quest, 23.0, 0.0)  [pc 26, 0xEB7]
eventOwner:_runCharaScheduler(69197824.0)  [pc 29, 0xEC3]
eventOwner:say(quest, 24.0, 0.0)  [pc 34, 0xED7]
eventOwner:say(quest, 25.0, 0.0)  [pc 39, 0xEEB]
eventOwner:finishCliantTalkTurn()  [pc 41, 0xEF3]
return 
```

## processEvent015_2 — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(353976320.0)  [pc 2, 0xFD9]
eventOwner:say(quest, 81.0, 0.0)  [pc 7, 0xFED]
return 
```

## processEvent015_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1065]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1071]
eventOwner:say(quest, 82.0, 0.0)  [pc 11, 0x1085]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x108D]
return 
```

## processEvent015_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1141]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x114D]
eventOwner:say(quest, 83.0, 0.0)  [pc 11, 0x1161]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1169]
return 
```

## processEvent020 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x121D]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x1229]
eventOwner:say(quest, 26.0, 0.0)  [pc 11, 0x123D]
eventOwner:say(quest, 86.0, 0.0)  [pc 16, 0x1251]
quest:startFadeOut(player, 1.0)  [pc 20, 0x1261]
quest:_wait(1.0)  [pc 23, 0x126D]
eventOwner:_runCharaScheduler(354086912.0)  [pc 26, 0x1279]
quest:startFadeIn(player, 1.0)  [pc 30, 0x1289]
eventOwner:say(quest, 27.0, 0.0)  [pc 35, 0x129D]
eventOwner:say(quest, 84.0, 0.0)  [pc 40, 0x12B1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 43, 0x12BD]
eventOwner:say(quest, 28.0, 0.0)  [pc 48, 0x12D1]
eventOwner:say(quest, 87.0, 0.0)  [pc 53, 0x12E5]
eventOwner:say(quest, 29.0, 0.0)  [pc 58, 0x12F9]
eventOwner:_runCharaScheduler(353968128.0)  [pc 61, 0x1305]
eventOwner:say(quest, 30.0, 0.0)  [pc 66, 0x1319]
eventOwner:say(quest, 31.0, 0.0)  [pc 71, 0x132D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 74, 0x1339]
eventOwner:say(quest, 32.0, 0.0)  [pc 79, 0x134D]
eventOwner:finishCliantTalkTurn()  [pc 81, 0x1355]
return 
```

## processEvent020_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14AC]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x14B8]
eventOwner:say(quest, 33.0, 0.0)  [pc 11, 0x14CC]
eventOwner:say(quest, 34.0, 0.0)  [pc 16, 0x14E0]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x14E8]
return 
```

## processEvent020_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x15A5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x15B1]
eventOwner:say(quest, 99.0, 0.0)  [pc 11, 0x15C5]
eventOwner:say(quest, 100.0, 0.0)  [pc 16, 0x15D9]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x15E1]
return 
```

## processEvent025 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x169A]
quest:startNQCutScene('com0u610', 1.0)  [pc 6, 0x16AA]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0x16B6]
return 
```

## processEvent030 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 48, 0x1815]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1761]
eventOwner:say(quest, 59.0, 0.0)  [pc 8, 0x1775]
eventOwner:_runCharaScheduler(353968128.0)  [pc 11, 0x1781]
eventOwner:say(quest, 60.0, 0.0)  [pc 16, 0x1795]
eventOwner:say(quest, 61.0, 0.0)  [pc 21, 0x17A9]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0x17B5]
eventOwner:say(quest, 62.0, 0.0)  [pc 29, 0x17C9]
eventOwner:say(quest, 89.0, 0.0)  [pc 34, 0x17DD]
eventOwner:say(quest, 63.0, 0.0)  [pc 39, 0x17F1]
eventOwner:say(quest, 64.0, 0.0)  [pc 44, 0x1805]
eventOwner:_runCharaScheduler(353968128.0)  [pc 47, 0x1811]
eventOwner:say(quest, 65.0, 0.0)  [pc 54, 0x182D]
eventOwner:say(quest, 66.0, 0.0)  [pc 59, 0x1841]
eventOwner:_runCharaScheduler(353959936.0)  [pc 78, 0x188D]
eventOwner:say(quest, 68.0, 0.0)  [pc 83, 0x18A1]
eventOwner:say(quest, 69.0, 0.0)  [pc 88, 0x18B5]
eventOwner:_runCharaScheduler(354107392.0)  [pc 91, 0x18C1]
eventOwner:say(quest, 70.0, 0.0)  [pc 96, 0x18D5]
quest:_wait(2.0)  [pc 99, 0x18E1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 102, 0x18ED]
quest:_wait(2.0)  [pc 105, 0x18F9]
eventOwner:say(quest, 71.0, 0.0)  [pc 110, 0x190D]
eventOwner:say(quest, 72.0, 0.0)  [pc 115, 0x1921]
eventOwner:say(quest, 73.0, 0.0)  [pc 120, 0x1935]
eventOwner:_runCharaScheduler(353968128.0)  [pc 123, 0x1941]
eventOwner:say(quest, 74.0, 0.0)  [pc 128, 0x1955]
eventOwner:finishCliantTalkTurn()  [pc 130, 0x195D]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 48, 0x1815]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1761]
eventOwner:say(quest, 59.0, 0.0)  [pc 8, 0x1775]
eventOwner:_runCharaScheduler(353968128.0)  [pc 11, 0x1781]
eventOwner:say(quest, 60.0, 0.0)  [pc 16, 0x1795]
eventOwner:say(quest, 61.0, 0.0)  [pc 21, 0x17A9]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0x17B5]
eventOwner:say(quest, 62.0, 0.0)  [pc 29, 0x17C9]
eventOwner:say(quest, 89.0, 0.0)  [pc 34, 0x17DD]
eventOwner:say(quest, 63.0, 0.0)  [pc 39, 0x17F1]
eventOwner:say(quest, 64.0, 0.0)  [pc 44, 0x1805]
eventOwner:_runCharaScheduler(353968128.0)  [pc 47, 0x1811]
eventOwner:say(quest, 91.0, 0.0)  [pc 65, 0x1859]
eventOwner:say(quest, 92.0, 0.0)  [pc 70, 0x186D]
eventOwner:say(quest, 67.0, 0.0)  [pc 75, 0x1881]
eventOwner:_runCharaScheduler(353959936.0)  [pc 78, 0x188D]
eventOwner:say(quest, 68.0, 0.0)  [pc 83, 0x18A1]
eventOwner:say(quest, 69.0, 0.0)  [pc 88, 0x18B5]
eventOwner:_runCharaScheduler(354107392.0)  [pc 91, 0x18C1]
eventOwner:say(quest, 70.0, 0.0)  [pc 96, 0x18D5]
quest:_wait(2.0)  [pc 99, 0x18E1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 102, 0x18ED]
quest:_wait(2.0)  [pc 105, 0x18F9]
eventOwner:say(quest, 71.0, 0.0)  [pc 110, 0x190D]
eventOwner:say(quest, 72.0, 0.0)  [pc 115, 0x1921]
eventOwner:say(quest, 73.0, 0.0)  [pc 120, 0x1935]
eventOwner:_runCharaScheduler(353968128.0)  [pc 123, 0x1941]
eventOwner:say(quest, 74.0, 0.0)  [pc 128, 0x1955]
eventOwner:finishCliantTalkTurn()  [pc 130, 0x195D]
return 
```

## processEvent030_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AE2]
eventOwner:_runCharaScheduler(354058240.0)  [pc 6, 0x1AEE]
eventOwner:say(quest, 53.0, 0.0)  [pc 11, 0x1B02]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1B0A]
return 
```

## processEvent030_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1BBE]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1BCA]
eventOwner:say(quest, 54.0, 0.0)  [pc 11, 0x1BDE]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1BE6]
return 
```

## processEvent030_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1C9A]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x1CA6]
eventOwner:say(quest, 55.0, 0.0)  [pc 11, 0x1CBA]
eventOwner:say(quest, 88.0, 0.0)  [pc 16, 0x1CCE]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1CD6]
return 
```

## processEvent030_5 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1D93]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1D9F]
eventOwner:say(quest, 56.0, 0.0)  [pc 11, 0x1DB3]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1DBB]
return 
```

## processEvent030_6 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1E6F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1E7B]
eventOwner:say(quest, 57.0, 0.0)  [pc 11, 0x1E8F]
eventOwner:say(quest, 58.0, 0.0)  [pc 16, 0x1EA3]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1EAB]
return 
```

