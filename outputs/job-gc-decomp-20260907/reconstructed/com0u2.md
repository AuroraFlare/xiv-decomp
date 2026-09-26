# 111802 com0u2: reconstructed client path templates

## processEventAUBREYStart — 3 parameters
### Path 1

```text
require (call42.1.return1 == 1.0) is true  [pc 43, 0x24C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AC]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1C0]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x1D4]
eventOwner:_runCharaScheduler(354041856.0)  [pc 16, 0x1E0]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x1F4]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x208]
eventOwner:_runCharaScheduler(353984512.0)  [pc 29, 0x214]
quest:_wait(1.0)  [pc 32, 0x220]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x234]
call42.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 42, 0x248]
quest:_wait(0.7)  [pc 47, 0x25C]
desktopWidget:openPublicEffectWidget(6.0)  [pc 51, 0x26C]
quest:_wait(4.7)  [pc 54, 0x278]
desktopWidget:openGrandCompanyStatusWidgetYield(3.0)  [pc 58, 0x288]
desktopWidget:setGrandCompanyStatusWidgetPoint(0.0)  [pc 62, 0x298]
quest:_wait(1.0)  [pc 65, 0x2A4]
eventOwner:_runCharaScheduler(354066432.0)  [pc 68, 0x2B0]
eventOwner:say(quest, 11.0, 0.0)  [pc 73, 0x2C4]
eventOwner:say(quest, 12.0, 0.0)  [pc 78, 0x2D8]
eventOwner:_runCharaScheduler(354082816.0)  [pc 81, 0x2E4]
eventOwner:say(quest, 13.0, 0.0)  [pc 86, 0x2F8]
eventOwner:say(quest, 14.0, 0.0)  [pc 91, 0x30C]
eventOwner:say(quest, 15.0, 0.0)  [pc 96, 0x320]
eventOwner:say(quest, 16.0, 0.0)  [pc 101, 0x334]
eventOwner:say(quest, 17.0, 0.0)  [pc 106, 0x348]
worldMaster:say(quest, 21.0)  [pc 111, 0x35C]
eventOwner:_runCharaScheduler(354095104.0)  [pc 114, 0x368]
eventOwner:say(quest, 18.0, 0.0)  [pc 119, 0x37C]
eventOwner:say(quest, 19.0, 0.0)  [pc 124, 0x390]
eventOwner:_runCharaScheduler(70807552.0)  [pc 127, 0x39C]
quest:_wait(1.5)  [pc 130, 0x3A8]
eventOwner:say(quest, 20.0, 0.0)  [pc 135, 0x3BC]
eventOwner:finishCliantTalkTurn()  [pc 146, 0x3E8]
return call42.1.return1
```

### Path 2

```text
require (call42.1.return1 == 1.0) is false  [pc 43, 0x24C]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AC]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1C0]
eventOwner:say(quest, 3.0, 0.0)  [pc 13, 0x1D4]
eventOwner:_runCharaScheduler(354041856.0)  [pc 16, 0x1E0]
eventOwner:say(quest, 4.0, 0.0)  [pc 21, 0x1F4]
eventOwner:say(quest, 5.0, 0.0)  [pc 26, 0x208]
eventOwner:_runCharaScheduler(353984512.0)  [pc 29, 0x214]
quest:_wait(1.0)  [pc 32, 0x220]
eventOwner:say(quest, 6.0, 0.0)  [pc 37, 0x234]
call42.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 42, 0x248]
eventOwner:_runCharaScheduler(354082816.0)  [pc 139, 0x3CC]
eventOwner:say(quest, 10.0, 0.0)  [pc 144, 0x3E0]
eventOwner:finishCliantTalkTurn()  [pc 146, 0x3E8]
return call42.1.return1
```

## processEventAUBREYFinal — 5 parameters
### Path 1

```text
desktopWidget:setGrandCompanyStatusWidgetPoint(250.0)  [pc 3, 0x622]
quest:_wait(1.0)  [pc 6, 0x62E]
desktopWidget:closeGrandCompanyStatusWidget()  [pc 9, 0x63A]
return 
```

