# Quest 110014 (man206.lua)
Source: FF14-Memory/Data/scripts/quests/man/man206.lua (738 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0;
SEQ_005 = 5;		-- Meet with Minfilia at Waking Sands						[@SHEET(xtx/journalxtxWil,246,1)]			"A party of sylphs has snuck its way into the Waking Sands and is pleading for help, claiming that their home, Moonspore Grove, is being invaded by imperial soldiers from Garlemald. Lady Minfilia has asked that you head to the Black Shroud to investigate, just do not forget to contact your Path companion before you begin your journey."
SEQ_010 = 10;		-- Travel to Gridania and Meet Path Companion				[@SHEET(xtx/journalxtxWil,247,1)]			"You agree to meet your Path companion in Gridania before continuing on to Moonspore Grove. Travel to the Aetheryte Plaza in the forest city[@1F]state and wait for your colleague's arrival."
SEQ_015 = 15;		-- Rendezvous at Camp Nine Ivies							[@SHEET(xtx/journalxtxWil,248,1)]			"Your Path companion has learned that the location of Moonspore Grove is somewhere to the northeast of Nine Ivies. Once you have made your preparations, travel to the area's camp and rendezvous with your partner so that you may search for the Grove together."
SEQ_020 = 20;		-- Search toward Moonspore Grove							[@SHEET(xtx/journalxtxWil,204,1)]			"When you arrive in Camp Nine Ivies, you are greeted by several frenetic sylphs claiming that imperial soldiers have already found Moonspore Grove, and it is only a matter of time before they discover the sylph children, known as podlings, who remain hidden in the forest haven. Head north with your companion through the forest to Moonspore Grove while trying to avoid imperial sentinels wandering the area."
SEQ_025 = 25;		-- Return the podling to Flaxio								[@SHEET(xtx/journalxtxWil,205,1)]			"You have been entrusted with a podling, and now must spirit it out of the Grove back to Camp Nine Ivies, taking extra care to see that it remains undamaged. Avoid all contact with imperial soldiers if possible, running in the event you are sighted."
SEQ_030 = 30;		-- Return to the Waking Sands								[@SHEET(xtx/journalxtxWil,206,1)]			"You succeed in delivering the podling cradle to the sylphs waiting in Camp Nine Ivies. According to the survivors, not all the podlings were saved from the Empire; this, however, shall not deter the sylphs from remaining in the one place they call home.[@CR] [@CR]ã€€As it seems reinforcements have arrived, you may now return to the Waking Sands and report to Lady Minfilia your findings."
```

## NPCs/Actors
```
TATARU					= 1001046;
MINFILIA				= 1000843;
MOMODI					= 1000841;
MARKET_ENTRANCE			= 1090265;
EVENT_DOOR_EXIT			= 1090160;
EVENT_DOOR_OFFICE_W		= 1090161;
EVENT_DOOR_OFFICE_E		= 1090162;
SAHJA_ZHWAN				= 1001373;
NENEKANI				= 1001374;
GODFREY					= 1001375;
FENANA					= 1001376;
NONORU					= 1001377;
SERANELIEN				= 1001378;
SATZFLOH				= 1001228;
PERCEVAINS				= 1001229;
UNA_TAYUUN				= 1001230;
SOIL_SCENTED_BOTANIST	= 1000835;
LONG_LEGGED_LADY		= 1001112;
TROUBLED_TRADER			= 1000812;
NONCHALANT_GOLDSMITH	= 1001015;
STERN_FACED_SEA_WOLF	= 1001222;
BURLY_VOICED_BRUTE		= 1001379;
ROUGH_SPOKEN_FELLOW		= 1001274;
RED_SHOED_RASCAL		= 1001275;
ABSTRACTED_GLADIATOR	= 1001276;
CHAPEAUED_CHAP			= 1001277;
BARRATROUS_BUCCANEER	= 1001278;
SOFTHEARTED_SEPTUAGEN	= 1001279;
INDIGO_EYED_ARCHER		= 1001280;
LOAM_SCENETED_LADY		= 1001281;
UNCOMFORTABLE_BRUTE		= 1001282;
ALMXIO					= 1001085;
ZOXIO					= 1001086;
DILUXIO					= 1001178;
DOKIXIA					= 1001238;
FLAXIO					= 1001237;
GRIDANIA_SNPC_TRIGGER	= 1090177;
NINE_IVIES_RENDEZVOUS_TRIGGER = 1090178;
MRKR_11001401			= 11001401;
MRKR_11001402			= 11001402;
MRKR_11001403			= 11001403;
MRKR_11001404			= 11001404;
MRKR_11001405			= 11001405;
MRKR_11001406			= 11001406;
MRKR_11001407			= 11001407;
MRKR_11001408			= 11001408;
MRKR_11001409			= 11001409;
MRKR_11001410			= 11001410;
MRKR_11001411			= 11001411;
MRKR_11001412			= 11001412;
MRKR_11001413			= 11001413;
MRKR_11001414			= 11001414;
MRKR_11001415			= 11001415;
MRKR_11001416			= 11001416;
MRKR_11001417			= 11001417;
MRKR_11001418			= 11001418;
MRKR_11001419			= 11001419;
MRKR_11001420			= 11001420;
MRKR_WAKING_SANDS_TATARU = 11001303;
```

## Markers
```
MRKR_11001401			= 11001401;
MRKR_11001402			= 11001402;
MRKR_11001403			= 11001403;
MRKR_11001404			= 11001404;
MRKR_11001405			= 11001405;
MRKR_11001406			= 11001406;
MRKR_11001407			= 11001407;
MRKR_11001408			= 11001408;
MRKR_11001409			= 11001409;
MRKR_11001410			= 11001410;
MRKR_11001411			= 11001411;
MRKR_11001412			= 11001412;
MRKR_11001413			= 11001413;
MRKR_11001414			= 11001414;
MRKR_11001415			= 11001415;
MRKR_11001416			= 11001416;
MRKR_11001417			= 11001417;
MRKR_11001418			= 11001418;
MRKR_11001419			= 11001419;
MRKR_11001420			= 11001420;
MRKR_WAKING_SANDS_TATARU = 11001303;
```

## Flags/Counters
```

```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function wakingsands_default_dialogue(player, quest, npc)
function startMan206Content(player, quest)
function startMan206InboundContentTest(player, quest)
function startMan206PostCutsceneContentTest(player, quest)
function startMan206MoonsporeNpcTest(player, quest)
function startMan206ReturnContentTest(player, quest)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
XX processEventUdowntownrectStart			Cutscene when you enter Minfilia's office.
XX processEvent000_2						Tataru's speech. "A party of frenzied sylphs has spirited past our sentries and trapped Lady Minfilia in the Hall of the First Step!"
XX processEvent000_3						Serandelion's speech. "A pack of strange green beasts just appeared out of nowhere! And now they're demanding audience with the Antecedent!"
XX processEvent000_4						Sahja Zhwan's speech. "Was that a sylph I saw fly by? Impossible... For what purpose would a sylph come all the way from Gridania?"
XX processEvent000_5						Nenekani's speech. "Sylphs in Ul'dah!? How did the devilish creatures ever get past the Brass Blades? Nenekani knows not!"
XX processEvent000_6						Godfrey's speech. "What folly is this, adventurer? Did you bring these heathens into our sanctuary?"
XX processEvent000_7						Frenana's speech. "I am seeing to the doors to ensure our â€œguestsâ€ cannot leave until we are certain of their intentions. "
XX processEvent000_8						Nonoru's speech. "Yes, it is true I am somewhat versed in the sylph's tongue, but I cannot leave my post."
XX processEvent000_9						Almxio's speech. "The woken ones must hearken! Terrible tidings this one brings!"
XX processEvent000_10						Zoxio's speech. "Audience! The woken ones must grant audience!"
XX processEvent000_11						Diluxio's speech. "There is little time! Little time!"
XX processEvent001							Quest Start Cutscene with Minfillia and the three Sylphs.
XX processEvent001_2						Minfillia's speech. "The sylphs crossed forest and desert to beg for our help. It would be wrong of us to turn a deaf ear to their pleas."
XX processEvent001_3						Serandelion's speech. "And just like that, the green beasts were gone...but at least they used the door this time."
XX processEvent001_4						Sahja Zhwan's speech. "Sylph sightings are not as uncommon as you may believe."
XX processEvent001_5						Godfrey's speech. "Imperials in the Black Shroud... This does not bode well for the realm. First Ala Mhigo, now Moonspore Grove."
XX processEvent001_6						Fenana's speech. "Dreadful little creatures. It is no wonder they are called â€œbeasts."
XX processEvent001_7						Nonoru's speech. "One used to be able to find sylphs in all of Eorzea's city-states, and none would pay them any mind."
XX processEvent001_8					Soil-Scented Botanist's speech. "While it lies on the edge of the protective â€œHedgeâ€ which surrounds and protects the Black Shroud, Moonspore Grove is situated closer to the imperial-occupied city-state of Ala Mhigo than it is to Gridania."
XX processEvent001_9					Long-Legged Lady's speech. "Many believe that the Garleans seek to exterminate the sylphs before the tribe can muster enough power to summon their primal..."
XX processEvent001_10					Troubled Trader's speech. "There has never been any indication that the sylphs intend to do anything so rash. "
XX processEvent001_11					Nonchalant Goldsmith's speech. "It is said this grove of the sylphs' lies deep within the Black Shroud, hidden from the eyes of man, and that only the most skillful trackers can locate it."
processEvent010_2						Tataru's speech. "Were you able to contact <SNPC>? Ah, so you have chosen to make your preparations separately before meeting in Gridania and continuing on to the Grove together?"
XX processEvent012_2					Nonchalant Goldsmith's speech. (DUPLICATE?) "It is said this grove of the sylphs' lies deep within the Black Shroud, hidden from the eyes of man, and that only the most skillful trackers can locate it."
XX processEvent012_3					Stern-Faced SeaWolf's speech. "Ul'dah is still the only city-state that's closed its gates to the sylphs."
XX processEvent012_4					Burly-Voiced Brute's speech. "In a town teemin' with pirates, fishbacks, ratboys, and kobolds, I don't think anyone'd notice if a sylph walked right up the Procession o' Terns, took a seat in the Drownin' Wench, and ordered itself a mug o' salt ale."
XX processEvent012_5					Satzfloh's speech. "Sylphs and the Garleans, eh? Naught good'll come of that."
XX processEvent012_6					Percevains' speech. "There is some wisdom in ignoring the noble urge to confront those greater evils which loom over us."
XX processEvent012_7					Ulma Tayurn's speech. "I'll be lookin' t' tickle some information on th' Empire out of a couple o' their scouts, I will."
processEvent016							HQ cutscene with Sylphs tricking the Garleans.
processEvent016_1						Zoxio's speech during the duty: "This one will hide woken ones!"
processEvent016_2						Possibly Almxio's speech during the duty: "This one will blind metal ones!"
processEvent016_3						Diluxio's speech during the duty: "This one will use magicks! Woken ones will save podlings!"
processEvent020_2						Dokixia's speech. "Quick! Quick! Rescuing ones must take the podlings! Take the podlings to the one called Flaxio! But beware! The metal ones must not see! Be silent, be swift!"
processEvent030_2						Seranilien's speech. "Minfilia is indisposed. If you have something to report, speak with Lady Tataru."
processEvent030_3						Sahja Zwhan's speech. "Sneaking about the forest while iron-clad monsters stalk your every move?"
processEvent030_4						Godfrey's speech. "This ain't the first time the Empire has sought to invade the Moonspore Grove and uproot the sylphs."
processEvent030_5						Fenana's speech. "<Name>! Tell me, is it true more than half of the sylphs' children were lost?"
processEvent030_6						Nonoru's speech. "And thus will the sylphs' numbers slowly dwindle, till one day none remain."
processEvent030_7						??? "So you say it was the sylphs' magicks that allowed you to slip into the Grove unnoticed? Amazing..."
... (+64 more)
```

## Items / rewards
```
quest:SetENpc(TATARU, QFLAG_REWARD);
```

## Instance entry/exit
```
MAN206_CONTENT_DIRECTOR = "Quest/QuestDirectorMan20610";
MAN206_CONTENT_ZONE = 151;
MAN206_STATIC_PRIVATE_AREA = "PrivateAreaMasterPast";
MAN206_ENTRY_X = 1882.422;
MAN206_ENTRY_Y = 34.153;
MAN206_ENTRY_Z = -1018.115;
MAN206_RETURN_X = 1882.422;
MAN206_RETURN_Y = 34.153;
MAN206_RETURN_Z = -1018.115;
local targetArea = GetWorldManager():GetArea(MAN206_CONTENT_ZONE, MAN206_STATIC_PRIVATE_AREA, MAN206_STATIC_PRIVATE_TYPE);
return false, "Missing Together We Stand static private area 151/PrivateAreaMasterPast/1. Reload the private-area SQL and restart the map server.";
local director = targetArea:TryCreateExclusiveQuestDirector(player, MAN206_CONTENT_DIRECTOR, (coroutine.running()));
GetWorldManager():DoZoneChange(player, MAN206_CONTENT_ZONE, MAN206_STATIC_PRIVATE_AREA, MAN206_STATIC_PRIVATE_TYPE, 15, x or MAN206_ENTRY_X, y or MAN206_ENTRY_Y, z or MAN206_ENTRY_Z, rot or MAN206_ENTRY_ROT);
return startMan206StaticContentInternal(player, quest, false, nil, MAN206_ENTRY_X, MAN206_ENTRY_Y, MAN206_ENTRY_Z, MAN206_ENTRY_ROT);
return startMan206StaticContentInternal(player, quest, true, nil, MAN206_ENTRY_X, MAN206_ENTRY_Y, MAN206_ENTRY_Z, MAN206_ENTRY_ROT);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 11, 15, -205.25, 0, -160, 1.55);
GetWorldManager():WarpToPosition(player, -126.2, 1.2, -160, 1.6);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110014, 'Together We Stand', 'Man206', 110013, 22)
REWARDS:
none found in gamedata_quest_rewards.sql
```


