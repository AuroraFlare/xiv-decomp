# 111606 com0g6: reconstructed client path templates

## processEventHint — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x44F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x43B]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x44B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x45F]
quest:_wait(1.0)  [pc 15, 0x46B]
eventOwner:say(quest, 80.0, 0.0)  [pc 20, 0x47F]
eventOwner:say(quest, 81.0, 0.0)  [pc 25, 0x493]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x49F]
eventOwner:say(quest, 82.0, 0.0)  [pc 33, 0x4B3]
eventOwner:say(quest, 83.0, 0.0)  [pc 38, 0x4C7]
eventOwner:_runCharaScheduler(353968128.0)  [pc 41, 0x4D3]
eventOwner:say(quest, 84.0, 0.0)  [pc 46, 0x4E7]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x4EF]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x44F]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x43B]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x44B]
quest:_wait(1.0)  [pc 15, 0x46B]
eventOwner:say(quest, 80.0, 0.0)  [pc 20, 0x47F]
eventOwner:say(quest, 81.0, 0.0)  [pc 25, 0x493]
eventOwner:_runCharaScheduler(353964032.0)  [pc 28, 0x49F]
eventOwner:say(quest, 82.0, 0.0)  [pc 33, 0x4B3]
eventOwner:say(quest, 83.0, 0.0)  [pc 38, 0x4C7]
eventOwner:_runCharaScheduler(353968128.0)  [pc 41, 0x4D3]
eventOwner:say(quest, 84.0, 0.0)  [pc 46, 0x4E7]
eventOwner:finishCliantTalkTurn()  [pc 48, 0x4EF]
return 
```

## processEventStart — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x618]
require (call95.1.return1 == 1.0) is true  [pc 96, 0x778]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x604]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x614]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x628]
quest:_wait(1.0)  [pc 15, 0x634]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x648]
quest:startFadeOut(player, 1.0)  [pc 24, 0x658]
quest:_wait(1.0)  [pc 27, 0x664]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x670]
quest:startFadeIn(player, 1.0)  [pc 34, 0x680]
eventOwner:say(quest, 86.0, 0.0)  [pc 39, 0x694]
eventOwner:say(quest, 3.0, 0.0)  [pc 44, 0x6A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 49, 0x6BC]
eventOwner:say(quest, 4.0, 0.0)  [pc 54, 0x6D0]
eventOwner:say(quest, 5.0, 0.0)  [pc 59, 0x6E4]
eventOwner:_runCharaScheduler(353959936.0)  [pc 62, 0x6F0]
eventOwner:say(quest, 6.0, 0.0)  [pc 67, 0x704]
eventOwner:say(quest, 7.0, 0.0)  [pc 72, 0x718]
eventOwner:_runCharaScheduler(353964032.0)  [pc 75, 0x724]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x738]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x74C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 88, 0x758]
eventOwner:say(quest, 10.0, 0.0)  [pc 93, 0x76C]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x774]
eventOwner:say(quest, 12.0, 0.0)  [pc 102, 0x790]
eventOwner:finishCliantTalkTurn()  [pc 104, 0x798]
return call95.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x618]
require (call95.1.return1 == 1.0) is false  [pc 96, 0x778]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x604]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x614]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x628]
quest:_wait(1.0)  [pc 15, 0x634]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x648]
quest:startFadeOut(player, 1.0)  [pc 24, 0x658]
quest:_wait(1.0)  [pc 27, 0x664]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x670]
quest:startFadeIn(player, 1.0)  [pc 34, 0x680]
eventOwner:say(quest, 86.0, 0.0)  [pc 39, 0x694]
eventOwner:say(quest, 3.0, 0.0)  [pc 44, 0x6A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 49, 0x6BC]
eventOwner:say(quest, 4.0, 0.0)  [pc 54, 0x6D0]
eventOwner:say(quest, 5.0, 0.0)  [pc 59, 0x6E4]
eventOwner:_runCharaScheduler(353959936.0)  [pc 62, 0x6F0]
eventOwner:say(quest, 6.0, 0.0)  [pc 67, 0x704]
eventOwner:say(quest, 7.0, 0.0)  [pc 72, 0x718]
eventOwner:_runCharaScheduler(353964032.0)  [pc 75, 0x724]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x738]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x74C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 88, 0x758]
eventOwner:say(quest, 10.0, 0.0)  [pc 93, 0x76C]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x774]
eventOwner:say(quest, 11.0, 0.0)  [pc 111, 0x7B4]
eventOwner:finishCliantTalkTurn()  [pc 113, 0x7BC]
return call95.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x618]
require (call95.1.return1 == 1.0) is true  [pc 96, 0x778]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x604]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x614]
quest:_wait(1.0)  [pc 15, 0x634]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x648]
quest:startFadeOut(player, 1.0)  [pc 24, 0x658]
quest:_wait(1.0)  [pc 27, 0x664]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x670]
quest:startFadeIn(player, 1.0)  [pc 34, 0x680]
eventOwner:say(quest, 86.0, 0.0)  [pc 39, 0x694]
eventOwner:say(quest, 3.0, 0.0)  [pc 44, 0x6A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 49, 0x6BC]
eventOwner:say(quest, 4.0, 0.0)  [pc 54, 0x6D0]
eventOwner:say(quest, 5.0, 0.0)  [pc 59, 0x6E4]
eventOwner:_runCharaScheduler(353959936.0)  [pc 62, 0x6F0]
eventOwner:say(quest, 6.0, 0.0)  [pc 67, 0x704]
eventOwner:say(quest, 7.0, 0.0)  [pc 72, 0x718]
eventOwner:_runCharaScheduler(353964032.0)  [pc 75, 0x724]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x738]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x74C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 88, 0x758]
eventOwner:say(quest, 10.0, 0.0)  [pc 93, 0x76C]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x774]
eventOwner:say(quest, 12.0, 0.0)  [pc 102, 0x790]
eventOwner:finishCliantTalkTurn()  [pc 104, 0x798]
return call95.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x618]
require (call95.1.return1 == 1.0) is false  [pc 96, 0x778]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x604]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x614]
quest:_wait(1.0)  [pc 15, 0x634]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x648]
quest:startFadeOut(player, 1.0)  [pc 24, 0x658]
quest:_wait(1.0)  [pc 27, 0x664]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x670]
quest:startFadeIn(player, 1.0)  [pc 34, 0x680]
eventOwner:say(quest, 86.0, 0.0)  [pc 39, 0x694]
eventOwner:say(quest, 3.0, 0.0)  [pc 44, 0x6A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 49, 0x6BC]
eventOwner:say(quest, 4.0, 0.0)  [pc 54, 0x6D0]
eventOwner:say(quest, 5.0, 0.0)  [pc 59, 0x6E4]
eventOwner:_runCharaScheduler(353959936.0)  [pc 62, 0x6F0]
eventOwner:say(quest, 6.0, 0.0)  [pc 67, 0x704]
eventOwner:say(quest, 7.0, 0.0)  [pc 72, 0x718]
eventOwner:_runCharaScheduler(353964032.0)  [pc 75, 0x724]
eventOwner:say(quest, 8.0, 0.0)  [pc 80, 0x738]
eventOwner:say(quest, 9.0, 0.0)  [pc 85, 0x74C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 88, 0x758]
eventOwner:say(quest, 10.0, 0.0)  [pc 93, 0x76C]
call95.1.return1 = quest:showQuestInfomation()  [pc 95, 0x774]
eventOwner:say(quest, 11.0, 0.0)  [pc 111, 0x7B4]
eventOwner:finishCliantTalkTurn()  [pc 113, 0x7BC]
return call95.1.return1
```

