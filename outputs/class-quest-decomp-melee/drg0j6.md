# Drg0j6 — Into the Dragon's Maw (111326, Lv50) — implemented adapter

- Quest ID 111326 (VERIFIED). Prerequisite 111325. Base 8 / job 19 /
  secondary 2/15, level 50. Offer NPC 1002001 (Alberic), `offer = true`.
- Decomp: `job-gc-decomp-20260907/quests/drg0j6.json` (luac sha pinned).
  Decomp events (VERIFIED): accept `processEventALBERICStart`, complete
  `processEvent030`.
- Battle markers 11226502 (fight) / 11226501 (route) / 11226503 (reward),
  director `Quest/QuestDirectorJobDrg0j6`, 8-party cap (maximum evidence),
  `requireAllTargets = true`, `preEvent = "processEvent010"` (client fades
  into `Drg0j610` before the Griffin Bridge scene; director owns only the
  private kill boundary), `successEvent = "processEvent020"`.

## Sequence flow

- Alberic `processEvent000` (11226501) → `Drg0j610` lead-in → Estinien +
  Greywine → success-owned `processEvent020`/`Drg0j620` + return →
  Alberic `processEvent030` reward presentation → action 27268, item
  8032704 → single `CompleteQuest`. EXP 0 (template omits `exp`).

## ENPC/BNPC IDs (exact local bindings — VERIFIED director + template)

- 2289038 / 3028 "Estinien Wyrmblood" (skill list 15 boss_physical:
  Jump/Wyvern Dive; bind/stun affair noted as presentation, not a
  fabricated threshold machine).
- 2202208 / 3049 "Greywine" (skill list 26 drake: Ring of Thorns + drake
  family; purple glow = stop-attack/move-away counter window, noted not
  fabricated).
- Both profiles added to main SQL by Phase 3 (were missing → null
  spawn).

## Markers

11226501/02/03. Journal: `{[0]=0,[5]=0,[10]=1}` (Roc 34, 34, 35 —
revelation follows victory).

## Rewards (script-owned, no central rows — VERIFIED)

- Action 27268, item 8032704. EXP 0. No gil/marks rows.

## Prereq chain

Requires 111325. Terminal quest of the Dragoon chain.

## Instance surface

- Needed: Griffin Bridge encounter + Drg0j610/620 scenes.
- Existing: full private adapter. Field placement and original encounter
  mechanics remain adapter limitations (labeled, not invented).
