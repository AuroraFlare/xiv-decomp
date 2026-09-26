# 111246 whm0j6: reconstructed client path templates

## processEventStartBeforeRaya — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F1]
eventOwner:_runCharaScheduler(364761088.0)  [pc 6, 0x3FD]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x411]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x425]
worldMaster:say(quest, 6.0, 0.0)  [pc 22, 0x43D]
eventOwner:finishCliantTalkTurn()  [pc 24, 0x445]
return 
```

## processEventStartBeforeMogA — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x51C]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0x528]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x53C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x544]
return 
```

## processEventStartBeforeMogB — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x5FE]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0x60A]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x61E]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x626]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call99.1.return1 == 1.0) is true  [pc 100, 0x864]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6E0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x6EC]
eventOwner:say(quest, 7.0, 0.0)  [pc 11, 0x700]
eventOwner:say(quest, 8.0, 0.0)  [pc 16, 0x714]
eventOwner:_runCharaScheduler(353980416.0)  [pc 19, 0x720]
eventOwner:say(quest, 9.0, 0.0)  [pc 24, 0x734]
eventOwner:say(quest, 54.0, 0.0)  [pc 29, 0x748]
eventOwner:_runCharaScheduler(354103296.0)  [pc 32, 0x754]
eventOwner:say(quest, 10.0, 0.0)  [pc 37, 0x768]
eventOwner:say(quest, 55.0, 0.0)  [pc 42, 0x77C]
eventOwner:_runCharaScheduler(354082816.0)  [pc 45, 0x788]
eventOwner:say(quest, 56.0, 0.0)  [pc 50, 0x79C]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x7B0]
quest:_wait(0.5)  [pc 58, 0x7BC]
eventOwner:_runCharaScheduler(354078720.0)  [pc 61, 0x7C8]
eventOwner:say(quest, 57.0, 0.0)  [pc 66, 0x7DC]
eventOwner:say(quest, 58.0, 0.0)  [pc 71, 0x7F0]
eventOwner:_runCharaScheduler(79597568.0)  [pc 74, 0x7FC]
eventOwner:say(quest, 12.0, 0.0)  [pc 79, 0x810]
eventOwner:say(quest, 13.0, 0.0)  [pc 84, 0x824]
eventOwner:_runCharaScheduler(353959936.0)  [pc 87, 0x830]
eventOwner:say(quest, 16.0, 0.0)  [pc 92, 0x844]
eventOwner:say(quest, 17.0, 0.0)  [pc 97, 0x858]
call99.1.return1 = quest:showQuestInfomation()  [pc 99, 0x860]
eventOwner:_runCharaScheduler(353964032.0)  [pc 104, 0x874]
eventOwner:say(quest, 19.0, 0.0)  [pc 109, 0x888]
eventOwner:finishCliantTalkTurn()  [pc 111, 0x890]
return call99.1.return1
```

### Path 2

```text
require (call99.1.return1 == 1.0) is false  [pc 100, 0x864]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6E0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x6EC]
eventOwner:say(quest, 7.0, 0.0)  [pc 11, 0x700]
eventOwner:say(quest, 8.0, 0.0)  [pc 16, 0x714]
eventOwner:_runCharaScheduler(353980416.0)  [pc 19, 0x720]
eventOwner:say(quest, 9.0, 0.0)  [pc 24, 0x734]
eventOwner:say(quest, 54.0, 0.0)  [pc 29, 0x748]
eventOwner:_runCharaScheduler(354103296.0)  [pc 32, 0x754]
eventOwner:say(quest, 10.0, 0.0)  [pc 37, 0x768]
eventOwner:say(quest, 55.0, 0.0)  [pc 42, 0x77C]
eventOwner:_runCharaScheduler(354082816.0)  [pc 45, 0x788]
eventOwner:say(quest, 56.0, 0.0)  [pc 50, 0x79C]
eventOwner:say(quest, 11.0, 0.0)  [pc 55, 0x7B0]
quest:_wait(0.5)  [pc 58, 0x7BC]
eventOwner:_runCharaScheduler(354078720.0)  [pc 61, 0x7C8]
eventOwner:say(quest, 57.0, 0.0)  [pc 66, 0x7DC]
eventOwner:say(quest, 58.0, 0.0)  [pc 71, 0x7F0]
eventOwner:_runCharaScheduler(79597568.0)  [pc 74, 0x7FC]
eventOwner:say(quest, 12.0, 0.0)  [pc 79, 0x810]
eventOwner:say(quest, 13.0, 0.0)  [pc 84, 0x824]
eventOwner:_runCharaScheduler(353959936.0)  [pc 87, 0x830]
eventOwner:say(quest, 16.0, 0.0)  [pc 92, 0x844]
eventOwner:say(quest, 17.0, 0.0)  [pc 97, 0x858]
call99.1.return1 = quest:showQuestInfomation()  [pc 99, 0x860]
eventOwner:_runCharaScheduler(79589376.0)  [pc 116, 0x8A4]
eventOwner:say(quest, 18.0, 0.0)  [pc 121, 0x8B8]
eventOwner:finishCliantTalkTurn()  [pc 123, 0x8C0]
return call99.1.return1
```

## processEventCutSceneBeforeBattle — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xA70]
quest:startNQCutScene('whm0j605', 1.0)  [pc 6, 0xA80]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xA8C]
return 
```

## processEventRyaoAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB35]
eventOwner:_runCharaScheduler(364752896.0)  [pc 6, 0xB41]
eventOwner:say(quest, 23.0, 0.0)  [pc 11, 0xB55]
eventOwner:say(quest, 48.0, 0.0)  [pc 16, 0xB69]
eventOwner:_runCharaScheduler(79597568.0)  [pc 19, 0xB75]
eventOwner:say(quest, 46.0, 0.0)  [pc 24, 0xB89]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xB91]
return 
```

## processEventMoogleA00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xC60]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xC6C]
eventOwner:say(quest, 20.0, 0.0)  [pc 11, 0xC80]
eventOwner:say(quest, 21.0, 0.0)  [pc 16, 0xC94]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xC9C]
return 
```

## processEventMoogleB00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xD5F]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0xD6B]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0xD7F]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD87]
return 
```

## processEventMoogleA01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xE41]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0xE4D]
eventOwner:say(quest, 38.0, 0.0)  [pc 11, 0xE61]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE69]
return 
```

## processEventMoogleB01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xF23]
eventOwner:_runCharaScheduler(70057984.0)  [pc 6, 0xF2F]
eventOwner:say(quest, 39.0, 0.0)  [pc 11, 0xF43]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF4B]
return 
```

## processEventNQ — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1001]
quest:startNQCutScene('whm0j610', 1.0)  [pc 6, 0x1011]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x101D]
return 
```

## processEvent_getAF_info — 3 parameters
### Path 1

```text
quest:_wait(0.5)  [pc 2, 0x10C2]
desktopWidget:openPublicInformLongDialogWidget(quest, 49.0, 8032706.0)  [pc 8, 0x10DA]
quest:_wait(8.0)  [pc 11, 0x10E6]
quest:showGetJobItemWidget(player, 8032706.0)  [pc 15, 0x10F6]
quest:_wait(6.0)  [pc 18, 0x1102]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11C9]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x11D5]
eventOwner:say(quest, 32.0, 0.0)  [pc 11, 0x11E9]
eventOwner:say(quest, 47.0, 0.0)  [pc 16, 0x11FD]
eventOwner:_runCharaScheduler(67805184.0)  [pc 19, 0x1209]
eventOwner:say(quest, 62.0, 0.0)  [pc 24, 0x121D]
quest:startFadeOut(player, 1.5)  [pc 28, 0x122D]
quest:_wait(1.0)  [pc 31, 0x1239]
eventOwner:_runCharaScheduler(79577088.0)  [pc 34, 0x1245]
quest:_wait(0.5)  [pc 37, 0x1251]
quest:startFadeIn(player, 1.5)  [pc 41, 0x1261]
eventOwner:_runCharaScheduler(354082816.0)  [pc 44, 0x126D]
eventOwner:say(quest, 33.0, 0.0)  [pc 49, 0x1281]
eventOwner:say(quest, 34.0, 0.0)  [pc 54, 0x1295]
eventOwner:_runCharaScheduler(354103296.0)  [pc 57, 0x12A1]
eventOwner:say(quest, 63.0, 0.0)  [pc 62, 0x12B5]
eventOwner:say(quest, 44.0, 0.0)  [pc 67, 0x12C9]
eventOwner:_runCharaScheduler(354000896.0)  [pc 70, 0x12D5]
eventOwner:say(quest, 45.0, 0.0)  [pc 75, 0x12E9]
eventOwner:say(quest, 35.0, 0.0)  [pc 80, 0x12FD]
eventOwner:_runCharaScheduler(353972224.0)  [pc 83, 0x1309]
eventOwner:say(quest, 36.0, 0.0)  [pc 88, 0x131D]
desktopWidget:openPublicInformLongDialogWidget(quest, 50.0)  [pc 93, 0x1331]
quest:_wait(8.0)  [pc 96, 0x133D]
quest:showGetJobAbilityWidget(player, 27345.0, 1.0)  [pc 101, 0x1351]
quest:_wait(6.0)  [pc 104, 0x135D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 107, 0x1369]
eventOwner:say(quest, 37.0, 0.0)  [pc 112, 0x137D]
eventOwner:say(quest, 64.0, 0.0)  [pc 117, 0x1391]
eventOwner:_runCharaScheduler(354103296.0)  [pc 120, 0x139D]
eventOwner:say(quest, 65.0, 0.0)  [pc 125, 0x13B1]
eventOwner:say(quest, 66.0, 0.0)  [pc 130, 0x13C5]
player:_runCharaScheduler(67108919.0)  [pc 133, 0x13D1]
quest:_wait(2.5)  [pc 136, 0x13DD]
eventOwner:finishCliantTalkTurn()  [pc 138, 0x13E5]
return 
```

## processEventAfget — 4 parameters
### Path 1

```text
quest:_wait(6.0)  [pc 2, 0x161E]
quest:showGetJobAbilityWidget(player, 27345.0, 1.0)  [pc 7, 0x1632]
quest:_wait(6.0)  [pc 10, 0x163E]
desktopWidget:openPublicInformDialogWidget(quest, 49.0, arg4)  [pc 16, 0x1656]
quest:_wait(6.0)  [pc 19, 0x1662]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111246.0, 27.0)  [pc 6, 0x172B]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111246.0, 27.0)  [pc 6, 0x17A8]
return 
```

## processEventNQ03 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1815]
quest:startNQCutScene('whm0j610', 1.0)  [pc 6, 0x1825]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x1831]
return 
```

