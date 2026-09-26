# 111286 pld0j6: reconstructed client path templates

## processEventStartBefore — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2E3]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x2EF]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0x303]
eventOwner:say(quest, 18.0, 0.0)  [pc 16, 0x317]
eventOwner:_runCharaScheduler(354041856.0)  [pc 19, 0x323]
eventOwner:say(quest, 19.0, 0.0)  [pc 24, 0x337]
eventOwner:say(quest, 20.0, 0.0)  [pc 29, 0x34B]
worldMaster:say(quest, 21.0, 0.0)  [pc 35, 0x363]
eventOwner:_waitForCharaSchedulerFinished(354041856.0)  [pc 38, 0x36F]
eventOwner:finishCliantTalkTurn()  [pc 40, 0x377]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call112.1.return1 == 1.0) is true  [pc 113, 0x645]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x48D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x499]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0x4AD]
eventOwner:say(quest, 23.0, 0.0)  [pc 16, 0x4C1]
eventOwner:say(quest, 24.0, 0.0)  [pc 21, 0x4D5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 24, 0x4E1]
eventOwner:say(quest, 25.0, 0.0)  [pc 29, 0x4F5]
eventOwner:say(quest, 26.0, 0.0)  [pc 34, 0x509]
eventOwner:_runCharaScheduler(354041856.0)  [pc 37, 0x515]
eventOwner:say(quest, 27.0, 0.0)  [pc 42, 0x529]
eventOwner:say(quest, 28.0, 0.0)  [pc 47, 0x53D]
eventOwner:_runCharaScheduler(354086912.0)  [pc 50, 0x549]
eventOwner:say(quest, 29.0, 0.0)  [pc 55, 0x55D]
eventOwner:say(quest, 30.0, 0.0)  [pc 60, 0x571]
eventOwner:_runCharaScheduler(354041856.0)  [pc 63, 0x57D]
eventOwner:say(quest, 31.0, 0.0)  [pc 68, 0x591]
eventOwner:say(quest, 32.0, 0.0)  [pc 73, 0x5A5]
eventOwner:_runCharaScheduler(354066432.0)  [pc 76, 0x5B1]
eventOwner:say(quest, 33.0, 0.0)  [pc 81, 0x5C5]
quest:_wait(2.0)  [pc 84, 0x5D1]
eventOwner:say(quest, 34.0, 0.0)  [pc 89, 0x5E5]
eventOwner:_runCharaScheduler(354078720.0)  [pc 92, 0x5F1]
eventOwner:say(quest, 48.0, 0.0)  [pc 97, 0x605]
eventOwner:say(quest, 49.0, 0.0)  [pc 102, 0x619]
eventOwner:_runCharaScheduler(353968128.0)  [pc 105, 0x625]
eventOwner:say(quest, 50.0, 0.0)  [pc 110, 0x639]
call112.1.return1 = quest:showQuestInfomation()  [pc 112, 0x641]
eventOwner:_runCharaScheduler(353964032.0)  [pc 117, 0x655]
eventOwner:say(quest, 36.0, 0.0)  [pc 122, 0x669]
eventOwner:_waitForCharaSchedulerFinished(353964032.0)  [pc 125, 0x675]
eventOwner:finishCliantTalkTurn()  [pc 127, 0x67D]
return call112.1.return1
```

### Path 2

```text
require (call112.1.return1 == 1.0) is false  [pc 113, 0x645]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x48D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x499]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0x4AD]
eventOwner:say(quest, 23.0, 0.0)  [pc 16, 0x4C1]
eventOwner:say(quest, 24.0, 0.0)  [pc 21, 0x4D5]
eventOwner:_runCharaScheduler(354086912.0)  [pc 24, 0x4E1]
eventOwner:say(quest, 25.0, 0.0)  [pc 29, 0x4F5]
eventOwner:say(quest, 26.0, 0.0)  [pc 34, 0x509]
eventOwner:_runCharaScheduler(354041856.0)  [pc 37, 0x515]
eventOwner:say(quest, 27.0, 0.0)  [pc 42, 0x529]
eventOwner:say(quest, 28.0, 0.0)  [pc 47, 0x53D]
eventOwner:_runCharaScheduler(354086912.0)  [pc 50, 0x549]
eventOwner:say(quest, 29.0, 0.0)  [pc 55, 0x55D]
eventOwner:say(quest, 30.0, 0.0)  [pc 60, 0x571]
eventOwner:_runCharaScheduler(354041856.0)  [pc 63, 0x57D]
eventOwner:say(quest, 31.0, 0.0)  [pc 68, 0x591]
eventOwner:say(quest, 32.0, 0.0)  [pc 73, 0x5A5]
eventOwner:_runCharaScheduler(354066432.0)  [pc 76, 0x5B1]
eventOwner:say(quest, 33.0, 0.0)  [pc 81, 0x5C5]
quest:_wait(2.0)  [pc 84, 0x5D1]
eventOwner:say(quest, 34.0, 0.0)  [pc 89, 0x5E5]
eventOwner:_runCharaScheduler(354078720.0)  [pc 92, 0x5F1]
eventOwner:say(quest, 48.0, 0.0)  [pc 97, 0x605]
eventOwner:say(quest, 49.0, 0.0)  [pc 102, 0x619]
eventOwner:_runCharaScheduler(353968128.0)  [pc 105, 0x625]
eventOwner:say(quest, 50.0, 0.0)  [pc 110, 0x639]
call112.1.return1 = quest:showQuestInfomation()  [pc 112, 0x641]
eventOwner:_runCharaScheduler(353959936.0)  [pc 132, 0x691]
eventOwner:say(quest, 35.0, 0.0)  [pc 137, 0x6A5]
eventOwner:_waitForCharaSchedulerFinished(353959936.0)  [pc 140, 0x6B1]
eventOwner:finishCliantTalkTurn()  [pc 142, 0x6B9]
return call112.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x891]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x89D]
eventOwner:say(quest, 38.0, 0.0)  [pc 11, 0x8B1]
eventOwner:_waitForCharaSchedulerFinished(353959936.0)  [pc 14, 0x8BD]
eventOwner:finishCliantTalkTurn()  [pc 16, 0x8C5]
return 
```

## processEventClear — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x99D]
eventOwner:say(quest, 39.0, 0.0)  [pc 8, 0x9B1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 11, 0x9BD]
eventOwner:say(quest, 40.0, 0.0)  [pc 16, 0x9D1]
eventOwner:say(quest, 41.0, 0.0)  [pc 21, 0x9E5]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0x9F1]
eventOwner:say(quest, 42.0, 0.0)  [pc 29, 0xA05]
eventOwner:say(quest, 43.0, 0.0)  [pc 34, 0xA19]
eventOwner:say(quest, 44.0, 0.0)  [pc 39, 0xA2D]
eventOwner:_runCharaScheduler(354066432.0)  [pc 42, 0xA39]
eventOwner:say(quest, 51.0, 0.0)  [pc 47, 0xA4D]
eventOwner:say(quest, 45.0, 0.0)  [pc 52, 0xA61]
player:_runCharaScheduler(354111488.0)  [pc 55, 0xA6D]
eventOwner:_runCharaScheduler(354107392.0)  [pc 58, 0xA79]
quest:_wait(2.0)  [pc 61, 0xA85]
eventOwner:say(quest, 46.0, 0.0)  [pc 66, 0xA99]
eventOwner:say(quest, 52.0, 0.0)  [pc 71, 0xAAD]
eventOwner:say(quest, 53.0, 0.0)  [pc 76, 0xAC1]
eventOwner:_waitForCharaSchedulerFinished(354107392.0)  [pc 79, 0xACD]
eventOwner:_runCharaScheduler(67846144.0)  [pc 82, 0xAD9]
eventOwner:say(quest, 54.0, 0.0)  [pc 87, 0xAED]
eventOwner:_waitForCharaSchedulerFinished(67846144.0)  [pc 90, 0xAF9]
return 
```

