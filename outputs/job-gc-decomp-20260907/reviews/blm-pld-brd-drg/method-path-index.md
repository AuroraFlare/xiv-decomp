# Detailed method-path index: BLM / PLD / BRD / DRG

Generated from the parent's raw-bytecode path inventory. `arg4` is the fourth Lua parameter, called `arg1` (first extra argument) in the narrative report. Each path keeps its own predicates; this table does not combine mutually exclusive calls. The local-text column includes only calls whose text owner is the quest. Full scheduler/talk/wait sequencing remains in the linked source JSON.

## 111261 `blm0j1`

[Exact calls, predicates, and terminals](../../quests/blm0j1.json) · [Raw instructions](../../bytecode/blm0j1.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventYayakeStart` (4) | arg4 == 0 @ 0x452; call22.1.return1 == nil @ 0x49A; 1 ~= 0 @ 0x4DE | eventOwner:51, eventOwner:55 | worldMaster.askRestrictChoices(quest, quest, 52, true, true) @ 0x496 | no values |
| `processEventYayakeStart` (4) | arg4 == 0 @ 0x452; call22.1.return1 ~= nil @ 0x49A; call22.1.return1 == 2 @ 0x4A2; 1 ~= 0 @ 0x4DE | eventOwner:51, eventOwner:55 | worldMaster.askRestrictChoices(quest, quest, 52, true, true) @ 0x496 | no values |
| `processEventYayakeStart` (4) | arg4 == 0 @ 0x452; call22.1.return1 ~= nil @ 0x49A; call22.1.return1 ~= 2 @ 0x4A2; 0 == 0 @ 0x4DE; call124.1.return1 == 1 @ 0x632 | eventOwner:51, eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:7, eventOwner:8, eventOwner:71, eventOwner:72, eventOwner:9, eventOwner:10, eventOwner:70, eventOwner:73, eventOwner:74, eventOwner:13, eventOwner:15 | worldMaster.askRestrictChoices(quest, quest, 52, true, true) @ 0x496<br>quest.showQuestInfomation() @ 0x62E | call124.1.return1 |
| `processEventYayakeStart` (4) | arg4 == 0 @ 0x452; call22.1.return1 ~= nil @ 0x49A; call22.1.return1 ~= 2 @ 0x4A2; 0 == 0 @ 0x4DE; call124.1.return1 ~= 1 @ 0x632 | eventOwner:51, eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:7, eventOwner:8, eventOwner:71, eventOwner:72, eventOwner:9, eventOwner:10, eventOwner:70, eventOwner:73, eventOwner:74, eventOwner:11, eventOwner:12 | worldMaster.askRestrictChoices(quest, quest, 52, true, true) @ 0x496<br>quest.showQuestInfomation() @ 0x62E | call124.1.return1 |
| `processEventYayakeStart` (4) | arg4 ~= 0 @ 0x452; 0 == 0 @ 0x4DE; call124.1.return1 == 1 @ 0x632 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:7, eventOwner:8, eventOwner:71, eventOwner:72, eventOwner:9, eventOwner:10, eventOwner:70, eventOwner:73, eventOwner:74, eventOwner:13, eventOwner:15 | quest.showQuestInfomation() @ 0x62E | call124.1.return1 |
| `processEventYayakeStart` (4) | arg4 ~= 0 @ 0x452; 0 == 0 @ 0x4DE; call124.1.return1 ~= 1 @ 0x632 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:7, eventOwner:8, eventOwner:71, eventOwner:72, eventOwner:9, eventOwner:10, eventOwner:70, eventOwner:73, eventOwner:74, eventOwner:11, eventOwner:12 | quest.showQuestInfomation() @ 0x62E | call124.1.return1 |
| `processEventYayake000Follow` (3) | unconditional | eventOwner:16, eventOwner:17, eventOwner:18 | — | no values |
| `processEventLalai000Follow` (3) | unconditional | eventOwner:58 | — | no values |
| `processEventKazaggchah000Follow` (3) | unconditional | eventOwner:59 | — | no values |
| `processEventDozolmeloc000Follow` (3) | unconditional | eventOwner:60 | — | no values |
| `processEventDaza000Follow` (3) | unconditional | eventOwner:61 | — | no values |
| `processEventYayakeFollow` (3) | unconditional | — | — | no values |
| `processEvent010` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xD97<br>quest.startNQCutScene('blm0j110', 1) @ 0xDA7<br>desktopWidget.openPublicInformDialogWidget(worldMaster, 25117, 11000556, 1) @ 0xDC3<br>worldMaster.notify(worldMaster, 25117, 11000556, 1) @ 0xDDF<br>quest.startFadeInCutSceneDefault(player) @ 0xDF7 | no values |
| `processEventLalai010Follow` (3) | unconditional | eventOwner:62 | — | no values |
| `processEventKazaggchah010Follow` (3) | unconditional | eventOwner:63 | — | no values |
| `processEventDozolmeloc010Follow` (3) | unconditional | eventOwner:64 | — | no values |
| `processEventDaza010Follow` (3) | unconditional | eventOwner:65 | — | no values |
| `processEvent020` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x1284<br>quest.startNQCutScene('blm0j120', 1) @ 0x1294<br>quest.startFadeInCutSceneDefault(player) @ 0x12A0 | no values |
| `processEventClear` (4) | unconditional | worldMaster:49 | quest.showGetJobItemWidget(player, arg4) @ 0x1361<br>desktopWidget.openPublicInformLongDialogWidget(quest, 79) @ 0x1381<br>quest.showGetJobAbilityWidget(player, 27305, 1) @ 0x13A1 | no values |
| `processEventClearAfter` (3) | unconditional | eventOwner:67, eventOwner:68, worldMaster:69 | — | no values |
| `processEvent_Yayake_Hint` (3) | unconditional | — | — | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111262 `blm0j2`

[Exact calls, predicates, and terminals](../../quests/blm0j2.json) · [Raw instructions](../../bytecode/blm0j2.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:18, worldMaster:19 | — | no values |
| `processEventLALAIStart` (3) | call74.1.return1 == 1 @ 0x53B | eventOwner:2, eventOwner:20, eventOwner:21, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:10, eventOwner:11 | quest.showQuestInfomation() @ 0x537 | call74.1.return1 |
| `processEventLALAIStart` (3) | call74.1.return1 ~= 1 @ 0x53B | eventOwner:2, eventOwner:20, eventOwner:21, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9 | quest.showQuestInfomation() @ 0x537 | call74.1.return1 |
| `processEvent000_LALAI` (3) | unconditional | eventOwner:12, eventOwner:13, eventOwner:14 | — | no values |
| `processEvent000_KAZAGGCHAH` (3) | unconditional | eventOwner:15 | — | no values |
| `processEvent000_DOZOLMELOC` (3) | unconditional | eventOwner:16 | — | no values |
| `processEvent000_DAZA` (3) | unconditional | eventOwner:17 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformDialogWidget(worldMaster, 51121, 3105515, 1, 2000207) @ 0xADA | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27319, 2) @ 0xB84 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1400197, 78) @ 0xBF3 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111263 `blm0j3`

[Exact calls, predicates, and terminals](../../quests/blm0j3.json) · [Raw instructions](../../bytecode/blm0j3.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:40, worldMaster:41 | — | no values |
| `processEventLALAIStart` (3) | call100.1.return1 == 1 @ 0x5FD | eventOwner:2, eventOwner:44, eventOwner:45, eventOwner:46, eventOwner:47, eventOwner:49, eventOwner:50, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:10 | quest.showQuestInfomation() @ 0x5F9 | call100.1.return1 |
| `processEventLALAIStart` (3) | call100.1.return1 ~= 1 @ 0x5FD | eventOwner:2, eventOwner:44, eventOwner:45, eventOwner:46, eventOwner:47, eventOwner:49, eventOwner:50, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9 | quest.showQuestInfomation() @ 0x5F9 | call100.1.return1 |
| `processEvent000` (3) | unconditional | eventOwner:11, eventOwner:12, eventOwner:13 | — | no values |
| `processEvent000_1` (3) | unconditional | eventOwner:34 | — | no values |
| `processEvent000_2` (3) | unconditional | eventOwner:35 | — | no values |
| `processEvent005` (4) | unconditional | eventOwner:14, eventOwner:15, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:19, eventOwner:42 | quest.startFadeOut(player, 1) @ 0xB1D<br>quest.startFadeIn(player, 1) @ 0xB39 | no values |
| `processEvent005_1` (3) | unconditional | eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:43 | — | no values |
| `processEvent005_2` (3) | unconditional | eventOwner:36 | — | no values |
| `processEvent005_3` (3) | unconditional | eventOwner:37 | — | no values |
| `processEvent010` (3) | unconditional | eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33 | — | no values |
| `processEvent010_1` (3) | unconditional | eventOwner:38 | — | no values |
| `processEvent010_2` (3) | unconditional | eventOwner:39 | — | no values |
| `processEventClear` (3) | unconditional | — | quest.showGetJobAbilityWidget(player, 27318, 2) @ 0x138E | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111264 `blm0j4`

[Exact calls, predicates, and terminals](../../quests/blm0j4.json) · [Raw instructions](../../bytecode/blm0j4.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:27, worldMaster:28 | — | no values |
| `processEventDOZOLMELOCStart` (3) | call16.1.return1 == 1 @ 0x478; call110.1.return1 == 1 @ 0x5F0 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:34, eventOwner:5, eventOwner:39, eventOwner:6, eventOwner:41, eventOwner:7, eventOwner:35, eventOwner:9, eventOwner:10, eventOwner:36, eventOwner:12, eventOwner:38, eventOwner:37, eventOwner:15 | eventOwner.ask(quest, 29, 2) @ 0x474<br>quest.showQuestInfomation() @ 0x5EC | call110.1.return1 |
| `processEventDOZOLMELOCStart` (3) | call16.1.return1 == 1 @ 0x478; call110.1.return1 ~= 1 @ 0x5F0 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:34, eventOwner:5, eventOwner:39, eventOwner:6, eventOwner:41, eventOwner:7, eventOwner:35, eventOwner:9, eventOwner:10, eventOwner:36, eventOwner:12, eventOwner:38, eventOwner:37, eventOwner:14 | eventOwner.ask(quest, 29, 2) @ 0x474<br>quest.showQuestInfomation() @ 0x5EC | call110.1.return1 |
| `processEventDOZOLMELOCStart` (3) | call16.1.return1 ~= 1 @ 0x478; call110.1.return1 == 1 @ 0x5F0 | eventOwner:2, eventOwner:32, eventOwner:4, eventOwner:34, eventOwner:5, eventOwner:39, eventOwner:6, eventOwner:41, eventOwner:7, eventOwner:35, eventOwner:9, eventOwner:10, eventOwner:36, eventOwner:12, eventOwner:38, eventOwner:37, eventOwner:15 | eventOwner.ask(quest, 29, 2) @ 0x474<br>quest.showQuestInfomation() @ 0x5EC | call110.1.return1 |
| `processEventDOZOLMELOCStart` (3) | call16.1.return1 ~= 1 @ 0x478; call110.1.return1 ~= 1 @ 0x5F0 | eventOwner:2, eventOwner:32, eventOwner:4, eventOwner:34, eventOwner:5, eventOwner:39, eventOwner:6, eventOwner:41, eventOwner:7, eventOwner:35, eventOwner:9, eventOwner:10, eventOwner:36, eventOwner:12, eventOwner:38, eventOwner:37, eventOwner:14 | eventOwner.ask(quest, 29, 2) @ 0x474<br>quest.showQuestInfomation() @ 0x5EC | call110.1.return1 |
| `processEvent005` (3) | unconditional | worldMaster:24 | quest.sayFreeDisplayName(4000257, quest, 25) @ 0x7E1 | no values |
| `processEvent000_DOZOLMELOC` (3) | unconditional | eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:19 | — | no values |
| `processEvent000_LALAI` (3) | unconditional | eventOwner:26 | — | no values |
| `processEvent000_KAZAGGCHAH` (3) | unconditional | eventOwner:20, eventOwner:21 | — | no values |
| `processEvent000_DAZA` (3) | unconditional | eventOwner:22, eventOwner:23 | — | no values |
| `processEvent000_SEKIHI` (3) | unconditional | worldMaster:33 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 40) @ 0xCF4 | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27317, 2) @ 0xD96 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111265 `blm0j5`

[Exact calls, predicates, and terminals](../../quests/blm0j5.json) · [Raw instructions](../../bytecode/blm0j5.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_DAZA_Start` (3) | call119.1.return1 == 1 @ 0x47C | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:31, eventOwner:32, eventOwner:11, eventOwner:14, eventOwner:15, eventOwner:16, eventOwner:36, eventOwner:19, eventOwner:21, eventOwner:35, eventOwner:23 | quest.showQuestInfomation() @ 0x478 | call119.1.return1 |
| `processEvent_DAZA_Start` (3) | call119.1.return1 ~= 1 @ 0x47C | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:31, eventOwner:32, eventOwner:11, eventOwner:14, eventOwner:15, eventOwner:16, eventOwner:36, eventOwner:19, eventOwner:21, eventOwner:35, eventOwner:22 | quest.showQuestInfomation() @ 0x478 | call119.1.return1 |
| `processEvent_DAZA_Follow` (3) | unconditional | eventOwner:24, eventOwner:25, eventOwner:27 | — | no values |
| `processEvent_KAZAGGCHAH_Follow` (3) | unconditional | eventOwner:28, eventOwner:29 | — | no values |
| `processEvent_DOZOLMELOC_Follow` (3) | unconditional | eventOwner:30 | — | no values |
| `processEvent_LALAI_Follow` (3) | unconditional | eventOwner:33 | — | no values |
| `processEvent_getAF_info` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4, 0) @ 0x940 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111266 `blm0j6`

