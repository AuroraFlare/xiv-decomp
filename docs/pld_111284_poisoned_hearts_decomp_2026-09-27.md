# Pld0j4 deep decomp: Poisoned Hearts (111284, Lv45)

JOB PLD, 2026-09-27. AF-collection quest (open-world coffer interactions,
no battle, no NQ cutscene).

## Sources

- `PLD_paladin-job-quest-deep-decomp-2026-09-27.md` (Pld0j4 section)
- `docs/Dat Mining/quest_marker.csv`: 11224301-04 (all display 4000257
  "???"; 05-10 are default filler at -431/187)
- `job_quest_template.lua` Pld0j4 HOLD row + `Pld0j4 = { accept =
  "processEvent_JENLYNS_Start" }` hook; `job_quest_journal.lua`
  `pld0j4 = {[0] = 0, [6] = 0}` ("Wil 523: independent AF collection")
- `Final Fantasy Wiki Paladin Quests (version 1.0)`: Jenlyns uncovered a
  Monetarist link; recover the four gallant pieces at Aurum Vale (west
  of Camp Ever Lakes), Natalan (east of Camp Dragonhead), a cave north
  of Camp Brittlebark (Mor Dhona), and a cave NE of Camp Crimson Bark
  (West Shroud)
- `gamedata_actor_class.sql`: coffer actor 1200161
  (`/Chara/Npc/Object/GuildleveBonusTreasureBox`, talkDefault +
  noticeEvent); display 4000257 maps to 90 actor classes (ambiguous,
  never an actor ID)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jenlyns 1060042 (`processEvent_JENLYNS_Start`) | NPC, Ul'dah Hustings Strip (spawn 244, zone 209) |
| 6 | Four unordered AF coffer interactions (`processEvent_getAF_info`) | Interaction |
| (done) | Fourth acquisition completes in place (EXP 5340) | Interaction |

No route steps, no reward sequence, no return-to-Jenlyns state
recovered. Persisted state: counter 0 (count), flags 0-3 (one per
coffer) — the shared AF-runtime contract.

## NPCs, items, markers

Giver Jenlyns 1060042 (display 1000146) already spawns publicly.
Set: Gallant Cuisses 8051401, Gauntlets 8071401, Sollerets 8081801,
Coronet 8013501. Marker-to-item pairing is adapter policy (numeric
order); the DAT proves the sets, not the pairing.

| Marker | Zone / ground (map_coordinates locate) | Item | Spawn |
| --- | --- | --- | --- |
| 11224301 (-368.99, 1397.95) | z245 Aurum Vale p5500, map (9.59, 6.30); 0 pts, nearest 262.8u; Y 171.700 VERIFY | 8051401 | 3361 |
| 11224302 (546.49, -154.67) | z143 Natalan, map (42.58, 19.89); 87 pts; Y 301.611 (node 8066, 1.6u) | 8071401 | 3362 |
| 11224303 (344.34, 435.61) | z143 N of Brittlebark, map (40.56, 25.80); 14 pts; Y 219.045 (node 10049, 3.8u) | 8081801 | 3363 |
| 11224304 (-1276.97, -841.74) | z153 NE of Crimson Bark, map (18.27, 29.66); 0 pts, nearest 664u; Y 0.100 VERIFY | 8013501 | 3364 |

11224301 shares X/Z with Blm0j5 11223401 and Drg0j4 11226302 (one
reused coffer spot or coarse marker granularity). All four coffers use
standard treasure-coffer actor 1200161; zone + 25u proximity resolve
which coffer a talk touches (every pair is 500+ units apart, and two
share zone 143 at ~590u apart). No Sultansworn-guard behavior was
recovered for the 1.0 coffers (the guard text is ARR-only).

## Triggers, fail/reset, rewards

- Talk-driven only; a stray push can never advance, grant, or complete.
- Full inventory: grant fails its `HasItem` check, event ends, no flag
  is set — the coffer stays available (no item-loss loophole).
- Re-talk with the piece already held skips the grant and still sets
  the flag (crash-safe, no double-grant).
- Duplicate/foreign talks: completed flags and zone+proximity binding
  reject wrong coffers and public-coffer credit.
- No chocobo, sync, party, leash, or death handling applies: open-world
  talks with no combat. Abandon/reacquire resets flags via
  `resetInteractionProgress`.
- Rewards: EXP 5340 + the four Gallant pieces (no separate reward
  movie; `completionOwner = "interaction"`).

## Implementation

Standalone `pld0j4.lua` on `pld_standalone_engine.lua` +
`pld_111284_111285_111286_private_content.sql` (4 coffer spawns
3361-3364). Shared template Pld0j4 row stays HOLD (untouched:
pinned by `validate_job_af_interaction_runtime.py`).
