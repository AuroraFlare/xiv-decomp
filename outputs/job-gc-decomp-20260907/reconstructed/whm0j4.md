# 111244 whm0j4: reconstructed client path templates

## processEventStartBeforeRaya — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x392]
eventOwner:_runCharaScheduler(364752896.0)  [pc 6, 0x39E]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x3B2]
worldMaster:say(quest, 4.0, 0.0)  [pc 17, 0x3CA]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x3D2]
return 
```

## processEventStartBeforeMogA — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x4A0]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0x4AC]
eventOwner:say(quest, 1.0, 0.0)  [pc 11, 0x4C0]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x4C8]
return 
```

## processEventStartBeforeMogB — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0x579]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0x585]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x599]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x5A1]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call109.1.return1 == 1.0) is true  [pc 110, 0x807]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x65B]
eventOwner:_runCharaScheduler(364748800.0)  [pc 6, 0x667]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x67B]
eventOwner:_runCharaScheduler(70881280.0)  [pc 14, 0x687]
eventOwner:say(quest, 8.0, 0.0)  [pc 19, 0x69B]
eventOwner:say(quest, 9.0, 0.0)  [pc 24, 0x6AF]
eventOwner:_runCharaScheduler(354082816.0)  [pc 27, 0x6BB]
eventOwner:say(quest, 37.0, 0.0)  [pc 32, 0x6CF]
eventOwner:say(quest, 40.0, 0.0)  [pc 37, 0x6E3]
eventOwner:say(quest, 41.0, 0.0)  [pc 42, 0x6F7]
eventOwner:_runCharaScheduler(353964032.0)  [pc 45, 0x703]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x717]
eventOwner:say(quest, 42.0, 0.0)  [pc 55, 0x72B]
eventOwner:say(quest, 43.0, 0.0)  [pc 60, 0x73F]
eventOwner:_runCharaScheduler(364748800.0)  [pc 63, 0x74B]
eventOwner:say(quest, 11.0, 0.0)  [pc 68, 0x75F]
eventOwner:say(quest, 44.0, 0.0)  [pc 73, 0x773]
eventOwner:_runCharaScheduler(70815744.0)  [pc 76, 0x77F]
eventOwner:say(quest, 45.0, 0.0)  [pc 81, 0x793]
eventOwner:_runCharaScheduler(364756992.0)  [pc 84, 0x79F]
eventOwner:say(quest, 12.0, 0.0)  [pc 89, 0x7B3]
eventOwner:say(quest, 46.0, 0.0)  [pc 94, 0x7C7]
eventOwner:_runCharaScheduler(70795264.0)  [pc 97, 0x7D3]
eventOwner:say(quest, 47.0, 0.0)  [pc 102, 0x7E7]
eventOwner:say(quest, 13.0, 0.0)  [pc 107, 0x7FB]
call109.1.return1 = quest:showQuestInfomation()  [pc 109, 0x803]
eventOwner:_runCharaScheduler(79593472.0)  [pc 114, 0x817]
eventOwner:say(quest, 15.0, 0.0)  [pc 119, 0x82B]
eventOwner:say(quest, 48.0, 0.0)  [pc 124, 0x83F]
eventOwner:finishCliantTalkTurn()  [pc 126, 0x847]
return call109.1.return1
```

### Path 2

```text
require (call109.1.return1 == 1.0) is false  [pc 110, 0x807]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x65B]
eventOwner:_runCharaScheduler(364748800.0)  [pc 6, 0x667]
eventOwner:say(quest, 5.0, 0.0)  [pc 11, 0x67B]
eventOwner:_runCharaScheduler(70881280.0)  [pc 14, 0x687]
eventOwner:say(quest, 8.0, 0.0)  [pc 19, 0x69B]
eventOwner:say(quest, 9.0, 0.0)  [pc 24, 0x6AF]
eventOwner:_runCharaScheduler(354082816.0)  [pc 27, 0x6BB]
eventOwner:say(quest, 37.0, 0.0)  [pc 32, 0x6CF]
eventOwner:say(quest, 40.0, 0.0)  [pc 37, 0x6E3]
eventOwner:say(quest, 41.0, 0.0)  [pc 42, 0x6F7]
eventOwner:_runCharaScheduler(353964032.0)  [pc 45, 0x703]
eventOwner:say(quest, 10.0, 0.0)  [pc 50, 0x717]
eventOwner:say(quest, 42.0, 0.0)  [pc 55, 0x72B]
eventOwner:say(quest, 43.0, 0.0)  [pc 60, 0x73F]
eventOwner:_runCharaScheduler(364748800.0)  [pc 63, 0x74B]
eventOwner:say(quest, 11.0, 0.0)  [pc 68, 0x75F]
eventOwner:say(quest, 44.0, 0.0)  [pc 73, 0x773]
eventOwner:_runCharaScheduler(70815744.0)  [pc 76, 0x77F]
eventOwner:say(quest, 45.0, 0.0)  [pc 81, 0x793]
eventOwner:_runCharaScheduler(364756992.0)  [pc 84, 0x79F]
eventOwner:say(quest, 12.0, 0.0)  [pc 89, 0x7B3]
eventOwner:say(quest, 46.0, 0.0)  [pc 94, 0x7C7]
eventOwner:_runCharaScheduler(70795264.0)  [pc 97, 0x7D3]
eventOwner:say(quest, 47.0, 0.0)  [pc 102, 0x7E7]
eventOwner:say(quest, 13.0, 0.0)  [pc 107, 0x7FB]
call109.1.return1 = quest:showQuestInfomation()  [pc 109, 0x803]
eventOwner:_runCharaScheduler(354082816.0)  [pc 131, 0x85B]
eventOwner:say(quest, 14.0, 0.0)  [pc 136, 0x86F]
eventOwner:finishCliantTalkTurn()  [pc 138, 0x877]
return call109.1.return1
```

## processEventRyaoAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA32]
eventOwner:_runCharaScheduler(79577088.0)  [pc 6, 0xA3E]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0xA52]
eventOwner:say(quest, 49.0, 0.0)  [pc 16, 0xA66]
eventOwner:say(quest, 50.0, 0.0)  [pc 21, 0xA7A]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xA82]
return 
```

