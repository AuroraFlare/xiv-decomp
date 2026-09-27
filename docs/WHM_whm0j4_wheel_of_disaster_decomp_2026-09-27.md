# 111244 Whm0j4 The Wheel of Disaster (Lv45) deep decomp (2026-09-27)

## Chain position

Offer: Raya-O-Senna (1001570). Prereq 111243. Requires WHM 45 + THM 15.
Rewards: 5340 EXP, Holy (27359). Unlocks 111245.

## Recovered flow

`processEventStart`: accept (15,48) / decline 14. Availability/progress variants
(`StartBeforeRaya/MogA/MogB`, `RyaoAfter`, Moogle A/B00/01) are not objectives.
Journal Fst 424: a bandit and minions prey on travelers at the land bridge south
of Camp Bearded Rock, up to seven helpers (maxPartySize 8). Fst 425: bandits
freed, Oha-Sok departs after an ominous warning, report to Raya.
`processEventNQ` = POST-BATTLE, PRE-RETURN `whm0j410` scene (Default fades; NQ
return register ignored; must not be moved into the reward talk).
`processEventLS` / `processEventLS2` call `showEventBeforeNpsLS(2700007,38)` /
`(2700007,63)` independently: available linkpearl surfaces, not a proven serial
pair. `processEventClear` = later Raya report (1.5 fade mid-explanation, long
64, (27359,2), close). Scene has only PC + Oha-Sok; later clips place them at
(222.65,43.55,441.56) / (222.65,44.48,443.58): fits the encounter site, NOT the
cave report. No bandit roster in the scene; Oha-Sok as combat ally unproven.

## Markers + position (verified)

- 11222301 battle: (222.65,441.82) m00013 101/101 MapMarkerQuest.
- 11222302 reward: Raya's cave.
- Zone: Lower La Noscea (128), land bridge / rope bridges over Moraby Bay area
  south of Camp Bearded Rock.

## Mobs (adapter policy, EXPLICIT)

External corroboration (Garlemald-Server #147, from Mirke/GamerEscape
transcripts): the fight is Rowland of the 99 Blades + Bandit Butcher / Lancer /
Grappler / Archer (5 targets, victory = all defeated). This JOINS the four
candidate actor classes to the quest at walkthrough confidence (not retail DAT):
2289031 butcher / 2289032 lancer / 2289033 grappler / 2289034 archer (all
verified in actorclass_graphic.csv). No mob-type rows exist for them and no
Rowland actor exists anywhere. New rows in `WHM_whm_quest_mobs.sql`, modeled on
verified neighbor `bandit_spearman` (39114: lv 45-49, skill 88, detect 1):
3148 Rowland (actor 2289031, lv 47, display "Rowland of the Ninety-Nine
Blades"), 3149 butcher / 3150 lancer / 3151 grappler / 3152 archer (lv 45).
Waves (adapter): wave 1 = 4 minions, wave 2 = Rowland. requireAllTargets,
timeout 900s, boundary 45y, partyRadius 35y, minimumLevel 45. Enrage = timeout.

## Linkpearl beat (engine-supported)

`quest:NewNpcLsMsg(npcLsId)` + `onNpcLS` exist (`quest_template.lua`, Quest.cs).
After director victory the script flags the Raya linkpearl message and plays
`processEventLS` best-effort; LS2 stays available. Skipping/ignoring the
linkpearl cannot block the return: the reward state depends only on victory.

## Implementation: bespoke `whm0j4.lua` + `QuestDirectorJobWhm0j4`

SEQ: ACCEPT Raya -> 5 battle (retry at Raya; linkpearl flagged on victory) ->
10 reward at Raya (`processEventClear`, Holy). Victory persisted before the
`whm0j410` aftermath attempt; scene failure never revokes victory. Same
wipe/retry/re-entry/abandon/disconnect/death/OOB/retrigger matrix as Whm0j1.

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j4 section + whm0j410.json
- quest_marker.csv 11222301/2; actorclass_graphic.csv 2289031-34
- fandom/GamerEscape journal; Garlemald-Server #147 (walkthrough confidence)
