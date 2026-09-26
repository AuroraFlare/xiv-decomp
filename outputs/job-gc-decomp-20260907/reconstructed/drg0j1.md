# 111321 drg0j1: reconstructed client path templates

## processEventStart — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 24, 0x31E]
require (call79.1.return1 == 1.0) is true  [pc 80, 0x3FE]
quest:startFadeOut(player, 1.5)  [pc 3, 0x2CA]
quest:_wait(1.0)  [pc 6, 0x2D6]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 10, 0x2E6]
quest:_wait(1.0)  [pc 13, 0x2F2]
quest:startFadeIn(player, 1.5)  [pc 17, 0x302]
quest:_wait(0.5)  [pc 20, 0x30E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 23, 0x31A]
eventOwner:say(quest, 3.0, 0.0)  [pc 30, 0x336]
eventOwner:say(quest, 4.0, 0.0)  [pc 41, 0x362]
eventOwner:say(quest, 5.0, 0.0)  [pc 46, 0x376]
eventOwner:_runCharaScheduler(354082816.0)  [pc 49, 0x382]
eventOwner:say(quest, 51.0, 0.0)  [pc 54, 0x396]
eventOwner:say(quest, 6.0, 0.0)  [pc 59, 0x3AA]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x3BE]
eventOwner:_runCharaScheduler(353964032.0)  [pc 67, 0x3CA]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x3DE]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x3F2]
call79.1.return1 = quest:showQuestInfomation()  [pc 79, 0x3FA]
eventOwner:_runCharaScheduler(354066432.0)  [pc 84, 0x40E]
eventOwner:say(quest, 11.0, 0.0)  [pc 89, 0x422]
quest:startFadeOut(player, 1.5)  [pc 93, 0x432]
quest:_wait(1.0)  [pc 96, 0x43E]
eventOwner:finishCliantTalkTurn()  [pc 98, 0x446]
quest:_wait(1.0)  [pc 101, 0x452]
quest:startFadeIn(player, 1.5)  [pc 105, 0x462]
quest:_wait(0.5)  [pc 108, 0x46E]
return call79.1.return1
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 24, 0x31E]
require (call79.1.return1 == 1.0) is false  [pc 80, 0x3FE]
quest:startFadeOut(player, 1.5)  [pc 3, 0x2CA]
quest:_wait(1.0)  [pc 6, 0x2D6]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 10, 0x2E6]
quest:_wait(1.0)  [pc 13, 0x2F2]
quest:startFadeIn(player, 1.5)  [pc 17, 0x302]
quest:_wait(0.5)  [pc 20, 0x30E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 23, 0x31A]
eventOwner:say(quest, 3.0, 0.0)  [pc 30, 0x336]
eventOwner:say(quest, 4.0, 0.0)  [pc 41, 0x362]
eventOwner:say(quest, 5.0, 0.0)  [pc 46, 0x376]
eventOwner:_runCharaScheduler(354082816.0)  [pc 49, 0x382]
eventOwner:say(quest, 51.0, 0.0)  [pc 54, 0x396]
eventOwner:say(quest, 6.0, 0.0)  [pc 59, 0x3AA]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x3BE]
eventOwner:_runCharaScheduler(353964032.0)  [pc 67, 0x3CA]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x3DE]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x3F2]
call79.1.return1 = quest:showQuestInfomation()  [pc 79, 0x3FA]
eventOwner:_runCharaScheduler(354082816.0)  [pc 113, 0x482]
eventOwner:say(quest, 10.0, 0.0)  [pc 118, 0x496]
quest:startFadeOut(player, 1.5)  [pc 122, 0x4A6]
quest:_wait(1.0)  [pc 125, 0x4B2]
eventOwner:finishCliantTalkTurn()  [pc 127, 0x4BA]
quest:_wait(1.0)  [pc 130, 0x4C6]
quest:startFadeIn(player, 1.5)  [pc 134, 0x4D6]
quest:_wait(0.5)  [pc 137, 0x4E2]
return call79.1.return1
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 24, 0x31E]
require (call79.1.return1 == 1.0) is true  [pc 80, 0x3FE]
quest:startFadeOut(player, 1.5)  [pc 3, 0x2CA]
quest:_wait(1.0)  [pc 6, 0x2D6]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 10, 0x2E6]
quest:_wait(1.0)  [pc 13, 0x2F2]
quest:startFadeIn(player, 1.5)  [pc 17, 0x302]
quest:_wait(0.5)  [pc 20, 0x30E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 23, 0x31A]
eventOwner:say(quest, 2.0, 0.0)  [pc 36, 0x34E]
eventOwner:say(quest, 4.0, 0.0)  [pc 41, 0x362]
eventOwner:say(quest, 5.0, 0.0)  [pc 46, 0x376]
eventOwner:_runCharaScheduler(354082816.0)  [pc 49, 0x382]
eventOwner:say(quest, 51.0, 0.0)  [pc 54, 0x396]
eventOwner:say(quest, 6.0, 0.0)  [pc 59, 0x3AA]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x3BE]
eventOwner:_runCharaScheduler(353964032.0)  [pc 67, 0x3CA]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x3DE]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x3F2]
call79.1.return1 = quest:showQuestInfomation()  [pc 79, 0x3FA]
eventOwner:_runCharaScheduler(354066432.0)  [pc 84, 0x40E]
eventOwner:say(quest, 11.0, 0.0)  [pc 89, 0x422]
quest:startFadeOut(player, 1.5)  [pc 93, 0x432]
quest:_wait(1.0)  [pc 96, 0x43E]
eventOwner:finishCliantTalkTurn()  [pc 98, 0x446]
quest:_wait(1.0)  [pc 101, 0x452]
quest:startFadeIn(player, 1.5)  [pc 105, 0x462]
quest:_wait(0.5)  [pc 108, 0x46E]
return call79.1.return1
```

### Path 4

```text
require (arg4 == 1.0) is false  [pc 24, 0x31E]
require (call79.1.return1 == 1.0) is false  [pc 80, 0x3FE]
quest:startFadeOut(player, 1.5)  [pc 3, 0x2CA]
quest:_wait(1.0)  [pc 6, 0x2D6]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 10, 0x2E6]
quest:_wait(1.0)  [pc 13, 0x2F2]
quest:startFadeIn(player, 1.5)  [pc 17, 0x302]
quest:_wait(0.5)  [pc 20, 0x30E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 23, 0x31A]
eventOwner:say(quest, 2.0, 0.0)  [pc 36, 0x34E]
eventOwner:say(quest, 4.0, 0.0)  [pc 41, 0x362]
eventOwner:say(quest, 5.0, 0.0)  [pc 46, 0x376]
eventOwner:_runCharaScheduler(354082816.0)  [pc 49, 0x382]
eventOwner:say(quest, 51.0, 0.0)  [pc 54, 0x396]
eventOwner:say(quest, 6.0, 0.0)  [pc 59, 0x3AA]
eventOwner:say(quest, 7.0, 0.0)  [pc 64, 0x3BE]
eventOwner:_runCharaScheduler(353964032.0)  [pc 67, 0x3CA]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x3DE]
eventOwner:say(quest, 9.0, 0.0)  [pc 77, 0x3F2]
call79.1.return1 = quest:showQuestInfomation()  [pc 79, 0x3FA]
eventOwner:_runCharaScheduler(354082816.0)  [pc 113, 0x482]
eventOwner:say(quest, 10.0, 0.0)  [pc 118, 0x496]
quest:startFadeOut(player, 1.5)  [pc 122, 0x4A6]
quest:_wait(1.0)  [pc 125, 0x4B2]
eventOwner:finishCliantTalkTurn()  [pc 127, 0x4BA]
quest:_wait(1.0)  [pc 130, 0x4C6]
quest:startFadeIn(player, 1.5)  [pc 134, 0x4D6]
quest:_wait(0.5)  [pc 137, 0x4E2]
return call79.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x668]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0x674]
eventOwner:say(quest, 12.0, 0.0)  [pc 11, 0x688]
eventOwner:say(quest, 43.0, 0.0)  [pc 16, 0x69C]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x6A4]
return 
```

## processEventAlberic — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x761]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x76D]
eventOwner:say(quest, 13.0, 0.0)  [pc 11, 0x781]
eventOwner:say(quest, 14.0, 0.0)  [pc 16, 0x795]
eventOwner:_runCharaScheduler(353976320.0)  [pc 19, 0x7A1]
eventOwner:say(quest, 15.0, 0.0)  [pc 24, 0x7B5]
eventOwner:say(quest, 16.0, 0.0)  [pc 29, 0x7C9]
eventOwner:say(quest, 17.0, 0.0)  [pc 34, 0x7DD]
eventOwner:_runCharaScheduler(354082816.0)  [pc 37, 0x7E9]
eventOwner:say(quest, 18.0, 0.0)  [pc 42, 0x7FD]
eventOwner:say(quest, 19.0, 0.0)  [pc 47, 0x811]
quest:_wait(1.0)  [pc 50, 0x81D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 53, 0x829]
eventOwner:say(quest, 20.0, 0.0)  [pc 58, 0x83D]
eventOwner:say(quest, 49.0, 0.0)  [pc 63, 0x851]
eventOwner:finishCliantTalkTurn()  [pc 65, 0x859]
return 
```

