# 110240 The Big Payback — `thm200` (THM Lv.20)

- Class: THM 22 | Level: 20 | SQL prereq: 0 | SQL code: `Thm200`
- Server: `Data/scripts/quests/thm/thm200.lua` (driver stub) + `class_quest_template.lua:Thm200`
- Director: `Data/scripts/directors/Quest/QuestDirectorClassThm200.lua` (`Quest/QuestDirectorClassThm200`)
- Availability: enabled (implemented instance row); `tools/validate_thm200_route.py` PASS (re-run 2026-09-27)
- Decomp scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/thm/thm200.lua` (3383 bytes)

## Sequence / flags / objectives

| Seq | Objective | Actor | Marker | Event |
|---|---|---|---|---|
| ACCEPT | Offer from Yayake, Arrzaneth Ossuary | 1000846 Yayake | — | processEventYayakeStart (thm20010) |
| 0 | Retry at Yayake after duty failure | 1000846 | — | — |
| 1 | I'loofii briefing (sin + vengeance order) | 1000847 | 11024001 | processEvent020 (thm20020) |
| 2 | Western Thanalan vengeance-trigger push (no talk event; push opens duty) | 1000174 | 11024002 | push → battle |
| 10 | Inside vengeance duty (internal) | content-owned | 11024002 | — |
| 20 | I'loofii report/reward | 1000847 | 11024003 | processEvent030 (thm20030) |

No quest items consumed; no work-counter branches. Unbound chatter: `010_2-7` (guild-join),
`020_2-8` (post-briefing) — never wired.

## NPCs / markers (DAT quest_marker.csv, verified)

- 11024001 briefing: (-306.80, 239.27) display 1900025, region 104 area 421 (Ossuary)
- 11024002 vengeance site: (-1229.530, -310.290) display 4000257, region 104 area 403
- 11024003 report: same X/Z as 11024001
- 11024004-20: rejected filler (1600179 rows, never routed)
- Yayake 1000846 / I'loofii 1000847 public spawns in SQL; trigger 1000174 is generic
  display 4000257 (`gamedata_actor_class.sql`)

## Spawn positions (map_coordinates.py, re-verified 2026-09-27)

- Scaffold 3310 `thm200_vengeance_trigger`, zone 172: (-1229.530, Y 57.0, -310.290)
- `locate --zone 172 --page 1300 --world -1229.53 -310.29` → map (14.57, 27.62),
  cell (14,27): matches GamerEscape walkthrough square (14,27)
- 0 recorded points within 30u; nearest node 1936 at 39.1u (Y 58.21). Y 57.0 is the
  mean of consistent 55–59 surroundings — stays flagged for live `!quicknavmesh` capture
- Duty mobs spawn in the private area at formation offsets around the entrant; no
  public-world spawns for this quest

## Fight: 3-wave vengeance duty (walkthrough + DAT lure text rows 68/69, 58/59)

Director 10 → 20 (report) / 0 (retry); party cap 3; 600 s timeout; boundary circle 45.0.
All 7 kills required (`requireAllTargets`).

| Wave | Mob | Actor | mobType | Lv | Skill |
|---|---|---|---|---|---|
| 1 x4 | Nannygoat | 2102313 | 1046 (public reuse) | 12–15 | 5002 |
| 2 | Nannygoat (lured 5th) | 2102313 | 1046 | 12–15 | 5002 |
| 2 | Death-marked Billygoat (boss) | 2202303 | 3126 | 15 | 5002 |
| 3 | Enraged Nannygoat (answers boss kill) | 2202307 | 32741 | 20 | 5002 |

- Boss credit grants Twisted Aldgoat Horn 11000015 once (HasItem guard, never consumed;
  grant failure never fails the duty)
- Enmity/leash: engine combat + `ConfigureScriptedOneShotLifecycle` + 45.0 boundary
- No chocobo actor, no ally, no reinforcements beyond wave 2→3 chain

## Triggers / rewards / sync / lockouts

- Entry: push trigger → `StartPrivateQuestBattle`; mounted players blocked with
  "Dismount your chocobo" (leader + every helper, re-checked after preEvent)
- Death/wipe, disconnect, area exit, abandon/re-accept (`quest-changed`), 600 s timeout,
  failed zone entry → fail to retry seq 0; `DisableReentry` blocks mid-duty rejoin
- Overlevel: no level sync in 1.0 retail; owner gated to THM ≥ 20 at accept/talk/push,
  no maximum — overleveled entry is retail-accurate
- Rewards: Wind Brand 5020210 + 1760 EXP (script, inv-full holds the step via
  grantCheckedItems); 20000 gil + 2000 THM marks 1000110 (central rows)
- No lockout beyond the one-time quest bit; dup turn-ins impossible (reward actor only
  at seq 20, completion is atomic after item grant)

## Sources / gaps

- GamerEscape The Big Payback (journal + walkthrough: Ossuary → (14,27) → Duty Calls
  instance → report); Fandom THM 1.0 quests; YouTube fzug_RoAlbA + n6e7hK3KmWg
  (walkthrough structure, previously reviewed per ranged CSV notes)
- OPEN: live-client acceptance of scenes/positions; trigger Y capture; adapter offsets /
  party cap / timer are documented reconstructions (INFERRED)
