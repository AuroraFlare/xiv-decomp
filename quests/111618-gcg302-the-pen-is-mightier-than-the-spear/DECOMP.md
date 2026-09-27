# Quest 111618 The Pen Is Mightier Than the Spear (Gcg302) — DECOMP

Order of the Twin Adder sidequest (Gridania GC 302), level 25.
Prereq: 111617 Eternal Recurrence. Unlocks 111619 Woes of the Botanist.
SQL: `(111618, 'The Pen Is Mightier Than the Spear', 'Gcg302', 111617, 25)` in
`Data/sql/gamedata_quests.sql`.

ORIGINAL WORK ONLY: no Square Enix client binaries were decompiled,
disassembled, or copied for this note. Sources are the public
GamerEscape wiki walkthrough, the repo's existing LPB decomp artifacts,
dat-mined CSVs already in the repo, and the coordinate guide below.

## Sources inspected (full bodies read, not grep-only)

- `Data/scripts/quests/gcg/gcg302.lua` (quest script: `InitGrandCompanySidequest("Gcg302")`)
- `Data/scripts/quests/com/gc_sidequest.lua` (shared 301/302 route logic, Gcg302 config block)
- `Data/scripts/quests/com/gc_sidequest_battles.lua` (CONFIGS.gcg302 battle config)
- `Data/scripts/quests/com/gc_sidequest_placements.lua` (gcg302 route/trigger)
- `Data/scripts/quests/com/gc_sqb_quest.lua` (shared SQB launcher: entry gates, party rules)
- `Data/scripts/directors/Quest/QuestDirectorGcSideGcg302.lua` (SQB director wrapper)
- `Data/scripts/directors/Quest/gc_sqb_runtime.lua` (shared SQB lifecycle: kill credit, fail/return)
- `Data/scripts/base/chara/npc/monster/Fly/FlyLesserQuestGcg302.lua` (server mob AI init tuple)
- `Data/scripts/base/chara/npc/monster/Fly/FlyLesserStandard.lua` (sibling AI, identical tuple)
- `Data/quest_npcs/gc_sidequests_20260919.json` (gcg302 route, Challinie spawn, profile 40302)
- `tools/build_gc_sidequests.py` (SQL builder; read fully)
- `tools/grand-company-runtime-tests/GcSidequestTests.cs` (route + sketch-handoff tests; read fully)
- `docs/gc_sidequests_2026-09-19.md` (read fully)
- `docs/Dat Mining/gcg302.csv` (quest text sheet; Rootslake rows inspected)
- `docs/Dat Mining/xtx_journalxtxFst.csv` rows 346/347/348/374 (journal texts inspected)
- `docs/Dat Mining/quest_marker.csv` rows 11193101/11193102/11193103/11193104
- `docs/mob_map_coordinates.md` (read fully); `map_coordinates.py locate`
  runs for zone 154 positions below
- `outputs/job-gc-decomp-20260907/quests/gcg302.json` (method/condition/call inventory)
- `outputs/job-gc-decomp-20260907/reconstructed/gcg302.md` (client path templates; read fully)
- `outputs/job-gc-decomp-20260907/bytecode/gcg302.txt` (full 5-method disassembly; read fully)
- `outputs/job-gc-decomp-20260907/event-text.csv` rows 2624-2661 (all 38 dialogue rows; read fully)
- `outputs/job-gc-decomp-20260907/directors/questdirectorgcg30201.txt`
  (native class `QuestDirectorGcg30201`)
- `tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/monster/fly/flylesserquestgcg302.lua`
  (recovered client class `FlyLesserQuestGcg302 extends FlyBaseClass`)
- `Data/scripts/quests/com/gc_quest_template.lua` (Gcg302 seal row: 300; journal inventory)
- `docs/grand_company_quests_elemen_ledger_2026-08-22.md` (Gcg302 reward: 300 Serpent Seals + 1,891 EXP)
- GamerEscape `The_Pen_Is_Mightier_Than_the_Spear` (journal + walkthrough fetched 2026-09-27):
  Dhemdaeg -> South Shroud (47,50) Giant Gnat -> defeat to enter instance ->
  Challinie -> Dhemdaeg. Journal matches repo rows 346/348/374 verbatim in structure.
- YouTube/web video search for this quest returned no usable footage; mechanics
  below rest on the wiki walkthrough plus the repo decomp artifacts above.

## Objectives / phases (SEQ)

