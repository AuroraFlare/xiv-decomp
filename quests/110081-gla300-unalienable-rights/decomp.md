# 110081 Unalienable Rights (Gla300) — decomp

GLA 30. Lulutsu sends the player to Gridania to scout Coliseum talent:
Miounne waypoint -> Willelda spar choice -> private duel vs the lancer
J'moldva -> J'moldva Echo (she is the Hellfire Phoenix) -> Lulutsu ->
Yoyobina Echo (J'moldva vs Greinfarr) -> Yoyobina talks -> Lulutsu
reward. Text sheet 517.

## Sequence / flags

-1 offer (LulutsuStart plays gla30010 twice; result gates accept).
1: Miounne 1000230 {11008101}, 020/gla30020. 2: Willelda 1000242
{11008102}, 025 spar ask 164 (requiredResult 1, decline holds + say
167), afterEvent 030/gla30030 pre-fight. 10: private J'moldva fight.
20: J'moldva {11008104}, 040/gla30040 + 050 in the same talk — 050 is
the Echo (say 64, ask 51030, pastAreaIn, gla30050), and its ask result
gates the step via the events list (fix 2026-09-27; decline replays
040+050 instead of skipping the vision). 21: Lulutsu {11008105}, 055
say 84-85. 22: Yoyobina {11008106}, 065 Echo ask 51030 (requiredResult
1) + afterEvent 060/gla30060. 23/24: Yoyobina {11008107}, 070/gla30070
and 080/gla30080 cutscenes (nil result, no gate — gating would stall).
25: Lulutsu {11008108} talk. 30: reward 090 (say 117-120). No counters.
There is no linkpearl-use command: the say-64 linkpearl beat stays
inside the 050 Echo talk. Ambient pages 010_*/020_*/040_* (incl. the
walkthrough's post-fight Willelda/Ceinguled/Z'pahtalo/Burchard/Francis
talks), 060_2, 070_*, 080_* are ownerless: unbound by design. Marker
11008109 (disp 1300015, owner 1000928 cutscene shell) has no talk,
spawn, or event: unbound.

## NPCs / markers

Lulutsu 1000863 z209 (-193.46,195.05,183.65); Miounne 1000230 z155
(55.94,4.0,-1196.44; named scout is Yoyobina, Miounne is the present
waypoint); Willelda 1000242 z206 (179.15,27.5,-1580.59); J'moldva
1000599 z206 (195.04,27.9,-1591.1); Yoyobina 1001076 z209 scaffold
(-186.34,195.05,188.81; 24 recorded pts in selection via
map_coordinates, live Y/rotation correction pending). Live markers
11008101-08 per data.json; 11008110-20 are DAT filler (rejected).

## Fight

Private copy of the inviter's zone-206 area, single target
2289009/mob 3062 J'moldva, lv 30, job LNC(8), speed 6, aggro 10,
combatDelay 4200ms, skill list 15, loot none. Director 10 -> 20,
retry 0; 600 s inferred. The walkthrough's "30 minutes" is a single
source and stays unadopted. Party cap 3; exact-actor + owner +
sequence credit; all fail paths (death/timeout/DC/abandon/exit) retry 0.

## Rewards / sync / lockouts

Central gil 30000 + marks 1000102x3000; Lua EXP 3420. No item turn-in,
no dup risk. No level sync (overlevel allowed, 1.0 retail). Single
live copy + DisableReentry. Prereq: GE lists former requirement Gla200;
SQL/Lua prereq is 0 (OPEN, not re-mined).

## Chocobo

As Gla200: mounted entry refused with message; in-instance summon
refused server-side for all private areas. No mount code in quest/director.

## Retail walkthrough (GamerEscape)

Miounne (6-6) -> Willelda (2-7) spar -> instanced J'moldva duel (LNC
kit) -> immediate CS -> ambient NPC talks -> J'moldva Echo -> Coliseum
linkpearl -> Lulutsu instance -> Yoyobina Echo -> Cherlinaie/Yoyobina CS
-> Lulutsu reward 30000 gil + "lost blade" (Rage of Halone) tease (no
weaponskill granted). Matches the implemented route.

## Gaps

Linkpearl-use command; Yoyobina live placement; live client
acceptance. `validate_gla300_route.py` PASS (now also asserts the 050
Echo gate).
