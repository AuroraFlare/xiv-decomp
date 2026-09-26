# 111404 com0l4: reconstructed client path templates

## processEventGUINCUMStart — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x2E2]
require (call55.1.return1 == 1.0) is true  [pc 56, 0x3A2]
require (call7.1.return1 == 0.0) is true  [pc 80, 0x402]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CE]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x2DE]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x2F2]
quest:_wait(1.0)  [pc 15, 0x2FE]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x312]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x326]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x332]
eventOwner:say(quest, 25.0, 0.0)  [pc 33, 0x346]
eventOwner:say(quest, 58.0, 0.0)  [pc 38, 0x35A]
eventOwner:say(quest, 59.0, 0.0)  [pc 43, 0x36E]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x382]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x396]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x39E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 60, 0x3B2]
eventOwner:say(quest, 29.0, 0.0)  [pc 65, 0x3C6]
eventOwner:say(quest, 30.0, 0.0)  [pc 70, 0x3DA]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41A]
return call55.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x2E2]
require (call55.1.return1 == 1.0) is false  [pc 56, 0x3A2]
require (call7.1.return1 == 0.0) is true  [pc 80, 0x402]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CE]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x2DE]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x2F2]
quest:_wait(1.0)  [pc 15, 0x2FE]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x312]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x326]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x332]
eventOwner:say(quest, 25.0, 0.0)  [pc 33, 0x346]
eventOwner:say(quest, 58.0, 0.0)  [pc 38, 0x35A]
eventOwner:say(quest, 59.0, 0.0)  [pc 43, 0x36E]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x382]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x396]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x39E]
eventOwner:_runCharaScheduler(354099200.0)  [pc 74, 0x3EA]
eventOwner:say(quest, 28.0, 0.0)  [pc 79, 0x3FE]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41A]
return call55.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x2E2]
require (call55.1.return1 == 1.0) is true  [pc 56, 0x3A2]
require (call7.1.return1 == 0.0) is false  [pc 80, 0x402]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CE]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x2DE]
quest:_wait(1.0)  [pc 15, 0x2FE]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x312]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x326]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x332]
eventOwner:say(quest, 25.0, 0.0)  [pc 33, 0x346]
eventOwner:say(quest, 58.0, 0.0)  [pc 38, 0x35A]
eventOwner:say(quest, 59.0, 0.0)  [pc 43, 0x36E]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x382]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x396]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x39E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 60, 0x3B2]
eventOwner:say(quest, 29.0, 0.0)  [pc 65, 0x3C6]
eventOwner:say(quest, 30.0, 0.0)  [pc 70, 0x3DA]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 84, 0x412]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41A]
return call55.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x2E2]
require (call55.1.return1 == 1.0) is false  [pc 56, 0x3A2]
require (call7.1.return1 == 0.0) is false  [pc 80, 0x402]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CE]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x2DE]
quest:_wait(1.0)  [pc 15, 0x2FE]
eventOwner:say(quest, 23.0, 0.0)  [pc 20, 0x312]
eventOwner:say(quest, 24.0, 0.0)  [pc 25, 0x326]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x332]
eventOwner:say(quest, 25.0, 0.0)  [pc 33, 0x346]
eventOwner:say(quest, 58.0, 0.0)  [pc 38, 0x35A]
eventOwner:say(quest, 59.0, 0.0)  [pc 43, 0x36E]
eventOwner:say(quest, 26.0, 0.0)  [pc 48, 0x382]
eventOwner:say(quest, 27.0, 0.0)  [pc 53, 0x396]
call55.1.return1 = quest:showQuestInfomation()  [pc 55, 0x39E]
eventOwner:_runCharaScheduler(354099200.0)  [pc 74, 0x3EA]
eventOwner:say(quest, 28.0, 0.0)  [pc 79, 0x3FE]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 84, 0x412]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41A]
return call55.1.return1
```

## processEvent_000_1 — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x5BA]
require (call7.1.return1 == 0.0) is true  [pc 31, 0x616]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5A6]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x5B6]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x5CA]
quest:_wait(1.0)  [pc 15, 0x5D6]
eventOwner:say(quest, 31.0, 0.0)  [pc 20, 0x5EA]
eventOwner:say(quest, 60.0, 0.0)  [pc 25, 0x5FE]
eventOwner:say(quest, 32.0, 0.0)  [pc 30, 0x612]
eventOwner:finishCliantTalkTurn()  [pc 37, 0x62E]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x5BA]
require (call7.1.return1 == 0.0) is false  [pc 31, 0x616]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5A6]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x5B6]
quest:_wait(1.0)  [pc 15, 0x5D6]
eventOwner:say(quest, 31.0, 0.0)  [pc 20, 0x5EA]
eventOwner:say(quest, 60.0, 0.0)  [pc 25, 0x5FE]
eventOwner:say(quest, 32.0, 0.0)  [pc 30, 0x612]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 35, 0x626]
eventOwner:finishCliantTalkTurn()  [pc 37, 0x62E]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x757]
require (call7.1.return1 == 0.0) is true  [pc 21, 0x78B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x743]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x753]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x767]
quest:_wait(1.0)  [pc 15, 0x773]
eventOwner:say(quest, 33.0, 0.0)  [pc 20, 0x787]
eventOwner:say(quest, 34.0, 0.0)  [pc 30, 0x7AF]
eventOwner:_runCharaScheduler(354123776.0)  [pc 33, 0x7BB]
quest:_wait(2.0)  [pc 36, 0x7C7]
eventOwner:say(quest, 35.0, 0.0)  [pc 41, 0x7DB]
quest:startFadeOut(player, 1.0)  [pc 45, 0x7EB]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 49, 0x7FB]
quest:_wait(2.0)  [pc 52, 0x807]
quest:startFadeIn(player, 1.0)  [pc 56, 0x817]
eventOwner:_runCharaScheduler(353959936.0)  [pc 59, 0x823]
eventOwner:say(quest, 36.0, 0.0)  [pc 64, 0x837]
eventOwner:say(quest, 37.0, 0.0)  [pc 69, 0x84B]
eventOwner:say(quest, 38.0, 0.0)  [pc 74, 0x85F]
eventOwner:say(quest, 63.0, 0.0)  [pc 79, 0x873]
eventOwner:finishCliantTalkTurn()  [pc 81, 0x87B]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x757]
require (call7.1.return1 == 0.0) is false  [pc 21, 0x78B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x743]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x753]
quest:_wait(1.0)  [pc 15, 0x773]
eventOwner:say(quest, 33.0, 0.0)  [pc 20, 0x787]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 25, 0x79B]
eventOwner:say(quest, 34.0, 0.0)  [pc 30, 0x7AF]
eventOwner:_runCharaScheduler(354123776.0)  [pc 33, 0x7BB]
quest:_wait(2.0)  [pc 36, 0x7C7]
eventOwner:say(quest, 35.0, 0.0)  [pc 41, 0x7DB]
quest:startFadeOut(player, 1.0)  [pc 45, 0x7EB]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 49, 0x7FB]
quest:_wait(2.0)  [pc 52, 0x807]
quest:startFadeIn(player, 1.0)  [pc 56, 0x817]
eventOwner:_runCharaScheduler(353959936.0)  [pc 59, 0x823]
eventOwner:say(quest, 36.0, 0.0)  [pc 64, 0x837]
eventOwner:say(quest, 37.0, 0.0)  [pc 69, 0x84B]
eventOwner:say(quest, 38.0, 0.0)  [pc 74, 0x85F]
eventOwner:say(quest, 63.0, 0.0)  [pc 79, 0x873]
eventOwner:finishCliantTalkTurn()  [pc 81, 0x87B]
return 
```

