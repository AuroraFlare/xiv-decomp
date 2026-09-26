# 111244 whm0j4: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x317; 5 instructions)

```text
pc003 0x323: quest:_loadTextDataPermanently(9780, "whm0j4")
return (no values)
```

## processEventStartBeforeRaya (3 parameters; 0x386; 21 instructions)

```text
pc003 0x392: eventOwner:startCliantTalkTurn(2, player)
pc006 0x39E: eventOwner:_runCharaScheduler(364752896)
pc011 0x3B2: eventOwner:say(quest, 3, 0)
pc017 0x3CA: worldMaster:say(quest, 4, 0)
pc019 0x3D2: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: The rage of the elementals appears to have subsided slightly. I daresay our efforts are beginning to bear fruit, but we cannot allow ourselves rest until the Twelveswood has regained its former calm.
- `4`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 45.

## processEventStartBeforeMogA (3 parameters; 0x494; 15 instructions)

```text
pc003 0x4A0: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x4AC: eventOwner:_runCharaScheduler(70021120)
pc011 0x4C0: eventOwner:say(quest, 1, 0)
pc013 0x4C8: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `1`: Oh, joy! The elementals have seen fit to let me visit my favorite flower bed again, kupo! Just the thought of spending another idyllic afternoon among the petals is enough to make me shiver and shake! When things settle, I shall go there and nap till I give myself bellyaches─see if I don't, kupo!

## processEventStartBeforeMogB (3 parameters; 0x56D; 15 instructions)