## processEventMoogleA00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xB48]
eventOwner:_runCharaScheduler(70086656.0)  [pc 6, 0xB54]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0xB68]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xB70]
return 
```

## processEventMoogleB00 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xC2A]
eventOwner:_runCharaScheduler(70098944.0)  [pc 6, 0xC36]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0xC4A]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC52]
return 
```

## processEventNQ — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xD08]
quest:startNQCutScene('whm0j410', 1.0)  [pc 6, 0xD18]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xD24]
return 
```

## processEventLS — 3 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 2700007.0, 38.0)  [pc 4, 0xDD5]
return 
```

## processEventLS2 — 3 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 2700007.0, 63.0)  [pc 4, 0xE45]
return 
```

## processEventMoogleA01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xEB1]
eventOwner:_runCharaScheduler(70193152.0)  [pc 6, 0xEBD]
eventOwner:say(quest, 30.0, 0.0)  [pc 11, 0xED1]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xED9]
return 
```

## processEventMoogleB01 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurnNoWait(1.0, player)  [pc 3, 0xF93]
eventOwner:_runCharaScheduler(70098944.0)  [pc 6, 0xF9F]
eventOwner:say(quest, 31.0, 0.0)  [pc 11, 0xFB3]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xFBB]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1075]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1081]
eventOwner:say(quest, 26.0, 0.0)  [pc 11, 0x1095]
quest:startFadeOut(player, 1.5)  [pc 15, 0x10A5]
quest:_wait(1.0)  [pc 18, 0x10B1]
eventOwner:_runCharaScheduler(79577088.0)  [pc 21, 0x10BD]
quest:_wait(0.5)  [pc 24, 0x10C9]
quest:startFadeIn(player, 1.5)  [pc 28, 0x10D9]
eventOwner:_runCharaScheduler(353959936.0)  [pc 31, 0x10E5]
eventOwner:say(quest, 27.0, 0.0)  [pc 36, 0x10F9]
eventOwner:say(quest, 28.0, 0.0)  [pc 41, 0x110D]
eventOwner:_runCharaScheduler(70795264.0)  [pc 44, 0x1119]
eventOwner:say(quest, 33.0, 0.0)  [pc 49, 0x112D]
eventOwner:say(quest, 53.0, 0.0)  [pc 54, 0x1141]
eventOwner:_runCharaScheduler(353964032.0)  [pc 57, 0x114D]
eventOwner:say(quest, 54.0, 0.0)  [pc 62, 0x1161]
eventOwner:say(quest, 55.0, 0.0)  [pc 67, 0x1175]
eventOwner:say(quest, 56.0, 0.0)  [pc 72, 0x1189]
eventOwner:_runCharaScheduler(354082816.0)  [pc 75, 0x1195]
eventOwner:say(quest, 39.0, 0.0)  [pc 80, 0x11A9]
eventOwner:say(quest, 57.0, 0.0)  [pc 85, 0x11BD]
eventOwner:say(quest, 58.0, 0.0)  [pc 90, 0x11D1]
eventOwner:_runCharaScheduler(70881280.0)  [pc 93, 0x11DD]
quest:_wait(0.5)  [pc 96, 0x11E9]
eventOwner:say(quest, 34.0, 0.0)  [pc 101, 0x11FD]
eventOwner:say(quest, 35.0, 0.0)  [pc 106, 0x1211]
eventOwner:say(quest, 65.0, 0.0)  [pc 111, 0x1225]
eventOwner:say(quest, 66.0, 0.0)  [pc 116, 0x1239]
eventOwner:_runCharaScheduler(353968128.0)  [pc 119, 0x1245]
eventOwner:say(quest, 36.0, 0.0)  [pc 124, 0x1259]
eventOwner:say(quest, 59.0, 0.0)  [pc 129, 0x126D]
eventOwner:say(quest, 60.0, 0.0)  [pc 134, 0x1281]
eventOwner:_runCharaScheduler(79593472.0)  [pc 137, 0x128D]
quest:_wait(0.5)  [pc 140, 0x1299]
eventOwner:say(quest, 61.0, 0.0)  [pc 145, 0x12AD]
desktopWidget:openPublicInformLongDialogWidget(quest, 64.0)  [pc 150, 0x12C1]
quest:_wait(8.0)  [pc 153, 0x12CD]
quest:showGetJobAbilityWidget(player, 27359.0, 2.0)  [pc 158, 0x12E1]
quest:_wait(6.0)  [pc 161, 0x12ED]
eventOwner:_runCharaScheduler(70795264.0)  [pc 164, 0x12F9]
eventOwner:say(quest, 62.0, 0.0)  [pc 169, 0x130D]
eventOwner:_runCharaScheduler(79597568.0)  [pc 172, 0x1319]
eventOwner:say(quest, 29.0, 0.0)  [pc 177, 0x132D]
eventOwner:finishCliantTalkTurn()  [pc 179, 0x1335]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111244.0, 27.0)  [pc 6, 0x15B4]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111244.0, 27.0)  [pc 6, 0x1631]
return 
```

