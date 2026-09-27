# Brd0j4 deep decomp: Doing It the Bard Way (111304, Lv45)

JOB BRD, 2026-09-27. Instance quest (private SQB + entry/aftermath scenes).

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111304 section)
- `marker-evidence.json`: 11225301 (-480.37, -2624.03, 103/303)
- `brd0j410.json` / `brd0j420.json` scene placement (PC poses ~(-460,20,-2623))
- Mirke transcript via secondary reconstruction: escort to a cave north
  of Hyrstmill; ambush is one Ixali Scout + two Scout Wolves; Jehantel
  falls back and confesses afterward
- Gamer Escape `Doing_It_the_Bard_Way_(1.0)` journal; empty `QuestDirectorBrd0j401`

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer: Ballad of the Vainglorious Fool (`processEventStart`, EQ pc107/0x585) | NPC Jehantel |
| 5 | Entry scene brd0j410 (`processEventNQ01`) -> ambush fight | Private SQB |
| 5+win | Aftermath brd0j420 (`processEventNQ03`), world text 30 | Content-owned |
| 10 | Reward talk at Jehantel (`processEventClear01`) | NPC |

`processEventNQ02` is an all-default replay of the ENTRY scene (not
aftermath). `processEventJehantel` is a reminder. Clear01/Clear02 are
identical alternate presentations (`(27232,3)` at 0xB8F/0xC89); 01 used.
`completionOwner` stays npc (return to Jehantel); the overworld escort
walk has no recovered path and is abstracted by the entry scene.

## Mobs (mob_map_coordinates + archive)

- Ixali Scout 2206412/3206412, staged Lv52 -> adapter mob 32751
  (job 3, skill 5035: Wind Claw/Updraft/Sunset Plumes/Swift Gust/Gale,
  Wing Clipper). Count 1 (transcript).
- Scout Wolf 2201428/3201427, staged Lv50 -> adapter mob 32752
  (job 2, skill 5062: howls + Foul/Sanguine Bite). Count 2 (transcript).
- Single ambush wave, all required. Jehantel (1060039) is noncombat by
  journal ("cannot bring himself to fire"): scene participant only.
- Marker 11225301 -> North Shroud zone 152; scene Y ~20. Party cap 8.

## Rewards

EXP 5340, Rain of Death 27232 (tier 3 widget).

## Implementation

Standalone `brd0j4.lua` (preEvent NQ01) + `QuestDirectorJobBrd0j4.lua`
(successEvent NQ03/brd0j420, cap 8, timeout 1200). Full runtime edge
guards (see reg doc). Shared template row stays HOLD (untouched).
