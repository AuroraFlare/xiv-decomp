# 111285 pld0j5: reconstructed client path templates

## processEventJENLYNSStart — 3 parameters
### Path 1

```text
require (call31.1.return1 == 1.0) is true  [pc 32, 0x2DF]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x26B]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x277]
eventOwner:say(quest, 21.0, 0.0)  [pc 11, 0x28B]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0x29F]
eventOwner:say(quest, 23.0, 0.0)  [pc 21, 0x2B3]
eventOwner:_runCharaScheduler(354103296.0)  [pc 24, 0x2BF]
eventOwner:say(quest, 24.0, 0.0)  [pc 29, 0x2D3]
call31.1.return1 = quest:showQuestInfomation()  [pc 31, 0x2DB]
eventOwner:_runCharaScheduler(353959936.0)  [pc 36, 0x2EF]
eventOwner:say(quest, 26.0, 0.0)  [pc 41, 0x303]
eventOwner:say(quest, 27.0, 0.0)  [pc 46, 0x317]
eventOwner:_waitForCharaSchedulerFinished(353959936.0)  [pc 49, 0x323]
eventOwner:finishCliantTalkTurn()  [pc 63, 0x35B]
return call31.1.return1
```

### Path 2

```text
require (call31.1.return1 == 1.0) is false  [pc 32, 0x2DF]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x26B]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x277]
eventOwner:say(quest, 21.0, 0.0)  [pc 11, 0x28B]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0x29F]
eventOwner:say(quest, 23.0, 0.0)  [pc 21, 0x2B3]
eventOwner:_runCharaScheduler(354103296.0)  [pc 24, 0x2BF]
eventOwner:say(quest, 24.0, 0.0)  [pc 29, 0x2D3]
call31.1.return1 = quest:showQuestInfomation()  [pc 31, 0x2DB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 53, 0x333]
eventOwner:say(quest, 25.0, 0.0)  [pc 58, 0x347]
eventOwner:_waitForCharaSchedulerFinished(354041856.0)  [pc 61, 0x353]
eventOwner:finishCliantTalkTurn()  [pc 63, 0x35B]
return call31.1.return1
```

## processEvent_000_JENLYNSSFollow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x4A1]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x4AD]
eventOwner:say(quest, 28.0, 0.0)  [pc 11, 0x4C1]
eventOwner:_waitForCharaSchedulerFinished(354103296.0)  [pc 14, 0x4CD]
eventOwner:finishCliantTalkTurn()  [pc 16, 0x4D5]
return 
```

## processEvent_005NQ_1 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x5BD]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x5A9]
quest:startNQCutScene('pld0j510', 1.0)  [pc 6, 0x5B9]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x5CD]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x5BD]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x5A9]
quest:startNQCutScene('pld0j510', 1.0)  [pc 6, 0x5B9]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x5DD]
return 
```

## processEvent_015NQ_2 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x6A6]
quest:startNQCutScene('pld0j520', 1.0)  [pc 6, 0x6B6]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x6C2]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
worldMaster:say(quest, 29.0, 0.0)  [pc 5, 0x773]
desktopWidget:openPublicInformLongDialogWidget(quest, 31.0)  [pc 10, 0x787]
quest:_wait(8.0)  [pc 13, 0x793]
quest:showGetJobAbilityWidget(player, 27159.0, 3.0)  [pc 18, 0x7A7]
quest:_wait(6.0)  [pc 21, 0x7B3]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111285.0, 16.0)  [pc 6, 0x8B5]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111285.0, 16.0)  [pc 6, 0x932]
return 
```

