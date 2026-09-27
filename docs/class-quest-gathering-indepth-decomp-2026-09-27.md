# Gathering class quests indepth decomp — 2026-09-27

Pack: MIN/HRV/FSH 200/300/306 (quest IDs 110460–110502).
Master index: `docs/class-quest-20-30-36-master-index-2026-09-27.md`.
Machine data: `outputs/class-quest-gathering-decomp-20260927/` (`quest_list.csv`,
`gathering_targets.csv`, `markers.csv`, `rewards.csv`, `events.csv`, `gaps.csv`).

Sources (FF14-Memory repo): `Data/scripts/quests/class_quest_template.lua` (template
rows + `InitClassQuest` driver), per-quest Lua (`min/min200.lua` bespoke 2026-09-27,
`min/min_quest_helpers.lua` new, `hrv/hrv300.lua` bespoke, `fsh/fsh200.lua`,
`fsh/fsh300.lua`, `fsh/fsh306.lua` bespoke (HOLD gates removed on
enablement, see §9), `fsh/fsh_quest_helpers.lua`;
all other Min/Hrv files are 3-line `InitClassQuest` stubs),
`Data/sql/gamedata_quests.sql`, `Data/sql/gamedata_quest_rewards.sql`,
`Data/sql/gamedata_items.sql`, `Data/sql/server_fishing.sql`,
`Data/sql/server_gathering_item_pools_import.sql` (generated, do not hand-edit),
`Data/sql/live migrations/{min200_route,hrv300_route,fsh200_quest_waters}.sql`,
`Data/sql/server_eventnpc_spawn_locations.sql`,
`docs/Dat Mining/quest_marker.csv`, `docs/class_job_quest_implementation_2026-08-23.md`,
`docs/min200_a_piece_of_history_2026-09-26.md`.
Availability: `Data/scripts/quests/quest_availability.lua` — 110500 enabled at
first writing; 110460/110481/110501/110502 enabled in the §9 pass.

## 1. Implementation verdicts

| Quest | Script truth | Status |
|---|---|---|
| Min200 A Piece of History (110460) | bespoke `min/min200.lua` + `min_quest_helpers.lua` (2026-09-27), template row kept as decomp source | Implemented, ENABLED (§9) |
| Min300 Little Saboteurs (110461) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Min306 Runaway Little Girl (110462) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Hrv200 Gridanian Roots (110480) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Hrv300 The Grass is Always Greener (110481) | bespoke `hrv/hrv300.lua`, no template row (Exc300 precedent) | Implemented, ENABLED (§9) |
| Hrv306 A Moogle Bouquet (110482) | stub; template metadata-only (`noOffer`) | HOLD (see §5) |
| Fsh200 To Fight a Fishback (110500) | bespoke `fsh/fsh200.lua` + helpers, template row kept | Implemented, ENABLED |
| Fsh300 The Beast of the Barrel (110501) | bespoke + template row | Implemented, ENABLED (§9) |
| Fsh306 Polishing the Mast (110502) | bespoke + template row | Implemented, ENABLED (§9) |

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
- Fsh300 (§9: enabled): Sisipu row 3329 verified DAT-exact for marker
  11050101 (4.7 yalms from 11050108; 23-yalm documented offset for
  11050109/10). Ferry legs are ask-gated with no zone movement
  (driver precedent). Residual: emote-round identity binding,
  fresh-catch rule, wider catch species, Barrel-trigger live
  reachability (no navmesh proof at rows 3330-3333).
- Fsh306 (§9: enabled): Sisipu row 3329 DAT-exact for 11050204/05;
  state-0 push owner bound to stairs trigger row 3328 (DAT-exact for
  11050201, driver precedent); sale payout 1,000 gil per Gamer
  Escape's obsolete walkthrough. Residual: timed-assignment duration
  (3-bell authored placeholder), single-sale simplification (retail
  repeats), state-20 extension, fresh-vs-preowned policy.

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

## 8. Video/archived-source evidence addendum — 2026-09-27 (Min300/Min306/Hrv200/Hrv306)

