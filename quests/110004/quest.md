# 110004 Never the Twain Shall Meet — `Man2l0` (Limsa MSQ #4, Lv 13, ship-deck duel instance)

- Quest: 110004 | Code: Man2l0 | Lv 13 | Type: Main Scenario / instanced duel
- Issuer: Baderon, Mizzenmast Inn (actor 1000137) | Prereq: 110003 Legends Adrift (Man1l0)
- Chain: feeds 110013 Fade to White (Man200) via `gamedata_quest_prerequisite_groups`
  (110013,1,110004) alongside 110008/110012 (the three city lines).
- Implementation: `Data/scripts/quests/man/man2l0.lua` (quest, all bodies read)
  + `Data/scripts/directors/Quest/QuestDirectorMan2l001.lua` (duty, all bodies read).
- Engine duel APIs: `Map Server/Actors/Chara/Npc/BattleNpc.cs` (participation,
  single-death, duel-target, neutral-presentation, arena-circle bodies read).

ORIGINAL WORK ONLY: no client binaries were decompiled or copied. Positions come from
repo Lua/SQL, mechanics from public wikis/walkthroughs + repo Lua/C#.

## Sources (VERIFIED by full-body read unless noted)

- Quest script `man2l0.lua` (539 lines, CRLF-majority) and duty director
  `QuestDirectorMan2l001.lua` (694 lines, LF): read in full before and after this pass.
- Sibling conventions read: `QuestDirectorMan0l101.lua` (Limsa MSQ escort+fight, session
  handling), `QuestDirectorMan2g001.lua` + `man2g0.lua` (tier parallel, arena-circle
  leash), `gc_sqb_runtime.lua` (shared fail/timeout/disconnect/return contract),
  `quests/com/quest_battle_support.lua` (mount probe, party entrants).
- Retail dialogue: GamerEscape `Loremonger:Never_the_Twain_Shall_Meet` (fetched; Echo
  duel scene with If-Emerick-Wins / If-Merodaulyn-Wins branches, Y'shtola/Sahagin
  aftermath, Rostnsthal/Baderon/Sisipu beats read from the page body).
- Retail walkthrough: GamerEscape `Never_the_Twain_Shall_Meet` 12-step table (fetched):
  Baderon start -> Lower-Decks 5-7 instance -> Hob cutscene -> ship door -> back
  outside to fight -> "Pick a target ... You can also leave them to fight each other
  and not get involved, neither will attack you until you attack one of them."
  -> Baderon -> Lower La Noscea 27-41 -> Linkpearl x2 -> Coral Tower 6-2 ->
  Isaudorel -> Lower La Noscea 26-41 finale.
- Retail mechanics sentence: AlteredGamer walkthrough snippet (search 2026-09-27):
  "Emerick and Merodaulyn are fighting on deck; choose which of them to join with
  and help defeat the other." Full page fetch timed out; NOT full-body verified.
- Retail pain point: Square-Enix forum thread 51036 (search snippet): player stuck
  with ???? journal showing the Barracuda Galleon, unable to get back out to the
  ship. Motivates the SEQ_020 public re-entry marker added here.
- Video (NOT transcript-verified, page fetches return chrome only): YouTube
  `pnWHF9zhDIM` "MSQ 01: Limsa Lominsa" (48:06 Never the Twain Shall Meet),
  `vja5eQoJDso` "Final Fantasy XIV 1.0 - All Cutscenes" (01:05:52).
- Registry: `Data/sql/gamedata_quests.sql:36` (110004, Man2l0, prereq 110003, Lv 13);
  no row in `gamedata_quest_rewards.sql` (rewards are script-inline: 500 EXP + 30000
  gil; commented-out item 2001006 left as-is).
- BNPC profiles `server_battlenpc_mob_types.sql:553-554`: 1290 nightblade
  (actor 2280114, base Lv 43-45, skillList 86, dropList 1290) and 1291
  venomtongue_assassin (actor 2280120); the director overrides both to Lv 13,
  HP 850 / MP 120 / dmg 10 with story appearances 2290011/2290012.
