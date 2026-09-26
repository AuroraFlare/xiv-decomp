# 111611 com5g1: reconstructed client path templates

## processEventFULKEStart — 6 parameters
### Path 1

```text
require (call76.1.return1 == 1.0) is true  [pc 77, 0x450]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x32C]
call8.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 8, 0x33C]
quest:_wait(1.0)  [pc 11, 0x348]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x35C]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x370]
eventOwner:say(quest, 4.0, 0.0)  [pc 26, 0x384]
eventOwner:_runCharaScheduler(354086912.0)  [pc 29, 0x390]
eventOwner:say(quest, 5.0, 0.0)  [pc 34, 0x3A4]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x3B8]
eventOwner:say(quest, 7.0, 0.0)  [pc 44, 0x3CC]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x3D8]
quest:_wait(1.5)  [pc 50, 0x3E4]
eventOwner:say(quest, 8.0, 0.0)  [pc 55, 0x3F8]
eventOwner:say(quest, 58.0, 0.0)  [pc 60, 0x40C]
eventOwner:say(quest, 9.0, 0.0)  [pc 65, 0x420]
eventOwner:say(quest, 59.0, 0.0, 0.0, arg4, arg5, arg6)  [pc 74, 0x444]
call76.1.return1 = quest:showQuestInfomation()  [pc 76, 0x44C]
eventOwner:_runCharaScheduler(70795264.0)  [pc 81, 0x460]
eventOwner:say(quest, 11.0, 0.0)  [pc 86, 0x474]
eventOwner:finishCliantTalkTurn()  [pc 97, 0x4A0]
return call76.1.return1
```

### Path 2

```text
require (call76.1.return1 == 1.0) is false  [pc 77, 0x450]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x32C]
call8.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 8, 0x33C]
quest:_wait(1.0)  [pc 11, 0x348]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x35C]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x370]
eventOwner:say(quest, 4.0, 0.0)  [pc 26, 0x384]
eventOwner:_runCharaScheduler(354086912.0)  [pc 29, 0x390]
eventOwner:say(quest, 5.0, 0.0)  [pc 34, 0x3A4]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x3B8]
eventOwner:say(quest, 7.0, 0.0)  [pc 44, 0x3CC]
eventOwner:_runCharaScheduler(354099200.0)  [pc 47, 0x3D8]
quest:_wait(1.5)  [pc 50, 0x3E4]
eventOwner:say(quest, 8.0, 0.0)  [pc 55, 0x3F8]
eventOwner:say(quest, 58.0, 0.0)  [pc 60, 0x40C]
eventOwner:say(quest, 9.0, 0.0)  [pc 65, 0x420]
eventOwner:say(quest, 59.0, 0.0, 0.0, arg4, arg5, arg6)  [pc 74, 0x444]
call76.1.return1 = quest:showQuestInfomation()  [pc 76, 0x44C]
eventOwner:_runCharaScheduler(70832128.0)  [pc 90, 0x484]
eventOwner:say(quest, 10.0, 0.0)  [pc 95, 0x498]
eventOwner:finishCliantTalkTurn()  [pc 97, 0x4A0]
return call76.1.return1
```

## processEvent_000 — 6 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0x61E]
eventOwner:say(quest, 12.0, 0.0)  [pc 9, 0x632]
eventOwner:_runCharaScheduler(354086912.0)  [pc 12, 0x63E]
eventOwner:say(quest, 13.0, 0.0, 0.0, arg4, arg5, arg6)  [pc 21, 0x662]
worldMaster:say(quest, 60.0, 1.0, arg4, arg5, arg6)  [pc 30, 0x686]
eventOwner:finishCliantTalkTurn()  [pc 32, 0x68E]
return 
```

## processEvent_010 — 6 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 4, 0x772]
eventOwner:say(quest, 14.0, 0.0)  [pc 9, 0x786]
eventOwner:say(quest, 15.0, 0.0)  [pc 14, 0x79A]
eventOwner:_runCharaScheduler(354086912.0)  [pc 17, 0x7A6]
quest:_wait(1.0)  [pc 20, 0x7B2]
eventOwner:say(quest, 16.0, 0.0)  [pc 25, 0x7C6]
eventOwner:say(quest, 17.0, 0.0)  [pc 30, 0x7DA]
eventOwner:say(quest, 18.0, 0.0)  [pc 35, 0x7EE]
eventOwner:_runCharaScheduler(353984512.0)  [pc 38, 0x7FA]
eventOwner:say(quest, 19.0, 0.0)  [pc 43, 0x80E]
eventOwner:say(quest, 20.0, 0.0)  [pc 48, 0x822]
eventOwner:_runCharaScheduler(354082816.0)  [pc 51, 0x82E]
eventOwner:say(quest, 21.0, 0.0, 0.0, arg4, arg5, arg6)  [pc 60, 0x852]
worldMaster:say(quest, 64.0, 1.0, arg4, arg5, arg6)  [pc 69, 0x876]
eventOwner:say(quest, 22.0, 0.0)  [pc 74, 0x88A]
eventOwner:finishCliantTalkTurn()  [pc 76, 0x892]
return 
```

## processEvent_010_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9C5]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0x9D1]
eventOwner:say(quest, 67.0, 0.0)  [pc 11, 0x9E5]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x9ED]
return 
```

## processEvent_010_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAA1]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0xAAD]
eventOwner:say(quest, 68.0, 0.0)  [pc 11, 0xAC1]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xAC9]
return 
```

