# 111402 Testing the Waters — `Com0l2`

- Story Lv22, Maelstrom (company 1) | Prereq: `Com0l1` 111401 | Next: `Com0l3` 111403 | Status: Implemented
- Server script: `FF14-Memory/Data/scripts/quests/com/com0l2.lua` (85 lines, verified as-is; 16/16 scoped contract checks pass)
- Client scenario: `quest/scenario/com/com0l2.lua` (luac 1755 bytes, sha256 `e73740a8…48629a1`)

## Sequence flow (VERIFIED: client lua + event-text.csv + journal CSVs)

Single-sequence dialogue tutorial. ACCEPT Guincum `processEventGUINCUMStart(0,0)`
(offer ask text 7) -> on `1`: AcceptQuest -> grant 250 Storm Seals (flag 22,
persisted) -> `processEventGUINCUMEnd(0,0)` (widget animates to 250) -> 1,100 EXP
(flag 23, persisted) -> CompleteQuest. Journal `{243}` at seq 0; `xtx_quest.csv`
row 111402 references journal Sea 243 in every locale slot (one journal row).

## Dialogue branches (VERIFIED: reconstructed/com0l2.md + event-text.csv:1428-1446)

Start: say 2 ("Interested in joining the Maelstrom, are we?"), 21, sched, 3, 4,
5, sched, 6, then ask 7 ("Join the Maelstrom as an interim recruit?", 2 options).
YES path: waits + `openPublicEffectWidget(4)` + `openGrandCompanyStatusWidgetYield(1)`
+ `setGrandCompanyStatusWidgetPoint(0)`, say 11-17, `worldMaster:say(22)` (seals
viewed on Grand Companies tab), say 18-20 (20 = "Grizzly Gnat─the good man
standing next to me─can instruct you..."). Returns ask result.
NO path: scheduler + say 10 ("A footnote it is, then... My offer stays open...").
Return value is the ask result; server requires strict numeric `1`.
Gamerescape `Testing_the_Waters/Plot_Details` Part 1 matches all lines (Yes/No).

## Actors/markers (VERIFIED: spawn SQL + quest_marker.csv + map tool)

- Guincum 1500199/eventspawn 2770-row 2771/zone 232 `(168.9,0,-175.7)` rot -1.5.
  Marker 11150003 (168,-175.67, MapMarkerQuest, layout 5004). ENPC TALK at offer,
  REWARD at seq 0.
- Grizzly Gnat 1500202/row 2770/zone 232 `(168.9,0,-178.5)`: referenced-only
  (dialogue text 20 + journal 243); owns Com0l3, no event in this quest.
- Native 11140201-11140220 rows are identical placeholders (-431,187, actor
  1600179): unused, same convention as com0l3.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + sAgent-workflow)

Zone 232 Maelstrom Command, native page 40 (scale 4, base 26/296, layout 5004):
- Guincum -> map (1.949,1.203) cell (1,1); 43 recorded pts, 0 mobs; nearest node
  31 `!pos 232 167.088 0.005 -176.363` (1.93u). Y unresolved at center per guide
  (spawn Y=0 from SQL).
- Gnat -> map (1.949,1.175) cell (1,1); nearest node 11
  `!pos 232 167.139 0.005 -179.798` (2.19u).

## Instance / mob roster / waves / abilities

NONE. Open-world NPC dialogue in a safe city zone: no private area, no squad
battle, no BNPCs, no waves/triggers/abilities, no chocobo-companion surface
(N/A by construction — no instance exists to suppress it in).

## Rewards (VERIFIED + ARCHIVED)

250 Storm Seals (reward CSV: item 1000201 x250, single positive seal row; client
End `setGrandCompanyStatusWidgetPoint(250)`) + 1,100 EXP (ARCHIVED: Elemen ledger
+ gc_finalization; no gil, no items, no key items).

## Fail / retry / re-entry (VERIFIED: gc_reward_checkpoint.lua + Player.cs bodies)

- Decline: quest never accepted; Guincum re-offers (retail "offer stays open").
- Seal cap: `GrantGCQuestSealsOnce` false -> quest stays at seq 0, retryable.
- Disconnect during End yield: flags 22/23 persisted -> retry pays each once
  (runtime tests `grand-company-runtime-tests` assert checkpoint-before-widget).
- Yield guards: `CanContinueGrandCompanyQuestDialogue` after each client yield
  (session/area/quest identity; zone change aborts).
- Abandon: allowed (public zone, non-MSQ per `AbandonQuest`); re-offer via SQL
  prereq 111401 + availability list; company rule allows unpledged (0) recruits.
- Death/timeout/level-sync/bounds: N/A (safe zone, no instance/timer/sync).
- Repeats: engine completion history + availability block re-accept after
  `CompleteQuest`. Journal-full `AcceptQuest` failure pays nothing.

## Open gaps

- Abandon after seals paid but before completion (requires deliberate disconnect
  inside the ~2s End-widget yield) re-grants 250 on re-accept: no cross-abandon
  ledger exists in conventions; shared pattern with com0g2/com0u2 + enlistment
  routes (same class as war0j1 shared-driver gap).
- Live-client widget open/close acceptance (readiness doc).
- Full `validate_grand_company_quests.py` red at baseline: missing unrelated doc
  `docs/grand_company_quests_decomp_2026-08-22.md` (pre-existing; this quest's 16
  scoped assertions all pass).
- No per-quest YouTube video found (2 searches); ffxivclassic wiki TCP refused
  (gamerescape fetches + client bytecode carry the evidence instead).