[Exact calls, predicates, and terminals](../../quests/blm0j6.json) · [Raw instructions](../../bytecode/blm0j6.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventStartBeforeDaza` (3) | unconditional | eventOwner:95, eventOwner:96, worldMaster:97 | — | no values |
| `processEventStart` (3) | call52.1.return1 == 1 @ 0x698 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:91, eventOwner:7, eventOwner:9 | quest.showQuestInfomation() @ 0x694 | call52.1.return1 |
| `processEventStart` (3) | call52.1.return1 ~= 1 @ 0x698 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:91, eventOwner:7, eventOwner:8 | quest.showQuestInfomation() @ 0x694 | call52.1.return1 |
| `processEventDaza01` (3) | unconditional | eventOwner:10, eventOwner:11 | — | no values |
| `processEventKazagg01` (3) | unconditional | eventOwner:12, eventOwner:13 | — | no values |
| `processEventLalai01` (3) | unconditional | eventOwner:92 | — | no values |
| `processEventDozol01` (3) | unconditional | eventOwner:14, eventOwner:15, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:100, eventOwner:19, eventOwner:20, eventOwner:21 | — | no values |
| `processEventDaza02` (3) | unconditional | eventOwner:24 | — | no values |
| `processEventDozol02` (3) | unconditional | eventOwner:22, eventOwner:23 | — | no values |
| `processEventKazagg02` (3) | unconditional | eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:101, eventOwner:29, eventOwner:30, eventOwner:31 | — | no values |
| `processEventDaza03` (3) | unconditional | eventOwner:36, eventOwner:37 | — | no values |
| `processEventDozol03` (3) | unconditional | eventOwner:34, eventOwner:35 | — | no values |
| `processEventKazagg03` (3) | unconditional | eventOwner:32, eventOwner:33 | — | no values |
| `processEventLalai02` (3) | unconditional | eventOwner:38, eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:42, eventOwner:43, eventOwner:44, eventOwner:45, eventOwner:46, eventOwner:47, eventOwner:48, eventOwner:49, eventOwner:105 | — | no values |
| `processEventDaza04` (3) | unconditional | eventOwner:55, eventOwner:56, eventOwner:57, eventOwner:58 | — | no values |
| `processEventDozol04` (3) | unconditional | eventOwner:53, eventOwner:54 | — | no values |
| `processEventKazagg04` (3) | unconditional | eventOwner:52, eventOwner:103 | — | no values |
| `processEventLalai03` (3) | unconditional | eventOwner:50, eventOwner:51, eventOwner:102 | — | no values |
| `processEventNQ01` (4) | arg4 == true @ 0x1A49 | — | quest.startFadeOutCutSceneDefault(player) @ 0x1A35<br>quest.startNQCutScene('blm0j610', 1) @ 0x1A45<br>quest.startFadeInCutSceneDefault(player) @ 0x1A59 | no values |
| `processEventNQ01` (4) | arg4 ~= true @ 0x1A49 | — | quest.startFadeOutCutSceneDefault(player) @ 0x1A35<br>quest.startNQCutScene('blm0j610', 1) @ 0x1A45<br>quest.startFadeInCutSceneAfterWarp(player) @ 0x1A69 | no values |
| `processEventNQ02` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x1B32<br>quest.startNQCutScene('blm0j620', 1) @ 0x1B42<br>quest.startFadeInCutSceneAfterWarp(player) @ 0x1B4E | no values |
| `processEventNQ03` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x1BF5<br>quest.startNQCutScene('blm0j620', 1) @ 0x1C05<br>quest.startFadeInCutSceneDefault(player) @ 0x1C11 | no values |
| `processEventAfget` (4) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 106) @ 0x1CBE<br>quest.showGetJobAbilityWidget(player, 27316, 2) @ 0x1CDE<br>quest.showGetJobItemWidget(player, arg4) @ 0x1CFA | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111281 `pld0j1`

[Exact calls, predicates, and terminals](../../quests/pld0j1.json) · [Raw instructions](../../bytecode/pld0j1.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventLULUTSUStart` (4) | arg4 == 1 @ 0x2E1; call55.1.return1 == 1 @ 0x3B1 | eventOwner:8, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:16, eventOwner:17, eventOwner:18 | quest.showQuestInfomation() @ 0x3AD | call55.1.return1 |
| `processEventLULUTSUStart` (4) | arg4 == 1 @ 0x2E1; call55.1.return1 ~= 1 @ 0x3B1 | eventOwner:8, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:15 | quest.showQuestInfomation() @ 0x3AD | call55.1.return1 |
| `processEventLULUTSUStart` (4) | arg4 ~= 1 @ 0x2E1; call55.1.return1 == 1 @ 0x3B1 | eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:16, eventOwner:17, eventOwner:18 | quest.showQuestInfomation() @ 0x3AD | call55.1.return1 |
| `processEventLULUTSUStart` (4) | arg4 ~= 1 @ 0x2E1; call55.1.return1 ~= 1 @ 0x3B1 | eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:15 | quest.showQuestInfomation() @ 0x3AD | call55.1.return1 |
| `processEvent055` (3) | unconditional | eventOwner:19 | — | no values |
| `processEvent082` (3) | unconditional | eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:29, eventOwner:50 | — | no values |
| `processEvent083` (3) | unconditional | eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33 | — | no values |
| `processEvent010` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xA4F<br>quest.startNQCutScene('pld0j110', 1) @ 0xA5F<br>desktopWidget.openPublicInformDialogWidget(worldMaster, 25117, 11000558, 1) @ 0xA7B<br>worldMaster.notify(worldMaster, 25117, 11000558, 1) @ 0xA97<br>quest.startFadeInCutSceneAfterWarp(player) @ 0xAAF | no values |
| `processEvent015` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xBCE<br>quest.startNQCutScene('pld0j110', 1) @ 0xBDE<br>desktopWidget.openPublicInformDialogWidget(worldMaster, 25117, 11000558, 1) @ 0xBFA<br>worldMaster.notify(worldMaster, 25117, 11000558, 1) @ 0xC16<br>quest.startFadeInCutSceneDefault(player) @ 0xC2E | no values |
| `processEvent020` (3) | unconditional | eventOwner:34, eventOwner:49, eventOwner:35, eventOwner:36, eventOwner:38, eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:42, eventOwner:43, eventOwner:44, eventOwner:45, eventOwner:46, eventOwner:47, worldMaster:48 | quest.startFadeOut(player, 1) @ 0xD8B<br>quest.startFadeIn(player, 1) @ 0xDA7<br>quest.startFadeOut(player, 1) @ 0xE67<br>quest.startFadeIn(player, 1) @ 0xE83 | no values |
| `processEventKokuti` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4) @ 0x11BF<br>desktopWidget.openPublicInformLongDialogWidget(quest, 51) @ 0x11DF<br>quest.showGetJobAbilityWidget(player, 27146, 1) @ 0x11FF | no values |
| `processEventStart_Hint` (3) | unconditional | — | — | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111282 `pld0j2`

