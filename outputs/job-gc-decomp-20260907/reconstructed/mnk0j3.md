# 111223 mnk0j3: reconstructed client path templates

## processEventStartBefore — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x327]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x333]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x347]
eventOwner:say(quest, 4.0, 0.0)  [pc 16, 0x35B]
worldMaster:say(quest, 5.0, 0.0)  [pc 22, 0x373]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x37B]
return 
```

## processEventWidargeltHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x452]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x45E]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x472]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x47A]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call88.1.return1 == 1.0) is true  [pc 89, 0x67D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x525]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x531]
eventOwner:say(quest, 6.0, 0.0)  [pc 11, 0x545]
eventOwner:say(quest, 7.0, 0.0)  [pc 16, 0x559]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x565]
eventOwner:say(quest, 8.0, 0.0)  [pc 24, 0x579]
eventOwner:say(quest, 60.0, 0.0)  [pc 29, 0x58D]
eventOwner:say(quest, 9.0, 0.0)  [pc 34, 0x5A1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x5AD]
eventOwner:say(quest, 78.0, 0.0)  [pc 42, 0x5C1]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x5D5]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x5E9]
eventOwner:_runCharaScheduler(353972224.0)  [pc 55, 0x5F5]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x609]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x61D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 68, 0x629]
eventOwner:say(quest, 61.0, 0.0)  [pc 73, 0x63D]
eventOwner:say(quest, 65.0, 0.0)  [pc 78, 0x651]
eventOwner:_runCharaScheduler(353968128.0)  [pc 81, 0x65D]
eventOwner:say(quest, 13.0, 0.0)  [pc 86, 0x671]
call88.1.return1 = quest:showQuestInfomation()  [pc 88, 0x679]
eventOwner:_runCharaScheduler(353964032.0)  [pc 93, 0x68D]
eventOwner:say(quest, 62.0, 0.0)  [pc 98, 0x6A1]
eventOwner:finishCliantTalkTurn()  [pc 100, 0x6A9]
return call88.1.return1
```

### Path 2

```text
require (call88.1.return1 == 1.0) is false  [pc 89, 0x67D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x525]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x531]
eventOwner:say(quest, 6.0, 0.0)  [pc 11, 0x545]
eventOwner:say(quest, 7.0, 0.0)  [pc 16, 0x559]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x565]
eventOwner:say(quest, 8.0, 0.0)  [pc 24, 0x579]
eventOwner:say(quest, 60.0, 0.0)  [pc 29, 0x58D]
eventOwner:say(quest, 9.0, 0.0)  [pc 34, 0x5A1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x5AD]
eventOwner:say(quest, 78.0, 0.0)  [pc 42, 0x5C1]
eventOwner:say(quest, 10.0, 0.0)  [pc 47, 0x5D5]
eventOwner:say(quest, 11.0, 0.0)  [pc 52, 0x5E9]
eventOwner:_runCharaScheduler(353972224.0)  [pc 55, 0x5F5]
eventOwner:say(quest, 12.0, 0.0)  [pc 60, 0x609]
eventOwner:say(quest, 64.0, 0.0)  [pc 65, 0x61D]
eventOwner:_runCharaScheduler(354103296.0)  [pc 68, 0x629]
eventOwner:say(quest, 61.0, 0.0)  [pc 73, 0x63D]
eventOwner:say(quest, 65.0, 0.0)  [pc 78, 0x651]
eventOwner:_runCharaScheduler(353968128.0)  [pc 81, 0x65D]
eventOwner:say(quest, 13.0, 0.0)  [pc 86, 0x671]
call88.1.return1 = quest:showQuestInfomation()  [pc 88, 0x679]
eventOwner:_runCharaScheduler(354041856.0)  [pc 105, 0x6BD]
eventOwner:say(quest, 15.0, 0.0)  [pc 110, 0x6D1]
eventOwner:finishCliantTalkTurn()  [pc 112, 0x6D9]
return call88.1.return1
```

## processEventAfterTolk01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x867]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x873]
eventOwner:say(quest, 30.0, 0.0)  [pc 11, 0x887]
eventOwner:say(quest, 66.0, 0.0)  [pc 16, 0x89B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 19, 0x8A7]
eventOwner:say(quest, 31.0, 0.0)  [pc 24, 0x8BB]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x8C3]
return 
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x992]
eventOwner:say(quest, 32.0, 0.0)  [pc 8, 0x9A6]
quest:startFadeOut(player, 1.5)  [pc 12, 0x9B6]
quest:_wait(0.5)  [pc 15, 0x9C2]
eventOwner:_runCharaScheduler(354086912.0)  [pc 18, 0x9CE]
quest:_wait(1.0)  [pc 21, 0x9DA]
quest:startFadeIn(player, 1.5)  [pc 25, 0x9EA]
eventOwner:say(quest, 33.0, 0.0)  [pc 30, 0x9FE]
eventOwner:say(quest, 34.0, 0.0)  [pc 35, 0xA12]
eventOwner:say(quest, 35.0, 0.0)  [pc 40, 0xA26]
eventOwner:_runCharaScheduler(353959936.0)  [pc 43, 0xA32]
eventOwner:say(quest, 36.0, 0.0)  [pc 48, 0xA46]
eventOwner:say(quest, 67.0, 0.0)  [pc 53, 0xA5A]
eventOwner:finishCliantTalkTurn()  [pc 55, 0xA62]
return 
```

## processEventAfterTolk02 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB95]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xBA1]
eventOwner:say(quest, 43.0, 0.0)  [pc 11, 0xBB5]
eventOwner:say(quest, 69.0, 0.0)  [pc 16, 0xBC9]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0xBD5]
eventOwner:say(quest, 44.0, 0.0)  [pc 24, 0xBE9]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xBF1]
return 
```

## processEventWidargeltAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCC0]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xCCC]
eventOwner:say(quest, 37.0, 0.0)  [pc 11, 0xCE0]
eventOwner:say(quest, 68.0, 0.0)  [pc 16, 0xCF4]
eventOwner:say(quest, 38.0, 0.0)  [pc 21, 0xD08]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xD10]
return 
```

## processEventPoint — 3 parameters
### Path 1

```text
worldMaster:say(quest, 57.0, 0.0)  [pc 5, 0xDDE]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformDialogWidget(quest, 58.0)  [pc 4, 0xE4A]
worldMaster:notify(quest, 58.0, 0.0)  [pc 10, 0xE62]
quest:_wait(3.0)  [pc 13, 0xE6E]
quest:startFadeOutCutSceneDefault(player)  [pc 16, 0xE7A]
quest:startNQCutScene('mnk0j310', 1.0)  [pc 20, 0xE8A]
quest:startFadeInCutSceneDefault(player)  [pc 23, 0xE96]
quest:_wait(1.0)  [pc 26, 0xEA2]
worldMaster:say(quest, 55.0, 0.0)  [pc 32, 0xEBA]
return 
```

## processEventAfget — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 79.0)  [pc 4, 0xFF1]
quest:_wait(8.0)  [pc 7, 0xFFD]
quest:showGetJobAbilityWidget(player, 27109.0, 1.0)  [pc 12, 0x1011]
quest:_wait(6.0)  [pc 15, 0x101D]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111223.0, 15.0)  [pc 6, 0x10F3]
return 
```

## processEventChuui0 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111223.0, 15.0)  [pc 6, 0x1170]
return 
```

