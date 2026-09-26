# 111304 brd0j4: reconstructed client path templates

## processEventStartBefore — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2C3]
eventOwner:_runCharaScheduler(70803456.0)  [pc 6, 0x2CF]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2E3]
eventOwner:say(quest, 32.0, 0.0)  [pc 16, 0x2F7]
worldMaster:say(quest, 3.0, 0.0)  [pc 22, 0x30F]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x317]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call106.1.return1 == 1.0) is true  [pc 107, 0x585]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3E5]
eventOwner:_runCharaScheduler(70877184.0)  [pc 6, 0x3F1]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x405]
eventOwner:say(quest, 31.0, 0.0)  [pc 16, 0x419]
eventOwner:_runCharaScheduler(70836224.0)  [pc 19, 0x425]
eventOwner:say(quest, 33.0, 0.0)  [pc 24, 0x439]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x44D]
eventOwner:finishCliantTalkTurn()  [pc 31, 0x455]
eventOwner:_runCharaScheduler(69521408.0)  [pc 34, 0x461]
quest:_wait(1.5)  [pc 37, 0x46D]
player:_runCharaScheduler(67111909.0)  [pc 40, 0x479]
quest:_wait(1.5)  [pc 43, 0x485]
eventOwner:say(quest, 6.0, 0.0)  [pc 48, 0x499]
eventOwner:_waitForCharaSchedulerFinished(69521408.0)  [pc 51, 0x4A5]
eventOwner:_runCharaScheduler(69521408.0)  [pc 54, 0x4B1]
quest:_wait(1.5)  [pc 57, 0x4BD]
player:_runCharaScheduler(67111909.0)  [pc 60, 0x4C9]
quest:_wait(1.5)  [pc 63, 0x4D5]
eventOwner:say(quest, 7.0, 0.0)  [pc 68, 0x4E9]
eventOwner:_waitForCharaSchedulerFinished(69521408.0)  [pc 71, 0x4F5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 75, 0x505]
quest:_wait(1.0)  [pc 78, 0x511]
eventOwner:_runCharaScheduler(70836224.0)  [pc 81, 0x51D]
eventOwner:say(quest, 8.0, 0.0)  [pc 86, 0x531]
eventOwner:say(quest, 34.0, 0.0)  [pc 91, 0x545]
eventOwner:_runCharaScheduler(70840320.0)  [pc 94, 0x551]
eventOwner:say(quest, 9.0, 0.0)  [pc 99, 0x565]
eventOwner:say(quest, 10.0, 0.0)  [pc 104, 0x579]
call106.1.return1 = quest:showQuestInfomation()  [pc 106, 0x581]
eventOwner:say(quest, 12.0, 0.0)  [pc 113, 0x59D]
eventOwner:_runCharaScheduler(69521408.0)  [pc 116, 0x5A9]
quest:_wait(1.5)  [pc 119, 0x5B5]
player:_runCharaScheduler(67111909.0)  [pc 122, 0x5C1]
quest:_wait(1.5)  [pc 125, 0x5CD]
eventOwner:finishCliantTalkTurn()  [pc 127, 0x5D5]
eventOwner:say(quest, 13.0, 0.0)  [pc 132, 0x5E9]
return call106.1.return1
```

### Path 2

```text
require (call106.1.return1 == 1.0) is false  [pc 107, 0x585]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3E5]
eventOwner:_runCharaScheduler(70877184.0)  [pc 6, 0x3F1]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x405]
eventOwner:say(quest, 31.0, 0.0)  [pc 16, 0x419]
eventOwner:_runCharaScheduler(70836224.0)  [pc 19, 0x425]
eventOwner:say(quest, 33.0, 0.0)  [pc 24, 0x439]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x44D]
eventOwner:finishCliantTalkTurn()  [pc 31, 0x455]
eventOwner:_runCharaScheduler(69521408.0)  [pc 34, 0x461]
quest:_wait(1.5)  [pc 37, 0x46D]
player:_runCharaScheduler(67111909.0)  [pc 40, 0x479]
quest:_wait(1.5)  [pc 43, 0x485]
eventOwner:say(quest, 6.0, 0.0)  [pc 48, 0x499]
eventOwner:_waitForCharaSchedulerFinished(69521408.0)  [pc 51, 0x4A5]
eventOwner:_runCharaScheduler(69521408.0)  [pc 54, 0x4B1]
quest:_wait(1.5)  [pc 57, 0x4BD]
player:_runCharaScheduler(67111909.0)  [pc 60, 0x4C9]
quest:_wait(1.5)  [pc 63, 0x4D5]
eventOwner:say(quest, 7.0, 0.0)  [pc 68, 0x4E9]
eventOwner:_waitForCharaSchedulerFinished(69521408.0)  [pc 71, 0x4F5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 75, 0x505]
quest:_wait(1.0)  [pc 78, 0x511]
eventOwner:_runCharaScheduler(70836224.0)  [pc 81, 0x51D]
eventOwner:say(quest, 8.0, 0.0)  [pc 86, 0x531]
eventOwner:say(quest, 34.0, 0.0)  [pc 91, 0x545]
eventOwner:_runCharaScheduler(70840320.0)  [pc 94, 0x551]
eventOwner:say(quest, 9.0, 0.0)  [pc 99, 0x565]
eventOwner:say(quest, 10.0, 0.0)  [pc 104, 0x579]
call106.1.return1 = quest:showQuestInfomation()  [pc 106, 0x581]
eventOwner:say(quest, 11.0, 0.0)  [pc 139, 0x605]
eventOwner:finishCliantTalkTurn()  [pc 141, 0x60D]
return call106.1.return1
```

## processEventJehantel — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7AF]
eventOwner:_runCharaScheduler(70836224.0)  [pc 6, 0x7BB]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0x7CF]
eventOwner:say(quest, 35.0, 0.0)  [pc 16, 0x7E3]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x7EB]
return 
```

## processEventNQ01 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x8B8]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x8A4]
quest:startNQCutScene('brd0j410', 1.0)  [pc 6, 0x8B4]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x8C8]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x8B8]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x8A4]
quest:startNQCutScene('brd0j410', 1.0)  [pc 6, 0x8B4]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x8D8]
return 
```

## processEventNQ02 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x9A1]
quest:startNQCutScene('brd0j410', 1.0)  [pc 6, 0x9B1]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x9BD]
return 
```

## processEventNQ03 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xA62]
quest:startNQCutScene('brd0j420', 1.0)  [pc 6, 0xA72]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xA7E]
worldMaster:say(quest, 30.0, 0.0)  [pc 15, 0xA96]
return 
```

## processEventClear01 — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 36.0)  [pc 4, 0xB6F]
quest:_wait(8.0)  [pc 7, 0xB7B]
quest:showGetJobAbilityWidget(player, 27232.0, 3.0)  [pc 12, 0xB8F]
quest:_wait(6.0)  [pc 15, 0xB9B]
return 
```

## processEventClear02 — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 36.0)  [pc 4, 0xC69]
quest:_wait(8.0)  [pc 7, 0xC75]
quest:showGetJobAbilityWidget(player, 27232.0, 3.0)  [pc 12, 0xC89]
quest:_wait(6.0)  [pc 15, 0xC95]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111304.0, 18.0)  [pc 6, 0xD6B]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111304.0, 18.0)  [pc 6, 0xDE8]
return 
```

