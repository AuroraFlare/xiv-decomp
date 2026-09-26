# 111225 mnk0j5: reconstructed client path templates

## processEvent_ERIK_Hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x279]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x285]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x299]
eventOwner:say(quest, 38.0, 0.0)  [pc 16, 0x2AD]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x2C1]
eventOwner:say(quest, 42.0, 0.0)  [pc 26, 0x2D5]
eventOwner:say(quest, 39.0, 0.0)  [pc 31, 0x2E9]
worldMaster:say(quest, 35.0, 0.0)  [pc 37, 0x301]
eventOwner:finishCliantTalkTurn()  [pc 39, 0x309]
return 
```

## processEvent_WIDARGELT_Start — 3 parameters
### Path 1

```text
require (call103.1.return1 == 1.0) is true  [pc 104, 0x586]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F2]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x3FE]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x412]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x426]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x43A]
eventOwner:say(quest, 7.0, 0.0)  [pc 26, 0x44E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 29, 0x45A]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x46E]
eventOwner:say(quest, 34.0, 0.0)  [pc 39, 0x482]
eventOwner:_runCharaScheduler(353964032.0)  [pc 42, 0x48E]
eventOwner:say(quest, 36.0, 0.0)  [pc 47, 0x4A2]
eventOwner:say(quest, 9.0, 0.0)  [pc 52, 0x4B6]
eventOwner:_runCharaScheduler(354103296.0)  [pc 55, 0x4C2]
eventOwner:say(quest, 10.0, 0.0)  [pc 60, 0x4D6]
eventOwner:say(quest, 11.0, 0.0)  [pc 65, 0x4EA]
eventOwner:say(quest, 12.0, 0.0)  [pc 70, 0x4FE]
eventOwner:_runCharaScheduler(353968128.0)  [pc 73, 0x50A]
eventOwner:say(quest, 43.0, 0.0)  [pc 78, 0x51E]
eventOwner:say(quest, 44.0, 0.0)  [pc 83, 0x532]
eventOwner:_runCharaScheduler(353976320.0)  [pc 86, 0x53E]
eventOwner:say(quest, 45.0, 0.0)  [pc 91, 0x552]
eventOwner:say(quest, 46.0, 0.0)  [pc 96, 0x566]
eventOwner:say(quest, 47.0, 0.0)  [pc 101, 0x57A]
call103.1.return1 = quest:showQuestInfomation()  [pc 103, 0x582]
eventOwner:_runCharaScheduler(354066432.0)  [pc 108, 0x596]
eventOwner:say(quest, 14.0, 0.0)  [pc 113, 0x5AA]
eventOwner:say(quest, 48.0, 0.0)  [pc 118, 0x5BE]
eventOwner:say(quest, 49.0, 0.0)  [pc 123, 0x5D2]
eventOwner:say(quest, 50.0, 0.0)  [pc 128, 0x5E6]
eventOwner:_runCharaScheduler(354103296.0)  [pc 131, 0x5F2]
eventOwner:say(quest, 51.0, 0.0)  [pc 136, 0x606]
eventOwner:say(quest, 52.0, 0.0)  [pc 141, 0x61A]
eventOwner:_runCharaScheduler(353968128.0)  [pc 144, 0x626]
eventOwner:say(quest, 53.0, 0.0)  [pc 149, 0x63A]
eventOwner:say(quest, 54.0, 0.0)  [pc 154, 0x64E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 157, 0x65A]
eventOwner:say(quest, 55.0, 0.0)  [pc 162, 0x66E]
eventOwner:say(quest, 56.0, 0.0)  [pc 167, 0x682]
eventOwner:_runCharaScheduler(354066432.0)  [pc 170, 0x68E]
eventOwner:say(quest, 57.0, 0.0)  [pc 175, 0x6A2]
eventOwner:finishCliantTalkTurn()  [pc 186, 0x6CE]
return call103.1.return1
```

### Path 2

```text
require (call103.1.return1 == 1.0) is false  [pc 104, 0x586]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F2]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x3FE]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x412]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x426]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x43A]
eventOwner:say(quest, 7.0, 0.0)  [pc 26, 0x44E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 29, 0x45A]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x46E]
eventOwner:say(quest, 34.0, 0.0)  [pc 39, 0x482]
eventOwner:_runCharaScheduler(353964032.0)  [pc 42, 0x48E]
eventOwner:say(quest, 36.0, 0.0)  [pc 47, 0x4A2]
eventOwner:say(quest, 9.0, 0.0)  [pc 52, 0x4B6]
eventOwner:_runCharaScheduler(354103296.0)  [pc 55, 0x4C2]
eventOwner:say(quest, 10.0, 0.0)  [pc 60, 0x4D6]
eventOwner:say(quest, 11.0, 0.0)  [pc 65, 0x4EA]
eventOwner:say(quest, 12.0, 0.0)  [pc 70, 0x4FE]
eventOwner:_runCharaScheduler(353968128.0)  [pc 73, 0x50A]
eventOwner:say(quest, 43.0, 0.0)  [pc 78, 0x51E]
eventOwner:say(quest, 44.0, 0.0)  [pc 83, 0x532]
eventOwner:_runCharaScheduler(353976320.0)  [pc 86, 0x53E]
eventOwner:say(quest, 45.0, 0.0)  [pc 91, 0x552]
eventOwner:say(quest, 46.0, 0.0)  [pc 96, 0x566]
eventOwner:say(quest, 47.0, 0.0)  [pc 101, 0x57A]
call103.1.return1 = quest:showQuestInfomation()  [pc 103, 0x582]
eventOwner:_runCharaScheduler(354041856.0)  [pc 179, 0x6B2]
eventOwner:say(quest, 13.0, 0.0)  [pc 184, 0x6C6]
eventOwner:finishCliantTalkTurn()  [pc 186, 0x6CE]
return call103.1.return1
```

## processEvent_WIDARGELT_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x8DA]
eventOwner:_runCharaScheduler(353976320.0)  [pc 6, 0x8E6]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0x8FA]
eventOwner:say(quest, 58.0, 0.0)  [pc 16, 0x90E]
eventOwner:say(quest, 40.0, 0.0)  [pc 21, 0x922]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x92A]
return 
```

## processEvent_ERIK_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9F0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x9FC]
eventOwner:say(quest, 32.0, 0.0)  [pc 11, 0xA10]
eventOwner:say(quest, 33.0, 0.0)  [pc 16, 0xA24]
eventOwner:say(quest, 59.0, 0.0)  [pc 21, 0xA38]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xA40]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0xB02]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0xB16]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111225.0, 15.0)  [pc 6, 0xBA2]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111225.0, 15.0)  [pc 6, 0xC1F]
return 
```

