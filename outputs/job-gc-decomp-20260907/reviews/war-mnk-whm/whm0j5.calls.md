# 111245 whm0j5: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x2DF; 5 instructions)

```text
pc003 0x2EB: quest:_loadTextDataPermanently(9796, "whm0j5")
return (no values)
```

## processEvent_OTOMO_A_before (3 parameters; 0x34E; 15 instructions)

```text
pc003 0x35A: eventOwner:startCliantTalkTurn(2, player)
pc006 0x366: eventOwner:_runCharaScheduler(70017024)
pc011 0x37A: eventOwner:say(quest, 2, 0)
pc013 0x382: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Oha[@1F]Sok has been silent of late...but the unease of her kindred is ever present, kupo.

## processEvent_OTOMO_B_before (3 parameters; 0x421; 15 instructions)

```text
pc003 0x42D: eventOwner:startCliantTalkTurn(2, player)
pc006 0x439: eventOwner:_runCharaScheduler(70021120)
pc011 0x44D: eventOwner:say(quest, 3, 0)
pc013 0x455: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: No doubt you already know, but your newest spell is kupositively [@1A(1)]awesome[@1A(0)]! One would never suspect that white magic had such an exhilarating application, kupo!

## processEvent_RAYA_offer (3 parameters; 0x4FD; 204 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x509: eventOwner:startCliantTalkTurn(2, player)
pc006 0x515: eventOwner:_runCharaScheduler(79577088)
pc011 0x529: eventOwner:say(quest, 4, 0)
pc016 0x53D: eventOwner:say(quest, 5, 0)
pc021 0x551: eventOwner:say(quest, 26, 0)
pc024 0x55D: eventOwner:_runCharaScheduler(364752896)
pc029 0x571: eventOwner:say(quest, 27, 0)
pc034 0x585: eventOwner:say(quest, 28, 0)
pc039 0x599: eventOwner:say(quest, 29, 0)
pc042 0x5A5: eventOwner:_runCharaScheduler(364756992)
pc047 0x5B9: eventOwner:say(quest, 30, 0)
pc052 0x5CD: eventOwner:say(quest, 31, 0)
pc057 0x5E1: eventOwner:say(quest, 32, 0)
pc060 0x5ED: eventOwner:_runCharaScheduler(79577088)
pc065 0x601: eventOwner:say(quest, 33, 0)
pc070 0x615: eventOwner:say(quest, 6, 0)
pc075 0x629: eventOwner:say(quest, 18, 0)
pc078 0x635: eventOwner:_runCharaScheduler(364761088)
pc083 0x649: eventOwner:say(quest, 23, 0)
pc088 0x65D: eventOwner:say(quest, 7, 0)
pc093 0x671: eventOwner:say(quest, 8, 0)
pc096 0x67D: eventOwner:_runCharaScheduler(79593472)
pc101 0x691: eventOwner:say(quest, 9, 0)
pc106 0x6A5: eventOwner:say(quest, 10, 0)
pc111 0x6B9: eventOwner:say(quest, 34, 0)
pc114 0x6C5: eventOwner:_runCharaScheduler(364748800)
pc119 0x6D9: eventOwner:say(quest, 35, 0)
pc124 0x6ED: eventOwner:say(quest, 36, 0)
pc129 0x701: eventOwner:say(quest, 37, 0)
pc132 0x70D: eventOwner:_runCharaScheduler(364752896)
pc137 0x721: eventOwner:say(quest, 11, 0)
pc139 0x729: quest:showQuestInfomation()
pc194 0x805: eventOwner:_runCharaScheduler(79589376)
pc199 0x819: eventOwner:say(quest, 13, 0)
pc201 0x821: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x509: eventOwner:startCliantTalkTurn(2, player)
pc006 0x515: eventOwner:_runCharaScheduler(79577088)
pc011 0x529: eventOwner:say(quest, 4, 0)
pc016 0x53D: eventOwner:say(quest, 5, 0)
pc021 0x551: eventOwner:say(quest, 26, 0)
pc024 0x55D: eventOwner:_runCharaScheduler(364752896)
pc029 0x571: eventOwner:say(quest, 27, 0)
pc034 0x585: eventOwner:say(quest, 28, 0)
pc039 0x599: eventOwner:say(quest, 29, 0)
pc042 0x5A5: eventOwner:_runCharaScheduler(364756992)
pc047 0x5B9: eventOwner:say(quest, 30, 0)
pc052 0x5CD: eventOwner:say(quest, 31, 0)
pc057 0x5E1: eventOwner:say(quest, 32, 0)
pc060 0x5ED: eventOwner:_runCharaScheduler(79577088)
pc065 0x601: eventOwner:say(quest, 33, 0)
pc070 0x615: eventOwner:say(quest, 6, 0)
pc075 0x629: eventOwner:say(quest, 18, 0)
pc078 0x635: eventOwner:_runCharaScheduler(364761088)
pc083 0x649: eventOwner:say(quest, 23, 0)
pc088 0x65D: eventOwner:say(quest, 7, 0)
pc093 0x671: eventOwner:say(quest, 8, 0)
pc096 0x67D: eventOwner:_runCharaScheduler(79593472)
pc101 0x691: eventOwner:say(quest, 9, 0)
pc106 0x6A5: eventOwner:say(quest, 10, 0)
pc111 0x6B9: eventOwner:say(quest, 34, 0)
pc114 0x6C5: eventOwner:_runCharaScheduler(364748800)
pc119 0x6D9: eventOwner:say(quest, 35, 0)
pc124 0x6ED: eventOwner:say(quest, 36, 0)
pc129 0x701: eventOwner:say(quest, 37, 0)
pc132 0x70D: eventOwner:_runCharaScheduler(364752896)
pc137 0x721: eventOwner:say(quest, 11, 0)
pc139 0x729: quest:showQuestInfomation()
pc144 0x73D: eventOwner:_runCharaScheduler(364765184)
pc149 0x751: eventOwner:say(quest, 14, 0)
pc154 0x765: eventOwner:say(quest, 24, 0)
pc157 0x771: eventOwner:_runCharaScheduler(364756992)
pc162 0x785: eventOwner:say(quest, 38, 0)
pc167 0x799: eventOwner:say(quest, 39, 0)
pc172 0x7AD: eventOwner:say(quest, 40, 0)
pc175 0x7B9: eventOwner:_runCharaScheduler(79597568)
pc180 0x7CD: eventOwner:say(quest, 41, 0)
pc185 0x7E1: eventOwner:say(quest, 42, 0)
pc190 0x7F5: eventOwner:say(quest, 43, 0)
pc201 0x821: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `4`: I have spoken with both the elementals and the moogles. Regrettably, none possess knowledge of how to stop the elemental of nihility. But fret not, for there is a course of action available to us still.
- `5`: The Wood Wailers have sent word regarding Rowland of the Ninety-Nine Blades, the bandit whom you liberated from the elementals' influence. Upon regaining lucidity, the man revealed that he had been hearing voices.
- `6`: As I related to you before, it is by her keening that the elemental of nihility unleashes cataclysm.
- `7`: As you well know, however, ordinary means serve not to restore enraged elementals to calm, less so those who derive their rage from Oha[@1F]Sok.
- `8`: In order to save Eorzea, we must avail ourselves of greater power─we must avail ourselves of the garb of succor, the legendary artifacts worn by the white mages of old.
- `9`: Ancient chronicles hold that the garb is imbued with the light of succor, and is bestowed only upon those deemed true servants of the forest.
- `10`: The garb comprises five artifacts, each of which heightens the wearer's affinity with the elementals.
- `11`: This undertaking will sorely test your faculties as a white mage, yet our need is dire. There is no time to waste─you must depart as soon as you are able.
- `13`: You would forsake Eorzea in her hour of need? Mayhap mankind does not deserve a second chance after all...
- `14`: I knew you would not disappoint me, [@SPLIT([@STRING($EB(1))], ,1)].
- `18`: Oha[@1F]Sok sits in forbearance of her final judgment and is silent for the moment. Nevertheless, her presence alone is enough to impel her kind to sustain their keening indefinitely.
- `23`: In turn, that keening serves to fuel the wrath of Oha[@1F]Sok's existence. And so shall the cycle continue until water and wood swallows all. We must pacify the elementals if this vicious circle is to be broken.
- `24`: Now, heed me well, for I shall make known to you the whereabouts of the artifacts.
- `26`: “Show unto me the face of the sixth sun, that I might weigh the deeds of her children.”[@CR]...Apparently, this phrase echoed in his mind without cease.
- `27`: Now, this is merely conjecture, but I believe Oha[@1F]Sok was attempting to observe mankind through others of her kind.
- `28`: Alas, it would seem that those elementals who took possession of folk at her bidding ended up being affected by her inherent wrath. And in their turn, they poisoned the minds of their hosts, who were driven to acts of violence.
- `29`: If this conjecture holds true, it would go far towards explaining why Oha[@1F]Sok chose to reside within [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)].
- `30`: After she merged with the staff, she had creatures of the Twelveswood steal it in hopes that it would find its way into the hands of the common man. Thence she would be able to observe the children of the sixth sun.
- `31`: By sheer coincidence, however, [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)] came to be in our possession.
- `32`: Knowing that we Padjal can readily sense elementals, Oha[@1F]Sok doubtless panicked when you brought the staff to me. And so she burst out as she did and told us an untruth.
- `33`: This reaffirms my belief that Oha[@1F]Sok has not despaired of us─that she is willing to give mankind a second chance. Yet, comforting though this knowledge may be, I fear the fate of Eorzea hangs in the balance still.
- `34`: There exist accounts of white mages who successfully entreated elementals to render their essence unto the garb as a show of ultimate favor.
- `35`: Were we to emulate this feat, I believe it would be of great benefit to our mission.
- `36`: But first things first. [@SPLIT([@STRING($EB(1))], ,1)], I would have you journey forth to claim the garb of succor.
- `37`: The artifacts are sealed away in different corners of Eorzea, and were thought to have been long lost. But with the moogles' help, I was able to ascertain their whereabouts.
- `38`: The first rests within Dzemael Darkhold, southwest of Camp Dragonhead in the central highlands of Coerthas. The second can be found in Zahar'ak, east of Camp Broken Water in southern Thanalan.
- `39`: Turning Leaf, south of Camp Crimson Bark in the West Shroud, is where you shall find the third. And the fourth piece awaits on Tiger Helm Island, southwest of Camp Bloodshore in eastern La Noscea.
- `40`: Each is sealed within an enchanted chest that can be perceived only by a worthy white mage. There is no doubt in my mind that you are such.
- `41`: Should you need to review your destinations, I shall mark them on your map of Eorzea.
- `42`: ...Hm? Puzzlement is writ plain upon your face, [@SPLIT([@STRING($EB(1))], ,1)]. You wonder about the fifth artifact, I shouldn't doubt.
- `43`: Despite our best efforts, the location of the final piece eludes us still. Rest assured, however, that the moogles and I shall dedicate ourselves wholly to this endeavor. I hope to have good tidings to share upon your return.

