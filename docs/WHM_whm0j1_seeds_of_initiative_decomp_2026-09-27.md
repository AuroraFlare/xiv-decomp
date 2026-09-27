# 111241 Whm0j1 Seeds of Initiative (Lv30) deep decomp (2026-09-27)

## Chain position

Offer: Soileine (1000234, Gridania 206, public spawn verified). Prereq: none
(first quest). Requires CNJ 30 + THM 15 on CNJ. Rewards: 2661 EXP, Presence of
Mind (27344), key item 2000206, The Keeper's Hymn (3020410, verified in
`gamedata_items.sql`). Unlocks 111242.

## Recovered flow (client decomp + journal Fst 413/414/415)

1. Soileine `processEventStart` (accept 6 / decline 5; `StartAfter` reminder 7).
2. Raya-O-Senna lakeside cave: `processEventRayao(arg4)` (arg4==1 returning
   greeting 9, else first-meeting 8; dialogue only, not battle authorization).
3. Mun-Tuy Cellars: put down one Diremite Straggler and her Miteling brood,
   reclaim the stolen staff Nirvana (11000551).
4. Return to Raya: `processEventClear` (says 23,24, returns WITHOUT finishing
   the turn) then `processEventClearNQ` (Default fade-out, finishes turn, wait 1,
   plays `whm0j110`, fade-in). The split handoff is deliberate; kept intact.
5. `processEventJob` (item widget) + `processEventKokuti` (presents (27344,1)).

Journal: "Up to three party members may accompany you" (maxPartySize 4).
Moogle A/B00-02 and misspelled `RyaoAfter` are progress-keyed variants, not
extra objectives. Moogle turns use `startCliantTalkTurnNoWait(1,player)`.

## Markers (quest_marker.csv, verified)

- 11222001 offer/route: (-1540.98,-1588.34) m00013 103/303 (Raya's cave).
- 11222002 battle: (-1008.96,-2091.48) m00013 103/311, display 4000257.
- 11222003 reward: cave, same as 11222001.

`map_coordinates.py locate --zone 157 --page 2500 --world -1008.96 -2091.48`:
map (4.63,5.97), 0 recorded points within 30y, nearest node 646 at
(-975.78,-19.71,-2094.78) 33y away, height UNRESOLVED at center. A public
placement at the marker would be ungrounded: the fight is a private adapter.

## Scene whm0j110 (verified in prior decomp)

Actors: Raya 1001570, Oha-Sok 1060030, Pukni Pakk 1001937, Kupcha Kupa 1001938,
prop 1200318. PC/Raya share setup (-1541,6.58,-1588.3); moogles share Oha-Sok's
point: never copy into persistent spawns. 12 slots / 28 blocks / 65 SetPos.

## Mobs (adapter policy, EXPLICIT)

No mob-type rows exist for 2201115/2201114. Family neighbor `molting_miteling`
(1050: job 8, lv 30-32, skill 5018 Caustic Blow/Deadly Thrust/Realm Shaker/
Sticky Web, detect 4, earth element) is mirrored. New idempotent rows in
`WHM_whm_quest_mobs.sql`: 3146 miteling (lv 30), 3147 diremite (lv 32).

Waves (adapter: walkthrough proves 1 adult + 3 young, not timing): wave 1 = 3x
Miteling Straggler; wave 2 = 1x Diremite Straggler. requireAllTargets, timeout
600s, boundary 40y, partyRadius 30y, minimumLevel 30. Enrage = timeout fail.

## Nirvana transition (resolved)

11000551 is `Normal/DummyItem`: it cannot live in inventory. Recovery is a
quest flag + counter set by director victory, presented in-scene via prop
1200318. No `AddItem(11000551)` anywhere (would silently fail).

## Implementation: bespoke `whm0j1.lua` + `QuestDirectorJobWhm0j1`

SEQ: ACCEPT Soileine -> 0 Raya route -> 5 battle (retry at Raya) -> 10 reward
at Raya. Victory persists BEFORE the aftermath scene attempt; the scene is
best-effort and never converts victory into failure (cutscene-skip safe).
`onKillBNpc` is inert: only the director's reconciled callbacks advance.
Abandon/reacquire resets flags/counter in `onStart`. Wipe/timeout/disconnect/
death-during-scene all land on seq 5 with Raya as the visible retry NPC; the
native live-shell lease blocks duplicate shells. Full matrix in code comments.

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j1 section + whm0j1.calls/bytecode/scene
- quest_marker.csv rows 11222001-3; actorclass_graphic.csv 2201114/2201115/1000234/1001570
- fandom White Mage Quests (1.0): brood in Mun-Tuy Cellars north of Camp Emerald Moss
- `map_coordinates.py` Mun-Tuy locate (this pack); `gamedata_items.sql` 3020410/11000551
