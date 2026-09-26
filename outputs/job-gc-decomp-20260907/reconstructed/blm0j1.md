# 111261 blm0j1: reconstructed client path templates

## processEventYayakeStart — 4 parameters
### Path 1

```text
require (arg4 == 0.0) is true  [pc 5, 0x452]
require (call22.1.return1 == nil) is true  [pc 23, 0x49A]
require (1.0 == 0.0) is false  [pc 40, 0x4DE]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 9, 0x462]
eventOwner:say(quest, 51.0, 0.0)  [pc 14, 0x476]
call22.1.return1 = worldMaster:askRestrictChoices(quest, quest, 52.0, true, true)  [pc 22, 0x496]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x4B2]
eventOwner:say(quest, 55.0, 0.0)  [pc 34, 0x4C6]
eventOwner:finishCliantTalkTurn()  [pc 37, 0x4D2]
return 
```

### Path 2

```text
require (arg4 == 0.0) is true  [pc 5, 0x452]
require (call22.1.return1 == nil) is false  [pc 23, 0x49A]
require (call22.1.return1 == 2.0) is true  [pc 25, 0x4A2]
require (1.0 == 0.0) is false  [pc 40, 0x4DE]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 9, 0x462]
eventOwner:say(quest, 51.0, 0.0)  [pc 14, 0x476]
call22.1.return1 = worldMaster:askRestrictChoices(quest, quest, 52.0, true, true)  [pc 22, 0x496]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x4B2]
eventOwner:say(quest, 55.0, 0.0)  [pc 34, 0x4C6]
eventOwner:finishCliantTalkTurn()  [pc 37, 0x4D2]
return 
```

### Path 3

```text
require (arg4 == 0.0) is true  [pc 5, 0x452]
require (call22.1.return1 == nil) is false  [pc 23, 0x49A]
require (call22.1.return1 == 2.0) is false  [pc 25, 0x4A2]
require (0.0 == 0.0) is true  [pc 40, 0x4DE]
require (call124.1.return1 == 1.0) is true  [pc 125, 0x632]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 9, 0x462]
eventOwner:say(quest, 51.0, 0.0)  [pc 14, 0x476]
call22.1.return1 = worldMaster:askRestrictChoices(quest, quest, 52.0, true, true)  [pc 22, 0x496]
eventOwner:_runCharaScheduler(353964032.0)  [pc 44, 0x4EE]
eventOwner:say(quest, 2.0, 0.0)  [pc 49, 0x502]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x516]
eventOwner:_runCharaScheduler(354099200.0)  [pc 57, 0x522]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x536]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x542]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x556]
eventOwner:say(quest, 8.0, 0.0)  [pc 75, 0x56A]
eventOwner:_runCharaScheduler(354082816.0)  [pc 78, 0x576]
eventOwner:say(quest, 71.0, 0.0)  [pc 83, 0x58A]
eventOwner:say(quest, 72.0, 0.0)  [pc 88, 0x59E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 91, 0x5AA]
eventOwner:say(quest, 9.0, 0.0)  [pc 96, 0x5BE]
eventOwner:say(quest, 10.0, 0.0)  [pc 101, 0x5D2]
eventOwner:_runCharaScheduler(354099200.0)  [pc 104, 0x5DE]
eventOwner:say(quest, 70.0, 0.0)  [pc 109, 0x5F2]
eventOwner:say(quest, 73.0, 0.0)  [pc 114, 0x606]
eventOwner:_runCharaScheduler(353964032.0)  [pc 117, 0x612]
eventOwner:say(quest, 74.0, 0.0)  [pc 122, 0x626]
call124.1.return1 = quest:showQuestInfomation()  [pc 124, 0x62E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 129, 0x642]
eventOwner:say(quest, 13.0, 0.0)  [pc 134, 0x656]
eventOwner:_runCharaScheduler(354041856.0)  [pc 137, 0x662]
eventOwner:say(quest, 15.0, 0.0)  [pc 142, 0x676]
eventOwner:finishCliantTalkTurn()  [pc 158, 0x6B6]
return call124.1.return1
```

### Path 4

