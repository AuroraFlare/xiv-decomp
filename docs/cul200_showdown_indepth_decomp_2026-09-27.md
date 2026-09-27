# Cul200 Showdown (110440) indepth decomp - 2026-09-27

Quest: Showdown, code Cul200, id 110440, Culinarian (class 36), level 20.
Offer: Charlys (actor 1000138) in the Bismarck, Limsa Lominsa zone 230.
Pack context: `docs/class-quest-crafting-indepth-decomp-2026-09-27.md`
(pack verdict: ENABLED playable reference). This file is the quest-specific
indepth record: game-data evidence, new web/video evidence (V12/A7/A8),
conflict resolutions, implementation contract, and edge-case matrix.

Machine data: `outputs/cul200-showdown-decomp-20260927/` (`quest_evidence.csv`,
`edge_cases.csv`). Registrations: FF14-Memory
`docs/cul200_showdown_reg_2026-09-27.md` plus the cited SQL/Lua rows.

## 1. Game-data evidence (inspected)

- Template row `Data/scripts/quests/class_quest_template.lua` (Cul200 block):
  id 110440, title Showdown, level 20, classId 36; actors Charlys 1000138
  (offer), Prudentia 1000168 (pie-crust customer), Pulmia 1000169
  (pate customer); `finalInteractionActorUnresolved = true`; journal states
  0 (accept challenge) and 5 (complete both branches); work counters slot 2
  Prudentia {5,10,15} and slot 3 Pulmia {5,10,15}; two exact five-material
  recipes (5386 Pie Crust 11000069, 5387 Pate 11000070); marker range
  11044001-11044008 with filler 11044009-11044020; scene flow
  processEventCharlysStart (offer), 010/015/017/020 (two branches),
  processEvent030 afterWarp=true (final); mechanics combat=false,
  parley=false, echo=false, recoveredDirectorEmpty=true; rewards gil 15000,
  post120ExpMaximum 1760, legacy marks 1000120x1750, old tool Iron Frypan
  6080011 with rewardEraConflict=true.
- `Data/sql/gamedata_quests.sql`: (110440,'Showdown','Cul200',0,20); chain
  110441 prereq 110440, 110442 prereq 110441. No prereq on 110440 itself.
- `Data/sql/gamedata_quest_rewards.sql`: (110440,1,'Gil',1000001,15000,0,
  'wiki',1) and (110440,2,'Currency',1000120,1750,0,'dat-old',1). Both
  autoGrant=1. No EXP row (EXP is script-side), no tool row (frypan omitted).
- `Data/sql/gamedata_recipes.sql` ids 5386/5387 (job H, level 20, kind CC,
  no crystals): 5386 -> 11000069 from 3011524/3011509/3011502/3011529/
  3010609; 5387 -> 11000070 from 3011015/3010603/3011205/3011301/3011506.
  Live mirror: `Data/sql/live migrations/cul_recipes_and_prereqs.sql`.
- Spawns `Data/sql/server_eventnpc_spawn_locations.sql` zone 230:
  charlys 1000138 (-511.16,42.3,27.91), prudentia 1000168 (-507,42.3,40.25),
  pulmia 1000169 (-509.42,42.3,42.9). All public; no private/instance spawn.
