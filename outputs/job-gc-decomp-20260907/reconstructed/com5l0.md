# 111410 com5l0: reconstructed client path templates

## processEventGUINCUMStart — 5 parameters
### Path 1

```text
require (call8.1.return1 == 0.0) is true  [pc 9, 0x369]
require (arg5 == 1.0) is true  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is true  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
eventOwner:_runCharaScheduler(354041856.0)  [pc 13, 0x379]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 84.0, 0.0)  [pc 54, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354103296.0)  [pc 88, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 93, 0x4B9]
eventOwner:say(quest, 13.0, 0.0, 0.0, 0.0, arg4)  [pc 101, 0x4D9]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 2

```text
require (call8.1.return1 == 0.0) is true  [pc 9, 0x369]
require (arg5 == 1.0) is true  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is false  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
eventOwner:_runCharaScheduler(354041856.0)  [pc 13, 0x379]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 84.0, 0.0)  [pc 54, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354099200.0)  [pc 105, 0x4E9]
eventOwner:say(quest, 11.0, 0.0)  [pc 110, 0x4FD]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 3

```text
require (call8.1.return1 == 0.0) is true  [pc 9, 0x369]
require (arg5 == 1.0) is false  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is true  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
eventOwner:_runCharaScheduler(354041856.0)  [pc 13, 0x379]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x435]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354103296.0)  [pc 88, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 93, 0x4B9]
eventOwner:say(quest, 13.0, 0.0, 0.0, 0.0, arg4)  [pc 101, 0x4D9]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 4

```text
require (call8.1.return1 == 0.0) is true  [pc 9, 0x369]
require (arg5 == 1.0) is false  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is false  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
eventOwner:_runCharaScheduler(354041856.0)  [pc 13, 0x379]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x435]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354099200.0)  [pc 105, 0x4E9]
eventOwner:say(quest, 11.0, 0.0)  [pc 110, 0x4FD]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 5

```text
require (call8.1.return1 == 0.0) is false  [pc 9, 0x369]
require (arg5 == 1.0) is true  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is true  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 84.0, 0.0)  [pc 54, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354103296.0)  [pc 88, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 93, 0x4B9]
eventOwner:say(quest, 13.0, 0.0, 0.0, 0.0, arg4)  [pc 101, 0x4D9]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 6

```text
require (call8.1.return1 == 0.0) is false  [pc 9, 0x369]
require (arg5 == 1.0) is true  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is false  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 84.0, 0.0)  [pc 54, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354099200.0)  [pc 105, 0x4E9]
eventOwner:say(quest, 11.0, 0.0)  [pc 110, 0x4FD]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 7

