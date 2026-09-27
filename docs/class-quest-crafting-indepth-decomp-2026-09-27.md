# Crafting class quests indepth decomp — 2026-09-27

Pack: WDK/BSM/GLD/TAN/WVR/ALC/CUL 200/300/306 (quest IDs 110300–110442).
Master index: `docs/class-quest-20-30-36-master-index-2026-09-27.md`.
Machine data: `outputs/class-quest-crafting-decomp-20260927/` (`quest_list.csv`,
`sequences.csv`, `branch_counters.csv`, `recipes.csv`, `delivery_consume.csv`,
`markers.csv`, `rewards.csv`, `gaps.csv`).

Sources (FF14-Memory repo): `Data/scripts/quests/class_quest_template.lua`
(recovered rows; inert once bespoke scripts replace the stubs),
per-quest Lua (`wdk/wdk200.lua`, `wdk/wdk300.lua`, `wdk/wdk306.lua`,
`bsm/bsm200.lua`, `bsm/bsm300.lua`, `bsm/bsm306.lua`, `gld/gld200.lua`,
`gld/gld300.lua`, `gld/gld306.lua`, `tan/tan200.lua`, `tan/tan300.lua`,
`tan/tan306.lua`, `wvr/wvr200.lua`, `wvr/wvr300.lua`, `wvr/wvr306.lua`,
`alc/alc200.lua`, `alc/alc300.lua`, `alc/alc306.lua`, `cul/cul200.lua`,
`cul/cul300.lua`, `cul/cul306.lua`, plus the seven `*_quest_helpers.lua`),
`Data/sql/gamedata_quests.sql`, `Data/sql/gamedata_quest_rewards.sql`,
`Data/sql/gamedata_recipes.sql` (ids 5385–5404),
`Data/sql/live migrations/{alc200_prereq_only,bsm_recipes_prereqs_marks,cul_recipes_and_prereqs,tan_recipes,wvr_recipes_prereqs,gld_prereqs_gil,wdk_no_changes}.sql`,
`Data/scripts/quests/quest_availability.lua`, `meteor-wiki-quests/quests-archive.md`
(20/21 titles hit; "Designer Imposters" only under a variant title),
`docs/class_job_quest_implementation_2026-08-23.md`,
per-line HOLD assessments `docs/{wdk,bsm,gld,tan,wvr,cul,alc}_line_HOLD_2026-09-26.md`,
`docs/{culinarian,alchemist,tanner,weaver}_quests_implementation_2026-09-26.md`,
`docs/alc200_sleep_cousin_of_death_2026-09-26.md`.
Availability: only 110420 (Alc200) and 110440 (Cul200) enabled; every other
pack quest stays as-is (no enablement flips in this pass).

## 1. Implementation verdicts

