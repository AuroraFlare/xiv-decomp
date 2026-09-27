# MNK 111222 Mnk0j2 — Insulted Intelligence (Lv35) — deep decomp (verify-only)

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j2_insulted_intelligence_decomp_2026-09-27.md`

Status: already Implemented (private adapter + item objective). This pass verifies
100%: no code change required except the shared mount-guard note (already
engine-enforced) and no new mob row (3043 exact).

## Stages / sequences
- 0: Erik offer `processEventERIKStart` (offer pc149/0x527; accept 35,45 /
  decline 16). Grants Brand-new Aetheriometer 11000552 ✓ item row.
- 5 battle: Gluttonous Gertrude actor 2102010/mob 3043/skill list 6014, private
  uniqueId `mnk0j2_gluttonous_gertrude`, director `QuestDirectorJobMnk0j2`,
  successSequence 6 (NOT 10 — kill alone must not complete).
- 6 instrument: `TryUseJobQuestItemObjective` consumes exact slot → 10.
- 10 reward at Erik: `onJobQuestCompleteFirst` (51124+11000552),
  `Second` (ability 27107), `Third` (linkshell 1000101 event 92).
- Journal: Wil 541 (kill THEN use aetheriometer — order explicit; RECOMMENDED
  3 companions) / 542 next notice. Selector map exists.

## NPCs / mobs / positions
- Erik 1060033 @ zone 175 ✓. Gertrude actor/mob/skill rows ✓; ambient
  `gluttonous_gertrude` spawn refs exist as evidence-only (private uniqueId
  blocks ambient-kill credit).
- Marker 11221101: region 101/map 101, X/Z (651.90,235.09), south of Cedarwood,
  lower La Noscea (zone 128). Source-backed placement evidence; public trigger
  owner unresolved → private adapter retained.

## Instance / triggers / rewards
- Private content `quest_sqb_mnk0j2_<ownerId>`, cap 4, timeout 900s, re-entry
  off, mounts auto-dismounted/refused by engine.
- Rewards: exp 3360; action 27107 ✓.

## Edge cases → guards (all present)
Kill credit requires exact spawned uniqueId + dead + same area; stale/foreign
same-class kills ignored. Item use requires sequence 6 + exact slot + quest
bound; double-packet safe (slot removal checked). Wipe/timeout/disconnect/death
→ retrySequence 0 at Erik. Abandon → bound-quest check. Party cap 4 enforced at
collect + pre-publish recheck. No chocobo: engine zone-entry dismount +
SetMountState refusal in private areas. No level sync in 1.x retail for job
quests: fixed-level fight + eligibility gates (PGL/MNK + LNC15 + lv35) are the
faithful control. Cutscene: none in this quest (no skip surface).
