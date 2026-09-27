# 111225 Five Easy Pieces — `mnk0j5` (normalized from Batch MNK-B)

- Job: MNK 15 (base PUG 2 + LNC 8/15) | Level: 45 | Offer: Widargelt 1060032 | Availability: capture-gated
- Lua: `Data/scripts/quests/mnk/mnk0j5.lua` via `job_quest_template.lua` (Mnk0j5). No bespoke script.
- SQL prereq: 111224 in Lua (Good Vibrations).

## Sequence flow (VERIFIED: DAT dialogue + journal selectors + template)
ACCEPT Widargelt `processEvent_WIDARGELT_Start` (accept 14 + tail 48-57) ->
0 briefing boundary -> 6 four unordered coffer pushes (bits 0-3,
`processEvent_getAF_info(item)`) -> fourth completes in place
(`completionOwner = "interaction"`; no return). Erik pre-talk non-advancing.

## Delegate events (VERIFIED: template JOB_QUEST_DECOMP_EVENTS)
Wired: accept only. Per-acquisition `processEvent_getAF_info(item)` runs
from the objective (server-selected item), not the hooks table.

## Actors/markers (VERIFIED: DAT markers + actor/item/spawn SQL)
Widargelt 1060032 (zone 171 spawn 2484); Erik 1060033 context only; four
coffers actor 1200161, uniqueIds `mnk0j5_{darkhold,ughamaro,turning_leaf,
deadwind}_coffer` (eventnpc rows 3383-3386; X/Z exact, Y/rot TBD). Live
markers 11221401-04 (area display 4000257); no filler.

## Coffers (VERIFIED: template objectives + eventnpc SQL)
Four independent uniqueId-resolved objectives; server-policy item binding
(Gloves/Gaskins/Circlet/Boots). Claimed markers disappear independently;
grant-then-persist; no public credit surface.

## Rewards (VERIFIED: template + item SQL + 1.0 quest page)
Temple Gloves/Gaskins/Circlet/Boots via coffers + Exp 5340. No separate
grant; fifth piece belongs to 111226.

## Edge handling (VERIFIED: template onPush + runtime suite)
Eligibility gates on all guards; exact uniqueId + unclaimed-bit credit;
inventory-full retryable; repeat/wrong-actor/wrong-sequence rejected;
abandon-safe; party-independent bits. No instance. No chocobo surface.

## Open gaps
- Live Y/rotation capture at all four markers (+ Darkhold content
  visibility) → then `offer = true`. Capture checklist in decomp.md.
- `tools/validate_job_mnk0j5_route.py` PASS (batch MNK-B, 2026-09-27).
