# 111222 mnk0j2: reconstructed client path templates

## processEventERIKStart — 3 parameters
### Path 1

```text
require (call149.1.return1 == 1.0) is true  [pc 150, 0x52B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x2EB]
quest:_wait(0.5)  [pc 9, 0x2F7]
eventOwner:say(quest, 6.0, 0.0)  [pc 14, 0x30B]
eventOwner:say(quest, 39.0, 0.0)  [pc 19, 0x31F]
eventOwner:say(quest, 34.0, 0.0)  [pc 24, 0x333]
eventOwner:_runCharaScheduler(354103296.0)  [pc 27, 0x33F]
eventOwner:say(quest, 7.0, 0.0)  [pc 32, 0x353]
eventOwner:say(quest, 8.0, 0.0)  [pc 37, 0x367]
eventOwner:_runCharaScheduler(70803456.0)  [pc 40, 0x373]
eventOwner:say(quest, 40.0, 0.0)  [pc 45, 0x387]
eventOwner:finishCliantTalkTurn()  [pc 47, 0x38F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 50, 0x39B]
eventOwner:say(quest, 9.0, 0.0)  [pc 55, 0x3AF]
eventOwner:_runCharaScheduler(70881280.0)  [pc 58, 0x3BB]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x3CF]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 67, 0x3DF]
eventOwner:_runCharaScheduler(353972224.0)  [pc 70, 0x3EB]
eventOwner:say(quest, 11.0, 0.0)  [pc 75, 0x3FF]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x407]
eventOwner:say(quest, 12.0, 0.0)  [pc 82, 0x41B]
eventOwner:say(quest, 13.0, 0.0)  [pc 87, 0x42F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 91, 0x43F]
eventOwner:_runCharaScheduler(354000896.0)  [pc 94, 0x44B]
quest:_wait(0.5)  [pc 97, 0x457]
eventOwner:say(quest, 33.0, 0.0)  [pc 102, 0x46B]
eventOwner:say(quest, 41.0, 0.0)  [pc 107, 0x47F]
eventOwner:say(quest, 42.0, 0.0)  [pc 112, 0x493]
eventOwner:_runCharaScheduler(353980416.0)  [pc 115, 0x49F]
eventOwner:say(quest, 14.0, 0.0)  [pc 120, 0x4B3]
quest:_wait(0.5)  [pc 123, 0x4BF]
eventOwner:_runCharaScheduler(70795264.0)  [pc 126, 0x4CB]
quest:_wait(1.0)  [pc 129, 0x4D7]
eventOwner:say(quest, 15.0, 0.0)  [pc 134, 0x4EB]
eventOwner:say(quest, 43.0, 0.0)  [pc 139, 0x4FF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 142, 0x50B]
eventOwner:say(quest, 44.0, 0.0)  [pc 147, 0x51F]
call149.1.return1 = quest:showQuestInfomation()  [pc 149, 0x527]
eventOwner:_runCharaScheduler(70795264.0)  [pc 154, 0x53B]
eventOwner:say(quest, 35.0, 0.0)  [pc 159, 0x54F]
eventOwner:_runCharaScheduler(354045952.0)  [pc 162, 0x55B]
eventOwner:say(quest, 45.0, 0.0)  [pc 167, 0x56F]
eventOwner:finishCliantTalkTurn()  [pc 178, 0x59B]
return call149.1.return1
```

### Path 2

