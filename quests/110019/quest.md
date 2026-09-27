# 110019 Futures Perfect — `Man406`

- MSQ Path of the Twelve #11 [Lv. 46] | Zone: 190 Mor Dhona (private content copy) | Prereq: 110018
- Scripts: `Data/scripts/quests/man/man406.lua` + `Data/scripts/content/SimpleContentMan40601.lua` + `Data/scripts/directors/Quest/QuestDirectorMan40601.lua` + `Data/escortnavmesh/futures_perfect_imperial_pursuit.json`
- Availability: `quest_availability.lua` line 131 — Implemented.
- Retail story (forum patch-note summary, inspected): the rescued Ala Mhigan Resistance members plus the headstrong Path Companion rush to Silvertear Falls to steal an Imperial airship against Minfilia's warnings; the companion is shot (Gaius) and sent to the Ul'dah ALC guild. All-cutscenes archive has Futures Perfect after Of Men They Sing.
- Retail scenario (inspected): `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/man/man406.lua` (349 lines, full function bodies below). NOTE: `tools/validate_futures_perfect_man406.py` also cites a `decomp_more_20260617` scenario+director pair that is absent from this checkout, so that validator currently cannot run here (pre-existing).

## Objectives / phases (VERIFIED: man406.lua + recovered retail bodies)

| Seq | Phase | What the player does |
| --- | --- | --- |
| ACCEPT | Offer | Minfilia 1000843 `pES` (`man40600` SNPC-NQ mode 2; after-warp iff result==1) → accept → SEQ 000 |
| 000 | Briefing | Talk to all 7 Resistance briefers 1000477-83 (`processEvent000_1..7`, flags 0-6, journal counts them) |
| 005 | Minfilia advance | Minfilia refuses until all 7 flags set → `pE10` (`man40610`, default fade) → SEQ 010 |
| 010 | Revenant's Toll | Push 1090191 → `pE15` (`man40615`, after-warp) + content entry → SEQ 015 |
| 015 | Pursuit + battle | `processEvent020` (`man40620`, arg true = default fade in-area) → 77-wpt pursuit → `processEvent025` (`MAN40625` HQ, default fade) → 4-mob fight → `pE30` chain → SEQ 020 |
| 020 | Cave aftermath | 5 children talks (`processEvent045_1..5`) → push 1090192 → `pE50` (`man40650`, after-warp) → SEQ 025 + public return |
| 025 | Report | Tataru 1001046 `pE60` (`man40660`, after-warp) + reward window + Goobbue → complete |

Retail `pE30` chains three scenes before one after-warp fade: `man40630` (SNPC-NQ) + `man40635` (SNPC-HQ) + `man40645` (NQ).

## Delegate events not wired (flavor only, no progression gate)

Recovered but unwired (owning-actor mapping unrecovered, all talk-turn `say` lines): `processEvent010_1..9`, `pE16/pE17/pE18`, `processEvent015_4/5`, `pE52` (9 personality variants like `pE01`), `pE61`, `processEvent060_2..6`. None gates SEQ advance; pursuit/combat/cave completion never depends on them. See Unresolved.

## Actors / triggers / markers (VERIFIED: scripts + SQL rows + coordinate tool)

- Minfilia 1000843 (ACCEPT/000/005, marker 11001902); Ul'dah market entrance 1090265 (ACCEPT/025 Waking Sands hop, marker 11001901).
- Briefers 1000477-83, flags 0-6, `processEvent000_1..7` in order.
- Revenant's Toll trigger 1090191 at `190 (-218.47, 18.542, -666.627)` (SQL id 3083, marker 11001903); content entry rot -2.817; duty start `(-168.856, 18.64, -703.84, 1.658)`.
- Visual-only Revenant's Toll aetheryte 1280122 re-created in-copy at `(-215.61, 18.524, -668.759)` with cleared event conditions.
- Combat entry (post-MAN40625): `(128.823, 44.257, -636.224, 1.581)`; boundary square `(-300,-830)-(340,-630)`.
- Cave children 1000957-61 at `y≈55.1, z≈-799..-800` (see placements.md); cave trigger spawn `(227.76, 62.0, -788.86)`; cave arrival `(265.47, 56.408, -799.867, -1.654)` (marker 11001904).
- Public return `(173.43, 18.7, -641.26, 2.2)` (marker 11001906); Tataru marker 11001905.

## Pursuit (VERIFIED: route JSON + director + escort runtime)