## processEventStartAfter — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x976]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x962]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x972]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x986]
quest:_wait(1.0)  [pc 15, 0x992]
eventOwner:say(quest, 13.0, 0.0)  [pc 20, 0x9A6]
eventOwner:say(quest, 14.0, 0.0)  [pc 25, 0x9BA]
eventOwner:finishCliantTalkTurn()  [pc 27, 0x9C2]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x976]
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0x962]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x972]
quest:_wait(1.0)  [pc 15, 0x992]
eventOwner:say(quest, 13.0, 0.0)  [pc 20, 0x9A6]
eventOwner:say(quest, 14.0, 0.0)  [pc 25, 0x9BA]
eventOwner:finishCliantTalkTurn()  [pc 27, 0x9C2]
return 
```

## processEventLewin — 5 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 4, 0xABB]
require (arg5 == 2.0) is true  [pc 6, 0xAC3]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAB7]
eventOwner:_runCharaScheduler(353959936.0)  [pc 10, 0xAD3]
eventOwner:say(quest, 15.0, 0.0)  [pc 15, 0xAE7]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0xB1F]
eventOwner:_runCharaScheduler(354086912.0)  [pc 32, 0xB2B]
eventOwner:say(quest, 18.0, 0.0)  [pc 37, 0xB3F]
eventOwner:say(quest, 19.0, 0.0)  [pc 42, 0xB53]
eventOwner:say(quest, 20.0, 0.0)  [pc 47, 0xB67]
eventOwner:_runCharaScheduler(354103296.0)  [pc 50, 0xB73]
eventOwner:say(quest, 21.0, 0.0)  [pc 55, 0xB87]
eventOwner:say(quest, 22.0, 0.0)  [pc 60, 0xB9B]
eventOwner:say(quest, 23.0, 0.0)  [pc 65, 0xBAF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 68, 0xBBB]
eventOwner:say(quest, 24.0, 0.0)  [pc 73, 0xBCF]
eventOwner:say(quest, 25.0, 0.0)  [pc 78, 0xBE3]
eventOwner:say(quest, 26.0, 0.0)  [pc 83, 0xBF7]
eventOwner:finishCliantTalkTurn()  [pc 85, 0xBFF]
return 
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 4, 0xABB]
require (arg5 == 2.0) is false  [pc 6, 0xAC3]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAB7]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0xAF7]
eventOwner:say(quest, 16.0, 0.0)  [pc 24, 0xB0B]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0xB1F]
eventOwner:_runCharaScheduler(354086912.0)  [pc 32, 0xB2B]
eventOwner:say(quest, 18.0, 0.0)  [pc 37, 0xB3F]
eventOwner:say(quest, 19.0, 0.0)  [pc 42, 0xB53]
eventOwner:say(quest, 20.0, 0.0)  [pc 47, 0xB67]
eventOwner:_runCharaScheduler(354103296.0)  [pc 50, 0xB73]
eventOwner:say(quest, 21.0, 0.0)  [pc 55, 0xB87]
eventOwner:say(quest, 22.0, 0.0)  [pc 60, 0xB9B]
eventOwner:say(quest, 23.0, 0.0)  [pc 65, 0xBAF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 68, 0xBBB]
eventOwner:say(quest, 24.0, 0.0)  [pc 73, 0xBCF]
eventOwner:say(quest, 25.0, 0.0)  [pc 78, 0xBE3]
eventOwner:say(quest, 26.0, 0.0)  [pc 83, 0xBF7]
eventOwner:finishCliantTalkTurn()  [pc 85, 0xBFF]
return 
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 4, 0xABB]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xAB7]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0xAF7]
eventOwner:say(quest, 16.0, 0.0)  [pc 24, 0xB0B]
eventOwner:say(quest, 17.0, 0.0)  [pc 29, 0xB1F]
eventOwner:_runCharaScheduler(354086912.0)  [pc 32, 0xB2B]
eventOwner:say(quest, 18.0, 0.0)  [pc 37, 0xB3F]
eventOwner:say(quest, 19.0, 0.0)  [pc 42, 0xB53]
eventOwner:say(quest, 20.0, 0.0)  [pc 47, 0xB67]
eventOwner:_runCharaScheduler(354103296.0)  [pc 50, 0xB73]
eventOwner:say(quest, 21.0, 0.0)  [pc 55, 0xB87]
eventOwner:say(quest, 22.0, 0.0)  [pc 60, 0xB9B]
eventOwner:say(quest, 23.0, 0.0)  [pc 65, 0xBAF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 68, 0xBBB]
eventOwner:say(quest, 24.0, 0.0)  [pc 73, 0xBCF]
eventOwner:say(quest, 25.0, 0.0)  [pc 78, 0xBE3]
eventOwner:say(quest, 26.0, 0.0)  [pc 83, 0xBF7]
eventOwner:finishCliantTalkTurn()  [pc 85, 0xBFF]
return 
```

## processEventLewinAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD35]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xD41]
eventOwner:say(quest, 68.0, 0.0)  [pc 11, 0xD55]
eventOwner:say(quest, 79.0, 0.0)  [pc 16, 0xD69]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xD71]
return 
```

## processEventPesi — 5 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 4, 0xE36]
require (arg5 == 2.0) is true  [pc 6, 0xE3E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE32]
eventOwner:_runCharaScheduler(353959936.0)  [pc 10, 0xE4E]
eventOwner:say(quest, 61.0, 0.0)  [pc 15, 0xE62]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xE8E]
return 
```

### Path 2

```text
require (arg4 == 1.0) is true  [pc 4, 0xE36]
require (arg5 == 2.0) is false  [pc 6, 0xE3E]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE32]
eventOwner:_runCharaScheduler(353964032.0)  [pc 19, 0xE72]
eventOwner:say(quest, 60.0, 0.0)  [pc 24, 0xE86]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xE8E]
return 
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 4, 0xE36]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE32]
eventOwner:_runCharaScheduler(353964032.0)  [pc 19, 0xE72]
eventOwner:say(quest, 60.0, 0.0)  [pc 24, 0xE86]
eventOwner:finishCliantTalkTurn()  [pc 26, 0xE8E]
return 
```

## processEventPesiAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF61]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0xF6D]
eventOwner:say(quest, 67.0, 0.0)  [pc 11, 0xF81]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF89]
return 
```

## processEventSwethyna — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1041]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x104D]
eventOwner:say(quest, 59.0, 0.0)  [pc 11, 0x1061]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1069]
return 
```

## processEventSwethynaAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1121]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x112D]
eventOwner:say(quest, 66.0, 0.0)  [pc 11, 0x1141]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1149]
return 
```

## processEventConcessa — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1201]
eventOwner:say(quest, 64.0, 0.0)  [pc 8, 0x1215]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x121D]
return 
```

## processEventConcessaAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x12B4]
eventOwner:say(quest, 71.0, 0.0)  [pc 8, 0x12C8]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x12D0]
return 
```

## processEventKinborow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1367]
eventOwner:say(quest, 65.0, 0.0)  [pc 8, 0x137B]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x1383]
return 
```

## processEventKinborowAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x141A]
eventOwner:say(quest, 72.0, 0.0)  [pc 8, 0x142E]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x1436]
return 
```

## processEventNorbertillon — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x14CD]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x14D9]
eventOwner:say(quest, 63.0, 0.0)  [pc 11, 0x14ED]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x14F5]
return 
```

## processEventNorbertillonAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x15AD]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x15B9]
eventOwner:say(quest, 70.0, 0.0)  [pc 11, 0x15CD]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x15D5]
return 
```

## processEventSorezari — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x168D]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x1699]
eventOwner:say(quest, 62.0, 0.0)  [pc 11, 0x16AD]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x16B5]
return 
```

## processEventSorezariAfter — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x176D]
eventOwner:_runCharaScheduler(353968128.0)  [pc 6, 0x1779]
eventOwner:say(quest, 69.0, 0.0)  [pc 11, 0x178D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1795]
return 
```

## processEventClear — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 8, 0x1861]
require (arg4 == 1.0) is true  [pc 87, 0x199D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x184D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1859]
eventOwner:say(quest, 46.0, 0.0)  [pc 14, 0x1879]
eventOwner:say(quest, 75.0, 0.0)  [pc 54, 0x1919]
eventOwner:say(quest, 47.0, 0.0)  [pc 59, 0x192D]
eventOwner:_runCharaScheduler(353972224.0)  [pc 62, 0x1939]
eventOwner:say(quest, 48.0, 0.0)  [pc 67, 0x194D]
eventOwner:say(quest, 49.0, 0.0)  [pc 72, 0x1961]
eventOwner:say(quest, 50.0, 0.0)  [pc 77, 0x1975]
eventOwner:_runCharaScheduler(354086912.0)  [pc 80, 0x1981]
eventOwner:say(quest, 51.0, 0.0)  [pc 85, 0x1995]
eventOwner:say(quest, 53.0, 0.0)  [pc 93, 0x19B5]
quest:_wait(1.0)  [pc 131, 0x1A4D]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 135, 0x1A5D]
eventOwner:waitCliantTalkTurn()  [pc 137, 0x1A65]
eventOwner:_runCharaScheduler(354099200.0)  [pc 140, 0x1A71]
eventOwner:say(quest, 56.0, 0.0)  [pc 145, 0x1A85]
eventOwner:say(quest, 76.0, 0.0)  [pc 150, 0x1A99]
eventOwner:say(quest, 57.0, 0.0)  [pc 155, 0x1AAD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 158, 0x1AB9]
eventOwner:say(quest, 58.0, 0.0)  [pc 163, 0x1ACD]
eventOwner:say(quest, 78.0, 0.0)  [pc 168, 0x1AE1]
eventOwner:finishCliantTalkTurn()  [pc 170, 0x1AE9]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 8, 0x1861]
require (arg4 == 2.0) is true  [pc 17, 0x1885]
require (arg4 == 1.0) is false  [pc 87, 0x199D]
require (arg4 == 2.0) is true  [pc 96, 0x19C1]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x184D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1859]
eventOwner:say(quest, 46.0, 0.0)  [pc 23, 0x189D]
eventOwner:say(quest, 75.0, 0.0)  [pc 54, 0x1919]
eventOwner:say(quest, 47.0, 0.0)  [pc 59, 0x192D]
eventOwner:_runCharaScheduler(353972224.0)  [pc 62, 0x1939]
eventOwner:say(quest, 48.0, 0.0)  [pc 67, 0x194D]
eventOwner:say(quest, 49.0, 0.0)  [pc 72, 0x1961]
eventOwner:say(quest, 50.0, 0.0)  [pc 77, 0x1975]
eventOwner:_runCharaScheduler(354086912.0)  [pc 80, 0x1981]
eventOwner:say(quest, 51.0, 0.0)  [pc 85, 0x1995]
eventOwner:say(quest, 54.0, 0.0)  [pc 102, 0x19D9]
quest:_wait(1.0)  [pc 131, 0x1A4D]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 135, 0x1A5D]
eventOwner:waitCliantTalkTurn()  [pc 137, 0x1A65]
eventOwner:_runCharaScheduler(354099200.0)  [pc 140, 0x1A71]
eventOwner:say(quest, 56.0, 0.0)  [pc 145, 0x1A85]
eventOwner:say(quest, 76.0, 0.0)  [pc 150, 0x1A99]
eventOwner:say(quest, 57.0, 0.0)  [pc 155, 0x1AAD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 158, 0x1AB9]
eventOwner:say(quest, 58.0, 0.0)  [pc 163, 0x1ACD]
eventOwner:say(quest, 78.0, 0.0)  [pc 168, 0x1AE1]
eventOwner:finishCliantTalkTurn()  [pc 170, 0x1AE9]
return 
```

