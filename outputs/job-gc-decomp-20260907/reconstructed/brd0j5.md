# 111305 brd0j5: reconstructed client path templates

## processEvent_JEHANTEL_Start — 3 parameters
### Path 1

```text
require (call138.1.return1 == 1.0) is true  [pc 139, 0x445]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x225]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x231]
quest:_wait(1.5)  [pc 9, 0x23D]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x249]
eventOwner:say(quest, 2.0, 0.0)  [pc 17, 0x25D]
eventOwner:say(quest, 26.0, 0.0)  [pc 22, 0x271]
quest:startFadeOut(player, 1.0)  [pc 26, 0x281]
quest:_wait(2.5)  [pc 29, 0x28D]
quest:startFadeIn(player, 1.0)  [pc 33, 0x29D]
eventOwner:_runCharaScheduler(70799360.0)  [pc 36, 0x2A9]
quest:_wait(1.0)  [pc 39, 0x2B5]
eventOwner:say(quest, 17.0, 0.0)  [pc 44, 0x2C9]
eventOwner:say(quest, 27.0, 0.0)  [pc 49, 0x2DD]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x2F1]
eventOwner:_runCharaScheduler(70795264.0)  [pc 57, 0x2FD]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x311]
eventOwner:say(quest, 25.0, 0.0)  [pc 67, 0x325]
eventOwner:_runCharaScheduler(70807552.0)  [pc 70, 0x331]
eventOwner:say(quest, 28.0, 0.0)  [pc 75, 0x345]
eventOwner:say(quest, 29.0, 0.0)  [pc 80, 0x359]
eventOwner:finishCliantTalkTurn()  [pc 82, 0x361]
eventOwner:say(quest, 5.0, 0.0)  [pc 87, 0x375]
quest:_wait(1.0)  [pc 90, 0x381]
eventOwner:_runCharaScheduler(70795264.0)  [pc 93, 0x38D]
quest:_wait(1.0)  [pc 96, 0x399]
eventOwner:say(quest, 30.0, 0.0)  [pc 101, 0x3AD]
eventOwner:say(quest, 6.0, 0.0)  [pc 106, 0x3C1]
eventOwner:say(quest, 7.0, 0.0)  [pc 111, 0x3D5]
eventOwner:_runCharaScheduler(70815744.0)  [pc 114, 0x3E1]
quest:_wait(1.0)  [pc 117, 0x3ED]
eventOwner:say(quest, 8.0, 0.0)  [pc 122, 0x401]
eventOwner:say(quest, 9.0, 0.0)  [pc 127, 0x415]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 131, 0x425]
eventOwner:say(quest, 18.0, 0.0)  [pc 136, 0x439]
call138.1.return1 = quest:showQuestInfomation()  [pc 138, 0x441]
eventOwner:_runCharaScheduler(70799360.0)  [pc 143, 0x455]
eventOwner:say(quest, 11.0, 0.0)  [pc 148, 0x469]
eventOwner:say(quest, 12.0, 0.0)  [pc 153, 0x47D]
eventOwner:say(quest, 19.0, 0.0)  [pc 158, 0x491]
eventOwner:_runCharaScheduler(69521408.0)  [pc 161, 0x49D]
quest:_wait(1.5)  [pc 164, 0x4A9]
player:_runCharaScheduler(67111909.0)  [pc 167, 0x4B5]
eventOwner:say(quest, 15.0, 0.0)  [pc 172, 0x4C9]
quest:_wait(1.5)  [pc 175, 0x4D5]
eventOwner:_runCharaScheduler(69521408.0)  [pc 178, 0x4E1]
quest:_wait(1.5)  [pc 181, 0x4ED]
player:_runCharaScheduler(67111909.0)  [pc 184, 0x4F9]
quest:_wait(1.5)  [pc 187, 0x505]
eventOwner:finishCliantTalkTurn()  [pc 198, 0x531]
return call138.1.return1
```

