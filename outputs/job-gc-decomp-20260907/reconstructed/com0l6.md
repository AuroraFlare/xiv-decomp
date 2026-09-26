# 111406 com0l6: reconstructed client path templates

## processEventGUINCUMStart — 4 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x42B]
require (arg4 == 1.0) is true  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is true  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x43B]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 8.0, 0.0)  [pc 89, 0x56F]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(354066432.0)  [pc 138, 0x633]
eventOwner:say(quest, 18.0, 0.0)  [pc 143, 0x647]
eventOwner:say(quest, 19.0, 0.0)  [pc 148, 0x65B]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 2

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x42B]
require (arg4 == 1.0) is true  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is false  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x43B]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 8.0, 0.0)  [pc 89, 0x56F]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 152, 0x66B]
eventOwner:say(quest, 16.0, 0.0)  [pc 157, 0x67F]
eventOwner:say(quest, 17.0, 0.0)  [pc 162, 0x693]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 3

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x42B]
require (arg4 == 1.0) is false  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is true  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x43B]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 9.0, 0.0)  [pc 95, 0x587]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(354066432.0)  [pc 138, 0x633]
eventOwner:say(quest, 18.0, 0.0)  [pc 143, 0x647]
eventOwner:say(quest, 19.0, 0.0)  [pc 148, 0x65B]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 4

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x42B]
require (arg4 == 1.0) is false  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is false  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
eventOwner:_runCharaScheduler(354062336.0)  [pc 12, 0x43B]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 9.0, 0.0)  [pc 95, 0x587]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 152, 0x66B]
eventOwner:say(quest, 16.0, 0.0)  [pc 157, 0x67F]
eventOwner:say(quest, 17.0, 0.0)  [pc 162, 0x693]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 5

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x42B]
require (arg4 == 1.0) is true  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is true  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 8.0, 0.0)  [pc 89, 0x56F]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(354066432.0)  [pc 138, 0x633]
eventOwner:say(quest, 18.0, 0.0)  [pc 143, 0x647]
eventOwner:say(quest, 19.0, 0.0)  [pc 148, 0x65B]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 6

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x42B]
require (arg4 == 1.0) is true  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is false  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 8.0, 0.0)  [pc 89, 0x56F]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 152, 0x66B]
eventOwner:say(quest, 16.0, 0.0)  [pc 157, 0x67F]
eventOwner:say(quest, 17.0, 0.0)  [pc 162, 0x693]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 7

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x42B]
require (arg4 == 1.0) is false  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is true  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 9.0, 0.0)  [pc 95, 0x587]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(354066432.0)  [pc 138, 0x633]
eventOwner:say(quest, 18.0, 0.0)  [pc 143, 0x647]
eventOwner:say(quest, 19.0, 0.0)  [pc 148, 0x65B]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

