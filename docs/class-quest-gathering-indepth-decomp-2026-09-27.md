# Gathering class quests indepth decomp — 2026-09-27

Pack: MIN/HRV/FSH 200/300/306 (quest IDs 110460–110502).
Master index: `docs/class-quest-20-30-36-master-index-2026-09-27.md`.
Machine data: `outputs/class-quest-gathering-decomp-20260927/` (`quest_list.csv`,
`gathering_targets.csv`, `markers.csv`, `rewards.csv`, `events.csv`, `gaps.csv`).

Sources (FF14-Memory repo): `Data/scripts/quests/class_quest_template.lua` (template
rows + `InitClassQuest` driver), per-quest Lua (`min/min200.lua` bespoke 2026-09-27,
`min/min_quest_helpers.lua` new, `hrv/hrv300.lua` bespoke, `fsh/fsh200.lua`,
`fsh/fsh300.lua`, `fsh/fsh306.lua` bespoke HOLD-gated, `fsh/fsh_quest_helpers.lua`;
all other Min/Hrv files are 3-line `InitClassQuest` stubs),
`Data/sql/gamedata_quests.sql`, `Data/sql/gamedata_quest_rewards.sql`,
`Data/sql/gamedata_items.sql`, `Data/sql/server_fishing.sql`,
`Data/sql/server_gathering_item_pools_import.sql` (generated, do not hand-edit),
`Data/sql/live migrations/{min200_route,hrv300_route,fsh200_quest_waters}.sql`,
`Data/sql/server_eventnpc_spawn_locations.sql`,
`docs/Dat Mining/quest_marker.csv`, `docs/class_job_quest_implementation_2026-08-23.md`,
`docs/min200_a_piece_of_history_2026-09-26.md`.
Availability: `Data/scripts/quests/quest_availability.lua` — only 110500 enabled;
all other pack quests stay as-is (no enablement flips in this pass).

## 1. Implementation verdicts

| Quest | Script truth | Status |
|---|---|---|
| Min200 A Piece of History (110460) | bespoke `min/min200.lua` + `min_quest_helpers.lua` (2026-09-27), template row kept as decomp source | Implemented, offer disabled (class-quest convention) |
| Min300 Little Saboteurs (110461) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Min306 Runaway Little Girl (110462) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Hrv200 Gridanian Roots (110480) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Hrv300 The Grass is Always Greener (110481) | bespoke `hrv/hrv300.lua`, no template row (Exc300 precedent) | Implemented, offer disabled |
| Hrv306 A Moogle Bouquet (110482) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Fsh200 To Fight a Fishback (110500) | bespoke `fsh/fsh200.lua` + helpers, template row kept | Implemented, ENABLED |
| Fsh300 The Beast of the Barrel (110501) | bespoke HOLD-gated (`FSH300_OFFER_ENABLED=false`) + template row | HOLD (see §5) |
| Fsh306 Polishing the Mast (110502) | bespoke HOLD-gated (`FSH306_OFFER_ENABLED=false`) + template row | HOLD (see §5) |

Class/level gates: MIN=39, BTN=40, FSH=41; levels 20/30/36. Every bespoke
handler gates class+level, calls `UpdateENPCs()` + `EndEvent()` on all talk/push
paths, and owns `getJournalInformation` + `getJournalMapMarkerList`.
No chocobo: PASS — zero `IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount`
APIs in all pack scripts; Min300 "Chocobo Stables"/"chocobo-carriage driver"
hits are marker-role/doc text only (§6).

## 2. Min200 — bespoke baseline promotion (this pass)

Live route was the generic driver (owned-inventory gate, no pre-brief
exclusion). The bespoke file adds, without changing the template row,
markers, pools, rewards, or availability:

- Briefing snapshot: `processEvent010` at Z'ssapa stores owned
  Sheep's-eye / Petrified Wood / Ewer Fragment into counters 3–5.
  Credit per find = `max(0, owned - baseline)` (`MinNetGain`).
