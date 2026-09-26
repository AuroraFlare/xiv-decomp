# 111241 whm0j1: reconstructed client path templates

## processEventStart — 3 parameters
### Path 1

```text
require (call39.1.return1 == 1.0) is true  [pc 40, 0x469]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3D5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x3E1]
eventOwner:say(quest, 1.0, 0.0)  [pc 11, 0x3F5]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x409]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0x415]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x429]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x43D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x449]
eventOwner:say(quest, 41.0, 0.0)  [pc 37, 0x45D]
call39.1.return1 = quest:showQuestInfomation()  [pc 39, 0x465]
eventOwner:_runCharaScheduler(353959936.0)  [pc 44, 0x479]
eventOwner:say(quest, 6.0, 0.0)  [pc 49, 0x48D]
eventOwner:finishCliantTalkTurn()  [pc 51, 0x495]
return call39.1.return1
```

### Path 2

```text
require (call39.1.return1 == 1.0) is false  [pc 40, 0x469]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3D5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x3E1]
eventOwner:say(quest, 1.0, 0.0)  [pc 11, 0x3F5]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x409]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0x415]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x429]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x43D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x449]
eventOwner:say(quest, 41.0, 0.0)  [pc 37, 0x45D]
call39.1.return1 = quest:showQuestInfomation()  [pc 39, 0x465]
eventOwner:_runCharaScheduler(353959936.0)  [pc 56, 0x4A9]
eventOwner:say(quest, 5.0, 0.0)  [pc 61, 0x4BD]
eventOwner:finishCliantTalkTurn()  [pc 63, 0x4C5]
return call39.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5D5]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x5E1]
eventOwner:say(quest, 7.0, 0.0)  [pc 11, 0x5F5]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x5FD]
return 
```

## processEventRayao — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 4, 0x6B5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6B1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 8, 0x6C5]
eventOwner:say(quest, 9.0, 0.0)  [pc 13, 0x6D9]
eventOwner:say(quest, 45.0, 0.0)  [pc 27, 0x711]
eventOwner:say(quest, 46.0, 0.0)  [pc 32, 0x725]
eventOwner:say(quest, 47.0, 0.0)  [pc 37, 0x739]
eventOwner:say(quest, 48.0, 0.0)  [pc 42, 0x74D]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x761]
eventOwner:_runCharaScheduler(353976320.0)  [pc 50, 0x76D]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x781]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x795]
eventOwner:_runCharaScheduler(354082816.0)  [pc 63, 0x7A1]
eventOwner:say(quest, 13.0, 0.0)  [pc 68, 0x7B5]
eventOwner:say(quest, 49.0, 0.0)  [pc 73, 0x7C9]
eventOwner:say(quest, 43.0, 0.0)  [pc 78, 0x7DD]
eventOwner:say(quest, 14.0, 0.0)  [pc 83, 0x7F1]
eventOwner:_runCharaScheduler(354103296.0)  [pc 86, 0x7FD]
eventOwner:say(quest, 15.0, 0.0)  [pc 91, 0x811]
eventOwner:say(quest, 16.0, 0.0)  [pc 96, 0x825]
eventOwner:finishCliantTalkTurn()  [pc 98, 0x82D]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 4, 0x6B5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6B1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 17, 0x6E9]
eventOwner:say(quest, 8.0, 0.0)  [pc 22, 0x6FD]
eventOwner:say(quest, 45.0, 0.0)  [pc 27, 0x711]
eventOwner:say(quest, 46.0, 0.0)  [pc 32, 0x725]
eventOwner:say(quest, 47.0, 0.0)  [pc 37, 0x739]
eventOwner:say(quest, 48.0, 0.0)  [pc 42, 0x74D]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x761]
eventOwner:_runCharaScheduler(353976320.0)  [pc 50, 0x76D]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x781]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x795]
eventOwner:_runCharaScheduler(354082816.0)  [pc 63, 0x7A1]
eventOwner:say(quest, 13.0, 0.0)  [pc 68, 0x7B5]
eventOwner:say(quest, 49.0, 0.0)  [pc 73, 0x7C9]
eventOwner:say(quest, 43.0, 0.0)  [pc 78, 0x7DD]
eventOwner:say(quest, 14.0, 0.0)  [pc 83, 0x7F1]
eventOwner:_runCharaScheduler(354103296.0)  [pc 86, 0x7FD]
eventOwner:say(quest, 15.0, 0.0)  [pc 91, 0x811]
eventOwner:say(quest, 16.0, 0.0)  [pc 96, 0x825]
eventOwner:finishCliantTalkTurn()  [pc 98, 0x82D]
return 
```

## processEventMoogleA00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x983]
eventOwner:_runCharaScheduler(70086656.0)  [pc 6, 0x98F]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0x9A3]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x9AB]
return 
```

## processEventMoogleB00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xA65]
eventOwner:_runCharaScheduler(70098944.0)  [pc 6, 0xA71]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0xA85]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA8D]
return 
```

## processEventRyaoAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB47]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0xB53]
eventOwner:say(quest, 21.0, 0.0)  [pc 11, 0xB67]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0xB7B]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xB83]
return 
```

## processEventMoogleA01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xC40]
eventOwner:_runCharaScheduler(70098944.0)  [pc 6, 0xC4C]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0xC60]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC68]
return 
```

## processEventMoogleB01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xD22]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xD2E]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0xD42]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD4A]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE04]
eventOwner:say(quest, 23.0, 0.0)  [pc 8, 0xE18]
eventOwner:_runCharaScheduler(354095104.0)  [pc 11, 0xE24]
eventOwner:say(quest, 24.0, 0.0)  [pc 16, 0xE38]
return 
```

## processEventClearNQ — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xED7]
eventOwner:finishCliantTalkTurn()  [pc 4, 0xEDF]
quest:_wait(1.0)  [pc 7, 0xEEB]
quest:startNQCutScene('whm0j110', 1.0)  [pc 11, 0xEFB]
quest:startFadeInCutSceneDefault(player)  [pc 14, 0xF07]
return 
```

## processEventMoogleA02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xFD5]
eventOwner:_runCharaScheduler(70082560.0)  [pc 6, 0xFE1]
eventOwner:say(quest, 39.0, 0.0)  [pc 11, 0xFF5]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xFFD]
return 
```

## processEventMoogleB02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x10B7]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0x10C3]
eventOwner:say(quest, 40.0, 0.0)  [pc 11, 0x10D7]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x10DF]
return 
```

## processEventJob — 4 parameters
### Path 1

```text
worldMaster:say(quest, 38.0, 0.0)  [pc 5, 0x11A1]
quest:showGetJobItemWidget(player, arg4)  [pc 9, 0x11B1]
quest:_wait(6.0)  [pc 12, 0x11BD]
desktopWidget:openPublicInformLongDialogWidget(quest, 52.0)  [pc 17, 0x11D1]
quest:_wait(8.0)  [pc 20, 0x11DD]
return 
```

## processEventKokuti — 4 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27344.0, 1.0)  [pc 4, 0x12C2]
quest:_wait(6.0)  [pc 7, 0x12CE]
return 
```

## processEventStart_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111241.0, 23.0, 30.0, 3.0, 15.0)  [pc 9, 0x1365]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111241.0, 23.0)  [pc 6, 0x13FD]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111241.0, 23.0)  [pc 6, 0x147A]
return 
```