### Path 8

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x42B]
require (arg4 == 1.0) is false  [pc 83, 0x557]
require (call133.1.return1 == 1.0) is false  [pc 134, 0x623]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x417]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x427]
quest:_wait(1.0)  [pc 15, 0x447]
eventOwner:say(quest, 2.0, 0.0)  [pc 20, 0x45B]
quest:startFadeOut(player, 1.0)  [pc 24, 0x46B]
quest:_wait(1.0)  [pc 27, 0x477]
eventOwner:_runCharaScheduler(354086912.0)  [pc 30, 0x483]
quest:startFadeIn(player, 1.0)  [pc 34, 0x493]
eventOwner:say(quest, 103.0, 0.0)  [pc 39, 0x4A7]
eventOwner:say(quest, 104.0, 0.0)  [pc 44, 0x4BB]
eventOwner:say(quest, 3.0, 0.0)  [pc 49, 0x4CF]
eventOwner:_runCharaScheduler(353959936.0)  [pc 52, 0x4DB]
eventOwner:say(quest, 4.0, 0.0)  [pc 57, 0x4EF]
eventOwner:say(quest, 5.0, 0.0)  [pc 62, 0x503]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 66, 0x513]
eventOwner:_runCharaScheduler(353968128.0)  [pc 69, 0x51F]
eventOwner:say(quest, 6.0, 0.0)  [pc 74, 0x533]
eventOwner:_runCharaScheduler(353959936.0)  [pc 77, 0x53F]
eventOwner:say(quest, 7.0, 0.0)  [pc 82, 0x553]
eventOwner:say(quest, 9.0, 0.0)  [pc 95, 0x587]
eventOwner:say(quest, 11.0, 0.0)  [pc 100, 0x59B]
eventOwner:_runCharaScheduler(353972224.0)  [pc 103, 0x5A7]
eventOwner:say(quest, 12.0, 0.0)  [pc 108, 0x5BB]
eventOwner:say(quest, 13.0, 0.0)  [pc 113, 0x5CF]
eventOwner:_runCharaScheduler(353968128.0)  [pc 116, 0x5DB]
eventOwner:say(quest, 14.0, 0.0)  [pc 121, 0x5EF]
eventOwner:say(quest, 94.0, 0.0)  [pc 126, 0x603]
eventOwner:say(quest, 15.0, 0.0)  [pc 131, 0x617]
call133.1.return1 = quest:showQuestInfomation()  [pc 133, 0x61F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 152, 0x66B]
eventOwner:say(quest, 16.0, 0.0)  [pc 157, 0x67F]
eventOwner:say(quest, 17.0, 0.0)  [pc 162, 0x693]
eventOwner:finishCliantTalkTurn()  [pc 164, 0x69B]
return call133.1.return1
```

## processEventGUINCUMHint — 3 parameters
### Path 1

```text
require (call7.1.return1 == 0.0) is true  [pc 8, 0x89D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x889]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x899]
eventOwner:_runCharaScheduler(353959936.0)  [pc 12, 0x8AD]
quest:_wait(1.0)  [pc 15, 0x8B9]
eventOwner:say(quest, 98.0, 0.0)  [pc 20, 0x8CD]
eventOwner:say(quest, 99.0, 0.0)  [pc 25, 0x8E1]
eventOwner:say(quest, 100.0, 0.0)  [pc 30, 0x8F5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 33, 0x901]
eventOwner:say(quest, 101.0, 0.0)  [pc 38, 0x915]
eventOwner:say(quest, 102.0, 0.0)  [pc 43, 0x929]
eventOwner:finishCliantTalkTurn()  [pc 45, 0x931]
return 
```

### Path 2

```text
require (call7.1.return1 == 0.0) is false  [pc 8, 0x89D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x889]
call7.1.return1 = eventOwner:doSalute(1.0, 33.0)  [pc 7, 0x899]
quest:_wait(1.0)  [pc 15, 0x8B9]
eventOwner:say(quest, 98.0, 0.0)  [pc 20, 0x8CD]
eventOwner:say(quest, 99.0, 0.0)  [pc 25, 0x8E1]
eventOwner:say(quest, 100.0, 0.0)  [pc 30, 0x8F5]
eventOwner:_runCharaScheduler(353968128.0)  [pc 33, 0x901]
eventOwner:say(quest, 101.0, 0.0)  [pc 38, 0x915]
eventOwner:say(quest, 102.0, 0.0)  [pc 43, 0x929]
eventOwner:finishCliantTalkTurn()  [pc 45, 0x931]
return 
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA3D]
eventOwner:say(quest, 20.0, 0.0)  [pc 8, 0xA51]
eventOwner:say(quest, 21.0, 0.0)  [pc 13, 0xA65]
eventOwner:finishCliantTalkTurn()  [pc 15, 0xA6D]
return 
```

## processEvent_005_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB09]
eventOwner:_runCharaScheduler(354066432.0)  [pc 6, 0xB15]
eventOwner:say(quest, 22.0, 0.0)  [pc 11, 0xB29]
eventOwner:say(quest, 23.0, 0.0)  [pc 16, 0xB3D]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xB45]
return 
```

