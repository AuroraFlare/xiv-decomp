# 110100 Bloody Baptism — `Exc200` (Marauder 20)

- Offer: Waekbyrt 1000003 (zone 230, -752.53 / 7.35 / 382.14; guide map
  (4.63, 7.02) Lower Decks, matches wiki (4,7)). Class MRD, level 20+.
- Chain: preceded by Fade to White, followed by 110101 Two-man Crew.

## Sequence flow
ACCEPT Waekbyrt (`processEventWaekbyrtStart`, accept on result nil/1) ->
[1] Nunuba 1000004 briefing (`processEvent015`, requiredResult 1, Trident
Map) -> battle at marker 11010002 (`processEvent020` preEvent on duty
entry) -> [20] Nunuba report (`processEvent030` then `processEvent040`) ->
reward hook `processEvent050`. Markers 11010004-20 are filler.
Waekbyrt's post-fight lines (`processEvent040_2`) and the Trident Map item
handoff stay unbound (no marker/owner evidence; flavor only).

## Instance
Swiftperch Tower private fight, Western La Noscea region 101 area 102
(marker 11010002). Entry via `StartPrivateQuestBattle` (gc_sqb shell):
party cap 3, 600 s timeout, `requireAllTargets`. Mounted entry blocked
("Dismount your chocobo..."); no level sync (overlevel allowed, MRD 20+
only). Death/timeout/disconnect/abandon/area-exit fail back to retry;
kill credit resolves the quest owner by exact id/sequence.

## Fight
Single wave, 8/8 journal kills (Lord counts as one of the eight; retail
wave order unrecovered):
- 7x Tower Lemming, actor 2204003 (LemmingStandard), mob 3129, lv 15,
  skill list 5039 (curated Mole list), formation offsets around entry.
- 1x Lord of Swiftperch, actor 2204004 (LemmingScenarioMrdLv20), mob
  3130, lv 20, skill list 5039, offset (0, -12).
Profiles are private-encounter summons only (no public spawns, no drops).
Director: `QuestDirectorClassExc200` (sequences 10 -> 20 / retry 0).

## Rewards
Central: 20,000 gil + 2,000 Marauder marks (1000103). Script: 1,760 EXP
(post-1.20 lv-20 max, Gla200 precedent) + Iron Bill 4040405 (grant-checked;
full inventory holds the reward step for retry, no dup on replays).

## Sources
Decompiled client scenario + DAT markers/actors; GamerEscape walkthrough
(Tower Lemmings lv 15, Lord of Swiftperch lv 20); Fandom journal text;
map_coordinates guide (zone 230 page 900) for the offer position.
