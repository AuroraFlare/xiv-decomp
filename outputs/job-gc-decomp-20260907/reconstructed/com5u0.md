# 111810 com5u0: reconstructed client path templates

## processEventAUBREYStart — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x33F]
require (arg4 == 1.0) is true  [pc 31, 0x39B]
require (arg4 == 1.0) is true  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is true  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x34F]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 76.0, 0.0)  [pc 37, 0x3B3]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 77.0, 0.0)  [pc 58, 0x407]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(70828032.0)  [pc 71, 0x43B]
eventOwner:say(quest, 8.0, 0.0)  [pc 76, 0x44F]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x33F]
require (arg4 == 1.0) is true  [pc 31, 0x39B]
require (arg4 == 1.0) is true  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is false  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x34F]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 76.0, 0.0)  [pc 37, 0x3B3]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 77.0, 0.0)  [pc 58, 0x407]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(354041856.0)  [pc 80, 0x45F]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x473]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x33F]
require (arg4 == 1.0) is false  [pc 31, 0x39B]
require (arg4 == 1.0) is false  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is true  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x34F]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 5.0, 0.0)  [pc 43, 0x3CB]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x41F]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(70828032.0)  [pc 71, 0x43B]
eventOwner:say(quest, 8.0, 0.0)  [pc 76, 0x44F]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x33F]
require (arg4 == 1.0) is false  [pc 31, 0x39B]
require (arg4 == 1.0) is false  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is false  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x34F]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 5.0, 0.0)  [pc 43, 0x3CB]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x41F]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(354041856.0)  [pc 80, 0x45F]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x473]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 5

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x33F]
require (arg4 == 1.0) is true  [pc 31, 0x39B]
require (arg4 == 1.0) is true  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is true  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 76.0, 0.0)  [pc 37, 0x3B3]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 77.0, 0.0)  [pc 58, 0x407]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(70828032.0)  [pc 71, 0x43B]
eventOwner:say(quest, 8.0, 0.0)  [pc 76, 0x44F]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 6

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x33F]
require (arg4 == 1.0) is true  [pc 31, 0x39B]
require (arg4 == 1.0) is true  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is false  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 76.0, 0.0)  [pc 37, 0x3B3]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 77.0, 0.0)  [pc 58, 0x407]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(354041856.0)  [pc 80, 0x45F]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x473]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 7

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x33F]
require (arg4 == 1.0) is false  [pc 31, 0x39B]
require (arg4 == 1.0) is false  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is true  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 5.0, 0.0)  [pc 43, 0x3CB]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x41F]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(70828032.0)  [pc 71, 0x43B]
eventOwner:say(quest, 8.0, 0.0)  [pc 76, 0x44F]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

