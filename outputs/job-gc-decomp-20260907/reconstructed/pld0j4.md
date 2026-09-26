# 111284 pld0j4: reconstructed client path templates

## processEvent_JENLYNS_Hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x24E]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x25A]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x26E]
worldMaster:say(quest, 3.0, 0.0)  [pc 17, 0x286]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x28E]
return 
```

## processEvent_JENLYNS_Start — 3 parameters
### Path 1

```text
require (call64.1.return1 == 1.0) is true  [pc 65, 0x44B]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x353]
eventOwner:say(quest, 4.0, 0.0)  [pc 8, 0x367]
eventOwner:_runCharaScheduler(354082816.0)  [pc 11, 0x373]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 26, 0x3AF]
eventOwner:_runCharaScheduler(67887104.0)  [pc 29, 0x3BB]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x3CF]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x3E3]
eventOwner:say(quest, 10.0, 0.0)  [pc 44, 0x3F7]
eventOwner:_runCharaScheduler(353972224.0)  [pc 47, 0x403]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x417]
eventOwner:say(quest, 12.0, 0.0)  [pc 57, 0x42B]
eventOwner:say(quest, 13.0, 0.0)  [pc 62, 0x43F]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x447]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x45B]
eventOwner:say(quest, 15.0, 0.0)  [pc 74, 0x46F]
eventOwner:_waitForCharaSchedulerFinished(353968128.0)  [pc 86, 0x49F]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x4A7]
return call64.1.return1
```

### Path 2

```text
require (call64.1.return1 == 1.0) is false  [pc 65, 0x44B]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x353]
eventOwner:say(quest, 4.0, 0.0)  [pc 8, 0x367]
eventOwner:_runCharaScheduler(354082816.0)  [pc 11, 0x373]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 26, 0x3AF]
eventOwner:_runCharaScheduler(67887104.0)  [pc 29, 0x3BB]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x3CF]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x3E3]
eventOwner:say(quest, 10.0, 0.0)  [pc 44, 0x3F7]
eventOwner:_runCharaScheduler(353972224.0)  [pc 47, 0x403]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x417]
eventOwner:say(quest, 12.0, 0.0)  [pc 57, 0x42B]
eventOwner:say(quest, 13.0, 0.0)  [pc 62, 0x43F]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x447]
eventOwner:_runCharaScheduler(353968128.0)  [pc 78, 0x47F]
eventOwner:say(quest, 14.0, 0.0)  [pc 83, 0x493]
eventOwner:_waitForCharaSchedulerFinished(353968128.0)  [pc 86, 0x49F]
eventOwner:finishCliantTalkTurn()  [pc 88, 0x4A7]
return call64.1.return1
```

## processEvent_JENLYNS_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x61A]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x626]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0x63A]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x642]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0x6F2]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0x706]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111284.0, 16.0)  [pc 6, 0x792]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111284.0, 16.0)  [pc 6, 0x80F]
return 
```