## processEvent_OTOMO_A_follow (3 parameters; 0xA45; 15 instructions)

```text
pc003 0xA51: eventOwner:startCliantTalkTurn(2, player)
pc006 0xA5D: eventOwner:_runCharaScheduler(70017024)
pc011 0xA71: eventOwner:say(quest, 15, 0)
pc013 0xA79: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `15`: The chieftain once told us that the elemental of nihility mourns her very own existence. I couldn't live with myself if I were her, kupo...

## processEvent_OTOMO_B_follow (3 parameters; 0xB21; 15 instructions)

```text
pc003 0xB2D: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB39: eventOwner:_runCharaScheduler(70021120)
pc011 0xB4D: eventOwner:say(quest, 16, 0)
pc013 0xB55: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `16`: Kupopo!? You're out to find the legendary garb of succor!? Why, should you succeed, that would make [@1A(1)]you[@1A(0)] legendary by association, kupo![@CR]...Hmmm, would that association extend to me as well?

## processEvent_RAYA_O_follow (3 parameters; 0xBFD; 30 instructions)

```text
pc002 0xC05: eventOwner:_runCharaScheduler(79577088)
pc007 0xC19: eventOwner:say(quest, 17, 0)
pc012 0xC2D: eventOwner:say(quest, 44, 0)
pc017 0xC41: eventOwner:say(quest, 21, 0)
pc021 0xC51: eventOwner:startCliantTalkTurn(2, player)
pc026 0xC65: eventOwner:say(quest, 22, 0)
pc028 0xC6D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `17`: Dzemael Darkhold, southwest of Camp Dragon Head in the central highlands of Coerthas. Zahar'ak, east of Camp Broken Water in southern Thanalan.
- `21`: These are the four known locations of the garb of succor. Each artifact is sealed within an enchanted chest that can be perceived by none but a worthy white mage.
- `22`: While you are afield, the moogles and I shall dedicate ourselves to tracking down the fifth and final piece. I hope to have good tidings to share upon your return.
- `44`: Turning Leaf, south of Camp Crimson Bark in the West Shroud. And Tiger Helm Island, southwest of Camp Bloodshore in eastern La Noscea.

## processEvent_getAF_info (4 parameters; 0xD30; 17 instructions)

```text
pc004 0xD40: desktopWidget:openPublicInformLongDialogWidget(quest, 25)
pc007 0xD4C: quest:_wait(8)
pc010 0xD58: eventOwner:_runCharaScheduler(67108910)
pc015 0xD6C: quest:showGetJobItemWidget(player, arg4, 0)
return (no values)
```

Quest-text references:

- `25`: You obtain an artifact of succor!

## processEvent_OTOMO_A_cfollow (3 parameters; 0xE36; 15 instructions)

```text
pc003 0xE42: eventOwner:startCliantTalkTurn(2, player)
pc006 0xE4E: eventOwner:_runCharaScheduler(70017024)
pc011 0xE62: eventOwner:say(quest, 45, 0)
pc013 0xE6A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `45`: Raya[@1F]O is cross about how long it's taken you to return─and that makes [@1A(1)]me[@1A(0)] cross as well! Hmph, kupo! Hmph!

