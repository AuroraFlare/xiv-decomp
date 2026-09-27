# 111403 Seals for the Whorl — `Com0l3`

- Story Lv22, Maelstrom (company 1) | Prereq: `Com0l2` 111402 | Next: `Com0l4` 111404 | Status: Implemented
- Server script: `FF14-Memory/Data/scripts/quests/com/com0l3.lua` (71 lines, verified as-is; decline/checkpoint/resume + interruption boundary covered)
- Client scenario: `quest/scenario/com/com0l3.lua`, single recovered event `processEventFHILAHCTStart` (validator REVIEWED_ROUTES; no separate luac located in repo — event-text.csv + com0l3.csv carry the dialogue)

## Sequence flow (VERIFIED: event-text.csv + com0l3.csv + journal CSVs + xtx_quest.csv)

Single-sequence seal-shop introduction. ACCEPT Grizzly Gnat `processEventFHILAHCTStart`
-> on `1`: AcceptQuest -> 1,100 EXP (flag 23, persisted) -> CompleteQuest, same talk.
Journal `{244}` at seq 0; `xtx_quest.csv` row 111403 references journal Sea 244
("Seals for the Whorl" / DE "Flottentaler du musst wandern" / FR "Les sceaux du Maelstrom").
`gamedata_quests.sql:457` = `(111403,'Seals for the Whorl','Com0l3',111402,22)`;
gates 111404 + 111410 + 111411 (rows 458/464/465). No `gamedata_quest_rewards` row:
reward is Lua-paid, same as com0l2/com0g3/com0u3.

Journal 244's closing line ("purchase [Dusken Draught] ... Speak with Guincum once
you have done so") is a NEXT-QUEST pointer, not a second objective: 111404 accepts
from Guincum, mirroring journal 243's "speak with Grizzly Gnat" pointer into THIS
quest. Proof of single-NPC completion: (a) only one recovered client event for
com0l3; (b) com0l3.csv holds Grizzly-only lines, no Guincum dialogue; (c) wiki
"Speak to Grizzly Gnat to start and finish". The draught purchase is a client-side
seal-shop transaction ("Learn more about available items?" -> shop), not a
quest-gated item check — no possession/hand-in step exists in any recovered data.

## Dialogue branches (VERIFIED: docs/Dat Mining/com0l3.csv rows 2-15 + event-text.csv)

- Row 2 greeting ("Congratulations, recruit, and welcome to the Maelstrom...").
- Row 3 ask ("Shall I proceed?", Yes/No rows 13/14).
- NO path: row 15 ("Then I cannot help you.") -> client returns != 1 -> server
  accepts nothing, pays nothing, quest re-offerable (runtime test asserts).
- YES path: rows 4-9 briefing (recruit inventory limits, enlistment, promotions,
  loyalty), rows 10-11 draught suggestion ("exchange the seals you just earned
  for this [Dusken Draught] ... of great use to you on your first mission"),
  row 12 shop prompt ("Learn more about available items?").
- Gamerescape `Seals_for_the_Whorl/Plot_Details` matches every EN line incl. Yes/No.
- Server requires strict numeric `1` before AcceptQuest; stale-offer guard applies
  at SEQ_ACCEPT (see below).

## Actors/markers (VERIFIED: spawn SQL + quest_marker.csv + map tool)

- Grizzly Gnat 1500202/eventspawn row 2770/zone 232 `(168.9,0,-178.5)` rot -1.5:
  offer + completion NPC. ENPC TALK at offer, REWARD at seq 0.
- Guincum 1500199/row 2771/zone 232 `(168.9,0,-175.7)`: referenced-only (journal
  244 pointer + com0l3.csv row 3 "first lieutenant"); owns Com0l4, no event here.
- Native 11140301-11140320 rows are identical placeholders (-431,187, actor
  1600179): unused. `getJournalMapMarkerList` correctly returns {}; the
  `MRKR_GRIZZLY = 11140302` constant is documentation-only (same as com0g3).
  ENPC flag locates the officer; do not point at Guincum or a placeholder.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + sAgent-workflow, live tool runs)

