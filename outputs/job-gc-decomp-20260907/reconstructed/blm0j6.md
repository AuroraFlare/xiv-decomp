# 111266 blm0j6: reconstructed client path templates

## processEventStartBeforeDaza — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x4A5]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x4B1]
eventOwner:say(quest, 95.0, 0.0)  [pc 11, 0x4C5]
eventOwner:say(quest, 96.0, 0.0)  [pc 16, 0x4D9]
worldMaster:say(quest, 97.0, 0.0)  [pc 22, 0x4F1]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x4F9]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call52.1.return1 == 1.0) is true  [pc 53, 0x698]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5D0]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x5DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x5F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x604]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x618]
eventOwner:_runCharaScheduler(70017024.0)  [pc 24, 0x624]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x638]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x64C]
eventOwner:say(quest, 91.0, 0.0)  [pc 39, 0x660]
quest:_wait(1.0)  [pc 42, 0x66C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 45, 0x678]
eventOwner:say(quest, 7.0, 0.0)  [pc 50, 0x68C]
call52.1.return1 = quest:showQuestInfomation()  [pc 52, 0x694]
eventOwner:say(quest, 9.0, 0.0)  [pc 59, 0x6B0]
eventOwner:finishCliantTalkTurn()  [pc 61, 0x6B8]
return call52.1.return1
```

### Path 2

```text
require (call52.1.return1 == 1.0) is false  [pc 53, 0x698]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5D0]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x5DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x5F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x604]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x618]
eventOwner:_runCharaScheduler(70017024.0)  [pc 24, 0x624]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x638]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x64C]
eventOwner:say(quest, 91.0, 0.0)  [pc 39, 0x660]
quest:_wait(1.0)  [pc 42, 0x66C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 45, 0x678]
eventOwner:say(quest, 7.0, 0.0)  [pc 50, 0x68C]
call52.1.return1 = quest:showQuestInfomation()  [pc 52, 0x694]
eventOwner:say(quest, 8.0, 0.0)  [pc 68, 0x6D4]
eventOwner:finishCliantTalkTurn()  [pc 70, 0x6DC]
return call52.1.return1
```

## processEventDaza01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x800]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x80C]
eventOwner:say(quest, 10.0, 0.0)  [pc 11, 0x820]
eventOwner:say(quest, 11.0, 0.0)  [pc 16, 0x834]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x83C]
return 
```

## processEventKazagg01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x8F9]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x905]
eventOwner:say(quest, 12.0, 0.0)  [pc 11, 0x919]
eventOwner:say(quest, 13.0, 0.0)  [pc 16, 0x92D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x935]
return 
```

## processEventLalai01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9F2]
eventOwner:say(quest, 92.0, 0.0)  [pc 8, 0xA06]
eventOwner:finishCliantTalkTurn()  [pc 10, 0xA0E]
return 
```

## processEventDozol01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAA1]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xAAD]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0xAC1]
eventOwner:say(quest, 15.0, 0.0)  [pc 16, 0xAD5]
eventOwner:_runCharaScheduler(70242304.0)  [pc 19, 0xAE1]
eventOwner:say(quest, 16.0, 0.0)  [pc 24, 0xAF5]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0xB09]
eventOwner:_runCharaScheduler(70017024.0)  [pc 32, 0xB15]
eventOwner:say(quest, 18.0, 0.0)  [pc 37, 0xB29]
eventOwner:say(quest, 100.0, 0.0)  [pc 42, 0xB3D]
eventOwner:say(quest, 19.0, 0.0)  [pc 47, 0xB51]
quest:_wait(1.0)  [pc 50, 0xB5D]
eventOwner:say(quest, 20.0, 0.0)  [pc 55, 0xB71]
eventOwner:_runCharaScheduler(70017024.0)  [pc 58, 0xB7D]
eventOwner:say(quest, 21.0, 0.0)  [pc 63, 0xB91]
eventOwner:finishCliantTalkTurn()  [pc 65, 0xB99]
return 
```

## processEventDaza02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCB2]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xCBE]
eventOwner:say(quest, 24.0, 0.0)  [pc 11, 0xCD2]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xCDA]
return 
```

## processEventDozol02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD8E]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xD9A]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0xDAE]
eventOwner:say(quest, 23.0, 0.0)  [pc 16, 0xDC2]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xDCA]
return 
```

## processEventKazagg02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE87]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xE93]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0xEA7]
eventOwner:say(quest, 26.0, 0.0)  [pc 16, 0xEBB]
eventOwner:_runCharaScheduler(70017024.0)  [pc 19, 0xEC7]
eventOwner:say(quest, 27.0, 0.0)  [pc 24, 0xEDB]
eventOwner:say(quest, 28.0, 0.0)  [pc 29, 0xEEF]
eventOwner:say(quest, 101.0, 0.0)  [pc 34, 0xF03]
eventOwner:say(quest, 29.0, 0.0)  [pc 39, 0xF17]
eventOwner:_runCharaScheduler(70017024.0)  [pc 42, 0xF23]
eventOwner:say(quest, 30.0, 0.0)  [pc 47, 0xF37]
eventOwner:say(quest, 31.0, 0.0)  [pc 52, 0xF4B]
eventOwner:finishCliantTalkTurn()  [pc 54, 0xF53]
return 
```

