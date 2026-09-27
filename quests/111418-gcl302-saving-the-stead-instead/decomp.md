# 111418 Saving the Stead Instead (Gcl302) — in-depth breakdown

Maelstrom sidequest, rank 25. Offer: Hasthwab (1001064) aboard the Astalicia, zone 230
(-778.32, 16.35, 383.49, rot 2.17; spawn id 382). Server gates: Maelstrom company 1,
level 25+, SQL prereq 111417 The Cove (server chain; see quest.md for the wiki ordering note).

ORIGINAL WORK ONLY: no client binaries were decompiled, disassembled, or copied for this
pass. Positions come from public SQL/DAT rows plus the repo coordinate guide; the walkthrough
comes from public wikis and the official 1.19 patch notes; the dialogue corpus is the
checked-in `gcl302.csv` DAT text dump.

## Objectives and phases

| Seq | Objective (journal) | Mechanic |
|---|---|---|
| ACCEPT | Hasthwab offer on the Astalicia | `processEventStart(companyFlag)`: csv rows 2–8 pitch; deny (row 9) holds unaccepted; accept (row 10) + `processEventStartAfter` briefing (row 11) → 0 |
| 0 | Travel NE of Camp Bloodshore, rendezvous with the Bloody Executioners, slay every kobold in the caves (journal 268, marker 11183101) | Public trigger 1099542 push (≤14 yalms XZ, ≤2.5 Y) launches `gc_sqb_gcl302_<ownerId>`; four pirate talks optional; inside, journal 269 |
| 0→10 | Kill all four kobold attackers in the private instance | `requireAllTargets`; director kill callback on exact actor 2206603; success → 10, any failure → 0 |
| 10 | Return to Hasthwab, collect reward (journal 270, marker 11183104) | `processEventClear` (csv rows 18–21); seals checkpoint before scene, EXP checkpoint on completion |

No items are granted, carried, or consumed on this route (no `acceptItems`, `evidence`, or
`cleanupItems` in its `gc_sidequest.lua` block — the only one of the six sidequests with
neither). Progress is purely sequence + kill credit.

## Mob and NPC spawns with guide coordinates

Zone 130 transform (page 300): `world = native/1 − (2528,3008)`; continuous map `(world+base)/100`.
Zone 230 transform (page 900, Lower Decks): scale 2, base (1216,320).

- Hasthwab 1001064: `!pos 230 -778.320 16.350 383.490` → map (4.38,7.03) = cell (4,7) ✓ patch notes.
- Entry trigger 1099542: `!pos 130 1578.200 26.221 -1169.000` → map (41.06,18.39) = cell (41,18);
  exactly recorded node 4180 (distance 0.0, direct-user-standing capture 2026-09-19).
- Pirate party (private only, exact recorded floor): Fyrilskyf `!pos 130 1569.317 26.860 -1129.741`
  (n4191), Albin `!pos 130 1569.695 26.630 -1126.624` (n4246), T'Gizzoh
  `!pos 130 1569.391 26.676 -1131.639` (n4247), Denston `!pos 130 1568.903 26.425 -1125.562`
  (n4192); all cell (40,18), marker 11183102 (1570,-1129).
- Cave-mouth marker 11183103 (1532,-1120), cell (40,18); nearest floor
  `!pos 130 1531.060 19.351 -1118.316` (n4201). Context only — not an objective.
- Kobolds ×4 (private, authored compact pack around entry): k1
  `!pos 130 1572.200 26.886 -1162.000` (n4184, d 1.00), k2 `!pos 130 1576.200 26.886 -1159.000`
  (n4184, d 4.87), k3 `!pos 130 1580.200 26.628 -1159.000` (n4183, d 7.88), k4
  `!pos 130 1584.200 26.399 -1162.000` (n4182, d 8.80).

## Triggers

- Offer/accept: talk to Hasthwab (SEQ_ACCEPT). Reminder: talk to Hasthwab at SEQ 0.
- Battle entry: push trigger 1099542 at SEQ 0, same area zone 130, within 14 yalms XZ / 2.5 Y
  of (1578.2,-1169.0). `StartGrandCompanySquadBattle` validates leader → party → source movie →
  post-movie revalidation → publishes roster + content area + director.
- Objective: four exact owned kills (uniqueIds `gcl302_kobold_1..4`). No pickups, no devices.
- Completion: talk to Hasthwab at SEQ 10.

## Dialogue flow (gcl302.csv rows, EN)

