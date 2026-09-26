# 111224 mnk0j4: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x264; 5 instructions)

```text
pc003 0x270: quest:_loadTextDataPermanently(8500, "mnk0j4")
return (no values)
```

## processEventERIKStart (4 parameters; 0x2D3; 204 instructions)

Variant 1: extras `[arg4]`, offer result `0`.

```text
pc003 0x2DF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2EB: eventOwner:_runCharaScheduler(354066432)
pc011 0x2FF: eventOwner:say(quest, 36, 0)
pc014 0x30B: eventOwner:_runCharaScheduler(70803456)
pc019 0x31F: eventOwner:say(quest, 8, 0)
pc022 0x32B: eventOwner:_runCharaScheduler(354099200)
pc027 0x33F: eventOwner:say(quest, 9, 0)
pc030 0x34B: quest:_wait(0.5)
pc034 0x35B: quest:startFadeOut(player, 1)
pc037 0x367: quest:_wait(2)
pc041 0x377: quest:startFadeIn(player, 1)
pc046 0x38B: eventOwner:say(quest, 10, 0)
pc049 0x397: eventOwner:_runCharaScheduler(354041856)
pc054 0x3AB: eventOwner:say(quest, 11, 0)
pc059 0x3BF: eventOwner:say(quest, 39, 0)
pc062 0x3CB: eventOwner:_runCharaScheduler(353968128)
pc067 0x3DF: eventOwner:say(quest, 40, 0)
pc072 0x3F3: eventOwner:say(quest, 41, 0)
pc075 0x3FF: eventOwner:_runCharaScheduler(70795264)
pc080 0x413: eventOwner:say(quest, 42, 0)
pc085 0x427: eventOwner:say(quest, 43, 0)
pc088 0x433: eventOwner:_runCharaScheduler(70815744)
pc091 0x43F: quest:_wait(1.5)
pc096 0x453: eventOwner:say(quest, 44, 0)
pc099 0x45F: eventOwner:_runCharaScheduler(353964032)
pc104 0x473: eventOwner:say(quest, 12, 0)
pc109 0x487: eventOwner:say(quest, 13, 0)
pc112 0x493: eventOwner:_runCharaScheduler(353980416)
pc117 0x4A7: eventOwner:say(quest, 45, 0)
pc122 0x4BB: eventOwner:say(quest, 14, 0)
pc127 0x4CF: eventOwner:say(quest, 46, 0)
pc130 0x4DB: quest:_wait(0.5)
pc133 0x4E7: eventOwner:_runCharaScheduler(354103296)
pc136 0x4F3: quest:_wait(0.5)
pc141 0x507: eventOwner:say(quest, 35, 0)
pc146 0x51B: eventOwner:say(quest, 47, 0)
pc149 0x527: quest:_wait(0.5)
pc152 0x533: eventOwner:_runCharaScheduler(70795264)
pc157 0x547: eventOwner:say(quest, 15, 0)
pc162 0x55B: eventOwner:say(quest, 48, 0)
pc165 0x567: eventOwner:_runCharaScheduler(70803456)
pc170 0x57B: eventOwner:say(quest, 49, 0)
pc172 0x583: quest:showQuestInfomation()
pc191 0x5CF: eventOwner:_runCharaScheduler(354066432)
pc194 0x5DB: quest:_wait(1)
pc199 0x5EF: eventOwner:say(quest, 16, 0)
pc201 0x5F7: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[arg4]`, offer result `1`.

