# 111401 com0l1: reconstructed client path templates

## processEventGUINCUMStart — 3 parameters
### Path 1

```text
require (call51.1.return1 == 1.0) is true  [pc 52, 0x35C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x298]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x2AC]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x2C0]
eventOwner:say(quest, 4.0, 0.0)  [pc 18, 0x2D4]
eventOwner:_runCharaScheduler(353964032.0)  [pc 21, 0x2E0]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x2F4]
eventOwner:say(quest, 6.0, 0.0)  [pc 31, 0x308]
eventOwner:say(quest, 52.0, 0.0)  [pc 36, 0x31C]
eventOwner:say(quest, 7.0, 0.0)  [pc 41, 0x330]
eventOwner:_runCharaScheduler(353959936.0)  [pc 44, 0x33C]
eventOwner:say(quest, 8.0, 0.0)  [pc 49, 0x350]
call51.1.return1 = quest:showQuestInfomation()  [pc 51, 0x358]
eventOwner:_runCharaScheduler(354103296.0)  [pc 56, 0x36C]
eventOwner:say(quest, 10.0, 0.0)  [pc 61, 0x380]
eventOwner:finishCliantTalkTurn()  [pc 72, 0x3AC]
return call51.1.return1
```

### Path 2

```text
require (call51.1.return1 == 1.0) is false  [pc 52, 0x35C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x298]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x2AC]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x2C0]
eventOwner:say(quest, 4.0, 0.0)  [pc 18, 0x2D4]
eventOwner:_runCharaScheduler(353964032.0)  [pc 21, 0x2E0]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x2F4]
eventOwner:say(quest, 6.0, 0.0)  [pc 31, 0x308]
eventOwner:say(quest, 52.0, 0.0)  [pc 36, 0x31C]
eventOwner:say(quest, 7.0, 0.0)  [pc 41, 0x330]
eventOwner:_runCharaScheduler(353959936.0)  [pc 44, 0x33C]
eventOwner:say(quest, 8.0, 0.0)  [pc 49, 0x350]
call51.1.return1 = quest:showQuestInfomation()  [pc 51, 0x358]
eventOwner:_runCharaScheduler(354099200.0)  [pc 65, 0x390]
eventOwner:say(quest, 9.0, 0.0)  [pc 70, 0x3A4]
eventOwner:finishCliantTalkTurn()  [pc 72, 0x3AC]
return call51.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x4E9]
eventOwner:say(quest, 49.0, 0.0)  [pc 8, 0x4FD]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x505]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x598]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x5A4]
eventOwner:say(quest, 11.0, 0.0)  [pc 11, 0x5B8]
eventOwner:say(quest, 53.0, 0.0)  [pc 16, 0x5CC]
eventOwner:_runCharaScheduler(354082816.0)  [pc 19, 0x5D8]
eventOwner:say(quest, 12.0, 0.0)  [pc 24, 0x5EC]
eventOwner:_runCharaScheduler(353959936.0)  [pc 27, 0x5F8]
eventOwner:say(quest, 13.0, 0.0)  [pc 32, 0x60C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 35, 0x618]
eventOwner:say(quest, 14.0, 0.0)  [pc 40, 0x62C]
eventOwner:_runCharaScheduler(354103296.0)  [pc 43, 0x638]
eventOwner:say(quest, 15.0, 0.0)  [pc 48, 0x64C]
eventOwner:_runCharaScheduler(353972224.0)  [pc 51, 0x658]
eventOwner:say(quest, 16.0, 0.0)  [pc 56, 0x66C]
eventOwner:say(quest, 59.0, 0.0)  [pc 61, 0x680]
eventOwner:_runCharaScheduler(354000896.0)  [pc 64, 0x68C]
eventOwner:say(quest, 17.0, 0.0)  [pc 69, 0x6A0]
eventOwner:_runCharaScheduler(353980416.0)  [pc 72, 0x6AC]
eventOwner:say(quest, 18.0, 0.0)  [pc 77, 0x6C0]
eventOwner:say(quest, 54.0, 0.0)  [pc 82, 0x6D4]
eventOwner:finishCliantTalkTurn()  [pc 84, 0x6DC]
return 
```

## processEvent_010_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x829]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x835]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0x849]
eventOwner:say(quest, 20.0, 0.0)  [pc 16, 0x85D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x865]
return 
```

## processEvent_020 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0x932]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x91E]
quest:startNQCutScene('COM0L105', 2.0)  [pc 6, 0x92E]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0x942]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0x932]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x91E]
quest:startNQCutScene('COM0L105', 2.0)  [pc 6, 0x92E]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0x952]
return 
```

## processEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA1F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xA2B]
eventOwner:say(quest, 41.0, 0.0)  [pc 11, 0xA3F]
quest:startFadeOut(player, 1.0)  [pc 15, 0xA4F]
quest:_wait(2.0)  [pc 18, 0xA5B]
quest:startFadeIn(player, 1.0)  [pc 22, 0xA6B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 25, 0xA77]
eventOwner:say(quest, 42.0, 0.0)  [pc 30, 0xA8B]
eventOwner:say(quest, 43.0, 0.0)  [pc 35, 0xA9F]
eventOwner:say(quest, 44.0, 0.0)  [pc 40, 0xAB3]
eventOwner:_runCharaScheduler(354107392.0)  [pc 43, 0xABF]
eventOwner:say(quest, 45.0, 0.0)  [pc 48, 0xAD3]
eventOwner:finishCliantTalkTurn()  [pc 50, 0xADB]
return 
```

## processEvent_040_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xBFC]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0xC08]
eventOwner:say(quest, 50.0, 0.0)  [pc 11, 0xC1C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC24]
return 
```

## processEvent_050 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCD8]
eventOwner:_runCharaScheduler(354115584.0)  [pc 6, 0xCE4]
eventOwner:say(quest, 46.0, 0.0)  [pc 11, 0xCF8]
quest:startFadeOut(player, 1.0)  [pc 15, 0xD08]
quest:_wait(2.0)  [pc 18, 0xD14]
quest:startFadeIn(player, 1.0)  [pc 22, 0xD24]
eventOwner:say(quest, 47.0, 0.0)  [pc 27, 0xD38]
eventOwner:_runCharaScheduler(354099200.0)  [pc 30, 0xD44]
eventOwner:say(quest, 48.0, 0.0)  [pc 35, 0xD58]
eventOwner:finishCliantTalkTurn()  [pc 37, 0xD60]
return 
```

## processEvent_030 — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xE62]
quest:startNQCutScene('COM0l110', 1.0, 0.0, arg4)  [pc 8, 0xE7A]
quest:startFadeInCutSceneAfterWarp(player)  [pc 11, 0xE86]
return 
```

