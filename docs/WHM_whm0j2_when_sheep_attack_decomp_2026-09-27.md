# 111242 Whm0j2 When Sheep Attack (Lv35) deep decomp (2026-09-27)

## Chain position

Offer: Raya-O-Senna (1001570). Prereq 111241. Requires WHM 35 + THM 15.
Rewards: 3360 EXP, Regen (27358). Unlocks 111243. Status: Implemented, verified
unchanged by this pack (template-driven + `QuestDirectorJobWhm0j2`).

## Recovered flow

`processEventRAYAOSENNAStart`: opens talk, plays `whm0j210` with Default fades,
continues offer speech, THEN quest choice (accept 14 / decline 13). Scene plays
on both branches. Journal Fst 418 (sheep objective SW of Camp Glory), 465
(return), selector 11/Fst 463 (linkpearl return; not a second chat).
`processEvent005` is the full post-Downy-Dunstan report: Raya scheduler wait,
39..41, player scheduler 67108919, `sayFreeDisplayName(2600009,quest,42)` +
text 43 for Oha-Sok (free-speaker path, NOT a spawned ally), long 52, (27358,2),
46, world 47, close. Do NOT append `onJobQuestCompleteFirst/Second` (duplicates
the ability widget). `whm0j210`: 11 slots / 27 blocks / 43 SetPos, zero initial
placements; cave staging in later blocks (PC (-1542.32,6.56,-1591) etc.).

## Markers + position (verified)

- 11222101 battle: (1201.08,1124.74) m00029 102/203 MapMarkerQuestArea.
- 11222102 reward: Raya's cave (-1540.98,-1588.34).
- Zone: Coerthas Eastern Lowlands (145). Kai NM guide: Downy Dunstan, Ram,
  SW of Camp Glory (49,32), lv 42, HP 17493, MP 773, Passive/Sight, Wind/Ice.

## Mobs (exact, re-verified)

Actor 2106017 / display 3106019 / mob 3019 (`downy_dunstan`, job 2, lv 42,
HP 17493, MP 773, promoted from tmp staging), NM skill list 6010 = Lullaby
(23239). Private uniqueId `whm0j2_downy_dunstan`; ambient kills can never
credit. maxPartySize 4 (player + three companions), timeout 900s.

## Loophole matrix (inherited, verified present)

Private shell + owner binding + relog rebind + abandon guard + duplicate-kill
reconciliation + timeout/wipe fail to retry + live-shell anti-duplication, all
in `gc_sqb_quest.lua` / `gc_sqb_runtime.lua`. Mount ban: engine
`IsMountRestrictedArea` (private area). onKillBNpc quest hook inert for
materialized fights.

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j2 section; `QuestDirectorJobWhm0j2.lua`
- quest_marker.csv 11222101/2; Kai NM guide row 3019; skill_list 6010
- Patch 1.21 notes (Raya-O-Senna, North Shroud 15,22)
