# 111604 com0g4: reconstructed client path templates

## processEventStart — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x272]
require (call7.1.return1 == 0.0) is true  [pc 36, 0x2E2]
require (call55.1.return1 == 1.0) is true  [pc 56, 0x332]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x25E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x26E]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x282]
quest:_wait(1.0)  [pc 15, 0x28E]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x2A2]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x2B6]
eventOwner:say(quest, 25.0, 0.0)  [pc 30, 0x2CA]
eventOwner:say(quest, 59.0, 0.0)  [pc 35, 0x2DE]
eventOwner:_runCharaScheduler(353972224.0)  [pc 43, 0x2FE]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x312]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x326]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x32E]
eventOwner:_runCharaScheduler(353976320.0)  [pc 60, 0x342]
eventOwner:say(quest, 29.0, 0.0)  [pc 65, 0x356]
eventOwner:finishCliantTalkTurn()  [pc 67, 0x35E]
return call55.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x272]
require (call7.1.return1 == 0.0) is true  [pc 36, 0x2E2]
require (call55.1.return1 == 1.0) is false  [pc 56, 0x332]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x25E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x26E]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x282]
quest:_wait(1.0)  [pc 15, 0x28E]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x2A2]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x2B6]
eventOwner:say(quest, 25.0, 0.0)  [pc 30, 0x2CA]
eventOwner:say(quest, 59.0, 0.0)  [pc 35, 0x2DE]
eventOwner:_runCharaScheduler(353972224.0)  [pc 43, 0x2FE]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x312]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x326]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x32E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 72, 0x372]
eventOwner:say(quest, 28.0, 0.0)  [pc 77, 0x386]
eventOwner:finishCliantTalkTurn()  [pc 79, 0x38E]
return call55.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x272]
require (call7.1.return1 == 0.0) is false  [pc 36, 0x2E2]
require (call55.1.return1 == 1.0) is true  [pc 56, 0x332]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x25E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x26E]
quest:_wait(1.0)  [pc 15, 0x28E]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x2A2]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x2B6]
eventOwner:say(quest, 25.0, 0.0)  [pc 30, 0x2CA]
eventOwner:say(quest, 59.0, 0.0)  [pc 35, 0x2DE]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 40, 0x2F2]
eventOwner:_runCharaScheduler(353972224.0)  [pc 43, 0x2FE]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x312]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x326]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x32E]
eventOwner:_runCharaScheduler(353976320.0)  [pc 60, 0x342]
eventOwner:say(quest, 29.0, 0.0)  [pc 65, 0x356]
eventOwner:finishCliantTalkTurn()  [pc 67, 0x35E]
return call55.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x272]
require (call7.1.return1 == 0.0) is false  [pc 36, 0x2E2]
require (call55.1.return1 == 1.0) is false  [pc 56, 0x332]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x25E]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x26E]
quest:_wait(1.0)  [pc 15, 0x28E]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x2A2]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x2B6]
eventOwner:say(quest, 25.0, 0.0)  [pc 30, 0x2CA]
eventOwner:say(quest, 59.0, 0.0)  [pc 35, 0x2DE]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 40, 0x2F2]
eventOwner:_runCharaScheduler(353972224.0)  [pc 43, 0x2FE]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x312]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x326]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x32E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 72, 0x372]
eventOwner:say(quest, 28.0, 0.0)  [pc 77, 0x386]
eventOwner:finishCliantTalkTurn()  [pc 79, 0x38E]
return call55.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x525]
require (call7.1.return1 == 0.0) is true  [pc 26, 0x56D]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x511]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x521]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x535]
quest:_wait(1.0)  [pc 15, 0x541]
eventOwner:say(quest, 30.0, 0.0)  [pc 20, 0x555]
eventOwner:say(quest, 31.0, 0.0)  [pc 25, 0x569]
eventOwner:_runCharaScheduler(353976320.0)  [pc 33, 0x589]
eventOwner:say(quest, 32.0, 0.0)  [pc 38, 0x59D]
eventOwner:finishCliantTalkTurn()  [pc 40, 0x5A5]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x525]
require (call7.1.return1 == 0.0) is false  [pc 26, 0x56D]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x511]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x521]
quest:_wait(1.0)  [pc 15, 0x541]
eventOwner:say(quest, 30.0, 0.0)  [pc 20, 0x555]
eventOwner:say(quest, 31.0, 0.0)  [pc 25, 0x569]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 30, 0x57D]
eventOwner:_runCharaScheduler(353976320.0)  [pc 33, 0x589]
eventOwner:say(quest, 32.0, 0.0)  [pc 38, 0x59D]
eventOwner:finishCliantTalkTurn()  [pc 40, 0x5A5]
return 
```

## processEventFulke — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x6E4]
require (call7.1.return1 == 0.0) is true  [pc 26, 0x72C]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x6D0]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x6E0]
eventOwner:_runCharaScheduler(353976320.0)  [pc 12, 0x6F4]
quest:_wait(1.0)  [pc 15, 0x700]
eventOwner:say(quest, 33.0, 0.0)  [pc 20, 0x714]
eventOwner:say(quest, 34.0, 0.0)  [pc 25, 0x728]
player:_runCharaScheduler(354107392.0)  [pc 33, 0x748]
eventOwner:_runCharaScheduler(354111488.0)  [pc 36, 0x754]
quest:_wait(2.5)  [pc 39, 0x760]
eventOwner:say(quest, 35.0, 0.0)  [pc 44, 0x774]
quest:startFadeOut(player, 1.5)  [pc 48, 0x784]
quest:_wait(1.5)  [pc 51, 0x790]
quest:startFadeIn(player, 1.5)  [pc 55, 0x7A0]
eventOwner:_runCharaScheduler(353972224.0)  [pc 58, 0x7AC]
eventOwner:say(quest, 36.0, 0.0)  [pc 63, 0x7C0]
eventOwner:say(quest, 60.0, 0.0)  [pc 68, 0x7D4]
eventOwner:say(quest, 37.0, 0.0)  [pc 73, 0x7E8]
eventOwner:_runCharaScheduler(353959936.0)  [pc 76, 0x7F4]
eventOwner:say(quest, 38.0, 0.0)  [pc 81, 0x808]
eventOwner:say(quest, 39.0, 0.0)  [pc 86, 0x81C]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x824]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x6E4]
require (call7.1.return1 == 0.0) is false  [pc 26, 0x72C]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x6D0]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x6E0]
quest:_wait(1.0)  [pc 15, 0x700]
eventOwner:say(quest, 33.0, 0.0)  [pc 20, 0x714]
eventOwner:say(quest, 34.0, 0.0)  [pc 25, 0x728]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 30, 0x73C]
player:_runCharaScheduler(354107392.0)  [pc 33, 0x748]
eventOwner:_runCharaScheduler(354111488.0)  [pc 36, 0x754]
quest:_wait(2.5)  [pc 39, 0x760]
eventOwner:say(quest, 35.0, 0.0)  [pc 44, 0x774]
quest:startFadeOut(player, 1.5)  [pc 48, 0x784]
quest:_wait(1.5)  [pc 51, 0x790]
quest:startFadeIn(player, 1.5)  [pc 55, 0x7A0]
eventOwner:_runCharaScheduler(353972224.0)  [pc 58, 0x7AC]
eventOwner:say(quest, 36.0, 0.0)  [pc 63, 0x7C0]
eventOwner:say(quest, 60.0, 0.0)  [pc 68, 0x7D4]
eventOwner:say(quest, 37.0, 0.0)  [pc 73, 0x7E8]
eventOwner:_runCharaScheduler(353959936.0)  [pc 76, 0x7F4]
eventOwner:say(quest, 38.0, 0.0)  [pc 81, 0x808]
eventOwner:say(quest, 39.0, 0.0)  [pc 86, 0x81C]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x824]
return 
```

