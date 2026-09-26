# Grand Company quests patch 1.16–1.23: in-depth client decomp

Date: 2026-09-25
Scope: every Grand Company quest row in `Data/scripts/quests/quest_availability.lua`
(`grand_company_quests` block) whose patch bucket falls in 1.16–1.23, plus the
patch-context note for buckets with no GC content.

> There are **no** Grand Company quests in `patch_1_16`, `patch_1_17`, or
> `patch_1_17a`. Those buckets hold only `Etc`/`Wld` side/world quests. The GC
> block spans `patch_1_18` → `patch_1_23` (69 named + 33 `[en]` internal rows,
> 102 total). This pass decomps all of them; the depth is on the 1.19–1.23
> routes that are still generic scaffolds, since the 1.18 opening plus the
> campaign/enlistment/side/rank bespoke families already have dedicated docs.

Source precedence (unchanged): Elemen dated archives first for legacy route
facts; `Data/sql/gamedata_quests.sql` for IDs/names/codes/prereqs/levels;
client `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gc?/*.lua`
for methods; `docs/Dat Mining/<code>.csv` for text bindings;
`docs/quest_new_reward.csv` + `gc_quest_template.lua` seal table for rewards;
`docs/grand_company_quests_elemen_ledger_2026-08-22.md` for NPC/coordinate/
encounter/reward inventory; `docs/grand_company_quests_decomp_2026-08-22.md`
and `docs/grand_company_missions_bytecode_decomp_2026-09-04.md` for the
lifecycle/audit contract. No availability, spawn, reward quantity, or battle
implementation was changed by this pass except the explicitly listed inert
event-map additions (still behind `GENERIC_ROUTE_AUDIT_GATE`).