### Path 3

```text
require (arg4 == 1.0) is false  [pc 8, 0x1861]
require (arg4 == 2.0) is false  [pc 17, 0x1885]
require (arg4 == 3.0) is true  [pc 26, 0x18A9]
require (arg4 == 1.0) is false  [pc 87, 0x199D]
require (arg4 == 2.0) is false  [pc 96, 0x19C1]
require (arg4 == 3.0) is true  [pc 105, 0x19E5]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x184D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1859]
eventOwner:say(quest, 74.0, 0.0)  [pc 32, 0x18C1]
eventOwner:say(quest, 75.0, 0.0)  [pc 54, 0x1919]
eventOwner:say(quest, 47.0, 0.0)  [pc 59, 0x192D]
eventOwner:_runCharaScheduler(353972224.0)  [pc 62, 0x1939]
eventOwner:say(quest, 48.0, 0.0)  [pc 67, 0x194D]
eventOwner:say(quest, 49.0, 0.0)  [pc 72, 0x1961]
eventOwner:say(quest, 50.0, 0.0)  [pc 77, 0x1975]
eventOwner:_runCharaScheduler(354086912.0)  [pc 80, 0x1981]
eventOwner:say(quest, 51.0, 0.0)  [pc 85, 0x1995]
eventOwner:say(quest, 52.0, 0.0)  [pc 111, 0x19FD]
quest:_wait(1.0)  [pc 131, 0x1A4D]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 135, 0x1A5D]
eventOwner:waitCliantTalkTurn()  [pc 137, 0x1A65]
eventOwner:_runCharaScheduler(354099200.0)  [pc 140, 0x1A71]
eventOwner:say(quest, 56.0, 0.0)  [pc 145, 0x1A85]
eventOwner:say(quest, 76.0, 0.0)  [pc 150, 0x1A99]
eventOwner:say(quest, 57.0, 0.0)  [pc 155, 0x1AAD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 158, 0x1AB9]
eventOwner:say(quest, 58.0, 0.0)  [pc 163, 0x1ACD]
eventOwner:say(quest, 78.0, 0.0)  [pc 168, 0x1AE1]
eventOwner:finishCliantTalkTurn()  [pc 170, 0x1AE9]
return 
```

### Path 4

