# 110006 SEQ branches, events, cutscenes

## Sequence map (man0g1.lua)

| SEQ | Step |
| --- | --- |
| 000 | Roost echo scene (private past 2: 67.034, 4, -1205.65, -1.074) |
| 005 | Attune Camp Bentbranch (aetheryte 1280062) |
| 010/012 | Miounne debrief (param1 = has tutorial leve 12401) |
| 015 | LTW guild (Hereward) + CNJ guild (Soileine → echo: O-App-Pesi/Yda/Papalymo); counters 0/1, x5 journal params |
| 040 | BTN guild, Opyltyl → emote instance (private past 1: -223.792, 12, -1498.369) |
| 050 | Dance lesson: 6 kids, one emote each (flags 1-6); ANY success advances (lenient) |
| 055 | Kids whisper (private past 2) → meet at gate (public -209.817, 18, -1477.372) |
| 060 | White Wolf Gate trigger → entry ask → content |
| 065 | Escort duty (private zone-150 copy) |
| 070 | Stump echo (private past 1: -769.740, 22.945, -1086.493) |
| 071 | Stump exit → zone 206 (-192, 5.45, -1069.162) |
| 072 | BTN trigger (+3000 gil) |
| 075/080 | LS → LNC guild, Willelda |
| 085 | Burchard → LNC echo (private past 3: 176.13, 27.5, -1581.84) |
| 090 | Burchard-instance briefing → private past 4 |
| 095 | Nuala wildlings brief → public (193.921, 27.9, -1580.823) |
| 100/105 | LS → Miounne reward (6000 gil + 200 EXP) |

## Cutscene clients (all delegateEvent, pre-wired)

man0g100 (Miounne meet) / 110 (Bentbranch order) / 120 (LTW) / 130+135/136
(CNJ echo) / 140 (BTN) / 150 (lesson done) / 160 (escort plea) / **170
(escort start)** / **180 (escort end → stump echo)** / 181 (moogle mask) /
182 (Mooglespeak) / 185 (Fufucha pay) / 190 (Willelda) / 200 (LNC echo) /
210 (Dunstan brief) / 220 (wildlings) / Complete. Plus ~200 numbered
flavor lines (100_x … 200_x) and LS packs (5 packs).

## Duty event flow (060 → 065 → 070)

1. Push 1090202 at 060 (also allowed at 070/071 as retry) → combat-class +
   dismount + alive gates → `contentsJoinAskInBasaClass` → accept (1).
2. Prechecks (class/mount/dead/route/zone) → SEQ 065 → processEvent170 →
   CreateContentArea(150) → rebind director → deferred group → zone-in.
3. onZoneIn kicks `noticeEvent` → clears loading fade → mission notice
   (text 50026, 30 min) → landing gate → route starts (8s delay).
4. Route events → Powle/Sansa dialogue (rows 362-374). Destination reached
   → completion cutscene kick (`pushDefault` on completion trigger).
5. onPush 065 + 1090203 → processEvent180 → ContentFinished → stumpecho
   warp → SEQ 070. Manual push is also the GM-test path
   (`testMan0g1CompletionCutscene`).

## Journal/markers

`getJournalInformation` = (has leve 12401, LTW counter x5, CNJ counter x5).
Marker list follows SEQ with private/public variants (050/055/070/071/090).
Counters used: {0, 1} (fits budget). Flags 1-6 emotes.
