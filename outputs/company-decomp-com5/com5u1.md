# Com5u1 — Into the Dark (Ul'dah) — 111811

- Level 45, prereq 111803. `patch_1_18`, offer commented in `quest_availability.lua:328` ("Partially implemented - instance"). [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5u1.lua` → `InitDzemaelGrandCompanyQuest("Com5u1")` in `dzemael_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Aubrey 1500198 | `processEventAUBREYStart` → accept → `AcceptQuest` | +Norwick Knight's Sigil 11000265 | 356 |
| 10 | 1000586 (Vairemont), marker 11175003 | `processEvent_010(45,4,8)` | — | 357 |
| 20 | Dyrstweitz 1001154 | `processEvent_020(60,4,8)` briefing, `processEvent_020_1` single entry ask → `DzemaelTryStartFromNpc` | — (inside zone: journal 359 projected) | 358 |
| captain clear | — (DzemaelManager) | `AdvanceIntoTheDarkQuestOnCaptainClear`: flag 20 set, +Silver-winged Kabuto 11000266, 20→30 | +proof | 360 |
| 30 | 1000586 (Vairemont), marker 11175003 | `processEvent_030`, proof required; removes 11000265 + 11000266 | -sigil, -proof | 360 |
| 40 | Aubrey 1500198 | `processEvent_040` + seals-once (4000) + `CompleteGCQuestOnce` (6231 EXP) | — | 361 |

- Norwick's sigil and the Silver-winged Kabuto objective are not the dungeon's full clear; `_020_1` entry accepts with talk open; default duty scenes/return belong to occupancy. [verified — GC decomp 2026-09-07]
- `processEvent_020_2` is the optional post-return Dyrstweitz line. [verified — cutscene audit]
- Ul'dah is the only Into-the-Dark variant whose report step retires two items (sigil + proof). [verified]

## Markers / flags / journal hooks

- Markers 11175003 at seqs 10/30 (Vairemont). Marker rows verified in `gamedata_actor_class.sql` (1000586 activeQuestVisibility 111811 seqs 10,30). [verified]
- Inside-zone journal projection: at entry seq 20 while in zone 231, journal 359 is shown without changing the quest sequence. [verified]

## Rewards / prereq chain

- 6231 EXP + 4000 Flame Seals, once-guarded. [verified]
- No `gamedata_quest_rewards` row for 111811 → no double-grant. [verified]
- Template parity: `GC_QUEST_SEALS.Com5u1 = 4000`. [verified]
- Chain: Com0u3 (111803) → Com5u1 (side branch). [verified — SQL]

## Mobs / spawn evidence

- Objective kill: Imperial Primus Ordinarius, BNPC 3140 / actor 2307001, Lv 52, HP 8500, Captain's Quarters. [verified — main mob-type SQL + guard review]
- Kill owned by `DzemaelManager` with exact-seq gate (entry seq 20). No quest-local kill handler, no new spawn, no invented fight. [verified]
- Batraal full clear is separate, not the quest objective. [verified]

## Instanced surface: needed vs existing

- Needed: Dzemael 60-min instance, party 4–8, Dyrstweitz entry, Captain's Quarters objective, `rad0r100`/`rad0r106`, timer, return. Existing: `dzemael_entry.lua` + `DzemaelManager`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: event names/args, journals (+359 projection), sigil/proof items, seals/EXP, markers, flag-20 receipt, BNPC identity/stats.
- Code-attested, nameplate-unverified: Vairemont NPC name (cutscene audit label).
- Open: live client acceptance (offer disabled pending retest).
