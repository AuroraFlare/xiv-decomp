# Drg0j2 — Lance of Fury (111322, Lv35) — implemented adapter

- Quest ID 111322 (VERIFIED). Prerequisite 111321. Base 8 / job 19 /
  secondary 2/15, level 35. Offer NPC 1002001 (Alberic), `offer = true`.
- Decomp: `job-gc-decomp-20260907/quests/drg0j2.json` (luac sha pinned).
  Decomp events (VERIFIED): accept `processEventALBERICStart`, complete
  First+Second, completeAfter Third.

## Sequence flow

- SEQ_ACCEPT → 0: Alberic `processEventALBERICStart` (result 1) →
  AcceptQuest (no start items).
- 0 → 5: route step — Alberic `processEvent000_ALBERICS`, marker
  11226101 → private battle (retry actor = Alberic).
- 5: `QuestDirectorJobDrg0j2` — one Bomb Baron, `requireAllTargets` →
  success sequence 10.
- 10: Alberic completion hooks (51126/2000204 dialogue, action 27272,
  link-shell actor 1000275 event 85) → EXP 3360 (sqrwa + AddExp) → single
  `CompleteQuest`.

## ENPC/BNPC IDs

- 1002001 Alberic, 1000275 link-shell actor (VERIFIED).
- 2101610 / mob 3007 "Bomb Baron", uniqueId `drg0j2_bomb_baron`, skill
  list 12 (Bomb family: Fireball, Self-destruct, Combustion, Fast Burn,
  Burning Cyclone, Firecracker Shower, Hellfire, Firedamp, Fire II,
  Burn II — VERIFIED director header). Profile added to main SQL by
  Phase 3 (was missing → null spawn).

## Markers

11226101 (battle + route; journal recommends 4 total participants).
No source X/Z: Cassiopeia Hollow (Eastern La Noscea, zone 130) is
journal geography, not a placed spawn. Retail field trigger owner and
phase/balance timing unverified.

## Rewards (script-owned, no central rows — VERIFIED)

- EXP 3360, action 27272. No gil/marks rows.

## Prereq chain

Requires 111321. Gates 111323.

## Instance surface

- Needed: Cassiopeia Hollow Bomb Baron objective.
- Existing: private adapter with the exact combat identity. Retail
  placement/trigger stays an adapter limitation (labeled, not invented).
