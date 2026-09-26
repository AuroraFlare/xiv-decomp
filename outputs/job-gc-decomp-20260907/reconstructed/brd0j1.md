# 111301 brd0j1: reconstructed client path templates

## processEventGEORJEAUXStart — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 4, 0x303]
require (call82.1.return1 == 1.0) is true  [pc 83, 0x43F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2FF]
eventOwner:say(quest, 2.0, 0.0)  [pc 10, 0x31B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x33F]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x353]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x367]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x37B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3AF]
eventOwner:say(quest, 48.0, 0.0)  [pc 52, 0x3C3]
eventOwner:say(quest, 49.0, 0.0)  [pc 57, 0x3D7]
eventOwner:say(quest, 50.0, 0.0)  [pc 62, 0x3EB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x3F7]
eventOwner:say(quest, 51.0, 0.0)  [pc 70, 0x40B]
eventOwner:say(quest, 52.0, 0.0)  [pc 75, 0x41F]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x433]
call82.1.return1 = quest:showQuestInfomation()  [pc 82, 0x43B]
eventOwner:_runCharaScheduler(353964032.0)  [pc 87, 0x44F]
eventOwner:say(quest, 10.0, 0.0)  [pc 92, 0x463]
eventOwner:say(quest, 11.0, 0.0)  [pc 97, 0x477]
eventOwner:finishCliantTalkTurn()  [pc 108, 0x4A3]
return call82.1.return1
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 4, 0x303]
require (call82.1.return1 == 1.0) is false  [pc 83, 0x43F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2FF]
eventOwner:say(quest, 2.0, 0.0)  [pc 10, 0x31B]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x33F]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x353]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x367]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x37B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3AF]
eventOwner:say(quest, 48.0, 0.0)  [pc 52, 0x3C3]
eventOwner:say(quest, 49.0, 0.0)  [pc 57, 0x3D7]
eventOwner:say(quest, 50.0, 0.0)  [pc 62, 0x3EB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x3F7]
eventOwner:say(quest, 51.0, 0.0)  [pc 70, 0x40B]
eventOwner:say(quest, 52.0, 0.0)  [pc 75, 0x41F]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x433]
call82.1.return1 = quest:showQuestInfomation()  [pc 82, 0x43B]
eventOwner:_runCharaScheduler(70881280.0)  [pc 101, 0x487]
eventOwner:say(quest, 9.0, 0.0)  [pc 106, 0x49B]
eventOwner:finishCliantTalkTurn()  [pc 108, 0x4A3]
return call82.1.return1
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 4, 0x303]
require (call82.1.return1 == 1.0) is true  [pc 83, 0x43F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2FF]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x333]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x33F]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x353]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x367]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x37B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3AF]
eventOwner:say(quest, 48.0, 0.0)  [pc 52, 0x3C3]
eventOwner:say(quest, 49.0, 0.0)  [pc 57, 0x3D7]
eventOwner:say(quest, 50.0, 0.0)  [pc 62, 0x3EB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x3F7]
eventOwner:say(quest, 51.0, 0.0)  [pc 70, 0x40B]
eventOwner:say(quest, 52.0, 0.0)  [pc 75, 0x41F]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x433]
call82.1.return1 = quest:showQuestInfomation()  [pc 82, 0x43B]
eventOwner:_runCharaScheduler(353964032.0)  [pc 87, 0x44F]
eventOwner:say(quest, 10.0, 0.0)  [pc 92, 0x463]
eventOwner:say(quest, 11.0, 0.0)  [pc 97, 0x477]
eventOwner:finishCliantTalkTurn()  [pc 108, 0x4A3]
return call82.1.return1
```

### Path 4

```text
require (arg4 == 1.0) is false  [pc 4, 0x303]
require (call82.1.return1 == 1.0) is false  [pc 83, 0x43F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2FF]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x333]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x33F]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x353]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x367]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x37B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x387]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x39B]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3AF]
eventOwner:say(quest, 48.0, 0.0)  [pc 52, 0x3C3]
eventOwner:say(quest, 49.0, 0.0)  [pc 57, 0x3D7]
eventOwner:say(quest, 50.0, 0.0)  [pc 62, 0x3EB]
eventOwner:_runCharaScheduler(354041856.0)  [pc 65, 0x3F7]
eventOwner:say(quest, 51.0, 0.0)  [pc 70, 0x40B]
eventOwner:say(quest, 52.0, 0.0)  [pc 75, 0x41F]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x433]
call82.1.return1 = quest:showQuestInfomation()  [pc 82, 0x43B]
eventOwner:_runCharaScheduler(70881280.0)  [pc 101, 0x487]
eventOwner:say(quest, 9.0, 0.0)  [pc 106, 0x49B]
eventOwner:finishCliantTalkTurn()  [pc 108, 0x4A3]
return call82.1.return1
```

## processEvent000_GEORJEAUX — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x61F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x62B]
eventOwner:say(quest, 14.0, 0.0)  [pc 11, 0x63F]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x647]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6FB]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0x707]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0x71B]
eventOwner:say(quest, 46.0, 0.0)  [pc 16, 0x72F]
eventOwner:say(quest, 16.0, 0.0)  [pc 21, 0x743]
eventOwner:_runCharaScheduler(70815744.0)  [pc 24, 0x74F]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0x763]
eventOwner:say(quest, 18.0, 0.0)  [pc 34, 0x777]
eventOwner:_runCharaScheduler(70828032.0)  [pc 37, 0x783]
eventOwner:say(quest, 19.0, 0.0)  [pc 42, 0x797]
quest:_wait(2.0)  [pc 45, 0x7A3]
eventOwner:say(quest, 21.0, 0.0)  [pc 50, 0x7B7]
eventOwner:_runCharaScheduler(69521408.0)  [pc 53, 0x7C3]
quest:_wait(1.5)  [pc 56, 0x7CF]
player:_runCharaScheduler(67111909.0)  [pc 59, 0x7DB]
eventOwner:say(quest, 53.0, 0.0)  [pc 64, 0x7EF]
eventOwner:_runCharaScheduler(70828032.0)  [pc 67, 0x7FB]
eventOwner:say(quest, 22.0, 0.0)  [pc 72, 0x80F]
eventOwner:say(quest, 23.0, 0.0)  [pc 77, 0x823]
eventOwner:_runCharaScheduler(70828032.0)  [pc 80, 0x82F]
eventOwner:say(quest, 24.0, 0.0)  [pc 85, 0x843]
eventOwner:say(quest, 54.0, 0.0)  [pc 90, 0x857]
eventOwner:_runCharaScheduler(69521408.0)  [pc 93, 0x863]
quest:_wait(1.5)  [pc 96, 0x86F]
player:_runCharaScheduler(67111909.0)  [pc 99, 0x87B]
eventOwner:say(quest, 25.0, 0.0)  [pc 104, 0x88F]
eventOwner:_runCharaScheduler(69521408.0)  [pc 107, 0x89B]
quest:_wait(1.5)  [pc 110, 0x8A7]
player:_runCharaScheduler(67111909.0)  [pc 113, 0x8B3]
eventOwner:finishCliantTalkTurn()  [pc 115, 0x8BB]
return 
```

