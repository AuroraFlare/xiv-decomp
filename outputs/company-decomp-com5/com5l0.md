# Com5l0 — Imperial Devices (Limsa Lominsa) — 111410

- Level 25, prereq 111403 (Seals for the Whorl). `patch_1_18`, enabled in `quest_availability.lua:315`. [verified — SQL + availability]
- Wrapper `Data/scripts/quests/com/com5l0.lua` → `InitTotorakGrandCompanyQuest("Com5l0")` in `totorak_gc_quest.lua`. [verified]

## Sequence flow

| Seq | ENPC | Delegate event | Items | Journal |
| --- | ---- | -------------- | ----- | ------- |
| ACCEPT/0 | Guincum 1500199 (officer, Maelstrom) | `processEventGUINCUMStart(0,0)` → accept → `AcceptQuest` | +Stillglade Fane Petition 11000267 | 246 |
| 5 | Zerig 1000510 (intermediary) | `processEvent_005(0,0)` | -petition, +Sealed Urn 11000268 | 247 |
| 10 | Bloisirant 1001150 (Toto-Rak entrance) | `processEvent_010(0,60)` briefing, `processEvent_010_01` single entry ask → `TotorakTryStartFromNpc` | — | 248 |
| 15 | Moogles 1000327/1000328/1000329/1000407 (Teary) | `processEvent_015(routeVariant)`; `CanUseTotorakQuestNpc` gate | -urn, +Blackened Accumulator 11000263 | 249 |
| 20 | Bloisirant 1001150 | `processEvent_020(0,0)` report, proof required | proof held | 250 |
| 25 | Guincum 1500199 | `processEvent_025(0)` + seals-once + `CompleteGCQuestOnce` | -proof | 251 |

- Route variant (`field1` unique-id → 1 else 0) is forwarded into the moogle event. [verified — code]
- Entry duration 60 min is passed as the second briefing argument; the ask leaves talk open on accept and the occupancy guide confirmation is skipped so the prompt fires once. [verified — code + `com5l0.md` reconstruction]
- `menberCountUnderRange(a..f)` party-size denial is a separate client surface, not wired here. [verified — GC decomp 2026-09-07]

## Markers / flags / journal hooks

- `getJournalMapMarkerList` returns `{}`: no zone-159 marker surface; ENPC quest flags are the interaction markers. [verified]
- `onStateChange`: SEQ_ACCEPT → officer TALK; seq 15 also flags Bloisirant TALK (re-entry) alongside moogles; seq 25 officer REWARD. [verified]
- Stale-item retirement for this code only: petition removed at seq 10/15/20/25, urn at 20/25. [verified]

## Rewards / prereq chain

- 2160 EXP + 1000 Storm Seals (item 1000201), seals via `GrantGCQuestSealsOnce` (flag 22), EXP via `GrantGCQuestExpOnce` (flag 23). [verified]
- No `gamedata_quest_rewards` row for 111410 → no SQL auto-grant, no double-grant. [verified — grep empty]
- Template parity: `GC_QUEST_SEALS.Com5l0 = 1000`. [verified]
- Chain: Com0l3 (111403) → Com5l0 → (side branch; no child prereq). [verified — SQL]

## Mobs / spawn evidence

- No quest-owned kills. Combat happens inside the existing Toto-Rak instance (zone 159) via `TotorakTryStartFromNpc`; no BNPC profile, no new spawn. [verified]
- Moogle actors are talk NPCs gated by `CanUseTotorakQuestNpc`, not combatants. [verified]

## Instanced surface: needed vs existing

- Needed: Toto-Rak 60-min timed instance, party 2–4, entry from Bloisirant. Existing: `totorak_entry.lua` + `WorldManager.StartTotorakInstance`. No gap, no invented fight. [verified]

## Inferred vs verified

- Verified: all event names/args, journals, items, seals/EXP, ENPC IDs, marker-less policy, entry arg convention.
- Code-attested, nameplate-unverified: "Zerig" intermediary label (code comment).