```text
require (arg4 == 0.0) is true  [pc 5, 0x452]
require (call22.1.return1 == nil) is false  [pc 23, 0x49A]
require (call22.1.return1 == 2.0) is false  [pc 25, 0x4A2]
require (0.0 == 0.0) is true  [pc 40, 0x4DE]
require (call124.1.return1 == 1.0) is false  [pc 125, 0x632]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 9, 0x462]
eventOwner:say(quest, 51.0, 0.0)  [pc 14, 0x476]
call22.1.return1 = worldMaster:askRestrictChoices(quest, quest, 52.0, true, true)  [pc 22, 0x496]
eventOwner:_runCharaScheduler(353964032.0)  [pc 44, 0x4EE]
eventOwner:say(quest, 2.0, 0.0)  [pc 49, 0x502]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x516]
eventOwner:_runCharaScheduler(354099200.0)  [pc 57, 0x522]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x536]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x542]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x556]
eventOwner:say(quest, 8.0, 0.0)  [pc 75, 0x56A]
eventOwner:_runCharaScheduler(354082816.0)  [pc 78, 0x576]
eventOwner:say(quest, 71.0, 0.0)  [pc 83, 0x58A]
eventOwner:say(quest, 72.0, 0.0)  [pc 88, 0x59E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 91, 0x5AA]
eventOwner:say(quest, 9.0, 0.0)  [pc 96, 0x5BE]
eventOwner:say(quest, 10.0, 0.0)  [pc 101, 0x5D2]
eventOwner:_runCharaScheduler(354099200.0)  [pc 104, 0x5DE]
eventOwner:say(quest, 70.0, 0.0)  [pc 109, 0x5F2]
eventOwner:say(quest, 73.0, 0.0)  [pc 114, 0x606]
eventOwner:_runCharaScheduler(353964032.0)  [pc 117, 0x612]
eventOwner:say(quest, 74.0, 0.0)  [pc 122, 0x626]
call124.1.return1 = quest:showQuestInfomation()  [pc 124, 0x62E]
eventOwner:_runCharaScheduler(354082816.0)  [pc 146, 0x686]
eventOwner:say(quest, 11.0, 0.0)  [pc 151, 0x69A]
eventOwner:say(quest, 12.0, 0.0)  [pc 156, 0x6AE]
eventOwner:finishCliantTalkTurn()  [pc 158, 0x6B6]
return call124.1.return1
```

### Path 5

```text
require (arg4 == 0.0) is false  [pc 5, 0x452]
require (0.0 == 0.0) is true  [pc 40, 0x4DE]
require (call124.1.return1 == 1.0) is true  [pc 125, 0x632]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353964032.0)  [pc 44, 0x4EE]
eventOwner:say(quest, 2.0, 0.0)  [pc 49, 0x502]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x516]
eventOwner:_runCharaScheduler(354099200.0)  [pc 57, 0x522]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x536]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x542]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x556]
eventOwner:say(quest, 8.0, 0.0)  [pc 75, 0x56A]
eventOwner:_runCharaScheduler(354082816.0)  [pc 78, 0x576]
eventOwner:say(quest, 71.0, 0.0)  [pc 83, 0x58A]
eventOwner:say(quest, 72.0, 0.0)  [pc 88, 0x59E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 91, 0x5AA]
eventOwner:say(quest, 9.0, 0.0)  [pc 96, 0x5BE]
eventOwner:say(quest, 10.0, 0.0)  [pc 101, 0x5D2]
eventOwner:_runCharaScheduler(354099200.0)  [pc 104, 0x5DE]
eventOwner:say(quest, 70.0, 0.0)  [pc 109, 0x5F2]
eventOwner:say(quest, 73.0, 0.0)  [pc 114, 0x606]
eventOwner:_runCharaScheduler(353964032.0)  [pc 117, 0x612]
eventOwner:say(quest, 74.0, 0.0)  [pc 122, 0x626]
call124.1.return1 = quest:showQuestInfomation()  [pc 124, 0x62E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 129, 0x642]
eventOwner:say(quest, 13.0, 0.0)  [pc 134, 0x656]
eventOwner:_runCharaScheduler(354041856.0)  [pc 137, 0x662]
eventOwner:say(quest, 15.0, 0.0)  [pc 142, 0x676]
eventOwner:finishCliantTalkTurn()  [pc 158, 0x6B6]
return call124.1.return1
```

### Path 6

```text
require (arg4 == 0.0) is false  [pc 5, 0x452]
require (0.0 == 0.0) is true  [pc 40, 0x4DE]
require (call124.1.return1 == 1.0) is false  [pc 125, 0x632]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x44A]
eventOwner:_runCharaScheduler(353964032.0)  [pc 44, 0x4EE]
eventOwner:say(quest, 2.0, 0.0)  [pc 49, 0x502]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x516]
eventOwner:_runCharaScheduler(354099200.0)  [pc 57, 0x522]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x536]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x542]
eventOwner:say(quest, 7.0, 0.0)  [pc 70, 0x556]
eventOwner:say(quest, 8.0, 0.0)  [pc 75, 0x56A]
eventOwner:_runCharaScheduler(354082816.0)  [pc 78, 0x576]
eventOwner:say(quest, 71.0, 0.0)  [pc 83, 0x58A]
eventOwner:say(quest, 72.0, 0.0)  [pc 88, 0x59E]
eventOwner:_runCharaScheduler(354103296.0)  [pc 91, 0x5AA]
eventOwner:say(quest, 9.0, 0.0)  [pc 96, 0x5BE]
eventOwner:say(quest, 10.0, 0.0)  [pc 101, 0x5D2]
eventOwner:_runCharaScheduler(354099200.0)  [pc 104, 0x5DE]
eventOwner:say(quest, 70.0, 0.0)  [pc 109, 0x5F2]
eventOwner:say(quest, 73.0, 0.0)  [pc 114, 0x606]
eventOwner:_runCharaScheduler(353964032.0)  [pc 117, 0x612]
eventOwner:say(quest, 74.0, 0.0)  [pc 122, 0x626]
call124.1.return1 = quest:showQuestInfomation()  [pc 124, 0x62E]
eventOwner:_runCharaScheduler(354082816.0)  [pc 146, 0x686]
eventOwner:say(quest, 11.0, 0.0)  [pc 151, 0x69A]
eventOwner:say(quest, 12.0, 0.0)  [pc 156, 0x6AE]
eventOwner:finishCliantTalkTurn()  [pc 158, 0x6B6]
return call124.1.return1
```

