# Class-quest stub template configs — gate/battle/EXP audit — 2026-09-27

Data: `outputs/class-quest-stub-config-audit-20260927/stub_configs.csv` (20 rows).
Source: `FF14-Memory/Data/scripts/quests/class_quest_template.lua` per-code config blocks.
These 20 codes have 3-line stub files; everything below is template-owned truth.

## 1. Gates: all correct

Every stub config carries the SQL-matching `classId` (PGL 2, GLA 3, MRD 4, ARC 7, LNC 8,
THM 22, CNJ 23, MIN 39, BTN 40) and tier level (20/30/36). Offer actors are bound except
Hrv306 (see §3). No stub can be offered to the wrong class or level through the driver.

## 2. Battles and EXP

- All 14 battle stubs bind their `QuestDirectorClass*` director script; all 6 gather stubs
  (Min/Hrv 200/300/306) are correctly director-free.
- Battle stubs grant explicit Lua EXP on the recovered tier ladder: 1760 (Lv.20), 3420 (Lv.30),
  4720 (Lv.36) — consistent with no central Exp rows for these quests.
- Gather stubs carry `exp = 0` (EXP unresolved/documented holds per the gathering pack).

## 3. Hrv306 is HOLD-consistent, not broken

Hrv306 sets `noOffer = true` with a `documentedOffer` (Opyltyl actor 1000236,
`processEventOpyltylStart`) and a `documentedRewardOwner` needing a technical binding.
The missing `offerActor` binding is the documented HOLD, owned by the gathering pack —
do not "fix" it by wiring an offer without the missing actors/pools.

## 4. Min200 is now dual-source

Min200 keeps its template row as decomp source alongside the new bespoke file (Fsh200
precedent). The template row must stay read-only reference; the bespoke file owns behavior.
