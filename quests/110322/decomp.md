# 110322 The Sound of Silence (Bsm306) — decomp

- Class quest, Blacksmith (30) / Armorer (31), level 36. Type: Non-Combat.
- Prerequisite: 110321. Offer: Bodenolf 1000144 (linkpearl call DAT row 1).

## Sources (all inspected)

- DAT `docs/Dat Mining/bsm306.csv` (135 text rows) — full flow: Bodenolf
  call/brief (1-9) → Mimidoa task (11-13: navigate for him; take
  Sound-proofing Rubber 11000052 / Admiral Alloy 11000053 + mold/casing
  recipe, "I'll do th' rest") → component turn-in (16) → Mimidoa forges
  Brass Earplugs 11000080 from the component (19) → sail to Hope's
  Bourn (87: "Hope's Bourn! Also known as Hope's Edge an' Hope's End";
  DE Hoffenholm) → equip plugs (20) → free 8 lured souls (88) → plugs
  block speech (94), victim lines (95-108: pain/spectacles/coinpurse/
  hunger) → clue pickups one-at-a-time (119-125: "You cannot carry this
  item while holding another") → sirens beaten (22-24) → gramophone
  truth (25-34: Ailissie + R'piqoi borrowed it) → report/reward.
- DAT `quest_marker.csv` 11032201-20: 01/02/05 at Mimidoa (guild);
  03/04 replay-collision placeholders; 06 reward at (-490.38, 417.81,
  display ???); 07-20 filler. NO island markers (zone 139 world-only).
- DAT `actorclass.csv` + `xtx_displayName.csv`: R'piqoi 1000187
  (1900039), Ailissie 1000188 (1300016) — the two "sirens". Neither has
  any spawn row. The 8 lured souls are unnamed in DAT (generic
  victims; actors unidentified).
- GamerEscape live page (clue tableau: coconut/newt/glasses; "grab the
  charred red newt and go back to the NPC") — mechanic corroboration.
- YouTube V3 (1.23b cutscenes) — flow only.

## Sequence flow (recovered numbering 0/5/6/10/15/20)

- ACCEPT Bodenolf (`processEventBodenolfStart`) → 0 Mimidoa: GRANTS
  branch source (11000052 BSM / 11000053 ARM, verified grant) + recipe;
  plays `processEvent005` (class recipe branch) → 5. (DAT row 13 IS the
  grant evidence — closes "no documented grant".)
- 5 component: forge branch component (snapshot-diff; traded credits)
  → Mimidoa turn-in, bare advance (no scene maps 5→6) → 6.
- 6 combine: Mimidoa + component → CONSUME component, GRANT earplugs
  11000080 (Mimidoa forges them in-scene, DAT row 19); plays
  `processEvent010` (earplug/island setup) → 10. CORRECTION: no player
  combine recipe exists or is needed — the prior blocker is dissolved.
- 10 equip: EARS-slot-17 gate (`HasItemEquippedInSlot`; ability-script
  precedent) → bare → 15. (DAT rows 20/36/94: plugs must be worn;
  removing them risks the song, rows 109-118.)
- 15 island puzzle: 8 victim flags (0-7); one-clue enforcement (DAT
  rows 119-125 + template `onlyOneClueHeldAtATime`); clues Charred Red
  Newt 11000102 / Bent Glasses 11000103 / Island Coconut 11000104.
  `bsm306_victimTalk` scaffold ready but UNWIRED (no victim/clue
  trigger actors; zone 139 has no map/ground). 8/8 → 20.
- 20 report: Mimidoa 8/8 check → `processEvent040` (final) → branch
  marks 3600 → Complete. EXP 0 (post-1.20 amount UNREPORTED; archive
  A4 carries no EXP row — never inferred).

## NPCs

| NPC | Actor | Display | Zone | Note |
|---|---|---|---|---|
| Bodenolf | 1000144 | 2200064 | 230 public | offer (id 306) |
| Mimidoa | 1000176 | 1400012 | 230 public (NEW id 3382, shared Bsm200) | source grant/component/earplugs/finale |
| R'piqoi ("siren") | 1000187 | 1900039 | 139 Hope's Bourn (unplaced) | NO spawn; island NPC |
| Ailissie ("siren") | 1000188 | 1300016 | 139 Hope's Bourn (unplaced) | NO spawn; island NPC |
| 8 lured souls | UNKNOWN | — | 139 (unplaced) | unnamed in DAT; rows 95-108 lines |

## Objectives / journal / markers

- States 0/5/6/10/15/20; markers 01 (accept) / 02 (component+combine)
  / 05 (equip+puzzle) / 06 (reward). 03/04 + 07-20 never sent.
- Counters: 0 component baseline, 1 locked branch. Flags 0-7 victims.
- Journal: component gain / earplug possession / victims n/8.

## Instance / territory / spawns (guide-used)

- Guild leg: zone 230 public (shared Mimidoa row; grounded node 436).
- Island leg: zone 139 The Cieldalaes — `maps` reports world_only,
  0 recorded nodes, no native binding → NO placement is possible
  without invention. Clue/victim triggers stay unplaced (gap).
- No mounts: zero spawn APIs (validator enforced). Row-90 "row back
  to Limsa" prompt is NPC travel dialogue, not a player mount.

## Mobs / sync / lockouts

- None (Non-Combat; the "sirens" are two girls + a gramophone, rows
  31-34; Mimidoa routs them off-screen, row 22). No sync, no lockout,
  no timeout; one-time.

## Rewards

- Gil 36000 central. Marks 3600 script-side by LOCKED branch (central
  autoGrant=0). EXP 0 (unreported; A4 precedent Wvr306 proves L36
  values deviate — never infer 4720). No tool (era unresolved).

## Gaps (quest stays HOLD-gated; narrowed by this pass)

1. Hope's Bourn island placement (zone 139 world-only, 0 nodes).
2. Victim actors (8 souls unnamed) + clue trigger actors unplaced.
3. Clue↔victim mapping unrecovered (DAT lines suggest: glasses→
   spectacled man row 99; coconut→hungry/thirsty man rows 105-108;
   newt→? — mapping speculation documented, NOT wired).
- CLOSED this pass: source-item grant (DAT row 13); combine model
  (Mimidoa forges in-scene, DAT row 19 — no recipe); R'piqoi/Ailissie
  actor IDs; equip-gate slot precedent; Mimidoa public spawn (Bsm200).
