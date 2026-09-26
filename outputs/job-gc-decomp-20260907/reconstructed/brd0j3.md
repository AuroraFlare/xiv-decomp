# 111303 brd0j3: reconstructed client path templates

## processEventJEHANTELStart — 3 parameters
### Path 1

```text
require (call109.1.return1 == 1.0) is true  [pc 110, 0x442]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x296]
eventOwner:_runCharaScheduler(70881280.0)  [pc 6, 0x2A2]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2B6]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2CA]
eventOwner:say(quest, 19.0, 0.0)  [pc 21, 0x2DE]
eventOwner:_runCharaScheduler(69521408.0)  [pc 24, 0x2EA]
quest:_wait(1.5)  [pc 27, 0x2F6]
player:_runCharaScheduler(67111909.0)  [pc 30, 0x302]
eventOwner:say(quest, 6.0, 0.0)  [pc 35, 0x316]
eventOwner:say(quest, 7.0, 0.0)  [pc 40, 0x32A]
eventOwner:say(quest, 8.0, 0.0)  [pc 45, 0x33E]
eventOwner:say(quest, 22.0, 0.0)  [pc 50, 0x352]
eventOwner:_runCharaScheduler(70815744.0)  [pc 53, 0x35E]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x372]
eventOwner:_runCharaScheduler(70795264.0)  [pc 61, 0x37E]
eventOwner:say(quest, 10.0, 0.0)  [pc 66, 0x392]
eventOwner:say(quest, 20.0, 0.0)  [pc 71, 0x3A6]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x3BA]
eventOwner:_runCharaScheduler(70881280.0)  [pc 79, 0x3C6]
quest:_wait(2.0)  [pc 82, 0x3D2]
eventOwner:say(quest, 12.0, 0.0)  [pc 87, 0x3E6]
eventOwner:say(quest, 23.0, 0.0)  [pc 92, 0x3FA]
eventOwner:say(quest, 18.0, 0.0)  [pc 97, 0x40E]
eventOwner:say(quest, 13.0, 0.0)  [pc 102, 0x422]
eventOwner:say(quest, 24.0, 0.0)  [pc 107, 0x436]
call109.1.return1 = quest:showQuestInfomation()  [pc 109, 0x43E]
eventOwner:say(quest, 15.0, 0.0)  [pc 116, 0x45A]
eventOwner:say(quest, 21.0, 0.0)  [pc 121, 0x46E]
eventOwner:_runCharaScheduler(69521408.0)  [pc 124, 0x47A]
quest:_wait(1.5)  [pc 127, 0x486]
player:_runCharaScheduler(67111909.0)  [pc 130, 0x492]
eventOwner:say(quest, 16.0, 0.0)  [pc 135, 0x4A6]
quest:_wait(1.5)  [pc 138, 0x4B2]
eventOwner:_runCharaScheduler(69521408.0)  [pc 141, 0x4BE]
quest:_wait(1.0)  [pc 144, 0x4CA]
player:_runCharaScheduler(67111909.0)  [pc 147, 0x4D6]
quest:_wait(1.5)  [pc 150, 0x4E2]
eventOwner:finishCliantTalkTurn()  [pc 173, 0x53E]
return call109.1.return1
```

### Path 2

```text
require (call109.1.return1 == 1.0) is false  [pc 110, 0x442]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x296]
eventOwner:_runCharaScheduler(70881280.0)  [pc 6, 0x2A2]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2B6]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2CA]
eventOwner:say(quest, 19.0, 0.0)  [pc 21, 0x2DE]
eventOwner:_runCharaScheduler(69521408.0)  [pc 24, 0x2EA]
quest:_wait(1.5)  [pc 27, 0x2F6]
player:_runCharaScheduler(67111909.0)  [pc 30, 0x302]
eventOwner:say(quest, 6.0, 0.0)  [pc 35, 0x316]
eventOwner:say(quest, 7.0, 0.0)  [pc 40, 0x32A]
eventOwner:say(quest, 8.0, 0.0)  [pc 45, 0x33E]
eventOwner:say(quest, 22.0, 0.0)  [pc 50, 0x352]
eventOwner:_runCharaScheduler(70815744.0)  [pc 53, 0x35E]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x372]
eventOwner:_runCharaScheduler(70795264.0)  [pc 61, 0x37E]
eventOwner:say(quest, 10.0, 0.0)  [pc 66, 0x392]
eventOwner:say(quest, 20.0, 0.0)  [pc 71, 0x3A6]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x3BA]
eventOwner:_runCharaScheduler(70881280.0)  [pc 79, 0x3C6]
quest:_wait(2.0)  [pc 82, 0x3D2]
eventOwner:say(quest, 12.0, 0.0)  [pc 87, 0x3E6]
eventOwner:say(quest, 23.0, 0.0)  [pc 92, 0x3FA]
eventOwner:say(quest, 18.0, 0.0)  [pc 97, 0x40E]
eventOwner:say(quest, 13.0, 0.0)  [pc 102, 0x422]
eventOwner:say(quest, 24.0, 0.0)  [pc 107, 0x436]
call109.1.return1 = quest:showQuestInfomation()  [pc 109, 0x43E]
eventOwner:_runCharaScheduler(70795264.0)  [pc 154, 0x4F2]
quest:_wait(1.0)  [pc 157, 0x4FE]
eventOwner:say(quest, 14.0, 0.0)  [pc 162, 0x512]
eventOwner:_runCharaScheduler(69521408.0)  [pc 165, 0x51E]
quest:_wait(1.5)  [pc 168, 0x52A]
player:_runCharaScheduler(67111909.0)  [pc 171, 0x536]
eventOwner:finishCliantTalkTurn()  [pc 173, 0x53E]
return call109.1.return1
```

## processEventJEHANTELStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x6FB]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x707]
quest:_wait(1.5)  [pc 9, 0x713]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x71F]
eventOwner:say(quest, 2.0, 0.0)  [pc 17, 0x733]
worldMaster:say(quest, 3.0, 0.0)  [pc 23, 0x74B]
eventOwner:finishCliantTalkTurn()  [pc 25, 0x753]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x835]
eventOwner:_runCharaScheduler(70815744.0)  [pc 6, 0x841]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0x855]
eventOwner:say(quest, 25.0, 0.0)  [pc 16, 0x869]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x871]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51138.0, 3101511.0)  [pc 5, 0x936]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27238.0, 2.0)  [pc 4, 0x9D2]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1200133.0, 83.0)  [pc 4, 0xA41]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111303.0, 18.0)  [pc 6, 0xAB5]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111303.0, 18.0)  [pc 6, 0xB32]
return 
```

