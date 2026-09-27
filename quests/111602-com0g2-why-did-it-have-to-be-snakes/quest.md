# 111602 Why Did It Have to Be Snakes — `Com0g2`

- GC: Order of the Twin Adder [Story] | Level: 22 | Offer: Serpent Lieutenant Fulke 1500200 | Status: Implemented
- Quest scripts: bespoke `com0g2.lua` (85 lines) + `gc_reward_checkpoint.lua` (pay-once helpers) + `gcseals.lua`.
- SQL: `gamedata_quests.sql` row `(111602, 'Why Did It Have to Be Snakes', 'Com0g2', 111601, 22)`; next `111603 Adder's Nest Egg` prereqs this quest.
- Availability: `quest_availability.lua:318` allowlisted (patch_1_18, dialogue/delivery/interaction).

## Sequence flow (VERIFIED: com0g2.lua full body + quest_availability.lua:318 + gamedata_quests.sql)
- ACCEPT Fulke `SEQ_ACCEPT` (offer) -> `SEQ_000` (single objective: talk to Fulke) -> complete.
- Journal SEQ_000 text id `{290}`; marker `MRKR_SYRO = 11160003`.
- No items, no hand-in, no delivery target: the "delivery" is the seal/EXP grant inside the closing dialogue.
- Wiki journal (GamerEscape, inspected): "you have joined the Order of the Twin Adder on a provisional
  basis. To learn more of company currency and the items available for purchase, speak with Serpent
  Sergeant First Class Haurtelle." Walkthrough: "Speak to Fulke to start and finish this quest."
- Retail text bug (Square-Enix forum threads 17957/17959, inspected via search): Fulke's dialogue refers
  the player to "Sorainne" while the journal/archive says "Haurtelle", and Sorainne's nameplate read
  "Haurtelle". Cosmetic retail defect; no implementation action (next quest 111603 uses Haurtelle).

## Delegate events (VERIFIED: com0g2.lua:46,52 + Program.cs:121,153-160)
- `processEventFulkeStart` (accept widget; returns 1 on accept) -> seal grant -> `processEventFulkeEnd`
  (closing widget, args `0, 0`) -> EXP grant -> `player:CompleteQuest`.
- Every branch re-validated by `CanContinueGrandCompanyQuestDialogue(player, quest, dialogueData,
  dialogueSequence)` after each client yield: stale/disconnected/replaced dialogue cannot apply progress.
- Native event bodies are client-owned (not recovered server-side); server binds continuation identity only.

## Dialogue branches (VERIFIED: com0g2.lua:43-63)
- Decline (`accepted ~= 1`, incl. nil/false/0/-1/"1" per test matrix): no accept, no seals, no EXP;
  `player:EndEvent()`; fully retryable at Fulke.
- Accept at SEQ_ACCEPT: `player:AcceptQuest` must succeed or nothing is granted (failed journal accept
  leaves zero transactions; covered for the shared enlistment/tutorial harness shape in Program.cs:131-133).
- Seal-cap refusal: `GrantGCQuestSealsOnce` returns false -> closing widget never opens, quest stays at
  SEQ_000 with dialogue evidence untouched; retry after spending seals.
- Interrupted closing dialogue: seals checkpointed (flag 22 persisted) BEFORE `processEventFulkeEnd`;
  EXP checkpointed (flag 23) before `CompleteQuest`; retries never double-pay (Program.cs:155-159).

## Actors/markers (VERIFIED: SQL spawn row + com0g2.lua:21-24)
- Serpent Lieutenant Fulke, actor class 1500200, spawn id 2810 `serpent_fulke`, zone 234 (Adders' Nest),
  `(169, 0, -174.7)` rot -1.5. Marker 11160003 at SEQ_000.
- No other NPCs, no objects, no shop step in THIS quest (Haurtelle shop intro is 111603/Com0g3).

## Fight (VERIFIED: none — com0g2.lua has no battle director; audit "one-NPC seal tutorial")
- Mob roster: NONE. No instance, no squad battle, no waves, no abilities, no aggro/leash/sync surface.
- Chocobo companion: N/A (public safe zone; no private content launched).
- Combat loopholes (death, timeout, leaving bounds, disconnect mid-fight): N/A by construction.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + live CLI, zone 234)
- Zone 234 Adders' Nest, native page 60 (scale 4, base 27/296, layout 5024/place 2526).
- Fulke world `(169, -174.7)` -> map `(1.96, 1.213)`, cell `(1,1)`.
- Nearest recorded node 34: `!pos 234 169.256 8.000 -173.890` (0.85u, inside selection, 50 recorded
  points in radius). `existing_mobs_in_selection: 0` — confirms no combat population at the stage point.
- Y at marker center unresolved per guide (SQL row stores feet Y 0; standing capture 8.0 nearby).

## Rewards (VERIFIED: com0g2.lua:50,57 + gc_reward_checkpoint.lua:31-58)
- 250 Serpent Seals (company 2) + 1,100 EXP, each guarded by persisted receipt flags (22 seals, 23 EXP)
  in `characters_quest_scenario.flags` (24-bit MEDIUMINT; bits 21-23 reserved for these routes).
- Seal grant precedes closing dialogue; EXP grant precedes completion; both survive process-safe retries
  (separate DB writes, not atomic across a crash — shared documented limitation).

## Edge handling (VERIFIED: com0g2.lua + gc_reward_checkpoint.lua + audit docs)
- Abandon: quest data (incl. flags 22/23) discarded; re-accept restarts cleanly; completion recorded in
  `characters_quest_completed` (non-repeatable).
- Disconnect/relog mid-dialogue: continuation guard fails closed; persisted flags resume without double-pay.
- Prerequisite break: SQL prereq 111601 (Breaking the Seals) + allegiance recheck at ordinary acceptance.
- Sibling-city variants (111402/111802): independent per-city routes; no shared flags.
- Full inventory: N/A (no item grants in this quest).

## Tests (VERIFIED: suite run this session)
- `tools/grand-company-runtime-tests` (MoonSharp harness over the real `com/com0g2.lua`):
  `("g",2,111602,1500200)` matrix asserts checkpoint-before-widget and pay-once retry.
- Fresh run: **2,541 assertions passed** (41 direct + 51 dungeon + 18 offer dialogue boundaries).

## Open gaps
- Live 1.0 client acceptance pending (native `processEventFulkeStart/End` widget lifecycle, seal-cap
  refusal presentation, completed-quest marker clearing). Route allowlisted per availability file;
  final enablement still gated on recorded full playthrough per gc_opening_quests_completion_2026-09-19.
