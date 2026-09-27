# 111243 Whm0j3 Lost in Rage (Lv40) deep decomp (2026-09-27)

## Chain position

Offer: Raya-O-Senna (1001570). Prereq 111242. Requires WHM 40 + THM 15.
Rewards: 4260 EXP, Esuna (27357). Unlocks 111244. Status: Implemented, verified
unchanged by this pack (template-driven + `QuestDirectorJobWhm0j3`).

## Recovered flow

`processEventRAYAOSENNAStart`: accept 16 / decline 15, single result. NO NQ
scene or fade call anywhere in this quest. Journal Fst 421 (Cactuar Jack east
of Camp Horizon), 464 (return to the cave after subduing it). `processEvent005`:
24,25,26,27, long 31, ability (27357,2), 28,29, world 30, close. Text 24 makes
the ABSENCE of an elemental manifestation explicit: never translate into an
extra spawned elemental objective. No `onJobQuestComplete*` variants exist here.

## Markers + position (verified)

- 11222201 battle: (-881.29,2.4) m00029 104/403 MapMarkerQuestArea.
- 11222202 reward: Raya's cave.
- Zone: Western Thanalan (172). Ambient NM spawn `nm_cactuar_jack_172_1` at
  (-835.122,120.116,-15.025) is evidence only; the quest uses a private
  uniqueId so ambient kills never credit.

## Mobs (exact, re-verified)

Actor 2100910 / mob 3009 (`cactuar_jack`: job 5, lv 47, HP 26449, MP 851),
NM skill list 6006 = 1000 Needles (23147), Tender Thrust (23148), Sun Spines
(23149), 100 Needles (23413). requireAllTargets, maxPartySize 4.

## Loophole matrix (inherited, verified present)

Same `gc_sqb` guarantees as Whm0j2. Mount ban engine-side. Quest onKillBNpc
inert for the materialized fight.

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j3 section; `QuestDirectorJobWhm0j3.lua`
- quest_marker.csv 11222201/2; mob_types row 3009; skill_list 6006; Kai guide 3009