### Path 8

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x33F]
require (arg4 == 1.0) is false  [pc 31, 0x39B]
require (arg4 == 1.0) is false  [pc 52, 0x3EF]
require (call66.1.return1 == 1.0) is false  [pc 67, 0x42B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x32B]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x33B]
quest:_wait(1.0)  [pc 15, 0x35B]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x36F]
eventOwner:say(quest, 3.0, 0.0)  [pc 25, 0x383]
eventOwner:say(quest, 4.0, 0.0)  [pc 30, 0x397]
eventOwner:say(quest, 5.0, 0.0)  [pc 43, 0x3CB]
eventOwner:_runCharaScheduler(353968128.0)  [pc 46, 0x3D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 51, 0x3EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x41F]
call66.1.return1 = quest:showQuestInfomation()  [pc 66, 0x427]
eventOwner:_runCharaScheduler(354041856.0)  [pc 80, 0x45F]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x473]
eventOwner:finishCliantTalkTurn()  [pc 87, 0x47B]
return call66.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x5E5]
require (call7.1.return1 == 0.0) is true  [pc 21, 0x619]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5D1]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x5E1]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x5F5]
quest:_wait(1.0)  [pc 15, 0x601]
eventOwner:say(quest, 10.0, 0.0)  [pc 20, 0x615]
eventOwner:finishCliantTalkTurn()  [pc 27, 0x631]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x5E5]
require (call7.1.return1 == 0.0) is false  [pc 21, 0x619]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5D1]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x5E1]
quest:_wait(1.0)  [pc 15, 0x601]
eventOwner:say(quest, 10.0, 0.0)  [pc 20, 0x615]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 25, 0x629]
eventOwner:finishCliantTalkTurn()  [pc 27, 0x631]
return 
```

## processEvent_005 — 6 parameters
### Path 1

```text
require (arg6 == 1.0) is true  [pc 13, 0x765]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x741]
eventOwner:_runCharaScheduler(353980416.0)  [pc 7, 0x74D]
eventOwner:say(quest, 11.0, 0.0)  [pc 12, 0x761]
eventOwner:say(quest, 78.0, 0.0)  [pc 19, 0x77D]
eventOwner:say(quest, 79.0, 0.0)  [pc 24, 0x791]
eventOwner:say(quest, 80.0, 0.0)  [pc 29, 0x7A5]
eventOwner:_runCharaScheduler(353984512.0)  [pc 32, 0x7B1]
eventOwner:say(quest, 81.0, 0.0, 0.0, 0.0, arg5)  [pc 40, 0x7D1]
worldMaster:say(quest, 69.0, 1.0, 0.0, arg5, arg4)  [pc 76, 0x861]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x875]
eventOwner:finishCliantTalkTurn()  [pc 83, 0x87D]
return 
```

### Path 2

```text
require (arg6 == 1.0) is false  [pc 13, 0x765]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x741]
eventOwner:_runCharaScheduler(353980416.0)  [pc 7, 0x74D]
eventOwner:say(quest, 11.0, 0.0)  [pc 12, 0x761]
eventOwner:say(quest, 12.0, 0.0)  [pc 46, 0x7E9]
eventOwner:say(quest, 74.0, 0.0)  [pc 51, 0x7FD]
eventOwner:say(quest, 13.0, 0.0)  [pc 56, 0x811]
eventOwner:_runCharaScheduler(353984512.0)  [pc 59, 0x81D]
eventOwner:say(quest, 14.0, 0.0, 0.0, 0.0, arg5)  [pc 67, 0x83D]
worldMaster:say(quest, 69.0, 1.0, 0.0, arg5, arg4)  [pc 76, 0x861]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x875]
eventOwner:finishCliantTalkTurn()  [pc 83, 0x87D]
return 
```

## processEvent_005_1 — 6 parameters
### Path 1

```text
require (arg6 == 1.0) is true  [pc 8, 0x9C2]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x9B2]
eventOwner:_runCharaScheduler(353959936.0)  [pc 7, 0x9BE]
eventOwner:say(quest, 82.0, 0.0, 0.0, 0.0, arg5)  [pc 17, 0x9E6]
worldMaster:say(quest, 70.0, 1.0, 0.0, arg5, arg4)  [pc 35, 0xA2E]
eventOwner:say(quest, 17.0, 0.0)  [pc 40, 0xA42]
eventOwner:finishCliantTalkTurn()  [pc 42, 0xA4A]
return 
```

### Path 2

```text
require (arg6 == 1.0) is false  [pc 8, 0x9C2]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x9B2]
eventOwner:_runCharaScheduler(353959936.0)  [pc 7, 0x9BE]
eventOwner:say(quest, 16.0, 0.0, 0.0, 0.0, arg5)  [pc 26, 0xA0A]
worldMaster:say(quest, 70.0, 1.0, 0.0, arg5, arg4)  [pc 35, 0xA2E]
eventOwner:say(quest, 17.0, 0.0)  [pc 40, 0xA42]
eventOwner:finishCliantTalkTurn()  [pc 42, 0xA4A]
return 
```

## processEvent_010 — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB33]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0xB3F]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0xB53]
eventOwner:_runCharaScheduler(70844416.0)  [pc 14, 0xB5F]
eventOwner:say(quest, 21.0, 0.0)  [pc 19, 0xB73]
eventOwner:say(quest, 22.0, 0.0)  [pc 24, 0xB87]
eventOwner:say(quest, 23.0, 0.0)  [pc 29, 0xB9B]
eventOwner:_runCharaScheduler(354168832.0)  [pc 32, 0xBA7]
eventOwner:say(quest, 24.0, 0.0)  [pc 37, 0xBBB]
eventOwner:say(quest, 25.0, 0.0)  [pc 42, 0xBCF]
eventOwner:say(quest, 26.0, 0.0)  [pc 47, 0xBE3]
worldMaster:say(quest, 27.0, 1.0, 0.0)  [pc 54, 0xBFF]
eventOwner:say(quest, 28.0, 0.0)  [pc 59, 0xC13]
worldMaster:say(quest, 29.0, 0.0, arg4)  [pc 66, 0xC2F]
eventOwner:_runCharaScheduler(354168832.0)  [pc 69, 0xC3B]
eventOwner:say(quest, 30.0, 0.0)  [pc 74, 0xC4F]
eventOwner:say(quest, 31.0, 0.0)  [pc 79, 0xC63]
eventOwner:say(quest, 32.0, 0.0)  [pc 84, 0xC77]
worldMaster:say(quest, 75.0, 1.0, 0.0)  [pc 91, 0xC93]
eventOwner:say(quest, 33.0, 0.0)  [pc 96, 0xCA7]
eventOwner:say(quest, 34.0, 0.0)  [pc 101, 0xCBB]
eventOwner:finishCliantTalkTurn()  [pc 103, 0xCC3]
return 
```

