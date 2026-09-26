# 111811 com5u1: reconstructed client path templates

## processEventAUBREYStart — 3 parameters
### Path 1

```text
require (call63.1.return1 == 1.0) is true  [pc 64, 0x369]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x275]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x285]
quest:_wait(1.0)  [pc 10, 0x291]
eventOwner:say(quest, 2.0, 0.0)  [pc 15, 0x2A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 20, 0x2B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 25, 0x2CD]
eventOwner:_runCharaScheduler(354086912.0)  [pc 28, 0x2D9]
eventOwner:say(quest, 5.0, 0.0)  [pc 33, 0x2ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 38, 0x301]
eventOwner:say(quest, 64.0, 0.0)  [pc 43, 0x315]
eventOwner:say(quest, 7.0, 0.0)  [pc 48, 0x329]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x33D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 56, 0x349]
eventOwner:say(quest, 9.0, 0.0)  [pc 61, 0x35D]
call63.1.return1 = quest:showQuestInfomation()  [pc 63, 0x365]
eventOwner:_runCharaScheduler(354107392.0)  [pc 68, 0x379]
eventOwner:say(quest, 11.0, 0.0)  [pc 73, 0x38D]
eventOwner:finishCliantTalkTurn()  [pc 84, 0x3B9]
return call63.1.return1
```

### Path 2

```text
require (call63.1.return1 == 1.0) is false  [pc 64, 0x369]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x275]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x285]
quest:_wait(1.0)  [pc 10, 0x291]
eventOwner:say(quest, 2.0, 0.0)  [pc 15, 0x2A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 20, 0x2B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 25, 0x2CD]
eventOwner:_runCharaScheduler(354086912.0)  [pc 28, 0x2D9]
eventOwner:say(quest, 5.0, 0.0)  [pc 33, 0x2ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 38, 0x301]
eventOwner:say(quest, 64.0, 0.0)  [pc 43, 0x315]
eventOwner:say(quest, 7.0, 0.0)  [pc 48, 0x329]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x33D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 56, 0x349]
eventOwner:say(quest, 9.0, 0.0)  [pc 61, 0x35D]
call63.1.return1 = quest:showQuestInfomation()  [pc 63, 0x365]
eventOwner:_runCharaScheduler(354041856.0)  [pc 77, 0x39D]
eventOwner:say(quest, 10.0, 0.0)  [pc 82, 0x3B1]
eventOwner:finishCliantTalkTurn()  [pc 84, 0x3B9]
return call63.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x521]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x52D]
eventOwner:say(quest, 12.0, 0.0)  [pc 11, 0x541]
eventOwner:say(quest, 13.0, 0.0)  [pc 16, 0x555]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x55D]
return 
```

## processEvent_010 — 6 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 4, 0x61E]
quest:_wait(1.0)  [pc 7, 0x62A]
eventOwner:say(quest, 14.0, 0.0)  [pc 12, 0x63E]
player:_runCharaScheduler(354107392.0)  [pc 15, 0x64A]
quest:_wait(3.0)  [pc 18, 0x656]
eventOwner:say(quest, 15.0, 0.0)  [pc 23, 0x66A]
eventOwner:say(quest, 16.0, 0.0)  [pc 28, 0x67E]
eventOwner:say(quest, 65.0, 0.0)  [pc 33, 0x692]
eventOwner:_runCharaScheduler(354103296.0)  [pc 36, 0x69E]
eventOwner:say(quest, 17.0, 0.0)  [pc 41, 0x6B2]
eventOwner:say(quest, 18.0, 0.0)  [pc 46, 0x6C6]
eventOwner:say(quest, 66.0, 0.0, 0.0, arg4, arg5, arg6)  [pc 55, 0x6EA]
eventOwner:say(quest, 19.0, 0.0)  [pc 60, 0x6FE]
worldMaster:say(quest, 62.0, 1.0, arg4, arg5, arg6)  [pc 69, 0x722]
eventOwner:finishCliantTalkTurn()  [pc 71, 0x72A]
return 
```

## processEvent_020 — 6 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x858]
eventOwner:_runCharaScheduler(354123776.0)  [pc 7, 0x864]
quest:_wait(2.0)  [pc 10, 0x870]
eventOwner:say(quest, 22.0, 0.0)  [pc 15, 0x884]
eventOwner:say(quest, 25.0, 0.0)  [pc 20, 0x898]
eventOwner:say(quest, 26.0, 0.0)  [pc 25, 0x8AC]
eventOwner:_runCharaScheduler(354082816.0)  [pc 28, 0x8B8]
eventOwner:say(quest, 27.0, 0.0)  [pc 33, 0x8CC]
worldMaster:say(quest, 28.0, 1.0, 0.0)  [pc 40, 0x8E8]
eventOwner:say(quest, 29.0, 0.0)  [pc 45, 0x8FC]
worldMaster:say(quest, 31.0, 1.0, arg4, arg5, arg6)  [pc 54, 0x920]
eventOwner:say(quest, 32.0, 0.0)  [pc 59, 0x934]
eventOwner:say(quest, 33.0, 0.0)  [pc 64, 0x948]
eventOwner:_runCharaScheduler(354041856.0)  [pc 67, 0x954]
eventOwner:say(quest, 34.0, 0.0)  [pc 72, 0x968]
worldMaster:say(quest, 70.0, 1.0, arg4, arg5, arg6)  [pc 81, 0x98C]
eventOwner:say(quest, 35.0, 0.0)  [pc 86, 0x9A0]
eventOwner:_runCharaScheduler(353959936.0)  [pc 89, 0x9AC]
eventOwner:say(quest, 36.0, 0.0)  [pc 94, 0x9C0]
eventOwner:finishCliantTalkTurn()  [pc 96, 0x9C8]
return 
```

