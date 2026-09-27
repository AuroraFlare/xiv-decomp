# 111401 The Price of Integrity — `Com0l1` (Maelstrom GC Story, Lv 22, instance)

- Quest: 111401 | Code: Com0l1 | Patch 1.18 | Type: Combat / Grand Company Story
- Issuer: Storm Lieutenant Guincum (Maelstrom Command) | Prereq: Lv 22, MSQ through Man206
- Chain: first Lominsan GC story quest; unlocks 111402 Testing the Waters (Com0l2)
- Implementation: `Data/scripts/quests/com/com0l1.lua` + `Data/scripts/directors/Quest/QuestDirectorGcCom0l1.lua`
  (both VERIFIED by full-body read; no changes required — see File map)

## Sources (VERIFIED)

- Walkthrough: GamerEscape `The Price of Integrity` (fetched 2026-09-27): Wineport → (40,17)
  cutscene → yes/no prompt → private instance vs Lv 19 Peiste Familiar → return Walcher →
  signed agreement → Guincum. Party note: "Up to two party members may accompany you."
- Dialogue: GamerEscape `Loremonger:The Price of Integrity` (fetched) + `docs/Dat Mining/com0l1.csv`
  rows 2–29 (Guincum offer/accept/deny, Walcher bargain, Urianger prophecy, Yes/No branches).
- Positions: `Data/sql/server_eventnpc_spawn_locations.sql` rows 2330 (Walcher), 2771 (Guincum),
  3226 (Urianger); mob `server_battlenpc_mob_types.sql` row 1359; actor
  `gamedata_actor_class.sql` row 2200708.
- Coordinates: `tools/mobspawns/map_coordinates.py` (`maps --zone 130`, `locate --zone 130 --map 40 17`).

## Sequence flow (VERIFIED: com0l1.lua + journal 229–233 + walkthrough)

- SEQ 0 Guincum `processEventGUINCUMStart`: Deny holds (flavor refusal), Accept (`==1`) → 10.
- SEQ 10 Walcher `processEvent_010` (bargain: bring him Urianger) → 20.
- SEQ 20 Urianger camp east of Wineport → talk plays `processEvent_020` + scene COM0L105,
  then `StartGrandCompanySquadBattle` moves to SEQ 30 inside the private area.
- SEQ 30 private fight (see Instance/Fight). Director kill callback → 40; any failure → 20.
- SEQ 40 Walcher `processEvent_040` + `EnsureGCQuestItem(SIGNED_AGREEMENT 11000254)` → 50.
  Full inventory blocks advancement with a retry message (re-talk re-delivers only if missing).
- SEQ 50 Guincum `processEvent_050` + `CompleteGCQuestOnce(1760 EXP, {SIGNED_AGREEMENT})`.

## Actors / markers (VERIFIED: SQL rows + Lua constants)

| Who | Actor class | Zone | Position (X, Y, Z, rot) | Map |
|---|---|---|---|---|
| Storm Lt. Guincum | 1500199 | 232 Maelstrom Cmd | 168.9, 0, -175.7, -1.5 | marker 11150003 |
| Walcher | 1001629 | 130 E. La Noscea (Wineport) | 622.041, 53.794, -1206.78, -0.817 | marker 11140102 ≈ (31,18) |
| Urianger | 1500204 | 130 E. La Noscea (camp) | 1528.58, 60.7529, -1258.28, 2.474 | marker 11150002 ≈ (40,17) |
| Y'shtola | 1000212 | success scene COM0l110 only (not a public spawn) | — | — |

Journal markers: SEQ 0/50 → 11150003; SEQ 10/40 → 11140102; SEQ 20/30 → 11150002.

## Dialogue / interaction branches (VERIFIED: com0l1.csv + loremonger + Lua)

- Guincum offer: Deny ("A man who can say 'no'...") = stay unaccepted, retryable; Accept → SEQ 10.
- Walcher SEQ 10: single bargain branch (capture Urianger for his silence); advances on scene end.
- Urianger SEQ 20: Yes ("Heed Urianger's warning and join his cause?") and No both summon the
  familiar (native behavior: Yes = deceit test, No = honesty test; either way he tests you).
  Every dialogue path re-checks `CanContinueGrandCompanyQuestDialogue` after the client
  coroutine yields, so abandon/re-accept/replace-session mid-scene never writes a stale journal.
- Walcher SEQ 40: requires successful item hand-in; Guincum SEQ 50: requires evidence (or the
  EXP-paid checkpoint after an interrupted completion) before paying.

## Instance layout / bounds (VERIFIED: gc_sqb_quest.lua + SimpleContentGrandCompanySquadBattle.lua)

- Private content-area copy of zone 130 created at the player's position at Urianger's camp;
  area name `gc_sqb_com0l1_<ownerId>`; native director class
  `/Director/Quest/SimpleQuestBattle/QuestDirectorCom0l101`.
