# 111323 drg0j3: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x294]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x2A0]
eventOwner:say(quest, 29.0, 0.0)  [pc 11, 0x2B4]
worldMaster:say(quest, 30.0, 0.0)  [pc 17, 0x2CC]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x2D4]
return 
```

## processEventALBERICStart — 3 parameters
### Path 1

```text
require (call136.1.return1 == 1.0) is true  [pc 137, 0x5BA]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3A2]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x3AE]
eventOwner:say(quest, 31.0, 0.0)  [pc 11, 0x3C2]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x3D6]
eventOwner:_runCharaScheduler(354082816.0)  [pc 19, 0x3E2]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x3F6]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x40A]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x416]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x42A]
quest:_wait(0.5)  [pc 40, 0x436]
eventOwner:say(quest, 7.0, 0.0)  [pc 45, 0x44A]
eventOwner:_runCharaScheduler(353968128.0)  [pc 48, 0x456]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x46A]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x47E]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x492]
eventOwner:say(quest, 37.0, 0.0)  [pc 68, 0x4A6]
eventOwner:_runCharaScheduler(353964032.0)  [pc 71, 0x4B2]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x4C6]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x4DA]
eventOwner:say(quest, 16.0, 0.0)  [pc 86, 0x4EE]
eventOwner:say(quest, 17.0, 0.0)  [pc 91, 0x502]
eventOwner:_runCharaScheduler(70823936.0)  [pc 94, 0x50E]
eventOwner:say(quest, 18.0, 0.0)  [pc 99, 0x522]
quest:_wait(0.5)  [pc 102, 0x52E]
eventOwner:_runCharaScheduler(354082816.0)  [pc 105, 0x53A]
quest:_wait(0.5)  [pc 108, 0x546]
eventOwner:say(quest, 20.0, 0.0)  [pc 113, 0x55A]
eventOwner:say(quest, 21.0, 0.0)  [pc 118, 0x56E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 121, 0x57A]
eventOwner:say(quest, 22.0, 0.0)  [pc 126, 0x58E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 129, 0x59A]
eventOwner:say(quest, 23.0, 0.0)  [pc 134, 0x5AE]
call136.1.return1 = quest:showQuestInfomation()  [pc 136, 0x5B6]
eventOwner:_runCharaScheduler(353959936.0)  [pc 141, 0x5CA]
eventOwner:say(quest, 36.0, 0.0)  [pc 146, 0x5DE]
eventOwner:say(quest, 25.0, 0.0)  [pc 151, 0x5F2]
eventOwner:finishCliantTalkTurn()  [pc 162, 0x61E]
return call136.1.return1
```

### Path 2

```text
require (call136.1.return1 == 1.0) is false  [pc 137, 0x5BA]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3A2]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x3AE]
eventOwner:say(quest, 31.0, 0.0)  [pc 11, 0x3C2]
eventOwner:say(quest, 3.0, 0.0)  [pc 16, 0x3D6]
eventOwner:_runCharaScheduler(354082816.0)  [pc 19, 0x3E2]
eventOwner:say(quest, 4.0, 0.0)  [pc 24, 0x3F6]
eventOwner:say(quest, 5.0, 0.0)  [pc 29, 0x40A]
eventOwner:_runCharaScheduler(353964032.0)  [pc 32, 0x416]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x42A]
quest:_wait(0.5)  [pc 40, 0x436]
eventOwner:say(quest, 7.0, 0.0)  [pc 45, 0x44A]
eventOwner:_runCharaScheduler(353968128.0)  [pc 48, 0x456]
eventOwner:say(quest, 8.0, 0.0)  [pc 53, 0x46A]
eventOwner:say(quest, 9.0, 0.0)  [pc 58, 0x47E]
eventOwner:say(quest, 10.0, 0.0)  [pc 63, 0x492]
eventOwner:say(quest, 37.0, 0.0)  [pc 68, 0x4A6]
eventOwner:_runCharaScheduler(353964032.0)  [pc 71, 0x4B2]
eventOwner:say(quest, 11.0, 0.0)  [pc 76, 0x4C6]
eventOwner:say(quest, 15.0, 0.0)  [pc 81, 0x4DA]
eventOwner:say(quest, 16.0, 0.0)  [pc 86, 0x4EE]
eventOwner:say(quest, 17.0, 0.0)  [pc 91, 0x502]
eventOwner:_runCharaScheduler(70823936.0)  [pc 94, 0x50E]
eventOwner:say(quest, 18.0, 0.0)  [pc 99, 0x522]
quest:_wait(0.5)  [pc 102, 0x52E]
eventOwner:_runCharaScheduler(354082816.0)  [pc 105, 0x53A]
quest:_wait(0.5)  [pc 108, 0x546]
eventOwner:say(quest, 20.0, 0.0)  [pc 113, 0x55A]
eventOwner:say(quest, 21.0, 0.0)  [pc 118, 0x56E]
eventOwner:_runCharaScheduler(353959936.0)  [pc 121, 0x57A]
eventOwner:say(quest, 22.0, 0.0)  [pc 126, 0x58E]
eventOwner:_runCharaScheduler(353964032.0)  [pc 129, 0x59A]
eventOwner:say(quest, 23.0, 0.0)  [pc 134, 0x5AE]
call136.1.return1 = quest:showQuestInfomation()  [pc 136, 0x5B6]
eventOwner:_runCharaScheduler(70815744.0)  [pc 155, 0x602]
eventOwner:say(quest, 24.0, 0.0)  [pc 160, 0x616]
eventOwner:finishCliantTalkTurn()  [pc 162, 0x61E]
return call136.1.return1
```

## processEvent000_ALBERICS — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7F6]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x802]
eventOwner:say(quest, 26.0, 0.0)  [pc 11, 0x816]
eventOwner:_runCharaScheduler(353968128.0)  [pc 14, 0x822]
eventOwner:say(quest, 28.0, 0.0)  [pc 19, 0x836]
eventOwner:finishCliantTalkTurn()  [pc 21, 0x83E]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51126.0, 2000204.0)  [pc 5, 0x90C]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27267.0, 1.0)  [pc 4, 0x9A8]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1000275.0, 86.0)  [pc 4, 0xA17]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111323.0, 19.0)  [pc 6, 0xA8B]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111323.0, 19.0)  [pc 6, 0xB08]
return 
```