[Exact calls, predicates, and terminals](../../quests/pld0j2.json) · [Raw instructions](../../bytecode/pld0j2.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:2, eventOwner:3, worldMaster:4 | — | no values |
| `processEventJENLYNSStart` (3) | call83.1.return1 == 1 @ 0x4F9 | eventOwner:5, eventOwner:22, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:23, eventOwner:12, eventOwner:14, eventOwner:15, eventOwner:17, eventOwner:21, eventOwner:18, eventOwner:19 | quest.showQuestInfomation() @ 0x4F5<br>quest.startFadeOut(player, 1) @ 0x52D<br>quest.startFadeIn(player, 1) @ 0x549 | call83.1.return1 |
| `processEventJENLYNSStart` (3) | call83.1.return1 ~= 1 @ 0x4F9 | eventOwner:5, eventOwner:22, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:23, eventOwner:12, eventOwner:14, eventOwner:15, eventOwner:16 | quest.showQuestInfomation() @ 0x4F5 | call83.1.return1 |
| `processEvent000_JENLYNS` (3) | unconditional | eventOwner:20, eventOwner:24 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51127, 2000201) @ 0x8DA | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27147, 1) @ 0x976 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1000146, 95) @ 0x9E5 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111283 `pld0j3`

[Exact calls, predicates, and terminals](../../quests/pld0j3.json) · [Raw instructions](../../bytecode/pld0j3.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventJENLYNSStart` (3) | call65.1.return1 == 1 @ 0x390 | eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:14, eventOwner:15, eventOwner:16 | quest.showQuestInfomation() @ 0x38C<br>quest.startFadeOut(player, 1) @ 0x3D8<br>quest.startFadeIn(player, 1) @ 0x3F4 | call65.1.return1 |
| `processEventJENLYNSStart` (3) | call65.1.return1 ~= 1 @ 0x390 | eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13 | quest.showQuestInfomation() @ 0x38C | call65.1.return1 |
| `processEventJENLYNSStart_1` (3) | unconditional | eventOwner:2, worldMaster:3 | — | no values |
| `processEvent000` (3) | unconditional | eventOwner:17, eventOwner:18, eventOwner:19, eventOwner:20 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51127, 2000201) @ 0x809 | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27149, 2) @ 0x8A5 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1000146, 96) @ 0x914 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111284 `pld0j4`

[Exact calls, predicates, and terminals](../../quests/pld0j4.json) · [Raw instructions](../../bytecode/pld0j4.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_JENLYNS_Hint` (3) | unconditional | eventOwner:2, worldMaster:3 | — | no values |
| `processEvent_JENLYNS_Start` (3) | call64.1.return1 == 1 @ 0x44B | eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:15 | quest.showQuestInfomation() @ 0x447 | call64.1.return1 |
| `processEvent_JENLYNS_Start` (3) | call64.1.return1 ~= 1 @ 0x44B | eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14 | quest.showQuestInfomation() @ 0x447 | call64.1.return1 |
| `processEvent_JENLYNS_Follow` (3) | unconditional | eventOwner:16 | — | no values |
| `processEvent_getAF_info` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4, 0) @ 0x706 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111285 `pld0j5`