- Delivery: `processEvent020` always plays; obtained flags land in
  counters 0–2 (driver/DAT `$E8(2..4)` slots preserved); only a full
  pack consumes one of each (`MinConsumeItem`) and advances to the
  Linette reward (`processEvent050` + `CompleteQuest`; gil/marks
  central). Partial pack holds with a "Finds appraised: n of 3" message.
- Markers: 11046001 briefing/list; 11046006/07/08 mining; 11046003
  appraisal when ready (DAT appraisal marker, previously shadowed by
  the driver showing areas); 11046005 Linette reward.
- Journal computes the same flags live (no stale pre-talk state).
- `onFinish` keeps finds (standard item-objective behavior);
  re-accept re-snapshots at briefing. NQ-only (quantities convention).
- Unbound (unchanged): 017_A/B/C branches, Nenekko 030/035/040
  interlude, Prospect/Lay-of-the-Land gating, EXP, Iron Dolabra.
- No `onGather`: C# fans out only `onFishCatch`; credit is snapshot-only.

## 3. Gathering targets, waters/nodes, pools

Full table: `gathering_targets.csv`. Pool/migration truth:

- Min200: pools 30061 (Black Brush, z170) / 30071 (Drybone, z171) /
  30081 (Horizon's Edge, z172), all three finds in all three pools
  (authored; no source fixes per-area mapping), weight 100, sweetSpot
  NULL. Rows live ONLY in `live migrations/min200_route.sql`; the
  generated import is untouched (generator cannot emit gather.csv-absent
  items and requires aim rows). Main-SQL updater gap accepted per the
  reviewed Min200 doc.
- Hrv300: pool 20123 Bentbranch logging (z150, branch, nearest node
  27.5 yalms) + pool 20203 Humblehearth logging (z150, nut, 115.7
  yalms). Rows ONLY in `live migrations/hrv300_route.sql` (same
  generated-file rationale).
- Fsh200: Pixie Remora 11000127 in pools 10051 (z128), 10061 (z129),
  10081 (z130) IN main `server_fishing.sql` (lines ~194-196) plus the
  `fsh200_quest_waters` migration mirror. Five DAT waters =
  markers 11050004–08.
- Fsh300 catch species (3011201/3011205/3011208) swim in normal pools
  (main fishing SQL); the Barrel has no pool of its own (HOLD).
- Fsh306 sale fish (3011213/3011203/3011209/3011217/3011225) swim in
  pools 10061/10081/10151/30081 (main fishing SQL).
- Hrv200: NO pool carries Spiny Turnip Leaves 11000018 anywhere
  (verified 2026-09-27). DAT area marker 11048002 (1449,920) is South
  Shroud regional frame (mapArea 305 → zone 154 field map fst0Field05;
  point falls outside every Shroud zone texture, i.e. regional-frame
  coords); no place-2011 gathering pools/points exist in main SQL at
  all. Binding needs a gathering-expansion workstream (new pools +
  points + recorded ground), not a quest-script edit. This is the
  long-pole HOLD blocker alongside the unresolved weed/leaf count.

## 4. Delivery/consume accounting, rods/tools, EXP

Full table: `rewards.csv`. Per-quest:

- Min200: consume 1×3 on full pack; grant nothing (Iron Dolabra era
  conflict); EXP 0 (post-1.20 amount unresolved); central 20,000 gil +
  2,000 Miner marks (1000121).
- Min300/Min306/Hrv200/Hrv306: no live delivery (HOLD); central gil +
  marks only (30k/3k, 36k/3.6k, 20k/2k, 36k/3.6k). Min306 Master of
  Rock command 29724 documented, ungranted. Hrv200 Brass Hatchet
  7020011 + Greatloam Growery Linkpearl documented, ungranted.
- Hrv300: seven atomic exchanges (branch+nut→ink; ink held through
  Parley, ink+tale→olives+letter; olives consumed at Linette's marker;
  letter→ceruleum; ceruleum→Opyltyl). Grant-before-consume with
  `grantOnce` guards (no retry flag needed: grants are idempotent
  possession checks). EXP 0 (DAT max 3,420 unresolved); 30k/3k central.
- Fsh200: grant Yew rod 7030011 BEFORE consuming 5 remora, with
  `FLAG_ROD_GRANTED` retry flag; EXP 1760 + `sqrwa`; 20k/2k central.
- Fsh300 (HOLD): feed/message/subligar trade chain wired; subligar
  8050521 retained; EXP max 3,420 unresolved; 30k/3k central.
- Fsh306 (HOLD): sale consumes 1 assigned fish, pays vendor sellPrice
  (authored); 3 Echo gates result-1; EXP max 4,720 unresolved; 36k/3.6k.

## 5. HOLD gaps (not implementable without fabrication)

Full table: `gaps.csv`.

- Min300: carriage-driver Parley result mutation, buried-box actor/flag
  near Longroot, Linkpearl-report command owner, private Chocobo-Stables
  + Eshtaime transitions, exact Nenekko/Popokkuli variants, per-twin
  Echo flags, EXP amount. (Placeholder (−431,187) transforms must not
  become actors.)
- Min306: escort path/stops, six mining-node actors, pursuer actor,
  Linkpearl owner, failure/retry/cleanup, EXP, Master of Rock grant.
  Killing a pursuer is explicitly forbidden by the source.
- Hrv200: leaf/weed count, node actors/transforms (§3 pool gap),
  marker-02 area ownership, marker-03/MSQ-trigger-1090046 multiplexing,
  prerequisite conflict (SQL 0 vs archive 110013), linkpearl semantics,
  EXP scaling.
- Hrv306: dynamic seed/faeces counts + correlation formula, node/hazard
  actors, sleep/wake aggro lifecycle, instance handoffs, dynamic 030
  payload, Greatloam + forest delivery actors, reward owner, EXP.
- Fsh300: Barrel zone/coords + boat travel (Rerenasu legs 5/20);
  emote-round identity binding; fresh-catch rule; wider catch species.
  Note: public Sisipu row 3329 (`fsh306_sisipu`, z230) now exists, so
  the "no public Sisipu" HOLD note in `fsh300.lua` is partly stale —
  but the gate stays until Barrel travel lands. Never enable for testing.
- Fsh306: timed-assignment duration (bell source/length), state-0 push
  owner, sale payout, state-20 extension, fresh-vs-preowned policy.
  `FSH306_DEV_BYPASS` is GM-local-testing only.

## 6. No-chocobo verification (pack scope)

- API scan of all nine pack scripts + template Min/Hrv/Fsh blocks for
  `IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount(`: 0 hits.
- Text hits: Min300 template marker roles ("Chocobo Stables instance
  handoff" 11046102, "chocobo-carriage driver/parley" 11046104) and
  journal objective ("question Fafajon's chocobo-carriage driver") —
  narrative labels only, no actor spawned. Min200/Min306/Hrv200/Hrv300/
  Hrv306/Fsh200/Fsh300/Fsh306: zero mentions.
- Global audit `class-quest-20-30-36-global-chocobo-fight-audit-2026-09-27.md`
  stays authoritative; this pack adds no chocobo/mount APIs
  (new files: `min_quest_helpers.lua`, bespoke `min200.lua` — verified
  clean). Re-run that audit after all packs land.

## 7. Validators run

- `python -B tools/validate_quest_availability.py` — PASS (524 rows,
  78 enabled; no enablement change).
- `python -B tools/validate_min200_route.py` — PASS (extended with the
  bespoke-file contract: baselines, net-gain, consume×3, gates, five
  processEvents, UpdateENPCs/EndEvent, onFinish/journal/markers).
- `validate_fsh200/fsh300/fsh306/hrv300_route.py` — all PASS (untouched).
- `python -B tests/run.py --audit` — 202 candidates, 24 registered,
  178 excluded (catalog unchanged; Min200 extension rides the existing
  harness, no new catalog entry needed).
- `python -B tests/run.py` (full, background) — 22/23; `dzemael-static`
  fails on Darkhold placement floor estimates (`mob.feasting_chain_c`,
  `wave.knights.01`) — unrelated subsystem, no pack files in that path;
  pre-existing, reported as blocked.
- Map-coordinate suites not re-run (no coordinate/binding changes;
  `map-coordinates` + `map-registry` passed in the background run).
