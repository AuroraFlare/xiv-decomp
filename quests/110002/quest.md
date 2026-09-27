# 110002 Treasures of the Main — `Man0l1` (Limsa Lominsa MSQ #2, Lv 1, instance + escort)

- Quest: 110002 | Code: Man0l1 | Patch 1.0 | Type: Main Scenario / Escort
- Issuer: Baderon Tenfingers, Drowning Wench (Adventurers' Guild) | Prereq: 110001 Shapeless Melody
- Chain: Limsa opening; followed by 110003 Legends Adrift (Man1l0)
- Instance: Sisipu escort, Zephyr Gate -> Oschon's Torch lighthouse, private zone-128 copy
  (`SimpleContentMan0l101` + `Quest/QuestDirectorMan0l101`, 30-min limit, solo)
- Implementation (all bodies read in full, this session): `Data/scripts/quests/man/man0l1.lua`
  (1311 lines) + `Data/scripts/directors/Quest/QuestDirectorMan0l101.lua` (465 lines) +
  `Data/scripts/content/SimpleContentMan0l101.lua` (51 lines) +
  `Data/escortnavmesh/treasures_of_the_main.json` (656 waypoints, 5 stops). Two
  convention-alignment one-liners applied this session, see File map.

ORIGINAL WORK ONLY: no client binaries were decompiled or copied. Positions come from repo
Lua/JSON/SQL, coordinates verified with the repo map tool, mechanics from public wikis +
repo Lua/C# (all cited bodies inspected, not grep-only).

## Sources (VERIFIED by full-body read unless noted)

- Quest logic: `Data/scripts/quests/man/man0l1.lua` lines 1-1311 (SEQ table, all handlers).
- Escort director: `QuestDirectorMan0l101.lua` lines 1-465 (loop, fail/complete, dialogue map).
- Content: `SimpleContentMan0l101.lua` lines 1-51 (boundary, music, onPlayerLeft).
- Route: `treasures_of_the_main.json` (header + all 5 encounterStops; waypoint count via parse).
- Framework: `EscortRouteDirector.cs` (failure/leash/aggro/spawn sections), `ChocoboCaravanRoute.cs`
  (route fields), `EscortRouteBuilderUtils.cs` `ApplyTreasuresOfTheMainDefaults` (lines 259-311),
  `WorldManager.cs` `IsMountRestrictedArea` (lines 4134-4144), `global.lua` entry guard (lines 64-96).
- Siblings compared: `QuestDirectorGld300Escort.lua` + `SimpleContentGld300Escort.lua` (full read),
  `QuestDirectorCnj306Escort.lua` (grep), `gld300_spriggan_escort.json` / `souls_gone_wild.json`.
- Walkthrough: Final Fantasy Wiki `Limsa Lominsa's Main Scenario Quests (version 1.0)` (fetched;
  Treasures journal lines corroborate escort leg, see Objectives). Reward: linkpearl + 6000 gil + 200 EXP.
- Mechanics: Garlemald-Server issue #202 (man0l1 escort log-line thread; confirms Ankle Biter ambush
  waves engage both player and Sisipu; text rows 30120/30121, displayNameId 3205603 cited there).
- Video: YouTube `pnWHF9zhDIM` "MSQ 01: Limsa Lominsa" (Shapeless Melody + Treasures cutscenes).
  Page fetch returned metadata only, no transcript — video contents NOT verified.
- Coordinates: `tools/mobspawns/map_coordinates.py` `locate --zone 128 --world` for all 5 mob
  positions + `maps --zone 128` (this session; zone-128 recording sha256
  `3c6ca0a5...89100`, 10625 nodes). See Placement verification.

## Objectives (journal paraphrase; wiki-sourced, mechanics corroborated by quest Lua)

1. Baderon (Drowning Wench echo) -> attune Camp Bearded Rock aetheryte -> report back (SEQ 0-6).
2. Visit Culinarians' (Bismarck) and Musketeers' (Coral Tower) guilds; notify Baderon via
   linkshell (SEQ 7, dual counters CUL 0/1 + MSK 0-4, LS pack 2).
3. Fishermen's Guild: learn Sisipu's 6 hand signals via emote chain
   (bow/clap/congratulate/poke/joy/wave, counter 0-6; SEQ 35-40).