[Exact calls, predicates, and terminals](../../quests/pld0j5.json) · [Raw instructions](../../bytecode/pld0j5.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventJENLYNSStart` (3) | call31.1.return1 == 1 @ 0x2DF | eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:26, eventOwner:27 | quest.showQuestInfomation() @ 0x2DB | call31.1.return1 |
| `processEventJENLYNSStart` (3) | call31.1.return1 ~= 1 @ 0x2DF | eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:25 | quest.showQuestInfomation() @ 0x2DB | call31.1.return1 |
| `processEvent_000_JENLYNSSFollow` (3) | unconditional | eventOwner:28 | — | no values |
| `processEvent_005NQ_1` (4) | arg4 == true @ 0x5BD | — | quest.startFadeOutCutSceneDefault(player) @ 0x5A9<br>quest.startNQCutScene('pld0j510', 1) @ 0x5B9<br>quest.startFadeInCutSceneDefault(player) @ 0x5CD | no values |
| `processEvent_005NQ_1` (4) | arg4 ~= true @ 0x5BD | — | quest.startFadeOutCutSceneDefault(player) @ 0x5A9<br>quest.startNQCutScene('pld0j510', 1) @ 0x5B9<br>quest.startFadeInCutSceneAfterWarp(player) @ 0x5DD | no values |
| `processEvent_015NQ_2` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x6A6<br>quest.startNQCutScene('pld0j520', 1) @ 0x6B6<br>quest.startFadeInCutSceneDefault(player) @ 0x6C2 | no values |
| `processEventClear` (3) | unconditional | worldMaster:29 | desktopWidget.openPublicInformLongDialogWidget(quest, 31) @ 0x787<br>quest.showGetJobAbilityWidget(player, 27159, 3) @ 0x7A7 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111286 `pld0j6`

[Exact calls, predicates, and terminals](../../quests/pld0j6.json) · [Raw instructions](../../bytecode/pld0j6.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventStartBefore` (3) | unconditional | eventOwner:17, eventOwner:18, eventOwner:19, eventOwner:20, worldMaster:21 | — | no values |
| `processEventStart` (3) | call112.1.return1 == 1 @ 0x645 | eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33, eventOwner:34, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:36 | quest.showQuestInfomation() @ 0x641 | call112.1.return1 |
| `processEventStart` (3) | call112.1.return1 ~= 1 @ 0x645 | eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33, eventOwner:34, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:35 | quest.showQuestInfomation() @ 0x641 | call112.1.return1 |
| `processEventStartAfter` (3) | unconditional | eventOwner:38 | — | no values |
| `processEventClear` (4) | unconditional | eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:42, eventOwner:43, eventOwner:44, eventOwner:51, eventOwner:45, eventOwner:46, eventOwner:52, eventOwner:53, eventOwner:54 | — | no values |
| `processEventKokuti` (4) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 55) @ 0xC5F<br>quest.showGetJobAbilityWidget(player, 27148, 1) @ 0xC7F<br>quest.showGetJobItemWidget(player, arg4) @ 0xC9B | no values |
| `processEventNQ01` (4) | arg4 == true @ 0xD9B | — | quest.startFadeOutCutSceneDefault(player) @ 0xD87<br>quest.startNQCutScene('pld0j610', 1) @ 0xD97<br>quest.startFadeInCutSceneDefault(player) @ 0xDAB | no values |
| `processEventNQ01` (4) | arg4 ~= true @ 0xD9B | — | quest.startFadeOutCutSceneDefault(player) @ 0xD87<br>quest.startNQCutScene('pld0j610', 1) @ 0xD97<br>quest.startFadeInCutSceneAfterWarp(player) @ 0xDBB | no values |
| `processEventNQ02` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xE84<br>quest.startNQCutScene('pld0j620', 1) @ 0xE94<br>quest.startFadeInCutSceneAfterWarp(player) @ 0xEA0 | no values |
| `processEventNQ03` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xF47<br>quest.startNQCutScene('pld0j620', 1) @ 0xF57<br>quest.startFadeInCutSceneDefault(player) @ 0xF63 | no values |
| `processEvent001` (4) | unconditional | — | — | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111301 `brd0j1`

