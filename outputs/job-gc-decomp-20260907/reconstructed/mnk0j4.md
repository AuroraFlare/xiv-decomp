# 111224 mnk0j4: reconstructed client path templates

## processEventERIKStart — 4 parameters
### Path 1

```text
require (call172.1.return1 == 1.0) is true  [pc 173, 0x587]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2EB]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0x2FF]
eventOwner:_runCharaScheduler(70803456.0)  [pc 14, 0x30B]
eventOwner:say(quest, 8.0, 0.0)  [pc 19, 0x31F]
eventOwner:_runCharaScheduler(354099200.0)  [pc 22, 0x32B]
eventOwner:say(quest, 9.0, 0.0)  [pc 27, 0x33F]
quest:_wait(0.5)  [pc 30, 0x34B]
quest:startFadeOut(player, 1.0)  [pc 34, 0x35B]
quest:_wait(2.0)  [pc 37, 0x367]
quest:startFadeIn(player, 1.0)  [pc 41, 0x377]
eventOwner:say(quest, 10.0, 0.0)  [pc 46, 0x38B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 49, 0x397]
eventOwner:say(quest, 11.0, 0.0)  [pc 54, 0x3AB]
eventOwner:say(quest, 39.0, 0.0)  [pc 59, 0x3BF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 62, 0x3CB]
eventOwner:say(quest, 40.0, 0.0)  [pc 67, 0x3DF]
eventOwner:say(quest, 41.0, 0.0)  [pc 72, 0x3F3]
eventOwner:_runCharaScheduler(70795264.0)  [pc 75, 0x3FF]
eventOwner:say(quest, 42.0, 0.0)  [pc 80, 0x413]
eventOwner:say(quest, 43.0, 0.0)  [pc 85, 0x427]
eventOwner:_runCharaScheduler(70815744.0)  [pc 88, 0x433]
quest:_wait(1.5)  [pc 91, 0x43F]
eventOwner:say(quest, 44.0, 0.0)  [pc 96, 0x453]
eventOwner:_runCharaScheduler(353964032.0)  [pc 99, 0x45F]
eventOwner:say(quest, 12.0, 0.0)  [pc 104, 0x473]
eventOwner:say(quest, 13.0, 0.0)  [pc 109, 0x487]
eventOwner:_runCharaScheduler(353980416.0)  [pc 112, 0x493]
eventOwner:say(quest, 45.0, 0.0)  [pc 117, 0x4A7]
eventOwner:say(quest, 14.0, 0.0)  [pc 122, 0x4BB]
eventOwner:say(quest, 46.0, 0.0)  [pc 127, 0x4CF]
quest:_wait(0.5)  [pc 130, 0x4DB]
eventOwner:_runCharaScheduler(354103296.0)  [pc 133, 0x4E7]
quest:_wait(0.5)  [pc 136, 0x4F3]
eventOwner:say(quest, 35.0, 0.0)  [pc 141, 0x507]
eventOwner:say(quest, 47.0, 0.0)  [pc 146, 0x51B]
quest:_wait(0.5)  [pc 149, 0x527]
eventOwner:_runCharaScheduler(70795264.0)  [pc 152, 0x533]
eventOwner:say(quest, 15.0, 0.0)  [pc 157, 0x547]
eventOwner:say(quest, 48.0, 0.0)  [pc 162, 0x55B]
eventOwner:_runCharaScheduler(70803456.0)  [pc 165, 0x567]
eventOwner:say(quest, 49.0, 0.0)  [pc 170, 0x57B]
call172.1.return1 = quest:showQuestInfomation()  [pc 172, 0x583]
eventOwner:_runCharaScheduler(353959936.0)  [pc 177, 0x597]
eventOwner:say(quest, 17.0, 0.0)  [pc 182, 0x5AB]
eventOwner:say(quest, 18.0, 0.0)  [pc 187, 0x5BF]
eventOwner:finishCliantTalkTurn()  [pc 201, 0x5F7]
return call172.1.return1
```

### Path 2

