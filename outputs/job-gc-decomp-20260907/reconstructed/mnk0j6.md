# 111226 mnk0j6: reconstructed client path templates

## processEventERIK_Hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3BB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x3C7]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x3DB]
eventOwner:say(quest, 87.0, 0.0)  [pc 16, 0x3EF]
worldMaster:say(quest, 4.0, 0.0)  [pc 22, 0x407]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x40F]
return 
```

## processEventWIDARGELT_HintUnder50 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x4E6]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x4F2]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x506]
eventOwner:say(quest, 82.0, 0.0)  [pc 16, 0x51A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0x526]
eventOwner:say(quest, 83.0, 0.0)  [pc 24, 0x53A]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x542]
return 
```

## processEventWIDARGELT_HintOver50 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x608]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x614]
eventOwner:say(quest, 84.0, 0.0)  [pc 11, 0x628]
eventOwner:say(quest, 85.0, 0.0)  [pc 16, 0x63C]
eventOwner:_runCharaScheduler(354062336.0)  [pc 19, 0x648]
eventOwner:say(quest, 86.0, 0.0)  [pc 24, 0x65C]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x664]
return 
```

## processEventERIKStart — 3 parameters
### Path 1

```text
require (call117.1.return1 == 1.0) is true  [pc 118, 0x8FF]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x733]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x73F]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x753]
eventOwner:say(quest, 80.0, 0.0)  [pc 16, 0x767]
eventOwner:_runCharaScheduler(354041856.0)  [pc 19, 0x773]
eventOwner:say(quest, 6.0, 0.0)  [pc 24, 0x787]
eventOwner:say(quest, 81.0, 0.0)  [pc 29, 0x79B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 32, 0x7A7]
eventOwner:say(quest, 88.0, 0.0)  [pc 37, 0x7BB]
eventOwner:say(quest, 7.0, 0.0)  [pc 42, 0x7CF]
eventOwner:_runCharaScheduler(354058240.0)  [pc 45, 0x7DB]
quest:_wait(1.0)  [pc 48, 0x7E7]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x7FB]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x80F]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x823]
eventOwner:_runCharaScheduler(354103296.0)  [pc 66, 0x82F]
eventOwner:say(quest, 11.0, 0.0)  [pc 71, 0x843]
eventOwner:say(quest, 12.0, 0.0)  [pc 76, 0x857]
eventOwner:_runCharaScheduler(354099200.0)  [pc 79, 0x863]
eventOwner:say(quest, 89.0, 0.0)  [pc 84, 0x877]
eventOwner:say(quest, 90.0, 0.0)  [pc 89, 0x88B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 92, 0x897]
eventOwner:say(quest, 91.0, 0.0)  [pc 97, 0x8AB]
eventOwner:say(quest, 13.0, 0.0)  [pc 102, 0x8BF]
eventOwner:_runCharaScheduler(354000896.0)  [pc 105, 0x8CB]
eventOwner:say(quest, 14.0, 0.0)  [pc 110, 0x8DF]
eventOwner:say(quest, 92.0, 0.0)  [pc 115, 0x8F3]
call117.1.return1 = quest:showQuestInfomation()  [pc 117, 0x8FB]
eventOwner:_runCharaScheduler(354099200.0)  [pc 122, 0x90F]
eventOwner:say(quest, 59.0, 0.0)  [pc 127, 0x923]
eventOwner:finishCliantTalkTurn()  [pc 143, 0x963]
return call117.1.return1
```

### Path 2

```text
require (call117.1.return1 == 1.0) is false  [pc 118, 0x8FF]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x733]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0x73F]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x753]
eventOwner:say(quest, 80.0, 0.0)  [pc 16, 0x767]
eventOwner:_runCharaScheduler(354041856.0)  [pc 19, 0x773]
eventOwner:say(quest, 6.0, 0.0)  [pc 24, 0x787]
eventOwner:say(quest, 81.0, 0.0)  [pc 29, 0x79B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 32, 0x7A7]
eventOwner:say(quest, 88.0, 0.0)  [pc 37, 0x7BB]
eventOwner:say(quest, 7.0, 0.0)  [pc 42, 0x7CF]
eventOwner:_runCharaScheduler(354058240.0)  [pc 45, 0x7DB]
quest:_wait(1.0)  [pc 48, 0x7E7]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x7FB]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x80F]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x823]
eventOwner:_runCharaScheduler(354103296.0)  [pc 66, 0x82F]
eventOwner:say(quest, 11.0, 0.0)  [pc 71, 0x843]
eventOwner:say(quest, 12.0, 0.0)  [pc 76, 0x857]
eventOwner:_runCharaScheduler(354099200.0)  [pc 79, 0x863]
eventOwner:say(quest, 89.0, 0.0)  [pc 84, 0x877]
eventOwner:say(quest, 90.0, 0.0)  [pc 89, 0x88B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 92, 0x897]
eventOwner:say(quest, 91.0, 0.0)  [pc 97, 0x8AB]
eventOwner:say(quest, 13.0, 0.0)  [pc 102, 0x8BF]
eventOwner:_runCharaScheduler(354000896.0)  [pc 105, 0x8CB]
eventOwner:say(quest, 14.0, 0.0)  [pc 110, 0x8DF]
eventOwner:say(quest, 92.0, 0.0)  [pc 115, 0x8F3]
call117.1.return1 = quest:showQuestInfomation()  [pc 117, 0x8FB]
eventOwner:_runCharaScheduler(354078720.0)  [pc 131, 0x933]
eventOwner:say(quest, 58.0, 0.0)  [pc 136, 0x947]
eventOwner:say(quest, 93.0, 0.0)  [pc 141, 0x95B]
eventOwner:finishCliantTalkTurn()  [pc 143, 0x963]
return call117.1.return1
```

## processEvent000_ERIK_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB32]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0xB3E]
eventOwner:say(quest, 76.0, 0.0)  [pc 11, 0xB52]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xB5A]
return 
```

