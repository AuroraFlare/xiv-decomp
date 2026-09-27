# Fsh200 To Fight a Fishback — implementation notes

Implemented: 2026-09-26. Fisher 20 class quest. First gathering-class
implementation; the delivery-step driver support it adds is reusable by
every catch/gather/mine-and-deliver quest.

## Retail route (evidenced)

- Offer: N'nmulika (actor 1000153) in the Fishermen's Guild
  (`processEventNnmulikaStart`). Public spawn row exists (zone 230,
  -612.9 / 4.55 / 341.42).
- Briefing: Maisie (actor 1000173), `processEvent010`, DAT marker
  11050001. Public spawn row exists (zone 230, -603.64 / 6.25 /
  355.46), X/Z exactly matching the marker. Sahagin bait is item
  11000127 (six DAT references, a "5 or so" ask (rows 35-38), and an
  item-usage topic hook).
- Fishing: catch five Pixie Remora at the five DAT points. Markers
  11050004-11050008 convert exactly to the walkthrough squares
  (23,29) and (24,32) in zone 128, (13,23) and (14,24) in zone 129,
  and (38,21) in zone 130. The walkthrough requires saltwater bait
  (Floating Minnow or Lugworm). All five markers surface in the
  journal map during the delivery step (retail behavior, live
  `RequestQuestJournalCommand` path).
- Delivery: Maisie (`processEvent020`). The client reads the
  remaining count from quest work counter 0 ($E8(1) by the
  counter1..4 convention; DAT rows 38/58) to pick the full-pack
  thanks (row 27) or the partial-pack reminder (rows 57-58). The
  server counts NQ fish, feeds remaining, consumes five on a full
  pack, and holds the step on a partial pack after the reminder.
- Reward: Maisie (final hook `processEvent020`, replayed). The script
  grants the Yew Fishing Rod (7030011, walkthrough-verified) + 1,760
  EXP; central rows grant 20,000 gil + 2,000 marks (item 1000123).

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Fsh200` row with
  `offer = true`, route [1] (Maisie briefing) / [2] (Maisie delivery
  with `delivery = {item = 11000127, count = 5, counter = 0}`), no
  battle. Prerequisite 110013 (Fade to White) documented, unenforced
  (no driver prerequisite support, same as existing class chains).
- Driver delivery support (additive; steps without `delivery` behave
  exactly as before): `prepareDeliveryStep` counts NQ items via the
  existing `quests/com/gc_sidequest_items` module and writes remaining
  to the quest work counter before the scene plays;
  `advanceRouteStep` holds the step when the pack is short and
  `completeDeliveryStep` consumes the items only on a full pack;
  `getJournalInformation` reports live `(owned, 0, 0, 0, required)`
  during delivery sequences (etc1g0 five-field precedent) and keeps
  the existing `{0, 0}` otherwise.
- `Data/sql/server_fishing.sql` + migration `Data/sql/live
  migrations/fsh200_quest_waters.sql`: Pixie Remora entries in
  Bearded Rock (10051), Skull Valley (10061), and Bloodshore (10081)
  — the nearest-anchor grounds for all five markers. Weight 100
  follows each pool's uniform convention (DAT: "pretty common");
  difficulty/minRank follow each pool's grade convention; depth band
  (2,2,-3) is a shallow-shore reconstruction default (no DAT depth).
  Lugworm and Floating Minnow already function through the existing
  global neutral bait rules.
- `tools/validate_fsh200_route.py`: static route/pool contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110500 added to `IMPLEMENTED_CLASS_IDS`.
  Fsh200 was never in `tools/validate_class_held_routes.py`, so no
  unhold edit was needed.

## Documented defaults (not retail claims)

- Catches route through normal inventory with chat-log visibility
  (retail credited them silently to the quest and showed no log
  line); the delivery gate counts and consumes instead of observing
  catch events, and HQ fish do not count (quantities convention).
- Counter slot 0 for $E8(1) follows the C# counter1..4 naming
  convention; the client cache sync path is unverified from the
  worktree — flagged for live verification (worst case: a stale
  number in one dialogue line; gating stays server-correct).
- The 020 scene plays twice on a full pack (delivery thanks, then
  reward replay with the rod grant); a silent gate would leave
  partial returns without feedback, so the replay is the documented
  trade-off.
- Bait is bonus-only in the engine (no required-bait gate), so the
  walkthrough's saltwater-bait requirement is unmodeled beyond the
  functioning global bait rules.
- Marker 11050002 (guild 4000257 trigger) stays unbound: no retail
  role recovered.
- The linkpearl grant stays unbound (same as Lnc200).

## Sources

- DAT: `docs/Dat Mining/fsh200.csv` (59 text rows),
  `quest_marker.csv` rows 11050001-11050008, `quest.csv` row 110500,
  `gamedata_items.sql` 11000127/3940002/3940106/7030011.
- Walkthrough: Gamer Escape `To_Fight_a_Fishback` (five squares,
  saltwater bait, silent catch credit, journal confirmation, Yew
  Fishing Rod) and Final Fantasy Wiki lancer/fisher quest tables
  (1,760 EXP; no linkpearl listed).
- Video (manual-review corroboration): no 1.0 Fsh200 footage surfaced
  in search; the walkthrough + DAT carry the counts.

## Verification

- `python -B tools/validate_fsh200_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
- All `tools/validate_*_route.py` → PASS (driver regression check)