## processEvent_005_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC02]
eventOwner:_runCharaScheduler(354234368.0)  [pc 6, 0xC0E]
eventOwner:say(quest, 24.0, 0.0)  [pc 11, 0xC22]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC2A]
return 
```

## processEvent_005_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xCDE]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0xCEA]
eventOwner:say(quest, 96.0, 0.0)  [pc 11, 0xCFE]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xD06]
return 
```

## processEvent_005_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xDBA]
eventOwner:say(quest, 95.0, 0.0)  [pc 8, 0xDCE]
eventOwner:finishCliantTalkTurn()  [pc 10, 0xDD6]
return 
```

## processEvent_005 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE69]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0xE75]
eventOwner:say(quest, 25.0, 0.0)  [pc 11, 0xE89]
eventOwner:say(quest, 26.0, 0.0)  [pc 16, 0xE9D]
eventOwner:say(quest, 27.0, 0.0)  [pc 21, 0xEB1]
eventOwner:_runCharaScheduler(353959936.0)  [pc 24, 0xEBD]
eventOwner:say(quest, 28.0, 0.0)  [pc 29, 0xED1]
eventOwner:say(quest, 29.0, 0.0)  [pc 34, 0xEE5]
eventOwner:finishCliantTalkTurn()  [pc 36, 0xEED]
return 
```

## processEvent_010 — 4 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xFCA]
quest:startNQCutScene('com0l510', 1.0, 0.0, arg4)  [pc 8, 0xFE2]
quest:startFadeInCutSceneDefault(player)  [pc 11, 0xFEE]
return 
```

## processEvent_015_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x10A0]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x10AC]
eventOwner:say(quest, 59.0, 0.0)  [pc 11, 0x10C0]
eventOwner:say(quest, 60.0, 0.0)  [pc 16, 0x10D4]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x10DC]
return 
```

## processEvent_015_2 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1199]
eventOwner:say(quest, 61.0, 0.0)  [pc 8, 0x11AD]
eventOwner:_runCharaScheduler(84017152.0)  [pc 11, 0x11B9]
eventOwner:say(quest, 62.0, 0.0)  [pc 16, 0x11CD]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x11D5]
return 
```

## processEvent_015_3 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1292]
eventOwner:_runCharaScheduler(83968000.0)  [pc 6, 0x129E]
eventOwner:say(quest, 63.0, 0.0)  [pc 11, 0x12B2]
eventOwner:say(quest, 64.0, 0.0)  [pc 16, 0x12C6]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x12CE]
return 
```

## processEvent_015_4 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x138B]
eventOwner:say(quest, 89.0, 0.0)  [pc 8, 0x139F]
eventOwner:_runCharaScheduler(353968128.0)  [pc 11, 0x13AB]
eventOwner:say(quest, 90.0, 0.0)  [pc 16, 0x13BF]
eventOwner:finishCliantTalkTurn()  [pc 18, 0x13C7]
return 
```

## processEvent_015_5 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1484]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1490]
eventOwner:say(quest, 91.0, 0.0)  [pc 11, 0x14A4]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x14AC]
return 
```

## processEvent_015_6 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1560]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x156C]
eventOwner:say(quest, 92.0, 0.0)  [pc 11, 0x1580]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1588]
return 
```

## processEvent_015_7 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x163C]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x1648]
eventOwner:say(quest, 93.0, 0.0)  [pc 11, 0x165C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x1664]
return 
```

## processEvent_015 — 4 parameters
### Path 1