## processEvent_010_01 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0xE4D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE21]
eventOwner:say(quest, 68.0, 0.0)  [pc 8, 0xE35]
call13.1.return1 = eventOwner:ask(quest, 35.0, 2.0)  [pc 13, 0xE49]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0xE4D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE21]
eventOwner:say(quest, 68.0, 0.0)  [pc 8, 0xE35]
call13.1.return1 = eventOwner:ask(quest, 35.0, 2.0)  [pc 13, 0xE49]
eventOwner:_runCharaScheduler(70795264.0)  [pc 19, 0xE61]
eventOwner:say(quest, 72.0, 0.0)  [pc 24, 0xE75]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xE7D]
return call13.1.return1
```

## processEvent_015 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 4, 0xF5D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF59]
eventOwner:say(quest, 73.0, 0.0)  [pc 10, 0xF75]
eventOwner:say(quest, 40.0, 0.0)  [pc 21, 0xFA1]
desktopWidget:openPublicInformDialogWidget(worldMaster, 25117.0, 11000261.0)  [pc 27, 0xFB9]
worldMaster:notify(worldMaster, 25117.0, 11000261.0)  [pc 33, 0xFD1]
quest:_wait(3.0)  [pc 36, 0xFDD]
eventOwner:say(quest, 41.0, 0.0)  [pc 41, 0xFF1]
eventOwner:say(quest, 42.0, 0.0)  [pc 46, 0x1005]
eventOwner:say(quest, 43.0, 0.0)  [pc 51, 0x1019]
eventOwner:say(quest, 44.0, 0.0)  [pc 56, 0x102D]
eventOwner:say(quest, 47.0, 0.0)  [pc 61, 0x1041]
eventOwner:say(quest, 48.0, 0.0)  [pc 66, 0x1055]
eventOwner:finishCliantTalkTurn()  [pc 68, 0x105D]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 4, 0xF5D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF59]
eventOwner:say(quest, 39.0, 0.0)  [pc 16, 0xF8D]
eventOwner:say(quest, 40.0, 0.0)  [pc 21, 0xFA1]
desktopWidget:openPublicInformDialogWidget(worldMaster, 25117.0, 11000261.0)  [pc 27, 0xFB9]
worldMaster:notify(worldMaster, 25117.0, 11000261.0)  [pc 33, 0xFD1]
quest:_wait(3.0)  [pc 36, 0xFDD]
eventOwner:say(quest, 41.0, 0.0)  [pc 41, 0xFF1]
eventOwner:say(quest, 42.0, 0.0)  [pc 46, 0x1005]
eventOwner:say(quest, 43.0, 0.0)  [pc 51, 0x1019]
eventOwner:say(quest, 44.0, 0.0)  [pc 56, 0x102D]
eventOwner:say(quest, 47.0, 0.0)  [pc 61, 0x1041]
eventOwner:say(quest, 48.0, 0.0)  [pc 66, 0x1055]
eventOwner:finishCliantTalkTurn()  [pc 68, 0x105D]
return 
```