[Exact calls, predicates, and terminals](../../quests/brd0j1.json) · [Raw instructions](../../bytecode/brd0j1.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventGEORJEAUXStart` (4) | arg4 == 1 @ 0x303; call82.1.return1 == 1 @ 0x43F | eventOwner:2, eventOwner:4, eventOwner:5, eventOwner:47, eventOwner:6, eventOwner:7, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:51, eventOwner:52, eventOwner:8, eventOwner:10, eventOwner:11 | quest.showQuestInfomation() @ 0x43B | call82.1.return1 |
| `processEventGEORJEAUXStart` (4) | arg4 == 1 @ 0x303; call82.1.return1 ~= 1 @ 0x43F | eventOwner:2, eventOwner:4, eventOwner:5, eventOwner:47, eventOwner:6, eventOwner:7, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:51, eventOwner:52, eventOwner:8, eventOwner:9 | quest.showQuestInfomation() @ 0x43B | call82.1.return1 |
| `processEventGEORJEAUXStart` (4) | arg4 ~= 1 @ 0x303; call82.1.return1 == 1 @ 0x43F | eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:47, eventOwner:6, eventOwner:7, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:51, eventOwner:52, eventOwner:8, eventOwner:10, eventOwner:11 | quest.showQuestInfomation() @ 0x43B | call82.1.return1 |
| `processEventGEORJEAUXStart` (4) | arg4 ~= 1 @ 0x303; call82.1.return1 ~= 1 @ 0x43F | eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:47, eventOwner:6, eventOwner:7, eventOwner:48, eventOwner:49, eventOwner:50, eventOwner:51, eventOwner:52, eventOwner:8, eventOwner:9 | quest.showQuestInfomation() @ 0x43B | call82.1.return1 |
| `processEvent000_GEORJEAUX` (3) | unconditional | eventOwner:14 | — | no values |
| `processEvent000` (3) | unconditional | eventOwner:15, eventOwner:46, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:19, eventOwner:21, eventOwner:53, eventOwner:22, eventOwner:23, eventOwner:24, eventOwner:54, eventOwner:25 | — | no values |
| `processEvent005_JEHANTEL` (3) | unconditional | eventOwner:26, eventOwner:55 | — | no values |
| `processEvent005` (3) | unconditional | eventOwner:27, eventOwner:28, eventOwner:56, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33, eventOwner:57, eventOwner:34, eventOwner:58, eventOwner:35, eventOwner:59 | — | no values |
| `processEvent010_PUKNOPOKI` (3) | unconditional | eventOwner:36, eventOwner:60 | — | no values |
| `processEvent015` (3) | unconditional | eventOwner:37, eventOwner:61, eventOwner:62, eventOwner:63, eventOwner:64, eventOwner:65, eventOwner:66, eventOwner:38, eventOwner:39, eventOwner:67, eventOwner:68, eventOwner:69, eventOwner:41, eventOwner:42, eventOwner:70, worldMaster:43 | — | no values |
| `processEventJob` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4) @ 0x1235<br>desktopWidget.openPublicInformLongDialogWidget(quest, 71) @ 0x1255<br>quest.showGetJobAbilityWidget(player, 27237, 2) @ 0x1275 | no values |
| `processEvent_GEORJEAUXS_Hint` (3) | unconditional | — | — | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111302 `brd0j2`

[Exact calls, predicates, and terminals](../../quests/brd0j2.json) · [Raw instructions](../../bytecode/brd0j2.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventJEHANTELStart` (3) | call148.1.return1 == 1 @ 0x4DE | eventOwner:4, eventOwner:19, eventOwner:5, eventOwner:20, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:18, eventOwner:21, eventOwner:10, eventOwner:22, eventOwner:11, eventOwner:23, eventOwner:24, eventOwner:12, eventOwner:13, eventOwner:25, eventOwner:26, eventOwner:15, eventOwner:27, eventOwner:16 | quest.showQuestInfomation() @ 0x4DA | call148.1.return1 |
| `processEventJEHANTELStart` (3) | call148.1.return1 ~= 1 @ 0x4DE | eventOwner:4, eventOwner:19, eventOwner:5, eventOwner:20, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:18, eventOwner:21, eventOwner:10, eventOwner:22, eventOwner:11, eventOwner:23, eventOwner:24, eventOwner:12, eventOwner:13, eventOwner:25, eventOwner:26, eventOwner:14 | quest.showQuestInfomation() @ 0x4DA | call148.1.return1 |
| `processEventJEHANTELStart_1` (3) | unconditional | eventOwner:2, worldMaster:3 | — | no values |
| `processEvent000` (3) | unconditional | eventOwner:17 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51122, 3101415) @ 0x9ED | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27239, 2) @ 0xA89 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1200133, 82) @ 0xAF8 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111303 `brd0j3`

