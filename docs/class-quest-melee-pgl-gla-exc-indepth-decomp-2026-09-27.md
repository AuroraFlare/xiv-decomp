# Melee class quests (PGL/GLA/EXC 200/300/306) indepth decomp + implementation — 2026-09-27

Pack: 9 quests, IDs 110060–110102. Machine tables: `outputs/class-quest-melee-decomp-20260927/`
(`sequences.csv` 74 rows, `process_events.csv` 77 rows, `markers.csv` 180 rows,
`actors.csv` 46 rows, `fight_waves.csv` 13 rows, `rewards.csv` 30 rows).
CSVs built by `tools/build_class_quest_melee_decomp.py` (DAT markers + SQL
rewards/mobs parsed from `FF14-Memory`; sequences/events/actors curated from
the sources below). Kind column in `markers.csv` is the DAT row kind
(`MapMarkerQuest` = live, `MapMarker` = filler aliasing `@5208/i11000101`).

Parent docs (do not duplicate): `class-quest-20-30-36-master-index-2026-09-27.md`
(worker split), `class-quest-20-30-36-global-chocobo-fight-audit-2026-09-27.md`
(stub-vs-full, no-chocobo verdict), `class-quest-20-30-36-reward-marker-event-audit-2026-09-27.md`
(central-vs-Lua rewards, template-vs-bespoke event truth).

## Sources (all nine)

- Wiki function lists: `FF14-Memory/meteor-wiki-quests/quests-archive.md` §§20–28
  (offer/requirements + full `processEvent*` inventories per quest; Pgl200 §20
  has per-event notes, §§21–28 are name-only lists).
- Template configs: `FF14-Memory/Data/scripts/quests/class_quest_template.lua`
  (`Pgl300`, `Pgl306`, `Gla200`, `Gla300`, `Gla306`, `Exc200` entries +
  `CLASS_QUEST_DECOMP_EVENTS` accept/complete hooks + `InitClassQuest` driver).
- Bespoke bodies: `Data/scripts/quests/pgl/pgl200.lua`,
  `Data/scripts/quests/exc/exc300.lua`, `Data/scripts/quests/exc/exc306.lua`.
- Directors: `Data/scripts/directors/Quest/QuestDirectorClassPgl200.lua`,
  `Pgl300`, `Pgl306`, `Gla200`, `Gla300`, `Gla306`, `Exc200`,
  `Exc306Survival`, `Exc306Rematch` (+ `gc_sqb_runtime.lua`, `private_quest_battle.lua`).
- DAT: `FF14-Memory/docs/Dat Mining/quest_marker.csv` (exact X/Z/display/region/area).
- SQL: `gamedata_quests.sql` (ids/names/levels), `gamedata_quest_rewards.sql`
  (central gil/marks/Exp/items), `server_battlenpc_mob_types.sql` (levels/skills),
  `server_eventnpc_spawn_locations.sql` (public spawns, trigger rows).
- Handoff: `FF14-Memory/docs/class_job_quest_implementation_2026-08-23.md`
  (Gla200/300/306, Pgl300/306, Pgl200, Exc200/300/306 sections; its "(enabled)"
  labels predate the current availability tightening — see §10).

## 1. Offer conditions

| Quest | Class | Level | Offer actor | Availability |
|---|---|---|---|---|
| 110060 Pgl200 | PUG (2) | 20 | Gagaruna 1000862 | Implemented, disabled |
| 110061 Pgl300 | PUG (2) | 30 | Gagaruna 1000862 | Implemented, disabled |
| 110062 Pgl306 | PUG (2) | 36 | Gagaruna 1000862 | Implemented, disabled |
| 110080 Gla200 | GLA (3) | 20 | Lulutsu 1000863 | Implemented, disabled |
| 110081 Gla300 | GLA (3) | 30 | Lulutsu 1000863 | Implemented, disabled |
| 110082 Gla306 | GLA (3) | 36 | Lulutsu 1000863 | Implemented, disabled |
| 110100 Exc200 | MRD (4) | 20 | Waekbyrt 1000003 | Implemented, disabled |
| 110101 Exc300 | MRD (4) | 30 | Waekbyrt 1000003 | Implemented, disabled |
| 110102 Exc306 | MRD (4) | 36 | Waekbyrt 1000003 | Implemented, **enabled** |

Wiki requirements match (Level 20/30/36 + class). No quest chains a prior-quest
completion check in Lua (retail chain order is availability/journal order, not a
server gate — same as all other class packs). No chocobo offer path anywhere.