## processEventFulkeFree — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x9D7]
require (call7.1.return1 == 0.0) is true  [pc 26, 0xA1F]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x9C3]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x9D3]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x9E7]
quest:_wait(1.0)  [pc 15, 0x9F3]
eventOwner:say(quest, 40.0, 0.0)  [pc 20, 0xA07]
eventOwner:say(quest, 41.0, 0.0)  [pc 25, 0xA1B]
eventOwner:finishCliantTalkTurn()  [pc 32, 0xA37]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x9D7]
require (call7.1.return1 == 0.0) is false  [pc 26, 0xA1F]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x9C3]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x9D3]
quest:_wait(1.0)  [pc 15, 0x9F3]
eventOwner:say(quest, 40.0, 0.0)  [pc 20, 0xA07]
eventOwner:say(quest, 41.0, 0.0)  [pc 25, 0xA1B]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 30, 0xA2F]
eventOwner:finishCliantTalkTurn()  [pc 32, 0xA37]
return 
```

## processEventRadulf — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB50]
eventOwner:say(quest, 42.0, 0.0)  [pc 8, 0xB64]
player:_runCharaScheduler(354107392.0)  [pc 11, 0xB70]
eventOwner:_runCharaScheduler(354111488.0)  [pc 14, 0xB7C]
quest:_wait(2.5)  [pc 17, 0xB88]
eventOwner:say(quest, 43.0, 0.0)  [pc 22, 0xB9C]
quest:startFadeOut(player, 1.5)  [pc 26, 0xBAC]
quest:_wait(1.5)  [pc 29, 0xBB8]
quest:startFadeIn(player, 1.5)  [pc 33, 0xBC8]
eventOwner:say(quest, 44.0, 0.0)  [pc 38, 0xBDC]
eventOwner:say(quest, 45.0, 0.0)  [pc 43, 0xBF0]
eventOwner:_runCharaScheduler(353959936.0)  [pc 46, 0xBFC]
eventOwner:say(quest, 46.0, 0.0)  [pc 51, 0xC10]
eventOwner:say(quest, 61.0, 0.0)  [pc 56, 0xC24]
eventOwner:say(quest, 47.0, 0.0)  [pc 61, 0xC38]
eventOwner:say(quest, 48.0, 0.0)  [pc 66, 0xC4C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 69, 0xC58]
eventOwner:say(quest, 49.0, 0.0)  [pc 74, 0xC6C]
eventOwner:say(quest, 50.0, 0.0)  [pc 79, 0xC80]
player:_runCharaScheduler(354111488.0)  [pc 82, 0xC8C]
eventOwner:_runCharaScheduler(354107392.0)  [pc 85, 0xC98]
quest:_wait(2.5)  [pc 88, 0xCA4]
eventOwner:say(quest, 51.0, 0.0)  [pc 93, 0xCB8]
eventOwner:finishCliantTalkTurn()  [pc 95, 0xCC0]
return 
```

