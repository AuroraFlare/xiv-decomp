# 111245 whm0j5: reconstructed client path templates

## processEvent_OTOMO_A_before — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x35A]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0x366]
eventOwner:say(quest, 2.0, 0.0)  [pc 11, 0x37A]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x382]
return 
```

## processEvent_OTOMO_B_before — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x42D]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0x439]
eventOwner:say(quest, 3.0, 0.0)  [pc 11, 0x44D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x455]
return 
```

## processEvent_RAYA_offer — 3 parameters
### Path 1

```text
require (call139.1.return1 == 1.0) is true  [pc 140, 0x72D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x509]
eventOwner:_runCharaScheduler(79577088.0)  [pc 6, 0x515]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x529]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x53D]
eventOwner:say(quest, 26.0, 0.0)  [pc 21, 0x551]
eventOwner:_runCharaScheduler(364752896.0)  [pc 24, 0x55D]
eventOwner:say(quest, 27.0, 0.0)  [pc 29, 0x571]
eventOwner:say(quest, 28.0, 0.0)  [pc 34, 0x585]
eventOwner:say(quest, 29.0, 0.0)  [pc 39, 0x599]
eventOwner:_runCharaScheduler(364756992.0)  [pc 42, 0x5A5]
eventOwner:say(quest, 30.0, 0.0)  [pc 47, 0x5B9]
eventOwner:say(quest, 31.0, 0.0)  [pc 52, 0x5CD]
eventOwner:say(quest, 32.0, 0.0)  [pc 57, 0x5E1]
eventOwner:_runCharaScheduler(79577088.0)  [pc 60, 0x5ED]
eventOwner:say(quest, 33.0, 0.0)  [pc 65, 0x601]
eventOwner:say(quest, 6.0, 0.0)  [pc 70, 0x615]
eventOwner:say(quest, 18.0, 0.0)  [pc 75, 0x629]
eventOwner:_runCharaScheduler(364761088.0)  [pc 78, 0x635]
eventOwner:say(quest, 23.0, 0.0)  [pc 83, 0x649]
eventOwner:say(quest, 7.0, 0.0)  [pc 88, 0x65D]
eventOwner:say(quest, 8.0, 0.0)  [pc 93, 0x671]
eventOwner:_runCharaScheduler(79593472.0)  [pc 96, 0x67D]
eventOwner:say(quest, 9.0, 0.0)  [pc 101, 0x691]
eventOwner:say(quest, 10.0, 0.0)  [pc 106, 0x6A5]
eventOwner:say(quest, 34.0, 0.0)  [pc 111, 0x6B9]
eventOwner:_runCharaScheduler(364748800.0)  [pc 114, 0x6C5]
eventOwner:say(quest, 35.0, 0.0)  [pc 119, 0x6D9]
eventOwner:say(quest, 36.0, 0.0)  [pc 124, 0x6ED]
eventOwner:say(quest, 37.0, 0.0)  [pc 129, 0x701]
eventOwner:_runCharaScheduler(364752896.0)  [pc 132, 0x70D]
eventOwner:say(quest, 11.0, 0.0)  [pc 137, 0x721]
call139.1.return1 = quest:showQuestInfomation()  [pc 139, 0x729]
eventOwner:_runCharaScheduler(364765184.0)  [pc 144, 0x73D]
eventOwner:say(quest, 14.0, 0.0)  [pc 149, 0x751]
eventOwner:say(quest, 24.0, 0.0)  [pc 154, 0x765]
eventOwner:_runCharaScheduler(364756992.0)  [pc 157, 0x771]
eventOwner:say(quest, 38.0, 0.0)  [pc 162, 0x785]
eventOwner:say(quest, 39.0, 0.0)  [pc 167, 0x799]
eventOwner:say(quest, 40.0, 0.0)  [pc 172, 0x7AD]
eventOwner:_runCharaScheduler(79597568.0)  [pc 175, 0x7B9]
eventOwner:say(quest, 41.0, 0.0)  [pc 180, 0x7CD]
eventOwner:say(quest, 42.0, 0.0)  [pc 185, 0x7E1]
eventOwner:say(quest, 43.0, 0.0)  [pc 190, 0x7F5]
eventOwner:finishCliantTalkTurn()  [pc 201, 0x821]
return call139.1.return1
```

### Path 2

