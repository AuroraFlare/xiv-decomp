# 111801 com0u1: reconstructed client path templates

## processEventAUBREYStart — 3 parameters
### Path 1

```text
require (call46.1.return1 == 1.0) is true  [pc 47, 0x347]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x297]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2A3]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2B7]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2CB]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x2DF]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x2F3]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x2FF]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x313]
eventOwner:say(quest, 7.0, 0.0)  [pc 39, 0x327]
eventOwner:say(quest, 52.0, 0.0)  [pc 44, 0x33B]
call46.1.return1 = quest:showQuestInfomation()  [pc 46, 0x343]
eventOwner:_runCharaScheduler(354082816.0)  [pc 51, 0x357]
eventOwner:say(quest, 9.0, 0.0)  [pc 56, 0x36B]
eventOwner:finishCliantTalkTurn()  [pc 67, 0x397]
return call46.1.return1
```

### Path 2

```text
require (call46.1.return1 == 1.0) is false  [pc 47, 0x347]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x297]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2A3]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x2B7]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x2CB]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x2DF]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x2F3]
eventOwner:_runCharaScheduler(354041856.0)  [pc 29, 0x2FF]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x313]
eventOwner:say(quest, 7.0, 0.0)  [pc 39, 0x327]
eventOwner:say(quest, 52.0, 0.0)  [pc 44, 0x33B]
call46.1.return1 = quest:showQuestInfomation()  [pc 46, 0x343]
eventOwner:_runCharaScheduler(354082816.0)  [pc 60, 0x37B]
eventOwner:say(quest, 8.0, 0.0)  [pc 65, 0x38F]
eventOwner:finishCliantTalkTurn()  [pc 67, 0x397]
return call46.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x4C2]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x4CE]
eventOwner:say(quest, 49.0, 0.0)  [pc 11, 0x4E2]
eventOwner:say(quest, 53.0, 0.0)  [pc 16, 0x4F6]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x4FE]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5BB]
eventOwner:_runCharaScheduler(354078720.0)  [pc 6, 0x5C7]
eventOwner:say(quest, 10.0, 0.0)  [pc 11, 0x5DB]
eventOwner:say(quest, 11.0, 0.0)  [pc 16, 0x5EF]
eventOwner:say(quest, 12.0, 0.0)  [pc 21, 0x603]
eventOwner:_runCharaScheduler(354086912.0)  [pc 24, 0x60F]
quest:_wait(1.5)  [pc 27, 0x61B]
eventOwner:say(quest, 13.0, 0.0)  [pc 32, 0x62F]
eventOwner:say(quest, 14.0, 0.0)  [pc 37, 0x643]
eventOwner:say(quest, 15.0, 0.0)  [pc 42, 0x657]
eventOwner:say(quest, 54.0, 0.0)  [pc 47, 0x66B]
eventOwner:_runCharaScheduler(354103296.0)  [pc 50, 0x677]
eventOwner:say(quest, 16.0, 0.0)  [pc 55, 0x68B]
eventOwner:finishCliantTalkTurn()  [pc 57, 0x693]
return 
```

## processEvent_010_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7AC]
eventOwner:say(quest, 17.0, 0.0)  [pc 8, 0x7C0]
eventOwner:_runCharaScheduler(70823936.0)  [pc 11, 0x7CC]
eventOwner:say(quest, 18.0, 0.0)  [pc 16, 0x7E0]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x7E8]
return 
```

## processEvent_020 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x8B5]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x8A1]
quest:startNQCutScene('COM0U105', 2.0)  [pc 6, 0x8B1]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x8C5]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x8B5]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x8A1]
quest:startNQCutScene('COM0U105', 2.0)  [pc 6, 0x8B1]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x8D5]
return 
```

## processEvent_030 — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x99E]
quest:startNQCutScene('COM0U110', 1.0, 0.0, arg4)  [pc 8, 0x9B6]
quest:startFadeInCutSceneAfterWarp(player)  [pc 11, 0x9C2]
return 
```

## processEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA76]
eventOwner:say(quest, 40.0, 0.0)  [pc 8, 0xA8A]
quest:startFadeOut(player, 1.0)  [pc 12, 0xA9A]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 16, 0xAAA]
quest:_wait(2.0)  [pc 19, 0xAB6]
quest:startFadeIn(player, 1.0)  [pc 23, 0xAC6]
eventOwner:_runCharaScheduler(354058240.0)  [pc 26, 0xAD2]
eventOwner:say(quest, 41.0, 0.0)  [pc 31, 0xAE6]
eventOwner:say(quest, 42.0, 0.0)  [pc 36, 0xAFA]
eventOwner:say(quest, 43.0, 0.0)  [pc 41, 0xB0E]
eventOwner:say(quest, 44.0, 0.0)  [pc 46, 0xB22]
eventOwner:_runCharaScheduler(354107392.0)  [pc 49, 0xB2E]
eventOwner:say(quest, 45.0, 0.0)  [pc 54, 0xB42]
quest:_wait(2.0)  [pc 57, 0xB4E]
quest:startFadeOut(player, 1.0)  [pc 61, 0xB5E]
eventOwner:finishCliantTalkTurn()  [pc 63, 0xB66]
quest:_wait(2.0)  [pc 66, 0xB72]
quest:startFadeIn(player, 1.0)  [pc 70, 0xB82]
return 
```

## processEvent_040_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCA3]
eventOwner:_runCharaScheduler(354045952.0)  [pc 6, 0xCAF]
eventOwner:say(quest, 50.0, 0.0)  [pc 11, 0xCC3]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xCCB]
return 
```

## processEvent_050 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD7F]
eventOwner:say(quest, 46.0, 0.0)  [pc 8, 0xD93]
eventOwner:_runCharaScheduler(354123776.0)  [pc 11, 0xD9F]
quest:_wait(2.0)  [pc 14, 0xDAB]
quest:startFadeOut(player, 1.0)  [pc 18, 0xDBB]
quest:_wait(2.0)  [pc 21, 0xDC7]
quest:startFadeIn(player, 1.0)  [pc 25, 0xDD7]
eventOwner:say(quest, 47.0, 0.0)  [pc 30, 0xDEB]
eventOwner:_runCharaScheduler(354066432.0)  [pc 33, 0xDF7]
eventOwner:say(quest, 48.0, 0.0)  [pc 38, 0xE0B]
eventOwner:finishCliantTalkTurn()  [pc 40, 0xE13]
return 
```

