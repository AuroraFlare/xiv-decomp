# PLD Paladin Job Quests 111281-111286 — Deep Decomp (2026-09-27)

Job file: `PLD_*` (parallel-worker owned). Covers Pld0j1-Pld0j6:
stages, flags, NPCs, mobs, positions, instance IDs, triggers, cutscenes, rewards.
Retail cross-check: GamerEscape 1.21 obsolete pages + 1.0 Lodestone annals.
Placement method: `tools/mobspawns/map_coordinates.py` (see
`docs/mob_map_coordinates.md`); heights are recorded-node values only.

## Pld0j1 — Paladin's Pledge (111281, Lv30, quest battle)

- Offer/route: Lulutsu `1000863` -> Jenlyns `1060042`
  (`/Chara/Npc/Populace/PopulaceStandard`, display `1000146`),
  `processEvent082`, marker `11224001`. Reward: Jenlyns `11224003`.
- Battle: marker `11224002`, `Quest/QuestDirectorJobPld0j1`, seq 5 -> 10,
  `successEvent processEvent010` owns `pld0j110` + crystal `11000558`,
  retry seq 0, `requireAllTargets`, maxParty 4, timeout 900.
- Roster (all exact actor/mob + profiles in `server_battlenpc_mob_types.sql`):
  - Wandering Soldier `2201807/32731`
    (`LivingdeadLancerPld0j1`), list 88
  - Wandering Mage `2201808/32732`
    (`LivingdeadThaumaturgePld0j1`), list 5061
  - Wandering Bogy `2204318/32733`
    (`PetitghostLesserPld0j1`), list 32
  - Ascian `2206901/32734` (`SpecterStandard` fallback: `SpecterNormalPld0j1`
    is an empty subclass with no dedicated SQL path), list 32
- Instance: private area `quest_sqb_pld0j1_<ownerId>`,
  `SimpleContentQuestBattle`, boundary circle r=45.0.
- Rewards: EXP 2661, action `27146` (job 16), key item `2000201`,
  Soul of the Paladin `3020410` (+ central gil/marks).
- Retail: journal sends player south of the Coffer & Coffin, 4-person party.
- Status: IMPLEMENTED private adapter. One-copy roster/formation is adapter
  policy (client `QuestDirectorPld0j101` is an empty shell: no retail
  count/waves/phases to implement).

## Pld0j2 — Honor Lost (111282, Lv35, open-world NM)

- Offer: Jenlyns `1060042`, `processEventJENLYNSStart`. Prereq 111281.
- Battle: marker `11224101` (Mun-Tuy Cellars),
  `Quest/QuestDirectorJobPld0j2`, seq 5 -> 10, retry 0,
  `requireAllTargets`, maxParty 4 (recommendation evidence), timeout 900.
- Target: Alux `2102609/3000` (`ImpNormalNM`/display `3102611`),
  skill list 42 = Impish Incantations `23116/23117/23118` (verified in
  `server_battlenpc_skill_list.sql`). Completion via legacy NPC
  linkshell event 95.
- Rewards: EXP 3360, action `27147` (job 16).
- Retail: "find and defeat the alux beast" in Mun-Tuy Cellars (North
  Shroud); 1.0 Lodestone annals: "besting an alux".
- Status: IMPLEMENTED private open-world adapter (exact profile; public
  trigger owner unverified).

## Pld0j3 — Power Struggles (111283, Lv40, open-world NM)

- Offer: Jenlyns `1060042`, `processEventJENLYNSStart`. Prereq 111282.
- Battle: marker `11224201` (Lower La Noscea),
  `Quest/QuestDirectorJobPld0j3`, seq 5 -> 10, retry 0,
  `requireAllTargets`, maxParty 4 (recommendation evidence), timeout 900.
- Target: Old Six-arms `2107614/3078` (`CrabNormalNM`/display `3107616`),
  NM list 6024 (Claw Guard `23133`, Bubble Shower `23134`) + crab family
  list 21 (7 moves, verified). Completion via linkshell event 96.
- Rewards: EXP 4260, action `27149` (job 16).
- Retail: 1.0 Lodestone annals: "besting Old Six-arms".
- Status: IMPLEMENTED private open-world adapter.

## Pld0j4 — Poisoned Hearts (111284, Lv45, AF coffers)

- Offer: Jenlyns `1060042`. Prereq 111283. EXP 5340.
- Interaction: markers `11224301-11224304` (display `4000257` "???"),
  event `processEvent_getAF_info`, seq 6. Set: Gallant Cuisses
  `8051401`, Gauntlets `8071401`, Sollerets `8081801`, Coronet `8013501`.
  No return state recovered; unordered, fourth acquisition completes.
