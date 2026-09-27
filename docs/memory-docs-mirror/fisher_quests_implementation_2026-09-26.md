# Fisher class quests (Fsh200 / Fsh300 / Fsh306) implementation

Date: 2026-09-26. Status: Fsh200 playable; Fsh300/Fsh306 complete but
HOLD-gated. No retail client decomp was performed for this change; all
routes come from the repo's own recovered `CLASS_QUESTS` metadata, engine
APIs were read from repo sources, and dialogue is the client's own
`processEvent*` scenes (server fires them, never scripts retail text).

## What changed

Staged under `/tmp/fsh-quests/`, mirroring repo paths. Copy each file over
its repo counterpart (or `git apply` the two patches):

| Staged file | Target | Effect |
|---|---|---|
| `Data/scripts/quests/fsh/fsh_quest_helpers.lua` | new file | Shared credit/consume/deadline/Echo helpers |
| `Data/scripts/quests/fsh/fsh200.lua` | replaces stub | Playable Fsh200 |
| `Data/scripts/quests/fsh/fsh300.lua` | replaces stub | Full Fsh300, offer-gated |
| `Data/scripts/quests/fsh/fsh306.lua` | replaces stub | Full Fsh306, offer-gated |
| `Data/sql/main_sql_edits/fisher_quests_main_sql.sql` | instructions + statement | Main-SQL edits (prereqs, pool entries) |
| `Data/sql/live migrations/fsh200_pixie_remora_waters.sql` | new migration | Live mirror of the SQL edits |
| `quest_availability_fsh200.patch` | `git apply` | Enables offer 110500 only |
| `Map Server/OnFishCatch.optional.patch` | `git apply` + rebuild | Optional live-catch fanout |

`CLASS_QUESTS` Fsh entries in `class_quest_template.lua` are left untouched
as the recovered record; they are inert once the stubs are replaced.

## Fsh200: playable

Flow: N'nmulika offer -> Maisie briefing (snapshot) -> net five Pixie
Remora -> Maisie delivery -> Yew Fishing Rod + 1760 EXP (+ central gil /
marks, already in `gamedata_quest_rewards`).

* Catch credit is snapshot-based (`owned - baseline`), NQ+HQ aware, and
  works with or without the C# patch. The delivery consumes five.
* Quest waters: Pixie Remora bound to pools 10051/10061/10081 (see below).
* Journal shows live `caught / 5`; map markers switch from the five waters
  to Maisie's return marker when ready.
* Known gaps: class-quest linkpearl grant (unresolved, skipped); Fsh200
  chain prerequisite stays 0 (unverified); traded fish credit like caught
  fish (matches etc delivery-quest behavior).

## Fsh300: gated, unblock criteria

Full 11-state route is implemented (feed/message/subligar transactions,
equip check, 4 emote rounds, Barrel catch, Echo gate, final report).
Offer requires BOTH:

1. A public Sisipu (1000155) spawn authored from evidence (states 0/30/
   35/40). Only private man0l1 copies exist today.
2. Barrel zone/coords + Rerenasu boat travel (states 5, 20, 22, 25).

Also: state 25 (any-species catch) needs the C# patch; state-20 content is
an authored interpretation (equip + return boat); emote rounds accept any
client trigger until per-round bindings are captured.

## Fsh306: gated, unblock criteria

Full route implemented (timed assignment, sale, 3 Echo substeps, report).
Offer requires ALL of: public Sisipu spawn (states 25.1/25.2), the timed
duration (placeholder: 3 bells), the state-0 push owner (no ENPC until
resolved). Sale pays the assigned fish's vendor `sellPrice` (authored;
retail payout unresolved). Timed states use 10+selector (retail 10..19
mapping unresolved). Timeout returns to state 5 for reassignment
(authored). The three Echo viewings complete in any order, each gated on
its scene result (authored; no recovered evidence enforces order).

## Coordinate evidence (Fsh200 waters)

`mapArea` in the recovered destinations equals the native layout in
`tools/mobspawns/map_registry.py` (101/102/103 -> zones 128/129/130,
verified with `maps --zone`). `locate --world` per destination:

