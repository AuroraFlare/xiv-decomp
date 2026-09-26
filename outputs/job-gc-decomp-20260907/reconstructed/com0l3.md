# 111403 com0l3: reconstructed client path templates

## processEventFHILAHCTStart — 3 parameters
### Path 1

```text
require (call24.1.return1 == 1.0) is true  [pc 25, 0x1DD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x185]
eventOwner:_runCharaScheduler(84090880.0)  [pc 6, 0x191]
quest:_wait(2.0)  [pc 9, 0x19D]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1B1]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1C5]
call24.1.return1 = eventOwner:ask(quest, 12.0, 2.0)  [pc 24, 0x1D9]
eventOwner:_runCharaScheduler(353964032.0)  [pc 29, 0x1ED]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x201]
eventOwner:_runCharaScheduler(353959936.0)  [pc 37, 0x20D]
eventOwner:say(quest, 5.0, 0.0)  [pc 42, 0x221]
eventOwner:_runCharaScheduler(353972224.0)  [pc 45, 0x22D]
eventOwner:say(quest, 6.0, 0.0)  [pc 50, 0x241]
eventOwner:_runCharaScheduler(354095104.0)  [pc 53, 0x24D]
eventOwner:say(quest, 7.0, 0.0)  [pc 58, 0x261]
eventOwner:_runCharaScheduler(354082816.0)  [pc 61, 0x26D]
eventOwner:say(quest, 8.0, 0.0)  [pc 66, 0x281]
eventOwner:say(quest, 9.0, 0.0)  [pc 71, 0x295]
eventOwner:_runCharaScheduler(354103296.0)  [pc 74, 0x2A1]
eventOwner:say(quest, 10.0, 0.0)  [pc 79, 0x2B5]
eventOwner:_runCharaScheduler(353959936.0)  [pc 82, 0x2C1]
eventOwner:say(quest, 11.0, 0.0)  [pc 87, 0x2D5]
eventOwner:finishCliantTalkTurn()  [pc 89, 0x2DD]
return call24.1.return1
```

### Path 2

```text
require (call24.1.return1 == 1.0) is false  [pc 25, 0x1DD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x185]
eventOwner:_runCharaScheduler(84090880.0)  [pc 6, 0x191]
quest:_wait(2.0)  [pc 9, 0x19D]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1B1]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1C5]
call24.1.return1 = eventOwner:ask(quest, 12.0, 2.0)  [pc 24, 0x1D9]
eventOwner:say(quest, 15.0, 0.0)  [pc 96, 0x2F9]
eventOwner:finishCliantTalkTurn()  [pc 98, 0x301]
return call24.1.return1
```