1. Opener branches on company: row 2 (Maelstrom member) vs row 28 (outsider variant).
2. Pitch rows 3–8: Executioners idle under Merlwyb's leash → Red Rooster Stead raids →
   kobold muster in the Bloodshore caves → the two-quails plan → the player as official cover.
3. Deny row 9 ("Ye bloody fool!…") = stay unaccepted, retryable. Accept row 10 → SEQ 0.
4. Briefing row 11 (`processEventStartAfter`): mates en route, ordered to await you; tarry and
   they may gut you. Same method replays as the SEQ 0 reminder.
5. Pirate intros (SEQ 0 optionals, any order): Fyrilskyf row 12 (flowery escort welcome),
   Albin row 13 (100-gil bet you get eaten first), T'Gizzoh row 14 (tells Albin to shut it),
   Denston row 15 (unhinged taunt into the cave).
6. Victory pirate thanks rows 16–17: Albin's grudging respect + named farewell using the
   player-name split — UNBOUND (no retail scene binding recovered; template advances to 10).
7. Reward rows 18–21 (`processEventClear`): mates' report → Executioner/Maelstrom relations →
   "Take this, Storm Pup… bugger off, afore I start 'avin' second thoughts!"
8. Rows 25–27: mutiny/motive alternates (respite bloodshed, Barracuda arrests, the combined-plan
   realization) — context for the pitch, no separate events wired.

## Full fight tuning

- Roster: 4 × mob 40305 `gc_side_kobold_attacker`, actor 2206603 (GnoleStandard path),
  Lv 25/25, speed 6, hostile, detectRange 10, job 3, att 40, skillList 5037, no spells, no loot.
- Kit (list 5037, eLeMeN Kobold): Titan's Soul / Titan's Anger / Titan's Boon (×2 rows) /
  Firedamp / Titan's Heart. No scripted phases, AoE markers, or telegraphs.
- Structure: single wave, kill-all (`requireAllTargets=true`); all four pre-placed before the
  movie so allocation failure is retryable from the public trigger.
- Arena: boundary circle r45 at entry; `DisableReentry`; 1800 s deadline
  (`state.deadline = startedAt + timeoutSeconds`, `gc_sqb_runtime.lua:417,482`).
- Party: max 3 (owner + 2), min level 25, combat class/job, alive, unmounted, no open event,
  within 30-yalm party radius. No level sync (1.0 retail had none); overlevel allowed.
- Pirates are non-combat flavor: `talkDefault` only, no AI, no death handling, no gating.

## Chocobo disabled

Five `isMounted` gates in `gc_sqb_quest.lua`: `CanStart` (≈line 51), leader collection
(170–171, "Dismount your chocobo before entering the private encounter."), member collection
(207–208, "Every party member must dismount before entering."), pre-launch (232–234), and
post-movie roster revalidation (343). No summon/companion spawns exist in this battle config,
and the private area offers no stable surface for mounting mid-fight.

## Wipes, resets, edge cases

- Any failure — owner/party wipe, 1800 s timeout, disconnect, area exit, entry/spawn failure,
  or quest-changed (abandon/re-accept/replace-session) — tears down the content area, returns
  the party to the public return point, and leaves the quest at SEQ 0 for an immediate retry.
- Relog rebinds by owner character id only; a helper is never adopted as owner.
- Entry/exit transitions are ticketed (`WorldManager.QuestBattle.cs`): source recovery or
  clean disconnect, never a stranded half-published roster.

## No-loophole checklist

- [x] Kill credit requires the exact actor class allocated to this wave in this area; ambient
  same-class kills elsewhere cannot advance (runtime reconciliation).
- [x] Duplicate/fanned-out death callbacks collapse to one credit per uniqueId.
- [x] Stale quest data, replaced sessions, and changed areas fail closed at every yield.
- [x] Only the party leader's quest can start the battle; helpers earn no reward or progress.
- [x] Trigger push requires SEQ 0 + same area + zone 130 + 14-yalm/2.5-Y proximity.
- [x] Post-movie revalidation re-checks session, area, combat class, mount, death, level,
  open events, and party radius before anything publishes.
- [x] Seals + EXP are independent one-time checkpoints; interrupted completion is idempotent.
- [x] No evidence/item path exists to dupe, and the reward requires the live SEQ 10 report.
- [x] Overlevel is allowed by design (no sync), matching 1.0 retail — not a loophole.
- [x] Offer stays disabled in `quest_availability.lua` until live-client acceptance.
