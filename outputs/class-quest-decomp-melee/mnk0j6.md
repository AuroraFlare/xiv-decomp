# Mnk0j6 — Return of the King...of Ruin (111226, Lv50) — implemented adapter

- Quest ID 111226 (VERIFIED). Prerequisite 111225. Base 2 / job 15 /
  secondary 8/15, level 50. Offer NPC 1060033 (Erik), `offer = true`,
  `privateAftermath = true`, reward actor 1060032 (Widargelt).
- Decomp: `job-gc-decomp-20260907/quests/mnk0j6.json` (luac sha pinned).
  Decomp events (VERIFIED `JOB_QUEST_DECOMP_EVENTS`): accept
  `processEventERIKStart`; complete `processEvent020(8032702)` +
  `processEventClear` (the argument drives the client item widget; the
  server grant stays authoritative). Template `preEvent =
  "processEvent005"` with args `{true}` selects the decomp default-fade
  branch into `mnk0j610`.
- Battle markers 11221501/11221502, director
  `Quest/QuestDirectorJobMnk0j6`, 8-party cap (recommendation evidence),
  `requireAllTargets = true`.

## Sequence flow

- SEQ_ACCEPT → 0: Erik `processEventERIKStart` → AcceptQuest.
- 0 → 5: Erik launches the private battle (retry actor = Erik).
- 5: four exact targets (see below) → `onSuccess = aftermath.runBattle`
  → victory persisted at sequence 9 BEFORE any movie/NPC allocation.
- 9: `job_quest_aftermath` scene phase — `processEvent015` movie, real
  same-content reload (AfterWarp), then sequence 10.
- 10: private Widargelt (`mnk0j6_aftermath_widargelt`, actor 1060032)
  owns `processEvent020` + `processEventClear` + AF item 8032702 and
  action 27106, then single `CompleteQuest`. No EXP row (template
  `exp` absent → 0; VERIFIED).
- Interrupted aftermath: public Erik reopens it via
  `jobAftermath.startRecovery` (aftermath-only shell) without repeating
  combat; victory survives timeout/departure/reconnect.

## ENPC/BNPC IDs (exact local bindings — VERIFIED director header)

- 2289039 / 3115 Widargelt the Watcher (skill list 15 boss-physical)
- 2289040 / 3036 Ala Mhigan pikeman (skill list 15)
- 2289041 / 3032 Ala Mhigan axeman (skill list 15)
- 2289043 / 3037 Ala Mhigan shaman (skill list 14 boss-magic)
- All four profiles added to main SQL by Phase 3 (see return note);
  previously missing → `SpawnEnemyWithMobType` returned null.

## Markers

11221501/11221502 (battle). Journal: `{[0]=0,[5]=1,[9]=2,[10]=2}`
(Wil 555-557).

## Rewards (script-owned, no central rows — VERIFIED)

- Action 27106, item 8032702. EXP 0. No gil/marks rows.

## Prereq chain

Requires 111225. Terminal quest of the Monk chain.

## Instance surface

- Needed: Silvertear Falls battle + Widargelt aftermath.
- Existing: full private adapter (battle director + aftermath director
  `QuestDirectorJobMnk0j6Aftermath`). Retail Silvertear placement,
  after-warp owner and chakra-phase mechanics remain adapter limitations
  (documented, not invented).
