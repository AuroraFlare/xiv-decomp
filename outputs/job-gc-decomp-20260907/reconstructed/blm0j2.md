# 111262 blm0j2: reconstructed client path templates

## processEvent_hint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x30D]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x319]
eventOwner:say(quest, 18.0, 0.0)  [pc 11, 0x32D]
worldMaster:say(quest, 19.0, 0.0)  [pc 17, 0x345]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x34D]
return 
```

## processEventLALAIStart — 3 parameters
### Path 1

```text
require (call74.1.return1 == 1.0) is true  [pc 75, 0x53B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x41B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x427]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x43B]
eventOwner:say(quest, 20.0, 0.0)  [pc 16, 0x44F]
eventOwner:say(quest, 21.0, 0.0)  [pc 21, 0x463]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x46B]
eventOwner:_runCharaScheduler(353964032.0)  [pc 26, 0x477]
eventOwner:say(quest, 3.0, 0.0)  [pc 31, 0x48B]
quest:_wait(2.0)  [pc 34, 0x497]
eventOwner:_runCharaScheduler(353976320.0)  [pc 37, 0x4A3]
eventOwner:say(quest, 4.0, 0.0)  [pc 42, 0x4B7]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4CB]
eventOwner:_runCharaScheduler(353959936.0)  [pc 50, 0x4D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 55, 0x4EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x4FF]
quest:_wait(1.5)  [pc 63, 0x50B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 67, 0x51B]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x52F]
call74.1.return1 = quest:showQuestInfomation()  [pc 74, 0x537]
eventOwner:_runCharaScheduler(354107392.0)  [pc 79, 0x54B]
eventOwner:say(quest, 10.0, 0.0)  [pc 84, 0x55F]
eventOwner:say(quest, 11.0, 0.0)  [pc 89, 0x573]
eventOwner:finishCliantTalkTurn()  [pc 100, 0x59F]
return call74.1.return1
```

### Path 2

```text
require (call74.1.return1 == 1.0) is false  [pc 75, 0x53B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x41B]
eventOwner:_runCharaScheduler(353959936.0)  [pc 6, 0x427]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x43B]
eventOwner:say(quest, 20.0, 0.0)  [pc 16, 0x44F]
eventOwner:say(quest, 21.0, 0.0)  [pc 21, 0x463]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x46B]
eventOwner:_runCharaScheduler(353964032.0)  [pc 26, 0x477]
eventOwner:say(quest, 3.0, 0.0)  [pc 31, 0x48B]
quest:_wait(2.0)  [pc 34, 0x497]
eventOwner:_runCharaScheduler(353976320.0)  [pc 37, 0x4A3]
eventOwner:say(quest, 4.0, 0.0)  [pc 42, 0x4B7]
eventOwner:say(quest, 5.0, 0.0)  [pc 47, 0x4CB]
eventOwner:_runCharaScheduler(353959936.0)  [pc 50, 0x4D7]
eventOwner:say(quest, 6.0, 0.0)  [pc 55, 0x4EB]
eventOwner:say(quest, 7.0, 0.0)  [pc 60, 0x4FF]
quest:_wait(1.5)  [pc 63, 0x50B]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 67, 0x51B]
eventOwner:say(quest, 8.0, 0.0)  [pc 72, 0x52F]
call74.1.return1 = quest:showQuestInfomation()  [pc 74, 0x537]
eventOwner:_runCharaScheduler(354078720.0)  [pc 93, 0x583]
eventOwner:say(quest, 9.0, 0.0)  [pc 98, 0x597]
eventOwner:finishCliantTalkTurn()  [pc 100, 0x59F]
return call74.1.return1
```

## processEvent000_LALAI — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x70B]
eventOwner:_runCharaScheduler(353964032.0)  [pc 6, 0x717]
eventOwner:say(quest, 12.0, 0.0)  [pc 11, 0x72B]
eventOwner:say(quest, 13.0, 0.0)  [pc 16, 0x73F]
eventOwner:_runCharaScheduler(353959936.0)  [pc 19, 0x74B]
eventOwner:say(quest, 14.0, 0.0)  [pc 24, 0x75F]
eventOwner:finishCliantTalkTurn()  [pc 26, 0x767]
return 
```

## processEvent000_KAZAGGCHAH — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x836]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x842]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0x856]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x85E]
return 
```

## processEvent000_DOZOLMELOC — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x912]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x91E]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0x932]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x93A]
return 
```

## processEvent000_DAZA — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x9EE]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x9FA]
eventOwner:say(quest, 17.0, 0.0)  [pc 11, 0xA0E]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA16]
return 
```

## onJobQuestCompleteFirst — 2 parameters
### Path 1

```text
desktopWidget:openPublicInformDialogWidget(worldMaster, 51121.0, 3105515.0, 1.0, 2000207.0)  [pc 7, 0xADA]
return 
```

## onJobQuestCompleteSecond — 2 parameters
### Path 1

```text
quest:showGetJobAbilityWidget(player, 27319.0, 2.0)  [pc 4, 0xB84]
return 
```

## onJobQuestCompleteThird — 2 parameters
### Path 1

```text
quest:showEventBeforeNpsLS(player, 1400197.0, 78.0)  [pc 4, 0xBF3]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111262.0, 26.0)  [pc 6, 0xC67]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111262.0, 26.0)  [pc 6, 0xCE4]
return 
```