```text
require (call8.1.return1 == 0.0) is false  [pc 9, 0x369]
require (arg5 == 1.0) is false  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is true  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x435]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354103296.0)  [pc 88, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 93, 0x4B9]
eventOwner:say(quest, 13.0, 0.0, 0.0, 0.0, arg4)  [pc 101, 0x4D9]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

### Path 8

```text
require (call8.1.return1 == 0.0) is false  [pc 9, 0x369]
require (arg5 == 1.0) is false  [pc 48, 0x405]
require (call83.1.return1 == 1.0) is false  [pc 84, 0x495]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x355]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x365]
quest:_wait(1.0)  [pc 16, 0x385]
eventOwner:say(quest, 2.0, 0.0, 0.0, 0.0, arg4)  [pc 24, 0x3A5]
eventOwner:say(quest, 3.0, 0.0)  [pc 29, 0x3B9]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x3CD]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x3E1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 42, 0x3ED]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x401]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x435]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x449]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x455]
eventOwner:say(quest, 9.0, 0.0)  [pc 73, 0x469]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg4)  [pc 81, 0x489]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x491]
eventOwner:_runCharaScheduler(354099200.0)  [pc 105, 0x4E9]
eventOwner:say(quest, 11.0, 0.0)  [pc 110, 0x4FD]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x505]
return call83.1.return1
```

## processEvent_000 — 4 parameters
### Path 1

```text
require (call8.1.return1 == 0.0) is true  [pc 9, 0x6A0]
require (call8.1.return1 == 0.0) is true  [pc 34, 0x704]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x68C]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x69C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 13, 0x6B0]
quest:_wait(1.0)  [pc 16, 0x6BC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 20, 0x6CC]
eventOwner:say(quest, 14.0, 0.0)  [pc 25, 0x6E0]
eventOwner:say(quest, 15.0, 0.0, 0.0, 0.0, arg4)  [pc 33, 0x700]
eventOwner:finishCliantTalkTurn()  [pc 40, 0x71C]
return 
```

### Path 2

```text
require (call8.1.return1 == 0.0) is false  [pc 9, 0x6A0]
require (call8.1.return1 == 0.0) is false  [pc 34, 0x704]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x68C]
call8.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 8, 0x69C]
quest:_wait(1.0)  [pc 16, 0x6BC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 20, 0x6CC]
eventOwner:say(quest, 14.0, 0.0)  [pc 25, 0x6E0]
eventOwner:say(quest, 15.0, 0.0, 0.0, 0.0, arg4)  [pc 33, 0x700]
eventOwner:_waitForCharaSchedulerFinished(call8.1.return1)  [pc 38, 0x714]
eventOwner:finishCliantTalkTurn()  [pc 40, 0x71C]
return 
```

## processEvent_005 — 5 parameters
### Path 1

```text
require (arg5 == 1.0) is true  [pc 38, 0x8B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x82C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 7, 0x838]
eventOwner:say(quest, 16.0, 0.0)  [pc 12, 0x84C]
player:_runCharaScheduler(354107392.0)  [pc 15, 0x858]
quest:_wait(5.0)  [pc 18, 0x864]
quest:startFadeOut(player, 1.0)  [pc 22, 0x874]
quest:_wait(1.0)  [pc 25, 0x880]
quest:startFadeIn(player, 1.0)  [pc 29, 0x890]
eventOwner:_runCharaScheduler(353959936.0)  [pc 32, 0x89C]
eventOwner:say(quest, 17.0, 0.0)  [pc 37, 0x8B0]
eventOwner:say(quest, 85.0, 0.0)  [pc 44, 0x8CC]
eventOwner:say(quest, 19.0, 0.0, 1.0, 0.0, arg4)  [pc 58, 0x904]
eventOwner:say(quest, 20.0, 0.0)  [pc 63, 0x918]
eventOwner:say(quest, 21.0, 0.0)  [pc 68, 0x92C]
eventOwner:say(quest, 22.0, 0.0)  [pc 73, 0x940]
eventOwner:_runCharaScheduler(354107392.0)  [pc 76, 0x94C]
eventOwner:say(quest, 23.0, 0.0)  [pc 81, 0x960]
eventOwner:say(quest, 24.0, 0.0)  [pc 86, 0x974]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x97C]
return 
```

### Path 2

```text
require (arg5 == 1.0) is false  [pc 38, 0x8B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x82C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 7, 0x838]
eventOwner:say(quest, 16.0, 0.0)  [pc 12, 0x84C]
player:_runCharaScheduler(354107392.0)  [pc 15, 0x858]
quest:_wait(5.0)  [pc 18, 0x864]
quest:startFadeOut(player, 1.0)  [pc 22, 0x874]
quest:_wait(1.0)  [pc 25, 0x880]
quest:startFadeIn(player, 1.0)  [pc 29, 0x890]
eventOwner:_runCharaScheduler(353959936.0)  [pc 32, 0x89C]
eventOwner:say(quest, 17.0, 0.0)  [pc 37, 0x8B0]
eventOwner:say(quest, 18.0, 0.0)  [pc 50, 0x8E4]
eventOwner:say(quest, 19.0, 0.0, 1.0, 0.0, arg4)  [pc 58, 0x904]
eventOwner:say(quest, 20.0, 0.0)  [pc 63, 0x918]
eventOwner:say(quest, 21.0, 0.0)  [pc 68, 0x92C]
eventOwner:say(quest, 22.0, 0.0)  [pc 73, 0x940]
eventOwner:_runCharaScheduler(354107392.0)  [pc 76, 0x94C]
eventOwner:say(quest, 23.0, 0.0)  [pc 81, 0x960]
eventOwner:say(quest, 24.0, 0.0)  [pc 86, 0x974]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x97C]
return 
```

## processEvent_005_01 — 5 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0xACE]
eventOwner:_runCharaScheduler(353959936.0)  [pc 7, 0xADA]
eventOwner:say(quest, 25.0, 0.0)  [pc 12, 0xAEE]
eventOwner:say(quest, 26.0, 0.0, 0.0, 0.0, arg4)  [pc 20, 0xB0E]
worldMaster:say(quest, 80.0, 1.0, 0.0, arg4, arg5)  [pc 29, 0xB32]
eventOwner:finishCliantTalkTurn()  [pc 31, 0xB3A]
return 
```

