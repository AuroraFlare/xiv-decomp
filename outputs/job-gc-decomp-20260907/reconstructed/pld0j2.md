# 111282 pld0j2: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x293]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x29F]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2B3]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2C7]
worldMaster:say(quest, 4.0, 0.0)  [pc 22, 0x2DF]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x2E7]
return 
```

## processEventJENLYNSStart — 3 parameters
### Path 1

```text
require (call83.1.return1 == 1.0) is true  [pc 84, 0x4F9]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x3B5]
eventOwner:_runCharaScheduler(84054016.0)  [pc 6, 0x3C1]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x3D5]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0x3E9]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x3FD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 24, 0x409]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x431]
eventOwner:_runCharaScheduler(354066432.0)  [pc 37, 0x43D]
eventOwner:say(quest, 9.0, 0.0)  [pc 42, 0x451]
eventOwner:_runCharaScheduler(70823936.0)  [pc 45, 0x45D]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x471]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x485]
eventOwner:say(quest, 23.0, 0.0)  [pc 60, 0x499]
eventOwner:_runCharaScheduler(83894272.0)  [pc 63, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 68, 0x4B9]
eventOwner:_runCharaScheduler(354082816.0)  [pc 71, 0x4C5]
eventOwner:say(quest, 14.0, 0.0)  [pc 76, 0x4D9]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x4ED]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x4F5]
eventOwner:_runCharaScheduler(354103296.0)  [pc 88, 0x509]
eventOwner:say(quest, 17.0, 0.0)  [pc 93, 0x51D]
quest:startFadeOut(player, 1.0)  [pc 97, 0x52D]
quest:_wait(3.0)  [pc 100, 0x539]
quest:startFadeIn(player, 1.0)  [pc 104, 0x549]
eventOwner:say(quest, 21.0, 0.0)  [pc 109, 0x55D]
eventOwner:say(quest, 18.0, 0.0)  [pc 114, 0x571]
eventOwner:_runCharaScheduler(354107392.0)  [pc 117, 0x57D]
eventOwner:say(quest, 19.0, 0.0)  [pc 122, 0x591]
eventOwner:_waitForCharaSchedulerFinished(354107392.0)  [pc 125, 0x59D]
eventOwner:finishCliantTalkTurn()  [pc 139, 0x5D5]
return call83.1.return1
```

### Path 2

```text
require (call83.1.return1 == 1.0) is false  [pc 84, 0x4F9]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x3B5]
eventOwner:_runCharaScheduler(84054016.0)  [pc 6, 0x3C1]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x3D5]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0x3E9]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x3FD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 24, 0x409]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x41D]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x431]
eventOwner:_runCharaScheduler(354066432.0)  [pc 37, 0x43D]
eventOwner:say(quest, 9.0, 0.0)  [pc 42, 0x451]
eventOwner:_runCharaScheduler(70823936.0)  [pc 45, 0x45D]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x471]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x485]
eventOwner:say(quest, 23.0, 0.0)  [pc 60, 0x499]
eventOwner:_runCharaScheduler(83894272.0)  [pc 63, 0x4A5]
eventOwner:say(quest, 12.0, 0.0)  [pc 68, 0x4B9]
eventOwner:_runCharaScheduler(354082816.0)  [pc 71, 0x4C5]
eventOwner:say(quest, 14.0, 0.0)  [pc 76, 0x4D9]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x4ED]
call83.1.return1 = quest:showQuestInfomation()  [pc 83, 0x4F5]
eventOwner:_runCharaScheduler(353964032.0)  [pc 129, 0x5AD]
eventOwner:say(quest, 16.0, 0.0)  [pc 134, 0x5C1]
eventOwner:_waitForCharaSchedulerFinished(353964032.0)  [pc 137, 0x5CD]
eventOwner:finishCliantTalkTurn()  [pc 139, 0x5D5]
return call83.1.return1
```

## processEvent000_JENLYNS — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7D9]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x7E5]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0x7F9]
eventOwner:say(quest, 24.0, 0.0)  [pc 16, 0x80D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x815]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51127.0, 2000201.0)  [pc 5, 0x8DA]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27147.0, 1.0)  [pc 4, 0x976]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000146.0, 95.0)  [pc 4, 0x9E5]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111282.0, 16.0)  [pc 6, 0xA59]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111282.0, 16.0)  [pc 6, 0xAD6]
return 
```

