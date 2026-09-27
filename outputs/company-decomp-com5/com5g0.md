# Com5g0 — Imperial Devices (Gridania) — 111610

- Level 25, prereq 111603 (Adder's Nest Egg). `patch_1_18`, enabled in `quest_availability.lua:321`. [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5g0.lua` → `InitTotorakGrandCompanyQuest("Com5g0")` in `totorak_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Syro Fulke 1500200 (officer, Twin Adder) | `processEventFULKEStart(0,0)` → accept → `AcceptQuest` | — | 292 |
| 10 | Bloisirant 1001150 | `processEvent_010(60)` briefing, `processEvent_010_1` single entry ask → `TotorakTryStartFromNpc` | — | 293 |
| 20 | A Ruhnsenna 1001571 (inside) | `processEvent_020` (no args); `CanUseTotorakQuestNpc` gate | — | 294 |
| 30 | Moogles 1000327/1000328/1000329/1000407 | `processEvent_030` (no args); `CanUseTotorakQuestNpc` gate | +Magitek Recording Plate 11000260 | 294 |
| 50 | Bloisirant 1001150 | `processEvent_050` report, proof required | proof held | 295 |
| 60 | Syro Fulke 1500200 | `processEvent_060` (no trailing arg — Gridania-specific) + seals-once + `CompleteGCQuestOnce` | -proof | 296 |

- Gridania has no intermediary and no access item; briefing duration is the single `_010` argument; completion event takes no trailing `0`, unlike the other two cities. [verified — code + `com5g0.md` reconstruction]
- Five `followEvent_*` methods and `menberCountUnderRange` exist in the client chunk as additional recovery/denial surface, not wired here. [verified — GC decomp 2026-09-07]

## Markers / flags / journal hooks

- `getJournalMapMarkerList` returns `{}`; ENPC flags only. [verified]
- `onStateChange`: SEQ_ACCEPT → officer TALK; seqs 20/30 also flag Bloisirant TALK (re-entry); seq 60 officer REWARD. [verified]

## Rewards / prereq chain

- 2160 EXP + 1000 Serpent Seals (item 1000202), both once-guarded (flags 22/23). [verified]
- No `gamedata_quest_rewards` row for 111610 → no double-grant. [verified]
- Template parity: `GC_QUEST_SEALS.Com5g0 = 1000`. [verified]
- Chain: Com0g3 (111603) → Com5g0 (side branch). [verified — SQL]

## Mobs / spawn evidence

- No quest-owned kills; instance combat owned by Toto-Rak. No BNPC profile, no new spawn. [verified]

## Instanced surface: needed vs existing

- Needed: Toto-Rak 60-min instance, party 2–4, Bloisirant entry. Existing: `totorak_entry.lua` + `WorldManager.StartTotorakInstance`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: event names/args (incl. Gridania no-arg completion), journals, proof item, seals/EXP, ENPC IDs, marker-less policy.
- Code-attested, nameplate-unverified: "A Ruhnsenna" binding (code constant).