```
SEQ_ACCEPT  Talk to Dhemdaeg (offer; marker 11193104)
SEQ_000=0   Search near the Rootslake, South Shroud (journal 347; marker 11193101)
              - push the battle trigger -> private SQB vs one forest beast
              - inside the instance the journal shows row 348
SEQ_010=10  Speak to Challinie (journal 374; marker 11193102)
              - receive the Sketch of Challinie (item 11000403)
SEQ_020=20  Return to Dhemdaeg at the Wailing Barracks (journal 374; marker 11193104)
              - hand over the sketch -> 300 Serpent Seals + 1,891 EXP, quest complete
```

Journal rows (EN): 347 = Dhemdaeg's briefing (Rootslake search; the DE/FR texts
add "up to two party members may accompany you"); 348 = post-fight prompt to
speak to the nearby conjurer; 374 = Challinie's account + deliver the sketch to
Dhemdaeg. Row 346 is the quest-log summary, never an active step.

## NPCs / actors (all spawn rows inspected)

| NPC | Class | Zone | Position (X,Y,Z,rot) | SQL row |
| --- | --- | --- | --- | --- |
| Dhemdaeg | 1000567 | 206 | 183.88, 27.5, -1577.74, 0.83 | 708 `dhemdaeg` |
| Battle trigger (invisible push circle) | 1099544 | 154 (South Shroud/Rootslake) | 1637.339966, 0.005210, 1217.260010, 0 | 3283 `gcg302_battle_entry` |
| Challinie | 1000956 | 154 (near Rootslake) | 1657.75, -0.661125, 1236.609985, 0.0 | 3286 `gcg302_challinie` |
| Hilith | — | — | mentioned only, never spawns | — |

Native marker X/Z recovered from `quest_marker.csv`: 11193101 battle
(1637.339966, 1217.26001), 11193102 Challinie (1657.75, 1236.609985),
11193104 Dhemdaeg (183.880005, -1577.73999). All three match the spawn rows
exactly. Trigger actor 1099544 carries
`activeQuestVisibility [{"questId":111618,"sequences":[0]}]` with a 3.0-yalm
`pushDefault` circle.

## Guide coordinates (map_coordinates.py, Black Shroud transform)

- Battle trigger (1637.34, 1217.26) -> map (47.41, 50.25), i.e. walkthrough
  square (47,50). Recorded ground node 3750 at (1637.589, 0.0052, 1216.97),
  0.38 yalms away; 28 recorded points in selection.
- Challinie (1657.75, 1236.61) -> map (47.62, 50.45), square (47,50).
  Recorded ground node 3757 at (1658.17, -0.66, 1235.53); 20 recorded points
  in selection.
- Ravenous fly private spawn: route + offset (0,7) = (1637.34, -0.141893,
  1224.26), i.e. map (47.41, 50.32) by the same transform, square (47,50);
  floor Y from frozen node 3768 (1.73 yalms horizontal support distance).
- Heights above are recorded movement XYZ from
  `Data/quicknavmesh/zone_154.tsv`, not extrapolated. Rootslake consumer
  excludes rejected nodes 3651-3668.

## Dialogue / interaction flow (all event-text rows read)

