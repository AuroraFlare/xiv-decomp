# 110080 All Bark and No Bite (Gla200) — decomp

GLA 20. Lulutsu (1000863) offers a Coliseum selection bout: enter the
bloodsands through the guild back door, defeat one Ala Mhigan Challenger
(GLA kit), watch the post-fight scene, report to Lulutsu. Text sheet 513.

## Sequence / flags

-1 offer (LulutsuStart: say 1-3, ask 65, say 4-8+29, quest-info; result
gates accept) -> 0 retry/launch -> 10 private fight (director-owned) ->
20 post-fight scene (020/gla20020) -> 30 reward (030/gla20030).
No work counters. Ambient pages 005_2..10 (text 30-48) and 020_2..10
(text 19/49-64) are ownerless: unbound by design.

## NPCs / markers

Lulutsu 1000863/1500022, zone 209 Ul'dah at (-193.46, 195.05, 183.65).
Live: 11008001 Coliseum door (-187.225, 219.73, area 421, disp 4000257;
map (5.49,5.72) cell (5,5) Ul'dah p1900 via map_coordinates; no recorded
ground at the door, nearest node ~32u) and 11008002 Lulutsu (-193.46,
183.65, disp 1500022). 11008003-20 are DAT filler (rejected).

## Fight

Private quest-battle copy of the inviter's zone-209 area
(SimpleContentQuestBattle `quest_sqb_gla200_<ownerId>`); the mob spawns
dynamically at the owner position + facing*4.0, so no public spawn SQL
exists (correct per the placement guide: private content never exports
public SQL). Single target 2289006/mob 3034, lv 20, job GLA(3), speed
6, aggro 10, combatDelay 4200ms, skill list 15 (animal_instinct,
godsbane, jump, wyvern_dive), loot none. preEvent 010/gla20010 on entry.
Director 10 -> 20, retry 0; 600 s inferred (no retail timer recovered);
party cap 3. Kill credit requires the exact private actor + owner id +
sequence 10; quest onKillBNpc is inert, so ambient kills can't credit.
Death/timeout/disconnect/abandon/area-exit/entry-fail all fail closed to
retry 0 with party return + cleanup.

## Rewards / sync / lockouts

Central gil 20000 + GLA marks 1000102x2000; Lua Iron Shortsword 4030203
(verified item/weapon rows; matches GE reward category) + EXP 1760 via
grant-checked completion (full inventory holds the turn-in; HasItem
guard stops dupes on abandon/re-accept). No level sync: overlevel is
allowed, matching 1.0 retail. Single live copy per owner + DisableReentry.

## Chocobo

Entry while mounted is refused with a dismount message (shared
launcher, leader + every helper re-checked after the entry movie);
mounting inside is refused server-side (`CanMountInCurrentArea` ->
`IsMountRestrictedArea`: every private area is restricted). No chocobo
or goobbue references in quest/director code.

## Retail walkthrough (GamerEscape)

Guild back door -> immediate battle vs the challenger -> cutscene ->
back outside -> Lulutsu. Confirms the implemented slice unchanged.

## Gaps

Live client acceptance of the entry/post scenes; no retail timer
recovered. `validate_gla200_route.py` PASS in this checkout (scenario
file present; batch-A blockage cleared).