```text
pc003 0x2DF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2EB: eventOwner:_runCharaScheduler(354066432)
pc011 0x2FF: eventOwner:say(quest, 36, 0)
pc014 0x30B: eventOwner:_runCharaScheduler(70803456)
pc019 0x31F: eventOwner:say(quest, 8, 0)
pc022 0x32B: eventOwner:_runCharaScheduler(354099200)
pc027 0x33F: eventOwner:say(quest, 9, 0)
pc030 0x34B: quest:_wait(0.5)
pc034 0x35B: quest:startFadeOut(player, 1)
pc037 0x367: quest:_wait(2)
pc041 0x377: quest:startFadeIn(player, 1)
pc046 0x38B: eventOwner:say(quest, 10, 0)
pc049 0x397: eventOwner:_runCharaScheduler(354041856)
pc054 0x3AB: eventOwner:say(quest, 11, 0)
pc059 0x3BF: eventOwner:say(quest, 39, 0)
pc062 0x3CB: eventOwner:_runCharaScheduler(353968128)
pc067 0x3DF: eventOwner:say(quest, 40, 0)
pc072 0x3F3: eventOwner:say(quest, 41, 0)
pc075 0x3FF: eventOwner:_runCharaScheduler(70795264)
pc080 0x413: eventOwner:say(quest, 42, 0)
pc085 0x427: eventOwner:say(quest, 43, 0)
pc088 0x433: eventOwner:_runCharaScheduler(70815744)
pc091 0x43F: quest:_wait(1.5)
pc096 0x453: eventOwner:say(quest, 44, 0)
pc099 0x45F: eventOwner:_runCharaScheduler(353964032)
pc104 0x473: eventOwner:say(quest, 12, 0)
pc109 0x487: eventOwner:say(quest, 13, 0)
pc112 0x493: eventOwner:_runCharaScheduler(353980416)
pc117 0x4A7: eventOwner:say(quest, 45, 0)
pc122 0x4BB: eventOwner:say(quest, 14, 0)
pc127 0x4CF: eventOwner:say(quest, 46, 0)
pc130 0x4DB: quest:_wait(0.5)
pc133 0x4E7: eventOwner:_runCharaScheduler(354103296)
pc136 0x4F3: quest:_wait(0.5)
pc141 0x507: eventOwner:say(quest, 35, 0)
pc146 0x51B: eventOwner:say(quest, 47, 0)
pc149 0x527: quest:_wait(0.5)
pc152 0x533: eventOwner:_runCharaScheduler(70795264)
pc157 0x547: eventOwner:say(quest, 15, 0)
pc162 0x55B: eventOwner:say(quest, 48, 0)
pc165 0x567: eventOwner:_runCharaScheduler(70803456)
pc170 0x57B: eventOwner:say(quest, 49, 0)
pc172 0x583: quest:showQuestInfomation()
pc177 0x597: eventOwner:_runCharaScheduler(353959936)
pc182 0x5AB: eventOwner:say(quest, 17, 0)
pc187 0x5BF: eventOwner:say(quest, 18, 0)
pc201 0x5F7: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `8`: Poring over the data, I finally arrived at a disheartening conclusion: the two of you took measurements of the same area!
- `9`: The values were near identical─equivalences mocking me as I struggled to reconcile them. I could neither sleep nor eat lest I waste time not drawing nearer the truth. And for what? Tell me. What is it you two were doing?
- `10`: Bah, not this bloody chakra nonsense again! How many times must I tell you? It is naught but imperceptible aether. Call it what it is!
- `11`: And to think I had a mind to put your names under mine when my hypothesis was published!
- `12`: In our talks together, the simpleton monk often spoke of the seventh chakra. Its awakening is thought to be the highest achievement among the monkhood. Aye, I make it a habit to know the tenets of my intellectual enemies.
- `13`: It was the flow of the aether within the two of you which betrayed your falsehood. The [@1A(1)]whispering of your chakra[@1A(0)], as I'm sure the monks would rush to call it.
- `14`: I can see by your vapid expression that you are missing my point. Allow me to spell it out─it follows that if one were to visit a battlefield with a certain aetherial wave amplitude and frequency, it would resonate with one's [@1A(1)]own[@1A(0)] aether!
- `15`: I forgive your past treachery, guide me as it did to this great discovery. That, and I need you to do more work for me. Here, take this [@SWITCH([@SHEET(itemData,11000555,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000555,1,1)][@EDGECOLOR($EC)][@COLOR($EC)].
- `16`: I am utterly speechless. You are ignorant, slothful, negligent, unambitious, and tiresome. I shall wait for you to swallow your pride and speak to me again.
- `17`: Right, then! I believe I shall send the simpleton monk to East End. This will ensure a bit of comparative experimentation, and prevent the two of you from taking your fists to one another's thick skulls.
- `18`: If you wish to find your way, consult a cartographer. If you wish to know anything of the history of East End, however, I would be happy to enlighten you.
- `35`: It stands to reason that for any aetherial wave, there may be a location that will resonate with it!
- `36`: You two played me for a fool. The data the simpleton monk brought me was absolutely [@1A(1)]astounding[@1A(0)]. Groundbreaking. Revolutionary. Yet I remained objective in my analysis, as a scholar must.
- `39`: This life force, this spiritual energy, this godsforsaken eternal soul essence─I care not what primitive nomenclature those backward monks wish to assign it. It is [@1A(1)]aether[@1A(0)], plain and simple!
- `40`: They claim they are able to manipulate and amplify it through discipline and the opening of the so-called chakra. False! This is nothing more than the aetherial regulation of organisms─a basic and natural concept. In an attempt to explain that which science does not yet fully understand, the monks have erected an institution of control.
- `41`: Their preachings are unassailable by design─for none can disprove the existence of the unknowable. They promise power in return for abjection and servitude. Control and power, indeed! Only that of man! It is the very essence of a religion, and should be treated with ridicule and contempt, as all religion should.
- `42`: Aether resides in all living things, as do natural mechanisms with the capacity to regulate it. This is simply life─not some mystical, supernatural endowment.
- `43`: I concede, of course, that the heightened mental faculties of man allow for the potential to gain conscious control over those mechanisms. Indeed, it would appear that you and the simpleton monk have already achieved that end.
- `44`: <sigh> The indiscretion and impertinence of youth... I suppose it can be forgiven─[@1A(1)]once[@1A(0)]. In my own youth, I was not the model of perfection you see before you. I too have made what some might call mistakes. Not myself, but some.
- `45`: But serendipity most often visits the industrious. Just so, it is precisely these aetherial [@1A(1)]whispers[@1A(0)] that proved to be most intriguing. The waves of these sounds resonated perfectly with the aether of the battleground!
- `46`: This is the phenomenon responsible for the initial [@1A(1)]opening[@1A(0)] of your own [@1A(1)]chakra[@1A(0)]. <sigh> I cannot believe I am being reduced to speaking in these terms.
- `47`: Think of the implications, [@SPLIT([@STRING($EB(1))], ,1)]. We can conclude from all of this that aetherial resonation is possible in [@1A(1)]any[@1A(0)] organism, at [@1A(1)]any[@1A(0)] level! Yes, yes, even that which the monks call the seventh chakra.
- `48`: Make for the area northwest of Camp Horizon. My research indicates it is a very promising tract indeed. Slay the basilisk there known as Apep and record for me the measurements within your own body.
- `49`: The beast is steeped in the aether of the land. Slay it to release that aether, and it may resonate with your own. I suppose in the primitive terms of the monkhood, that would translate to the expansion of your chakra.

## processEventERIKStart_1 (3 parameters; 0x82E; 21 instructions)

```text
pc003 0x83A: eventOwner:startCliantTalkTurn(2, player)
pc006 0x846: eventOwner:_runCharaScheduler(354103296)
pc011 0x85A: eventOwner:say(quest, 3, 0)
pc017 0x872: worldMaster:say(quest, 4, 0)
pc019 0x87A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: [@SPLIT([@STRING($EB(1))], ,1)]! The latest data is simply astounding! Would that you were intelligent enough to comprehend it! I am on the verge of a great discovery. I must not be bothered! Surely you can find some simple way to pass the time. Fighting, say? Or...I don't know─scratching?
- `4`: The next monk quest will be available from Erik upon reaching level 45.

