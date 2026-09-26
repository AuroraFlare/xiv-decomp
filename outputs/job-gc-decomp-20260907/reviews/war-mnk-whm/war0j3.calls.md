# 111203 war0j3: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x201; 5 instructions)

```text
pc003 0x20D: quest:_loadTextDataPermanently(8164, "war0j3")
return (no values)
```

## processEvent_hint (3 parameters; 0x270; 21 instructions)

```text
pc003 0x27C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x288: eventOwner:_runCharaScheduler(353964032)
pc011 0x29C: eventOwner:say(quest, 2, 0)
pc017 0x2B4: worldMaster:say(quest, 3, 0)
pc019 0x2BC: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: It is good to see you again, my friend, but I hope you have not come in expectation of further revelations from the chronicles. I'm afraid I have made little progress with my translation. You still have the linkpearl I gave you, do you not? Rest assured, I will notify you the moment I discover anything of use.
- `3`: The next warrior quest will be available from Curious Gorge upon reaching level 40.

## processEventCURIOUSGORGEStart (3 parameters; 0x375; 96 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x381: eventOwner:startCliantTalkTurn(2, player)
pc006 0x38D: eventOwner:_runCharaScheduler(354062336)
pc011 0x3A1: eventOwner:say(quest, 4, 0)
pc016 0x3B5: eventOwner:say(quest, 5, 0)
pc021 0x3C9: eventOwner:say(quest, 6, 0)
pc024 0x3D5: eventOwner:_runCharaScheduler(67825664)
pc029 0x3E9: eventOwner:say(quest, 7, 0)
pc034 0x3FD: eventOwner:say(quest, 8, 0)
pc039 0x411: eventOwner:say(quest, 9, 0)
pc042 0x41D: eventOwner:_runCharaScheduler(354066432)
pc047 0x431: eventOwner:say(quest, 10, 0)
pc052 0x445: eventOwner:say(quest, 11, 0)
pc055 0x451: eventOwner:_runCharaScheduler(353964032)
pc060 0x465: eventOwner:say(quest, 12, 0)
pc065 0x479: eventOwner:say(quest, 30, 0)
pc070 0x48D: eventOwner:say(quest, 13, 0)
pc072 0x495: quest:showQuestInfomation()
pc086 0x4CD: eventOwner:_runCharaScheduler(354041856)
pc091 0x4E1: eventOwner:say(quest, 14, 0)
pc093 0x4E9: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x381: eventOwner:startCliantTalkTurn(2, player)
pc006 0x38D: eventOwner:_runCharaScheduler(354062336)
pc011 0x3A1: eventOwner:say(quest, 4, 0)
pc016 0x3B5: eventOwner:say(quest, 5, 0)
pc021 0x3C9: eventOwner:say(quest, 6, 0)
pc024 0x3D5: eventOwner:_runCharaScheduler(67825664)
pc029 0x3E9: eventOwner:say(quest, 7, 0)
pc034 0x3FD: eventOwner:say(quest, 8, 0)
pc039 0x411: eventOwner:say(quest, 9, 0)
pc042 0x41D: eventOwner:_runCharaScheduler(354066432)
pc047 0x431: eventOwner:say(quest, 10, 0)
pc052 0x445: eventOwner:say(quest, 11, 0)
pc055 0x451: eventOwner:_runCharaScheduler(353964032)
pc060 0x465: eventOwner:say(quest, 12, 0)
pc065 0x479: eventOwner:say(quest, 30, 0)
pc070 0x48D: eventOwner:say(quest, 13, 0)
pc072 0x495: quest:showQuestInfomation()
pc077 0x4A9: eventOwner:_runCharaScheduler(354099200)
pc082 0x4BD: eventOwner:say(quest, 15, 0)
pc093 0x4E9: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `4`: Hello again, my friend. It is quite obvious that you have been anything but idle in your training since last we met. Your progress is heartening to look upon, truly...but it also serves to remind me that each hour I spend poring over ancient texts is an hour not spent honing my skills. I fear my worth on the battlefield is diminishing by the day.
- `5`: Yet I am certain that my studies of the chronicles will yield something of use. In fact, just last night, I discovered how the warriors of my tribe came to be shunned by the outside world.
- `6`: Upon witnessing the prowess of my tribe's warriors in battle, the armies of the city-states began to incorporate techniques similar to those I have taught you into their training regimen─techniques which require the waking of one's inner beast.
- `7`: The consequences, of course, were dire. Yes, their soldiers became nigh on unstoppable, but they also became wholly uncontrollable...and both friend and foe fell prey to ensuing carnage. Of course, the heads of the city-states laid the blame for these atrocities solely at the feet of my kind, and promptly banned our ancient art, and imprisoned anyone suspected of teaching it. Or so the chronicles say...
- `8`: What I find hard to grasp, though, is that never once during my tutelage did my instructors hint at this dark history. Nor did I ever see any of my tribe succumb to the rage that the chronicles describe.
- `9`: Could it be that the tales are mere falsehoods? Stories concocted by some long-forgotten enemy who conspired to poison our heritage and befoul our tribe's name? Who in their right mind would seek to sully something so pure...and why would my ancestors simply bow their heads and suffer such ignominy!?
- `10`: That my people should be so [@1A(1)]weak[@1A(0)]─so utterly bereft of pride─is inexplicable. I refuse to believe it!
- `11`: It matters not if these claims are groundless─if they prompted my tribe's art to fade into obscurity, then the damage has already been done. Well, I for one will not turn a blind eye to this injustice! If none of my people will give the lie to the stories that have so tarnished our reputation, it shall have to be me!
- `12`: My friend, may I put to you a request? Might you agree to accompany me on a mission for the Company of Heroes?
- `13`: By showing the hamlet's residents the true nature of the warrior, and the purity with which he fights, perhaps the citizenry may begin to embrace my tribe and our art once more─and put aside the lies of the past.
- `14`: A [@IF($E9(4),woman,man)] who walks into a battle unprepared is a [@IF($E9(4),woman,man)] who walks to [@IF($E9(4),her,his)] death. I contemn you not for wanting more time to prepare.
- `15`: Excellent! I knew you would understand the importance of this mission. I shall enter the hamlet from the west side, you approach from the north then east. I will meet you when we have dispatched the last of the cloudkin.
- `30`: It is a simple affair that requires a dual-pronged assault on a flock of giant, carnivorous condors that has been hunting the children of the Silver Bazaar.

## processEvent000_2 (3 parameters; 0x650; 20 instructions)

```text
pc003 0x65C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x668: eventOwner:_runCharaScheduler(353964032)
pc011 0x67C: eventOwner:say(quest, 16, 0)
pc016 0x690: eventOwner:say(quest, 31, 0)
pc018 0x698: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `16`: Once a day, mammoth condors descend from the canyon walls into the Silver Bazaar to hunt for small animals...and even children. The men and women of the village have tried everything in their power to fend off the evil creatures, but to no avail.
- `31`: I shall approach the hamlet from the west gates, you from the north, then east. Call upon your inner beast to aid you in slaying each and every one of the cloudkin, that we may liberate the Silver Bazaar's people from fear, and go some small way to clearing my ancestors' names!

