# 111402 com0l2: reconstructed client path templates

## processEventGUINCUMStart — 5 parameters
### Path 1

```text
require (call44.1.return1 == 1.0) is true  [pc 45, 0x254]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AC]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1C0]
eventOwner:say(quest, 21.0, 0.0)  [pc 13, 0x1D4]
eventOwner:_runCharaScheduler(353976320.0)  [pc 16, 0x1E0]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x1F4]
eventOwner:say(quest, 4.0, 0.0)  [pc 26, 0x208]
eventOwner:say(quest, 5.0, 0.0)  [pc 31, 0x21C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 34, 0x228]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x23C]
call44.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 44, 0x250]
quest:_wait(0.7)  [pc 49, 0x264]
desktopWidget:openPublicEffectWidget(4.0)  [pc 53, 0x274]
quest:_wait(4.7)  [pc 56, 0x280]
desktopWidget:openGrandCompanyStatusWidgetYield(1.0)  [pc 60, 0x290]
desktopWidget:setGrandCompanyStatusWidgetPoint(0.0)  [pc 64, 0x2A0]
quest:_wait(1.0)  [pc 67, 0x2AC]
eventOwner:say(quest, 11.0, 0.0)  [pc 72, 0x2C0]
eventOwner:say(quest, 12.0, 0.0)  [pc 77, 0x2D4]
eventOwner:say(quest, 13.0, 0.0)  [pc 82, 0x2E8]
eventOwner:say(quest, 14.0, 0.0)  [pc 87, 0x2FC]
eventOwner:say(quest, 15.0, 0.0)  [pc 92, 0x310]
eventOwner:say(quest, 16.0, 0.0)  [pc 97, 0x324]
eventOwner:_runCharaScheduler(354103296.0)  [pc 100, 0x330]
eventOwner:say(quest, 17.0, 0.0)  [pc 105, 0x344]
worldMaster:say(quest, 22.0)  [pc 110, 0x358]
eventOwner:_runCharaScheduler(70881280.0)  [pc 113, 0x364]
eventOwner:say(quest, 18.0, 0.0)  [pc 118, 0x378]
eventOwner:_runCharaScheduler(354107392.0)  [pc 121, 0x384]
eventOwner:say(quest, 19.0, 0.0)  [pc 126, 0x398]
eventOwner:say(quest, 20.0, 0.0)  [pc 131, 0x3AC]
eventOwner:finishCliantTalkTurn()  [pc 142, 0x3D8]
return call44.1.return1
```

### Path 2

```text
require (call44.1.return1 == 1.0) is false  [pc 45, 0x254]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1AC]
eventOwner:say(quest, 2.0, 0.0)  [pc 8, 0x1C0]
eventOwner:say(quest, 21.0, 0.0)  [pc 13, 0x1D4]
eventOwner:_runCharaScheduler(353976320.0)  [pc 16, 0x1E0]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x1F4]
eventOwner:say(quest, 4.0, 0.0)  [pc 26, 0x208]
eventOwner:say(quest, 5.0, 0.0)  [pc 31, 0x21C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 34, 0x228]
eventOwner:say(quest, 6.0, 0.0)  [pc 39, 0x23C]
call44.1.return1 = eventOwner:ask(quest, 7.0, 2.0)  [pc 44, 0x250]
eventOwner:_runCharaScheduler(353959936.0)  [pc 135, 0x3BC]
eventOwner:say(quest, 10.0, 0.0)  [pc 140, 0x3D0]
eventOwner:finishCliantTalkTurn()  [pc 142, 0x3D8]
return call44.1.return1
```

## processEventGUINCUMEnd — 5 parameters
### Path 1

```text
quest:_wait(1.0)  [pc 2, 0x60E]
desktopWidget:setGrandCompanyStatusWidgetPoint(250.0)  [pc 6, 0x61E]
quest:_wait(1.0)  [pc 9, 0x62A]
desktopWidget:closeGrandCompanyStatusWidget()  [pc 12, 0x636]
return 
```

