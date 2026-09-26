# 111243 whm0j3: reconstructed client path templates

## processEventRAYAOSENNAStart — 3 parameters
### Path 1

```text
require (call65.1.return1 == 1.0) is true  [pc 66, 0x41F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x323]
eventOwner:_runCharaScheduler(354045952.0)  [pc 6, 0x32F]
eventOwner:say(quest, 6.0, 0.0)  [pc 11, 0x343]
eventOwner:say(quest, 7.0, 0.0)  [pc 16, 0x357]
eventOwner:_runCharaScheduler(353964032.0)  [pc 19, 0x363]
eventOwner:say(quest, 8.0, 0.0)  [pc 24, 0x377]
eventOwner:say(quest, 9.0, 0.0)  [pc 29, 0x38B]
eventOwner:say(quest, 11.0, 0.0)  [pc 34, 0x39F]
eventOwner:_runCharaScheduler(70815744.0)  [pc 37, 0x3AB]
eventOwner:say(quest, 12.0, 0.0)  [pc 42, 0x3BF]
eventOwner:_runCharaScheduler(354103296.0)  [pc 45, 0x3CB]
quest:_wait(1.0)  [pc 48, 0x3D7]
eventOwner:say(quest, 13.0, 0.0)  [pc 53, 0x3EB]
eventOwner:say(quest, 14.0, 0.0)  [pc 58, 0x3FF]
eventOwner:say(quest, 20.0, 0.0)  [pc 63, 0x413]
call65.1.return1 = quest:showQuestInfomation()  [pc 65, 0x41B]
eventOwner:_runCharaScheduler(354000896.0)  [pc 70, 0x42F]
quest:_wait(1.0)  [pc 73, 0x43B]
eventOwner:say(quest, 16.0, 0.0)  [pc 78, 0x44F]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x487]
return call65.1.return1
```

### Path 2

```text
require (call65.1.return1 == 1.0) is false  [pc 66, 0x41F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x323]
eventOwner:_runCharaScheduler(354045952.0)  [pc 6, 0x32F]
eventOwner:say(quest, 6.0, 0.0)  [pc 11, 0x343]
eventOwner:say(quest, 7.0, 0.0)  [pc 16, 0x357]
eventOwner:_runCharaScheduler(353964032.0)  [pc 19, 0x363]
eventOwner:say(quest, 8.0, 0.0)  [pc 24, 0x377]
eventOwner:say(quest, 9.0, 0.0)  [pc 29, 0x38B]
eventOwner:say(quest, 11.0, 0.0)  [pc 34, 0x39F]
eventOwner:_runCharaScheduler(70815744.0)  [pc 37, 0x3AB]
eventOwner:say(quest, 12.0, 0.0)  [pc 42, 0x3BF]
eventOwner:_runCharaScheduler(354103296.0)  [pc 45, 0x3CB]
quest:_wait(1.0)  [pc 48, 0x3D7]
eventOwner:say(quest, 13.0, 0.0)  [pc 53, 0x3EB]
eventOwner:say(quest, 14.0, 0.0)  [pc 58, 0x3FF]
eventOwner:say(quest, 20.0, 0.0)  [pc 63, 0x413]
call65.1.return1 = quest:showQuestInfomation()  [pc 65, 0x41B]
eventOwner:_runCharaScheduler(353980416.0)  [pc 82, 0x45F]
quest:_wait(1.0)  [pc 85, 0x46B]
eventOwner:say(quest, 15.0, 0.0)  [pc 90, 0x47F]
eventOwner:finishCliantTalkTurn()  [pc 92, 0x487]
return call65.1.return1
```

## processEventRAYAOSENNAStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x5F3]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x5FF]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x613]
worldMaster:say(quest, 5.0, 0.0)  [pc 17, 0x62B]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x633]
return 
```

## processEventMOOGLEAStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x701]
eventOwner:_runCharaScheduler(70193152.0)  [pc 6, 0x70D]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x721]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x729]
return 
```

## processEventMOOGLEBStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7D4]
eventOwner:_runCharaScheduler(70189056.0)  [pc 6, 0x7E0]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x7F4]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x7FC]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x8B0]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x8BC]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0x8D0]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x8D8]
return 
```

## processEvent000_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x98C]
eventOwner:_runCharaScheduler(70086656.0)  [pc 6, 0x998]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0x9AC]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x9B4]
return 
```

## processEvent000_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA68]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0xA74]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0xA88]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA90]
return 
```

## processEvent005 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB44]
eventOwner:_runCharaScheduler(79577088.0)  [pc 6, 0xB50]
eventOwner:say(quest, 24.0, 0.0)  [pc 11, 0xB64]
eventOwner:say(quest, 25.0, 0.0)  [pc 16, 0xB78]
quest:_wait(0.5)  [pc 19, 0xB84]
eventOwner:_runCharaScheduler(70795264.0)  [pc 22, 0xB90]
quest:_wait(0.5)  [pc 25, 0xB9C]
eventOwner:say(quest, 26.0, 0.0)  [pc 30, 0xBB0]
eventOwner:_runCharaScheduler(79593472.0)  [pc 33, 0xBBC]
eventOwner:say(quest, 27.0, 0.0)  [pc 38, 0xBD0]
desktopWidget:openPublicInformLongDialogWidget(quest, 31.0)  [pc 43, 0xBE4]
quest:_wait(8.0)  [pc 46, 0xBF0]
quest:showGetJobAbilityWidget(player, 27357.0, 2.0)  [pc 51, 0xC04]
quest:_wait(6.0)  [pc 54, 0xC10]
eventOwner:say(quest, 28.0, 0.0)  [pc 59, 0xC24]
eventOwner:_runCharaScheduler(364756992.0)  [pc 62, 0xC30]
eventOwner:say(quest, 29.0, 0.0)  [pc 67, 0xC44]
worldMaster:say(quest, 30.0, 0.0)  [pc 73, 0xC5C]
eventOwner:finishCliantTalkTurn()  [pc 75, 0xC64]
return 
```

## processEvent005_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE08]
eventOwner:_runCharaScheduler(70086656.0)  [pc 6, 0xE14]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0xE28]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE30]
return 
```

## processEvent005_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xEE4]
eventOwner:_runCharaScheduler(70197248.0)  [pc 6, 0xEF0]
eventOwner:say(quest, 23.0, 0.0)  [pc 11, 0xF04]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF0C]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111243.0, 27.0)  [pc 6, 0xFCC]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111243.0, 27.0)  [pc 6, 0x1049]
return 
```

