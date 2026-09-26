# 111222 mnk0j2: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x264; 5 instructions)

```text
pc003 0x270: quest:_loadTextDataPermanently(8468, "mnk0j2")
return (no values)
```

## processEventERIKStart (3 parameters; 0x2D3; 181 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x2DF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2EB: eventOwner:_runCharaScheduler(354099200)
pc009 0x2F7: quest:_wait(0.5)
pc014 0x30B: eventOwner:say(quest, 6, 0)
pc019 0x31F: eventOwner:say(quest, 39, 0)
pc024 0x333: eventOwner:say(quest, 34, 0)
pc027 0x33F: eventOwner:_runCharaScheduler(354103296)
pc032 0x353: eventOwner:say(quest, 7, 0)
pc037 0x367: eventOwner:say(quest, 8, 0)
pc040 0x373: eventOwner:_runCharaScheduler(70803456)
pc045 0x387: eventOwner:say(quest, 40, 0)
pc047 0x38F: eventOwner:finishCliantTalkTurn()
pc050 0x39B: eventOwner:_runCharaScheduler(353959936)
pc055 0x3AF: eventOwner:say(quest, 9, 0)
pc058 0x3BB: eventOwner:_runCharaScheduler(70881280)
pc063 0x3CF: eventOwner:say(quest, 10, 0)
pc067 0x3DF: eventOwner:startCliantTalkTurn(2, player)
pc070 0x3EB: eventOwner:_runCharaScheduler(353972224)
pc075 0x3FF: eventOwner:say(quest, 11, 0)
pc077 0x407: eventOwner:finishCliantTalkTurn()
pc082 0x41B: eventOwner:say(quest, 12, 0)
pc087 0x42F: eventOwner:say(quest, 13, 0)
pc091 0x43F: eventOwner:startCliantTalkTurn(2, player)
pc094 0x44B: eventOwner:_runCharaScheduler(354000896)
pc097 0x457: quest:_wait(0.5)
pc102 0x46B: eventOwner:say(quest, 33, 0)
pc107 0x47F: eventOwner:say(quest, 41, 0)
pc112 0x493: eventOwner:say(quest, 42, 0)
pc115 0x49F: eventOwner:_runCharaScheduler(353980416)
pc120 0x4B3: eventOwner:say(quest, 14, 0)
pc123 0x4BF: quest:_wait(0.5)
pc126 0x4CB: eventOwner:_runCharaScheduler(70795264)
pc129 0x4D7: quest:_wait(1)
pc134 0x4EB: eventOwner:say(quest, 15, 0)
pc139 0x4FF: eventOwner:say(quest, 43, 0)
pc142 0x50B: eventOwner:_runCharaScheduler(353968128)
pc147 0x51F: eventOwner:say(quest, 44, 0)
pc149 0x527: quest:showQuestInfomation()
pc171 0x57F: eventOwner:_runCharaScheduler(354041856)
pc176 0x593: eventOwner:say(quest, 16, 0)
pc178 0x59B: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x2DF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2EB: eventOwner:_runCharaScheduler(354099200)
pc009 0x2F7: quest:_wait(0.5)
pc014 0x30B: eventOwner:say(quest, 6, 0)
pc019 0x31F: eventOwner:say(quest, 39, 0)
pc024 0x333: eventOwner:say(quest, 34, 0)
pc027 0x33F: eventOwner:_runCharaScheduler(354103296)
pc032 0x353: eventOwner:say(quest, 7, 0)
pc037 0x367: eventOwner:say(quest, 8, 0)
pc040 0x373: eventOwner:_runCharaScheduler(70803456)
pc045 0x387: eventOwner:say(quest, 40, 0)
pc047 0x38F: eventOwner:finishCliantTalkTurn()
pc050 0x39B: eventOwner:_runCharaScheduler(353959936)
pc055 0x3AF: eventOwner:say(quest, 9, 0)
pc058 0x3BB: eventOwner:_runCharaScheduler(70881280)
pc063 0x3CF: eventOwner:say(quest, 10, 0)
pc067 0x3DF: eventOwner:startCliantTalkTurn(2, player)
pc070 0x3EB: eventOwner:_runCharaScheduler(353972224)
pc075 0x3FF: eventOwner:say(quest, 11, 0)
pc077 0x407: eventOwner:finishCliantTalkTurn()
pc082 0x41B: eventOwner:say(quest, 12, 0)
pc087 0x42F: eventOwner:say(quest, 13, 0)
pc091 0x43F: eventOwner:startCliantTalkTurn(2, player)
pc094 0x44B: eventOwner:_runCharaScheduler(354000896)
pc097 0x457: quest:_wait(0.5)
pc102 0x46B: eventOwner:say(quest, 33, 0)
pc107 0x47F: eventOwner:say(quest, 41, 0)
pc112 0x493: eventOwner:say(quest, 42, 0)
pc115 0x49F: eventOwner:_runCharaScheduler(353980416)
pc120 0x4B3: eventOwner:say(quest, 14, 0)
pc123 0x4BF: quest:_wait(0.5)
pc126 0x4CB: eventOwner:_runCharaScheduler(70795264)
pc129 0x4D7: quest:_wait(1)
pc134 0x4EB: eventOwner:say(quest, 15, 0)
pc139 0x4FF: eventOwner:say(quest, 43, 0)
pc142 0x50B: eventOwner:_runCharaScheduler(353968128)
pc147 0x51F: eventOwner:say(quest, 44, 0)
pc149 0x527: quest:showQuestInfomation()
pc154 0x53B: eventOwner:_runCharaScheduler(70795264)
pc159 0x54F: eventOwner:say(quest, 35, 0)
pc162 0x55B: eventOwner:_runCharaScheduler(354045952)
pc167 0x56F: eventOwner:say(quest, 45, 0)
pc178 0x59B: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `6`: Ah, just the pupil I was hoping to see. I was a hair's breadth from setting out on my own. Hmmm, to look at you... Yes, I daresay you appear to have been growing in brawn at the expense of brain.
- `7`: Then surely it must be difficult to use, you ask? False! The device has a chain equipped with a crystal of Mor Dhonan making─one imbued with the attributes of all six elements. You need only extend your arms parallel to the ground and allow the chain to dangle.
- `8`: All that remains is to simply walk in whatever direction the crystal sways. It is drawn towards strong aetherial fields, you see. Much like a magnet. Think of it as a sort of aetherial dowsing-rod─and no, I shall not be explaining what a dowsing-rod is.
- `9`: Aether is not only the source of all magicks, but also the fount of all life. Yet despite its ubiquity, it remains imperceptible to the senses of man. When a living thing dies, the aether comprising its life is released. It has been learned that when this discharge takes place, a portion of that aether remains, lingering in the physical world......
- `10`: No doubt you have......aetherial crystallizations......physical manifestation......
- `11`: ......Apparitions of the deceased......luminescent glow......
- `12`: ......shift between the physical......[@1A(1)]aetherial threshold[@1A(0)]......
- `13`: ...In short: the more violent and dramatic the loss of life, the greater the amount of aether left behind─either in its imperceptible form or in crystallizations. And where are the most lives lost in this manner?
- `14`: A watered-down explanation, but adequate for one of your mental prowess, I believe. Mine own wife never had the patience for such things either, nor my passion. She cursed me and my work, took our children and returned to Ala Mhigo...
- `15`: <sigh> But now is not the time for that tale.
- `16`: No? I have been kind enough to treat you as a pupil rather than a servant, but need I remind you of the capacity in which you are here? “No” is not a luxury afforded you. Perhaps you simply did not understand. Shall I explain it all again─[@1A(1)]slowly[@1A(0)]?
- `33`: Cemeteries!? No, false, you idiot! Battlefields! Do you not see? With aetherial readings of those locations, we can discern the scale and more of the battles that took place there!
- `34`: You must be having misgivings. Thinking perhaps that you are far too stupid to take, much less understand, aetherial readings? It is true─you are stupid. But [@SWITCH([@SHEET(itemData,11000552,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,2,11000552,1,1)][@EDGECOLOR($EC)][@COLOR($EC)] shall render you sufficiently intelligent─albeit for only the briefest of instants.
- `35`: But of course you are. You shall travel to the site of an ancient and storied battle between two pirates─when the Young Dread, Keltlach, mutinied against the great One-eyed Wylfred.
- `39`: Right, well, let us measure some aether, shall we? And by we I mean you. Oh, and the monk simpleton, of course. Though, contrary to his nature, he has already set out for the destination I assigned him.
- `40`: As souls more, ahem, [@1A(1)]suited to action[@1A(0)], the monk simpleton and yourself need only carry the device on your person and set to killing things as you always do. It shall capture data as you trudge about hither and yon.
- `41`: As for those fool beliefs the monkhood keeps─chakra and spiritual energies and whatnot─if I [@1A(1)]were[@1A(0)] to allow that they truly exist, I would be inclined to say they are one and the same as aether itself.
- `42`: The aether churning around these ancient battle sites comes to naturally settle in the surrounding life─both plant and animal, though more so in the latter. It accumulates within them. Felling these beasts then releases that aether, causing a surge that resonates with the aether within you, causing it to expand─the so-called opening of the chakra. By this, the very power of life itself within you grows.
- `43`: The area I am placing in your charge is the south of Cedarwood in lower La Noscea. From what I have been able to learn, a beast known as Gluttonous Gertrude seems to be the most promising target.
- `44`: I obtain the data I require, and you and the monk simpleton are afforded the chance to indulge your─how shall I put it?─charming little backward fantasies. All are happy. Are you ready, then?
- `45`: As ever, I am more than able and less than wholly unwilling to educate you further, should it facilitate the completion of the task I have assigned you. If there is aught you would know, do ask at any time. Right, to work, then!

## processEventERIKStart_1 (3 parameters; 0x794; 39 instructions)

```text
pc003 0x7A0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x7AC: eventOwner:_runCharaScheduler(353959936)
pc011 0x7C0: eventOwner:say(quest, 3, 0)
pc016 0x7D4: eventOwner:say(quest, 37, 0)
pc021 0x7E8: eventOwner:say(quest, 38, 0)
pc024 0x7F4: eventOwner:_runCharaScheduler(354000896)
pc029 0x808: eventOwner:say(quest, 4, 0)
pc035 0x820: worldMaster:say(quest, 5, 0)
pc037 0x828: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: Ah, my foremost pupil! And I mean that quite literally. None of my other students are quite so excelled in their ignorance as you. Tell me, how come your studies?
- `4`: You and the monk simpleton shall use these to take measurements in my stead. But I cannot in good conscience send you to such dangerous tracts just yet, though the thickness of your skull would likely prevent you from coming to any harm. Go and toughen up a bit first, would you?
- `5`: The next monk quest will be available from Erik upon reaching level 35.
- `37`: Well, prepare for your next lesson. The revolutionary new method I have devised is based upon a simple premise─that past events at a given location can be reconstructed through careful measurement of the aether at that location.
- `38`: You must think that taking such measurements requires great experience and expertise. False! Not with the aid of [@SWITCH([@SHEET(itemData,11000552,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,1,11000552,1,1)][@EDGECOLOR($EC)][@COLOR($EC)]─an ingenious device created by the engineers of the Garlond Ironworks.

## processEventWIDARGELTStart_1 (3 parameters; 0x90E; 15 instructions)

```text
pc003 0x91A: eventOwner:startCliantTalkTurn(2, player)
pc006 0x926: eventOwner:_runCharaScheduler(70795264)
pc011 0x93A: eventOwner:say(quest, 2, 0)
pc013 0x942: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: I seek the battlegrounds of old. As does Erik, though our reasons differ. And now you have come. A monk. Yet not of the Fist of Rhalgr. For what purpose have the gods brought us together?

## processEvent000 (3 parameters; 0x9E1; 20 instructions)

```text
pc003 0x9ED: eventOwner:startCliantTalkTurn(2, player)
pc006 0x9F9: eventOwner:_runCharaScheduler(354000896)
pc011 0xA0D: eventOwner:say(quest, 31, 0)
pc016 0xA21: eventOwner:say(quest, 32, 0)
pc018 0xA29: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `31`: The south of Cedarwood. Gluttonous Gertrude. The south of Cedarwood. Gluttonous Gertrude. The south of Cedarwood. Gluttonous Gertrude.
- `32`: Perhaps some manner of mnemonic device would help? They often prove to be of use to the feeble of mind.

## processEvent000_1 (3 parameters; 0xADA; 15 instructions)

```text
pc003 0xAE6: eventOwner:startCliantTalkTurn(2, player)
pc006 0xAF2: eventOwner:_runCharaScheduler(70795264)
pc011 0xB06: eventOwner:say(quest, 18, 0)
pc013 0xB0E: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `18`: The south of Cedarwood? Aye, a great battle was fought there. Go. May Rhalgr guide you, [@IF($E9(4),sister,brother)].

## onJobQuestCompleteFirst (2 parameters; 0xBB6; 7 instructions)

```text
pc005 0xBCA: desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51124, 11000552)
return (no values)
```

## onJobQuestCompleteSecond (2 parameters; 0xC56; 6 instructions)

```text
pc004 0xC66: quest:showGetJobAbilityWidget(player, 27107, 1)
return (no values)
```

## onJobQuestCompleteThird (2 parameters; 0xCC5; 6 instructions)

```text
pc004 0xCD5: quest:showEventBeforeNpsLS(player, 1000101, 92)
return (no values)
```

## processEventChuui (3 parameters; 0xD31; 8 instructions)

```text
pc006 0xD49: worldMaster:say(worldMaster, 51131, 111222, 15)
return (no values)
```

## processEventChuui2 (3 parameters; 0xDAE; 8 instructions)

```text
pc006 0xDC6: worldMaster:say(worldMaster, 51132, 111222, 15)
return (no values)
```