## 2. Pgl200 — The House Always Wins (110060, bespoke)

Flow: Gagaruna offer (`processEventGagarunaStart`) → Titinin seq 0 (Platinum
Ledger message 25246) → Esperaunce ×3 talks (counters; 3rd plays
`processEvent020`, advances to seq 10) → private-area 5 coin pickups
(identity flags 0–4, `pgl200_coin_1..5`) → Esperaunce completion
(`processEvent020_2` + `processEvent030`, King-of-Plots gil message, warp to
public) → Wise Miser seq 15 (`processEvent040` ask: `paid==1` advances, decline
holds with UpdateENPCs+EndEvent) → PGL trigger seq 25 (`processEvent050`) →
Singleton seq 30 (`processEvent050_4` confirm → `processEvent060` → private
Toothless Gladiator) → Titinin reward seq 35 (`processEvent070` + `sqrwa 1760`).
Full event inventory (wiki §20 + `process_events.csv`): offer/010/020/020_2/030/
040/050/060/070 + ambient 005_2..005_8, 010_2..010_5, 060_2..060_8.
Markers (`markers.csv`): 8 live — 11006001 Titinin (-170.63,117.15,1400021),
11006002 GSM objective (-121.99,257.62,4000257), 11006003/04 Esperaunce
(-125.74,269.17,1000104), 11006005 Wise Miser (0.29,144.53,1400111), 11006006
PGL entrance (-183.53,82.76,4000257), 11006007 Singleton (-191.98,181.33,1000229),
11006008 Titinin reward; 11006009–20 filler.
Fight (`fight_waves.csv`): 2289013 / mob 3108, lv 20, skill list 15, single
kill; `QuestDirectorClassPgl200` (expected 30 → success 35 → retry 30, 600 s,
party 3). Quest `onKillBNpc` inert; only the director credits the private kill.
Edge handling: class+level gates on onStart/onStateChange/onTalk/onPush/journal/
markers (level gate added 2026-09-27 — was class-only); offer accepts nil/1
(template convention, no brick); coin flags prevent double-push progress;
Esperaunce talk-locked until 5/5; stale-actor push retires the actor;
UpdateENPCs+EndEvent on every path; journal returns flag count + 3 counters.
Rewards (`rewards.csv`): central gil 20000 + marks 2000 + Spiked Knuckles
4020208 + Exp 1760 — Lua plays `sqrwa` presentation only, **no `AddExp`**
(no double-pay; verified against `gamedata_quest_rewards.sql`).
Implementation delta 2026-09-27: `REQUIRED_LEVEL=20` + `hasRequiredLevel` on
all six guards; offer nil-accept; "no chocobo" header note. Validator
`validate_pgl200_coin_objective.py` still PASS.

## 3. Pgl300 — Here There Be Pirates (110061, template stub)

Template route: Gagaruna offer → [1] Waekbyrt 1000003 {11006101}
(`processEvent020`) → [2] Mytesyn 1000167 {11006102,11006103}
(`processEvent025` + afterEvent `processEvent030`) → battle {11006103} →
[20] Titinin 1000934 {11006104} (`processEvent040` + afterEvent 050) →
[21] Hurrey 1000603 {11006105} (Echo, requiredResult 1) → [22] Melisie 1001009
{11006106} (Echo gate) → [23] Halstein 1001007 {11006107} (Echo gate) →
[24] Gagaruna {11006108} → reward `processEvent090`. Wiki §21 lists 36 events;
the wired subset above is the route; `010_*/020_*/050_*/060_2/070_2/080_2`
ambient groups stay unbound (Exc300-style, documented in template todo).
Markers: 8 live — 11006101 Waekbyrt (-752.53,382.14,1600217), 11006102 Mytesyn
(-435.20,207.07,1600123), 11006103 ship object (-417,446,4000257),
11006104 Titinin (-170.63,117.15,1400021), 11006105 Hurrey (-178.46,102.62,2200172),
11006106 Melisie (-160.24,115.99,1300104), 11006107 Halstein (-157.08,110.13,1000134),
11006108 Gagaruna (-184.94,108.87,1400019); 11006109–20 filler.
Fight: 5× 2280217 / mob 3066, lv 25, skill 15, requireAllTargets (walkthrough
count, §14); director expected 10 →
success 20 → retry 0. Rewards: central gil 30000 + marks 3000; Lua EXP 3420
(template `sqrwa`+`AddExp`; no central Exp row). Validator
`validate_pgl300_route.py` PASS. Open: ship-object server callback unrecovered
(`QuestObjectPgl300` has none — guarded single interaction is the scaffold);
Hurrey Y/rotation is a placement scaffold.

