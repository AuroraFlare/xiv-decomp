# Class quests 20/30/36 — offer-gate / prerequisite audit — 2026-09-27

Data: `outputs/class-quest-20-30-36-gate-audit-20260927/gate_coverage.csv` (51 rows).
Sources: `FF14-Memory/Data/sql/gamedata_quests.sql` (level + prereq columns),
per-quest bespoke Lua (class/level gates). `python -B tools/validate_quest_availability.py` passes (exit 0).

## 1. SQL chain structure

- No-chain families (every tier prereq 0): PGL, GLA, EXC, THM, MIN. Any tier is offered on class+level alone.
- Chained families: ARC (300←200, 306←300), LNC, CNJ, WDK, BSM, GLD, TAN, WVR, ALC, CUL, HRV, FSH.
- Alc200 is special: prereq 110013 (Fade to White, MSQ 18) plus Alchemist 20. Implementations must keep
  both gates; the MSQ gate must not be dropped as "unrelated".
- Min300/Min306 have prereq 0 (no chain) despite Min200 existing — keep as SQL states, do not invent a chain.

## 2. Lua gate coverage (bespoke files)

- Battle bespoke (Pgl200: CLASSID_PUG; Exc300: CLASSID_MRD; Arc300/306: CLASSID_ARC; Hrv300: CLASSID_BTN): gates present.
- Craft/gather bespoke (Wdk/Bsm/Gld/Tan/Wvr/Alc/Cul/Fsh 200/300/306): `HasClassAndLevel(player, <tier>)` with the
  matching 20/30/36 literal. Levels match SQL in every file.
- Cnj306 anomaly: gate detected but no CLASSID_* token — it gates through a different helper pattern.
  Ranged pack must confirm the Conjurer gate fires on every handler (offer/state/talk/push), not just offer.
- Stubs (21 files): no Lua gate by design — the template driver owns offer gating. Ranged/melee packs must
  verify each stub's template config asserts the right classId + level (especially chained Lnc/Thm/Cnj/Min/Hrv tiers).

## 3. Rules for packs

Never loosen a gate to "fix" a stuck quest; never invent a chain where SQL prereq is 0;
keep Alc200's 110013 MSQ gate; keep Min tiers chain-free. Every handler (not just offer) must re-check
class + level so a player who switches class mid-quest cannot advance, turn in, or enter instances.
