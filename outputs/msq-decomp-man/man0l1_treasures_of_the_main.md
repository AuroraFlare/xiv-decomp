# Treasures of the Main — Man0l1 (110002, Lv 1)

- Prereq: 110001 (SQL + header). Next: Man1l0 (110003 requires 110002).
- Availability: enabled (`110002 ... Man0l1`, "instance + escort").
- Hardening note (this pass): none required; SEQ_000 entry has no SEQ_ACCEPT
  (auto-started chain from ReplaceQuest). LS-retry + counter-repair helpers
  present and behavior-preserving.

## Sequence flow (verified from Lua)

| Seq | Beat |
|-----|------|
| 0 | Drowning Wench echo; Baderon talk → LS msg → SEQ_003 + public warp. |
| 3 | Attune Camp Bearded Rock (aetheryte widget; journal flag via guildleve 10801 check). |
| 5→6 | Baderon talks; recommendation item msg 11000125; → SEQ_007. |
| 7 | CUL (Charlys, counter 1) + MSK halves (Isandorel/MSK trigger/echo exit, counter 2 → 0..4). Both done → LS msg. |
| 35→40 | FSH guild; Sisipu 6-emote lesson (counter 3: bow/clap/congratulate/poke/joy/wave); final wave → SEQ_048. |
| 48 | Zephyr Gate; `contentsJoinAskInBasaClass` → escort content. |
| 50 | Escort duty (director). Lighthouse trigger → corpse private area → SEQ_055. |
| 55→60→65 | Corpses; Windworn corpse → SEQ_060; Sisipu → SEQ_065 + zone 230 warp. |
| 65→70→75 | FSH trigger → 3000 gil + LS → SEQ_070; Baderon `processEvent625_2` → SEQ_075 (forge). |
| 75→80→85 | Bodenolf → forge copy → SEQ_080; H'naanza → SEQ_085; echo exit → LS → SEQ_090. |
| 90→92 | Baderon → `processEventComplete` + `sqrwa` + CompleteQuest + 6000 gil + 200 exp. |

## Delegate / cutscene events (verified sample)

`processEvent010/020/026/027/030/035/040/050/060/065`, `processEvent600–635`
family, `processEvent1000_4/1000_6`, `processEvent601_1..8/602`, `processEvent604`
(entry), `processEvent605/610/615/620/625_2/630/632/635`, `processEventComplete`,
`sqrwa`, `contentsJoinAskInBasaClass`. Entry/exit fades are after-warp owned
(comments verified in code).

## ENPC/BNPC IDs (verified)

Baderon 1000137, Y'shtola 1000001, guild cast 1000075–1000871, Nanaka 1000276,
Carrilaut 1000062, Brictt 1000051, Aentfoet 1000064, triggers
1090001/1090003/1090004/1090006/1090007/1090176/1090372. No BNPC kills in script;
escort enemies owned by `Quest/QuestDirectorMan0l101` (verified to exist).

## Markers (verified): 11000101–11000119 + quest-complete 11000118.

## Counters/flags: counters 1 (CUL), 2 (MSK), 3 (FSH emote), 4 (LS pack).
Counter-0 repair helper for pre-2026-09-26 off-by-one saves (verified code).

## Journal hooks: `getJournalInformation` returns tutorial-leve flag (live
HasGuildleve(10801) check) + CUL/MSK x5; full marker list incl. private/public splits.

## Rewards (verified, staged, single CompleteQuest): 1000 gil (CUL) + 3000 gil
(FSH) + 6000 gil + 200 exp at completion. No SQL auto-grant table exists for
these (gamedata_quests holds only prereqs) — no double-grant.

## Mob profiles + spawn evidence

- No quest-script kills. Escort ambush roster lives in the director; not
  re-documented here. Navmesh: escort zone 128 private; public recording
  coverage not asserted — spawn evidence stays director-side (inferred).

## Instance / scene surface

- NEEDED: 4 private echo copies (guild/MSK/FSH/forge), escort battlefield,
  corpse scene (zone 128 past type 2 at 137.44, 60.33, 1322.0 — verified coords).
- EXISTING (verified): directors `QuestDirectorMan0l101` (+`Man0l001` tutorial),
  content scripts `man0l101`, test/finish helpers in-script. GM route-test +
  completion-cutscene test entry points exist.

## Prior decomp references

- `docs/man0l1_treasures_of_the_main_decomp_2026-07-04.md`
- `docs/level_8_city_main_quests_decomp_2026-07-07.md` (chain context)

## Open gaps

- Escort enemy composition/counts are director-side; no retail pull log cited.
- Tutorial guildleve 10801 grant path is journal-checked, grant site not in script.
