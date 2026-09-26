# 111405 com0l5: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3BF]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x3CB]
eventOwner:say(quest, 72.0, 0.0)  [pc 11, 0x3DF]
eventOwner:say(quest, 73.0, 0.0)  [pc 16, 0x3F3]
eventOwner:say(quest, 74.0, 0.0)  [pc 21, 0x407]
eventOwner:say(quest, 75.0, 0.0)  [pc 26, 0x41B]
eventOwner:_runCharaScheduler(354000896.0)  [pc 29, 0x427]
eventOwner:say(quest, 76.0, 0.0)  [pc 34, 0x43B]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x443]
return 
```

## processEventGUINCUMStart — 3 parameters
### Path 1

```text
require (call33.1.return1 == 1.0) is true  [pc 34, 0x5A0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x524]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x538]
eventOwner:_runCharaScheduler(354058240.0)  [pc 11, 0x544]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x558]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x56C]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x580]
eventOwner:say(quest, 6.0, 0.0)  [pc 31, 0x594]
call33.1.return1 = quest:showQuestInfomation()  [pc 33, 0x59C]
eventOwner:_runCharaScheduler(354168832.0)  [pc 38, 0x5B0]
eventOwner:say(quest, 8.0, 0.0)  [pc 43, 0x5C4]
eventOwner:finishCliantTalkTurn()  [pc 54, 0x5F0]
return call33.1.return1
```

### Path 2

```text
require (call33.1.return1 == 1.0) is false  [pc 34, 0x5A0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x524]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x538]
eventOwner:_runCharaScheduler(354058240.0)  [pc 11, 0x544]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x558]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x56C]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x580]
eventOwner:say(quest, 6.0, 0.0)  [pc 31, 0x594]
call33.1.return1 = quest:showQuestInfomation()  [pc 33, 0x59C]
eventOwner:_runCharaScheduler(354078720.0)  [pc 47, 0x5D4]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x5E8]
eventOwner:finishCliantTalkTurn()  [pc 54, 0x5F0]
return call33.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x709]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x715]
eventOwner:say(quest, 9.0, 0.0)  [pc 11, 0x729]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x731]
return 
```

## processEvent_005_merlwyb — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7E5]
eventOwner:say(quest, 10.0, 0.0)  [pc 8, 0x7F9]
eventOwner:_runCharaScheduler(365010944.0)  [pc 11, 0x805]
eventOwner:say(quest, 11.0, 0.0)  [pc 16, 0x819]
eventOwner:say(quest, 12.0, 0.0)  [pc 21, 0x82D]
eventOwner:_runCharaScheduler(364998656.0)  [pc 24, 0x839]
eventOwner:say(quest, 13.0, 0.0)  [pc 29, 0x84D]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x861]
eventOwner:_runCharaScheduler(79847424.0)  [pc 37, 0x86D]
eventOwner:say(quest, 14.0, 0.0)  [pc 42, 0x881]
eventOwner:say(quest, 15.0, 0.0)  [pc 47, 0x895]
eventOwner:_runCharaScheduler(365002752.0)  [pc 50, 0x8A1]
eventOwner:say(quest, 16.0, 0.0)  [pc 55, 0x8B5]
eventOwner:say(quest, 61.0, 0.0)  [pc 60, 0x8C9]
eventOwner:finishCliantTalkTurn()  [pc 62, 0x8D1]
return 
```

## processEvent_005_merlwyb_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9E8]
eventOwner:_runCharaScheduler(365002752.0)  [pc 6, 0x9F4]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0xA08]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA10]
return 
```

## processEvent_005_uri — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAC4]
eventOwner:say(quest, 18.0, 0.0)  [pc 8, 0xAD8]
eventOwner:_runCharaScheduler(83906560.0)  [pc 11, 0xAE4]
eventOwner:say(quest, 19.0, 0.0)  [pc 16, 0xAF8]
eventOwner:say(quest, 20.0, 0.0)  [pc 21, 0xB0C]
eventOwner:say(quest, 66.0, 0.0)  [pc 26, 0xB20]
eventOwner:say(quest, 21.0, 0.0)  [pc 31, 0xB34]
eventOwner:_runCharaScheduler(354099200.0)  [pc 34, 0xB40]
eventOwner:say(quest, 22.0, 0.0)  [pc 39, 0xB54]
eventOwner:say(quest, 23.0, 0.0)  [pc 44, 0xB68]
eventOwner:say(quest, 24.0, 0.0)  [pc 49, 0xB7C]
eventOwner:finishCliantTalkTurn()  [pc 51, 0xB84]
return 
```