## processEventKokuti — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 55.0)  [pc 4, 0xC5F]
quest:_wait(8.0)  [pc 7, 0xC6B]
quest:showGetJobAbilityWidget(player, 27148.0, 1.0)  [pc 12, 0xC7F]
quest:_wait(6.0)  [pc 15, 0xC8B]
quest:showGetJobItemWidget(player, arg4)  [pc 19, 0xC9B]
quest:_wait(6.0)  [pc 22, 0xCA7]
return 
```

## processEventNQ01 — 4 parameters
### Path 1

```text
require (arg4 == true) is true  [pc 7, 0xD9B]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD87]
quest:startNQCutScene('pld0j610', 1.0)  [pc 6, 0xD97]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0xDAB]
return 
```

### Path 2

```text
require (arg4 == true) is false  [pc 7, 0xD9B]
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD87]
quest:startNQCutScene('pld0j610', 1.0)  [pc 6, 0xD97]
quest:startFadeInCutSceneAfterWarp(player)  [pc 15, 0xDBB]
return 
```

## processEventNQ02 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xE84]
quest:startNQCutScene('pld0j620', 1.0)  [pc 6, 0xE94]
quest:startFadeInCutSceneAfterWarp(player)  [pc 9, 0xEA0]
return 
```

## processEventNQ03 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xF47]
quest:startNQCutScene('pld0j620', 1.0)  [pc 6, 0xF57]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xF63]
return 
```

## processEvent001 — 4 parameters
### Path 1

```text
eventOwner:finishCliantTalkTurn()  [pc 1, 0x1004]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111286.0, 16.0)  [pc 6, 0x1066]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111286.0, 16.0)  [pc 6, 0x10E3]
return 
```

