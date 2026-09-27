# 111222 Insulted Intelligence (Mnk0j2) — in-depth decomp

Monk rank 35. Offer: Erik (1060033), Ul'dah zone 175 (-32.453, 192.1,
45.343; spawn id 2466). Requires MNK 35 + prior 111221 (server gates).

Full doc: `docs/mnk0j2_insulted_intelligence_decomp_2026-09-27.md`.

## Sequence / flags (server: job_quest_template.lua Mnk0j2 + item objectives)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Erik offer | `processEventERIKStart` (offer pc149/0x527; accept 35,45 / decline 16). Grants Brand-new Aetheriometer 11000552 |
| 0→5 | Travel south of Cedarwood, lower La Noscea | Battle entry → private Gluttonous Gertrude |
| 5 | Slay Gluttonous Gertrude | Director `QuestDirectorJobMnk0j2`: exact uniqueId kill → successSequence 6 (NOT 10 — kill alone must not complete) |
| 6 | Use the Brand-new Aetheriometer | `TryUseJobQuestItemObjective` consumes exact slot → seq 10 |
| 10 | Return to Erik | `onJobQuestCompleteFirst` (51124+11000552) → `Second` (ability 27107) → `Third` (linkshell 1000101 event 92) |

Journal: Wil 541 (kill THEN use aetheriometer — order explicit;
RECOMMENDED 3 companions) / 542 next notice. Selector map present.

## Dialogue / cutscenes

No cutscene in this quest (no skip surface). Erik's brief: measure the
aether of the pirate battlefield between Keltlach and One-eyed Wylfred;
Gertrude threatens the research. Completion widgets only.

## Objectives / markers

11221101: region 101/map 101, X/Z (651.90,235.09), south of Cedarwood,
lower La Noscea (zone 128). Map-grid (31.80,32.43). No recorded navmesh
at the marker (private content spawn is leader-relative, so none is
needed). Source-backed placement evidence; public trigger owner
unresolved → private adapter retained.

## Instance / territory

- Fight: SimpleContentQuestBattle content copy
  `quest_sqb_mnk0j2_<pid>`, boundary radius 45, spawn = leader pos + 4
  yalms facing. Re-entry disabled. Max party 4, timeout 900 s.

## Fight: Gluttonous Gertrude (single NM)

- Actor class 2102010 (DodoNormalNM) / public mob type 3043, uniqueId
  `mnk0j2_gluttonous_gertrude`. Exact recovered profile: mob row 3043
  (lv 42), skill list 6014 (Regurgitate 23013, Rancid Belch 23014).
- Single wave, single kill credits (exact spawned uniqueId + dead + same
  area). Stale/foreign same-class kills ignored. Ambient
  `gluttonous_gertrude` spawn refs exist as evidence-only
  (private uniqueId blocks ambient-kill credit).
- Enmity/leash: standard content AI + 45-yalm boundary circle.
- Walkthrough consensus: single over-stuffed dodo NM, no phases or adds;
  use the aetheriometer only after the kill.

## Triggers / edge handling

Kill credit requires exact spawned uniqueId + dead + same area.
Item use requires sequence 6 + exact slot + quest bound; double-packet
safe (slot removal checked); early use silently rejected (retail shows
nothing until the kill). Wipe/timeout/disconnect/death → retrySequence 0
at Erik. Abandon → bound-quest check. Party cap 4 enforced at collect +
pre-publish recheck. No chocobo: engine zone-entry dismount +
SetMountState refusal in private areas + 3-layer mount gate. No level
sync in 1.x retail for job quests: fixed-level fight + eligibility gates
(PGL/MNK + LNC15 + lv35) are the faithful control. No lockout beyond the
900 s attempt timer.

## Rewards

Exp 3360 + action 27107, all central. IDs verified in gamedata.

## Sources

Recovered client `Mnk0j2` + `QuestDirectorJobMnk0j2`, DAT marker,
server_eventnpc/mob/skill SQL rows above, 1.0 journal archive (Fandom
Monk Quests 1.0: south of Cedarwood; kill then measure). Runtime tests:
generic acceptance/journal/recovery groups PASS (no Mnk0j2-specific
group needed; behavior identical to the covered adapter shape).
