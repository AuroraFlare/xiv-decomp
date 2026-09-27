# 110442 Something in the Soup (Cul306, Lv.36 Culinarian)

VERIFIED: DAT `cul306.csv` (104 lines, row IDs 1-120, full EN read) + DAT
`quest_marker.csv` 11044201-11 (+ filler 12-20) + SQL `gamedata_quests.sql` /
`gamedata_quest_rewards.sql` / `gamedata_items.sql` / `gamedata_recipes.sql` rows +
`class_quest_template.lua` recovered Cul306 record + walkthroughs
([GamerEscape](https://ffxiv.gamerescape.com/wiki/Something_in_the_Soup) full
journal + 15-step walkthrough,
[Mirke-transcript issue](https://github.com/swstegall/garlemald-server/issues/104)).
No client scenario decomp exists for any CUL quest
(`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/` is absent), so
scene/state bindings are the template's recovered spine in numeric order, not
watched decomp. No 1.0 video found for this quest (pack V11 gap stands).

## Sequence flow (VERIFIED: DAT dialogue + wiki journal/walkthrough)

Prudentia offer + Bismarck instance (ask 81; rows 1-8) -> Echo 1: Lienart enters
seeking Pulmia, Prudentia stricken (rows 14-19) -> Charlys: the visitor was
Prudentia's FORMER betrothed; seek her in the alley or down by the sea (rows
21-24) -> bethel instance, Lower Decks 6-4: first-meeting scene (rows 25-28) ->
Echo 2: poisoning confession + Devilbelly commission (rows 32-34, item 11000071
ref) -> Bismarck instance: Gerulf grants the Queer-smelling Meat (step 8),
Rsushmo grants the Sweet-smelling Spice (step 9), Frailoise grants the Foulbelly
recipe (step 10) -> synth the Foulbelly (Requested Items; Button Mushroom + meat
+ spice) -> synth the Devilbelly (Requested Items; Foulbelly + 2 Devilshrooms) ->
ramp cutscene -> bethel finale: the Lienart/Adela confrontation and Prudentia's
reveal (rows 42-56) -> Charlys reward (rows 58-67; row 66: "Prudentia asked me to
give this to you").

STATE-ORDER CONFLICT (open gap): the template's state labels put cooking at
10/15, Echo 1 at 20, Devilbelly at 25, Echo 2 + report at 30; the walkthrough and
the scene spine (020 Echo -> 030/040 cooking -> 050 Echo) put Echo 1 FIRST and the
cooking BETWEEN the Echoes. The state NUMBERS and scene IDs are recovered; their
pairing and the objective text are interpretive. Scenario decomp is required to
resolve it. The lua skeleton routes only the finale, so it is compatible with
either mapping.

## Actors/markers (VERIFIED: DAT markers + spawn SQL)

Prudentia 1000168 (row 310), Charlys 1000138 (row 305), Gerulf 1000063 (row 300),
Rsushmo 1000170 (row 312), Frailoise 1000065 (row 302): all public in zone 230.
Markers 09/10/11 sit DAT-EXACT on Gerulf's / Rsushmo's / Frailoise's spawn X/Z,
confirming the walkthrough's grant bindings (meat / spice / recipe) at the
position level. Marker 01 sits on Prudentia's station (offer). Marker 08 is the
ONLY Area-type marker in the CUL set (MapMarkerQuestArea at -511.03, 38.28; the
ramp-cutscene candidate). Markers 02-07 are unmapped middle-leg beats. 12-20 are
the shared dummy filler. Rsushmo/Frailoise second variants (1700036/1700035) have
no spawn rows. Lienart and Adela (bethel/finale cast) have no repo actor or spawn
rows at all. No new spawn rows needed; next-free spawn id is 3376 (GLD306 owns
3371-3375).

## Grants (WALKTHROUGH-RESOLVED, scene bindings unrecovered)

Meat = Gerulf (wiki step 8), spice = Rsushmo (step 9), recipe = Frailoise (step
10), all DAT-marker-exact on the grant stations (DAT hint rows 115/118/120
corroborate). Grant scenes bind numeric-order best effort. Devilshroom x2
resolves by THE inferred binding (bethel grant, capped, re-grantable; see
`resolvedBlockers`). Issue #104's "Prudentia hands over a devilshroom
(singular) + recipe" stays an unverified lead (unsourced, inconsistent
with x2).

## Synthesis (VERIFIED: SQL recipes 5388/5389 + wiki steps 11-12)

Recipe 5388: Foulbelly Meatball 11000073 <- Button Mushroom 3011406 (normal,
player-sourced) + Queer-smelling Meat 11000074 + Sweet-smelling Spice 11000075.
Recipe 5389: Devilbelly Meatball 11000071 <- Foulbelly 11000073 + Devilshroom
11000072 x2 (repeated slot). Both job 'H', level 36, zero-crystal 'CC', no
facility. The Requested Items submenu path is walkthrough-verified. Work counters
(slot 2 spice / 3 recipe / 4 meat =1; slot 5 Devilbelly / 6 Foulbelly =10) are
recovered meanings, but the engine persists counter slots 0-3 only: DAT slots 4-6
must NOT be passed to SetCounter (silently dropped), so the lua reserves FLAG_MEAT
and derives synth progress from inventory snapshot-diff (Alc200 precedent).
Requested syntheses grant no SP (engine-owned).

## Echo (VERIFIED asks, client-only visions)

Two Echo gates, both ask 51030 mode 2 (F'lhaminn/Gld200 pattern): the kitchen
flashback (scene 020) and the bethel flashback (scene 050). No pastAreaIn is
documented, so both gates are treated as client-only visions with no private
lifetime. The finale requires all three flags (ECHO2 + 060/065 late chain).

## Instances (VERIFIED retail legs, unbuilt)

Retail has THREE instance legs (wiki steps 1, 4, 7/15): Bismarck interior, bethel
(Lower Decks 6-4) interior, Bismarck return. Directors recovered empty and no
private-area owners exist, so the server runs the public-world adaptation
(Alc200 precedent): full talk route + three push triggers (rows 3378/3379/3380).
No chocobo mechanic: the single "chocobo" substring in the CUL DATs is the
German flavor word "Chocobomelken" (row 89, DE column).

## Rewards/sync/lockouts (VERIFIED: SQL)

Central gil 36000 + Culinarians' Guild Marks 1000120x3600, both autoGrant=1;
Lua EXP 4720 (post-1.20 Lv.36 maximum). No tool documented or granted
(`rewardEraUnresolved`). No level sync, no lockouts, no timeout; one-time quest
with chain prereq 110441.

## Edge handling (implemented)

Culinarian-36 + completed-110441 gate on offer and every talk/push;
nil-accept offer; verified grants (inv-full retries); capped Devilshroom
top-up (never above 2, never while a Devilbelly is owned); snapshot-diff
synth credit on both meatballs (engine-safe counters 0-3; DAT work slot
4 lives in FLAG_MEAT); strict Echo gates (result==1); accept-either
Rsushmo/Frailoise variants; uniqueId-checked push triggers; loss/replace
recovery hints (mats re-grantable, shrooms at the bethel); `onFinish`
consume-all (NQ+HQ, multi-copy, incl. Devilshroom) on complete AND
abandon; logout/DC safe (persisted data).

## Enablement addendum (2026-09-27; walkthrough-order route enabled)

The lua implements the walkthrough order (Echo 1 first, cooking between
the Echoes) as the player-experienced mapping; the template-label
mapping stays recorded as the interpretive alternative. Devilshroom x2
resolves by marked inference (THE inferred binding at the bethel; see
`resolvedBlockers`). Lienart/Adela stay unspawned (no actor rows; no
invention). Instances collapse to the public adaptation (three push
triggers, rows 3378/3379/3380). Live GM pass owed.
