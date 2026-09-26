# 111806 com0u6: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x496]
eventOwner:_runCharaScheduler(354172928.0)  [pc 6, 0x4A2]
eventOwner:say(quest, 70.0, 0.0)  [pc 11, 0x4B6]
eventOwner:say(quest, 71.0, 0.0)  [pc 16, 0x4CA]
eventOwner:say(quest, 72.0, 0.0)  [pc 21, 0x4DE]
eventOwner:_runCharaScheduler(353976320.0)  [pc 24, 0x4EA]
eventOwner:say(quest, 73.0, 0.0)  [pc 29, 0x4FE]
eventOwner:say(quest, 74.0, 0.0)  [pc 34, 0x512]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x51A]
return 
```

## processEventAUBREYStart — 3 parameters
### Path 1

```text
require (call101.1.return1 == 1.0) is true  [pc 102, 0x787]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5FB]
eventOwner:_runCharaScheduler(354172928.0)  [pc 6, 0x607]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x61B]
quest:startFadeOut(player, 1.0)  [pc 15, 0x62B]
quest:_wait(1.0)  [pc 18, 0x637]
eventOwner:_runCharaScheduler(354086912.0)  [pc 21, 0x643]
quest:startFadeIn(player, 1.0)  [pc 25, 0x653]
eventOwner:say(quest, 76.0, 0.0)  [pc 30, 0x667]
eventOwner:say(quest, 3.0, 0.0)  [pc 35, 0x67B]
eventOwner:say(quest, 4.0, 0.0)  [pc 40, 0x68F]
eventOwner:_runCharaScheduler(353976320.0)  [pc 43, 0x69B]
eventOwner:say(quest, 5.0, 0.0)  [pc 48, 0x6AF]
eventOwner:say(quest, 6.0, 0.0)  [pc 53, 0x6C3]
eventOwner:say(quest, 7.0, 0.0)  [pc 58, 0x6D7]
eventOwner:_runCharaScheduler(353984512.0)  [pc 61, 0x6E3]
eventOwner:say(quest, 9.0, 0.0)  [pc 66, 0x6F7]
eventOwner:say(quest, 10.0, 0.0)  [pc 71, 0x70B]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x71F]
eventOwner:say(quest, 12.0, 0.0)  [pc 81, 0x733]
eventOwner:_runCharaScheduler(354000896.0)  [pc 84, 0x73F]
eventOwner:say(quest, 13.0, 0.0)  [pc 89, 0x753]
eventOwner:say(quest, 14.0, 0.0)  [pc 94, 0x767]
eventOwner:say(quest, 15.0, 0.0)  [pc 99, 0x77B]
call101.1.return1 = quest:showQuestInfomation()  [pc 101, 0x783]
eventOwner:_runCharaScheduler(354066432.0)  [pc 106, 0x797]
eventOwner:say(quest, 17.0, 0.0)  [pc 111, 0x7AB]
eventOwner:finishCliantTalkTurn()  [pc 122, 0x7D7]
return call101.1.return1
```

### Path 2

```text
require (call101.1.return1 == 1.0) is false  [pc 102, 0x787]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5FB]
eventOwner:_runCharaScheduler(354172928.0)  [pc 6, 0x607]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x61B]
quest:startFadeOut(player, 1.0)  [pc 15, 0x62B]
quest:_wait(1.0)  [pc 18, 0x637]
eventOwner:_runCharaScheduler(354086912.0)  [pc 21, 0x643]
quest:startFadeIn(player, 1.0)  [pc 25, 0x653]
eventOwner:say(quest, 76.0, 0.0)  [pc 30, 0x667]
eventOwner:say(quest, 3.0, 0.0)  [pc 35, 0x67B]
eventOwner:say(quest, 4.0, 0.0)  [pc 40, 0x68F]
eventOwner:_runCharaScheduler(353976320.0)  [pc 43, 0x69B]
eventOwner:say(quest, 5.0, 0.0)  [pc 48, 0x6AF]
eventOwner:say(quest, 6.0, 0.0)  [pc 53, 0x6C3]
eventOwner:say(quest, 7.0, 0.0)  [pc 58, 0x6D7]
eventOwner:_runCharaScheduler(353984512.0)  [pc 61, 0x6E3]
eventOwner:say(quest, 9.0, 0.0)  [pc 66, 0x6F7]
eventOwner:say(quest, 10.0, 0.0)  [pc 71, 0x70B]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x71F]
eventOwner:say(quest, 12.0, 0.0)  [pc 81, 0x733]
eventOwner:_runCharaScheduler(354000896.0)  [pc 84, 0x73F]
eventOwner:say(quest, 13.0, 0.0)  [pc 89, 0x753]
eventOwner:say(quest, 14.0, 0.0)  [pc 94, 0x767]
eventOwner:say(quest, 15.0, 0.0)  [pc 99, 0x77B]
call101.1.return1 = quest:showQuestInfomation()  [pc 101, 0x783]
eventOwner:_runCharaScheduler(354066432.0)  [pc 115, 0x7BB]
eventOwner:say(quest, 16.0, 0.0)  [pc 120, 0x7CF]
eventOwner:finishCliantTalkTurn()  [pc 122, 0x7D7]
return call101.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x98A]
eventOwner:_runCharaScheduler(354172928.0)  [pc 6, 0x996]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0x9AA]
eventOwner:say(quest, 19.0, 0.0)  [pc 16, 0x9BE]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x9C6]
return 
```

## processEvent_005 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA83]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0xA8F]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0xAA3]
quest:startFadeOut(player, 1.0)  [pc 15, 0xAB3]
quest:_wait(1.0)  [pc 18, 0xABF]
eventOwner:_runCharaScheduler(354086912.0)  [pc 21, 0xACB]
quest:startFadeIn(player, 1.0)  [pc 25, 0xADB]
eventOwner:say(quest, 21.0, 0.0)  [pc 30, 0xAEF]
eventOwner:say(quest, 22.0, 0.0)  [pc 35, 0xB03]
eventOwner:_runCharaScheduler(353976320.0)  [pc 38, 0xB0F]
eventOwner:say(quest, 23.0, 0.0)  [pc 43, 0xB23]
eventOwner:say(quest, 24.0, 0.0)  [pc 48, 0xB37]
eventOwner:say(quest, 25.0, 0.0)  [pc 53, 0xB4B]
eventOwner:say(quest, 26.0, 0.0)  [pc 58, 0xB5F]
eventOwner:say(quest, 27.0, 0.0)  [pc 63, 0xB73]
eventOwner:_runCharaScheduler(354099200.0)  [pc 66, 0xB7F]
eventOwner:say(quest, 28.0, 0.0)  [pc 71, 0xB93]
eventOwner:finishCliantTalkTurn()  [pc 73, 0xB9B]
return 
```