## processEvent_010 — 5 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 7, 0xC2A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC1A]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0xC26]
eventOwner:say(quest, 29.0, 0.0)  [pc 13, 0xC42]
quest:startFadeOut(player, 1.0)  [pc 23, 0xC6A]
quest:_wait(1.0)  [pc 26, 0xC76]
quest:startFadeIn(player, 1.0)  [pc 30, 0xC86]
eventOwner:_runCharaScheduler(70844416.0)  [pc 33, 0xC92]
eventOwner:say(quest, 31.0, 0.0)  [pc 38, 0xCA6]
eventOwner:say(quest, 32.0, 0.0)  [pc 43, 0xCBA]
eventOwner:say(quest, 33.0, 0.0)  [pc 48, 0xCCE]
eventOwner:say(quest, 34.0, 0.0)  [pc 53, 0xCE2]
eventOwner:say(quest, 81.0, 0.0)  [pc 58, 0xCF6]
worldMaster:say(quest, 35.0, 1.0, 0.0)  [pc 65, 0xD12]
eventOwner:say(quest, 36.0, 0.0)  [pc 70, 0xD26]
worldMaster:say(quest, 37.0, 1.0, arg5)  [pc 77, 0xD42]
eventOwner:_runCharaScheduler(354168832.0)  [pc 80, 0xD4E]
eventOwner:say(quest, 38.0, 0.0)  [pc 85, 0xD62]
eventOwner:say(quest, 39.0, 0.0)  [pc 90, 0xD76]
eventOwner:say(quest, 40.0, 0.0)  [pc 95, 0xD8A]
worldMaster:say(quest, 82.0, 1.0, 0.0)  [pc 102, 0xDA6]
eventOwner:_runCharaScheduler(70844416.0)  [pc 105, 0xDB2]
eventOwner:say(quest, 41.0, 0.0)  [pc 110, 0xDC6]
eventOwner:say(quest, 42.0, 0.0)  [pc 115, 0xDDA]
eventOwner:finishCliantTalkTurn()  [pc 117, 0xDE2]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 7, 0xC2A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC1A]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0xC26]
eventOwner:say(quest, 30.0, 0.0)  [pc 19, 0xC5A]
quest:startFadeOut(player, 1.0)  [pc 23, 0xC6A]
quest:_wait(1.0)  [pc 26, 0xC76]
quest:startFadeIn(player, 1.0)  [pc 30, 0xC86]
eventOwner:_runCharaScheduler(70844416.0)  [pc 33, 0xC92]
eventOwner:say(quest, 31.0, 0.0)  [pc 38, 0xCA6]
eventOwner:say(quest, 32.0, 0.0)  [pc 43, 0xCBA]
eventOwner:say(quest, 33.0, 0.0)  [pc 48, 0xCCE]
eventOwner:say(quest, 34.0, 0.0)  [pc 53, 0xCE2]
eventOwner:say(quest, 81.0, 0.0)  [pc 58, 0xCF6]
worldMaster:say(quest, 35.0, 1.0, 0.0)  [pc 65, 0xD12]
eventOwner:say(quest, 36.0, 0.0)  [pc 70, 0xD26]
worldMaster:say(quest, 37.0, 1.0, arg5)  [pc 77, 0xD42]
eventOwner:_runCharaScheduler(354168832.0)  [pc 80, 0xD4E]
eventOwner:say(quest, 38.0, 0.0)  [pc 85, 0xD62]
eventOwner:say(quest, 39.0, 0.0)  [pc 90, 0xD76]
eventOwner:say(quest, 40.0, 0.0)  [pc 95, 0xD8A]
worldMaster:say(quest, 82.0, 1.0, 0.0)  [pc 102, 0xDA6]
eventOwner:_runCharaScheduler(70844416.0)  [pc 105, 0xDB2]
eventOwner:say(quest, 41.0, 0.0)  [pc 110, 0xDC6]
eventOwner:say(quest, 42.0, 0.0)  [pc 115, 0xDDA]
eventOwner:finishCliantTalkTurn()  [pc 117, 0xDE2]
return 
```

## processEvent_010_01 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0xF9E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF72]
eventOwner:say(quest, 79.0, 0.0)  [pc 8, 0xF86]
call13.1.return1 = eventOwner:ask(quest, 43.0, 2.0)  [pc 13, 0xF9A]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0xF9E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF72]
eventOwner:say(quest, 79.0, 0.0)  [pc 8, 0xF86]
call13.1.return1 = eventOwner:ask(quest, 43.0, 2.0)  [pc 13, 0xF9A]
eventOwner:say(quest, 46.0, 0.0)  [pc 21, 0xFBA]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xFC2]
return call13.1.return1
```

