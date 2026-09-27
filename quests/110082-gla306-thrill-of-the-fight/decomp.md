# 110082 Thrill of the Fight (Gla306) — decomp

GLA 36. Retail is a tourney bout plus a two-Echo refugee story; the
server implements the safe slice (briefing -> ready check -> one
private bout -> Lulutsu report) while the Echo chain awaits a
past-area director. Text sheet 521.

## Implemented sequence

-1 offer (LulutsuStart: say 3-4, quest-info gated). 1: Yoyobina
{11008201}, 003 briefing (say 7-10). 2: Yoyobina {11008202}, 005 ready
ask 113 (requiredResult 1, decline holds). 10: private bout, preEvent
010/gla30610. 20: Lulutsu {11008209}, 055 report (say 61-64). 30:
authoritative completion. Advice pages 003_2..12 (gladiator talks) are
optional per the journal ("learn what you can") and ownerless: unbound.

## Retail chain (GamerEscape + Fandom journal, unwired)

Fight 1 vs the marauder Ala Mhigan Bladedancer, with a ~25%-HP
crowd-performance emote beat (spectators stop attacking; no
emote-forcing primitive exists server-side) -> Yoyobina at the
bloodsands entrance (023) -> Echo on the Ala Mhigan Challenger (024,
ask 51030) -> fight 2 vs the Challenger, who changes jobs to Marauder
and regenerates to full HP -> report (030) -> observe his defeat from
the stands (040) -> second Echo (045, ask 51030) -> Silver Bazaar
instance, crowd + Yoyobina messenger scene (050/gla30650) -> Lulutsu
reward. Scenario cutscenes 020/gla30620, 020_999/gla30615 (probable
defeat/alternate branch, role unverified), 030, 040, 050 and markers
11008203-07 are inventoried in the template's documentedUnboundChain.
025 is an empty placeholder talk.

## Fight-identity conflict (OPEN)

The walkthrough names fight 1 as the Bladedancer, but the slice spawns
2289007/mob 3035 (challenger model 4000191, job MRD(4), lv 36). The
bladedancer identity 2289010/3033 (model 4000597) has a loot/guide row
but NO mob profile, so it cannot spawn today. Do not swap the spawn
until DAT mob-name/dialogue text rules the bout order and a 3033
profile exists; either fight's retail phases (emote beat, job-change
heal) also lack server primitives.

## Fight (as implemented)

Private copy of the inviter's zone-209 area, single target 3035
(lv 36, job MRD(4), speed 6, aggro 10, combatDelay 4200ms, skill list
15, loot none), spawn offsetX -3.0. Battle marker 11008208
(-1342.94, 487.89, mapArea 403 = bloodsands instance area, disp
4000257). Director 10 -> 20, retry 0; 600 s inferred; party cap 3;
exact-actor + owner + sequence credit; all fail paths retry 0.

## Rewards / sync / lockouts / chocobo

Central gil 36000 + marks 1000102x3600; Lua EXP 4720. No level sync
(overlevel allowed, 1.0 retail). Single live copy + DisableReentry.
Mounted entry refused with message; in-instance summon refused
server-side for all private areas. Prereq 0 (OPEN, not re-mined).

## Gaps

Echo/past-area director + Silver Bazaar instance + observed match;
fight-1 identity ruling + 3033 profile; retail phase primitives;
Yoyobina live placement (shared scaffold); live client acceptance.
`validate_gla306_route.py` PASS (safe slice + observed-match exclusion).
