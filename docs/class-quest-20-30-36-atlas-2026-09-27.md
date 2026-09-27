# Class quests Lv.20/30/36 — atlas entry point — 2026-09-27

Single index over the 12 decomp layers + harness for all 51 quests
(PGL/GLA/EXC/ARC/LNC/THM/CNJ/WDK/BSM/GLD/TAN/WVR/ALC/CUL/MIN/HRV/FSH x 200/300/306).
All paths below are verified to exist on 2026-09-27 except the two flagged
MISSING crafting artifacts. Path roots: this repo (FF14-Decomp) for
`docs/` + `outputs/`; the read-only main repo (FF14-Memory) for
`Data/scripts/…`, `Data/sql/…`, `tools/…`.

Machine companion: `outputs/class-quest-20-30-36-atlas-20260927/coverage_matrix.csv`
(51 rows; 1/0 per layer from actual file inspection, case-insensitive code match).

Coverage key used in §1: MI master index · PK pack doc+CSVs (M melee / R ranged /
G gathering; crafting has none) · GL global chocobo/fight audit · RW reward/marker/event
audit · HD director/handler audit · GT gate audit · SJ sequence/journal audit ·
MR mob-roster audit · ST stub-config audit · RT shared-runtime decomp · HN harness.
Impl status from main-repo file inspection 2026-09-27: `bespoke-N` = N-line custom
Lua; `stub` = 3-line `InitClassQuest` template delegation; `HOLD` = documented,
do-not-implement gap (gathering doc §5).

## 1. Per-quest table

| id | code | pack | impl status | layers | enablement |
|---|---|---|---|---|---|
| 110060 | Pgl200 | melee | bespoke-530 | MI,PK-M,GL,RW,HD,GT,SJ,MR,RT,HN | disabled |
| 110061 | Pgl300 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110062 | Pgl306 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110080 | Gla200 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110081 | Gla300 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110082 | Gla306 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110100 | Exc200 | melee | stub | MI,PK-M,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110101 | Exc300 | melee | bespoke-404, no battle | MI,PK-M,GL,RW,HD,GT,SJ,HN | disabled |
| 110102 | Exc306 | melee | bespoke-420, reference impl | MI,PK-M,GL,RW,HD,GT,SJ,MR,RT,HN | **enabled** |
| 110160 | Arc200 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | **enabled** |
| 110161 | Arc300 | ranged | bespoke-324 | MI,PK-R,GL,RW,HD,GT,SJ,MR,RT,HN | **enabled** |
| 110162 | Arc306 | ranged | bespoke-356 | MI,PK-R,GL,RW,HD,GT,SJ,MR,RT,HN | **enabled** |
| 110180 | Lnc200 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110181 | Lnc300 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110182 | Lnc306 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110240 | Thm200 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110241 | Thm300 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110242 | Thm306 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110260 | Cnj200 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110261 | Cnj300 | ranged | stub | MI,PK-R,GL,RW,HD,GT,MR,ST,RT,HN | disabled |
| 110262 | Cnj306 | ranged | bespoke-339 | MI,PK-R,GL,RW,HD,GT,SJ,MR,RT,HN | disabled |
| 110300 | Wdk200 | crafting | bespoke-259 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110301 | Wdk300 | crafting | bespoke-257 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110302 | Wdk306 | crafting | bespoke-248 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110320 | Bsm200 | crafting | bespoke-243 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110321 | Bsm300 | crafting | bespoke-181 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110322 | Bsm306 | crafting | bespoke-279 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110360 | Gld200 | crafting | bespoke-277 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110361 | Gld300 | crafting | bespoke-262 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110362 | Gld306 | crafting | bespoke-250 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110380 | Tan200 | crafting | bespoke-277 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110381 | Tan300 | crafting | bespoke-241 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110382 | Tan306 | crafting | bespoke-308 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110400 | Wvr200 | crafting | bespoke-205 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110401 | Wvr300 | crafting | bespoke-239 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110402 | Wvr306 | crafting | bespoke-233, trigger HOLD (X4) | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110420 | Alc200 | crafting | bespoke-221, MSQ-110013 gate | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110421 | Alc300 | crafting | bespoke-209 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110422 | Alc306 | crafting | bespoke-210 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110440 | Cul200 | crafting | bespoke-206 | MI,GL,RW,HD,GT,SJ,HN | **enabled** |
| 110441 | Cul300 | crafting | bespoke-165 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110442 | Cul306 | crafting | bespoke-239 | MI,GL,RW,HD,GT,SJ,HN | disabled |
| 110460 | Min200 | gathering | bespoke-271 (dual-source, template read-only) | MI,PK-G,GL,RW,HD,GT,ST,HN | disabled |
| 110461 | Min300 | gathering | stub, HOLD (G1) | MI,PK-G,GL,RW,HD,GT,ST,HN | disabled |
| 110462 | Min306 | gathering | stub, HOLD (G2) | MI,PK-G,GL,RW,HD,GT,ST,HN | disabled |
| 110480 | Hrv200 | gathering | stub, HOLD (G3) | MI,PK-G,GL,RW,HD,GT,ST,HN | disabled |
| 110481 | Hrv300 | gathering | bespoke-464 | MI,PK-G,GL,RW,HD,GT,SJ,HN | disabled |
| 110482 | Hrv306 | gathering | stub, HOLD (G4, template noOffer) | MI,PK-G,GL,RW,HD,GT,ST,HN | disabled |
| 110500 | Fsh200 | gathering | bespoke-202 | MI,PK-G,GL,RW,HD,GT,SJ,HN | **enabled** |
| 110501 | Fsh300 | gathering | bespoke-355, HOLD-gated (G5) | MI,PK-G,GL,RW,HD,GT,SJ,HN | disabled |
| 110502 | Fsh306 | gathering | bespoke-305, HOLD-gated (G5/G6) | MI,PK-G,GL,RW,HD,GT,SJ,HN | disabled |

