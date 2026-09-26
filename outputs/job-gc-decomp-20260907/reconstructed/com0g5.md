# 111605 com0g5: reconstructed client path templates

## processEventFulkeHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x33E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x34A]
eventOwner:say(quest, 85.0, 0.0)  [pc 11, 0x35E]
eventOwner:say(quest, 86.0, 0.0)  [pc 16, 0x372]
eventOwner:say(quest, 87.0, 0.0)  [pc 21, 0x386]
eventOwner:say(quest, 88.0, 0.0)  [pc 26, 0x39A]
eventOwner:say(quest, 89.0, 0.0)  [pc 31, 0x3AE]
eventOwner:finishCliantTalkTurn()  [pc 33, 0x3B6]
return 
```

## processEventFulkeStart — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x4A2]
require (call43.1.return1 == 1.0) is true  [pc 44, 0x532]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x48E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x49E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x4B2]
quest:_wait(1.0)  [pc 15, 0x4BE]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x4D2]
eventOwner:_runCharaScheduler(69193728.0)  [pc 23, 0x4DE]
eventOwner:say(quest, 3.0, 0.0)  [pc 28, 0x4F2]
eventOwner:say(quest, 4.0, 0.0)  [pc 33, 0x506]
eventOwner:_runCharaScheduler(353959936.0)  [pc 36, 0x512]
eventOwner:say(quest, 5.0, 0.0)  [pc 41, 0x526]
call43.1.return1 = quest:showQuestInfomation()  [pc 43, 0x52E]
eventOwner:say(quest, 7.0, 0.0)  [pc 50, 0x54A]
player:_runCharaScheduler(354111488.0)  [pc 53, 0x556]
eventOwner:_runCharaScheduler(354107392.0)  [pc 56, 0x562]
quest:_wait(2.5)  [pc 59, 0x56E]
eventOwner:say(quest, 8.0, 0.0)  [pc 64, 0x582]
eventOwner:finishCliantTalkTurn()  [pc 66, 0x58A]
return call43.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x4A2]
require (call43.1.return1 == 1.0) is false  [pc 44, 0x532]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x48E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x49E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x4B2]
quest:_wait(1.0)  [pc 15, 0x4BE]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x4D2]
eventOwner:_runCharaScheduler(69193728.0)  [pc 23, 0x4DE]
eventOwner:say(quest, 3.0, 0.0)  [pc 28, 0x4F2]
eventOwner:say(quest, 4.0, 0.0)  [pc 33, 0x506]
eventOwner:_runCharaScheduler(353959936.0)  [pc 36, 0x512]
eventOwner:say(quest, 5.0, 0.0)  [pc 41, 0x526]
call43.1.return1 = quest:showQuestInfomation()  [pc 43, 0x52E]
eventOwner:_runCharaScheduler(354041856.0)  [pc 70, 0x59A]
eventOwner:say(quest, 6.0, 0.0)  [pc 75, 0x5AE]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x5B6]
return call43.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x4A2]
require (call43.1.return1 == 1.0) is true  [pc 44, 0x532]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x48E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x49E]
quest:_wait(1.0)  [pc 15, 0x4BE]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x4D2]
eventOwner:_runCharaScheduler(69193728.0)  [pc 23, 0x4DE]
eventOwner:say(quest, 3.0, 0.0)  [pc 28, 0x4F2]
eventOwner:say(quest, 4.0, 0.0)  [pc 33, 0x506]
eventOwner:_runCharaScheduler(353959936.0)  [pc 36, 0x512]
eventOwner:say(quest, 5.0, 0.0)  [pc 41, 0x526]
call43.1.return1 = quest:showQuestInfomation()  [pc 43, 0x52E]
eventOwner:say(quest, 7.0, 0.0)  [pc 50, 0x54A]
player:_runCharaScheduler(354111488.0)  [pc 53, 0x556]
eventOwner:_runCharaScheduler(354107392.0)  [pc 56, 0x562]
quest:_wait(2.5)  [pc 59, 0x56E]
eventOwner:say(quest, 8.0, 0.0)  [pc 64, 0x582]
eventOwner:finishCliantTalkTurn()  [pc 66, 0x58A]
return call43.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x4A2]
require (call43.1.return1 == 1.0) is false  [pc 44, 0x532]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x48E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x49E]
quest:_wait(1.0)  [pc 15, 0x4BE]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x4D2]
eventOwner:_runCharaScheduler(69193728.0)  [pc 23, 0x4DE]
eventOwner:say(quest, 3.0, 0.0)  [pc 28, 0x4F2]
eventOwner:say(quest, 4.0, 0.0)  [pc 33, 0x506]
eventOwner:_runCharaScheduler(353959936.0)  [pc 36, 0x512]
eventOwner:say(quest, 5.0, 0.0)  [pc 41, 0x526]
call43.1.return1 = quest:showQuestInfomation()  [pc 43, 0x52E]
eventOwner:_runCharaScheduler(354041856.0)  [pc 70, 0x59A]
eventOwner:say(quest, 6.0, 0.0)  [pc 75, 0x5AE]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x5B6]
return call43.1.return1
```