### Path 2

```text
require (call138.1.return1 == 1.0) is false  [pc 139, 0x445]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x225]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x231]
quest:_wait(1.5)  [pc 9, 0x23D]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x249]
eventOwner:say(quest, 2.0, 0.0)  [pc 17, 0x25D]
eventOwner:say(quest, 26.0, 0.0)  [pc 22, 0x271]
quest:startFadeOut(player, 1.0)  [pc 26, 0x281]
quest:_wait(2.5)  [pc 29, 0x28D]
quest:startFadeIn(player, 1.0)  [pc 33, 0x29D]
eventOwner:_runCharaScheduler(70799360.0)  [pc 36, 0x2A9]
quest:_wait(1.0)  [pc 39, 0x2B5]
eventOwner:say(quest, 17.0, 0.0)  [pc 44, 0x2C9]
eventOwner:say(quest, 27.0, 0.0)  [pc 49, 0x2DD]
eventOwner:say(quest, 3.0, 0.0)  [pc 54, 0x2F1]
eventOwner:_runCharaScheduler(70795264.0)  [pc 57, 0x2FD]
eventOwner:say(quest, 4.0, 0.0)  [pc 62, 0x311]
eventOwner:say(quest, 25.0, 0.0)  [pc 67, 0x325]
eventOwner:_runCharaScheduler(70807552.0)  [pc 70, 0x331]
eventOwner:say(quest, 28.0, 0.0)  [pc 75, 0x345]
eventOwner:say(quest, 29.0, 0.0)  [pc 80, 0x359]
eventOwner:finishCliantTalkTurn()  [pc 82, 0x361]
eventOwner:say(quest, 5.0, 0.0)  [pc 87, 0x375]
quest:_wait(1.0)  [pc 90, 0x381]
eventOwner:_runCharaScheduler(70795264.0)  [pc 93, 0x38D]
quest:_wait(1.0)  [pc 96, 0x399]
eventOwner:say(quest, 30.0, 0.0)  [pc 101, 0x3AD]
eventOwner:say(quest, 6.0, 0.0)  [pc 106, 0x3C1]
eventOwner:say(quest, 7.0, 0.0)  [pc 111, 0x3D5]
eventOwner:_runCharaScheduler(70815744.0)  [pc 114, 0x3E1]
quest:_wait(1.0)  [pc 117, 0x3ED]
eventOwner:say(quest, 8.0, 0.0)  [pc 122, 0x401]
eventOwner:say(quest, 9.0, 0.0)  [pc 127, 0x415]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 131, 0x425]
eventOwner:say(quest, 18.0, 0.0)  [pc 136, 0x439]
call138.1.return1 = quest:showQuestInfomation()  [pc 138, 0x441]
eventOwner:_runCharaScheduler(70832128.0)  [pc 191, 0x515]
eventOwner:say(quest, 10.0, 0.0)  [pc 196, 0x529]
eventOwner:finishCliantTalkTurn()  [pc 198, 0x531]
return call138.1.return1
```

## processEvent_JEHANTEL_Follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x72C]
eventOwner:_runCharaScheduler(69521408.0)  [pc 6, 0x738]
quest:_wait(1.5)  [pc 9, 0x744]
player:_runCharaScheduler(67111909.0)  [pc 12, 0x750]
eventOwner:say(quest, 16.0, 0.0)  [pc 17, 0x764]
eventOwner:say(quest, 21.0, 0.0)  [pc 22, 0x778]
eventOwner:say(quest, 22.0, 0.0)  [pc 27, 0x78C]
eventOwner:say(quest, 23.0, 0.0)  [pc 32, 0x7A0]
eventOwner:finishCliantTalkTurn()  [pc 34, 0x7A8]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(67108910.0)  [pc 2, 0x890]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 7, 0x8A4]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111305.0, 18.0)  [pc 6, 0x930]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111305.0, 18.0)  [pc 6, 0x9AD]
return 
```