## 4. Pgl306 — Two Sides to Every Chip (110062, template stub)

Route: Gagaruna offer → [1] Hurrey 1000603 (+actors 1001013) {11006202,11006203}
(`processEvent020`) → [2] 1001013 {11006203} (Echo ask, requiredResult 1) →
[3] push trigger 1000174 {11006204} (Echo gate, requiredResult 1) → battle
{11006204} → [20]/[21] Titinin {11006206} (050 aftermath + 060 report) →
[22]/[23] Gagaruna {11006205} (070 + 080) → reward `processEvent090`. The
`030_2`/`040_2` after-warp twins stay unbound by design (base-vs-twin choice
rule unrecovered; playing a twin without its warp desyncs the client).
Markers: 6 live — 11006201 guild waypoint (-183.53,82.76,4000257, exact match
to trigger 1090042), 11006202 Hurrey (-181.91,70.12,2200172), 11006203
(-181.81,71.35,4000515), 11006204 Silver Bazaar (-1387.26,304.20,4000257),
11006205 Gagaruna (-184.94,108.87,1400019), 11006206 Titinin (-170.63,117.15,1400021);
11006207–20 filler.
Fight: 2× 2289014 / mob 3079, lv 36, skill **14** (only non-15 humanoid list in
this pack), requireAllTargets (walkthrough count, §14); director 10 → 20 → retry 0. Rewards: central gil 36000
+ marks 3600; Lua EXP 4720. Validator `validate_pgl306_route.py` PASS. Open:
4000257 trigger actor-candidate Y/rotation scaffold; client marker X/Z + push
semantics authoritative.

## 5. Gla200 — All Bark and No Bite (110080, template stub)

