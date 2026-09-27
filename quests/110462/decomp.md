# 110462 Runaway Little Girl (Min306) — indepth decomp 2026-09-27

Miner Lv.36 class quest. Talk + viewpoint push + escort with three digging
stops (two pits each) + docks Linkpearl + Linette reward. Escort/chase
resolved through gathering, not combat. No mobs, no fight, no sync, no lockout.

## Sources (bodies inspected)

- Live script `FF14-Memory/Data/scripts/quests/min/min306.lua` (bespoke) +
  `min_quest_helpers.lua`; decomp source row `Min306` in
  `class_quest_template.lua`; `docs/min306_runaway_little_girl_2026-09-27.md`;
  `docs/min300_min306_registration_2026-09-27.md`; pack doc
  `FF14-Decomp/docs/class-quest-gathering-indepth-decomp-2026-09-27.md` s8 (video log).
- Client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/min/min306.lua`
  (decompiled); DAT `quest_marker.csv` rows 11046201-11046207 (11046208-20 filler);
  `xtx_quest` 110462 J189-194; NpcLS 25.
- Walkthrough: <https://ffxiv.gamerescape.com/wiki/Runaway_Little_Girl>
  (1 Linette; 2 Momodi at Adventurer's Guild; 3 spot south of Ul'dah CS;
  4 border CS toward Ferry Docks; 5 escort — "At three points, the NPC will
  stop and mining points will appear. Once two points are mined (one time
  each) then the escort proceeds"; 6 docks CS; 7 Amajina & Sons Linkpearl;
  8 guild reward. Also: aetherite-attune Linkpearl summons to the guild.)
  Journal text confirms the chain (Quicksand -> Sil'dih mirage -> western
  border wait -> escort west digging to lose pursuer -> Vesper Bay linkpearl ->
  Linette reward).
- Footage: `https://www.youtube.com/watch?v=BH7aGNzP0Jo` (ElysiaZalakria
  2011-11-25, 1.19a; "first digging point" implies plurality);
  `https://www.youtube.com/watch?v=ZGNWqe7EXuM` (MithraTales 2011-03-10;
  NPC-linkpearl -> Linette -> Momodi -> south-of-Ul'dah CS -> Black Brush/
  Horizon road -> follow Nenekko -> dig "about 3 times" -> ferry CS ->
  linkpearl -> Linette); `https://www.youtube.com/watch?v=020N-xh5Cm4`
  (WotgAshiee LP548 2012-07-20); `https://www.youtube.com/watch?v=1TDAwECkPY0`
  (compilation ch 18:31-28:28).
- eLeMeN archive `.../quest/ClassQuest/Miner3.html` (JP journals; reward
  36,000 gil + EXP ~4720 added patch 1.20, tokens A-3600 removed).

## Sequence / flags / counters

Retail ladder: ACCEPT (Linette) -> 0 Momodi inquiry + Quicksand Nenekko scene ->
5 Sil'dih viewpoint -> 10 western border meet -> 13 escort (3 stops x 2 pits) ->
15 Linkpearl contact -> 20 Linette reward. Seq 3 ("hear Nenekko at the
Quicksand") is carried by the 013 scene itself (no separate owner, marker
11046202 is a placeholder), so the route continues 0->5 (Fsh306 precedent).
All J189-194 rows static; `getJournalInformation` returns zeros; dig progress
rides on "Pits dug: n of 6" attention messages.
Flags 0-5: one per pit, each dug exactly once (Exc300 pattern). No counters.

## NPCs / actors

- Linette 1000861 (offer + reward), zone 209 public row 177.
- Momodi 1000841 (Quicksand inquiry), zone 175 public row.
- Nenekko 1000604, five same-class rows, proximity-gated talks (60-yalm
  radius, Arc300 Keelty precedent), 350+ yalms apart (never co-visible):
  border 3342 zone 172 (-728.06 / 122.81 / -357.15) DAT-exact X/Z;
  stop1 3343 (-1139.75 / 60.24 / -345.40); stop2 3344 (-1549.04 / 56.22 /
  -397.32); stop3 3345 (-1864.75 / 55.83 / -409.91); docks 3352
  (-2155.0 / 14.39 / -428.0) DAT-exact X/Z. Candidates 1000604/2290035
  appearance-identical. Nenekko moves discretely between static rows (no
  server phasing; Fsh300 one-row-per-spot precedent).
