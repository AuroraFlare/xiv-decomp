# 111224 Good Vibrations — `mnk0j4` (normalized from Batch MNK-B)

- Job: MNK 15 (base PUG 2 + LNC 8/15) | Level: 45 | Offer: Erik 1060033 | Availability: enabled
- Lua: `Data/scripts/quests/mnk/mnk0j4.lua` via `job_quest_template.lua` (Mnk0j4). No bespoke script.
- SQL prereq: 111223 in Lua (The Pursuit of Power).

## Sequence flow (VERIFIED: DAT dialogue + journal selectors + template)
ACCEPT Erik `processEventERIKStart` (accept 17,18; grants 11000555) -> 0
launch boundary -> 5 private Apep kill (`mnk0j4_apep`) -> 10 Erik
`onJobQuestCompleteFirst/Second(27118 mode 3)/Third(linkshell 2200241:93)` +
instrument shatter + `sqrwa 5340`.

## Delegate events (VERIFIED: template JOB_QUEST_DECOMP_EVENTS)
Wired: ERIKStart/First/Second/Third. Hint rows 19/33-36/38-51 unbound
(contextual dialogue, not objectives).

## Actors/markers (VERIFIED: DAT markers + actor SQL + spawn SQL)
Erik 1060033 (zone 175 spawn 2466); Apep 2100723/mob 32761 (private only, no
public row). Live marker 11221301 (zone 172, -1670.09/-1212.10, area display
4000257); no filler.

## Fight (VERIFIED: mob/skill SQL + director + archive kit)
`QuestDirectorJobMnk0j4`: 2100723/mob 32761 Apep, lv 53, skill 5006, single
kill. Expected 5 -> success 10 -> retry 0. 900 s, party 8. Quest
`onKillBNpc` inert; director credits kill.

## Rewards (VERIFIED: template + item/action SQL + 1.0 quest page)
Exp 5340 + Dragon Kick 27118x1. Lua plays `sqrwa` presentation plus
`AddExp` (template central path); instrument removed via `removeItems`.

## Edge handling (VERIFIED: template + gc_sqb launcher/runtime)
Eligibility gates on all guards; exact uniqueId kill credit; death/timeout/
DC/exit/abandon/logout all retry at Erik (seq 0); item-loss safe; helpers
earn no credit; 45-yalm leash; no sync. No chocobo (mounted blocked
pre-entry + post-movie; 0 chocobo actors over quest+director).

## Open gaps
- Live-client acceptance of fight/presentation (formation offsets).
- `tools/validate_job_mnk0j4_route.py` PASS (batch MNK-B, 2026-09-27).
