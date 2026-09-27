# 110260 Dendrological Duties (Cnj200) — in-depth decomp

Conjurer rank 20. Offer/reward: Soileine (1000234/display 1300064) in
Stillglade Fane, Gridania zone 206 (-330.813, 8, -1682.83; spawn id 2296).
Requires CNJ class (23) + level 20 (server gates; gamedata prereq 0 = no
prior-quest gate). Text bank `_loadTextDataPermanently(479, "cnj200")`.

## Sequence / flags (server: class_quest_template.lua:Cnj200, driver)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Soileine offer | `processEventSoileineStart`: talk rows 1-3, ask 28; accept plays cutscene `cnj20010` (arg 2); decline (row 96) holds |
| 1 | Telent briefing (1000504; zone 206, -354.234/6.244/-1697.72, id 2300) | `processEvent015` talk (rows 11-14 + 57-59); marker 11026001 |
| 10 | Coywolf-clearing duty (internal) | `processEvent020` entry scene (`cnj20020`, after-warp) as battle preEvent; no public ENPC |
| 20 | Telent report | `processEvent030` (cutscene `cnj20030`); marker 11026003 |
| 30 | Soileine reward | `processEvent040` talk (rows 24-27 + 93) + `sqrwa 1760` presentation; marker 11026004 |

Ambient delegate events (client scenario, unowned/unbound):
010_2..010_11, 015_2..015_11, 020_2..020_7, 030_2. No counters or flags.

## Dialogue / cutscenes (recovered client Cnj200)

cnj20010 (offer accept), cnj20020 (duty entry, after-warp), cnj20030
(Telent report). Reward 040 is plain talk. Journal: standard talk flow,
no item sysmsgs.

## Objectives / markers (DAT quest_marker; 11026005-20 filler)

11026001 Telent briefing (-354,-1698); 11026002 coywolf duty site
(726,-850, Central Shroud); 11026003 Telent report; 11026004 Soileine
reward (-331,-1683). Marker 11026002 converts under the zone-150 native
page-2000 transform to square (38,29) — exactly the wiki's "Black
Shroud (38,29) past the Blue Badger Gate". Recorded ground at the site:
Y ~31.8 (zone_150 node 4435, 9.4 yalms from marker).

## Instance / territory

Fight: SimpleContentQuestBattle content copy `quest_sqb_cnj200_<pid>`
(private area; spawn = leader pos + adapter offsets 0/-8). No retail
duty layout recovered; formation offsets are adapter placements.
Client directors unrecovered. Re-entry: fail/timeout/death returns to
retry seq 0 (offer-actor talk re-enters).

## Fight: 4 Rabid Coywolves + Alpha Coywolf (sequential, lv 15/17)

- Rabid Coywolf: actor 2201408 / mob type 3127, lv 15, x4 sequential
  waves 1-4 (`cnj200_rabid_coywolf_1..4`).
- Alpha Coywolf: actor 2201409 / mob type 3128, lv 17, wave 5
  (`cnj200_alpha_coywolf`), "a little stronger" per walkthrough.
- Stats (mob_types rows): speed 6, hostile, detectRange 10, job 2, hp
  shape cloned from feral_watchdog, skillList 5062 (Wolf: Midnight
  Howl 23142, Threatening Growl 23143, Foul Bite 23144, Sanguine Bite
  23145). Private encounter summons only.
- Director QuestDirectorClassCnj200: expected 10 → success 20 → retry
  0, requireAllTargets, party cap 3, timeout 600 s. gc_sqb_runtime
  credits only the exact current-wave actor (no dup/foreign kills),
  spawns next wave on wave-complete.
- Phases/reinforcements: none beyond the 5 sequential waves.
  Enmity/leash: standard content AI. Morys's post-kill appearance
  (walkthrough: "mysterious conjurer named Morys") stays unbound — no
  content-owner variant exists for this duty.

## Triggers / edge handling

Class+level gates on offer/state/talk/push/journal/markers; failed
battle launch reverts to seq 0; death/timeout/disconnect/area-exit/
abandon/logout/DC handled by gc_sqb_runtime (retry seq 0, teardown,
async unwind, relog rebind); mounted leader or members blocked at
entry ("Dismount your chocobo..."); private area blocks remount and
zone transitions + the per-tick check force-dismount; party: only
leader starts, max 3, same-area/alive/combat-class checks. No level
sync (1.0 retail had none); overlevel allowed. No lockout beyond the
600 s attempt timer. Reward is grant-once with inv-full hold
(Yew Radical kept on the step for retry, no dup on replays).

## Rewards (gamedata_quest_rewards + script)

Gil 20000 + CNJ marks 1000111x2000 (central) + Yew Radical 5030306x1
(script, matches wiki "Yew Radical formerly rewarded") + Exp 1760
(script `sqrwa` + `AddExp`, post-1.20 level-20 maximum).

## Sources

- Client scenario decomp `tools/outputs/lpb/decomp_more_20260617/lua/
  quest/scenario/cnj/cnj200.lua`; DAT `docs/Dat Mining/cnj200.csv`,
  `quest_marker.csv` 11026001-04 (+05-20 filler), `xtx_displayName.csv`
  1300064/1000415; `quest.csv` row 110260 (prereq 0).
- Gamer Escape `Dendrological_Duties` (route, Blue Badger Gate,
  (38,29), 4+1 sequential fight, Yew Radical); FFXIV Wiki
  `Conjurer_Quests_(version_1.0)` (journal, 1760 EXP).
- YouTube `bNofTseBId4` + FF Archive playlist
  `PLsnSIkqGz_BNCq_bASpHGlqXExG5A7SUs` (route/actor evidence).
- Map conversions via `tools/mobspawns/map_coordinates.py`
  (zone 150 page 2000; zone_150.tsv ground).

## Open gaps

- Live-client acceptance of scenes/fight positions (adapter offsets,
  party cap, timer are documented defaults).
- Morys post-kill appearance: no spawnable variant (flavor beat only).