| Quest | Script truth | Status |
|---|---|---|
| Wdk200 The Mouths of Babes (110300) | bespoke HOLD-gated (`WDK200_OFFER_ENABLED=false`) + template row | HOLD (A5) |
| Wdk300 Hide and Seek Shenanigans (110301) | bespoke HOLD-gated + template row | HOLD (A5) |
| Wdk306 Spanning the Spectrum (110302) | bespoke HOLD-gated + template row | HOLD (A5) |
| Bsm200 An Ear for Quality (110320) | bespoke HOLD-gated + template row | HOLD (A5) |
| Bsm300 Song of the Sirens (110321) | bespoke HOLD skeleton + template row | HOLD (A5) |
| Bsm306 The Sound of Silence (110322) | bespoke HOLD-gated + template row | HOLD (A5) |
| Gld200 She Walks in Beauty (110360) | bespoke HOLD-gated + template row | HOLD (A5) |
| Gld300 F'lhaminn's Flower (110361) | bespoke HOLD-gated + template row | HOLD (A5) |
| Gld306 Struck Through the Heart (110362) | bespoke HOLD-gated + template row | HOLD (A5) |
| Tan200 The Silent Partners (110380) | bespoke HOLD-gated + template row | HOLD (A5) |
| Tan300 Designer Imposters (110381) | bespoke HOLD-gated + template row | HOLD (A5) |
| Tan306 Head of the Class (110382) | bespoke HOLD-gated + template row | HOLD (A5) |
| Wvr200 Hoodwinked (110400) | bespoke HOLD-gated + template row | HOLD (A5) |
| Wvr300 Dance the Night Away (110401) | bespoke HOLD-gated + template row | HOLD (A5) |
| Wvr306 A Fruitful Murder (110402) | bespoke HOLD-gated + template row | HOLD, NON-COMBAT (A6) |
| Alc200 Sleep, Cousin of Death (110420) | bespoke + template driver row | ENABLED playable |
| Alc300 The Boy and the Dragon Gay (110421) | bespoke HOLD-gated + template row | HOLD (A5) |
| Alc306 Dream On, Dream Away (110422) | bespoke HOLD-gated + template row | HOLD (A5) |
| Cul200 Showdown (110440) | bespoke, branch counters 5/10/15 | ENABLED playable (reference) |
| Cul300 Mystery of the Gastronome Gone Home (110441) | bespoke HOLD skeleton + template row | HOLD (A5) |
| Cul306 Something in the Soup (110442) | bespoke HOLD skeleton + template row | HOLD (A5) |

Class/level gates: CRP=29, BSM=30/ARM=31, GSM=32, LTW=33, WVR=34, ALC=35,
CUL=36; levels 20/30/36; chain prereqs in SQL (x00→x01→x02 per line;
Alc200→110013 Man200). Every bespoke handler gates class+level (BSM dual
branch locks at accept), calls `UpdateENPCs()` + `EndEvent()` on all
talk paths, and owns `getJournalInformation` + `getJournalMapMarkerList`.
No chocobo: PASS — zero `IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount`
APIs in all 21 scripts; the only "Chocobo" hits are the Tan300 item name
"Leather Chocobo Saddle" and a "chocobo-stable" location comment.
No fake combat: PASS — zero `KillBNpc|SpawnMonster|onKill` handlers in all
21 scripts; Wdk306/Wvr306/Gld300/Tan300 escort-adjacent legs are
explicitly zero-kill (A6).

## 2. Synthesis credit model (all 21 quests)

No synthesis callback exists in the engine, so every crafting objective
uses accept/stage-time inventory snapshot plus a live probe
(`*NetGain` over `*CountItem` against a baseline counter). A quest output
gained while the objective is active counts regardless of how it was
obtained: **traded outputs credit like crafted ones**, matching the
established etc-delivery-quest behavior. Every probe double-checks
`NetGain >= N AND CountItem >= N`. NQ (quality 1) and HQ (quality 4) are
counted/consumed separately; the 3-arg quality overload is capability-
probed once via pcall with NQ-only degradation. Bare `unpack` is never
used (MoonSharp: `table.unpack` only). Wdk200 bows and Tan306 prep sets
use held counts instead (no free baseline slots / archive allows bought
pieces) — marked inline.

Inventory-full handling: every grant goes through `*GrantVerified`
(AddItem, then HasItem verify; on failure a "make room and speak again"
message and NO state advance — retry-safe). Every delivery consumes
(`*ConsumeItem`, NQ-then-HQ, post-probe verified) before advancing; on
consume failure the quest holds with a progress message. Guild-mark
grants on the dual-class BSM line are likewise verified before
`CompleteQuest`. `onFinish` cleans leftover quest items (reference-
consistent remove-1 for Alc/Cul/Bsm200/Bsm300/Alc300/Alc306/Cul200;
consume-all for Wdk/Gld/Tan/Wvr/Bsm306).

## 3. Recipes + material lists (`recipes.csv`)

Main SQL `gamedata_recipes.sql` carries ids 5385–5404 (live migrations
mirror them; `wdk_no_changes.sql` records the intentional Wdk absence):

