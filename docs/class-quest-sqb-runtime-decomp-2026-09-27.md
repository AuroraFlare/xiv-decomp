# Shared quest-battle runtime (`gc_sqb_runtime`) decomp — 2026-09-27

Source: `FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua` (498 lines).
Consumers: all 21 `QuestDirectorClass*` battle directors plus `QuestDirectorCnj306Echo`
(the Exc306Survival timer and Cnj306Escort route are bespoke and do NOT use it).
Related: mob roster audit (`class-quest-20-30-36-mob-roster-audit-2026-09-27.md`).

## 1. Owner binding (anti-loophole core)

- `run()` binds once: `ownerId` from the private-area name suffix (`_(%d+)$`), owner = the member
  whose quest sits exactly at `expectedSequence`. Assisting party members can never become owner —
  an orphaned fight cannot survive the holder's disconnect/leave and later credit the wrong character.
- Relog rebinds through `IsSameQuestBattlePlayer` at the session boundary only; an abandoned/reaccepted
  quest on the same Player object is never adopted mid-fight (`boundQuestIsCurrent` fails → `quest-changed`).

## 2. Kill credit (class-ID callback hardened)

- The engine fans the kill callback out per player with only a class ID, so `onKill` reconciles:
  same active wave + same actorClassId + spawned under this director's uniqueId + still in the area
  + actually dead → credited exactly once per uniqueId.
- Wave completion counts kills per `(wave:classId)` against the definition counts, so duplicate callbacks
  and foreign same-class kills cannot advance the wave.
- `requireAllTargets=true` sets `requiredKills = #definitions`; otherwise `config.requiredKills or 1`
  (the single-target Pgl/Gla duels win on the first credited kill).
- `onTargetCredit` proof grants (Thm200 horn, Thm300 item) run in pcall: a rejection fails the duty
  (`spawnFailed`) rather than silently skipping the proof; Thm200's own grant is additionally defensive
  so a full inventory never fails the kill objective.

## 3. Finish paths

| Reason | Trigger |
|---|---|
| `entry-session-replaced` | owner object changed before zone-in completed |
| `entry-failed` | `HasFailedQuestBattleEntry` |
| `disconnect` | owner lost connected session |
| `quest-changed` | abandon/reaccept/sequence moved mid-fight |
| `area-exit` | owner left the private area after entering |
| `death` | owner dead after entering |
| `wave-spawn-failed` | `SpawnEnemyWithMobType` returned nil or aftermath hook errored |
| `timeout` | `timeoutSeconds` (600 standard, 1800 Arc300/Escape) elapsed |
| win (`kill`) | all required kills credited while entered |

- `finish()` waits 2s (death anim/UI settle), then re-validates success (connected, in-area, alive,
  quest current) — a win that decays during the settle becomes a failure, never a reward.
- Success plays the optional `successEvent`/`onSuccess` aftermath, then advances to `successSequence`;
  failure goes to `retrySequence`. If the journal moved during a yielded movie, the sequence is NOT
  rewritten (`success=false` instead) — a stale fight can never stamp a new journal.
- Teardown order: despawn targets → return members via `ExitCurrentContentToReturnPoint`
  (`<prefix>-clear` / `<prefix>-fail`, waits out pending transfers) → retire aftermath actors →
  `ContentFinished`/`CheckDestroy` → `EndDirector`. `BeginQuestBattleFinishingLease` guards the window.

## 4. Entry window

`IsQuestBattleEntryReady` gates `entered=true`; the pre-landing public-area owner is expected and never
treated as abandonment. `aftermathOnly` configs can win on entry without kills.

## 5. What this proves for the packs

Every director-level loophole class in the work order (cross-player credit, relog adoption, duplicate
callbacks, foreign same-class kills, stale-journal writes, entry races, disconnect/death/timeout handling)
is closed once, in this file — pack work only needs correct CONFIGs (sequences, waves, mobs, proofs)
and correct quest-side door/retry wiring, both covered by the cross-quest validator.
No chocobo/mount API exists in this file.