Route: Lulutsu offer → seq 0 retry/launch → battle {11008001} →
[20] Lulutsu {11008002} (`processEvent020`) → seq 30 reward (`processEvent030`).
`preEvent processEvent010` (gla20010) runs on duty entry. Wiki §23 lists 23
events (offer/010/020/030 + 005_*/020_* ambients); ambients unbound.
Markers: 2 live — 11008001 Coliseum (-187.23,219.73,4000257, same X/Z as the
Man0u1 Coliseum trigger), 11008002 Lulutsu (-193.46,183.65,1500022);
11008003–20 filler.
Fight: 2289006 / mob 3034, lv 20, skill 15, single kill; director 10 → 20 →
retry 0. Rewards: central gil 20000 + marks 2000; Lua item 4030203 + EXP 1760.
Validator `validate_gla200_route.py` is **blocked** (missing
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gla/gla200.lua` in
this checkout — same for exc300/exc306/gla200 only); all non-scenario asserts
 Lua/director/spawn/mob/loot/rewards/markers) verified manually 2026-09-27,
see §11. Open: live entry-scene lifetime; client acceptance.

## 6. Gla300 — Unalienable Rights (110081, template stub)

Route: Lulutsu offer → [1] Miounne 1000230 {11008101} (020) → [2] Willelda
1000242 {11008102} (025 choice, decline holds; afterEvent 030) → battle
{11008103} → [20] J'moldva 1000599 {11008104} (040 Echo + afterEvent 050
linkpearl handoff, same talk — no linkpearl-use command exists) → [21] Lulutsu
{11008105} (055) → [22] Yoyobina 1001076 {11008106} (065 Echo, requiredResult 1
+ afterEvent 060) → [23] Yoyobina {11008107} (070, no gate — pure say chain)
→ [24] Yoyobina {11008107} (080, no gate) → [25] Lulutsu {11008108} → reward
`processEvent090`. Wiki §24 lists 50 events; 070_*/080_* page chains are pure
say rows (no result gate — gating would stall). Marker 11008109 (display
1300015, owner 1000928 cutscene shell, no talk/spawn/event) stays unbound.
Markers: 9 live — 11008101 Miounne (55.94,-1196.44,1300018; Yoyobina stand-in
waypoint), 11008102 Willelda (179.15,-1580.59,1100014), 11008103/04 J'moldva
(195.04,-1591.10,1900046), 11008105 Lulutsu, 11008106 Yoyobina (-186.34,188.81,
1400023), 11008107 Yoyobina 2nd (-195.32,167.68,1400023), 11008108 Lulutsu reward;
11008110–20 filler.
Fight: 2289009 / mob 3062 ("j_moldva"), lv 30, skill 15, single kill; director
10 → 20 → retry 0. Rewards: central gil 30000 + marks 3000; Lua EXP 3420.
Validator `validate_gla300_route.py` PASS. Open: Yoyobina public Y/rotation
(SQL scaffold added by the Gla300 route for live correction).

## 7. Gla306 — Thrill of the Fight (110082, template stub, safe slice)

Route: Lulutsu offer → [1] Yoyobina {11008201} (003 briefing) → [2] Yoyobina
{11008202} (005 ready check, requiredResult 1) → battle {11008208}
(`preEvent processEvent010`/gla30610) → [20] Lulutsu {11008209} (055 report) →
seq 30 authoritative completion. Only the player's challenger is spawned:
2289007 / mob 3035, lv 36, skill 15. The second SQL identity 2289010/3033
(bladedancer) is the *observed next match* per dialogue, kept scene-only —
never a fabricated two-target duty. The remaining chain (020/gla30620,
020_999/gla30615, 023, 024 Echo ask 51030, 025, 030/gla30630, 040/gla30640, 045
Echo ask 51030, 050/gla30650; markers 11008203–07) is inventoried in the
template `documentedUnboundChain` and needs a dedicated Echo/past-area director
before wiring. Markers: 9 live (11008201/02 Yoyobina briefing spot, 11008203
Yoyobina 2nd (-177.12,221.19), 11008204/07 challenger-family displays
(4000191), 11008206 guild waypoint (-185.26,179.74,4000257, exact guild-trigger
match), 11008208 Coliseum/battle (-1342.94,487.89,4000257), 11008209 Lulutsu
reward); 11008210–20 filler. Rewards: central gil 36000 + marks 3600; Lua EXP
4720. Validator `validate_gla306_route.py` PASS.

## 8. Exc200 — Bloody Baptism (110100, template stub)

Route: Waekbyrt offer → [1] Nunuba 1000004 {11010001} (015 briefing,
requiredResult 1) → battle {11010002} (`preEvent processEvent020`) →
[20] Nunuba {11010003} (030 + afterEvent 040) → reward `processEvent050`.
Wiki §26 lists 28 events (010_2..010_18, 015_2/3, 040_2/3 ambients unbound;
Trident Map handoff + Waekbyrt 040_2 lines unbound). Markers: 3 live —
11010001/03 Nunuba (-753.44,398.01,1500015), 11010002 tower duty
(-797.86,-673.74,4000257); 11010004–20 filler.
Fight: 7× Tower Lemming 2204003 / mob 3129, lv 15, + Lord of Swiftperch
2204004 / mob 3130, lv 20 — single wave, `requireAllTargets` (Lord counts as 1
of 8); skill-list field 5039 on both rows; offsets are adapter formation, not
retail tower layout. Director 10 → 20 → retry 0. Rewards: central gil 20000 +
marks 2000; Lua item 4040405 + EXP 1760. Validator `validate_exc200_route.py`
PASS. Open: wave order unrecovered (single wave is the documented default).

## 9. Exc300 — Two-man Crew (110101, bespoke, no battle)

Journal-ladder design (client keys text off sequence, mirrored exactly):
0 (row 35, find Rostnsthal) → 5 (row 36, steal loot) → 7/8/9/10/11 (row 37,
one state per pickup; 11 transient, passed through to 12 in the same push) →
12 (row 37, report) → 15 (row 38, sell) → 16 (row 39, reward).
Flow: Waekbyrt offer (nil/1 accepts) → Rostnsthal briefing (020, `==1` gates)
→ 5 distinct valuables via 1090199 triggers (`exc300_valuable_1..5`, zone 230):
11000032 Mirage Token / 11000033 Deepred Ruby / 11000034 Skull Island /
11000035 Aged Rum / 11000036 Sourleaf, each with a `trialObject` flavor variant
(spot→variant mapping scaffold {1,2,3,1,2}) → 5th push fires 011→012, retires
pickups, exposes Rostnsthal → report 022 (pure say, no gate) → Rorojaru sale
025 (consumes held loot so a lost item never softlocks; grants Ship Funds
11000131 once) → Waekbyrt reward 030 (consumes funds; `sqrwa` + `AddExp 3420` —
no central Exp row). Identity flags 0–4 stop one trigger farmed 5×; unknown/
spent actors despawned + EndEvent. Ambient groups
010_2..010_14/020_2..020_7/022_2..023_7/025_2..025_9 unbound (owners unrecovered).
Markers: 6 live — 11010101 Rostnsthal (-784.81,386.61,1600150), 11010102 den
(-417,446,4000257), 11010103 guild-door waypoint (-753.29,368.39,4000257, exact
`push_mrd` 1090026 match — waypoint, not objective), 11010104 report,
11010105 Rorojaru (28.93,109.69,1400067), 11010106 Waekbyrt (-752.53,382.14,
1600217); 11010107–20 filler. No director, no mobs (stale "8-Lemming" xtx
metadata rejected). Validator `validate_exc300_route.py` blocked on the same
missing-scenario checkout gap; non-scenario asserts verified manually (§11).

## 10. Exc306 — Captain's Orders (110102, bespoke, reference implementation)

Flow: Waekbyrt offer → quarters door (`exc306_quarters_door`, exact
`push_mrd_outside_upstairs_door` 1090097 match at -779.199,386.500) →
**survival duty** (internal seq 1; `QuestDirectorClassExc306Survival` via
`CreateContentArea` PrivateAreaMasterSimpleContent "exc306survival",
SimpleContentExc306Survival, entry -779.199,16.300,386.500 rot 0 zone 230;
Moenskaet 2289004/mob 32743 lv 40 skill 15; quarters scene exc30610 in-instance;
**survive 300 s** — early kill also advances, no victory branch; death/timeout/
disconnect retries at the door) → warehouse interlude (internal seq 2; barrel
`exc306_warehouse_barrel` spawns beside player in-instance — marker 11010202
(603.58,627.71) has no navmesh/ground in any Limsa frame, so no void room is
staged; barrel cutscene exc30620 grants Kraken Register 11000132 once; full
inventory holds the step for retry) → Waekbyrt warning 035 → lounge trigger
(`exc306_lounge_trigger` -772.36,387.80) confrontation 040 → deck oath 050
(register stays — falls out of pack in rematch) → Waekbyrt routing talk →
rematch doors → **rematch** (internal seq 26; `StartPrivateQuestBattle`
`exc306rematch`: Moenskaet 2289005/32744 lv 36 + right 2280219/32745 lv 34 +
left 2280220/32746 lv 34, all skill 15, `requireAllTargets`; register consumed
defensively on 3rd credit, missing item never fails duty; retry seq 25) →
Rostnsthal report 060 + Echo 070 (ask 51030; explicit 0 holds, nil advances) →
Waekbyrt reward 080 (`sqrwa` + `AddExp 4720`; central gil 36000 + marks 3600).
Markers: 11 live (11010201 door, 11010202 warehouse, 11010203/08 deck,
11010204 guild waypoint = `push_mrd` exact match, 11010205/09 Waekbyrt,
11010206 lounge, 11010207 rematch entry, 11010210/11 downstairs candidates
within 0.3 m of 1090100/1090101 — waypoint-probable, not exact); 11010212–20
filler. Ambient 030/033/000/111/112 unbound. `validate_exc306_route.py` blocked
only on the missing-scenario file; all Lua/director/SQL/marker/reward asserts
verified manually (§11). This quest is the pack's reference: survival,
in-instance interlude, defensive consume, and retry patterns above are the bar.

## 11. Cross-cutting implementation truth

- **No chocobo**: `IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount` scan over
  all 9 quest files + 9 directors = **0 hits** (global audit §2). Text hits are
  doc comments only (Exc300/306 + survival/rematch + Pgl200 header). No goobbue
  hits either.
- **Private-battle shell** (7 kill quests): `StartPrivateQuestBattle` →
  `SimpleContentQuestBattle`; exact actor-class kill callbacks only
  (quest `onKillBNpc` inert everywhere); owner resolved by quest id + expected
  sequence; reconnect rebinds same character id; death/timeout/disconnect/
  area-exit/quest-changed all fail closed to retry (Pgl200→30, Exc306
  rematch→25, rest→0/door). Timeout 600 s everywhere; party cap 3; success
  plays entry/post scenes then `StartSequence` + save + `UpdateENPCs`.
- **Gates**: class+level on onStart/onStateChange/onTalk/onPush/journal/markers
  for all nine (Pgl200 level gate fixed this pack); route steps additionally
  gate on `requiredResult` (decline/0 holds: Pgl200 miser, Pgl300 Willelda…,
  Pgl306/Thm-pattern Echo asks, Exc300 briefing, Exc306 Echo); push triggers
  key on uniqueId, never bare actor class.
- **Exactly-once**: coin/valuable/register identity flags; sale consumes loot
  then grants funds once; rematch consume defensive; completion `sqrwa`+`AddExp`
  only where no central Exp row (Pgl200 is the sole central-Exp quest and
  correctly skips `AddExp`).
- **Event hygiene**: `UpdateENPCs` + `EndEvent` on every path (incl. decline
  holds and spent-actor pushes); private triggers one-shot via despawn;
  directors despawn + `ContentFinished` + `EndDirector` on all exits.
- **Journal/markers**: bespoke journals return counters/flags; template driver
  maps route/battle/post/return sequences to markers; filler ranges rejected
  per quest (62 live / 118 filler across the pack).
- **Availability**: only 110102 enabled; the other eight stay
  Implemented-but-disabled. **No enablement flipped this pack** (per work order).

## 12. Remaining gaps (not fixed — evidence missing)

1. Live-client acceptance for all fights/scenes (positions are adapter
   formation offsets, not retail XYZ; Yoyobina/Hurrey/Silver-Bazaar heights are
   scaffolds).
2. Missing scenario files in *this checkout* block 3 validators
   (`tools/outputs/lpb/decomp_more_20260617/.../gla200/exc300/exc306.lua`
   absent); their non-scenario asserts were verified manually, but the
   validators must be re-run where the files exist.
3. Template completion-item grants (Exc200 4040405, Gla200 4030203) have no
   inventory-full retry (shared driver — changing it affects 100+ quests;
   left for a driver-level pass).
4. Exc300 briefing hard-gates `==1` (nil stalls — safe direction, template
   offer path already nil-tolerant).
5. Unbound-by-design: Pgl300 ship-object callback, Pgl306 `_2` twins, Gla300
   11008109, Gla306 Echo/refugee chain (needs Echo/past-area director),
   Exc300/306 ambient groups, Exc306 warehouse geography/offsets/levels
   (34–40 authored), party cap 3 default.
6. No SQL change this pack (all main-SQL rows present; migrations consistent).

## 13. Tests

FF14-Memory (2026-09-27): `validate_quest_availability.py` PASS (524 rows,
78 enabled); `validate_pgl200_coin_objective.py` PASS;
`validate_pgl300_route.py` PASS; `validate_pgl306_route.py` PASS;
`validate_gla300_route.py` PASS; `validate_gla306_route.py` PASS;
`validate_exc200_route.py` PASS; `validate_class_quest_mob_types.py` PASS
(41 pairs, 24 quests). Blocked (missing scenario files in this checkout, not
code): `validate_gla200_route.py`, `validate_exc300_route.py`,
`validate_exc306_route.py` — non-scenario asserts verified manually against
the same sources (all non-scenario fragment checks green; see temp
`melee_blocked_validators_check.py`). `validate_class_held_routes.py` fails
only on other packs' quests (Alc/Bsm/Cul/Hrv/Min/Gld/Wvr/Tan/Wdk) plus the same
checkout-wide missing `decomp_more_20260617` lua tree — none of the 9 melee
quests appear in its failure list; pre-existing and unrelated to this pack.
No coordinates touched → map-coordinate suites not required.

## 14. Video/retail-evidence pass — 2026-09-27 (footage-authorized work order)

Evidence rule (AGENTS.md): footage and retail walkthroughs may establish
counts, sequences, mechanics, dialogue flow, timing and approximate blocking.
They NEVER yield exact XYZ — no video- or walkthrough-derived position is
presented as recovered retail coordinates, and none was merged into any
recorded-ground layer. All fight-formation offsets below remain explicitly
adapter formation.

### 14.1 Sources located and used

All fetched 2026-09-27. "Used" = informed an implementation or doc change;
"located" = confirms the footage genre exists but was not needed for a
decision.

Used (retail-era text + journal, counts/sequences/mechanics only):

- `https://ffxiv.gamerescape.com/wiki/Here_There_be_Pirates` (+
  `/Here_There_be_Pirates/Plot_Details`) — obsolete-quest journal + walkthrough.
  Establishes: 5 Kraken Deckhands, each level 25, in the Misery hold; ???
  chest spawns the Counterfeit Chip Mold (one mold suffices; killing all five
  also yields one); linkpearl check with Titinin before returning; Echo on
  Mirage pugilists incl. Hurrey/Halstein/Melisie. Formerly-required items list:
  Bronze Kraken Key, Counterfeit Chip Mold.
