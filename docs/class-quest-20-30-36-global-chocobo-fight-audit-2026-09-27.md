# Class quests 20/30/36 — global chocobo + fight-surface audit — 2026-09-27

Master list: `outputs/class-quest-20-30-36-master-index-20260927/quest_list.csv`.
This audit: `outputs/class-quest-20-30-36-global-audit-20260927/` (`chocobo_audit.csv`, `fight_surface.csv`, `stub_full.csv`).

## 1. Architecture (stub vs full)

Most 200/300/306 quest files are 3-line stubs delegating to the shared driver:

```lua
require ("quests/class_quest_template")
InitClassQuest("Pgl300")
```

`stub_full.csv` verdict (FULL = bespoke body, STUB = template-driven):

- FULL: Pgl200, Exc300, Exc306, Arc300, Arc306, Cnj306, all Wdk/Bsm/Gld/Tan/Wvr/Alc/Cul 200/300/306, Hrv300, all Fsh 200/300/306.
- STUB (template-owned): Pgl300/306, all Gla (200/300/306), Exc200, Arc200, all Lnc, all Thm, Cnj200/300, all Min, Hrv200/306.
- Consequence for decomp: for STUBs the battle/sequence/marker/event truth lives in
  `FF14-Memory/Data/scripts/quests/class_quest_template.lua` (`InitClassQuest("<Code>")` configs),
  not in the per-quest file. Per-pack decomp must cite the template config blocks for stubs.
  `fight_surface.csv:uses_StartPrivateQuestBattle/uses_CreateContentArea` is 0 for stubs by design;
  it only flags bespoke inline battles (Pgl200, Exc306 rematch/survival, Arc300, Arc306 duel+escape, Cnj306 escort+echo).

## 2. No-chocobo verdict: PASS (text-only references, zero spawn APIs)

- API scan over `Data/scripts/quests/**/*.lua` + `Data/scripts/directors/Quest/QuestDirectorClass*.lua`
  for `IssueChocobo|SpawnChocobo|ChocoboMount|Mount(|IssueMount`: **0 hits**.
- `chocobo_audit.csv` text hits (7 files) are all non-spawn:
  - Exc300, Exc306, Arc300, Arc306, Cnj306: explicit "No chocobo callback or actor is used" comments; directors restate "No chocobo actor is spawned."
  - Lnc300 (template line ~1803): chocobos appear only in DAT dialogue row 64; never spawned.
  - Tan200 line 18 ("chocobo-stable inspection") + template seq-18 objective: a location/equip gate (BODY-slot wear check, Bsm306 pattern), inspector talk folded into report-back; no mount actor.
  - Tan300 line 174 + template delivery `11000021 "Leather Chocobo Saddle"`: an item display name only.
  - Min300 markers 11046102/11046104: "Chocobo Stables instance handoff" role + "chocobo-carriage driver" parley label; marker metadata only.
- Goobbue scan: 0 hits in the 51 quest files.

## 3. Fight surface (full fights, no loopholes — what implementers must close)

- Battle quests (PGL/GLA/EXC/ARC/LNC/THM/CNJ): private battles via `StartPrivateQuestBattle`
  (template configs for stubs; inline configs + `CreateContentArea` survival/escort for Exc306/Cnj306).
  Pack workers own: full waves, mob actorClass/mobType/levels/skills/positions, forced-loss vs kill-all,
  retry at door, death/timeout/disconnect/abandon cleanup, class/level gates on every handler,
  instance entry checks, UpdateENPCs + EndEvent on all paths.
- Wvr306: the only crafting code with an instance tail (`SimpleQuestBattleBaseClass` director
  `QuestDirectorWvr30601` noted in template ~3045); needs the same battle hardening.
- Other crafting (Wdk/Bsm/Gld/Tan/Wvr200-300/Alc/Cul): snapshot-diff credit, baseline counters,
  consume-on-delivery, retry-safe grants, no combat to fake.
- Gathering (Min/Hrv/Fsh): baseline snapshot at briefing, `caught=max(0,owned-baseline)`,
  grant-before-consume with retry flag, optional catch fanfare only.

## 4. Handoff to pack workers

Melee/ranged/crafting/gathering packs each write their own indepth doc + CSVs (see master index).
This global audit stays separate and must not be overwritten by packs.
Open follow-up: re-run this audit after packs land to confirm zero new chocobo/mount APIs.
