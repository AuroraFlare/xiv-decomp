# DRG 111326 Drg0j6 — Into the Dragon's Maw (Lv50) — indepth decomp

Target file (repo): `FF14-Decomp/docs/drg0j6_into_the_dragons_maw_indepth_decomp_2026-09-27.md`

Lv50 capstone. Alberic briefing -> travel with Alberic down Haldrath's
March to Griffin Crossing -> `Drg0j610` confrontation -> duel vs Estinien
Wyrmblood + his drake Greywine (both must die) -> Nidhogg/Haldrath
resolution `Drg0j620` -> return to Alberic (Drachen Mail + Dragonfire
Dive). Status: Implemented private adapter.

## Stages / sequences (server adapter)

- Offer/hint: `processEventALBERICHint` (texts 36-39, incl. L50 next-quest
  notice) gates; `processEventALBERICStart` (texts 2-5) briefs (Estinien's
  urgent message, Griffin Crossing SE, Nidhogg on the move) and accepts.
- 0 route: `processEvent000` reminder (texts 6 "Griffin Bridge SE" / 24;
  journal Roc/33-35 needs no second talk — adapter policy).
- Entry: `processEvent010` plays literal `Drg0j610` with default fade
  (template `preEvent`: shell/actors staged first, event retained until
  the content transition captures it).
- 5 battle: Estinien Wyrmblood 2289038/mob 3028 + Greywine 2202208/mob
  3049, single simultaneous wave, `requireAllTargets = true`. Victory ->
  `successEvent processEvent020`.
- `processEvent015` = empty talk (start + immediate finish), no objective.
- Aftermath: `processEvent020` plays `Drg0j620` after-warp variant (content
  exit owns it) + `processEvent025` plays `Drg0j620` default variant; then
  return north to the Gates.
- Reward: `processEvent030` at Alberic (texts 26-35 + long text 42/43 at
  0x96B/w8; action (27268 Dragonfire Dive,1) at 0x98B/w6; literal item
  8032704 Drachen Mail at 0x9A7/w6 with no arg; keep
  `finishCliantTalkTurn(2)` verbatim). 0 EXP (source-backed: no EXP call).
- Journal: Roc/33 (rendezvous) -> Roc/34 (victory) -> Roc/35 (revelation
  follows victory). Selector `drg0j6 = {[0] = 0, [5] = 0, [10] = 1}`.
  "Up to seven may accompany" = 8 max, kind=maximum.
- `processEventChuui/Chuui2` (51131/51132) have no local text export.

## NPCs / mobs / positions

- Alberic 1002001 @ zone 143 Gates of Judgement (spawn row 2360): offer,
  route, reward. Scene poses in 610/620 share the authored setup below.
- Estinien Wyrmblood: actor 2289038 / mob 3028 / skill list 15
  (boss_physical: Animal Instinct 23484, Godsbane 23490, Jump 23493,
  Wyvern Dive 23494), Lv50, Lancer job 8. Period material: counts down
  before a dragoon maneuver; Dragonfire-jump attacks with en-bind/en-stun.
  Scene actor is 1060040/display 1200199 (cutscene identity; combat actor
  is 2289038).
- Greywine: actor 2202208 / mob 3049 / skill list 26 (drake: Steel Cyclone
  23485, Caudal Spine 23270, Smoulder 23271, Surge 23272, Raging Horn
  23273, Crimson Cyclone 23365/23580, Ring of Thorns 23496), Lv50.
  Period material: purple-scaled drake; purple glow = counter window
  (stop attacking, move away); tanked and killed separately from
  Estinien; cannot be struck from the rear (no server directional
  mechanic exists — documented adapter limitation, not fabricated).
- Haldras 1001983 in `Drg0j620` = scene-only (Haldrath manifestation),
  NOT a third combat target. `noname` 1000935/4000257 in 620 is a scene
  extra, never a target.
- Marker 11226502 (MapMarkerQuest point, 604.099976/561.960022, 102/201):
  zone-143 map (43.16, 27.06); 0 recorded points in r30; nearest recorded
  ~220 yalms away. Scene-authored setup (all of PC/Alberic/Estinien +
  Haldras/extra in 620): (663.478821, 230.276871, 567.809753, -2.967060).
  Last PC SetPos in stored 620 block c33: (659.074524, 229.300034,
  563.050110) — shot evidence, not a proven exit warp. No public
  placement: the private shell spawns entry-relative (Estinien -3X /
  Greywine +3X offsets).
- Markers 11226501/11226503 = Alberic offer/return (1000275 @ Gates);
  11226504-11226510 are filler rows.