```text
require (call149.1.return1 == 1.0) is false  [pc 150, 0x52B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x2EB]
quest:_wait(0.5)  [pc 9, 0x2F7]
eventOwner:say(quest, 6.0, 0.0)  [pc 14, 0x30B]
eventOwner:say(quest, 39.0, 0.0)  [pc 19, 0x31F]
eventOwner:say(quest, 34.0, 0.0)  [pc 24, 0x333]
eventOwner:_runCharaScheduler(354103296.0)  [pc 27, 0x33F]
eventOwner:say(quest, 7.0, 0.0)  [pc 32, 0x353]
eventOwner:say(quest, 8.0, 0.0)  [pc 37, 0x367]
eventOwner:_runCharaScheduler(70803456.0)  [pc 40, 0x373]
eventOwner:say(quest, 40.0, 0.0)  [pc 45, 0x387]
eventOwner:finishCliantTalkTurn()  [pc 47, 0x38F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 50, 0x39B]
eventOwner:say(quest, 9.0, 0.0)  [pc 55, 0x3AF]
eventOwner:_runCharaScheduler(70881280.0)  [pc 58, 0x3BB]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x3CF]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 67, 0x3DF]
eventOwner:_runCharaScheduler(353972224.0)  [pc 70, 0x3EB]
eventOwner:say(quest, 11.0, 0.0)  [pc 75, 0x3FF]
eventOwner:finishCliantTalkTurn()  [pc 77, 0x407]
eventOwner:say(quest, 12.0, 0.0)  [pc 82, 0x41B]
eventOwner:say(quest, 13.0, 0.0)  [pc 87, 0x42F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 91, 0x43F]
eventOwner:_runCharaScheduler(354000896.0)  [pc 94, 0x44B]
quest:_wait(0.5)  [pc 97, 0x457]
eventOwner:say(quest, 33.0, 0.0)  [pc 102, 0x46B]
eventOwner:say(quest, 41.0, 0.0)  [pc 107, 0x47F]
eventOwner:say(quest, 42.0, 0.0)  [pc 112, 0x493]
eventOwner:_runCharaScheduler(353980416.0)  [pc 115, 0x49F]
eventOwner:say(quest, 14.0, 0.0)  [pc 120, 0x4B3]
quest:_wait(0.5)  [pc 123, 0x4BF]
eventOwner:_runCharaScheduler(70795264.0)  [pc 126, 0x4CB]
quest:_wait(1.0)  [pc 129, 0x4D7]
eventOwner:say(quest, 15.0, 0.0)  [pc 134, 0x4EB]
eventOwner:say(quest, 43.0, 0.0)  [pc 139, 0x4FF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 142, 0x50B]
eventOwner:say(quest, 44.0, 0.0)  [pc 147, 0x51F]
call149.1.return1 = quest:showQuestInfomation()  [pc 149, 0x527]
eventOwner:_runCharaScheduler(354041856.0)  [pc 171, 0x57F]
eventOwner:say(quest, 16.0, 0.0)  [pc 176, 0x593]
eventOwner:finishCliantTalkTurn()  [pc 178, 0x59B]
return call149.1.return1
```

## processEventERIKStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7A0]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x7AC]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x7C0]
eventOwner:say(quest, 37.0, 0.0)  [pc 16, 0x7D4]
eventOwner:say(quest, 38.0, 0.0)  [pc 21, 0x7E8]
eventOwner:_runCharaScheduler(354000896.0)  [pc 24, 0x7F4]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x808]
worldMaster:say(quest, 5.0, 0.0)  [pc 35, 0x820]
eventOwner:finishCliantTalkTurn()  [pc 37, 0x828]
return 
```

## processEventWIDARGELTStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x91A]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0x926]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x93A]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x942]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9ED]
eventOwner:_runCharaScheduler(354000896.0)  [pc 6, 0x9F9]
eventOwner:say(quest, 31.0, 0.0)  [pc 11, 0xA0D]
eventOwner:say(quest, 32.0, 0.0)  [pc 16, 0xA21]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xA29]
return 
```

## processEvent000_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAE6]
eventOwner:_runCharaScheduler(70795264.0)  [pc 6, 0xAF2]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0xB06]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xB0E]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51124.0, 11000552.0)  [pc 5, 0xBCA]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27107.0, 1.0)  [pc 4, 0xC66]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000101.0, 92.0)  [pc 4, 0xCD5]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111222.0, 15.0)  [pc 6, 0xD49]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111222.0, 15.0)  [pc 6, 0xDC6]
return 
```

