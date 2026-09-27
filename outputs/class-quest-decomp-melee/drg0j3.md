# Drg0j3 — Unfading Scars (111323, Lv40) — implemented adapter

- Quest ID 111323 (VERIFIED). Prerequisite 111322. Base 8 / job 19 /
  secondary 2/15, level 40. Offer NPC 1002001 (Alberic), `offer = true`.
- Decomp: `job-gc-decomp-20260907/quests/drg0j3.json` (luac sha pinned).
  Decomp events (VERIFIED): accept `processEventALBERICStart`, complete
  First+Second, completeAfter Third.

## Sequence flow

- SEQ_ACCEPT → 0: Alberic accept → route step `processEvent000_ALBERICS`
  (marker 11226201, the recovered second-Alberic handoff) → private
  battle → success sequence 10 → Alberic completion (51126/2000204,
  action 27267, link-shell actor 1000275 event 86) → EXP 4260 → single
  `CompleteQuest`.

## ENPC/BNPC IDs

- 1002001 Alberic, 1000275 link-shell (VERIFIED).
- 2106207 / display 3106209 / mob 3101 "Spitfire", uniqueId
  `drg0j3_spitfire`, skill list 1 (Frenetic Flurry, Romp, Triple Tumble —
  recovered Spriggan family; eLeMeN list 6035 also records Frenetic Flurry
  for Spitfire — VERIFIED director header). Profile added to main SQL by
  Phase 3 (was missing → null spawn).

## Markers

11226201 (battle + route; 4-person recommendation). Millers' Glade /
eastern Coerthas lowlands is journal geography, not a placed spawn.

## Rewards (script-owned, no central rows — VERIFIED)

- EXP 4260, action 27267. No gil/marks rows.

## Prereq chain

Requires 111322. Gates 111324.

## Instance surface

- Needed: open-world Spitfire objective near Millers' Glade.
- Existing: private adapter with the exact target/profile. Retail
  placement/trigger owner and NM balance unverified (labeled).