```text
require (call172.1.return1 == 1.0) is false  [pc 173, 0x587]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2EB]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0x2FF]
eventOwner:_runCharaScheduler(70803456.0)  [pc 14, 0x30B]
eventOwner:say(quest, 8.0, 0.0)  [pc 19, 0x31F]
eventOwner:_runCharaScheduler(354099200.0)  [pc 22, 0x32B]
eventOwner:say(quest, 9.0, 0.0)  [pc 27, 0x33F]
quest:_wait(0.5)  [pc 30, 0x34B]
quest:startFadeOut(player, 1.0)  [pc 34, 0x35B]
quest:_wait(2.0)  [pc 37, 0x367]
quest:startFadeIn(player, 1.0)  [pc 41, 0x377]
eventOwner:say(quest, 10.0, 0.0)  [pc 46, 0x38B]
eventOwner:_runCharaScheduler(354041856.0)  [pc 49, 0x397]
eventOwner:say(quest, 11.0, 0.0)  [pc 54, 0x3AB]
eventOwner:say(quest, 39.0, 0.0)  [pc 59, 0x3BF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 62, 0x3CB]
eventOwner:say(quest, 40.0, 0.0)  [pc 67, 0x3DF]
eventOwner:say(quest, 41.0, 0.0)  [pc 72, 0x3F3]
eventOwner:_runCharaScheduler(70795264.0)  [pc 75, 0x3FF]
eventOwner:say(quest, 42.0, 0.0)  [pc 80, 0x413]
eventOwner:say(quest, 43.0, 0.0)  [pc 85, 0x427]
eventOwner:_runCharaScheduler(70815744.0)  [pc 88, 0x433]
quest:_wait(1.5)  [pc 91, 0x43F]
eventOwner:say(quest, 44.0, 0.0)  [pc 96, 0x453]
eventOwner:_runCharaScheduler(353964032.0)  [pc 99, 0x45F]
eventOwner:say(quest, 12.0, 0.0)  [pc 104, 0x473]
eventOwner:say(quest, 13.0, 0.0)  [pc 109, 0x487]
eventOwner:_runCharaScheduler(353980416.0)  [pc 112, 0x493]
eventOwner:say(quest, 45.0, 0.0)  [pc 117, 0x4A7]
eventOwner:say(quest, 14.0, 0.0)  [pc 122, 0x4BB]
eventOwner:say(quest, 46.0, 0.0)  [pc 127, 0x4CF]
quest:_wait(0.5)  [pc 130, 0x4DB]
eventOwner:_runCharaScheduler(354103296.0)  [pc 133, 0x4E7]
quest:_wait(0.5)  [pc 136, 0x4F3]
eventOwner:say(quest, 35.0, 0.0)  [pc 141, 0x507]
eventOwner:say(quest, 47.0, 0.0)  [pc 146, 0x51B]
quest:_wait(0.5)  [pc 149, 0x527]
eventOwner:_runCharaScheduler(70795264.0)  [pc 152, 0x533]
eventOwner:say(quest, 15.0, 0.0)  [pc 157, 0x547]
eventOwner:say(quest, 48.0, 0.0)  [pc 162, 0x55B]
eventOwner:_runCharaScheduler(70803456.0)  [pc 165, 0x567]
eventOwner:say(quest, 49.0, 0.0)  [pc 170, 0x57B]
call172.1.return1 = quest:showQuestInfomation()  [pc 172, 0x583]
eventOwner:_runCharaScheduler(354066432.0)  [pc 191, 0x5CF]
quest:_wait(1.0)  [pc 194, 0x5DB]
eventOwner:say(quest, 16.0, 0.0)  [pc 199, 0x5EF]
eventOwner:finishCliantTalkTurn()  [pc 201, 0x5F7]
return call172.1.return1
```

## processEventERIKStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x83A]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x846]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x85A]
worldMaster:say(quest, 4.0, 0.0)  [pc 17, 0x872]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x87A]
return 
```

## processEventWIDARGELTStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x948]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0x954]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x968]
eventOwner:say(quest, 38.0, 0.0)  [pc 16, 0x97C]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x984]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA38]
eventOwner:say(quest, 33.0, 0.0)  [pc 8, 0xA4C]
eventOwner:_runCharaScheduler(354000896.0)  [pc 11, 0xA58]
eventOwner:say(quest, 34.0, 0.0)  [pc 16, 0xA6C]
eventOwner:say(quest, 51.0, 0.0)  [pc 21, 0xA80]
eventOwner:finishCliantTalkTurn()  [pc 23, 0xA88]
return 
```

## processEvent000_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB4E]
eventOwner:_runCharaScheduler(70881280.0)  [pc 6, 0xB5A]
eventOwner:say(quest, 19.0, 0.0)  [pc 11, 0xB6E]
eventOwner:say(quest, 50.0, 0.0)  [pc 16, 0xB82]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xB8A]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51125.0, 11000555.0)  [pc 5, 0xC4F]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27118.0, 3.0)  [pc 4, 0xCEB]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 2200241.0, 93.0)  [pc 4, 0xD5A]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111224.0, 15.0)  [pc 6, 0xDCE]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111224.0, 15.0)  [pc 6, 0xE4B]
return 
```