## processEvent_020_1 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0xB58]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB2C]
eventOwner:say(quest, 61.0, 0.0)  [pc 8, 0xB40]
call13.1.return1 = eventOwner:ask(quest, 37.0, 2.0)  [pc 13, 0xB54]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0xB58]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB2C]
eventOwner:say(quest, 61.0, 0.0)  [pc 8, 0xB40]
call13.1.return1 = eventOwner:ask(quest, 37.0, 2.0)  [pc 13, 0xB54]
eventOwner:say(quest, 40.0, 0.0)  [pc 21, 0xB74]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xB7C]
return call13.1.return1
```

## processEvent_020_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC37]
eventOwner:say(quest, 41.0, 0.0)  [pc 8, 0xC4B]
eventOwner:finishCliantTalkTurn()  [pc 10, 0xC53]
return 
```

## processEvent_030 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0xCE6]
quest:_wait(1.0)  [pc 6, 0xCF2]
eventOwner:say(quest, 42.0, 0.0)  [pc 11, 0xD06]
eventOwner:say(quest, 67.0, 0.0)  [pc 16, 0xD1A]
player:_runCharaScheduler(354107392.0)  [pc 19, 0xD26]
quest:_wait(3.0)  [pc 22, 0xD32]
eventOwner:say(quest, 43.0, 0.0)  [pc 27, 0xD46]
eventOwner:say(quest, 44.0, 0.0)  [pc 32, 0xD5A]
eventOwner:_runCharaScheduler(83955712.0)  [pc 35, 0xD66]
quest:_wait(1.0)  [pc 38, 0xD72]
eventOwner:say(quest, 45.0, 0.0)  [pc 43, 0xD86]
eventOwner:say(quest, 46.0, 0.0)  [pc 48, 0xD9A]
eventOwner:say(quest, 47.0, 0.0)  [pc 53, 0xDAE]
eventOwner:say(quest, 68.0, 0.0)  [pc 58, 0xDC2]
eventOwner:say(quest, 48.0, 0.0)  [pc 63, 0xDD6]
eventOwner:_runCharaScheduler(83943424.0)  [pc 66, 0xDE2]
eventOwner:say(quest, 49.0, 0.0)  [pc 71, 0xDF6]
eventOwner:_waitForCharaSchedulerFinished(83943424.0)  [pc 74, 0xE02]
eventOwner:_runCharaScheduler(354000896.0)  [pc 77, 0xE0E]
eventOwner:say(quest, 50.0, 0.0)  [pc 82, 0xE22]
eventOwner:say(quest, 51.0, 0.0)  [pc 87, 0xE36]
eventOwner:finishCliantTalkTurn()  [pc 89, 0xE3E]
return 
```

## processEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFA8]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0xFB8]
quest:_wait(1.0)  [pc 10, 0xFC4]
eventOwner:say(quest, 54.0, 0.0)  [pc 15, 0xFD8]
eventOwner:say(quest, 69.0, 0.0)  [pc 20, 0xFEC]
eventOwner:_runCharaScheduler(354099200.0)  [pc 23, 0xFF8]
eventOwner:say(quest, 55.0, 0.0)  [pc 28, 0x100C]
quest:startFadeOut(player, 1.0)  [pc 32, 0x101C]
quest:_wait(2.0)  [pc 35, 0x1028]
quest:startFadeIn(player, 1.0)  [pc 39, 0x1038]
eventOwner:_runCharaScheduler(354086912.0)  [pc 42, 0x1044]
eventOwner:say(quest, 56.0, 0.0)  [pc 47, 0x1058]
eventOwner:say(quest, 57.0, 0.0)  [pc 52, 0x106C]
eventOwner:say(quest, 58.0, 0.0)  [pc 57, 0x1080]
eventOwner:say(quest, 59.0, 0.0)  [pc 62, 0x1094]
eventOwner:say(quest, 60.0, 0.0)  [pc 67, 0x10A8]
eventOwner:_runCharaScheduler(354107392.0)  [pc 70, 0x10B4]
eventOwner:finishCliantTalkTurn()  [pc 72, 0x10BC]
return 
```

