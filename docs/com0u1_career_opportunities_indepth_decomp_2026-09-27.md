# Com0u1 Career Opportunities (111801) indepth decomp - 2026-09-27 (GC IMMORTAL FLAMES)

Story Lv22 opening instance. Aubrey (Hall of Flames, Ul'dah) -> Taylor
(ferry docks, Western Thanalan) -> Urianger (SE of docks) -> private
Anole Familiar SQB (party <=3, 30 min) -> Thancred post-fight scene ->
Taylor's Letter -> Aubrey report. Status: ENABLED active-bespoke SQB.

## Client scenario (tools/outputs/lpb/content_systems_20260612/.../com/com0u1.lua)

- `processEventAUBREYStart`: texts 2-7 + 52 (Flames pitch, Taylor intro);
  `showQuestInfomation()==1` plays 9 (accept) else 8 (decline: "the
  offer stands"); returns the widget result. Nil/decline cannot accept.
- `processEvent_000`: Aubrey reminder, texts 49 + 53. Client-only.
- `processEvent_010`: Taylor briefing, texts 10-16 + 54 ("bring him to
  me--by force, if you must"). No accept branch: auto-advance.
- `processEvent_010_1`: Taylor followup, texts 17-18. Client-only.
- `processEvent_020(A3)`: fade-out, `startNQCutScene("COM0U105", 2)`;
  A3 false -> `startFadeInCutSceneAfterWarp` (server passes {false}).
- `processEvent_030(A3)`: fade-out, `startNQCutScene("COM0U110", 1, 0,
  A3)` (Thancred scene), fade-in-after-warp. Server passes {1}:
  native register-1 target init.
- `processEvent_040`: Taylor report, texts 40-45 (missed Urianger,
  funds-for-command terms), staged fades. Letter handoff beat.
- `processEvent_040_1`: Taylor reminder, text 50. Client-only.
- `processEvent_050`: Aubrey finale, texts 46-48 (letter read, report
  to Raubahn, enlistment pointer), staged fades.
- 9 own non-init methods, all processEvent-prefixed (scope doc agrees).
  Client director `QuestDirectorCom0u101` is a `SimpleQuestBattleBaseClass`
  shell: no count, waves, or kill callback (native-scenes doc).

## Stages / flags / markers / positions

- Sequences: 0 offer/Aubrey -> 10 Taylor -> 20 Urianger talk -> 30 SQB
  -> 40 Taylor+letter -> 50 Aubrey reward. Retry 20, success 40.
- Markers (quest_marker.csv, all Visible MapMarkerQuest): 11170001
  Taylor (-2195.07, -417.20, map 403, display 1000237); 11170002 battle
  (-1722.31, 102.22, map 403, display 4000257 area-not-actor, EXACT
  Urianger X/Z); 11170003 Aubrey (169.10, -174.70, map 5014 Ul'dah,
  display 1000288). Marker displays are map objects, not NPC actors.
- Journals (xtx_quest Wil): 337 offer, 338 Taylor, 339 Urianger ("Up to
  two party members may accompany you."), 340 Thancred, 341 return;
  395/396 post-kill summary variants; item ref 11000252; class req
  Disciples of War or Magic; icon 971.
- Instance: `gc_sqb_com0u1_<ownerId>` private shell, DisableReentry,
  boundary circle r=45 at entry, 1800 s timeout, cap 3, no level sync.

## NPCs / mobs

- Aubrey 1500198, spawn 2817, zone 233 (169, 0, -174.7), rot -1.5.
- Taylor 1001447, spawn 1037, zone 172 (-2195.31, 14.361, -417.438),
  rot 3.13; ferry doors 3.0u/7.4u away (same dock).
- Urianger 1060009, spawn 3228, zone 172 (-1722.31, 56.414, 102.22);
  exact recorded node 8632 on the spot (101 pts in 30u).
- Thancred 1000211: no spawn row; COM0U110 cutscene-only.
- Anole Familiar: actor 2200205 (`RaptorForestQuestCom0u1` chunk;
  registers class only, no local AI), mob 1360 (job 8, lv 19/19,
  hostile, detect 10, att 40, fire/ice 0.75, wind 1.25, no
  drops/spells), skill list 5049 (Foul Breath 23028/23030, Ripper
  Fang 23029, Scythe Tail 23031). Single wave, 1 kill.
- Guide coordinates (zone 172 page 1300, base 2687/3072, direct tool
  runs): Taylor map (4.92, 26.55) cell (4,26) = wiki (4,26);
  Urianger map (9.65, 31.74) cell (9,31) = wiki/Elemen (9,31).
  `!pos 172 -2195.310 14.361 -417.438` /
  `!pos 172 -1722.310 56.414 102.220`. Y from SQL/live pos only.

## Rewards

- EXP 1760, once-only (flag 23; completion usable after letter
  consumed). No gil, no seals (native quest_new_reward: no direct
  seal slot; Elemen: "No direct Flame Seal row + 1,760 EXP").
- Taylor's Letter 11000252 (Normal/DummyItem): granted at seq 40 with
  inventory-full retry hold; evidence-checked at 50; consumed once.

## Adapter (verified this pass; no changes needed)

- `com0u1.lua`: 6 objective delegates wired, SEQ_ACCEPT/decline guard,
  `StartGrandCompanySquadBattle` (COM0U105 preEventAfterWarp, exact
  2200205/1360/`com0u1_anole_familiar` binding), fail->20 relaunch,
  inert quest-level `onKillBNpc`, `EnsureGCQuestItem` letter gate,
  `CompleteGCQuestOnce(1760, {letter})`. Offer active
  (quest_availability.lua:323; SQL prereq 110014, Lv22).
- `QuestDirectorGcCom0u1` + `gc_sqb_runtime`: exact-kill reconcile,
  owner-only completion, death/timeout/disconnect/area-exit/
  quest-changed/entry-failed -> retry 20, COM0U110 post-fight event,
  full party return + content teardown. Mounted entry blocked
  (leader + members); no chocobo/companion inside; no level sync.
- Validator contracts hold statically: journal tokens 337-341,
  markers in raw CSV, SQB actor/mob bindings, retry/success
  sequencing, `successEvent_030`. Full validator run is blocked by
  pre-existing missing inputs in this checkout (`docs/
  grand_company_quests_decomp_2026-08-22.md` lives in FF14-Decomp,
  `tools/outputs/lpb/decomp_more_20260617` absent; equivalent
  scenario read at `content_systems_20260612`).

## Sources

Decompiled client scenario + director contract; DAT markers/actors/
journals/rewards/dialogue (com0u1.csv texts 2-54); server SQL rows;
map_coordinates guide + direct zone-172 runs; Elemen ledger (30-min
Anole content, letter 11000252, 1760 EXP); GamerEscape quest page
(journal + walkthrough: docks (4,26), Urianger (9,31), lv19
raptor-type, up to 2 companions). No YouTube footage found.