```text
require (arg4 == 1.0) is false  [pc 8, 0x1861]
require (arg4 == 2.0) is false  [pc 17, 0x1885]
require (arg4 == 3.0) is false  [pc 26, 0x18A9]
require (arg4 == 4.0) is true  [pc 35, 0x18CD]
require (arg4 == 1.0) is false  [pc 87, 0x199D]
require (arg4 == 2.0) is false  [pc 96, 0x19C1]
require (arg4 == 3.0) is false  [pc 105, 0x19E5]
require (arg4 == 4.0) is true  [pc 114, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x184D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1859]
eventOwner:say(quest, 46.0, 0.0)  [pc 41, 0x18E5]
eventOwner:say(quest, 75.0, 0.0)  [pc 54, 0x1919]
eventOwner:say(quest, 47.0, 0.0)  [pc 59, 0x192D]
eventOwner:_runCharaScheduler(353972224.0)  [pc 62, 0x1939]
eventOwner:say(quest, 48.0, 0.0)  [pc 67, 0x194D]
eventOwner:say(quest, 49.0, 0.0)  [pc 72, 0x1961]
eventOwner:say(quest, 50.0, 0.0)  [pc 77, 0x1975]
eventOwner:_runCharaScheduler(354086912.0)  [pc 80, 0x1981]
eventOwner:say(quest, 51.0, 0.0)  [pc 85, 0x1995]
eventOwner:say(quest, 55.0, 0.0)  [pc 120, 0x1A21]
quest:_wait(1.0)  [pc 131, 0x1A4D]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 135, 0x1A5D]
eventOwner:waitCliantTalkTurn()  [pc 137, 0x1A65]
eventOwner:_runCharaScheduler(354099200.0)  [pc 140, 0x1A71]
eventOwner:say(quest, 56.0, 0.0)  [pc 145, 0x1A85]
eventOwner:say(quest, 76.0, 0.0)  [pc 150, 0x1A99]
eventOwner:say(quest, 57.0, 0.0)  [pc 155, 0x1AAD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 158, 0x1AB9]
eventOwner:say(quest, 58.0, 0.0)  [pc 163, 0x1ACD]
eventOwner:say(quest, 78.0, 0.0)  [pc 168, 0x1AE1]
eventOwner:finishCliantTalkTurn()  [pc 170, 0x1AE9]
return 
```

### Path 5

```text
require (arg4 == 1.0) is false  [pc 8, 0x1861]
require (arg4 == 2.0) is false  [pc 17, 0x1885]
require (arg4 == 3.0) is false  [pc 26, 0x18A9]
require (arg4 == 4.0) is false  [pc 35, 0x18CD]
require (arg4 == 1.0) is false  [pc 87, 0x199D]
require (arg4 == 2.0) is false  [pc 96, 0x19C1]
require (arg4 == 3.0) is false  [pc 105, 0x19E5]
require (arg4 == 4.0) is false  [pc 114, 0x1A09]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x184D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1859]
eventOwner:say(quest, 74.0, 0.0)  [pc 48, 0x1901]
eventOwner:say(quest, 75.0, 0.0)  [pc 54, 0x1919]
eventOwner:say(quest, 47.0, 0.0)  [pc 59, 0x192D]
eventOwner:_runCharaScheduler(353972224.0)  [pc 62, 0x1939]
eventOwner:say(quest, 48.0, 0.0)  [pc 67, 0x194D]
eventOwner:say(quest, 49.0, 0.0)  [pc 72, 0x1961]
eventOwner:say(quest, 50.0, 0.0)  [pc 77, 0x1975]
eventOwner:_runCharaScheduler(354086912.0)  [pc 80, 0x1981]
eventOwner:say(quest, 51.0, 0.0)  [pc 85, 0x1995]
eventOwner:say(quest, 52.0, 0.0)  [pc 127, 0x1A3D]
quest:_wait(1.0)  [pc 131, 0x1A4D]
eventOwner:startCliantTalkTurn(1.0, player)  [pc 135, 0x1A5D]
eventOwner:waitCliantTalkTurn()  [pc 137, 0x1A65]
eventOwner:_runCharaScheduler(354099200.0)  [pc 140, 0x1A71]
eventOwner:say(quest, 56.0, 0.0)  [pc 145, 0x1A85]
eventOwner:say(quest, 76.0, 0.0)  [pc 150, 0x1A99]
eventOwner:say(quest, 57.0, 0.0)  [pc 155, 0x1AAD]
eventOwner:_runCharaScheduler(353959936.0)  [pc 158, 0x1AB9]
eventOwner:say(quest, 58.0, 0.0)  [pc 163, 0x1ACD]
eventOwner:say(quest, 78.0, 0.0)  [pc 168, 0x1AE1]
eventOwner:finishCliantTalkTurn()  [pc 170, 0x1AE9]
return 
```

## processEventNq — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1C86]
quest:startNQCutScene('COM0G510', 1.0)  [pc 6, 0x1C96]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0x1CA2]
return 
```