```text
require (arg4 == 3.0) is true  [pc 7, 0x1728]
require (arg4 == 1.0) is false  [pc 39, 0x17A8]
require (arg4 == 2.0) is false  [pc 51, 0x17D8]
require (arg4 == 3.0) is true  [pc 63, 0x1808]
require (arg4 == 3.0) is true  [pc 114, 0x18D4]
require (arg4 == 3.0) is true  [pc 159, 0x1988]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1718]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x1724]
eventOwner:say(quest, 65.0, 0.0)  [pc 13, 0x1740]
eventOwner:say(quest, 66.0, 0.0)  [pc 24, 0x176C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 27, 0x1778]
eventOwner:say(quest, 67.0, 0.0)  [pc 32, 0x178C]
eventOwner:say(quest, 68.0, 0.0)  [pc 37, 0x17A0]
eventOwner:_runCharaScheduler(354086912.0)  [pc 67, 0x1818]
eventOwner:say(quest, 71.0, 0.0)  [pc 72, 0x182C]
eventOwner:say(quest, 72.0, 0.0)  [pc 100, 0x189C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 103, 0x18A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 108, 0x18BC]
eventOwner:say(quest, 74.0, 0.0)  [pc 113, 0x18D0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 118, 0x18E4]
eventOwner:say(quest, 76.0, 0.0)  [pc 123, 0x18F8]
eventOwner:say(quest, 77.0, 0.0)  [pc 137, 0x1930]
eventOwner:say(quest, 78.0, 0.0)  [pc 142, 0x1944]
eventOwner:_runCharaScheduler(354082816.0)  [pc 145, 0x1950]
eventOwner:say(quest, 97.0, 0.0)  [pc 150, 0x1964]
quest:_wait(1.0)  [pc 153, 0x1970]
eventOwner:say(quest, 79.0, 0.0)  [pc 158, 0x1984]
eventOwner:_runCharaScheduler(353959936.0)  [pc 163, 0x1998]
quest:_wait(1.0)  [pc 166, 0x19A4]
eventOwner:say(quest, 82.0, 0.0)  [pc 171, 0x19B8]
eventOwner:say(quest, 83.0, 0.0)  [pc 176, 0x19CC]
eventOwner:say(quest, 84.0, 0.0)  [pc 198, 0x1A24]
eventOwner:say(quest, 85.0, 0.0)  [pc 203, 0x1A38]
eventOwner:_runCharaScheduler(353972224.0)  [pc 206, 0x1A44]
eventOwner:say(quest, 86.0, 0.0)  [pc 211, 0x1A58]
eventOwner:say(quest, 106.0, 0.0)  [pc 216, 0x1A6C]
eventOwner:say(quest, 87.0, 0.0)  [pc 221, 0x1A80]
eventOwner:_runCharaScheduler(354086912.0)  [pc 224, 0x1A8C]
quest:_wait(2.0)  [pc 227, 0x1A98]
eventOwner:say(quest, 88.0, 0.0)  [pc 232, 0x1AAC]
eventOwner:finishCliantTalkTurn()  [pc 234, 0x1AB4]
return 
```

### Path 2

