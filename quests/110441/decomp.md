# 110441 Mystery of the Gastronome Gone Home (Cul300, Lv.30 Culinarian)

VERIFIED: DAT `cul300.csv` (100 lines, row IDs 1-123, full EN read) + DAT
`quest_marker.csv` 11044101-07 (+ filler 08-20) + DAT `xtx_negotiationTable.csv`
title 3001 + SQL `gamedata_quests.sql` / `gamedata_quest_rewards.sql` /
`gamedata_actor_class.sql` / `gamedata_actor_appearance.sql` rows +
`class_quest_template.lua` recovered Cul300 record + walkthroughs
([GamerEscape](https://ffxiv.gamerescape.com/wiki/Mystery_of_the_Gastronome_Gone_Home)
full journal + 10-step walkthrough,
[Mirke-transcript issue](https://github.com/swstegall/garlemald-server/issues/103)).
No client scenario decomp exists for any CUL quest
(`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/` is absent), so
scene/state bindings are the template's recovered spine in numeric order, not
watched decomp. Video: "Final Fantasy XIV 1.0 - Mystery of the Gastronome
Gone Home (Rank 30 Culinarian Quest)"
([YouTube](https://www.youtube.com/watch?v=HOTtLtLrw4c), title-verified,
sequence reference only).

## Sequence flow (VERIFIED: DAT dialogue + wiki journal/walkthrough, beat-for-beat)

0 Charlys offer (ask 70; rows 1-7) -> 5 Prudentia in the kitchens (rows 16-20:
lost Ul'dahn merchant) -> 10 Charlys (rows 21-24: directed to Sunsilk Tapestries)
-> 15 Ul'dah: Deaustie (rows 25-27) then Thickset talk + mandatory Parley
(rows 28-30 stonewall; scene 016; title-3001 board) -> 20 Thickset cutscene
(rows 34-38: the Qiqirn-stew insult revealed) -> 25 Charlys report (rows 44-47:
melting-pot speech, escalate to Lyngsath) -> 30 alley scene (rows 48-59:
Prudentia feeding Mumuroon, Chichiroon, Buburoon mushroom soup) -> 35 Charlys
report (rows 61-63) -> 40 Charlys reward (row 100). Talk/Parley only: no quest
items, no recipes, no synthesis anywhere on this route.

## Actors/markers (VERIFIED: DAT markers + actorclass + spawn SQL)

Charlys 1000138 (public row 305, zone 230). Prudentia 1000168 (row 310, zone 230).
Deaustie 1000293 (row 149, zone 209, 38.84/195.59/257.89). Chichiroon 1000217
(row 354, zone 230). Buburoon 1000219 (row 379, zone 230). Markers 01/02/05/07
sit DAT-exact on Prudentia's / Charlys's public X/Z; 03 sits DAT-exact on
Deaustie's X/Z (38.84, 257.89); 04 (64.82, 251.90) carries layout ref 4000063,
the exact shared model of the two thickset candidates; 06 (-491.08, 39.04) is
the alley scene spot. 08-20 are the shared dummy filler.
Thickset opponent: candidates 1000292/1700032 share model 4000063 with EMPTY
actor_class names and identical appearance rows; NEITHER has a spawn row, so
exactly-one-of-two identity AND placement are both unrecovered. Name variance is
unresolved at the source level: the wiki walkthrough says "Thickset Sailor", the
transcript issue says "Thickset Tailor", the journal says Ul'dahn merchant/trader.
Resolution: 1000292 staged at spawn row 3376 by documented convention (see
Enablement addendum). Mumuroon (alley cast) has no actor class row at all:
no id to spawn (stays scene-local).

## Parley (VERIFIED: engine + DAT title + DAT win/loss lines)

Server negotiation engine (`negotiation_game.lua` via command 29497, Hrv300
pattern + SetNegotiatable) + DAT title 3001 ("Mystery of the Gastronome Gone
Home" / "Do you wish to parley or concede?"). Title 3001 RESOLVES the template's
`negotiationTitleIdUnresolved` flag. Loss lines (rows 84-85) confirm free retry;
the win (rows 34-38, 86-87, 110-114) advances 15->20 behind the introduced flag.
Difficulty 3 / 12 turns / 20s are Man300 engine defaults (authored); retail tuning
is unrecovered.

## Instances (VERIFIED retail legs, unbuilt)

Retail has TWO instance legs (wiki steps 4 + 8): the Sunsilk Tapestries interior
(Deaustie -> Thickset) and the Charlys/alley return. Directors recovered empty and
no private-area owners exist, so the server runs the public-world adaptation
(Alc200 precedent): full talk route + alley push trigger `cul300_alley_trigger`
(row 3377). No chocobo callback, actor, or text mention anywhere in this quest.

## Rewards/sync/lockouts (VERIFIED: SQL)

Central gil 30000 + Culinarians' Guild Marks 1000120x3000, both autoGrant=1;
Lua EXP 3420 (post-1.20 Lv.30 maximum). No tool documented or granted
(`rewardEraUnresolved`). No level sync, no lockouts, no timeout; one-time quest
with chain prereq 110440 (Cul306 requires 110441).

## Edge handling (implemented)

Culinarian-30 + completed-110440 gate on offer and every talk; nil-accept
offer; Parley board stamped idempotently; flag-gated win advance 15->20;
losses retry; full talk route with per-state ENPC/markers; alley push
trigger uniqueId-checked; onFinish cleanup on complete AND abandon;
logout/DC safe (persisted data).

## Enablement addendum (2026-09-27; HOLD closed by documented convention)

Thickset identity resolved by convention, not proof: candidates
1000292/1700032 are byte-identical (model 4000063, identical
appearance, both EMPTY actor_class names), so the visible difference
is nil; 1000292 chosen by Ul'dah-batch proximity (sequential with
Deaustie 1000293) + public-range convention, staged at spawn row 3376
(DAT-exact X/Z, Deaustie-floor Y). Source-level name variance stands
("Thickset Sailor" vs "Thickset Tailor" vs merchant/trader). Falsifier:
any spawn/behavior row distinguishing the two candidates. Mumuroon
stays unspawned (no actor id; scene-local only, no invention).
Parley tuning stays at Man300 defaults. Live GM pass owed.
