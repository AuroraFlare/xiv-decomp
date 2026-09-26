# 111610 com5g0: reconstructed client path templates

## processEventFULKEStart — 5 parameters
### Path 1

```text
require (call60.1.return1 == 1.0) is true  [pc 61, 0x428]
eventOwner:startCliantTalkTurn(0.0, player)  [pc 4, 0x344]
call8.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 8, 0x354]
quest:_wait(1.0)  [pc 11, 0x360]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x374]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x388]
eventOwner:_runCharaScheduler(353959936.0)  [pc 24, 0x394]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x3A8]
eventOwner:say(quest, 5.0, 0.0)  [pc 34, 0x3BC]
eventOwner:_runCharaScheduler(353964032.0)  [pc 37, 0x3C8]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x3DC]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3F0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 50, 0x3FC]
eventOwner:say(quest, 8.0, 0.0, 0.0, 0.0, arg5)  [pc 58, 0x41C]
call60.1.return1 = quest:showQuestInfomation()  [pc 60, 0x424]
eventOwner:_runCharaScheduler(353959936.0)  [pc 65, 0x438]
eventOwner:say(quest, 10.0, 0.0, 0.0, 0.0, arg5, arg4)  [pc 74, 0x45C]
eventOwner:say(quest, 11.0, 0.0)  [pc 79, 0x470]
eventOwner:finishCliantTalkTurn()  [pc 90, 0x49C]
return call60.1.return1
```

### Path 2

```text
require (call60.1.return1 == 1.0) is false  [pc 61, 0x428]
eventOwner:startCliantTalkTurn(0.0, player)  [pc 4, 0x344]
call8.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 8, 0x354]
quest:_wait(1.0)  [pc 11, 0x360]
eventOwner:say(quest, 2.0, 0.0)  [pc 16, 0x374]
eventOwner:say(quest, 3.0, 0.0)  [pc 21, 0x388]
eventOwner:_runCharaScheduler(353959936.0)  [pc 24, 0x394]
eventOwner:say(quest, 4.0, 0.0)  [pc 29, 0x3A8]
eventOwner:say(quest, 5.0, 0.0)  [pc 34, 0x3BC]
eventOwner:_runCharaScheduler(353964032.0)  [pc 37, 0x3C8]
eventOwner:say(quest, 6.0, 0.0)  [pc 42, 0x3DC]
eventOwner:say(quest, 7.0, 0.0)  [pc 47, 0x3F0]
eventOwner:_runCharaScheduler(353968128.0)  [pc 50, 0x3FC]
eventOwner:say(quest, 8.0, 0.0, 0.0, 0.0, arg5)  [pc 58, 0x41C]
call60.1.return1 = quest:showQuestInfomation()  [pc 60, 0x424]
eventOwner:_runCharaScheduler(354041856.0)  [pc 83, 0x480]
eventOwner:say(quest, 9.0, 0.0)  [pc 88, 0x494]
eventOwner:finishCliantTalkTurn()  [pc 90, 0x49C]
return call60.1.return1
```

## followEvent_000 — 5 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 4, 0x5FF]
eventOwner:_runCharaScheduler(353964032.0)  [pc 7, 0x60B]
eventOwner:say(quest, 12.0, 0.0, 0.0, 0.0, arg5, arg4)  [pc 16, 0x62F]
eventOwner:say(quest, 13.0, 0.0)  [pc 21, 0x643]
worldMaster:say(quest, 71.0, 0.0, 0.0, arg5, arg4)  [pc 30, 0x667]
eventOwner:finishCliantTalkTurn()  [pc 32, 0x66F]
return 
```

## processEvent_010 — 4 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 4, 0x741]
eventOwner:say(quest, 14.0, 0.0)  [pc 9, 0x755]
eventOwner:say(quest, 16.0, 0.0)  [pc 14, 0x769]
eventOwner:say(quest, 17.0, 0.0)  [pc 19, 0x77D]
eventOwner:say(quest, 18.0, 0.0)  [pc 24, 0x791]
eventOwner:say(quest, 74.0, 0.0)  [pc 29, 0x7A5]
eventOwner:say(quest, 19.0, 0.0)  [pc 34, 0x7B9]
worldMaster:say(quest, 20.0, 1.0, 0.0)  [pc 41, 0x7D5]
eventOwner:say(quest, 21.0, 0.0)  [pc 46, 0x7E9]
worldMaster:say(quest, 22.0, 0.0, arg4)  [pc 53, 0x805]
eventOwner:say(quest, 23.0, 0.0)  [pc 58, 0x819]
eventOwner:say(quest, 24.0, 0.0)  [pc 63, 0x82D]
eventOwner:say(quest, 25.0, 0.0)  [pc 68, 0x841]
eventOwner:say(quest, 26.0, 0.0)  [pc 73, 0x855]
eventOwner:say(quest, 27.0, 0.0)  [pc 78, 0x869]
eventOwner:finishCliantTalkTurn()  [pc 80, 0x871]
return 
```