```text
pc003 0x579: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x585: eventOwner:_runCharaScheduler(70197248)
pc011 0x599: eventOwner:say(quest, 2, 0)
pc013 0x5A1: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Raya[@1F]O told me that people tend to say the opposite of what they mean, kupo. So when they say “no,” it actually means “yes.” Is that truly the way of it?

## processEventStart (3 parameters; 0x64F; 141 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x65B: eventOwner:startCliantTalkTurn(2, player)
pc006 0x667: eventOwner:_runCharaScheduler(364748800)
pc011 0x67B: eventOwner:say(quest, 5, 0)
pc014 0x687: eventOwner:_runCharaScheduler(70881280)
pc019 0x69B: eventOwner:say(quest, 8, 0)
pc024 0x6AF: eventOwner:say(quest, 9, 0)
pc027 0x6BB: eventOwner:_runCharaScheduler(354082816)
pc032 0x6CF: eventOwner:say(quest, 37, 0)
pc037 0x6E3: eventOwner:say(quest, 40, 0)
pc042 0x6F7: eventOwner:say(quest, 41, 0)
pc045 0x703: eventOwner:_runCharaScheduler(353964032)
pc050 0x717: eventOwner:say(quest, 10, 0)
pc055 0x72B: eventOwner:say(quest, 42, 0)
pc060 0x73F: eventOwner:say(quest, 43, 0)
pc063 0x74B: eventOwner:_runCharaScheduler(364748800)
pc068 0x75F: eventOwner:say(quest, 11, 0)
pc073 0x773: eventOwner:say(quest, 44, 0)
pc076 0x77F: eventOwner:_runCharaScheduler(70815744)
pc081 0x793: eventOwner:say(quest, 45, 0)
pc084 0x79F: eventOwner:_runCharaScheduler(364756992)
pc089 0x7B3: eventOwner:say(quest, 12, 0)
pc094 0x7C7: eventOwner:say(quest, 46, 0)
pc097 0x7D3: eventOwner:_runCharaScheduler(70795264)
pc102 0x7E7: eventOwner:say(quest, 47, 0)
pc107 0x7FB: eventOwner:say(quest, 13, 0)
pc109 0x803: quest:showQuestInfomation()
pc131 0x85B: eventOwner:_runCharaScheduler(354082816)
pc136 0x86F: eventOwner:say(quest, 14, 0)
pc138 0x877: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x65B: eventOwner:startCliantTalkTurn(2, player)
pc006 0x667: eventOwner:_runCharaScheduler(364748800)
pc011 0x67B: eventOwner:say(quest, 5, 0)
pc014 0x687: eventOwner:_runCharaScheduler(70881280)
pc019 0x69B: eventOwner:say(quest, 8, 0)
pc024 0x6AF: eventOwner:say(quest, 9, 0)
pc027 0x6BB: eventOwner:_runCharaScheduler(354082816)
pc032 0x6CF: eventOwner:say(quest, 37, 0)
pc037 0x6E3: eventOwner:say(quest, 40, 0)
pc042 0x6F7: eventOwner:say(quest, 41, 0)
pc045 0x703: eventOwner:_runCharaScheduler(353964032)
pc050 0x717: eventOwner:say(quest, 10, 0)
pc055 0x72B: eventOwner:say(quest, 42, 0)
pc060 0x73F: eventOwner:say(quest, 43, 0)
pc063 0x74B: eventOwner:_runCharaScheduler(364748800)
pc068 0x75F: eventOwner:say(quest, 11, 0)
pc073 0x773: eventOwner:say(quest, 44, 0)
pc076 0x77F: eventOwner:_runCharaScheduler(70815744)
pc081 0x793: eventOwner:say(quest, 45, 0)
pc084 0x79F: eventOwner:_runCharaScheduler(364756992)
pc089 0x7B3: eventOwner:say(quest, 12, 0)
pc094 0x7C7: eventOwner:say(quest, 46, 0)
pc097 0x7D3: eventOwner:_runCharaScheduler(70795264)
pc102 0x7E7: eventOwner:say(quest, 47, 0)
pc107 0x7FB: eventOwner:say(quest, 13, 0)
pc109 0x803: quest:showQuestInfomation()
pc114 0x817: eventOwner:_runCharaScheduler(79593472)
pc119 0x82B: eventOwner:say(quest, 15, 0)
pc124 0x83F: eventOwner:say(quest, 48, 0)
pc126 0x847: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `5`: [@SPLIT([@STRING($EB(1))], ,1)], it does my spirit well to see you again. I was in the midst of contemplating Oha[@1F]Sok's words. But tell me, are you versed in the histories?
- `8`: I take from your silence that you are not. No matter, it shall be my pleasure to educate you. The Fifth Astral Era is said to have begun approximately three millennia ago.
- `9`: The ice age that ushered in the Fifth Umbral Era made the land a barren and merciless place, and man was pushed to the limits of his resourcefulness in the struggle to survive. Yet survive he did, through the discovery of magic as we know it─an event which marked the dawning of the Fifth Astral Era.
- `10`: In his pride and avarice, man brought down the wrath of the elementals upon himself.
- `11`: Owing to our efforts, a semblance of calm has returned to the Twelveswood. But this peace is not like to endure.
- `12`: [@SPLIT([@STRING($EB(1))], ,1)], I have need of your strength once again.
- `13`: I trust you already know what is required of you. Aye, you must free the hapless souls from the grip of the rogue elemental that controls them.
- `14`: I know not the words to express my disappointment. Search your soul, [@SPLIT([@STRING($EB(1))], ,1)], and ask yourself whether you do the right thing.
- `15`: I knew you would not disappoint me. You are a true friend to the elementals─to Gridania.
- `37`: At first, man was well pleased just to have the means to keep the cold at bay and compete with the other races. But man is nothing if not an ambitious beast. It was not long before he began to seek mightier magicks, hoping to win greater glory.
- `40`: And it was this desire that brought forth black magic, the arcane art of destruction. In order that the forces of chaos be kept in check, and balance preserved, white magic, the arcane art of succor, came into being but a little while thereafter.
- `41`: Emboldened by magic, man went on to reach the zenith of glory. But his hunger knew no bounds. Over time, even they who donned the white began perverting their powers for the sake of personal gain, and in this single-minded pursuit scrupled not to sully the sanctity of the Twelveswood.
- `42`: A great deluge was sent to cleanse the land of his wicked presence, in the wake of which the forest rose to swallow up all that was not washed away. Thus did the Six Umbral Era begin...or so it is told.
- `43`: Something is eerily familiar about all of this.
- `44`: Beyond the bounds of the forest, rogue elementals remain rampant as ever.
- `45`: If they are left to their rage, another calamity will surely befall Eorzea. We must do all in our power to ensure that this does not come to pass.
- `46`: Word has reached us that a man has taken to banditry at the land bridge south of Camp Bearded Rock, falling upon hapless travelers and despoiling them of their weapons.
- `47`: If the reports are to be believed, the eyes of this bandit and his minions are steeped in such rage as their mortal flesh could not possibly have begotten.
- `48`: Be heedful that your opponents are ordinary men no more. I urge you to proceed with the utmost caution.

## processEventRyaoAfter (3 parameters; 0xA26; 25 instructions)

```text
pc003 0xA32: eventOwner:startCliantTalkTurn(2, player)
pc006 0xA3E: eventOwner:_runCharaScheduler(79577088)
pc011 0xA52: eventOwner:say(quest, 18, 0)
pc016 0xA66: eventOwner:say(quest, 49, 0)
pc021 0xA7A: eventOwner:say(quest, 50, 0)
pc023 0xA82: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `18`: A man has taken to banditry at the land bridge south of Camp Bearded Rock, falling upon hapless travelers and despoiling them of their weapons.
- `49`: If the reports are to be believed, the eyes of this man and his minions are steeped in such rage as their mortal flesh could not possibly have begotten. You must free the hapless souls from the grip of the rogue elemental that controls them.
- `50`: First the enraged elementals, and now stolen arms... Something about all this sits ill with me.

