# Class quests 20/30/36 — reward / marker / event coverage — 2026-09-27

Data: `outputs/class-quest-20-30-36-reward-marker-event-audit-20260927/coverage.csv`.
Sources: `FF14-Memory/Data/sql/gamedata_quest_rewards.sql` (central),
`FF14-Memory/Data/scripts/quests/class_quest_template.lua` (template entries),
per-quest bespoke Lua bodies.

## 1. Central rewards (all 51 present)

- Every quest has central Gil + guild marks. Only Pgl200 additionally has central Item (4020208) + Exp (1760).
- Bsm200/300/306 uniquely carry two mark currencies (1000114 + 1000115).
- Consequence: all other 50 quests must grant EXP explicitly in Lua (e.g. Exc306 4720, Cul200/Fsh200 1760).
  Pack workers must verify each bespoke/template completion path calls `AddExp` + `sqrwa` presentation
  and does not double-pay where a central Exp row exists (Pgl200).

## 2. Template vs bespoke event truth

- Bespoke-only (no template entry, by design): Pgl200, Exc300, Hrv300.
  Their `processEvent*` truth lives only in the bespoke file (36/6/5 events respectively).
  (Min200 was bespoke-only at audit time; it has since been promoted to dual-source —
  bespoke file plus template row kept as decomp source, Fsh200 precedent.)
- Dual-source (template entry + bespoke body): Exc306, Arc300/306, Cnj306, all Wdk/Bsm/Gld/Tan/Wvr/Alc/Cul 200/300/306, all Fsh 200/300/306.
  E.g. Cnj306 template cites 38 events vs 10 in the bespoke file; Arc306 21 vs 13; Wvr300 24 vs 6.
  Packs must reconcile: template holds the recovered client surface, bespoke holds the wired subset.
  Unwired template events are the implementation gap list — do not silently drop them; document as
  ambient/unbound (Exc300-style) or wire them.
- Template-only (stub files): Pgl300/306, all Gla, Exc200, Arc200, all Lnc, all Thm, Cnj200/300,
  all Min, Hrv200/306. Their per-quest file has 0 events; all truth is in the template block
  (1–13 events, 3–18 markers per quest — see coverage.csv).

## 3. Marker truth

- Template marker counts range 3 (Thm200) to 18 (Gld200, Hrv306).
- Bespoke-only quests carry their markers in-file (Pgl200/Exc300/Hrv300); stubs carry none in-file.
- Markers are DAT-derived X/Z with authored Y; packs must preserve exact X/Z and ground-method
  (recorded node vs triangle/estimate) per the map-coordinate workflow, and keep filler ranges rejected.

## 4. What remains for packs

- Melee: reconcile stub battles (Pgl300/306, Gla, Exc200) from template configs; harden Pgl200/Exc300/306.
- Ranged: Arc300/306 + Cnj306 dual-source reconciliation is the long pole (largest event counts).
- Crafting/gathering: branch/counter and baseline-snapshot logic must match template event counts
  (Wvr300's 24 template events vs 6 wired is the biggest gap flag).
