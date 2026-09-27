# Court in the Sands — Man0u1 (110010, Lv 1)

- Prereq: 110009 (SQL + header). Next: Man1u0. Availability: "Partially
  implemented" (`110010 ... Man0u1`, "instance + escort") — still accurate:
  escort + fight exist; polish gaps below.
- Hardening (this pass, behavior-preserving): removed two dead
  `elseif (emoteTestStep == ...)` branches in SEQ_057 onTalk that referenced an
  out-of-scope nil variable (always false; MADDENED_MINER path unchanged).

## Sequence flow (verified from Lua)

| Seq | Beat |
|-----|------|
| 0 | Quicksand private; Momodi → SEQ_005 + Black Brush attune step. |
| 5→10→12 | Black Brush widget/attune → Momodi → SEQ_012 → Coliseum Pass msg 11000126 → SEQ_015. |
| 15 | GSM (Elelotte, counter 0) + GLD halves (GLD trigger/Coliseum/post triggers, counter 1 → 0..3). Coliseum fight at GLD==1 (below); GLD2 followup → SEQ_045 (or SEQ_040 reminder). |
| 45→50 | Linette → miners-guild private → SEQ_050; F'lhaminn 6-emote lesson (counter 2) → SEQ_057. |
| 57→58 | Manic+Maddened miner emotes (flags 0/1) → scene → SEQ_058; F'lhaminn → SEQ_060 + public warp. |
| 60 | Nald Gate escort trigger → escort content (below). |
| 65 | Escort duty (director). SEQ70 trigger → SEQ_070 (Black Brush aftermath). |
| 70→75→80 | Ascilia → SEQ_080 + zone 170 warp; miners trigger → SEQ_085 (Momodi LS). |
| 85→90→95 | Nogeloix → SEQ_095 (alchemist doors) → SEQ_100 (sickroom rounds) → SEQ_105 (second trigger) → SEQ_110. |
| 110 | Momodi `processEventComplete` + `sqrwa` + CompleteQuest + 6000 gil + 200 exp. |

## Fight: Coliseum (verified, documented BNPC, full fight)

- Spawn (verified code): `SpawnEnemyWithMobType(TOURNEY_GLADIATOR=2280157,
  BNPC=1362, "man0u1_tourney_gladiator", -178.251, 174.891, 160.092, -1.596)`.
- Profile (verified main SQL `server_battlenpc_mob_types.sql:642`):
  `(1362, 2280157, 'tourney_gladiator', ...)` — main-SQL parity, no migration needed.
- Director (verified exists): `Quest/QuestDirectorMan0u101`; `onKillBNpc`
  victory path; stale-flag recovery via `clearStaleCourtFightFlag`; -50 damage
  mods for the scripted bout (verified code, authored balance).
- Post-fight: `processEvent035` → private copy; GLD=3 → SEQ_045.
- Navmesh verdict: zone 175 Coliseum interior — nearest recorded 120 yalms away
  (node 24). **Authored/inferred heights, NOT recorded ground.** No invented Y.

## Escort (verified)

- Content `man0u102`/`SimpleContentMan0u102`, director `Quest/QuestDirectorMan0u102`
  (verified exists), zone 170 entry (-31.239, 183.087, -74.303) rot 2.875;
  completion trigger → Black Brush SEQ_070.
- Prior work: `docs/court_in_the_sands_escort_cutscenes_decomp_2026-08-13.md`,
  `docs/man0u1_court_{fight_probe,focused,runtime_probe}_decomp_2026-06-30.md`,
  `docs/man0u1_post_kill_cutscene_decomp_2026-06-25.md` (referenced, not duplicated).

## Delegate events (verified sample)

`processEventMomodiStart/010/013/015/017/020/025/030/032/035/040/045/050/051/055/060/070/075/080/090/200/205/207/210/220/230`,
`processEvent1000_1/1000_3/1000_5`, `processEventTu_001`. Emote-failure
branches use `x == a or b or ...` (always-true elseif = else); behaviorally
correct-as-failure-path, left untouched — recorded here as known wart.

## ENPC IDs (verified, partial)

Momodi 1000841, Thancred 1000948, Linette 1000861, F'lhaminn 1000038/1000842,
miners 1000690/1001283–1001290, Ascilia 1000042, Nogeloix 1000597, sickroom cast
1000689/1000699/1001207/1001210, triggers listed in SEQ table above.

## Markers (verified): 11001001–11001021.

## Counters/flags: counters 0 (GSM), 1 (GLD), 2 (emote); flags 0/1 miners,
2 fight-active, 3 post-coliseum.

## Journal hooks: none custom (marker list only) — LS packs drive progression.

## Rewards (verified, staged, single CompleteQuest): 2000 (GLD) + 3000 (escort
leg) + 6000 + 200 exp. No SQL auto-grant.

## Instance / scene surface

- NEEDED: Quicksand/miners/LNC/alchemist echo copies, Coliseum pit,
  Central Thanalan escort corridor, Black Brush aftermath.
- EXISTING (verified): all three directors + content scripts + probe/test helpers
  (`startCourtFightProbe`, escort test, `courtRun*` followups).

## Open gaps (reasons)

- "Partially implemented" retained: escort enemy roster/Editors director-side
  without cited retail pull log; second escort leg (SEQ_070/071 re-entry) kept
  as recovery-tolerant but unreviewed vs retail; emote-failure wart above.