## menberCountUnderRange — 6 parameters
### Path 1

```text
require (arg6 == 1.0) is true  [pc 5, 0x1085]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x107D]
eventOwner:say(quest, 29.0, 0.0)  [pc 11, 0x109D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 20, 0x10C1]
eventOwner:say(quest, 27.0, 0.0, 0.0, 0.0, arg5)  [pc 28, 0x10E1]
worldMaster:say(quest, 28.0, 1.0, 0.0, arg5, arg4)  [pc 37, 0x1105]
eventOwner:finishCliantTalkTurn()  [pc 39, 0x110D]
return 
```

### Path 2

```text
require (arg6 == 1.0) is false  [pc 5, 0x1085]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x107D]
eventOwner:say(quest, 30.0, 0.0)  [pc 17, 0x10B5]
eventOwner:_runCharaScheduler(354168832.0)  [pc 20, 0x10C1]
eventOwner:say(quest, 27.0, 0.0, 0.0, 0.0, arg5)  [pc 28, 0x10E1]
worldMaster:say(quest, 28.0, 1.0, 0.0, arg5, arg4)  [pc 37, 0x1105]
eventOwner:finishCliantTalkTurn()  [pc 39, 0x110D]
return 
```

## processEvent_015 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 9, 0x120E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11F6]
eventOwner:say(quest, 48.0, 0.0)  [pc 8, 0x120A]
eventOwner:say(quest, 49.0, 0.0)  [pc 15, 0x1226]
eventOwner:say(quest, 51.0, 0.0)  [pc 26, 0x1252]
eventOwner:say(quest, 52.0, 0.0)  [pc 31, 0x1266]
eventOwner:say(quest, 53.0, 0.0)  [pc 36, 0x127A]
eventOwner:say(quest, 54.0, 0.0)  [pc 41, 0x128E]
eventOwner:say(quest, 55.0, 0.0)  [pc 46, 0x12A2]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x12AA]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 9, 0x120E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11F6]
eventOwner:say(quest, 48.0, 0.0)  [pc 8, 0x120A]
eventOwner:say(quest, 50.0, 0.0)  [pc 21, 0x123E]
eventOwner:say(quest, 51.0, 0.0)  [pc 26, 0x1252]
eventOwner:say(quest, 52.0, 0.0)  [pc 31, 0x1266]
eventOwner:say(quest, 53.0, 0.0)  [pc 36, 0x127A]
eventOwner:say(quest, 54.0, 0.0)  [pc 41, 0x128E]
eventOwner:say(quest, 55.0, 0.0)  [pc 46, 0x12A2]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x12AA]
return 
```

## processEvent_015_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1385]
eventOwner:say(quest, 56.0, 0.0)  [pc 8, 0x1399]
eventOwner:say(quest, 57.0, 0.0)  [pc 13, 0x13AD]
eventOwner:finishCliantTalkTurn()  [pc 15, 0x13B5]
return 
```

