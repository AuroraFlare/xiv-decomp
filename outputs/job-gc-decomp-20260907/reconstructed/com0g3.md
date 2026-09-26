# 111603 com0g3: reconstructed client path templates

## processEventStart — 3 parameters
### Path 1

```text
require (call24.1.return1 == 1.0) is true  [pc 25, 0x1D5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x17D]
eventOwner:_runCharaScheduler(84094976.0)  [pc 6, 0x189]
quest:_wait(2.0)  [pc 9, 0x195]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1A9]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1BD]
call24.1.return1 = eventOwner:ask(quest, 14.0, 2.0)  [pc 24, 0x1D1]
eventOwner:say(quest, 4.0, 0.0)  [pc 31, 0x1ED]
eventOwner:_runCharaScheduler(353976320.0)  [pc 34, 0x1F9]
eventOwner:say(quest, 5.0, 0.0)  [pc 39, 0x20D]
eventOwner:say(quest, 6.0, 0.0)  [pc 44, 0x221]
eventOwner:_runCharaScheduler(353980416.0)  [pc 47, 0x22D]
eventOwner:say(quest, 7.0, 0.0)  [pc 52, 0x241]
eventOwner:say(quest, 8.0, 0.0)  [pc 57, 0x255]
eventOwner:_runCharaScheduler(353964032.0)  [pc 60, 0x261]
eventOwner:say(quest, 9.0, 0.0)  [pc 65, 0x275]
eventOwner:say(quest, 10.0, 0.0)  [pc 70, 0x289]
eventOwner:_runCharaScheduler(354050048.0)  [pc 73, 0x295]
eventOwner:say(quest, 11.0, 0.0)  [pc 78, 0x2A9]
eventOwner:finishCliantTalkTurn()  [pc 80, 0x2B1]
return call24.1.return1
```

### Path 2

```text
require (call24.1.return1 == 1.0) is false  [pc 25, 0x1D5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x17D]
eventOwner:_runCharaScheduler(84094976.0)  [pc 6, 0x189]
quest:_wait(2.0)  [pc 9, 0x195]
eventOwner:say(quest, 2.0, 0.0)  [pc 14, 0x1A9]
eventOwner:say(quest, 3.0, 0.0)  [pc 19, 0x1BD]
call24.1.return1 = eventOwner:ask(quest, 14.0, 2.0)  [pc 24, 0x1D1]
eventOwner:say(quest, 17.0, 0.0)  [pc 87, 0x2CD]
eventOwner:finishCliantTalkTurn()  [pc 89, 0x2D5]
return call24.1.return1
```