## processEventWIDARGELTStart_1 (3 parameters; 0x93C; 20 instructions)

```text
pc003 0x948: eventOwner:startCliantTalkTurn(2, player)
pc006 0x954: eventOwner:_runCharaScheduler(70795264)
pc011 0x968: eventOwner:say(quest, 2, 0)
pc016 0x97C: eventOwner:say(quest, 38, 0)
pc018 0x984: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Garlemald's advance does not stop. They now threaten Gridania. Ul'dah. Limsa Lominsa. This I know.
- `38`: Yet few lend us strength. The resistance has few allies. My comrades and I are patient. But our patience wears thin.

## processEvent000 (3 parameters; 0xA2C; 25 instructions)

```text
pc003 0xA38: eventOwner:startCliantTalkTurn(2, player)
pc008 0xA4C: eventOwner:say(quest, 33, 0)
pc011 0xA58: eventOwner:_runCharaScheduler(354000896)
pc016 0xA6C: eventOwner:say(quest, 34, 0)
pc021 0xA80: eventOwner:say(quest, 51, 0)
pc023 0xA88: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `33`: The most cherished of the monkhood's beliefs is that of the seventh chakra. It is their ultimate purpose. According to my theory, there may be a land which resonates with that inner aether and amplifies it to greater heights!
- `34`: What are you doing idling about!? Have you not a [@1A(1)]shred[@1A(0)] of intellectual curiosity!? Hasten to the area northwest of Camp Horizon.
- `51`: You need do nothing more than slay the basilisk the smallfolk have dubbed Apep. Reckless, wanton killing without the slightest thought or regard. This task is [@1A(1)]perfect[@1A(0)] for you!

## processEvent000_1 (3 parameters; 0xB42; 20 instructions)

```text
pc003 0xB4E: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB5A: eventOwner:_runCharaScheduler(70881280)
pc011 0xB6E: eventOwner:say(quest, 19, 0)
pc016 0xB82: eventOwner:say(quest, 50, 0)
pc018 0xB8A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `19`: The teacher has spoken. I travel for the Black Shroud's East End. East of even the sylph lands. Great danger lurks there.
- `50`: I will not attempt to deceive you again. There is no longer any need.

## onJobQuestCompleteFirst (2 parameters; 0xC3B; 7 instructions)

```text
pc005 0xC4F: desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51125, 11000555)
return (no values)
```

## onJobQuestCompleteSecond (2 parameters; 0xCDB; 6 instructions)

```text
pc004 0xCEB: quest:showGetJobAbilityWidget(player, 27118, 3)
return (no values)
```

## onJobQuestCompleteThird (2 parameters; 0xD4A; 6 instructions)

```text
pc004 0xD5A: quest:showEventBeforeNpsLS(player, 2200241, 93)
return (no values)
```

## processEventChuui (3 parameters; 0xDB6; 8 instructions)

```text
pc006 0xDCE: worldMaster:say(worldMaster, 51131, 111224, 15)
return (no values)
```

## processEventChuui2 (3 parameters; 0xE33; 8 instructions)

```text
pc006 0xE4B: worldMaster:say(worldMaster, 51132, 111224, 15)
return (no values)
```