- Boundary: circle r = 45.0 centered on entry point; `DisableReentry()` — no second zone-in,
  no second target, no second reward path. Leaving the area fails the fight (retry at SEQ 20).
- Party: owner + up to 2 helpers (max 3); only the party leader's quest starts it; every
  entrant validated pre- and post-movie (online, same area, combat class/job, alive, unmounted,
  no open event, within party radius when configured).
- Timeout: 1800 s. No chocobo: dismount gates at `CanStart`, entrant collection, and
  post-movie revalidation; no ally/trust/path-companion spawns in this battle
  (0 companion-spawn calls across quest + director + content scripts).

## Mob roster with guide coordinates (VERIFIED: walkthrough + SQL + map tool)

Guide point: map (40,17) NE of Camp Bloodshore. Eastern La Noscea page 300:
`world = pixel/1 − (2528,3008)` ⇒ map (40,17) = world rect X 1472..1572, Z −1308..−1208.
Tool run confirms center (1472, −1308), 14 recorded ground nodes in radius, and the
Urianger NPC row inside the same square.

| # | Mob | Actor / mob type | Lv | Wave / trigger | Position |
|---|---|---|---|---|---|
| 1 | peiste familiar | 2200708 `BasiliskLesserQuestCom0l1` / 1359 `peiste_familiar` | 19 | Wave 1 (only wave), spawned pre-movie 4u ahead of player facing | Relative to entry inside the r=45 circle at camp (1472,−1308); nearest recorded ground `!pos 130 1490.387 54.845 -1303.514` (node 3900); Urianger anchor `!pos 130 1528.580 60.753 -1258.280` |

Single-target fight; no adds, no second wave. Spawn happens before the movie so allocation
failure is retryable from Urianger without stranding the player at the fight marker.

## Abilities / aggro / leash (VERIFIED: SQL + runtime)

- Mob 1359 has no rows in `server_battlenpc_skill_list.sql` / `server_battlenpc_spell_list.sql`:
  default basilisk melee + generic monster TP (`monster_tp.lua`). No scripted AoE/telegraph.
- Aggro: standard proximity on the content-owned actor (`ConfigureScriptedOneShotLifecycle`).
- Leash: boundary circle + area-exit detection; the kill callback only credits the exact
  actor class 2200708 allocated to this wave in this area — ambient same-class kills and
  duplicate fan-out callbacks are rejected (`gc_sqb_runtime.lua` reconciliation).

## Rewards (VERIFIED: com0l1.lua + archived page)

- 1,760 EXP via `GrantGCQuestExpOnce` (flag 23; crash/interrupt-safe, never double-pays); the
  signed agreement is consumed only on the final report; no gil. Unlocks 111402.

## Fail / retry / re-entry rules (VERIFIED: gc_sqb_runtime.lua + WorldManager.QuestBattle.cs)

- Death, timeout, disconnect, area exit, entry failure, wave-spawn failure, or quest-changed
  (abandon/re-accept/replace-session) → director fails safe, party is returned to the public
  return point, quest returns to SEQ 20 (talk to Urianger again). Kill → success scene
  `processEvent_030`/COM0l110 (args {1}) → SEQ 40.
- Re-entry forbidden (`DisableReentry`); relog rebinds by owner character id only, never adopts
  a helper; entry/exit transitions are ticketed with source recovery or clean disconnect.
- Level sync: none in this 1.0 content (no `minimumLevel` on this route; combat-class gate
  only) — consistent with sibling familiar routes; Lv 19 mob vs Lv 22 quest.
- Repeats: one-time story quest; EXP-once checkpoint + evidence removal make even an
  interrupted completion idempotent. Prerequisite breaks: cross-company enlistment exclusion
  (`GrandCompanyOpeningQuestRules.cs`) + per-dialogue journal-currency guards.

## File map (all bodies read in full)

- `FF14-Memory/Data/scripts/quests/com/com0l1.lua` — quest (190 lines)
- `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorGcCom0l1.lua` — director config
- `FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua` — shared lifecycle
- `FF14-Memory/Data/scripts/quests/com/gc_sqb_quest.lua` — shared launcher/entry gates
- `FF14-Memory/Data/scripts/content/SimpleContentGrandCompanySquadBattle.lua` — boundary
- `FF14-Memory/Map Server/WorldManager.QuestBattle.cs` — transition tickets/recovery
- `FF14-Memory/Data/scripts/quests/com/gc_quest_items.lua`, `gc_reward_checkpoint.lua` — items/rewards
- `FF14-Memory/Map Server/Actors/Quest/GrandCompanyOpeningQuestRules.cs` — prereq/company gates
- `FF14-Memory/Data/scripts/quests/quest_availability.lua:311` — 111401 listed Implemented

## Open gaps

- Live-client acceptance of the COM0L105/COM0l110 scenes and the relative familiar spawn
  (formation offsets are adapter-authored, not retail coordinates).
- Native success-scene recognition predicate still uses the register-1 baseline `{1}` (see
  director comment); Y'shtola appears only inside the success scene, no public actor.