## processEvent_010_1 — 3 parameters
### Path 1

```text
require (call13.1.return1 == 1.0) is true  [pc 14, 0x9BA]
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x98E]
eventOwner:say(quest, 73.0, 0.0)  [pc 8, 0x9A2]
call13.1.return1 = eventOwner:ask(quest, 28.0, 2.0)  [pc 13, 0x9B6]
return call13.1.return1
```

### Path 2

```text
require (call13.1.return1 == 1.0) is false  [pc 14, 0x9BA]
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x98E]
eventOwner:say(quest, 73.0, 0.0)  [pc 8, 0x9A2]
call13.1.return1 = eventOwner:ask(quest, 28.0, 2.0)  [pc 13, 0x9B6]
eventOwner:say(quest, 31.0, 0.0)  [pc 21, 0x9D6]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x9DE]
return call13.1.return1
```

## processEvent_020 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xA99]
quest:sayFreeDisplayName(4000257.0, quest, 33.0)  [pc 8, 0xAAD]
eventOwner:_runCharaScheduler(354058240.0)  [pc 11, 0xAB9]
eventOwner:say(quest, 34.0, 0.0)  [pc 16, 0xACD]
eventOwner:say(quest, 35.0, 0.0)  [pc 21, 0xAE1]
eventOwner:_runCharaScheduler(70815744.0)  [pc 24, 0xAED]
eventOwner:say(quest, 36.0, 0.0)  [pc 29, 0xB01]
eventOwner:_runCharaScheduler(353959936.0)  [pc 32, 0xB0D]
eventOwner:say(quest, 37.0, 0.0)  [pc 37, 0xB21]
eventOwner:say(quest, 38.0, 0.0)  [pc 42, 0xB35]
eventOwner:_runCharaScheduler(70795264.0)  [pc 45, 0xB41]
eventOwner:say(quest, 39.0, 0.0)  [pc 50, 0xB55]
eventOwner:_runCharaScheduler(354058240.0)  [pc 53, 0xB61]
quest:sayFreeDisplayName(4000257.0, quest, 40.0)  [pc 58, 0xB75]
eventOwner:say(quest, 41.0, 0.0)  [pc 63, 0xB89]
eventOwner:_runCharaScheduler(70815744.0)  [pc 66, 0xB95]
eventOwner:say(quest, 42.0, 0.0)  [pc 71, 0xBA9]
eventOwner:_runCharaScheduler(354107392.0)  [pc 74, 0xBB5]
player:_runCharaScheduler(354111488.0)  [pc 77, 0xBC1]
eventOwner:say(quest, 43.0, 0.0)  [pc 82, 0xBD5]
eventOwner:say(quest, 44.0, 0.0)  [pc 87, 0xBE9]
eventOwner:_runCharaScheduler(353959936.0)  [pc 90, 0xBF5]
eventOwner:say(quest, 45.0, 0.0)  [pc 95, 0xC09]
eventOwner:finishCliantTalkTurn()  [pc 97, 0xC11]
return 
```

## followEvent_020 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(7.0, player)  [pc 3, 0xD7F]
eventOwner:say(quest, 46.0, 0.0)  [pc 8, 0xD93]
eventOwner:_runCharaScheduler(354058240.0)  [pc 11, 0xD9F]
eventOwner:say(quest, 47.0, 0.0)  [pc 16, 0xDB3]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xDBB]
return 
```