## processEvent005_JEHANTEL — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA13]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0xA1F]
quest:_wait(1.5)  [pc 9, 0xA2B]
player:_runCharaScheduler(67111909.0)  [pc 12, 0xA37]
eventOwner:say(quest, 26.0, 0.0)  [pc 17, 0xA4B]
eventOwner:say(quest, 55.0, 0.0)  [pc 22, 0xA5F]
eventOwner:finishCliantTalkTurn()  [pc 24, 0xA67]
return 
```

## processEvent005 — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(70086656.0)  [pc 2, 0xB3D]
eventOwner:say(quest, 27.0, 0.0)  [pc 7, 0xB51]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 11, 0xB61]
eventOwner:say(quest, 28.0, 0.0)  [pc 16, 0xB75]
eventOwner:say(quest, 56.0, 0.0)  [pc 21, 0xB89]
eventOwner:_runCharaScheduler(70082560.0)  [pc 24, 0xB95]
eventOwner:say(quest, 29.0, 0.0)  [pc 29, 0xBA9]
eventOwner:say(quest, 30.0, 0.0)  [pc 34, 0xBBD]
eventOwner:_runCharaScheduler(70078464.0)  [pc 37, 0xBC9]
eventOwner:say(quest, 31.0, 0.0)  [pc 42, 0xBDD]
eventOwner:say(quest, 32.0, 0.0)  [pc 47, 0xBF1]
eventOwner:_runCharaScheduler(70082560.0)  [pc 50, 0xBFD]
eventOwner:say(quest, 33.0, 0.0)  [pc 55, 0xC11]
eventOwner:say(quest, 57.0, 0.0)  [pc 60, 0xC25]
eventOwner:_runCharaScheduler(70057984.0)  [pc 63, 0xC31]
eventOwner:say(quest, 34.0, 0.0)  [pc 68, 0xC45]
eventOwner:say(quest, 58.0, 0.0)  [pc 73, 0xC59]
eventOwner:say(quest, 35.0, 0.0)  [pc 78, 0xC6D]
eventOwner:_runCharaScheduler(70078464.0)  [pc 81, 0xC79]
eventOwner:say(quest, 59.0, 0.0)  [pc 86, 0xC8D]
eventOwner:finishCliantTalkTurn()  [pc 88, 0xC95]
return 
```