- `https://ffxiv.gamerescape.com/wiki/Two_Sides_to_Every_Chip` — obsolete
  journal + walkthrough. Establishes: plateau ??? at map cell (12,33), west-side
  entrance; duty is 2 Ossuary Almstakers with Hurrey assisting; Titinin then
  Gagaruna close the quest.
- `https://ffxiv.gamerescape.com/wiki/All_Bark_and_No_Bite` (+ Plot Details) —
  journal + walkthrough. Establishes: single Ala Mhigan Challenger using
  Gladiator abilities, entered through the guild back door; cutscene after the
  kill; Lulutsu reward. Confirms the Gla200 safe slice unchanged.
- `https://ffxiv.gamerescape.com/wiki/Unalienable_Rights` — walkthrough.
  Establishes: single J'moldva (Lancer) spar; "30 minutes to defeat J'moldva"
  (single-source timer, NOT adopted — see HOLD (f)); post-fight ambient NPCs
  (Willelda, Ceinguled, Z'pahtalo, Burchard, Francis) stay unbound by design.
- `https://ffxiv.gamerescape.com/wiki/Thrill_of_the_Fight` (+ Fandom
  `Gladiator_Quests_(version_1.0)` journal) — walkthrough + full journal.
  Establishes the complete Echo-chain order (tourney win → familiar Lalafell →
  challenger Echo + repeat bout → observed defeat → Silver Bazaar Echo →
  Yoyobina messenger scene → Lulutsu reward), which matches the template
  `documentedUnboundChain` order; and a ~25%-HP crowd-performance emote beat
  (no emote-forcing primitive recovered — documented only).
- `https://ffxiv.gamerescape.com/wiki/Bloody_Baptism` — journal + walkthrough.
  Establishes: handful of Tower Lemmings (lv 15) + Lord of Swiftperch (lv 20)
  at Swiftperch Tower (ramp at 17-23); Trident Map handoff; tails as proof.
  Confirms the Exc200 7+1 single wave unchanged.
- `https://ffxiv.gamerescape.com/wiki/Two-man_Crew` — journal + walkthrough.
  Flow matches the bespoke ladder (Rostnsthal → steal → report → fence to
  Rorojaru on Sapphire Avenue → Waekbyrt reward), BUT describes a different
  steal design: 4 interactables (3 chests + crate with a pirate to kill),
  creaking-floorboard fail state (4 noises fail the instance), optional Escaped
  Lemming. The scenario-decomp design (5 named valuables, trialObject
  variants, no fail state) wins as client-code evidence; the walkthrough
  variant is logged as a possible earlier-patch design, HOLD.
- `https://ffxiv.gamerescape.com/wiki/Captain%27s_Orders` — journal +
  walkthrough. Establishes: 5-minute survival vs Moenskaet (confirms 300 s);
  ??? check waking in an empty room; lounge → deck oath flow; rematch vs
  Moenskaet + two henchmen (confirms 1+2); Rostnsthal report + Waekbyrt reward.
  Confirms Exc306 unchanged.
- `https://finalfantasy.fandom.com/wiki/Pugilist_Quests_(version_1.0)` —
  full Pgl300/306 journal text. Confirms route order; Pgl306 journal says "a
  number of pugilists ... fighting against a thaumaturge" (singular) while the
  walkthrough's played count is x2 — walkthrough wins on counts.

Located but not used for decisions:

- YouTube `Final Fantasy XIV 1.0 - Archer Class Quest Cutscenes`
  (`https://www.youtube.com/watch?v=2vNfUJG7ZN4`, uploaded 2012-11-28) —
  era-captured class-quest cutscene footage; proves the genre/medium only.
- YouTube `Final Fantasy XIV 1.0 - Pugilist Class Quest Cutscenes` (title
  confirmed via aggregator 2026-09-27; direct URL not recovered in-session —
  NOT cited for any fact).
- Mirke's Menagerie `FINAL FANTASY XIV 1.0 ARCHIVE` (1,500-page transcript
  compendium, released 2023-08-28,
  `https://mirkemenagerie.tumblr.com/post/726871548870393856/final-fantasy-xiv-10-archive`)
  — logged as a corroboration lead; not parsed in-session (Google-Doc scale).