```text
require (arg4 == 3.0) is false  [pc 7, 0x1728]
require (arg4 == 1.0) is true  [pc 39, 0x17A8]
require (arg4 == 3.0) is false  [pc 114, 0x18D4]
require (arg4 == 3.0) is false  [pc 159, 0x1988]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1718]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x1724]
eventOwner:say(quest, 109.0, 0.0)  [pc 19, 0x1758]
eventOwner:say(quest, 66.0, 0.0)  [pc 24, 0x176C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 27, 0x1778]
eventOwner:say(quest, 67.0, 0.0)  [pc 32, 0x178C]
eventOwner:say(quest, 68.0, 0.0)  [pc 37, 0x17A0]
eventOwner:_runCharaScheduler(354041856.0)  [pc 43, 0x17B8]
eventOwner:say(quest, 69.0, 0.0)  [pc 48, 0x17CC]
eventOwner:say(quest, 72.0, 0.0)  [pc 100, 0x189C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 103, 0x18A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 108, 0x18BC]
eventOwner:say(quest, 74.0, 0.0)  [pc 113, 0x18D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 127, 0x1908]
eventOwner:say(quest, 75.0, 0.0)  [pc 132, 0x191C]
eventOwner:say(quest, 77.0, 0.0)  [pc 137, 0x1930]
eventOwner:say(quest, 78.0, 0.0)  [pc 142, 0x1944]
eventOwner:_runCharaScheduler(354082816.0)  [pc 145, 0x1950]
eventOwner:say(quest, 97.0, 0.0)  [pc 150, 0x1964]
quest:_wait(1.0)  [pc 153, 0x1970]
eventOwner:say(quest, 79.0, 0.0)  [pc 158, 0x1984]
eventOwner:_runCharaScheduler(353959936.0)  [pc 180, 0x19DC]
quest:_wait(1.0)  [pc 183, 0x19E8]
eventOwner:say(quest, 80.0, 0.0)  [pc 188, 0x19FC]
eventOwner:say(quest, 81.0, 0.0)  [pc 193, 0x1A10]
eventOwner:say(quest, 84.0, 0.0)  [pc 198, 0x1A24]
eventOwner:say(quest, 85.0, 0.0)  [pc 203, 0x1A38]
eventOwner:_runCharaScheduler(353972224.0)  [pc 206, 0x1A44]
eventOwner:say(quest, 86.0, 0.0)  [pc 211, 0x1A58]
eventOwner:say(quest, 106.0, 0.0)  [pc 216, 0x1A6C]
eventOwner:say(quest, 87.0, 0.0)  [pc 221, 0x1A80]
eventOwner:_runCharaScheduler(354086912.0)  [pc 224, 0x1A8C]
quest:_wait(2.0)  [pc 227, 0x1A98]
eventOwner:say(quest, 88.0, 0.0)  [pc 232, 0x1AAC]
eventOwner:finishCliantTalkTurn()  [pc 234, 0x1AB4]
return 
```

### Path 3

```text
require (arg4 == 3.0) is false  [pc 7, 0x1728]
require (arg4 == 1.0) is false  [pc 39, 0x17A8]
require (arg4 == 2.0) is true  [pc 51, 0x17D8]
require (arg4 == 3.0) is false  [pc 114, 0x18D4]
require (arg4 == 3.0) is false  [pc 159, 0x1988]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1718]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x1724]
eventOwner:say(quest, 109.0, 0.0)  [pc 19, 0x1758]
eventOwner:say(quest, 66.0, 0.0)  [pc 24, 0x176C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 27, 0x1778]
eventOwner:say(quest, 67.0, 0.0)  [pc 32, 0x178C]
eventOwner:say(quest, 68.0, 0.0)  [pc 37, 0x17A0]
eventOwner:_runCharaScheduler(354041856.0)  [pc 55, 0x17E8]
eventOwner:say(quest, 69.0, 0.0)  [pc 60, 0x17FC]
eventOwner:say(quest, 72.0, 0.0)  [pc 100, 0x189C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 103, 0x18A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 108, 0x18BC]
eventOwner:say(quest, 74.0, 0.0)  [pc 113, 0x18D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 127, 0x1908]
eventOwner:say(quest, 75.0, 0.0)  [pc 132, 0x191C]
eventOwner:say(quest, 77.0, 0.0)  [pc 137, 0x1930]
eventOwner:say(quest, 78.0, 0.0)  [pc 142, 0x1944]
eventOwner:_runCharaScheduler(354082816.0)  [pc 145, 0x1950]
eventOwner:say(quest, 97.0, 0.0)  [pc 150, 0x1964]
quest:_wait(1.0)  [pc 153, 0x1970]
eventOwner:say(quest, 79.0, 0.0)  [pc 158, 0x1984]
eventOwner:_runCharaScheduler(353959936.0)  [pc 180, 0x19DC]
quest:_wait(1.0)  [pc 183, 0x19E8]
eventOwner:say(quest, 80.0, 0.0)  [pc 188, 0x19FC]
eventOwner:say(quest, 81.0, 0.0)  [pc 193, 0x1A10]
eventOwner:say(quest, 84.0, 0.0)  [pc 198, 0x1A24]
eventOwner:say(quest, 85.0, 0.0)  [pc 203, 0x1A38]
eventOwner:_runCharaScheduler(353972224.0)  [pc 206, 0x1A44]
eventOwner:say(quest, 86.0, 0.0)  [pc 211, 0x1A58]
eventOwner:say(quest, 106.0, 0.0)  [pc 216, 0x1A6C]
eventOwner:say(quest, 87.0, 0.0)  [pc 221, 0x1A80]
eventOwner:_runCharaScheduler(354086912.0)  [pc 224, 0x1A8C]
quest:_wait(2.0)  [pc 227, 0x1A98]
eventOwner:say(quest, 88.0, 0.0)  [pc 232, 0x1AAC]
eventOwner:finishCliantTalkTurn()  [pc 234, 0x1AB4]
return 
```