## processEvent_010_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB7D]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0xB89]
eventOwner:say(quest, 69.0, 0.0)  [pc 11, 0xB9D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xBA5]
return 
```

## processEvent_010_5 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC59]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0xC65]
eventOwner:say(quest, 70.0, 0.0)  [pc 11, 0xC79]
eventOwner:say(quest, 71.0, 0.0)  [pc 16, 0xC8D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xC95]
return 
```

## processEvent_010_6 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD52]
eventOwner:_runCharaScheduler(353984512.0)  [pc 6, 0xD5E]
eventOwner:say(quest, 72.0, 0.0)  [pc 11, 0xD72]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD7A]
return 
```

## processEvent_020 — 6 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 4, 0xE32]
eventOwner:say(quest, 27.0, 0.0)  [pc 9, 0xE46]
eventOwner:_runCharaScheduler(354082816.0)  [pc 12, 0xE52]
eventOwner:say(quest, 28.0, 0.0)  [pc 17, 0xE66]
eventOwner:say(quest, 29.0, 0.0)  [pc 22, 0xE7A]
worldMaster:say(quest, 30.0, 1.0, 0.0)  [pc 29, 0xE96]
eventOwner:_runCharaScheduler(354103296.0)  [pc 32, 0xEA2]
eventOwner:say(quest, 31.0, 0.0)  [pc 37, 0xEB6]
worldMaster:say(quest, 32.0, 1.0, arg4, arg5, arg6)  [pc 46, 0xEDA]
eventOwner:say(quest, 33.0, 0.0)  [pc 51, 0xEEE]
eventOwner:say(quest, 34.0, 0.0)  [pc 56, 0xF02]
eventOwner:_runCharaScheduler(354041856.0)  [pc 59, 0xF0E]
eventOwner:say(quest, 35.0, 0.0)  [pc 64, 0xF22]
worldMaster:say(quest, 66.0, 1.0, arg4, arg5, arg6)  [pc 73, 0xF46]
eventOwner:say(quest, 36.0, 0.0)  [pc 78, 0xF5A]
eventOwner:_runCharaScheduler(353959936.0)  [pc 81, 0xF66]
eventOwner:say(quest, 37.0, 0.0)  [pc 86, 0xF7A]
eventOwner:finishCliantTalkTurn()  [pc 88, 0xF82]
return 
```

## processEvent_020_1 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0x10FE]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10D2]
eventOwner:say(quest, 57.0, 0.0)  [pc 8, 0x10E6]
call13.1.return1 = eventOwner:ask(quest, 38.0, 2.0)  [pc 13, 0x10FA]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0x10FE]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10D2]
eventOwner:say(quest, 57.0, 0.0)  [pc 8, 0x10E6]
call13.1.return1 = eventOwner:ask(quest, 38.0, 2.0)  [pc 13, 0x10FA]
eventOwner:say(quest, 63.0, 0.0)  [pc 21, 0x111A]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x1122]
return call13.1.return1
```

## processEvent_030_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11DD]
eventOwner:say(quest, 41.0, 0.0)  [pc 8, 0x11F1]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x11F9]
return 
```

## processEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(1.0, player)  [pc 3, 0x128C]
eventOwner:say(quest, 42.0, 0.0)  [pc 8, 0x12A0]
player:_runCharaScheduler(354107392.0)  [pc 11, 0x12AC]
quest:_wait(3.0)  [pc 14, 0x12B8]
eventOwner:say(quest, 43.0, 0.0)  [pc 19, 0x12CC]
player:_runCharaScheduler(70795264.0)  [pc 22, 0x12D8]
eventOwner:say(quest, 44.0, 0.0)  [pc 27, 0x12EC]
eventOwner:say(quest, 45.0, 0.0)  [pc 32, 0x1300]
eventOwner:say(quest, 65.0, 0.0)  [pc 37, 0x1314]
eventOwner:say(quest, 46.0, 0.0)  [pc 42, 0x1328]
eventOwner:say(quest, 47.0, 0.0)  [pc 47, 0x133C]
eventOwner:_runCharaScheduler(70795264.0)  [pc 50, 0x1348]
eventOwner:say(quest, 48.0, 0.0)  [pc 55, 0x135C]
eventOwner:finishCliantTalkTurn()  [pc 57, 0x1364]
return 
```

## processEvent_050 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1474]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x1484]
quest:_wait(1.0)  [pc 10, 0x1490]
eventOwner:say(quest, 50.0, 0.0)  [pc 15, 0x14A4]
quest:startFadeOut(player, 1.0)  [pc 19, 0x14B4]
quest:_wait(2.0)  [pc 22, 0x14C0]
quest:startFadeIn(player, 1.0)  [pc 26, 0x14D0]
eventOwner:_runCharaScheduler(354086912.0)  [pc 29, 0x14DC]
eventOwner:say(quest, 51.0, 0.0)  [pc 34, 0x14F0]
eventOwner:say(quest, 52.0, 0.0)  [pc 39, 0x1504]
eventOwner:say(quest, 53.0, 0.0)  [pc 44, 0x1518]
eventOwner:say(quest, 61.0, 0.0)  [pc 49, 0x152C]
eventOwner:say(quest, 54.0, 0.0)  [pc 54, 0x1540]
eventOwner:_runCharaScheduler(354099200.0)  [pc 57, 0x154C]
eventOwner:say(quest, 55.0, 0.0)  [pc 62, 0x1560]
eventOwner:say(quest, 56.0, 0.0)  [pc 67, 0x1574]
eventOwner:finishCliantTalkTurn()  [pc 69, 0x157C]
return 
```

