# 111801 Career Opportunities — `Com0u1` (Immortal Flames opening, Story Lv22 instance)

- Company: Immortal Flames (Ul'dah) | Level: 22 | Offer: First Flame Lieutenant Aubrey 1500198 | Status: Implemented (active-bespoke, SQB)
- Quest scripts: `Data/scripts/quests/com/com0u1.lua` + `Data/scripts/directors/Quest/QuestDirectorGcCom0u1.lua` (gc_sqb shell).
- Companion: `FF14-Decomp/docs/com0u1_career_opportunities_indepth_decomp_2026-09-27.md`.
- Chain: prereq 110014 (SQL + availability), followed by 111802 Kindling a Flame (Com0u2, prereq 111801).

## Sequence flow (VERIFIED: native scenario + server wrappers + DAT markers)

- ACCEPT Aubrey `processEventAUBREYStart` (texts 2-7 + 52 offer; 9 accept / 8 decline; accept iff `showQuestInfomation()==1`) -> 10 Taylor `processEvent_010` (texts 10-16 + 54; auto-advance, no branch) -> 20 Urianger talk -> 30 private SQB entry via `processEvent_020`/COM0U105 (arg false = fade-in-after-warp) -> kill -> `processEvent_030`/COM0U110 (arg 1, Thancred scene) -> 40 Taylor `processEvent_040` (texts 40-45 + letter 11000252) -> 50 Aubrey `processEvent_050` (texts 46-48) -> complete.
- Native reminders `processEvent_000` (Aubrey texts 49/53), `processEvent_010_1` (Taylor 17/18), `processEvent_040_1` (Taylor 50) stay unbound server-side (sibling Com0l1/Com0g1 convention: objective events only).

## Delegate events (VERIFIED: content_systems_20260612 scenario body)

Wired: processEventAUBREYStart/processEvent_010/processEvent_020/processEvent_030/processEvent_040/processEvent_050. 9 native own methods total; the 3 reminder methods above are client-only flavor.

## Actors/markers (VERIFIED: quest_marker.csv + server_eventnpc_spawn_locations.sql)

- Aubrey 1500198/spawn 2817/zone 233 Hall of Flames (169, 0, -174.7); marker 11170003 (169.10, -174.70, map 5014, display 1000288).
- Taylor 1001447/spawn 1037/zone 172 ferry docks (-2195.31, 14.361, -417.438); marker 11170001 (-2195.07, -417.20, map 403, display 1000237).
- Urianger 1060009/spawn 3228/zone 172 (-1722.31, 56.414, 102.22); marker 11170002 is the exact same X/Z (area marker, display 4000257, map 403).
- Thancred 1000211 has no public spawn row: cutscene-only (COM0U110).
- Journal map markers: seq 0/50 -> {11170003}, 10/40 -> {11170001}, 20/30 -> {11170002}. Journals Wil 337/338/339/340/341 (offer/Taylor/Urianger/Thancred/return); 395/396 = post-kill summary variants. Class req: Disciples of War or Magic.

## Fight (VERIFIED: actor class + mob row + skill list; retail AI unrecovered)

1x Anole Familiar (`RaptorForestQuestCom0u1`), actor 2200205, private mob 1360 lv19 (job 8, hostile, detect range 10, hostile, no drops/spells), skill list 5049: Foul Breath 23028/23030, Ripper Fang 23029, Scythe Tail 23031 (eLeMeN family Raptor).
Single wave, single target, requireAllTargets-equivalent (1 kill). Director `QuestDirectorGcCom0u1`: expected 30 -> success 40 / retry 20, 1800 s (Elemen 30-minute content), party cap 3 (journal: up to two companions), native client class `/Director/Quest/SimpleQuestBattle/QuestDirectorCom0u101`.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + direct tool runs, zone 172 page 1300, base 2687/3072)

- Taylor/docks 11170001 -> map (4.92, 26.55), cell (4,26) = wiki (4,26); 41 recorded pts; ferry doors 3.0u/7.4u away; `!pos 172 -2195.310 14.361 -417.438`.
- Urianger/battle 11170002 -> map (9.65, 31.74), cell (9,31) = wiki/Elemen (9,31); 101 recorded pts incl. exact node 8632 at the spot; `!pos 172 -1722.310 56.414 102.220`.
- Private shell `gc_sqb_com0u1_<ownerId>`; spawn = player pos + 4u facing; boundary circle r=45; Y from live player pos (guide: Y unresolved at center, no extrapolation).
- No public spawn rows for the familiar (private-encounter summon only).

## Rewards (VERIFIED: native reward row + ledger + server checkpoint)

1760 EXP (once-only flag; survives interrupted close even after letter consumed) + Taylor's Letter 11000252 (DummyItem, inventory-full holds at seq 40 for retry, consumed at completion). No gil, no Flame Seals (native: no direct seal slot; Elemen agrees).

## Edge handling (VERIFIED: gc_sqb_quest.lua + gc_sqb_runtime.lua + com0u1.lua bodies)

Launcher refuses mounted starts (leader + every member, actionable dismount messages); non-leader gets solo path; party validated pre/post movie (online, same area, combat class/job, alive, unmounted, no open event). Runtime: death/timeout/disconnect/area-exit/quest-changed/entry-failed/wave-spawn-failed -> fail -> retry seq 20 at Urianger; kill credits reconcile exact uniqueId + dead + same-area actors (ambient/product-fanout kills ignored); owner-only completion; success requires connected + in-area + alive + current quest. Quest-level onKillBNpc inert (validator pins absence of public fallback). Cutscene-skip/post-fight failure -> retry path. No retail level sync: Lv22 floor only, overlevel uncapped. Re-entry disabled; abandon/reaccept rebinds safely (owner id fixed, helper never adopted).

## Open gaps

- Live client acceptance of COM0U105/COM0U110 + entry-scene lifetime.
- Retail familiar combat AI beyond skill list 5049 (base raptor behavior assumed).
- No YouTube footage found (3 queries); staging verified via recorded navmesh + DAT markers instead.