## processEvent_010_1 — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x9FD]
require (call7.1.return1 == 0.0) is true  [pc 31, 0xA59]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9E9]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x9F9]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0xA0D]
quest:_wait(1.0)  [pc 15, 0xA19]
eventOwner:say(quest, 39.0, 0.0)  [pc 20, 0xA2D]
eventOwner:say(quest, 40.0, 0.0)  [pc 25, 0xA41]
eventOwner:say(quest, 64.0, 0.0)  [pc 30, 0xA55]
eventOwner:finishCliantTalkTurn()  [pc 37, 0xA71]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x9FD]
require (call7.1.return1 == 0.0) is false  [pc 31, 0xA59]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9E9]
call7.1.return1 = eventOwner:doSalute(1.0, 15.0)  [pc 7, 0x9F9]
quest:_wait(1.0)  [pc 15, 0xA19]
eventOwner:say(quest, 39.0, 0.0)  [pc 20, 0xA2D]
eventOwner:say(quest, 40.0, 0.0)  [pc 25, 0xA41]
eventOwner:say(quest, 64.0, 0.0)  [pc 30, 0xA55]
eventOwner:_waitForCharaSchedulerFinished(call7.1.return1)  [pc 35, 0xA69]
eventOwner:finishCliantTalkTurn()  [pc 37, 0xA71]
return 
```

## processEvent_015 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB86]
eventOwner:say(quest, 41.0, 0.0)  [pc 8, 0xB9A]
eventOwner:_runCharaScheduler(354115584.0)  [pc 11, 0xBA6]
eventOwner:say(quest, 42.0, 0.0)  [pc 16, 0xBBA]
quest:startFadeOut(player, 1.0)  [pc 20, 0xBCA]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 24, 0xBDA]
eventOwner:_runCharaScheduler(354082816.0)  [pc 27, 0xBE6]
quest:_wait(1.0)  [pc 30, 0xBF2]
quest:startFadeIn(player, 1.0)  [pc 34, 0xC02]
eventOwner:say(quest, 43.0, 0.0)  [pc 39, 0xC16]
eventOwner:say(quest, 62.0, 0.0)  [pc 44, 0xC2A]
quest:startFadeOut(player, 1.0)  [pc 48, 0xC3A]
eventOwner:finishCliantTalkTurn()  [pc 50, 0xC42]
quest:_wait(1.0)  [pc 53, 0xC4E]
quest:startFadeIn(player, 1.0)  [pc 57, 0xC5E]
return 
```