## processEvent005 (4 parameters; 0x749; 13 instructions)

```text
pc002 0x751: quest:startFadeOutCutSceneDefault(player)
pc008 0x769: quest:startNQCutScene("war0j310", 1, 0, arg4)
pc011 0x775: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEvent010 (3 parameters; 0x81B; 76 instructions)

```text
pc003 0x827: eventOwner:startCliantTalkTurn(2, player)
pc008 0x83B: eventOwner:say(quest, 21, 0)
pc011 0x847: eventOwner:_runCharaScheduler(354086912)
pc016 0x85B: eventOwner:say(quest, 22, 0)
pc021 0x86F: eventOwner:say(quest, 32, 0)
pc026 0x883: eventOwner:say(quest, 23, 0)
pc029 0x88F: eventOwner:_runCharaScheduler(353959936)
pc034 0x8A3: eventOwner:say(quest, 24, 0)
pc038 0x8B3: quest:startFadeOut(player, 1)
pc041 0x8BF: quest:_wait(2)
pc045 0x8CF: quest:startFadeIn(player, 1)
pc048 0x8DB: eventOwner:_runCharaScheduler(354086912)
pc053 0x8EF: eventOwner:say(quest, 26, 0)
pc058 0x903: eventOwner:say(quest, 27, 0)
pc061 0x90F: eventOwner:_runCharaScheduler(353964032)
pc066 0x923: eventOwner:say(quest, 28, 0)
pc072 0x93B: worldMaster:say(quest, 29, 0)
pc074 0x943: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `21`: [@SPLIT([@STRING($EB(1))], ,1)]... Please forgive me for leaving so abruptly earlier.
- `22`: It was a hasty reaction to a situation for which I was completely unprepared.
- `23`: Mayhap it was this very misapprehension that lent weight to the lies which led to my tribe's disgrace. And if that is the case, then perhaps I should return once more to the chronicles, and endeavor to reassess their message in light of this discovery.
- `24`: Speaking of light─your Soul of the Warrior is sparkling.
- `26`: What did the whispers reveal? Anything of import?
- `27`: If only they hadn't forsaken me, as they did my brother...
- `28`: Ahem! Yes, well, I suppose that is that. I must continue my studies, and you your training. I hope to have something new for both of us very soon. Until then, my friend.
- `29`: The next warrior quest will be available from Curious Gorge upon reaching level 45.
- `32`: While both you and I know that I was in complete control of my inner beast, I now realize that to the layman's eye, it may have seemed that...well, the opposite was true.

## processEventKokuti (3 parameters; 0xA8D; 17 instructions)

```text
pc004 0xA9D: desktopWidget:openPublicInformLongDialogWidget(quest, 34)
pc007 0xAA9: quest:_wait(8)
pc012 0xABD: quest:showGetJobAbilityWidget(player, 27188, 1)
pc015 0xAC9: quest:_wait(6)
return (no values)
```

Quest-text references:

- `34`: The warriors of ages past have borne witness to your stone-like tenacity and now grant you their undying strength!

## processEventChuui (3 parameters; 0xB87; 8 instructions)

```text
pc006 0xB9F: worldMaster:say(worldMaster, 51131, 111203, 17)
return (no values)
```

## processEventChuui2 (3 parameters; 0xC04; 8 instructions)

```text
pc006 0xC1C: worldMaster:say(worldMaster, 51132, 111203, 17)
return (no values)
```