## followEvent005 — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x720]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x70C]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x71C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x730]
quest:_wait(1.0)  [pc 15, 0x73C]
eventOwner:say(quest, 9.0, 0.0)  [pc 20, 0x750]
eventOwner:finishCliantTalkTurn()  [pc 22, 0x758]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x720]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x70C]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x71C]
quest:_wait(1.0)  [pc 15, 0x73C]
eventOwner:say(quest, 9.0, 0.0)  [pc 20, 0x750]
eventOwner:finishCliantTalkTurn()  [pc 22, 0x758]
return 
```

## processEvent005 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x837]
quest:startNQCutScene('com0g610', 1.0)  [pc 6, 0x847]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0x853]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x902]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x90E]
eventOwner:say(quest, 30.0, 0.0)  [pc 11, 0x922]
eventOwner:say(quest, 31.0, 0.0)  [pc 16, 0x936]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0x942]
eventOwner:say(quest, 32.0, 0.0)  [pc 24, 0x956]
eventOwner:say(quest, 33.0, 0.0)  [pc 29, 0x96A]
eventOwner:say(quest, 34.0, 0.0)  [pc 34, 0x97E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 37, 0x98A]
eventOwner:say(quest, 35.0, 0.0)  [pc 42, 0x99E]
eventOwner:say(quest, 36.0, 0.0)  [pc 47, 0x9B2]
eventOwner:say(quest, 37.0, 0.0)  [pc 52, 0x9C6]
eventOwner:_runCharaScheduler(353964032.0)  [pc 55, 0x9D2]
eventOwner:say(quest, 38.0, 0.0)  [pc 60, 0x9E6]
eventOwner:say(quest, 39.0, 0.0)  [pc 65, 0x9FA]
eventOwner:say(quest, 80.0, 0.0)  [pc 70, 0xA0E]
eventOwner:say(quest, 40.0, 0.0)  [pc 75, 0xA22]
player:_runCharaScheduler(354111488.0)  [pc 78, 0xA2E]
eventOwner:_runCharaScheduler(354107392.0)  [pc 81, 0xA3A]
quest:_wait(2.5)  [pc 84, 0xA46]
eventOwner:say(quest, 63.0, 0.0)  [pc 89, 0xA5A]
return 
```

## processEvent011 — 3 parameters
### Path 1

```text
worldMaster:say(quest, 64.0, 1.0, 0.0)  [pc 6, 0xBAD]
worldMaster:say(quest, 79.0, 1.0, 0.0)  [pc 13, 0xBC9]
return 
```

## processEvent012 — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(354062336.0)  [pc 2, 0xC3F]
eventOwner:say(quest, 81.0, 0.0)  [pc 7, 0xC53]
eventOwner:finishCliantTalkTurn()  [pc 9, 0xC5B]
return 
```

## processEvent010_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCED]
eventOwner:say(quest, 69.0, 0.0)  [pc 8, 0xD01]
eventOwner:_runCharaScheduler(354066432.0)  [pc 11, 0xD0D]
eventOwner:say(quest, 70.0, 0.0)  [pc 16, 0xD21]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xD29]
return 
```

## processEvent010_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xDE6]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xDF2]
eventOwner:say(quest, 71.0, 0.0)  [pc 11, 0xE06]
eventOwner:say(quest, 72.0, 0.0)  [pc 16, 0xE1A]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xE22]
return 
```

## processEvent010_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xEDF]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0xEEB]
eventOwner:say(quest, 73.0, 0.0)  [pc 11, 0xEFF]
eventOwner:say(quest, 74.0, 0.0)  [pc 16, 0xF13]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xF1B]
return 
```

