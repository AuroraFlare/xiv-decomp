# 111263 blm0j3: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x367]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x373]
eventOwner:say(quest, 40.0, 0.0)  [pc 11, 0x387]
worldMaster:say(quest, 41.0, 0.0)  [pc 17, 0x39F]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x3A7]
return 
```

## processEventLALAIStart — 3 parameters
### Path 1

```text
require (call100.1.return1 == 1.0) is true  [pc 101, 0x5FD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x475]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x481]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x495]
eventOwner:say(quest, 44.0, 0.0)  [pc 16, 0x4A9]
eventOwner:say(quest, 45.0, 0.0)  [pc 21, 0x4BD]
eventOwner:say(quest, 46.0, 0.0)  [pc 26, 0x4D1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x4DD]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x4F1]
eventOwner:say(quest, 49.0, 0.0)  [pc 39, 0x505]
eventOwner:_runCharaScheduler(354103296.0)  [pc 42, 0x511]
eventOwner:say(quest, 50.0, 0.0)  [pc 47, 0x525]
eventOwner:finishCliantTalkTurn()  [pc 49, 0x52D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 52, 0x539]
eventOwner:say(quest, 3.0, 0.0)  [pc 57, 0x54D]
quest:_wait(2.0)  [pc 60, 0x559]
eventOwner:_runCharaScheduler(353976320.0)  [pc 63, 0x565]
eventOwner:say(quest, 4.0, 0.0)  [pc 68, 0x579]
eventOwner:say(quest, 5.0, 0.0)  [pc 73, 0x58D]
eventOwner:_runCharaScheduler(353976320.0)  [pc 76, 0x599]
eventOwner:say(quest, 6.0, 0.0)  [pc 81, 0x5AD]
eventOwner:say(quest, 7.0, 0.0)  [pc 86, 0x5C1]
quest:_wait(1.5)  [pc 89, 0x5CD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 93, 0x5DD]
eventOwner:say(quest, 8.0, 0.0)  [pc 98, 0x5F1]
call100.1.return1 = quest:showQuestInfomation()  [pc 100, 0x5F9]
eventOwner:_runCharaScheduler(353980416.0)  [pc 105, 0x60D]
eventOwner:say(quest, 10.0, 0.0)  [pc 110, 0x621]
eventOwner:finishCliantTalkTurn()  [pc 124, 0x659]
return call100.1.return1
```

### Path 2

```text
require (call100.1.return1 == 1.0) is false  [pc 101, 0x5FD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x475]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x481]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x495]
eventOwner:say(quest, 44.0, 0.0)  [pc 16, 0x4A9]
eventOwner:say(quest, 45.0, 0.0)  [pc 21, 0x4BD]
eventOwner:say(quest, 46.0, 0.0)  [pc 26, 0x4D1]
eventOwner:_runCharaScheduler(354082816.0)  [pc 29, 0x4DD]
eventOwner:say(quest, 47.0, 0.0)  [pc 34, 0x4F1]
eventOwner:say(quest, 49.0, 0.0)  [pc 39, 0x505]
eventOwner:_runCharaScheduler(354103296.0)  [pc 42, 0x511]
eventOwner:say(quest, 50.0, 0.0)  [pc 47, 0x525]
eventOwner:finishCliantTalkTurn()  [pc 49, 0x52D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 52, 0x539]
eventOwner:say(quest, 3.0, 0.0)  [pc 57, 0x54D]
quest:_wait(2.0)  [pc 60, 0x559]
eventOwner:_runCharaScheduler(353976320.0)  [pc 63, 0x565]
eventOwner:say(quest, 4.0, 0.0)  [pc 68, 0x579]
eventOwner:say(quest, 5.0, 0.0)  [pc 73, 0x58D]
eventOwner:_runCharaScheduler(353976320.0)  [pc 76, 0x599]
eventOwner:say(quest, 6.0, 0.0)  [pc 81, 0x5AD]
eventOwner:say(quest, 7.0, 0.0)  [pc 86, 0x5C1]
quest:_wait(1.5)  [pc 89, 0x5CD]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 93, 0x5DD]
eventOwner:say(quest, 8.0, 0.0)  [pc 98, 0x5F1]
call100.1.return1 = quest:showQuestInfomation()  [pc 100, 0x5F9]
eventOwner:_runCharaScheduler(354041856.0)  [pc 114, 0x631]
quest:_wait(1.0)  [pc 117, 0x63D]
eventOwner:say(quest, 9.0, 0.0)  [pc 122, 0x651]
eventOwner:finishCliantTalkTurn()  [pc 124, 0x659]
return call100.1.return1
```

## processEvent000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x7F2]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x7FE]
eventOwner:say(quest, 11.0, 0.0)  [pc 11, 0x812]
eventOwner:say(quest, 12.0, 0.0)  [pc 16, 0x826]
eventOwner:_runCharaScheduler(354050048.0)  [pc 19, 0x832]
eventOwner:say(quest, 13.0, 0.0)  [pc 24, 0x846]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x84E]
return 
```

