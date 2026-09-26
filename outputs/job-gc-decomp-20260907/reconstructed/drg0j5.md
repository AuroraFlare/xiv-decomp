# 111325 drg0j5: reconstructed client path templates

## processEventALBERICStart — 3 parameters
### Path 1

```text
require (call172.1.return1 == 1.0) is true  [pc 173, 0x519]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x271]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0x27D]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x291]
eventOwner:say(quest, 28.0, 0.0)  [pc 16, 0x2A5]
quest:_wait(1.5)  [pc 19, 0x2B1]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x2C5]
call29.1.return1 = eventOwner:ask(quest, 4.0, 2.0)  [pc 29, 0x2D9]
quest:_wait(0.5)  [pc 32, 0x2E5]
eventOwner:_runCharaScheduler(354082816.0)  [pc 35, 0x2F1]
quest:_wait(1.5)  [pc 38, 0x2FD]
eventOwner:say(quest, 7.0, 0.0)  [pc 43, 0x311]
eventOwner:say(quest, 8.0, 0.0)  [pc 48, 0x325]
eventOwner:say(quest, 9.0, 0.0)  [pc 53, 0x339]
eventOwner:_runCharaScheduler(70823936.0)  [pc 56, 0x345]
quest:_wait(0.5)  [pc 59, 0x351]
eventOwner:say(quest, 10.0, 0.0)  [pc 64, 0x365]
eventOwner:say(quest, 11.0, 0.0)  [pc 69, 0x379]
eventOwner:_runCharaScheduler(353964032.0)  [pc 72, 0x385]
eventOwner:say(quest, 12.0, 0.0)  [pc 77, 0x399]
eventOwner:say(quest, 13.0, 0.0)  [pc 82, 0x3AD]
eventOwner:say(quest, 14.0, 0.0)  [pc 87, 0x3C1]
eventOwner:say(quest, 29.0, 0.0)  [pc 92, 0x3D5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 95, 0x3E1]
eventOwner:say(quest, 15.0, 0.0)  [pc 100, 0x3F5]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x3FD]
quest:_wait(0.5)  [pc 105, 0x409]
eventOwner:say(quest, 30.0, 0.0)  [pc 110, 0x41D]
eventOwner:_runCharaScheduler(70823936.0)  [pc 113, 0x429]
quest:_wait(0.5)  [pc 116, 0x435]
eventOwner:say(quest, 31.0, 0.0)  [pc 121, 0x449]
eventOwner:_runCharaScheduler(353959936.0)  [pc 124, 0x455]
eventOwner:say(quest, 16.0, 0.0)  [pc 129, 0x469]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 133, 0x479]
quest:_wait(0.5)  [pc 136, 0x485]
eventOwner:_runCharaScheduler(353964032.0)  [pc 139, 0x491]
eventOwner:say(quest, 18.0, 0.0)  [pc 144, 0x4A5]
eventOwner:say(quest, 19.0, 0.0)  [pc 149, 0x4B9]
eventOwner:_runCharaScheduler(353959936.0)  [pc 152, 0x4C5]
eventOwner:say(quest, 20.0, 0.0)  [pc 157, 0x4D9]
eventOwner:_runCharaScheduler(354103296.0)  [pc 160, 0x4E5]
eventOwner:say(quest, 21.0, 0.0)  [pc 165, 0x4F9]
eventOwner:say(quest, 22.0, 0.0)  [pc 170, 0x50D]
call172.1.return1 = quest:showQuestInfomation()  [pc 172, 0x515]
eventOwner:_runCharaScheduler(70799360.0)  [pc 177, 0x529]
eventOwner:say(quest, 24.0, 0.0)  [pc 182, 0x53D]
eventOwner:finishCliantTalkTurn()  [pc 193, 0x569]
return call172.1.return1
```

### Path 2

