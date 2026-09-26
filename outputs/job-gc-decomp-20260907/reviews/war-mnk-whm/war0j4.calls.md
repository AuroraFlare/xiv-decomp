# 111204 war0j4: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x1E2; 5 instructions)

```text
pc003 0x1EE: quest:_loadTextDataPermanently(8180, "war0j4")
return (no values)
```

## processEventCURIOUS_GORGE_Hint (3 parameters; 0x251; 21 instructions)

```text
pc003 0x25D: eventOwner:startCliantTalkTurn(2, player)
pc006 0x269: eventOwner:_runCharaScheduler(354086912)
pc011 0x27D: eventOwner:say(quest, 2, 0)
pc017 0x295: worldMaster:say(quest, 3, 0)
pc019 0x29D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: I commend your earnest, but I regret to tell you that I have naught yet to report. I ask that you bear with me a few more turns of the sun.
- `3`: The next warrior quest will be available from Curious Gorge upon reaching level 45.

## processEventCURIOUS_GORGE_Start (3 parameters; 0x356; 88 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x362: eventOwner:startCliantTalkTurn(2, player)
pc006 0x36E: eventOwner:_runCharaScheduler(354099200)
pc011 0x382: eventOwner:say(quest, 4, 0)
pc016 0x396: eventOwner:say(quest, 5, 0)
pc021 0x3AA: eventOwner:say(quest, 15, 0)
pc026 0x3BE: eventOwner:say(quest, 6, 0)
pc029 0x3CA: eventOwner:_runCharaScheduler(354082816)
pc034 0x3DE: eventOwner:say(quest, 7, 0)
pc039 0x3F2: eventOwner:say(quest, 8, 0)
pc044 0x406: eventOwner:say(quest, 9, 0)
pc049 0x41A: eventOwner:say(quest, 10, 0)
pc052 0x426: eventOwner:_runCharaScheduler(353959936)
pc057 0x43A: eventOwner:say(quest, 11, 0)
pc062 0x44E: eventOwner:say(quest, 16, 0)
pc064 0x456: quest:showQuestInfomation()
pc078 0x48E: eventOwner:_runCharaScheduler(353980416)
pc083 0x4A2: eventOwner:say(quest, 12, 0)
pc085 0x4AA: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x362: eventOwner:startCliantTalkTurn(2, player)
pc006 0x36E: eventOwner:_runCharaScheduler(354099200)
pc011 0x382: eventOwner:say(quest, 4, 0)
pc016 0x396: eventOwner:say(quest, 5, 0)
pc021 0x3AA: eventOwner:say(quest, 15, 0)
pc026 0x3BE: eventOwner:say(quest, 6, 0)
pc029 0x3CA: eventOwner:_runCharaScheduler(354082816)
pc034 0x3DE: eventOwner:say(quest, 7, 0)
pc039 0x3F2: eventOwner:say(quest, 8, 0)
pc044 0x406: eventOwner:say(quest, 9, 0)
pc049 0x41A: eventOwner:say(quest, 10, 0)
pc052 0x426: eventOwner:_runCharaScheduler(353959936)
pc057 0x43A: eventOwner:say(quest, 11, 0)
pc062 0x44E: eventOwner:say(quest, 16, 0)
pc064 0x456: quest:showQuestInfomation()
pc069 0x46A: eventOwner:_runCharaScheduler(353968128)
pc074 0x47E: eventOwner:say(quest, 13, 0)
pc085 0x4AA: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `4`: Welcome again, my friend. I was wondering when your travels would bring you back this way. It just so happens that I have some exciting news.
- `5`: I have finally uncovered the clues pertaining to the whereabouts of the lost armor of my ancestors!
- `6`: Realizing then that their master's fatal pride was born of the artifacts' combined influence, the pupils resolved to keep the pieces separate, and to share between five the power that might otherwise have consumed one. Thus did each of them carve his own place in history. The chronicles go on to say that years later, prior to death, each of the pupils returned to the scene of his own greatest victory, and buried the artifact in his possession in a final attempt to prevent any one warrior from holding the set. And it is there that the pieces still rest.
- `7`: You may be interested to know that the armor I wear is itself a replica of the set crafted by my ancestors─identical in all respects save for the arcane enchantments that adorned the original.
- `8`: Now, if we were to find the pieces the chronicles speak of, what would stop us from tracing their runes and adding them to every piece of warrior equipment? That way, there would be no need to worry about a single proud fool becoming drunk on his all-surpassing power, as every warrior in the realm would be possessed of the selfsame might!
- `9`: You, my friend, have walked with me nearly every step of this long journey, and it only seems fitting that I invite you to play your part in this final endeavor. If you are willing, I would have you aid me in the recovery of the lost artifacts.
- `10`: You see the benefit they can bring my tribe, the benefit they can bring Eorzea. [@1A(1)]You[@1A(0)] understand the importance of ensuring my mission...[@1A(1)]our[@1A(0)] mission is a success!
- `11`: I have marked the location of four of the pieces on your map. The fifth, I will see to while juggling my duties with the Company of Heroes and training other fledgling warriors.
- `12`: That is unfortunate...but there may be some wisdom in your hesitance. Speak with me again if you have second thoughts.
- `13`: You have my thanks, [@SPLIT([@STRING($EB(1))], ,1)]. May the Navigator guide you true, and the Spinner see you safely home.
- `15`: As it turns out, after the fallen hero cast the five pieces from the mountaintop, five of his pupils set out to recover them, intending to restore their master's name. What is more, they were actually successful in this search. However, when it came to reuniting the set, the armor's great power began to work upon their minds, and not one could bring himself to relinquish his piece.
- `16`: The order in which you retrieve the pieces is of little import, but I must warn you: my ancestors laid them to rest in some of the most perilous parts of the realm. You would be wise to enlist the aid of your fellow adventurers before attempting to recover them.

## processEventCURIOUS_GORGE_Follow (3 parameters; 0x5FF; 15 instructions)

```text
pc003 0x60B: eventOwner:startCliantTalkTurn(2, player)
pc006 0x617: eventOwner:_runCharaScheduler(353972224)
pc011 0x62B: eventOwner:say(quest, 14, 0)
pc013 0x633: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `14`: You need only locate the four pieces I indicated on your map. If you wish to don them, I shall not forbid it, but do so with the utmost care. You must be absolutely certain that your will is strong enough to bear their burden.

## processEvent_getAF_info (4 parameters; 0x6DB; 9 instructions)

```text
pc002 0x6E3: eventOwner:_runCharaScheduler(67108910)
pc007 0x6F7: quest:showGetJobItemWidget(player, arg4, 0)
return (no values)
```

## processEventChuui (3 parameters; 0x76B; 8 instructions)

```text
pc006 0x783: worldMaster:say(worldMaster, 51131, 111204, 17)
return (no values)
```

## processEventChuui2 (3 parameters; 0x7E8; 8 instructions)

```text
pc006 0x800: worldMaster:say(worldMaster, 51132, 111204, 17)
return (no values)
```