- Gathering `Data/gather.csv`: Tiger Cod 3011205 Fish (Limsa Lominsa,
  Bearded Rock, Skull Valley, Horizon's Edge); Cieldalaes Spinach 3011301
  Harvest (Emerald Moss). The other eight materials are normal trade goods.
- Items `Data/sql/gamedata_items.sql`: 11000069 Piping Hot Pie Crust and
  11000070 Aromatic Pate, both Normal/DummyItem.
- Availability `Data/scripts/quests/quest_availability.lua`: 110440 enabled
  ("Showdown [Lv. 20] - Partially implemented - crafting/gathering/
  delivery (Cul200)"); 110441/110442 stay commented.
- Engine `Map Server/Actors/Quest/QuestData.cs`: 4 persisted counters
  (slots 0-3), 32-bit flags (24 persisted). Cul200 uses slots 0-3 exactly
  (0 crust baseline, 1 pate baseline, 2 Prudentia, 3 Pulmia): no violation.
  `onFinish` fires on both complete and abandon (`Quest.cs`).
- Bindings `Map Server/Actors/Chara/ItemPackage.cs`: HasItem/RemoveItem are
  quality-exact; 1-arg/2-arg overloads mean NQ (quality 1). Hence NQ+HQ
  must be probed/consumed separately (helpers do this).

## 2. Web/video evidence (fetched 2026-09-27)

- V12 `https://www.youtube.com/watch?v=hnIFw9aySOk` - "Final Fantasy XIV
  Online - Showdown (R20 Culinarian Quest)". Closes the pack V11 gap ("no
  1.0 Culinarian quest video found"). Page fetch returns title only (no
  transcript); logged for sequence/dialogue-flow reference, never for
  positions/actors per policy.
- A7 `https://ffxiv.gamerescape.com/wiki/Showdown` (current, marked
  OBSOLETE/REMOVED): issued by Charlys; Culinarian; Non-Combat; Class Quest;
  unlocks Mystery of the Gastronome Gone Home; required items list = all ten
  materials + Piping Hot Pie Crust (Aromatic Pate output missing from the
  list: page-data gap, not a design signal); guaranteed reward Iron Frypan;
  journal = the same four entries as A8; walkthrough: talk Charlys, talk
  Prudentia cutscene, "choose to help either Prudentia or Pulmia", gather
  per-choice ingredients (both five-material sets match the recovered
  recipes exactly), synthesize, talk to the chosen person (cutscene, then
  "enter an instance"), walk out main door, left down ramp, cutscene near
  Prudentia.
- A7b `.../wiki/Showdown/Plot_Details`: Part 1 Charlys offer (join guild,
  speak with the two chefs); Part 2 joint intro + 30-serving seaspray quiche
  rivalry order; Part 3 Prudentia branch ("chose to assist me over Pulmia",
  "whip me up a piping hot pie crust", Refuse/Accept, "Here''s the recipe!");
  Part 3 Pulmia branch (aromatic pate, Refuse/Accept); Part 4 Prudentia
  ("Finished!", victory, Wyrstmann 40 more servings requested Pulmia oversee,
  Prudentia fatigued); Part 4 Pulmia EMPTY (no lines logged); Part 5 Prudentia
  rear-exit scene (taste test, presentation talk, "Take this as a token").
- A8 `https://finalfantasy.fandom.com/wiki/Culinarian_Quests_(version_1.0)`
  Showdown section: level 20, assigned by Charlys, rewards Bismarck Linkpearl
  + Iron Frypan + ~20,000 gil + ~1,760 EXP (all "~"-marked: approximate-only
  per pack policy); location Bismarck, Limsa Lower Decks (7,3); preceded by
  Fade to White, followed by Cul300; four journal bullets matching A7.

## 3. Conflict resolutions (machine data wins)

- Both-required vs exclusive choice: KEEP both-required. DAT read (asks
  100/104 are per-branch accepts, state 5 needs BOTH order-free) plus two
  recovered branch counters (slots 2+3, values 5/10/15) outweigh the A7
  walkthrough ("choose either") and the Part 3 "over Pulmia" flavor line.
  The walkthrough author plausibly ran one branch; Part 4 Pulmia is empty,
  so the Pulmia path was never fully documented. No code change.
- Final owner Charlys vs Prudentia: KEEP Charlys final (processEvent030) as
  documented best effort. Template marks finalInteractionActorUnresolved;
  A7/A8 point to a Prudentia rear-exit finale, but text never closes actor/
  trigger gaps per policy, and no Prudentia-finale scene binding or
  instance/area owner is recovered. The afterWarp=true flag is consistent
  with the A7 "enter an instance" step, but the warp destination is
  unresolved and the director is recovered empty, so no instance is built.
  No code change; gap recorded below.
- Recipe grant ("Here''s the recipe!"): no grant owner/mechanism recovered;
  recipes stay globally registered (5386/5387) so synthesis works. No code.
- Gil 15000 (central) vs ~20000 (A8): KEEP 15000. A8 is "~"-marked
  approximate-only; central row source is 'wiki' (contemporary). No change.
- Prereq Fade to White (A8 "preceded by", 110013 Man200): KEEP prereq 0.
  Only Alc200 asserts 110013 in SQL; no Cul200 prereq is asserted anywhere.
  No change.
- Linkpearl (A8 "Bismarck Linkpearl"): id unresolved pack-wide; not granted.
  Iron Frypan: reward-era conflict stands; not granted. No change.

## 4. Implementation contract (cul200.lua + helpers)

Flow: Charlys offer (CUL20, delegateEvent processEventCharlysStart, accept
iff return==1 and AcceptQuest) -> snapshot baselines (counters 0/1) and
challenge flags (counters 2/3 = 5), sequence 5 -> per customer: deliver
(NetGain>=1 AND Count>=1, delegateEvent delivery scene, CulConsumeItem 1,
counter 10) then verdict on next talk (delegateEvent verdict scene,
counter 15, announce when both done) -> Charlys final when both >= 15
(delegateEvent processEvent030, CompleteQuest, AddExp 1760) -> onFinish
consume-all cleanup. Scene packing: 010/017 Prudentia, 015/020 Pulmia
(numeric-order best effort). Markers: 01 offer, 02-07 branches (range),
08 final. Journal: sequence, done(0-2), 0, 0, 2. ENPCs: TALK on route
owners, REWARD on Charlys when ready; every talk path UpdateENPCs +
EndEvent; class+level gate on all paths.

## 5. Edge cases (all covered; see edge_cases.csv)

Pre-cooked denial, HQ delivery (NQ+HQ probe/consume), traded-dish credit,
extra-cook leftovers, abandon/reaccept baselines, early-final refusal,
class-change mid-quest, consume-failure hold, no-grant inventory safety,
journal/marker mapping, offer-decline retry, verdict repeatability,
complete+abandon cleanup (2026-09-27 fix: onFinish consume-all NQ+HQ
multi-copy via CulCountItem/CulConsumeItem; prior remove-1 left HQ and
multi-copy leftovers). No synthesis callback exists: snapshot-diff is the
pack-wide model, matching etc-delivery behavior.

## 6. Verification (this pass)

- tools/test_quest_counter_slots.py PASS (521 scripts, slots 0-3 fit).
- tools/validate_quest_availability.py valid (524 rows, 78 enabled).
- tools/validate_crafting_retail.ps1 PASS (249 + 443 + 93).
- mooncheck (MoonSharp 2.0) cul200 all entry points PASS (staged synced).
- /tmp/cul-verify/simulate_cul.py 3/3 PASS (cul200 walk incl. gates+cleanup).
- Not performed: in-game client play (no client automation here).

## 7. Remaining gaps (do not flip on conjecture)

Linkpearl item id; per-scene branch binding (range-recovered); marker
mapping (range-only); afterWarp destination; Prudentia-finale ownership;
instance/private-area owner (director recovered empty); recipe-grant owner;
exact EXP scaling (1760 is the post-1.20 maximum); Charlys reminder flavor
($E1($E8(1),0)) has no server binding.