```text
require (call172.1.return1 == 1.0) is false  [pc 173, 0x519]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x271]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0x27D]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x291]
eventOwner:say(quest, 28.0, 0.0)  [pc 16, 0x2A5]
quest:_wait(1.5)  [pc 19, 0x2B1]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x2C5]
call29.1.return1 = eventOwner:ask(quest, 4.0, 2.0)  [pc 29, 0x2D9]
quest:_wait(0.5)  [pc 32, 0x2E5]
eventOwner:_runCharaScheduler(354082816.0)  [pc 35, 0x2F1]
quest:_wait(1.5)  [pc 38, 0x2FD]
eventOwner:say(quest, 7.0, 0.0)  [pc 43, 0x311]
eventOwner:say(quest, 8.0, 0.0)  [pc 48, 0x325]
eventOwner:say(quest, 9.0, 0.0)  [pc 53, 0x339]
eventOwner:_runCharaScheduler(70823936.0)  [pc 56, 0x345]
quest:_wait(0.5)  [pc 59, 0x351]
eventOwner:say(quest, 10.0, 0.0)  [pc 64, 0x365]
eventOwner:say(quest, 11.0, 0.0)  [pc 69, 0x379]
eventOwner:_runCharaScheduler(353964032.0)  [pc 72, 0x385]
eventOwner:say(quest, 12.0, 0.0)  [pc 77, 0x399]
eventOwner:say(quest, 13.0, 0.0)  [pc 82, 0x3AD]
eventOwner:say(quest, 14.0, 0.0)  [pc 87, 0x3C1]
eventOwner:say(quest, 29.0, 0.0)  [pc 92, 0x3D5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 95, 0x3E1]
eventOwner:say(quest, 15.0, 0.0)  [pc 100, 0x3F5]
eventOwner:finishCliantTalkTurn()  [pc 102, 0x3FD]
quest:_wait(0.5)  [pc 105, 0x409]
eventOwner:say(quest, 30.0, 0.0)  [pc 110, 0x41D]
eventOwner:_runCharaScheduler(70823936.0)  [pc 113, 0x429]
quest:_wait(0.5)  [pc 116, 0x435]
eventOwner:say(quest, 31.0, 0.0)  [pc 121, 0x449]
eventOwner:_runCharaScheduler(353959936.0)  [pc 124, 0x455]
eventOwner:say(quest, 16.0, 0.0)  [pc 129, 0x469]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 133, 0x479]
quest:_wait(0.5)  [pc 136, 0x485]
eventOwner:_runCharaScheduler(353964032.0)  [pc 139, 0x491]
eventOwner:say(quest, 18.0, 0.0)  [pc 144, 0x4A5]
eventOwner:say(quest, 19.0, 0.0)  [pc 149, 0x4B9]
eventOwner:_runCharaScheduler(353959936.0)  [pc 152, 0x4C5]
eventOwner:say(quest, 20.0, 0.0)  [pc 157, 0x4D9]
eventOwner:_runCharaScheduler(354103296.0)  [pc 160, 0x4E5]
eventOwner:say(quest, 21.0, 0.0)  [pc 165, 0x4F9]
eventOwner:say(quest, 22.0, 0.0)  [pc 170, 0x50D]
call172.1.return1 = quest:showQuestInfomation()  [pc 172, 0x515]
eventOwner:_runCharaScheduler(70799360.0)  [pc 186, 0x54D]
eventOwner:say(quest, 23.0, 0.0)  [pc 191, 0x561]
eventOwner:finishCliantTalkTurn()  [pc 193, 0x569]
return call172.1.return1
```

## processEvent000_ALBERICS — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x76E]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x77A]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0x78E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 14, 0x79A]
eventOwner:say(quest, 26.0, 0.0)  [pc 19, 0x7AE]
eventOwner:finishCliantTalkTurn()  [pc 21, 0x7B6]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51135.0, 3102224.0, 1.0, 2000204.0)  [pc 7, 0x88C]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27277.0, 3.0)  [pc 4, 0x93A]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000275.0, 88.0)  [pc 4, 0x9A9]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111325.0, 19.0)  [pc 6, 0xA1D]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111325.0, 19.0)  [pc 6, 0xA9A]
return 
```

