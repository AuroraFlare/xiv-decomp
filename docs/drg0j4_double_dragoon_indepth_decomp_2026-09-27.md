# DRG 111324 Drg0j4 — Double Dragoon (Lv45) — indepth decomp

Target file (repo): `FF14-Decomp/docs/drg0j4_double_dragoon_indepth_decomp_2026-09-27.md`

Lv45. Alberic offer -> rendezvous scene SW of Skyfire Locks (Estinien) ->
Alberic armor guidance -> four independent Drachen coffers -> completion at
the fourth acquisition, no return. Status: HOLD (no rendezvous trigger
actor/transition owner; no coffer actors, transforms, or bindings recovered;
committed hard-stop test `test_af.lua` requires `objectives == nil`).

## Stages / sequences (server adapter)

- 0 offer/route: Alberic 1002001 `processEvent_ALBERIC_Start` (offer EQ
  pc28/0x436; texts 2/3/4 accept path, text 5 decline-nudge, text 6
  accepted) + `processEvent_ALBERIC_Follow` reminder (texts 7/33, southbound
  highroad direction). `processEvent_ALBERIC_Hint` (texts 40/43/41) is the
  post-completion hint, not an offer path.
- Destination scene: `processEvent_NQ_Drg0j410` plays literal `Drg0j410`
  with default fade (`startFadeOutCutSceneDefault` then
  `startNQCutScene`, capital-D literal per the DRG fade contract).
- Guidance: `processEvent_ALBERIC_Guidance` (texts 32/34-39/42) recites all
  four armor locations after the scene; it cannot be conflated with the
  scene itself.
- 6 interaction: four independent coffers via `processEvent_getAF_info`
  (item ID passed by the server, one widget per coffer). Each coffer runs
  owner scheduler 67108910 at 0x934 + `showGetJobItemWidget(player,arg1,0)`
  at 0x948, with no local state checks and no acquisition counter: the
  count is server-owned (template flags/counter machinery). Fourth
  acquisition completes in place; there is no return-to-NPC step.
  (Whm0j5 is the only AF row with a separate return; DRG has none.)
- Journal: Roc/26-29. Selector map `drg0j4 = {[0] = 0, [6] = 1}` (rendezvous
  beat, then independent AF collection). No party-size line on this quest.
- `processEventChuui/Chuui2` (51131/51132) have no local text export.

## NPCs / dialogues / items

- Alberic 1002001 @ zone 143 Gates of Judgement (-180.174, 286.839,
  -304.109, spawn row 2360). Offer/intro, follow-up, guidance, hint.
- Estinien 1060040/display 1200199: scene-only in `drg0j410`
  (135.313, 239.464, 476.251, rot +PI/2 facing the pair); never a combat
  or field actor here.
- Alberic scene pose in `drg0j410`: (157.499, 237.222, 476.955, -PI/2);
  PC setup (159.230, 237.080, 477.870, -PI/2) corroborates marker 11226301
  X/Z exactly and supplies the authored Y/rot for that shot only.
- Items (all verified in `gamedata_items.sql`): 8051404 Drachen Breeches,
  8071404 Drachen Gauntlets, 8081804 Drachen Greaves, 8013504 Drachen Armet.
  No ability in this scenario. EXP 5340.
- Guidance text ( walkthrough-corroborated pairs, documentation-only ):
  Aurum Vale = Breeches 8051404; cave N of Camp Brittlebark (SE Mor Dhona)
  = Greaves 8081804; U'Ghamaro Mines (N edge of upper La Noscea) =
  Gauntlets 8071404; cave N of Camp Bluefog (N Thanalan) = Armet 8013504.
  The client event takes the item from the server, so ordinal
  marker<->item alignment is unsafe in general; the DRG pairs are kept only
  because the walkthrough independently corroborates each one.

## Markers / placements (map_coordinates.py)

Guide: `docs/mob_map_coordinates.md` — "Agent workflow" (locate), "Generate
placements" (private/content-owned zones stay out of public SQL; no
invented Y), "Calibration and evidence" (recorded heights belong only to
their recorded positions).

- 11226301 rendezvous (MapMarkerQuest point, 159.230/477.870, 102/201):
  zone 143 map (38.71, 26.22); 0 recorded points in r30; nearest nodes
  ~50 yalms away (Y~224-227, inside_selection=false). Scene-authored
  Y 237.080002 / rot -PI/2 is the only authored transform; it is shot
  evidence, not a persistent spawn.
