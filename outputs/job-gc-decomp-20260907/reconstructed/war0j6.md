# 111206 war0j6: reconstructed client path templates

## processEventCURIOUS_GORGEHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CA]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x2D6]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2EA]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2FE]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x306]
worldMaster:say(quest, 4.0, 0.0)  [pc 24, 0x31E]
return 
```

## processEventCURIOUS_GORGEStart — 3 parameters
### Path 1

```text
require (call52.1.return1 == 1.0) is true  [pc 53, 0x4B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3EC]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x3F8]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x40C]
eventOwner:say(quest, 6.0, 0.0)  [pc 16, 0x420]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x42C]
eventOwner:say(quest, 7.0, 0.0)  [pc 24, 0x440]
eventOwner:say(quest, 8.0, 0.0)  [pc 29, 0x454]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x460]
eventOwner:say(quest, 9.0, 0.0)  [pc 37, 0x474]
eventOwner:say(quest, 10.0, 0.0)  [pc 42, 0x488]
eventOwner:_runCharaScheduler(353959936.0)  [pc 45, 0x494]
eventOwner:say(quest, 11.0, 0.0)  [pc 50, 0x4A8]
call52.1.return1 = quest:showQuestInfomation()  [pc 52, 0x4B0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 57, 0x4C4]
eventOwner:say(quest, 13.0, 0.0)  [pc 62, 0x4D8]
eventOwner:finishCliantTalkTurn()  [pc 73, 0x504]
return call52.1.return1
```

### Path 2

```text
require (call52.1.return1 == 1.0) is false  [pc 53, 0x4B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3EC]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x3F8]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x40C]
eventOwner:say(quest, 6.0, 0.0)  [pc 16, 0x420]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x42C]
eventOwner:say(quest, 7.0, 0.0)  [pc 24, 0x440]
eventOwner:say(quest, 8.0, 0.0)  [pc 29, 0x454]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x460]
eventOwner:say(quest, 9.0, 0.0)  [pc 37, 0x474]
eventOwner:say(quest, 10.0, 0.0)  [pc 42, 0x488]
eventOwner:_runCharaScheduler(353959936.0)  [pc 45, 0x494]
eventOwner:say(quest, 11.0, 0.0)  [pc 50, 0x4A8]
call52.1.return1 = quest:showQuestInfomation()  [pc 52, 0x4B0]
eventOwner:_runCharaScheduler(353984512.0)  [pc 66, 0x4E8]
eventOwner:say(quest, 12.0, 0.0)  [pc 71, 0x4FC]
eventOwner:finishCliantTalkTurn()  [pc 73, 0x504]
return call52.1.return1
```

## processEventCURIOUS_GORGEFollow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x653]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x65F]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0x673]
eventOwner:say(quest, 15.0, 0.0)  [pc 16, 0x687]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x68F]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x748]
call6.1.return1 = quest:startNQCutScene('war0j610', 1.0)  [pc 6, 0x758]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x764]
return 
```

## processEventCURIOUS_GORGE010Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x80D]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x819]
eventOwner:say(quest, 39.0, 0.0)  [pc 11, 0x82D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x835]
return 
```

## processEvent020 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x8E5]
quest:startNQCutScene('war0j620', 1.0)  [pc 6, 0x8F5]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x901]
return 
```

## processEventClear — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 42.0)  [pc 4, 0x9AE]
quest:_wait(8.0)  [pc 7, 0x9BA]
quest:showGetJobAbilityWidget(player, 27189.0, 1.0)  [pc 12, 0x9CE]
quest:_wait(6.0)  [pc 15, 0x9DA]
quest:showGetJobItemWidget(player, arg4)  [pc 19, 0x9EA]
quest:_wait(6.0)  [pc 22, 0x9F6]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111206.0, 17.0)  [pc 6, 0xAE6]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111206.0, 17.0)  [pc 6, 0xB63]
return 
```

