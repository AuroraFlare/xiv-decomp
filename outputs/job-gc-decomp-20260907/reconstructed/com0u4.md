# 111804 com0u4: reconstructed client path templates

## processEventAUBREYStart — 3 parameters
### Path 1

```text
require (call40.1.return1 == 1.0) is true  [pc 41, 0x377]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x2EF]
quest:_wait(1.0)  [pc 10, 0x2FB]
eventOwner:say(quest, 23.0, 0.0)  [pc 15, 0x30F]
eventOwner:say(quest, 24.0, 0.0)  [pc 20, 0x323]
eventOwner:say(quest, 25.0, 0.0)  [pc 25, 0x337]
eventOwner:_runCharaScheduler(354082816.0)  [pc 28, 0x343]
eventOwner:say(quest, 26.0, 0.0)  [pc 33, 0x357]
eventOwner:say(quest, 27.0, 0.0)  [pc 38, 0x36B]
call40.1.return1 = quest:showQuestInfomation()  [pc 40, 0x373]
eventOwner:_runCharaScheduler(84058112.0)  [pc 45, 0x387]
quest:_wait(1.0)  [pc 48, 0x393]
eventOwner:say(quest, 29.0, 0.0)  [pc 53, 0x3A7]
eventOwner:finishCliantTalkTurn()  [pc 64, 0x3D3]
return call40.1.return1
```

### Path 2

```text
require (call40.1.return1 == 1.0) is false  [pc 41, 0x377]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x2DF]
call7.1.return1 = eventOwner:doSalute(3.0, 33.0)  [pc 7, 0x2EF]
quest:_wait(1.0)  [pc 10, 0x2FB]
eventOwner:say(quest, 23.0, 0.0)  [pc 15, 0x30F]
eventOwner:say(quest, 24.0, 0.0)  [pc 20, 0x323]
eventOwner:say(quest, 25.0, 0.0)  [pc 25, 0x337]
eventOwner:_runCharaScheduler(354082816.0)  [pc 28, 0x343]
eventOwner:say(quest, 26.0, 0.0)  [pc 33, 0x357]
eventOwner:say(quest, 27.0, 0.0)  [pc 38, 0x36B]
call40.1.return1 = quest:showQuestInfomation()  [pc 40, 0x373]
eventOwner:_runCharaScheduler(354172928.0)  [pc 57, 0x3B7]
eventOwner:say(quest, 28.0, 0.0)  [pc 62, 0x3CB]
eventOwner:finishCliantTalkTurn()  [pc 64, 0x3D3]
return call40.1.return1
```

## processEvent_000 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x520]
eventOwner:_runCharaScheduler(354082816.0)  [pc 6, 0x52C]
eventOwner:say(quest, 30.0, 0.0)  [pc 11, 0x540]
eventOwner:say(quest, 31.0, 0.0)  [pc 16, 0x554]
eventOwner:say(quest, 32.0, 0.0)  [pc 21, 0x568]
eventOwner:finishCliantTalkTurn()  [pc 23, 0x570]
return 
```

## processEvent_010 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x636]
eventOwner:_runCharaScheduler(70799360.0)  [pc 6, 0x642]
eventOwner:say(quest, 33.0, 0.0)  [pc 11, 0x656]
eventOwner:say(quest, 59.0, 0.0)  [pc 16, 0x66A]
eventOwner:say(quest, 34.0, 0.0)  [pc 21, 0x67E]
eventOwner:_runCharaScheduler(83894272.0)  [pc 24, 0x68A]
eventOwner:say(quest, 35.0, 0.0)  [pc 29, 0x69E]
eventOwner:say(quest, 60.0, 0.0)  [pc 34, 0x6B2]
eventOwner:say(quest, 36.0, 0.0)  [pc 39, 0x6C6]
eventOwner:say(quest, 37.0, 0.0)  [pc 44, 0x6DA]
eventOwner:say(quest, 61.0, 0.0)  [pc 49, 0x6EE]
eventOwner:_runCharaScheduler(354103296.0)  [pc 52, 0x6FA]
eventOwner:say(quest, 38.0, 0.0)  [pc 57, 0x70E]
eventOwner:finishCliantTalkTurn()  [pc 59, 0x716]
return 
```

