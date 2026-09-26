# 111265 blm0j5: reconstructed client path templates

## processEvent_DAZA_Start — 3 parameters
### Path 1

```text
require (call119.1.return1 == 1.0) is true  [pc 120, 0x47C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2A8]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x2B4]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2C8]
quest:_wait(0.5)  [pc 14, 0x2D4]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x2E8]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x2FC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 27, 0x308]
eventOwner:say(quest, 5.0, 0.0)  [pc 32, 0x31C]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x330]
eventOwner:_runCharaScheduler(70017024.0)  [pc 40, 0x33C]
eventOwner:say(quest, 8.0, 0.0)  [pc 45, 0x350]
eventOwner:say(quest, 9.0, 0.0)  [pc 50, 0x364]
eventOwner:_runCharaScheduler(70017024.0)  [pc 53, 0x370]
eventOwner:say(quest, 10.0, 0.0)  [pc 58, 0x384]
eventOwner:say(quest, 31.0, 0.0)  [pc 63, 0x398]
eventOwner:say(quest, 32.0, 0.0)  [pc 68, 0x3AC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 71, 0x3B8]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x3CC]
eventOwner:_runCharaScheduler(70139904.0)  [pc 79, 0x3D8]
eventOwner:say(quest, 14.0, 0.0)  [pc 84, 0x3EC]
eventOwner:say(quest, 15.0, 0.0)  [pc 89, 0x400]
eventOwner:say(quest, 16.0, 0.0)  [pc 94, 0x414]
eventOwner:say(quest, 36.0, 0.0)  [pc 99, 0x428]
eventOwner:_runCharaScheduler(70017024.0)  [pc 102, 0x434]
eventOwner:say(quest, 19.0, 0.0)  [pc 107, 0x448]
eventOwner:say(quest, 21.0, 0.0)  [pc 112, 0x45C]
eventOwner:say(quest, 35.0, 0.0)  [pc 117, 0x470]
call119.1.return1 = quest:showQuestInfomation()  [pc 119, 0x478]
eventOwner:_runCharaScheduler(70017024.0)  [pc 124, 0x48C]
eventOwner:say(quest, 23.0, 0.0)  [pc 129, 0x4A0]
eventOwner:finishCliantTalkTurn()  [pc 140, 0x4CC]
return call119.1.return1
```

### Path 2

```text
require (call119.1.return1 == 1.0) is false  [pc 120, 0x47C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2A8]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x2B4]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2C8]
quest:_wait(0.5)  [pc 14, 0x2D4]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x2E8]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x2FC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 27, 0x308]
eventOwner:say(quest, 5.0, 0.0)  [pc 32, 0x31C]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x330]
eventOwner:_runCharaScheduler(70017024.0)  [pc 40, 0x33C]
eventOwner:say(quest, 8.0, 0.0)  [pc 45, 0x350]
eventOwner:say(quest, 9.0, 0.0)  [pc 50, 0x364]
eventOwner:_runCharaScheduler(70017024.0)  [pc 53, 0x370]
eventOwner:say(quest, 10.0, 0.0)  [pc 58, 0x384]
eventOwner:say(quest, 31.0, 0.0)  [pc 63, 0x398]
eventOwner:say(quest, 32.0, 0.0)  [pc 68, 0x3AC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 71, 0x3B8]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x3CC]
eventOwner:_runCharaScheduler(70139904.0)  [pc 79, 0x3D8]
eventOwner:say(quest, 14.0, 0.0)  [pc 84, 0x3EC]
eventOwner:say(quest, 15.0, 0.0)  [pc 89, 0x400]
eventOwner:say(quest, 16.0, 0.0)  [pc 94, 0x414]
eventOwner:say(quest, 36.0, 0.0)  [pc 99, 0x428]
eventOwner:_runCharaScheduler(70017024.0)  [pc 102, 0x434]
eventOwner:say(quest, 19.0, 0.0)  [pc 107, 0x448]
eventOwner:say(quest, 21.0, 0.0)  [pc 112, 0x45C]
eventOwner:say(quest, 35.0, 0.0)  [pc 117, 0x470]
call119.1.return1 = quest:showQuestInfomation()  [pc 119, 0x478]
eventOwner:_runCharaScheduler(70017024.0)  [pc 133, 0x4B0]
eventOwner:say(quest, 22.0, 0.0)  [pc 138, 0x4C4]
eventOwner:finishCliantTalkTurn()  [pc 140, 0x4CC]
return call119.1.return1
```

## processEvent_DAZA_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x665]
eventOwner:say(quest, 24.0, 0.0)  [pc 8, 0x679]
eventOwner:_runCharaScheduler(70017024.0)  [pc 11, 0x685]
eventOwner:say(quest, 25.0, 0.0)  [pc 16, 0x699]
eventOwner:say(quest, 27.0, 0.0)  [pc 21, 0x6AD]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x6B5]
return 
```

## processEvent_KAZAGGCHAH_Follow — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(70017024.0)  [pc 2, 0x777]
eventOwner:say(quest, 28.0, 0.0)  [pc 7, 0x78B]
eventOwner:say(quest, 29.0, 0.0)  [pc 12, 0x79F]
return 
```

## processEvent_DOZOLMELOC_Follow — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(70017024.0)  [pc 2, 0x81C]
eventOwner:say(quest, 30.0, 0.0)  [pc 7, 0x830]
return 
```

## processEvent_LALAI_Follow — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(354103296.0)  [pc 2, 0x8A4]
eventOwner:say(quest, 33.0, 0.0)  [pc 7, 0x8B8]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0x92C]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0x940]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111265.0, 26.0)  [pc 6, 0x9CC]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111265.0, 26.0)  [pc 6, 0xA49]
return 
```