## processEventAlbericAfter — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x97B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x987]
eventOwner:say(quest, 21.0, 0.0)  [pc 11, 0x99B]
eventOwner:say(quest, 44.0, 0.0)  [pc 16, 0x9AF]
eventOwner:say(quest, 45.0, 0.0)  [pc 21, 0x9C3]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x9CB]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA91]
eventOwner:_runCharaScheduler(353972224.0)  [pc 6, 0xA9D]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0xAB1]
quest:startFadeOut(player, 1.5)  [pc 15, 0xAC1]
quest:_wait(1.5)  [pc 18, 0xACD]
quest:startFadeIn(player, 1.5)  [pc 22, 0xADD]
eventOwner:say(quest, 26.0, 0.0)  [pc 27, 0xAF1]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0xAFD]
quest:_wait(2.0)  [pc 33, 0xB09]
eventOwner:say(quest, 27.0, 0.0)  [pc 38, 0xB1D]
eventOwner:say(quest, 28.0, 0.0)  [pc 43, 0xB31]
eventOwner:say(quest, 29.0, 0.0)  [pc 48, 0xB45]
eventOwner:_runCharaScheduler(353959936.0)  [pc 51, 0xB51]
eventOwner:say(quest, 30.0, 0.0)  [pc 56, 0xB65]
eventOwner:say(quest, 31.0, 0.0)  [pc 61, 0xB79]
eventOwner:_runCharaScheduler(354082816.0)  [pc 64, 0xB85]
eventOwner:say(quest, 32.0, 0.0)  [pc 69, 0xB99]
eventOwner:say(quest, 33.0, 0.0)  [pc 74, 0xBAD]
eventOwner:_runCharaScheduler(354103296.0)  [pc 77, 0xBB9]
eventOwner:say(quest, 34.0, 0.0)  [pc 82, 0xBCD]
player:_runCharaScheduler(354111488.0)  [pc 85, 0xBD9]
eventOwner:_runCharaScheduler(354107392.0)  [pc 88, 0xBE5]
quest:_wait(1.0)  [pc 91, 0xBF1]
eventOwner:say(quest, 35.0, 0.0)  [pc 96, 0xC05]
eventOwner:say(quest, 36.0, 0.0)  [pc 101, 0xC19]
eventOwner:say(quest, 37.0, 0.0)  [pc 106, 0xC2D]
eventOwner:_runCharaScheduler(353968128.0)  [pc 109, 0xC39]
eventOwner:say(quest, 38.0, 0.0)  [pc 114, 0xC4D]
eventOwner:say(quest, 39.0, 0.0)  [pc 119, 0xC61]
eventOwner:_runCharaScheduler(353959936.0)  [pc 122, 0xC6D]
eventOwner:say(quest, 40.0, 0.0)  [pc 127, 0xC81]
eventOwner:say(quest, 41.0, 0.0)  [pc 132, 0xC95]
eventOwner:_runCharaScheduler(354082816.0)  [pc 135, 0xCA1]
eventOwner:say(quest, 42.0, 0.0)  [pc 140, 0xCB5]
eventOwner:say(quest, 47.0, 0.0)  [pc 145, 0xCC9]
worldMaster:say(quest, 48.0, 0.0)  [pc 151, 0xCE1]
eventOwner:finishCliantTalkTurn()  [pc 153, 0xCE9]
return 
```

## processEventKokuti — 4 parameters
### Path 1

```text
quest:showGetJobItemWidget(player, arg4)  [pc 3, 0xED8]
quest:_wait(6.0)  [pc 6, 0xEE4]
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51126.0, 2000204.0)  [pc 12, 0xEFC]
quest:_wait(8.0)  [pc 15, 0xF08]
quest:showGetJobAbilityWidget(player, 27266.0, 1.0)  [pc 20, 0xF1C]
quest:_wait(6.0)  [pc 23, 0xF28]
return 
```

## processEventNQ — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1022]
quest:startNQCutScene('drg0j110', 1.0)  [pc 6, 0x1032]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x103E]
return 
```

## processEventStart_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111321.0, 8.0, 30.0, 2.0, 15.0)  [pc 9, 0x10FF]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111321.0, 8.0)  [pc 6, 0x1197]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111321.0, 8.0)  [pc 6, 0x1214]
return 
```