- Guide cites (`docs/mob_map_coordinates.md`): "Agent workflow" (locate),
  "Generate placements" (no invented Y; private runtime homes own content
  spawns), "Calibration and evidence" (scene setups corroborate, never
  assert world transforms).

## Instance / triggers / bounds

- No static instance ID recovered. Private quest-battle content
  (`quest_sqb_drg0j6_<ownerId>`), maxPartySize 8 (kind=maximum),
  minimumLevel 50, timeout 900s, `DisableReentry`, boundary = private
  area. Mounts impossible inside (engine mount ban + auto-dismount);
  leader and every member must dismount before entry. No chocobo actor
  is spawned or admitted.
- Entry validation (shared launcher): party-leader-only start, cap 8,
  every entrant online + same-area + combat-class + alive + level 50+.
  Must be on DRG (period guide: "To start this fight and have it count,
  you MUST BE ON DRAGOON" — enforced by `isEligible`: current class/job
  must equal jobId 19 once a prerequisite exists). No level sync
  (4-job consensus).
- Kill credit: exact wave-1 classes {2289038, 2202208} reconciled against
  allocated uniqueIds `drg0j6_estinien_wyrmblood` / `drg0j6_greywine`;
  `requireAllTargets` gates victory on both. Order-free (either may die
  first — "tanked and killed separately"). Ambient kills can never
  complete the quest.
- Enmity/AOEs: engine-owned pair combat; Greywine's drake AOEs (Crimson
  Cyclone, Ring of Thorns) and Estinien's jumps run on profile AI cadence.
  No invented HP-threshold machine: the purple-glow counter and the
  countdown maneuver have no verified combat-event callback, so they live
  in the source-backed skill profiles + comments, exactly as recovered.
- Leash/reset: `ConfigureScriptedOneShotLifecycle` + private-area
  containment; targets despawn on finish; orphan shells retire on the
  native lease and cannot be duplicated.

## Rewards

- Drachen Mail 8032704 (literal grant in `processEvent030`, server grants
  authoritatively; verified in `gamedata_items.sql`) + Dragonfire Dive
  27268 (verified in `server_battle_commands.sql`). 0 EXP. The Mail is
  Haldrath's own piece, sealed in the soul crystal (text 42).

## Edge cases + guards

- Wipe/death/timeout/disconnect/area-exit/quest-changed/entry-failed ->
  `gc_sqb_runtime.finish()` -> retrySequence 0 at Alberic; abandon/
  reaccept -> bound-quest check fails -> no credit; party/solo ->
  leader-only start, cap 8 (maximum), entrant validation incl. DRG + L50;
  OOB -> private boundary + re-entry disabled; retrigger -> exact
  uniqueId credits for BOTH targets.
- Sequence-break: battle boundary seq 5; success-owned `processEvent020`
  aftermath; reward seq 10 only via the success path. Automatic-aftermath
  separation (`processEvent020/025` excluded from public `complete` hooks)
  is enforced by `test_source_contracts.lua`.
- Item-loss: the Mail is granted at the Alberic reward talk by the
  authoritative `grantItems` path; quest completion is atomic with the
  grant in `completeJobQuest`, so no completed-without-mail state exists.
- Loot: none registered for 3028/3049 beyond quest completion (quest
  targets, no drops).

## Web / period sources (mechanics, inspected)

- Fandom Dragoon Quests (1.0): journal (Griffin Crossing rendezvous via
  the southbound highroad; Estinien's rancor over Ferndale; being of
  darkness repelled; return to the Gates), 7-companion cap, Drachen Mail
  + Dragonfire Dive rewards, L50 DRG / L15 PGL requirements.
- GamerEscape Into the Dragon's Maw/Plot Details: Part 1/2 dialogue
  (Estinien's denunciation of Alberic over Ferndale).
- Garlemald-Server issue #137 (Mirke "DRAGOON" transcript summary):
  Haldrath's March -> Griffin Crossing; Estinien + purple-scaled Greywine
  (tanked/killed separately; rear-immune); Nidhogg/Haldrath resolution;
  real victory detection (both defeated -> awakening cutscene).
- Forum guide: "MUST BE ON DRAGOON" for the fight to count (search
  snippet; full thread fetch timed out).
- Fate/Crossover Estinien page (search snippet): countdown into a dragoon
  maneuver; Dragonfire jump; en-bind/en-stun attacks.
- No YouTube 1.x footage of this fight was recovered; rear immunity and
  the counter window are carried as documented behavior/limitation, and
  no phase machine is invented around them.