## processEvent_015_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1451]
eventOwner:say(quest, 58.0, 0.0)  [pc 8, 0x1465]
eventOwner:say(quest, 59.0, 0.0)  [pc 13, 0x1479]
eventOwner:finishCliantTalkTurn()  [pc 15, 0x1481]
return 
```

## processEvent_020 — 5 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 23, 0x156D]
require (arg5 == 1.0) is true  [pc 64, 0x1611]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x151D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x1529]
eventOwner:say(quest, 60.0, 0.0)  [pc 11, 0x153D]
quest:startFadeOut(player, 1.0)  [pc 15, 0x154D]
quest:_wait(1.0)  [pc 18, 0x1559]
quest:startFadeIn(player, 1.0)  [pc 22, 0x1569]
eventOwner:say(quest, 61.0, 0.0)  [pc 29, 0x1585]
eventOwner:say(quest, 62.0, 0.0)  [pc 34, 0x1599]
eventOwner:_runCharaScheduler(70844416.0)  [pc 48, 0x15D1]
eventOwner:say(quest, 65.0, 0.0)  [pc 53, 0x15E5]
eventOwner:say(quest, 66.0, 0.0)  [pc 58, 0x15F9]
eventOwner:say(quest, 67.0, 0.0)  [pc 63, 0x160D]
eventOwner:say(quest, 86.0, 0.0)  [pc 70, 0x1629]
eventOwner:finishCliantTalkTurn()  [pc 78, 0x1649]
return 
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 23, 0x156D]
require (arg5 == 1.0) is false  [pc 64, 0x1611]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x151D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x1529]
eventOwner:say(quest, 60.0, 0.0)  [pc 11, 0x153D]
quest:startFadeOut(player, 1.0)  [pc 15, 0x154D]
quest:_wait(1.0)  [pc 18, 0x1559]
quest:startFadeIn(player, 1.0)  [pc 22, 0x1569]
eventOwner:say(quest, 61.0, 0.0)  [pc 29, 0x1585]
eventOwner:say(quest, 62.0, 0.0)  [pc 34, 0x1599]
eventOwner:_runCharaScheduler(70844416.0)  [pc 48, 0x15D1]
eventOwner:say(quest, 65.0, 0.0)  [pc 53, 0x15E5]
eventOwner:say(quest, 66.0, 0.0)  [pc 58, 0x15F9]
eventOwner:say(quest, 67.0, 0.0)  [pc 63, 0x160D]
eventOwner:say(quest, 68.0, 0.0)  [pc 76, 0x1641]
eventOwner:finishCliantTalkTurn()  [pc 78, 0x1649]
return 
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 23, 0x156D]
require (arg5 == 1.0) is true  [pc 64, 0x1611]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x151D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x1529]
eventOwner:say(quest, 60.0, 0.0)  [pc 11, 0x153D]
quest:startFadeOut(player, 1.0)  [pc 15, 0x154D]
quest:_wait(1.0)  [pc 18, 0x1559]
quest:startFadeIn(player, 1.0)  [pc 22, 0x1569]
eventOwner:say(quest, 63.0, 0.0)  [pc 40, 0x15B1]
eventOwner:say(quest, 64.0, 0.0)  [pc 45, 0x15C5]
eventOwner:_runCharaScheduler(70844416.0)  [pc 48, 0x15D1]
eventOwner:say(quest, 65.0, 0.0)  [pc 53, 0x15E5]
eventOwner:say(quest, 66.0, 0.0)  [pc 58, 0x15F9]
eventOwner:say(quest, 67.0, 0.0)  [pc 63, 0x160D]
eventOwner:say(quest, 86.0, 0.0)  [pc 70, 0x1629]
eventOwner:finishCliantTalkTurn()  [pc 78, 0x1649]
return 
```

### Path 4

```text
require (arg4 == 1.0) is false  [pc 23, 0x156D]
require (arg5 == 1.0) is false  [pc 64, 0x1611]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x151D]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x1529]
eventOwner:say(quest, 60.0, 0.0)  [pc 11, 0x153D]
quest:startFadeOut(player, 1.0)  [pc 15, 0x154D]
quest:_wait(1.0)  [pc 18, 0x1559]
quest:startFadeIn(player, 1.0)  [pc 22, 0x1569]
eventOwner:say(quest, 63.0, 0.0)  [pc 40, 0x15B1]
eventOwner:say(quest, 64.0, 0.0)  [pc 45, 0x15C5]
eventOwner:_runCharaScheduler(70844416.0)  [pc 48, 0x15D1]
eventOwner:say(quest, 65.0, 0.0)  [pc 53, 0x15E5]
eventOwner:say(quest, 66.0, 0.0)  [pc 58, 0x15F9]
eventOwner:say(quest, 67.0, 0.0)  [pc 63, 0x160D]
eventOwner:say(quest, 68.0, 0.0)  [pc 76, 0x1641]
eventOwner:finishCliantTalkTurn()  [pc 78, 0x1649]
return 
```

## processEvent_020_2 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 7, 0x179E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x178E]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x179A]
eventOwner:say(quest, 87.0, 0.0)  [pc 13, 0x17B6]
eventOwner:finishCliantTalkTurn()  [pc 21, 0x17D6]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 7, 0x179E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x178E]
eventOwner:_runCharaScheduler(354168832.0)  [pc 6, 0x179A]
eventOwner:say(quest, 83.0, 0.0)  [pc 19, 0x17CE]
eventOwner:finishCliantTalkTurn()  [pc 21, 0x17D6]
return 
```

## processEvent_020_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x189C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x18A8]
eventOwner:say(quest, 69.0, 0.0)  [pc 11, 0x18BC]
eventOwner:say(quest, 70.0, 0.0)  [pc 16, 0x18D0]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x18D8]
return 
```

