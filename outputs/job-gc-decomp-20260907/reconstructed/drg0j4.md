# 111324 drg0j4: reconstructed client path templates

## processEvent_ALBERIC_Hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2A7]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x2B3]
eventOwner:say(quest, 40.0, 0.0)  [pc 11, 0x2C7]
eventOwner:say(quest, 43.0, 0.0)  [pc 16, 0x2DB]
worldMaster:say(quest, 41.0, 0.0)  [pc 22, 0x2F3]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x2FB]
return 
```

## processEvent_ALBERIC_Start — 3 parameters
### Path 1

```text
require (call23.1.return1 == 1.0) is true  [pc 28, 0x436]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3D2]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x3E6]
eventOwner:_runCharaScheduler(354086912.0)  [pc 11, 0x3F2]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x406]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x41A]
call23.1.return1 = quest:showQuestInfomation()  [pc 23, 0x422]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 27, 0x432]
eventOwner:_runCharaScheduler(353980416.0)  [pc 32, 0x446]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x45A]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x486]
return call23.1.return1
```

### Path 2

```text
require (call23.1.return1 == 1.0) is false  [pc 28, 0x436]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3D2]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x3E6]
eventOwner:_runCharaScheduler(354086912.0)  [pc 11, 0x3F2]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x406]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x41A]
call23.1.return1 = quest:showQuestInfomation()  [pc 23, 0x422]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 27, 0x432]
eventOwner:_runCharaScheduler(354041856.0)  [pc 41, 0x46A]
eventOwner:say(quest, 5.0, 0.0)  [pc 46, 0x47E]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x486]
return call23.1.return1
```

## processEvent_ALBERIC_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x58D]
eventOwner:_runCharaScheduler(354086912.0)  [pc 6, 0x599]
eventOwner:say(quest, 7.0, 0.0)  [pc 11, 0x5AD]
eventOwner:say(quest, 33.0, 0.0)  [pc 16, 0x5C1]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x5C9]
return 
```

## processEvent_NQ_Drg0j410 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x682]
quest:startNQCutScene('Drg0j410', 1.0)  [pc 6, 0x692]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x69E]
return 
```

## processEvent_ALBERIC_Guidance — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(354086912.0)  [pc 2, 0x743]
eventOwner:say(quest, 32.0, 0.0)  [pc 7, 0x757]
quest:_wait(1.0)  [pc 10, 0x763]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 14, 0x773]
eventOwner:say(quest, 34.0, 0.0)  [pc 19, 0x787]
eventOwner:_runCharaScheduler(354082816.0)  [pc 22, 0x793]
eventOwner:say(quest, 35.0, 0.0)  [pc 27, 0x7A7]
eventOwner:say(quest, 36.0, 0.0)  [pc 32, 0x7BB]
eventOwner:say(quest, 37.0, 0.0)  [pc 37, 0x7CF]
eventOwner:_runCharaScheduler(354103296.0)  [pc 40, 0x7DB]
eventOwner:say(quest, 38.0, 0.0)  [pc 45, 0x7EF]
eventOwner:say(quest, 39.0, 0.0)  [pc 50, 0x803]
eventOwner:say(quest, 42.0, 0.0)  [pc 55, 0x817]
eventOwner:finishCliantTalkTurn()  [pc 57, 0x81F]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0x934]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0x948]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111324.0, 19.0)  [pc 6, 0x9D4]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111304.0, 19.0)  [pc 6, 0xA51]
return 
```