- Coordinates: `tools/mobspawns/map_coordinates.py` `maps --zone 192` + `locate
  --world 1830.296 1827.331` (this session): zone 192 "Rhotano Sea" is
  `world_only`, zero navmesh nodes, zero catalog positions. All duty placements
  are script-authored private-instance constants (see Coordinate status).
  `mobs nightblade` fails: the tool rejects an unexpected
  `server_battlenpc_mob_types.sql` row shape (tool-side parse gap, out of scope;
  BNPC data taken from SQL directly).

## Objectives (retail walkthrough paraphrase, VERIFIED: GE quest page)

1. Talk to Baderon to start. 2. Lower Decks 5-7 docks instance. 3. Hob cutscene.
2. Ship hold door. 5. Back on deck: duel Emerick/Merodaulyn, pick a side (winner only
   changes the aftermath cutscene slightly). 6. Baderon. 7. Lower La Noscea 27-41
   (Gods' Grip outcrop). 8. Adventurers' Guild Linkpearl twice. 9. Coral Tower 6-2.
3. Isaudorel. 11. Lower La Noscea 26-41 finale (Blackburn/Y'shtola subecho).

## Sequence flow (VERIFIED: man2l0.lua)

- ACCEPT: Baderon `processEvent000` -> accept -> SEQ_000.
- SEQ_000: docks trigger (1090386) warps to Hob's ship copy (zone 230 area 8,
  -631.93, 2, 391.75); Hob (1000151) in-private `processEvent010` -> SEQ_010 +
  deck warp (zone 192 type 0: 1832.243, 16.352, 1834.965 @1.584).
- SEQ_010: hold door EVENTDOOR_SHIP1 (1090098, combat-gated) `processEvent012` ->
  SEQ_015 + hold warp (zone 192 type 1: 1823.579, -61.65, 1816.102 @2.42).
- SEQ_015: door EVENTDOOR_SHIP2 (1090099) back upstairs to the duty prompt
  (1824.234, 11.852, 1825.629 @-3.131); TRIGGER_DUTYSTART (1090085)
  `contentsJoinAskInBasaClass` -> `startMan2l0TwainDuty` (combat-gate + dismount
  gate) -> director + SEQ_020 + battle warp (1830.296, 16.347, 1827.331 @-0.017).
- SEQ_020: duel (see Duty). TRIGGER_DUTYSTART re-push with COMPLETE_PENDING ->
  `processEvent020(side)` -> SEQ_035 + public docks warp (zone 230:
  -639.325, 1, 403.967 @1.655). Stale DUTY_ACTIVE with no live director now
  recovers to SEQ_015 instead of stranding.
- SEQ_035: Baderon `processEvent050` -> SEQ_037. SEQ_037: TRIGGER_SEAFLD1 (1090082)
  `processEvent060` -> SEQ_040 + `NewNpcLsMsg(1)`.
- SEQ_040: NEW explicit branch clears the outcrop trigger/Baderon ENPCs; no world
  marker (linkpearl beat). `onNpcLS` pack {40,41} (two reads, matches retail
  "Linkpearl two times") advances 040 -> SEQ_042 on first read.
- SEQ_042: TRIGGER_MSK (1090003) `processEvent070` -> SEQ_045. SEQ_045: Isaudorel
  (1000152) `processEvent075` -> SEQ_050.
- SEQ_050: TRIGGER_SEAFLD2 (1090086) `processEvent080` -> SEQ_055 + echo warp
  (zone 128 type 3: 198.314, 25.928, 1186.126 @1.6).
- SEQ_055: TRIGGER_SEAFLD3 (1090087) `processEvent081` -> SEQ_070 + Limsa warp
  (zone 133: -435.501, 40, 202.698 @-2.152); re-pushing SEAFLD2 replays 080
  (idempotent). Y'shtola (1000001) `processEvent080_2` is flavor-only.
- SEQ_070: Baderon `processEvent081_2` + `sqrwa` widget -> CompleteQuest ->
  30000 gil (item 1000001) + 500 EXP. SEQ_060/065 never StartSequence'd (dead
  Stahlmann-spying/meteor/Ul'dah stubs; retail ends at the 26-41 finale).
- Markers: 11000401 Hob (-639.1, 409.4) ... 11000409 Baderon (-428.1, 186.0) from
  the script header; SEQ_010/015 switch private/public; SEQ_020 now returns
  MRKR_HOB when public (galleon re-entry), nothing on the deck; SEQ_040
  intentionally markerless; `getJournalInformation` returns 40,40,40 (unchanged).

## Duty (SEQ_020, zone 192 PrivateAreaMasterPast type 0)

Positions/rot (script constants, deck Y ~16.35 / prompt Y ~11.85 / hold Y -61.65):

| Actor | classId / uniqueId | X / Y / Z / rot |
| --- | --- | --- |
| Player battle landing / retry | — | 1830.296 / 16.347 / 1827.331 / -0.017 |
| Duty prompt (post-hold warp) | — | 1824.234 / 11.852 / 1825.629 / -3.131 |
| Emerick (bnpc 1290 nightblade, Lv13 HP850) | 2280114 / man2l0_duty_emerick | 1825.697 / 16.352 / 1847.167 / -2.193 |
| Merodaulyn (bnpc 1291 venomtongue, Lv13 HP850) | 2280120 / man2l0_duty_merodaulyn | 1822.552 / 16.347 / 1844.211 / 0.816 |
| Hob (story, suppressed in-duty) | 1000151 / man2l0_echo_hob | 1817.49 / 11.85 / 1830.99 / 1.55 |
| Barracuda knight 1 (suppressed) | 1000183 / man2l0_echo_cuda1 | 1819.43 / 11.85 / 1831.84 / -2.11 |
| Barracuda knight 2 (suppressed) | 1000184 / man2l0_echo_cuda2 | 1819.05 / 11.85 / 1829.44 / -1.085 |

- Battlefield rect: X 1812-1840, Z 1808-1855. Player leaving it fails the duty
  (ship-deck containment). Duelist leash: native arena circle
  `ConfigureQuestFightArenaCircle(1826.0, 1831.5, 18.0)` on both combatants
  (same API as the Man2g001 parallel; both spawns sit inside at ~15.7/~13.2).
- Triggers: TRIGGER_DUTYSTART push starts (`contentsJoinAskInBasaClass` accept)
  and completes (`processEvent020(side)` via `KickEventWithType` on unique
  `man2l0_echo_push_dutystart`, event `pushDefault`/type 2). Entry cutscene
  `processEvent013`; fight notice text 50026 with the 30-minute clock.
- Mob AI (VERIFIED C#): both DPS AI; `SetQuestFightDuelTarget` each other;
  `HATE_TYPE_NONE` neutral presentation (never aggro the player first, per
  retail); `SetQuestFightPlayerAssistAllowed(true)` (player can damage either).
  Participation gate (`TryPreventQuestFightPreParticipationDeath`): pre-player
  killing blows clamp at 1 HP; the first player/pet hit on either duelist
  resolves participation for both, then either may fall. Single-death partner
  (`TryPreventQuestFightSingleDeath`): once one duelist is dead the other
  cannot die — exactly one winner, no double-KO. Completion polls each tick
  (2s settle, then `processEvent020`); `onKillBNpc` is a deliberate no-op to
  avoid double-kicking the completion scene.
- Phases/adds/enrage: single phase only; no adds, no enrage in retail (walkthrough
  + duel dialogue show one continuous deck fight; loser survives). The 30-minute
  timeout is the only clock. No escort anywhere in this quest (contrast Man0l101).
- Party/solo scaling: owner-solo bind, fixed stats, no scaling — retail had none
  at this tier and the parallel man duties bind the holder alone. Party members
  stay outside the private copy (documented at the join call).
- Chocobo: no chocobo actor spawned/admitted; NEW dismount entry gate
  (`isMan2l0Mounted`, mirrors `quest_battle_support.isMounted`) plus the
  private-area engine mount ban.

## Fail edges (all wired, no loopholes found after this pass)

| Edge | Behavior |
| --- | --- |
| Death (incl. during completion settle) | `failTwainDuty`: flags cleared, SEQ_015, story actors restored, deck retry warp, director ended |
| 30-min timeout | Same fail path (`timeout`); orphan-without-player branch cleans up + ends director |
| Leaving the deck rect | Same fail path (`leftBattlefield`) |
| Disconnect (all members) | NEW: 5-tick grace, then `teardownTwainDutyAfterDisconnect` (combat cleaned, actors restored, director ended, quest untouched); per-tick `GetPCInWorld`/`HasConnectedSession` re-resolution (Man0l101 pattern) so stale userdata never drives logic |
| Abandon / sequence moved off 015/020 | NEW: `ejectTwainDutyAfterQuestChange` to public docks (zone 230, -639.325, 1, 403.967) with zero quest mutation; stale DUTY_ACTIVE later self-recovers at the SEQ_020 trigger |
| Spawn failure | Fail path (`spawnFailed`) with player-facing error |
| Missing quest at completion | Fail path (`missingQuest`) |
| Missing completion trigger / KickEvent API | Player-facing error, quest staged at SEQ_020 for manual probing |
| Stale director (crash/teardown race) | SEQ_020 trigger push detects `GetDirector == nil` + DUTY_ACTIVE and recovers to SEQ_015 |

## File map (this pass)

- `FF14-Memory/Data/scripts/quests/man/man2l0.lua` (+48): dismount gate,
  solo/scaling comment, SEQ_040 ENPC branch, SEQ_020 stale-director recovery,
  SEQ_020/SEQ_040 marker branches.
- `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorMan2l001.lua` (+172/-):
  retail-contract header, session-aware resolution, disconnect teardown, abandon
  eject, completion death-guard, arena-circle leash, reworked main loop.
- `FF14-Memory/tests/test_man2l0_twain_duty.py` (new): 10 source-assertion tests
  in the `tests/test_*.py` convention.
- No SQL/registry changes: adding a `gamedata_quest_rewards` row would double-grant
  against the inline script rewards; BNPC base profiles stay Lv43-45 with director
  overrides (verified pattern, not a bug).

## Coordinate status

Zone 192 is `world_only` (no native map binding, no navmesh, no catalog rows), so
the guide's map/pixel path does not apply; `maps` + `locate --world` were run and
heights are taken from the authored ship-deck constants (prompt 11.852, deck
~16.35, hold -61.65), which match the warp/landing set. No `plan` export: private
content-owned placements stay in Lua, never in public spawn SQL. Arena-circle
geometry derived from the script rect + spawn offsets (no invented ground).

## Gaps / unresolved

- Participation nuance: retail says you may "leave them to fight each other and not
  get involved", while the engine stalls the duel at 1 HP until the player lands a
  hit. Kept the gate (retail completion text confirms the player "came in 'andy";
  a zero-damage auto-win is the less likely reading). Live 1.x footage with a
  fully hands-off clear would settle it; the two cited YouTube compilations have no
  usable fetched transcript.
- `getJournalInformation` returns placeholder 40,40,40 (pre-existing; sibling
  man1l0 has no journal function at all). Real journal text IDs need a text-datamine
  pass and are out of scope here.
- No Lua interpreter ships with the repo: Lua edits were verified by exact-anchor
  application + `git diff` review + the new source-assertion suite, not by executing
  the scripts. A `MsqEntryTests`-style live run of SEQ_015->020->035 remains the
  end-to-end proof.