## processEvent_010_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x824]
eventOwner:_runCharaScheduler(354103296.0)  [pc 6, 0x830]
eventOwner:say(quest, 39.0, 0.0)  [pc 11, 0x844]
eventOwner:finishCliantTalkTurn()  [pc 13, 0x84C]
return 
```

## processEvent_020 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0x900]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0x90C]
eventOwner:say(quest, 40.0, 0.0)  [pc 11, 0x920]
eventOwner:say(quest, 63.0, 0.0)  [pc 16, 0x934]
eventOwner:say(quest, 41.0, 0.0)  [pc 21, 0x948]
eventOwner:_runCharaScheduler(354103296.0)  [pc 24, 0x954]
eventOwner:say(quest, 42.0, 0.0)  [pc 29, 0x968]
eventOwner:finishCliantTalkTurn()  [pc 31, 0x970]
return 
```

## processEvent_020_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xA48]
eventOwner:_runCharaScheduler(354099200.0)  [pc 6, 0xA54]
eventOwner:say(quest, 58.0, 0.0)  [pc 11, 0xA68]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xA70]
return 
```

## processEvent_030 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xB24]
eventOwner:_runCharaScheduler(354095104.0)  [pc 6, 0xB30]
eventOwner:say(quest, 53.0, 0.0)  [pc 11, 0xB44]
eventOwner:say(quest, 64.0, 0.0)  [pc 16, 0xB58]
eventOwner:say(quest, 54.0, 0.0)  [pc 21, 0xB6C]
eventOwner:_runCharaScheduler(354066432.0)  [pc 24, 0xB78]
eventOwner:say(quest, 55.0, 0.0)  [pc 29, 0xB8C]
eventOwner:finishCliantTalkTurn()  [pc 31, 0xB94]
return 
```

## processEvent_030_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xC6C]
eventOwner:_runCharaScheduler(354041856.0)  [pc 6, 0xC78]
eventOwner:say(quest, 56.0, 0.0)  [pc 11, 0xC8C]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xC94]
return 
```

## processEvent_040 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xD48]
eventOwner:_runCharaScheduler(354226176.0)  [pc 6, 0xD54]
eventOwner:say(quest, 46.0, 0.0)  [pc 11, 0xD68]
eventOwner:say(quest, 47.0, 0.0)  [pc 16, 0xD7C]
eventOwner:finishCliantTalkTurn()  [pc 18, 0xD84]
return 
```

## processEvent_040_1 — 3 parameters
### Path 1

```text
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xE41]
eventOwner:_runCharaScheduler(70877184.0)  [pc 6, 0xE4D]
eventOwner:say(quest, 57.0, 0.0)  [pc 11, 0xE61]
eventOwner:finishCliantTalkTurn()  [pc 13, 0xE69]
return 
```

## processEvent_050 — 4 parameters
### Path 1

```text
require (arg4 == 1.0) is true  [pc 20, 0xF61]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF1D]
eventOwner:_runCharaScheduler(354123776.0)  [pc 6, 0xF29]
quest:_wait(2.0)  [pc 9, 0xF35]
eventOwner:say(quest, 48.0, 0.0)  [pc 14, 0xF49]
eventOwner:say(quest, 49.0, 0.0)  [pc 19, 0xF5D]
eventOwner:_runCharaScheduler(354082816.0)  [pc 24, 0xF71]
eventOwner:say(quest, 50.0, 0.0)  [pc 29, 0xF85]
eventOwner:say(quest, 51.0, 0.0)  [pc 34, 0xF99]
eventOwner:say(quest, 62.0, 0.0)  [pc 39, 0xFAD]
eventOwner:_runCharaScheduler(84058112.0)  [pc 42, 0xFB9]
eventOwner:say(quest, 52.0, 0.0)  [pc 47, 0xFCD]
eventOwner:finishCliantTalkTurn()  [pc 49, 0xFD5]
return 
```

### Path 2

```text
require (arg4 == 1.0) is false  [pc 20, 0xF61]
eventOwner:startCliantTalkTurn(2.0, player)  [pc 3, 0xF1D]
eventOwner:_runCharaScheduler(354123776.0)  [pc 6, 0xF29]
quest:_wait(2.0)  [pc 9, 0xF35]
eventOwner:say(quest, 48.0, 0.0)  [pc 14, 0xF49]
eventOwner:say(quest, 49.0, 0.0)  [pc 19, 0xF5D]
quest:startFadeOutCutSceneDefault(player)  [pc 53, 0xFE5]
quest:startNQCutScene('com0u410', 1.0)  [pc 57, 0xFF5]
quest:startFadeInCutSceneDefault(player)  [pc 60, 0x1001]
eventOwner:finishCliantTalkTurn()  [pc 62, 0x1009]
return 
```