### 14.2 Gaps closed by this pass (implemented or confirmed)

(a) Pgl300 fight composition: single 2280217/3066 → five spawns of the same
mob row (lv 25, skill 15), `requireAllTargets`, adapter cross formation
(center + 4 corners at ±4 yalms). Template battle block + director CONFIG +
comments; `validate_pgl300_route.py` now asserts 5+5+kill-all. Corroboration:
main-SQL loot already maps mob 3066 → Counterfeit Chip Mold 11000019 at 20%,
i.e. ~1 expected mold over five kills, matching the walkthrough's "only need
one mold". The ???-chest spawn and linkpearl check stay HOLD (no recovered
primitives); the mold remains corpse loot.
(b) Pgl306 fight composition: single 2289014/3079 → two spawns of the same
mob row (lv 36, skill 14), `requireAllTargets`, adapter ±3-yalm pair.
Template + director + comments; `validate_pgl306_route.py` now asserts
2+2+kill-all. Hurrey's in-duty assistance stays HOLD (no ally-combatant
support in the private-battle shell; Hurrey remains a route actor).
(c) Confirmation closes (no code change, recorded so they stop being gaps):
Gla200 single-challenger slice; Exc200 7+1 single wave; Exc306 300-s survival
and 1+2 rematch; Gla306 safe-slice boundary (walkthrough chain order matches
`documentedUnboundChain`, still unwired — HOLD (e)).
(d) CSVs: `fight_waves.csv` rows updated for (a)/(b) + new trailing
`evidence_source` column; `sequences.csv` gains the same column (per-quest
keys). All pre-existing evidence columns byte-identical (rebuild diff shows
only the two fight rows + new columns). No XYZ added anywhere.
(e) Exc300 briefing `==1` gate CONFIRMED CORRECT by scenario decomp (no code
change needed): `exc300.lua` `processEvent020` returns the exc30020 cutscene
result, and the Pgl300 Echo events (`processEvent060/070/080`) show the
retail pattern explicitly — `if worldMaster:ask(...) == 1` plays the
past-area vision, `else return 0`. Only an explicit accept advances;
decline/nil holds the step through the shared UpdateENPCs/EndEvent
fallthrough, mirroring the client's own else branch. Fail-closed and
client-faithful; removed from the HOLD list. (The offer path stays
nil-tolerant per template convention; the in-quest briefing stays strict.)

