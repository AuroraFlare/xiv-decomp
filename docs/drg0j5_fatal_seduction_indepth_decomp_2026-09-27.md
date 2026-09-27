# DRG 111325 Drg0j5 — Fatal Seduction (Lv45) — indepth decomp

Target file (repo): `FF14-Decomp/docs/drg0j5_fatal_seduction_indepth_decomp_2026-09-27.md`

Lv45. Alberic confession/briefing -> second Alberic handoff -> slay the
drake Stollenwurm south of Camp Riversmeet (western Coerthas) -> Alberic
completion hooks (Ring of Talons). Status: Implemented private adapter
(open-world objective served by a private SQB shell; no public spawn/content
owner recovered).

## Stages / sequences (server adapter)

- 0 offer: Alberic 1002001 `processEventALBERICStart` (offer EQ pc173/0x519;
  texts 2-4 branch on willingness, 7 decline, 8 accept; confession texts
  9-16; warning 18; objective texts 20-23; lore 28-31). The briefing is the
  long Azure Dragoon backstory (relinquished power, Ferndale, Estinien).
- 0 route handoff: `processEvent000_ALBERICS` (texts 25/26) repeats the
  Stollenwurm objective. Retail objective is an open-world kill; until the
  field push/content owner is recovered, this second Alberic talk is the
  guarded handoff into the private adapter (Blm0j3-precedent: marker kept
  for journal fidelity).
- 5 battle: exactly one Stollenwurm, actor 2102219 / display 3102224 /
  mob 32729, single simultaneous wave (retail describes one drake; no
  adds, no phases). Victory advances to sequence 10.
- Journal: Roc/31 objective + Roc/32 next-quest notice. Selector
  `drg0j5 = {[0] = 0, [5] = 0}`. SEVEN companions recommended = 8 total
  (maxPartySize 8, kind=recommendation).
- Completion: `onJobQuestCompleteFirst` (worldMaster,51135,3102224,1,
  2000204) at 0x88C + `onJobQuestCompleteSecond` (27277 Ring of Talons,3)
  at 0x93A + `onJobQuestCompleteThird` linkpearl (1000275,88) at 0x9A9.
- `processEventChuui/Chuui2` (51131/51132) have no local text export.

## NPCs / mobs / positions

- Alberic 1002001 @ zone 143 Gates of Judgement (-180.174, 286.839,
  -304.109, spawn row 2360): offer, handoff, reward.
- Stollenwurm: actor 2102219 = model
  `/Chara/Npc/Monster/Scalelizard/ScalelizardThunderQuestDrg0j6` / display
  3102224 (EXACT quest binding; note the model-path suffix says Drg0j6, a
  recorded mismatch). Mob 32729 is a migration-owned adapter profile, NOT
  a recovered retail BNPC: Drake family skill list 5020 (Smoulder 23271,
  Burning Cyclone 23274, Flames of Defiance 23276, Serpentine Tail 23278),
  Lancer job 8, Lv45 band. No retail Stollenwurm kit/stats exist.
- Marker 11226401 (MapMarkerQuestArea, -1878.430054/116.629997, 102/205):
  zone-143 map (18.34, 22.61), corroborating the period guide's "X18, Y22"
  south of Camp Riversmeet at the Swiftrun/Coerthas confluence. 0 recorded
  points in r30; nearest recorded ~954 yalms away
  (inside_selection=false). No public placement: the private shell spawns
  entry-relative (runtime default `spawnOrigin` = owner position).
- 11226402-11226410 are filler rows (1600179 @ -431,187,101/121).

## Instance / triggers / bounds

- No static instance ID recovered. Private quest-battle content
  (`quest_sqb_drg0j5_<ownerId>`), maxPartySize 8, timeout 600s,
  `DisableReentry`, boundary = private area. Mounts impossible inside
  (engine mount ban + auto-dismount on entry); leader AND every member
  must dismount before entry ("Dismount your chocobo..." guards in
  `gc_sqb_quest.lua`). No chocobo actor is spawned or admitted.
- Entry validation (shared launcher): party-leader-only start, cap 8,
  every entrant online + same-area + combat-class + alive + minimumLevel
  45. No level sync (4-job consensus: no retail sync evidence).
- Kill credit: exact wave-1 actor class 2102219 reconciled against the
  allocated `drg0j5_stollenwurm` uniqueId; duplicate callbacks and foreign
  same-class kills are not credit. Ambient kills can never complete the
  quest (template `onKillBNpc` returns early for private battles; the
  director owns completion).
- Enmity/AOEs: engine-owned single-drake combat; the Drake skill family
  (incl. Burning Cyclone AOE) runs on profile AI cadence. No invented
  HP-threshold phase machine: retail exposes no phase callback.
- Leash/reset: `ConfigureScriptedOneShotLifecycle` + private-area
  containment; targets despawn on finish; orphan shells retire on the
  native lease and cannot be duplicated.

## Rewards

- EXP 5340; action 27277 Ring of Talons (mode 3, verified in
  `server_battle_commands.sql`); linkshell actor 1000275 event 88
  (linkpearl presentation); First-hook key item 2000204 context.
  No item grant in this scenario.

## Edge cases + guards

- Wipe/death/timeout/disconnect/area-exit/quest-changed/entry-failed ->
  `gc_sqb_runtime.finish()` -> retrySequence 0 at Alberic (native lease
  guards orphan shells); abandon/reaccept -> bound-quest check fails ->
  no credit; party/solo -> leader-only start, cap 8, entrant validation;
  OOB -> private boundary + re-entry disabled; retrigger -> exact
  uniqueId kill credit, single target.
- Sequence-break: battle boundary is sequence 5; reward sequence 10 is
  reachable only through the director success path. Journal/party/source
  contracts covered in `tools/job-quest-runtime-tests` (party caps,
  journal selectors).
- Item-loss: no quest items change hands in this scenario (action +
  linkshell presentation only), so no item-loss surface.
- Loot: none registered for adapter mob 32729 (quest target, no drops).

## Web / period sources (mechanics, inspected)

- Fandom Dragoon Quests (1.0): journal text (Camp Riversmeet -> south to
  the riversmeet, slay Stollenwurm), 7-companion recommendation, Ring of
  Talons + ~5340 EXP rewards, L45 DRG / L15 PGL requirements.
- Garlemald-Server issue #136 (Mirke "DRAGOON" transcript summary):
  confluence of the Swiftrun and Coerthas Rivers; per-quest content area
  with real victory detection (drake defeated -> advance), not a
  random-winner skip. Matches this adapter.
- Forum guide (squint/period): "To the South, Slay the Stollenwurm at
  X18, Y22" (via search snippet; full thread fetch timed out — coordinate
  corroborated independently via the zone-143 map transform above).
- No YouTube 1.x footage of this fight was recovered; no adds/phases are
  claimed by any source, so the single-wave adapter stands as documented.
