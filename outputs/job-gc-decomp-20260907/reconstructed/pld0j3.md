# 111283 pld0j3: reconstructed client path templates

## processEventJENLYNSStart — 3 parameters
### Path 1

```text
require (call65.1.return1 == 1.0) is true  [pc 66, 0x390]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x294]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0x2A0]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2B4]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2C8]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x2DC]
eventOwner:_runCharaScheduler(354086912.0)  [pc 24, 0x2E8]
quest:_wait(1.0)  [pc 27, 0x2F4]
eventOwner:say(quest, 7.0, 0.0)  [pc 32, 0x308]
eventOwner:say(quest, 8.0, 0.0)  [pc 37, 0x31C]
eventOwner:_runCharaScheduler(353972224.0)  [pc 40, 0x328]
eventOwner:say(quest, 9.0, 0.0)  [pc 45, 0x33C]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x350]
eventOwner:_runCharaScheduler(354041856.0)  [pc 53, 0x35C]
eventOwner:say(quest, 11.0, 0.0)  [pc 58, 0x370]
eventOwner:say(quest, 12.0, 0.0)  [pc 63, 0x384]
call65.1.return1 = quest:showQuestInfomation()  [pc 65, 0x38C]
eventOwner:_runCharaScheduler(70795264.0)  [pc 70, 0x3A0]
eventOwner:say(quest, 14.0, 0.0)  [pc 75, 0x3B4]
eventOwner:say(quest, 15.0, 0.0)  [pc 80, 0x3C8]
quest:startFadeOut(player, 1.0)  [pc 84, 0x3D8]
quest:_wait(1.0)  [pc 87, 0x3E4]
quest:startFadeIn(player, 1.0)  [pc 91, 0x3F4]
eventOwner:say(quest, 16.0, 0.0)  [pc 96, 0x408]
eventOwner:_waitForCharaSchedulerFinished(70795264.0)  [pc 99, 0x414]
eventOwner:finishCliantTalkTurn()  [pc 113, 0x44C]
return call65.1.return1
```

### Path 2

```text
require (call65.1.return1 == 1.0) is false  [pc 66, 0x390]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x294]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0x2A0]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2B4]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2C8]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x2DC]
eventOwner:_runCharaScheduler(354086912.0)  [pc 24, 0x2E8]
quest:_wait(1.0)  [pc 27, 0x2F4]
eventOwner:say(quest, 7.0, 0.0)  [pc 32, 0x308]
eventOwner:say(quest, 8.0, 0.0)  [pc 37, 0x31C]
eventOwner:_runCharaScheduler(353972224.0)  [pc 40, 0x328]
eventOwner:say(quest, 9.0, 0.0)  [pc 45, 0x33C]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x350]
eventOwner:_runCharaScheduler(354041856.0)  [pc 53, 0x35C]
eventOwner:say(quest, 11.0, 0.0)  [pc 58, 0x370]
eventOwner:say(quest, 12.0, 0.0)  [pc 63, 0x384]
call65.1.return1 = quest:showQuestInfomation()  [pc 65, 0x38C]
eventOwner:_runCharaScheduler(70795264.0)  [pc 103, 0x424]
eventOwner:say(quest, 13.0, 0.0)  [pc 108, 0x438]
eventOwner:_waitForCharaSchedulerFinished(70795264.0)  [pc 111, 0x444]
eventOwner:finishCliantTalkTurn()  [pc 113, 0x44C]
return call65.1.return1
```

## processEventJENLYNSStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5F6]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x60A]
worldMaster:say(quest, 3.0, 0.0)  [pc 14, 0x622]
eventOwner:finishCliantTalkTurn()  [pc 16, 0x62A]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6CE]
eventOwner:say(quest, 17.0, 0.0)  [pc 8, 0x6E2]
eventOwner:say(quest, 18.0, 0.0)  [pc 13, 0x6F6]
eventOwner:_runCharaScheduler(354041856.0)  [pc 16, 0x702]
eventOwner:say(quest, 19.0, 0.0)  [pc 21, 0x716]
eventOwner:say(quest, 20.0, 0.0)  [pc 26, 0x72A]
eventOwner:finishCliantTalkTurn()  [pc 28, 0x732]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51127.0, 2000201.0)  [pc 5, 0x809]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27149.0, 2.0)  [pc 4, 0x8A5]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000146.0, 96.0)  [pc 4, 0x914]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111283.0, 16.0)  [pc 6, 0x988]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111283.0, 16.0)  [pc 6, 0xA05]
return 
```