- Ground truth (new, `map_coordinates.py locate`):
  - `11224301` Aurum Vale z245 page 5500: (-368.99, 1397.95) = map
    (9.59, 6.30). Y UNRESOLVED (nearest recorded node 262u away).
    NOTE: identical X/Z shared with Blm0j5 `11223401` and Drg0j4
    `11226302` — one reused coffer spot or coarse marker granularity.
  - `11224302` Natalan z143: (546.49, -154.67) = map (42.58, 19.89),
    87 recorded points in selection, ground Y ~= 301.6-302.3.
  - `11224303` N. of Camp Brittlebark z143 (NOT z147): (344.34, 435.61)
    = map (40.56, 25.80), 14 points in selection, ground Y ~= 219.0.
  - `11224304` NE of Camp Crimson Bark z153 (camp aetheryte z153 at
    -1566.04, -11.89, -550.51): (-1276.97, -841.74) = map (18.27,
    29.66). Y UNRESOLVED (z153 recording has 127 nodes; nearest 664u).
- Retail: recover the four gallant pieces (Aurum Vale west of Camp Ever
  Lakes; Natalan east of Camp Dragonhead). ARR version guards coffers
  with Sultansworn; 1.0 guard behavior unrecovered.
- Status: HOLD. 90 actor classes share display `4000257`; no
  `server_eventnpc_spawn_locations.sql` row sits near any marker; no
  Y/rotation; no marker-to-item binding proof. The template's 4-bit
  coffer engine (`interactions.objectives` = exact {actor, marker, item}
  rows, duplicate-push rejection, inventory-visible grants) is dormant
  and ready. Enabling now would strand the player or fabricate actors.

## Pld0j5 — Parley on High Ground (111285, Lv45, instance)

- Offer: Jenlyns `1060042`, `processEventJENLYNSStart`. Prereq 111284.
  EXP 5340. `completionOwner = "content"`.
- Entry: marker `11224401`; `preEvent processEvent_005NQ_1(true)` owns
  `pld0j510` (normal-area fade-in branch, no after-warp at entry).
- Battle: `Quest/QuestDirectorJobPld0j5`, seq 5 -> 10, retry 0,
  maxParty 8, timeout 600. Target: Jenlyns Straightblade `2289035/3064`
  (profile level 52 — matches retail).
- Aftermath: `_015NQ_2` owns `pld0j520` (Default fade) +
  `CompleteJobQuestFromContent` auto-reward. Action `27159` (job 16).
- Retail (GamerEscape `Parley_on_High_Ground`, Obsolete/Patch 1.21):
  entry at Central Thanalan (29-21) = world (263.0, -922.0), ground
  Y ~= 243-248 (72 recorded points; nearest node 264.01, 247.85,
  -941.41); roster = Jenlyns Straightblade Lv52 (high DEF/HP) + FOUR
  Sultansworn Elite Lv50; kill ALL -> auto-complete; "up to seven party
  members may accompany you (Recommended)".
- Corrections applied/found this job:
  - ADDED `requireAllTargets = true` to the j5 director (retail kill-all
    rule; no-op on the current single target, required for the 5-mob
    roster).
  - Party evidence in template says `kind = "maximum"`; retail journal
    says "(Recommended)" — correction noted for the shared-row owner.
- Status: IMPLEMENTED slice, roster incomplete: NO `Sultansworn Elite`
  actor class or mob-type row exists in SQL (only arena elites
  `39707-39710`), so the 4x Lv50 adds cannot be bound exactly.

## Pld0j6 — Keeping the Oath (111286, Lv50, finale)

- Offer: Jenlyns `1060042`. Prereq 111285. No EXP row guessed.
- Ambush: marker `11224501` (121.92, -1582.25) SE of Camp Bluefog =
  Northern Thanalan z173 map (28.09, 14.90); nearest ground Y ~= 247.4
  (35u; 0 points within 30). Eight-person recommendation.
- Allies (narrative): Jenlyns + Solkzagyl back-to-back vs the ambush.
  Ally actor variants/AI unrecovered.
- Enemies (exact actor classes + verified skill lists):
  - Manipulated Eye `2201706/3069` (`AhrimanNormalPld0j6`/display
    `3201708`), list 2: Seismic Scream `23093`, Level 5 Petrify `23094`,
    Aural Vacuum `23095`, Seismic Rift `23298`, Death March `23379`,
    Death Throes `23380`.
  - Manipulated Ogre `2202503/3070` (`OgreLesserPld0j6`/display
    `3202504`), list 34: Double Smash `23041`, Elbow Drop `23042`,
    Inferno Drop `23043`, Bone Breaker `23044`, Booming Bellow `23045`,
    Primal Scream `23046`, Drop Kick `23074`, Bellowing Grunt `23157`.