## processEvent_005_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCE0]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0xCEC]
eventOwner:say(quest, 62.0, 0.0)  [pc 11, 0xD00]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD08]
return 
```

## processEvent_005_02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xDBC]
eventOwner:_runCharaScheduler(354078720.0)  [pc 6, 0xDC8]
eventOwner:say(quest, 63.0, 0.0)  [pc 11, 0xDDC]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xDE4]
return 
```

## processEvent_005_03 — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xE94]
quest:startNQCutScene('com0u510', 1.0, 0.0, arg4)  [pc 8, 0xEAC]
quest:startFadeInCutSceneAfterWarp(player)  [pc 11, 0xEB8]
return 
```

## processEvent_005_05 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF70]
eventOwner:_runCharaScheduler(83906560.0)  [pc 6, 0xF7C]
eventOwner:say(quest, 77.0, 0.0)  [pc 11, 0xF90]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF98]
return 
```

## processEvent_005_06 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x104C]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0x1058]
eventOwner:say(quest, 78.0, 0.0)  [pc 11, 0x106C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1074]
return 
```

## processEvent_005_07 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1128]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x1134]
eventOwner:say(quest, 79.0, 0.0)  [pc 11, 0x1148]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1150]
return 
```

## processEvent_005_09 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1204]
eventOwner:finishCliantTalkTurn()  [pc 5, 0x120C]
return 
```

## processEvent_010 — 4 parameters
### Path 1

```text
require (arg4 == 0.0) is true  [pc 66, 0x1380]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1284]
eventOwner:say(quest, 44.0, 0.0)  [pc 8, 0x1298]
eventOwner:_runCharaScheduler(79986688.0)  [pc 11, 0x12A4]
eventOwner:say(quest, 45.0, 0.0)  [pc 16, 0x12B8]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0x12CC]
eventOwner:say(quest, 47.0, 0.0)  [pc 26, 0x12E0]
eventOwner:_runCharaScheduler(365137920.0)  [pc 29, 0x12EC]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x1300]
eventOwner:say(quest, 48.0, 0.0)  [pc 39, 0x1314]
eventOwner:say(quest, 49.0, 0.0)  [pc 44, 0x1328]
eventOwner:_runCharaScheduler(365121536.0)  [pc 47, 0x1334]
eventOwner:say(quest, 50.0, 0.0)  [pc 52, 0x1348]
eventOwner:say(quest, 51.0, 0.0)  [pc 57, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x1364]
eventOwner:_runCharaScheduler(365133824.0)  [pc 62, 0x1370]
quest:_wait(2.0)  [pc 65, 0x137C]
eventOwner:say(quest, 52.0, 0.0)  [pc 72, 0x1398]
quest:_wait(2.0)  [pc 119, 0x1454]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 123, 0x1464]
eventOwner:waitCliantTalkTurn()  [pc 125, 0x146C]
eventOwner:_runCharaScheduler(79982592.0)  [pc 128, 0x1478]
eventOwner:say(quest, 59.0, 0.0)  [pc 133, 0x148C]
eventOwner:say(quest, 60.0, 0.0)  [pc 138, 0x14A0]
eventOwner:say(quest, 61.0, 0.0)  [pc 143, 0x14B4]
eventOwner:_runCharaScheduler(80007168.0)  [pc 146, 0x14C0]
eventOwner:say(quest, 69.0, 0.0)  [pc 151, 0x14D4]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x14DC]
return 
```

### Path 2

```text
require (arg4 == 0.0) is false  [pc 66, 0x1380]
require (arg4 == 1.0) is true  [pc 74, 0x13A0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1284]
eventOwner:say(quest, 44.0, 0.0)  [pc 8, 0x1298]
eventOwner:_runCharaScheduler(79986688.0)  [pc 11, 0x12A4]
eventOwner:say(quest, 45.0, 0.0)  [pc 16, 0x12B8]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0x12CC]
eventOwner:say(quest, 47.0, 0.0)  [pc 26, 0x12E0]
eventOwner:_runCharaScheduler(365137920.0)  [pc 29, 0x12EC]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x1300]
eventOwner:say(quest, 48.0, 0.0)  [pc 39, 0x1314]
eventOwner:say(quest, 49.0, 0.0)  [pc 44, 0x1328]
eventOwner:_runCharaScheduler(365121536.0)  [pc 47, 0x1334]
eventOwner:say(quest, 50.0, 0.0)  [pc 52, 0x1348]
eventOwner:say(quest, 51.0, 0.0)  [pc 57, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x1364]
eventOwner:_runCharaScheduler(365133824.0)  [pc 62, 0x1370]
quest:_wait(2.0)  [pc 65, 0x137C]
eventOwner:say(quest, 53.0, 0.0)  [pc 80, 0x13B8]
eventOwner:say(quest, 54.0, 0.0)  [pc 85, 0x13CC]
quest:_wait(2.0)  [pc 119, 0x1454]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 123, 0x1464]
eventOwner:waitCliantTalkTurn()  [pc 125, 0x146C]
eventOwner:_runCharaScheduler(79982592.0)  [pc 128, 0x1478]
eventOwner:say(quest, 59.0, 0.0)  [pc 133, 0x148C]
eventOwner:say(quest, 60.0, 0.0)  [pc 138, 0x14A0]
eventOwner:say(quest, 61.0, 0.0)  [pc 143, 0x14B4]
eventOwner:_runCharaScheduler(80007168.0)  [pc 146, 0x14C0]
eventOwner:say(quest, 69.0, 0.0)  [pc 151, 0x14D4]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x14DC]
return 
```

### Path 3

```text
require (arg4 == 0.0) is false  [pc 66, 0x1380]
require (arg4 == 1.0) is false  [pc 74, 0x13A0]
require (arg4 == 2.0) is true  [pc 87, 0x13D4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1284]
eventOwner:say(quest, 44.0, 0.0)  [pc 8, 0x1298]
eventOwner:_runCharaScheduler(79986688.0)  [pc 11, 0x12A4]
eventOwner:say(quest, 45.0, 0.0)  [pc 16, 0x12B8]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0x12CC]
eventOwner:say(quest, 47.0, 0.0)  [pc 26, 0x12E0]
eventOwner:_runCharaScheduler(365137920.0)  [pc 29, 0x12EC]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x1300]
eventOwner:say(quest, 48.0, 0.0)  [pc 39, 0x1314]
eventOwner:say(quest, 49.0, 0.0)  [pc 44, 0x1328]
eventOwner:_runCharaScheduler(365121536.0)  [pc 47, 0x1334]
eventOwner:say(quest, 50.0, 0.0)  [pc 52, 0x1348]
eventOwner:say(quest, 51.0, 0.0)  [pc 57, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x1364]
eventOwner:_runCharaScheduler(365133824.0)  [pc 62, 0x1370]
quest:_wait(2.0)  [pc 65, 0x137C]
eventOwner:say(quest, 55.0, 0.0)  [pc 93, 0x13EC]
eventOwner:say(quest, 56.0, 0.0)  [pc 98, 0x1400]
quest:_wait(2.0)  [pc 119, 0x1454]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 123, 0x1464]
eventOwner:waitCliantTalkTurn()  [pc 125, 0x146C]
eventOwner:_runCharaScheduler(79982592.0)  [pc 128, 0x1478]
eventOwner:say(quest, 59.0, 0.0)  [pc 133, 0x148C]
eventOwner:say(quest, 60.0, 0.0)  [pc 138, 0x14A0]
eventOwner:say(quest, 61.0, 0.0)  [pc 143, 0x14B4]
eventOwner:_runCharaScheduler(80007168.0)  [pc 146, 0x14C0]
eventOwner:say(quest, 69.0, 0.0)  [pc 151, 0x14D4]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x14DC]
return 
```

### Path 4

```text
require (arg4 == 0.0) is false  [pc 66, 0x1380]
require (arg4 == 1.0) is false  [pc 74, 0x13A0]
require (arg4 == 2.0) is false  [pc 87, 0x13D4]
require (arg4 == 3.0) is true  [pc 100, 0x1408]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1284]
eventOwner:say(quest, 44.0, 0.0)  [pc 8, 0x1298]
eventOwner:_runCharaScheduler(79986688.0)  [pc 11, 0x12A4]
eventOwner:say(quest, 45.0, 0.0)  [pc 16, 0x12B8]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0x12CC]
eventOwner:say(quest, 47.0, 0.0)  [pc 26, 0x12E0]
eventOwner:_runCharaScheduler(365137920.0)  [pc 29, 0x12EC]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x1300]
eventOwner:say(quest, 48.0, 0.0)  [pc 39, 0x1314]
eventOwner:say(quest, 49.0, 0.0)  [pc 44, 0x1328]
eventOwner:_runCharaScheduler(365121536.0)  [pc 47, 0x1334]
eventOwner:say(quest, 50.0, 0.0)  [pc 52, 0x1348]
eventOwner:say(quest, 51.0, 0.0)  [pc 57, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x1364]
eventOwner:_runCharaScheduler(365133824.0)  [pc 62, 0x1370]
quest:_wait(2.0)  [pc 65, 0x137C]
eventOwner:say(quest, 57.0, 0.0)  [pc 106, 0x1420]
eventOwner:say(quest, 58.0, 0.0)  [pc 111, 0x1434]
eventOwner:say(quest, 68.0, 0.0)  [pc 116, 0x1448]
quest:_wait(2.0)  [pc 119, 0x1454]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 123, 0x1464]
eventOwner:waitCliantTalkTurn()  [pc 125, 0x146C]
eventOwner:_runCharaScheduler(79982592.0)  [pc 128, 0x1478]
eventOwner:say(quest, 59.0, 0.0)  [pc 133, 0x148C]
eventOwner:say(quest, 60.0, 0.0)  [pc 138, 0x14A0]
eventOwner:say(quest, 61.0, 0.0)  [pc 143, 0x14B4]
eventOwner:_runCharaScheduler(80007168.0)  [pc 146, 0x14C0]
eventOwner:say(quest, 69.0, 0.0)  [pc 151, 0x14D4]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x14DC]
return 
```

### Path 5

```text
require (arg4 == 0.0) is false  [pc 66, 0x1380]
require (arg4 == 1.0) is false  [pc 74, 0x13A0]
require (arg4 == 2.0) is false  [pc 87, 0x13D4]
require (arg4 == 3.0) is false  [pc 100, 0x1408]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1284]
eventOwner:say(quest, 44.0, 0.0)  [pc 8, 0x1298]
eventOwner:_runCharaScheduler(79986688.0)  [pc 11, 0x12A4]
eventOwner:say(quest, 45.0, 0.0)  [pc 16, 0x12B8]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0x12CC]
eventOwner:say(quest, 47.0, 0.0)  [pc 26, 0x12E0]
eventOwner:_runCharaScheduler(365137920.0)  [pc 29, 0x12EC]
eventOwner:say(quest, 67.0, 0.0)  [pc 34, 0x1300]
eventOwner:say(quest, 48.0, 0.0)  [pc 39, 0x1314]
eventOwner:say(quest, 49.0, 0.0)  [pc 44, 0x1328]
eventOwner:_runCharaScheduler(365121536.0)  [pc 47, 0x1334]
eventOwner:say(quest, 50.0, 0.0)  [pc 52, 0x1348]
eventOwner:say(quest, 51.0, 0.0)  [pc 57, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x1364]
eventOwner:_runCharaScheduler(365133824.0)  [pc 62, 0x1370]
quest:_wait(2.0)  [pc 65, 0x137C]
quest:_wait(2.0)  [pc 119, 0x1454]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 123, 0x1464]
eventOwner:waitCliantTalkTurn()  [pc 125, 0x146C]
eventOwner:_runCharaScheduler(79982592.0)  [pc 128, 0x1478]
eventOwner:say(quest, 59.0, 0.0)  [pc 133, 0x148C]
eventOwner:say(quest, 60.0, 0.0)  [pc 138, 0x14A0]
eventOwner:say(quest, 61.0, 0.0)  [pc 143, 0x14B4]
eventOwner:_runCharaScheduler(80007168.0)  [pc 146, 0x14C0]
eventOwner:say(quest, 69.0, 0.0)  [pc 151, 0x14D4]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x14DC]
return 
```

## processEvent_010_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x16A6]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x16B2]
eventOwner:say(quest, 64.0, 0.0)  [pc 11, 0x16C6]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x16CE]
return 
```

