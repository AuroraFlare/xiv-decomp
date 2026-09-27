# 111603 Adder's Nest Egg — `Com0g3`

- GC: Order of the Twin Adder [Story] | Level: 22 | Offer/turn-in: Serpent Sergeant First Class Haurtelle, actor class 1500203 | Status: Implemented
- Quest scripts: bespoke `com0g3.lua` (71 lines) + `gc_reward_checkpoint.lua` (pay-once helpers). No battle director, no instance, no items.
- SQL: `gamedata_quests.sql` row `(111603, 'Adder''s Nest Egg', 'Com0g3', 111602, 22)`; prereq 111602 (Why Did It Have to Be Snakes); gates 111604 + 111610 + 111611.
- Availability: `quest_availability.lua` allowlisted (patch_1_18, dialogue/delivery/interaction). GM table `yolo.lua`: level 22, rewardexp 1100.
- Chain (Lodestone achievement trails + Toto-Rak thread, inspected via search): 111601 -> 111602 -> **111603** -> 111604.

## Sequence flow (VERIFIED: com0g3.lua full body + quest_availability.lua + gamedata_quests.sql)
- ACCEPT Haurtelle `SEQ_ACCEPT` (offer) -> `SEQ_000` (single objective: talk to Haurtelle) -> complete in the same conversation.
- Journal SEQ_000 text id `{291}` (follows com0g2's `{290}`); `MRKR_HAURTELLE = 11160302` declared but the marker list
  returns `{}` per the shared Sthalmann-placeholder note (same as com0l3); the ENPC flag locates Haurtelle.
- Wiki journal (GamerEscape, inspected): Haurtelle "has informed you of your limited options as an interim recruit,
  but has assured you that more will be made available upon official enlistment"; suggests spending seals on a bottle
  of "kiss of the morning meadow"; "Speak with First Serpent Lieutenant Fulke once you have done so."
- Walkthrough (GamerEscape, inspected): "Speak to Haurtelle to start and finish this quest."
- The seal-shop/Fulke sentences are forward guidance to Fulke's follow-up missions (111604/111610/111611), NOT stages
  of this quest: no item check, no Fulke talk, no second sequence exists in the recovered scenario. The unused
  `require gc_quest_items` is the shared sister-quest header shape (com0l3/com0u3 identical).

## Delegate events (VERIFIED: com0g3.lua:46 + WorldManager.GcQuests.cs:41-44)
- `processEventStart` (accept widget; returns 1 on accept) -> `player:AcceptQuest` -> `CompleteGCQuestOnce(player, quest, 1100)`.
- Continuation re-validated by `CanContinueGrandCompanyQuestDialogue` after the client yield: stale/disconnected/
  replaced dialogue cannot apply progress or rewards.
- Native event body is client-owned (not recovered server-side); server binds continuation identity only.

## Dialogue branches (VERIFIED: com0g3.lua:44-54 + full plot script, GamerEscape Plot Details, inspected)
- Decline (`accepted ~= 1`): no accept, no EXP; `player:EndEvent()`; fully retryable at Haurtelle.
- Accept at SEQ_ACCEPT: `player:AcceptQuest` must succeed or nothing is granted.
- Full retail script is one Haurtelle monologue (10 lines): provisional-enlistment congratulations, seal-exchange
  explainer ("only able to show you a handful of them"), allegiance pitch (seals buy items or standing), enlistment
  paths (senior recommendation vs. dedication/service: "The Twin Adder takes notice of those who are capable and true
  of purpose"), enlistment seal requirement, and the kiss-of-the-morning-meadow recommendation useful for Fulke's tasks.
- No player choice branches, no item hand-in, no delivery target: the "delivery" is the EXP grant in the closing dialogue.

## Actors (VERIFIED: SQL spawn rows + com0g3.lua:22)
- Haurtelle (Sorainne Haurtelle), actor class 1500203, spawn id 2809 `serpent_haurtelle`, zone 234 (Adders' Nest),
  `(169, 0, -177.3)` rot -1.5. Offer + objective + reward NPC.
- Referenced only: First Serpent Lieutenant Fulke, actor class 1500200, spawn id 2810 `serpent_fulke`, zone 234,
  `(169, 0, -174.7)` rot -1.5 (~2.6u from Haurtelle). Issues the follow-up quests; no interaction stage here.
- No other NPCs, objects, shop transactions, or cutscenes in this quest.

## Fight (VERIFIED: none — com0g3.lua has no battle director; wiki quest type Non-Combat)
- Mob roster: NONE. No instance, no private area, no squad battle, no waves, no abilities, no aggro/leash/sync surface.
- Instance layout/bounds: N/A (public safe zone, zone 234 Adders' Nest office).
- Chocobo companion: N/A (no private content launched; companion ban for instances/squad battles not triggered).
- Combat loopholes (death, timeout, leaving bounds, disconnect mid-fight): N/A by construction.

## Placement (VERIFIED: mob_map_coordinates.md all-zone workflow + live CLI, zone 234)
- Zone 234 Adders' Nest, native page 60 (scale 4, base 27/296, layout 5024/place 2526).
- Haurtelle world `(169, -177.3)` -> map `(1.96, 1.187)`, cell `(1,1)`.
- Nearest recorded node 33: `!pos 234 171.421 8.000 -178.017` (2.52u, inside selection, 50 recorded
  points in radius). `existing_mobs_in_selection: 0` — confirms no combat population at the stage point.
- Y at marker center unresolved per guide (SQL row stores feet Y 0; standing capture 8.0 nearby).

## Rewards (VERIFIED: com0g3.lua:51 + gc_reward_checkpoint.lua:47-58,79-87)
- 1,100 EXP only, guarded by persisted receipt flag 23 in `characters_quest_scenario.flags` (24-bit MEDIUMINT;
  bits 21-23 reserved for these routes). No seals, no gil, no items — mirrors sisters com0l3/com0u3 exactly.
- `gamedata_quest_rewards.sql` carries no GC-story rows (verified); all GC opening rewards are script-paid.
- EXP grant precedes `player:CompleteQuest`; a refused completion retries without double-pay (separate DB writes,
  not atomic across a crash — shared documented limitation).

## Edge handling (VERIFIED: com0g3.lua + gc_reward_checkpoint.lua + harness)
- Abandon: quest data (incl. flag 23) discarded; re-accept restarts cleanly; completion recorded in
  `characters_quest_completed` (non-repeatable story quest).
- Disconnect/relog mid-dialogue: continuation guard fails closed; persisted flag 23 resumes without double-pay.
- Prerequisite break: SQL prereq 111602 + level 22 + `GrandCompanyOpeningQuestRules` (111603 allowlisted,
  company 2; foreign-company enlistment blocks new offers) at ordinary acceptance.
- Sibling-city variants (111403/111803): independent per-city routes; no shared flags.
- Full inventory / death / timeout / re-entry / level sync / bounds exit: N/A (no items, no combat, no instance).

## Tests (VERIFIED: suite run this session)
- `tools/grand-company-runtime-tests` (MoonSharp harness over the real `com/com0g3.lua`):
  `("g",2,111603,1500203)` matrix asserts decline-pays-nothing, EXP-checkpoint-survives-refusal, completion-resumes-once.
- Fresh run: **2,541 assertions passed** (41 direct + 51 dungeon + 18 offer dialogue boundaries).

## Open gaps
- Live 1.0 client acceptance pending (native `processEventStart` widget lifecycle, completed-quest marker clearing).
  Route allowlisted per availability file; final enablement still gated on recorded full playthrough per
  gc_opening_quests_completion_2026-09-19.
- No YouTube footage found for this removed single-conversation quest (walkthrough is one line); guide evidence is
  the inspected GamerEscape quest + full plot-script pages.
