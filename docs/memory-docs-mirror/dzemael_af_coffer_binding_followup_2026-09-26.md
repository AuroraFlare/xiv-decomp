# Darkhold AF coffer binding follow-up, 2026-09-26

This supplements [the eligibility review](dzemael_af_coffer_eligibility_2026-09-19.md).
It adds period primary testimony for the White Mage item and checks the exact
native destination and acquisition arguments. It does not recover a physical
coffer actor binding. No quests, loot, SQL, placement or runtime behavior changed.

## New item/destination corroboration

Holy_Dragoon's [Guide: White Mage Job Quests](https://forum.square-enix.com/ffxiv/threads/39485),
posted March 12, 2012 at 15:46 and last edited that day at 22:44, explicitly
associates **Healer's Culottes** with Darkhold cell **X6 Y5**. Its directions
place the item in the left Drake room reached by activating three circles after
defeating the Ogre. This is period player testimony published on the official
forum, not an official server implementation specification or an observed client
test in this project. The guide was successfully read on September 26, 2026.
Its unrelated quest-level statement conflicts with the native level-45 row and
is not adopted.

The local item-name join is exact: `Data/sql/gamedata_items.sql:3670` assigns
Healer's Culottes to **8051406**. The guide supports that item's Darkhold
destination directly, without assigning items by their order in an armor list.
It supplies no item ID, actor class, physical chest count, unique ID, height,
facing, personal-claim rules or ordinary-item fallback.

Temple Gloves **8071402** remains the previous secondary-source lead for Monk;
this pass found no additional primary acquisition footage or native item-selection
argument tying that item specifically to the Darkhold objective. The secondary
lead and conflicting later summaries must not be upgraded by analogy with WHM.

## Exact native markers and call boundary

The two records in `docs/Dat Mining/quest_marker.csv` are identical apart from
their marker IDs and corresponding resource identifiers:

| Quest | Marker | CSV line | Recorded X/Z | Region/area | Display / type |
| --- | --- | --- | --- | --- | --- |
| `111225` / `Mnk0j5` | `11221401` | 7264 | `-74.510002 / 392.070007` | `102 / 201` | `4000257` / `MapMarkerQuestArea` |
| `111245` / `Whm0j5` | `11222401` | 7324 | `-74.510002 / 392.070007` | `102 / 201` | `4000257` / `MapMarkerQuestArea` |

Both use `common/mapMarker.le.spk`, `m00029`, and `Visible`. The native journal
and the earlier [quest review](job_war_mnk_whm_decomp_2026-09-07.md) identify the
Darkhold destination. Equality of these marker records establishes a shared
quest destination; it does not establish a shared physical actor. Display
`4000257` is the localized `???` name, not an actor-class ID. These records
have no terrain Y, facing, spawn owner or actor-instance binding. No marker was
converted to a placement or compared to a nearby ordinary coffer in this pass.

The raw native calls remain caller-driven:

| Method | Exact calls in recorded order |
| --- | --- |
| `Mnk0j5.processEvent_getAF_info` | `eventOwner:_runCharaScheduler(67108910)` at PC 2 / `0xB02`; `quest:showGetJobItemWidget(player,arg4,0)` at PC 7 / `0xB16` |
| `Whm0j5.processEvent_getAF_info` | long quest text `25` at PC 4 / `0xD40`; wait `8` at PC 7 / `0xD4C`; the same event-owner scheduler at PC 10 / `0xD58`; `showGetJobItemWidget(player,arg4,0)` at PC 15 / `0xD6C` |

The source exports are `outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/`
`mnk0j5.calls.md`, `mnk0j5.bytecode.txt`, `whm0j5.calls.md`, and
`whm0j5.bytecode.txt`. Neither method contains a numeric item selection, marker
comparison, actor-class selection, grant, acquisition flag or quest predicate.
`arg4` is supplied by the missing server dispatch. Both methods have four formal
parameters, including quest, player and event owner.

The scheduler is `0x0400002E`, with category 4, packed middle field 0, low field
46 under the independently decoded format in
[the animation review](dungeon_actor_animation_decomp_2026-07-19.md).
It must not be reinterpreted as base bank 46 or as an encoded chest actor ID.
Other AF acquisition methods reuse the same scheduler. Generic native
`GimmickTreasureBox`/`TreasureBoxBaseClass` shells and the actor-class table do not
provide the missing MNK/WHM quest-to-physical-object join in the inspected corpus.

Pinned SHA-256 values read during this review:

- `tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/mnk/mnk0j5.luac`:
  `eecd2a9a3a7cc1371db345285428573743918a4018259704b677423cd6a14347`
- `tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/whm/whm0j5.luac`:
  `0645eb178aa78833c4a1b30561c6410ce1c6118d55dd56697f330616b78b4db7`
- `docs/Dat Mining/quest_marker.csv`:
  `f001a82126c9c50d0a5ede58717986ba7dbc7aa1d98c9a8ba5f445031b5e4cc8`

## Executable gap and next evidence

`Data/scripts/quests/job_quest_template.lua` still has no executable
`interactions.objectives` mappings for `Mnk0j5` or `Whm0j5`. Its `onPush`
handler resolves objectives by `npc:GetActorClassId()`; a marker or item alone
cannot supply that key safely. Both quest availability entries remain disabled.
The missing AF route is therefore confirmed, but attaching it to an ordinary
Darkhold pool or the separate Enchiridion coffer would invent the binding.

The narrow next evidence target is an original AF interaction/spawn capture or
retail server binding that connects the Darkhold `???` event owner to its actor
class/unique identity and the server-supplied item argument. Targeted footage
should show the Drake room, selected physical object and acquisition result in
one uninterrupted sequence; it can establish object count, appearance and the
Monk item, but cannot on its own recover the numeric actor class. The exact
native scheduler's low-field dispatch is a separate presentation research lead,
not proof of ownership. Any later authored physical reconstruction must be
explicitly labeled, use the shared coordinate workflow, and preserve the
ordinary/relic coffer mechanisms. This evidence does not justify enabling the
unfinished quests or inventing their ordinary fallback.
