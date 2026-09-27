# MNK 111226 Mnk0j6 — Return of the King...of Ruin (Lv50) — deep decomp

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j6_return_of_the_king_decomp_2026-09-27.md`

Status: Implemented; this pass adds the missing 4th add (bowman) + full
edge-case audit. No invented phases (retail phase callbacks unrecovered; client
director `QuestDirectorMnk0j601` is an EMPTY QuestDirectorBaseClass shell —
not SimpleQuestBattle; timeout 900s is the fail pressure).

## Stages / sequences
- 0: Erik offer `processEventERIKStart` (offer pc117/0x8FB; accept 59 / decline
  58,93). Hint/follow variants are contextual, not objectives.
- 5 battle: preEvent `processEvent005(true)` → `mnk0j610` (boolean true selects
  Default fade; any other value AfterWarp — numeric 1 NOT equivalent) →
  kill Widargelt the Watcher 2289039/3115 + FOUR Ala Mhigan adds:
  pikeman 2289040/3036, axeman 2289041/3032, **bowman 2289042/32751 (NEW)**,
  shaman 2289043/3037 (scene shells 1001978–81 corroborate all four roles;
  external walkthrough reconstructions agree on 4 adds).
- 9 aftermath: `processEvent015` → `mnk0j620` (unconditional AfterWarp) via
  real same-content reload; victory persisted BEFORE the movie.
- 10 reward at private Widargelt: `processEvent020(8032702)` (Widargelt's
  speech + 5th piece; belongs to Widargelt, NOT Erik) + `processEventClear`
  (long 115 + Form Shift 27106).
- Journal: Wil 555 (Silvertear; RECOMMENDED up to 7 companions, 8 total) /
  556 (subdue Widargelt) / 557 (comfort Widargelt). Selector map exists.

## NPCs / mobs / positions
- Erik 1060033 ✓. Markers 11221501/02: zone 190 Mor Dhona (-138.76,345.19);
  0 recorded nodes (nearest Y 15–17, ~60u; scene Widargelt Y≈18.1–18.6) —
  private adapter spawns at caller position; public Silvertear owner unresolved.
- Bowman actor 2289042/display 3280324 ✓ actor row; mob row 32751 NEW
  (job 7 ARC, list 15, mirrors pikeman/axeman rows).

## Rewards / edge cases
- Rewards: Temple Cyclas 8032702 ✓ + Form Shift 27106 ✓ (no authoritative EXP).
- Guards (present + verified): requireAllTargets(5) exact uniqueIds; aftermath
  NPC ownership (area+uniqueId+landing checks); Erik recovery reopens
  scene/reward WITHOUT replaying combat or completed movie; disconnect/death/
  timeout → sequences 9/10 persist, recovery via Erik; abandon → bound checks;
  party cap 8; mounts engine-handled; no sync (retail fixed). Cutscene skip:
  entry scene skippable (launch already staged); aftermath AfterWarp reload
  re-lands safely; reward independent of playback.

## Amendment 2026-09-27 (MNK-B pass)

Superseding package: `quests/111226-mnk0j6-return-of-the-king-of-ruin/`
(data.json + decomp.md + quest.md). Corrections: (1) the Lv50 reward is
Hundred Fists 27106 (1.0 quest page + official forum), NOT Form Shift
(ARR anachronism); (2) retail levels are boss 55 / adds 53, shaman CNJ 23
(Jan-2013 Gamerescape archive, local nm-pages) — mob_types rows aligned
this pass (the loot-file staging already carried these values and wins at
load); bowman 32762 likewise Lv53 (archive: Bowman 53/Archer).
