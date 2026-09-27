# Fsh306 Polishing the Mast — implementation notes

Implemented: 2026-09-26. Fisher 36 class quest. Third gathering-class
implementation; it adds the `anyOf` delivery form (first owned of
several distinct items) to the Fsh200/Min200 delivery driver.

## Retail route (evidenced)

- Offer: N'nmulika (actor 1000153) in the Fishermen's Guild
  (`processEventNnmulikaStart`). Public spawn row exists (id 325, zone
  230, -612.9 / 4.55 / 341.42).
- Stairs push: DAT marker 11050201 (-601.94 / 359.88, display 4000257),
  the walkthrough's "stairs in the rear of the guild", `processEvent010`
  (fsh30610, afterWarp). New public trigger row (id 3328) reuses
  generic actor 1000174 (PGL306/ARC200/LNC precedent; no 1000174
  trigger exists in zone 230); Y 6.25 follows xavalien/maisie (4.7
  yalms away), rotation is a scaffold. The instance entry has no
  non-battle transition owner, so the scene plays public (same class
  of deviation as LNC's public-played instance talks).
- Assignment: N'nmulika (`processEvent015`), DAT marker 11050202,
  X/Z exactly matching the spawn row. Retail assigns one of five
  fish against the bell; with no timer owner the sale below accepts
  any one of the five (deliverer's choice).
- Sale: N'nmulika. The five sale fish are normal stock already in
  rod-fishing pools with recovered depths/sweet spots (gather.csv
  command 20003 + gather_aim.csv, no SQL needed): Rothlyt Oyster
  3011213 (Skull Valley 10061, Bloodshore 10081), Nautilus 3011203
  (same two), Bianaq Bream 3011209 (Bloodshore, Cedarwood 10151),
  Ash Tuna 3011217 (Cedarwood), Hammerhead Shark 3011225
  (Cedarwood, Horizon's Edge 30081). The gate writes a 1/0 matched
  flag to work counter 0, consumes the first owned fish (template
  selector order) on a full pack, and holds the step on an empty
  creel. The counter branch plays the 016 sale + 020 close on a full
  pack or the 015_3 reminder + 020 on a partial one.
- Echoes: Sisipu (`processEvent040`/`050`, DAT markers 11050204/05,
  requiredResult 1 each) then Maisie (`processEvent060`, marker
  11050206, requiredResult 1), the walkthrough's "use the Echo
  multiple times until it no longer allows you" (Pgl300/Cnj300 Echo
  precedent). Sisipu has no public spawn row (only the
  PrivateAreaMasterPast guild row), so a public scaffold row (id
  3329) recovers the DAT X/Z exactly; Y 4.25 follows daca_jinjahl
  (4.0 yalms away), rotation 1.11 is Sisipu's own private-area row.
  Maisie's public row (id 401) X/Z-matches marker 11050206 exactly.
- Reward: N'nmulika (final hook `processEvent070`). Central rows
  grant 36,000 gil + 3,600 Fishermen's Guild marks (item 1000123);
  both rows predate this change.

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Fsh306` row with
  `offer = true`, route [1] (stairs push 010) / [2] (N'nmulika 015)
  / [3] (N'nmulika anyOf sale with the 016/015_3 counter branch +
  020) / [4]-[6] (three requiredResult Echo gates), no battle.
  Prerequisite 110501 (Fsh300) documented, unenforced (no driver
  prerequisite support, same as existing class chains).
- Driver `anyOf` delivery (additive; single- and multi-item steps
  behave exactly as before): `prepareDeliveryStep` matches the
  first owned entry and writes 1/0 to `delivery.counter`;
  `completeDeliveryStep` consumes only the matched entry;
  `getJournalInformation` reports `(matched, 0, 0, 0, 1)` during
  delivery sequences.
- `Data/sql/server_eventnpc_spawn_locations.sql` + mirror
  `Data/sql/live migrations/fsh306_route.sql`: the stairs trigger
  and Sisipu rows.
- `tools/validate_fsh306_route.py`: static route/pool contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110502 added to `IMPLEMENTED_CLASS_IDS`;
  the `Fsh306` held-routes entry removed (promotion convention).

## Documented defaults (not retail claims)

- Deliverer's choice replaces the random 1-of-5 selector (no
  selector/random owner); first-match priority follows the
  template's selector order 0-4.
- One untimed sale replaces the bell-timed sale window (no timer
  owner): no timeout/reminder/extension/retry transitions, no
  repeat sales ("catch as many as you can" is unmodeled), and any
  owned fish counts even if pre-caught (fresh-vs-preowned policy
  unresolved; same inventory-routing class as Fsh200/Min200).
- The 1,000-gil sale payout is unbound (no step-gil grant
  primitive); the fish is consumed without payout.
- State 20 (the Wawalago extension beat) is skipped: its actor is
  unresolved and its marker is the -431/187 placeholder. Marker
  11050208 (Rerenasu) stays unbound per the row's doNotBind.
- The 020 close scene plays after both the sale and the reminder;
  the reminder/close pairing on a partial pack is a reconstruction.
- Post-1.20 EXP scaling is unresolved (DAT maximum 4,720), so the
  template grants none; the instance entry, per-Echo flags, and
  journal-data pins are unmodeled.