Enablement source: `outputs/class-quest-20-30-36-master-index-20260927/quest_list.csv`
(availability column); enabled set = 110102, 110160–110162, 110440, 110500.
No enablement flips are permitted by any pack (master-index work order).

## 2. Per-layer summaries

- Master index (`docs/class-quest-20-30-36-master-index-2026-09-27.md` +
  `outputs/class-quest-20-30-36-master-index-20260927/quest_list.csv`): proves the
  51-quest roster with IDs/names/codes/levels/prereqs from
  `FF14-Memory/Data/sql/gamedata_quests.sql`, assigns the four worker packs with
  non-overlapping files, and fixes the implementation rule (edit quest Lua +
  `QuestDirectorClass*`, never flip `quest_availability.lua`, SQL stays source of truth).
- Melee (`docs/class-quest-melee-pgl-gla-exc-indepth-decomp-2026-09-27.md` +
  `outputs/class-quest-melee-decomp-20260927/` — sequences, process_events, markers,
  actors, fight_waves, rewards): proves all 9 PGL/GLA/EXC routes end to end,
  including the Pgl200 bespoke coin ladder, Exc300 journal ladder, and Exc306
  survival/rematch reference implementation; 2026-09-27 delta adds the Pgl200 level
  gate and nil-tolerant offers. Key gap: 3 validators blocked on scenario files
  absent from this checkout (M2).
- Ranged (`docs/class-quest-ranged-arc-lnc-thm-cnj-indepth-decomp-2026-09-27.md` +
  `outputs/class-quest-ranged-decomp-20260927/` — actors, events, fights, markers,
  rewards, sequences): proves all 12 ARC/LNC/THM/CNJ routes, with Arc300/306 and
  Cnj306 as custom scripts (escape/duel/escort/echo duties) and the rest on the
  shared driver; 2026-09-27 delta fixes the `cleanupOwnsEvent` double-`EndEvent`
  and one-time Thm200/300 proof grants. All 12 route validators PASS per the doc.
- Gathering (`docs/class-quest-gathering-indepth-decomp-2026-09-27.md` +
  `outputs/class-quest-gathering-decomp-20260927/` — quest_list, gathering_targets,
  markers, rewards, events, gaps): proves Min200 bespoke baseline promotion and
  the implemented Min200/Hrv300/Fsh200 trio, and pins the six HOLD quests with a
  per-blocker `gaps.csv`; also proves pool truth (Min200/Hrv300 rows live only in
  live migrations; Fsh200 in main fishing SQL; Hrv200 has no pool anywhere).
- Global chocobo/fight audit
  (`docs/class-quest-20-30-36-global-chocobo-fight-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-global-audit-20260927/` — chocobo_audit,
  fight_surface, stub_full): proves zero chocobo/mount spawn APIs across all quest
  files + directors, and the FULL-vs-STUB split that tells implementers where truth
  lives (bespoke file vs `class_quest_template.lua`). Must be re-run after packs land.
