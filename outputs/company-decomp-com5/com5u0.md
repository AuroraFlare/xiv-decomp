# Com5u0 — Imperial Devices (Ul'dah) — 111810

- Level 25, prereq 111803 (Burning a Hole in One's Pocket). `patch_1_18`, enabled in `quest_availability.lua:327`. [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5u0.lua` → `InitTotorakGrandCompanyQuest("Com5u0")` in `totorak_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Aubrey 1500198 (officer, Immortal Flames) | `processEventAUBREYStart(0)` → accept → `AcceptQuest` | — | 349 |
| 5 | Nuala 1000681 (intermediary) | `processEvent_005(0,0,0)` | — | 350 |
| 10 | Bloisirant 1001150 | `processEvent_010(60)` briefing, `processEvent_010_01` single entry ask → `TotorakTryStartFromNpc` | — | 351 |
| 15 | Moogles 1000327/1000328/1000329/1000407 | `processEvent_015(routeVariant)`; `CanUseTotorakQuestNpc` gate | +Shattered Gauntlet 11000261, +Magitek Cooling Plate 11000262 | 352 |
| 20 | Bloisirant 1001150 | `processEvent_020(0)` report, both proofs required | proofs held | 353 |
| 25 | Aubrey 1500198 | `processEvent_025(0)` + seals-once + `CompleteGCQuestOnce` | -proofs | 354 |

- Ul'dah is the only variant with two proof items, both granted at the moogle step. [verified — code]
- `menberCountUnderRange(a,b)` party-size denial is a separate client surface. [verified — GC decomp 2026-09-07]

## Markers / flags / journal hooks

- `getJournalMapMarkerList` returns `{}`; ENPC flags only. [verified]
- `onStateChange`: SEQ_ACCEPT → officer TALK; seq 15 also flags Bloisirant TALK (re-entry); seq 25 officer REWARD. [verified]

## Rewards / prereq chain

- 2160 EXP + 1000 Flame Seals (item 1000203), both once-guarded (flags 22/23). [verified]
- No `gamedata_quest_rewards` row for 111810 → no double-grant. [verified]
- Template parity: `GC_QUEST_SEALS.Com5u0 = 1000`. [verified]
- Chain: Com0u3 (111803) → Com5u0 (side branch). [verified — SQL]

## Mobs / spawn evidence

- No quest-owned kills; instance combat owned by Toto-Rak. No BNPC profile, no new spawn. [verified]

## Instanced surface: needed vs existing

- Needed: Toto-Rak 60-min instance, party 2–4, Bloisirant entry. Existing: `totorak_entry.lua` + `WorldManager.StartTotorakInstance`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: event names/args, journals, dual proof items, seals/EXP, ENPC IDs, marker-less policy.
- Code-attested, nameplate-unverified: "Nuala" intermediary label (code comment).