## processEvent_005_uri_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC80]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0xC8C]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0xCA0]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xCA8]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD58]
quest:startNQCutScene('COM0l110', 1.0, 0.0)  [pc 7, 0xD6C]
quest:startFadeInCutSceneAfterWarp(player)  [pc 10, 0xD78]
return 
```

## processEvent_015_01 — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE30]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0xE3C]
eventOwner:say(quest, 47.0, 0.0)  [pc 11, 0xE50]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE58]
return 
```

## processEvent_015_02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF0C]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0xF18]
eventOwner:say(quest, 48.0, 0.0)  [pc 11, 0xF2C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF34]
return 
```

## processEvent_015_03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFE8]
eventOwner:_runCharaScheduler(354177024.0)  [pc 6, 0xFF4]
eventOwner:say(quest, 62.0, 0.0)  [pc 11, 0x1008]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1010]
return 
```

## processEvent_015_04 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10C4]
eventOwner:_runCharaScheduler(354172928.0)  [pc 6, 0x10D0]
eventOwner:say(quest, 63.0, 0.0)  [pc 11, 0x10E4]
eventOwner:say(quest, 65.0, 0.0)  [pc 16, 0x10F8]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1100]
return 
```

## processEvent_015 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 66, 0x12B9]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11BD]
eventOwner:say(quest, 51.0, 0.0)  [pc 8, 0x11D1]
eventOwner:say(quest, 71.0, 0.0)  [pc 13, 0x11E5]
eventOwner:_runCharaScheduler(354107392.0)  [pc 16, 0x11F1]
quest:_wait(3.0)  [pc 19, 0x11FD]
eventOwner:say(quest, 68.0, 0.0)  [pc 24, 0x1211]
eventOwner:say(quest, 52.0, 0.0)  [pc 29, 0x1225]
eventOwner:say(quest, 53.0, 0.0)  [pc 34, 0x1239]
eventOwner:_runCharaScheduler(354078720.0)  [pc 37, 0x1245]
eventOwner:say(quest, 54.0, 0.0)  [pc 42, 0x1259]
eventOwner:say(quest, 55.0, 0.0)  [pc 47, 0x126D]
eventOwner:say(quest, 56.0, 0.0)  [pc 52, 0x1281]
eventOwner:_runCharaScheduler(354099200.0)  [pc 55, 0x128D]
eventOwner:say(quest, 57.0, 0.0)  [pc 60, 0x12A1]
eventOwner:say(quest, 58.0, 0.0)  [pc 65, 0x12B5]
eventOwner:_runCharaScheduler(353980416.0)  [pc 70, 0x12C9]
eventOwner:say(quest, 59.0, 0.0)  [pc 75, 0x12DD]
eventOwner:_runCharaScheduler(354103296.0)  [pc 97, 0x1335]
eventOwner:say(quest, 60.0, 0.0)  [pc 102, 0x1349]
eventOwner:finishCliantTalkTurn()  [pc 104, 0x1351]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 66, 0x12B9]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11BD]
eventOwner:say(quest, 51.0, 0.0)  [pc 8, 0x11D1]
eventOwner:say(quest, 71.0, 0.0)  [pc 13, 0x11E5]
eventOwner:_runCharaScheduler(354107392.0)  [pc 16, 0x11F1]
quest:_wait(3.0)  [pc 19, 0x11FD]
eventOwner:say(quest, 68.0, 0.0)  [pc 24, 0x1211]
eventOwner:say(quest, 52.0, 0.0)  [pc 29, 0x1225]
eventOwner:say(quest, 53.0, 0.0)  [pc 34, 0x1239]
eventOwner:_runCharaScheduler(354078720.0)  [pc 37, 0x1245]
eventOwner:say(quest, 54.0, 0.0)  [pc 42, 0x1259]
eventOwner:say(quest, 55.0, 0.0)  [pc 47, 0x126D]
eventOwner:say(quest, 56.0, 0.0)  [pc 52, 0x1281]
eventOwner:_runCharaScheduler(354099200.0)  [pc 55, 0x128D]
eventOwner:say(quest, 57.0, 0.0)  [pc 60, 0x12A1]
eventOwner:say(quest, 58.0, 0.0)  [pc 65, 0x12B5]
eventOwner:_runCharaScheduler(354099200.0)  [pc 79, 0x12ED]
eventOwner:say(quest, 64.0, 0.0)  [pc 84, 0x1301]
eventOwner:say(quest, 69.0, 0.0)  [pc 89, 0x1315]
eventOwner:say(quest, 70.0, 0.0)  [pc 94, 0x1329]
eventOwner:_runCharaScheduler(354103296.0)  [pc 97, 0x1335]
eventOwner:say(quest, 60.0, 0.0)  [pc 102, 0x1349]
eventOwner:finishCliantTalkTurn()  [pc 104, 0x1351]
return 
```

