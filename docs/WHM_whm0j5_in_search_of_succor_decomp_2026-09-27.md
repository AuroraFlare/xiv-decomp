# 111245 Whm0j5 In Search of Succor (Lv45) deep decomp (2026-09-27)

## Chain position

Offer: Raya-O-Senna (1001570). Prereq 111244. Requires WHM 45 + THM 15.
Rewards: 5340 EXP + four Healer's AF pieces (dialogue/delivery, no battle).
Unlocks 111246.

## Recovered flow

`processEvent_RAYA_offer`: accept (14,24,38..43) / decline 13. Accepted text:
four enchanted chests only a worthy white mage can perceive. `RAYA_O_follow`
has a literal odd order (scheduler + texts 17,44,21 BEFORE
`startCliantTalkTurn`, then 22 + close): preserved, not "fixed".
`processEvent_getAF_info(arg4)`: long 25, event-owner scheduler 67108910,
shows (player,arg4,0). NO item grant, NO four-piece test in the client.
Journal Fst 428: Dzemael Darkhold, Zahar'ak, Turning Leaf, Tiger Helm Island.
Fst 466 + marker 11222405 REQUIRE a return to Raya after all four (unlike
Monk's completion-in-place). `processEvent_RAYA_O_clear`: 47..52, world 53,
close; shows no further item/ability. No NQ scenes or fades.

## Markers (quest_marker.csv, verified)

- 11222401: (-74.51,392.07) m00029 102/201 MapMarkerQuestArea = Dzemael Darkhold (231).
- 11222402: (2179.07,1022.85) m00029 104/405 = Zahar'ak, Eastern Thanalan (171).
- 11222403: (-1264.55,201.69) m00029 103/304 = Turning Leaf, South Shroud (154).
- 11222404: (1613.23,-142.48) m00029 101/103 = Tiger Helm Island, La Noscea (128 area).
- 11222405: Raya's cave return.

## Items (verified in gamedata_items.sql)

8051406 Healer's Culottes, 8071406 Healer's Gloves, 8081806 Healer's Boots,
8013506 Healer's Circlet. Marker-to-item bindings are UNRECOVERED and this pack
does not invent them: each coffer grants the first still-unowned piece of the
set (order-free), so all four visits always complete the set with no false
binding. (Template precedent explicitly forbids list-order bindings.)

## Coffers (adapter policy, EXPLICIT)

No quest-owned coffer actor/transform is recovered. Adapter: 4 public event
actors of class 1200161 (`/Chara/Npc/Object/GuildleveBonusTreasureBox`, the
verified treasure-box class from `OpenWorldCofferManager`), uniqueIds
`whm0j5_coffer_darkhold/zaharaak/turningleaf/tigerhelm`, at the marker X/Z with
Y/rotation UNREVIEWED (no spawn SQL emitted until in-game capture review, per
`gc_opening_npcs.json` policy; proposals in the WHM registry). All four share
one actor class, so the template's class-only push matcher cannot tell them
apart: the bespoke script matches `npc:GetUniqueId()` (pgl200 coin precedent).

## Implementation: bespoke `whm0j5.lua` (no director; no battle; no chocobo surface)

SEQ: ACCEPT Raya -> 6 four coffer pushes (flags 0-3 + counter 0, unordered,
idempotent: owned piece / set flag re-pushes are safe no-ops; inventory-full
grant failures persist nothing and stay retryable) -> 10 return to Raya
(`processEvent_RAYA_O_clear`) -> complete. Journal markers suppress visited
coffers. Abandon/reacquire clears flags/counter in `onStart`. Every handler
re-checks eligibility (WHM 45, THM 15, prereq 111244) and ends the event on all
paths. Coffer visibility caveat: actors are public (per-spawn visibility does
not exist); the push is fail-closed for non-quest players.

## Sources

- `job_war_mnk_whm_decomp_2026-09-27.md` Whm0j5 section
- quest_marker.csv 11222401-5; gamedata_items.sql AF rows; actor_class 1200161
- `OpenWorldCofferManager.cs` (coffer actor model); pgl200 coin-push precedent