- Route `futures_perfect_imperial_pursuit`, zone 190, 77 recorded waypoints `(-152.77,18.46,-704.93)` → `(101.03,39.61,-662.44)`, speed 4.5 (55-70 s run).
- Formation: center hoplomachus 2280003 + wings sagittarius 2280006 (+3.0, lag 1.75) / centurion 2207001 (-3.0, lag 3.0); wing pace variation 0.6/0.8 y, periods 9/11 s, phases 0/0.5 (never lockstep, never overtake).
- Boundary, not leash: `OwnerFailureDistance 34.0` = visible circle, 3.0 s grace; `OwnerLeashDistance 0`, `OwnerWaitOutsideLeash false` (imperials never pause); fail → battlefield fail.
- Spawned as allies (monster nameplate work intact), level badge hidden, no map marker, `canCallBackChocobo=false`; held on completion until MAN40625 returns (scene restore targets), then combat spawns.

## Fight (VERIFIED: director COMBATANTS + mob-type SQL + MobSkillState.cs)

| Mob | Class / BNPC | HP (L50) | Pos / rot |
| --- | --- | --- | --- |
| Imperial juggernaut | 2202401 / 32716 | 14874 | (188.595,44.0,-640.177,-1.428) |
| Imperial centurion (flees) | 2207001 / 32717 | 6200 | (182.257,43.843,-643.488,-0.063) |
| Imperial hoplomachus | 2280003 / 32718 | 5600 | (184.175,44.346,-633.383,-1.159) |
| Imperial sagittarius (ranged hold) | 2280006 / 32719 | 4800 | (195.774,44.343,-641.046,-1.159) |

- AI: DPS, detection 30, spawn leash 80, link 45, no roam, attack range 6 (sagittarius 14 + ranged-hold). BNPC fallback: plain `SpawnEnemy` + scripted stats if a profile row is missing.
- Juggernaut Magitek Cannon: battle command 23224 (target-position 6-y circle, 30-y height), skill-list 45 selects it; runtime snapshots ground target at cast start, spawns warning actor appearance 1000376 (b998/e001), cleans up after ("Futures Perfect Magitek Cannon warning cleanup"). Player warning line on combat start.
- Centurion scripted withdrawal at HP ≤ 10%: damage floor + scripted-fight guard pre-flee, then invuln + `BeginQuestFightFlee` (90 s hold, speed 10) along 7 anchors `(197.8,44.6,-641.3)` → `(283.0,46.0,-690.0)`; party line "The imperial centurion is fleeing. Follow it!"; targets disengage. Victory requires ALL 4 terminal states (3 kills + finished flee); validator forbids reinforcement waves (no retail evidence).
- No enrage callback (repo-wide: timeout is the fail clock) and no party HP scaling (fixed HP solo or capped-3 party, repo-wide convention).

## Cave / party / rewards (VERIFIED: quest + director)

- `pE30` → SEQ 020 → cave actors spawn → helpers ejected to camp with "battle party has ended" (retail disbands before the Echo aftermath); owner-only cave; `pE50` → SEQ 025 → `DoZoneChange` public. Cave re-entry from 1090191 at SEQ 020 is owner-only.
- Party: opportunistic nearby (40 y, same area, cap 3 incl. owner); combat entries filter to combat-ready/alive/unmounted/non-zoning members (skipped, never blocking); cave admits all disciplines.
- Entry gates: SEQ_010/015 require war/magic (`guardCombatInstanceEntry` at push + non-notifying check in start helper, exact system line, blank sender); every entry refuses mounted (battlefield/aftermath message), dead, zoning, or already-inside owners; engine bans mount summon in-copy (`IsMountRestrictedArea`: all private areas) and `ChocoboRideCommand` enforces `CanMountInCurrentArea`.
- Rewards: `delegateQuestRewardWindow(player, quest, 46000, 1, 1, 2)` + `IssueGoobbue()` iff `hasGoobbue==false` ("You can now summon the Goobbue mount."), in `onFinish`.

## Fail edges (VERIFIED: director main loop + content script)

- 45-min overall timeout; owner death; left-battlefield; missing quest (covers abandon mid-copy); 8-s ack timeouts for landing/opening/arrival/completion events; pursuit boundary fail; centurion killed pre-flee or lost mid-flee; spawn/route failures. All fail paths: clear flag 7 → SEQ 015 → save → `ContentFinished` → public warp → `EndDirector` (retryable from 1090191).
- Disconnect: `SetQuestReentryPolicy` + `DeferContentGroupMembershipOnReconnect`; main loop rebinds the replaced Player object, restarts landing delay, re-publishes content-group membership; owner-missing >30 s fails.
- `onPlayerLeft` re-saves SEQ 15/20 journals; `onFinish` Goobbue grant is completion-gated.

## Unresolved

- Retail owning actors for the unwired flavor talks (`010_1..9`, `pE16/17/18`, `015_4/5`, `pE52`, `pE61`, `060_2..6`) — no quest-data actor mapping recovered; wiring them to guessed NPCs would invent retail behavior.
- Retail per-phase mob abilities beyond Magitek Cannon (potency/rotation unrecovered; DPS AI + scripted HP stand in).
- `decomp_more_20260617` scenario/director pair cited by the Man406 validator is absent here; validator unrunnable until restored (pre-existing, unrelated to this pass).
