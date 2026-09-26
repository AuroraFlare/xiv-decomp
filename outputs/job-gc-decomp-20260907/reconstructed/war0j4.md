# 111204 war0j4: reconstructed client path templates

## processEventCURIOUS_GORGE_Hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x25D]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0x269]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x27D]
worldMaster:say(quest, 3.0, 0.0)  [pc 17, 0x295]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x29D]
return 
```

## processEventCURIOUS_GORGE_Start — 3 parameters
### Path 1

```text
require (call64.1.return1 == 1.0) is true  [pc 65, 0x45A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x362]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x36E]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x382]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x396]
eventOwner:say(quest, 15.0, 0.0)  [pc 21, 0x3AA]
eventOwner:say(quest, 6.0, 0.0)  [pc 26, 0x3BE]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x3CA]
eventOwner:say(quest, 7.0, 0.0)  [pc 34, 0x3DE]
eventOwner:say(quest, 8.0, 0.0)  [pc 39, 0x3F2]
eventOwner:say(quest, 9.0, 0.0)  [pc 44, 0x406]
eventOwner:say(quest, 10.0, 0.0)  [pc 49, 0x41A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x426]
eventOwner:say(quest, 11.0, 0.0)  [pc 57, 0x43A]
eventOwner:say(quest, 16.0, 0.0)  [pc 62, 0x44E]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x456]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x46A]
eventOwner:say(quest, 13.0, 0.0)  [pc 74, 0x47E]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x4AA]
return call64.1.return1
```

### Path 2

```text
require (call64.1.return1 == 1.0) is false  [pc 65, 0x45A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x362]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x36E]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x382]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x396]
eventOwner:say(quest, 15.0, 0.0)  [pc 21, 0x3AA]
eventOwner:say(quest, 6.0, 0.0)  [pc 26, 0x3BE]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x3CA]
eventOwner:say(quest, 7.0, 0.0)  [pc 34, 0x3DE]
eventOwner:say(quest, 8.0, 0.0)  [pc 39, 0x3F2]
eventOwner:say(quest, 9.0, 0.0)  [pc 44, 0x406]
eventOwner:say(quest, 10.0, 0.0)  [pc 49, 0x41A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x426]
eventOwner:say(quest, 11.0, 0.0)  [pc 57, 0x43A]
eventOwner:say(quest, 16.0, 0.0)  [pc 62, 0x44E]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x456]
eventOwner:_runCharaScheduler(353980416.0)  [pc 78, 0x48E]
eventOwner:say(quest, 12.0, 0.0)  [pc 83, 0x4A2]
eventOwner:finishCliantTalkTurn()  [pc 85, 0x4AA]
return call64.1.return1
```

## processEventCURIOUS_GORGE_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x60B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x617]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0x62B]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x633]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0x6E3]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0x6F7]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111204.0, 17.0)  [pc 6, 0x783]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111204.0, 17.0)  [pc 6, 0x800]
return 
```

