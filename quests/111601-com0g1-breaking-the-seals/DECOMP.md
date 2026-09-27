# Quest 111601 Breaking the Seals (Com0g1) — DECOMP

Order of the Twin Adder opening quest (Gridania GC familiar quest), level 22.
Prereq: 110014 Together We Stand (Man206). Unlocks 111602.
SQL: `(111601, 'Breaking the Seals', 'Com0g1', 110014, 22)` in
`Data/sql/gamedata_quests.sql`.

## Sources inspected (full bodies read, not grep-only)

- `Data/scripts/quests/com/com0g1.lua` (quest script)
- `Data/scripts/directors/Quest/QuestDirectorGcCom0g1.lua` (SQB director wrapper)
- `Data/scripts/directors/Quest/gc_sqb_runtime.lua` (shared SQB lifecycle)
- `Data/scripts/quests/com/gc_sqb_quest.lua` (shared SQB launcher)
- `Data/scripts/content/SimpleContentGrandCompanySquadBattle.lua` (content area)
- `Data/scripts/quests/com/gc_reward_checkpoint.lua`, `gc_quest_items.lua`
- `Data/scripts/base/chara/npc/monster/Scalelizard/ScalelizardFireQuestCom0g1.lua`
- SQL rows: mob type 1358, skill list 5020, actor classes 2202206/1500314,
  spawns 2810/3227/3229, quest row 111601
- `docs/mob_map_coordinates.md` (read fully); `map_coordinates.py locate`
  runs for zones/positions below
- GamerEscape `Breaking_the_Seals` (journal + walkthrough fetched 2026-09-27):
  Fulke -> Ailith at Quarrymill -> southwest (43-48) instance vs Drake
  Familiar ("up to two players may accompany you") -> Ailith -> Fulke.
  Post-fight journal names Papalymo (client aftermath scene).

## Stages (SEQ)

```
SEQ_000 = 0   Talk to Syro Fulke (accept; journal 272; marker 11160003)
SEQ_010 = 10  Talk to Ailith in Quarrymill (journal 273; marker 11160001)
SEQ_020 = 20  Find Urianger southwest of Quarrymill (journal 274; marker 11160002)
SEQ_030 = 30  Defeat the familiar, private SQB via Urianger (journal 274; marker 11160002)
SEQ_040 = 40  Talk to Ailith, receive oath (journal 275; marker 11160001)
SEQ_050 = 50  Return to Syro Fulke, reward (journal 276; marker 11160003)
```

## NPCs / actors (all spawn rows inspected)

| NPC | Class | Zone | Position (X,Y,Z,rot) | SQL row |
| --- | --- | --- | --- | --- |
| Syro Fulke | 1500200 | 234 (Gridania) | 169.0, 0.0, -174.7, -1.5 | 2810 `serpent_fulke` |
| Ailith | 1001628 | 154 (South Shroud/Quarrymill) | 1415.915771, -14.134044, 929.07666, 1.377785 | 3229 `gc_1001628` |
| Urianger | 1500314 | 154 (SW of Quarrymill) | 1195.693359, 0.075892, 1090.483887, 1.427706 | 3227 `gc_1500314` |
| Papalymo | 1000218 | — | scene-only (COM0G110), no spawn | — |

Urianger actor class carries
`activeQuestVisibility [{"questId":111601,"sequences":[20,30]}]`.

## Guide coordinates (map_coordinates.py, Black Shroud transform)

- Urianger/fight staging (1195.693, 1090.484) -> map (42.997, 48.985),
  i.e. walkthrough square (43,48). Recorded ground node 3615 at
  (1196.0266, -0.245, 1090.532), inside selection.
- Ailith (1415.916, 929.077) -> map (45.199, 47.371), Quarrymill.
  Recorded node 3617 at (1415.5, 0.076, 929.0), 29 recorded points nearby.
- Heights above are recorded movement XYZ from
  `Data/quicknavmesh/zone_154.tsv`, not extrapolated.

## Dialogue / interaction points

- SEQ_000 Fulke `processEventStart` returns accept flag; accept ->
  `player:AcceptQuest` -> SEQ_010. Dialogue bound to
  (player, quest, quest-data, sequence) via
  `CanContinueGrandCompanyQuestDialogue`; stale continuations return
  without progress.
