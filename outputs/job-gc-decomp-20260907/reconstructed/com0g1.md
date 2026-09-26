# 111601 com0g1: reconstructed client path templates

## processEventStart — 3 parameters
### Path 1

```text
require (call64.1.return1 == 1.0) is true  [pc 65, 0x3B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2BC]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x2C8]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2DC]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2F0]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x304]
eventOwner:_runCharaScheduler(353964032.0)  [pc 24, 0x310]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x324]
eventOwner:say(quest, 52.0, 0.0)  [pc 34, 0x338]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x34C]
eventOwner:say(quest, 53.0, 0.0)  [pc 44, 0x360]
eventOwner:_runCharaScheduler(353959936.0)  [pc 47, 0x36C]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x380]
eventOwner:say(quest, 54.0, 0.0)  [pc 57, 0x394]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3A8]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x3B0]
eventOwner:say(quest, 10.0, 0.0)  [pc 71, 0x3CC]
eventOwner:finishCliantTalkTurn()  [pc 73, 0x3D4]
return call64.1.return1
```

### Path 2

```text
require (call64.1.return1 == 1.0) is false  [pc 65, 0x3B4]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2BC]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x2C8]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2DC]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2F0]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x304]
eventOwner:_runCharaScheduler(353964032.0)  [pc 24, 0x310]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x324]
eventOwner:say(quest, 52.0, 0.0)  [pc 34, 0x338]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x34C]
eventOwner:say(quest, 53.0, 0.0)  [pc 44, 0x360]
eventOwner:_runCharaScheduler(353959936.0)  [pc 47, 0x36C]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x380]
eventOwner:say(quest, 54.0, 0.0)  [pc 57, 0x394]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3A8]
call64.1.return1 = quest:showQuestInfomation()  [pc 64, 0x3B0]
eventOwner:say(quest, 9.0, 0.0)  [pc 80, 0x3F0]
eventOwner:finishCliantTalkTurn()  [pc 82, 0x3F8]
return call64.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x53E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x54A]
eventOwner:say(quest, 49.0, 0.0)  [pc 11, 0x55E]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x566]
return 
```

## processEventAilithShiren — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x61E]
eventOwner:_runCharaScheduler(67805184.0)  [pc 6, 0x62A]
eventOwner:say(quest, 11.0, 0.0)  [pc 11, 0x63E]
eventOwner:say(quest, 55.0, 0.0)  [pc 16, 0x652]
eventOwner:say(quest, 12.0, 0.0)  [pc 21, 0x666]
eventOwner:say(quest, 13.0, 0.0)  [pc 26, 0x67A]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x686]
eventOwner:say(quest, 14.0, 0.0)  [pc 34, 0x69A]
eventOwner:say(quest, 15.0, 0.0)  [pc 39, 0x6AE]
eventOwner:say(quest, 16.0, 0.0)  [pc 44, 0x6C2]
eventOwner:_runCharaScheduler(353959936.0)  [pc 47, 0x6CE]
eventOwner:say(quest, 17.0, 0.0)  [pc 52, 0x6E2]
eventOwner:say(quest, 57.0, 0.0)  [pc 57, 0x6F6]
eventOwner:say(quest, 18.0, 0.0)  [pc 62, 0x70A]
eventOwner:finishCliantTalkTurn()  [pc 64, 0x712]
return 
```

## processEventAilithShirenFree — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x82D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x839]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0x84D]
eventOwner:say(quest, 20.0, 0.0)  [pc 16, 0x861]
eventOwner:say(quest, 56.0, 0.0)  [pc 21, 0x875]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x87D]
return 
```

## processEventUrianger — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x957]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x943]
quest:startNQCutScene('COM0G105', 2.0)  [pc 6, 0x953]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x967]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x957]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x943]
quest:startNQCutScene('COM0G105', 2.0)  [pc 6, 0x953]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x977]
return 
```

## processEventUriangerMore — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xA44]
quest:startNQCutScene('COM0G110', 1.0, 0.0, arg4)  [pc 8, 0xA5C]
quest:startFadeInCutSceneAfterWarp(player)  [pc 11, 0xA68]
return 
```

## processEventAilith — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB20]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xB2C]
eventOwner:say(quest, 41.0, 0.0)  [pc 11, 0xB40]
quest:startFadeOut(player, 1.5)  [pc 15, 0xB50]
quest:_wait(1.5)  [pc 18, 0xB5C]
quest:startFadeIn(player, 1.5)  [pc 22, 0xB6C]
eventOwner:_runCharaScheduler(354086912.0)  [pc 25, 0xB78]
eventOwner:say(quest, 42.0, 0.0)  [pc 30, 0xB8C]
eventOwner:say(quest, 43.0, 0.0)  [pc 35, 0xBA0]
eventOwner:say(quest, 44.0, 0.0)  [pc 40, 0xBB4]
eventOwner:say(quest, 58.0, 0.0)  [pc 45, 0xBC8]
player:_runCharaScheduler(354111488.0)  [pc 48, 0xBD4]
eventOwner:_runCharaScheduler(354107392.0)  [pc 51, 0xBE0]
quest:_wait(2.5)  [pc 54, 0xBEC]
eventOwner:say(quest, 45.0, 0.0)  [pc 59, 0xC00]
eventOwner:finishCliantTalkTurn()  [pc 61, 0xC08]
return 
```

## processEventAilithFree — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD48]
eventOwner:_runCharaScheduler(67727360.0)  [pc 6, 0xD54]
eventOwner:say(quest, 50.0, 0.0)  [pc 11, 0xD68]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD70]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE28]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0xE34]
eventOwner:say(quest, 46.0, 0.0)  [pc 11, 0xE48]
quest:startFadeOut(player, 1.5)  [pc 15, 0xE58]
quest:_wait(1.5)  [pc 18, 0xE64]
quest:startFadeIn(player, 1.5)  [pc 22, 0xE74]
eventOwner:say(quest, 47.0, 0.0)  [pc 27, 0xE88]
eventOwner:say(quest, 48.0, 0.0)  [pc 32, 0xE9C]
eventOwner:finishCliantTalkTurn()  [pc 34, 0xEA4]
return 
```