## processEventNymiene — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 7, 0xD81]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD71]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0xD7D]
eventOwner:say(quest, 44.0, 0.0)  [pc 13, 0xD99]
eventOwner:say(quest, 46.0, 0.0)  [pc 24, 0xDC5]
eventOwner:say(quest, 47.0, 0.0)  [pc 29, 0xDD9]
eventOwner:finishCliantTalkTurn()  [pc 31, 0xDE1]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 7, 0xD81]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD71]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0xD7D]
eventOwner:say(quest, 45.0, 0.0)  [pc 19, 0xDB1]
eventOwner:say(quest, 46.0, 0.0)  [pc 24, 0xDC5]
eventOwner:say(quest, 47.0, 0.0)  [pc 29, 0xDD9]
eventOwner:finishCliantTalkTurn()  [pc 31, 0xDE1]
return 
```

## processEventNymiene_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xEBD]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0xEC9]
eventOwner:say(quest, 57.0, 0.0)  [pc 11, 0xEDD]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xEE5]
return 
```

## processEventAergfloh — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF9D]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0xFA9]
eventOwner:say(quest, 48.0, 0.0)  [pc 11, 0xFBD]
eventOwner:say(quest, 49.0, 0.0)  [pc 16, 0xFD1]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xFD9]
return 
```

## processEventAergfloh_01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x109A]
eventOwner:_runCharaScheduler(353980416.0)  [pc 6, 0x10A6]
eventOwner:say(quest, 50.0, 0.0)  [pc 11, 0x10BA]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x10C2]
return 
```

## processEvent_020 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 12, 0x119E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x117A]
eventOwner:_runCharaScheduler(354123776.0)  [pc 6, 0x1186]
eventOwner:say(quest, 51.0, 0.0)  [pc 11, 0x119A]
eventOwner:say(quest, 52.0, 0.0)  [pc 18, 0x11B6]
eventOwner:say(quest, 53.0, 0.0)  [pc 23, 0x11CA]
eventOwner:say(quest, 54.0, 0.0)  [pc 28, 0x11DE]
eventOwner:say(quest, 55.0, 0.0)  [pc 33, 0x11F2]
eventOwner:finishCliantTalkTurn()  [pc 35, 0x11FA]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 12, 0x119E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x117A]
eventOwner:_runCharaScheduler(354123776.0)  [pc 6, 0x1186]
eventOwner:say(quest, 51.0, 0.0)  [pc 11, 0x119A]
quest:startFadeOutCutSceneDefault(player)  [pc 40, 0x120E]
quest:startNQCutScene('com0l410', 1.0)  [pc 44, 0x121E]
quest:startFadeInCutSceneDefault(player)  [pc 47, 0x122A]
eventOwner:finishCliantTalkTurn()  [pc 49, 0x1232]
return 
```

