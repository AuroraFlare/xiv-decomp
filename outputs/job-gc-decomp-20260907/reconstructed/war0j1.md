# 111201 war0j1: reconstructed client path templates

## processEventStart — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 7, 0x2DF]
require (call77.1.return1 == 1.0) is true  [pc 78, 0x3FB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CF]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0x2DB]
eventOwner:say(quest, 2.0, 0.0)  [pc 13, 0x2F7]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x323]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x337]
eventOwner:say(quest, 37.0, 0.0)  [pc 34, 0x34B]
eventOwner:_runCharaScheduler(354234368.0)  [pc 37, 0x357]
eventOwner:say(quest, 5.0, 0.0)  [pc 42, 0x36B]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x37F]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x393]
eventOwner:say(quest, 38.0, 0.0)  [pc 57, 0x3A7]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3BB]
eventOwner:_runCharaScheduler(354234368.0)  [pc 65, 0x3C7]
eventOwner:say(quest, 9.0, 0.0)  [pc 70, 0x3DB]
eventOwner:say(quest, 10.0, 0.0)  [pc 75, 0x3EF]
call77.1.return1 = quest:showQuestInfomation()  [pc 77, 0x3F7]
eventOwner:say(quest, 12.0, 0.0)  [pc 84, 0x413]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41B]
return call77.1.return1
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 7, 0x2DF]
require (call77.1.return1 == 1.0) is false  [pc 78, 0x3FB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CF]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0x2DB]
eventOwner:say(quest, 2.0, 0.0)  [pc 13, 0x2F7]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x323]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x337]
eventOwner:say(quest, 37.0, 0.0)  [pc 34, 0x34B]
eventOwner:_runCharaScheduler(354234368.0)  [pc 37, 0x357]
eventOwner:say(quest, 5.0, 0.0)  [pc 42, 0x36B]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x37F]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x393]
eventOwner:say(quest, 38.0, 0.0)  [pc 57, 0x3A7]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3BB]
eventOwner:_runCharaScheduler(354234368.0)  [pc 65, 0x3C7]
eventOwner:say(quest, 9.0, 0.0)  [pc 70, 0x3DB]
eventOwner:say(quest, 10.0, 0.0)  [pc 75, 0x3EF]
call77.1.return1 = quest:showQuestInfomation()  [pc 77, 0x3F7]
eventOwner:say(quest, 11.0, 0.0)  [pc 93, 0x437]
eventOwner:finishCliantTalkTurn()  [pc 95, 0x43F]
return call77.1.return1
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 7, 0x2DF]
require (call77.1.return1 == 1.0) is true  [pc 78, 0x3FB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CF]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0x2DB]
eventOwner:say(quest, 39.0, 0.0)  [pc 19, 0x30F]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x323]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x337]
eventOwner:say(quest, 37.0, 0.0)  [pc 34, 0x34B]
eventOwner:_runCharaScheduler(354234368.0)  [pc 37, 0x357]
eventOwner:say(quest, 5.0, 0.0)  [pc 42, 0x36B]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x37F]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x393]
eventOwner:say(quest, 38.0, 0.0)  [pc 57, 0x3A7]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3BB]
eventOwner:_runCharaScheduler(354234368.0)  [pc 65, 0x3C7]
eventOwner:say(quest, 9.0, 0.0)  [pc 70, 0x3DB]
eventOwner:say(quest, 10.0, 0.0)  [pc 75, 0x3EF]
call77.1.return1 = quest:showQuestInfomation()  [pc 77, 0x3F7]
eventOwner:say(quest, 12.0, 0.0)  [pc 84, 0x413]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x41B]
return call77.1.return1
```

### Path 4

```text
require (arg4 == 1.0) is false  [pc 7, 0x2DF]
require (call77.1.return1 == 1.0) is false  [pc 78, 0x3FB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2CF]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0x2DB]
eventOwner:say(quest, 39.0, 0.0)  [pc 19, 0x30F]
eventOwner:say(quest, 3.0, 0.0)  [pc 24, 0x323]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x337]
eventOwner:say(quest, 37.0, 0.0)  [pc 34, 0x34B]
eventOwner:_runCharaScheduler(354234368.0)  [pc 37, 0x357]
eventOwner:say(quest, 5.0, 0.0)  [pc 42, 0x36B]
eventOwner:say(quest, 6.0, 0.0)  [pc 47, 0x37F]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x393]
eventOwner:say(quest, 38.0, 0.0)  [pc 57, 0x3A7]
eventOwner:say(quest, 8.0, 0.0)  [pc 62, 0x3BB]
eventOwner:_runCharaScheduler(354234368.0)  [pc 65, 0x3C7]
eventOwner:say(quest, 9.0, 0.0)  [pc 70, 0x3DB]
eventOwner:say(quest, 10.0, 0.0)  [pc 75, 0x3EF]
call77.1.return1 = quest:showQuestInfomation()  [pc 77, 0x3F7]
eventOwner:say(quest, 11.0, 0.0)  [pc 93, 0x437]
eventOwner:finishCliantTalkTurn()  [pc 95, 0x43F]
return call77.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x585]
eventOwner:say(quest, 13.0, 0.0)  [pc 8, 0x599]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x5A1]
return 
```

## processEventCurious — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x634]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x640]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0x654]
eventOwner:say(quest, 15.0, 0.0)  [pc 16, 0x668]
eventOwner:_runCharaScheduler(83914752.0)  [pc 19, 0x674]
quest:_wait(1.5)  [pc 22, 0x680]
eventOwner:say(quest, 16.0, 0.0)  [pc 27, 0x694]
eventOwner:_runCharaScheduler(354066432.0)  [pc 30, 0x6A0]
eventOwner:say(quest, 17.0, 0.0)  [pc 35, 0x6B4]
eventOwner:say(quest, 18.0, 0.0)  [pc 40, 0x6C8]
eventOwner:_runCharaScheduler(354099200.0)  [pc 43, 0x6D4]
eventOwner:say(quest, 19.0, 0.0)  [pc 48, 0x6E8]
eventOwner:say(quest, 40.0, 0.0)  [pc 53, 0x6FC]
eventOwner:say(quest, 20.0, 0.0)  [pc 58, 0x710]
eventOwner:_runCharaScheduler(353968128.0)  [pc 61, 0x71C]
eventOwner:say(quest, 34.0, 0.0)  [pc 66, 0x730]
eventOwner:finishCliantTalkTurn()  [pc 68, 0x738]
return 
```

## processEventCuriousAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x86C]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x878]
eventOwner:say(quest, 21.0, 0.0)  [pc 11, 0x88C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x894]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x948]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x954]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0x968]
player:_runCharaScheduler(354111488.0)  [pc 14, 0x974]
eventOwner:_runCharaScheduler(354107392.0)  [pc 17, 0x980]
eventOwner:say(quest, 23.0, 0.0)  [pc 22, 0x994]
eventOwner:say(quest, 24.0, 0.0)  [pc 27, 0x9A8]
eventOwner:_runCharaScheduler(353976320.0)  [pc 30, 0x9B4]
eventOwner:say(quest, 26.0, 0.0)  [pc 35, 0x9C8]
eventOwner:say(quest, 27.0, 0.0)  [pc 40, 0x9DC]
eventOwner:say(quest, 28.0, 0.0)  [pc 45, 0x9F0]
eventOwner:_runCharaScheduler(354041856.0)  [pc 48, 0x9FC]
eventOwner:say(quest, 29.0, 0.0)  [pc 53, 0xA10]
eventOwner:say(quest, 30.0, 0.0)  [pc 58, 0xA24]
eventOwner:_runCharaScheduler(353968128.0)  [pc 61, 0xA30]
eventOwner:say(quest, 31.0, 0.0)  [pc 66, 0xA44]
eventOwner:say(quest, 32.0, 0.0)  [pc 71, 0xA58]
eventOwner:say(quest, 41.0, 0.0)  [pc 76, 0xA6C]
eventOwner:finishCliantTalkTurn()  [pc 78, 0xA74]
worldMaster:say(quest, 33.0, 0.0)  [pc 84, 0xA8C]
return 
```

## processEventClearAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xBE1]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0xBED]
eventOwner:say(quest, 35.0, 0.0)  [pc 11, 0xC01]
eventOwner:say(quest, 36.0, 0.0)  [pc 16, 0xC15]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xC1D]
return 
```

## processEventJob — 4 parameters
### Path 1

```text
quest:showGetJobItemWidget(player, arg4)  [pc 3, 0xCDA]
quest:_wait(6.0)  [pc 6, 0xCE6]
desktopWidget:openPublicInformLongDialogWidget(quest, 42.0)  [pc 11, 0xCFA]
quest:_wait(8.0)  [pc 14, 0xD06]
quest:showGetJobAbilityWidget(player, 27186.0, 1.0)  [pc 19, 0xD1A]
quest:_wait(6.0)  [pc 22, 0xD26]
return 
```

## processEventStart_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111201.0, 4.0, 30.0, 3.0, 15.0)  [pc 9, 0xE22]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111201.0, 4.0)  [pc 6, 0xEBA]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111201.0, 4.0)  [pc 6, 0xF37]
return 
```