## processEvent010_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFD8]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0xFE4]
eventOwner:say(quest, 75.0, 0.0)  [pc 11, 0xFF8]
eventOwner:say(quest, 76.0, 0.0)  [pc 16, 0x100C]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1014]
return 
```

## processEvent010_5 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10D1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x10DD]
eventOwner:say(quest, 77.0, 0.0)  [pc 11, 0x10F1]
eventOwner:say(quest, 78.0, 0.0)  [pc 16, 0x1105]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x110D]
return 
```

## processEvent020 — 4 parameters
### Path 1

```text
require (arg4 == 0.0) is true  [pc 4, 0x11CE]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11CA]
eventOwner:_runCharaScheduler(353959936.0)  [pc 8, 0x11DE]
eventOwner:say(quest, 41.0, 0.0)  [pc 13, 0x11F2]
eventOwner:say(quest, 42.0, 0.0)  [pc 18, 0x1206]
eventOwner:say(quest, 43.0, 0.0)  [pc 23, 0x121A]
eventOwner:finishCliantTalkTurn()  [pc 55, 0x129A]
return 
```

### Path 2

```text
require (arg4 == 0.0) is false  [pc 4, 0x11CE]
require (arg4 == 1.0) is true  [pc 25, 0x1222]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11CA]
eventOwner:say(quest, 44.0, 0.0)  [pc 31, 0x123A]
eventOwner:_runCharaScheduler(354103296.0)  [pc 34, 0x1246]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x125A]
eventOwner:say(quest, 46.0, 0.0)  [pc 44, 0x126E]
eventOwner:finishCliantTalkTurn()  [pc 55, 0x129A]
return 
```

### Path 3

```text
require (arg4 == 0.0) is false  [pc 4, 0x11CE]
require (arg4 == 1.0) is false  [pc 25, 0x1222]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11CA]
eventOwner:_runCharaScheduler(354045952.0)  [pc 48, 0x127E]
eventOwner:say(quest, 47.0, 0.0)  [pc 53, 0x1292]
eventOwner:finishCliantTalkTurn()  [pc 55, 0x129A]
return 
```

## processEvent030 — 4 parameters
### Path 1

```text
require (arg4 == 0.0) is true  [pc 80, 0x14D3]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x139F]
eventOwner:_runCharaScheduler(83914752.0)  [pc 6, 0x13AB]
eventOwner:say(quest, 48.0, 0.0)  [pc 11, 0x13BF]
eventOwner:say(quest, 49.0, 0.0)  [pc 16, 0x13D3]
eventOwner:say(quest, 50.0, 0.0)  [pc 21, 0x13E7]
eventOwner:_runCharaScheduler(353968128.0)  [pc 24, 0x13F3]
eventOwner:say(quest, 51.0, 0.0)  [pc 29, 0x1407]
eventOwner:say(quest, 52.0, 0.0)  [pc 34, 0x141B]
eventOwner:_runCharaScheduler(354082816.0)  [pc 37, 0x1427]
eventOwner:say(quest, 53.0, 0.0)  [pc 42, 0x143B]
eventOwner:say(quest, 54.0, 0.0)  [pc 47, 0x144F]
eventOwner:say(quest, 55.0, 0.0)  [pc 52, 0x1463]
eventOwner:_runCharaScheduler(354103296.0)  [pc 55, 0x146F]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0x1483]
eventOwner:say(quest, 57.0, 0.0)  [pc 65, 0x1497]
eventOwner:_runCharaScheduler(353972224.0)  [pc 68, 0x14A3]
eventOwner:say(quest, 58.0, 0.0)  [pc 73, 0x14B7]
eventOwner:say(quest, 59.0, 0.0)  [pc 78, 0x14CB]
eventOwner:_runCharaScheduler(353959936.0)  [pc 84, 0x14E3]
eventOwner:say(quest, 60.0, 0.0)  [pc 89, 0x14F7]
eventOwner:say(quest, 61.0, 0.0)  [pc 94, 0x150B]
eventOwner:say(quest, 62.0, 0.0)  [pc 99, 0x151F]
player:_runCharaScheduler(354111488.0)  [pc 140, 0x15C3]
eventOwner:_runCharaScheduler(354107392.0)  [pc 143, 0x15CF]
quest:_wait(1.5)  [pc 146, 0x15DB]
eventOwner:say(quest, 84.0, 0.0)  [pc 151, 0x15EF]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x15F7]
return 
```

### Path 2