## processEvent000_WIDARGELT_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC0E]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0xC1A]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0xC2E]
eventOwner:say(quest, 94.0, 0.0)  [pc 16, 0xC42]
eventOwner:_runCharaScheduler(354078720.0)  [pc 19, 0xC4E]
eventOwner:say(quest, 16.0, 0.0)  [pc 24, 0xC62]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0xC76]
eventOwner:finishCliantTalkTurn()  [pc 31, 0xC7E]
return 
```

## processEvent005 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0xD66]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD52]
quest:startNQCutScene('mnk0j610', 1.0)  [pc 6, 0xD62]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0xD76]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0xD66]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD52]
quest:startNQCutScene('mnk0j610', 1.0)  [pc 6, 0xD62]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0xD86]
return 
```

## processEvent015 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xE4F]
quest:startNQCutScene('mnk0j620', 1.0)  [pc 6, 0xE5F]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0xE6B]
return 
```

## processEvent020 — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF16]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xF22]
eventOwner:say(quest, 41.0, 0.0)  [pc 11, 0xF36]
eventOwner:say(quest, 69.0, 0.0)  [pc 16, 0xF4A]
eventOwner:say(quest, 117.0, 0.0)  [pc 21, 0xF5E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 24, 0xF6A]
eventOwner:say(quest, 70.0, 0.0)  [pc 29, 0xF7E]
eventOwner:say(quest, 71.0, 0.0)  [pc 34, 0xF92]
eventOwner:_runCharaScheduler(354107392.0)  [pc 37, 0xF9E]
quest:_wait(1.5)  [pc 40, 0xFAA]
eventOwner:say(quest, 72.0, 0.0)  [pc 45, 0xFBE]
quest:showGetJobItemWidget(player, arg4)  [pc 49, 0xFCE]
quest:_wait(6.0)  [pc 52, 0xFDA]
eventOwner:_runCharaScheduler(353968128.0)  [pc 55, 0xFE6]
eventOwner:say(quest, 73.0, 0.0)  [pc 60, 0xFFA]
eventOwner:say(quest, 109.0, 0.0)  [pc 65, 0x100E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 68, 0x101A]
eventOwner:say(quest, 110.0, 0.0)  [pc 73, 0x102E]
eventOwner:say(quest, 111.0, 0.0)  [pc 78, 0x1042]
eventOwner:_runCharaScheduler(353959936.0)  [pc 81, 0x104E]
eventOwner:say(quest, 112.0, 0.0)  [pc 86, 0x1062]
eventOwner:say(quest, 113.0, 0.0)  [pc 91, 0x1076]
eventOwner:_runCharaScheduler(354062336.0)  [pc 94, 0x1082]
eventOwner:say(quest, 114.0, 0.0)  [pc 99, 0x1096]
eventOwner:finishCliantTalkTurn()  [pc 101, 0x109E]
return 
```

## processEvent020_ERIC_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1219]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1225]
eventOwner:say(quest, 74.0, 0.0)  [pc 11, 0x1239]
eventOwner:say(quest, 75.0, 0.0)  [pc 16, 0x124D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x1255]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 115.0)  [pc 4, 0x1316]
quest:_wait(8.0)  [pc 7, 0x1322]
quest:showGetJobAbilityWidget(player, 27106.0, 1.0)  [pc 12, 0x1336]
quest:_wait(6.0)  [pc 15, 0x1342]
return 
```

## processEvent020_ERIC_PUB — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x140C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1418]
eventOwner:say(quest, 79.0, 0.0)  [pc 11, 0x142C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1434]
return 
```

## processEventWIDARGELT_PUB — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14E8]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x14F4]
eventOwner:say(quest, 78.0, 0.0)  [pc 11, 0x1508]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1510]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111226.0, 15.0)  [pc 6, 0x15D0]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111226.0, 15.0)  [pc 6, 0x164D]
return 
```