## processEvent_015_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11B9]
eventOwner:say(quest, 49.0, 0.0)  [pc 8, 0x11CD]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x11D5]
return 
```

## processEvent_015_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1268]
eventOwner:say(quest, 50.0, 0.0)  [pc 8, 0x127C]
eventOwner:say(quest, 51.0, 0.0)  [pc 13, 0x1290]
eventOwner:say(quest, 52.0, 0.0)  [pc 18, 0x12A4]
eventOwner:finishCliantTalkTurn()  [pc 20, 0x12AC]
return 
```

## processEvent_020 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 29, 0x13B9]
require (arg4 == 1.0) is true  [pc 42, 0x13ED]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1351]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x135D]
eventOwner:say(quest, 53.0, 0.0)  [pc 11, 0x1371]
quest:startFadeOut(player, 1.0)  [pc 15, 0x1381]
quest:_wait(1.0)  [pc 18, 0x138D]
quest:_wait(1.0)  [pc 21, 0x1399]
eventOwner:_runCharaScheduler(70881280.0)  [pc 24, 0x13A5]
quest:startFadeIn(player, 1.0)  [pc 28, 0x13B5]
eventOwner:say(quest, 83.0, 0.0)  [pc 35, 0x13D1]
eventOwner:say(quest, 84.0, 0.0)  [pc 48, 0x1405]
eventOwner:_runCharaScheduler(354168832.0)  [pc 51, 0x1411]
eventOwner:say(quest, 85.0, 0.0)  [pc 56, 0x1425]
eventOwner:say(quest, 58.0, 0.0)  [pc 75, 0x1471]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x1479]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 29, 0x13B9]
require (arg4 == 1.0) is false  [pc 42, 0x13ED]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1351]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x135D]
eventOwner:say(quest, 53.0, 0.0)  [pc 11, 0x1371]
quest:startFadeOut(player, 1.0)  [pc 15, 0x1381]
quest:_wait(1.0)  [pc 18, 0x138D]
quest:_wait(1.0)  [pc 21, 0x1399]
eventOwner:_runCharaScheduler(70881280.0)  [pc 24, 0x13A5]
quest:startFadeIn(player, 1.0)  [pc 28, 0x13B5]
eventOwner:say(quest, 54.0, 0.0)  [pc 41, 0x13E9]
eventOwner:say(quest, 56.0, 0.0)  [pc 62, 0x143D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 65, 0x1449]
eventOwner:say(quest, 57.0, 0.0)  [pc 70, 0x145D]
eventOwner:say(quest, 58.0, 0.0)  [pc 75, 0x1471]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x1479]
return 
```

## processEvent_020_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x15AC]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x15B8]
eventOwner:say(quest, 59.0, 0.0)  [pc 11, 0x15CC]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x15D4]
return 
```