## processEventMoogleA00 (3 parameters; 0xB3C; 15 instructions)

```text
pc003 0xB48: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xB54: eventOwner:_runCharaScheduler(70086656)
pc011 0xB68: eventOwner:say(quest, 16, 0)
pc013 0xB70: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `16`: I shudder at the thought of living in a world of endless cold. Why, my poor nose would become all chapped! Few things irk a moogle more than a chapped nose, kupo.

## processEventMoogleB00 (3 parameters; 0xC1E; 15 instructions)

```text
pc003 0xC2A: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xC36: eventOwner:_runCharaScheduler(70098944)
pc011 0xC4A: eventOwner:say(quest, 17, 0)
pc013 0xC52: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `17`: So the forest swallowed up the land? Why, that sounds like a veritable paradise! Ah, but I jest, kupo! <sigh>

## processEventNQ (3 parameters; 0xD00; 12 instructions)

```text
pc002 0xD08: quest:startFadeOutCutSceneDefault(player)
pc006 0xD18: quest:startNQCutScene("whm0j410", 1)
pc009 0xD24: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEventLS (3 parameters; 0xDC5; 7 instructions)

```text
pc004 0xDD5: quest:showEventBeforeNpsLS(player, 2700007, 38)
return (no values)
```

## processEventLS2 (3 parameters; 0xE35; 7 instructions)

```text
pc004 0xE45: quest:showEventBeforeNpsLS(player, 2700007, 63)
return (no values)
```

## processEventMoogleA01 (3 parameters; 0xEA5; 15 instructions)

```text
pc003 0xEB1: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xEBD: eventOwner:_runCharaScheduler(70193152)
pc011 0xED1: eventOwner:say(quest, 30, 0)
pc013 0xED9: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `30`: <sniff> <sniff> The scent of sorrow clings to you, adventurer. My shoulder is at your disposal should you need a good cry, kupo. There's no shame in shedding tears, you know. They're not a sign of weakness, but of the strength of your feeling.

## processEventMoogleB01 (3 parameters; 0xF87; 15 instructions)

