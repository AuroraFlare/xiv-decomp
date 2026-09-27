# 111221 Brother from Another Mother (Mnk0j1) — in-depth decomp

Monk rank 30 (job unlock). Offer: Gagaruna (1000862) in the PGL guild,
Ul'dah zone 175 (-184.94, 190.55, 108.87, rot 1.49; spawn id 61).
Requires PUG 30 + LNC 15 (server gates; gamedata prereq 0).

Full doc: `docs/mnk0j1_brother_from_another_mother_decomp_2026-09-27.md`.

## Sequence / flags (server: job_quest_template.lua Mnk0j1 adapter)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Gagaruna offer | `processEventGAGARUNAStart`: boolean arg4 OR arg5 selects text 42 vs 6; offer once at pc69/0x3D8; accept 8 / decline 7,37 |
| 0 | Erik route (1060033; zone 175, -32.453/192.1/45.343, id 2466) | `processEvent005` (Mythril Pit T-8 handoff, texts 10-19,47-52,60) → launches private battle → seq 5 |
| 5 | Slay three Runagate Imps | Director `QuestDirectorJobMnk0j1`: exact-uniqueId kill credits, requireAllTargets → seq 10 |
| 10 | Automatic completion (no reward NPC) | `processEvent010` plays `mnk0j110` → `processEvent010_2_system` (world 35 + item widget) → `processEvent010_3_system` (long 59 + ability 27108 Shoulder Tackle) |

Journal: Wil 537 (Gagaruna→Erik) / 538 (kill imps; RECOMMENDED 3
companions, 4 total) / 539 next-quest notice. Selector map present.

## Dialogue / cutscenes (recovered client Mnk0j1)

`mnk0j110`: PC + Widargelt 1060032 + Erik 1060033 + imp shell 1001960
(scene-only; combat actor is 2202611). Widargelt dropkicks the last imp
into an aether pool, forcing the first chakra open, then hands over the
Soul of the Monk plus Erik's linkpearl. Plays automatically on victory;
skippable per NQ default; retry-safe (completion persisted by
`CompleteJobQuestFromContent` guards: exact quest/sequence/area/name).

## Objectives / markers

11221001 Erik/Mythril handoff; 11221002 fight: region 104/map 402,
X/Z (1283.36,-155.49), display ???. Zone is **171 Eastern Thanalan**
(template's `zoneId 144` contradicts its own region 104 + "south of Camp
Drybone"; 144 = Coerthas E. Highlands). Recorded ground: 22 nodes in
r30, Y≈256.2–256.7 (zone_171.tsv nodes 489-492,686); nearest
`!pos 171 1273.894 256.247 -166.275`. Scene PC setup
(1281.23,256.668,-170.937) corroborates. 1 ambient nightblade nearby.

## Instance / territory

- Fight: SimpleContentQuestBattle content copy
  `quest_sqb_mnk0j1_<pid>`, boundary radius 45, spawn = leader pos +
  offsets. Re-entry disabled. Max party 4, timeout 900 s.
- Client director `QuestDirectorMnk0j101` recovered EMPTY (SimpleQuestBattle
  shell — no count/wave/spawn callback). Count 3 + level 35 from
  walkthrough archive.
- Trigger gap (documented, Blm0j3-precedent accepted): retail triggers at
  the Mythril Pit destination; adapter launches from Erik's route talk.
  Marker kept for journal fidelity.

## Fight: three Runagate Imps (lv 35)

- Actor class 2202611 / private mob type 32735, uniqueIds
  `mnk0j1_runagate_imp_1..3`. No public mob profile row existed → new
  private row 32735 (imp-family list 5034 as explicitly-labeled adapter
  policy: Impish Incantations 23116-23118, Stardust 23119; retail kit
  unrecovered).
- Single wave; all three kills credit (exact uniqueId). Enmity/leash:
  standard content AI + 45-yalm boundary circle.
- Walkthrough/video consensus: open-area brawl at Mythril Pit T-8, no
  phases or adds beyond the three imps; Widargelt intervenes in the
  post-fight scene, not the fight.

## Triggers / edge handling

Wipe/timeout/disconnect/death/area-exit/quest-changed → gc_sqb_runtime
finish() → retrySequence 0 at Erik (native lease guards orphan shells);
abandon/reaccept → bound-quest check fails → no credit; party/solo →
leader-only start, cap 4, entrant validation
(online/same-area/combat-class/alive/level); cutscene skip → NQ default
path, completion independent of playback; OOB → boundary circle +
re-entry disabled; retrigger → exact uniqueId kill credits,
requireAllTargets. Mounted leader/members blocked pre- and post-movie
("Dismount your chocobo..."); engine denies mounting inside private
areas. No level sync (1.0 retail had none). No lockout beyond the 900 s
attempt timer.

## Rewards

Exp 2661 + Soul of the Monk 2000202x1 (key item) + The Keeper's Hymn
3020410x1 + Shoulder Tackle 27108x1, all central. All IDs verified in
gamedata.

## Sources

Recovered client `Mnk0j1` + empty `QuestDirectorMnk0j101`, DAT markers,
server_eventnpc/mob SQL rows above, 1.0 journal archive (Fandom Monk
Quests 1.0: Sil'dih battlefield south of Camp Drybone), walkthrough
count/level consensus. Runtime tests: `test_mnk.lua` Mnk0j1 group PASS.
