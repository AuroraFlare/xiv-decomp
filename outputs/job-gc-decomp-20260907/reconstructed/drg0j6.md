# 111326 drg0j6: reconstructed client path templates

## processEventALBERICHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2BA]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x2C6]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0x2DA]
eventOwner:say(quest, 37.0, 0.0)  [pc 16, 0x2EE]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x2F6]
eventOwner:say(quest, 38.0, 0.0)  [pc 23, 0x30A]
worldMaster:say(quest, 39.0, 0.0)  [pc 29, 0x322]
return 
```

## processEventALBERICStart — 3 parameters
### Path 1

```text
require (call17.1.return1 == 1.0) is true  [pc 22, 0x44E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x402]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x416]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x41E]
eventOwner:say(quest, 3.0, 0.0)  [pc 15, 0x432]
call17.1.return1 = quest:showQuestInfomation()  [pc 17, 0x43A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 21, 0x44A]
eventOwner:say(quest, 5.0, 0.0)  [pc 28, 0x466]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x486]
return call17.1.return1
```

### Path 2

```text
require (call17.1.return1 == 1.0) is false  [pc 22, 0x44E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x402]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x416]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x41E]
eventOwner:say(quest, 3.0, 0.0)  [pc 15, 0x432]
call17.1.return1 = quest:showQuestInfomation()  [pc 17, 0x43A]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 21, 0x44A]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x47E]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x486]
return call17.1.return1
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x551]
eventOwner:_runCharaScheduler(354000896.0)  [pc 6, 0x55D]
eventOwner:say(quest, 6.0, 0.0)  [pc 11, 0x571]
eventOwner:say(quest, 24.0, 0.0)  [pc 16, 0x585]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x58D]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x646]
quest:startNQCutScene('Drg0j610', 1.0)  [pc 6, 0x656]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x662]
return 
```

## processEvent015 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x70B]
eventOwner:finishCliantTalkTurn()  [pc 5, 0x713]
return 
```

## processEvent020 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x787]
quest:startNQCutScene('Drg0j620', 1.0)  [pc 6, 0x797]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0x7A3]
return 
```

## processEvent025 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x84A]
quest:startNQCutScene('Drg0j620', 1.0)  [pc 6, 0x85A]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x866]
return 
```

## processEvent030 — 3 parameters
### Path 1

```text
eventOwner:say(quest, 26.0, 0.0)  [pc 4, 0x913]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 8, 0x923]
eventOwner:_runCharaScheduler(353959936.0)  [pc 11, 0x92F]
eventOwner:say(quest, 27.0, 0.0)  [pc 16, 0x943]
eventOwner:say(quest, 28.0, 0.0)  [pc 21, 0x957]
desktopWidget:openPublicInformLongDialogWidget(quest, 43.0)  [pc 26, 0x96B]
quest:_wait(8.0)  [pc 29, 0x977]
quest:showGetJobAbilityWidget(player, 27268.0, 1.0)  [pc 34, 0x98B]
quest:_wait(6.0)  [pc 37, 0x997]
quest:showGetJobItemWidget(player, 8032704.0)  [pc 41, 0x9A7]
quest:_wait(6.0)  [pc 44, 0x9B3]
eventOwner:_runCharaScheduler(69193728.0)  [pc 47, 0x9BF]
quest:_wait(1.0)  [pc 50, 0x9CB]
eventOwner:say(quest, 42.0, 0.0)  [pc 55, 0x9DF]
eventOwner:say(quest, 29.0, 0.0)  [pc 60, 0x9F3]
eventOwner:finishCliantTalkTurn()  [pc 62, 0x9FB]
eventOwner:_runCharaScheduler(354086912.0)  [pc 65, 0xA07]
quest:_wait(4.0)  [pc 68, 0xA13]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 72, 0xA23]
eventOwner:say(quest, 30.0, 0.0)  [pc 77, 0xA37]
eventOwner:say(quest, 31.0, 0.0)  [pc 82, 0xA4B]
eventOwner:say(quest, 32.0, 0.0)  [pc 87, 0xA5F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 90, 0xA6B]
eventOwner:say(quest, 33.0, 0.0)  [pc 95, 0xA7F]
quest:_wait(1.0)  [pc 98, 0xA8B]
eventOwner:finishCliantTalkTurn(2.0, player)  [pc 102, 0xA9B]
quest:_wait(1.5)  [pc 105, 0xAA7]
eventOwner:say(quest, 34.0, 0.0)  [pc 110, 0xABB]
eventOwner:say(quest, 35.0, 0.0)  [pc 115, 0xACF]
eventOwner:finishCliantTalkTurn()  [pc 117, 0xAD7]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111326.0, 19.0)  [pc 6, 0xCCF]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111326.0, 19.0)  [pc 6, 0xD4C]
return 
```