Scope: Min300 (110461), Min306 (110462), Hrv200 (110480), Hrv306 (110482).
Min200, Hrv300, Fsh200/300/306 are DONE and out of scope; their CSV rows
carry covering-chapter notes only, no new claims. Fsh300/306 stay HOLD-gated.

Evidence rules applied (hard): footage may establish sequences, mechanics,
counts, timing. It NEVER yields exact XYZ, pool/node positions, or missing
actor identities as recovered data. No video-derived estimate is authored
below: no XYZ, no pool/node positions, no actor identities, no counts
changed. Unrecorded ground stays unresolved — footage does not substitute
for navmesh. Shared map-coordinate workflow still applies; no Main-SQL
change is made in this pass (main SQL already contains all prior data
changes; no new pools/points/actors are added). No chocobos: no new Lua,
no spawn APIs. Counter/flag contract untouched (no Lua edits, so slots
0–3 / flags 0–31 need no new exemptions).

### 8.1 Sources logged (URL, date, timestamps)

YouTube (verified 2026-09-27 via page extract — title/channel/posted date):

- Min300:
  `https://www.youtube.com/watch?v=FovlRIqOqPg` (Oroelf, posted
  2013-03-14, full quest 0:00–end).
  `https://www.youtube.com/watch?v=Xy6DUi4Msdk` (ElysiaZalakria, posted
  2011-10-03, recorded 2011-09-30 patch 1.18b, full 0:00–end; description:
  "No mining involved this time! Just parley and some cute scenes").
  `https://www.youtube.com/watch?v=dTMkeJlbHxU` (WotgAshiee LP547, posted
  2012-07-20).
  `https://www.youtube.com/watch?v=1TDAwECkPY0` (FFXIV Archived Miner
  compilation, posted 2024-05-26 — modern compilation of 1.0 captures, not
  a 1.0-era upload; ch 06:45–18:30 Little Saboteurs, ch 00:00–06:45 A Piece
  of History, ch 18:31–28:28 Runaway Little Girl, ch 28:29 Alternate
  Dialogue).
  `https://www.youtube.com/watch?v=YHTP84yaLV8` (posted 2010-12-24, full;
  description text gives the sequence parley → linkpearl → Camp Tranquil
  ??? → Linette → Goldsmith-guild Nenekko instance → Echo on both twins,
  reward 30,000 gil + 3,000 marks).
