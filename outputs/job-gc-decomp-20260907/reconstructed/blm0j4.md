# 111264 blm0j4: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x332]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x33E]
eventOwner:say(quest, 27.0, 0.0)  [pc 11, 0x352]
worldMaster:say(quest, 28.0, 0.0)  [pc 17, 0x36A]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x372]
return 
```

## processEventDOZOLMELOCStart — 3 parameters
### Path 1

```text
require (call16.1.return1 == 1.0) is true  [pc 17, 0x478]
require (call110.1.return1 == 1.0) is true  [pc 111, 0x5F0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x440]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x44C]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x460]
call16.1.return1 = eventOwner:ask(quest, 29.0, 2.0)  [pc 16, 0x474]
eventOwner:say(quest, 3.0, 0.0)  [pc 23, 0x490]
eventOwner:_runCharaScheduler(70017024.0)  [pc 32, 0x4B4]
eventOwner:say(quest, 4.0, 0.0)  [pc 37, 0x4C8]
eventOwner:say(quest, 34.0, 0.0)  [pc 42, 0x4DC]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4F0]
eventOwner:say(quest, 39.0, 0.0)  [pc 52, 0x504]
eventOwner:say(quest, 6.0, 0.0)  [pc 57, 0x518]
eventOwner:say(quest, 41.0, 0.0)  [pc 62, 0x52C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 65, 0x538]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x54C]
eventOwner:say(quest, 35.0, 0.0)  [pc 75, 0x560]
eventOwner:say(quest, 9.0, 0.0)  [pc 80, 0x574]
eventOwner:_runCharaScheduler(70017024.0)  [pc 83, 0x580]
eventOwner:say(quest, 10.0, 0.0)  [pc 88, 0x594]
eventOwner:say(quest, 36.0, 0.0)  [pc 93, 0x5A8]
eventOwner:say(quest, 12.0, 0.0)  [pc 98, 0x5BC]
eventOwner:say(quest, 38.0, 0.0)  [pc 103, 0x5D0]
eventOwner:say(quest, 37.0, 0.0)  [pc 108, 0x5E4]
call110.1.return1 = quest:showQuestInfomation()  [pc 110, 0x5EC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 115, 0x600]
eventOwner:say(quest, 15.0, 0.0)  [pc 120, 0x614]
eventOwner:finishCliantTalkTurn()  [pc 131, 0x640]
return call110.1.return1
```

### Path 2

```text
require (call16.1.return1 == 1.0) is true  [pc 17, 0x478]
require (call110.1.return1 == 1.0) is false  [pc 111, 0x5F0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x440]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x44C]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x460]
call16.1.return1 = eventOwner:ask(quest, 29.0, 2.0)  [pc 16, 0x474]
eventOwner:say(quest, 3.0, 0.0)  [pc 23, 0x490]
eventOwner:_runCharaScheduler(70017024.0)  [pc 32, 0x4B4]
eventOwner:say(quest, 4.0, 0.0)  [pc 37, 0x4C8]
eventOwner:say(quest, 34.0, 0.0)  [pc 42, 0x4DC]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4F0]
eventOwner:say(quest, 39.0, 0.0)  [pc 52, 0x504]
eventOwner:say(quest, 6.0, 0.0)  [pc 57, 0x518]
eventOwner:say(quest, 41.0, 0.0)  [pc 62, 0x52C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 65, 0x538]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x54C]
eventOwner:say(quest, 35.0, 0.0)  [pc 75, 0x560]
eventOwner:say(quest, 9.0, 0.0)  [pc 80, 0x574]
eventOwner:_runCharaScheduler(70017024.0)  [pc 83, 0x580]
eventOwner:say(quest, 10.0, 0.0)  [pc 88, 0x594]
eventOwner:say(quest, 36.0, 0.0)  [pc 93, 0x5A8]
eventOwner:say(quest, 12.0, 0.0)  [pc 98, 0x5BC]
eventOwner:say(quest, 38.0, 0.0)  [pc 103, 0x5D0]
eventOwner:say(quest, 37.0, 0.0)  [pc 108, 0x5E4]
call110.1.return1 = quest:showQuestInfomation()  [pc 110, 0x5EC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 124, 0x624]
eventOwner:say(quest, 14.0, 0.0)  [pc 129, 0x638]
eventOwner:finishCliantTalkTurn()  [pc 131, 0x640]
return call110.1.return1
```

### Path 3

```text
require (call16.1.return1 == 1.0) is false  [pc 17, 0x478]
require (call110.1.return1 == 1.0) is true  [pc 111, 0x5F0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x440]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x44C]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x460]
call16.1.return1 = eventOwner:ask(quest, 29.0, 2.0)  [pc 16, 0x474]
eventOwner:say(quest, 32.0, 0.0)  [pc 29, 0x4A8]
eventOwner:_runCharaScheduler(70017024.0)  [pc 32, 0x4B4]
eventOwner:say(quest, 4.0, 0.0)  [pc 37, 0x4C8]
eventOwner:say(quest, 34.0, 0.0)  [pc 42, 0x4DC]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4F0]
eventOwner:say(quest, 39.0, 0.0)  [pc 52, 0x504]
eventOwner:say(quest, 6.0, 0.0)  [pc 57, 0x518]
eventOwner:say(quest, 41.0, 0.0)  [pc 62, 0x52C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 65, 0x538]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x54C]
eventOwner:say(quest, 35.0, 0.0)  [pc 75, 0x560]
eventOwner:say(quest, 9.0, 0.0)  [pc 80, 0x574]
eventOwner:_runCharaScheduler(70017024.0)  [pc 83, 0x580]
eventOwner:say(quest, 10.0, 0.0)  [pc 88, 0x594]
eventOwner:say(quest, 36.0, 0.0)  [pc 93, 0x5A8]
eventOwner:say(quest, 12.0, 0.0)  [pc 98, 0x5BC]
eventOwner:say(quest, 38.0, 0.0)  [pc 103, 0x5D0]
eventOwner:say(quest, 37.0, 0.0)  [pc 108, 0x5E4]
call110.1.return1 = quest:showQuestInfomation()  [pc 110, 0x5EC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 115, 0x600]
eventOwner:say(quest, 15.0, 0.0)  [pc 120, 0x614]
eventOwner:finishCliantTalkTurn()  [pc 131, 0x640]
return call110.1.return1
```

### Path 4

```text
require (call16.1.return1 == 1.0) is false  [pc 17, 0x478]
require (call110.1.return1 == 1.0) is false  [pc 111, 0x5F0]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x440]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x44C]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x460]
call16.1.return1 = eventOwner:ask(quest, 29.0, 2.0)  [pc 16, 0x474]
eventOwner:say(quest, 32.0, 0.0)  [pc 29, 0x4A8]
eventOwner:_runCharaScheduler(70017024.0)  [pc 32, 0x4B4]
eventOwner:say(quest, 4.0, 0.0)  [pc 37, 0x4C8]
eventOwner:say(quest, 34.0, 0.0)  [pc 42, 0x4DC]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4F0]
eventOwner:say(quest, 39.0, 0.0)  [pc 52, 0x504]
eventOwner:say(quest, 6.0, 0.0)  [pc 57, 0x518]
eventOwner:say(quest, 41.0, 0.0)  [pc 62, 0x52C]
eventOwner:_runCharaScheduler(70017024.0)  [pc 65, 0x538]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x54C]
eventOwner:say(quest, 35.0, 0.0)  [pc 75, 0x560]
eventOwner:say(quest, 9.0, 0.0)  [pc 80, 0x574]
eventOwner:_runCharaScheduler(70017024.0)  [pc 83, 0x580]
eventOwner:say(quest, 10.0, 0.0)  [pc 88, 0x594]
eventOwner:say(quest, 36.0, 0.0)  [pc 93, 0x5A8]
eventOwner:say(quest, 12.0, 0.0)  [pc 98, 0x5BC]
eventOwner:say(quest, 38.0, 0.0)  [pc 103, 0x5D0]
eventOwner:say(quest, 37.0, 0.0)  [pc 108, 0x5E4]
call110.1.return1 = quest:showQuestInfomation()  [pc 110, 0x5EC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 124, 0x624]
eventOwner:say(quest, 14.0, 0.0)  [pc 129, 0x638]
eventOwner:finishCliantTalkTurn()  [pc 131, 0x640]
return call110.1.return1
```

## processEvent005 — 3 parameters
### Path 1

```text
worldMaster:say(quest, 24.0, 0.0)  [pc 5, 0x7CD]
quest:sayFreeDisplayName(4000257.0, quest, 25.0)  [pc 10, 0x7E1]
return 
```

## processEvent000_DOZOLMELOC — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x873]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x87F]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0x893]
eventOwner:say(quest, 17.0, 0.0)  [pc 16, 0x8A7]
eventOwner:_runCharaScheduler(70017024.0)  [pc 19, 0x8B3]
eventOwner:say(quest, 18.0, 0.0)  [pc 24, 0x8C7]
eventOwner:say(quest, 19.0, 0.0)  [pc 29, 0x8DB]
eventOwner:finishCliantTalkTurn()  [pc 31, 0x8E3]
return 
```

## processEvent000_LALAI — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9B2]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x9BE]
eventOwner:say(quest, 26.0, 0.0)  [pc 11, 0x9D2]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x9DA]
return 
```

## processEvent000_KAZAGGCHAH — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA8E]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xA9A]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0xAAE]
eventOwner:say(quest, 21.0, 0.0)  [pc 16, 0xAC2]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xACA]
return 
```

## processEvent000_DAZA — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB87]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xB93]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0xBA7]
eventOwner:say(quest, 23.0, 0.0)  [pc 16, 0xBBB]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xBC3]
return 
```

## processEvent000_SEKIHI — 3 parameters
### Path 1

```text
worldMaster:say(quest, 33.0, 0.0)  [pc 5, 0xC88]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 40.0)  [pc 4, 0xCF4]
quest:_wait(8.0)  [pc 7, 0xD00]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27317.0, 2.0)  [pc 4, 0xD96]
quest:_wait(6.0)  [pc 7, 0xDA2]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111264.0, 26.0)  [pc 6, 0xE2D]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111264.0, 26.0)  [pc 6, 0xEAA]
return 
```

