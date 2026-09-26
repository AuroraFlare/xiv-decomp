# 111602 com0g2: reconstructed client path templates

## processEventFulkeStart — 3 parameters
### Path 1

```text
require (call39.1.return1 == 1.0) is true  [pc 40, 0x23C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1A8]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1BC]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x1D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 16, 0x1DC]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x1F0]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x204]
eventOwner:_runCharaScheduler(353959936.0)  [pc 29, 0x210]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x224]
call39.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 39, 0x238]
quest:_wait(0.7)  [pc 44, 0x24C]
desktopWidget:openPublicEffectWidget(5.0)  [pc 48, 0x25C]
quest:_wait(4.7)  [pc 51, 0x268]
desktopWidget:openGrandCompanyStatusWidgetYield(2.0)  [pc 55, 0x278]
desktopWidget:setGrandCompanyStatusWidgetPoint(0.0)  [pc 59, 0x288]
quest:_wait(1.0)  [pc 62, 0x294]
eventOwner:say(quest, 11.0, 0.0)  [pc 67, 0x2A8]
eventOwner:say(quest, 12.0, 0.0)  [pc 72, 0x2BC]
eventOwner:say(quest, 13.0, 0.0)  [pc 77, 0x2D0]
eventOwner:say(quest, 14.0, 0.0)  [pc 82, 0x2E4]
eventOwner:say(quest, 15.0, 0.0)  [pc 87, 0x2F8]
eventOwner:say(quest, 16.0, 0.0)  [pc 92, 0x30C]
eventOwner:say(quest, 17.0, 0.0)  [pc 97, 0x320]
worldMaster:say(quest, 21.0, 0.0)  [pc 103, 0x338]
eventOwner:say(quest, 18.0, 0.0)  [pc 108, 0x34C]
eventOwner:say(quest, 19.0, 0.0)  [pc 113, 0x360]
eventOwner:say(quest, 20.0, 0.0)  [pc 118, 0x374]
eventOwner:finishCliantTalkTurn()  [pc 126, 0x394]
return call39.1.return1
```

### Path 2

```text
require (call39.1.return1 == 1.0) is false  [pc 40, 0x23C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1A8]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1BC]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x1D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 16, 0x1DC]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x1F0]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x204]
eventOwner:_runCharaScheduler(353959936.0)  [pc 29, 0x210]
eventOwner:say(quest, 6.0, 0.0)  [pc 34, 0x224]
call39.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 39, 0x238]
eventOwner:say(quest, 10.0, 0.0)  [pc 124, 0x38C]
eventOwner:finishCliantTalkTurn()  [pc 126, 0x394]
return call39.1.return1
```

## processEventFulkeEnd — 5 parameters
### Path 1

```text
quest:_wait(1.0)  [pc 2, 0x59D]
desktopWidget:setGrandCompanyStatusWidgetPoint(250.0)  [pc 6, 0x5AD]
quest:_wait(1.0)  [pc 9, 0x5B9]
desktopWidget:closeGrandCompanyStatusWidget()  [pc 12, 0x5C5]
return 
```

