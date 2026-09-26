# 111242 whm0j2: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x2FB; 5 instructions)

```text
pc003 0x307: quest:_loadTextDataPermanently(9748, "whm0j2")
return (no values)
```

## processEventRAYAOSENNAStart (3 parameters; 0x36A; 107 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x376: eventOwner:startCliantTalkTurn(2, player)
pc006 0x382: quest:startFadeOutCutSceneDefault(player)
pc010 0x392: quest:startNQCutScene("whm0j210", 1)
pc013 0x39E: quest:startFadeInCutSceneDefault(player)
pc016 0x3AA: eventOwner:_runCharaScheduler(70815744)
pc019 0x3B6: quest:_wait(1)
pc024 0x3CA: eventOwner:say(quest, 9, 0)
pc028 0x3DA: eventOwner:startCliantTalkTurn(2, player)
pc033 0x3EE: eventOwner:say(quest, 34, 0)
pc036 0x3FA: eventOwner:_runCharaScheduler(353959936)
pc041 0x40E: eventOwner:say(quest, 35, 0)
pc044 0x41A: eventOwner:_runCharaScheduler(364756992)
pc049 0x42E: eventOwner:say(quest, 36, 0)
pc054 0x442: eventOwner:say(quest, 37, 0)
pc057 0x44E: eventOwner:_runCharaScheduler(353964032)
pc062 0x462: eventOwner:say(quest, 10, 0)
pc067 0x476: eventOwner:say(quest, 38, 0)
pc070 0x482: eventOwner:_runCharaScheduler(79593472)
pc075 0x496: eventOwner:say(quest, 11, 0)
pc077 0x49E: quest:showQuestInfomation()
pc094 0x4E2: eventOwner:_runCharaScheduler(79577088)
pc097 0x4EE: quest:_wait(1)
pc102 0x502: eventOwner:say(quest, 13, 0)
pc104 0x50A: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x376: eventOwner:startCliantTalkTurn(2, player)
pc006 0x382: quest:startFadeOutCutSceneDefault(player)
pc010 0x392: quest:startNQCutScene("whm0j210", 1)
pc013 0x39E: quest:startFadeInCutSceneDefault(player)
pc016 0x3AA: eventOwner:_runCharaScheduler(70815744)
pc019 0x3B6: quest:_wait(1)
pc024 0x3CA: eventOwner:say(quest, 9, 0)
pc028 0x3DA: eventOwner:startCliantTalkTurn(2, player)
pc033 0x3EE: eventOwner:say(quest, 34, 0)
pc036 0x3FA: eventOwner:_runCharaScheduler(353959936)
pc041 0x40E: eventOwner:say(quest, 35, 0)
pc044 0x41A: eventOwner:_runCharaScheduler(364756992)
pc049 0x42E: eventOwner:say(quest, 36, 0)
pc054 0x442: eventOwner:say(quest, 37, 0)
pc057 0x44E: eventOwner:_runCharaScheduler(353964032)
pc062 0x462: eventOwner:say(quest, 10, 0)
pc067 0x476: eventOwner:say(quest, 38, 0)
pc070 0x482: eventOwner:_runCharaScheduler(79593472)
pc075 0x496: eventOwner:say(quest, 11, 0)
pc077 0x49E: quest:showQuestInfomation()
pc082 0x4B2: eventOwner:_runCharaScheduler(70795264)
pc085 0x4BE: quest:_wait(1)
pc090 0x4D2: eventOwner:say(quest, 14, 0)
pc104 0x50A: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `9`: ...But then again, what else is there to say but “I know”?
- `10`: A lone sheep has reportedly grown unnaturally savage southwest of Camp Glory. I sense the shadow of an elemental behind this sudden change.
- `11`: Once you have accomplished the task, pray return hither and report to me all that transpired.
- `13`: A disappointing reply. Be fairly warned, [@SPLIT([@STRING($EB(1))], ,1)]: forsake the forest, and one day it will forsake you.
- `14`: By her parting words, I suspect that Oha[@1F]Sok intends to keep an eye on you. But as to what end, I cannot say. Go now, [@SPLIT([@STRING($EB(1))], ,1)], and see to Downy Dunstan. I shall await your return.
- `34`: <sigh> I am sorry you had to witness that exchange. Truth be told, we have spoken of little else in your absence.
- `35`: Oha[@1F]Sok is clearly ill at ease, and whatever has engendered her disquiet is doubtless also affecting her kindred. I cannot help but think that this is connected to the unruly behavior of the elementals of whom I spoke before.
- `36`: I find myself more determined than ever to get to the bottom of this. And I shall, with your help.
- `37`: I have received intelligence from the Order of the Twin Adder concerning possible rogue elemental activity.
- `38`: The sheep in question is known to the locals as Downy Dunstan. I would have you seek out the creature and subdue it using white magic.

