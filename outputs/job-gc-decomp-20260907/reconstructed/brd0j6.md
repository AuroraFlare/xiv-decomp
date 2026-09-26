# 111306 brd0j6: reconstructed client path templates

## processEventJEHANTELHint — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x29F]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x2AB]
quest:_wait(1.5)  [pc 9, 0x2B7]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x2C3]
eventOwner:say(quest, 2.0, 0.0)  [pc 17, 0x2D7]
eventOwner:say(quest, 32.0, 0.0)  [pc 22, 0x2EB]
worldMaster:say(quest, 3.0, 0.0)  [pc 28, 0x303]
eventOwner:finishCliantTalkTurn()  [pc 30, 0x30B]
return 
```

## processEventJEHANTELStart — 3 parameters
### Path 1

```text
require (call165.1.return1 == 1.0) is true  [pc 166, 0x682]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F6]
eventOwner:say(quest, 4.0, 0.0)  [pc 8, 0x40A]
eventOwner:say(quest, 35.0, 0.0)  [pc 13, 0x41E]
eventOwner:_runCharaScheduler(69521408.0)  [pc 16, 0x42A]
quest:_wait(1.5)  [pc 19, 0x436]
player:_runCharaScheduler(67111909.0)  [pc 22, 0x442]
eventOwner:say(quest, 5.0, 0.0)  [pc 27, 0x456]
eventOwner:say(quest, 31.0, 0.0)  [pc 32, 0x46A]
eventOwner:_runCharaScheduler(70795264.0)  [pc 35, 0x476]
eventOwner:say(quest, 6.0, 0.0)  [pc 40, 0x48A]
eventOwner:say(quest, 36.0, 0.0)  [pc 45, 0x49E]
eventOwner:say(quest, 37.0, 0.0)  [pc 50, 0x4B2]
eventOwner:_runCharaScheduler(70881280.0)  [pc 53, 0x4BE]
eventOwner:say(quest, 38.0, 0.0)  [pc 58, 0x4D2]
eventOwner:say(quest, 39.0, 0.0)  [pc 63, 0x4E6]
eventOwner:_runCharaScheduler(70803456.0)  [pc 66, 0x4F2]
eventOwner:say(quest, 40.0, 0.0)  [pc 71, 0x506]
eventOwner:say(quest, 41.0, 0.0)  [pc 76, 0x51A]
eventOwner:say(quest, 7.0, 0.0)  [pc 81, 0x52E]
eventOwner:say(quest, 42.0, 0.0)  [pc 86, 0x542]
eventOwner:_runCharaScheduler(70795264.0)  [pc 89, 0x54E]
eventOwner:say(quest, 8.0, 0.0)  [pc 94, 0x562]
eventOwner:_runCharaScheduler(69521408.0)  [pc 97, 0x56E]
quest:_wait(1.5)  [pc 100, 0x57A]
player:_runCharaScheduler(67111909.0)  [pc 103, 0x586]
eventOwner:say(quest, 9.0, 0.0)  [pc 108, 0x59A]
eventOwner:_runCharaScheduler(70815744.0)  [pc 111, 0x5A6]
eventOwner:say(quest, 43.0, 0.0)  [pc 116, 0x5BA]
eventOwner:say(quest, 44.0, 0.0)  [pc 121, 0x5CE]
eventOwner:_runCharaScheduler(69521408.0)  [pc 124, 0x5DA]
quest:_wait(1.5)  [pc 127, 0x5E6]
player:_runCharaScheduler(67111909.0)  [pc 130, 0x5F2]
eventOwner:say(quest, 10.0, 0.0)  [pc 135, 0x606]
eventOwner:say(quest, 45.0, 0.0)  [pc 140, 0x61A]
eventOwner:say(quest, 11.0, 0.0)  [pc 145, 0x62E]
eventOwner:say(quest, 46.0, 0.0)  [pc 150, 0x642]
eventOwner:_runCharaScheduler(70844416.0)  [pc 153, 0x64E]
eventOwner:say(quest, 33.0, 0.0)  [pc 158, 0x662]
eventOwner:say(quest, 34.0, 0.0)  [pc 163, 0x676]
call165.1.return1 = quest:showQuestInfomation()  [pc 165, 0x67E]
eventOwner:_runCharaScheduler(70795264.0)  [pc 170, 0x692]
eventOwner:say(quest, 13.0, 0.0)  [pc 175, 0x6A6]
eventOwner:say(quest, 14.0, 0.0)  [pc 180, 0x6BA]
eventOwner:_runCharaScheduler(69521408.0)  [pc 183, 0x6C6]
quest:_wait(1.5)  [pc 186, 0x6D2]
player:_runCharaScheduler(67111909.0)  [pc 189, 0x6DE]
eventOwner:say(quest, 15.0, 0.0)  [pc 194, 0x6F2]
quest:_wait(1.0)  [pc 197, 0x6FE]
eventOwner:_runCharaScheduler(69521408.0)  [pc 200, 0x70A]
quest:_wait(1.5)  [pc 203, 0x716]
player:_runCharaScheduler(67111909.0)  [pc 206, 0x722]
quest:_wait(1.5)  [pc 209, 0x72E]
eventOwner:finishCliantTalkTurn()  [pc 223, 0x766]
return call165.1.return1
```

### Path 2

```text
require (call165.1.return1 == 1.0) is false  [pc 166, 0x682]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x3F6]
eventOwner:say(quest, 4.0, 0.0)  [pc 8, 0x40A]
eventOwner:say(quest, 35.0, 0.0)  [pc 13, 0x41E]
eventOwner:_runCharaScheduler(69521408.0)  [pc 16, 0x42A]
quest:_wait(1.5)  [pc 19, 0x436]
player:_runCharaScheduler(67111909.0)  [pc 22, 0x442]
eventOwner:say(quest, 5.0, 0.0)  [pc 27, 0x456]
eventOwner:say(quest, 31.0, 0.0)  [pc 32, 0x46A]
eventOwner:_runCharaScheduler(70795264.0)  [pc 35, 0x476]
eventOwner:say(quest, 6.0, 0.0)  [pc 40, 0x48A]
eventOwner:say(quest, 36.0, 0.0)  [pc 45, 0x49E]
eventOwner:say(quest, 37.0, 0.0)  [pc 50, 0x4B2]
eventOwner:_runCharaScheduler(70881280.0)  [pc 53, 0x4BE]
eventOwner:say(quest, 38.0, 0.0)  [pc 58, 0x4D2]
eventOwner:say(quest, 39.0, 0.0)  [pc 63, 0x4E6]
eventOwner:_runCharaScheduler(70803456.0)  [pc 66, 0x4F2]
eventOwner:say(quest, 40.0, 0.0)  [pc 71, 0x506]
eventOwner:say(quest, 41.0, 0.0)  [pc 76, 0x51A]
eventOwner:say(quest, 7.0, 0.0)  [pc 81, 0x52E]
eventOwner:say(quest, 42.0, 0.0)  [pc 86, 0x542]
eventOwner:_runCharaScheduler(70795264.0)  [pc 89, 0x54E]
eventOwner:say(quest, 8.0, 0.0)  [pc 94, 0x562]
eventOwner:_runCharaScheduler(69521408.0)  [pc 97, 0x56E]
quest:_wait(1.5)  [pc 100, 0x57A]
player:_runCharaScheduler(67111909.0)  [pc 103, 0x586]
eventOwner:say(quest, 9.0, 0.0)  [pc 108, 0x59A]
eventOwner:_runCharaScheduler(70815744.0)  [pc 111, 0x5A6]
eventOwner:say(quest, 43.0, 0.0)  [pc 116, 0x5BA]
eventOwner:say(quest, 44.0, 0.0)  [pc 121, 0x5CE]
eventOwner:_runCharaScheduler(69521408.0)  [pc 124, 0x5DA]
quest:_wait(1.5)  [pc 127, 0x5E6]
player:_runCharaScheduler(67111909.0)  [pc 130, 0x5F2]
eventOwner:say(quest, 10.0, 0.0)  [pc 135, 0x606]
eventOwner:say(quest, 45.0, 0.0)  [pc 140, 0x61A]
eventOwner:say(quest, 11.0, 0.0)  [pc 145, 0x62E]
eventOwner:say(quest, 46.0, 0.0)  [pc 150, 0x642]
eventOwner:_runCharaScheduler(70844416.0)  [pc 153, 0x64E]
eventOwner:say(quest, 33.0, 0.0)  [pc 158, 0x662]
eventOwner:say(quest, 34.0, 0.0)  [pc 163, 0x676]
call165.1.return1 = quest:showQuestInfomation()  [pc 165, 0x67E]
eventOwner:_runCharaScheduler(70881280.0)  [pc 213, 0x73E]
quest:_wait(1.0)  [pc 216, 0x74A]
eventOwner:say(quest, 12.0, 0.0)  [pc 221, 0x75E]
eventOwner:finishCliantTalkTurn()  [pc 223, 0x766]
return call165.1.return1
```

## processEventJEHANTELS_000_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x974]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x980]
quest:_wait(1.5)  [pc 9, 0x98C]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x998]
eventOwner:say(quest, 16.0, 0.0)  [pc 17, 0x9AC]
eventOwner:finishCliantTalkTurn()  [pc 19, 0x9B4]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
quest:startFadeOutCutSceneDefault(player)  [pc 2, 0xA81]
quest:startNQCutScene('brd0j610', 1.0)  [pc 6, 0xA91]
quest:startFadeInCutSceneDefault(player)  [pc 9, 0xA9D]
return 
```

## processEventJEHANTELS_010_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB46]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0xB52]
quest:_wait(1.5)  [pc 9, 0xB5E]
player:_runCharaScheduler(67111909.0)  [pc 12, 0xB6A]
eventOwner:say(quest, 30.0, 0.0)  [pc 17, 0xB7E]
eventOwner:finishCliantTalkTurn()  [pc 19, 0xB86]
return 
```

## processEventClear — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 47.0)  [pc 4, 0xC5B]
quest:_wait(8.0)  [pc 7, 0xC67]
quest:showGetJobAbilityWidget(player, 27227.0, 1.0)  [pc 12, 0xC7B]
quest:_wait(6.0)  [pc 15, 0xC87]
quest:showGetJobItemWidget(player, arg4)  [pc 19, 0xC97]
quest:_wait(6.0)  [pc 22, 0xCA3]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111306.0, 18.0)  [pc 6, 0xD93]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111306.0, 18.0)  [pc 6, 0xE10]
return 
```

