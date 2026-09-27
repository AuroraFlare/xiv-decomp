# 110502 Polishing the Mast (Fsh306, Lv.36 Fisher)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/fsh/fsh306.lua`
(234 lines, full read) + DAT `fsh306.csv` (102 rows) + DAT `quest_marker.csv` 11050201-20 +
DAT journals `xtx_journalxtxSea.csv` 91-96 via `xtx_quest.csv` 110502 +
SQL `gamedata_quests.sql`/`gamedata_quest_rewards.sql`/`gamedata_items.sql`/`server_fishing.sql` rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/Polishing_the_Mast),
[Fisher Quests (version 1.0)](https://finalfantasy.fandom.com/wiki/Fisher_Quests_(version_1.0))).
Video: targeted searches surfaced no 1.0 Fsh306 footage; no claims taken from video.

## Sequence flow (VERIFIED: scenario + DAT journals + walkthrough)

ACCEPT N'nmulika 1000153 (`processEventNnmulikaStart`, `showQuestInfomation` gate) ->
0 stairs push in the rear of the guild {11050201} `010`/fsh30610 (afterWarp; retail enters an
instance) ->
5 N'nmulika assignment {11050202} `015` (rows 25-27 name the assigned fish via `$E8(1)` switch) ->
10..19 timed sale leg (journal 93: "Bring one back before Fisherman's Bottom puts a moratorium
on purchases!"): sale talk plays `016` (row 28) on a full pack or `015_3` (row 101: names the
fish + "within N bells' time" via `$E8(2)`) on a partial one, then the `020`/fsh30620 close;
expired assignments play `015_2` (row 102 "Time has expired!") and return to 5 for reassignment ->
20 extension beat (journal 94: "Find Wawalago and see if you, too, cannot convince him to give
you more time"): `030`/fsh30630 cutscene (no recovered say rows) ->
25 three Echo viewings: Sisipu {11050204} `040`, Sisipu {11050205} `050`, Maisie {11050206} `060`
(each an ask-51030 past-area entry with a post-scene say: rows 46/52/58; the walkthrough's "use
the Echo multiple times until it no longer allows you") ->
28 N'nmulika report {11050207} `070` (rows 59-60: "Your call for an extension went limp" +
reward speech) + EXP.

Journal 96 ("A peek into the pullers' past reveals...well, something") is the state-28 text.

Retail timed range is 10..19 per the `xtx_quest.csv` journal switch (`$E0`/`$E3` comparison pair
with explicit 10/20 bounds); the bespoke script maps 10..14 (selector+10) as an authored
compression (documented gap).

## Timed assignment (VERIFIED fish set/order; duration authored)

The five sale fish and their `$E8(1)` switch order are DAT-exact (rows 27/101): Rothlyt Oyster
3011213, Nautilus 3011203, Bianaq Bream 3011209, Ash Tuna 3011217, Hammerhead Shark 3011225 —
all SQL-verified ordinary tradeables already swimming with recovered depths: Skull Valley 10061
(z129: oyster, nautilus), Bloodshore 10081 (z130: nautilus, bream, oyster), Cedarwood 10151
(z128: bream, tuna, shark), Horizon's Edge 30081 (z172: shark). The server persists
selector/baseline/deadline in QuestData counters, so reloads cannot reroll or extend an active
assignment; a pre-owned fish never satisfies the sale (baseline captured at assignment).
AUTHORED: the 3-bell length (retail keeps the count in `$E8(2)` but its value is unresolved)
and the 1,000-gil flat payout per the walkthrough ("bring it back to the guild for a reward of
1000 gil") vs the fishes' vendor prices (86/130/106/154/158 per `gamedata_items.sql`).
One sale per assignment; timeout clears selector/deadline and returns to 5.

## Actors/markers (VERIFIED: DAT markers + spawn SQL)

N'nmulika 1000153 (row 325, z230, DAT-exact vs markers 11050202/07). Stairs trigger (row 3328,
generic actor 1000174, DAT-exact vs marker 11050201 at (-601.94,6.25,359.88)). Sisipu 1000155
(row 3329, z230 (-620.82,4.25,354.55), DAT-exact for BOTH Echo markers 11050204/05). Maisie
1000173 (row 401, X/Z-exact vs Echo marker 11050206). Marker 11050203 is a replay-only
placeholder, 11050208 (Rerenasu) is explicitly do-not-bind, 11050209-20 are rejected filler.
State-20's Wawalago extension actor is unresolved (no route state, placeholder marker) and the
beat is skipped: the bespoke sale goes straight to the `030` replay (driver precedent).

## Echoes (VERIFIED: three result-gated scenes)

`040`/`050`/`060` each require ask result 1 (`FshEchoAccepted`); flags 0/1/2 track the three
viewings, completable in any order (no recovered evidence enforces 040->050->060). The three
post-scene says tie the viewings to the Fsh300 fallout (the unmentionables, the dance, the
netmaster's uses).

## Instances (INFERRED collapse, LNC/Gld200 precedent)

The walkthrough's "enter an instance" + the `010`/`020` afterWarp scenes indicate a retail guild
instance; no non-battle transition owner is recovered, so the scenes play public (same class of
deviation as LNC's public-played instance talks). No chocobo callback or actor anywhere in this
quest. Mobs: none (non-combat).

## Rewards/sync/lockouts (VERIFIED: SQL + script + walkthrough)

Script EXP 4720 (post-1.20 Lv.36 maximum; exact era scaling unresolved) + 1000-gil authored
sale payout at the timed sale. Central: 36000 gil + 3600 Fishermen's Guild marks (1000123).
Timer: the assignment deadline is the quest's only lockout (expiry -> reassignment, never a
hard fail). No level sync otherwise; one-time quest with chain prereq 110501 (enforced
in-script + SQL). Terminal quest of the Fisher line.

## Edge handling

Fisher-36 + Fsh300 gate on offer and every callback; stairs push is unique-id-scoped
(`fsh306_stairs_trigger`) so the same-class Fsh300 Barrel rows cannot cross-fire; atomic sale
(consume exactly one assigned fish, then pay); deadline checked before the gain check;
`onStart` clears assignment/Echo state so re-accepts never inherit; no quest items to clean
(the assigned fish is an ordinary tradeable and stays); logout/DC safe.

## Open gaps

Client sub-talk owners unwired (005_2..005_6, 010_2..010_10, 020_2..020_10, 050_2, 060_2); the
retail `020`/fsh30620 sale-close scene is unwired in the bespoke script (plays 016 then 030);
retail 10..19 timed mapping vs bespoke 10..14; retail bell duration (`$E8(2)` value); state-20
Wawalago extension actor/scene; per-Echo journal-data pins; live GM pass owed.