[Exact calls, predicates, and terminals](../../quests/brd0j3.json) · [Raw instructions](../../bytecode/brd0j3.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventJEHANTELStart` (3) | call109.1.return1 == 1 @ 0x442 | eventOwner:4, eventOwner:5, eventOwner:19, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:22, eventOwner:9, eventOwner:10, eventOwner:20, eventOwner:11, eventOwner:12, eventOwner:23, eventOwner:18, eventOwner:13, eventOwner:24, eventOwner:15, eventOwner:21, eventOwner:16 | quest.showQuestInfomation() @ 0x43E | call109.1.return1 |
| `processEventJEHANTELStart` (3) | call109.1.return1 ~= 1 @ 0x442 | eventOwner:4, eventOwner:5, eventOwner:19, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:22, eventOwner:9, eventOwner:10, eventOwner:20, eventOwner:11, eventOwner:12, eventOwner:23, eventOwner:18, eventOwner:13, eventOwner:24, eventOwner:14 | quest.showQuestInfomation() @ 0x43E | call109.1.return1 |
| `processEventJEHANTELStart_1` (3) | unconditional | eventOwner:2, worldMaster:3 | — | no values |
| `processEvent000` (3) | unconditional | eventOwner:17, eventOwner:25 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51138, 3101511) @ 0x936 | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27238, 2) @ 0x9D2 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1200133, 83) @ 0xA41 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111304 `brd0j4`

[Exact calls, predicates, and terminals](../../quests/brd0j4.json) · [Raw instructions](../../bytecode/brd0j4.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventStartBefore` (3) | unconditional | eventOwner:2, eventOwner:32, worldMaster:3 | — | no values |
| `processEventStart` (3) | call106.1.return1 == 1 @ 0x585 | eventOwner:4, eventOwner:31, eventOwner:33, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:34, eventOwner:9, eventOwner:10, eventOwner:12, eventOwner:13 | quest.showQuestInfomation() @ 0x581 | call106.1.return1 |
| `processEventStart` (3) | call106.1.return1 ~= 1 @ 0x585 | eventOwner:4, eventOwner:31, eventOwner:33, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:34, eventOwner:9, eventOwner:10, eventOwner:11 | quest.showQuestInfomation() @ 0x581 | call106.1.return1 |
| `processEventJehantel` (3) | unconditional | eventOwner:15, eventOwner:35 | — | no values |
| `processEventNQ01` (4) | arg4 == true @ 0x8B8 | — | quest.startFadeOutCutSceneDefault(player) @ 0x8A4<br>quest.startNQCutScene('brd0j410', 1) @ 0x8B4<br>quest.startFadeInCutSceneDefault(player) @ 0x8C8 | no values |
| `processEventNQ01` (4) | arg4 ~= true @ 0x8B8 | — | quest.startFadeOutCutSceneDefault(player) @ 0x8A4<br>quest.startNQCutScene('brd0j410', 1) @ 0x8B4<br>quest.startFadeInCutSceneAfterWarp(player) @ 0x8D8 | no values |
| `processEventNQ02` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x9A1<br>quest.startNQCutScene('brd0j410', 1) @ 0x9B1<br>quest.startFadeInCutSceneDefault(player) @ 0x9BD | no values |
| `processEventNQ03` (3) | unconditional | worldMaster:30 | quest.startFadeOutCutSceneDefault(player) @ 0xA62<br>quest.startNQCutScene('brd0j420', 1) @ 0xA72<br>quest.startFadeInCutSceneDefault(player) @ 0xA7E | no values |
| `processEventClear01` (3) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 36) @ 0xB6F<br>quest.showGetJobAbilityWidget(player, 27232, 3) @ 0xB8F | no values |
| `processEventClear02` (3) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 36) @ 0xC69<br>quest.showGetJobAbilityWidget(player, 27232, 3) @ 0xC89 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111305 `brd0j5`