- 5385 ALC21 CC: 11000077 Potent Medication ← 11000076 Mummified Mole +
  3020401 Eye Drops (+ Water/Lightning shard x1, sibling-mirrored default).
- 5386/5387 CUL20 CC: 11000069 Pie Crust (flour/cinnamon/butter/salt/water),
  11000070 Pate (egg/milk/tiger cod/spinach/garlic).
- 5388/5389 CUL36 CC: 11000073 Foulbelly (mushroom/meat/spice),
  11000071 Devilbelly (foulbelly + Devilshroom x2, repeated slot).
- 5390–5393 BSM20 (B): Naldiq case / trembler / coil / horn (bronze x2,
  bronze x3, iron x2, iron x3). 5394–5397 ARM20 (C): Vymelli case
  (plate+rivets), trembler (plate x2), coil (iron x2), horn
  (iron plate x2 + iron rivets).
- 5398 BSM36 / 5399 ARM36: earplug mold (bronze x2) / casing (plate x1).
  The mold→earplug COMBINE recipe is unrecovered (Bsm306 HOLD).
- 5400 WVR20 CC: 11000054 Red Riding Hood ← ripped hood + cotton cloth +
  red dye + cotton yarn. 5401 WVR36 CC: 11000056 Luxurious Gloves ←
  spider silk + velveteen + cotton yarn.
- 5402 LTW20 CC: 11000045 Repaired Wailer Armor ← damaged + Aldgoat
  Leather. 5403 LTW30 CC: 11000047 Birkin Bag ← toad leather + brass
  ingot. 5404 LTW36 CC: 11000049 Vintage Boots ← damaged boots + boar
  leather.
- Deliberately UNREGISTERED (nothing guessed): Gld200 brooch 11000108,
  Gld300 augite 11000114, Gld306 replica 11000116, Bsm300 windwheel
  11000022, Alc306 salve 11000079 (materials unresolved), ALL Wdk
  outputs (no recovered recipes).

## 4. Branch packing, markers, rewards

- Cul200 (reference): journal states 0/5 only; branch counters slot 2
  (Prudentia) / slot 3 (Pulmia) with 5=challenged, 10=delivered,
  15=verdict-heard; per-customer packing delivery-scene then verdict-
  scene across two talks (010/017, 015/020, numeric-order best effort);
  markers 01 offer, 02–07 branches (range-only), 08 final.
- Bsm200: rolling single baseline + branch lock (counter 1); parts KEPT
  through stages, verified+consumed all-four only at the Mimidoa finale;
  marks move script-side by branch because central marks rows are
  autoGrant-disabled (the central grant cannot branch).
- Bsm306: eight-victim puzzle is an eight-flag machine with one-clue
  enforcement coded but unwired; EARS-slot-17 equip gate via the
  ability-script-precedented `HasItemEquippedInSlot` dot-call.
- Gld200: mid-route 1000 gil granted script-side at the brooch delivery
  while central gil carries 20000 (archived 21000 total preserved).
- Markers are range-only recovered throughout (sequential assignment
  marked inline); contaminated/filler ranges (e.g. 11030007–20,
  11032203/04 replay placeholders) are never sent.
- Rewards (`rewards.csv`): gil + guild marks central per SQL; EXP granted
  in-script at post-1.20 maxima (1760 / 2000-Bsm200 / 3000 / 3420 /
  4720 / 3720-Wvr306). EXP 0 wherever the amount is UNREPORTED (Bsm306,
  Wvr200) — never inferred. Era-conflicted tools (saw, hammers, frypan,
  needle, alembic-aside, dolabra) are NOT granted.

## 5. Why the 19 HOLD quests stay disabled