## processEvent_025 — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x19A9]
require (arg4 == 1.0) is true  [pc 32, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1995]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x19A5]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x19B9]
quest:_wait(1.0)  [pc 15, 0x19C5]
eventOwner:say(quest, 71.0, 0.0)  [pc 20, 0x19D9]
player:_runCharaScheduler(354107392.0)  [pc 23, 0x19E5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 26, 0x19F1]
eventOwner:say(quest, 72.0, 0.0)  [pc 31, 0x1A05]
eventOwner:say(quest, 88.0, 0.0)  [pc 38, 0x1A21]
eventOwner:say(quest, 89.0, 0.0)  [pc 43, 0x1A35]
eventOwner:_runCharaScheduler(353964032.0)  [pc 46, 0x1A41]
eventOwner:say(quest, 90.0, 0.0)  [pc 51, 0x1A55]
eventOwner:say(quest, 91.0, 0.0)  [pc 56, 0x1A69]
eventOwner:say(quest, 92.0, 0.0)  [pc 61, 0x1A7D]
eventOwner:say(quest, 93.0, 0.0)  [pc 66, 0x1A91]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x1B21]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x19A9]
require (arg4 == 1.0) is false  [pc 32, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1995]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x19A5]
eventOwner:_runCharaScheduler(354041856.0)  [pc 12, 0x19B9]
quest:_wait(1.0)  [pc 15, 0x19C5]
eventOwner:say(quest, 71.0, 0.0)  [pc 20, 0x19D9]
player:_runCharaScheduler(354107392.0)  [pc 23, 0x19E5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 26, 0x19F1]
eventOwner:say(quest, 72.0, 0.0)  [pc 31, 0x1A05]
eventOwner:say(quest, 73.0, 0.0)  [pc 72, 0x1AA9]
eventOwner:say(quest, 74.0, 0.0)  [pc 77, 0x1ABD]
eventOwner:_runCharaScheduler(353964032.0)  [pc 80, 0x1AC9]
eventOwner:say(quest, 75.0, 0.0)  [pc 85, 0x1ADD]
eventOwner:say(quest, 76.0, 0.0)  [pc 90, 0x1AF1]
eventOwner:say(quest, 77.0, 0.0)  [pc 95, 0x1B05]
eventOwner:say(quest, 78.0, 0.0)  [pc 100, 0x1B19]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x1B21]
return 
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x19A9]
require (arg4 == 1.0) is true  [pc 32, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1995]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x19A5]
quest:_wait(1.0)  [pc 15, 0x19C5]
eventOwner:say(quest, 71.0, 0.0)  [pc 20, 0x19D9]
player:_runCharaScheduler(354107392.0)  [pc 23, 0x19E5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 26, 0x19F1]
eventOwner:say(quest, 72.0, 0.0)  [pc 31, 0x1A05]
eventOwner:say(quest, 88.0, 0.0)  [pc 38, 0x1A21]
eventOwner:say(quest, 89.0, 0.0)  [pc 43, 0x1A35]
eventOwner:_runCharaScheduler(353964032.0)  [pc 46, 0x1A41]
eventOwner:say(quest, 90.0, 0.0)  [pc 51, 0x1A55]
eventOwner:say(quest, 91.0, 0.0)  [pc 56, 0x1A69]
eventOwner:say(quest, 92.0, 0.0)  [pc 61, 0x1A7D]
eventOwner:say(quest, 93.0, 0.0)  [pc 66, 0x1A91]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x1B21]
return 
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x19A9]
require (arg4 == 1.0) is false  [pc 32, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1995]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x19A5]
quest:_wait(1.0)  [pc 15, 0x19C5]
eventOwner:say(quest, 71.0, 0.0)  [pc 20, 0x19D9]
player:_runCharaScheduler(354107392.0)  [pc 23, 0x19E5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 26, 0x19F1]
eventOwner:say(quest, 72.0, 0.0)  [pc 31, 0x1A05]
eventOwner:say(quest, 73.0, 0.0)  [pc 72, 0x1AA9]
eventOwner:say(quest, 74.0, 0.0)  [pc 77, 0x1ABD]
eventOwner:_runCharaScheduler(353964032.0)  [pc 80, 0x1AC9]
eventOwner:say(quest, 75.0, 0.0)  [pc 85, 0x1ADD]
eventOwner:say(quest, 76.0, 0.0)  [pc 90, 0x1AF1]
eventOwner:say(quest, 77.0, 0.0)  [pc 95, 0x1B05]
eventOwner:say(quest, 78.0, 0.0)  [pc 100, 0x1B19]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x1B21]
return 
```

