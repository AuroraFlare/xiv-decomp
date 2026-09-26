# 111205 war0j5: reconstructed client path templates

## processEventCURIOUS_GORGEStart — 3 parameters
### Path 1

```text
require (call97.1.return1 == 1.0) is true  [pc 98, 0x3EA]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x26E]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x27A]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x28E]
quest:startFadeOut(player, 1.0)  [pc 15, 0x29E]
quest:_wait(1.0)  [pc 18, 0x2AA]
quest:startFadeIn(player, 1.0)  [pc 22, 0x2BA]
eventOwner:say(quest, 3.0, 0.0)  [pc 27, 0x2CE]
eventOwner:say(quest, 17.0, 0.0)  [pc 32, 0x2E2]
eventOwner:_runCharaScheduler(354058240.0)  [pc 35, 0x2EE]
eventOwner:say(quest, 4.0, 0.0)  [pc 40, 0x302]
quest:_wait(1.0)  [pc 43, 0x30E]
eventOwner:say(quest, 5.0, 0.0)  [pc 48, 0x322]
eventOwner:say(quest, 6.0, 0.0)  [pc 53, 0x336]
eventOwner:_runCharaScheduler(353964032.0)  [pc 56, 0x342]
quest:_wait(1.0)  [pc 59, 0x34E]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x362]
eventOwner:_runCharaScheduler(354103296.0)  [pc 67, 0x36E]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x382]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x396]
eventOwner:say(quest, 10.0, 0.0)  [pc 82, 0x3AA]
eventOwner:_runCharaScheduler(70881280.0)  [pc 85, 0x3B6]
eventOwner:say(quest, 11.0, 0.0)  [pc 90, 0x3CA]
eventOwner:say(quest, 12.0, 0.0)  [pc 95, 0x3DE]
call97.1.return1 = quest:showQuestInfomation()  [pc 97, 0x3E6]
eventOwner:_runCharaScheduler(354050048.0)  [pc 102, 0x3FA]
eventOwner:say(quest, 14.0, 0.0)  [pc 107, 0x40E]
eventOwner:finishCliantTalkTurn()  [pc 121, 0x446]
return call97.1.return1
```

### Path 2

```text
require (call97.1.return1 == 1.0) is false  [pc 98, 0x3EA]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x26E]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x27A]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x28E]
quest:startFadeOut(player, 1.0)  [pc 15, 0x29E]
quest:_wait(1.0)  [pc 18, 0x2AA]
quest:startFadeIn(player, 1.0)  [pc 22, 0x2BA]
eventOwner:say(quest, 3.0, 0.0)  [pc 27, 0x2CE]
eventOwner:say(quest, 17.0, 0.0)  [pc 32, 0x2E2]
eventOwner:_runCharaScheduler(354058240.0)  [pc 35, 0x2EE]
eventOwner:say(quest, 4.0, 0.0)  [pc 40, 0x302]
quest:_wait(1.0)  [pc 43, 0x30E]
eventOwner:say(quest, 5.0, 0.0)  [pc 48, 0x322]
eventOwner:say(quest, 6.0, 0.0)  [pc 53, 0x336]
eventOwner:_runCharaScheduler(353964032.0)  [pc 56, 0x342]
quest:_wait(1.0)  [pc 59, 0x34E]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x362]
eventOwner:_runCharaScheduler(354103296.0)  [pc 67, 0x36E]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x382]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x396]
eventOwner:say(quest, 10.0, 0.0)  [pc 82, 0x3AA]
eventOwner:_runCharaScheduler(70881280.0)  [pc 85, 0x3B6]
eventOwner:say(quest, 11.0, 0.0)  [pc 90, 0x3CA]
eventOwner:say(quest, 12.0, 0.0)  [pc 95, 0x3DE]
call97.1.return1 = quest:showQuestInfomation()  [pc 97, 0x3E6]
eventOwner:_runCharaScheduler(354082816.0)  [pc 111, 0x41E]
quest:_wait(1.0)  [pc 114, 0x42A]
eventOwner:say(quest, 13.0, 0.0)  [pc 119, 0x43E]
eventOwner:finishCliantTalkTurn()  [pc 121, 0x446]
return call97.1.return1
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5F0]
eventOwner:_runCharaScheduler(354000896.0)  [pc 6, 0x5FC]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0x610]
eventOwner:say(quest, 16.0, 0.0)  [pc 16, 0x624]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x62C]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51119.0)  [pc 4, 0x6ED]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27192.0, 3.0)  [pc 4, 0x780]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1600318.0, 77.0)  [pc 4, 0x7EF]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111205.0, 17.0)  [pc 6, 0x863]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111205.0, 17.0)  [pc 6, 0x8E0]
return 
```