## processEventRadulfFree — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE2D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xE39]
eventOwner:say(quest, 58.0, 0.0)  [pc 11, 0xE4D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE55]
return 
```

## processEventClear — 5 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is true  [pc 21, 0xF55]
require (arg4 == 0.0) is true  [pc 26, 0xF69]
require (arg5 == 0.0) is true  [pc 28, 0xF71]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0xF31]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
quest:startFadeOutCutSceneDefault(player)  [pc 32, 0xF81]
quest:startNQCutScene('com0g410', 1.0)  [pc 36, 0xF91]
quest:startFadeInCutSceneDefault(player)  [pc 39, 0xF9D]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is true  [pc 21, 0xF55]
require (arg4 == 0.0) is true  [pc 26, 0xF69]
require (arg5 == 0.0) is false  [pc 28, 0xF71]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0xF31]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
eventOwner:say(quest, 53.0, 0.0)  [pc 45, 0xFB5]
eventOwner:say(quest, 54.0, 0.0)  [pc 50, 0xFC9]
eventOwner:say(quest, 55.0, 0.0)  [pc 55, 0xFDD]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0xFF1]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

### Path 3

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is true  [pc 21, 0xF55]
require (arg4 == 0.0) is false  [pc 26, 0xF69]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0xF31]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
eventOwner:say(quest, 53.0, 0.0)  [pc 45, 0xFB5]
eventOwner:say(quest, 54.0, 0.0)  [pc 50, 0xFC9]
eventOwner:say(quest, 55.0, 0.0)  [pc 55, 0xFDD]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0xFF1]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is false  [pc 21, 0xF55]
require (arg4 == 0.0) is true  [pc 26, 0xF69]
require (arg5 == 0.0) is true  [pc 28, 0xF71]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 25, 0xF65]
quest:startFadeOutCutSceneDefault(player)  [pc 32, 0xF81]
quest:startNQCutScene('com0g410', 1.0)  [pc 36, 0xF91]
quest:startFadeInCutSceneDefault(player)  [pc 39, 0xF9D]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

### Path 5

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is false  [pc 21, 0xF55]
require (arg4 == 0.0) is true  [pc 26, 0xF69]
require (arg5 == 0.0) is false  [pc 28, 0xF71]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 25, 0xF65]
eventOwner:say(quest, 53.0, 0.0)  [pc 45, 0xFB5]
eventOwner:say(quest, 54.0, 0.0)  [pc 50, 0xFC9]
eventOwner:say(quest, 55.0, 0.0)  [pc 55, 0xFDD]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0xFF1]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

### Path 6

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0xF21]
require (call7.1.return1 == 0.0) is false  [pc 21, 0xF55]
require (arg4 == 0.0) is false  [pc 26, 0xF69]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xF0D]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0xF1D]
quest:_wait(1.0)  [pc 15, 0xF3D]
eventOwner:say(quest, 52.0, 0.0)  [pc 20, 0xF51]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 25, 0xF65]
eventOwner:say(quest, 53.0, 0.0)  [pc 45, 0xFB5]
eventOwner:say(quest, 54.0, 0.0)  [pc 50, 0xFC9]
eventOwner:say(quest, 55.0, 0.0)  [pc 55, 0xFDD]
eventOwner:say(quest, 56.0, 0.0)  [pc 60, 0xFF1]
eventOwner:finishCliantTalkTurn()  [pc 62, 0xFF9]
return 
```