How to read each entry: `ID / Code — Title [patch bucket, Lv, prereq]` →
client file + text sheet → methods → server wiring → actors/BNPCs → rewards →
Elemen route → what is still missing. "Template" always means the inert
`InitGrandCompanyQuest` scaffold in
`Data/scripts/quests/com/gc_quest_template.lua` (officer-only talks + at most
one placeholder kill; `GENERIC_ROUTE_AUDIT_GATE = true` forces the "remains
gated" message and no EXP/gil is paid without a declared source-backed reward).

## 0. Patch map (GC only)

| Availability bucket | GC quests | Status after this pass |
| --- | --- | --- |
| patch_1_16 / 1_17 / 1_17a | none (Etc/Wld only) | noted, nothing to decomp here |
| patch_1_18 | 111401–111404, 111410–111411, 111601–111604, 111610–111611, 111801–111804, 111810–111811 (15 rows) | bespoke or dungeon-gated; see §1 |
| patch_1_19 | 111405–111407, 111416–111418, 111420, 111605–111607, 111616–111618, 111805–111807, 111816–111818, 111820 (20 rows) | campaign bespoke; side 301/302 bespoke; 304 bespoke; 101 scaffolds; see §2 |
| patch_1_19a | 111620 (Gcg304 Gone with the Wind) | bespoke field interaction; see §2.5 |
| patch_1_20 | 111427, 111428, 111627, 111628, 111827, 111828 (6 rows) | 102 scaffolds; 701 bespoke rank; see §3 |
| patch_1_22 | 111419, 111429–111430, 111619, 111629–111630, 111819, 111829–111830 (9 rows) | 303/103/104 scaffolds; see §4–§5 |
| patch_1_22b | 111426, 111431–111432, 111626, 111631–111632, 111826, 111831–111832 (9 rows) | 305/105/106 scaffolds; see §6–§7 |
| patch_1_22c | 111434, 111634, 111834 (3 rows) | bespoke final rank; see §8 |
| patch_1_23 | 111433, 111633, 111833 (3 rows) | 107 scaffolds + prereq inversion; see §7.3 |
| patch_unknown_or_internal | 33 `[en]` rows | evidence-blocked; see §9 |

Chain shapes (from `gamedata_quests.sql`): each company's story spine is
`Com0*1→…→Com0*7 → G*101 → G*102 → G*701 → G*103 → G*104 → G*105 → G*106 →
(G*702 →) G*107`, with the side chain `G*301 → G*302 → G*303 → G*304 → G*305`
branching off the enlistment tier (`G*301` prereq is `Com0*7`). Concretely:
`111416 prereq 111407`, `111427 prereq 111416`, `111428 prereq 111427`,
`111429 prereq 111428`, `111430 prereq 111429`, `111431 prereq 111430`,
`111432 prereq 111431` (Limsa; Gridania/Ul'dah mirror with 1116xx/1118xx).
Side: `111417 prereq 111407`, `111418 prereq 111417`, `111419 prereq 111418`,
`111420 prereq 111419`, `111426 prereq 111420` (Limsa; mirrors elsewhere).
**Inversion:** `111433 prereq 111434`, `111633 prereq 111634`,
`111833 prereq 111834` — the Lv-45 To Kill a Raven rows point at the Lv-50
final promotion rows (`111434 prereq 111432` etc.). SQL is authoritative as
dumped; do not enable 107 without confirming whether retail truly gates
Moonlit Battle behind the final NM or whether the prereq column is mis-ordered.

## 1. patch_1_18 recap (15 rows, not re-decomped here)

Covered by `grand_company_missions_bytecode_decomp_2026-09-04.md` (18-mission
bytecode/scene pass: 128 methods, 1,542 traces, 9 scenes, 60-min Toto-Rak
duration correction). Familiars (`111401/111601/111801` + Hellhound `111804`)
run the private SQB lifecycle; dialogue/contract rows (`111402/111403`,
`111602/111603`, `111802/111803`) are guarded dialogue completions
(250 seals where applicable, 1,100 EXP, no guessed payouts); finales
(`111404/111604/111804`) have distinct predicates (`a ~= 1` / `(0,0)` /
`a ~= 1`) with unrecovered cross-company producers; Toto-Rak (`111410/111610/
111810`) and Dzemael (`111411/111611/111811`) are bespoke dungeon routes kept
disabled pending live verification. No change in this pass.

## 2. patch_1_19 story/side core (20 rows)

### 2.1 Campaign tail — bespoke, gated (111405–111407, 111605–111607, 111805–111807)

Owner split is intentional: `gc_campaign_quest.lua` CONFIGS owns the six
`Com0*5/6` routes; `gc_enlistment_quest.lua` owns the three `Com0*7` rows.
Common runtime: session-bound `call()` + `delegateEvent`, `nearStep()` same
actor/area/zone with `|dy|<=6, dxz<=14`, `historyArgs()` sibling-completion
mapping (producers inferred, native 0..3 / 1..4 branches exact), `complete()`
= evidence + `GrantGCQuestSealsOnce(company,300)` + `CompleteGCQuestOnce(1891)`,
`bridgeEntry` (result 1 → next seq + zone 134 `PrivateAreaMasterPast`
-333,0,-321), paired-actor flags, PUSH battle entry via
`gc_campaign_battles.lua` (1800s, 3-man, Lv 25+, 30-yalm party radius, 45-yalm
boundary, Earthbreaker −50% damage-taken only on that route).

- `111405 Com0l5 An Officer and a Wise Man` (prereq 111404, Lv 25, journals
  283–287, officer 1500199 Guincum, accept `processEventGUINCUMStart`):
  placement zone 130 (669,49.58,-606) marker 11150401 trigger 1099524
  battleSeq 10→20 evidence 11000263; targets 3× 2280222/40206 unruly pirates
  (authored formation); steps 20 paired Merlwyb 1001568 + Urianger 1060009,
  30 Zanthael 1000351 elevator bridge, 40 Y'shtola zone-134 private complete.
  Elemen: Eastern La Noscea (31,24) pirates → Merlwyb/Urianger → Zanthael
  ceremony → Y'shtola. Gap: formation/tuning authored, bridge Y
  layout-derived, no live acceptance.
- `111406 Com0l6 Ceruleum Shock` (prereq 111405, Lv 25, journals 288–292,
  accept `processEventGUINCUMStart {1}`): placement zone 172
  (-2189,14.13,-425) trigger 1099521 seq 10→20; exact 4-target roster
  2289026–2289029/40201–40204 (Bladedancer/Lightspinner/Speardancer/
  Shadowspinner); steps 20 Aisborgsyn 1001749, 30 zone-170 trigger 1099522
  `processEvent_010 {1}`, 40 Cid zone 133 `processEvent_015 history=l6`
  (numeric 1–4). Elemen: ferry-dock fight → Aisborgsyn → Central Thanalan
  (24,23) → Cid. Gap: history producer inferred.
- `111407 Com0l7 Till Sea Swallows All` (prereq 111406, Lv 25, journals 293):
  enlistment row; `processEventGuincamStart` (note spelling) / `...End (0,0)`;
  1,000 seals + 1,080 EXP + `TryJoinGrandCompany(1)` rank-11 presentation.
  Needs live enlistment/cutscene smoke.
- `111605 Com0g5 Their Finest Hour` (prereq 111604, Lv 25, journals 351–355,
  officer 1500200 Fulke, accept `processEventFulkeStart`): placement zone 154
  (1605.01,0.12,1275.28, user-corrected Y) trigger 1099527 seq 30→40 item
  11000272 Earthbreaker vs actor 2208903; single Clay Golem 2208903/40207
  (node 3710 Y); steps 10 trigger 1099526 afterWarpHandoff, 20 Papalymo
  three-phase 010/011/012 + give item, 40 paired ordered Papalymo + Urianger
  complete. Bytecode: ceremony `com0g610` is 005 after-warp; `020(a)` 3-way,
  `030(a)` branched + common row 84. Gap: reusable-item policy + 50%
  vulnerability authored.
- `111606 Com0g6 Appetite for Destruction` (prereq 111605, Lv 25, journals
  339–342, accept `processEventStart`): placement zone 151
  (1502.14,20.81,-778.19) trigger 1099528 seq 20→30 success `processEventNq`
  scene `COM0G510`; targets 3 authored Diremite variants 2101115/40208,
  2101116/40209, 2101120/40210; access 10/30 trigger 1099531 Stillglade;
  steps 10 Lewin `(1,2)` intro, 30 Cid `history=g6` complete. Recovered
  journals 340–342 disprove the old Toto-Rak assignment. Gap: roster authored.
- `111607 Com0g7 Serenity, Purity, Sanctity` (prereq 111606, Lv 25, journals
  357): enlistment row, company 2, 1,000 + 1,080 EXP.
- `111805 Com0u5 Burning Man` (prereq 111804, Lv 25, journals 424–429, officer
  1500198 Aubrey, accept `processEventAubreyStart`): placement zone 172
  (-2166.41,14.39,-426.45) trigger 1099529 seq 10→20 evidence 11000261 +
  11000262; targets 3× 2280221/40211 imperial pirates (nodes 8618/8620/8622);
  steps 20 paired Thancred + Urianger, 30 Aubrey `020`, 40 trigger 1099530
  zone-209 `025` after-warp (`com0u610` ceremony), 50 Thancred `030 {0}`
  complete. Gap: formation/tuning authored.
- `111806 Com0u6 Know Your Enemy` (prereq 111805, Lv 25, journals 415–418,
  accept `processEventAUBREYStart`): target 2289025/40205 Charledore on node
  6763; steps 10 engineer zone-209 `005`, 30 Cid `010 history=u6`, success
  `processEvent_005_03 {1}` / `com0u510` after-warp. **Blocker:** actor-class
  2289025 is blank/property-zero (display 3280311); raw client shows 300 seals
  but the server must not grant/complete while blocked. Scoped offline
  restoration exists (unique class/name + `QuestDirectorCom0u501` binder,
  gladiator-analog profile explicitly unrecovered); offers stay disabled.
- `111807 Com0u7 By Fire Reborn` (prereq 111806, Lv 25, journals 430):
  enlistment row, company 3, 1,000 + 1,080 EXP (old 5,000 placeholder
  corrected). Chain-gated behind the 111806 blocker.

### 2.2 Ifrit family — scaffolds (111416, 111616, 111816)

- `111416 Gcl101 It Kills with Fire (Limsa Lominsa)` (prereq 111407, Lv 30,
  journals `{295..302,294}` = 8+summary, seals 1,000, no EXP in code;
  markers 0; template `accept = processEventGuincumStart`):
  `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gcl/gcl101.lua`
  (405 lines, text 6976) carries **all three companies**: accepts
  `GuincumStart/FulkeStart/AubreyStart` (each `showQuestInfomation` gate);
  `processEvent_000` reminder; `_010/_010_1` Louisoix briefing (rows 39–59);
  `_030/_030_1…5` six crystal checks; `_050…_050_6` Azab Chah gate
  (worldMaster 109/110/111); `_060/_060_NG/_NQ1/_NQ2` gate/Ifrit;
  `_070/_070_1` debrief (A3/A4 branches); `_080_L/_080_G/_080_U` home-city
  completions. No BNPC/SEQ in client (staging/fades/say only).
  `docs/Dat Mining/gcl101.csv` key rows: 27–37 Guincum accept (Apkallus Falls,
  `VALUE(4)` party); 39–59 Louisoix (receptacle **11000419**, 52 Barometz NW
  Bloodshore/wind, 53 Nest Commander NW Horizon/earth, 54 Queen Bolete SW
  Tranquil/ice, 57–58 Pyrausta/Jackanapes); 64–78 Azab Chah (undying flame,
  cave S of Nophica's Wells, `VALUE(25)` level + `VALUE(4)` party rows
  109–110); 83–108 `_070/_080_L` (Nael/Cid/Limsa, Dalamud intel); 113–179
  Aubrey/Fulke `_080` branches.
  Server placeholder: `GC_BATTLES Gcl101 step 2 bnpc 2207301` (IfritNormal,
  name 3207301, mob type 3056, loot "Bowl of Embers, It Kills with Fire").
  Six NMs (Barometz, Slippery Sykes, Nest Commander, Pyrausta, Queen Bolito,
  Jackanapes) + Azab Chah actor have no actor/BNPC recovery.
  Elemen: Louisoix Gridania (6,2) → six crystal NM checks → Azab Chah →
  Bowl of Embers; four same-company completions first; 1,000 + 3,040 + 1,500
  bonus (EXP/bonus not in code).
  Gap: Bowl duty/director, six NM actors + Azab actor, item 11000419 flow,
  Louisoix actor, party/level/timer gates (4-man, 25+, `$E8(2)`-min + lockout
  per text), completion history.
- `111616 Gcg101` / `111816 Gcu101` (prereqs 111607/111807, Lv 30, journals
  `{363..369,375,362}` / `{438..445,437}`, seals 1,000; Gcu101 markers 15,
  Gcg101 markers 0): client files are **5-line stubs** (`initText = local
  L1_1`, zero `processEvent*`); CSVs are single `テスト` rows. All
  Gridania/Ul'dah Ifrit logic lives in `gcl101.lua`'s Fulke/Aubrey/`_080_G/U`
  branches, but the validator's per-code source boundary forbids copying
  those methods onto `Gcg101`/`Gcu101` dispatch — hence **no template entry**
  for either (unchanged in this pass). Same gaps as Gcl101 plus unwired
  accepts.

### 2.3 Level-25 side pair — bespoke (111417, 111418, 111617, 111618, 111817, 111818)

`InitGrandCompanySidequest` (`gc_sidequest.lua`): fixed 300 seals + 1,891 EXP,
per-quest startActor/offer/reminder/completion/rewardSeq 10/accept+cleanup
items/evidence/journals/markers, private-battle `onPush`, sleep-gated scrap
collection for `gcg301`. Battles in `gc_sidequest_battles.lua` with
`QuestDirectorGcSide*` directors and 30-min timeouts. Contrast for §4/§6:
`303/305` have no battle CONFIG, no items/evidence wiring, and sit on the
generic scaffold — they need this same treatment (battle config + placements
+ items + field actors) before enablement.

- `111417 Gcl301 The Cove` (Clifton 1000199, `CLIFTONStart/_000/_010`, item
  11000407, 6× dart slug 2104217/40301); `111617 Gcg301 Eternal Recurrence`
  (Dyrstbrod 1001079, `DYRSTBRODStart/_000/_010`, charges 11000402 + 3× scrap
  11000401, dreadwolves + scrap actors 1099547–49); `111817 Gcu301 Prying
  Eyes` (Refchild 1000994, `CLIFTONStart/_000/_010`, lure 11000406 + Prism
  Eye 11000405, coblyns + enraged 2102101). Client luas 63/72/77 lines;
  directors exist as 2-line stubs extended by the server-side battle configs.
- `111418 Gcl302 Saving the Stead Instead` (Hastrofwab 1001064,
  `Start/StartAfter/Clear` + Philirskiff optionals) and `111618 Gcg302` /
  `111818 Gcu302` (field-actor + evidence variants) similarly bespoke.

### 2.4 Field-survey 304 trio — bespoke (111420, 111620, 111820)

`InitGrandCompanyFieldInteractionQuest` with objective actors
1090206–8 / 1090209–11 / 1090212–14, evidence items, and guarded 700-seal +
  EXP completions (Limsa 4,450 EXP per Elemen correction). Markers use ENPC
  flags until map coordinates are recovered. No change here.

### 2.5 patch_1_19a (111620 Gcg304 Gone with the Wind)

`111620 Gcg304` (prereq 111619, Lv 45): Alaire → Liflin → three
push/interact objectives, items 11000409–11, events `ALAIREStart/_005/_010/
_015`, bespoke and guarded (700 + 4,450 EXP). The 1.19a bucket holds only
this GC row.

## 3. patch_1_20 (111427, 111428, 111627, 111628, 111827, 111828)

Client luas are pure dialogue+scene scripts (no SEQ/flag/counter logic; SEQ is
server-synthesized `(step-1)*10`). Directors `questdirectorg*10201.luac` are
214-byte registration-only shells. `content_systems_20260612` copies of
`gcl102/103/104`, `gcg102/103`, `gcu102/103` are line-identical to the
`decomp_more_20260617` copies where both exist.

### 3.1 Gcl102 Alive (111427, prereq 111416, Lv 40)

`.../gcl/gcl102.lua` (text 7824, 21 methods): `Start` (2–7,99,
`showQuestInfomation`), `StartAfter` (13), `Myrganmoen/_2` (14–18), `Hidden/
Hidden2/Hidden3` (19–21,91–92,100), `Rashaht/Rashaht2` (A3_22 branch 22/23 +
24–30,102; 31), `NQ` (`gc01l210` warp fade-in), `Cid/Cid2` (75–78,96–98,82–84,
86–88), `Ebrelnaux/Ebrelnaux2` (66–74,101), `Jijina/Jijina2` (60–65),
`Bolaff/Saelbmoht/Sorezari/Myrganmoen3` (50–59,89–90), `Clear` (93–95, salute
schedulers 354111488/354107392). No `ask`.
Template: journals `{317,318,319,320,316}`, seals 1,000, hooks
`accept/acceptAfter/complete = Start/StartAfter/Clear`, device contract
`Gcl102 → item 11000423 rule suppress_reinforcements`
(`gc_device_battle_objectives.lua`; needs `spawnReinforcement` hook +
  reinforcement spawns, none supplied). `docs/Dat Mining/gcl102.csv` (105
  text rows): Guincum accept (Ironworks airship, Cid+Ebrelnaux), Camp Iron
  Lake / R'ashaht Rhiki join, jammer 11000423 briefing (29–31), Gaius/Cid
  Meteor confrontation + tomestone, Nael/Darnus/Allag lore, return fragments.
Elemen (`王狼へのはなむけ`): Guincum La Noscea scene ~(22,7) → 30-min
**Imperial Hoplomachus** battle (20,5) → Cid, Ebrelnaux, Jijina ~(17,6);
1,000 Storm + 4,971 EXP. Gap: no verified fight/content owner, reinforcement
set, or kill/return contract.

### 3.2 Gcg102 Two Vans are Better than One (111627, prereq 111616, Lv 40)

`.../gcg/gcg102.lua` (text 7792, 27 methods): `Start` (2–11,100),
`StartAfter` (14), `Pfrymloef/Arthur/Talloak01/Vevina01/Quinquerol`
(A3 branch 25 vs 22–24 + 26–30,103), `ArthurNQF/Talloak02/Vevina02/
QuinquerolNQF` (31–37), **`PfrymloefNQF`** (`say 38`,
`worldMaster:ask(...,51030,2)` → `runCharaSchedulerPastAreaIn`, returns ask),
`PfrymloefNQ/NQA` (`gc01g210` + 58), `ArthurNQA/Talloak03/04/Vevina03/
QuinquerolNQA/FragC` (59–71, fade), `Lionnellais/Cid/Ebrelnaux/After/Bardo/
After/Clear` (72–97, salute schedulers). Template: journals
`{384..389,383}` (6+summary), seals 1,000, same 3-hook shape; device item
**11000422 rule `protect_wounded`** (wounded actors + recovery timing + poison
targets + mist duration, all unbound). CSV (119 rows): Fulke accept (Arthur/Ala
Mhigo spy, Kan-E elemental warning 8–10, Toro-Moy Battlewarrens SW of Camp Nine
Ivies 11/14); field wounded + Quinquerol mist-emitter handoff (28–30); Gridania
return; dying-Pfrymloef Echo (Gaius-vs-Nael Meteor argument 38–57); report +
Cid-at-Landing redirect (69); Meteor exposition; Yellow Serpent aftermath.
Elemen (`凶鳥の舞`): Fulke → Kankrol ~(46,32) → 30-min **Imperial Equites** →
Frimlroof/Kankrol/Tholl → Landing with Ebrelnaux + Bald. Gap: escort/instance
route — two-van movement, escort failure, wounded/poison bindings; generic
template cannot model it.

### 3.3 Gcu102 Like Father, Like Son (111827, prereq 111816, Lv 40)

`.../gcu/gcu102.lua` (text 7856, 24 methods): `Start` (2–9), `000_2` (10–11),
`000_3/4/5` (`isUpperRank(3,11)` branches 12–18 vs 85–91), `005` (A3 branch
19/20 + 21–27), `010_2` (28–30), `010_3/4/5` (worldMaster 81), **`010`**
(`say 31`, `ask(...,51030,2)` → `runCharaSchedulerPastAreaIn`), `015`
(`gc01u210`), `015_2` (48), **`020`** (49–53, template `report` — "Ryder's
report"), `025_2…8` (54–60, scheduler 354177024), **`025`** (61–76,82–84,
template `complete`), `elevator_nq1F/2F` (`elv0u01a/02a` warp fade-in).
Template: journals `{448..452,447}` (5+summary), seals 1,000, hooks
`accept/ report/complete = Start/020/025` ("015 is the Echo movie").
Device item **11000421 rule `remove_enhancements`**. CSV (90 rows): Aubrey
accept (Silvertear mobilization, Jakys Ryder/Free Brigade, N of Camp Black
Brush); camp flavor; Ryder briefing + device handoff (23–24); interrogation;
Echo movie 31–48 (Cid vs Nael, Meteor/Bozja/Allag); Ryder follow-up (Cid-alive
contradiction → Ul'dah Landing); Landing NPCs; Cid exposition (lunar
transmitter, Dalamud). Elemen (`ふたりの機工師`): Aubrey → Jaqis (27,25) →
item → 30-min **Imperial Hoplomachus** (24,23) → **Imperial Centurion** scene
→ Wellhead/Cid return. Gap: instance/escort route, no content/escort owner.

### 3.4 Promotion trio — bespoke (111428, 111628, 111828)

`initializeMeritQuest` (`gc_rank_quest.lua`): SEQ_ACCEPT officer talk →
SEQ_000 commander briefing → SEQ_010 commence gate (solo-only, `cannotStart`
otherwise) → SEQ_020 merit duty (1,000 merit, targets 125/150/175 for Lv
45/47/49, 30-min deadline split across counters 1/2, content-information
director `g*70101`, party/death/exit reset) → SEQ_030 commander report →
SEQ_040 officer debrief → SEQ_050 salute-gated promotion
(`emoteDefault1` only → `TryCompleteGrandCompanyRankQuest(company,21)`).
Targets: 2206606–8 (Kobold Crags/Rounds/Bedesman, Limsa The Weakest Link) /
2206409–11 (Ixali Rim Cutter/Soil Seer/Cloud Walker, Gridania You Don't Have
the Rite) / 2206525–7 (Amalj'aa Pennoncier/Captain/High Divinator, Ul'dah Gore
a Lizard, Hurry). Journals 6 each; seals 0 (promotion/merit route). Disabled
pending live verification; no change here.

## 4. patch_1_22 side quests (111419, 111619, 111819)

All three client files are full (not stubs); all three server wrappers are
generic scaffolds with placeholder/missing battles. This pass adds the
recovered accept/complete hooks (still gated; field/battle wiring stays
future work).

### 4.1 Gcl303 It's a Piece of Cake to Bake a Poison Cake (111419, prereq 111418, Lv 40)

`.../gcl/gcl303.lua` (63 lines, text 7024): `processEventStart` (A3_4==2 → row
3 else 2; rows 5–11,13–15,17; row 34 with arg; `showQuestInfomation` gate) →
`StartAfter` (20–21) → `Qiqirn` (23) → `Clear` (24–29,31,33; A3_14==0 → 26).
Journals `{304,305,303}` (2+summary); seals 1,000 (EXP 4,260 Elemen-only).
**New:** template now declares
`accept/acceptAfter/complete = Start/StartAfter/Clear` (all verified in this
file; Qiqirn field talk has no generic slot and stays unwired).
BNPC: actor-class 2206305 `/Chara/Npc/Monster/Qiqirn/QiqirnBarehandsGcl303`
(name 3206305, appearance row present) is a **dedicated quest actor**, but
`server_battlenpc_mob_types` has no 2206305 combat profile and there is no
SQB config/placement — the current `GC_BATTLES Gcl303 step 2 bnpc 2206305`
is a placeholder kill, not an encounter. Director
`questdirectorgcl30301.lua` is a 2-line stub.
`docs/Dat Mining/gcl303.csv`: accept variants (member vs graduate), Bismarck
ration + Sweet Biscuit setup, Kikkiroon theft, fake spiced batch, Cedarwood
flight report, `Clear` (R'ashaht Rhiki Storm Commander, fake-cake reveal,
pardon). Giver R'sushmo 1000170 spawn exists (zone 230
-506.15,42.3,33.88) but the template talks to officer Guincum 1500199 — a
giver-binding mismatch to resolve. Elemen: Le Suceemo Upper Deck (7,3) → La
Noscea (33,32), 30-min **Gluttonous Qiqirn** + aftermath; 1,000 + 4,260 EXP.
Missing: SQB config + Cedarwood placement, mobtype/loot for 2206305, Rhiki
field actor, markers (0), EXP seam, Qiqirn wiring.

### 4.2 Gcg303 Woes of the Botanist (111619, prereq 111618, Lv 40)

`.../gcg/gcg303.lua` (110 lines, text 6912, richest of the three): `Start`
(A3_4==1 → 4 else 3; rows 2,5–11,13 + schedulers; accept gate) →
`StartAfter` (16) → `Enie` (17) → `Mog` (scheduler 70057984; A3_14==1 → 42
else 19; rows 18–23) → `Kupo` (24) → `Clear` (two-phase with `_wait(2)`s,
rows 25–40 + salute schedulers 354111488/354107392). Journals
`{391,392,393,390}` (3+summary); seals 1,000. **New:** template now declares
`accept/acceptAfter = Start/StartAfter` alongside the existing
`complete = Clear` (field Enie/Mog/Kupo stay unwired — no generic slot).
No `GC_BATTLES` entry and no recovered BNPC (Migrating Doo / infestation
mobs have no actor rows). `docs/Dat Mining/gcg303.csv`: Aldous/Blue Badgers
accept, wound + infestation plea (Humblehearth SE), `Enie` field, `Mog/Kupo`
powder/surge/barren-ground relay, `Clear` fertilizer confession + maxims +
weed-thinning. Giver Enie 1001806 spawn exists (zone 206 BTN guild
-196.95,18.21,-1486.62; also `DftFst.lua`); Moogle/Kupo + Kuplu Kopo actors
unrecovered. Elemen: Enie (4,3) → Black Shroud (31,33), 30-min **Migrating
Doo** + Kuplu Kopo/Enni scenes; 1,000 + 4,260. Missing: entire battle seam,
markers (0), EXP.

### 4.3 Gcu303 A Weaver and a Mummer (111819, prereq 111818, Lv 40)

`.../gcu/gcu303.lua` (92 lines, text 7136): `processEventCAHERNAUTStart`
(**turn 1**, A3_4==1 → 2+26 else 3+4; rows 27,5–8; accept gate) → `_000`
(11) → `_010` (four `ask(...,13,4)` branches → 18–19 / 20–21 / 22+28+23 /
29+32+30+31; closes 24–25; **returns** ask result) → `_010_1/_020/_030`
**empty stubs** (turn + finish only). Journals `{461,462,460}` (2+summary);
seals 1,000. **New:** template now declares `accept = CAHERNAUTStart`
(`_000/_010` field scenes and the three empty stubs stay unwired).
No `GC_BATTLES` entry, no recovered BNPC (Imperial Centurion patrol has no
actor). `docs/Dat Mining/gcu303.csv`: Sunsilk Tapestries / "Sword and Stone"
play commission, mesa NE of Nophica's Wells, Camp Horizon patrol, four report
branches (comfort/riches, morale, staging, soldier's-eye rewrite).
Giver Cahernaut 1000915 spawn exists (zone 209, 44.52,194.39,242.84). Elemen:
Kahelno (7,5) → Thanalan (19,33), 30-min **Imperial Centurion**; 1,000 +
4,260. Missing: battle seam at the mesa, empty-scene text bindings, markers
(0), EXP.

## 5. patch_1_22 Magitek Vanguard trio (111429, 111629, 111829) + Garuda trio (111430, 111630, 111830)

### 5.1 Gcl103 Deus ex Machina (111429, prereq 111428, Lv 45)

`.../gcl/gcl103.lua` (text 8068, 8 methods): `Start` (2–6, decline 7 vs
accept 8), `000_GUINCUM` (9), `000` (Coral Tower Merlwyb 11–19 + 29–35),
`000_HYLLFYR/EYNZAHR/REYNER` (36–41), `005_NQ` (`gc01l310`; boolean A3 →
default vs after-warp fade), `015_NQ` (`gc01l320`). No `ask`. Template:
journals `{345,346,347,344}` (3+summary), seals 1,500, `accept = Start`
(unchanged). No device contract, no `GC_BATTLES` entry. CSV (65 rows):
Guincum→Coral Tower redirect, Galadion Accord (pirate unification 11–19),
Aleport **Magitek Vanguard** battle + betrayal/retreat (20–35), aftermath
(traitor pirates, Vanguard as new Imperial weapon). Elemen (`開かれた血路`):
gunner-guild Merlwyb → 30-min Vanguard ~(12,23) → report; 1,500 + 5,340 EXP.
Gap: no encounter owner; Vanguard BNPC/battlefield/kill/return unbound.

### 5.2 Gcg103 Shadow of the Raven (111629, prereq 111628, Lv 45)

`.../gcg/gcg103.lua` (text 8036, 6 methods + StartAfter): `Start` (2–9),
**`Senna`** (A3_7/A4_8 2×2 branch → 75/12/13/14; 15–20,
**`askExtendWidget(...,76,...)`** → 21–24 vs 25–26, then 27–31), `Pesi`
(34–35), `Swethryk` (`doSalute(2,45)`, 32/79/33), `StartAfter` (10),
`NQ01/NQ02` (`gc01g310/320`). Template: journals `{472,473,474,471}`, seals
1,500, `accept/acceptAfter = Start/StartAfter` (unchanged). CSV (80 rows):
Fulke→Stillglade Fane redirect (Dalamud/elemental prophecy), Kan-E scene with
Irmin Hedge rite + 4-rank variants, Swethryk warning (Ala Mhigo conscripts),
Crimson Bark battle (bombardment, greenwrath, Vanguard kill, casualty report).
Elemen (`心をひとつに`): Conjurer-guild (2,1) Kan-E → 30-min Vanguard
(17,35). Same gap as Gcl103.

### 5.3 Gcu103 Careless Whispers (111829, prereq 111828, Lv 45)

`.../gcu/gcu103.lua` (text 8100, 11 methods): `000_AUBREYStart` (2–9,86),
`000_AUBREYFollow` (10–11), `000_ELINEAfterOffer` (12–15),
`005_RAUBAHN` (16–24,83,84,65,66 — **no `finishCliantTalkTurn`**, unlike every
other method; do not copy verbatim as completion), `010_NQ_1` (`gc01u320`),
`015_FUMETSU01/02/05` (`isUpperRank(3,27)` branches 67–80), `015_FUMETSU03/04`
(73/74), `025_NQ_2` (`gc01u310`; numbering inverted vs play order). Template:
journals `{567..570,566}` (4+summary), seals 1,500,
`accept = 000_AUBREYStart` (unchanged). CSV (50 rows): Aubrey→Royal Promenade
redirect (Meteor leak, Syndicate, Raubahn summons), Eline intro, Raubahn
briefing (Teledji intel, juggernaut W of Camp Horizon), ferry-dock attack
report (41–44), aftermath (decoy → west/ferry docks, Vanguard credit 81–82,
Monetarist distrust, Meteor insurance). Elemen (`決断の狼煙`): Royal Promenade
(6,5) Raubahn → 30-min Vanguard (7,27) → fallen-sergeant/ferry aftermath
~(5,26). Same gap.

### 5.4 Garuda trio — In for Garuda Wakening (111430, 111630, 111830; prereqs 111429/111629/111829; Lv 45)

Template: seals 2,000 each; journals 8 each
(`Gcl104 {349..355,348}`, `Gcg104 {476..482,475}`, `Gcu104 {559..565,558}` =
7 steps + summary); `GC_BATTLES` placeholder **Garuda 2209501 step 2** for
all three; previously no event hooks for any 104.
**New:** `Gcl104 accept/acceptAfter = Start/StartAfter` (both verified in
`.../gcl/gcl104.lua`; field scenes stay unwired). `Gcg104`/`Gcu104` keep no
entry — both client files are 5-line stubs and both CSVs are single
`テスト,dummy` rows, so even dialogue wiring must reuse Gcl104 only with
company-specific verification (no cross-company copy).
`.../gcl/gcl104.lua` (text 8084, 38 methods, 264 CSV rows) is the only full
source: `HintLim/Gur/Uru` cross-company pre-briefs (2–7/161–166/229–234),
`Start` (A3/A4/A5 branches: A4==2 → 275 else 10; A5 0–3 → 19/20/21/22;
accept/decline 24–25 vs 23), `StartAfter` (27–28), `Ethelinda/Hedeue`
(43–44), `Louisoix01` (**`askExtendWidget(...,205,...)`** → 59–65 vs 66 +
worldMaster 60/63–64/283–284), `Louisoix02/03/04` (67–70, 95–106),
`Guincum01/Fulke01/Aubrey01`, `Cid` (107–123,276), `Merwyb/Eynzahr/Dyrfhund/
Toldha/Nimie/Augustine` (145–157), `Senna/Swethryk/Tegogo/Myno/Portelaine/
Amice` (193–225), `Raubahn/Eline/Roric/Waguda` (264–271),
`Guincum03/Fulke03/Aubrey03` (A3==2 extra line), **`Zanthael`**
(`ask(...,279,2)` → `elv0l110` + `gc01l410`, returns ask), `NQ/NQG/NQU`
(`gc010410/g410/u410`). CSV key rows: officer storm brief (2–7); Louisoix/
Apkallus Falls redirect with 4-variant class/company branch (19–22);
Quarrymill manifestation (29–44); feather analysis → items **11000431**
(Garuda feather) → **11000432**, Howling Eye via Feathergorge NE cave
aetheryte, party 4–8 / Lv 40+ / 30-min + lockout (60–64); Louisoix/Cid/Merlwyb
aftermath (95–150); cross-company hint + lift-gate (275–288: all members need
a Garuda-wakening clear; same-company bonus 284). Elemen shared row:
Louisoix briefing → Quarrymill handoff → Garuda battle ~Coerthas (48,18,
Limsa record) → home-city Cid/leader scene; 2,000 + 6,231 + 2,500 bonus.
Gap: real Howling Eye duty contract (entry/boss-clear/party/cleanup/return);
Gcg/Gcu text unrecovered.

## 6. patch_1_22b level-50 side + messenger/victory (111426, 111431–111432, 111626, 111631–111632, 111826, 111831–111832)

### 6.1 Level-50 side trio (111426, 111626, 111826)

Shared caveat: template assigns all three the same placeholder
`bnpc = 2303003` (TermitePrincessStandard; combat row only in the
`cutters_cry_bnpc_mob_types.sql` live migration, loot-side Lv 59 entry
otherwise). That is the **wrong content** for all three Elemen routes
(open-field 30-min fights, not Cutter's Cry). No 305 battle config, items, or
event wiring existed before; this pass adds the recovered accepts (field
scenes stay unwired).

- `111426 Gcl305 Oil Crisis` (prereq 111420, Lv 50, journals `{307,308,306}`,
  seals 700; EXP 6,600 Elemen-only): `.../gcl/gcl305.lua` (75 lines, text
  7760): `processEventSYNGSMYDStart` (A3_4==1 → 3 else 2; rows 4–12; accept
  gate) → `_000` (16–17) → `_010` (18–22 with waits) → `_010_1/_020/_030/
  _040` **empty stubs**. **New:** `accept = SYNGSMYDStart`. CSV: Naldiq &
  Vymelli commission, **Deadly Nightshade** + oil item **11000429** (Merlwyb's
  pistols 6–7), forge load, Iron Lake east, `VALUE(6)` quota, `Clear` oil
  return + forge pledge. Giver Syngsmyd 1000177 spawn exists (zone 230
  -502.44,42.5,436.76) but template talks to Guincum — giver mismatch.
  Elemen: Singsmid Upper Deck (7,7) → La Noscea (25,8), 30-min Nightshade +
  oil return; 700 + 6,600. Missing: real BNPC/config/placement east of Iron
  Lake, item-11000429 accept/evidence wiring (text-only today), empty-scene
  bindings, markers (0), EXP.
- `111626 Gcg305 A Taste for Death` (prereq 111620, Lv 50, journals
  `{395,396,394}`, seals 700): `.../gcg/gcg305.lua` (80 lines, text 7744):
  `Start` (A3_4==1 → 1 else 2; rows 3–7; accept gate) → `StartAfter` (10+27)
  → `Tall` (11–12) → `Vevina` (13–14) → `Clear` (A3_17==0 → 15 else 16; rows
  17–26). **New:** `accept/acceptAfter/complete = Start/StartAfter/Clear`.
  CSV: Telent elemental omen, vanished logging party + **Dodowani** bowmaker,
  clearing W of Toto-Rak, `Tall/Vevina` field, `Clear` (Flutaint Yellow
  Serpents, magitek-device aggression cause, Tracking-Arrow fail). Giver
  Zuzupojah has **no spawn row**; Tall/Vevina/Flutaint actors unrecovered.
  Elemen: Zuzupojah (6,5) → Black Shroud (38,44), 30-min **Ripe Shrieker**;
  700 + 6,600. Missing: BNPC/config/placement, giver + field spawns, markers
  (0), EXP.
- `111826 Gcu305 Challenge Accepted` (prereq 111820, Lv 50, journals
  `{464,465,463}`, seals 700): `.../gcu/gcu305.lua` (69 lines, text 7776):
  `processEventI_PAGHLOStart` (**boolean** A3_4 → 2 else 3; rows 4–10,27–28;
  accept gate) → `010` (13+29) → `020` (14–26,30–32, long Ryder confrontation
  with schedulers 83972096/83894272/68378624/67731456). **New:**
  `accept = I_PAGHLOStart` (010/020 Ryder scenes stay unwired). CSV: Free
  Brigade manpower + Platinum Mirage debt, Ryder-challenge rumor, mesa S of
  Mythril Pit No.8, dismissal-evidence commission, `020` zombie/bounty/
  challenge-ethic dialogue, command gossip + membership branches. Giver
  I Pagglo has **no spawn row**; Ryder actor unrecovered. Elemen: I Pagglo
  (5,4) → Thanalan (39,30), 30-min **Rotting Servant** + Ryder aftermath; 700
  + 6,600. Missing: BNPC/config/placement, giver + Ryder spawns, markers (0),
  EXP.

### 6.2 Messenger trio — Don't Hate the Messenger (111431, 111631, 111831; prereqs 111430/111630/111830; Lv 45)

Template seals 2,000 each; journals 16 each incl. summary
(Limsa 362–376+361; Gridania 489–503+488; Ul'dah 577–591+576). No battle
placeholder (dialogue/objective chain, not a single BNPC).
`.../gcl/gcl105.lua` (28.8 KB, ~50 methods) is the only full source:
`StartLim/Gri/Uld` + `Guincum/Fulke/Aubrey` officer variants,
`Kinnison/Cid01–10/Senna01–06/Swethryk01–04/Papalymo04/01/03/Pesi/Tegogo/
Portelain/Merlwyb1–4/Eynzahr1–3/Dyrfhund/Augustine/Hyllfyr/Reyner/Raubahn1–4/
Eline1–3/Roric/Lilirito/Teledge/Waguda1–2/Ebrelnaux1–2/Saelbmoht1–2/Shtola1–2/
Yda/Urianger`, `Zanthael1` (`elv0l110` warp ask), `Mumutano01`, `Container`
(widget 51047), `Nq (gc010620)`, `Nq1 (gc010610)`. Template keeps only
`Gcl105 accept = StartLim` (unchanged). `Gcg105`/`Gcu105` are 173-byte
`initText`-only files (text IDs 10304/10320/10464…); their CSVs are single
`テスト,dummy` rows — narrative lives only in Gcl105 and class binding is
unproved, so no cross-company copy. `quest_marker.csv`: 11140501–09 all
fallback; 11183101–04 real (1578,-1169 / 1570,-1129 / 1532,-1120 / -778,383),
rest fallback; template markers l/g 0, u 10. Flow (Gcl105 + Elemen + text):
officer accept with salute + `showQuestInfomation`; cross-city letters
(StartGri/StartUld company-salute variants); Mor Dhona scene ~(16,21); three
VII Legion kills near (7,17) + `Container` inspection; home-city report.
Elemen JP `リムサ・ロミンサの岐路`. Gap: objective chain/party/encounter
contract unproved; Gridania/Ul'dah routes accept-hook names only; Mor Dhona +
Castrum-adjacent placement needed.

### 6.3 Victory trio — United We Stand (111432, 111632, 111832; prereqs 111431/111631/111831; Lv 45)

Template seals 5,000 each (+ 6,231 + 6,000 bonus Elemen-only); journals 5 each
(357–360+356; 484–487+483; 572–575+571). No battle placeholder ("no valid
generic target" — objective is the Transmission Tower, not a BNPC row).
`.../gcl/gcl106.lua` (14 KB, ~27 methods) is the only full source:
`_LimsaHint_Guincum/_GridaniaHint_Fulke/_UldahHint_Aubray`,
`_CommonStart_Jakys_01 + _Follow` (Mor Dhona Jaqis Rider 9,13 with
`CastrumNovumMapWidget` + `showQuestInfomation`), `_CommonInfo_Vevina_01`,
`_CommonNavi_Rashaht/Quinquerol/Jakys`, city warps
(`_LimsaWarp_Zanthael/_GridaniaWarp_Kinnison/_UldahWarp_Mumutano`),
`_CommonInstance_Cid_01/02`, leader instances (Limsa Merlwyb/Reyner/Eynzahr;
Gridania Shinkan/Pesi/Swethryk; Ul'dah Raubahn/Teledji/Eline with A3/A4
company/history args). No template entry for any 106 (unchanged — there is
no `Start` method to bind; adding one would fail the per-code audit).
`Gcg106`/`Gcu106` are `initText`-only (no methods, dummy CSVs). Flow:
home-officer hint → Jaqis common start → Vevina/nav briefings → city warp →
Cid + leader instance → Castrum Novum (5,10) 30-min Transmission Tower
destruction → report. Vevina text (rows 81–90): 4–8 party, L45+, quest-progress
entry gate, 30-min forced exit + lockout, loot-list auto-transfer. Elemen:
Jaqis Rider (9,13) → Castrum Novum (5,10) → tower destruction. Gap: party
director (readiness/leave/wipe/clear/return), Castrum entry/briefing/debrief
binding, warp ownership, 4–8 scaling verification. Existing
`RivenroadEncounter.lua` (normal/hard, 30-min, `CompleteRivenroad`) is
unbound to this quest.

## 7. patch_1_22c + patch_1_23 finale (111434, 111634, 111834; 111433, 111633, 111833)

### 7.1 Final promotion trio — bespoke (patch_1_22c)

`initializeFinalRankQuest`: SEQ_ACCEPT officer talk → SEQ_000 officer talk
(`active`) + target MAPONLY → kill target → SEQ_010 debrief → SEQ_020
REWARD with salute-gated `emoteDefault1` →
`TryCompleteGrandCompanyRankQuest(company,31)` + `complete(previousRank=27)`
+ `CompleteQuest`. Targets: 2100801 Great Buffalo (Limsa Patrol,
Interrupted) / 2110312 Big-hearted Hot Pox (Gridania Cure for the Common Pox)
 / 2102311 Elder Mosshorn (Ul'dah Mess with the Goat, Get the Horns).
Journals 3 each (378–380; 519–521; 593–595); seals 5,000 + 6,600 EXP +
commemorative coin (25k city-Qiqirn exchange per Elemen). Client: 6 methods
each (`Hint`, `Start` salute + `showQuestInfomation`, `000_OFFICER`,
`005 + 005_OFFICER` worldMaster rows, `010(oldRank)` join-effect
`(company,31)` + status widget 31 + salute + 5,000-seal dialog + inform
widget). Disabled pending live NM + salute verification; no change here.
Structurally ahead of §6.2–§7.3 — which makes the §7.3 inversion (§0) the
first thing to resolve before touching 107.

### 7.2 patch_1_23 Raven trio — To Kill a Raven (111433, 111633, 111833; ostensible prereqs 111434/111634/111834; Lv 45)

Template seals 6,000 each (+ 5,340 + 7,000 bonus Elemen-only); journals 9 each
(389–396+388; 551–558+550; 606–613+605); `GC_BATTLES` placeholder step-2
**Nael van Darnus 2210902** (display 3210902); hooks keep only
`Gcl107 accept = StartLim` (unchanged).
`.../gcl/gcl107.lua` (18.7 KB, ~27 methods) is the only full source:
`StartLim/Gri/Uld` + `Guincum/Fulke/Aubrey` reminders, `Kinnison01/02/03`
warp asks, `Merlwyb1/2/3`, `Senna01/02/03`, `Raubahn1/2/3`,
`Eynzahr/Swethryk/Eline`, `Cid01–04` (Cid03 worldMaster 138/139 + scheduler
waits), `Stewart` extended-widget loop + `getTextIdStewart` 164→321 remap,
`Shtola/Papalymo/Yda/Thancred` (Thancred 3-way ask 87), `Nq1 gc010710`,
`Nq2 gc010714` return-value scene, `Kinnison03 gc010750`. `Gcg107`/`Gcu107`
are `initText`-only (no methods, dummy CSVs). Flow: officer accept → Nael
located → emergency Lotus Stand council (Kinnison escort ask) →
Urianger/Allag/Saint Coinach lore → Coerthas Camp Glory SE scout →
Rivenroad/Enterprise Nael sequence → report. Text rows 2–14 (orders), 45–52
(scout), 54–61 (Nael "tower unnecessary / soul offering" + Dalamud feast),
63–94 (prophecy/seventh verse). Elemen: Enterprise/Nael battle after shared
cross-company history; fight-content route, not officer dialogue. Gap:
resolve SQL prereq inversion first; then instance entry/clear/wipe/reset/
return + Rivenroad binding; Gridania/Ul'dah dispatch unproved.

## 8. Internal rows (33 `[en]`, patch_unknown_or_internal)

`Com0*8/9`, `Com5*2–5`, `G*501–603` (11 per company): no title, prereq 0,
level 0 in `gamedata_quests.sql`; generic wrappers exist as scaffolds but
that is not route evidence. No Elemen route is attached. Do not expose,
title, or attach dialogue until client title/event/actor/prereq/reward rows
are recovered. Client `g*501–603.luac` files exist in the decomp tree but
were not promoted to evidence in this pass.

## 9. Changes made in this pass (additive only, still gated)

`Data/scripts/quests/com/gc_quest_template.lua` — `GC_QUEST_DECOMP_EVENTS`
only; no SEQ/marker/reward/spawn/availability change; `GENERIC_ROUTE_AUDIT_GATE`
still `true` so every generic route keeps emitting the "remains gated" message:

- `Gcl303 = accept/acceptAfter/complete Start/StartAfter/Clear` (new; all in
  `gcl303.lua`; Qiqirn field unwired).
- `Gcg303`: added `accept/acceptAfter Start/StartAfter` alongside existing
  `complete Clear` (all in `gcg303.lua`; Enie/Mog/Kupo unwired).
- `Gcu303 = accept CAHERNAUTStart` (new; in `gcu303.lua`; `_000/_010`/empty
  stubs unwired).
- `Gcl305 = accept SYNGSMYDStart` (new; in `gcl305.lua`; `_000/_010`/empty
  stubs unwired).
- `Gcg305 = accept/acceptAfter/complete Start/StartAfter/Clear` (new; all in
  `gcg305.lua`; Tall/Vevina unwired).
- `Gcu305 = accept I_PAGHLOStart` (new; in `gcu305.lua`, boolean member/
  graduate branch; 010/020 Ryder scenes unwired).
- `Gcl104 = accept/acceptAfter Start/StartAfter` (new; in `gcl104.lua`;
  Louisoix/Cid/leader field scenes unwired).

Deliberately **not** added (would violate the per-code source boundary enforced
by `tools/validate_grand_company_quests.py`): `Gcg101/Gcu101` Fulke/Aubrey
accepts (live only inside `gcl101.lua`; local stubs have zero methods),
`Gcg104/Gcu104`, `Gcg105/106/107`, `Gcu105/106/107` (all `initText`-only
stubs with dummy CSVs — no methods to bind; do not copy Limsa methods across
codes).

## 10. Validation

From the repo root (all must pass; no live-client playthrough performed):

```powershell
python -B tools/validate_grand_company_quests.py
python -B tools/validate_quest_availability.py
python -B tools/build_gc_mission_decomp.py
python -B tools/test_gc_mission_decomp.py
```

Plus the GC-focused suites touched by the shared template:
`tools/validate_gc_campaign_events.py`,doc-linked `audit_gc_opening_quests.py`
where applicable. Live acceptance (solo/party/failure/seal-cap retry/NM/
salute/duty scaling) remains open for every route above; offline checks do not
prove rendering, network order, or retail packet behavior.

## 11. Next decomp steps (ordered)

1. Confirm the 107←702 prereq graph against retail evidence before any 107
   work (SQL dump vs Elemen vs client `showQuestInfomation` gating).
2. Give 303/305 the 301-style treatment: SQB battle CONFIG + placements +
   accept/evidence items + field actors + giver-binding fix (Guincum vs
   R'sushmo/Syngsmyd; Zuzupojah/I Pagglo spawns; Rhiki/Tall/Vevina/Flutaint/
   Ryder actors; mobtypes for 2206305 + Nightshade/Shrieker/Servant).
3. Bind the 102 device contracts (reinforcement spawns, wounded/poison/mist
   bindings, enhancement removal) + Gcg102 two-van escort movement/failure.
4. Recover Vanguard BNPC/battlefield/kill/return for 103s; Howling Eye duty
   contract for 104s (Gcg/Gcu text first); party director + Castrum binding
   for 106s; Rivenroad binding for 107s.
5. Re-run §10 after each step; keep offers disabled until wave/escort/pirate/
   Clay Golem/Nine Ivies/ceremony/cleanup/NM/salute/duty owners are live-proof.