```text
require (arg4 == 0.0) is false  [pc 80, 0x14D3]
require (arg4 == 1.0) is true  [pc 102, 0x152B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x139F]
eventOwner:_runCharaScheduler(83914752.0)  [pc 6, 0x13AB]
eventOwner:say(quest, 48.0, 0.0)  [pc 11, 0x13BF]
eventOwner:say(quest, 49.0, 0.0)  [pc 16, 0x13D3]
eventOwner:say(quest, 50.0, 0.0)  [pc 21, 0x13E7]
eventOwner:_runCharaScheduler(353968128.0)  [pc 24, 0x13F3]
eventOwner:say(quest, 51.0, 0.0)  [pc 29, 0x1407]
eventOwner:say(quest, 52.0, 0.0)  [pc 34, 0x141B]
eventOwner:_runCharaScheduler(354082816.0)  [pc 37, 0x1427]
eventOwner:say(quest, 53.0, 0.0)  [pc 42, 0x143B]
eventOwner:say(quest, 54.0, 0.0)  [pc 47, 0x144F]
eventOwner:say(quest, 55.0, 0.0)  [pc 52, 0x1463]
eventOwner:_runCharaScheduler(354103296.0)  [pc 55, 0x146F]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0x1483]
eventOwner:say(quest, 57.0, 0.0)  [pc 65, 0x1497]
eventOwner:_runCharaScheduler(353972224.0)  [pc 68, 0x14A3]
eventOwner:say(quest, 58.0, 0.0)  [pc 73, 0x14B7]
eventOwner:say(quest, 59.0, 0.0)  [pc 78, 0x14CB]
eventOwner:_runCharaScheduler(353964032.0)  [pc 106, 0x153B]
eventOwner:say(quest, 82.0, 0.0)  [pc 111, 0x154F]
eventOwner:say(quest, 83.0, 0.0)  [pc 116, 0x1563]
player:_runCharaScheduler(354111488.0)  [pc 140, 0x15C3]
eventOwner:_runCharaScheduler(354107392.0)  [pc 143, 0x15CF]
quest:_wait(1.5)  [pc 146, 0x15DB]
eventOwner:say(quest, 84.0, 0.0)  [pc 151, 0x15EF]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x15F7]
return 
```

### Path 3

```text
require (arg4 == 0.0) is false  [pc 80, 0x14D3]
require (arg4 == 1.0) is false  [pc 102, 0x152B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x139F]
eventOwner:_runCharaScheduler(83914752.0)  [pc 6, 0x13AB]
eventOwner:say(quest, 48.0, 0.0)  [pc 11, 0x13BF]
eventOwner:say(quest, 49.0, 0.0)  [pc 16, 0x13D3]
eventOwner:say(quest, 50.0, 0.0)  [pc 21, 0x13E7]
eventOwner:_runCharaScheduler(353968128.0)  [pc 24, 0x13F3]
eventOwner:say(quest, 51.0, 0.0)  [pc 29, 0x1407]
eventOwner:say(quest, 52.0, 0.0)  [pc 34, 0x141B]
eventOwner:_runCharaScheduler(354082816.0)  [pc 37, 0x1427]
eventOwner:say(quest, 53.0, 0.0)  [pc 42, 0x143B]
eventOwner:say(quest, 54.0, 0.0)  [pc 47, 0x144F]
eventOwner:say(quest, 55.0, 0.0)  [pc 52, 0x1463]
eventOwner:_runCharaScheduler(354103296.0)  [pc 55, 0x146F]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0x1483]
eventOwner:say(quest, 57.0, 0.0)  [pc 65, 0x1497]
eventOwner:_runCharaScheduler(353972224.0)  [pc 68, 0x14A3]
eventOwner:say(quest, 58.0, 0.0)  [pc 73, 0x14B7]
eventOwner:say(quest, 59.0, 0.0)  [pc 78, 0x14CB]
eventOwner:_runCharaScheduler(353959936.0)  [pc 121, 0x1577]
eventOwner:say(quest, 60.0, 0.0)  [pc 126, 0x158B]
eventOwner:say(quest, 61.0, 0.0)  [pc 131, 0x159F]
eventOwner:say(quest, 62.0, 0.0)  [pc 136, 0x15B3]
player:_runCharaScheduler(354111488.0)  [pc 140, 0x15C3]
eventOwner:_runCharaScheduler(354107392.0)  [pc 143, 0x15CF]
quest:_wait(1.5)  [pc 146, 0x15DB]
eventOwner:say(quest, 84.0, 0.0)  [pc 151, 0x15EF]
eventOwner:finishCliantTalkTurn()  [pc 153, 0x15F7]
return 
```

