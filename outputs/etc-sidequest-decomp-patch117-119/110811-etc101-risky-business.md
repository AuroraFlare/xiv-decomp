# 110811 — Risky Business (Etc101)

- Patch family: patch_1_19 (Etc sidequests). SQL: level 18, no prereq.
- Availability: commented out, `Implemented - dialogue/delivery/interaction`.
- Materia-introduction chain (1 of 4 with 110812/110813/110814).
- Principals: Aistan 1001726 (spawn VERIFIED: `aistan` @ zone 175,
  `-98.88, 192.2, 1.08`); Mutamix 1001727, the materia NPC (spawn VERIFIED:
  `mutamix_bubblypots` @ zone 170, `243.988, 248.55, -1030.14`).
- Objective: single SEQ_000 — deliver fossil-fused dark matter to Mutamix.
- Item: `ITEM_FOSSIL_FUSED_DARK_MATTER` 11000210, granted in `onStart` AND
  re-granted on accept/Aistan SEQ_000 re-talk, all HasItem-guarded; removed
  from Mutamix turn-in if present. Item row VERIFIED present.

## Sequence flow (from `Data/scripts/quests/etc/etc101.lua`, VERIFIED)

- `SEQ_ACCEPT`: Aistan `QGRAPHIC_IMPORTANT` (graphic 4, not QFLAG_TALK).
  `seq == SEQ_ACCEPT` gate → `processEventAistanStart`; 1 AND
  `player:AcceptQuest(quest)` (bool return, VERIFIED `Player.cs:5993`) →
  re-grant item + `UpdateENPCs` → `EndEvent`.
- `SEQ_000`: Aistan re-talk → re-grant (recovery if dropped) +
  `processEvent_000`. Mutamix → `processEvent_005` + guarded `RemoveItem` +
  manual `AddGil(1000)` + manual `AddItem(8081120)` + `sqrwa(780, ...)` +
  25228 obtain message + single `CompleteQuest` + manual `AddExp(780)`.
- Journal: HasItem bit. Markers: `MRKR_MUTAMIX` unconditionally.
- Fallback dialogues `showAistanFallbackDialogue` /
  `showMutamixFallbackDialogue` reference static actor `DftWil` scenes
  (`defaultTalkWithAistan_001`, `defaultTalkWithMateria_001`) — defined but
  NEVER CALLED from any handler (dead code, VERIFIED by callsite search).
  Left in place; recorded.

## Rewards — MANUAL-ONLY (no SQL rows; VERIFIED absence)

- `gamedata_quest_rewards.sql` has ZERO rows for 110811 — VERIFIED.
- The Lua manual grants (1000 gil + item 8081120 + 780 exp) are therefore the
  SOLE reward path, not a duplicate. `sqrwa(780)` is display-only (it does
  not grant; grants come from `CompleteQuest` SQL auto-grant, which finds no
  rows here). Consistent — no change.
- Leather leggings 8081120 VERIFIED present in item data.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; `seq == SEQ_ACCEPT` gate;
  single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths; item
  grant/removal idempotent. Turn-in without the item still completes (pays
  rewards regardless) — but Aistan re-grants on demand, so the item is always
  recoverable; recorded as reviewed leniency, not a bug.
- No chocobo involvement anywhere in this quest family (sweep VERIFIED:
  no chocobo references in any of the 34 scripts).