## processEvent_elevator_nq1 — 3 parameters
### Path 1

```text
require (call16.1.return1 == 1.0) is true  [pc 17, 0x14FC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14C4]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0x14D0]
eventOwner:say(quest, 78.0, 0.0)  [pc 11, 0x14E4]
call16.1.return1 = eventOwner:ask(quest, 79.0, 2.0)  [pc 16, 0x14F8]
quest:startFadeOutCutSceneDefault(player)  [pc 21, 0x150C]
quest:startNQCutScene('elv0l110', 1.0, 0.0)  [pc 26, 0x1520]
quest:startNQCutScene('com0l610', 1.0, 0.0)  [pc 31, 0x1534]
quest:startFadeInCutSceneAfterWarp(player)  [pc 34, 0x1540]
eventOwner:finishCliantTalkTurn()  [pc 42, 0x1560]
return call16.1.return1
```

### Path 2

```text
require (call16.1.return1 == 1.0) is false  [pc 17, 0x14FC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14C4]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0x14D0]
eventOwner:say(quest, 78.0, 0.0)  [pc 11, 0x14E4]
call16.1.return1 = eventOwner:ask(quest, 79.0, 2.0)  [pc 16, 0x14F8]
eventOwner:say(quest, 82.0, 0.0)  [pc 40, 0x1558]
eventOwner:finishCliantTalkTurn()  [pc 42, 0x1560]
return call16.1.return1
```

## processEvent_elevator_nq2 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0x16DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x16B0]
eventOwner:say(quest, 78.0, 0.0)  [pc 8, 0x16C4]
call13.1.return1 = eventOwner:ask(quest, 79.0, 2.0)  [pc 13, 0x16D8]
quest:startFadeOutCutSceneDefault(player)  [pc 18, 0x16EC]
quest:startNQCutScene('elv0l110', 1.0, 0.0)  [pc 23, 0x1700]
quest:startFadeInCutSceneAfterWarp(player)  [pc 26, 0x170C]
eventOwner:finishCliantTalkTurn()  [pc 34, 0x172C]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0x16DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x16B0]
eventOwner:say(quest, 78.0, 0.0)  [pc 8, 0x16C4]
call13.1.return1 = eventOwner:ask(quest, 79.0, 2.0)  [pc 13, 0x16D8]
eventOwner:say(quest, 82.0, 0.0)  [pc 32, 0x1724]
eventOwner:finishCliantTalkTurn()  [pc 34, 0x172C]
return call13.1.return1
```

## processEventExit — 3 parameters
### Path 1

```text
call6.1.return1 = worldMaster:ask(quest, worldMaster, 51036.0, 2.0)  [pc 6, 0x1859]
return call6.1.return1
```

