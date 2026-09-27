# Pld0j6 deep decomp: Keeping the Oath (111286, Lv50)

JOB PLD, 2026-09-27. Finale instance quest (private SQB battle, entry
scene + local aftermath + Jenlyns reward talk).

## Sources

- `PLD_paladin-job-quest-deep-decomp-2026-09-27.md` (Pld0j6 section)
- `docs/Dat Mining/quest_marker.csv`: 11224501 (121.92, -1582.25,
  104/404, SE of Camp Bluefog) + 11224502 (-113.68, 148.92, display
  1000146 = Jenlyns, Ul'dah)
- `job_quest_template.lua` Pld0j6 HOLD row (documentedTargets,
  pld0j610/pld0j620, maxParty 8) + hooks (`processEventStart` /
  `processEventClear` / `processEventKokuti(8032701)` /
  `processEvent001`); `job_quest_journal.lua`
  `pld0j6 = {[0] = 0, [5] = 1, [10] = 2}` ("Wil 530, 531, 532")
- Fandom 1.0: Jenlyns learned he was a Monetarist dupe; showdown SE
  of Camp Bluefog; he commands the player to stay away ("What you do
  next is up to you and your conscience"); reward Gallant Surcoat
- Loot staging: 3069 manipulated_eye (job 22, 55/55, list 2),
  3070 manipulated_ogre (job 4, 55/55, list 34)
- Skill lists verified: 2 = Seismic Scream/Level 5 Petrify/Aural
  Vacuum/Seismic Rift/Death March/Death Throes; 34 = Double Smash/
  Elbow Drop/Inferno Drop/Bone Breaker/Booming Bellow/Primal
  Scream/Drop Kick/Bellowing Grunt
- No 1.0 YouTube footage was found; no public source gives
  copies/waves/stats (the live GamerEscape page is the ARR
  Snowcloak version, not this 1.0 Bluefog last stand)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jenlyns (`processEventStart`) | NPC |
| 0/5 | Entry scene `pld0j610` (`processEventNQ01(true)`, staged-launcher default-fade; Blm0j6 precedent) -> ambush fight | Private SQB |
| 5+win | Aftermath `pld0j620` (`processEventNQ03`, LOCAL form — never NQ02: no warp happens mid-scene; Blm0j6 precedent) | Content |
| 10 | Reward talk at Jenlyns (Clear + Kokuti(8032701) + 001) | NPC |

Retry boundary is sequence 0. No persisted flags/counters.

## Mobs (exact actors/lists + adapter formation)

- Manipulated Eye 2201706 (`AhrimanNormalPld0j6`/display 3201708) /
  canonical mob 3069 (job 22, Lv55/55 per loot staging, list 2,
  speed 6 ahriman-family clone, element 1 Ice).
- Manipulated Ogre 2202503 (`OgreLesserPld0j6`/display 3202504) /
  canonical mob 3070 (job 4, Lv55/55 per loot staging, list 34,
  speed 5.5 ogre-family clone, element 0 Fire).
- Formation is adapter policy (no recovered copies/waves/kill
  rule): 2 Eyes + 2 Ogres, single simultaneous wave, all required.
  3069/3070 rows are new full 41-column main-SQL profiles (the IDs
  are canonical; only the combat rows were missing).
- Allies: Jenlyns + Solkzagyl are narrative back-to-back
  participants only (Brd0j6 Jehantel precedent) — no ally spawns,
  no ally AI; their behavior is unrecovered.
- Battle ground context: marker zone 173 map (28.09, 14.90); no
  recorded ground within 30u (nearest node 3698 at 34.5u, Y
  247.36); the fight runs in the private shell, so no public
  placement is needed. Party cap 8 (recommendation evidence).

## Instance bounds, fail/reset, sync

Same runtime contract as Pld0j5: private area
`quest_sqb_pld0j6_<ownerId>`, r=45.0 boundary, timeout 1200
(Blm0j6 finale precedent), minimumLevel 50 for owner + members, no
1.x sync, leader-only entry, chocobo refusal at the gate, full
wipe/retry/abandon/disconnect/death/OOB/retrigger guards, and an
unplayed-aftermath failure (no seq-10 leak, hence no reward leak).

## Rewards

No EXP row recovered: none granted. Gallant Surcoat 8032701 +
Hallowed Ground 27148 (job 16), granted by the server at the
Jenlyns reward talk (widgets driven by Clear/Kokuti args).

## Implementation

Standalone `pld0j6.lua` on `pld_standalone_engine.lua` (preEvent
NQ01, reward at Jenlyns) + `QuestDirectorJobPld0j6.lua`
(successEvent NQ03/pld0j620, cap 8, timeout 1200). Shared
template Pld0j6 row stays HOLD (untouched: pinned by
`validate_job_held_combat_routes.py`).