- No pursuer actor: identity/behavior unrecovered, and killing it is
  explicitly forbidden by the source, so no stand-in is substituted; digging
  gates progress per the recovered rule and the threat stays fictional.

## Dialogue / cutscene IDs (delegateEvent)

`processEventLinetteStart` (offer, nil-accept) -> `processEvent013`
(Momodi talk rows 70-71 + Quicksand Nenekko scene min30610) ->
`processEvent020` (Sil'dih viewpoint fade-only; expected scene min30620
missing) -> border meet (NO recovered client event; talk advances on the
meeting alone, Hrv300 precedent) -> escort digs (no talk events at stops) ->
`processEvent030` (docks aftermath, afterWarp, on 6th pit) ->
`processEvent035` (farewell rows 53-54, lights pearl; Nenekko's 030_2 row-147
"send word to my brothers" motivates the pearl) -> `processEvent040`
(Linette reward). 007/013/035 ambient variants unbound (no owners).
No quest-specific Linkpearl text: one server-authored status line + engine glow.

## Objectives / mechanics

Escort: three stops on recorded road nodes at t~=0.29/0.58/0.80 of the
border->docks line (live nodes 1674/2922/4216; even-spacing rule authored,
ground recorded). Two 1000174 dig triggers per stop (rows 3346-3351, +/-4
yalm X offsets, anchor Y; Exc300 valuable-cluster precedent). Stop pairs gate
in order (retail "the escort proceeds" rule; redirect otherwise); each pit dug
once, retired after use. Stop-row Nenekko talks play nothing (Arc300
wrong-phase precedent). During escort + pearl steps the docks marker 11046205
guides (stops have no DAT markers). No failure/retry: open-world escort,
retail failure rules unrecovered (safe direction: none).

## Territories / positions (mob-guide method)

Ul'dah (Momodi 11046201) -> Central Thanalan Sil'dih viewpoint 11046203
(row 3341 zone 170: 131.0 / 152.25 / 487.0, DAT-exact X/Z) -> Western
Thanalan border 11046204 -> Vesper Bay docks 11046205 -> Ul'dah Linette
11046207. Placeholders 11046202/06 (-431/187) never bound. Y from recorded
ground / nearest catalog rows per `FF14-Memory/docs/mob_map_coordinates.md`
(`map_coordinates.py`); rotations 0.0 scaffolds. Rows also mirrored in
`Data/sql/live migrations/min300_min306_route.sql`.

## Mobs / fight

None. Escort resolved through gathering; no director; no mob IDs/stats/
abilities/AI; no pursuer stand-in (see above). No chocobo: 0 mount-spawn API
hits in miner scripts. No instance exists server-side, so no unsummon/block
is owed.

## Rewards / sync / lockouts

Central: 36,000 gil + 3,600 Miner marks (1000121). Script grants 4,720 EXP
(post-1.20 tier maximum, Arc306/Cnj306 precedent; eLeMeN ~4720) + `sqrwa`
presentation + Master of Rock 29724 via `player:LearnAbility(39, 29724, true)`
(job-template API). No level sync (no fight), no lockout, no timer.
Prereq: Miner 36 + 110461 completed, enforced in-script (Fsh300 precedent).

## Loophole coverage (verified in script body)

Qualified-gate on every handler (class+level+prereq); nil-accept offer retries
on full log; viewpoint uniqueId check + retire; border/docks talks
proximity-gated (wrong-row talks play nothing); stop-order gating with
redirect; already-dug/unknown pits never advance (known rows retired);
6th pit plays aftermath and advances; pearl msgStep!=0 ends cleanly; reward
(LearnAbility+CompleteQuest+AddExp) only via Linette at seq 20; flags
persisted across logout/DC; re-accept re-clears flags; no dup (flag-gated
pits); inv-full N/A (no item grants); death/wipe N/A (no fight).

## Implementation files (all pre-existing, verified)

`Data/scripts/quests/min/min306.lua`, `class_quest_template.lua` Min306 row
(`offer = true`), `quest_availability.lua` (110462 enabled),
`server_eventnpc_spawn_locations.sql` rows 3341-3352 + live migration,
`tools/validate_min306_route.py` (PASS).