- Reward/marker/event audit
  (`docs/class-quest-20-30-36-reward-marker-event-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-reward-marker-event-audit-20260927/coverage.csv`,
  51 rows): proves central gil+marks for all 51 (Pgl200 alone also has central
  item+Exp) and maps template-vs-bespoke event truth, flagging dual-source
  reconciliation duty (Arc300/306, Cnj306, Wvr300's 24-vs-6 gap).
- Director/handler audit
  (`docs/class-quest-20-30-36-director-handler-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-director-handler-audit-20260927/handler_coverage.csv`):
  proves handler matrices for all 51 files (battle FULL, craft 6-handler no-onPush,
  Fsh/Hrv300 bespoke shapes, 21 stubs handler-free by design) and inventories 22
  directors; flags missing Cleanup keys on Cnj300/Gla200-306/Pgl200-306 (X3).
- Gate audit (`docs/class-quest-20-30-36-gate-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-gate-audit-20260927/gate_coverage.csv`, 51 rows):
  proves SQL chain shapes (PGL/GLA/EXC/THM/MIN chain-free; ARC/LNC/CNJ/craft/gather
  chained; Alc200 keeps its 110013 MSQ gate) and per-file class/level gate coverage,
  including the Cnj306 helper-pattern anomaly (R9) and stub gating owned by the driver.
- Sequence/journal audit
  (`docs/class-quest-20-30-36-sequence-journal-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-sequence-journal-audit-20260927/sequence_journal.csv`,
  31 bespoke files): proves retail sequence numbering and counter/journal shapes for
  every bespoke file (battle ladders, craft baselines, Fsh counters, Tan306 probes);
  clarifies Wvr306's tail as interaction-only with unresolved trigger actors (X4).
- Mob-roster audit (`docs/class-quest-20-30-36-mob-roster-audit-2026-09-27.md` +
  `outputs/class-quest-20-30-36-mob-roster-audit-20260927/` — director_configs,
  mob_targets, 64 targets): proves the per-mob checklist (levels/skills/waves,
  retry sequences, requireAllTargets, Thm proof grants) and the two bespoke
  lifecycles (Exc306Survival 300 s, Cnj306Escort 69-node route).
- Stub-config audit (`docs/class-quest-stub-config-audit-2026-09-27.md` +
  `outputs/class-quest-stub-config-audit-20260927/stub_configs.csv`, 20 rows; note
  both live without the `20-30-36` infix): proves all 20 template-owned stubs carry
  SQL-matching classId/level, bound directors (battle) or director-free (gather),
  and tier-ladder Lua EXP; records Hrv306 noOffer as HOLD-consistent and Min200 as
  dual-source with a read-only template row.
- Shared runtime (`docs/class-quest-sqb-runtime-decomp-2026-09-27.md`, source
  `FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua`): proves the 21
  CONFIG-frame directors close every director-level loophole once (owner binding,
  class-ID kill reconciliation, settle re-validation, teardown order), so pack work
  only needs correct CONFIGs + door/retry wiring.
- Harness (`FF14-Memory/tools/validate_class_quest_20_30_36.py`, mentions all 51
  quest IDs): proves the static cross-quest contract (files exist, handler/gate/
  UpdateENPCs coverage, no chocobo APIs, central gil/marks + explicit Lua EXP,
  availability list, battle directors, template entries except Pgl200/Exc300/Hrv300).

## 3. Open-gaps register

Melee owner: M1 live-client acceptance for all fights/scenes (adapter offsets, not
retail XYZ; scaffold heights). M2 re-run gla200/exc300/exc306 validators where the
scenario files exist (missing in this checkout; non-scenario asserts manually green).
M3 inventory-full retry missing on template completion-item grants (Exc200 4040405,
Gla200 4030203) — shared driver, needs a driver-level pass. M4 Exc300 briefing `==1`
hard-gate (nil stalls; safe direction). M5 unbound-by-design: Pgl300 ship-object
callback, Pgl306 `_2` twins, Gla300 marker 11008109, Gla306 Echo/refugee chain (needs
Echo/past-area director), Exc300/306 ambients, Exc306 warehouse geography/offsets/
levels 34–40 authored, party cap 3 default.

Ranged owner: R1 Owl-gate/Keelty-post/trigger Y scaffolds. R2 Arc306 exit transforms +
Yarzon counts. R3 spawn offsets/party caps (rank defaults). R4 Thm306 yield threshold/
rival skills. R5 Cnj300 aspect resists + seq-15 branch approximation. R6 Cnj306 escort
path/mob copies. R7 after-warp lifetimes of 010/040-class events. R8 unbound flavor
variants per quest; Lnc200 Linkpearl; Cnj200 Morys appearance. R9 Cnj306 helper-pattern
gate — confirm Conjurer gate fires on every handler.

Gathering owner: G1 Min300 HOLD (parley mutation, buried-box actor, linkpearl owner,
private transitions, echo flags, EXP). G2 Min306 HOLD (escort path, node actors,
pursuer — killing it forbidden by source — linkpearl, failure/retry, EXP, Master of
Rock). G3 Hrv200 HOLD (leaf/weed count, no pool carries 11000018 anywhere, marker-02
ownership, 1090046 multiplexing, SQL-0-vs-archive-110013 prereq conflict, linkpearl,
EXP) — needs a gathering-expansion workstream, not a script edit. G4 Hrv306 HOLD
(seed/faeces formula, node/hazard actors, sleep/wake lifecycle, handoffs, 030 payload,
delivery actors, reward owner, EXP). G5 Fsh300 HOLD (Barrel zone/coords + boat travel,
emote binding, fresh-catch rule, wider species; never enable for testing). G6 Fsh306
HOLD (assignment duration, state-0 push owner, sale payout, state-20 extension,
fresh-vs-preowned; DEV_BYPASS is GM-local only). G7 Min200/Hrv300 pool rows live only
in live migrations (accepted main-SQL updater gap). G8 EXP unresolved: Min200 0,
Hrv300 0, Fsh300 max 3420, Fsh306 max 4720.

Cross-layer: X1 re-run global chocobo/fight audit after packs land (global owner).
X2 Wvr300 24 template events vs 6 wired (crafting owner). X3 missing Cleanup key on
Cnj300/Gla200-306/Pgl200-306 — confirm cleanup path (melee/ranged owners). X4 Wvr306
trigger owners unresolved — do not ship as 100% (crafting owner). X5 stub classId+level
re-verification on any driver change (template owner). X6 Min200 template row stays
read-only reference (gathering owner).

## 4. Landing checklists for the two still-open packs

Ranged (doc + 6 CSVs landed; 12/12 route validators PASS per the doc; bespoke
arc300/arc306/cnj306 + 9 stubs present in the main repo): to match the landed
melee/gathering standard it still needs (a) R1–R9 each closed or re-scoped as HOLD
with per-quest evidence, (b) X3 cleanup-path confirmation for Cnj300, (c) live-client
acceptance run for the escape/duel/escort/echo duties (M1-equivalent), (d) X1 global
audit re-run plus the cross-quest harness green after any fix. No new CSV shape is
needed — extend the existing six files in place.

Crafting (21 bespoke main-repo files exist and are covered by GL/RW/HD/GT/SJ/HN, but
no pack doc or CSVs exist here): to match the landed standard it needs (a) MISSING —
`docs/class-quest-crafting-indepth-decomp-2026-09-27.md` with per-quest routes,
branch/counter logic, snapshot baselines, grant/consume accounting and HOLD verdicts,
(b) MISSING — `outputs/class-quest-crafting-decomp-20260927/` with at least
sequences/events/markers/actors/rewards/gaps CSVs mirroring the gathering pack's
six-file shape, (c) X2 Wvr300 event-gap reconciliation and X4 Wvr306 trigger-HOLD
scoping inside that doc, (d) implementation-gap closure for any wired-but-unproven
grant/consume path, then (e) X1 + harness. Do not invent the missing doc content
from the cross-cutting audits alone — the per-quest decomp pass is still owed.

## 5. Missing artifacts (do not invent)

1. `docs/class-quest-crafting-indepth-decomp-2026-09-27.md` — referenced by the
   master index §worker-packs, absent from `docs/`.
2. `outputs/class-quest-crafting-decomp-20260927/` — referenced by the master index,
   absent from `outputs/`.
3. Naming note (not missing): the stub-config layer omits the `20-30-36` infix in
   both doc and outputs dir; the matrix `stub_config` column maps to those exact paths.