- SEQ_010 Ailith `processEventAilithShiren` -> SEQ_020 (same guard).
- SEQ_020/030 Urianger: `StartSequence(SEQ_030)` then
  `StartGrandCompanySquadBattle` with preEvent `processEventUrianger`,
  preScene `COM0G105`, `preEventAfterWarp=true`. If content creation
  fails, quest reverts to SEQ_020 with Urianger as retry point.
- SEQ_040 Ailith `processEventAilith` -> `EnsureGCQuestItem(11000251)`
  (Ailith's oath; full-inventory retry, no advance until owned) -> SEQ_050.
- SEQ_050 Fulke: `HasGCQuestCompletionEvidence` (oath or saved EXP
  checkpoint) -> `processEventClear` -> `CompleteGCQuestOnce(1541 EXP,
  consume oath)`. EXP pay-once flag 23; seals n/a for this quest.

## Instance layout / bounds

- Private SQB content area `gc_sqb_com0g1_<ownerId>`, script
  `SimpleContentGrandCompanySquadBattle`, native director
  `/Director/Quest/SimpleQuestBattle/QuestDirectorCom0g101`.
- Boundary: circle r=45.0 yalms centered on owner's talk position;
  `DisableReentry()` — no second zone-in, no second target/reward path.
- Timeout 1800s (30 min, matches archive). Max party 3 (owner + up to
  two helpers; journal: "up to two players may accompany you").
- Spawn: drake at owner pos + 4.0 yalms forward, owner's Y/rot.
  Helpers must be online, combat class/job, alive, same area, near
  entrance, unmounted, event-free; leader-only party pull.

## Mob roster (complete: exactly one mob)

| BNPC | Actor class | Name | Lv | HP/MP | Job | Att | Detect |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1358 | 2202206 | drake_familiar | 19/19 | derived (0/0) | 8 | 40 | type 0, range 10, hostile |

Resists: fire 0.75, ice 0.75, wind 1.25 (weak), rest 1.0. Speed 6.
spellListId 0, dropListId 0 (no loot table — quest familiar).
Patch list in `server_battlenpc_mob_types_loot.sql` sets
`elemenRangedAttack = 1` for bnpc 1358 (ranged-capable drake).
No ambient spawn of actor 2202206 exists in
`server_battlenpc_spawn_locations.sql` (private-only by construction);
quest `onKillBNpc` is intentionally empty so only the director-owned
kill (exact uniqueId `com0g1_drake_familiar`, exact area, dead check)
advances SEQ_030 -> SEQ_040.

## Abilities (skillListId 5020, eLeMeN family Drake)

| Skill | Name |
| --- | --- |
| 23271 | Smoulder |
| 23274 | Burning Cyclone |
| 23276 | Flames of Defiance |
| 23278 | Serpentine Tail |

Mob AI script `ScalelizardFireQuestCom0g1.lua` init tuple matches the
Maelstrom/Flames familiar siblings exactly. Aggro: hostile on spawn in
closed arena; leash = boundary circle + area-exit fail (leaving the
private area fails the fight to SEQ_020 retry). No waves beyond the
single wave-1 target; kill -> 2s settle -> `COM0G110` aftermath
(register-1 arg 0 baseline) with event held open across the return warp.

## Rewards

- 1,541 EXP script-side (pay-once). No gil, no company seals on this
  step. Ailith's oath 11000251 consumed at completion (leftover retired
  after interrupted saved exchange). No loot from the familiar.

## Fail / retry / re-entry rules

Death, timeout, disconnect, area-exit, quest-changed
(abandon/reaccept/advance), entry failure, wave-spawn failure ->
director fails closed to SEQ_020 (talk to Urianger again). Relog rebinds
owner by character ID only, never adopts a helper. Return-to-public
drain loop waits out pending transfers before destroying the area.
Completion path retries: full inventory (oath + completion), seal cap
n/a, EXP checkpoint prevents double pay. No level sync (1.0 design;
fixed Lv19 mob vs Lv22 quest). No chocobo companion: mount gate
("Dismount your chocobo...") plus no companion-summon API exists in the
1.0 script/server surface, so no companion can enter the instance.
Non-repeatable scenario quest; offer gated by the quest-availability
allowlist (disabled until recorded client playthrough acceptance);
prereq break (abandoned 110014 chain) rechecked at ordinary acceptance.

## Authored / retail-unproven (revisit on evidence)

Formation offsets, enemy facing, stat/ability tuning, aftermath
register-1 baseline, spawn-row Y values (reviewed standing positions).
Client acceptance pending: both native scenes, transfers + movement,
waves, death/timeout/relog/inventory retries, pay-once completion.
