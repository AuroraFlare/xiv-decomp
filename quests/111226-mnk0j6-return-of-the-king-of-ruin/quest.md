# 111226 Return of the King...of Ruin — `mnk0j6` (normalized from Batch MNK-B)

- Job: MNK 15 (base PUG 2 + LNC 8/15) | Level: 50 | Offer: Erik 1060033 | Availability: enabled
- Lua: `Data/scripts/quests/mnk/mnk0j6.lua` via `job_quest_template.lua` (Mnk0j6). No bespoke script.
- SQL prereq: 111225 in Lua (Five Easy Pieces).

## Sequence flow (VERIFIED: DAT dialogue + journal selectors + template)
ACCEPT Erik `processEventERIKStart` (accept 59) -> 0 `processEvent005(true)`
-> `mnk0j610` lead-in -> 5 five-target private kill -> 9 persisted victory +
`processEvent015`/`mnk0j620` AfterWarp reload -> 10 private Widargelt
`processEvent020(8032702)` + `processEventClear` (talk 115, 27106).

## Delegate events (VERIFIED: template JOB_QUEST_DECOMP_EVENTS)
Wired: ERIKStart + 020(8032702)/Clear. 005/015 run as pre/aftermath scene
events, never during the reward talk. Hint rows 15-17/74-79/82-89 unbound.

## Actors/markers (VERIFIED: DAT markers + actor SQL + spawn SQL)
Erik 1060033 (zone 175 spawn 2466; offer + recovery); private Widargelt
1060032 `mnk0j6_aftermath_widargelt` (aftermath + reward; public Eastern
Thanalan spawn never reused). Live markers 11221501/02 (zone 190,
-138.76/345.19); no filler.

## Fight (VERIFIED: mob/skill SQL + director + 1.x archive levels)
`QuestDirectorJobMnk0j6` (+ `...Aftermath`): 2289039/mob 3115 Widargelt
(lv55, list 15) + 2289040/3036 pikeman + 2289041/3032 axeman + 2289042/32762
bowman (list 15) + 2289043/3037 shaman (list 14), adds lv53. Expected 5 ->
success 10 (via persisted 9) -> retry 0. 900 s, party 8. Quest
`onKillBNpc` inert; director credits kills.

## Rewards (VERIFIED: template + item/action SQL + 1.0 quest page + forum)
Temple Cyclas 8032702x1 + Hundred Fists 27106x1. No EXP. 020 arg grants the
item widget; server grant authoritative.

## Edge handling (VERIFIED: template + aftermath + gc_sqb launcher/runtime)
Eligibility gates on all guards; exact-5 credit; victory persisted pre-movie;
Erik recovery replays neither combat nor movie; death/timeout/DC/exit/
abandon all recover via Erik; helpers earn no credit; 45-yalm leash; no
sync. No chocobo (mounted blocked pre-entry + post-movie; 0 chocobo actors
over quest+directors).

## Open gaps
- Live-client acceptance of fight/scenes/recovery (formation offsets).
- Widargelt server job 2 vs archive "Monk" label (owner follow-up).
- `tools/validate_job_mnk0j6_route.py` PASS (batch MNK-B, 2026-09-27).