[Exact calls, predicates, and terminals](../../quests/brd0j5.json) · [Raw instructions](../../bytecode/brd0j5.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_JEHANTEL_Start` (3) | call138.1.return1 == 1 @ 0x445 | eventOwner:2, eventOwner:26, eventOwner:17, eventOwner:27, eventOwner:3, eventOwner:4, eventOwner:25, eventOwner:28, eventOwner:29, eventOwner:5, eventOwner:30, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:18, eventOwner:11, eventOwner:12, eventOwner:19, eventOwner:15 | quest.startFadeOut(player, 1) @ 0x281<br>quest.startFadeIn(player, 1) @ 0x29D<br>quest.showQuestInfomation() @ 0x441 | call138.1.return1 |
| `processEvent_JEHANTEL_Start` (3) | call138.1.return1 ~= 1 @ 0x445 | eventOwner:2, eventOwner:26, eventOwner:17, eventOwner:27, eventOwner:3, eventOwner:4, eventOwner:25, eventOwner:28, eventOwner:29, eventOwner:5, eventOwner:30, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:18, eventOwner:10 | quest.startFadeOut(player, 1) @ 0x281<br>quest.startFadeIn(player, 1) @ 0x29D<br>quest.showQuestInfomation() @ 0x441 | call138.1.return1 |
| `processEvent_JEHANTEL_Follow` (3) | unconditional | eventOwner:16, eventOwner:21, eventOwner:22, eventOwner:23 | — | no values |
| `processEvent_getAF_info` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4, 0) @ 0x8A4 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111306 `brd0j6`

[Exact calls, predicates, and terminals](../../quests/brd0j6.json) · [Raw instructions](../../bytecode/brd0j6.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventJEHANTELHint` (3) | unconditional | eventOwner:2, eventOwner:32, worldMaster:3 | — | no values |
| `processEventJEHANTELStart` (3) | call165.1.return1 == 1 @ 0x682 | eventOwner:4, eventOwner:35, eventOwner:5, eventOwner:31, eventOwner:6, eventOwner:36, eventOwner:37, eventOwner:38, eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:7, eventOwner:42, eventOwner:8, eventOwner:9, eventOwner:43, eventOwner:44, eventOwner:10, eventOwner:45, eventOwner:11, eventOwner:46, eventOwner:33, eventOwner:34, eventOwner:13, eventOwner:14, eventOwner:15 | quest.showQuestInfomation() @ 0x67E | call165.1.return1 |
| `processEventJEHANTELStart` (3) | call165.1.return1 ~= 1 @ 0x682 | eventOwner:4, eventOwner:35, eventOwner:5, eventOwner:31, eventOwner:6, eventOwner:36, eventOwner:37, eventOwner:38, eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:7, eventOwner:42, eventOwner:8, eventOwner:9, eventOwner:43, eventOwner:44, eventOwner:10, eventOwner:45, eventOwner:11, eventOwner:46, eventOwner:33, eventOwner:34, eventOwner:12 | quest.showQuestInfomation() @ 0x67E | call165.1.return1 |
| `processEventJEHANTELS_000_Follow` (3) | unconditional | eventOwner:16 | — | no values |
| `processEvent_010` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0xA81<br>quest.startNQCutScene('brd0j610', 1) @ 0xA91<br>quest.startFadeInCutSceneDefault(player) @ 0xA9D | no values |
| `processEventJEHANTELS_010_Follow` (3) | unconditional | eventOwner:30 | — | no values |
| `processEventClear` (4) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(quest, 47) @ 0xC5B<br>quest.showGetJobAbilityWidget(player, 27227, 1) @ 0xC7B<br>quest.showGetJobItemWidget(player, arg4) @ 0xC97 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111321 `drg0j1`

[Exact calls, predicates, and terminals](../../quests/drg0j1.json) · [Raw instructions](../../bytecode/drg0j1.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventStart` (4) | arg4 == 1 @ 0x31E; call79.1.return1 == 1 @ 0x3FE | eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:51, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:11 | quest.startFadeOut(player, 1.5) @ 0x2CA<br>quest.startFadeIn(player, 1.5) @ 0x302<br>quest.showQuestInfomation() @ 0x3FA<br>quest.startFadeOut(player, 1.5) @ 0x432<br>quest.startFadeIn(player, 1.5) @ 0x462 | call79.1.return1 |
| `processEventStart` (4) | arg4 == 1 @ 0x31E; call79.1.return1 ~= 1 @ 0x3FE | eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:51, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10 | quest.startFadeOut(player, 1.5) @ 0x2CA<br>quest.startFadeIn(player, 1.5) @ 0x302<br>quest.showQuestInfomation() @ 0x3FA<br>quest.startFadeOut(player, 1.5) @ 0x4A6<br>quest.startFadeIn(player, 1.5) @ 0x4D6 | call79.1.return1 |
| `processEventStart` (4) | arg4 ~= 1 @ 0x31E; call79.1.return1 == 1 @ 0x3FE | eventOwner:2, eventOwner:4, eventOwner:5, eventOwner:51, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:11 | quest.startFadeOut(player, 1.5) @ 0x2CA<br>quest.startFadeIn(player, 1.5) @ 0x302<br>quest.showQuestInfomation() @ 0x3FA<br>quest.startFadeOut(player, 1.5) @ 0x432<br>quest.startFadeIn(player, 1.5) @ 0x462 | call79.1.return1 |
| `processEventStart` (4) | arg4 ~= 1 @ 0x31E; call79.1.return1 ~= 1 @ 0x3FE | eventOwner:2, eventOwner:4, eventOwner:5, eventOwner:51, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10 | quest.startFadeOut(player, 1.5) @ 0x2CA<br>quest.startFadeIn(player, 1.5) @ 0x302<br>quest.showQuestInfomation() @ 0x3FA<br>quest.startFadeOut(player, 1.5) @ 0x4A6<br>quest.startFadeIn(player, 1.5) @ 0x4D6 | call79.1.return1 |
| `processEventStartAfter` (3) | unconditional | eventOwner:12, eventOwner:43 | — | no values |
| `processEventAlberic` (4) | unconditional | eventOwner:13, eventOwner:14, eventOwner:15, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:19, eventOwner:20, eventOwner:49 | — | no values |
| `processEventAlbericAfter` (4) | unconditional | eventOwner:21, eventOwner:44, eventOwner:45 | — | no values |
| `processEventClear` (3) | unconditional | eventOwner:25, eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33, eventOwner:34, eventOwner:35, eventOwner:36, eventOwner:37, eventOwner:38, eventOwner:39, eventOwner:40, eventOwner:41, eventOwner:42, eventOwner:47, worldMaster:48 | quest.startFadeOut(player, 1.5) @ 0xAC1<br>quest.startFadeIn(player, 1.5) @ 0xADD | no values |
| `processEventKokuti` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4) @ 0xED8<br>desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51126, 2000204) @ 0xEFC<br>quest.showGetJobAbilityWidget(player, 27266, 1) @ 0xF1C | no values |
| `processEventNQ` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x1022<br>quest.startNQCutScene('drg0j110', 1) @ 0x1032<br>quest.startFadeInCutSceneDefault(player) @ 0x103E | no values |
| `processEventStart_Hint` (3) | unconditional | — | — | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111322 `drg0j2`

[Exact calls, predicates, and terminals](../../quests/drg0j2.json) · [Raw instructions](../../bytecode/drg0j2.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:17, eventOwner:18, eventOwner:19, worldMaster:20 | — | no values |
| `processEventALBERICStart` (3) | call104.1.return1 == 1 @ 0x589 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:5, eventOwner:24, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:25, eventOwner:11, eventOwner:13 | quest.showQuestInfomation() @ 0x585 | call104.1.return1 |
| `processEventALBERICStart` (3) | call104.1.return1 ~= 1 @ 0x589 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:5, eventOwner:24, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:25, eventOwner:11, eventOwner:12 | quest.showQuestInfomation() @ 0x585 | call104.1.return1 |
| `processEvent000_ALBERICS` (3) | unconditional | eventOwner:14, eventOwner:16 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51126, 2000204) @ 0x891 | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27272, 3) @ 0x92D | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1000275, 85) @ 0x99C | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111323 `drg0j3`

[Exact calls, predicates, and terminals](../../quests/drg0j3.json) · [Raw instructions](../../bytecode/drg0j3.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_hint` (3) | unconditional | eventOwner:29, worldMaster:30 | — | no values |
| `processEventALBERICStart` (3) | call136.1.return1 == 1 @ 0x5BA | eventOwner:31, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:37, eventOwner:11, eventOwner:15, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:36, eventOwner:25 | quest.showQuestInfomation() @ 0x5B6 | call136.1.return1 |
| `processEventALBERICStart` (3) | call136.1.return1 ~= 1 @ 0x5BA | eventOwner:31, eventOwner:3, eventOwner:4, eventOwner:5, eventOwner:6, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:37, eventOwner:11, eventOwner:15, eventOwner:16, eventOwner:17, eventOwner:18, eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:23, eventOwner:24 | quest.showQuestInfomation() @ 0x5B6 | call136.1.return1 |
| `processEvent000_ALBERICS` (3) | unconditional | eventOwner:26, eventOwner:28 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51126, 2000204) @ 0x90C | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27267, 1) @ 0x9A8 | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1000275, 86) @ 0xA17 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111324 `drg0j4`

