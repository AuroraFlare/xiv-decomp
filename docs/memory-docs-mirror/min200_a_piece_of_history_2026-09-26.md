# Min200 A Piece of History — implementation notes

Implemented: 2026-09-26. Miner 20 class quest. Second gathering-class
implementation; it extends the Fsh200 delivery driver with a multi-item
form (per-item obtained flags) reusable by every gather-several-distinct-
items quest.

## Retail route (evidenced)

- Offer: Linette (actor 1000861) in the Miners' Guild
  (`processEventLinetteStart`). Public spawn row exists (id 177, zone 209,
  -92.38 / 195.6 / 313.43); X/Z match DAT reward marker 11046005
  (-92.47 / 313.31).
- Briefing: Z'ssapa (actor 1000887) at the Nanawa Mines entrance,
  `processEvent010`, DAT marker 11046001. Public spawn row exists (id
  2464, zone 170, 92.767 / 183.826 / -1030.44), X/Z exactly matching the
  marker. This resolves the template's Z'ssapa candidates {1000887,
  1001217} to 1000887. The walkthrough's twin choice at the end of the
  scene is cosmetic ("nothing is known about the difference"), so no
  result gate is modeled.
- Item list: Z'ssapa again (the walkthrough's explicit second talk),
  `processEvent015_1` + `processEvent015_2`. Event-number order (010 <
  015 < 020) places the 015 pair between the twins scene and the mining
  phase; the 017_A/B/C appraisal branches stay unbound (no selection
  rule recovered).
- Mining: one quest find near each of the three DAT
  MapMarkerQuestArea markers: 11046006 Drybone (zone 171 pool 30071,
  nearest node 27.3 yalms), 11046007 Horizon's Edge (zone 172 pool
  30081, nearest node 34.0 yalms), 11046008 Black Brush (zone 170 pool
  30061, nearest node 29.7 yalms). The walkthrough areas (37-27
  Eastern, 15-28 Western, 25-27 Central) match; Prospect is not
  required, only Lay of the Land. No source fixes which find comes
  from which area, so every area pool carries all three finds
  (Sheep's-eye 11000012, Petrified Wood 11000013, Ewer Fragment
  11000014) and the gate requires one of each. All three markers
  surface in the journal map during the delivery step (retail
  behavior, same shape as Fsh200).
- Delivery/appraisal: Z'ssapa (`processEvent020`). The DAT journal
  cells read per-item obtained flags ($E8(2..4) >= 1 lists each find
  during states 5-9), so the server writes one flag per find to work
  counters 0-2, consumes one of each on a full pack, and holds the
  step on a partial pack after the reminder plays.
- Reward: Linette (final hook `processEvent050`). Central rows grant
  20,000 gil + 2,000 Miners' Guild marks (item 1000121); both rows
  predate this change.

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Min200` row with
  `offer = true`, route [1] (Z'ssapa 010) / [2] (Z'ssapa 015 pair) /
  [3] (Z'ssapa 020 delivery with `delivery.items` + `counter = 0`),
  no battle. Prerequisite 110013 (Fade to White) documented,
  unenforced (no driver prerequisite support, same as existing class
  chains).
- Driver multi-item delivery (additive; single-item steps behave
  exactly as before): `prepareDeliveryStep` writes a 0/1 obtained
  flag per `delivery.items` entry starting at `delivery.counter` and
  reports ready only when every entry is owned;
  `completeDeliveryStep` consumes every entry only on a full pack;
  `getJournalInformation` reports the live flags
  `(flag1, flag2, flag3, 0, required)` during delivery sequences.
- `Data/sql/live migrations/min200_route.sql`: the nine quest-find
  pool entries. Weight 100 keeps each pool's uniform provisional
  convention; sweetSpot stays NULL (unknown). The finds are absent
  from Data/gather.csv, so the pool generator cannot emit them and
  the migration is their only home (the generated import file is
  untouched).
- `tools/validate_min200_route.py`: static route/pool contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110460 added to `IMPLEMENTED_CLASS_IDS`.

## Bespoke promotion (2026-09-27)

- `Data/scripts/quests/min/min200.lua` is now a bespoke script
  (Fsh200/Cul200 precedent) with `quests/min/min_quest_helpers.lua`
  shared helpers. The template `Min200` row stays as the decomp
  source (dual-source, same as Fsh200); the validator covers both.
- Behavioral delta vs the driver: briefing-time baselines
  (counters 3-5) at `processEvent010`, credit
  `max(0, owned - baseline)` per find, pre-briefing finds excluded.
  Obtained flags keep driver/DAT slots 0-2; the journal computes the
  same flags live. Delivery still consumes one of each on a full
  pack; finds stay with the player on abandon and re-snapshot on
  re-accept. No EXP/tool change; no availability change.
- No `onGather` handler: C# only fans out `onFishCatch`, so mining
  credit derives from the snapshot alone (documented, completable).

## Documented defaults (not retail claims)

- Finds route through normal inventory with chat-log visibility; the
  delivery gate counts and consumes instead of observing mining
  events, and HQ finds do not count (quantities convention).
- The all-finds-in-all-pools mapping is a reconstruction default: no
  source fixes a per-area find, and one report has two different
  finds both west of Camp Horizon. If retail evidence for a fixed
  mapping appears, shrink the pools and the gate still holds.
- Counter slots 0-2 for $E8(2..4) follow the C# counter1..4 naming
  convention (SetCounter slot N writes counterN+1; $E8(1) is the
  sequence, $E8(2..5) the work counters). The client cache sync path
  is unverified from the worktree — flagged for live verification
  (worst case: a stale checklist in one dialogue line; gating stays
  server-correct).
- The Nenekko instance interlude (030 shard scene, 035 walk-home,
  040) is unbound: all three Nenekko actor candidates exist as
  classes (display 1500080) but have no spawn row anywhere, and the
  driver has no non-battle private-instance transition. The
  walkthrough's walk-home auto-resolves ("she walks home herself"),
  so no escort AI is owed when the interlude binds. The route goes
  from the appraisal straight to the Linette reward.
- The 017_A/B/C appraisal branches are unbound (no selection rule);
  the gate guarantees the appraisal precondition (all three finds).
- Prospect/Lay of the Land gating is unmodeled (no required-action
  gate in the engine); post-1.20 EXP amount and Iron Dolabra
  ownership are unresolved, so the template grants neither.