```text
pc003 0xF93: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xF9F: eventOwner:_runCharaScheduler(70098944)
pc011 0xFB3: eventOwner:say(quest, 31, 0)
pc013 0xFBB: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `31`: Kupopo? Oha[@1F]Sok's aura vanished all of a sudden. Where in the world could she have gone, kupo?

## processEventClear (3 parameters; 0x1069; 181 instructions)

```text
pc003 0x1075: eventOwner:startCliantTalkTurn(2, player)
pc006 0x1081: eventOwner:_runCharaScheduler(353959936)
pc011 0x1095: eventOwner:say(quest, 26, 0)
pc015 0x10A5: quest:startFadeOut(player, 1.5)
pc018 0x10B1: quest:_wait(1)
pc021 0x10BD: eventOwner:_runCharaScheduler(79577088)
pc024 0x10C9: quest:_wait(0.5)
pc028 0x10D9: quest:startFadeIn(player, 1.5)
pc031 0x10E5: eventOwner:_runCharaScheduler(353959936)
pc036 0x10F9: eventOwner:say(quest, 27, 0)
pc041 0x110D: eventOwner:say(quest, 28, 0)
pc044 0x1119: eventOwner:_runCharaScheduler(70795264)
pc049 0x112D: eventOwner:say(quest, 33, 0)
pc054 0x1141: eventOwner:say(quest, 53, 0)
pc057 0x114D: eventOwner:_runCharaScheduler(353964032)
pc062 0x1161: eventOwner:say(quest, 54, 0)
pc067 0x1175: eventOwner:say(quest, 55, 0)
pc072 0x1189: eventOwner:say(quest, 56, 0)
pc075 0x1195: eventOwner:_runCharaScheduler(354082816)
pc080 0x11A9: eventOwner:say(quest, 39, 0)
pc085 0x11BD: eventOwner:say(quest, 57, 0)
pc090 0x11D1: eventOwner:say(quest, 58, 0)
pc093 0x11DD: eventOwner:_runCharaScheduler(70881280)
pc096 0x11E9: quest:_wait(0.5)
pc101 0x11FD: eventOwner:say(quest, 34, 0)
pc106 0x1211: eventOwner:say(quest, 35, 0)
pc111 0x1225: eventOwner:say(quest, 65, 0)
pc116 0x1239: eventOwner:say(quest, 66, 0)
pc119 0x1245: eventOwner:_runCharaScheduler(353968128)
pc124 0x1259: eventOwner:say(quest, 36, 0)
pc129 0x126D: eventOwner:say(quest, 59, 0)
pc134 0x1281: eventOwner:say(quest, 60, 0)
pc137 0x128D: eventOwner:_runCharaScheduler(79593472)
pc140 0x1299: quest:_wait(0.5)
pc145 0x12AD: eventOwner:say(quest, 61, 0)
pc150 0x12C1: desktopWidget:openPublicInformLongDialogWidget(quest, 64)
pc153 0x12CD: quest:_wait(8)
pc158 0x12E1: quest:showGetJobAbilityWidget(player, 27359, 2)
pc161 0x12ED: quest:_wait(6)
pc164 0x12F9: eventOwner:_runCharaScheduler(70795264)
pc169 0x130D: eventOwner:say(quest, 62, 0)
pc172 0x1319: eventOwner:_runCharaScheduler(79597568)
pc177 0x132D: eventOwner:say(quest, 29, 0)
pc179 0x1335: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `26`: [@SPLIT([@STRING($EB(1))], ,1)]! I am so relieved that you've returned. But...was Oha[@1F]Sok not with you?
- `27`: “Where all things end, so too do I begin...”
- `28`: By the Twelve, how could I have been so blind?
- `29`: Its bestowal is symbolic of the trust I place in you. The fate of Eorzea hinges upon our efforts, and neither one of us may rest until our mission is accomplished.
- `33`: That I should be in the presence of such a being, and for so long...and fail to see her for what she was! Oh, I know not whether to be amazed or ashamed!
- `34`: [@SPLIT([@STRING($EB(1))], ,1)], I do believe we have been given a reprieve. I have a strong suspicion that Oha[@1F]Sok stays her hand─that she refrains from ushering in the end.
- `35`: Rather than setting about raising the chorus of her kindred's rage, she chose to follow you that she might bear witness to your every action. Owing to this, the elementals' rage was given a chance to subside.
- `36`: Might Oha[@1F]Sok yet harbor hope for mankind's redemption? If so, we still have a chance.
- `39`: Ever more elementals shall join the keening, and so shall it continue until their chorus rends the land asunder.
- `53`: Oha[@1F]Sok is the collective fury of the elementals given form. Their suffering summoned her forth, and in her turn she stokes the fire of their rage with her keening.
- `54`: As I related to you earlier, it was the rage of the elementals that brought an end to the civilization of the Fifth Astral Era.
- `55`: And now the selfsame harbinger of that destruction is come once more. Aye, I speak of Oha[@1F]Sok.
- `56`: The histories vividly describe the fearsome nature of the elemental of nihility─or “the Wrath,” as she is sometimes called. It is writ that each time she keens, she sets off a hundred of her kind to doing the same.
- `57`: And then the heavens shall spill forth a deluge of tears, and the trees weep till they are hoarse of voice.
- `58`: Oha[@1F]Sok's awakening betokens Eorzea's doom...and yet, if the histories speak true, that doom should already have been enacted.
- `59`: I shall commune with other elementals and seek a way to stop her from unleashing cataclysm upon Eorzea.
- `60`: As for you, in light of the trials to come, it is vital that you realize your potential as a white mage posthaste.
- `61`: By the power vested in me, I hereby permit you the use of new white magic.
- `62`: One of the mightiest spells known to our art is now yours to wield. With it, you may concentrate divine energy into a single burst of such power as would amaze an adept of black magic.
- `64`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!
- `65`: When she came to us, Oha[@1F]Sok claimed that she had been entrapped within [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)].
- `66`: But now I wonder if she did not render her essence unto the staff of her own volition, that she might observe the deeds of men.

## processEventChuui (3 parameters; 0x159C; 8 instructions)

```text
pc006 0x15B4: worldMaster:say(worldMaster, 51131, 111244, 27)
return (no values)
```

## processEventChuui2 (3 parameters; 0x1619; 8 instructions)

```text
pc006 0x1631: worldMaster:say(worldMaster, 51132, 111244, 27)
return (no values)
```

