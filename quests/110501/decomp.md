# 110501 The Beast of the Barrel (Fsh300, Lv.30 Fisher)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/fsh/fsh300.lua`
(303 lines, full read) + DAT `fsh300.csv` (150 rows) + DAT `quest_marker.csv` 11050101-20 +
DAT journals `xtx_journalxtxSea.csv` 79-90 via `xtx_quest.csv` 110501 +
SQL `gamedata_quests.sql`/`gamedata_quest_rewards.sql`/`gamedata_items.sql`/`server_fishing.sql` rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/The_Beast_of_the_Barrel),
[Fisher Quests (version 1.0)](https://finalfantasy.fandom.com/wiki/Fisher_Quests_(version_1.0)),
[Garlemald-Server #112](https://github.com/swstegall/garlemald-server/issues/112) route summary).
Video: targeted searches surfaced no 1.0 Fsh300 footage; no claims taken from video.

## Sequence flow (VERIFIED: scenario + DAT journals + walkthrough)

ACCEPT N'nmulika 1000153 (`processEventNnmulikaStart`, `showQuestInfomation` gate) ->
0 Sisipu feed handoff {11050101} `010`/fsh30010, grants Barrel Feed 11000025 ->
5 Rerenasu ferry-out {11050102}: `020`/fsh30020 then boat ask `010_1001` (rows 105-106 "Ride with
Rerenasu to the Barrel?", result-1 gate) -> native same-zone travel to Barrel trigger A ->
10 Barrel feed push {11050103,11050104}: `025`/fsh30025 + `030`/fsh30030, consumes feed, grants
Wawalago Message 11000133 (the mustachioed-Lalafell appearance plays inside the scenes) ->
15 Rorojaru trade {11050105} `040`/fsh30040: consumes message, grants Star-Spangled Subligar
8050521 (retained, legs slot 12) -> cross-zone travel to Rerenasu ->
20 equip + return (journal 84 VERIFIES the reading: "slip on the subligar, sprint back to the
Barrel, and speak once more to the mustachioed man"): subligar equipped-gate + Rerenasu boat leg
-> 22 four emote rounds at the Barrel {11050103,11050104,11050112,11050113}, one marker each ->
25 Barrel catch push (any of the three DAT-named species, journal 86 "catch a single fish") ->
30/35 Sisipu talks {11050109}/{11050110} `050`/fsh30050 + `060`/fsh30060 ->
40 Sisipu Echo {11050108}: `070` ask (51030 mode 2, client past-area entry) ->
45 N'nmulika report {11050111} `075` (rows 56/103/57/58) + EXP.

Journal 82 duplicates 81 and is skipped by the retail switch (81 then 83); the decomp state order
(trade 15 before rounds 22) overrides the walkthrough's looser dance-first ordering (documented
deviation). Journal 90 confirms the Echo reveal (Wawalago provokes initiates; "a puller who cannot
dance is not a proper puller").

## Actors/markers (VERIFIED: DAT markers + spawn SQL)

N'nmulika 1000153 (row 325, z230). Sisipu 1000155 (row 3329, z230 (-620.82,4.25,354.55),
DAT-exact for the feed marker 11050101; 4.7 yalms from Echo marker 11050108; ~23 yalms from the
mid/late talk markers 11050109/10 — she moves during the quest and the server has no phasing, so
one row serves all Sisipu spots). Rerenasu 1000201 (row 348, z230, ~1.2 yalms off marker 11050102).
Rorojaru 1000374 (row 43, z175 (28.93,192,109.69), DAT-exact vs marker 11050105). Barrel triggers
(rows 3330-3333, generic actor 1000174, X/Z DAT-exact per markers 11050103/04/12/13, Y 1.0 at the
dock waterline). Echo marker 11050108 carries display 1400010 against the Sisipu actor (display/
actor pattern as documented). Markers 11050106/07 are replay placeholders, 11050114-20 rejected
filler. WawalagoGuild 1000154 is display-only with no route state (unbound).

## Ferry legs (VERIFIED asks + native travel; one text deviation)

Both asks gate on result 1 and hand to the native travel pipeline (which owns event closure).
Outbound lands at Barrel trigger A; the Rorojaru trade lands at Rerenasu's row 348. DEVIATION:
the bespoke state-20 leg reuses ask `010_1002`, whose text is "Return to Fisherman's Bottom?"
(row 116) — backwards for a Barrel-bound leg. No recovered ask covers the state-20 leg; either
reusing `010_1001` ("Ride with Rerenasu to the Barrel?") or keeping the current binding is
authored. Likewise the post-catch return is an auto-travel to Sisipu in the bespoke script, while
the walkthrough ("Return to the Fishermen's Guild via Rerenasu") and the template route [10]
place a Rerenasu return ask after the catch — retail return-ferry binding unrecovered.

## Emote rounds (VERIFIED binding shape; per-emote correctness open)

The C# unique-id binding publishes sixteen `emoteDefault` slots in four reviewed groups
(bow/welcome/salute/kneel, beckon/wave/clap/confused, upset/cry/angry/furious,
chuckle/laugh/joy/congratulate); Lua accepts only the current four-slot round (flags 0-3) and
rejects out-of-round emotes. GAP: the walkthrough says each emote gets a positive/negative
response clue, i.e. retail validates per-emote correctness — the server accepts any emote per
round (authored; exact bindings await client trigger capture).

## Catch (VERIFIED species + pools; zone narrowing documented)

The three DAT-named Barrel species (dialogue row 61: "tiger cod ... coral butterflies ...
saber sardines") are Saber Sardine 3011201 (pool 10071 Bald Knoll z129), Tiger Cod 3011205
(pools 10051/10061/10511/30081), Coral Butterfly 3011208 (pool 10061 Skull Valley z129) —
all SQL-verified. (The bespoke script's `BARREL_FISH` comments misname them as Merlthor Goby /
Harbor Herring / Finger Shrimp; item IDs are correct — comment-only defect, fixed 2026-09-27.)
The Barrel has no pool of its own, so the named species swim at their normal pools; the bespoke
fresh-catch rule (persisted per-species baseline + C# fanout, public zone 230 only) effectively
narrows the in-zone catch to Tiger Cod (pool 10511 Limsa Lominsa covers z230; the other two
species swim only in z129 pools). "Species unrestricted" narrows to the three evidenced names.

## Instances (INFERRED collapse, Alc200/Gld200 precedent)

Scenes 020/025/040/050 use `startFadeInCutSceneAfterWarp`; no private-area owner or quest
director is recovered, so all legs run in public with the scenes played as plain delegate
scenes. No chocobo callback or actor anywhere in this quest. Mobs: none (non-combat).

## Rewards/sync/lockouts (VERIFIED: SQL + script)

Script EXP 3420 (post-1.20 Lv.30 maximum; exact era scaling unresolved). Central: 30000 gil +
3000 Fishermen's Guild marks (1000123). The subligar is a retained mid-route grant, not an end
reward. No level sync, no lockouts, no timeout; one-time quest with chain prereq 110500
(enforced in-script + SQL).

## Edge handling

Fisher-30 + Fsh200 gate on offer and every callback; verified feed/message/subligar grants
(inv-full hold-and-retry; subligar once-flag keeps retries from doubling); message consumed at
Rorojaru; lost subligar re-issued at state 20; `onStart` clears emote/catch/grant flags so
re-accepts never inherit; `onFinish` removes leftover feed/message (subligar retained);
logout/DC safe (persisted quest data).

## Open gaps

Sub-talk owners unwired (005, 010_2, 10_3..10_10, 020_2, 025_2..025_7, 028/028_3..028_9,
029/029_2, 030_2, 050_2..050_9, 070_2, 010_1000 — incl. the 028/029 return/dance talks, owners
unrecovered); state-20 ask binding; post-catch return ferry; per-emote correctness; Barrel
trigger reachability (no navmesh proof at rows 3330-3333); dinghy animation owner; live GM pass
owed.