## processEventDaza03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1046]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x1052]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0x1066]
eventOwner:say(quest, 37.0, 0.0)  [pc 16, 0x107A]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1082]
return 
```

## processEventDozol03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x113F]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x114B]
eventOwner:say(quest, 34.0, 0.0)  [pc 11, 0x115F]
eventOwner:say(quest, 35.0, 0.0)  [pc 16, 0x1173]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x117B]
return 
```

## processEventKazagg03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1238]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x1244]
eventOwner:say(quest, 32.0, 0.0)  [pc 11, 0x1258]
eventOwner:say(quest, 33.0, 0.0)  [pc 16, 0x126C]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1274]
return 
```

## processEventLalai02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1331]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x133D]
eventOwner:say(quest, 38.0, 0.0)  [pc 11, 0x1351]
eventOwner:say(quest, 39.0, 0.0)  [pc 16, 0x1365]
quest:_wait(1.0)  [pc 19, 0x1371]
eventOwner:_runCharaScheduler(353964032.0)  [pc 22, 0x137D]
eventOwner:say(quest, 40.0, 0.0)  [pc 27, 0x1391]
eventOwner:say(quest, 41.0, 0.0)  [pc 32, 0x13A5]
eventOwner:_runCharaScheduler(353976320.0)  [pc 35, 0x13B1]
eventOwner:say(quest, 42.0, 0.0)  [pc 40, 0x13C5]
eventOwner:say(quest, 43.0, 0.0)  [pc 45, 0x13D9]
eventOwner:_runCharaScheduler(353959936.0)  [pc 48, 0x13E5]
eventOwner:say(quest, 44.0, 0.0)  [pc 53, 0x13F9]
eventOwner:say(quest, 45.0, 0.0)  [pc 58, 0x140D]
quest:_wait(1.5)  [pc 61, 0x1419]
eventOwner:_runCharaScheduler(353968128.0)  [pc 64, 0x1425]
eventOwner:say(quest, 46.0, 0.0)  [pc 69, 0x1439]
eventOwner:say(quest, 47.0, 0.0)  [pc 74, 0x144D]
eventOwner:_runCharaScheduler(353976320.0)  [pc 77, 0x1459]
eventOwner:say(quest, 48.0, 0.0)  [pc 82, 0x146D]
eventOwner:say(quest, 49.0, 0.0)  [pc 87, 0x1481]
eventOwner:say(quest, 105.0, 0.0)  [pc 92, 0x1495]
eventOwner:finishCliantTalkTurn()  [pc 94, 0x149D]
return 
```

## processEventDaza04 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x15FE]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x160A]
eventOwner:say(quest, 55.0, 0.0)  [pc 11, 0x161E]
eventOwner:say(quest, 56.0, 0.0)  [pc 16, 0x1632]
eventOwner:say(quest, 57.0, 0.0)  [pc 21, 0x1646]
eventOwner:say(quest, 58.0, 0.0)  [pc 26, 0x165A]
eventOwner:finishCliantTalkTurn()  [pc 28, 0x1662]
return 
```

## processEventDozol04 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1731]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x173D]
eventOwner:say(quest, 53.0, 0.0)  [pc 11, 0x1751]
eventOwner:say(quest, 54.0, 0.0)  [pc 16, 0x1765]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x176D]
return 
```

## processEventKazagg04 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x182A]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x1836]
eventOwner:say(quest, 52.0, 0.0)  [pc 11, 0x184A]
eventOwner:say(quest, 103.0, 0.0)  [pc 16, 0x185E]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1866]
return 
```

## processEventLalai03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1923]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x192F]
eventOwner:say(quest, 50.0, 0.0)  [pc 11, 0x1943]
eventOwner:say(quest, 51.0, 0.0)  [pc 16, 0x1957]
eventOwner:say(quest, 102.0, 0.0)  [pc 21, 0x196B]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x1973]
return 
```

## processEventNQ01 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x1A49]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1A35]
quest:startNQCutScene('blm0j610', 1.0)  [pc 6, 0x1A45]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x1A59]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x1A49]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1A35]
quest:startNQCutScene('blm0j610', 1.0)  [pc 6, 0x1A45]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x1A69]
return 
```

## processEventNQ02 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1B32]
quest:startNQCutScene('blm0j620', 1.0)  [pc 6, 0x1B42]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0x1B4E]
return 
```

## processEventNQ03 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1BF5]
quest:startNQCutScene('blm0j620', 1.0)  [pc 6, 0x1C05]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x1C11]
return 
```

## processEventAfget — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 106.0)  [pc 4, 0x1CBE]
quest:_wait(8.0)  [pc 7, 0x1CCA]
quest:showGetJobAbilityWidget(player, 27316.0, 2.0)  [pc 12, 0x1CDE]
quest:_wait(6.0)  [pc 15, 0x1CEA]
quest:showGetJobItemWidget(player, arg4)  [pc 19, 0x1CFA]
quest:_wait(6.0)  [pc 22, 0x1D06]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111266.0, 26.0)  [pc 6, 0x1DF6]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111266.0, 26.0)  [pc 6, 0x1E73]
return 
```