## processEventYayake000Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x880]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x88C]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0x8A0]
eventOwner:say(quest, 17.0, 0.0)  [pc 16, 0x8B4]
eventOwner:_runCharaScheduler(354041856.0)  [pc 19, 0x8C0]
eventOwner:say(quest, 18.0, 0.0)  [pc 24, 0x8D4]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x8DC]
return 
```

## processEventLalai000Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9AB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x9B7]
eventOwner:say(quest, 58.0, 0.0)  [pc 11, 0x9CB]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x9D3]
return 
```

## processEventKazaggchah000Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA87]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xA93]
eventOwner:say(quest, 59.0, 0.0)  [pc 11, 0xAA7]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xAAF]
return 
```

## processEventDozolmeloc000Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB63]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xB6F]
eventOwner:say(quest, 60.0, 0.0)  [pc 11, 0xB83]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xB8B]
return 
```

## processEventDaza000Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC3F]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xC4B]
eventOwner:say(quest, 61.0, 0.0)  [pc 11, 0xC5F]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC67]
return 
```

## processEventYayakeFollow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD1B]
eventOwner:finishCliantTalkTurn()  [pc 5, 0xD23]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD97]
quest:startNQCutScene('blm0j110', 1.0)  [pc 6, 0xDA7]
desktopWidget:openPublicInformDialogWidget(worldMaster, 25117.0, 11000556.0, 1.0)  [pc 13, 0xDC3]
worldMaster:notify(worldMaster, 25117.0, 11000556.0, 1.0)  [pc 20, 0xDDF]
quest:_wait(5.0)  [pc 23, 0xDEB]
quest:startFadeInCutSceneDefault(player)  [pc 26, 0xDF7]
return 
```

## processEventLalai010Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF18]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0xF24]
eventOwner:say(quest, 62.0, 0.0)  [pc 11, 0xF38]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF40]
return 
```

## processEventKazaggchah010Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFF4]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x1000]
eventOwner:say(quest, 63.0, 0.0)  [pc 11, 0x1014]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x101C]
return 
```

## processEventDozolmeloc010Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10D0]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x10DC]
eventOwner:say(quest, 64.0, 0.0)  [pc 11, 0x10F0]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x10F8]
return 
```

## processEventDaza010Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11AC]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x11B8]
eventOwner:say(quest, 65.0, 0.0)  [pc 11, 0x11CC]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x11D4]
return 
```

## processEvent020 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1284]
quest:startNQCutScene('blm0j120', 1.0)  [pc 6, 0x1294]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x12A0]
return 
```

## processEventClear — 4 parameters
### Path 1

```text
worldMaster:say(quest, 49.0, 0.0)  [pc 5, 0x1351]
quest:showGetJobItemWidget(player, arg4)  [pc 9, 0x1361]
quest:_wait(6.0)  [pc 12, 0x136D]
desktopWidget:openPublicInformLongDialogWidget(quest, 79.0)  [pc 17, 0x1381]
quest:_wait(8.0)  [pc 20, 0x138D]
quest:showGetJobAbilityWidget(player, 27305.0, 1.0)  [pc 25, 0x13A1]
quest:_wait(6.0)  [pc 28, 0x13AD]
return 
```

## processEventClearAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14BD]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x14C9]
eventOwner:say(quest, 67.0, 0.0)  [pc 11, 0x14DD]
eventOwner:say(quest, 68.0, 0.0)  [pc 16, 0x14F1]
worldMaster:say(quest, 69.0, 0.0)  [pc 22, 0x1509]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x1511]
return 
```

## processEvent_Yayake_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111261.0, 22.0, 30.0, 2.0, 15.0)  [pc 9, 0x1600]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111261.0, 22.0)  [pc 6, 0x1698]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111261.0, 22.0)  [pc 6, 0x1715]
return 
```