### Path 4

```text
require (arg4 == 3.0) is false  [pc 7, 0x1728]
require (arg4 == 1.0) is false  [pc 39, 0x17A8]
require (arg4 == 2.0) is false  [pc 51, 0x17D8]
require (arg4 == 3.0) is false  [pc 63, 0x1808]
require (arg4 == 4.0) is true  [pc 75, 0x1838]
require (arg4 == 3.0) is false  [pc 114, 0x18D4]
require (arg4 == 3.0) is false  [pc 159, 0x1988]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1718]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x1724]
eventOwner:say(quest, 109.0, 0.0)  [pc 19, 0x1758]
eventOwner:say(quest, 66.0, 0.0)  [pc 24, 0x176C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 27, 0x1778]
eventOwner:say(quest, 67.0, 0.0)  [pc 32, 0x178C]
eventOwner:say(quest, 68.0, 0.0)  [pc 37, 0x17A0]
eventOwner:_runCharaScheduler(354082816.0)  [pc 79, 0x1848]
eventOwner:say(quest, 70.0, 0.0)  [pc 84, 0x185C]
eventOwner:say(quest, 72.0, 0.0)  [pc 100, 0x189C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 103, 0x18A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 108, 0x18BC]
eventOwner:say(quest, 74.0, 0.0)  [pc 113, 0x18D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 127, 0x1908]
eventOwner:say(quest, 75.0, 0.0)  [pc 132, 0x191C]
eventOwner:say(quest, 77.0, 0.0)  [pc 137, 0x1930]
eventOwner:say(quest, 78.0, 0.0)  [pc 142, 0x1944]
eventOwner:_runCharaScheduler(354082816.0)  [pc 145, 0x1950]
eventOwner:say(quest, 97.0, 0.0)  [pc 150, 0x1964]
quest:_wait(1.0)  [pc 153, 0x1970]
eventOwner:say(quest, 79.0, 0.0)  [pc 158, 0x1984]
eventOwner:_runCharaScheduler(353959936.0)  [pc 180, 0x19DC]
quest:_wait(1.0)  [pc 183, 0x19E8]
eventOwner:say(quest, 80.0, 0.0)  [pc 188, 0x19FC]
eventOwner:say(quest, 81.0, 0.0)  [pc 193, 0x1A10]
eventOwner:say(quest, 84.0, 0.0)  [pc 198, 0x1A24]
eventOwner:say(quest, 85.0, 0.0)  [pc 203, 0x1A38]
eventOwner:_runCharaScheduler(353972224.0)  [pc 206, 0x1A44]
eventOwner:say(quest, 86.0, 0.0)  [pc 211, 0x1A58]
eventOwner:say(quest, 106.0, 0.0)  [pc 216, 0x1A6C]
eventOwner:say(quest, 87.0, 0.0)  [pc 221, 0x1A80]
eventOwner:_runCharaScheduler(354086912.0)  [pc 224, 0x1A8C]
quest:_wait(2.0)  [pc 227, 0x1A98]
eventOwner:say(quest, 88.0, 0.0)  [pc 232, 0x1AAC]
eventOwner:finishCliantTalkTurn()  [pc 234, 0x1AB4]
return 
```

### Path 5