Zone 232 Maelstrom Command, native page 40 (scale 4, base 26/296, layout 5004,
43 recorded nodes, recording sha256 `fda60e80...b808e40`):
- Grizzly -> map (1.949,1.175) cell (1,1); 43 recorded pts, 0 mobs; nearest node
  11 `!pos 232 167.139 0.005 -179.798` (2.19u). Y unresolved at center per guide
  (spawn Y=0 from SQL).
- Guincum -> map (1.949,1.203) cell (1,1); nearest node 31
  `!pos 232 167.088 0.005 -176.363` (1.93u).
- Guide compliance: `maps --zone 232` + `locate` for both officer XYZ run
  directly; `existing_mobs_in_selection: 0` at both positions — there is no mob
  roster to place (see below), so no `plan` candidates were generated.

## Instance / mob roster / waves / abilities

NONE. Open-world NPC dialogue in a safe city zone: no private area, no squad
battle, no BNPCs, no waves/triggers/abilities, no level sync, no timeout, no
bounds to leave, no chocobo-companion surface (N/A by construction — no instance
exists to suppress it in).

## Rewards (VERIFIED + ARCHIVED)

1,100 EXP only (ARCHIVED: Elemen ledger row "`111403`/`Com0l3` ... No direct
Storm Seal row + 1,100 EXP"; no gil, no items, no key items, no seals).
Dusken Draught (item 3020202, `Normal/PotionItem`) is shop flavor bought with the
250 Storm Seals earned in 111402; it is NOT granted, checked, or consumed by this
quest. Its seal price is not recovered in repo data (gap below).

## Fail / retry / re-entry (VERIFIED: com0l3.lua + gc_reward_checkpoint.lua + C# bodies)

- Decline (No at row 3, or row 12): quest never accepted; Grizzly re-offers.
- Yield guard: `CanContinueGrandCompanyQuestDialogue` after the client yield
  (`WorldManager.GcQuests.cs:41`) — at SEQ_ACCEPT validates the exact published
  offer (`CanAcceptGrandCompanyQuestOffer`: session/SEQ_NOT_STARTED/no journal);
  at seq 0 binds connected player + accepted journal + data + sequence, so a zone
  change, relog, or abandon mid-dialogue aborts with nothing paid.
- Disconnect between AddExp and CompleteQuest: flag 23 persisted ->
  `CompleteGCQuestOnce` retry pays once and completes (runtime test
  "shop EXP checkpoint survives completion refusal" + "completion resumes once").
- Abandon: allowed (`Player.cs:6268 AbandonQuest`: zone 232 is public, quest is
  non-MSQ); re-offer via SQL prereq 111402 + `quest_availability.lua` allowlist
  (line 313, patch_1_18). No seals involved, so no cross-abandon ledger gap
  (cleaner than com0l2's documented one).
- Journal-full `AcceptQuest` failure: pays nothing (accept gate precedes reward).
- Death/timeout/level-sync/bounds: N/A (safe zone, no instance/timer/sync).
- Repeats: engine completion history + availability block re-accept after
  `CompleteQuest`. Prereq break: SQL prereq + allegiance recheck at acceptance
  (shared GC policy); sibling dungeon exclusivity N/A (no dungeon here).

## Open gaps

- Live-client acceptance pending (readiness doc): native shop-introduction result,
  inline seal-shop open/purchase behavior, decline/retry and completion in client.
- Dusken Draught seal price + Grizzly's full seal-shop stock not recovered in repo
  data (no `server_items_dealing` rows for 1500202/3020202); client-side only.
- No per-quest YouTube video found (2 searches); fandom Maelstrom page HTTP 403;
  BlueGartr thread fetch timed out (gamerescape main + plot-details fetches,
  native com0l3.csv, event-text.csv, and journal CSVs carry the evidence).
- No separate client luac for com0l3 located in repo (unlike com0l2's cited 1755
  bytes); bytecode-level return-value shape unverified — server defensively
  requires strict numeric 1.
- Repo gates observed 2026-09-27: `GrandCompanyRuntimeTests` green (2545
  assertions, incl. com0l3 decline/checkpoint/resume + interruption boundary);
  `validate_grand_company_quests.py` red at baseline on missing unrelated doc
  `docs/grand_company_quests_decomp_2026-08-22.md` (pre-existing; all checks
  before that read pass, incl. 111403 prereq/marker/wrapper);
  `validate_quest_availability.py` red at baseline on one stale 111604
  annotation (pre-existing; 111403's own annotation clean).
