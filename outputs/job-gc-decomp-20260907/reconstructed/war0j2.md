# 111202 war0j2: reconstructed client path templates

## processEventCURIOUS_GORGEStart — 3 parameters
### Path 1

```text
require (call95.1.return1 == 1.0) is true  [pc 96, 0x414]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2A0]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2AC]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2C0]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2D4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x2E0]
eventOwner:say(quest, 6.0, 0.0)  [pc 24, 0x2F4]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x308]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x31C]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x330]
eventOwner:_runCharaScheduler(354082816.0)  [pc 42, 0x33C]
quest:_wait(1.0)  [pc 45, 0x348]
eventOwner:finishCliantTalkTurn()  [pc 47, 0x350]
eventOwner:say(quest, 10.0, 0.0)  [pc 52, 0x364]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 56, 0x374]
eventOwner:_runCharaScheduler(70881280.0)  [pc 59, 0x380]
eventOwner:say(quest, 11.0, 0.0)  [pc 64, 0x394]
eventOwner:_runCharaScheduler(70795264.0)  [pc 67, 0x3A0]
eventOwner:say(quest, 12.0, 0.0)  [pc 72, 0x3B4]
eventOwner:_runCharaScheduler(353980416.0)  [pc 75, 0x3C0]
eventOwner:say(quest, 13.0, 0.0)  [pc 80, 0x3D4]
eventOwner:say(quest, 14.0, 0.0)  [pc 85, 0x3E8]
eventOwner:_runCharaScheduler(353964032.0)  [pc 88, 0x3F4]
eventOwner:say(quest, 15.0, 0.0)  [pc 93, 0x408]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x410]
eventOwner:_runCharaScheduler(354107392.0)  [pc 100, 0x424]
player:_runCharaScheduler(354111488.0)  [pc 103, 0x430]
eventOwner:say(quest, 17.0, 0.0)  [pc 108, 0x444]
eventOwner:finishCliantTalkTurn()  [pc 122, 0x47C]
return call95.1.return1
```

### Path 2

```text
require (call95.1.return1 == 1.0) is false  [pc 96, 0x414]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2A0]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x2AC]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x2C0]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x2D4]
eventOwner:_runCharaScheduler(354086912.0)  [pc 19, 0x2E0]
eventOwner:say(quest, 6.0, 0.0)  [pc 24, 0x2F4]
eventOwner:say(quest, 7.0, 0.0)  [pc 29, 0x308]
eventOwner:say(quest, 8.0, 0.0)  [pc 34, 0x31C]
eventOwner:say(quest, 9.0, 0.0)  [pc 39, 0x330]
eventOwner:_runCharaScheduler(354082816.0)  [pc 42, 0x33C]
quest:_wait(1.0)  [pc 45, 0x348]
eventOwner:finishCliantTalkTurn()  [pc 47, 0x350]
eventOwner:say(quest, 10.0, 0.0)  [pc 52, 0x364]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 56, 0x374]
eventOwner:_runCharaScheduler(70881280.0)  [pc 59, 0x380]
eventOwner:say(quest, 11.0, 0.0)  [pc 64, 0x394]
eventOwner:_runCharaScheduler(70795264.0)  [pc 67, 0x3A0]
eventOwner:say(quest, 12.0, 0.0)  [pc 72, 0x3B4]
eventOwner:_runCharaScheduler(353980416.0)  [pc 75, 0x3C0]
eventOwner:say(quest, 13.0, 0.0)  [pc 80, 0x3D4]
eventOwner:say(quest, 14.0, 0.0)  [pc 85, 0x3E8]
eventOwner:_runCharaScheduler(353964032.0)  [pc 88, 0x3F4]
eventOwner:say(quest, 15.0, 0.0)  [pc 93, 0x408]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x410]
eventOwner:_runCharaScheduler(354041856.0)  [pc 112, 0x454]
quest:_wait(1.0)  [pc 115, 0x460]
eventOwner:say(quest, 16.0, 0.0)  [pc 120, 0x474]
eventOwner:finishCliantTalkTurn()  [pc 122, 0x47C]
return call95.1.return1
```

## processEventCURIOUS_GORGEStart_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x627]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0x633]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x647]
worldMaster:say(quest, 3.0, 0.0)  [pc 17, 0x65F]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x667]
return 
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x72C]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x738]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0x74C]
eventOwner:say(quest, 19.0, 0.0)  [pc 16, 0x760]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x768]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51119.0)  [pc 4, 0x829]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27187.0, 1.0)  [pc 4, 0x8BC]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1600318.0, 75.0)  [pc 4, 0x92B]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111202.0, 17.0)  [pc 6, 0x99F]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111202.0, 17.0)  [pc 6, 0xA1C]
return 
```

