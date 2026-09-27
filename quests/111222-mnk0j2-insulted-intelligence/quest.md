# 111222 Insulted Intelligence — `mnk0j2` (normalized from Batch MNK-A)

- Job: MNK 15 (base PUG 2) | Level: 35 | Offer: Erik 1060033 | Availability: enabled
- Lua: `Data/scripts/quests/job_quest_template.lua` (Mnk0j2) + `com/job_quest_item_objectives.lua` (11000552).
- SQL prereq: 111221.

## Sequence flow (VERIFIED: indepth decomp + template + wiki s2)
- ACCEPT Erik `processEventERIKStart` (accept 35,45 / decline 16;
  grants Brand-new Aetheriometer 11000552) -> 5 private Gluttonous
  Gertrude (exact uniqueId) -> 6 use aetheriometer (exact slot,
  consumed) -> 10 Erik `onJobQuestCompleteFirst/Second/Third`
  (51124+11000552 / ability 27107 / linkshell 1000101 event 92).

## Delegate events (VERIFIED: indepth process_events)
Wired: ERIKStart + First/Second/Third. No cutscene in this quest.

## Actors/markers (VERIFIED: SQL rows + DAT marker)
Erik 1060033 (z175 id 2466). Marker 11221101 (fight z128: 651.90,
235.09, south of Cedarwood; no navmesh at point — leader-relative
private spawn).

## Fight (VERIFIED: template + mob/skill SQL + walkthrough)
`QuestDirectorJobMnk0j2`: 2102010/mob 3043 Gluttonous Gertrude x1,
skill 6014 (Regurgitate 23013, Rancid Belch 23014). Expected 5 ->
success 6 (never direct to reward) -> retry 0. 900 s, party 4.
Ambient same-class kills cannot credit (private uniqueId).

## Rewards (VERIFIED: gamedata + template)
Central: Exp 3360 + action 27107. Instrument consumed at seq 6.

## Edge handling (VERIFIED: indepth s4 + item registry + gc_sqb)
Kill needs exact uniqueId + dead + same area; item needs seq 6 +
exact slot + bound quest (double-packet safe); early use silent
reject. Wipe/timeout/death/DC → retry 0 at Erik; abandon → bound
check; cap 4 at collect + pre-publish recheck. No chocobo
(engine + 3-layer gate). No sync. No lockout.

## Open gaps
- Public-trigger ownership unresolved (private adapter retained).
- Retail phase/timing at Cedarwood site remain verification follow-ups.