## processEventRAYAOSENNAStart_1 (3 parameters; 0x6CE; 21 instructions)

```text
pc003 0x6DA: eventOwner:startCliantTalkTurn(2, player)
pc006 0x6E6: eventOwner:_runCharaScheduler(354082816)
pc011 0x6FA: eventOwner:say(quest, 3, 0)
pc017 0x712: worldMaster:say(quest, 4, 0)
pc019 0x71A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: I would have you journey forth to quell the fury of rogue elementals in my stead. Alas, I fear the task is yet beyond your capacity. You must grow stronger if you are to have any chance of completing such an onerous undertaking.
- `4`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 35.

## processEventMOOGLEAStart_1 (3 parameters; 0x7DC; 15 instructions)

```text
pc003 0x7E8: eventOwner:startCliantTalkTurn(2, player)
pc006 0x7F4: eventOwner:_runCharaScheduler(70078464)
pc011 0x808: eventOwner:say(quest, 1, 0)
pc013 0x810: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `1`: Thank you for your help, adventurer. Only the gods know what might've happened had you not come along when you did. I hope we can keep relying on you, kupo.

## processEventMOOGLEBStart_1 (3 parameters; 0x8B8; 15 instructions)

```text
pc003 0x8C4: eventOwner:startCliantTalkTurn(2, player)
pc006 0x8D0: eventOwner:_runCharaScheduler(70057984)
pc011 0x8E4: eventOwner:say(quest, 2, 0)
pc013 0x8EC: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: “Pacify”? Raya[@1F]O fairly [@1A(1)]trounced[@1A(0)] that poor elemental! Methinks the lass would benefit from a dose of delicacy, kupo...

## processEvent000 (3 parameters; 0x98B; 18 instructions)

```text
pc003 0x997: eventOwner:startCliantTalkTurn(2, player)
pc006 0x9A3: eventOwner:_runCharaScheduler(354004992)
pc009 0x9AF: quest:_wait(1)
pc014 0x9C3: eventOwner:say(quest, 17, 0)
pc016 0x9CB: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `17`: I would have you seek out the sheep known as Downy Dunstan and subdue it using white magic. Pray return hither once the task is accomplished.

## processEvent000_1 (3 parameters; 0xA87; 18 instructions)

```text
pc003 0xA93: eventOwner:startCliantTalkTurn(2, player)
pc006 0xA9F: eventOwner:_runCharaScheduler(70098944)
pc009 0xAAB: quest:_wait(1)
pc014 0xABF: eventOwner:say(quest, 15, 0)
pc016 0xAC7: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `15`: Moogles are very sensitive to the emotions of elementals, kupo. We don't just [@1A(1)]know[@1A(0)] what they're feeling─we actually [@1A(1)]feel[@1A(0)] it. So if we meet an elemental which happens to have inhabited a moody aldgoat, it's all we can do not to bleat!

## processEvent000_2 (3 parameters; 0xB83; 15 instructions)

```text
pc003 0xB8F: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB9B: eventOwner:_runCharaScheduler(70189056)
pc011 0xBAF: eventOwner:say(quest, 16, 0)
pc013 0xBB7: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `16`: Raya[@1F]O is behaving rather responsibly, isn't she? I-I'm not complaining or anything! I just hope it isn't the calm before the storm, kupo!

## processEvent005 (3 parameters; 0xC5F; 99 instructions)

