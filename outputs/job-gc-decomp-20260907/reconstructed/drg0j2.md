# 111322 drg0j2: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x294]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x2A0]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0x2B4]
eventOwner:say(quest, 18.0, 0.0)  [pc 16, 0x2C8]
eventOwner:_runCharaScheduler(354103296.0)  [pc 19, 0x2D4]
eventOwner:say(quest, 19.0, 0.0)  [pc 24, 0x2E8]
worldMaster:say(quest, 20.0, 0.0)  [pc 30, 0x300]
eventOwner:finishCliantTalkTurn()  [pc 32, 0x308]
return 
```

## processEventALBERICStart — 3 parameters
### Path 1

```text
require (call104.1.return1 == 1.0) is true  [pc 105, 0x589]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x3FD]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x411]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x425]
eventOwner:_runCharaScheduler(353968128.0)  [pc 19, 0x431]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x445]
eventOwner:say(quest, 21.0, 0.0)  [pc 29, 0x459]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x465]
eventOwner:say(quest, 22.0, 0.0)  [pc 37, 0x479]
eventOwner:say(quest, 23.0, 0.0)  [pc 42, 0x48D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 45, 0x499]
eventOwner:say(quest, 5.0, 0.0)  [pc 50, 0x4AD]
eventOwner:say(quest, 24.0, 0.0)  [pc 55, 0x4C1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 58, 0x4CD]
eventOwner:say(quest, 6.0, 0.0)  [pc 63, 0x4E1]
eventOwner:say(quest, 7.0, 0.0)  [pc 68, 0x4F5]
eventOwner:_runCharaScheduler(354082816.0)  [pc 71, 0x501]
quest:_wait(1.0)  [pc 74, 0x50D]
eventOwner:say(quest, 8.0, 0.0)  [pc 79, 0x521]
eventOwner:say(quest, 9.0, 0.0)  [pc 84, 0x535]
eventOwner:_runCharaScheduler(354103296.0)  [pc 87, 0x541]
eventOwner:say(quest, 10.0, 0.0)  [pc 92, 0x555]
eventOwner:say(quest, 25.0, 0.0)  [pc 97, 0x569]
eventOwner:say(quest, 11.0, 0.0)  [pc 102, 0x57D]
call104.1.return1 = quest:showQuestInfomation()  [pc 104, 0x585]
eventOwner:_runCharaScheduler(354107392.0)  [pc 109, 0x599]
eventOwner:say(quest, 13.0, 0.0)  [pc 114, 0x5AD]
eventOwner:finishCliantTalkTurn()  [pc 125, 0x5D9]
return call104.1.return1
```

### Path 2

```text
require (call104.1.return1 == 1.0) is false  [pc 105, 0x589]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x3FD]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x411]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x425]
eventOwner:_runCharaScheduler(353968128.0)  [pc 19, 0x431]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x445]
eventOwner:say(quest, 21.0, 0.0)  [pc 29, 0x459]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x465]
eventOwner:say(quest, 22.0, 0.0)  [pc 37, 0x479]
eventOwner:say(quest, 23.0, 0.0)  [pc 42, 0x48D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 45, 0x499]
eventOwner:say(quest, 5.0, 0.0)  [pc 50, 0x4AD]
eventOwner:say(quest, 24.0, 0.0)  [pc 55, 0x4C1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 58, 0x4CD]
eventOwner:say(quest, 6.0, 0.0)  [pc 63, 0x4E1]
eventOwner:say(quest, 7.0, 0.0)  [pc 68, 0x4F5]
eventOwner:_runCharaScheduler(354082816.0)  [pc 71, 0x501]
quest:_wait(1.0)  [pc 74, 0x50D]
eventOwner:say(quest, 8.0, 0.0)  [pc 79, 0x521]
eventOwner:say(quest, 9.0, 0.0)  [pc 84, 0x535]
eventOwner:_runCharaScheduler(354103296.0)  [pc 87, 0x541]
eventOwner:say(quest, 10.0, 0.0)  [pc 92, 0x555]
eventOwner:say(quest, 25.0, 0.0)  [pc 97, 0x569]
eventOwner:say(quest, 11.0, 0.0)  [pc 102, 0x57D]
call104.1.return1 = quest:showQuestInfomation()  [pc 104, 0x585]
eventOwner:_runCharaScheduler(70815744.0)  [pc 118, 0x5BD]
eventOwner:say(quest, 12.0, 0.0)  [pc 123, 0x5D1]
eventOwner:finishCliantTalkTurn()  [pc 125, 0x5D9]
return call104.1.return1
```

## processEvent000_ALBERICS — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x77B]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x787]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0x79B]
eventOwner:_runCharaScheduler(353968128.0)  [pc 14, 0x7A7]
eventOwner:say(quest, 16.0, 0.0)  [pc 19, 0x7BB]
eventOwner:finishCliantTalkTurn()  [pc 21, 0x7C3]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51126.0, 2000204.0)  [pc 5, 0x891]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27272.0, 3.0)  [pc 4, 0x92D]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000275.0, 85.0)  [pc 4, 0x99C]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111322.0, 19.0)  [pc 6, 0xA10]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111322.0, 19.0)  [pc 6, 0xA8D]
return 
```