- Min306:
  `https://www.youtube.com/watch?v=BH7aGNzP0Jo` (ElysiaZalakria, posted
  2011-11-25, recorded 2011-11-22 patch 1.19a; escort majority cut after
  the first digging point by the uploader's own note).
  `https://www.youtube.com/watch?v=ZGNWqe7EXuM` (MithraTales, posted
  2011-03-10; description: NPC-linkpearl message → Linette → Momodi →
  south-of-Ul'dah cutscene → road between Camp Black Brush and Camp
  Horizon → follow Nenekko → dig pits "about 3 times" → ferry cutscene →
  linkpearl → Linette reward).
  `https://www.youtube.com/watch?v=020N-xh5Cm4` (WotgAshiee LP548, posted
  2012-07-20).
  `https://www.youtube.com/watch?v=1TDAwECkPY0` (same compilation, ch
  18:31–28:28 Runaway Little Girl).
- Hrv200:
  `https://www.youtube.com/watch?v=y-cQuN5N5YI` (Slerp Lederp Botanist
  Story v1.23b cutscene compilation, posted 2022-08-07 — modern compilation
  of 1.23b cutscenes; ch 0:00–4:50 Gridanian Roots, ch 3:28–9:04 The Grass
  Is Always Greener, ch 9:04–end A Moogle Bouquet; gameplay/timing not
  shown).
- Hrv306:
  `https://www.youtube.com/watch?v=MtRv3x8Wh_M` (Oroelf, posted
  2013-03-12, full 0:00–end; description confirms an extra cutscene variant
  when over-gathering — "only changes one line of dialog").
  `https://www.youtube.com/watch?v=y-cQuN5N5YI` (same compilation, ch
  9:04–end A Moogle Bouquet).

Archived text (1.0-era walkthrough content, accessed 2026-09-27):

- `https://ffxiv.gamerescape.com/wiki/Little_Saboteurs` (obsolete
  walkthrough: 8 steps Linette → V'korolon → Chocobo Stables parley →
  Linkpearl → Camp Tranquil (46,51) ??? → Linette → Goldsmith-guild Nenekko
  instance → Echo both twins).
- `https://ffxiv.gamerescape.com/wiki/Runaway_Little_Girl` (obsolete
  walkthrough, 8 steps; escort step: "At three points, the NPC will stop
  and mining points will appear. Once two points are mined (one time each)
  then the escort proceeds").
- `https://ffxiv.gamerescape.com/wiki/Gridanian_Roots` (obsolete
  walkthrough: Quarrymill near Camp Tranquil across bridge map marker
  45,47; Botanist-gated initiation; Spiny Turnip harvest; instanced; ~20
  skill points/harvest; 10-minute timer; moogle approach either way same
  result).
- `https://ffxiv.gamerescape.com/wiki/A_Moogle_Bouquet` (obsolete
  walkthrough: Rychyld (17,35) near Camp Crimson Bark; harvest greenery
  until Pearl Clover Seed, may continue until sparkles disappear with a
  Rychyld complaint variant; Humblehearth (29,31) Yarzon sleep/wake cycles,
  harvest sparkles avoiding Yarzon; faeces count "believed correlated" to
  seeds — author's belief, not a formula; seedling → Echo on Cicely →
  forest delivery → Cicely completion).
- `http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/Miner2.html`
  (eLeMeN dated archive とっておき大作戦; JP journals confirm the full
  Min300 chain; reward 30,000 gil + EXP ~3420 added patch 1.20, guild
  tokens ×3000 removed).
- `http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/Miner3.html`
  (eLeMeN 彼女の逃避行; JP journals confirm Quicksand/Momodi → Sil'dih
  mirage → Vesper Bay escort with digging → linkpearl → Linette; reward
  36,000 gil + EXP ~4720 added patch 1.20, tokens ×3600 removed).
- `http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/Botanist1.html`
  (eLeMeN グリダニアの根っこ; 3 JP journals; reward 20,000 gil + Brass
  Hatchet and EXP ~1760 both added patch 1.20, tokens ×2000 removed,
  Linkpearl; condition Botanist 20+ plus a main-quest clear).
- `http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/Botanist3.html`
  (eLeMeN モーグリの花畑; JP journals confirm Rychyld → flower-field seeds
  → Cicely → Opyltyl cultivation via Yarzon faeces → seedling → Echo →
  moogle delivery → Cicely; reward 36,000 gil + EXP ~4720 added patch 1.20,
  tokens ×3600 removed).
- Chain context only (no new claims):
  `.../Miner1.html` (Min200 時のかけら),
  `.../Botanist2.html` (Hrv300 憧れの大都会),
  `https://ffxiv.gamerescape.com/wiki/A_Piece_of_History`,
  `https://ffxiv.gamerescape.com/wiki/The_Grass_Is_Always_Greener`.

### 8.2 Per-quest findings (what footage supports vs what stays HOLD)

- Min300: footage + archives corroborate the decomp sequence (Linette →
  Roost/V'korolon → Chocobo Stables instance → carriage-driver Parley →
  Linkpearl report → Longroot flower-field ???/buried box → Linette →
  Eshtaime Nenekko → Linette → Echo BOTH twins), the non-combat/parley-only
  mechanic, and central 30k gil + 3k marks. Gaps CLOSED in Lua: none. Still
  HOLD with reason: Parley 017 result-mutation owner, buried-box
  actor/flag, Linkpearl command owner, private Chocobo-Stables/Eshtaime
  transition owners, exact Nenekko/Popokkuli variants, per-twin Echo flag
  ownership, and post-1.20 EXP scaling all require engine owners, actor
  identities, or exact flags — footage NEVER yields these per the evidence
  rules, and no XYZ may be taken from video or grid-square text (the (46,51)
  Camp Tranquil cell is a historical integer grid reference, not a server
  position; placeholder (−431,187) transforms must not become actors).
- Min306: footage + archives corroborate the escort mechanic and its count:
  three stops with two mining points each (Gamer Escape exact "three
  points / two points mined once each"; MithraTales "about 3 times";
  Elysia "first digging point" implying plurality; decomp already records
  stopCount 3 / two-per-stop / six interactions). Also corroborated: pursuer
  evasion by digging, killing the pursuer forbidden, Linkpearl summons, road
  corridor between Camp Black Brush and Camp Horizon in words only. Gaps
  CLOSED in Lua: none. Still HOLD: escort path/stop XYZ, six node actors,
  pursuer actor, Linkpearl owner, failure/retry/cleanup, EXP amount, Master
  of Rock (29724) grant — all need navmesh/recorded ground, actor
  identities, or command owners that footage cannot supply; the road phrase
  is not a path and the three-stop count does not place stops.
- Hrv200: compilation + archives corroborate Opyltyl → Cicely → Quarrymill
  weed-clear/Spiny Turnip harvest (instanced) → Cicely/moogle → Opyltyl,
  plus a 10-minute instanced timer, ~20 skill/harvest, and the Brass Hatchet
  / ~1760 EXP / Linkpearl reward frame (eLeMeN: both added patch 1.20).
  Gaps CLOSED in Lua: none. Still HOLD: weed/leaf required count (no
  footage frame shows a numeric journal count; the timer is timing, not a
  count), NO pool carries 11000018 and no place-2011 pools/points exist
  (needs a gathering-expansion workstream with new pools + points +
  recorded ground, not a script edit), node actors/transforms, marker-02
  area ownership (regional-frame coords, unresolved ground), 1090046
  multiplex hazard (shared MSQ trigger must not be rebound), prerequisite
  conflict (eLeMeN's main-quest-clear condition is a third data point
  against SQL 0 vs archive 110013 — left as conflict, no SQL change on
  archive text alone), Linkpearl semantics, EXP scaling.
- Hrv306: footage + archives corroborate the dynamic/over-harvest mechanic
  (Oroelf's extra one-line variant; Gamer Escape "continue until sparkles
  disappear" + Rychyld complaint), Yarzon sleep/wake avoidance while
  harvesting sparkles, the seed→faeces correlation as an author belief (not
  a formula), seedling grant, Echo on Cicely, forest/moogle delivery, and
  Cicely completion. Gaps CLOSED in Lua: none. Still HOLD: exact seed count,
  faeces formula, node/hazard actors, sleep/wake aggro lifecycle, instance
  handoffs, dynamic 030 payload, Greatloam/forest delivery actors, technical
  reward owner, EXP — "believed correlated" is not a formula and the
  one-line variant does not recover counts.

Fsh300/306: untouched; Barrel coords/boat travel and timer/push-owner HOLDs
stand per scope.

### 8.3 Lua/validator impact

No quest Lua changed (all four remain 3-line `InitClassQuest` stubs,
template metadata-only, `noOffer`). No helpers, no validators, no SQL, no
availability flips. Rationale: every remaining gap needs an engine owner,
actor identity, recorded ground position, pool/point row, or exact
counter/flag binding — none recoverable from footage under the hard rules —
so any script edit now would fabricate owners/positions and fail review.
Enablement stays as-is: none of the four meets the all-gaps-closed + green
route-validator + annotation + `EXPECTED_ENABLED` bar.

### 8.4 CSV changes

All six machine tables gained `video_sources` + `archive_sources` columns
(2026-09-27); every pre-existing column value is byte-identical. Rows for
110460/110481/110500/110501/110502 carry out-of-scope notes only.

## 9. Enablement addendum — 2026-09-27 (Min200/Hrv300/Fsh300/Fsh306)

Scope: offer enablement + hardening for 110460/110481/110501/110502 only.
Min300/Min306/Hrv200/Hrv306 stay HOLD per §8. No new decomp claims below:
closures reuse DAT/marker rows, spawn SQL, decompiled scenario order, and
walkthrough text already cited in this pack.

### 9.1 Script changes (FF14-Memory)

- Min200: offer nil-accepts (battle-quest pattern; was strict `== 1`).
  Baselines, net-gain credit, consume-on-full-pack, ENPC/EndEvent paths
  unchanged. No grants, so grant-before-consume is N/A.
- Hrv300: every exchange now grants before consuming with verified
  once-grants (already-held copies satisfy without doubling); failed
  grants hold the sequence with a make-room message. `onStart` clears
  the Parley-introduced and Nogeloix-first flags; the offer path calls
  `UpdateENPCs` after accept.
- Fsh300: HOLD gate removed. Ferry legs are ask-gated with no zone
  movement (driver precedent; all actors live in zone 230). The
  Rorojaru trade is possession-gated and grants the subligar before
  consuming the message, with a once-flag retry guard. `onStart`
  clears emote/catch/grant flags. Offer nil-accepts.
- Fsh306: HOLD gate removed. State 0 binds the stairs trigger push
  (row 3328, driver precedent); sale payout is 1,000 gil per Gamer
  Escape's obsolete walkthrough. `onStart` clears assignment/Echo
  state. Offer nil-accepts. `PUSH_EXCEPTIONS` in
  `tools/validate_class_quest_20_30_36.py` gains `Fsh306` (stairs push).
- Shared: 110460/110481/110501/110502 uncommented in
  `quest_availability.lua`; `EXPECTED_ENABLED` grows 6 → 10.

### 9.2 Video/archived-source cross-check (this pass)

YouTube (page-extract title verification 2026-09-27; no new frames
claimed, per the §8 hard rules footage establishes sequences only):

- Min200: `https://www.youtube.com/watch?v=1TDAwECkPY0` ("FFXIV
  Archived 1.0: Miner", ch 00:00–06:45 A Piece of History, per the §8
  log). Gamer Escape's obsolete walkthrough matches the route beat for
  beat: Linette offer, Z'ssapa twins scene (choice cosmetic),
  second Z'ssapa talk for the item list, three ??? areas (37-27
  Eastern / 15-28 Western / 25-27 Central; Prospect unneeded, Lay of
  the Land only), Z'ssapa appraisal, Nenekko instance (stays unbound:
  no spawn row), Linette reward. Fade to White prerequisite
  documented, unenforced (no driver prerequisite support).
- Hrv300: `https://www.youtube.com/watch?v=y-cQuN5N5YI` ("Final
  Fantasy XIV v1.23b: Botanist Story", ch 3:28–9:04 The Grass Is
  Always Greener, per the §8 log; cutscene compilation, gameplay not
  shown). Gamer Escape's obsolete walkthrough matches the route:
  Opyltyl → Cicely → Penelope (Carline Canopy) → Cicely → branch
  (directly outside Gridania) + nut (near Humblehearth) → Cicely →
  Penelope Parley → Cicely → Nogeloix, then Linette, → guild →
  Opyltyl reward. Nogeloix-before-Linette order confirmed.
- Fsh300/Fsh306: no 1.0-era footage located after targeted searches
  (queries: fisher Barrel/subligar/Polishing the Mast; FFXIV Archived
  1.0 fisher). Cross-check rests on Gamer Escape's obsolete
  walkthroughs + DAT + decomp. Fsh300: walkthrough order (feed →
  dance → Ul'dah → dance → catch) differs from the decomp state
  order (trade 15 before rounds 22); the script keeps trade-first
  (documented deviation, same as the driver). Fsh306: walkthrough
  confirms stairs → assignment → timed sale (1,000 gil) → Echoes
  "multiple times until it no longer allows you" → N'nmulika reward;
  multi-sale ("catch as many as you can") and the Wawalago extension
  stay unmodeled (documented).

### 9.3 Validators run (this pass, all PASS)

- `validate_min200/hrv300/fsh300/fsh306_route.py` — PASS.
- `validate_class_quest_20_30_36.py` — contract ok (51 quests, 10
  enabled offers).
- `validate_class_held_routes.py` — PASS (27 held contracts exact).
- `validate_quest_availability.py` — valid (524 rows, 82 enabled).
- `tools/test_quest_counter_slots.py` — PASS (flag 5 / push additions
  fit the persisted engine contract).
- `luaparser` parse check on all four quest scripts +
  `quest_availability.lua` — OK.

Residual live-verification risks (no footage/navmesh proof): Fsh300
Barrel-trigger reachability at rows 3330-3333 (DAT-exact X/Z,
scaffolded Y/rotation); Fsh306 3-bell timer length; per-round emote
identity for Fsh300.
