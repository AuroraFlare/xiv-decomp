# Com5g1 — Into the Dark (Gridania) — 111611

- Level 45, prereq 111603. `patch_1_18`, offer commented in `quest_availability.lua:322` ("Partially implemented - instance"). [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5g1.lua` → `InitDzemaelGrandCompanyQuest("Com5g1")` in `dzemael_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Syro Fulke 1500200 | `processEventFULKEStart(45,4,8)` → accept → `AcceptQuest` | — | 297 |
| 10 | 1000370 (Yuhelmeric), marker 11165003 | `processEvent_010(45,4,8)` | — | 298 |
| 20 | Dyrstweitz 1001154 | `processEvent_020(60,4,8)` briefing, `processEvent_020_1` single entry ask → `DzemaelTryStartFromNpc` | — (inside zone: journal 300 projected) | 299 |
| captain clear | — (DzemaelManager) | `AdvanceIntoTheDarkQuestOnCaptainClear`: flag 20 set, +Draconian Rosary 11000264, 20→40 | +proof | 301 |
| 40 | 1000370 (Yuhelmeric), marker 11165003 | `processEvent_040`, proof required; removes 11000264 | -proof | 301 |
| 50 | Syro Fulke 1500200 | `processEvent_050` + seals-once (4000) + `CompleteGCQuestOnce` (6231 EXP) | — | 302 |

- Dyrstweitz `_020_1` asks once and leaves successful entry open; the Draconian Rosary objective advances separately from Batraal. No quest-local NQ scene. [verified — GC decomp 2026-09-07]
- Gridania has no access item (`consumedAccessItem = 0`); full-inventory race still recoverable via flag 20 at Dyrstweitz. [verified]
- `processEvent_030_1` is the optional post-return Dyrstweitz line. [verified — cutscene audit]

## Markers / flags / journal hooks

- Markers 11165003 at seqs 10/40 (Yuhelmeric). Marker rows verified in `gamedata_actor_class.sql` (1000370 activeQuestVisibility 111611 seqs 10,40). [verified]
- Inside-zone journal projection: at entry seq 20 while in zone 231, journal 300 is shown without changing the quest sequence. [verified]

## Rewards / prereq chain

- 6231 EXP + 4000 Serpent Seals, once-guarded. [verified]
- No `gamedata_quest_rewards` row for 111611 → no double-grant. [verified]
- Template parity: `GC_QUEST_SEALS.Com5g1 = 4000`. [verified]
- Chain: Com0g3 (111603) → Com5g1 (side branch). [verified — SQL]

## Mobs / spawn evidence

- Objective kill: Imperial Primus Ordinarius, BNPC 3140 / actor 2307001, Lv 52, HP 8500, Captain's Quarters. [verified — main mob-type SQL + guard review]
- Kill owned by `DzemaelManager` with exact-seq gate (entry seq 20). No quest-local kill handler, no new spawn, no invented fight. [verified]
- Batraal full clear is separate, not the quest objective. [verified]

## Instanced surface: needed vs existing

- Needed: Dzemael 60-min instance, party 4–8, Dyrstweitz entry, Captain's Quarters objective, `rad0r100`/`rad0r106`, timer, return. Existing: `dzemael_entry.lua` + `DzemaelManager`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: event names/args, journals (+300 projection), proof item, seals/EXP, markers, flag-20 receipt, BNPC identity/stats.
- Code-attested, nameplate-unverified: Yuhelmeric NPC name (cutscene audit label).
- Open: live client acceptance (offer disabled pending retest).
