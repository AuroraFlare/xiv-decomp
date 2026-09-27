# 111817 Prying Eyes — `Gcu301`

- Immortal Flames side quest | Level 25 | Patch 1.19 | Rank: Flame Private Third Class (1.19 sidequest tier)
- Offer: Lefchild 1000994, Eshtaime's Lapidaries, Ul'dah Merchant Strip (6,6), zone 209
- Prereq: 111807 (SQL authoritative); gates 111818 Different Strokes (`Gcu302`)
- Quest scripts: thin `gcu301.lua` + `gc_sidequest.lua:Gcu301` + `gc_sidequest_battles.lua`
  + director `QuestDirectorGcSideGcu301` + `gc_sqb_runtime` + `gc_sqb_quest` launcher
  + `gc_sidequest_item_objectives.lua` (Omnomite lure)
- Status: Implemented. Offer row stays commented in `quest_availability.lua:351` pending
  client acceptance, per repo policy for all reconstructed 1.19 offers.
- ORIGINAL WORK ONLY: public wikis/Lodestone/forums + repo sources + coordinate guide.
  No client binaries decompiled, disassembled, or copied. Every body cited below was opened.

## Public sources (inspected)

- Gamer Escape `Prying_Eyes` (obsolete-quest page): full journal text (cobalt vs prismatic
  eyes, mesas east of Camp Horizon, slay thirty coblyns, Omnomite lure) + walkthrough
  ("enter an instance where you must use the omnomite to summon and kill 30 Lead coblyns.
  After the 30th Lead Coblyn is defeated, an Angry Lead Coblyn will appear. Kill it to
  obtain the quest item").
- Official 1.19 patch notes (forum): `Prying Eyes | Lefchild | Ul'dah Merchant Strip (6,6)`.
- Official forum bug thread 35286 ("Monster wont appear in uldah quest Prying Eyes"):
  GLA 29, "killed 2 quest monsters, no more would appear", area coords x:15 y:29 —
  matches the server trigger square (15,29) exactly (see Placement).
- Fandom `It_Kills_with_Fire_(Ul'dah)`: fetch returned HTTP 403; not used as evidence.
- No quest-specific YouTube walkthrough found (general 1.0 compilations only, unusable
  for spawn positions). Journal CSV + wiki text are the public mechanic sources.

## Objectives / phases (VERIFIED: journal CSV + xtx_quest row + wiki)

- Journal 398 (seq 0): travel to the mesas east of Camp Horizon in Thanalan; slay thirty
  coblyns; use Lefchild's Omnomite to lure them. Up to two party members may accompany.
- Journal 399 (seq 10): prismatic eye prized from a dead coblyn; return to Eshtaime's
  Lapidaries and deliver it to Lefchild.
- Journal 397: quest summary/objective header (Flames demand, cobalt-vs-prismatic choice).
- Flow: ACCEPT (Lefchild) -> 0 (Omnomite lure, then kill 30 in private battle) -> 10
  (report to Lefchild). No dive/field-NPC beat; no post-fight movie.

## Actors / markers / spawns (VERIFIED: SQL + registry + map tool)

- Lefchild 1000994 / eventspawn 191 / zone 209 Ul'dah
  `(-127.24, 200.2, 267.51, rot 1.54)`. Private-area twin row 2041 (`pgl200_lefchild`,
  `PrivateAreaMasterPast`) is the Pugilist-quest copy, not this quest's giver.
- Public battle trigger 1099545 `gcu301_battle_entry` / eventspawn 3284 / zone 172
  `(-1118.0, 59.283302, -99.0)`. Push entry, 14u XZ / 2.5u Y tolerance, lure-flag gate.
- Zone 172 Western Thanalan, native page 1300 (scale 1, base 2687/3072):
  trigger -> map (15.69, 29.73), square (15,29). 37 recorded pts; node 8846 is the
  exact user-standing support `!pos 172 -1118.0 59.283302 -99.0`.
- Zone 209 Ul'dah, native page 1900 Merchant Strip (scale 2, base 736/352):
  Lefchild -> map (6.09, 6.20), square (6,6) — matches the 1.19 patch-note listing.
- Markers: start/reward 11203002 `(-127,268)`, battlefield 11203001 `(-1118,-99)`
  (quest_marker.csv rows inspected).
- Roster (private shell `gc_sqb_gcu301_<ownerId>`, actor 2102101, homes frozen to
  route + offsets with recorded floor Y; formation authored, native homes unrecovered):
  - 29x coblyn, mob 40303 `gc_side_coblyn`, lv 25, waves 1-5 (6/6/6/6/5).
  - 1x enraged coblyn (retail "Angry Lead Coblyn"), mob 40304
    `gc_side_enraged_coblyn`, lv 27, wave 6, `gcu301_enraged_coblyn`.
  - Six-slot formation offsets (X,Z): (-8,+5) (-4,+8) (0,+10) (+4,+8) (+8,+5) (0,+5);
    floor Y 59.411747 (node 8848) / 59.827354 (node 8870); enraged slot (0,+7).
  - Absolute homes: route (-1118,-99) + offsets, e.g. (-1126,-94), (-1122,-91),
    (-1118,-89), (-1114,-91), (-1110,-94), (-1118,-94); enraged (-1118,-92).

No public spawn rows; all targets are private one-shot lifecycle members.

## Triggers

- Omnomite use (item 11000406, seq 0 only): must stand in the public zone-172 marker
  box (14u XZ / 2.5u Y); sets flag 0 BEFORE consuming the exact selected slot, so a
  crash cannot eat the lure and dead-end the journal. Missing/elsewhere use refuses
  with "Use the Omnomite at the marked coblyn grounds."
- `onPush` on trigger 1099545: seq 0 + lure flag 0 + same area + zone 172 + inside
  the 14u/2.5u box. Without the lure flag the entry flag is never set and the push
  ends silently (`setEntry`/`onPush` both gate on flag 0).
- `StartGrandCompanySquadBattle`: public area, connected, combat class/job, alive,
  lv 25+, unmounted, no live shell with the same name; leader-only party pull
  (max 3, online/combat-ready/same-area/event-free/alive/level-qualified/unmounted,
  within 30u). Post-movie re-validation refuses the whole start before publication.

## Dialogue flow (VERIFIED: gcu301.csv texts 2-28 + gc_sidequest.lua dispatch)

- `processEventCLIFTONStart(ownCompany)` (shared offer-delegate name; bound to Lefchild
  1000994 for this quest): Flames-pledge greeting (2/28), Eshtaime's war-effort pivot
  (3-4), cobalt-eye vs prismatic-eye designs (5-7), "slay... thirty or so coblyns" near
  the mesas/Camp Horizon (8), Omnomite lure + give-up condition (9/25);
  `showQuestInfomation` accept -> text 11 (Omnomite 11000406 grant) / decline -> text 10.
- `processEvent_000` (seq 0 reminder): texts 12-13 (mesas east of Camp Horizon, 30
  coblyns, use the Omnomite).
- `processEvent_010` (seq 10 report): texts 14-22 + 26-27 ("This... is Prismatic Eye!",
  enraged-beast debrief, mutation-vs-defense-mechanism hypothesis, Yuyune report,
  Eshtaime brand saved, reward handoff).
- Wave/enrage line: text 26 "The coblyn becomes enraged!" (retail enrage beat; the
  server models it as the wave-6 enraged carrier, no separate emote packet).
- Accept item 11000406 Omnomite granted + repaired at every non-accept sequence;
  removed at completion along with the 11000405 Prismatic Eye evidence.

## Fight tuning (VERIFIED: battles config + mob/skill SQL + runtime bodies)

- Six waves, `requireAllTargets` (all 30 credited kills), 1800 s timeout, boundary
  radius 50u. Next wave spawns only after the current wave's exact roster is credited;
  the enraged carrier (wave 6) cannot appear while any packmate lives.
- Mob 40303 `gc_side_coblyn`: lv 25/25, skill list 5015 (Cluster Geyser 23114, Coblyn
  family row). Mob 40304 `gc_side_enraged_coblyn`: lv 27/27, same skill list.
  Retail "Lead Coblyn" naming is unrecovered server-side; the lv-25 Coblyn profile is
  the authored binding (actor 2102101 for both).
- No loot rows for 40303/40304 (quest kill credits + scripted eye grant only).
- Kill credit (`runtime.onKill`): class-ID fan-out reconciled against the exact spawned
  uniqueIds in the owned area; duplicates and foreign same-class kills never credit.
  Enraged-carrier death sets the earned flag (1) BEFORE granting the Prismatic Eye.
- Success: earned flag present -> cleared flag (2) -> eye re-ensured -> seq 10.
  Missing eye/flag fails closed back to seq 0 retry (trigger re-armed, lure flag kept).
- No retail wave/threshold data was recovered; the journal's "thirty" plus the wiki's
  "Angry Lead Coblyn after the 30th" fix the count and the finale — the 6/6/6/6/5+1
  pacing is authored.

## Chocobo disabled (VERIFIED: gc_sqb_quest.lua bodies)

- Leader mounted -> start refused ("Dismount your chocobo before entering...").
- Any party member mounted -> refused ("Every party member must dismount...").
- Post-movie re-validation refuses mounted entrants before publication (no partial
  roster). 1.0 has no combat companion, so mount exclusion is the complete policy.

## Wipes / resets / edge cases (VERIFIED: gc_sqb_runtime.lua bodies)

- Death, 1800 s timeout, disconnect, area exit, entry failure, entry-session replaced,
  quest changed/abandoned, wave-spawn failure -> fail -> seq 0 with trigger re-armed
  (lure flag persists, so no second Omnomite is needed).
- Owner-only completion; relog rebinds the same character id, never a helper.
- Seals (300) and EXP (1891) each checkpointed once; completion requires the `_010`
  scene to still be current, else the quest stays open for retry.
- Helpers without the quest get no journal writes; rewards resolve to the bound owner.
- Full-inventory eye delivery: `ensure` retries at every report contact; failure fails
  closed without advancing.

## No-loophole checklist

- [x] Ambient overworld coblyn kills cannot credit (private roster only, exact uniqueIds).
- [x] Entry without the Omnomite lure is impossible (flag gate pre- and post-push).
- [x] Mounted entry blocked for leader and every member, twice (pre + post movie).
- [x] Over-level / wrong-class / dead / transferring entrants refused.
- [x] Non-leader cannot drag a party into the shell.
- [x] Partial kills, timeout, death, disconnect, exit all retry from seq 0.
- [x] Enraged carrier cannot be skipped or duplicated (wave-6 singleton, earned flag once).
- [x] Prismatic Eye unobtainable outside the owned battle; Omnomite removed on completion.
- [x] Double reward impossible (seals + EXP checkpoints).
- [x] Re-entry disabled; second shell per owner blocked by name.
- [x] Stale-session / replaced-journal callbacks cannot rewrite the new journal.

## Rewards (VERIFIED: gc_sidequest.lua + gc_quest_template.lua + quest_new_reward.csv)

300 Flame Seals + 1891 EXP. `quest_new_reward.csv` row 490 carries the 300-seal reward;
`GC_QUEST_SEALS.Gcu301 = 300`; EXP 1891 is the shared six-route sidequest value
(matches the wiki's ~1,890 approximation on sibling routes).

## Open gaps / conflicts

- Retail "Lead Coblyn" actor binding and the enrage presentation (text 26 has no
  observed packet/scene wiring) are unrecovered; the wave-6 carrier is the authored
  representation. Do not invent an enrage cutscene without scene data.
- Wave pacing (6/6/6/6/5+1) and the compact formation are authored; only the count
  (30) and the finale (enraged carrier last) are recovered.
- Forum bug report (retail, Jan 2012): "killed 2 quest monsters, no more would appear"
  suggests a retail wave-spawn defect class; the server's `spawnWave` failure path
  (`wave-spawn-failed` -> seq 0 retry) is the authored containment, not a retail fix.
- No dedicated YouTube walkthrough found; wiki journal text is the public source.
- Live entry-scene lifetime; client acceptance (offer still commented).