## processEvent000_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x91D]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x929]
eventOwner:say(quest, 34.0, 0.0)  [pc 11, 0x93D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x945]
return 
```

## processEvent000_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9F9]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xA05]
eventOwner:say(quest, 35.0, 0.0)  [pc 11, 0xA19]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA21]
return 
```

## processEvent005 — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAD5]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xAE1]
eventOwner:say(quest, 14.0, 0.0, arg4)  [pc 12, 0xAF9]
eventOwner:say(quest, 15.0, 0.0)  [pc 17, 0xB0D]
quest:startFadeOut(player, 1.0)  [pc 21, 0xB1D]
quest:_wait(2.0)  [pc 24, 0xB29]
quest:startFadeIn(player, 1.0)  [pc 28, 0xB39]
eventOwner:_runCharaScheduler(70017024.0)  [pc 31, 0xB45]
eventOwner:say(quest, 16.0, 0.0)  [pc 36, 0xB59]
eventOwner:say(quest, 17.0, 0.0)  [pc 41, 0xB6D]
eventOwner:say(quest, 18.0, 0.0)  [pc 46, 0xB81]
eventOwner:say(quest, 19.0, 0.0)  [pc 51, 0xB95]
eventOwner:_runCharaScheduler(70017024.0)  [pc 54, 0xBA1]
eventOwner:say(quest, 42.0, 0.0)  [pc 59, 0xBB5]
eventOwner:finishCliantTalkTurn()  [pc 61, 0xBBD]
return 
```

## processEvent005_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCDE]
eventOwner:say(quest, 20.0, 0.0)  [pc 8, 0xCF2]
eventOwner:_runCharaScheduler(70254592.0)  [pc 11, 0xCFE]
eventOwner:say(quest, 21.0, 0.0)  [pc 16, 0xD12]
eventOwner:say(quest, 22.0, 0.0)  [pc 21, 0xD26]
eventOwner:say(quest, 43.0, 0.0)  [pc 26, 0xD3A]
eventOwner:finishCliantTalkTurn()  [pc 28, 0xD42]
return 
```

## processEvent005_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE11]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xE1D]
eventOwner:say(quest, 36.0, 0.0)  [pc 11, 0xE31]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE39]
return 
```

## processEvent005_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xEED]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xEF9]
eventOwner:say(quest, 37.0, 0.0)  [pc 11, 0xF0D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF15]
return 
```

## processEvent010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFC9]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xFD5]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0xFE9]
eventOwner:say(quest, 26.0, 0.0)  [pc 16, 0xFFD]
eventOwner:say(quest, 27.0, 0.0)  [pc 21, 0x1011]
eventOwner:say(quest, 28.0, 0.0)  [pc 26, 0x1025]
eventOwner:say(quest, 29.0, 0.0)  [pc 31, 0x1039]
eventOwner:_runCharaScheduler(70017024.0)  [pc 34, 0x1045]
eventOwner:say(quest, 30.0, 0.0)  [pc 39, 0x1059]
eventOwner:finishCliantTalkTurn()  [pc 41, 0x1061]
eventOwner:say(quest, 31.0, 0.0)  [pc 46, 0x1075]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 50, 0x1085]
eventOwner:say(quest, 32.0, 0.0)  [pc 55, 0x1099]
eventOwner:_runCharaScheduler(70254592.0)  [pc 58, 0x10A5]
eventOwner:say(quest, 33.0, 0.0)  [pc 63, 0x10B9]
eventOwner:finishCliantTalkTurn()  [pc 65, 0x10C1]
return 
```

## processEvent010_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x11C6]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x11D2]
eventOwner:say(quest, 38.0, 0.0)  [pc 11, 0x11E6]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x11EE]
return 
```

## processEvent010_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x12A2]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x12AE]
eventOwner:say(quest, 39.0, 0.0)  [pc 11, 0x12C2]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x12CA]
return 
```

## processEventClear — 3 parameters
### Path 1

```text
quest:_wait(3.0)  [pc 2, 0x137A]
quest:showGetJobAbilityWidget(player, 27318.0, 2.0)  [pc 7, 0x138E]
quest:_wait(6.0)  [pc 10, 0x139A]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111263.0, 26.0)  [pc 6, 0x142E]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111263.0, 26.0)  [pc 6, 0x14AB]
return 
```

