# 111221 mnk0j1: reconstructed client path templates

## processEventGAGARUNAStart — 5 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 48, 0x384]
require (call69.1.return1 == 1.0) is true  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 42.0, 0.0)  [pc 56, 0x3A4]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:_runCharaScheduler(353980416.0)  [pc 74, 0x3EC]
eventOwner:say(quest, 8.0, 0.0)  [pc 79, 0x400]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

### Path 2

```text
require (arg4 == true) is true  [pc 48, 0x384]
require (call69.1.return1 == 1.0) is false  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 42.0, 0.0)  [pc 56, 0x3A4]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:say(quest, 7.0, 0.0)  [pc 85, 0x418]
eventOwner:say(quest, 37.0, 0.0)  [pc 90, 0x42C]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

### Path 3

```text
require (arg4 == true) is false  [pc 48, 0x384]
require (arg5 == true) is true  [pc 50, 0x38C]
require (call69.1.return1 == 1.0) is true  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 42.0, 0.0)  [pc 56, 0x3A4]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:_runCharaScheduler(353980416.0)  [pc 74, 0x3EC]
eventOwner:say(quest, 8.0, 0.0)  [pc 79, 0x400]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

### Path 4

```text
require (arg4 == true) is false  [pc 48, 0x384]
require (arg5 == true) is true  [pc 50, 0x38C]
require (call69.1.return1 == 1.0) is false  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 42.0, 0.0)  [pc 56, 0x3A4]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:say(quest, 7.0, 0.0)  [pc 85, 0x418]
eventOwner:say(quest, 37.0, 0.0)  [pc 90, 0x42C]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

### Path 5

```text
require (arg4 == true) is false  [pc 48, 0x384]
require (arg5 == true) is false  [pc 50, 0x38C]
require (call69.1.return1 == 1.0) is true  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 6.0, 0.0)  [pc 62, 0x3BC]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:_runCharaScheduler(353980416.0)  [pc 74, 0x3EC]
eventOwner:say(quest, 8.0, 0.0)  [pc 79, 0x400]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

### Path 6

```text
require (arg4 == true) is false  [pc 48, 0x384]
require (arg5 == true) is false  [pc 50, 0x38C]
require (call69.1.return1 == 1.0) is false  [pc 70, 0x3DC]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x2DC]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2F0]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x304]
eventOwner:say(quest, 36.0, 0.0)  [pc 21, 0x318]
eventOwner:say(quest, 44.0, 0.0)  [pc 26, 0x32C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x338]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x34C]
eventOwner:say(quest, 45.0, 0.0)  [pc 39, 0x360]
eventOwner:say(quest, 5.0, 0.0)  [pc 44, 0x374]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x380]
eventOwner:say(quest, 6.0, 0.0)  [pc 62, 0x3BC]
eventOwner:say(quest, 46.0, 0.0)  [pc 67, 0x3D0]
call69.1.return1 = quest:showQuestInfomation()  [pc 69, 0x3D8]
eventOwner:say(quest, 7.0, 0.0)  [pc 85, 0x418]
eventOwner:say(quest, 37.0, 0.0)  [pc 90, 0x42C]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x434]
return call69.1.return1
```

## processEvent000_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x58E]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0x59A]
eventOwner:say(quest, 9.0, 0.0)  [pc 11, 0x5AE]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x5B6]
return 
```

## processEvent005 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x66A]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x676]
eventOwner:say(quest, 10.0, 0.0)  [pc 11, 0x68A]
eventOwner:say(quest, 11.0, 0.0)  [pc 16, 0x69E]
eventOwner:say(quest, 47.0, 0.0)  [pc 21, 0x6B2]
eventOwner:say(quest, 12.0, 0.0)  [pc 26, 0x6C6]
eventOwner:say(quest, 48.0, 0.0)  [pc 31, 0x6DA]
eventOwner:say(quest, 49.0, 0.0)  [pc 36, 0x6EE]
eventOwner:say(quest, 50.0, 0.0)  [pc 41, 0x702]
eventOwner:_runCharaScheduler(354099200.0)  [pc 44, 0x70E]
eventOwner:say(quest, 13.0, 0.0)  [pc 49, 0x722]
eventOwner:say(quest, 51.0, 0.0)  [pc 54, 0x736]
eventOwner:say(quest, 52.0, 0.0)  [pc 59, 0x74A]
eventOwner:say(quest, 14.0, 0.0)  [pc 64, 0x75E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 67, 0x76A]
eventOwner:say(quest, 15.0, 0.0)  [pc 72, 0x77E]
eventOwner:say(quest, 38.0, 0.0)  [pc 77, 0x792]
eventOwner:say(quest, 16.0, 0.0)  [pc 82, 0x7A6]
eventOwner:say(quest, 39.0, 0.0)  [pc 87, 0x7BA]
eventOwner:_runCharaScheduler(354004992.0)  [pc 90, 0x7C6]
eventOwner:say(quest, 17.0, 0.0)  [pc 95, 0x7DA]
eventOwner:say(quest, 18.0, 0.0)  [pc 100, 0x7EE]
eventOwner:_runCharaScheduler(354000896.0)  [pc 103, 0x7FA]
eventOwner:say(quest, 19.0, 0.0)  [pc 108, 0x80E]
eventOwner:say(quest, 60.0, 0.0)  [pc 113, 0x822]
eventOwner:say(quest, 43.0, 0.0)  [pc 118, 0x836]
eventOwner:finishCliantTalkTurn()  [pc 120, 0x83E]
return 
```

## processEvent005_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9B8]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x9C4]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0x9D8]
eventOwner:say(quest, 40.0, 0.0)  [pc 16, 0x9EC]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x9F4]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xAAD]
quest:startNQCutScene('mnk0j110', 1.0)  [pc 6, 0xABD]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xAC9]
return 
```

## processEvent010_2_system — 4 parameters
### Path 1

```text
worldMaster:say(quest, 35.0)  [pc 4, 0xB76]
quest:showGetJobItemWidget(player, arg4)  [pc 8, 0xB86]
quest:_wait(6.0)  [pc 11, 0xB92]
return 
```

## processEvent010_3_system — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 59.0)  [pc 4, 0xC23]
quest:_wait(8.0)  [pc 7, 0xC2F]
quest:showGetJobAbilityWidget(player, 27108.0, 1.0)  [pc 12, 0xC43]
quest:_wait(6.0)  [pc 15, 0xC4F]
return 
```

## processEventStart_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111221.0, 2.0, 30.0, 8.0, 15.0)  [pc 9, 0xD31]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111221.0, 2.0)  [pc 6, 0xDC9]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111221.0, 2.0)  [pc 6, 0xE46]
return 
```