4. Escort Sisipu from Zephyr Gate to Oschon's Torch, fending off beasts (SEQ 48-50; the instance).
5. Search lighthouse, examine corpse, talk to Sisipu, collect pay at Fishermen's Guild (SEQ 55-65).
6. Contact Baderon; visit Naldiq & Vymelli's (Bodenolf -> H'naanza echo -> exit trigger) (SEQ 70-85).
7. Return to Baderon for reward: 6000 gil + 200 EXP (`processEventComplete` + `sqrwa`, SEQ 92).

## Sequence flow (VERIFIED: man0l1.lua)

- SEQ 0: echo in Adventurers' Guild private area (zone 133 `PrivateAreaMasterPast` type 2,
  spawn -459.62, 40.00, 196.37 rot 2.01). Baderon `processEvent020` + LS msg 1 -> SEQ 3, warp out.
- SEQ 3: attune Camp Bearded Rock (aetheryte 1280002). LS pack 1 ends tutorial mode.
- SEQ 5/6: Baderon `processEvent026` -> 6; `processEvent027` + Baderon's Recommendation -> 7.
- SEQ 7: CUL Charlys `processEvent030` (counter1=1, +1000 gil); MSK Isandorel chain 0->1 (`035`),
  push trigger 1090001 `processEvent040` (counter=2, warp zone 230 forge-echo), Isandorel `050`
  (counter=3, warp private type 3), exit trigger 1090003 (counter=4, `060`/`065` + LS if CUL done).
  Baderon reminder branch `027_2/3/4`; LS pack 2 -> SEQ 35 (`StartSequenceForNpcLs`).
- SEQ 35: N'nmulika `processEvent600` -> SEQ 40 + warp private type 5 (Fishermen's Guild echo).
- SEQ 40: emote lesson with Sisipu 1000155 (counter 3: 0-6, events `601_1..8`); N'nmulika reminder
  (`600_2` first, `1000_4` after); optional Faucillien `600_4` / Louviaune `600_3` lines. Final wave
  `processEvent602` -> public + SEQ 48. Counter-0 shift repair helper present (2026-09-26 save fix).
- SEQ 48: Zephyr Gate push trigger 1090004. Entry gate: `guardCombatInstanceEntry` (DoW/DoM only)
  then `contentsJoinAskInBasaClass` confirm -> `startMan0l1Content` (entry cutscene `processEvent604`,
  `DoZoneChangeContent` to private copy, spawn -63.25, 33.15, 164.51 rot 0.8). Decline/fail -> EndEvent.
- SEQ 50 (inside instance): escort runs (see Escort + Fight). Destination reached ->
  completion cutscene path -> push trigger 1090176 `processEvent605` -> `ContentFinished` +
  zone change to corpse scene (zone 128 `PrivateAreaMasterPast` type 2: 137.44, 60.33, 1322.0,
  rot -1.60) -> SEQ 55.
- SEQ 55: Windworn Corpse `processEvent610` -> SEQ 60 (other corpses `610_2` flavor).
- SEQ 60: Sisipu `processEvent615` -> SEQ 65 + warp zone 230 (-83.245, 30, 176.216).
- SEQ 65: FSH trigger 1090006 `processEvent620` (+3000 gil) + LS -> SEQ 70.
- SEQ 70: LS-wait (Baderon talkable, no icon; `625_2` + LS retry). LS pack 3 -> SEQ 75.
- SEQ 75: Bodenolf `processEvent630` -> SEQ 80 + warp forge copy (private type 4:
  -504.985, 42.490, 433.712, rot 2.35).
