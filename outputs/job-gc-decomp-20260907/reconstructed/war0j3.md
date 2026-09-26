# 111203 war0j3: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x27C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x288]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x29C]
worldMaster:say(quest, 3.0, 0.0)  [pc 17, 0x2B4]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x2BC]
return 
```

## processEventCURIOUSGORGEStart — 3 parameters
### Path 1

```text
require (call72.1.return1 == 1.0) is true  [pc 73, 0x499]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x381]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x38D]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x3A1]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x3B5]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x3C9]
eventOwner:_runCharaScheduler(67825664.0)  [pc 24, 0x3D5]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x3E9]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x3FD]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x411]
eventOwner:_runCharaScheduler(354066432.0)  [pc 42, 0x41D]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x431]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x445]
eventOwner:_runCharaScheduler(353964032.0)  [pc 55, 0x451]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x465]
eventOwner:say(quest, 30.0, 0.0)  [pc 65, 0x479]
eventOwner:say(quest, 13.0, 0.0)  [pc 70, 0x48D]
call72.1.return1 = quest:showQuestInfomation()  [pc 72, 0x495]
eventOwner:_runCharaScheduler(354099200.0)  [pc 77, 0x4A9]
eventOwner:say(quest, 15.0, 0.0)  [pc 82, 0x4BD]
eventOwner:finishCliantTalkTurn()  [pc 93, 0x4E9]
return call72.1.return1
```

### Path 2

```text
require (call72.1.return1 == 1.0) is false  [pc 73, 0x499]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x381]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x38D]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x3A1]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x3B5]
eventOwner:say(quest, 6.0, 0.0)  [pc 21, 0x3C9]
eventOwner:_runCharaScheduler(67825664.0)  [pc 24, 0x3D5]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x3E9]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x3FD]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x411]
eventOwner:_runCharaScheduler(354066432.0)  [pc 42, 0x41D]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x431]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x445]
eventOwner:_runCharaScheduler(353964032.0)  [pc 55, 0x451]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x465]
eventOwner:say(quest, 30.0, 0.0)  [pc 65, 0x479]
eventOwner:say(quest, 13.0, 0.0)  [pc 70, 0x48D]
call72.1.return1 = quest:showQuestInfomation()  [pc 72, 0x495]
eventOwner:_runCharaScheduler(354041856.0)  [pc 86, 0x4CD]
eventOwner:say(quest, 14.0, 0.0)  [pc 91, 0x4E1]
eventOwner:finishCliantTalkTurn()  [pc 93, 0x4E9]
return call72.1.return1
```

## processEvent000_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x65C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x668]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0x67C]
eventOwner:say(quest, 31.0, 0.0)  [pc 16, 0x690]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x698]
return 
```

## processEvent005 — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x751]
quest:startNQCutScene('war0j310', 1.0, 0.0, arg4)  [pc 8, 0x769]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x775]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x827]
eventOwner:say(quest, 21.0, 0.0)  [pc 8, 0x83B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 11, 0x847]
eventOwner:say(quest, 22.0, 0.0)  [pc 16, 0x85B]
eventOwner:say(quest, 32.0, 0.0)  [pc 21, 0x86F]
eventOwner:say(quest, 23.0, 0.0)  [pc 26, 0x883]
eventOwner:_runCharaScheduler(353959936.0)  [pc 29, 0x88F]
eventOwner:say(quest, 24.0, 0.0)  [pc 34, 0x8A3]
quest:startFadeOut(player, 1.0)  [pc 38, 0x8B3]
quest:_wait(2.0)  [pc 41, 0x8BF]
quest:startFadeIn(player, 1.0)  [pc 45, 0x8CF]
eventOwner:_runCharaScheduler(354086912.0)  [pc 48, 0x8DB]
eventOwner:say(quest, 26.0, 0.0)  [pc 53, 0x8EF]
eventOwner:say(quest, 27.0, 0.0)  [pc 58, 0x903]
eventOwner:_runCharaScheduler(353964032.0)  [pc 61, 0x90F]
eventOwner:say(quest, 28.0, 0.0)  [pc 66, 0x923]
worldMaster:say(quest, 29.0, 0.0)  [pc 72, 0x93B]
eventOwner:finishCliantTalkTurn()  [pc 74, 0x943]
return 
```

## processEventKokuti — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 34.0)  [pc 4, 0xA9D]
quest:_wait(8.0)  [pc 7, 0xAA9]
quest:showGetJobAbilityWidget(player, 27188.0, 1.0)  [pc 12, 0xABD]
quest:_wait(6.0)  [pc 15, 0xAC9]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111203.0, 17.0)  [pc 6, 0xB9F]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111203.0, 17.0)  [pc 6, 0xC1C]
return 
```