## processEvent_OTOMO_B_cfollow (3 parameters; 0xF12; 15 instructions)

```text
pc003 0xF1E: eventOwner:startCliantTalkTurn(2, player)
pc006 0xF2A: eventOwner:_runCharaScheduler(70021120)
pc011 0xF3E: eventOwner:say(quest, 46, 0)
pc013 0xF46: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `46`: Kupopo!? You've found the garb of succor!? Why, that makes you a legendary adventurer, kupo! And me, a legendary...um, adventurer's acquaintance?

## processEvent_RAYA_O_clear (3 parameters; 0xFEE; 49 instructions)

```text
pc003 0xFFA: eventOwner:startCliantTalkTurn(2, player)
pc008 0x100E: eventOwner:say(quest, 47, 0)
pc013 0x1022: eventOwner:say(quest, 48, 0)
pc016 0x102E: eventOwner:_runCharaScheduler(79577088)
pc021 0x1042: eventOwner:say(quest, 49, 0)
pc026 0x1056: eventOwner:say(quest, 50, 0)
pc031 0x106A: eventOwner:say(quest, 51, 0)
pc034 0x1076: eventOwner:_runCharaScheduler(364756992)
pc039 0x108A: eventOwner:say(quest, 52, 0)
pc045 0x10A2: worldMaster:say(quest, 53, 0)
pc047 0x10AA: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `47`: So these are the artifacts... They are indeed aglow with the light of succor. You are to be commended, [@SPLIT([@STRING($EB(1))], ,1)].
- `48`: Would that I could say my mission was an equal success. I fear I owe you an apology.
- `49`: I was unable to ascertain the location of the fifth piece. I have set the archivists of Stillglade Fane to scouring our library, but naught has come of their efforts thus far.
- `50`: For a blessing, the keening of the elementals has yet to reach such an intensity as would be cause for alarm. There is time still.
- `51`: I promise not to rest until the whereabouts of the final artifact are known to us.
- `52`: In the meantime, I would have you apply yourself to honing your abilities. You serve Eorzea and the elementals best by realizing your potential as a white mage.
- `53`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 50.

## processEventChuui (3 parameters; 0x11A2; 8 instructions)

```text
pc006 0x11BA: worldMaster:say(worldMaster, 51131, 111245, 27)
return (no values)
```

## processEventChuui2 (3 parameters; 0x121F; 8 instructions)

```text
pc006 0x1237: worldMaster:say(worldMaster, 51132, 111245, 27)
return (no values)
```

