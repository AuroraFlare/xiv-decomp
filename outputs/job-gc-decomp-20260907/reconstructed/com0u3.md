# 111803 com0u3: reconstructed client path templates

## processEventUSANZIStart — 3 parameters
### Path 1

```text
require (call24.1.return1 == 1.0) is true  [pc 25, 0x1DB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x183]
eventOwner:_runCharaScheduler(84099072.0)  [pc 6, 0x18F]
quest:_wait(2.0)  [pc 9, 0x19B]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1AF]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1C3]
call24.1.return1 = eventOwner:ask(quest, 12.0, 2.0)  [pc 24, 0x1D7]
eventOwner:_runCharaScheduler(354045952.0)  [pc 29, 0x1EB]
eventOwner:say(quest, 4.0, 0.0)  [pc 34, 0x1FF]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x213]
eventOwner:say(quest, 6.0, 0.0)  [pc 44, 0x227]
eventOwner:_runCharaScheduler(353984512.0)  [pc 47, 0x233]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x247]
eventOwner:say(quest, 8.0, 0.0)  [pc 57, 0x25B]
eventOwner:say(quest, 9.0, 0.0)  [pc 62, 0x26F]
eventOwner:say(quest, 10.0, 0.0)  [pc 67, 0x283]
eventOwner:_runCharaScheduler(354103296.0)  [pc 70, 0x28F]
eventOwner:say(quest, 11.0, 0.0)  [pc 75, 0x2A3]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x2CF]
return call24.1.return1
```

### Path 2

```text
require (call24.1.return1 == 1.0) is false  [pc 25, 0x1DB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x183]
eventOwner:_runCharaScheduler(84099072.0)  [pc 6, 0x18F]
quest:_wait(2.0)  [pc 9, 0x19B]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1AF]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1C3]
call24.1.return1 = eventOwner:ask(quest, 12.0, 2.0)  [pc 24, 0x1D7]
eventOwner:_runCharaScheduler(70823936.0)  [pc 79, 0x2B3]
eventOwner:say(quest, 15.0, 0.0)  [pc 84, 0x2C7]
eventOwner:finishCliantTalkTurn()  [pc 86, 0x2CF]
return call24.1.return1
```

