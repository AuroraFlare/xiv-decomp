# Thm200 The Big Payback — implemented

Implemented: 2026-09-26 (upgraded from the single-boss slice). Thaumaturge 20.

## Retail route

Yayake (offer, Ossuary) -> I'loofii briefing (020) -> travel to Western
Thanalan (14,27) -> Duty-Calls vengeance duty -> I'loofii report/reward
(030). Chain: follows the rank-15 THM unlock; Thm300 follows this quest.

## Decomp evidence

- DAT markers 11024001/02/03 (Ossuary briefing, Thanalan vengeance site
  display 4000257, Ossuary report). Marker 11024002 resolves to map square
  14/27 under the calibrated Western Thanalan transform, matching the
  Gamerescape walkthrough square.
- Decompiled scenario `thm200.lua`: YayakeStart (thm20010), 020
  (thm20020 briefing), 030 (thm20030 report). The 010_2-7 and 020_2-8
  variants are guild-join and post-briefing chatter and stay unbound.
- DAT lure text (rows 68/69: the death-mark is not in the herd and must
  be lured out; rows 58/59: harm the child to draw the parent) plus the
  walkthrough fix the three-wave duty: five Nannygoats, the Death-marked
  Billygoat appearing when one is left, the Twisted Aldgoat Horn proof
  (item 11000015), then the Enraged Nannygoat.
- DAT display names: 2102313/3102313 nannygoat, 2202303/3202303
  death-marked billygoat, 2202307/3202307 enraged nannygoat.

## Implementation

- Template `Thm200`: route [1] I'loofii briefing, route [2] push trigger
  (generic Duty-Calls actor 1000174 at marker 11024002, PGL306/ARC200
  precedent; no decomp talk event exists there), 3-wave battle, direct
  payout to I'loofii (no post-battle route).
- Wave map: wave 1 holds four Nannygoats; wave 2 holds the fifth Nannygoat
  plus the boss, so the lure lands when one herd goat is left; wave 3
  holds the Enraged Nannygoat. All 7 kills required.
- Director `QuestDirectorClassThm200`: sequences 10 -> 20 (report) / 0
  (retry from the offer boundary), party cap 3, 600s timeout. The boss
  credit grants the Twisted Aldgoat Horn defensively (a failed grant
  never fails the duty; the kill stays the objective). Granted proof
  items are not consumed at completion.
- Mob profiles: Nannygoats reuse public profile 1046 (level 12-15);
  boss keeps 3126 (level 15); enraged is new profile 32741 (level 20,
  rank-20 duty boss standard, goat skill list 5002).
- Rewards: Wind Brand 5020210 + 1,760 EXP in script; 20,000 gil + 2,000
  marks in the central rows.
- Spawn scaffold 3310 (`thm200_vengeance_trigger`, zone 172, DAT X/Z
  -1229.530/-310.290, Y 57.0): no recorded ground within 39 yalms, so Y
  is the mean of the consistent 55-59 surroundings and stays flagged for
  a live `!quicknavmesh` capture at the marker.

## Verification

`tools/validate_thm200_route.py` PASS (route, waves, proof grant,
profiles, trigger, markers, rewards, availability).
`tools/validate_quest_availability.py` PASS.