- 11226302 Aurum Vale (MapMarkerQuestArea, -368.990/1397.950, 102/204):
  zone 245 page 5500 map (9.59, 6.30); 0 points in r30; nearest recorded
  ~263 yalms away. Content-owned zone: JSON-only candidacy, no public
  spawn SQL. Y unresolved.
- 11226303 U'Ghamaro (MapMarkerQuestArea, 96.960/-2692.710, 101/104):
  zone 137 page 4900 map (6.39, 7.95); 0 points in r30; nearest ~98 yalms
  away. Y unresolved.
- 11226304 Brittlebark (MapMarkerQuestArea, 680.700/460.930, 105/501):
  zone 190 map (19.61, 18.05); 6 points in r30, nearest node 3196
  (655.3, 40.4, 465.4) 25.8 yalms inside_selection=true. Nearest usable
  ground reference Y~40.4; coffer actor still absent so no placement.
- 11226305 Bluefog (MapMarkerQuestArea, -228.540/-2380.830, 104/404):
  zone 173 map (24.585, 6.91); 56 points in r30, nearest node 389
  (-228.4, 279.3, -2381.5) 0.7 yalms away. Exact ground Y~279.3; coffer
  actor still absent so no placement.
- 11226306-11226310 are filler rows (1600179 @ -431,187,101/121), not DRG
  objectives.

## Mobs / spawns / triggers / instance / bounds

- No combat: no enemy, wave, instance ID, or quest-battle shell. The empty
  client director family for this line (`Drg0j101`/`Drg0j601` shells) owns
  no j4 callback.
- Gaps (all blocking, shared with the other six AF rows): no rendezvous
  trigger actor or scene-to-guidance transition owner; no coffer actor
  classes, unique IDs, Y/rotation transforms, or push owners. Display
  4000257 ("???") is never a legal actor key. Class candidate only:
  1200161 (`/Chara/Npc/Object/GuildleveBonusTreasureBox`) is the only
  coffer-like actor class in gamedata; it is not asserted as the retail
  AF coffer.
- Sync: none. minimumLevel-only gating per the 4-job consensus (no retail
  level-sync evidence for 1.x job quests).

## Rewards / fail / reset / edge cases

- Rewards: four Drachen pieces (one per coffer, grant-once with
  inventory-full retry in template `onPush`) + 5340 EXP at the fourth
  acquisition. No action, no linkpearl, no key item.
- Fail/reset: no death/timeout surface (no battle). Abandon/reaccept
  clears flags via `resetInteractionProgress` at the seq-6 boundary;
  persisted per-coffer bits + recomputed counter survive relog; marker
  list suppresses collected coffers; duplicate pushes are suppressed;
  pre-owned items are not duplicated; a client-interrupted widget leaves
  the bit unset so the coffer stays retryable (all covered by
  `test_af.lua` synthetic-actor tests; production objectives stay absent).
- Item-loss: with objectives absent the quest cannot run, so no live
  item-loss path exists. Enabling-time requirement: re-push recovery for
  a set bit whose item is missing (see below), else a discarded piece
  between coffers would complete the quest short one item.

## What enabling requires (adapter spec, not done)

1. Recover (live capture) the rendezvous trigger actor + transition owner
   for `processEvent_NQ_Drg0j410`, or accept the Blm0j3-precedent adapter:
   launch the guidance/coffer phase from Alberic's route talk with the
   destination marker kept for journal fidelity.
2. Recover or author four quest-owned coffer actors (model + class +
   unique IDs, one per marker) with GM-verified Y/rotation at the four
   marker X/Z (Bluefog Y~279.3 and Brittlebark Y~40.4 are recorded-ground
   references, not coffer transforms; Aurum/U'Ghamaro need capture).
3. Add the spawn rows + `interactions.objectives` with the four
   walkthrough-corroborated marker/item/uniqueId triples; template
   `onPush`/flags/counter machinery already handles grant-once,
   inventory-full retry, and fourth-acquisition completion.
4. Add item-loss recovery (re-grant on re-push when the bit is set but the
   item is missing) before enablement.
5. Update `test_af.lua`: move Drg0j4 from the hard-stop list to a
   registered-objectives contract (exact actor/item/marker triples).
6. Route validator `tools/validate_job_drg0j4_route.py` covers the
   documented contract until then (markers, dialogue events, hard stop,
   availability label).
