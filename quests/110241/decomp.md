# 110241 Revelry in Rivalry — `thm300` (THM Lv.30)

- Class: THM 22 | Level: 30 | SQL prereq: 0 | SQL code: `Thm300`
- Server: `Data/scripts/quests/thm/thm300.lua` (driver stub) + `class_quest_template.lua:Thm300`
- Director: `Data/scripts/directors/Quest/QuestDirectorClassThm300.lua` (`Quest/QuestDirectorClassThm300`)
- Availability: enabled (implemented instance row); `tools/validate_thm300_route.py` PASS (re-run 2026-09-27)
- Decomp scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/thm/thm300.lua` (6914 bytes)

## Sequence / flags / objectives

| Seq | Objective | Actor | Marker | Event |
|---|---|---|---|---|
| ACCEPT | Offer from Yayake (grave-peddling to Limsa) | 1000846 Yayake | — | processEventYayakeStart (thm30010) |
| 0 | Retry at Yayake after duty failure | 1000846 | — | — |
| 1 | Rival talk (Ishgard send-off boast) | 1000607 | 11024101 | processEvent020 (thm30020) |
| 2 | Baderon lead, Drowning Wench | 1000137 | 11024102 | processEvent025 |
| 3 | Besieged-smith push (no talk event; retail Duty-Calls prompt) | 1001008 | 11024103 | push → battle |
| 10 | Inside rescue duty (internal) | content-owned | 11024103 | — |
| 20 | Bodenolf branched report | 1000144 | 11024104+11024105 | counterEvent: 028 survived / 027 fallen |
| 21 | Bodenolf Echo gate (`ask(51030,2)`, result 0 holds) | 1000144 | 11024106 | processEvent030 (requiredResult 1) |
| 22 | Yayake talk | 1000846 | 11024107 | processEvent035 |
| 23 | Rival aftermath | 1000607 | 11024108 | processEvent040 (thm30040) |
| 30 | Yayake final reward | 1000846 | 11024109 | processEvent050 |

Work counter slot 2 = 5 mirrors the DAT journal survived branch. Unbound: `010_2-7`
Ossuary chatter, `025_1/025_2`, `030_1` (same Echo, brush-off DAT row 66 vs 67 —
dead/survived pairing unresolved, route plays 030), `030_2-9`, `035_2`, `040_2-4`.

## NPCs / markers (DAT quest_marker.csv, verified)

- 11024101 rival (-341.84, 232.68, 4000189) / 11024102 Baderon (-428.06, 185.96, 1000015)
- 11024103 rescue site (-496.830, -385.310, 4000257) region 101 area 101
- 11024104/05 Bodenolf report A/B (-500.06, 416.06, 2200064); 11024106 Echo (same X/Z)
- 11024107/09 Yayake (-292.89, 219.88, 1500017); 11024108 rival aftermath (same as 01)
- 11024110-20 rejected filler. DAT display names: rival 1000607/4000189, Baderon 1000137,
  field smith 1001008/4000348, protected smith 2290023/4000348, bomb 2201603/3201603

## Spawn positions (map_coordinates.py, re-verified 2026-09-27)

- Scaffold 3308 `thm300_smith_trigger`, zone 128: (-494.716, 45.882, -385.102) =
  exact recorded ground node 821 (0.0005u, 22 pts in selection, connected path)
- `locate --zone 128 --world -494.716 -385.102` → map (20.33, 26.23), cell (20,26):
  matches walkthrough square (20,26)
- Scaffold 3307 `thm300_ossuary_rival`, zone 209: (-341.840, 206.5, 232.680) —
  same-hall floor Y, flagged (no interior navmesh within 127u)
- Duty spawns (bomb + protected smith) are private-area formation offsets; no
  public-world spawns for the fight

## Fight: rescue duty vs Ignis Fatuus (journal + walkthrough + DAT)

- One bomb: Ignis Fatuus 2201603 / mobType 32740, Lv.30, THM job 22, bomb skill list
  5010, hover 0.8. Model path `BombLesserScenarioThmLv30` names the Thm300 bomb.
  ("Ignus" tracker spelling is wrong; DAT + GamerEscape agree "Ignis".)
- Stale "8 Lemming / 8-8" objective metadata REJECTED (repeats verbatim across
  unrelated quests; contradicts journal "the beast which threatened/ravaged",
  dialogue, and walkthrough)
- Protected smith actor 2290023 spawns beside the bomb. Engine mobs only target
  players, so the bomb's canonical attacks on the smith run as scripted attrition
  (~1 HP/tick on the completion poll, ~100 s rescue window); on KO she despawns
- Bomb kill wins either way; credit records counter slot 2 (5 survived / 0 fallen)
  and grants Writ of Access 11000030 once (HasItem guard, never consumed)
- Director 10 → 20 / 0; party cap 3; 600 s; boundary 45.0

## Triggers / rewards / sync / lockouts

- Entry: push smith → `StartPrivateQuestBattle`; mounted blocked (leader + helpers,
  re-checked after preEvent); no preEvent on this battle
- Death/disconnect/area-exit/abandon/600 s timeout/failed entry → retry seq 0;
  `DisableReentry` blocks mid-duty rejoin
- Overlevel: no 1.0 level sync; owner gated THM ≥ 30 at accept/talk/push, no maximum
- Rewards: 3420 EXP script (post-1.20 Lv.30 max); 30000 gil + 3000 marks 1000110
  central. No item reward in DAT. Inv-full cannot lose anything (no script items)
- One-time quest bit; branched report is counter-selected with fallback to the plain
  event so a failed counter read cannot softlock

## Sources / gaps

- GamerEscape Revelry in Rivalry (journal + walkthrough: Yayake → rival → Baderon →
  (20,26) rescue → Bodenolf → Echo → Yayake → rival → reward); Fandom THM 1.0;
  YouTube fzug_RoAlbA + GUui5bq7qOo + 9tB7b_cl544 (previously reviewed per CSV notes)
- OPEN: live-client acceptance; smith attrition rate authored; Ossuary rival Y;
  030_1 pairing; offsets/party/timeout INFERRED
