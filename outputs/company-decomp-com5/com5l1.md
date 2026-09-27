# Com5l1 — Into the Dark (Limsa Lominsa) — 111411

- Level 45, prereq 111403. `patch_1_18`, offer commented in `quest_availability.lua:316` ("Partially implemented - instance"). [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5l1.lua` → `InitDzemaelGrandCompanyQuest("Com5l1")` in `dzemael_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Guincum 1500199 | `processEventGUINCUMStart` → accept → `AcceptQuest` | — | 252 |
| 10 | 1001064 (Hasthwab) | `processEvent_010` | — | 253 |
| 20 | 1001635 (Quiliane), marker 11155004 | `processEvent_020(45,4,8)` | +Faces of Mercy Medallion 11000269 | 254 |
| 30 | Dyrstweitz 1001154 (Dzemael entrance) | `processEvent_030(60,4,8)` briefing, `processEvent_030_1` single entry ask → `DzemaelTryStartFromNpc` | — (inside zone: journal 256 projected) | 255 |
| captain clear | — (DzemaelManager) | `AdvanceIntoTheDarkQuestOnCaptainClear`: flag 20 set, +Magitek Dowsing Rod 11000270, -medallion, 30→40 | +proof / -access | 257 |
| 40 | 1001635 (Quiliane), marker 11155004 | `processEvent_040`, proof required; removes 11000269 + 11000270 | -proof | 257 |
| 50 | Guincum 1500199 | `processEvent_050` + seals-once (4000) + `CompleteGCQuestOnce` (6231 EXP) | — | 258 |

- Dyrstweitz `_030_1` owns the single entry question, not the duty's scenes; `processEvent_030_2` is an optional post-return Dyrstweitz line. [verified — GC decomp 2026-09-07]
- Full-inventory race: if the proof could not be delivered at clear time, flag 20 persists and Dyrstweitz re-grants the proof at seq 30, then advances to 40 and retires the medallion. [verified — manager + Lua entry branch]
- Entry args are (duration 60, min party 4, max party 8); `LEVEL = 45` forwarded to briefing events. [verified]

## Markers / flags / journal hooks

- Markers 11155004 at seqs 20/40 (Quiliane). Marker rows verified in `gamedata_actor_class.sql` (1001635 activeQuestVisibility 111411 seqs 20,40). [verified]
- Inside-zone journal projection: at entry seq 30 while in zone 231, journal 256 is shown without changing the quest sequence. [verified — code]
- `onStateChange`: SEQ_ACCEPT → seq-0 NPC TALK; entry/reward flags per state; optional Dyrstweitz NPC flagged at report seq. [verified]

## Rewards / prereq chain

- 6231 EXP + 4000 Storm Seals, once-guarded. [verified]
- No `gamedata_quest_rewards` row for 111411 → no double-grant. [verified]
- Template parity: `GC_QUEST_SEALS.Com5l1 = 4000`. [verified]
- Chain: Com0l3 (111403) → Com5l1 (side branch). [verified — SQL]

## Mobs / spawn evidence

- Objective kill: Imperial Primus Ordinarius, BNPC 3140 / actor 2307001, Lv 52, HP 8500, Captain's Quarters (user point 130; guard envelope review). [verified — `server_battlenpc_mob_types.sql`, `dzemael_captain_guard_review.json`]
- Kill owned by `DzemaelManager` (exact-seq gate: only quest at entry seq advances; helpers/completed-access players unaffected). No quest-local `onKillBNpc`, no new spawn, no invented fight. [verified]
- Batraal full-dungeon clear is separate and NOT the quest objective. [verified — cutscene-transition audit]

## Instanced surface: needed vs existing

- Needed: Dzemael 60-min instance, party 4–8, Dyrstweitz entry, Captain's Quarters objective, occupancy scenes `rad0r100`/`rad0r106`, timer, return point. Existing: `dzemael_entry.lua` + `DzemaelManager`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: event names/args, journals (+256 projection), items, seals/EXP, markers, flag-20 receipt, BNPC identity/stats.
- Code-attested, nameplate-unverified: Hasthwab/Quiliane NPC names (cutscene audit labels).
- Open: live client acceptance (offer disabled pending retest).
