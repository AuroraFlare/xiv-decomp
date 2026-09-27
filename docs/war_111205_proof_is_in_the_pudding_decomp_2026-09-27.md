# War0j5 deep decomp: Proof is in the Pudding (111205, Lv45)

JOB WAR war-b, 2026-09-27. Open-world quest: slay Audhumbla in the
Iron Lake cave. Implementation already exists (shared template +
`QuestDirectorJobWar0j5`); this file records the in-depth decomp.

## Sources

- `war0j1-war0j6_deep_decomp_2026-09-27.md` (War0j5 section)
- `job_quest_template.lua` War0j5 row + scenario hooks
  (`processEventCURIOUS_GORGEStart` accept; `onJobQuestCompleteFirst/
  Second/Third` completion); Second grants ability 27192 mode 3
- `QuestDirectorJobWar0j5.lua` + `gc_sqb_runtime.lua` (seq 5->10,
  retry 0, 900s timeout, party <= 8)
- Marker 11220401 (218.68/-1771.75, map 101/104, display ???)
- Fandom 1.0 journal: "whoever fells Audhumbla from the caves of Iron
  Lake and earns the technique first will lay claim to all five pieces
  of the legendary armor"; "recommended that seven party members
  accompany you" (8 total); reward Steel Cyclone + ~5,340 EXP
- No 1.0-era YouTube footage found (modern retrospectives only)

## Stages and flow

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Curious Gorge (`processEventCURIOUS_GORGEStart`, ordinary fade, no NQ) | NPC |
| 5 | Slay Audhumbla (private shell at marker 11220401) | Content |
| 10 | Completion hooks (ability 27192, linkpearl callback) | Content |

Journal Wil 505: one named objective, 8-person recommendation. No
entry/aftermath scenes recovered (ordinary fade only). The client
director carries no counts, waves, phases, or enrages: the fight is
a single target, single wave by source, not by tuning choice.

## Target (map_coordinates placement)

Audhumbla 2100804/KujataHornedWar0j5/3100804, private mob 32758 lv52
(quest+7 tuning per Sirocco precedent), skillListId 0 (melee-only; no
retail list recovered, no family list substituted). Great Buffalo
2100801/3045 is a DIFFERENT NM and is never substituted.

Marker 11220401 sits in zone 135 (Upper La Noscea), which has no
`zone_135.tsv` recording at all; the nearest recorded node is ~460u
away. Y is unresolved, so no public placement is authored and the
fight stays inside the private content boundary (ambient kills can
never advance the quest).

## Anti-loophole rules (verified in the shared runtime)

Wipe/death -> retry; 900s timeout; abandon/reacquire journal guards;
disconnect fail + same-character relog rebind; death-during-event
post-movie revalidation (2s settle); area-exit fail; retrigger
guards (`creditedTargets` + finishing lease + exact-uniqueId kill
credits); party cap 8 with leader-only entry and member validation;
minimumLevel gates owner + party (no 1.x level sync); mounted
leader/members refused with dismount message (no battle chocobos);
unplayed success scene fails the phase.

## Implementation

Existing: template War0j5 battle block, `QuestDirectorJobWar0j5.lua`,
private profile 32758 (migration + main-SQL parity row). Untouched
this pass; pinned by `validate_job_war0j3_war0j6_adapters.py` (PASS).