## processEvent_010_02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1782]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x178E]
eventOwner:say(quest, 65.0, 0.0)  [pc 11, 0x17A2]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x17AA]
return 
```

## processEvent_010_03 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x185E]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x186A]
eventOwner:say(quest, 66.0, 0.0)  [pc 11, 0x187E]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1886]
return 
```

## processEvent_010_05 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x193A]
eventOwner:_runCharaScheduler(354054144.0)  [pc 6, 0x1946]
eventOwner:say(quest, 80.0, 0.0)  [pc 11, 0x195A]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1962]
return 
```

## processEvent_010_06 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1A16]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0x1A22]
eventOwner:say(quest, 81.0, 0.0)  [pc 11, 0x1A36]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1A3E]
return 
```

## processEvent_010_07 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AF2]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x1AFE]
eventOwner:say(quest, 79.0, 0.0)  [pc 11, 0x1B12]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1B1A]
return 
```

## processEvent_010_09 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1BCE]
eventOwner:finishCliantTalkTurn()  [pc 5, 0x1BD6]
return 
```

## processEvent_elevator_nq1F — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1C4A]
quest:startNQCutScene('elv0u01a', 1.0, 0.0)  [pc 7, 0x1C5E]
quest:startFadeInCutSceneAfterWarp(player)  [pc 10, 0x1C6A]
return 
```

## processEvent_elevator_nq2F — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1D1E]
quest:startNQCutScene('elv0u02a', 1.0, 0.0)  [pc 7, 0x1D32]
quest:startFadeInCutSceneAfterWarp(player)  [pc 10, 0x1D3E]
return 
```

## processEvent_elevator_nq3F — 3 parameters
### Path 1

```text
return 
```