```text
require (call139.1.return1 == 1.0) is false  [pc 140, 0x72D]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x509]
eventOwner:_runCharaScheduler(79577088.0)  [pc 6, 0x515]
eventOwner:say(quest, 4.0, 0.0)  [pc 11, 0x529]
eventOwner:say(quest, 5.0, 0.0)  [pc 16, 0x53D]
eventOwner:say(quest, 26.0, 0.0)  [pc 21, 0x551]
eventOwner:_runCharaScheduler(364752896.0)  [pc 24, 0x55D]
eventOwner:say(quest, 27.0, 0.0)  [pc 29, 0x571]
eventOwner:say(quest, 28.0, 0.0)  [pc 34, 0x585]
eventOwner:say(quest, 29.0, 0.0)  [pc 39, 0x599]
eventOwner:_runCharaScheduler(364756992.0)  [pc 42, 0x5A5]
eventOwner:say(quest, 30.0, 0.0)  [pc 47, 0x5B9]
eventOwner:say(quest, 31.0, 0.0)  [pc 52, 0x5CD]
eventOwner:say(quest, 32.0, 0.0)  [pc 57, 0x5E1]
eventOwner:_runCharaScheduler(79577088.0)  [pc 60, 0x5ED]
eventOwner:say(quest, 33.0, 0.0)  [pc 65, 0x601]
eventOwner:say(quest, 6.0, 0.0)  [pc 70, 0x615]
eventOwner:say(quest, 18.0, 0.0)  [pc 75, 0x629]
eventOwner:_runCharaScheduler(364761088.0)  [pc 78, 0x635]
eventOwner:say(quest, 23.0, 0.0)  [pc 83, 0x649]
eventOwner:say(quest, 7.0, 0.0)  [pc 88, 0x65D]
eventOwner:say(quest, 8.0, 0.0)  [pc 93, 0x671]
eventOwner:_runCharaScheduler(79593472.0)  [pc 96, 0x67D]
eventOwner:say(quest, 9.0, 0.0)  [pc 101, 0x691]
eventOwner:say(quest, 10.0, 0.0)  [pc 106, 0x6A5]
eventOwner:say(quest, 34.0, 0.0)  [pc 111, 0x6B9]
eventOwner:_runCharaScheduler(364748800.0)  [pc 114, 0x6C5]
eventOwner:say(quest, 35.0, 0.0)  [pc 119, 0x6D9]
eventOwner:say(quest, 36.0, 0.0)  [pc 124, 0x6ED]
eventOwner:say(quest, 37.0, 0.0)  [pc 129, 0x701]
eventOwner:_runCharaScheduler(364752896.0)  [pc 132, 0x70D]
eventOwner:say(quest, 11.0, 0.0)  [pc 137, 0x721]
call139.1.return1 = quest:showQuestInfomation()  [pc 139, 0x729]
eventOwner:_runCharaScheduler(79589376.0)  [pc 194, 0x805]
eventOwner:say(quest, 13.0, 0.0)  [pc 199, 0x819]
eventOwner:finishCliantTalkTurn()  [pc 201, 0x821]
return call139.1.return1
```

## processEvent_OTOMO_A_follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA51]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xA5D]
eventOwner:say(quest, 15.0, 0.0)  [pc 11, 0xA71]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA79]
return 
```

## processEvent_OTOMO_B_follow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB2D]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0xB39]
eventOwner:say(quest, 16.0, 0.0)  [pc 11, 0xB4D]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xB55]
return 
```

## processEvent_RAYA_O_follow — 3 parameters
### Path 1

```text
eventOwner:_runCharaScheduler(79577088.0)  [pc 2, 0xC05]
eventOwner:say(quest, 17.0, 0.0)  [pc 7, 0xC19]
eventOwner:say(quest, 44.0, 0.0)  [pc 12, 0xC2D]
eventOwner:say(quest, 21.0, 0.0)  [pc 17, 0xC41]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 21, 0xC51]
eventOwner:say(quest, 22.0, 0.0)  [pc 26, 0xC65]
eventOwner:finishCliantTalkTurn()  [pc 28, 0xC6D]
return 
```

## processEvent_getAF_info — 4 parameters
### Path 1

```text
desktopWidget:openPublicInformLongDialogWidget(quest, 25.0)  [pc 4, 0xD40]
quest:_wait(8.0)  [pc 7, 0xD4C]
eventOwner:_runCharaScheduler(67108910.0)  [pc 10, 0xD58]
quest:showGetJobItemWidget(player, arg4, 0.0)  [pc 15, 0xD6C]
return 
```

## processEvent_OTOMO_A_cfollow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE42]
eventOwner:_runCharaScheduler(70017024.0)  [pc 6, 0xE4E]
eventOwner:say(quest, 45.0, 0.0)  [pc 11, 0xE62]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE6A]
return 
```

## processEvent_OTOMO_B_cfollow — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF1E]
eventOwner:_runCharaScheduler(70021120.0)  [pc 6, 0xF2A]
eventOwner:say(quest, 46.0, 0.0)  [pc 11, 0xF3E]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xF46]
return 
```

## processEvent_RAYA_O_clear — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xFFA]
eventOwner:say(quest, 47.0, 0.0)  [pc 8, 0x100E]
eventOwner:say(quest, 48.0, 0.0)  [pc 13, 0x1022]
eventOwner:_runCharaScheduler(79577088.0)  [pc 16, 0x102E]
eventOwner:say(quest, 49.0, 0.0)  [pc 21, 0x1042]
eventOwner:say(quest, 50.0, 0.0)  [pc 26, 0x1056]
eventOwner:say(quest, 51.0, 0.0)  [pc 31, 0x106A]
eventOwner:_runCharaScheduler(364756992.0)  [pc 34, 0x1076]
eventOwner:say(quest, 52.0, 0.0)  [pc 39, 0x108A]
worldMaster:say(quest, 53.0, 0.0)  [pc 45, 0x10A2]
eventOwner:finishCliantTalkTurn()  [pc 47, 0x10AA]
return 
```

## processEventChuui — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51131.0, 111245.0, 27.0)  [pc 6, 0x11BA]
return 
```

## processEventChuui2 — 3 parameters
### Path 1

```text
worldMaster:say(worldMaster, 51132.0, 111245.0, 27.0)  [pc 6, 0x1237]
return 
```