## processEvent010_PUKNOPOKI — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xDD0]
eventOwner:_runCharaScheduler(70184960.0)  [pc 6, 0xDDC]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0xDF0]
eventOwner:say(quest, 60.0, 0.0)  [pc 16, 0xE04]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xE0C]
return 
```

## processEvent015 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xEC9]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0xED5]
quest:_wait(1.5)  [pc 9, 0xEE1]
player:_runCharaScheduler(67111909.0)  [pc 12, 0xEED]
eventOwner:say(quest, 37.0, 0.0)  [pc 17, 0xF01]
eventOwner:_runCharaScheduler(70799360.0)  [pc 20, 0xF0D]
eventOwner:say(quest, 61.0, 0.0)  [pc 25, 0xF21]
eventOwner:say(quest, 62.0, 0.0)  [pc 30, 0xF35]
eventOwner:say(quest, 63.0, 0.0)  [pc 35, 0xF49]
eventOwner:_runCharaScheduler(70815744.0)  [pc 38, 0xF55]
eventOwner:say(quest, 64.0, 0.0)  [pc 43, 0xF69]
eventOwner:say(quest, 65.0, 0.0)  [pc 48, 0xF7D]
eventOwner:say(quest, 66.0, 0.0)  [pc 53, 0xF91]
eventOwner:_runCharaScheduler(69521408.0)  [pc 56, 0xF9D]
quest:_wait(1.5)  [pc 59, 0xFA9]
player:_runCharaScheduler(67111909.0)  [pc 62, 0xFB5]
eventOwner:say(quest, 38.0, 0.0)  [pc 67, 0xFC9]
eventOwner:_runCharaScheduler(70795264.0)  [pc 70, 0xFD5]
eventOwner:say(quest, 39.0, 0.0)  [pc 75, 0xFE9]
eventOwner:say(quest, 67.0, 0.0)  [pc 80, 0xFFD]
eventOwner:say(quest, 68.0, 0.0)  [pc 85, 0x1011]
eventOwner:say(quest, 69.0, 0.0)  [pc 90, 0x1025]
eventOwner:_runCharaScheduler(70815744.0)  [pc 93, 0x1031]
eventOwner:say(quest, 41.0, 0.0)  [pc 98, 0x1045]
eventOwner:_runCharaScheduler(69521408.0)  [pc 101, 0x1051]
quest:_wait(1.5)  [pc 104, 0x105D]
player:_runCharaScheduler(67111909.0)  [pc 107, 0x1069]
eventOwner:say(quest, 42.0, 0.0)  [pc 112, 0x107D]
eventOwner:say(quest, 70.0, 0.0)  [pc 117, 0x1091]
worldMaster:say(quest, 43.0, 0.0)  [pc 123, 0x10A9]
eventOwner:finishCliantTalkTurn()  [pc 125, 0x10B1]
return 
```

## processEventJob — 4 parameters
### Path 1

```text
quest:showGetJobItemWidget(player, arg4)  [pc 3, 0x1235]
quest:_wait(6.0)  [pc 6, 0x1241]
desktopWidget:openPublicInformLongDialogWidget(quest, 71.0)  [pc 11, 0x1255]
quest:_wait(8.0)  [pc 14, 0x1261]
quest:showGetJobAbilityWidget(player, 27237.0, 2.0)  [pc 19, 0x1275]
quest:_wait(6.0)  [pc 22, 0x1281]
return 
```

## processEvent_GEORJEAUXS_Hint — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51130.0, 111301.0, 7.0, 30.0, 23.0, 15.0)  [pc 9, 0x137D]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111301.0, 7.0)  [pc 6, 0x1415]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111301.0, 7.0)  [pc 6, 0x1492]
return 
```