```text
pc003 0xC6B: eventOwner:startCliantTalkTurn(2, player)
pc006 0xC77: eventOwner:_runCharaScheduler(79597568)
pc011 0xC8B: eventOwner:say(quest, 39, 0)
pc014 0xC97: eventOwner:_waitForCharaSchedulerFinished(79597568)
pc017 0xCA3: eventOwner:_runCharaScheduler(353959936)
pc022 0xCB7: eventOwner:say(quest, 40, 0)
pc027 0xCCB: eventOwner:say(quest, 41, 0)
pc030 0xCD7: player:_runCharaScheduler(67108919)
pc033 0xCE3: quest:_wait(3)
pc038 0xCF7: quest:sayFreeDisplayName(2600009, quest, 42)
pc043 0xD0B: quest:sayFreeDisplayName(2600009, quest, 43)
pc046 0xD17: quest:_wait(1)
pc049 0xD23: eventOwner:_runCharaScheduler(354041856)
pc054 0xD37: eventOwner:say(quest, 44, 0)
pc057 0xD43: eventOwner:_waitForCharaSchedulerFinished(354041856)
pc060 0xD4F: eventOwner:_runCharaScheduler(354004992)
pc065 0xD63: eventOwner:say(quest, 45, 0)
pc070 0xD77: desktopWidget:openPublicInformLongDialogWidget(quest, 52)
pc073 0xD83: quest:_wait(8)
pc078 0xD97: quest:showGetJobAbilityWidget(player, 27358, 2)
pc081 0xDA3: quest:_wait(6)
pc084 0xDAF: eventOwner:_runCharaScheduler(354082816)
pc089 0xDC3: eventOwner:say(quest, 46, 0)
pc095 0xDDB: worldMaster:say(quest, 47, 0)
pc097 0xDE3: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `39`: Ah, finally! What in the Matron's name kept you, [@SPLIT([@STRING($EB(1))], ,1)]? I have a mind to instill in you the virtues of punctuality, but I'm afraid that must wait. We have graver issues to address.
- `40`: As per my request, you went and subdued Downy Dunstan. Alas, I regret to say that it failed to produce the anticipated result. I can discern no change in the humours of the elementals─their collective sense of disquiet remains as it was before. Could we have been mistaken?
- `41`: Oha[@1F]Sok, is there aught you can tell us?
- `42`: [@1A(1)]I cannot speak for my kindred.[@1A(0)]
- `43`: [@1A(1)]I only know that this child of man met anger with force.[@1A(0)]
- `44`: <sigh> She does make this needlessly difficult. But whatever Oha[@1F]Sok may say, you have performed your duty admirably, and for that my gratitude is yours.
- `45`: Attend me, [@SPLIT([@STRING($EB(1))], ,1)]. By the power vested in me, I hereby permit you the use of new white magic. Consider this a token of my faith in you.
- `46`: I shall have need of your assistance again before long. Till then, I ask that you devote yourself to the mastery of white magic. When next we meet, I expect you to have made considerable headway.
- `47`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 40.
- `52`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!

## processEvent005_1 (3 parameters; 0xFED; 18 instructions)

```text
pc003 0xFF9: eventOwner:startCliantTalkTurn(2, player)
pc006 0x1005: eventOwner:_runCharaScheduler(70098944)
pc009 0x1011: quest:_wait(1)
pc014 0x1025: eventOwner:say(quest, 49, 0)
pc016 0x102D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `49`: Welcome back, kupo! Raya[@1F]O has been most anxious for your safe return!

## processEvent005_2 (3 parameters; 0x10E9; 18 instructions)

```text
pc003 0x10F5: eventOwner:startCliantTalkTurn(2, player)
pc006 0x1101: eventOwner:_runCharaScheduler(70189056)
pc009 0x110D: quest:_wait(1)
pc014 0x1121: eventOwner:say(quest, 50, 0)
pc016 0x1129: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `50`: This is just between you and me, but Raya[@1F]O is─ Erm, actually...never mind, kupo.

## onJobQuestCompleteFirst (2 parameters; 0x11E5; 6 instructions)

```text
pc004 0x11F5: desktopWidget:openPublicInformDialogWidget(quest, 52)
return (no values)
```

Quest-text references:

- `52`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!

## onJobQuestCompleteSecond (2 parameters; 0x1263; 6 instructions)

```text
pc004 0x1273: quest:showGetJobAbilityWidget(player, 27358, 2)
return (no values)
```

## processEventChuui (3 parameters; 0x12D2; 8 instructions)

```text
pc006 0x12EA: worldMaster:say(worldMaster, 51131, 111242, 27)
return (no values)
```

## processEventChuui2 (3 parameters; 0x134F; 8 instructions)

```text
pc006 0x1367: worldMaster:say(worldMaster, 51132, 111242, 27)
return (no values)
```