### 14.3 Still HOLD (with reason)

(a) Yoyobina/Hurrey/Silver-Bazaar Y scaffolds + all adapter formation
offsets: footage/walkthroughs never yield exact XYZ by rule; no
recorded-ground or client floor evidence exists. The Pgl306 (12,33) cell only
corroborates the plateau region the DAT marker already pins.
(b) Gla306 Echo/refugee chain: walkthrough + journal now confirm the full
order, but wiring needs an Echo/past-area director (PrivateAreaPast scenes,
repeat-bout and observed-match staging) that does not exist; the emote-at-25%
beat has no forcing primitive either. Documented, not implemented.
(c) Template completion-item inventory-full retry (Exc200 4040405, Gla200
4030203): shared-driver change affecting 100+ quests; left for a driver-level
pass. No footage evidence of the retail retry path in-session.
(d) ~~Exc300 briefing `==1` hard gate~~ — CLOSED by scenario decomp, see
§14.2(e). (Removed from HOLD; struck rather than deleted for audit trail.)
(e) Pgl300 Echo order aside ("use echo on Hurrey last" in one walkthrough
paragraph) vs numeric event order 060/070/080 = Hurrey/Melisie/Halstein and
the same site's Plot Details listing Hurrey first: sources disagree → keep
numeric order, logged as unresolved observation.
(f) Gla300 "30 minutes" duty timer (single walkthrough line) vs shell default
600 s: single-source, no scenario/corroboration → documented, not changed.
(g) Exc300 4-container stealth-fail variant: contradicts scenario decomp;
possible earlier patch; HOLD pending era-client evidence.
(h) No enablement flipped: Y scaffolds, (b), offsets, (c) all remain (and
the closed (d)/(e) items required no behavior change), so
EXPECTED_ENABLED and `quest_availability.lua` are untouched (only 110102
enabled in this pack).

### 14.4 Tests (2026-09-27, this pass)

FF14-Memory: `validate_pgl300_route.py` PASS (5x),
`validate_pgl306_route.py` PASS (2x), `validate_class_quest_mob_types.py`
PASS (41 pairs, 24 quests), `validate_class_quest_20_30_36.py`,
`validate_quest_availability.py`, `tools/test_quest_counter_slots.py`, plus
the remaining pack validators (pgl200/gla200-306/exc200-306) — see return
report for the full list and results.