```text
require (arg4 == 3.0) is false  [pc 7, 0x1728]
require (arg4 == 1.0) is false  [pc 39, 0x17A8]
require (arg4 == 2.0) is false  [pc 51, 0x17D8]
require (arg4 == 3.0) is false  [pc 63, 0x1808]
require (arg4 == 4.0) is false  [pc 75, 0x1838]
require (arg4 == 3.0) is false  [pc 114, 0x18D4]
require (arg4 == 3.0) is false  [pc 159, 0x1988]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1718]
eventOwner:_runCharaScheduler(354062336.0)  [pc 6, 0x1724]
eventOwner:say(quest, 109.0, 0.0)  [pc 19, 0x1758]
eventOwner:say(quest, 66.0, 0.0)  [pc 24, 0x176C]
eventOwner:_runCharaScheduler(353964032.0)  [pc 27, 0x1778]
eventOwner:say(quest, 67.0, 0.0)  [pc 32, 0x178C]
eventOwner:say(quest, 68.0, 0.0)  [pc 37, 0x17A0]
eventOwner:_runCharaScheduler(354086912.0)  [pc 89, 0x1870]
eventOwner:say(quest, 71.0, 0.0)  [pc 94, 0x1884]
eventOwner:say(quest, 72.0, 0.0)  [pc 100, 0x189C]
eventOwner:_runCharaScheduler(353976320.0)  [pc 103, 0x18A8]
eventOwner:say(quest, 73.0, 0.0)  [pc 108, 0x18BC]
eventOwner:say(quest, 74.0, 0.0)  [pc 113, 0x18D0]
eventOwner:_runCharaScheduler(353964032.0)  [pc 127, 0x1908]
eventOwner:say(quest, 75.0, 0.0)  [pc 132, 0x191C]
eventOwner:say(quest, 77.0, 0.0)  [pc 137, 0x1930]
eventOwner:say(quest, 78.0, 0.0)  [pc 142, 0x1944]
eventOwner:_runCharaScheduler(354082816.0)  [pc 145, 0x1950]
eventOwner:say(quest, 97.0, 0.0)  [pc 150, 0x1964]
quest:_wait(1.0)  [pc 153, 0x1970]
eventOwner:say(quest, 79.0, 0.0)  [pc 158, 0x1984]
eventOwner:_runCharaScheduler(353959936.0)  [pc 180, 0x19DC]
quest:_wait(1.0)  [pc 183, 0x19E8]
eventOwner:say(quest, 80.0, 0.0)  [pc 188, 0x19FC]
eventOwner:say(quest, 81.0, 0.0)  [pc 193, 0x1A10]
eventOwner:say(quest, 84.0, 0.0)  [pc 198, 0x1A24]
eventOwner:say(quest, 85.0, 0.0)  [pc 203, 0x1A38]
eventOwner:_runCharaScheduler(353972224.0)  [pc 206, 0x1A44]
eventOwner:say(quest, 86.0, 0.0)  [pc 211, 0x1A58]
eventOwner:say(quest, 106.0, 0.0)  [pc 216, 0x1A6C]
eventOwner:say(quest, 87.0, 0.0)  [pc 221, 0x1A80]
eventOwner:_runCharaScheduler(354086912.0)  [pc 224, 0x1A8C]
quest:_wait(2.0)  [pc 227, 0x1A98]
eventOwner:say(quest, 88.0, 0.0)  [pc 232, 0x1AAC]
eventOwner:finishCliantTalkTurn()  [pc 234, 0x1AB4]
return 
```

## processEvent_elevator_nq1 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1CBC]
quest:startNQCutScene('elv0l01a', 1.0, 0.0)  [pc 7, 0x1CD0]
quest:startFadeInCutSceneAfterWarp(player)  [pc 10, 0x1CDC]
return 
```

## processEvent_elevator_nq2 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0x1D90]
quest:startNQCutScene('elv0l02a', 1.0, 0.0)  [pc 7, 0x1DA4]
quest:startFadeInCutSceneAfterWarp(player)  [pc 10, 0x1DB0]
return 
```

