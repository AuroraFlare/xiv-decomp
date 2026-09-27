# 110440 Showdown (Cul200, Lv.20 Culinarian)

VERIFIED: DAT `cul200.csv` (109 lines, row IDs 1-126, full EN read) + DAT
`quest_marker.csv` 11044001-08 (+ filler 09-20) + SQL `gamedata_quests.sql` /
`gamedata_quest_rewards.sql` / `gamedata_items.sql` / `gamedata_recipes.sql` rows +
`class_quest_template.lua` recovered Cul200 record + walkthroughs
([GamerEscape](https://ffxiv.gamerescape.com/wiki/Showdown),
[Mirke-transcript issue](https://github.com/swstegall/garlemald-server/issues/102)).
Video: "Final Fantasy XIV Online - Showdown (R20 Culinarian Quest)"
([YouTube](https://www.youtube.com/watch?v=hnIFw9aySOk)); page fetched, video not
viewable here, no claims taken. No client scenario decomp exists for any CUL quest
(`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/` is absent), so there
is no per-scene state wiring to verify against; scene/state bindings below are the
template's recovered spine, not watched decomp.

## Sequence flow (VERIFIED: DAT dialogue + wiki journal/walkthrough)

ACCEPT Charlys 1000138 (join-guild ask 70, assignment ask 73) ->
0/5 talk to BOTH chefs (intro rows 14-21; journal: "Speak with both") ->
CHOOSE ONE chef (ask 100 Prudentia / ask 104 Pulmia) -> recipe handoff (row 103/107) ->
synth the ONE dish (Requested Items) -> deliver to the chosen chef ->
contest resolves: forty-order call goes to Pulmia (rows 34-35), Prudentia storms out
the rear exit (row 36) -> alley consolation: taste test + verdict ask 82 (rows 37-54) ->
token of appreciation (row 54) -> Charlys close (rows 56/94-95).

Retail is EXCLUSIVE single-branch. Proof: row 25 ("chose to assist me over Pulmia"),
row 54 ("may have seemed like you only helped one of us"), rows 89-90 (Charlys
reminder addresses the single chosen chef via the `$E8(1)` flag), wiki walkthrough
step 3 ("choose to help either") and journal 3 ("the requested item", singular).
The 2026-09-26 reading (asks 100/104 non-exclusive, both branches required) is
REFUTED. The two `{5,10,15}` work counters are per-potential-branch slots; only the
chosen one advances past 5.

## Actors/markers (VERIFIED: DAT markers + spawn SQL)

Charlys 1000138 (public row 305, zone 230, -511.16/42.3/27.91). Prudentia 1000168
(row 310, -507/42.3/40.25). Pulmia 1000169 (row 311, -509.42/42.3/42.9).
Markers 01/03/05 sit DAT-exact on Prudentia's X/Z; 02/04/06 on Pulmia's X/Z (one
marker per state, position by branch). Markers 07/08 share the alley X/Z
(-495.09, 30.64) behind the restaurant: 07 with generic layout 4000257, 08 with
Prudentia's display id 1100450 (the consolation spot). 09-20 are the shared dummy
filler. No new spawn rows needed; next-free spawn id is 3376 (GLD306 owns 3371-3375).

## Choice mechanic (VERIFIED: DAT asks + flag)

Asks 100/104 take Yes/No per chef with recipe handoffs (103/107) and per-branch
reminders (109 crust / 111 pate). The `$E8(1)` branch flag selects the chosen chef
in Charlys's reminder (rows 89-90). Decline lines exist for both chefs (115/116).
The alley verdict ask 82 offers Presentation/Aroma/Flavor/Don't-know (83-86) with
matching answers (46/47/48/49).

## Synthesis (VERIFIED: SQL recipes 5386/5387 + wiki ingredient lists)

Recipe 5386: Piping Hot Pie Crust 11000069 <- Sunset Wheat Flour + Cinnamon +
Salted Butter + Table Salt + Mineral Water. Recipe 5387: Aromatic Pate 11000070 <-
Chicken Egg + Aldgoat Milk + Tiger Cod + Cieldalaes Spinach + Garlean Garlic. Both
job 'H' (culinarian), level 20, zero-crystal 'CC' shape, no facility; material sets
match the wiki lists item-for-item. Item 11000031 (Seaspray Quiche) is the
thirty/forty-order flavor dish (rows 22/34), not an objective. Credit is
snapshot-diff on the dish at the delivery talk (no engine synth callback; Alc200
precedent). Requested syntheses grant no SP (engine-owned).

## Instances (VERIFIED retail leg, INFERRED collapse)

Retail warps to an instance after the delivery (wiki steps 5-6: exit main door, left
down the ramp, cutscene near Prudentia) matching the recovered afterWarp on
processEvent030; directors recovered empty and no private-area owner exists, so the
implementation runs everything in public. No chocobo callback, actor, or EN-text
mention anywhere in this quest.

## Rewards/sync/lockouts (VERIFIED: SQL + wiki)

Central gil 15000 + Culinarians' Guild Marks 1000120x1750; Lua EXP 1760
(post-1.20 Lv.20 maximum). No tool grant: Iron Frypan 6080011 is the era-conflicted
retail tool (wiki category "formerly rewarded"; CUL-class tool row verified) and is
NOT granted per Alc200/Gld200 precedent; the late-archive Linkpearl id is
unrecovered. One-time quest, no chain prereq (Cul300 requires 110440). No level
sync, no lockouts, no timeout.

## Implementation deviations (1-3 FIXED 2026-09-27 by the exclusive rewrite)

1. FIXED: `cul200.lua` implements the exclusive single branch (choice
   asks 100/104, $E8(1) choice slot, unchosen chef never advances).
2. FIXED: alley consolation leg implemented (rear-exit push trigger at
   markers 07/08, 030 scene, verdict ask 82, narrative token with no
   invented item grant).
3. FIXED: markers are choice-scoped (pre-choice 01+02; chosen branch
   only; ready 07+08).
4. Completion owner still unrecovered in retail terms (Prudentia token
   row 54 vs Charlys close rows 56/94-95); push-completion retained as
   the Prudentia-beat completion. `validate_cul200_route.py` locks the
   exclusive contract.

## Edge handling (implemented)

Class Culinarian + Lv.20 gate on offer and every talk; nil-accept
offer; snapshot baselines at accept (pre-cooked dishes do not
credit); choice asks with decline-retry and unmapped-ask fallback
(never softlocks); consume-verified delivery; $E8(1)-bound Charlys
reminder naming the chosen chef; verdict ask with nil-safe default;
one-time save migration from both-branches counters; `onFinish`
consume-all (NQ+HQ, multi-copy) on complete AND abandon;
abandon/re-accept restarts cleanly; logout/DC safe (persisted data).

## Open gaps

Per-scene state wiring (no scenario decomp); alley trigger NPC/spawn ownership;
completion-owner binding; sub-talk owner wiring (rows 009-013, 087-099, 112-126);
live GM pass owed.