- SEQ 80: H'naanza `processEvent632` -> SEQ 85 (forge NPC flavor `630_2..9`, `1000_6` pointer).
- SEQ 85: exit trigger 1090007 `processEvent635` + LS -> SEQ 90. H'naanza double-talk guarded.
- SEQ 90: LS-wait (`625_2` + retry). LS pack 4 -> SEQ 92.
- SEQ 92: Baderon `processEventComplete` + `sqrwa(200 EXP)` + 6000 gil -> `CompleteQuest`.
- Re-entry: SEQ 55/60 keep Zephyr trigger pushable to restart the instance (same entry gate).
- Journal markers: every SEQ maps to its marker(s) in `getJournalMapMarkerList`, including
  private-vs-public branches (FSH guild, corpse, H'naanza). No marker-less SEQ except LS waits
  70/90 (recovery talk only, by design).

## Actors (quest + instance; VERIFIED: quest Lua header + route JSON + builder)

| Actor | Class ID | Role |
| --- | --- | --- |
| Baderon | 1000137 | quest giver, LS contact, reward |
| Sisipu (guild/emote) | 1000155 | emote lesson |
| Sisipu (escort ally) | 2290007 | escort NPC (`caravanActorClassId`) |
| Sisipu (lighthouse) | 1000156 | SEQ 55/60 talks |
| N'nmulika | 1000153 | FSH guild entry |
| Faucillien / Louviaune | 1000164 / 1000165 | optional echo dialogue |
| Ankle Biter (x5 waves) | 2205603 / BNPC 1365, size 5 | ambush mobs, fixed Lv 1 |
| Zephyr trigger | 1090004 | instance entry push |
| Lighthouse trigger | 1090176 (+ spawned `man0l1_completion_lighthouse_trigger`) | completion push |
| Corpses | 1000091 / 1000092 / 1000378 | SEQ 55/60 |
| Bodenolf / H'naanza | 1000144 / 1000145 | forge leg |
| Leash map marker | 1090384 (`ContentPrivateAreaRange`) | 32-yl escort radius ring |

## Positions / rotations (VERIFIED: Lua + JSON bodies)

- Content entry spawn: zone 128 copy, -63.25, 33.15, 164.51, rot 0.8.
- Route: 656 waypoints, (-48.703, 36.461, 162.034) -> (116.460, 61.850, 1274.414).
- Boundary square: X -90..160, Z 100..1300. Music: field 27 / battle 21.
- Fail return (public 128): -48.703, 36.461, 162.034, rot 2.20 (== route start).
- Final-encounter GM test point: 100.17192, 47.823196, 1236.7233, rot 0.374 (== stop5).
- Corpse scene (128 `PrivateAreaMasterPast` t2): 137.44, 60.33, 1322.0, rot -1.60.
- Lighthouse landmark (public SQL row 2724): 128.601, 61.552, 1299.231, map (26,43).
- Ambush stops (stop XYZ = escort halt point; mob XYZ = spawn center, radius 6):

| Stop | Halt (X, Y, Z) @ wp | Mob (X, Y, Z, rot) | Map cell |
| --- | --- | --- | --- |
| ambush1 | 4.714, 46.506, 124.714 @ 33 | 32.579, 44.036, 127.127, 1.593 | (25,31) |
| ambush2 | 69.563, 42.051, 467.077 @ 216 | 71.787, 44.388, 491.779, -3.032 | (25,34) |
| ambush3 | 128.366, 58.302, 721.173 @ 353 | 105.678, 64.404, 731.534, 1.965 | (26,37) |
| ambush4 | 53.058, 62.909, 799.461 @ 406 | 26.257, 64.265, 805.209, 1.502 | (25,38) |
| ambush5 | 100.172, 47.823, 1236.723 @ 636 | 105.949, 54.259, 1251.389, -2.649 | (26,42) |

## Placement verification (map_coordinates.py, zone 128 page 100, this session)

All 5 mob centers sit on recorded ground (nearest-node |dY| <= 0.35, |dXZ| <= 1.5):

- ambush1: node 4540 (33.334, 44.083, 127.476) d=0.83, dY=+0.05; 144 recorded pts in r30.
- ambush2: node 4620 (71.627, 44.375, 490.960) d=0.84, dY=-0.01; 55 recorded pts in r30.
- ambush3: node 4340 (106.160, 64.061, 730.659) d=1.00, dY=-0.34; 34 recorded pts in r30.
- ambush4: node 4380 (25.862, 64.586, 803.797) d=1.47, dY=+0.32; 42 recorded pts in r30.
- ambush5: node 369 (105.833, 54.498, 1252.587) d=1.20, dY=+0.24; 45 recorded pts in r30.
- Recording: `Data/quicknavmesh/zone_128.tsv` sha256 `3c6ca0a5…89100`, 10625 nodes.
- Per guide: heights are per-node evidence, not a heightmap; mob Y values above match their
  nearest nodes, so no Y changes needed. Random spawn offset (r=6) stays within covered ground.

## Triggers

- 1090004 Zephyr (SEQ 48/55/60): entry gate + join prompt + `startMan0l1Content`.
- 1090176 lighthouse (SEQ 50): completion push `processEvent605` -> corpse scene warp.
  Also spawned at runtime as `man0l1_completion_lighthouse_trigger` for the
  `KickEventWithType(pushDefault, 2)` completion cutscene kick (player-pos fallback).
- MSK 1090001 / echo exits 1090003+1090007 / FSH 1090006: quest-leg pushes (see SEQ flow).
- Blocker 1090372 (SEQ 0): Drowning Wench room bounds pushback.

## Cutscenes / processEvents (instance-relevant; quest-leg events in SEQ flow)

- `processEvent604` (entry): ends `startFadeInCutSceneAfterWarp`; source event kept alive
  through `DoZoneChangeContent` (EventFinish published post-load).
- `questBaseRewardSeting` on `noticeEvent`: clears entry NowLoading (fallback `_fadeIn` pair).
- Mission notice: text 50026 + 30 min (`attentionMessage`), once per run.
- Completion: `KickEventWithType(pushDefault, 2)` on the spawned trigger, `SendInstanceUpdate`,
  then `processEvent605` -> `605_2` (Sisipu lag flavor) -> corpse scene.
- Sisipu route dialogue (man0l1 sheet, SAY, name 1500024): 283 ready / 284 encounter start /
  285-288 clears 1-4 / 289 HP warning+failing / 290 final approach / 291 destination visible /
  292 destination reached. No clear line for stop 5 (completion cutscene takes over).

## Mob AI / phases (VERIFIED: builder + EscortRouteDirector.cs)

- 5 sequential phases (ambush1-5); escort halts at each stop until its mob dies.
- Each wave: 1x Ankle Biter, BNPC 1365, Lv fixed 1 (`RollEncounterMobLevel` min==max),
  stats via mob-type row or `ApplyLevelScaledBaseStatFallbacks`, HP reset to full, hostile
  presentation + battle icon, `ConfigureScriptedOneShotLifecycle`.
- Spawn: uniform-disc random offset r=6 around mob XYZ, Y fixed (authored height kept).
- Aggro: sight, 10 yalms, `IgnoreLevelDifference` (Lv-1 mob still notices high-level help),
  `IgnoreSpawnLeash=1` (ambush mobs never evade-reset mid-fight).
- No enrage, no adds, no phase transitions beyond stop->stop; no party scaling (fixed Lv 1,
  solo entry) — consistent with a Lv-1 retail MSQ escort.
- Completion: `CompleteOnFinalEncounterClear` + 1.0 s delay after stop-5 kill, then the
  completion cutscene kick. `HoldEscortActorsOnCompletion` keeps Sisipu visible.

## Escort pathing / follow rules (VERIFIED: route JSON + framework)

- Sisipu spawns as ally, registered in owner party; start delay 10 s (0 in final-test mode).
- Follow 6.0 yl / recall 4.0 yl; owner leash 32 yl: escort WAITS when owner is outside
  (`OwnerWaitOutsideLeash`), never fails on distance (`OwnerFailureDistance=0`, no grace).
- No teleport catch-up exists in the escort framework (same for all escort routes).
- Recall command available only if `CanCallBackEscort` (false here; owner-leash auto-follow only).
- Fail: escort HP <= 50% max (`escortHealthThreshold`); warning event at 75%.
- Disconnect: route pauses (`MOVE_STATE_STOPPED`), owner rebound on re-entry, resume gated on
  `IsQuestFightLandingReady`; Lua re-resolves the live Player every tick (stale-userdata safe).
- Destination: arrival distance 0.5; `completeWhenAnyPlayerArrives=false`.

## Fail edges (VERIFIED: director + content Lua)

| Edge | Behavior |
| --- | --- |
| Timeout (30 min) | `failEncounter`: SEQ -> 48, escort stopped, `ContentFinished`, EndEvent, warp to fail return, `EndDirector`. Post-loop cleanup covers no-player case. |
| Sisipu HP <= 50% | `FailEscortRoute("escortHealthThreshold")` -> same fail path. |
| Owner disconnect | Pause + rebind (above); no fail, no timeout forgiveness. |
| Abandon (leave area) | `onPlayerLeft`: SEQ 50 -> 48 (+UpdateENPCs); director loop exits at timeout / post-loop `EndDirector`. Re-enter via Zephyr. |
| Owner death (KO) | No KO hook in content API (framework-wide, siblings identical). Observed path: KO -> Return out -> abandon path above. No instant-fail on KO; escort waits on leash while owner is down. Design decision, not a bug — see Gaps. |
| Route data missing | `startRoute` fails -> immediate `failEncounter` with system message. |
| Entry denied | Non-DoW/DoM blocked pre-prompt (`guardCombatInstanceEntry`); join-decline ends event cleanly; content-create failure surfaces message + EndEvent (SEQ already 50 — re-push to retry). |
| Re-entry | Allowed at SEQ 48/55/60; each entry builds a fresh content area (full reset). |
| Party wipes / adds | N/A (solo, single-mob waves). |

## Chocobo / party / scaling (VERIFIED)

- No chocobo in instance: `WorldManager.IsMountRestrictedArea` is true for ANY private area
  (content copies included); `Player.EnforceMountRestrictionForCurrentArea` runs every tick
  (Player.cs:12816). Route layer now also `CanCallBackChocobo=false` (this session; matches
  Court-in-the-Sands + gld300 precedent; inert on the escort path but convention-correct).
- Solo: `DoZoneChangeContent` moves the single entering player; no party pull-in. Retail 1.0
  MSQ instances are solo. No level sync, no party-size scaling; mobs fixed Lv 1.

## SEQ/event loophole audit (VERIFIED: full quest read)

- All 19 SEQs have talk/push/emote/LS handlers + journal markers (except intentional LS waits).
- LS packs: 4 packs, sequence-gated; stale-LS drain + `retryMissingTreasuresLs` on Baderon talk
  (SEQ 7/70/90) prevent glow-stuck journals. `StartSequenceForNpcLs` advances 7->35, 70->75, 90->92.
- Emote chain: wrong-emote branches replay the current step (`601_8` + step event), never skip.
- Warp-event discipline: every after-warp event keeps the source event alive for the
  transition-owned EventFinish (commented at each site); `leavesEventForWarp` guards EndEvent.
- H'naanza double-talk (SEQ 85) and Baderon repeat-talk (SEQ 7/70/90) explicitly guarded.
- GM/test surface: `startMan0l1FinalEncounterTest`, `testMan0l1CompletionCutscene`,
  `finishMan0l1ToCorpseScene[NoCutscene]` — all validate player/area/quest/director first.
- OBSERVED (not changed): `completionCutscenePending` in QuestDirectorMan0l101 is never set
  true, so the `onEventStarted` noticeEvent branch (line 397) only fires for the GM
  `completionTest` arg. Live completion works via direct `kickCompletionCutscene` calls; the
  flag is vestigial. Left untouched — wiring it without the original intent risks double kicks.

## File map (memory repo; `C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/`)

- `Data/scripts/quests/man/man0l1.lua` — quest (1311 lines). No changes needed.
- `Data/scripts/directors/Quest/QuestDirectorMan0l101.lua` — duty director. No changes needed.
- `Data/scripts/content/SimpleContentMan0l101.lua` — content area. No changes needed.
- `Data/escortnavmesh/treasures_of_the_main.json` — route. THIS SESSION: `canCallBackChocobo`
  true -> false (quest-escort convention; escort path never reads it, zero behavior change).
- `Map Server/Utils/EscortRouteBuilderUtils.cs` — THIS SESSION: `ApplyTreasuresOfTheMainDefaults`
  now forces `route.CanCallBackChocobo = false` (matches `ApplyCourtInTheSandsDefaults`).
- Framework (read, unchanged): `Map Server/Actors/Director/EscortRouteDirector.cs`,
  `Map Server/DataObjects/ChocoboCaravanRoute.cs`, `Map Server/WorldManager.cs`
  (`IsMountRestrictedArea`), `Data/scripts/global.lua` (entry guard).

## Open gaps (concrete only)

1. Retail log-line fidelity: escort stop/kill messaging uses the shared escort-framework
   system lines ("The escort route has stopped for an encounter at ..."), not retail-style
   leve-log "Ankle Biter is engaged/defeated." (Garlemald #202's retail reading). Changing it
   means touching the shared framework used by every escort — needs an owner decision.
2. Owner-KO policy is implicit (KO -> Return -> abandon -> SEQ 48). No instant-fail, no
   stay-and-recover rule. Same as all sibling escorts; a retail-fidelity call either way is
   an owner decision + framework-level work.
3. `completionCutscenePending` vestigial flag (above). Dead code unless the setter is found.
4. Video evidence: no transcript recovered for `pnWHF9zhDIM`; ambush count/mechanics rest on
   the repo route (5 stops), wiki journal, and issue #202 — no independent retail video count.
5. 30-min limit / mission text 50026 are implementation values; no retail source found for the
   original time limit.