- Scenes (warp-sensitive, must be preserved by the content owner):
  `processEventNQ01` -> `pld0j610` (local OR after-warp exit);
  `processEventNQ02/NQ03` -> `pld0j620` (after-warp / local forms).
- Reward: `processEventClear` + `processEventKokuti(8032701)` presents
  Spirits Within `27148` + Gallant Surcoat `8032701`; server grants.
  Reward marker `11224502`.
- Retail: 1.0 Bluefog last stand (NOT the ARR Snowcloak version on the
  live GamerEscape page). No public source gives copies/waves/stats.
- Status: HOLD. Missing: mob profiles `3069/3070` (zero rows in
  `server_battlenpc_mob_types.sql`), enemy copies/waves/kill rule,
  allied Jenlyns/Solkzagyl behavior, after-warp content owner. No
  `targets`/`directorScript` until those are exact.

## Edge-case guards (shared runtime; inspected, apply to j1/j2/j3/j5)

- Wipe/retry: `finish(false)` + public retry at seq 0; config table is
  copied per launch so a retry never reuses a stale area namespace
  (`private_quest_battle.lua`); native lease retires orphaned shells,
  live shells are never duplicated (`job_quest_template.lua`
  `onStateChange`).
- Re-entry: per-owner private area (`quest_sqb_<code>_<ownerId>`);
  `CanStartPrivateQuestBattle` gate; post-movie revalidation drops
  removed/advanced quests (`gc_sqb_quest.lua`).
- Abandon/reacquire: `boundQuestIsCurrent`; callbacks bind to the quest
  session, never to an abandoned/reaccepted quest on one player
  (`gc_sqb_runtime.lua`).
- Party/solo: leader-only start; `maxPartySize` cap; members must be
  online, alive, same-area, meet `minimumLevel`, inside `partyRadius`
  (`gc_sqb_quest.lua`).
- Disconnect: `finish(deadline/"disconnect")` + async unwind; owner-only
  binding so a helper can never inherit the fight
  (`gc_sqb_runtime.lua`).
- Death during event: `finish("death")`; `IsDead` checks before credit.
- Out-of-bounds: `SetBoundaryCircle(..., 45.0)` on the content area.
- Retrigger: exact actor-class + uniqueId + area kill reconciliation;
  duplicate/fan-out callbacks and foreign same-class kills grant no
  credit; content completion requires the exact private-area name.
- Cutscene skip: source movie yields; long movies revalidate helper
  session/area membership after the yield. Skip itself is engine-owned.
- Chocobos: no chocobo reference anywhere in the quest-battle path;
  1.x chocobos are rental-mount appearances (`global.lua`
  `CHOCOBO_*`), and `DoZoneChangeContent` moves only the party into the
  private area. Satisfied by construction.
- Level-sync: no level sync existed in 1.x; quest level gates
  acceptance, `minimumLevel` gates entry where configured. N/A by era.

## Inspected sources

- `Data/scripts/quests/job_quest_template.lua` (PLD rows ~885-1070,
  core 1580-2347), `Data/scripts/quests/pld/pld0j1-6.lua` (stubs),
  `Data/scripts/directors/quest/QuestDirectorJobPld0j{1,2,3,5}.lua`,
  `Data/scripts/private_quest_battle.lua`,
  `Data/scripts/directors/Quest/gc_sqb_runtime.lua`,
  `Data/scripts/quests/com/gc_sqb_quest.lua`,
  `Data/scripts/quests/job_quest_aftermath.lua`
- `Data/sql/server_battlenpc_mob_types.sql` (3000, 3064, 3078,
  32731-32734 present; 3069/3070 absent),
  `Data/sql/gamedata_actor_class.sql` (all PLD actor classes; 90x display
  `4000257`; no Sultansworn rows),
  `Data/sql/server_battlenpc_skill_list.sql` (lists 2, 21, 34, 42, 6024),
  `Data/sql/server_eventnpc_spawn_locations.sql` (no coffer candidate
  near any j4 marker; Crimson Bark aetheryte z153)
- `docs/class_job_quest_implementation_2026-08-23.md`,
  `docs/job_quest_prebattle_route_contract_2026-08-21.md`,
  `docs/mob_map_coordinates.md`, `docs/quest_level_30_50_audit.md`
- Retail: `ffxiv.gamerescape.com/wiki/Parley_on_High_Ground`
  (Obsolete 1.21), 1.0 Lodestone sixth-astral-era annals, patch 1.21
  notes (all Jenlyns @ Hustings Strip 6,5).