Per-quest blockers in `gaps.csv` (owners: Parley subsystem + result
mutation; escort/ally-shooter drivers; non-combat SQB lifecycle;
storehouse/object/Echo/private-area owners; exact NPC-variant spawns;
unrecovered recipes/grants). The scripts implement offer/prereq/
baselines/journal/markers/positioned legs/cleanup so each unblock flips
one gate, but no gate is flipped on conjecture.

## 6. Wvr306 is NOT a kill fight (evidence verdict)

Availability labels 110402 "instance", but the recovered record is
explicit: `spiderKillTargetCount = 0`, `spidersAreNarrativeOnly`,
`sqbDoesNotImplyCombat`, both directors recovered empty with likely
purpose "private silk-removal/on-site synthesis lifecycle". The brief
requires "full fight with no loopholes" for the instance part AND
"verify no fake combat": those conflict, and the evidence resolves it —
adding kill targets, enemy roster, or death/retry combat lifecycle would
be invented combat. The script correctly models the non-combat
objective (10-glove snapshot-diff beside Chuchumu, one-at-a-time silk
removal bypassed-not-simulated, Gold Court unroutable) and holds the
instance legs until the silk-removal/synthesis drivers and SQB
entry/success/retry/cleanup lifecycle exist. Same zero-kill verdict for
Wdk306 (Wybir shoots; player supplies arrows) and Gld300/Tan300
cinematic/escort legs.

## 7. Engine constraint found in this pass (QuestData.cs + DB)

Only counter slots 0–3 persist (`counter1`..`counter4`; higher slots are
silently dropped on write and read 0); flags are 32-bit. Two violations
found and fixed/noted:

- wdk200.lua WROTE recovered DAT slots 4 (sturdy discovery) and 5
  (repair outcome) — silently dropped. Fixed 2026-09-27: slots 2/3 stay
  counters; slots 4/5 mirror to flags 0/1 (`FLAG_DISCOVERY_STURDY`,
  `FLAG_SUITABLE_REPAIR`). Guarded by new repo suite `quest-counter-slots`
  (`tools/test_quest_counter_slots.py`, registered in `tests/suites.json`).
- cul306.lua DOCUMENTS DAT slots 4/5/6 (meat/devil/foul) but never
  touches them at runtime (middle states unroutable). Noted 2026-09-27:
  constants marked must-not-use, `FLAG_MEAT` reserved, devil/foul
  progress stays inventory-derived through the baseline diff.
- Same bug class found LIVE in scope-adjacent `min/min200.lua` (parent
  session's active 2026-09-27 WIP, excluded from touching): baselines in
  slots 3–5 mean BASE_WOOD/BASE_EWER (4/5) read back 0, so pre-briefing
  wood/ewer falsely credit. Reported to the parent session with the fix
  sketch (booleans→flags 0–2, baselines→counters 0–2); the new suite
  carries a loud fail-closed exemption for that file until the parent
  lands the fix.

## 8. Verification in this pass

- `mooncheck` (MoonSharp 2.0, entry-point + helper contracts): ALL PASS
  incl. the two edited files (staged copies synced).
- Staging sims: `simulate_wdk.py` 3/3 (scenario updated to flag mirrors),
  `simulate_cul.py` 3/3; alc/bsm/gld/tan/wvr sims untouched and
  previously green per their impl docs.
- Repo: `tools/validate_quest_availability.py` PASS (524 rows, 78
  enabled; availability untouched); `validate_crafting_retail.ps1` PASS
  (249 + 443 + 93); `validate_alc200_route.py` PASS;
  `tests/run.py --audit` PASS (203 candidates, 25 registered);
  `tests/run.py --suite quest-counter-slots` PASS.
- `tools/validate_class_held_routes.py` FAILS pre-existing: it expects
  decomp inputs at `tools/outputs/lpb/decomp_more_20260617/` (absent;
  only an `errors/` dir exists under the sibling path) and expects
  Alc300/Bsm/Cul/Gld/Tan/Wvr/Wdk rows to stay commented — stale for the
  intentionally enabled Alc200/Cul200. Not touched (availability freeze);
  reported.
