# 110500 To Fight a Fishback (Fsh200, Lv.20 Fisher)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/fsh/fsh200.lua`
(127 lines, full read) + DAT `fsh200.csv` (56 rows) + DAT `quest_marker.csv` 11050001-20 +
DAT journals `xtx_journalxtxSea.csv` 46/47/122 via `xtx_quest.csv` 110500 +
SQL `gamedata_quests.sql`/`gamedata_quest_rewards.sql`/`gamedata_items.sql`/`server_fishing.sql` rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/To_Fight_a_Fishback),
[Fisher Quests (version 1.0)](https://finalfantasy.fandom.com/wiki/Fisher_Quests_(version_1.0))).
Video: targeted searches surfaced no 1.0 Fsh200 footage; no claims taken from video.

## Sequence flow (VERIFIED: scenario + DAT journals + walkthrough)

ACCEPT N'nmulika 1000153 (`processEventNnmulikaStart`, ask 3 mode 2 + `showQuestInfomation` gate) ->
0 Maisie briefing {11050001} `010`/fsh20010 ->
5 catch five Pixie Remora 11000127 at the five DAT waters {11050004-08} ->
7 Maisie delivery/return {11050003} `020`/fsh20020 (full-pack thanks row 27, else partial
reminder rows 57-58 keyed on remaining count `$E8(1)`) -> reward replay of `020` with the
Yew Fishing Rod grant.

Retail numbering is 0/5/7 per the `xtx_quest.csv` journal switch (journals 46/47/122). The live
bespoke script compresses this to 0/1 with a ready-check inside state 1 (documented deviation;
the driver template row keeps the two-step briefing/delivery shape with a counter-0 gate).

Journal 46: assist Maisie in the Bottom. Journal 47: catch Pixie Remora off the lowland La Noscea
cliffs for the Sahagin-lure effort. Journal 122: "Return them to Maisie ... before they go bad."

## Actors/markers (VERIFIED: DAT markers + spawn SQL + coordinate tool)

N'nmulika 1000153 (public row 325, zone 230). Maisie 1000173 (public row 401, zone 230
(-603.64,6.25,355.46), X/Z DAT-exact vs markers 11050001/03). Marker 11050002 is a guild
placeholder (4000257 at -431/187, unbound); 11050009-20 are rejected filler.

Waters markers -> walkthrough squares (VERIFIED with `map_coordinates.py locate`):
11050004 (-227.94,-12.06) = (23.00,29.96) -> (23,29) z128;
11050005 (-41.39,225.90) = (24.87,32.34) -> (24,32) z128;
11050006 (-1134.19,-694.57) = (13.94,23.13) -> (13,23) z129;
11050007 (-1043.70,-554.61) = (14.85,24.53) -> (14,24) z129;
11050008 (1298.90,-886.29) = (38.27,21.22) -> (38,21) z130.
All five match the GamerEscape walkthrough exactly. Retail pools bind by nearest anchor:
Bearded Rock 10051 (z128), Skull Valley 10061 (z129), Bloodshore 10081 (z130).

## Catch credit (VERIFIED: script + SQL + walkthrough)

Snapshot-diff: owned Pixie Remora baselined at the briefing talk; credit = max(0, owned -
baseline), so pre-briefing fish never count. The optional C# `onFishCatch` fanout adds only a
live fanfare. Retail credited catches silently (no chat-log line; minigame info bar + journal
only) — the server routes through normal inventory with chat visibility instead (documented
deviation). NQ + HQ both count/consume in the bespoke script (etc-delivery convention); the
driver template form counts NQ only. Saltwater bait required by the walkthrough (Floating Minnow
3940106 / Lugworm 3940002, both SQL-verified Fisher bait); the engine has no required-bait gate,
so this is unmodeled beyond the global neutral bait rules.

## Instances (VERIFIED: no warp surface)

No `AfterWarp` scene and no private-area/director surface anywhere in this quest; the guild legs
run public as recovered. No chocobo callback or actor anywhere in this quest.

## Rewards/sync/lockouts (VERIFIED: SQL + script)

Script: Yew Fishing Rod 7030011 (grant-before-consume with once-flag retry guard) + 1760 EXP
(post-1.20 Lv.20 maximum). Central: 20000 gil + 2000 Fishermen's Guild marks (1000123). No level
sync, no lockouts, no timeout; one-time quest. Chain: SQL prerequisite 0; the walkthrough's
"must have completed Fade to White" (110013, Man200 Lv.18, SQL-verified title) is documented in
the template and unenforced (no driver prerequisite support), and Fsh300 requires 110500.

## Edge handling

Fisher-20 gate on offer and every talk; delivery needs net gain >= 5 AND owned >= 5; rod granted
before the five-fish consumption so a full inventory never eats the delivery; `onFinish` keeps
owned fish on abandon and a re-accept re-snapshots; logout/DC safe (persisted quest data).
Non-combat: no sync, timeout, re-enter, or chocobo handling applies.

## Open gaps

Client sub-talk owners unwired (005_2, 010_2..010_12: guild flavor + bait/rod advice + Astalicia
pirates + puller-lore rows 35-56); retail 0/5/7 numbering vs bespoke 0/1; silent-catch
presentation; bait gate; Linkpearl grant (unrecovered id, skipped per Alc200/Lnc200); live GM
pass owed.