## processEvent_025 — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x169C]
require (arg4 == 1.0) is true  [pc 48, 0x173C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1688]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x1698]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x16AC]
quest:_wait(1.0)  [pc 15, 0x16B8]
eventOwner:say(quest, 60.0, 0.0)  [pc 20, 0x16CC]
quest:startFadeOut(player, 1.0)  [pc 24, 0x16DC]
quest:_wait(1.0)  [pc 27, 0x16E8]
quest:_wait(1.0)  [pc 30, 0x16F4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 33, 0x1700]
quest:startFadeIn(player, 1.0)  [pc 37, 0x1710]
eventOwner:say(quest, 61.0, 0.0)  [pc 42, 0x1724]
eventOwner:say(quest, 62.0, 0.0)  [pc 47, 0x1738]
eventOwner:say(quest, 86.0, 0.0)  [pc 54, 0x1754]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x1780]
eventOwner:say(quest, 65.0, 0.0)  [pc 70, 0x1794]
eventOwner:say(quest, 66.0, 0.0)  [pc 75, 0x17A8]
eventOwner:_runCharaScheduler(354107392.0)  [pc 78, 0x17B4]
eventOwner:say(quest, 67.0, 0.0)  [pc 83, 0x17C8]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x17D0]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x169C]
require (arg4 == 1.0) is false  [pc 48, 0x173C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1688]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x1698]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x16AC]
quest:_wait(1.0)  [pc 15, 0x16B8]
eventOwner:say(quest, 60.0, 0.0)  [pc 20, 0x16CC]
quest:startFadeOut(player, 1.0)  [pc 24, 0x16DC]
quest:_wait(1.0)  [pc 27, 0x16E8]
quest:_wait(1.0)  [pc 30, 0x16F4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 33, 0x1700]
quest:startFadeIn(player, 1.0)  [pc 37, 0x1710]
eventOwner:say(quest, 61.0, 0.0)  [pc 42, 0x1724]
eventOwner:say(quest, 62.0, 0.0)  [pc 47, 0x1738]
eventOwner:say(quest, 63.0, 0.0)  [pc 60, 0x176C]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x1780]
eventOwner:say(quest, 65.0, 0.0)  [pc 70, 0x1794]
eventOwner:say(quest, 66.0, 0.0)  [pc 75, 0x17A8]
eventOwner:_runCharaScheduler(354107392.0)  [pc 78, 0x17B4]
eventOwner:say(quest, 67.0, 0.0)  [pc 83, 0x17C8]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x17D0]
return 
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x169C]
require (arg4 == 1.0) is true  [pc 48, 0x173C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1688]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x1698]
quest:_wait(1.0)  [pc 15, 0x16B8]
eventOwner:say(quest, 60.0, 0.0)  [pc 20, 0x16CC]
quest:startFadeOut(player, 1.0)  [pc 24, 0x16DC]
quest:_wait(1.0)  [pc 27, 0x16E8]
quest:_wait(1.0)  [pc 30, 0x16F4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 33, 0x1700]
quest:startFadeIn(player, 1.0)  [pc 37, 0x1710]
eventOwner:say(quest, 61.0, 0.0)  [pc 42, 0x1724]
eventOwner:say(quest, 62.0, 0.0)  [pc 47, 0x1738]
eventOwner:say(quest, 86.0, 0.0)  [pc 54, 0x1754]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x1780]
eventOwner:say(quest, 65.0, 0.0)  [pc 70, 0x1794]
eventOwner:say(quest, 66.0, 0.0)  [pc 75, 0x17A8]
eventOwner:_runCharaScheduler(354107392.0)  [pc 78, 0x17B4]
eventOwner:say(quest, 67.0, 0.0)  [pc 83, 0x17C8]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x17D0]
return 
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x169C]
require (arg4 == 1.0) is false  [pc 48, 0x173C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1688]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x1698]
quest:_wait(1.0)  [pc 15, 0x16B8]
eventOwner:say(quest, 60.0, 0.0)  [pc 20, 0x16CC]
quest:startFadeOut(player, 1.0)  [pc 24, 0x16DC]
quest:_wait(1.0)  [pc 27, 0x16E8]
quest:_wait(1.0)  [pc 30, 0x16F4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 33, 0x1700]
quest:startFadeIn(player, 1.0)  [pc 37, 0x1710]
eventOwner:say(quest, 61.0, 0.0)  [pc 42, 0x1724]
eventOwner:say(quest, 62.0, 0.0)  [pc 47, 0x1738]
eventOwner:say(quest, 63.0, 0.0)  [pc 60, 0x176C]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x1780]
eventOwner:say(quest, 65.0, 0.0)  [pc 70, 0x1794]
eventOwner:say(quest, 66.0, 0.0)  [pc 75, 0x17A8]
eventOwner:_runCharaScheduler(354107392.0)  [pc 78, 0x17B4]
eventOwner:say(quest, 67.0, 0.0)  [pc 83, 0x17C8]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x17D0]
return 
```

## menberCountUnderRange — 5 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 4, 0x1939]
eventOwner:_runCharaScheduler(354168832.0)  [pc 7, 0x1945]
eventOwner:say(quest, 20.0, 0.0)  [pc 12, 0x1959]
eventOwner:say(quest, 18.0, 0.0, 0.0, 0.0, arg5)  [pc 20, 0x1979]
worldMaster:say(quest, 71.0, 1.0, 0.0, arg5, arg4)  [pc 29, 0x199D]
eventOwner:finishCliantTalkTurn()  [pc 31, 0x19A5]
return 
```

