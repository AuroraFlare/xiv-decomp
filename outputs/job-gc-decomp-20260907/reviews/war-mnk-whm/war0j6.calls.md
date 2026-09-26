# 111206 war0j6: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x24F; 5 instructions)

```text
pc003 0x25B: quest:_loadTextDataPermanently(8212, "war0j6")
return (no values)
```

## processEventCURIOUS_GORGEHint (3 parameters; 0x2BE; 26 instructions)

```text
pc003 0x2CA: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2D6: eventOwner:_runCharaScheduler(354082816)
pc011 0x2EA: eventOwner:say(quest, 2, 0)
pc016 0x2FE: eventOwner:say(quest, 3, 0)
pc018 0x306: eventOwner:finishCliantTalkTurn()
pc024 0x31E: worldMaster:say(quest, 4, 0)
return (no values)
```

Quest-text references:

- `2`: It may be that the Soul of the Warrior spoke to you upon slaying Audhumbla, but that does not mean my ancestors have deemed you the worthier. Something is missing, and I shall not concede before uncovering the truth.
- `3`: Until then, the fifth piece remains here. Now leave me be.
- `4`: The next warrior quest will be available from Curious Gorge upon reaching level 50.

## processEventCURIOUS_GORGEStart (3 parameters; 0x3E0; 76 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x3EC: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3F8: eventOwner:_runCharaScheduler(353972224)
pc011 0x40C: eventOwner:say(quest, 5, 0)
pc016 0x420: eventOwner:say(quest, 6, 0)
pc019 0x42C: eventOwner:_runCharaScheduler(354086912)
pc024 0x440: eventOwner:say(quest, 7, 0)
pc029 0x454: eventOwner:say(quest, 8, 0)
pc032 0x460: eventOwner:_runCharaScheduler(353964032)
pc037 0x474: eventOwner:say(quest, 9, 0)
pc042 0x488: eventOwner:say(quest, 10, 0)
pc045 0x494: eventOwner:_runCharaScheduler(353959936)
pc050 0x4A8: eventOwner:say(quest, 11, 0)
pc052 0x4B0: quest:showQuestInfomation()
pc066 0x4E8: eventOwner:_runCharaScheduler(353984512)
pc071 0x4FC: eventOwner:say(quest, 12, 0)
pc073 0x504: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x3EC: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3F8: eventOwner:_runCharaScheduler(353972224)
pc011 0x40C: eventOwner:say(quest, 5, 0)
pc016 0x420: eventOwner:say(quest, 6, 0)
pc019 0x42C: eventOwner:_runCharaScheduler(354086912)
pc024 0x440: eventOwner:say(quest, 7, 0)
pc029 0x454: eventOwner:say(quest, 8, 0)
pc032 0x460: eventOwner:_runCharaScheduler(353964032)
pc037 0x474: eventOwner:say(quest, 9, 0)
pc042 0x488: eventOwner:say(quest, 10, 0)
pc045 0x494: eventOwner:_runCharaScheduler(353959936)
pc050 0x4A8: eventOwner:say(quest, 11, 0)
pc052 0x4B0: quest:showQuestInfomation()
pc057 0x4C4: eventOwner:_runCharaScheduler(353968128)
pc062 0x4D8: eventOwner:say(quest, 13, 0)
pc073 0x504: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `5`: [@SPLIT([@STRING($EB(1))], ,1)]! I know there is much we must discuss, but now might not be the best of times.
- `6`: Do you recall me mentioning that I had been involved in the hunt for a bloodthirsty creature that had been terrorizing the smallfolk? Well, I just received word from the Company of Heroes via linkpearl that the monster was sighted near the Silver Bazaar less than a bell past.
- `7`: What is more, according to those who managed to escape the carnage, the creature appeared more man than beast.
- `8`: If this is true, then our quarry could be far more dangerous than any wild animal. We must find a way to stop it... [@1A(1)]I[@1A(0)] must find a way.
- `9`: And by doing so, prove to the people of the Silver Bazaar─nay, to the world─that my tribe and my art have been wrongly judged!
- `10`: Perhaps [@1A(1)]then[@1A(0)] my ancestors will deem me worthy. I know my brother would... Yes, I am quite certain of that.
- `11`: There is no time to lose. We must arrive in the hamlet before the other mercenaries rob us of our chance to face this foe alone. Let us leave at once!
- `12`: You would forsake me and my people at the last? And this after I gave you so much? No, this cannot be your final answer.
- `13`: The journey has been long, but I finally feel we are nearing its end! When we slay the creature, all of Eorzea will be reminded of the true character of my people, and every nation will beg to learn the secrets of the warrior. Then the lies of the past will be buried and forgotten, and my ancestors will have no choice but to recognize the lone warrior who restored their name!

## processEventCURIOUS_GORGEFollow (3 parameters; 0x647; 20 instructions)

```text
pc003 0x653: eventOwner:startCliantTalkTurn(2, player)
pc006 0x65F: eventOwner:_runCharaScheduler(354066432)
pc011 0x673: eventOwner:say(quest, 14, 0)
pc016 0x687: eventOwner:say(quest, 15, 0)
pc018 0x68F: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `14`: Come, we must make haste. The creature will not remain in the Silver Bazaar for long, and this may be our only opportunity to subdue it.
- `15`: As for the armor...we can discuss that issue at another time. For now, let us call upon our inner beasts to grant us strength and courage in the coming battle. My ancestors shall decide the rest.

## processEvent010 (3 parameters; 0x740; 11 instructions)

```text
pc002 0x748: quest:startFadeOutCutSceneDefault(player)
pc006 0x758: quest:startNQCutScene("war0j610", 1)
pc009 0x764: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEventCURIOUS_GORGE010Follow (3 parameters; 0x801; 15 instructions)

```text
pc003 0x80D: eventOwner:startCliantTalkTurn(2, player)
pc006 0x819: eventOwner:_runCharaScheduler(354066432)
pc011 0x82D: eventOwner:say(quest, 39, 0)
pc013 0x835: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `39`: Ah, [@SPLIT([@STRING($EB(1))], ,1)]. I have something important to give you, but for obvious reasons could not leave it here...lest it tempt me as it did once before. Meet me at the Silver Bazaar, so that I may free myself of its burden.

## processEvent020 (3 parameters; 0x8DD; 11 instructions)

```text
pc002 0x8E5: quest:startFadeOutCutSceneDefault(player)
pc006 0x8F5: quest:startNQCutScene("war0j620", 1)
pc009 0x901: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEventClear (4 parameters; 0x99E; 24 instructions)

```text
pc004 0x9AE: desktopWidget:openPublicInformLongDialogWidget(quest, 42)
pc007 0x9BA: quest:_wait(8)
pc012 0x9CE: quest:showGetJobAbilityWidget(player, 27189, 1)
pc015 0x9DA: quest:_wait(6)
pc019 0x9EA: quest:showGetJobItemWidget(player, arg4)
pc022 0x9F6: quest:_wait(6)
return (no values)
```

Quest-text references:

- `42`: The warriors of ages past have borne witness to your new bond with Curious Gorge and now grant you their undying strength!

## processEventChuui (3 parameters; 0xACE; 8 instructions)

```text
pc006 0xAE6: worldMaster:say(worldMaster, 51131, 111206, 17)
return (no values)
```

## processEventChuui2 (3 parameters; 0xB4B; 8 instructions)

```text
pc006 0xB63: worldMaster:say(worldMaster, 51132, 111206, 17)
return (no values)
```

