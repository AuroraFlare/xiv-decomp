# 111246 Whm0j6 The Chorus of Cataclysm (Lv50) deep decomp (2026-09-27)

## Chain position

Offer: Raya-O-Senna (1001570). Prereq 111245. Requires WHM 50 + THM 15.
Rewards: Healer's Robe (8032706, verified), Benediction (27345). Finale.

## Recovered flow

`processEventStart`: accept 19 / decline 18. `processEventCutSceneBeforeBattle`
plays `whm0j605`. `processEventNQ` and `NQ03` are IDENTICAL `whm0j610`
wrappers: play only one. All end Default; no AfterWarp call. Journal Fst 431
(quell the elementals SW of Camp Bentbranch) vs 432 (Oha-Sok rescues the
player, becomes the final artifact, return to Raya): the post-battle scene +
robe presentation precede the later cave report. `processEvent_getAF_info` is
NOT parameterized here: long (quest,49,8032706), item (player,8032706).
`processEventClear`: Raya robe discussion, 1.5 fade, long 50, ability
(27345,1), close. `processEventAfget(arg4)` is a SEPARATE surface (no
showGetJobItemWidget): never append it to getAF_info + Clear (repeats the
ability widget, reorders widgets).

## Markers + position (verified)

- 11222501 battle: (-376.55,56.12) m00013 103/301 MapMarkerQuest.
- 11222502 reward: Raya's cave.
- Zone: Central Shroud (150), SW of Camp Bentbranch / south of Sorrel Haven
  (walkthrough map X27 Y38).

## Scenes (verified in prior decomp)

`whm0j605` (pre): 13 slots / 16 blocks / 34 SetPos, zero initial placements.
PC staged at (-373.13,-22.32,50.55); six role positions in c09/c10 (Fire, Earth,
Wind, Light, Ice, Water; all yaw 2.356194): a CINEMATIC formation, not six
combat spawn points. Roles: Fire 1001966, Ice 1001967, Wind 1001968, Earth
1001969, Light 1001970, Water 1001971. `whm0j610` (post): 13 slots / 21 blocks
/ 57 SetPos, nine initial placements all zero; adds Oha-Sok 1060030 (she
becomes the robe). NOTE: scene roles say Light; family evidence says
Lightning-bound Wrath; both recorded, neither conflated.

## Mobs (adapter policy, EXPLICIT)

Exact: Icebound 2204707/mob 3055 (staging: job 23, lv 55, Ice, skill 14),
Earthbound 2204907/mob 3020 (job 23, lv 55, skill 64). Fire actor 2204610 is
exact (display 3204607) with NO mob profile. Wind/Lightning/Water have NO
Wrath actor bindings; classes 2204807/2205007/2205107 exist but carry GENERIC
displays 3204801/3205001/3205101 (verified in gamedata_actor_class.sql).
New rows in `WHM_whm_quest_mobs.sql`, modeled on verified cnj300 elemental
neighbors (3134-39: job 23, skill 5021, resists 1.0): 3153 Firebound (2204610,
element 0), 3154 Wind-bound (2204807, element 2, GENERIC-DISPLAY ADAPTER),
3155 Lightning-bound (2205007, element 4, GENERIC-DISPLAY ADAPTER), 3156
Water-bound (2205107, element 5, GENERIC-DISPLAY ADAPTER), all lv 55.
Waves (adapter; retail gives no multiplicities/waves/kill rules): wave 1 =
Earthbound + Icebound (exact pair), wave 2 = Firebound, wave 3 = Wind +
Lightning + Water. requireAllTargets, timeout 1200s, boundary 45y,
partyRadius 35y, minimumLevel 50, maxPartySize 8 (journal recommendation).
Enrage = timeout. Pre-battle `whm0j605` runs as launcher preEvent AFTER staging
(fail-closed: movie failure aborts the start, quest stays retryable).

## Implementation: bespoke `whm0j6.lua` + `QuestDirectorJobWhm0j6`

SEQ: ACCEPT Raya -> 5 battle (pre-scene, 3 waves, retry at Raya) -> 10 reward
at Raya (robe already presented in-scene; `processEventClear` + Benediction).
Victory persisted before the `whm0j610` + robe attempt; scene/item hiccups never
revoke victory. Same wipe/retry/re-entry/abandon/disconnect/death/OOB/retrigger
matrix as Whm0j1. No chocobo surface (private area engine ban + 0 spawn APIs).

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j6 section + whm0j605/whm0j610.json
- quest_marker.csv 11222501/2; tmp staging rows 3020/3055; actor_class 2204x/2205x
- GamerEscape plot details (Bentbranch); fandom journal; mob_types 3134-39