| Marker | Zone | X/Z | Ground support |
|---|---|---|---|
| 11050004 | 128 Lower La Noscea | -227.94 / -12.06 | mob 28y; nodes 157y (weak) |
| 11050005 | 128 Lower La Noscea | -41.39 / 225.90 | 16 nodes in 30y, nearest 4.3y (strong) |
| 11050006 | 129 Western La Noscea | -1134.19 / -694.57 | nearest node 83y (weak; water-plausible) |
| 11050007 | 129 Western La Noscea | -1043.70 / -554.61 | nearest node 242y (very weak; water-plausible) |
| 11050008 | 130 Eastern La Noscea | 1298.90 / -886.29 | node 40y, Bloodshore bell 48y (moderate) |

Weak ground support is expected for true water spots (movement recordings
avoid water). Pool binding follows the engine's nearest-anchor rule: all
five destinations resolve to pools 10051 (Bearded Rock), 10061 (Skull
Valley), 10081 (Bloodshore), so Pixie Remora entries were added there
(full depth band, NULL sweetSpot, minRank 20; difficulty mirrors grade).
Fsh306's five fish were already in pools 10061/10081/10151; no change.

Recordings: `Data/quicknavmesh/zone_128.tsv` (sha 9a58c71e...),
`zone_129.tsv` (ac75d45d...), `zone_130.tsv` (535b0e85...). Heights stay
unresolved per the guide; fishing anchors need none.

## Enable / test

1. Copy the four Lua files, apply the main-SQL edits, optionally apply the
   live migration, `git apply quest_availability_fsh200.patch`, restart
   Map Server. Optional: apply the C# patch and rebuild for live fanfare
   (required only for Fsh300 state 25).
2. FSH20+ char: offer at N'nmulika (Limsa 230), brief at Maisie, catch 5
   Pixie Remora in Lower/Western/Eastern La Noscea waters, deliver.
3. Failure paths to check: full inventory at delivery (fish kept, retry
   clean); abandon/re-accept (re-snapshot, no free credit); pre-farmed
   fish (must catch 5 fresh).
4. Fsh300/306: confirm no offer marker; GM-add to verify states 0-5 and
   the HOLD/boat messages (`FSH30X_DEV_BYPASS` stays false on servers).

## Verification performed (2026-09-26, isolated /tmp copies; repo untouched)

* Lua logic simulation under a real Lua runtime
  (`/tmp/fsh-quests-verify/simulate.py`, 6/6 cases pass): full walks of
  all three quests covering offer/brief/snapshot credit (NQ, HQ quality 4,
  mixed, pre-farm, grant-failure idempotency, HQ-binding fallback),
  delivery, feed/message/subligar transactions, equip check + recovery,
  emote rounds, barrel push/catch, Echo accept/reject, timeout + reassign,
  vendor-price sale, report/EXP, journal + markers per state, and
  class/level/prereq gates. The simulation caught and fixed one real bug
  (Fsh306 Echo completion now order-free) plus two test bugs.
* MoonSharp 2.0 (the server's own interpreter): all four files parse and
  load with entry points present (`/tmp/mooncheck`, all pass). Bare
  `unpack` is avoided in shipped files as MoonSharp-safety margin.
* C# patch: full Map Server Release build, 0 errors; `OnFishCatch`
  confirmed in the built DLL.
* Real `QuestAvailability` parser: flipped allowlist enables exactly
  110500; 110501/110502 stay disabled; untouched repo is the negative
  control (`/tmp/availcheck`, all pass).
* Live Map Server boot from an isolated `/tmp/ff14-live` deployment
  (own config, own crash marker, live DB read-only in practice): 524
  quests loaded, availability 63/514 with no fail-open, zones and
  scheduler ran, clean shutdown, no Lua errors. Quest scripts load lazily,
  so file parsing is covered by the MoonSharp check instead.
* Not performed: interactive in-game play with a 1.0 client (no client
  automation available here). The simulation above is the end-to-end
  logic playthrough; in-game confirmation of client scenes/markers still
  needs a GM pass after copy-over.

## No-chocobo note

Per the request, no chocobo systems were touched; Fsh300 boat legs use
Rerenasu dialogue only (no mounts, no caravan code).