[Exact calls, predicates, and terminals](../../quests/drg0j4.json) · [Raw instructions](../../bytecode/drg0j4.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEvent_ALBERIC_Hint` (3) | unconditional | eventOwner:40, eventOwner:43, worldMaster:41 | — | no values |
| `processEvent_ALBERIC_Start` (3) | call23.1.return1 == 1 @ 0x436 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:6 | quest.showQuestInfomation() @ 0x422 | call23.1.return1 |
| `processEvent_ALBERIC_Start` (3) | call23.1.return1 ~= 1 @ 0x436 | eventOwner:2, eventOwner:3, eventOwner:4, eventOwner:5 | quest.showQuestInfomation() @ 0x422 | call23.1.return1 |
| `processEvent_ALBERIC_Follow` (3) | unconditional | eventOwner:7, eventOwner:33 | — | no values |
| `processEvent_NQ_Drg0j410` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x682<br>quest.startNQCutScene('Drg0j410', 1) @ 0x692<br>quest.startFadeInCutSceneDefault(player) @ 0x69E | no values |
| `processEvent_ALBERIC_Guidance` (3) | unconditional | eventOwner:32, eventOwner:34, eventOwner:35, eventOwner:36, eventOwner:37, eventOwner:38, eventOwner:39, eventOwner:42 | — | no values |
| `processEvent_getAF_info` (4) | unconditional | — | quest.showGetJobItemWidget(player, arg4, 0) @ 0x948 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111325 `drg0j5`

[Exact calls, predicates, and terminals](../../quests/drg0j5.json) · [Raw instructions](../../bytecode/drg0j5.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventALBERICStart` (3) | call172.1.return1 == 1 @ 0x519 | eventOwner:2, eventOwner:28, eventOwner:3, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:29, eventOwner:15, eventOwner:30, eventOwner:31, eventOwner:16, eventOwner:18, eventOwner:19, eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:24 | eventOwner.ask(quest, 4, 2) @ 0x2D9<br>quest.showQuestInfomation() @ 0x515 | call172.1.return1 |
| `processEventALBERICStart` (3) | call172.1.return1 ~= 1 @ 0x519 | eventOwner:2, eventOwner:28, eventOwner:3, eventOwner:7, eventOwner:8, eventOwner:9, eventOwner:10, eventOwner:11, eventOwner:12, eventOwner:13, eventOwner:14, eventOwner:29, eventOwner:15, eventOwner:30, eventOwner:31, eventOwner:16, eventOwner:18, eventOwner:19, eventOwner:20, eventOwner:21, eventOwner:22, eventOwner:23 | eventOwner.ask(quest, 4, 2) @ 0x2D9<br>quest.showQuestInfomation() @ 0x515 | call172.1.return1 |
| `processEvent000_ALBERICS` (3) | unconditional | eventOwner:25, eventOwner:26 | — | no values |
| `onJobQuestCompleteFirst` (2) | unconditional | — | desktopWidget.openPublicInformLongDialogWidget(worldMaster, 51135, 3102224, 1, 2000204) @ 0x88C | no values |
| `onJobQuestCompleteSecond` (2) | unconditional | — | quest.showGetJobAbilityWidget(player, 27277, 3) @ 0x93A | no values |
| `onJobQuestCompleteThird` (2) | unconditional | — | quest.showEventBeforeNpsLS(player, 1000275, 88) @ 0x9A9 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

## 111326 `drg0j6`

[Exact calls, predicates, and terminals](../../quests/drg0j6.json) · [Raw instructions](../../bytecode/drg0j6.txt)

| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |
| --- | --- | --- | --- | --- |
| `processEventALBERICHint` (3) | unconditional | eventOwner:36, eventOwner:37, eventOwner:38, worldMaster:39 | — | no values |
| `processEventALBERICStart` (3) | call17.1.return1 == 1 @ 0x44E | eventOwner:2, eventOwner:3, eventOwner:5 | quest.showQuestInfomation() @ 0x43A | call17.1.return1 |
| `processEventALBERICStart` (3) | call17.1.return1 ~= 1 @ 0x44E | eventOwner:2, eventOwner:3, eventOwner:4 | quest.showQuestInfomation() @ 0x43A | call17.1.return1 |
| `processEvent000` (3) | unconditional | eventOwner:6, eventOwner:24 | — | no values |
| `processEvent010` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x646<br>quest.startNQCutScene('Drg0j610', 1) @ 0x656<br>quest.startFadeInCutSceneDefault(player) @ 0x662 | no values |
| `processEvent015` (3) | unconditional | — | — | no values |
| `processEvent020` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x787<br>quest.startNQCutScene('Drg0j620', 1) @ 0x797<br>quest.startFadeInCutSceneAfterWarp(player) @ 0x7A3 | no values |
| `processEvent025` (3) | unconditional | — | quest.startFadeOutCutSceneDefault(player) @ 0x84A<br>quest.startNQCutScene('Drg0j620', 1) @ 0x85A<br>quest.startFadeInCutSceneDefault(player) @ 0x866 | no values |
| `processEvent030` (3) | unconditional | eventOwner:26, eventOwner:27, eventOwner:28, eventOwner:42, eventOwner:29, eventOwner:30, eventOwner:31, eventOwner:32, eventOwner:33, eventOwner:34, eventOwner:35 | desktopWidget.openPublicInformLongDialogWidget(quest, 43) @ 0x96B<br>quest.showGetJobAbilityWidget(player, 27268, 1) @ 0x98B<br>quest.showGetJobItemWidget(player, 8032704) @ 0x9A7 | no values |
| `processEventChuui` (3) | unconditional | — | — | no values |
| `processEventChuui2` (3) | unconditional | — | — | no values |

