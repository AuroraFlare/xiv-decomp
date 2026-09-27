# Etc side quest routes (1.17-1.18 batch) - 2026-09-26

Three subagents audited 24 patch_1_17/1_17a/1_18 side quests plus a
read-only mechanical sweep of all 520 quest scripts. Nine quests are now
Implemented; the rest stay Partial with documented reasons. A MoonSharp
probe corrected the "invalid lowercase" framing from the earlier world
pass (see below).

## Promoted (9)

Dialogue/delivery with full actor/spawn/marker/decomp/reward audits:
110641 Food for Thought, 110642 Seashells by the Seashore, 110653 The
Tug of the Whorl, 110674 Seeing the Seers, 110695 A Call to Arms.
Open-world kill routes with verified mob types, spawns, and ground:
110643 Fishing for Answers (5 giant_crab types, 48 spawns, 12 grounded
near marker; water-cluster spawns off-mesh noted), 110663 Embarrassing
Excerpts (opo-opo 1206, 29 spawns, exact ground), 110706 Counting Sheep
(dreadwolf 39361, 13 spawns, exact ground), 110707 A Hypocritical Oath
(antelope_doe 1205, 37 spawns, 1 floating noted).

Five of the nine were promoted in-tree during the pass; this change adds
110642/110663/110706/110707 to `IMPLEMENTED_SIDE_WORLD_IDS`.

## Fixes applied

- Reward-screen EXP aligned to SQL in 11 scripts (etc1g9/etc2g0/etc2g1/
  etc2l0/etc2i1/etc2u1/etc2g2/etc2i0/etc2u2/etc3u9/etc5l3).
- Duplicate manual completion grants removed where SQL rows exist:
  AddItem/AddExp in 13 scripts, AddGil in 8 (etc1u9/etc2g4/etc3g1/
  etc3l1/etc3l2/etc3u1 + drive-by etc3g2/etc3u2), companion 25228/25229
  messages removed (the engine announces via GrantQuestRewards/AddGil;
  gold-standard etc1l1 keeps completion bare), 24 orphaned REWARD_*
  consts removed.
- All 12 etc0 internal push quests had the same double-grant
  (manual 3020002x5 + SQL row); GiveReward removed, CompleteQuest kept.
- Special quests: completion AddExp removed in etc200/etc201/etc304,
  duplicate relic AddItem + message removed in etc106.
- etc2i0 gained the sibling-standard getJournalInformation kill counter.
- Cleanups: etc1l8 debug prints, etc2g1 header Code (Etc1g1 to Etc2g1).

## Deliberately not changed

- etc1g0/etc1g1 (enabled), etc1u8 ring, etc102/etc104/etc200/etc201 key
  items, etc101/etc103 manual rewards: mid-quest mechanics or sole
  reward source (no SQL rows). Verified by context, left intact.
- Man* manual grants: main story has no SQL reward rows; grants are the
  only rewards. Untouched.
- Class-quest script hits: user's active work area. Untouched.
- Lowercase `quest:getSequence()`: a MoonSharp 2.0.0 probe
  (C:/tmp/moonprobe, stock options like the engine) proved member
  lookup is case-insensitive and dot-calls work — all 121 sweep hits
  are non-bugs. Case normalizations stand as hygiene only; the world
  doc's "invalid/unplayable" wording was corrected the same day.

## Not promoted (stay Partial)

- Instance-tagged per fight-settings CSV with no battle backing:
  110644/110667/110668/110682/110683/110684/110685/110726/110735/110744/
  110745. Local dialogue/push routes are complete and their double
  grants were still fixed, but no side quest with an instance mechanic
  is Implemented without content backing (GC/class precedent).
- Missing mob/actor data: 110664/110665 (no mob type for 2102708),
  110666 (no mob type for 2100512), 110686 (no mob type for 2106541),
  110684 (rabid_dodo type exists, 0 spawns — spawn authoring is the
  cheapest unblock).
- Marker numbering is not ownership: the 110700xx/110800xx/110900xx pins
  used by 110653/110674/110695 and 111019xx by 110706 were verified by
  display ID + coordinates to point at exactly those quests' NPCs
  (18/19 within 3u; Kinnison pin 43u off, same NPC, DAT-authentic).

## Validation

- New `python tools/validate_etc_side_quest_routes.py`: failed before
  promotion (`quest 110642 is not labeled Implemented`), PASS (9) now.
- `python tools/validate_wld_world_quest_routes.py`: PASS (12).
- `python tools/validate_quest_availability.py`: valid, 165 Implemented
  (+4 this change), job-quest boundary contract valid.
