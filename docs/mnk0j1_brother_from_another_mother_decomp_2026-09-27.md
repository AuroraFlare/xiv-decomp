# MNK 111221 Mnk0j1 — Brother from Another Mother (Lv30) — deep decomp

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j1_brother_from_another_mother_decomp_2026-09-27.md`

## Stages / sequences (server adapter)
- 0 route: Gagaruna offer `processEventGAGARUNAStart` (boolean arg4 OR arg5 selects
  text 42 vs 6; offer once at pc69/0x3D8; accept 8 / decline 7,37) → Erik route
  step `processEvent005` (Mythril Pit T-8 handoff, texts 10-19,47-52,60).
- 5 battle: exactly three Runagate Imps, actor 2202611, level 35 (walkthrough
  archive; client director `QuestDirectorMnk0j101` is an empty SimpleQuestBattle
  shell — no count/wave/spawn callback recovered).
- Auto-complete (content owner, no reward NPC): `processEvent010` plays `mnk0j110`
  (Default fades) → `processEvent010_2_system` (world 35 + item widget arg4) →
  `processEvent010_3_system` (long 59 + ability 27108 Shoulder Tackle).
- Journal: Wil 537 (Gagaruna→Erik) / 538 (kill imps; RECOMMENDED 3 companions,
  4 total) / 539 next-quest notice. Adapter selector map exists.

## NPCs / mobs / positions
- Gagaruna 1000862 @ zone 175 (-184.94,190.55,108.87) ✓ spawn row 61.
- Erik 1060033 @ zone 175 (-32.45,192.10,45.34) ✓ spawn row 2466.
- Fight marker 11221002: region 104/map 402, X/Z (1283.36,-155.49), display ???.
  Zone is **171 Eastern Thanalan** (template's `zoneId 144` contradicts its own
  region 104 + "south of Camp Drybone"; 144 = Coerthas E. Highlands). Recorded
  ground: 22 nodes in r30, Y≈256.2–256.7 (zone_171.tsv nodes 489-492,686);
  nearest `!pos 171 1273.894 256.247 -166.275`. Scene PC setup
  (1281.23,256.668,-170.937) corroborates. 1 ambient nightblade in selection.
- Runagate Imp actor 2202611 = ImpLesserStandard/display 3202612 ✓ actor row;
  **no mob profile row** → new private row 32735 (lv35, imp-family list 5034 as
  explicitly-labeled adapter policy; retail list unrecovered).

## Instance / triggers / cutscenes / rewards
- Instance: private quest-battle content (no static instance ID; area
  `quest_sqb_mnk0j1_<ownerId>`), maxPartySize 4, timeout 900s, boundary r45,
  DisableReentry. Mounts impossible inside (engine: private area =
  mount-restricted + auto-dismount on entry).
- Trigger gap (documented, Blm0j3-precedent accepted): retail triggers at the
  Mythril Pit destination; adapter launches from Erik's route talk. Marker kept
  for journal fidelity.
- Cutscene `mnk0j110`: PC + Mack/Widargelt 1060032 + Emet/Erik 1060033 + imp
  shell 1001960 (scene-only; combat actor is 2202611). Plays automatically on
  victory; skippable per NQ default; retry-safe (completion persisted by
  `CompleteJobQuestFromContent` guards: exact quest/sequence/area/name).
- Rewards: exp 2661; key item 2000202 (Soul of the Monk) ✓; item 3020410 ✓;
  action 27108 ✓. All IDs verified in gamedata.

## Edge cases → guards
wipe/timeout/disconnect/death/area-exit/quest-changed → gc_sqb_runtime finish()
→ retrySequence 0 at Erik (native lease guards orphan shells); abandon/reaccept →
bound-quest check fails → no credit; party/solo → leader-only start, cap 4,
entrant validation (online/same-area/combat-class/alive/level); cutscene skip →
NQ default path, completion independent of playback; OOB → boundary circle +
re-entry disabled; retrigger → exact uniqueId kill credits, requireAllTargets.