## processEvent_030 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE78]
eventOwner:say(quest, 48.0, 0.0)  [pc 8, 0xE8C]
eventOwner:say(quest, 49.0, 0.0)  [pc 13, 0xEA0]
eventOwner:say(quest, 51.0, 0.0)  [pc 18, 0xEB4]
eventOwner:say(quest, 52.0, 0.0)  [pc 23, 0xEC8]
eventOwner:finishCliantTalkTurn()  [pc 25, 0xED0]
return 
```

## processEvent_030_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF7E]
eventOwner:say(quest, 50.0, 0.0)  [pc 8, 0xF92]
eventOwner:say(quest, 51.0, 0.0)  [pc 13, 0xFA6]
eventOwner:say(quest, 52.0, 0.0)  [pc 18, 0xFBA]
eventOwner:finishCliantTalkTurn()  [pc 20, 0xFC2]
return 
```

## followEvent_030 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1067]
eventOwner:say(quest, 53.0, 0.0)  [pc 8, 0x107B]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x1083]
return 
```

## followEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x1116]
eventOwner:say(quest, 54.0, 0.0)  [pc 8, 0x112A]
eventOwner:say(quest, 55.0, 0.0)  [pc 13, 0x113E]
eventOwner:say(quest, 56.0, 0.0)  [pc 18, 0x1152]
eventOwner:finishCliantTalkTurn()  [pc 20, 0x115A]
return 
```

## processEvent_050 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x11FF]
eventOwner:say(quest, 57.0, 0.0)  [pc 8, 0x1213]
eventOwner:say(quest, 58.0, 0.0)  [pc 13, 0x1227]
eventOwner:say(quest, 59.0, 0.0)  [pc 18, 0x123B]
eventOwner:say(quest, 60.0, 0.0)  [pc 23, 0x124F]
player:_runCharaScheduler(354107392.0)  [pc 26, 0x125B]
eventOwner:_runCharaScheduler(354111488.0)  [pc 29, 0x1267]
eventOwner:say(quest, 61.0, 0.0)  [pc 34, 0x127B]
eventOwner:finishCliantTalkTurn()  [pc 36, 0x1283]
return 
```

## followEvent_050 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x135B]
eventOwner:say(quest, 76.0, 0.0)  [pc 8, 0x136F]
eventOwner:finishCliantTalkTurn()  [pc 10, 0x1377]
return 
```

## processEvent_060 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x1401]
call7.1.return1 = eventOwner:doSalute(2.0, 33.0)  [pc 7, 0x1411]
quest:_wait(1.0)  [pc 10, 0x141D]
eventOwner:say(quest, 62.0, 0.0)  [pc 15, 0x1431]
eventOwner:say(quest, 63.0, 0.0)  [pc 20, 0x1445]
eventOwner:_runCharaScheduler(353968128.0)  [pc 23, 0x1451]
eventOwner:say(quest, 64.0, 0.0)  [pc 28, 0x1465]
eventOwner:say(quest, 65.0, 0.0)  [pc 33, 0x1479]
eventOwner:_runCharaScheduler(353964032.0)  [pc 36, 0x1485]
eventOwner:say(quest, 66.0, 0.0)  [pc 41, 0x1499]
eventOwner:say(quest, 67.0, 0.0)  [pc 46, 0x14AD]
eventOwner:_runCharaScheduler(354086912.0)  [pc 49, 0x14B9]
eventOwner:say(quest, 68.0, 0.0)  [pc 54, 0x14CD]
eventOwner:say(quest, 69.0, 0.0)  [pc 59, 0x14E1]
eventOwner:_runCharaScheduler(354107392.0)  [pc 62, 0x14ED]
eventOwner:say(quest, 70.0, 0.0)  [pc 67, 0x1501]
eventOwner:finishCliantTalkTurn()  [pc 69, 0x1509]
return 
```

## menberCountUnderRange — 5 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(0.0, player)  [pc 3, 0x164B]
eventOwner:say(quest, 15.0, 0.0, 0.0, 0.0, arg4, arg5)  [pc 12, 0x166F]
worldMaster:say(quest, 72.0, 0.0, 0.0, arg4, arg5)  [pc 21, 0x1693]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x169B]
return 
```