`processEventStart` (Dhemdaeg offer, arg4 = 1 when the player's company is the
Twin Adder): say 2 (member greeting) or 39 (visitor greeting) -> 3,4,5
(Wood Wailers training recruits; Hilith troublesome) -> 6 (hopeless with a
spear, absent without leave) -> 8,9 (discharge refused; Dhemdaeg's ambition)
-> 33 (search Rootslake while he scours Quarrymill Landing) ->
`showQuestInfomation` accept gate -> accept: say 12 (thanks + payment later);
decline: say 11 (dismissal).

`processEventStartAfter` (Dhemdaeg reminder at SEQ 0): say 13,14 (search near
the Rootslake; put the fear of the gods in her).

`processEventChallinie` (SEQ 10 -> 20, arg4 = company flag): say 15 (member)
or 40 (visitor) -> 35,36 (Hilith already returned to the Barracks; she
practiced spearwork with Challinie) -> 16,17 (introduction; vouches for
Hilith) -> 38 (pride of youth) -> 18,19,20 (Dhemdaeg's blindness; service
beyond spears) -> 21 (the drawing) -> 37 (show it to Dhemdaeg). Server then
saves SEQ 20 BEFORE granting the sketch, so a full inventory retries the
delivery at either contact instead of losing the handoff.

`processEventChallinieFree` (reminder, say 21): unreachable by construction —
the field talk always advances to SEQ 20 first. Kept as the configured
`fieldReminder` for client parity.

`processEventClear` (Dhemdaeg report at SEQ 20): fade out/in -> 22-27
(skepticism; Hilith all thumbs) -> 28 (the drawing) -> 34 (Hilith drew
this!?) -> 29,30 (Twin Adder call for artists; spear to brush) -> 31,32
(remorse; payment) -> fade out/in. Server pays 300 seals, then runs this
event, then pays 1,891 EXP once, consumes the sketch, and completes.

Every yielding dialogue snapshots (player, quest, quest-data, sequence,
session, area) via `CanContinueGrandCompanyQuestDialogue`; stale
continuations return without progress.

## Instance layout / bounds

- Private SQB content area `gc_sqb_gcg302_<ownerId>`, script
  `SimpleContentGrandCompanySquadBattle`, native director
  `/Director/Quest/SimpleQuestBattle/QuestDirectorGcg30201`.
- Boundary: circle r=45.0 yalms centered on the owner's entry position;
  `DisableReentry()` — no second zone-in, no second target/reward path.
- Timeout 1800s (30 min). Max party 3 (owner + up to two helpers).
  Minimum level 25, combat class/job, alive, same area, within 30 yalms of
  the entrance, unmounted, event-free; leader-only party pull, every entrant
  re-validated after the entry movie before publication.
- Entry trigger: push actor 1099544 at SEQ 0 only, player within 14 yalms
  XZ and 2.5 Y of the route point, public zone 154.
- Single wave-1 target; kill -> 2s settle -> SEQ 10 -> return to the public
  point -> Challinie. No post-fight scene (no `successEvent` configured).

## Mob roster (complete: exactly one mob)

| BNPC | Actor class | Name | Lv | HP/MP | Job | Att | Detect |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 40302 | 2100601 | ravenous fly | 25/25 | derived (0/0) | 23 | 40 | type 4, range 10, hostile |

Full profile (`server_battlenpc_mob_types.sql` row 2318): speed 5,
floatingHeight 0.9, isHostile 1, isNotorious 0, respawnTime 60, combatDelay
4200, allegiance 0, STR/VIT/DEX/INT/MND/PIE 1, ACC/DEF/EVA 1, every physical
and elemental resist 1.0, element 0, skillListId 5028, spellListId 0,
dropListId 0 (no loot table — quest beast). Client recovered class is
`FlyLesserQuestGcg302 extends FlyBaseClass`; actor 2100601
(`/Chara/Npc/Monster/Fly/FlyStandard`) supplies the matching Fly model
through this explicitly authored level-25 profile — it is not claimed as
the lost retail actor binding. Server AI `FlyLesserQuestGcg302.lua` init
tuple is identical to `FlyLesserStandard.lua`. No ambient spawn of this
exact quest binding exists; the quest `onKillBNpc` path is intentionally
director-owned so only the exact uniqueId `gcg302_forest_fly` in the exact
private area advances SEQ 0 -> 10.

## Abilities (skillListId 5028, eLeMeN family Gnat)

| Skill | Name |
| --- | --- |
| 23064 | Brundleflight |
| 23066 | Thunderstrike |
| 23067 | Thunderwall |
| 23068 | Thunderstorm |

Walkthrough names the foe a Giant Gnat; the Gnat skill family matches the
recovered Fly/Gnat-class beast. Aggro: hostile on spawn in a closed arena;
leash = boundary circle + area-exit fail (leaving the private area fails
the fight back to SEQ 0 retry).

## Rewards

- 300 Serpent Seals (company 2) + 1,891 EXP, each behind an independent
  pay-once checkpoint (`GrantGCQuestSealsOnce` / `GrantGCQuestExpOnce`).
  Values match the Elemen ledger row for 111618/Gcg302 and the
  `GC_QUEST_SEALS` table. No gil, no loot from the fly.
- Sketch of Challinie (item 11000403, `Normal/DummyItem`) granted at the
  SEQ 10 field handoff, repaired on retry at either contact, consumed at
  completion. No `gamedata_quest_rewards` row — rewards are script-side.

## Chocobo / mount disabled

- `CanStartGrandCompanySquadBattle` refuses mounted owners; `collectEntrants`
  refuses a mounted leader ("Dismount your chocobo before entering the
  private encounter.") and any mounted member ("Every party member must
  dismount before entering."); post-movie publication re-checks every
  entrant for mount state. Mount detection mirrors TeleportCommand
  (`GetMountState() ~= 0` or `ACTORSTATE_MOUNTED`), nil-guarded for
  harness doubles.
- No chocobo companion can enter: no companion-summon API exists in the
  1.0 script/server surface, and the content area admits only the validated
  entrant roster.

## Fail / retry / re-entry rules

Death, timeout (1800s), disconnect, area-exit, quest-changed
(abandon/reaccept/advance), entry failure, wave-spawn failure ->
director fails closed to SEQ 0 (push the Rootslake trigger again).
Success requires entered + won + owner connected, alive, still in the
private area, and the bound quest still current — checked again after the
2s settle. Relog rebinds the owner by character ID only, never adopts a
helper. Return-to-public drains pending transfers before destroying the
area (`ContentFinished`/`CheckDestroy`/`EndDirector`).

Completion-path retries: full inventory at the field handoff (sketch
repaired at Challinie or Dhemdaeg), at the report stage (evidence repaired
before seals), and at completion (EXP checkpoint prevents double pay;
sketch consumed exactly once). Non-repeatable scenario quest; offer stays
behind the quest-availability allowlist (disabled until recorded client
playthrough acceptance); prereq 111617 rechecked at ordinary acceptance.
No level sync (1.0 design; fixed Lv25 mob vs Lv25 quest).

## No-loophole checklist (each item verified in the cited body)

- [x] Foreign same-class kills cannot credit: `gc_sqb_runtime.onKill`
  reconciles only exact allocated uniqueIds in the exact area with a dead
  check; duplicate callbacks credit once (`creditedTargets`).
- [x] Helpers cannot advance or steal: owner resolved by area-name owner ID
  + quest at expected sequence; rewards fire on the bound quest only.
- [x] No reward without the kill: SEQ 10 reachable only via the director
  success path; no talk/push shortcut to SEQ 10 exists.
- [x] No report without the sketch: SEQ 20 completion requires the sketch
  item or a saved EXP checkpoint from an interrupted completion.
- [x] No double pay: independent seal + EXP pay-once checkpoints; sketch
  consumed at completion; re-entry disabled.
- [x] No stale-dialogue progress: every yield re-validates quest, sequence,
  session, and area before advancing.
- [x] No out-of-range/zone entry: 14-yalm XZ + 2.5-Y trigger check, exact
  trigger actor, exact public zone 154, exact SEQ 0.
- [x] No mount/level/party bypass: Lv25 + combat-class + alive + unmounted
  gates at entry and re-checked after the entry movie; party cap 3,
  leader-only pull, 30-yalm party radius.
- [x] No orphaned-fight adoption: relog rebinds owner ID only; helpers never
  promoted; helper disconnect leaves the owner's fight intact.
- [x] Non-member dialogue cannot break flow: company flag only selects
  say-variant (2/39, 15/40); accept/advance logic is identical.

## Implementation verdict

Server script already 100%: `Data/scripts/quests/gcg/gcg302.lua` +
`gc_sidequest.lua` Gcg302 block + `gc_sidequest_battles.lua` CONFIGS.gcg302
+ `gc_sidequest_placements.lua` gcg302 route + `QuestDirectorGcSideGcg302.lua`
cover every recovered method, journal, marker, and reward above. No script
edits were needed or made. Verified this session: `GrandCompanyRuntimeTests`
passes (2541 assertions, incl. the 1-target route check, the recovered
`processEventStart`/`processEventChallinie` offer/handoff checks, the
sketch-handoff persistence check, and the 300-seal/1891-EXP completion
check). Runtime registration mirror:
`docs/quests/111618-gcg302-the-pen-is-mightier-than-the-spear/RUNTIME.md`
in FF14-Memory.

## Authored / retail-unproven (revisit on evidence)

Enemy formation offset (0,7) and facing, numeric combat tuning (all-1
attributes, att 40, derived HP/MP), skill timing, trigger Y/floor support
(frozen node, not retail actor XYZ), party-size-3 allowance (EN journal 347
lacks the party line present in DE/FR). No usable video footage found for
this quest. Client acceptance pending: offer/field/report scenes, private
transfers, death/timeout/relog/inventory retries, pay-once completion.
Pre-existing, out of scope: `build_gc_sidequests.py check` currently fails
on foreign spawn IDs 3291+ (keelty/arc200/lnc300/cnj300 rows) inside the
reserved 3280-3319 range — the gcg302 rows (3283, 3286) and profile 40302
are intact inside the builder block.
